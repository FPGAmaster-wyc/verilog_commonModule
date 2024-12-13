/********奇分频模板************/
/********2022.7.26************/
/********王亚闯************/
module freq_ji(clk,rst_n,clk_out);

	input clk,rst_n;
	
	output clk_out;
	
	reg [2:0] cnt;
	reg [2:0] cnt1;
	
	parameter t = 5;          //奇分频数    例如：t=5  即：5分频
	wire clk_v1,clk_v2;
	
	//上升沿的1高2低
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			cnt <= 1'b0;
		else
			if(cnt == t - 1)
				cnt <= 1'b0;
			else
				cnt <= cnt + 1'b1;	
	end
	
	assign clk_v1 = (cnt < t / 2)? 1'b1 : 1'b0;
	
	//下降沿的1高2低
	always @(negedge clk,negedge rst_n)
	begin
		if(!rst_n)
			cnt1 <= 1'b0;
		else
			if(cnt1 == t - 1)
				cnt1 <= 1'b0;
			else
				cnt1 <= cnt1 + 1'b1;	
	end
	
	assign clk_v2 = (cnt1 < t / 2)? 1'b1 : 1'b0;
	
	assign clk_out = clk_v1 | clk_v2;



endmodule
	