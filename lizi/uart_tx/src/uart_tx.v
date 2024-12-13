module uart_tx(rd_data,rst_n,rd_req,rd_empty,uart_clk,txd);

	input			uart_clk,rst_n;
	input			rd_empty;
	input	[7:0] rd_data;
	
	output 	reg 	rd_req;
	output 	reg 	txd;
	
	reg			state;
	reg	[7:0]	cnt;
	reg	[7:0] data_temp;
	
	parameter	s0 = 1'd0;
	parameter	s1 = 1'd1;
	
	always @(posedge uart_clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				cnt <= 8'd192;
				state <= s0;
			end
		else
			case(state)
				
				s0		:		begin
									if(cnt >= 8'd192 && rd_empty == 0)
										begin
											cnt <= 0;
											state <= s1;
										end
									else
										state <= s0;
								end
				
				s1		:		begin
									if(cnt == 8'd192)
										begin
											cnt <= cnt;
											state <= s0;
										end
									else
										cnt <= cnt + 1'd1;
								end
			endcase
	end
	
	always @(posedge uart_clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				txd <= 1'd1;
				rd_req <= 1'd0;
				data_temp <= 0;
			end
		else if(cnt >= 8'd192 && rd_empty == 0)
			rd_req <= 1'd1;
		else
			case(cnt)
				
				0			:		begin rd_req <= 0; txd <= 0; end
				1			:		data_temp <= rd_data;
				
				1 * 16	:		txd <= data_temp[0];
				2 * 16	:		txd <= data_temp[1];
				3 * 16	:		txd <= data_temp[2];
				4 * 16	:		txd <= data_temp[3];
				5 * 16	:		txd <= data_temp[4];
				6 * 16	:		txd <= data_temp[5];
				7 * 16	:		txd <= data_temp[6];
				8 * 16	:		txd <= data_temp[7];
				
				9 * 16	:		txd <= 1'd1;
			
			endcase
	
	end
endmodule 