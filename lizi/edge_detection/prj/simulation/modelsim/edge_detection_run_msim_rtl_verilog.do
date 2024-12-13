transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA/lizi/edge_detection/src {D:/FPGA/lizi/edge_detection/src/edge_detection.v}

vlog -vlog01compat -work work +incdir+D:/FPGA/lizi/edge_detection/prj/../sim {D:/FPGA/lizi/edge_detection/prj/../sim/edge_detection_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  edge_detection_tb

add wave *
view structure
view signals
run -all
