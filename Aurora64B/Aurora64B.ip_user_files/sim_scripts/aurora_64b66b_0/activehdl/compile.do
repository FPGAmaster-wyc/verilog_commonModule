vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_aurora_lane.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_rx_startup_fsm.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_tx_startup_fsm.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_support.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_gt_common_wrapper.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_support_reset_logic.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_clock_module.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/example_design/aurora_64b66b_0_axi_to_drp.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_standard_cc_module.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_reset_logic.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_cdc_sync.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0_core.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_axi_to_ll.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_block_sync_sm.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_common_reset_cbcc.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_common_logic_cbcc.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_cbcc_gtx_6466.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_channel_err_detect.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_channel_init_sm.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_ch_bond_code_gen.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_64b66b_descrambler.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_err_detect.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_global_logic.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/example_design/gt/aurora_64b66b_0_wrapper.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_polarity_check.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_lane_init_sm.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_ll_to_axi.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/example_design/gt/aurora_64b66b_0_multi_wrapper.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_rx_ll_datapath.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_rx_ll.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_width_conversion.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_64b66b_scrambler.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_sym_dec.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_sym_gen.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/example_design/gt/aurora_64b66b_0_gtx.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_tx_ll_control_sm.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_tx_ll_datapath.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0/src/aurora_64b66b_0_tx_ll.v" \
"../../../../Aurora64B.srcs/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

