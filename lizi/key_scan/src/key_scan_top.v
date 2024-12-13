module key_scan_top(clk,rst_n,row,col,sel,seg,beep);
	
	input clk,rst_n;
	input [3:0] row;
	
	output [3:0] col;
	output [2:0] sel;
	output [7:0] seg;
	output beep;
	
	wire [3:0] key_num;
	wire key_valid;
	wire [23:0] data;
	
	key_scan key_scan_dut(
	.clk(clk),
	.rst_n(rst_n),
	.row(row),
	.col(col),
	.key_num(key_num),
	.key_valid(key_valid)
	);
	
	assign data = {20'd0,key_num};
	
	
	seven_tube seven_tube_dut(
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data),
	.seg(seg),
	.sel(sel)
	);
	
	
	//1hz

	
	beep_ctrl beep_ctrl_dut(
	.clk(clk),
	.rst_n(rst_n),
	.key_valid(key_valid),
	.beep(beep)
	);

endmodule 