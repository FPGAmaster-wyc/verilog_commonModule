module gen_data (
    input wire clk,    // 时钟信号
    input wire rst_n,  // 复位信号，低电平有效
    output reg [31:0] tdata,  // 32位数据输出，数据范围0-2048
    output reg tvalid,        // 数据有效信号
    output reg tlast          // 数据块结束信号
);

// 定义计数器用于产生数据和标记tlast
reg [11:0] data_cnt;  // 数据计数器，范围 0-2048
reg [5:0] last_cnt;   // 用于每64个数据发出tlast
reg [4:0] delay_cnt;  // 延时计数器，用于等待20个周期
reg sending;          // 数据发送状态信号
reg waiting;          // 等待状态信号

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_cnt <= 12'd0;   // 数据计数器复位
        last_cnt <= 6'd0;    // tlast计数器复位
        tdata <= 32'd0;      // 输出数据复位
        tvalid <= 1'b0;      // tvalid复位
        tlast <= 1'b0;       // tlast复位
        delay_cnt <= 5'd0;   // 延时计数器复位
        sending <= 1'b0;     // 发送状态复位
        waiting <= 1'b1;     // 初始状态为等待
    end else begin
        if (waiting) begin
            tvalid <= 0;
            // 处于等待状态，延时20个周期
            if (delay_cnt == 5'd20) begin
                waiting <= 1'b0;    // 等待结束，开始发送数据
                sending <= 1'b1;    // 进入发送状态
                delay_cnt <= 5'd0;  // 重置延时计数器
                
            end else begin
                delay_cnt <= delay_cnt + 5'd1;  // 延时计数器递增
            end
        end else if (sending) begin
            // 处于发送状态，开始发送数据
            tvalid <= 1'b1;   // 数据有效信号置高
            tdata <= {20'd0, data_cnt};  // 输出32位数据，其中低12位是计数器
            
            // 更新数据计数器
            if (data_cnt == 12'd2047) begin
                data_cnt <= 12'd0;  // 当数据到达2048时，重新开始
            end else begin
                data_cnt <= data_cnt + 12'd1;  // 数据计数器递增
            end

            // 更新last计数器，每64个数据输出一次tlast信号
            if (last_cnt == 6'd63) begin
                tlast <= 1'b1;     // 到达64个数据时，tlast信号置高
                last_cnt <= 6'd0;  // 重置last计数器
                sending <= 1'b0;   // 完成一组数据，退出发送状态
                waiting <= 1'b1;   // 进入等待状态
            end else begin
                tlast <= 1'b0;     // 否则tlast信号为低
                last_cnt <= last_cnt + 6'd1;  // last计数器递增
            end
        end
    end
end

endmodule
