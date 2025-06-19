module gen_data (
    input wire         clk,          // 100MHz ʱ��
    input wire         rst_n,        // �͵�ƽ��λ
    input wire         wr_start,     // д���ݴ����ź�
    output reg         valid,        // ������Ч�ź�
    output reg  [31:0] data         // 128λ�������
);

    // ��������
    localparam FRAME_SIZE = 32'hFF ; //֡��С
    localparam FRAME_HEADER = 32'h1ACFFC1D; // ֡ͷ
    localparam IDLE = 2'b00,
               HEADER = 2'b01,
               DATA = 2'b10;

    // �ڲ��ź�
    reg [1:0] state, next_state;
    reg [31:0] cnt;           // ��֡���ڼ����������֧��32����
    reg [31:0] data_acc;    // 32λ�ԼӼ�����
    reg [7:0] frame_cnt;     // ֡������
    reg key_dly;             // �����ӳټĴ���
    wire key_pose;           // ����������

    // ״̬����״̬�Ĵ���
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // ״̬������һ״̬�߼�
    always @(*) begin
        case (state)
            IDLE: begin
                if (wr_start)
                    next_state = HEADER;
                else
                    next_state = IDLE;
            end
            HEADER: begin
                next_state = DATA;
            end
            DATA: begin
                if (cnt == FRAME_SIZE - 1) 
                    next_state = IDLE;               
                else
                    next_state = DATA;
            end
            default: next_state = IDLE;
        endcase
    end

    // ֡������
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            frame_cnt <= 8'd0;
        else if (state == DATA && cnt == FRAME_SIZE - 1)
            frame_cnt <= frame_cnt + 1;
        else if (state == IDLE)
            frame_cnt <= 8'd0;
    end

    // ��֡���ڼ�����
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 0;
        else if (state == DATA)
            cnt <= cnt + 1;
        else
            cnt <= 0;
    end

    // 32λ�ԼӼ�����
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_acc <= 32'd1;
        else if (state == DATA && valid)
            data_acc <= data_acc + 1;
    end

    // ����߼�
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid <= 1'b0;
            data <= 32'd0;
        end
        else begin
            case (state)
                IDLE: begin
                    valid <= 1'b0;
                    data <= 32'd0;
                end
                HEADER: begin
                    valid <= 1'b1;
                    data <= FRAME_HEADER; // ֡ͷռ��32λ
                end
                DATA: begin
                    valid <= 1'b1;
                    data <= data_acc; // ���32λ�Լ���
                end
                default: begin
                    valid <= 1'b0;
                    data <= 32'd0;
                end
            endcase
        end
    end

endmodule