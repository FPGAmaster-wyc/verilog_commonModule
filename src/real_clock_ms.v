////////////////////////////////////////////////////////////////////////////////
// File:	real_clock_ms.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Add timestamp during data transmission.
//
/*
real_clock_ms u_real_clock_ms(
    .rst_n   ( rst_n   ),
    .clk     ( clk     ),
    .time_ms ( time_ms ),
    .time_sec  ( time_sec  )
);
*/
////////////////////////////////////////////////////////////////////////////////

module real_clock_ms(
    input rst_n,
    input clk,
    //input [31:0] set_sec,
    //input [23:0] set_ms,
    //input set_en,               
    
    output [15:0] time_ms,
    output [15:0] time_sec
    //output reg pps
);
parameter CLOCK_PERIOD_NS = 10;         //cycle ns

    reg set_en = 0;
function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction
localparam MS_CYCLES = 1_000_000/CLOCK_PERIOD_NS;
localparam SUB_CNT_BITS = clogb2(MS_CYCLES);
localparam US_CNT_BITS = clogb2(1_000_000);

wire ms_tick;
wire sec_tick;
reg [SUB_CNT_BITS-1:0] sub_cnt;
reg [15:0] ms_cnt;
reg [15:0] sec_cnt;

assign ms_tick = (sub_cnt+1==MS_CYCLES);
assign sec_tick = (ms_cnt+1==1_000) && ms_tick;
assign time_sec = sec_cnt;
assign time_ms = ms_cnt;

always @(posedge clk, posedge rst_n)
begin
    if(~rst_n)
        sub_cnt <= 0;
    else if(ms_tick)
        sub_cnt <= 0;
    else
        sub_cnt <= sub_cnt+1;
end

always @(posedge clk, posedge rst_n)
begin
    if(~rst_n)
        ms_cnt <= 0;
    else if(sec_tick)
        ms_cnt <= 0;
    else if(ms_tick)
        ms_cnt <= ms_cnt+1;
end

always @(posedge clk, posedge rst_n)
begin
    if(~rst_n)
        sec_cnt <= 0;
    else if(sec_tick)
        sec_cnt <= sec_cnt+1;
end

endmodule
