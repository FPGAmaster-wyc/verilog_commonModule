module page_wr_ctrl(clk_400khz,rst_n,scl,sda);
	
	input 				clk_400khz,rst_n;
		
	output reg 			scl;
	inout 				sda;
		
	reg		[3:0] 	state;
	reg		[3:0] 	cnt;				//并转串计数器
	reg		[7:0]		data;				//地址，数据寄存器
	reg					en;				//sda的使能信号
	reg					sda_buff;
	reg   	[12:0]	addr;				//地址
	reg		[7:0]		data_cnt;		//字节计数
	reg		[8:0]		page_cnt;		//页计数
	reg		[10:0]	delay_cnt;		//延迟时间
	
	//定义状态
	parameter S0					=4'd0;
	parameter CONTROL_BYTE		=4'd1;
	parameter ACK1					=4'd2;
	parameter ADDR_HIGH			=4'd3;
	parameter ACK2					=4'd4;	
	parameter ADDR_LOW			=4'd5;
	parameter ACK3					=4'd6;
	parameter WR_DATA				=4'd7;
	parameter ACK4					=4'd8;
	parameter STOP_READY			=4'd9;
	parameter STOP					=4'd10;
	parameter DELAY				=4'd11;
	
	parameter data_ctrl 			= 8'b1010_000_0;
	
	
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
				data_cnt <= 0;
				addr <= 0;
				delay_cnt <= 0;
				page_cnt <= 0;
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
												data <= {3'd0,addr[12:8]};
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
												data <= addr[7:0];
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
											if(data_cnt < 8'd32)
												begin
													state <= WR_DATA;
													data_cnt <= data_cnt + 1'd1;
													data <= data_cnt;
												end
											else
												begin
													state <= STOP_READY;
													data_cnt <= 0;
												end
								end
								
			WR_DATA	:		begin
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
								
		STOP_READY	:		begin
									if(scl == 0)
										begin
											en <= 1;
											state <= STOP;
											sda_buff <= 0;
										end
								end
				
				STOP	:		begin
									if(scl == 1)
										begin
											sda_buff <= 1;
											state <= DELAY;
										end
								end
				DELAY :		begin
									if(page_cnt < 8'd255)
										begin
											if(delay_cnt == 11'd1999)
												begin
													delay_cnt <= 0;
													page_cnt <= page_cnt + 1'd1;
													state <= S0;
													addr <= addr + 13'd32;
												end
											else
												begin
													delay_cnt <= delay_cnt + 1'd1;
												end
										
										end
									else
										state <= DELAY;
								end
								
				default	:		state <= S0;	
			endcase
	end

endmodule 