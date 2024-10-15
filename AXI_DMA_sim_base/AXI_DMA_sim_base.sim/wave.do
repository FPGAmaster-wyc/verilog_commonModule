onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DATA /tb_top/DUT/soc_i/gen_data_0/clk
add wave -noupdate -expand -group DATA /tb_top/DUT/soc_i/gen_data_0/rst_n
add wave -noupdate -expand -group DATA -radix unsigned /tb_top/DUT/soc_i/gen_data_0/tdata
add wave -noupdate -expand -group DATA /tb_top/DUT/soc_i/gen_data_0/tvalid
add wave -noupdate -expand -group DATA /tb_top/DUT/soc_i/gen_data_0/tlast
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/s_aclk
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/s_aresetn
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/s_axis_tvalid
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/s_axis_tready
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/s_axis_tdata
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/s_axis_tlast
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/m_axis_tvalid
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/m_axis_tready
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/m_axis_tdata
add wave -noupdate -expand -group FIFO /tb_top/DUT/soc_i/fifo_generator_0/m_axis_tlast
add wave -noupdate -group WR /tb_top/DUT/soc_i/axi_write_0/S_WR_aclk
add wave -noupdate -group WR /tb_top/DUT/soc_i/axi_write_0/S_WR_aresetn
add wave -noupdate -group WR /tb_top/DUT/soc_i/axi_write_0/m_axi_awid
add wave -noupdate -group WR -expand -group AW /tb_top/DUT/soc_i/axi_write_0/m_axi_awaddr
add wave -noupdate -group WR -expand -group AW /tb_top/DUT/soc_i/axi_write_0/m_axi_awvalid
add wave -noupdate -group WR -expand -group AW /tb_top/DUT/soc_i/axi_write_0/m_axi_awready
add wave -noupdate -group WR -expand -group W -radix unsigned /tb_top/DUT/soc_i/axi_write_0/m_axi_wdata
add wave -noupdate -group WR -expand -group W /tb_top/DUT/soc_i/axi_write_0/m_axi_wvalid
add wave -noupdate -group WR -expand -group W /tb_top/DUT/soc_i/axi_write_0/m_axi_wready
add wave -noupdate -group WR -expand -group W /tb_top/DUT/soc_i/axi_write_0/m_axi_wlast
add wave -noupdate -group WR -group B /tb_top/DUT/soc_i/axi_write_0/m_axi_bresp
add wave -noupdate -group WR -group B /tb_top/DUT/soc_i/axi_write_0/m_axi_bvalid
add wave -noupdate -group WR -group B /tb_top/DUT/soc_i/axi_write_0/m_axi_bready
add wave -noupdate -group WR -expand -group IN -radix unsigned /tb_top/DUT/soc_i/axi_write_0/S_WR_tdata
add wave -noupdate -group WR -expand -group IN /tb_top/DUT/soc_i/axi_write_0/S_WR_tvalid
add wave -noupdate -group WR -expand -group IN /tb_top/DUT/soc_i/axi_write_0/S_WR_tready
add wave -noupdate -group WR -expand -group IN /tb_top/DUT/soc_i/axi_write_0/S_WR_tlast
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awlen
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awsize
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awburst
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_aclk
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_aresetn
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awlock
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awcache
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_wstrb
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_bid
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awprot
add wave -noupdate -group WR -group X /tb_top/DUT/soc_i/axi_write_0/m_axi_awqos
add wave -noupdate -group RD /tb_top/DUT/soc_i/axi_read_0/i_wr_done
add wave -noupdate -group RD /tb_top/DUT/soc_i/axi_read_0/m_axi_aclk
add wave -noupdate -group RD /tb_top/DUT/soc_i/axi_read_0/m_axi_aresetn
add wave -noupdate -group RD -expand -group OUT /tb_top/DUT/soc_i/axi_read_0/M_RD_aclk
add wave -noupdate -group RD -expand -group OUT /tb_top/DUT/soc_i/axi_read_0/M_RD_aresetn
add wave -noupdate -group RD -expand -group OUT /tb_top/DUT/soc_i/axi_read_0/M_RD_tdata
add wave -noupdate -group RD -expand -group OUT /tb_top/DUT/soc_i/axi_read_0/M_RD_tready
add wave -noupdate -group RD -expand -group OUT /tb_top/DUT/soc_i/axi_read_0/M_RD_tvalid
add wave -noupdate -group RD -expand -group OUT /tb_top/DUT/soc_i/axi_read_0/M_RD_tlast
add wave -noupdate -group RD -expand -group R /tb_top/DUT/soc_i/axi_read_0/m_axi_rdata
add wave -noupdate -group RD -expand -group R /tb_top/DUT/soc_i/axi_read_0/m_axi_rvalid
add wave -noupdate -group RD -expand -group R /tb_top/DUT/soc_i/axi_read_0/m_axi_rready
add wave -noupdate -group RD -expand -group R /tb_top/DUT/soc_i/axi_read_0/m_axi_rlast
add wave -noupdate -group RD -expand -group AR /tb_top/DUT/soc_i/axi_read_0/m_axi_araddr
add wave -noupdate -group RD -expand -group AR /tb_top/DUT/soc_i/axi_read_0/m_axi_arvalid
add wave -noupdate -group RD -expand -group AR /tb_top/DUT/soc_i/axi_read_0/m_axi_arready
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arlen
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arsize
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arburst
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arid
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arlock
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arcache
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arprot
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_arqos
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_rid
add wave -noupdate -group RD -group X /tb_top/DUT/soc_i/axi_read_0/m_axi_rresp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1019437 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {33064500 ps}
