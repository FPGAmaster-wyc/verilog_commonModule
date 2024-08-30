// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Jun 18 09:45:54 2024
// Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/my_work/CSDN/Aurora64B/Aurora64B.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z100ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *)
module fifo_generator_0(wr_rst_busy, rd_rst_busy, s_aclk, s_aresetn, 
  s_axis_tvalid, s_axis_tready, s_axis_tdata, s_axis_tlast, m_axis_tvalid, m_axis_tready, 
  m_axis_tdata, m_axis_tlast)
/* synthesis syn_black_box black_box_pad_pin="wr_rst_busy,rd_rst_busy,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tlast" */;
  output wr_rst_busy;
  output rd_rst_busy;
  input s_aclk;
  input s_aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  input s_axis_tlast;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output m_axis_tlast;
endmodule
