///////////////////////////////////////////////////////////////////
//% @file character_detect.v
//% @brief UART�ַ����.
//% @author ������
`timescale 1ns/10ps
//% @brief UART�ַ����.
//% ���UART�ӿ��ϵ��ַ������һ��������.
//% ���ڼ���ת̨�ӿ��ϵ��ַ������Ա���ַ����м���.
module character_detect
(
	input clk_i, //% ����ʱ��
	input rst_i, //% ��λ�ź�
	input strobe_i, //% �����ź�
	output int_o //% ������
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
