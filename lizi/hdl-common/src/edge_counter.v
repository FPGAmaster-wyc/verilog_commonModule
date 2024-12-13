////////////////////////////////////////////////////////////////////////////////
//% @file edge_counter.v
//% @brief 边沿计数器.
//% 边沿计数器用于对门控和字符等统计信息的计数.
//% @author 刘嘉晗
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
//% @brief 边沿计数器.
//% 对输入信号的边沿(可设置为上升或下降)计数并输出计数值.
//% 用于数据收发门控的计数.
module edge_counter
#(parameter /*!计数器位宽*/ width=32, /*!边沿极性，0-下降沿,1-上升沿*/polarity=1'b1)
(
	input clk_i, //% 工作时钟
	input rst_i, //% 复位信号
	input strobe_i, //% 计数触发
	output [width-1:0] counter_o //% 计数值
);

(* ASYNC_REG="TRUE" *)
reg [3:0] strobe_r;
reg [width-1:0] counter_r;
assign counter_o = counter_r;
always @(posedge clk_i, posedge rst_i)
begin
	if(rst_i)
	begin
		counter_r<= 'b0;
		strobe_r<= {4{!polarity}};
	end
	else
	begin
		if((strobe_r[3]!=polarity) && (strobe_r[2]==polarity))
			counter_r<=counter_r +1;
		strobe_r<={strobe_r,strobe_i};
	end
end

endmodule
