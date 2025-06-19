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
    
    
    // ��غͼ��
    reg [15:0] data_cnt;
    reg [1:0] bit_count = 0;
    wire [7:0] data_byte;
	reg [3:0] data0 = 0;
	reg [3:0] data1 = 0;
    reg data_flag;
    reg prev_gate = 1'b0;  // ���ڱ���ǰһ���ڵ��ſ��ź�ֵ
	
	reg [31:0] data32;
    
   always @(negedge lvds_clk or negedge rst_n) begin
    if (!rst_n) begin
        bit_count <= 0;      // ����λ����������
        prev_gate <= 1'b1;    // ��һ���ſ��ź���1
        data_flag <= 0;       // ˫�ֽ���Ч��־����
        data_cnt <= 0;        // ���ݼ���������
    end 
    else begin
        prev_gate <= lvds_gate;  // �Ĵ��ſ��ź�

        // ���ͬ��ͷ��lvds_gate=1������λ����
        if (lvds_gate == 1) begin
            data0 <= {lvds_data0,data0[3:1]};  // ƴ��data0������
			data1 <= {lvds_data1,data1[3:1]};  
            bit_count <= bit_count + 1;                // λ������+1
        end 

        data_flag <= (bit_count == 3);  // ��������16bitʱ���߱�־

        // ���ݼ������߼�
        if (lvds_gate == 1 && prev_gate == 0)  // �ſ��ź�������ʱ����
            data_cnt <= 0;
        else if (data_flag) begin                    // ˫�ֽ���Чʱ������+1
            data_cnt <= data_cnt + 1;
			
		end 
    end 
end

assign data_byte = {data1,data0};

	always @(negedge lvds_clk) begin
		data32 <= {data32[23:0],data_byte};
	end 
    
    //��ӡ��Ϣ
    always @(negedge lvds_clk) begin
        //˫�ֽ����� ��ӡ
        if (data_flag)begin
             $display("Time=%0t: Data = %h", $time, data_byte);
			//$display("Time=%0t: Data0 = %h,Data1 = %h", $time, data0,data1);
        end
        //���ͬ��ͷ
        if (data32 == 32'h1ACFFC1D)
            $display("Time=%0t: Sync head detected!!!!!!!!!!   Sync head detected!!!!!!!!!!   Sync head detected!!!!!!!!!!", $time);
        // ����ſ������أ�֡������
        if (lvds_gate == 0 && prev_gate == 1) 
            
            $display("Time=%0t: Frame end detected, total bytes=32'd%0d", $time, (data_cnt+1)*2-10);  //˫�ֽڼ���������10�ֽڲ�������        
    end 
    


endmodule
