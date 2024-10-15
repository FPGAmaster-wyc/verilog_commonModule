module gen_data (
    input wire clk,    // ʱ���ź�
    input wire rst_n,  // ��λ�źţ��͵�ƽ��Ч
    output reg [31:0] tdata,  // 32λ������������ݷ�Χ0-2048
    output reg tvalid,        // ������Ч�ź�
    output reg tlast          // ���ݿ�����ź�
);

// ������������ڲ������ݺͱ��tlast
reg [11:0] data_cnt;  // ���ݼ���������Χ 0-2048
reg [5:0] last_cnt;   // ����ÿ64�����ݷ���tlast
reg [4:0] delay_cnt;  // ��ʱ�����������ڵȴ�20������
reg sending;          // ���ݷ���״̬�ź�
reg waiting;          // �ȴ�״̬�ź�

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_cnt <= 12'd0;   // ���ݼ�������λ
        last_cnt <= 6'd0;    // tlast��������λ
        tdata <= 32'd0;      // ������ݸ�λ
        tvalid <= 1'b0;      // tvalid��λ
        tlast <= 1'b0;       // tlast��λ
        delay_cnt <= 5'd0;   // ��ʱ��������λ
        sending <= 1'b0;     // ����״̬��λ
        waiting <= 1'b1;     // ��ʼ״̬Ϊ�ȴ�
    end else begin
        if (waiting) begin
            tvalid <= 0;
            // ���ڵȴ�״̬����ʱ20������
            if (delay_cnt == 5'd20) begin
                waiting <= 1'b0;    // �ȴ���������ʼ��������
                sending <= 1'b1;    // ���뷢��״̬
                delay_cnt <= 5'd0;  // ������ʱ������
                
            end else begin
                delay_cnt <= delay_cnt + 5'd1;  // ��ʱ����������
            end
        end else if (sending) begin
            // ���ڷ���״̬����ʼ��������
            tvalid <= 1'b1;   // ������Ч�ź��ø�
            tdata <= {20'd0, data_cnt};  // ���32λ���ݣ����е�12λ�Ǽ�����
            
            // �������ݼ�����
            if (data_cnt == 12'd2047) begin
                data_cnt <= 12'd0;  // �����ݵ���2048ʱ�����¿�ʼ
            end else begin
                data_cnt <= data_cnt + 12'd1;  // ���ݼ���������
            end

            // ����last��������ÿ64���������һ��tlast�ź�
            if (last_cnt == 6'd63) begin
                tlast <= 1'b1;     // ����64������ʱ��tlast�ź��ø�
                last_cnt <= 6'd0;  // ����last������
                sending <= 1'b0;   // ���һ�����ݣ��˳�����״̬
                waiting <= 1'b1;   // ����ȴ�״̬
            end else begin
                tlast <= 1'b0;     // ����tlast�ź�Ϊ��
                last_cnt <= last_cnt + 6'd1;  // last����������
            end
        end
    end
end

endmodule
