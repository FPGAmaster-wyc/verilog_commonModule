module edge_detector (
    input wire clk,
    input wire rst_n,
    input wire signal_in,
    output reg rising_edge,
    output reg falling_edge
);
    reg signal_in_d;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            signal_in_d <= 1'b0;
            rising_edge <= 1'b0;
            falling_edge <= 1'b0;
        end 
        else begin
            signal_in_d <= signal_in;                   // ��¼��һ��ʱ�����ڵ������ź�
            rising_edge <= signal_in & ~signal_in_d;    // ���������
            falling_edge <= ~signal_in & signal_in_d;   // ����½���
        end 
    end
endmodule
