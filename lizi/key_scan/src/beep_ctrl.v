module beep_ctrl(clk,rst_n,key_valid,beep);
	
	input clk,rst_n;
	input key_valid;
	
	output  beep;
	
	reg	[31:0]		cnt_15k;
	reg    				clk_15k;
	
	reg	[31:0]		cnt_1s;
	wire     			clk_1hz;
	
	parameter t1 = 50_000_000 / 15_000_0  - 1;
	parameter t2 = 50_000_000 / 10   - 1;
	
	always @ (posedge clk, negedge rst_n)	begin
		if(rst_n == 1'b0)	
			cnt_1s <= t2;
		else	if(key_valid == 1'b1)
			cnt_1s <= 32'd0;
		else	if(cnt_1s < t2)	
			cnt_1s <= cnt_1s + 1'd1;
		else
			cnt_1s <= t2;
	end
	
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)	begin
			cnt_15k <= 1'b0;
			clk_15k <= 1'b0;
		end
		else
			if(cnt_15k == t1)
				begin	
					cnt_15k <= 1'b0;
					clk_15k <= ~clk_15k;
				end
			else	begin
				cnt_15k <= cnt_15k + 1'b1;
			end
	end
	
	assign	beep = (cnt_1s < t2) ? clk_15k : 1'b0;
	
//	always @(posedge clk,negedge rst_n)
//	begin
//		if(!rst_n)
//			cnt_1s <= 1'b0;
//		else
//			if(cnt_1s == t2)
//				cnt_1s <= 1'b0;
//			else
//				cnt_1s <= cnt_1s + 1'b1;
//	end
//
//	assign  clk_1hz= (clk_1hz < t2 / 2)?1'b1:1'b0;
//	
//	always @(posedge clk,negedge rst_n)
//	begin
//		if(!rst_n)
//			cnt_15k <= 1'b0;
//		else
//			if(cnt_15k == t1)
//				cnt_15k <= 1'b0;
//			else
//				cnt_15k <= cnt_15k + 1'b1;
//	end
//	assign  clk_15k= (cnt_15k < t1 / 2)?1'b1:1'b0;
//	
//	
//	always @(posedge clk_1hz,negedge rst_n)
//	begin
//		if(!rst_n)
//			beep <= 1'b1;
//		else
//			if(key_valid)
//				beep <= clk_15k;
//	end

endmodule 