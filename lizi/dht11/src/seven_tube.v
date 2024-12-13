/*
例化模板：
seven_tube TUBE(
		.clk(),
		.rst_n(),
		.data_in(),		//	[23:0] data_in
		.point(),		//	[5:0] point
		.seg(),			//	[7:0] seg
		.sel()			//	[2:0] sel
	);

*/
	//*****数码管通用格式******//
module seven_tube(clk,rst_n,data_in,seg,sel,point);
	
	input clk,rst_n;
	input [23:0] data_in;
	input [5:0] point;			//小数点显示
	
	output reg [7:0] seg;
	output reg [2:0] sel;
	
	parameter t = 50_000_000/1000/2 - 1;  
	
	reg  [3:0] data_temp;
	reg [31:0] cnt;
	reg clk_1khz;
	reg dot_disp = 1;		//当前数码管显示的小数点
	
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
	
	//dot_disp：小数点低电平点亮，需对小数点有效信号取反
	always@(*)
	begin
		if(rst_n == 1'b0)
			dot_disp    =  1'b1;
		else
			case (sel)
				0		:	  	dot_disp = ~point[5];
				1		:	  	dot_disp = ~point[4];
				2		:	  	dot_disp = ~point[3];
				3		:	  	dot_disp = ~point[2];
				4		:	  	dot_disp = ~point[1];
				5		:	  	dot_disp = ~point[0];
			default	:		dot_disp	= 1;
			endcase
	end

	//*****译码******//
	always @(*)
	begin
		if(!rst_n)
			seg = 8'b0;
		else
			case(data_temp)
				
				4'd0  : seg  <=  {dot_disp,7'b100_0000};    //显示数字0
				4'd1  : seg  <=  {dot_disp,7'b111_1001};    //显示数字1
				4'd2  : seg  <=  {dot_disp,7'b010_0100};    //显示数字2
				4'd3  : seg  <=  {dot_disp,7'b011_0000};    //显示数字3
				4'd4  : seg  <=  {dot_disp,7'b001_1001};    //显示数字4
				4'd5  : seg  <=  {dot_disp,7'b001_0010};    //显示数字5
				4'd6  : seg  <=  {dot_disp,7'b000_0010};    //显示数字6
				4'd7  : seg  <=  {dot_disp,7'b111_1000};    //显示数字7
				4'd8  : seg  <=  {dot_disp,7'b000_0000};    //显示数字8
				4'd9  : seg  <=  {dot_disp,7'b001_0000};    //显示数字9
				4'd10 : seg  <=  8'b1011_1111          ;    //显示负号
				4'hf  : seg  <=  8'b1111_1111          ;    //不显示任何字符
					
				default:	seg = 8'b0;
			endcase
	end
endmodule
