vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/1ddd/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/b2d0/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ec67/hdl" "+incdir+D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/soc/ip/soc_blk_mem_gen_0_0/sim/soc_blk_mem_gen_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/soc/ip/soc_axi_bram_ctrl_0_0/sim/soc_axi_bram_ctrl_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/1ddd/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/b2d0/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ec67/hdl" "+incdir+D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/soc/ip/soc_gen_data_0_0/sim/soc_gen_data_0_0.v" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/sim/bd_9a87.v" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_9a87_one_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_9a87_psr_aclk_0.vhd" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/1ddd/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/b2d0/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ec67/hdl" "+incdir+D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_9a87_arsw_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_9a87_rsw_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_9a87_awsw_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_9a87_wsw_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_9a87_bsw_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_9a87_s00mmu_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_9a87_s00tr_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_9a87_s00sic_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_9a87_s00a2s_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_9a87_sawn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_9a87_swn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_9a87_sbn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_9a87_s01mmu_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_9a87_s01tr_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_9a87_s01sic_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_9a87_s01a2s_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_9a87_sarn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_9a87_srn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_9a87_m00s2a_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_9a87_m00arn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_9a87_m00rn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_9a87_m00awn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_9a87_m00wn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_9a87_m00bn_0.sv" \
"../../../bd/soc/ip/soc_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_9a87_m00e_0.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/1ddd/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/b2d0/hdl/verilog" "+incdir+../../../../AXI_DMA_sim_base.srcs/sources_1/bd/soc/ipshared/ec67/hdl" "+incdir+D:/wyc/vivado2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/soc/ip/soc_smartconnect_0_0/sim/soc_smartconnect_0_0.v" \
"../../../bd/soc/ip/soc_axi_write_0_0/sim/soc_axi_write_0_0.v" \
"../../../bd/soc/ip/soc_fifo_generator_0_0/sim/soc_fifo_generator_0_0.v" \
"../../../bd/soc/ip/soc_axi_read_0_0/sim/soc_axi_read_0_0.v" \
"../../../bd/soc/ip/soc_fifo_generator_0_1/sim/soc_fifo_generator_0_1.v" \
"../../../bd/soc/sim/soc.v" \

vlog -work xil_defaultlib \
"glbl.v"

