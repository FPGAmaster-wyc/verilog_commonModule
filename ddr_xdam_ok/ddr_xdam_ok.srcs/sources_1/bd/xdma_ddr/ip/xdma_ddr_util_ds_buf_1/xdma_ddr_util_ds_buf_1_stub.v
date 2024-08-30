// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Apr 26 10:06:46 2024
// Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/my_work/QT7013/vivado2019/OK/ddr_xdam_ok/ddr_xdam_ok.srcs/sources_1/bd/xdma_ddr/ip/xdma_ddr_util_ds_buf_1/xdma_ddr_util_ds_buf_1_stub.v
// Design      : xdma_ddr_util_ds_buf_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z100ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "util_ds_buf,Vivado 2019.2" *)
module xdma_ddr_util_ds_buf_1(IBUF_DS_P, IBUF_DS_N, IBUF_OUT, IBUF_DS_ODIV2)
/* synthesis syn_black_box black_box_pad_pin="IBUF_DS_P[0:0],IBUF_DS_N[0:0],IBUF_OUT[0:0],IBUF_DS_ODIV2[0:0]" */;
  input [0:0]IBUF_DS_P;
  input [0:0]IBUF_DS_N;
  output [0:0]IBUF_OUT;
  output [0:0]IBUF_DS_ODIV2;
endmodule
