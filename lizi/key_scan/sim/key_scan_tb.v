`timescale 1ns/1ps
module key_scan_tb;
	
	
	reg clk,rst_n;
	reg [3:0] row;
	
	wire [3:0] col;
	wire [2:0] sel;
	wire [7:0] seg;
	wire beep;
	
	
	reg [4:0] key_in;            //模拟按键
	
	key_scan_top key_scan_top_dut(
	.clk(clk),
	.rst_n(rst_n),
	.row(row),
	.col(col),
	.sel(sel),
	.seg(seg),
	.beep(beep)
	);
	
	initial begin
		clk = 0;
		rst_n = 0;
		row = 4'b1111;
		key_in = 5'd16;
		#201
		
		key_in = 5'd1;
		rst_n = 1'b1;
		#500
		key_in = 5'd16;
		#500
		
		key_in = 5'd10;
		#500
		key_in = 5'd16;
		#500
		
		key_in = 5'd7;
		#500
		key_in = 5'd16;
		#500
		$stop;
	
	end
	
	always #10 clk = ~clk;
	
	always @(*)
	begin
		if(!rst_n)
			key_in = 5'd16;
		else
			case(key_in)
			
				5'd0		:		row = {1'b1,1'b1,1'b1,col[0]};
				5'd1		:		row = {1'b1,1'b1,1'b1,col[1]};
				5'd2		:		row = {1'b1,1'b1,1'b1,col[2]};
				5'd3		:		row = {1'b1,1'b1,1'b1,col[3]};
				
				5'd4		:		row = {1'b1,1'b1,col[0],1'b1};
				5'd5		:		row = {1'b1,1'b1,col[1],1'b1};
				5'd6		:		row = {1'b1,1'b1,col[2],1'b1};
				5'd7		:		row = {1'b1,1'b1,col[3],1'b1};
				
				5'd8		:		row = {1'b1,col[0],1'b1,1'b1};
				5'd9		:		row = {1'b1,col[1],1'b1,1'b1};
				5'd10		:		row = {1'b1,col[2],1'b1,1'b1};
				5'd11		:		row = {1'b1,col[3],1'b1,1'b1};
				
				5'd12		:		row = {col[0],1'b1,1'b1,1'b1};
				5'd13		:		row = {col[1],1'b1,1'b1,1'b1};
				5'd14		:		row = {col[2],1'b1,1'b1,1'b1};
				5'd15		:		row = {col[3],1'b1,1'b1,1'b1};
				
				5'd16		:		row = 4'b1111;
			endcase
	
	end
	
endmodule
	