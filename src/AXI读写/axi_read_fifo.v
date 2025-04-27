////////////////////////////////////////////////////////////////////////////////
// File:	axi_read.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	AXI Reading Model.
////////////////////////////////////////////////////////////////////////////////

module axi_read #
(
    parameter integer RD_FLIP_BYTE   = 0     ,//0：不翻转  1：翻转    //大小端是否翻转
    parameter integer RD_ADDR_WIDTH	= 32    ,                      //地址位宽
    parameter integer RD_DATA_WIDTH	= 64    ,//32,64,128           //数据位宽
    parameter integer RD_LIN	    = 16     //1-256               //突发长度
)
(
    //读脉冲信号
    input                               i_wr_done       ,
    //读出数据  
    input                               M_RD_aclk       ,
    input                               M_RD_aresetn    ,
    output  wire                        M_RD_tlast      ,
    output  wire                        M_RD_tvalid     ,
    output  wire [RD_DATA_WIDTH-1:0]    M_RD_tdata      ,
    input   wire                        M_RD_tready     , 
    //AXI总线     
    input   wire                        m_axi_aclk      ,
    input   wire                        m_axi_aresetn   ,
    output  wire                        m_axi_arid      ,
    output  wire [RD_ADDR_WIDTH-1 : 0]  m_axi_araddr    ,
    output  wire [7 : 0]                m_axi_arlen     ,
    output  wire [2 : 0]                m_axi_arsize    ,
    output  wire [1 : 0]                m_axi_arburst   ,
    output  wire                        m_axi_arlock    ,
    output  wire [3 : 0]                m_axi_arcache   ,
    output  wire [2 : 0]                m_axi_arprot    ,
    output  wire [3 : 0]                m_axi_arqos     ,
    output  wire                        m_axi_arvalid   ,
    input   wire                        m_axi_arready   ,
    input   wire                        m_axi_rid       ,
    input   wire [RD_DATA_WIDTH-1 : 0]  m_axi_rdata     ,
    input   wire [1 : 0]                m_axi_rresp     ,
    input   wire                        m_axi_rlast     ,
    input   wire                        m_axi_rvalid    ,
    output  wire                        m_axi_rready    
);

    //读地址和数据
    reg     [31:0]              ar_addr     ;
    reg     [7:0]               ar_len      ;
    reg     [2:0]               ar_size     ;
    reg     [1:0]               ar_burst    ;
    reg                         ar_valid    ;
    wire                        ar_ready    ;
    wire    [RD_DATA_WIDTH-1:0] r_data      ;
    wire                        r_resp      ;
    wire                        r_last      ;
    wire                        r_valid     ;
    reg                         r_ready     ;

    //读地址缓存和计数
    reg     [31:0]              rd_addr_buff;
    reg     [31:0]              num_rd_cnt  ;

    //状态机
    reg     [2:0]               c_state     ;
    reg     [2:0]               n_state     ;
    localparam  WAIT_RD     = 0,           
                RD_ADDR     = 1,
                RD_DATA     = 2,
                RD_LAST     = 3,
                RD_STOP     = 4;

    //时钟、数据、突发信息传递
    wire                        i_clk       ;
    wire                        i_rst_n     ;
    wire    [2:0]               arsize      ;
    wire    [7:0]               arlen       ;
    reg                         o_last      ;
    reg                         o_valid     ;
    wire                        i_ready     ;
    reg     [RD_DATA_WIDTH-1:0]    o_data   ;	

    //状态转换 FSM31
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) c_state <= WAIT_RD;  // 异步复位
        else          c_state <= n_state;   // 状态更新
    end

   //状态跳转条件 FSM32
    always @(*) begin : R_FMS2        
        case (c_state)
            WAIT_RD:   n_state = (i_wr_done) ? RD_ADDR : WAIT_RD;  // 检测到写完成则跳转
            RD_ADDR:   n_state = ar_ready ? RD_DATA : RD_ADDR;                      // 地址准备好则跳转
            RD_DATA:   n_state = (num_rd_cnt == ar_len-1 && o_valid && i_ready) ? RD_LAST : RD_DATA;  // 读完最后一笔数据则跳转
            RD_LAST:   n_state = (o_valid && i_ready) ? RD_STOP : RD_LAST;          // 最后一笔传输完成则跳转
            RD_STOP:   n_state = WAIT_RD;                                          // 自动回到等待状态
            default:   n_state = 0;                                                 // 异常情况复位
        endcase
    end

    //状态执行的操作 FSM33
    always @(posedge i_clk or negedge i_rst_n) begin : R_FMS3
        if (~i_rst_n) begin
            {ar_addr, ar_len, ar_burst, ar_size, ar_valid, o_last} <= 0;
            rd_addr_buff <= 0;
        end
        else case (n_state)
            WAIT_RD: ar_valid <= 0;
            
            RD_ADDR: begin
                ar_valid <= 1;
                ar_addr  <= rd_addr_buff;
                ar_len   <= arlen;
                ar_burst <= 2'd1;
                ar_size  <= arsize;
            end
    
            RD_DATA: ar_valid <= 0;
    
            RD_LAST: o_last <= 1;
    
            RD_STOP: begin
                o_last <= 0;
                rd_addr_buff <= (rd_addr_buff >= 32'h10000 - 4096) ? 0 : rd_addr_buff + 4096;
            end
        endcase
    end
 
    // data valid ready 处理    
    always @(*) begin
        r_ready = (c_state == RD_DATA || c_state == RD_LAST) ? i_ready : 0;
        o_data  = (c_state == RD_DATA || c_state == RD_LAST) ? r_data  : 0;
        o_valid = (c_state == RD_DATA || c_state == RD_LAST) ? r_valid : 0;
    end

    //读突发数据计数
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)    num_rd_cnt <= 0;
        else             num_rd_cnt <= o_last ? 0 : (r_valid && i_ready) ? num_rd_cnt + 1 : num_rd_cnt;
    end
	
	//大小端转换
	generate
		if (RD_FLIP_BYTE == 1) begin
			if (RD_DATA_WIDTH == 32) begin
				// 32-bit 字节翻转
				assign M_RD_tdata = {
					o_data[7:0],   o_data[15:8],
					o_data[23:16], o_data[31:24]
				};
			end else if (RD_DATA_WIDTH == 64) begin
				// 64-bit 字节翻转
				assign M_RD_tdata = {
					o_data[7:0],    o_data[15:8],
					o_data[23:16],  o_data[31:24],
					o_data[39:32],  o_data[47:40],
					o_data[55:48],  o_data[63:56]
				};
			end else if (RD_DATA_WIDTH == 128) begin
				// 128-bit 字节翻转
				assign M_RD_tdata = {
					o_data[7:0],     o_data[15:8], 
					o_data[23:16],   o_data[31:24],
					o_data[39:32],   o_data[47:40],
					o_data[55:48],   o_data[63:56],
					o_data[71:64],   o_data[79:72],
					o_data[87:80],   o_data[95:88],
					o_data[103:96],  o_data[111:104],
					o_data[119:112], o_data[127:120]
				};
			end
		end else begin
			assign M_RD_tdata = o_data;  // 不翻转
		end
	endgenerate

    //----------------------------------------------------------
    // 位宽计算函数
    // 使用方法
    // localparam RD_DATA_WIDTH = clogb2(depth); //数据位宽
    //----------------------------------------------------------

    function integer clogb2 (input integer depth);
    begin
        for(clogb2=0; depth>0; clogb2=clogb2+1) 
            depth = depth >> 1;
    end
    endfunction

    assign m_axi_araddr     = ar_addr       ;
    assign m_axi_arlen      = ar_len        ;
    assign m_axi_arsize     = ar_size       ;
    assign m_axi_arburst    = ar_burst      ;
    assign m_axi_arvalid    = ar_valid      ;
    assign ar_ready         = m_axi_arready ;
    
    assign r_data           = m_axi_rdata   ;
    assign r_last           = m_axi_rlast   ;
    assign r_resp           = m_axi_rresp   ;
    assign r_valid          = m_axi_rvalid  ;
    assign m_axi_rready     = r_ready       ;
	
	assign i_clk        = M_RD_aclk                 ;
    assign i_rst_n      = M_RD_aresetn              ;
    assign arsize       = clogb2((RD_DATA_WIDTH/8)-1);
    assign arlen        = RD_LIN - 1                ;
    assign M_RD_tlast   = o_last                    ;
    assign M_RD_tvalid  = o_valid                   ;
    assign i_ready      = M_RD_tready               ;
  

	assign m_axi_arid       = 0;
	assign m_axi_arlock     = 0;
	assign m_axi_arcache    = 3;
	assign m_axi_arprot     = 0;
	assign m_axi_arqos      = 0;

endmodule