module clk_1hz(clk,rst_n,clk1hz);
	
	input clk,rst_n;
	
	output clk1hz;
	
	
	reg  [31:0] cnt;
	
	parameter t = 50_000_000 / 1000 - 1;
	
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			cnt <= 0;
			
		else
			if(cnt <= t)
				cnt <= 0;
			else
				cnt <= cnt + 1'b1;
	end
	
	assign clk1hz = (cnt < t / 2)?1'b1:1'b0;

endmodule 