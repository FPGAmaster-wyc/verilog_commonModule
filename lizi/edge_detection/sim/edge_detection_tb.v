module edge_detection_tb;


	
	reg clk;
	reg rst_n;
	reg key_in;
	
	wire  pos_edge,neg_edge;

	edge_detection DUT(
		.clk(clk),
		.rst_n(rst_n),
		.key_in(key_in),
		.pos_edge(pos_edge),
		.neg_edge(neg_edge)
	);

	initial begin
		clk <= 1;
		rst_n <= 0;
		key_in <= 1;
		#201
		rst_n <= 1;
		#201
		key_in <= 0;
		#2000
		key_in <= 1;
		$stop;
	
	
	end
	
	always #10 clk <= ~clk;
endmodule 