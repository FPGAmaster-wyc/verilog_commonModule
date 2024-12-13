`timescale 1ns/1ps
module page_wr_tb;

	reg clk,rst_n;
	
	wire  scl;
	wire 	sda;
	
	page_wr byte_wr_top_dut(
	.clk(clk),
	.rst_n(rst_n),
	.scl(scl),
	.sda(sda)
	);
	
	M24LC64 M24LC64_inst(
	.A0(1'b0),
	.A1(1'b0), 
	.A2(1'b0), 
	.WP(1'b0),               //0: 可读可写 1：可读不可写
	.SDA(sda), 
	.SCL(scl), 
	.RESET(~rst_n)
	);
	
	initial  begin
					clk = 0;
					rst_n = 0;
					#201;
					rst_n = 1;
				end
	always #10 clk=~clk;
endmodule
