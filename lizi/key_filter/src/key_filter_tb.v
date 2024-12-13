`timescale 1ns/1ps
module key_filter_tb;
	
	reg	clk;
	reg	rst_n;
	reg	key_in;
	
	wire 	pos_edge,neg_edge;
	
	key_filter #(.t(4))key_filter_Dut(
	.clk(clk),
	.rst_n(rst_n),
	.key_in(key_in),
	//.key_out(key_out),
	.key_out(key_out)
	);
	
	initial begin
		clk = 0;
		rst_n = 0;
		key_in = 1;
		#201
		rst_n = 1;
		#201
		key_in = 0;
		#501
		key_in = 1;
		#500
		key_in = 0;
		#501
		key_in = 1;
		#500
		key_in = 0;
		#501
		key_in = 1;
		#500
		key_in = 0;
		#501
		key_in = 1;
		#500
		key_in = 0;
		#501
		key_in = 1;
		#500
		$stop;
	
	end
	
	always #10 clk = ~clk;

endmodule 