///////////////////////////////////////////////////////////////////////////////
//% @file bcd2bin.v
//% @brief BCD to binary transform on any radix
//% @author Liu Jiahan <liujiahan@gmail.com>
//////////////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
//% @brief BCD to BIN transform.
//% Transform any number of BCD digits to its binary representation.
//% Given a number that represented in several BCD digits, with a certain radix(bin, oct, hex, dec, etc).
//% The module takes input sequentially from most-significant digit to least-significant.
//% Each incoming digit is translated to its binary value and add to the product of previous summary and the radix.
//% This will give a new summary. And the final summary will be the binary value of input representation.
module bcd2bin #(parameter BB = 32 /*result bits*/, MB = 18 /* radix bits */) (
	input clk_i, //% working clock
	input rst_i, //% global reset
	input clr_i, //% initial clear. 
	input nd_i, //% new data (a new digit)
	input [3:0] bcd_i, //% BCD code input
	input [MB-1:0] wgt_i, //% radix - 2, 8, 10, 16, etc.
	output [BB-1:0] q_o //% binary result output
);

reg [BB-1:0] acc_1; //% internal accumulator
assign q_o = acc_1;

always @(posedge clk_i, posedge rst_i)
begin
	if(rst_i)
	begin
		acc_1 <= 'b0;
	end
	else if(clr_i) // clear previous summary
	begin
		if(nd_i) // if a new data comes at the same time
			acc_1 <= bcd_i*wgt_i;
		else // just clear it
			acc_1 <= 'b0;
	end
	else if(nd_i) // a new input
	begin
		// weighted accumulation
		acc_1 <= acc_1 + bcd_i*wgt_i;
	end
end

endmodule
