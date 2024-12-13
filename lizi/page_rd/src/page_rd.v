module page_rd(clk_400khz,rst_n,scl,sda,rd_data,rd_en);
	
	input 					clk_400khz,rst_n;
		
	output reg 				scl;
	output reg	[7:0] 	rd_data;
	output reg				rd_en;
	inout 					sda;
		
	reg			[3:0] 	state;
	reg			[3:0] 	cnt;				//并转串计数器
	reg			[7:0]		data;				//地址，数据寄存器
	reg						en;				//sda的使能信号
	reg						sda_buff;
	reg			[13:0]	rd_cnt;
	
	
	//定义状态
	parameter S0					=4'd0;
	parameter CONTROL_BYTE		=4'd1;
	parameter ACK1					=4'd2;
	parameter ADDR_HIGH			=4'd3;
	parameter ACK2					=4'd4;	
	parameter ADDR_LOW			=4'd5;
	parameter ACK3					=4'd6;
	parameter START_READY		=4'd7;
	parameter RD_START			=4'd8;
	parameter RD_CTRL				=4'd9;
	parameter ACK4					=4'd10;
	parameter RD_DATA				=4'd11;
	parameter RD_ACK				=4'd12;
	parameter NO_ACK				=4'd13;
	parameter STOP_READY			=4'd14;
	parameter STOP					=4'd15;
	
	parameter data_ctrl 			= 8'b1010_000_0;
	parameter data_addr_high 	= 8'h0;
	parameter data_addr_low 	= 8'h0;
//	parameter data_byte_wr 		= 8'b1111_1111;
	parameter rd_ctrl_byte		= 8'b1010_0001;
	
	
	assign sda = (en) ? sda_buff : 1'bz;				//三态门（实现sda双向传输）
	
	
	//产生200khz的scl
	always @(negedge clk_400khz,negedge rst_n)
	begin
		if(!rst_n)
			scl <= 1'd1;
		else
			scl <= ~scl;
	end
	
	always @(posedge clk_400khz,negedge rst_n)
	begin
		if(!rst_n)
			begin
				state <= S0;
				en <= 1'd1;
				sda_buff <= 1'd1;
				data <= 8'd0;
				cnt <= 0;
				rd_data <= 8'd0;
				rd_en <= 0;
				rd_cnt <= 0;
			end
		else
			case(state)
				
				S0		:		begin
									if(scl == 1'd1)
										begin
											sda_buff <= 0;
											en <= 1'd1;
											data <= data_ctrl;
											state <= CONTROL_BYTE;
										end
									else
										state <= S0;
								end
								
	CONTROL_BYTE	:		begin
									if(scl == 0)
										if(cnt == 4'd8)
											begin
												state <= ACK1;
												cnt <= 0;
												en <= 0;
											end
										else
											begin
												cnt <= cnt + 1'd1;
												data <= {data[6:0],data[7]};
												sda_buff <= data[7];
											end
								end
								
				ACK1	:		begin
									if(scl == 1'd1)
										if(sda == 0)
											begin
												state <= ADDR_HIGH;
												data <= data_addr_high;
											end
									else
										state <= S0;
								end
								
		ADDR_HIGH	:		begin
									en <= 1;
									if(scl == 0)
										if(cnt == 4'd8)
											begin
												state <= ACK2;
												cnt <= 0;
												en <= 0;
											end
										else
											begin
												cnt <= cnt + 1'd1;
												data <= {data[6:0],data[7]};
												sda_buff <= data[7];
											end
								end
								
				ACK2	:		begin
									if(scl == 1'd1)
										if(sda == 0)
											begin
												state <= ADDR_LOW;
												data <= data_addr_low;
											end
									else
										state <= S0;
								end
								
			ADDR_LOW	:		begin
									en <= 1;
									if(scl == 0)
										if(cnt == 4'd8)
											begin
												state <= ACK3;
												cnt <= 0;
												en <= 0;
											end
										else
											begin
												cnt <= cnt + 1'd1;
												data <= {data[6:0],data[7]};
												sda_buff <= data[7];
											end
								end
								
				ACK3	:		begin
									if(scl == 1'd1)
										if(sda == 0)
											state <= START_READY;
									else
										state <= S0;
								end
								
		START_READY	:		begin
									if(scl == 0)
										begin
											state <= RD_START;
											sda_buff <= 1'd1;
											en <= 1;
										end
									else	
										state <= START_READY;
								end
		RD_START		:		begin
									if(scl == 1'd1)
										begin
											sda_buff <= 0;
											state <= RD_CTRL;
											data <= rd_ctrl_byte;
										end
									else
										state <= RD_START;
								end
			RD_CTRL	:		begin
									if(scl == 0)
										if(cnt == 4'd8)
											begin
												state <= ACK4;
												cnt <= 0;
												en <= 0;
											end
										else
											begin
												cnt <= cnt + 1'd1;
												data <= {data[6:0],data[7]};
												sda_buff <= data[7];
											end
									else	
										state <= RD_CTRL;
								end
								
				ACK4	:		begin
									if(scl == 1'd1)
										if(sda == 0)
											state <= RD_DATA;
									else
										state <= S0;
								end	
			
			RD_DATA	:		begin
									en <= 0;
									if(scl == 1 && cnt < 4'd8 && rd_cnt < 14'd8192)
											begin
												cnt <= cnt + 1'd1;
												data <= {data[6:0],sda};
											end
									else if(cnt == 4'd8 && rd_cnt < 14'd8192)
											begin
												cnt <= 0;
												rd_data <= data;
												rd_cnt <= rd_cnt + 1'd1;
												state <= RD_ACK;
												en <= 1;
												sda_buff <= 0;
												rd_en <= 1;
											end
									else if(cnt == 4'd8 && rd_cnt == 14'd8192)
											begin
												rd_cnt <= 0;
												cnt <= 0;
												rd_data <= data;
												state <= NO_ACK;
												en <= 1;
												sda_buff <= 1;
											end
									else
										state <= RD_DATA;
								end
								
			RD_ACK	:		begin
									if(scl == 1'd1)
										if(sda == 1'd0)
											begin
												state <= RD_DATA;
												rd_en <= 0;
											end
									else
										state <= RD_ACK;
								end
								
			NO_ACK	:		begin
									if(scl == 1'd1)
										if(sda == 1'd1)
											state <= STOP_READY;
									else
										state <= NO_ACK;
								end
	
		STOP_READY	:		begin
									if(scl == 0)
										begin
											state <= STOP;
											sda_buff <= 0;
											en <= 1;
										end
								end
				
				STOP	:		begin
									if(scl == 1)
										begin
											sda_buff <= 1;
											state <= STOP;
										end
								end
								
				default	:		state <= S0;	
			endcase
	end

endmodule 