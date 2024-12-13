///////////////////////////////////////////////////////////////////
//% @file character_detect.v
//% @brief UART字符检测.
//% @author 刘嘉晗
`timescale 1ns/10ps
//% @brief UART字符检测.
//% 检测UART接口上的字符并输出一个正脉冲.
//% 用于检测出转台接口上的字符传输以便对字符进行计数.
module character_detect
(
	input clk_i, //% 工作时钟
	input rst_i, //% 复位信号
	input strobe_i, //% 触发信号
	output int_o //% 检测输出
);
parameter cw=16,d=65535;
parameter [0:0] polarity=1'b1;

reg [cw-1:0] counter;
reg int_r;

assign int_o = int_r;

always @(posedge clk_i, posedge rst_i)
begin
	if(rst_i)
		int_r <= 1'b0;
	else if(counter == d)
		int_r <= 1'b0;
	else if(~int_r && strobe_i==polarity)
		int_r <= 1'b1;
end

always @(posedge clk_i, posedge rst_i)
begin
	if(rst_i)
		counter <= 'b0;
	else if(int_r)
		counter <= counter + 1;
	else
		counter <= 'b0;
end

endmodule
