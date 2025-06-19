module gen_data (
    input wire         clk,          // 100MHz 时钟
    input wire         rst_n,        // 低电平复位
    input wire         wr_start,     // 写数据触发信号
    output reg         valid,        // 数据有效信号
    output reg  [31:0] data         // 128位数据输出
);

    // 参数定义
    localparam FRAME_SIZE = 32'hFF ; //帧大小
    localparam FRAME_HEADER = 32'h1ACFFC1D; // 帧头
    localparam IDLE = 2'b00,
               HEADER = 2'b01,
               DATA = 2'b10;

    // 内部信号
    reg [1:0] state, next_state;
    reg [31:0] cnt;           // 单帧周期计数器，最大支持32周期
    reg [31:0] data_acc;    // 32位自加计数器
    reg [7:0] frame_cnt;     // 帧计数器
    reg key_dly;             // 按键延迟寄存器
    wire key_pose;           // 按键上升沿

    // 状态机：状态寄存器
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // 状态机：下一状态逻辑
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

    // 帧计数器
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            frame_cnt <= 8'd0;
        else if (state == DATA && cnt == FRAME_SIZE - 1)
            frame_cnt <= frame_cnt + 1;
        else if (state == IDLE)
            frame_cnt <= 8'd0;
    end

    // 单帧周期计数器
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 0;
        else if (state == DATA)
            cnt <= cnt + 1;
        else
            cnt <= 0;
    end

    // 32位自加计数器
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_acc <= 32'd1;
        else if (state == DATA && valid)
            data_acc <= data_acc + 1;
    end

    // 输出逻辑
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
                    data <= FRAME_HEADER; // 帧头占高32位
                end
                DATA: begin
                    valid <= 1'b1;
                    data <= data_acc; // 输出32位自加数
                end
                default: begin
                    valid <= 1'b0;
                    data <= 32'd0;
                end
            endcase
        end
    end

endmodule