`timescale 1ns/1ps
module bcd_top_tb;
	
	reg [7:0] bin;
	
	wire [11:0] bcd;
	
	
	
	
	bcd_top dut(
				.bin(bin),
				.bcd(bcd)
				);
				
				
	

	initial begin 
		bin = 0;
		#20
		
		repeat(20)
			begin
				bin = {$random} % 256;
				#20;
			end 
		#200 $stop;
	end 

	
	
endmodule 