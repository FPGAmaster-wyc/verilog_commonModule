module vga_ctrl(vga_clk,locked,vga_rgb,vga_hs,vga_vs,q,address);

	input vga_clk,locked;
	input [7:0] q;

	
	output reg [14:0] address;
	output reg [7:0] vga_rgb;
	output vga_hs,vga_vs;
	
	reg	[31:0] cnt1;
	reg	[31:0] cnt2;
	
	reg	vivad;
	
	//行扫描 1056
	always @(posedge vga_clk,negedge locked)
	begin
		if(!locked)
			cnt1 <= 32'b0;
		else
			if(cnt1 == 32'd1055)
				cnt1 <= 32'b0;
			else
				cnt1 <= cnt1 + 1'b1;
	end
	
	//列扫描 628
	always @(posedge vga_clk,negedge locked)
	begin
		if(!locked)
			cnt2 <= 32'b0;
		else
			if(cnt1 == 32'd1055)
				if(cnt2 == 32'd627)
					cnt2 <= 32'b0;
				else 
					cnt2 <= cnt2 + 1'b1;
			else
				cnt2 <= cnt2;
	end
	
	//VGA行列同步信号
	assign vga_hs = (cnt1 < 32'd128)? 1'd0:1'd1;
	assign vga_vs = (cnt2 < 32'd4)? 1'd0:1'd1;	
	
	//VGA显示区域
	always @(posedge vga_clk,negedge locked)
	begin
		if(!locked)
			begin
				address <= 1'b0;
				vga_rgb <= 8'b0;
			end
		else
			if(cnt1 >= 32'd516 && cnt1 < 32'd716 && cnt2 >= 32'd252 && cnt2 < 32'd402)
				if(address < 15'd29999)
					begin
						address <= address + 1'd1;
						vga_rgb <= q;
					end
				else
					address <= 15'd0;
			else
				vga_rgb <= 8'b0;
	end

endmodule 