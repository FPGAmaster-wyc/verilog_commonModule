////////////////////////////////////////////////////////////////////////////////
// File:	edge_detector.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	edge_detector module.
/*
edge_detector u_edge_detector(
    .clk         ( clk         ),
    .rst_n       ( rst_n       ),
    .signal_in   ( signal_in   ),
    .rising_edge ( rising_edge ),
    .falling_edge  ( falling_edge  )
);
*/
//
module edge_detector (
    input wire clk,
    input wire rst_n,
    input wire signal_in,
    output reg rising_edge,
    output reg falling_edge
);
    reg signal_in_d;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            signal_in_d <= 1'b0;
            rising_edge <= 1'b0;
            falling_edge <= 1'b0;
        end 
        else begin
            signal_in_d <= signal_in;                   // 记录上一个时钟周期的输入信号
            rising_edge <= signal_in & ~signal_in_d;    // 检测上升沿
            falling_edge <= ~signal_in & signal_in_d;   // 检测下降沿
        end 
    end
endmodule
