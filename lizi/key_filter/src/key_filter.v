//按键消抖   (按下为低电平)
module key_filter(clk,rst_n,key_in,key_out);

	input clk;
	input rst_n;
	input key_in;
	
	output reg key_out;
	
	parameter t = 50_000_000 / 100 - 1;
	
	parameter s0 = 1'b0;
	parameter s1 = 1'b1;
	
	reg state;
	reg q1,q2;
	reg [31:0] cnt;
	
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				state <= s0;
				key_out <= 1;
				cnt <= 0;
			end
		else
			case(state)
				
				s0:	begin
							if(key_in == 1)
								state <= s0;
							else
								begin
									if(cnt == t)
										begin
											cnt <= 0;
											state <= s1;
											key_out <= 0;
										end
									else
										begin
											cnt <= cnt + 1;
											state <= s0;
											key_out <= 1;
										end
								end
						end
				
				s1:	begin
							if(key_in == 0)
								state <= s1;
							else
								begin
									if(cnt == t)
										begin
											cnt <= 0;
											state <= s0;
											key_out <= 1;
										end
									else
										begin
											cnt <= cnt + 1;
											state <= s1;
											key_out <= 0;
										end
								end
						end
				default: state = s0;
			endcase		
	end
endmodule
