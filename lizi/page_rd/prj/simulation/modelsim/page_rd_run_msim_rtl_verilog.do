transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/prj {C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/my_pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/src {C:/Users/86188/Desktop/FPGA/0816/page_rd/src/page_rd_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/src {C:/Users/86188/Desktop/FPGA/0816/page_rd/src/page_rd.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/prj {C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/my_ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/db {C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/db/my_pll_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/../sim {C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/../sim/page_rd_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/../sim {C:/Users/86188/Desktop/FPGA/0816/page_rd/prj/../sim/M24LC64.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  page_rd_tb

add wave *
view structure
view signals
run -all
