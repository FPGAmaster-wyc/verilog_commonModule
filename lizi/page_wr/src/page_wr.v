module page_wr(clk,rst_n,sda,scl);

	input clk,rst_n;
	
	output scl;
	inout sda;
	
	
	wire		clk_400khz,clk_800khz;
	wire		locked;
	
	//c0:400khz
	my_pll my_pll_dut(
	.areset(~rst_n),
	.inclk0(clk),
	.c0(clk_400khz),
	.c1(clk_800khz),
	.locked(locked)
	);
	
	
	//页写
	page_wr_ctrl page_wr_ctrl_dut(
	.clk_400khz(clk_400khz),
	.rst_n(locked),
	.scl(scl),
	.sda(sda)
	);


endmodule 