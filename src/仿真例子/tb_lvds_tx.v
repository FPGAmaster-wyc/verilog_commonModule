`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/09 13:41:36
// Design Name: 
// Module Name: tb_bd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_bd;

    reg sys_clk,rst_n,key,pressure;
    reg [31:0] AR_LIN_0;
    wire lvds_data0,lvds_data1,lvds_clk,lvds_gate;
    

    DDR_TEST_wrapper DUT(
    .lvds_clk(lvds_clk),
    .AR_LIN_0(AR_LIN_0),
    .pressure(pressure),
    .lvds_data0(lvds_data0),
    .lvds_data1(lvds_data1),
    .lvds_gate(lvds_gate),
    .rst_n(rst_n),
    .key_0(key),
    .sys_clk(sys_clk)
);

always #10 sys_clk <= !sys_clk;

    initial begin
    sys_clk = 1;
    rst_n = 0;
    key = 1;
    #200
    rst_n = 1;
    AR_LIN_0 = 32'd896;
    
    #2000
    key = 0;
    #200
    key = 1;
    #200000
    
    
    
    $stop;
    
    
    end 
    
    
    // 监控和检查
    reg [15:0] data_cnt;
    reg [1:0] bit_count = 0;
    wire [7:0] data_byte;
	reg [3:0] data0 = 0;
	reg [3:0] data1 = 0;
    reg data_flag;
    reg prev_gate = 1'b0;  // 用于保存前一周期的门控信号值
	
	reg [31:0] data32;
    
   always @(negedge lvds_clk or negedge rst_n) begin
    if (!rst_n) begin
        bit_count <= 0;      // 接收位计数器清零
        prev_gate <= 1'b1;    // 上一拍门控信号置1
        data_flag <= 0;       // 双字节有效标志清零
        data_cnt <= 0;        // 数据计数器清零
    end 
    else begin
        prev_gate <= lvds_gate;  // 寄存门控信号

        // 检测同步头（lvds_gate=1）并移位数据
        if (lvds_gate == 1) begin
            data0 <= {lvds_data0,data0[3:1]};  // 拼接data0新数据
			data1 <= {lvds_data1,data1[3:1]};  
            bit_count <= bit_count + 1;                // 位计数器+1
        end 

        data_flag <= (bit_count == 3);  // 当接收满16bit时拉高标志

        // 数据计数器逻辑
        if (lvds_gate == 1 && prev_gate == 0)  // 门控信号上升沿时清零
            data_cnt <= 0;
        else if (data_flag) begin                    // 双字节有效时计数器+1
            data_cnt <= data_cnt + 1;
			
		end 
    end 
end

assign data_byte = {data1,data0};

	always @(negedge lvds_clk) begin
		data32 <= {data32[23:0],data_byte};
	end 
    
    //打印信息
    always @(negedge lvds_clk) begin
        //双字节数据 打印
        if (data_flag)begin
             $display("Time=%0t: Data = %h", $time, data_byte);
			//$display("Time=%0t: Data0 = %h,Data1 = %h", $time, data0,data1);
        end
        //检测同步头
        if (data32 == 32'h1ACFFC1D)
            $display("Time=%0t: Sync head detected!!!!!!!!!!   Sync head detected!!!!!!!!!!   Sync head detected!!!!!!!!!!", $time);
        // 检测门控上升沿（帧结束）
        if (lvds_gate == 0 && prev_gate == 1) 
            
            $display("Time=%0t: Frame end detected, total bytes=32'd%0d", $time, (data_cnt+1)*2-10);  //双字节计数，且有10字节不是数据        
    end 
    


endmodule
