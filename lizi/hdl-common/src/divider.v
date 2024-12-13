////////////////////////////////////////////////////////////////////////////////
// File:	divider.v
// Author:	Jonah Liu <liujiahan@gmail.com>
// Description:
//   Generic divider module
//   This module is adapted from John Clayton's serial_divide_uu.v at
//   OPENCORES.ORG
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation;  either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source.
// If not, download it from http://www.opencores.org/lgpl.shtml
//
////////////////////////////////////////////////////////////////////////////////
module divider(
	rst_i,
	clk_i,
	valid_i,
	ready_o,
	dividend_i,
	divisor_i,
	quotient_o,
	remainder_o,
	valid_o
);

parameter DIVIDEND_BITS = 16;
parameter DIVISOR_BITS = 8;
parameter REMAINDER_BITS = 0;
parameter LEADING_ZERO_BITS = 0; // known leading zeros
parameter HOLD_OUTPUT = 0;


function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction


localparam M_PP = DIVIDEND_BITS;
localparam N_PP = DIVISOR_BITS;
localparam R_PP = REMAINDER_BITS>0 ? REMAINDER_BITS : 1;
localparam S_PP = LEADING_ZERO_BITS;
// 2^COUNT_WIDTH_PP-1 >= (DIVIDEND_BITS+REMAINDER_BITS-LEADING_ZERO_BITS-1)
localparam COUNT_WIDTH_PP = clogb2(N_PP+R_PP-S_PP); 

input  clk_i;  
input  rst_i;
input  valid_i;
input  [M_PP-1:0] dividend_i;
input  [N_PP-1:0] divisor_i;
output [M_PP-1:0] quotient_o;
output [R_PP-1:0] remainder_o;
output ready_o;
output valid_o;

reg  ready_o;
reg  valid_o;


reg  [M_PP+R_PP-1:0] grand_dividend;
reg  [M_PP+N_PP+R_PP-2:0] grand_divisor;
reg  [M_PP+R_PP-S_PP-1:0] quotient;
reg  [M_PP+R_PP-1:0] quotient_reg;
reg  [COUNT_WIDTH_PP-1:0] divide_count;

wire [M_PP+N_PP+R_PP-1:0] subtract_node; // Subtract node has extra "sign" bit
wire [M_PP+R_PP-1:0]      quotient_node; // Shifted version of quotient
wire [M_PP+N_PP+R_PP-2:0]  divisor_node; // Shifted version of grand divisor

//--------------------------------------------------------------------------
// Module code

// Serial dividing module
always @(posedge clk_i)
begin
  if (rst_i)
  begin
    grand_dividend <= 0;
    grand_divisor <= 0;
    divide_count <= 0;
    quotient <= 0;
    ready_o <= 1;
	valid_o <= 0;
  end
  else if(ready_o && valid_i) begin
	  ready_o <= 0;
      quotient <= 0;
      divide_count <= 0;
      // dividend placed initially so that remainder bits are zero...
      grand_dividend <= dividend_i << R_PP;
      // divisor placed initially for a 1 bit overlap with dividend...
      // But adjust it back by S_PP, to account for bits that are known
      // to be leading zeros in the quotient.
      grand_divisor  <= divisor_i << (N_PP+R_PP-S_PP-1);
	  valid_o <= 1'b0;
  end
  else if (!ready_o)
  begin
    if (divide_count == N_PP+R_PP-S_PP-1)
    begin
      quotient <= quotient_node;      // final shift...
      quotient_reg <= quotient_node;  // final shift (held output)
      ready_o <= 1;                                 // Indicate done, just sit
	  valid_o <= 1;
    end
    else                // Division in progress
    begin
      // If the subtraction yields a positive result, then store that result
      if (~subtract_node[M_PP+N_PP+R_PP-1]) grand_dividend <= subtract_node;
      // If the subtraction yields a positive result, then a 1 bit goes into 
      // the quotient, via a shift register
      quotient <= quotient_node;
      // shift the grand divisor to the right, to cut it in half next clock cycle
      grand_divisor <= divisor_node;
      // Advance the counter
      divide_count <= divide_count + 1;
    end
  end  // End of else if clk_en_i
  else
  begin
	  valid_o <= 1'b0;
  end
end // End of always block

assign subtract_node = {1'b0,grand_dividend} - {1'b0,grand_divisor};
assign quotient_node = 
  {quotient[M_PP+R_PP-S_PP-2:0],~subtract_node[M_PP+N_PP+R_PP-1]};
assign divisor_node  = {1'b0,grand_divisor[M_PP+N_PP+R_PP-2:1]};

assign quotient_o = (HOLD_OUTPUT == 0)?(quotient>>R_PP):(quotient_reg>>R_PP);
assign remainder_o = (HOLD_OUTPUT == 0)?quotient:quotient_reg;



endmodule
