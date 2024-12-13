////////////////////////////////////////////////////////////////////////////////
//% @file edge_counter.v
//% @brief ���ؼ�����.
//% ���ؼ��������ڶ��ſغ��ַ���ͳ����Ϣ�ļ���.
//% @author ������
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
//% @brief ���ؼ�����.
//% �������źŵı���(������Ϊ�������½�)�������������ֵ.
//% ���������շ��ſصļ���.
module edge_counter
#(parameter /*!������λ��*/ width=32, /*!���ؼ��ԣ�0-�½���,1-������*/polarity=1'b1)
(
	input clk_i, //% ����ʱ��
	input rst_i, //% ��λ�ź�
	input strobe_i, //% ��������
	output [width-1:0] counter_o //% ����ֵ
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
