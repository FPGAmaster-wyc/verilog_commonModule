module packet_mux #(
	parameter DATA_BITS=8,
	parameter USER_BITS=1,
	parameter CHANNELS=2
)(
	input aclk,
	input aresetn,
	input [CHANNELS-1:0][DATA_BITS-1:0] s_axis_tdata,
	input [CHANNELS-1:0] s_axis_tvalid,
	input [CHANNELS-1:0] s_axis_tlast,
	input [CHANNELS-1:0][USER_BITS-1:0] s_axis_tuser,
	output reg [CHANNELS-1:0] s_axis_tready,
	output reg [DATA_BITS-1:0] m_axis_tdata,
	output reg m_axis_tvalid,
	output reg m_axis_tlast,
	output reg [USER_BITS-1:0] m_axis_tuser,
	input m_axis_tready
);

reg [CHANNELS-1:0] grant;
reg [CHANNELS-1:0] grant_next;

integer s1, s1_next;
localparam S1_IDLE=0, S1_ARB=1, S1_BUSY=2;

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
			if(|s_axis_tvalid)
				s1_next = S1_ARB;
			else
				s1_next = S1_IDLE;
		end
		S1_ARB: begin
			s1_next = S1_BUSY;
		end
		S1_BUSY: begin
			if(m_axis_tvalid && m_axis_tlast && m_axis_tready)
				s1_next = S1_IDLE;
			else
				s1_next = S1_BUSY;
		end
		default: begin
			s1_next = 'bx;
		end
	endcase
end

always @(*)
begin:ARB
	integer i;
	grant_next = 'b0;
	for(i=CHANNELS-1;i>=0;i=i-1) begin
		if(s_axis_tvalid[i])
			grant_next = 1<<i;
	end
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		grant <= 'b0;
	end
	else if(s1_next == S1_ARB) begin
		grant <= grant_next;
	end
	else if(s1_next == S1_IDLE) begin
		grant <= 'b0;
	end
end

always @(*)
begin:STB
	integer i;
	m_axis_tvalid = 1'b0;
	m_axis_tdata = 'bx;
	m_axis_tlast = 'bx;
	m_axis_tuser = 'bx;
	for(i=CHANNELS-1;i>=0;i=i-1) begin
		if(grant[i]) begin
			m_axis_tdata = s_axis_tdata[i];
			m_axis_tvalid = s_axis_tvalid[i];
			m_axis_tlast = s_axis_tlast[i];
			m_axis_tuser = s_axis_tuser[i];
		end
	end
end

always @(*)
begin:ACK
	integer i;
	for(i=CHANNELS-1;i>=0;i=i-1) begin
		if(grant[i])
			s_axis_tready[i] = m_axis_tready;
		else
			s_axis_tready[i] = 1'b0;
	end
end

endmodule
