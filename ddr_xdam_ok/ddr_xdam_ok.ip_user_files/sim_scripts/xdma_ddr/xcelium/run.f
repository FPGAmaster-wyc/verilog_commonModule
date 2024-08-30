-makelib xcelium_lib/xilinx_vip -sv \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "e:/my_work/QT7013/vivado2019/OK/ddr_xdam_ok/ddr_xdam_ok.srcs/sources_1/bd/xdma_ddr/ip/xdma_ddr_xdma_0_0/xdma_ddr_xdma_0_0_sim_netlist.v" \
  "e:/my_work/QT7013/vivado2019/OK/ddr_xdam_ok/ddr_xdam_ok.srcs/sources_1/bd/xdma_ddr/ip/xdma_ddr_util_ds_buf_1/xdma_ddr_util_ds_buf_1_sim_netlist.v" \
  "e:/my_work/QT7013/vivado2019/OK/ddr_xdam_ok/ddr_xdam_ok.srcs/sources_1/bd/xdma_ddr/ip/xdma_ddr_axi_bram_ctrl_0_0/xdma_ddr_axi_bram_ctrl_0_0_sim_netlist.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../ddr_xdam_ok.srcs/sources_1/bd/xdma_ddr/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/xdma_ddr/ip/xdma_ddr_blk_mem_gen_0_0/sim/xdma_ddr_blk_mem_gen_0_0.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_addr_decode.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_read.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg_bank.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_top.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_write.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_ar_channel.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_aw_channel.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_b_channel.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_arbiter.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_fsm.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_translator.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_fifo.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_incr_cmd.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_r_channel.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_simple_fifo.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wrap_cmd.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wr_cmd_fsm.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_w_channel.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axic_register_slice.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_register_slice.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_upsizer.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_a_upsizer.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_and.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_and.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_or.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_or.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_command_fifo.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel_static.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_r_upsizer.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_w_upsizer.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_axi.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/xdma_ddr_mig_7series_0_0_mig_sim.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_mig_7series_0_0/xdma_ddr_mig_7series_0_0/user_design/rtl/xdma_ddr_mig_7series_0_0.v" \
  "e:/my_work/QT7013/vivado2019/OK/ddr_xdam_ok/ddr_xdam_ok.srcs/sources_1/bd/xdma_ddr/ip/xdma_ddr_axi_smc_0/xdma_ddr_axi_smc_0_sim_netlist.v" \
  "../../../bd/xdma_ddr/ip/xdma_ddr_rst_mig_7series_0_100M_0/xdma_ddr_rst_mig_7series_0_100M_0_sim_netlist.v" \
  "../../../bd/xdma_ddr/sim/xdma_ddr.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

