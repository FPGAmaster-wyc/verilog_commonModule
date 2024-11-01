//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Tue Oct 15 17:09:03 2024
//Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
//Command     : generate_target soc_wrapper.bd
//Design      : soc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module soc_wrapper
   (clk_100M,
    i_wr_done,
    rst_n);
  input clk_100M;
  input i_wr_done;
  input rst_n;

  wire clk_100M;
  wire i_wr_done;
  wire rst_n;

  soc soc_i
       (.clk_100M(clk_100M),
        .i_wr_done(i_wr_done),
        .rst_n(rst_n));
endmodule
