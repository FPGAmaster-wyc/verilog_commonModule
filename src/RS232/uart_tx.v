////////////////////////////////////////////////////////////////////////////////
// File:	uart_tx.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	rs232 uart_tx module.
//
/*
uart_tx#(
    .UART_BPS   ( 9600 ),        //���ڲ�����
    .CLK_FREQ   ( 50_000_000 )   //ʱ��Ƶ��
)u_uart_tx(
    .sys_clk    ( sys_clk    ), //ϵͳʱ��50MHz
    .sys_rst_n  ( sys_rst_n  ),  //ȫ�ָ�λ
    .pi_data    ( pi_data    ),  //ģ�������8bit����
    .pi_flag    ( pi_flag    ),  //����������Ч��־�ź�
    .tx         ( tx         )   //��ת�����1bit����
);

*/
////////////////////////////////////////////////////////////////////////////////

module  uart_tx
#(
    parameter   UART_BPS    =   9600,         //���ڲ�����
    parameter   CLK_FREQ    =   50_000_000    //ʱ��Ƶ��
)
(
     input   wire            sys_clk     ,   //ϵͳʱ��50MHz
     input   wire            sys_rst_n   ,   //ȫ�ָ�λ
     input   wire    [7:0]   pi_data     ,   //ģ�������8bit����
     input   wire            pi_flag     ,   //����������Ч��־�ź�
 
     output  reg             tx              //��ת�����1bit����
);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//localparam    define
localparam  BAUD_CNT_MAX    =   CLK_FREQ/UART_BPS   ;

//reg   define
reg [12:0]  baud_cnt;
reg         bit_flag;
reg [3:0]   bit_cnt ;
reg         work_en ;

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//
//work_en:�������ݹ���ʹ���ź�
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            work_en <= 1'b0;
        else    if(pi_flag == 1'b1)
            work_en <= 1'b1;
        else    if((bit_flag == 1'b1) && (bit_cnt == 4'd10))
            work_en <= 1'b0;

//baud_cnt:�����ʼ�������������0������BAUD_CNT_MAX - 1
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            baud_cnt <= 13'b0;
        else    if((baud_cnt == BAUD_CNT_MAX - 1) || (work_en == 1'b0))
            baud_cnt <= 13'b0;
        else    if(work_en == 1'b1)
            baud_cnt <= baud_cnt + 1'b1;

//bit_flag:��baud_cnt������������1ʱ��bit_flag����һ��ʱ�ӵĸߵ�ƽ
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            bit_flag <= 1'b0;
        else    if(baud_cnt == 13'd1)
            bit_flag <= 1'b1;
        else
            bit_flag <= 1'b0;

//bit_cnt:����λ������������10����Ч���ݣ�����ʼλ��ֹͣλ�����������������
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        bit_cnt <= 4'b0;
    else    if((bit_flag == 1'b1) && (bit_cnt == 4'd10))
        bit_cnt <= 4'b0;
    else    if((bit_flag == 1'b1) && (work_en == 1'b1))
        bit_cnt <= bit_cnt + 1'b1;

//tx:�������������rs232Э�飨��ʼλΪ0��ֹͣλΪ1���������һλһλ���
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            tx <= 1'b1; //����״̬ʱΪ�ߵ�ƽ
        else    if(bit_flag == 1'b1)
            case(bit_cnt)
                0       : tx <= 1'b0;
                1       : tx <= pi_data[0];
                2       : tx <= pi_data[1];
                3       : tx <= pi_data[2];
                4       : tx <= pi_data[3];
                5       : tx <= pi_data[4];
                6       : tx <= pi_data[5];
                7       : tx <= pi_data[6];
                8       : tx <= pi_data[7];
                9       : tx <= 1'b1;
                10      : tx <= 1'b1;
                default : tx <= 1'b1;
            endcase

endmodule
