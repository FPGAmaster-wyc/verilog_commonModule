module mac_tx(
    input   payload_tx_aclk,
    input   payload_tx_aresetn,
    input   [7:0] payload_tx_tdata,
    input   payload_tx_tvalid,
    input   payload_tx_tlast,
    output  reg payload_tx_tready,
    input   mac_tx_aclk,
    input   mac_tx_aresetn,
    output  reg [7:0] mac_tx_tdata,
    output  reg mac_tx_tvalid,
    output  reg mac_tx_tlast,
    input   mac_tx_tready
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

always @(posedge payload_tx_aclk)
begin
	if(write_enable)
		ram[write_addr] <= write_data;
end

always @(posedge mac_tx_aclk)
begin
	read_data <= ram[read_addr];
end

////////////////////////////////////////////////////////////////////////////////
// ETH: FCS generation
reg eth_fcs_clr;
reg eth_fcs_en;
reg [31:0] eth_fcs_crc;
wire [7:0] eth_fcs;
always @(posedge mac_tx_aclk)
begin
	if(eth_fcs_clr) begin
		eth_fcs_crc <= 32'hffffffff;
	end
	else if(eth_fcs_en) begin
	   	if(mac_tx_tvalid && mac_tx_tready)
			eth_fcs_crc <= NextCRC(mac_tx_tdata, eth_fcs_crc);
	end
	else begin
		if(mac_tx_tvalid && mac_tx_tready)
			eth_fcs_crc <= {eth_fcs_crc, 8'hFF};
	end
end
assign eth_fcs = ~{ eth_fcs_crc[24], eth_fcs_crc[25], eth_fcs_crc[26], eth_fcs_crc[27],
	eth_fcs_crc[28], eth_fcs_crc[29], eth_fcs_crc[30], eth_fcs_crc[31] };

////////////////////////////////////////////////////////////////////////////////
// cross clock domain
wire write_select_sync;
wire read_select_sync;
(* ASYNC_REG = "TRUE" *)
reg [1:0] write_select_pipe;
always @(posedge mac_tx_aclk)
begin
    write_select_pipe <= {write_select_pipe, write_select};
end
assign write_select_sync = write_select_pipe[1];
(* ASYNC_REG = "TRUE" *)
reg [1:0] read_select_pipe;
always @(posedge payload_tx_aclk)
begin
    read_select_pipe <= {read_select_pipe, read_select};
end
assign read_select_sync = read_select_pipe[1];

////////////////////////////////////////////////////////////////////////////////
// Packet input
reg [10:0] total_length;

integer s1, s1_next;
localparam S1_RESET=0, S1_IDLE=1, S1_DATA_0=2, S1_DATA_1=3, S1_SWAP=4, S1_WAIT=5;

always @(posedge payload_tx_aclk, negedge payload_tx_aresetn)
begin
	if(!payload_tx_aresetn)
		s1 <= S1_RESET;
	else
		s1 <= s1_next;
end

always @(*)
begin
	case(s1)
        S1_RESET: begin
            s1_next = S1_IDLE;
        end
		S1_IDLE: begin
			if(payload_tx_tvalid)
				if(payload_tx_tlast)
					s1_next = S1_DATA_1;
				else
					s1_next = S1_DATA_0;
			else
				s1_next = S1_IDLE;
		end
		S1_DATA_0: begin
			if(payload_tx_tvalid && payload_tx_tlast)
				s1_next = S1_DATA_1;
			else
				s1_next = S1_DATA_0;
		end
		S1_DATA_1: begin
            s1_next = S1_WAIT;
		end
        S1_WAIT: begin
            if(write_select == read_select_sync)
                s1_next = S1_SWAP;
            else
                s1_next = S1_WAIT;
        end
		S1_SWAP: begin
            s1_next = S1_IDLE;
		end
		default: begin
			s1_next = 'bx;
		end
	endcase
end

always @(posedge payload_tx_aclk, negedge payload_tx_aresetn)
begin
	if(!payload_tx_aresetn) begin
		payload_tx_tready <= 1'b0;
		write_select <= 1'b0;
		write_offset <= 'bx;
		write_enable <= 1'b0;
		write_data <= 'bx;
		total_length <= 'bx;
	end
	else case(s1_next)
        S1_RESET: begin
        end
		S1_IDLE: begin
            write_offset <= -1;
			payload_tx_tready <= 1'b1;
		end
		S1_DATA_0, S1_DATA_1: begin
			if(payload_tx_tvalid) begin
				write_enable <= 1'b1;
				write_data <= payload_tx_tdata;
				write_offset <= write_offset+1;
				if(payload_tx_tlast)
					payload_tx_tready <= 1'b0;
			end
			else begin
				write_enable <= 1'b0;
			end
		end
		S1_WAIT: begin
			write_enable <= 1'b0;
		end
		S1_SWAP: begin
			total_length <= write_offset+1;
			write_select <= ~write_select;
		end
	endcase
end

////////////////////////////////////////////////////////////////////////////////
// Packet output
reg [10:0] read_length;
reg [3:0] s2_timer;
integer s2, s2_next;
localparam S2_RESET=0, S2_IDLE=1, S2_PREAMBLE=2, S2_SFD=3, S2_PAYLOAD=4, S2_PAD=5, S2_FCS=6,
   	S2_SWAP=7, S2_IFG=8;
parameter IFG=10;// 96ns/8ns=12, minus one swap cycle and one idle cycle.

always @(posedge mac_tx_aclk, negedge mac_tx_aresetn)
begin
	if(!mac_tx_aresetn)
		s2 <= S2_RESET;
	else
		s2 <= s2_next;
end

always @(*)
begin
	case(s2)
        S2_RESET: begin
            s2_next = S2_IDLE;
        end
		S2_IDLE: begin
			if(read_select != write_select_sync)
				s2_next = S2_PREAMBLE;
			else
				s2_next = S2_IDLE;
		end
		S2_PREAMBLE: begin
			if(mac_tx_tready && s2_timer == 6)
				s2_next = S2_SFD;
			else
				s2_next = S2_PREAMBLE;
		end
		S2_SFD: begin
			if(mac_tx_tready)
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
			if(mac_tx_tready && mac_tx_tlast)
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

always @(posedge mac_tx_aclk, negedge mac_tx_aresetn)
begin
	if(!mac_tx_aresetn) begin
		mac_tx_tvalid <= 1'b0;
		read_length <= 'bx;
		s2_timer <= 'bx;
		read_offset <= 'bx;
		read_select <= 0;
		mac_tx_tlast <= 1'b0;
		eth_fcs_clr <= 'bx;
		eth_fcs_en <= 'bx;
	end
	else case(s2_next)
        S2_RESET: begin
        end
		S2_IDLE: begin
			s2_timer <= 0;
			read_length <= total_length;
			eth_fcs_clr <= 1;
			eth_fcs_en <= 0;
		end
		S2_PREAMBLE: begin
			if(mac_tx_tvalid && mac_tx_tready) begin
				s2_timer <= s2_timer+1;
			end
			mac_tx_tvalid <= 1'b1;
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
			else if(mac_tx_tready) begin
				if(s2_timer==2) begin
					mac_tx_tlast <= 1;
				end
				s2_timer <= s2_timer+1;
			end
		end
		S2_SWAP: begin
			mac_tx_tvalid <= 1'b0;
			mac_tx_tlast <= 1'b0;
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
	if((s2==S2_PAYLOAD || s2==S2_PAD) && mac_tx_tready)
		read_next = read_offset + 1;
	else
		read_next = read_offset;

	case(s2)
		S2_PREAMBLE: begin
			mac_tx_tdata = 8'h55;
		end
		S2_SFD: begin
			mac_tx_tdata = 8'hd5;
		end
		S2_PAYLOAD: begin
			mac_tx_tdata = read_data;
		end
		S2_PAD: begin
			mac_tx_tdata = 8'h00;
		end
		S2_FCS: begin
			mac_tx_tdata = eth_fcs;
		end
		default: begin
			mac_tx_tdata = 'bx;
		end
	endcase
end

endmodule
