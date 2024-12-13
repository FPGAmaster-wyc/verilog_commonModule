module udp_tx_lite(
	input	aclk,
	input	aresetn,

	/* {dst.ethaddr,src.ethaddr,dst.ip,src.ip,dst.port,src.port} combinations */
	input	[191:0] config0,
	input	[191:0] config1,
	input	[191:0] config2,
	input	[191:0] config3,

	input	[7:0] axis_s_tdata,
	input	[1:0] axis_s_tuser,
	input	axis_s_tlast,
	input	axis_s_tvalid,
	output reg	axis_s_tready,

	output reg	[7:0] axis_m_tdata,
	output reg	axis_m_tlast,
	output reg	axis_m_tvalid,
	input	axis_m_tready
);

////////////////////////////////////////////////////////////////////////////////
// algorithms
function[31:0]  NextCRC;
    input[7:0]      D;
    input[31:0]     C;
    reg[31:0]       NewCRC;
    begin
    NewCRC[0]=C[24]^C[30]^D[1]^D[7];
    NewCRC[1]=C[25]^C[31]^D[0]^D[6]^C[24]^C[30]^D[1]^D[7];
    NewCRC[2]=C[26]^D[5]^C[25]^C[31]^D[0]^D[6]^C[24]^C[30]^D[1]^D[7];
    NewCRC[3]=C[27]^D[4]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
    NewCRC[4]=C[28]^D[3]^C[27]^D[4]^C[26]^D[5]^C[24]^C[30]^D[1]^D[7];
    NewCRC[5]=C[29]^D[2]^C[28]^D[3]^C[27]^D[4]^C[25]^C[31]^D[0]^D[6]^C[24]^C[30]^D[1]^D[7];
    NewCRC[6]=C[30]^D[1]^C[29]^D[2]^C[28]^D[3]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
    NewCRC[7]=C[31]^D[0]^C[29]^D[2]^C[27]^D[4]^C[26]^D[5]^C[24]^D[7];
    NewCRC[8]=C[0]^C[28]^D[3]^C[27]^D[4]^C[25]^D[6]^C[24]^D[7];
    NewCRC[9]=C[1]^C[29]^D[2]^C[28]^D[3]^C[26]^D[5]^C[25]^D[6];
    NewCRC[10]=C[2]^C[29]^D[2]^C[27]^D[4]^C[26]^D[5]^C[24]^D[7];
    NewCRC[11]=C[3]^C[28]^D[3]^C[27]^D[4]^C[25]^D[6]^C[24]^D[7];
    NewCRC[12]=C[4]^C[29]^D[2]^C[28]^D[3]^C[26]^D[5]^C[25]^D[6]^C[24]^C[30]^D[1]^D[7];
    NewCRC[13]=C[5]^C[30]^D[1]^C[29]^D[2]^C[27]^D[4]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
    NewCRC[14]=C[6]^C[31]^D[0]^C[30]^D[1]^C[28]^D[3]^C[27]^D[4]^C[26]^D[5];
    NewCRC[15]=C[7]^C[31]^D[0]^C[29]^D[2]^C[28]^D[3]^C[27]^D[4];
    NewCRC[16]=C[8]^C[29]^D[2]^C[28]^D[3]^C[24]^D[7];
    NewCRC[17]=C[9]^C[30]^D[1]^C[29]^D[2]^C[25]^D[6];
    NewCRC[18]=C[10]^C[31]^D[0]^C[30]^D[1]^C[26]^D[5];
    NewCRC[19]=C[11]^C[31]^D[0]^C[27]^D[4];
    NewCRC[20]=C[12]^C[28]^D[3];
    NewCRC[21]=C[13]^C[29]^D[2];
    NewCRC[22]=C[14]^C[24]^D[7];
    NewCRC[23]=C[15]^C[25]^D[6]^C[24]^C[30]^D[1]^D[7];
    NewCRC[24]=C[16]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
    NewCRC[25]=C[17]^C[27]^D[4]^C[26]^D[5];
    NewCRC[26]=C[18]^C[28]^D[3]^C[27]^D[4]^C[24]^C[30]^D[1]^D[7];
    NewCRC[27]=C[19]^C[29]^D[2]^C[28]^D[3]^C[25]^C[31]^D[0]^D[6];
    NewCRC[28]=C[20]^C[30]^D[1]^C[29]^D[2]^C[26]^D[5];
    NewCRC[29]=C[21]^C[31]^D[0]^C[30]^D[1]^C[27]^D[4];
    NewCRC[30]=C[22]^C[31]^D[0]^C[28]^D[3];
    NewCRC[31]=C[23]^C[29]^D[2];
    NextCRC=NewCRC;
    end
endfunction

function [15:0] csum_add;
	input [15:0] sum;
	input [15:0] data;
	reg [16:0] temp;
	begin
		temp = sum+data;
		csum_add = temp[15:0]+temp[16];
	end
endfunction

////////////////////////////////////////////////////////////////////////////////
// Ping-Pong Buffer RAM
reg [7:0] ram [0:4095];

wire [11:0] write_addr;
wire [11:0] read_addr;

reg write_select;
reg [10:0] write_offset;

reg read_select;
reg [10:0] read_offset;
reg [10:0] read_next;

reg write_enable;

reg [7:0] write_data;
reg [7:0] read_data;

assign write_addr = {write_select, write_offset};
assign read_addr = {read_select, read_next};

always @(posedge aclk)
begin
	if(write_enable)
		ram[write_addr] <= write_data;
end

always @(posedge aclk)
begin
	read_data <= ram[read_addr];
end

////////////////////////////////////////////////////////////////////////////////
// ETH: FCS generation
reg eth_fcs_clr;
reg eth_fcs_en;
reg [31:0] eth_fcs_crc;
wire [7:0] eth_fcs;
always @(posedge aclk)
begin
	if(eth_fcs_clr) begin
		eth_fcs_crc <= 32'hffffffff;
	end
	else if(eth_fcs_en) begin
	   	if(axis_m_tvalid && axis_m_tready)
			eth_fcs_crc <= NextCRC(axis_m_tdata, eth_fcs_crc);
	end
	else begin
		if(axis_m_tvalid && axis_m_tready)
			eth_fcs_crc <= {eth_fcs_crc, 8'hFF};
	end
end
assign eth_fcs = ~{ eth_fcs_crc[24], eth_fcs_crc[25], eth_fcs_crc[26], eth_fcs_crc[27],
	eth_fcs_crc[28], eth_fcs_crc[29], eth_fcs_crc[30], eth_fcs_crc[31] };

////////////////////////////////////////////////////////////////////////////////
// IP: CSUM generation
reg ip_csum_clr;
reg ip_csum_en;
reg ip_csum_sel;
reg [15:0] ip_csum_sum;
wire [15:0] ip_csum;
always @(posedge aclk)
begin
	if(ip_csum_clr) begin
		ip_csum_sel <= 1'b0;
		ip_csum_sum <= 'b0;
	end
	else if(ip_csum_en && write_enable) begin
		if(ip_csum_sel) begin
			ip_csum_sum <= csum_add(ip_csum_sum, {8'b0,write_data});
		end
		else begin
			ip_csum_sum <= csum_add(ip_csum_sum, {write_data,8'b0});
		end
		ip_csum_sel <= !ip_csum_sel;
	end
end
assign ip_csum = ~ip_csum_sum;

////////////////////////////////////////////////////////////////////////////////
// UDP: CSUM generation
reg udp_csum_clr;
reg udp_csum_en;
reg udp_csum_sel;
reg [15:0] udp_csum_sum;
wire [15:0] udp_csum;
always @(posedge aclk)
begin
	if(udp_csum_clr) begin
		udp_csum_sel <= 1'b0;
		udp_csum_sum <= 17; // dummy head resident
	end
	else if(udp_csum_en) begin
		if(write_enable) begin
			if(udp_csum_sel) begin
				udp_csum_sum <= csum_add(udp_csum_sum, {8'b0,write_data});
			end
			else begin
				udp_csum_sum <= csum_add(udp_csum_sum, {write_data,8'b0});
			end
			udp_csum_sel <= !udp_csum_sel;
		end
	end
	else begin
		/* reset when data payloads not aligned to 16bits */
		udp_csum_sel <= 1'b0;
	end
end
assign udp_csum = ~udp_csum_sum;

////////////////////////////////////////////////////////////////////////////////
// Packet generation
reg tx_start;
reg tx_ready;
reg [10:0] bcnt;
reg [191:0] config_vector;
reg [10:0] total_length;
reg [15:0] ip_ident;

wire [10:0] udp_length;
wire [10:0] ip_length;
assign udp_length = total_length-34;
assign ip_length = total_length-14;

integer s1, s1_next;
localparam S1_IDLE=0, S1_DATA_0=1, S1_DATA_1=2, S1_HEADER_0=3, S1_HEADER_1=4,
	S1_IPCSUM_0=5, S1_IPCSUM_1=6, S1_UDPCSUM_0=7, S1_UDPCSUM_1=8, S1_SWAP=9,
	S1_WAIT=10;

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
			if(axis_s_tvalid)
				if(axis_s_tlast)
					s1_next = S1_DATA_1;
				else
					s1_next = S1_DATA_0;
			else
				s1_next = S1_IDLE;
		end
		S1_DATA_0: begin
			if(axis_s_tvalid && axis_s_tlast)
				s1_next = S1_DATA_1;
			else
				s1_next = S1_DATA_0;
		end
		S1_DATA_1: begin
			s1_next = S1_HEADER_0;
		end
		S1_HEADER_0: begin
			s1_next = S1_HEADER_1;
		end
		S1_HEADER_1: begin
			if(bcnt==41)
				s1_next = S1_IPCSUM_0;
			else
				s1_next = S1_HEADER_1;
		end
		S1_IPCSUM_0: begin
			s1_next = S1_IPCSUM_1;
		end
		S1_IPCSUM_1: begin
			s1_next = S1_UDPCSUM_0;
		end
		S1_UDPCSUM_0: begin
			s1_next = S1_UDPCSUM_1;
		end
		S1_UDPCSUM_1: begin
			s1_next = S1_SWAP;
		end
		S1_SWAP,S1_WAIT: begin
			if(tx_ready)
				s1_next = S1_IDLE;
			else
				s1_next = S1_WAIT;
		end
		default: begin
			s1_next = 'bx;
		end
	endcase
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		tx_start <= 1'b0;
		axis_s_tready <= 1'b1;
		write_select <= 1'b0;
		write_offset <= 'bx;
		write_enable <= 1'b0;
		write_data <= 'bx;
		bcnt <= 0;
		config_vector <= 'bx;
		total_length <= 'bx;
		ip_csum_clr <= 0;
		ip_csum_en <= 0;
		udp_csum_clr <= 0;
		udp_csum_en <= 0;
		ip_ident <= 0;
	end
	else case(s1_next)
		S1_IDLE: begin
			tx_start <= 1'b0;
			write_offset <= 42-1; // payload offset - 1
			axis_s_tready <= 1'b1;
			bcnt <= 0;
			ip_csum_clr <= 1;
			udp_csum_clr <= 1;
		end
		S1_DATA_0, S1_DATA_1: begin
			ip_csum_clr <= 0;
			udp_csum_clr <= 0;
			udp_csum_en <= 1;
			case(axis_s_tuser) /* synthesis parallel_case */
				0: config_vector <= config0;
				1: config_vector <= config1;
				2: config_vector <= config2;
				3: config_vector <= config3;
			endcase
			if(axis_s_tvalid) begin
				write_enable <= 1'b1;
				write_data <= axis_s_tdata;
				write_offset <= write_offset+1;
				bcnt <= bcnt+1;
				if(axis_s_tlast)
					axis_s_tready <= 1'b0;
			end
			else begin
				write_enable <= 1'b0;
			end
		end
		S1_HEADER_0: begin
			total_length <= write_offset+1;
			bcnt <= 0;
			write_offset <= 0;
			write_enable <= 1;
			write_data <= config_vector[191:184]; // ETH: dst mac
			udp_csum_en <= 0;
		end
		S1_HEADER_1: begin
			write_offset <= write_offset+1;
			bcnt <= bcnt+1;
			case(bcnt[5:0]) /* synthesis parallel_case */
				0: write_data <= config_vector[183:176];
				1: write_data <= config_vector[175:168];
				2: write_data <= config_vector[167:160];
				3: write_data <= config_vector[159:152];
				4: write_data <= config_vector[151:144];

				5: write_data <= config_vector[143:136]; // ETH: src mac
				6: write_data <= config_vector[135:128];
				7: write_data <= config_vector[127:120];
				8: write_data <= config_vector[119:112];
				9: write_data <= config_vector[111:104];
				10: write_data <= config_vector[103:96];

				11: write_data <= 8'h08; // ETH: type: IP
				12: write_data <= 8'h00;

				13: write_data <= 8'h45; // IP: v4, header length 20B
				14: write_data <= 8'h00;
				15: write_data <= {5'b0, ip_length[10:8]}; // IP: Total length
				16: write_data <= ip_length[7:0];
				17: write_data <= ip_ident[15:8]; // IP: identification
				18: write_data <= ip_ident[7:0];
				19: write_data <= 8'h40; // IP: Flags = 0x02, Frag. offset = 0
				20: write_data <= 8'h00; 
				21: write_data <= 8'h40; // IP: TTL=64
				22: write_data <= 8'h11; // IP: protocol=UDP 
				23: write_data <= 8'h00; // IP CSUM, fill later
				24: write_data <= 8'h00;

				25: write_data <= config_vector[63:56]; // src ip
				26: write_data <= config_vector[55:48];
				27: write_data <= config_vector[47:40];
				28: write_data <= config_vector[39:32];

				29: write_data <= config_vector[95:88]; // dst ip
				30: write_data <= config_vector[87:80];
				31: write_data <= config_vector[79:72];
				32: write_data <= config_vector[71:64];

				33: write_data <= config_vector[15:8]; // src port
				34: write_data <= config_vector[7:0];

				35: write_data <= config_vector[31:24]; // dst port
				36: write_data <= config_vector[23:16];

				37: write_data <= {5'b0, udp_length[10:8]};
				38: write_data <= udp_length[7:0];

				// NOTE: UDP dummy header contains two length segment
				39: write_data <= {5'b0, udp_length[10:8]}; // UDP CSUM, refill later
				40: write_data <= udp_length[7:0];
			endcase

			if(bcnt==13) begin
				ip_csum_en <= 1;
			end
			else if(bcnt==33) begin
				ip_csum_en <= 0;
			end
			if(bcnt==25) begin
				udp_csum_en <= 1;
			end
		end
		S1_IPCSUM_0: begin
			udp_csum_en <= 0;
			write_offset <= 24;
			write_data <= ip_csum[15:8];
		end
		S1_IPCSUM_1: begin
			write_offset <= write_offset+1;
			write_data <= ip_csum[7:0];
		end
		S1_UDPCSUM_0: begin
			write_offset <= 40;
			write_data <= udp_csum[15:8];
		end
		S1_UDPCSUM_1: begin
			write_offset <= write_offset+1;
			write_data <= udp_csum[7:0];
		end
		S1_SWAP: begin
			write_enable <= 1'b0;
			write_select <= ~write_select;
			tx_start <= 1'b1;
			ip_ident <= ip_ident+1;
		end
		S1_WAIT: begin
		end
	endcase
end

////////////////////////////////////////////////////////////////////////////////
// Packet output
reg [10:0] read_length;
reg [3:0] s2_timer;
integer s2, s2_next;
localparam S2_IDLE=0, S2_PREAMBLE=1, S2_SFD=2, S2_PAYLOAD=3, S2_PAD=4, S2_FCS=5,
   	S2_SWAP=6, S2_IFG=7;
parameter IFG=10;// 96ns/8ns=12, minus one swap cycle and one idle cycle.

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn)
		s2 <= S2_IDLE;
	else
		s2 <= s2_next;
end

always @(*)
begin
	case(s2)
		S2_IDLE: begin
			if(tx_start)
				s2_next = S2_PREAMBLE;
			else
				s2_next = S2_IDLE;
		end
		S2_PREAMBLE: begin
			if(axis_m_tready && s2_timer == 6)
				s2_next = S2_SFD;
			else
				s2_next = S2_PREAMBLE;
		end
		S2_SFD: begin
			if(axis_m_tready)
				s2_next = S2_PAYLOAD;
			else
				s2_next = S2_SFD;
		end
		S2_PAYLOAD: begin
			if(read_next == read_length)
				if(read_next>=60)
					s2_next = S2_FCS;
				else
					s2_next = S2_PAD;
			else
				s2_next = S2_PAYLOAD;
		end
		S2_PAD: begin
			if(read_next >= 60)
				s2_next = S2_FCS;
			else
				s2_next = S2_PAD;
		end
		S2_FCS: begin
			if(axis_m_tready && axis_m_tlast)
				s2_next = S2_SWAP;
			else
				s2_next = S2_FCS;
		end
		S2_SWAP: begin
			s2_next = S2_IFG;
		end
		S2_IFG: begin
			if(s2_timer == IFG)
				s2_next = S2_IDLE;
			else
				s2_next = S2_IFG;
		end
		default: begin
			s2_next = 'bx;
		end
	endcase
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		axis_m_tvalid <= 1'b0;
		tx_ready <= 1'b0;
		read_length <= 'bx;
		s2_timer <= 'bx;
		read_offset <= 'bx;
		read_select <= 0;
		axis_m_tlast <= 1'b0;
		eth_fcs_clr <= 'bx;
		eth_fcs_en <= 'bx;
	end
	else case(s2_next)
		S2_IDLE: begin
			tx_ready <= 1'b1;
			s2_timer <= 0;
			read_length <= total_length;
			eth_fcs_clr <= 1;
			eth_fcs_en <= 0;
		end
		S2_PREAMBLE: begin
			if(axis_m_tvalid && axis_m_tready) begin
				s2_timer <= s2_timer+1;
			end
			axis_m_tvalid <= 1'b1;
			tx_ready <= 1'b0;
		end
		S2_SFD: begin
			read_offset <= 0;
		end
		S2_PAYLOAD: begin
			eth_fcs_clr <= 0;
			eth_fcs_en <= 1'b1;
			read_offset <= read_next;
		end
		S2_PAD: begin
			read_offset <= read_next;
		end
		S2_FCS: begin
			eth_fcs_en <= 1'b0;
			if(s2!=S2_FCS) begin
				s2_timer <= 0;
			end
			else if(axis_m_tready) begin
				if(s2_timer==2) begin
					axis_m_tlast <= 1;
				end
				s2_timer <= s2_timer+1;
			end
		end
		S2_SWAP: begin
			axis_m_tvalid <= 1'b0;
			axis_m_tlast <= 1'b0;
			read_select <= ~read_select;
			s2_timer <= 0;
		end
		S2_IFG: begin
			s2_timer <= s2_timer+1;
		end
	endcase
end

always @(*)
begin
	if((s2==S2_PAYLOAD || s2==S2_PAD) && axis_m_tready)
		read_next = read_offset + 1;
	else
		read_next = read_offset;

	case(s2)
		S2_PREAMBLE: begin
			axis_m_tdata = 8'h55;
		end
		S2_SFD: begin
			axis_m_tdata = 8'hd5;
		end
		S2_PAYLOAD: begin
			axis_m_tdata = read_data;
		end
		S2_PAD: begin
			axis_m_tdata = 8'h00;
		end
		S2_FCS: begin
			axis_m_tdata = eth_fcs;
		end
		default: begin
			axis_m_tdata = 'bx;
		end
	endcase
end

endmodule
