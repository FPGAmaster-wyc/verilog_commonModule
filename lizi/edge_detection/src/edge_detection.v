//按键消抖+边沿检测 （按键一次，生成一个flag）
/*
edge_detection KEY0(	
		.clk(),
		.rst_n(),
		.key_in(),
		.pos_edge(),
		.neg_edge()
	);
*/
module edge_detection(clk,rst_n,key_in,pos_edge,neg_edge);

	input clk;
	input rst_n;
	input key_in;
	
	output pos_edge,neg_edge;
	
	reg key_out;
	
	// parameter t = 50_000_000 / 100_000_0 - 1;   //仿真
	parameter t = 50_000_000 / 100 - 1;   //下板
	
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
	
	//2个D触发器
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				q1 <= 1'b1;
				q2 <= 1'b1;
			end
		else
			begin
				q1 <= key_out;
				q2 <= q1;
			end
	end
	
	
	assign pos_edge = q1 && (~q2);
	assign neg_edge = (~q1) && q2;

endmodule
