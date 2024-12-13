module key_scan(clk,rst_n,row,col,key_num,key_valid);

	input clk,rst_n;
	input [3:0] row;   		 	 					//行信号	
	
	output reg [3:0] col;       					//列信号
	output reg [3:0] key_num;   					//数码管显示的总数值
	output reg key_valid;       					//有按键按下的标志信号
	
	reg	[1:0] state;
	reg   [31:0] cnt;
	reg	[7:0] row_col;       					//具体的哪一个按键
	wire	t10ms;
	
	parameter t = 50_000_000 / 100 - 1;     	//消抖时间
	
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	

	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				state <= s0;
				col <= 4'd0;
				row_col <= 8'd0;
				key_valid <= 1'b0;
				cnt <= 1'b0;
			end
		else
			case(state)
				
				s0		:		begin
									if(row == 4'b1111)       			//没有按键按下
										begin
											state <= s0;
										end
									else 
										begin									//按下消抖
											if(cnt == t)
												begin
													col <= 4'b0111;      //第一次扫描
													state <= s1;
													cnt <= 1'b0;
												end
											else
												begin
													state <= s0;
													cnt <= cnt + 1'b1;
												end
										end
								end
								
				s1		:		begin
									if(row != 4'b1111)         //不==4‘b1111 说明按键在这一列					
										begin
											key_valid <= 1'b1;
											row_col <= {row,col};  		//标记哪个按键
											state <= s2;
											col <= 4'b0;           		//给列全为0，为了下一步判断是否有按键抬起
										end
									else
										begin
											col <= {col[0],col[3:1]};  //换一列扫描
											state <= s1;
										end
								end
				
				s2		:		begin
									key_valid <= 1'b0;					//抬起消抖
									if(row != 4'b1111)
										state <= s2;
									else
										begin
											if(cnt == t)
												begin
													key_valid <= 1'b0;
													state <= s0;
													cnt <= 1'b0;
												end
											else
												begin
													state <= s2;
													cnt <= cnt + 1'b1;
												end
										end
								
								end
			endcase
	end
	
	//译码
	always @(*)
	begin
		if(!rst_n)
			key_num <= 4'd0;
		else
			case(row_col)
				
				8'b1110_1110	:		key_num <= 4'd0;  //'0'
				8'b1110_1101	:		key_num <= 4'd1;  //'1'
				8'b1110_1011	:		key_num <= 4'd2;  //'2'
				8'b1110_0111	:		key_num <= 4'd3;  //'3'
			
				8'b1101_1110	:		key_num <= 4'd4;  //'4'
				8'b1101_1101	:		key_num <= 4'd5;  //'5'
				8'b1101_1011	:		key_num <= 4'd6;  //'6'
				8'b1101_0111	:		key_num <= 4'd7;  //'7'
				
				8'b1011_1110	:		key_num <= 4'd8;  //'8'
				8'b1011_1101	:		key_num <= 4'd9;  //'9'
				8'b1011_1011	:		key_num <= 4'd10;  //'a'
				8'b1011_0111	:		key_num <= 4'd11;  //'b'
				
				8'b0111_1110	:		key_num <= 4'd12;  //'c'
				8'b0111_1101	:		key_num <= 4'd13;  //'d'
				8'b0111_1011	:		key_num <= 4'd14;  //'e'
				8'b0111_0111	:		key_num <= 4'd15;  //'f'
				
				default			:		key_num <= 4'd0;
			endcase
	
	end

endmodule 