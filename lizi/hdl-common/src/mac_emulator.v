module mac_emulator(
	input	clk,

	output reg	[31:0]	mac_rx_tdata,
	output reg	[3:0]	mac_rx_tkeep,
	output reg	[15:0]	mac_rx_tuser,
	output reg	mac_rx_tvalid,
	output reg	mac_rx_tlast,
	input	mac_rx_tready,

	input	[31:0]	mac_tx_tdata,
	input	[3:0]	mac_tx_tkeep,
	input	mac_tx_tvalid,
	input	mac_tx_tlast,
	output reg	mac_tx_tready
);

reg [7:0] rx_buf[0:16383];
//reg [7:0] tx_buf[0:16384];

task LoadFromFile(input [128*8-1:0] filename);
	begin
		$readmemh(filename, rx_buf);
	end
endtask

task TestRx(input [15:0] length);
	integer i;
	begin
		@(posedge clk);
		for(i=0;i<length;i=i+4) begin
			mac_rx_tuser <= length;
			mac_rx_tdata <= {rx_buf[i],rx_buf[i+1],rx_buf[i+2],rx_buf[i+3]};
			case(length-i)
				1: mac_rx_tkeep <= 4'b1000;
				2: mac_rx_tkeep <= 4'b1100;
				3: mac_rx_tkeep <= 4'b1110;
				default: mac_rx_tkeep <= 4'b1111;
			endcase
			if(i+4 >= length)
				mac_rx_tlast <= 1'b1;
			else
				mac_rx_tlast <= 1'b0;
			mac_rx_tvalid <= 1'b1;
			@(posedge clk)
			while(!mac_rx_tready) @(posedge clk);
		end
		mac_rx_tvalid <= 1'b0;
	end
endtask

initial
begin
	mac_rx_tdata = 'bx;
	mac_rx_tkeep = 4'b0000;
	mac_rx_tuser = 'b0;
	mac_rx_tvalid = 1'b0;
	mac_rx_tlast = 1'b0;
	mac_tx_tready = 1'b1;
end

endmodule
