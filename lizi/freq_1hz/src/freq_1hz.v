//分频 1hz
module freq_1hz(clk,rst_n,clk_1hz);
	
	input clk,rst_n;
	
	output reg clk_1hz;
	
	parameter t = 50_000_000/2;
	
	reg [31:0] cnt;
	
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				cnt <= 0;
				clk_1hz <= 0;
			end
		else
			if(cnt < t-1)
				begin
					cnt <= cnt + 1;
					clk_1hz <= clk_1hz;
				end
			else
				begin
					cnt <= 0;
					clk_1hz <= ~clk_1hz;
				end
	end

endmodule 