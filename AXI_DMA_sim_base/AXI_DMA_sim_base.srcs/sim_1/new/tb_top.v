`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/11 14:50:34
// Design Name: 
// Module Name: tb_top
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


module tb_top;

    reg clk_100M;
    reg key;
    reg rst_n;
    reg i_wr_done;

    soc_wrapper DUT
       (.clk_100M(clk_100M),
       .i_wr_done(i_wr_done),
       .key(key),
        .rst_n(rst_n)
        );
        
    always #5 clk_100M = ~clk_100M;
 
    initial begin
    clk_100M = 1;
    rst_n = 0;
    i_wr_done = 0;
    key = 1;
    
    #201
    rst_n = 1;
    
    #200
    
    #200
    key = 0;
    #200
    key = 1;
    
    
    #1288
    i_wr_done = 1;
    @ (posedge clk_100M)
    i_wr_done = 0;
    
    #1288
    i_wr_done = 1;
    @ (posedge clk_100M)
    i_wr_done = 0;
    
    
    #30000
    
    $stop;
    
    
    
    end 



endmodule
