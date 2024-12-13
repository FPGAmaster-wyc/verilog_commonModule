
		//*****数码管通用格式******//
module seven_tube(clk,rst_n,data_in,seg,sel);
	
	input clk,rst_n;
	input [23:0] data_in;
	
	output reg [7:0] seg;
	output reg [2:0] sel;
	
	parameter t = 50_000_000/1000/2 - 1;  
	
	reg  [3:0] data_temp;
	reg [31:0] cnt;
	reg clk_1khz;
	
	//*****产生1khz时钟******//
	always @(posedge clk,negedge rst_n)
	begin
		if(!rst_n)
			begin
				cnt <= 0;
				clk_1khz <= 0;
			end
		else
			if(cnt < t)
				begin
					cnt <= cnt + 1;
					clk_1khz <= clk_1khz;
				end
			else
				begin
					cnt <= 0;
					clk_1khz <= ~clk_1khz;
				end
	end
	
	//*****位选******//
	always @(posedge clk_1khz,negedge rst_n)
	begin
		if(!rst_n)
			begin
				sel <= 1'b0;
			end
		else
			if(sel == 5)
				sel <= 1'b0;
			else
				sel <= sel + 1'b1;
	end
	//*****每一位显示的数字******//
	always @(*)
	begin
		if(!rst_n)
			data_temp = 0;
		else
			case(sel)
				
				0		:	  	data_temp = data_in[23:20];
				1		:	  	data_temp = data_in[19:16];
				2		:	  	data_temp = data_in[15:12];
				3		:	  	data_temp = data_in[11:8];
				4		:	  	data_temp = data_in[7:4];
				5		:	  	data_temp = data_in[3:0];
			
				default:	data_temp = 0;
			endcase
	end
	
	//*****译码******//
	always @(*)
	begin
		if(!rst_n)
			seg = 8'b0;
		else
			case(data_temp)
				
				4'h0	:	seg = 8'b1100_0000;		//0
				4'h1	:	seg = 8'b1111_1001;		//1
				4'h2	:	seg = 8'b1010_0100;		//2
				4'h3	:	seg = 8'b1011_0000;		//3
				
				4'h4	:	seg = 8'b1001_1001;		//4
				4'h5	:	seg = 8'b1001_0010;		//5
				4'h6	:	seg = 8'b1000_0010;		//6
				4'h7	:	seg = 8'b1111_1000;		//7
				
				4'h8	:	seg = 8'b1000_0000;		//8
				4'h9	:	seg = 8'b1001_0000;		//9
				4'hA	:	seg = 8'b1000_1000;		//A
				4'hb	:	seg = 8'b1000_0011;		//b
				
				4'hC	:	seg = 8'b1100_0110;		//C
				4'hd	:	seg = 8'b1010_0001;		//d
				4'hE	:	seg = 8'b1000_0110;		//E
				4'hF	:	seg = 8'b1000_1110;		//F
				
				default:	seg = 8'b0;
			endcase
	end
endmodule
