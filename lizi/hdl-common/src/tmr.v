///////////////////////////////////////////////////////////////////////////////
//% @file tmr.v
//% @brief ��ģ����Ĵ���.
//% @author ������
//////////////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps

//% @brief ��ģ����Ĵ���,���첽��λ.
module tmrr
#(
	parameter dw=1 //% �Ĵ���λ��
)
(
	input [dw-1:0] d, //% �Ĵ�������
	input c, //% ����ʱ��
	input r, //% ��λ�ź�
	output [dw-1:0] q //% �Ĵ������
)/* synthesis syn_preserve=1 */;
reg [dw-1:0] q1, q2, q3;

always @(posedge c, posedge r) 
begin
	if(r) 
	begin
		q1 <= 'b0;
		q2 <= 'b0;
		q3 <= 'b0;
	end 
	else 
	begin
		q1 <= d;
		q2 <= d;
		q3 <= d;
	end
end
assign q = (q1 & q2) | (q1 & q3) | (q2 & q3); // vote
endmodule

//% @brief ��ģ����Ĵ���,���첽��λ.
module tmrs
#(parameter dw=1)
(
	input [dw-1:0] d,
	input c,
	input s,
	output [dw-1:0] q
)/* synthesis syn_preserve=1 */;
reg [dw-1:0] q1, q2, q3;

always @(posedge c, posedge s) 
begin
	if(s) 
	begin
		q1 <= {dw{1'b1}};
		q2 <= {dw{1'b1}};
		q3 <= {dw{1'b1}};
	end 
	else 
	begin
		q1 <= d;
		q2 <= d;
		q3 <= d;
	end
end
assign q = (q1 & q2) | (q1 & q3) | (q2 & q3); // vote
endmodule

//% @brief ��ģ����Ĵ���,���첽��λ��ʹ��.
module tmrre
#(parameter dw=1)
(
	input [dw-1:0] d,
	input c,
	input r,
	input e,
	output [dw-1:0] q
)/* synthesis syn_preserve=1 */;
reg [dw-1:0] q1, q2, q3;

always @(posedge c, posedge r) 
begin
	if(r) 
	begin
		q1 <= 'b0;
		q2 <= 'b0;
		q3 <= 'b0;
	end 
	else if(e) 
	begin
		q1 <= d;
		q2 <= d;
		q3 <= d;
	end
end
assign q = (q1 & q2) | (q1 & q3) | (q2 & q3); // vote
endmodule

//% @brief ��ģ����Ĵ���,���첽��λ��ʹ�ܣ������źż���·ԭʼ�������.
module tmrre3
#(parameter dw=1)
(
	input [dw-1:0] d1,
	input [dw-1:0] d2,
	input [dw-1:0] d3,
	input c,
	input r,
	input e,
	output reg [dw-1:0] q1,
	output reg [dw-1:0] q2,
	output reg [dw-1:0] q3,
	output [dw-1:0] q,
	output err
)/* synthesis syn_preserve=1 */;

always @(posedge c, posedge r) 
begin
	if(r) 
	begin
		q1 <= 'b0;
		q2 <= 'b0;
		q3 <= 'b0;
	end 
	else if(e) 
	begin
		q1 <= d1;
		q2 <= d2;
		q3 <= d3;
	end
end
assign q = (q1 & q2) | (q1 & q3) | (q2 & q3); // vote
assign err = |((q1^q2)|(q1^q3));
endmodule
