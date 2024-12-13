module dht11_top(
	input clk,
	input rst_n,
	
	inout dht11,
	output v3_3,
	output [7:0] seg,
	output [2:0] sel	
);

	wire [31:0] data;
	wire [11:0] temp_seg,humi_seg;
		
	bin2bcd b1(
		.bin_in(data[31:24]),
		.bcd_out(humi_seg)
	);
	bin2bcd b2(
		.bin_in(data[15:8]),
		.bcd_out(temp_seg)
	);

	dht11_ctrl DUT(
		.clk(clk),
		.rst_n(rst_n),
		.data(data),
		.dht11(dht11)
	);

	seven_tube TUBE(
		.clk(clk),
		.rst_n(rst_n),
		.data_in({temp_seg[7:0],1'b0,1'b0,1'b0,data[7],4'hf,humi_seg[7:0]}),		//	[23:0] data_in
		.point(6'b010000),		//	[5:0] point
		.seg(seg),			//	[7:0] seg
		.sel(sel)			//	[2:0] sel
	);
	
	assign v3_3 = 1;
		
endmodule 