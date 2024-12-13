module real_clock(
    input rst,
    input clk,
    input [31:0] set_sec,
    input [23:0] set_us,
    input set_en,
    output [31:0] time_sec,
    output [23:0] sub_us,
    output reg pps
);
parameter CLOCK_PERIOD_NS = 10;

function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction
localparam US_CYCLES = 1_000/CLOCK_PERIOD_NS;
localparam SUB_CNT_BITS = clogb2(US_CYCLES);
localparam US_CNT_BITS = clogb2(1_000_000);

wire us_tick;
wire sec_tick;
reg [SUB_CNT_BITS-1:0] sub_cnt;
reg [US_CNT_BITS-1:0] us_cnt;
reg [31:0] sec_cnt;

assign us_tick = (sub_cnt+1==US_CYCLES);
assign sec_tick = (us_cnt+1==1_000_000) && us_tick;
assign time_sec = sec_cnt;
assign sub_us = us_cnt;

always @(posedge clk, posedge rst)
begin
    if(rst)
        sub_cnt <= 0;
    else if(us_tick)
        sub_cnt <= 0;
    else
        sub_cnt <= sub_cnt+1;
end

always @(posedge clk, posedge rst)
begin
    if(rst)
        us_cnt <= 0;
    else if(set_en)
        us_cnt <= set_us;
    else if(sec_tick)
        us_cnt <= 0;
    else if(us_tick)
        us_cnt <= us_cnt+1;
end

always @(posedge clk, posedge rst)
begin
    if(rst)
        sec_cnt <= 0;
    else if(set_en)
        sec_cnt <= set_sec;
    else if(sec_tick)
        sec_cnt <= sec_cnt+1;
end

always @(posedge clk)
begin
    pps <= sec_tick;
end

endmodule
