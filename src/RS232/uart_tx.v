////////////////////////////////////////////////////////////////////////////////
// File:	uart_tx.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	rs232 uart_tx module.
//
/*
uart_tx#(
    .UART_BPS   ( 9600 ),        //串口波特率
    .CLK_FREQ   ( 50_000_000 )   //时钟频率
)u_uart_tx(
    .sys_clk    ( sys_clk    ), //系统时钟50MHz
    .sys_rst_n  ( sys_rst_n  ),  //全局复位
    .pi_data    ( pi_data    ),  //模块输入的8bit数据
    .pi_flag    ( pi_flag    ),  //并行数据有效标志信号
    .tx         ( tx         )   //串转并后的1bit数据
);

*/
////////////////////////////////////////////////////////////////////////////////

module  uart_tx
#(
    parameter   UART_BPS    =   9600,         //串口波特率
    parameter   CLK_FREQ    =   50_000_000    //时钟频率
)
(
     input   wire            sys_clk     ,   //系统时钟50MHz
     input   wire            sys_rst_n   ,   //全局复位
     input   wire    [7:0]   pi_data     ,   //模块输入的8bit数据
     input   wire            pi_flag     ,   //并行数据有效标志信号
 
     output  reg             tx              //串转并后的1bit数据
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
//work_en:接收数据工作使能信号
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            work_en <= 1'b0;
        else    if(pi_flag == 1'b1)
            work_en <= 1'b1;
        else    if((bit_flag == 1'b1) && (bit_cnt == 4'd10))
            work_en <= 1'b0;

//baud_cnt:波特率计数器计数，从0计数到BAUD_CNT_MAX - 1
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            baud_cnt <= 13'b0;
        else    if((baud_cnt == BAUD_CNT_MAX - 1) || (work_en == 1'b0))
            baud_cnt <= 13'b0;
        else    if(work_en == 1'b1)
            baud_cnt <= baud_cnt + 1'b1;

//bit_flag:当baud_cnt计数器计数到1时让bit_flag拉高一个时钟的高电平
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            bit_flag <= 1'b0;
        else    if(baud_cnt == 13'd1)
            bit_flag <= 1'b1;
        else
            bit_flag <= 1'b0;

//bit_cnt:数据位数个数计数，10个有效数据（含起始位和停止位）到来后计数器清零
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        bit_cnt <= 4'b0;
    else    if((bit_flag == 1'b1) && (bit_cnt == 4'd10))
        bit_cnt <= 4'b0;
    else    if((bit_flag == 1'b1) && (work_en == 1'b1))
        bit_cnt <= bit_cnt + 1'b1;

//tx:输出数据在满足rs232协议（起始位为0，停止位为1）的情况下一位一位输出
always@(posedge sys_clk or negedge sys_rst_n)
        if(sys_rst_n == 1'b0)
            tx <= 1'b1; //空闲状态时为高电平
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
