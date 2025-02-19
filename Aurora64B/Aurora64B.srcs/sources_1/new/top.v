`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// File:	top.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Aurora64B66 invocation and implementation
//
////////////////////////////////////////////////////////////////////////////////

module top(
    //system port
    input   i_sys_clk   ,        // 50M clk
    input   i_sys_rst_n ,

    // GT clk
    input   i_gtclk_p   ,
    input   i_gtclk_n   ,

    //GT I/O
    input   i_rxp,
    input   i_rxn,
    output  o_txp,
    output  o_txn,

    //state port
    output  channel_up  ,
    output  lane_up     
);

    wire clk_100M, clk_200M, locked;
    get_clk_PLL#(
        .CLK_DEVICE ( "MMCM" )      // Mode selection (MMCM or PLL)
    )u_get_clk_PLL(
        .reset    ( ~i_sys_rst_n    ),     // clock reset
        .clk_in   ( i_sys_clk   ),     // input clock
        .clk_out0 ( clk_100M ),     // output clock0 100M
        .clk_out1 ( clk_200M ),     // output clock1 200M
        .locked   ( locked   )      // output locked   
    );

    wire reset_pb, pma_init;
    pma_init_get u_pma_init_get(
        .reset    ( ~locked  ),
        .init_clk ( clk_100M ),
        .reset_pb ( reset_pb ),
        .pma_init ( pma_init )
    );

    wire user_clk;      // aurora 数据输出时钟

    wire fifo_valid,fifo_last, fifo_ready;
    wire [63:0] fifo_data;

    wire [63 : 0] s_axi_tx_tdata;
    wire [7 : 0] s_axi_tx_tkeep;
    wire s_axi_tx_tlast;
    wire s_axi_tx_tvalid;
    wire s_axi_tx_tready;

    wire [63 : 0] m_axi_rx_tdata;
    wire [7 : 0] m_axi_rx_tkeep;
    wire m_axi_rx_tlast;
    wire m_axi_rx_tvalid;

    GenData u_GenData(
        .clk   ( user_clk   ),
        .rst_n ( ~locked ),
        .valid ( fifo_valid ),
        .last  ( fifo_last  ),
        .data  ( fifo_data  )
    );

    fifo_generator_0 TX_FIFO (
        .wr_rst_busy( ),      // output wire wr_rst_busy
        .rd_rst_busy( ),      // output wire rd_rst_busy
        .s_aclk(user_clk),                // input wire s_aclk

        .s_aresetn(locked),          // input wire s_aresetn
        .s_axis_tvalid(fifo_valid),  // input wire s_axis_tvalid
        .s_axis_tready( ),  // output wire s_axis_tready
        .s_axis_tdata(fifo_data),    // input wire [63 : 0] s_axis_tdata
        .s_axis_tlast(fifo_last),    // input wire s_axis_tlast

        .m_axis_tvalid(s_axi_tx_tvalid),  // output wire m_axis_tvalid
        .m_axis_tready(s_axi_tx_tready),  // input wire m_axis_tready
        .m_axis_tdata(s_axi_tx_tdata),    // output wire [63 : 0] m_axis_tdata
        .m_axis_tlast(s_axi_tx_tlast)    // output wire m_axis_tlast
    );
	
	

    aurora_64b66b_0 Aurora64B (
    // TX DATA pass
    .s_axi_tx_tdata(s_axi_tx_tdata),                    // input wire [63 : 0] s_axi_tx_tdata
    .s_axi_tx_tkeep(8'hFF),                             // input wire [7 : 0] s_axi_tx_tkeep
    .s_axi_tx_tlast(s_axi_tx_tlast),                    // input wire s_axi_tx_tlast
    .s_axi_tx_tvalid(s_axi_tx_tvalid),                  // input wire s_axi_tx_tvalid
    .s_axi_tx_tready(s_axi_tx_tready),                  // output wire s_axi_tx_tready

    // RX DATA pass
    .m_axi_rx_tdata(m_axi_rx_tdata),                    // output wire [63 : 0] m_axi_rx_tdata
    .m_axi_rx_tkeep(m_axi_rx_tkeep),                    // output wire [7 : 0] m_axi_rx_tkeep
    .m_axi_rx_tlast(m_axi_rx_tlast),                    // output wire m_axi_rx_tlast
    .m_axi_rx_tvalid(m_axi_rx_tvalid),                  // output wire m_axi_rx_tvalid

    //clk port    
    .gt_refclk1_p(i_gtclk_p),                           // input wire gt_refclk1_p
    .gt_refclk1_n(i_gtclk_n),                           // input wire gt_refclk1_n
    .init_clk(clk_100M),                                // input wire init_clk
    .drp_clk_in(clk_100M),                              // input wire drp_clk_in
    .user_clk_out(user_clk),                            // output wire user_clk_out

    // reset port
    .reset_pb(reset_pb),                                // input wire reset_pb
    .pma_init(pma_init),                                // input wire pma_init

    // GT I/O
    .rxp(i_rxp),                                          // input wire [0 : 0] rxp
    .rxn(i_rxn),                                          // input wire [0 : 0] rxn
    .txp(o_txp),                                          // output wire [0 : 0] txp
    .txn(o_txn),                                          // output wire [0 : 0] txn    

    // status
    .channel_up(channel_up),                            // output wire channel_up
    .lane_up(lane_up),                                  // output wire [0 : 0] lane_up

    // some outputs port
    .power_down('b0),                                   // input wire power_down   
    .loopback('b0),                                     // input wire [2 : 0] loopback
    .tx_out_clk( ),                                     // output wire tx_out_clk
    .sys_reset_out( ),                                  // output wire sys_reset_out
    .gt_reset_out( ),                                   // output wire gt_reset_out
    .gt_refclk1_out( ),                                  // output wire gt_refclk1_out
    .sync_clk_out( ),                                   // output wire sync_clk_out    
    .s_axi_awaddr('b0),                        // input wire [31 : 0] s_axi_awaddr
    .s_axi_rresp( ),                          // output wire [1 : 0] s_axi_rresp
    .s_axi_bresp( ),                          // output wire [1 : 0] s_axi_bresp
    .s_axi_wstrb('b0),                          // input wire [3 : 0] s_axi_wstrb
    .s_axi_wdata('b0),                          // input wire [31 : 0] s_axi_wdata
    .s_axi_araddr('b0),                        // input wire [31 : 0] s_axi_araddr
    .s_axi_rdata( ),                          // output wire [31 : 0] s_axi_rdata
    .qpll_drpaddr_in('b0),                  // input wire [7 : 0] qpll_drpaddr_in
    .qpll_drpdi_in('b0),                      // input wire [15 : 0] qpll_drpdi_in
    .s_axi_bready('b0),                        // input wire s_axi_bready
    .s_axi_awvalid('b0),                      // input wire s_axi_awvalid
    .s_axi_awready( ),                      // output wire s_axi_awready
    .s_axi_wvalid('b0),                        // input wire s_axi_wvalid
    .s_axi_wready( ),                        // output wire s_axi_wready
    .s_axi_bvalid( ),                        // output wire s_axi_bvalid
    .s_axi_arvalid('b0),                      // input wire s_axi_arvalid
    .s_axi_arready( ),                      // output wire s_axi_arready
    .s_axi_rvalid('b0),                        // output wire s_axi_rvalid
    .s_axi_rready('b0),                        // input wire s_axi_rready
    .qpll_drprdy_out( ),                  // output wire qpll_drprdy_out
    .qpll_drpen_in('b0),                      // input wire qpll_drpen_in
    .qpll_drpwe_in('b0),                      // input wire qpll_drpwe_in
    .qpll_drpdo_out( ),                    // output wire [15 : 0] qpll_drpdo_out 
    .link_reset_out( ),                    // output wire link_reset_out
    .gt_qpllclk_quad1_out( ),        // output wire gt_qpllclk_quad1_out
    .gt_qpllrefclk_quad1_out( ),  // output wire gt_qpllrefclk_quad1_out
    .gt_rxcdrovrden_in('b0),              // input wire gt_rxcdrovrden_in
    .hard_err( ),                                       // output wire hard_err
    .soft_err( ),                                       // output wire soft_err
    .gt_pll_lock( ),                                    // output wire gt_pll_lock
    .mmcm_not_locked_out( ),                            // output wire mmcm_not_locked_out
    .gt_qpllrefclklost_out( ),                          // output wire gt_qpllrefclklost_out
    .gt_qplllock_out( )                                // output wire gt_qplllock_out
);

    ila_0 ILA (
        .clk(user_clk), // input wire clk
        .probe0({   m_axi_rx_tdata,m_axi_rx_tkeep,m_axi_rx_tlast,m_axi_rx_tvalid,
                    s_axi_tx_tdata,s_axi_tx_tkeep,s_axi_tx_tlast,s_axi_tx_tvalid,s_axi_tx_tready
                }) // input wire [127:0] probe0
    );

endmodule
