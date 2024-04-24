////////////////////////////////////////////////////////////////////////////////
// File:	asy_1bit_fast2slow.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Single bit signal synchronization from fast clock domain to slow clock domain.
//Usage conditions:
//	The interval between two input pulses in the fast clock domain must be greater than or equal to two clock cycles in the slow clock domain.
//
////////////////////////////////////////////////////////////////////////////////

module asy_1bit_fast2slow(
	input  clk_fast, 
	input  clk_slow, 
	input  rst_n,
	input  din,
	output dout
);
(* ASYNC_REG = "TRUE" *)		//To avoid timing defaults
reg       toggle;
(* ASYNC_REG = "TRUE" *)		
reg       q1,q2,q3;
//------get Toggle signal------
always@(posedge clk_fast or negedge rst_n) begin
	if(!rst_n)begin
		toggle <= 1'b0;
    end
	else if(din) begin
		toggle <= ~toggle;
	end
	else begin
		toggle <= toggle;
	end
end

//------SYNC shooting-------
assign dout = q2 ^ q3; 
always@(posedge clk_slow or negedge rst_n) begin
	if(!rst_n)begin
		{q3,q2,q1} <= {3{1'b0}};
    end
	else begin
		{q3,q2,q1} <= {q2,q1,toggle};
	end
end

endmodule
