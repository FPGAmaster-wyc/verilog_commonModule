// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Jun 17 16:06:31 2024
// Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/my_work/CSDN/Aurora64B/Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0_stub.v
// Design      : aurora_64b66b_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z100ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "aurora_64b66b_v12_0_1, Coregen v14.3_ip3, Number of lanes = 1, Line rate is double10.3125Gbps, Reference Clock is double156.25MHz, Interface is Framing, Flow Control is None and is operating in DUPLEX configuration" *)
module aurora_64b66b_0(s_axi_tx_tdata, s_axi_tx_tlast, 
  s_axi_tx_tkeep, s_axi_tx_tvalid, s_axi_tx_tready, m_axi_rx_tdata, m_axi_rx_tlast, 
  m_axi_rx_tkeep, m_axi_rx_tvalid, rxp, rxn, txp, txn, gt_refclk1_p, gt_refclk1_n, gt_refclk1_out, 
  hard_err, soft_err, channel_up, lane_up, user_clk_out, mmcm_not_locked_out, sync_clk_out, 
  reset_pb, gt_rxcdrovrden_in, power_down, loopback, pma_init, gt_pll_lock, drp_clk_in, 
  s_axi_awaddr, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, 
  s_axi_wready, s_axi_bvalid, s_axi_bresp, s_axi_bready, s_axi_araddr, s_axi_arvalid, 
  s_axi_arready, s_axi_rdata, s_axi_rvalid, s_axi_rresp, s_axi_rready, qpll_drpaddr_in, 
  qpll_drpdi_in, qpll_drpdo_out, qpll_drprdy_out, qpll_drpen_in, qpll_drpwe_in, init_clk, 
  link_reset_out, gt_qpllclk_quad1_out, gt_qpllrefclk_quad1_out, gt_qpllrefclklost_out, 
  gt_qplllock_out, sys_reset_out, gt_reset_out, tx_out_clk)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[63:0],s_axi_tx_tlast,s_axi_tx_tkeep[7:0],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[63:0],m_axi_rx_tlast,m_axi_rx_tkeep[7:0],m_axi_rx_tvalid,rxp[0:0],rxn[0:0],txp[0:0],txn[0:0],gt_refclk1_p,gt_refclk1_n,gt_refclk1_out,hard_err,soft_err,channel_up,lane_up[0:0],user_clk_out,mmcm_not_locked_out,sync_clk_out,reset_pb,gt_rxcdrovrden_in,power_down,loopback[2:0],pma_init,gt_pll_lock,drp_clk_in,s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bvalid,s_axi_bresp[1:0],s_axi_bready,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rvalid,s_axi_rresp[1:0],s_axi_rready,qpll_drpaddr_in[7:0],qpll_drpdi_in[15:0],qpll_drpdo_out[15:0],qpll_drprdy_out,qpll_drpen_in,qpll_drpwe_in,init_clk,link_reset_out,gt_qpllclk_quad1_out,gt_qpllrefclk_quad1_out,gt_qpllrefclklost_out,gt_qplllock_out,sys_reset_out,gt_reset_out,tx_out_clk" */;
  input [63:0]s_axi_tx_tdata;
  input s_axi_tx_tlast;
  input [7:0]s_axi_tx_tkeep;
  input s_axi_tx_tvalid;
  output s_axi_tx_tready;
  output [63:0]m_axi_rx_tdata;
  output m_axi_rx_tlast;
  output [7:0]m_axi_rx_tkeep;
  output m_axi_rx_tvalid;
  input [0:0]rxp;
  input [0:0]rxn;
  output [0:0]txp;
  output [0:0]txn;
  input gt_refclk1_p;
  input gt_refclk1_n;
  output gt_refclk1_out;
  output hard_err;
  output soft_err;
  output channel_up;
  output [0:0]lane_up;
  output user_clk_out;
  output mmcm_not_locked_out;
  output sync_clk_out;
  input reset_pb;
  input gt_rxcdrovrden_in;
  input power_down;
  input [2:0]loopback;
  input pma_init;
  output gt_pll_lock;
  input drp_clk_in;
  input [31:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output s_axi_bvalid;
  output [1:0]s_axi_bresp;
  input s_axi_bready;
  input [31:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output s_axi_rvalid;
  output [1:0]s_axi_rresp;
  input s_axi_rready;
  input [7:0]qpll_drpaddr_in;
  input [15:0]qpll_drpdi_in;
  output [15:0]qpll_drpdo_out;
  output qpll_drprdy_out;
  input qpll_drpen_in;
  input qpll_drpwe_in;
  input init_clk;
  output link_reset_out;
  output gt_qpllclk_quad1_out;
  output gt_qpllrefclk_quad1_out;
  output gt_qpllrefclklost_out;
  output gt_qplllock_out;
  output sys_reset_out;
  output gt_reset_out;
  output tx_out_clk;
endmodule
