module gen_data (
    input wire clk,        // ʱ���źţ�����50MHz��
    input wire rst_n,      // ��λ�źţ��͵�ƽ��Ч
    input wire key,        // ��������
    output reg [31:0] M_AXIS_tdata,  // 32λ�������
    output reg M_AXIS_tvalid     // ������Ч�ź�
);

// �ڲ��źŶ���
reg [8:0] count;          // ���ݼ�����
reg [1:0] state;          // ״̬��
reg [31:0] bust_cnt;     //ͻ����������
reg [15:0] delay_cnt;   //ͻ��֮��ĵȴ�ʱ�����

// ״̬����
localparam  IDLE = 2'b00,  // ����״̬
            SYNC = 2'b01,
            GEN  = 2'b10,   // ��������״̬
            DELAY = 2'b11;

// �������������ؼ��
localparam DEBOUNCE_TIME = 1;  // 1ms @50MHz (50,000 cycles)
reg key_out;
reg key_out_dly;
reg [31:0]  key_cnt;       // ��������������

always @(posedge clk, negedge rst_n) begin
	if (!rst_n) {key_cnt,key_out_dly,key_out} <= 1;  //0:��������Ч 1����������Ч 
    else begin
        key_out_dly <= key_out;
        key_out <= (key_cnt == DEBOUNCE_TIME) ? key : key_out;
        key_cnt <= (key != key_out) ? ((key_cnt == DEBOUNCE_TIME) ? 0 : key_cnt + 1) : 0;
    end
end
//��������Чʹ�ã�key_release     ��������Чʹ�ã�key_pressed
wire key_release = key_out & ~key_out_dly;  // ���������
wire key_pressed = ~key_out & key_out_dly;  // ����½���


// ��״̬��
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        count <= 4'd0;
        M_AXIS_tvalid <= 1'b0;
        bust_cnt <= 0;
        delay_cnt <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                M_AXIS_tvalid <= 1'b0;
                count <= 4'd1;
                if (key_pressed && rst_n) begin    // ��⵽������İ�������
                    state <= GEN;
                    M_AXIS_tvalid <= 1'b1;     // ��������valid
                end
            end       
            
            GEN: begin              
                if (count == 5) begin  // ���256�����ݺ󷵻�IDLE
                    state <= DELAY;
                    M_AXIS_tvalid <= 1'b0;    // ���һ�����ݺ�valid����
                    count <= 0;
                end
                else begin
                    M_AXIS_tvalid <= 1'b1;     // ������Ч
                    count <= count + 4'd1;
                end 
                
            end

            DELAY   :   begin
                if (bust_cnt == (1/*`BURST_CNT*/ - 1))     //��Ҫͻ���Ĵ��� 10
                    begin
                        if (delay_cnt == 100)
                            begin
                                state <= IDLE;   
                                bust_cnt <= 0;
                                delay_cnt <= 0;
                            end
                        else
                            delay_cnt <= delay_cnt + 1;                     
                    end                    
                else
                    begin
                        if (delay_cnt == 100)
                            begin
                                delay_cnt <= 0;
                                state <= GEN;   
                                bust_cnt <= bust_cnt + 1;
                            end
                        else
                            delay_cnt <= delay_cnt + 1;
                        
                    end                   

            end 
            
            default: begin
                state <= IDLE;
                M_AXIS_tvalid <= 1'b0;
                count <= 4'd0;
            end
        endcase
    end
end



always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        M_AXIS_tdata <= 0;
    else if (key_pressed)
        M_AXIS_tdata <= 32'h1ACFFC1D;
    else if (count == 0)
        M_AXIS_tdata <= 32'h1ACFFC1D;
    else if (count == 1)
        M_AXIS_tdata <= 32'h2D5F8D2A;
    else if (M_AXIS_tvalid)
        M_AXIS_tdata <= count;
end 




endmodule