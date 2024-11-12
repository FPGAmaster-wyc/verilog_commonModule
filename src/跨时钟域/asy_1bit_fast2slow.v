/*****
*单bit信号 
*快时钟域信号同步到慢时钟域

*使用条件：
*快时钟域下的两个输入脉冲的间隔必须大于或等于慢时钟域的2个时钟周期。
****/

module asy_1bit_fast2slow(
	input  clk_fast, //快时钟
	input  clk_slow, //慢时钟
	input  rst_n,
	input  din,
	output dout
);
(* ASYNC_REG = "TRUE" *)		//避免出现时序违约
reg       toggle;
(* ASYNC_REG = "TRUE" *)		//避免出现时序违约
reg       q1,q2,q3;
//------产生Toggle信号------
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

//------同步打拍-------
assign dout = q2 ^ q3; //输出同步后的脉冲信号
always@(posedge clk_slow or negedge rst_n) begin
	if(!rst_n)begin
		{q3,q2,q1} <= {3{1'b0}};
    end
	else begin
		{q3,q2,q1} <= {q2,q1,toggle};
	end
end

endmodule
