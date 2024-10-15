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
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_blk_mem_gen_0_0/sim/soc_blk_mem_gen_0_0.v" \
-endlib
-makelib xcelium_lib/axi_bram_ctrl_v4_1_2 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/a002/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_axi_bram_ctrl_0_0/sim/soc_axi_bram_ctrl_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_gen_data_0_0/sim/soc_gen_data_0_0.v" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/sim/bd_9a87.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_6 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_9a87_one_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_9a87_psr_aclk_0.vhd" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_9a87_arsw_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_9a87_rsw_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_9a87_awsw_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_9a87_wsw_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_9a87_bsw_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/2508/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_9a87_s00mmu_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_9a87_s00tr_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_9a87_s00sic_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_9a87_s00a2s_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_9a87_sawn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_9a87_swn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_9a87_sbn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_9a87_s01mmu_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_9a87_s01tr_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_9a87_s01sic_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_9a87_s01a2s_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_9a87_sarn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_9a87_srn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_9a87_m00s2a_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_9a87_m00arn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_9a87_m00rn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_9a87_m00awn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_9a87_m00wn_0.sv" \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_9a87_m00bn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/901a/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_9a87_m00e_0.sv" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_20 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_6 -sv \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_smartconnect_0_0/sim/soc_smartconnect_0_0.v" \
  "../../../bd/soc/ip/soc_axi_write_0_0/sim/soc_axi_write_0_0.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/soc/ip/soc_fifo_generator_0_0/sim/soc_fifo_generator_0_0.v" \
  "../../../bd/soc/ip/soc_axi_read_0_0/sim/soc_axi_read_0_0.v" \
  "../../../bd/soc/ip/soc_fifo_generator_0_1/sim/soc_fifo_generator_0_1.v" \
  "../../../bd/soc/sim/soc.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

