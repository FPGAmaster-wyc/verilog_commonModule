transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_wr/prj {C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/my_pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_wr/src {C:/Users/86188/Desktop/FPGA/0816/page_wr/src/page_wr.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_wr/src {C:/Users/86188/Desktop/FPGA/0816/page_wr/src/page_wr_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/db {C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/db/my_pll_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/../sim {C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/../sim/page_wr_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/../sim {C:/Users/86188/Desktop/FPGA/0816/page_wr/prj/../sim/M24LC64.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  page_wr_tb

add wave *
view structure
view signals
run -all
