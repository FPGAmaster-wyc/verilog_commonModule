module uart_rx(clk,rst_n,rxd,rx_data,rx_flag,rx_addr);
	
	input 					clk,rst_n;
	input 					rxd;
	
	output	reg [7:0]		rx_data;
	output	reg 			rx_flag;
	output	reg [14:0]		rx_addr;
	
	reg			 [7:0]		cnt;
	reg						state;
	
	parameter	s0 = 1'b0;
	parameter 	s1 = 1'b1;
	
	//节拍计数
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				cnt <= 0;
				state <= s0;
			end
		else
			case(state)
				
				s0		:		begin
									if(rxd == 1'd0)
										state <= s1;
									else
										state <= s0;
								end
				
				s1		:		begin
									if(cnt == 8'd154)
										begin
											state <= s0;
											cnt <= 8'd0;
										end
									else
										cnt <= cnt + 1'd1;
								end
				default	:	state <= s0;
			endcase
	end
	
	//节拍对应发生动作
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				rx_data <= 0;
				rx_flag <= 0;
			end
		else
			case(cnt)
				
				7+1*16		:		rx_data[0]	<=	rxd; 
				7+2*16		:		rx_data[1]	<=	rxd; 
				7+3*16		:		rx_data[2]	<=	rxd; 
				7+4*16		:		rx_data[3]	<=	rxd; 
				
				7+5*16		:		rx_data[4]	<=	rxd; 
				7+6*16		:		rx_data[5]	<=	rxd; 
				7+7*16		:		rx_data[6]	<=	rxd; 
				7+8*16		:		rx_data[7]	<=	rxd; 
				
				7+9*16+1		:		rx_flag		<=	1'd1;
				7+9*16+2		:		rx_flag		<=	1'd0;
			endcase
	end
	
	//接收的地址
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			rx_addr <= 0;
		else
			if(rx_flag && rx_addr == 15'd29999)
				rx_addr <= 0;
			else if(rx_flag)
				rx_addr <= rx_addr + 1'd1;
	end
	
endmodule 
