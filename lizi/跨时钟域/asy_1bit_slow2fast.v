/*****
*单bit信号 
*慢时钟域信号同步到快时钟域

*使用条件：
*慢时钟域下的单比特信号的脉冲宽度，必须要大于或等于快时钟域下2个时钟周期。
*这样才能保证慢时钟域的脉冲信号是足够保持到被快时钟域的同步器拿到。
****/

module asy_1bit_slow2fast(
	input  clk_slow, //慢时钟
	input  clk_fast, //快时钟
	input  rst_n,		//块时钟的

	input  din,
	output dout
);

(* ASYNC_REG = "TRUE" *)		//避免出现时序违约
reg       q1,q2,q3;

assign dout = q2 & (~q3);
//------同步打拍-------
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
