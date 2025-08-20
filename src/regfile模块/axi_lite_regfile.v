////////////////////////////////////////////////////////////////////////////////
// File:	axi_lite_regfile.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	AXI lite interface regfile.
//
/*
axi_lite_regfile#(
    .ADDR_BITS=32     ( undefined ),
    .DATA_BITS=32     ( undefined ),
    .DATA_BYTES=DATA_BITS/8 ( undefined )
)u_axi_lite_regfile(
    .s_axi_aclk       ( s_axi_aclk       ),
    .s_axi_aresetn    ( s_axi_aresetn    ),
    .s_axi_awaddr     ( s_axi_awaddr     ),
    .s_axi_awvalid    ( s_axi_awvalid    ),
    .s_axi_awready    ( s_axi_awready    ),
    .s_axi_wdata      ( s_axi_wdata      ),
    .s_axi_wstrb      ( s_axi_wstrb      ),
    .s_axi_wvalid     ( s_axi_wvalid     ),
    .s_axi_wready     ( s_axi_wready     ),
    .s_axi_bresp      ( s_axi_bresp      ),
    .s_axi_bvalid     ( s_axi_bvalid     ),
    .s_axi_bready     ( s_axi_bready     ),
    .s_axi_araddr     ( s_axi_araddr     ),
    .s_axi_arvalid    ( s_axi_arvalid    ),
    .s_axi_arready    ( s_axi_arready    ),
    .s_axi_rdata      ( s_axi_rdata      ),
    .s_axi_rresp      ( s_axi_rresp      ),
    .s_axi_rvalid     ( s_axi_rvalid     ),
    .s_axi_rready     ( s_axi_rready     ),
    .RD_NEXT_ADDRESS  ( RD_NEXT_ADDRESS  ),
    .ps_pl_flag0      ( ps_pl_flag0      ),
    .ps_pl_flag1      ( ps_pl_flag1      ),
    .pl_wr_done       ( pl_wr_done       ),
    .end_addr         ( end_addr         )
);
*/
////////////////////////////////////////////////////////////////////////////////

module axi_lite_regfile #(
	parameter ADDR_BITS=32,
	parameter DATA_BITS=32,
	parameter DATA_BYTES=DATA_BITS/8
)(
	input						s_axi_aclk		,
	input						s_axi_aresetn	,

	input	[ADDR_BITS-1:0] 	s_axi_awaddr	,
	input						s_axi_awvalid	,
	output						s_axi_awready	,

	input	[DATA_BITS-1:0] 	s_axi_wdata		,
	input	[DATA_BYTES-1:0] 	s_axi_wstrb		,
	input						s_axi_wvalid	,
	output						s_axi_wready	,

	output	[1:0] 				s_axi_bresp		,
	output						s_axi_bvalid	,
	input						s_axi_bready	,

	input	[ADDR_BITS-1:0] 	s_axi_araddr	,
	input						s_axi_arvalid	,
	output						s_axi_arready	,

	output	[DATA_BITS-1:0] 	s_axi_rdata		,
	output	[1:0] 				s_axi_rresp		,
	output						s_axi_rvalid	,
	input						s_axi_rready	,

	//soft reset
	output 						soft_reset		,	//软件复位

	//PS PL interface
	//write
    input	[31:0]  			C2H_WR_NEXT  	,	//FPGA2PC FPGA下一次要写入的帧的起始地址
	output	[31:0]  			C2H_RD_NEXT  	,	//PC2FPGA 软件下一次要读的帧的起始地址
	
	//read
	input 	[31:0] 				H2C_RD_NEXT		,	//FPGA2PC FPGA下一次要读取的帧的起始地址
	output 	[31:0] 				H2C_WR_NEXT		,	//PC2FPGA 软件下一次要写的帧的起始地址	
	
	output 	[31:0] 				H2C_FRM_SIZE		//PC2FPGA 软件要写的数据帧大小
);

	localparam 	C2H_START 		= 32'h0,			//FPGA2PC FPGA写DDR缓冲区起始地址
				C2H_END			= 32'h1000_0000,	//FPGA2PC FPGA写DDR缓冲区结束地址
				C2H_BUF_SIZE	= 32'd2048,		//FPGA2PC FPGA写DDR缓冲区的每一帧大小  单位：字节  ，但是并不是帧大小
				C2H_FRM_SIZE	= 32'd2048,		//FPGA2PC FPGA写DDR数据的每一帧大小  单位：字节
				H2C_BUF_START	= 32'h1000_0000,	//FPGA2PC FPGA读DDR缓冲区起始地址
				H2C_BUF_END     = 32'h2000_0000,	//FPGA2PC FPGA读DDR缓冲区结束地址
				H2C_BUF_SIZE	= 32'd2048 	   ;	//FPGA2PC FPGA读DDR缓冲区的每一帧大小  单位：字节  ，但是并不是帧大小

	reg	 [31:0] 			rd_din		;
	wire [31:0] 			wr_addr		;
	wire [31:0] 			rd_addr		;
	wire [31:0] 			wr_dout		;
	wire [3:0] 				wr_be		;
	wire   					wr_en		;


////////////////////////////////////////////////////////////////////////////////
//寄存器数据部分

	// read register file
	reg [31:0] reg_ctrl_0;	
	reg [31:0] reg_ctrl_1;
	reg [31:0] reg_ctrl_2;
	reg [31:0] reg_softreset;

	//read message
	assign C2H_RD_NEXT = reg_ctrl_0;
	assign H2C_WR_NEXT = reg_ctrl_1;
	assign H2C_FRM_SIZE = reg_ctrl_2;

	// PS to PL write machine   （读写地址不能覆盖，写进去的数据，在读的地方写一下，要不然会清零）
	always @(posedge s_axi_aclk, negedge s_axi_aresetn) begin
		if(!s_axi_aresetn) 
			begin
				reg_ctrl_0 <= 'b0;
				reg_ctrl_1 <= 'b0;
				reg_ctrl_2 <= 'b0;
			end
		else if(wr_en) 
			begin
				case(wr_addr)  
					// softreset
					32'h10:  begin  
						if(wr_be[0]) reg_softreset[7:0] <= wr_dout[7:0];
						if(wr_be[1]) reg_softreset[15:8] <= wr_dout[15:8];
						if(wr_be[2]) reg_softreset[23:16] <= wr_dout[23:16];
						if(wr_be[3]) reg_softreset[31:24] <= wr_dout[31:24];
					end
					// C2H_RD_NEXT
					32'h4C:  begin  
						if(wr_be[0]) reg_ctrl_0[7:0] <= wr_dout[7:0];
						if(wr_be[1]) reg_ctrl_0[15:8] <= wr_dout[15:8];
						if(wr_be[2]) reg_ctrl_0[23:16] <= wr_dout[23:16];
						if(wr_be[3]) reg_ctrl_0[31:24] <= wr_dout[31:24];
					end
					//H2C_WR_NEXT
					32'h90: begin
						if(wr_be[0]) reg_ctrl_1[7:0] <= wr_dout[7:0];
						if(wr_be[1]) reg_ctrl_1[15:8] <= wr_dout[15:8];
						if(wr_be[2]) reg_ctrl_1[23:16] <= wr_dout[23:16];
						if(wr_be[3]) reg_ctrl_1[31:24] <= wr_dout[31:24];
					end
					//H2C_FRM_SIZE
					32'h94: begin
						if(wr_be[0]) reg_ctrl_2[7:0] <= wr_dout[7:0];
						if(wr_be[1]) reg_ctrl_2[15:8] <= wr_dout[15:8];
						if(wr_be[2]) reg_ctrl_2[23:16] <= wr_dout[23:16];
						if(wr_be[3]) reg_ctrl_2[31:24] <= wr_dout[31:24];
					end
					
					default :	;
				endcase
			end
		else 
			begin
				// self-clean registers 自主清零，比如：软件复位，只需要一个脉冲即可，就需要把这个信号拉高后，FPGA给他清零。
				reg_softreset[0] <= 1'b0; // soft-reset
			end
	end

	// PL to PS read machine
	always @(*)	begin
		case(rd_addr)
			//从PC读的数据 要在幅值一下
			32'h4C: rd_din = reg_ctrl_0;  
			32'h90: rd_din = reg_ctrl_1; 
			32'h94: rd_din = reg_ctrl_2; 
			
			//发送给PC的数据
			32'h40: rd_din = C2H_START;
			32'h44: rd_din = C2H_END;
			32'h48: rd_din = C2H_BUF_SIZE;
			32'h50: rd_din = C2H_WR_NEXT;
			32'h54: rd_din = C2H_FRM_SIZE;
			32'h80: rd_din = H2C_BUF_START;
			32'h84: rd_din = H2C_BUF_END;
			32'h88: rd_din = H2C_BUF_SIZE;
			32'h8c: rd_din = H2C_RD_NEXT;
			
			default: rd_din = 'bx;
		endcase
	end

////////////////////////////////////////////////////////////////////////////////
// AXI stage
//% Write Stage
//% Address acknowledge

	wire					wr_ready = 1;
	wire					rd_ready = 1;

	wire   					rd_en		;
	reg 					awready_r	;
	reg 					wready_r	;
	reg	[1:0] 				bresp_r		;
	reg 					bvalid_r	;
	reg 					arready_r	;
	reg [31:0] 				rdata_r		;
	reg 					rvalid_r	;
	reg [1:0] 				rresp_r		;

	reg [ADDR_BITS-1:0] 	write_addr	;
	reg [31:0] 				write_data	;
	reg 					write_enable;
	reg [3:0] 				write_be	;
	wire 					write_done	;

	reg [ADDR_BITS-1:0] 	read_addr	;
	wire [31:0] 			read_data	;
	reg 					read_enable	;
	wire 					read_done	;
	always @(posedge s_axi_aclk,negedge s_axi_aresetn)
	begin
		if(!s_axi_aresetn) begin
			awready_r <= 1'b1;
		end
		else if(awready_r) begin
			if(s_axi_awvalid) begin
				awready_r <= 1'b0;
			end
		end
		else if(s_axi_bvalid && s_axi_bready) begin
			awready_r <= 1'b1;
		end
	end

	//% Data acknowledge
	always @(posedge s_axi_aclk,negedge s_axi_aresetn)
	begin
		if(!s_axi_aresetn) begin
			wready_r <= 1'b1;
		end
		else if(wready_r) begin
			if(s_axi_wvalid) begin
				wready_r <= 1'b0;
			end
		end
		else if(s_axi_bvalid && s_axi_bready) begin
			wready_r <= 1'b1;
		end
	end

	//% Write response
	always @(posedge s_axi_aclk,negedge s_axi_aresetn)
	begin
		if(!s_axi_aresetn) begin
			bvalid_r <= 1'b0;
			bresp_r <= 2'b0;
		end
		else if(s_axi_bvalid && s_axi_bready) begin
			bvalid_r <= 1'b0;
		end
		else if(write_done) begin
			bvalid_r <= 1'b1;
		end
	end

	//% Data write 
	always @(posedge s_axi_aclk)
	begin
		if(s_axi_awvalid && s_axi_awready) begin
			write_addr <= s_axi_awaddr;
		end
		if(s_axi_wvalid && s_axi_wready) begin
			write_data <= s_axi_wdata;
			write_be <= s_axi_wstrb;
		end
	end

	//% Write strobe
	always @(posedge s_axi_aclk, negedge s_axi_aresetn)
	begin
		if(!s_axi_aresetn) begin
			write_enable <= 1'b0;
		end
		else if((s_axi_awvalid&&s_axi_awready&&s_axi_wvalid&&s_axi_wready) 
			|| (!s_axi_awready&&s_axi_wvalid&&s_axi_wready)
			|| (!s_axi_wready&&s_axi_awvalid&&s_axi_awready)) begin
			write_enable <= 1'b1;
		end
		else if(write_done) begin
			write_enable <= 1'b0;
		end
	end

	//% Read Stage
	//% Read Address Acknowledge
	always @(posedge s_axi_aclk, negedge s_axi_aresetn)
	begin
		if(!s_axi_aresetn) begin
			arready_r <= 1'b1;
		end
		else if(s_axi_arvalid && arready_r) begin
			arready_r <= 1'b0;
		end
		else if(s_axi_rvalid && s_axi_rready) begin
			arready_r <= 1'b1;
		end
	end

	//% Read Data Response
	always @(posedge s_axi_aclk, negedge s_axi_aresetn) 
	begin
		if(!s_axi_aresetn) begin
			rvalid_r <= 1'b0;
			rresp_r <= 2'b0;
			rdata_r <= 'bx;
		end
		else if(read_done) begin
			rdata_r <= read_data;
			rvalid_r <= 1'b1;
		end
		else if(s_axi_rvalid && s_axi_rready) begin
			rvalid_r <= 1'b0;
		end
	end

	//% Read strobe
	always @(posedge s_axi_aclk, negedge s_axi_aresetn) 
	begin
		if(!s_axi_aresetn) begin
			read_enable <= 1'b0;
			read_addr <= 'bx;
		end
		else if(arready_r && s_axi_arvalid) begin
			read_addr <= s_axi_araddr;
			read_enable <= 1'b1;
		end
		else if(read_done) begin
			read_enable <= 1'b0;
		end
	end

	assign s_axi_awready = awready_r;
	assign s_axi_wready = wready_r;
	assign s_axi_bresp = bresp_r;
	assign s_axi_bvalid = bvalid_r;
	assign s_axi_arready = arready_r;
	assign s_axi_rdata = rdata_r;
	assign s_axi_rresp = rresp_r;
	assign s_axi_rvalid = rvalid_r;

	assign wr_addr = write_addr;
	assign wr_dout = write_data;
	assign wr_be = write_be;
	assign wr_en = write_enable;
	assign write_done = write_enable && wr_ready;

	assign rd_addr = read_addr;
	assign rd_en = read_enable;
	assign read_data = rd_din;
	assign read_done = read_enable && rd_ready;
	
endmodule
