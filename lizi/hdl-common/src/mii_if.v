module mii_if(
	input	aclk,
	input	aresetn,

	output	reg [7:0] tx_tdata,
	output	reg tx_tvalid,
	output	reg tx_tlast,
	input	tx_tready, 

	input	[7:0] rx_tdata,
	input	rx_tvalid,
	input	rx_tlast,
	output	reg rx_tready,

	output	mii_tx_clk,
	input	mii_tx_en,
	input	mii_tx_er,
	input	[3:0] mii_tx_data,

	output	mii_rx_clk,
	output	reg mii_rx_dv,
	output	reg mii_rx_er,
	output	reg [3:0] mii_rx_data,

	output	mii_crs,
	output	mii_col
);

assign mii_tx_clk = aclk;
assign mii_rx_clk = aclk;

////////////////////////////////////////////////////////////////////////////////
// Tx stage
reg [3:0] tx_data_1, tx_data_0;
reg tx_en_1, tx_en_0;
reg tx_er_1, tx_er_0;
reg tx_flag_1, tx_flag_0;

// emulate a "collision" when overflow
// Carrier-sense
//assign mii_crs = tx_tvalid;
assign mii_crs = tx_tvalid && !tx_tready;
// Collision
assign mii_col = tx_tvalid && !tx_tready;

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		tx_flag_0 <= 1'b0;
	end
	else if(mii_tx_en) begin
		tx_flag_0 <= !tx_flag_0;
	end
	else begin
		tx_flag_0 <= 1'b0;
	end
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		tx_data_1 <= 'bx;
		tx_data_0 <= 'bx;
		tx_en_1 <= 1'b0;
		tx_en_0 <= 1'b0;
		tx_er_1 <= 1'b0;
		tx_er_0 <= 1'b0;
		tx_flag_1 <= 1'b0;
	end
	else begin
		{tx_data_1, tx_data_0} <= {tx_data_0, mii_tx_data};
		{tx_en_1, tx_en_0} <= {tx_en_0, mii_tx_en};
		{tx_er_1, tx_er_0} <= {tx_er_0, mii_tx_er};
		tx_flag_1 <= tx_flag_0;
	end
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		tx_tdata <= 'bx;
		tx_tvalid <= 1'b0;
		tx_tlast <= 1'b0;
	end
	else if(tx_flag_1) begin
		tx_tdata <= {tx_data_0, tx_data_1};
		tx_tvalid <= 1'b1;
		tx_tlast <= !mii_tx_en;
	end
	else begin
		tx_tvalid <= 1'b0;
		tx_tlast <= 1'b0;
	end
end

////////////////////////////////////////////////////////////////////////////////
// Rx stage

reg [3:0] rx_data_0;
reg rx_last_0;
reg [4:0] timer;

integer s1, s1_next;
localparam S1_IDLE=0, S1_STROBE_LOW=1, S1_STROBE_HIGH=2,
	S1_IFG=3, S1_UNDERFLOW=4, S1_RECOVER=5;

parameter IFG_CYCLES = 24;

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn)
		s1 <= S1_IDLE;
	else
		s1 <= s1_next;
end

always @(*)
begin
	case(s1)
		S1_IDLE: begin
			if(rx_tvalid) 
				s1_next = S1_STROBE_LOW;
			else
				s1_next = S1_IDLE;
		end
		S1_STROBE_LOW: begin
			s1_next = S1_STROBE_HIGH;
		end
		S1_STROBE_HIGH: begin
			if(rx_last_0)
				s1_next = S1_IFG;
			else if(!rx_tvalid)
				s1_next = S1_UNDERFLOW;
			else
				s1_next = S1_STROBE_LOW;
		end
		S1_IFG: begin
			if(timer == IFG_CYCLES)
				s1_next = S1_IDLE;
			else
				s1_next = S1_IFG;
		end
		S1_UNDERFLOW: begin
			if(timer == 2)
				s1_next = S1_RECOVER;
			else
				s1_next = S1_UNDERFLOW;
		end
		S1_RECOVER: begin
			if(rx_tvalid && rx_tlast)
				s1_next = S1_IDLE;
			else
				s1_next = S1_RECOVER;
		end
		default: begin
			s1_next = 'bx;
		end
	endcase
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		mii_rx_data <= 'b0;
		mii_rx_er <= 1'b0;
		mii_rx_dv <= 1'b0;
		rx_data_0 <= 'bx;
		rx_last_0 <= 1'b0;
		rx_tready <= 1'b0;
		timer <= 'bx;
	end
	else case(s1_next)
		S1_IDLE: begin
			timer <= 'b0;
			rx_tready <= 1'b0;
		end
		S1_STROBE_LOW: begin
			rx_tready <= 1'b1;
			mii_rx_dv <= 1'b1;
			mii_rx_data <= rx_tdata[3:0];
			rx_data_0 <= rx_tdata[7:4];
			rx_last_0 <= rx_tlast;
		end
		S1_STROBE_HIGH: begin
			rx_tready <= 1'b0;
			mii_rx_data <= rx_data_0;
		end
		S1_IFG: begin
			timer <= timer+1;
			mii_rx_dv <= 1'b0;
			mii_rx_er <= 1'b0;
			mii_rx_data <= 'b0;
		end
		S1_UNDERFLOW: begin
			timer <= timer+1;
			mii_rx_er <= 1'b1;
			mii_rx_data <= 'b0;
		end
		S1_RECOVER: begin
			rx_tready <= 1'b1;
			mii_rx_dv <= 1'b0;
			mii_rx_er <= 1'b0;
		end
	endcase
end
endmodule
