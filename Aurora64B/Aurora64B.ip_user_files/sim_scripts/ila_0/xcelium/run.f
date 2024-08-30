-makelib xcelium_lib/xpm -sv \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/wyc/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Aurora64B.srcs/sources_1/ip/ila_0/sim/ila_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

