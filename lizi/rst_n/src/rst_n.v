module rst_n(
	input clk,
	input rst_n,
	input a,
	
	output reg b

);

/******异步复位**同步释放*********begin*****/
	reg sys_rst_n;
	
	always @ (posedge clk) begin
		if (!rst_n)
			sys_rst_n <= 0;
		else
			sys_rst_n <= rst_n;
	
	end
/******异步复位**同步释放*********end******/	
	
	always @ (posedge clk, negedge sys_rst_n)
	begin
		if (!sys_rst_n)
			b <= 0;
		else
			b <= a;
	
	end 	
	
endmodule 