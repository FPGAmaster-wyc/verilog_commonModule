//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Fri Apr 26 10:05:09 2024
//Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
//Command     : generate_target xdma_ddr_wrapper.bd
//Design      : xdma_ddr_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module xdma_ddr_wrapper
   (DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_cs_n,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    PL_DDR3_CLK_clk_n,
    PL_DDR3_CLK_clk_p,
    pcie_clk_clk_n,
    pcie_clk_clk_p,
    pcie_rst_n,
    pcie_rxn,
    pcie_rxp,
    pcie_txn,
    pcie_txp);
  output [14:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [0:0]DDR3_cs_n;
  output [7:0]DDR3_dm;
  inout [63:0]DDR3_dq;
  inout [7:0]DDR3_dqs_n;
  inout [7:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  input PL_DDR3_CLK_clk_n;
  input PL_DDR3_CLK_clk_p;
  input [0:0]pcie_clk_clk_n;
  input [0:0]pcie_clk_clk_p;
  input pcie_rst_n;
  input [3:0]pcie_rxn;
  input [3:0]pcie_rxp;
  output [3:0]pcie_txn;
  output [3:0]pcie_txp;

  wire [14:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [0:0]DDR3_cs_n;
  wire [7:0]DDR3_dm;
  wire [63:0]DDR3_dq;
  wire [7:0]DDR3_dqs_n;
  wire [7:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire PL_DDR3_CLK_clk_n;
  wire PL_DDR3_CLK_clk_p;
  wire [0:0]pcie_clk_clk_n;
  wire [0:0]pcie_clk_clk_p;
  wire pcie_rst_n;
  wire [3:0]pcie_rxn;
  wire [3:0]pcie_rxp;
  wire [3:0]pcie_txn;
  wire [3:0]pcie_txp;

  xdma_ddr xdma_ddr_i
       (.DDR3_addr(DDR3_addr),
        .DDR3_ba(DDR3_ba),
        .DDR3_cas_n(DDR3_cas_n),
        .DDR3_ck_n(DDR3_ck_n),
        .DDR3_ck_p(DDR3_ck_p),
        .DDR3_cke(DDR3_cke),
        .DDR3_cs_n(DDR3_cs_n),
        .DDR3_dm(DDR3_dm),
        .DDR3_dq(DDR3_dq),
        .DDR3_dqs_n(DDR3_dqs_n),
        .DDR3_dqs_p(DDR3_dqs_p),
        .DDR3_odt(DDR3_odt),
        .DDR3_ras_n(DDR3_ras_n),
        .DDR3_reset_n(DDR3_reset_n),
        .DDR3_we_n(DDR3_we_n),
        .PL_DDR3_CLK_clk_n(PL_DDR3_CLK_clk_n),
        .PL_DDR3_CLK_clk_p(PL_DDR3_CLK_clk_p),
        .pcie_clk_clk_n(pcie_clk_clk_n),
        .pcie_clk_clk_p(pcie_clk_clk_p),
        .pcie_rst_n(pcie_rst_n),
        .pcie_rxn(pcie_rxn),
        .pcie_rxp(pcie_rxp),
        .pcie_txn(pcie_txn),
        .pcie_txp(pcie_txp));
endmodule
