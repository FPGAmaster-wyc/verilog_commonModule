module gen_data (
    input wire clk,        // 时钟信号（假设50MHz）
    input wire rst_n,      // 复位信号，低电平有效
    input wire key,        // 按键输入
    output reg [31:0] M_AXIS_tdata,  // 32位数据输出
    output reg M_AXIS_tvalid     // 数据有效信号
);

// 内部信号定义
reg [8:0] count;          // 数据计数器
reg [1:0] state;          // 状态机
reg [31:0] bust_cnt;     //突发次数计数
reg [15:0] delay_cnt;   //突发之间的等待时间计数

// 状态定义
localparam  IDLE = 2'b00,  // 空闲状态
            SYNC = 2'b01,
            GEN  = 2'b10,   // 数据生成状态
            DELAY = 2'b11;

// 按键消抖及边沿检测
localparam DEBOUNCE_TIME = 1;  // 1ms @50MHz (50,000 cycles)
reg key_out;
reg key_out_dly;
reg [31:0]  key_cnt;       // 按键消抖计数器

always @(posedge clk, negedge rst_n) begin
	if (!rst_n) {key_cnt,key_out_dly,key_out} <= 1;  //0:按键高有效 1：按键低有效 
    else begin
        key_out_dly <= key_out;
        key_out <= (key_cnt == DEBOUNCE_TIME) ? key : key_out;
        key_cnt <= (key != key_out) ? ((key_cnt == DEBOUNCE_TIME) ? 0 : key_cnt + 1) : 0;
    end
end
//按键高有效使用：key_release     按键低有效使用：key_pressed
wire key_release = key_out & ~key_out_dly;  // 检测上升沿
wire key_pressed = ~key_out & key_out_dly;  // 检测下降沿


// 主状态机
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
                if (key_pressed && rst_n) begin    // 检测到消抖后的按键按下
                    state <= GEN;
                    M_AXIS_tvalid <= 1'b1;     // 立即拉高valid
                end
            end       
            
            GEN: begin              
                if (count == 5) begin  // 输出256个数据后返回IDLE
                    state <= DELAY;
                    M_AXIS_tvalid <= 1'b0;    // 最后一个数据后valid拉低
                    count <= 0;
                end
                else begin
                    M_AXIS_tvalid <= 1'b1;     // 数据有效
                    count <= count + 4'd1;
                end 
                
            end

            DELAY   :   begin
                if (bust_cnt == (1/*`BURST_CNT*/ - 1))     //需要突发的次数 10
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