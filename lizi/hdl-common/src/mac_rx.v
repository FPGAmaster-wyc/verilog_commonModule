module mac_rx(
    input   mac_rx_aclk,
    input   mac_rx_aresetn,
    input   [7:0] mac_rx_tdata,
    input   mac_rx_tvalid,
    input   mac_rx_tlast,
    output  reg mac_rx_tready,
    input   payload_rx_aclk,
    input   payload_rx_aresetn,
    output  reg [7:0] payload_rx_tdata,
    output  reg payload_rx_tvalid,
    output  reg payload_rx_tlast,
    input   payload_rx_tready
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

always @(posedge mac_rx_aclk)
begin
	if(write_enable)
		ram[write_addr] <= write_data;
end

always @(posedge payload_rx_aclk)
begin
	read_data <= ram[read_addr];
end

////////////////////////////////////////////////////////////////////////////////
// cross clock domain
wire write_select_sync;
wire read_select_sync;
(* ASYNC_REG = "TRUE" *)
reg [1:0] write_select_pipe;
always @(posedge mac_rx_aclk)
begin
    write_select_pipe <= {write_select_pipe, write_select};
end
assign write_select_sync = write_select_pipe[1];
(* ASYNC_REG = "TRUE" *)
reg [1:0] read_select_pipe;
always @(posedge payload_rx_aclk)
begin
    read_select_pipe <= {read_select_pipe, read_select};
end
assign read_select_sync = read_select_pipe[1];

////////////////////////////////////////////////////////////////////////////////
// ETH: FCS check 
reg eth_fcs_clr;
reg [31:0] eth_fcs_crc;
reg [31:0] data_shift;
wire crc_error;
always @(posedge mac_rx_aclk)
begin
    if(eth_fcs_clr) begin
        eth_fcs_crc <= 32'hffffffff;
    end
    else if(write_enable) begin
        if(write_offset > 10)
			eth_fcs_crc <= NextCRC(data_shift[31:24], eth_fcs_crc);
        data_shift <= {data_shift, mac_rx_tdata};
    end
end
assign crc_error = data_shift != (~{
    eth_fcs_crc[24], eth_fcs_crc[25], eth_fcs_crc[26], eth_fcs_crc[27],
	eth_fcs_crc[28], eth_fcs_crc[29], eth_fcs_crc[30], eth_fcs_crc[31],
    eth_fcs_crc[16], eth_fcs_crc[17], eth_fcs_crc[18], eth_fcs_crc[19],
	eth_fcs_crc[20], eth_fcs_crc[21], eth_fcs_crc[22], eth_fcs_crc[23],
    eth_fcs_crc[8], eth_fcs_crc[9], eth_fcs_crc[10], eth_fcs_crc[11],
	eth_fcs_crc[12], eth_fcs_crc[13], eth_fcs_crc[14], eth_fcs_crc[15],
    eth_fcs_crc[0], eth_fcs_crc[1], eth_fcs_crc[2], eth_fcs_crc[3],
	eth_fcs_crc[4], eth_fcs_crc[5], eth_fcs_crc[6], eth_fcs_crc[7]
});

////////////////////////////////////////////////////////////////////////////////
// Packet input
reg [10:0] total_length;

integer s1, s1_next;
localparam S1_RESET=0, S1_IDLE=1, S1_DATA_0=2, S1_DATA_1=3, S1_SWAP=4, S1_WAIT=5;

always @(posedge mac_rx_aclk, negedge mac_rx_aresetn)
begin
	if(!mac_rx_aresetn)
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
			if(mac_rx_tvalid)
				if(mac_rx_tlast)
					s1_next = S1_DATA_1;
				else
					s1_next = S1_DATA_0;
			else
				s1_next = S1_IDLE;
		end
		S1_DATA_0: begin
			if(mac_rx_tvalid && mac_rx_tlast)
				s1_next = S1_DATA_1;
			else
				s1_next = S1_DATA_0;
		end
		S1_DATA_1: begin
            if(crc_error) 
                s1_next = S1_IDLE;
            else
                s1_next = S1_SWAP;
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

always @(posedge mac_rx_aclk, negedge mac_rx_aresetn)
begin
	if(!mac_rx_aresetn) begin
		mac_rx_tready <= 1'b0;
		write_select <= 1'b0;
		write_offset <= 'bx;
		write_enable <= 1'b0;
		write_data <= 'bx;
		total_length <= 'bx;
        eth_fcs_clr <= 1'bx;
	end
	else case(s1_next)
        S1_RESET: begin
        end
		S1_IDLE: begin
            write_enable <= 0;
            write_offset <= -1;
			mac_rx_tready <= 1'b1;
            eth_fcs_clr <= 1'b1;
		end
		S1_DATA_0, S1_DATA_1: begin
            eth_fcs_clr <= 1'b0;
			if(mac_rx_tvalid) begin
				write_enable <= 1'b1;
				write_data <= mac_rx_tdata;
				write_offset <= write_offset+1;
				if(mac_rx_tlast)
					mac_rx_tready <= 1'b0;
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
integer s2, s2_next;
localparam S2_RESET=0, S2_IDLE=1, S2_PAYLOAD=2, S2_SWAP=3;

always @(posedge payload_rx_aclk, negedge payload_rx_aresetn)
begin
	if(!payload_rx_aresetn)
		s2 <= S2_RESET;
	else
		s2 <= s2_next;
end

always @(*)
begin
	case(s2)
        S2_RESET: begin
            s2_next = S1_IDLE;
        end
		S2_IDLE: begin
			if(read_select != write_select_sync)
				s2_next = S2_PAYLOAD;
			else
				s2_next = S2_IDLE;
		end
		S2_PAYLOAD: begin
			if(read_next == read_length)
                s2_next = S2_SWAP;
			else
				s2_next = S2_PAYLOAD;
		end
		S2_SWAP: begin
			s2_next = S2_IDLE;
		end
		default: begin
			s2_next = 'bx;
		end
	endcase
end

always @(posedge payload_rx_aclk, negedge payload_rx_aresetn)
begin
	if(!payload_rx_aresetn) begin
		payload_rx_tvalid <= 1'b0;
		payload_rx_tlast <= 1'b0;
		read_length <= 'bx;
		read_offset <= 'bx;
		read_select <= 0;
	end
	else case(s2_next)
        S2_RESET: begin
        end
		S2_IDLE: begin
			read_length <= total_length-4;
			read_offset <= 8;
		end
		S2_PAYLOAD: begin
			read_offset <= read_next;
			payload_rx_tvalid <= 1'b1;
            payload_rx_tlast <= read_next == read_length-1;
		end
		S2_SWAP: begin
			payload_rx_tvalid <= 1'b0;
			payload_rx_tlast <= 1'b0;
			read_select <= ~read_select;
		end
	endcase
end

always @(*)
begin
	if(s2==S2_PAYLOAD && payload_rx_tready)
		read_next = read_offset + 1;
	else
		read_next = read_offset;

    payload_rx_tdata = read_data;
end

endmodule
