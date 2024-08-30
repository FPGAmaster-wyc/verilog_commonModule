vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -sv \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../Aurora64B.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v" \

vlog -work xil_defaultlib \
"glbl.v"

