 module	page_rd_top(clk,rst_n,sda,scl,q);
	
	input clk,rst_n;
	
	output scl;
	output [7:0] q;
	
	inout sda;
	
	wire	clk_400khz;
//	wire	clk_800khz;
	wire 	locked;
	wire	rd_en;
	
	wire  [7:0] rd_data;
	reg [12:0] address;
 
	//分频 c0：400khz
	my_pll my_pll_dut(
	.areset(~rst_n),
	.inclk0(clk),
	.c0(clk_400khz),
//	.c1(clk_800khz),
	.locked(locked)
	);
	
	//读的控制
	page_rd page_rd_dut(
	.clk_400khz(clk_400khz),
	.rst_n(locked),
	.rd_data(rd_data),
	.rd_en(rd_en),
	.scl(scl),
	.sda(sda)
	);
	
	always @(posedge rd_en,negedge rst_n)
	begin
		if(!rst_n)
			address <= 0;
		else
			address <= address + 1'd1;
	end

	my_ram my_ram_dut(
	.address(address),
	.clock(rd_en),
	.data(rd_data),
	.wren(1'd1),
	.q(q)
	);
 
 
 endmodule 