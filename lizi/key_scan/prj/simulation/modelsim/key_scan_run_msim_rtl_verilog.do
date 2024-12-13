transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0730/key_scan/src {C:/Users/86188/Desktop/FPGA/0730/key_scan/src/seven_tube.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0730/key_scan/src {C:/Users/86188/Desktop/FPGA/0730/key_scan/src/key_scan_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0730/key_scan/src {C:/Users/86188/Desktop/FPGA/0730/key_scan/src/key_scan.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0730/key_scan/src {C:/Users/86188/Desktop/FPGA/0730/key_scan/src/beep_ctrl.v}

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0730/key_scan/prj/../sim {C:/Users/86188/Desktop/FPGA/0730/key_scan/prj/../sim/key_scan_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  key_scan_tb

add wave *
view structure
view signals
run -all
