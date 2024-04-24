////////////////////////////////////////////////////////////////////////////////
// File:	asy_1bit_slow2fast.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Single bit signal synchronization from slow clock domain signal to fast clock domain signal.
// Usage conditions:
//	The pulse width of a single bit signal in the slow clock domain must be greater than or equal to 2 clock cycles in the fast clock domain.
//
////////////////////////////////////////////////////////////////////////////////

module asy_1bit_slow2fast(
	input  clk_slow, 
	input  clk_fast, 
	input  rst_n,		

	input  din,
	output dout
);

(* ASYNC_REG = "TRUE" *)		//To avoid timing defaults
reg       q1,q2,q3;

assign dout = q2 & (~q3);
//------SYNC shooting-------
always@(posedge clk_fast or negedge rst_n) begin
	if(!rst_n)
	begin
		{q3,q2,q1} <= {3{1'b0}};
    end
	else begin
		{q3,q2,q1} <= {q2,q1,din};
	end
end

endmodule
