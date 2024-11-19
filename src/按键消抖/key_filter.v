////////////////////////////////////////////////////////////////////////////////
// File:	axi_lite_regfile.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	��������ģ��
//
////////////////////////////////////////////////////////////////////////////////

module  key_filter(
    input   wire    sys_clk     ,   //ϵͳʱ��50Mhz
    input   wire    sys_rst_n   ,   //ȫ�ָ�λ
    input   wire    key_in      ,   //���������ź� ������Ϊ�͵�ƽ��

    output  reg     key_flag        //key_flagΪ1ʱ��ʾ�������⵽����������
                                    //key_flagΪ0ʱ��ʾû�м�⵽����������
);

    parameter CNT_MAX = 20'd999_999;    //�������������ֵ
    //parameter CNT_MAX = 20'd3;    //����

    reg     [19:0]  cnt_20ms    ;       //������

    //cnt_20ms:���ʱ�ӵ������ؼ�⵽�ⲿ���������ֵΪ�͵�ƽʱ����������ʼ����
    always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            cnt_20ms <= 20'b0;
        else    if(key_in == 1'b1)
            cnt_20ms <= 20'b0;
        else    if(cnt_20ms == CNT_MAX && key_in == 1'b0)
            cnt_20ms <= cnt_20ms;
        else
            cnt_20ms <= cnt_20ms + 1'b1;

    //key_flag:��������20ms�����������Ч��־λ
    //��key_flag��999_999ʱ����,ά��һ��ʱ�ӵĸߵ�ƽ
    always@(posedge sys_clk or negedge sys_rst_n) begin
        if(sys_rst_n == 1'b0)
            key_flag <= 1'b0;
        else    if(cnt_20ms == CNT_MAX - 1'b1)
            key_flag <= 1'b1;
        else
            key_flag <= 1'b0;
    end 

endmodule
