////////////////////////////////////////////////////////////////////////////////
// File:	tb_top.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Simulation file example program.
//
////////////////////////////////////////////////////////////////////////////////

module tb_top;

    reg sys_clk, clk, fifo_clk;
    reg user_rst_n;
    reg rxd;
    reg lvds_data0, lvds_data1, lvds_flag;
    reg user_irq_ack;

    soc_wrapper DUT(
    .clk            ( clk            ),
    .fifo_clk       ( fifo_clk       ),
    .lvds_data0     ( lvds_data0     ),
    .lvds_data1     ( lvds_data1     ),
    .lvds_flag      ( lvds_flag      ),
    .rxd            ( rxd            ),
    .sys_clk        ( sys_clk        ),
    .user_irq_ack   ( user_irq_ack ),
    .user_rst_n     ( user_rst_n     )
);

    always #25 clk = ~clk;
    always #10 fifo_clk = ~fifo_clk;
    always #10 sys_clk = !sys_clk;

    reg [7:0] data = 8'h1;
    integer i = 0,j = 0;
    
    
    //��ʼ��ϵͳʱ�ӡ�ȫ�ָ�λ�������ź�
    initial begin
            sys_clk    = 1'b1;
            clk        = 1;
            fifo_clk   = 1;
            rxd        = 1'b1;
            user_rst_n = 1'b0;

            lvds_data0 = 1'b0;
            lvds_data1 = 1'b0;
            lvds_flag  = 1'b0;

            #20;
            user_rst_n = 1'b1;

            #300000;
            $stop;
    end  

    
    
    
    //ģ�ⷢ��lvds����
    initial begin
            #2000
            @ (posedge clk);
            lvds_flag <= 1;
            sim_lvds(16'd896);  //����896������
            lvds_flag <= 0;

            #1000;
            @ (posedge clk);
            lvds_flag <= 1;
            sim_lvds(16'd896);  //����896������
            lvds_flag <= 0;

    end

    task sim_lvds(
        //���ݵ������еĲ��������������ʱ����ⲿ������һ��16λ��ֵ
        input   [15:0]   data_num
    );

        integer i,j;        //����һ������

        //��forѭ������һ֡���ݣ�for���������ִ�е�����ֻ��дi=i+1
        //������д��C����i=i++����ʽ
        for(i=0; i<data_num; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                lvds_data0 = data[j];
                lvds_data1 = data[j+4];
                @ (posedge clk);                //��ʱһ��ʱ������
            end
            data = data + 1;
        end
    endtask //������endtask����





    /*
    task rx_bit(
    //���ݵ������еĲ��������������ʱ����ⲿ������һ��8λ��ֵ
        input   [7:0]   data
    );
    
        integer i;      //����һ������
    //��forѭ������һ֡���ݣ�for���������ִ�е�����ֻ��дi=i+1
    //������д��C����i=i++����ʽ
            for(i=0; i<10; i=i+1) begin
                case(i)
                    0: rxd <= 1'b0;
                    1: rxd <= data[0];
                    2: rxd <= data[1];
                    3: rxd <= data[2];
                    4: rxd <= data[3];
                    5: rxd <= data[4];
                    6: rxd <= data[5];
                    7: rxd <= data[6];
                    8: rxd <= data[7];
                    9: rxd <= 1'b1;
                endcase
                #(434*20); //ÿ����1λ������ʱ434��ʱ������   (50M / 115200)
            end
    endtask         //������endtask����

    */
    



endmodule
