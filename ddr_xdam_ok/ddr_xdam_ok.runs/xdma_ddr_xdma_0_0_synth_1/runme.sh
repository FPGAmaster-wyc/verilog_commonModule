#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/wyc/vivado2019.2/Vitis/2019.2/bin;D:/wyc/vivado2019.2/Vivado/2019.2/ids_lite/ISE/bin/nt64;D:/wyc/vivado2019.2/Vivado/2019.2/ids_lite/ISE/lib/nt64:D:/wyc/vivado2019.2/Vivado/2019.2/bin
else
  PATH=D:/wyc/vivado2019.2/Vitis/2019.2/bin;D:/wyc/vivado2019.2/Vivado/2019.2/ids_lite/ISE/bin/nt64;D:/wyc/vivado2019.2/Vivado/2019.2/ids_lite/ISE/lib/nt64:D:/wyc/vivado2019.2/Vivado/2019.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='E:/my_work/QT7013/vivado2019/OK/ddr_xdam_ok/ddr_xdam_ok.runs/xdma_ddr_xdma_0_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log xdma_ddr_xdma_0_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source xdma_ddr_xdma_0_0.tcl
