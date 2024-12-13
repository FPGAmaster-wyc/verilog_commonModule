transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/lizi/freq_ji/prj {C:/Users/86188/Desktop/FPGA/lizi/freq_ji/prj/freq_ji.v}

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/lizi/freq_ji/prj/../sim {C:/Users/86188/Desktop/FPGA/lizi/freq_ji/prj/../sim/freq_ji_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  freq_ji_tb

add wave *
view structure
view signals
run -all
