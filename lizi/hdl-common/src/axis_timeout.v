module axis_timeout #(
	parameter DATA_BITS=32,
	parameter TIMEOUT_CLOCKS=100000000
)(
	input	aclk,
	input	aresetn,

	input	[DATA_BITS-1:0] s_tdata,
	input	[DATA_BITS/8-1:0] s_tkeep,
	input	s_tvalid,
	input	s_tlast,
	output	s_tready,

	output	reg [DATA_BITS-1:0] m_tdata,
	output	reg [DATA_BITS/8-1:0] m_tkeep,
	output	reg m_tvalid,
	output	reg m_tlast,
	input	m_tready
);

reg [31:0] timer;
wire timeout;

reg [DATA_BITS-1:0] data_r;
reg [DATA_BITS/8-1:0] keep_r;
reg valid_r;
reg last_r;

assign s_tready = m_tready;

assign timeout = timer==TIMEOUT_CLOCKS;
always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		timer <= 0;
	end
	else if(m_tvalid && m_tready) begin
		timer <= 0;
	end
	else if(valid_r && !timeout) begin
		timer <= timer+1;
	end
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		data_r <= 'bx;
		keep_r <= 'bx;
		valid_r <= 'b0;
		last_r <= 'b0;
	end
	else if(s_tvalid && m_tready) begin
		data_r <= s_tdata;
		keep_r <= s_tkeep;
		valid_r <= s_tvalid;
		last_r <= s_tlast;
	end
	else if(valid_r && last_r && m_tready) begin
		valid_r <= 1'b0;
		last_r <= 1'b0;
	end
	else if(timeout) begin
		last_r <= 1'b1;
	end
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		m_tdata <= 'bx;
		m_tkeep <= 'bx;
		m_tvalid <= 1'b0;
		m_tlast <= 1'b0;
	end
	else if(s_tvalid && m_tready) begin
		m_tdata <= data_r;
		m_tkeep <= keep_r;
		m_tvalid <= valid_r;
		m_tlast <= last_r;
	end
	else if(valid_r && last_r && m_tready) begin
		m_tdata <= data_r;
		m_tkeep <= keep_r;
		m_tvalid <= valid_r;
		m_tlast <= last_r;
	end
	else if(m_tready) begin
		m_tvalid <= 1'b0;
		m_tlast <= 1'b0;
	end
end


endmodule
