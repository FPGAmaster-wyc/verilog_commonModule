module bin2bcd(bin_in,bcd_out);

	input				[7:0]			   bin_in;		//BIN码输入
	
	output	reg	[11:0]			bcd_out;		//BCD码输出

	reg[19:0]   bin2bcd_reg;
	
	integer   i;
	//--------------BIN转BCD码--------------
	always @(*) begin
		bin2bcd_reg = {12'd0,bin_in};
		
		for(i = 0 ; i < 8 ; i = i + 1)
			begin
			if(bin2bcd_reg[19:16] > 4'd4)								//>4 + 3
				bin2bcd_reg[19:16] = bin2bcd_reg[19:16] + 4'd3;
			
			if(bin2bcd_reg[15:12] > 4'd4 )							//>4 + 3
				bin2bcd_reg[15:12] = bin2bcd_reg[15:12] + 4'd3; 
			
			if( bin2bcd_reg[11:8] > 4'd4 ) 							//>4 + 3
				 bin2bcd_reg[11:8] =  bin2bcd_reg[11:8] + 4'd3;

			
			bin2bcd_reg = bin2bcd_reg << 1;							//左移1位
			
			end
			
		bcd_out = {bin2bcd_reg[19:8]};								//取高12位
			
	end
	//--------------BIN转BCD码--------------

endmodule
