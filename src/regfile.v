////////////////////////////////////////////////////////////////////////////////
// File:	axi_lite_to_mm.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Transmission between FPGA and PC.
// 
////////////////////////////////////////////////////////////////////////////////

module regfile(
    input                   aclk    ,
    input                   aresetn ,
	
	input           [7:0]   wr_addr ,
	input           [31:0]  wr_dout ,            
	input           [3:0]   wr_be   ,
	input                   wr_en   ,
	input           [7:0]   rd_addr ,
	input                   rd_en   ,
	output  reg     [31:0]  rd_din  ,          

    // write
    input           [31:0]  WR_FRAM_SIZE    , 
	input           [31:0]  WR_NEXT_ADDRESS	,  

	//read
	output          [31:0]  RD_FRAM_SIZE	, 
    output          [31:0]  RD_NEXT_ADDRESS	,	

    //reset
    input                   reset_done,   
    output                  soft_reset                                                
);

// register file
reg [31:0] reg_ctrl;	
reg [31:0] reg_rd_frame_size;
reg [31:0] reg_rd_next_address;

// controls
assign soft_reset = reg_ctrl[0];

//read message
assign RD_FRAM_SIZE = reg_rd_frame_size;
assign RD_NEXT_ADDRESS = reg_rd_next_address;

// PS to PL write machine   （读写地址不能覆盖，写进去的数据，尽量再在读的地方写一下，习惯性写法）
always @(posedge aclk, negedge aresetn)
begin
    if(!aresetn) begin
        reg_ctrl <= 'b0;
        reg_rd_frame_size <= 'b0;
		reg_rd_next_address <= 'b0;
    end
    else if(wr_en) begin
        case(wr_addr[7:2])
            // soft_reset
            0: begin
                if(wr_be[0]) reg_ctrl[7:0] <= wr_dout[7:0];
                if(wr_be[1]) reg_ctrl[15:8] <= wr_dout[15:8];
                if(wr_be[2]) reg_ctrl[23:16] <= wr_dout[23:16];
                if(wr_be[3]) reg_ctrl[31:24] <= wr_dout[31:24];
            end
            // rd_frame_size
            1:  begin  
                if(wr_be[0]) reg_rd_frame_size[7:0] <= wr_dout[7:0];
                if(wr_be[1]) reg_rd_frame_size[15:8] <= wr_dout[15:8];
                if(wr_be[2]) reg_rd_frame_size[23:16] <= wr_dout[23:16];
                if(wr_be[3]) reg_rd_frame_size[31:24] <= wr_dout[31:24];
            end
			// rd_next_address
            2:  begin  
                if(wr_be[0]) reg_rd_next_address[7:0] <= wr_dout[7:0];
                if(wr_be[1]) reg_rd_next_address[15:8] <= wr_dout[15:8];
                if(wr_be[2]) reg_rd_next_address[23:16] <= wr_dout[23:16];
                if(wr_be[3]) reg_rd_next_address[31:24] <= wr_dout[31:24];
            end
            
        endcase
    end
    else begin
        // self-clean 会把PS接收到的信号清零，一般复位采用，其余千万不要清零）
        reg_ctrl[0] <= 1'b0; // soft-reset
    end
end

// PL to PS read machine
always @(*)
begin
    case(rd_addr[7:2])
        // soft_reset
        0: rd_din = {31'b0, soft_reset};          
		// rd_frame_size
		1: rd_din = reg_rd_frame_size;
		// rd_next_address
		2: rd_din = reg_rd_next_address;

        //reset down
        3: rd_din = {31'b0, reset_done};
		//write next_address
        4: rd_din = WR_NEXT_ADDRESS;
        //write frame_size
        5: rd_din = WR_FRAM_SIZE;

        default: rd_din = 'bx;
    endcase
end

endmodule
