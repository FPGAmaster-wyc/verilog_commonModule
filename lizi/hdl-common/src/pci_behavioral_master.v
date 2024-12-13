`timescale 1ns/10ps
`define BD #1
module pci_behavioral_master(
	// PCI Bus Signals
	inout  [31:0] AD,
	inout   [3:0] CBE,
	inout         PAR,
	inout         FRAME_N,
	inout         TRDY_N,
	inout         IRDY_N,
	inout         STOP_N,
	inout         DEVSEL_N,
	input         IDSEL,
	inout         PERR_N,
	inout         SERR_N,
	output        INTA_N,
	output        REQ_N,
	input         GNT_N,
	input         RST_N,
	input         PCLK
);

localparam 
	CMD_INTR_ACK = 4'h0,
	CMD_SPECIAL = 4'h1,
	CMD_IO_READ = 4'h2,
	CMD_IO_WRITE = 4'h3,
	CMD_MEM_READ = 4'h6,
	CMD_MEM_WRITE = 4'h7,
	CMD_CONF_READ = 4'hA,
	CMD_CONF_WRITE = 4'hB,
	CMD_MEM_READ_MUL = 4'hC,
	CMD_DUAL_ADDR_CYC = 4'hD,
	CMD_MEM_READ_LN = 4'hE,
	CMD_MEM_WRITE_INVAL = 4'hF;


reg [31:0] ad_o;
reg [3:0] cbe_o;
reg par_o;
reg frame_n_o;
reg trdy_n_o;
reg irdy_n_o;
reg stop_n_o;
reg devsel_n_o;
reg perr_n_o;
reg serr_n_o;
reg inta_n_o;
reg req_n_o;
wire [31:0] ad_i=AD;
wire [3:0] cbe_i=CBE;
wire par_i=PAR;
wire frame_n_i=FRAME_N;
wire trdy_n_i=TRDY_N;
wire irdy_n_i=IRDY_N;
wire stop_n_i=STOP_N;
wire devsel_n_i=DEVSEL_N;
wire idsel_i=IDSEL;
wire perr_n_i=PERR_N;
wire serr_n_i=SERR_N;
wire inta_n_i=INTA_N;
wire gnt_n_i=GNT_N;
wire rst=!RST_N;
wire clk=PCLK;

assign AD=ad_o;
assign CBE=cbe_o;
assign PAR=par_o;
assign FRAME_N=frame_n_o;
assign TRDY_N=trdy_n_o;
assign IRDY_N=irdy_n_o;
assign STOP_N=stop_n_o;
assign DEVSEL_N=devsel_n_o;
assign PERR_N=perr_n_o;
assign SERR_N=serr_n_o;
assign INTA_N=inta_n_o;
assign REQ_N=req_n_o;

initial
begin
	ad_o='bz;
	cbe_o='bz;
	par_o='bz;
	frame_n_o='bz;
	trdy_n_o='bz;
	irdy_n_o='bz;
	stop_n_o='bz;
	devsel_n_o='bz;
	perr_n_o='bz;
	serr_n_o='bz;
	inta_n_o='bz;
	req_n_o='bz;
end

task request_bus;
begin
	@(posedge clk);
	req_n_o <= `BD 1'b0;
	@(posedge clk);
	while(gnt_n_i || !(frame_n_i&&irdy_n_i&&trdy_n_i&&stop_n_i&&devsel_n_i)) @(posedge clk);
end
endtask

task release_bus;
begin
	@(posedge clk);
	req_n_o <= `BD 1'bz;
end
endtask

reg [31:0] write_data[0:15];
reg [3:0] write_be[0:15];

task low_level_write(
	input [31:0] command,
	input [31:0] address,
	input [4:0] length,
	output [4:0] rc
);
integer i;
begin
	request_bus;
	@(posedge clk);
	ad_o <= `BD address;
	cbe_o <= `BD command;
	frame_n_o <= `BD 1'b0;
	@(posedge clk);
	par_o <= `BD ^{ad_o, cbe_o};
	if(length==1) begin
		frame_n_o <= `BD 1'b1;
	end
	irdy_n_o <= `BD 1'b0;
	ad_o <= `BD write_data[0];
	cbe_o <= `BD write_be[0];
	@(posedge clk);
	for(i=0;devsel_n_i && i<16;i=i+1) @(posedge clk);
	if(i<16) begin
		i=0;
		while(i<length && stop_n_i) begin
			if(!trdy_n_i) begin
				i=i+1;
				par_o <= `BD ^{ad_o, cbe_o};
				ad_o <= `BD write_data[i];
				cbe_o <= `BD write_be[i];
				if(i==length-1) frame_n_o <= `BD 1'b1;
			end
			if(i<length) @(posedge clk);
		end
	end
	if(!stop_n_i && !frame_n_o) begin
		frame_n_o <= 1'b1;
		par_o <= `BD ^{ad_o, cbe_o};
		@(posedge clk);
	end
	par_o <= `BD ^{ad_o, cbe_o};
	frame_n_o <= `BD 1'b1;
	irdy_n_o <= `BD 1'b1;
	ad_o <= `BD 'bz;
	cbe_o <= `BD 'bz;
	@(posedge clk);
	frame_n_o <= `BD 1'bz;
	irdy_n_o <= `BD 1'bz;
	par_o <= `BD 'bz;
	release_bus;
end
endtask

reg [31:0] read_data[0:15];
reg [3:0] read_be[0:15];

task low_level_read(
	input [31:0] command,
	input [31:0] address,
	input [4:0] length,
	output [4:0] rc
);
integer i;
begin
	request_bus;
	@(posedge clk);
	ad_o <= `BD address;
	cbe_o <= `BD command;
	frame_n_o <= `BD 1'b0;
	@(posedge clk);
	par_o <= `BD ^{ad_o, cbe_o};
	if(length==1) begin
		frame_n_o <= `BD 1'b1;
	end
	irdy_n_o <= `BD 1'b0;
	ad_o <= `BD 'bz;
	cbe_o <= `BD 'bz;
	@(posedge clk);
	par_o <= `BD 1'bz;
	@(posedge clk);
	for(i=0;devsel_n_i && i<16;i=i+1) @(posedge clk);
	if(i<16) begin
		i=0;
		while(i<length && stop_n_i) begin
			if(!trdy_n_i) begin
				i=i+1;
				read_data[i] = ad_i;
				if(i==length-1) frame_n_o <= `BD 1'b1;
			end
			if(i<length) @(posedge clk);
		end
	end
	if(!stop_n_i && !frame_n_o) begin
		frame_n_o <= 1'b1;
		@(posedge clk);
	end
	frame_n_o <= `BD 1'b1;
	irdy_n_o <= `BD 1'b1;
	@(posedge clk);
	frame_n_o <= `BD 1'bz;
	irdy_n_o <= `BD 1'bz;
	release_bus;
end
endtask

task single_write_transfer(
	input [31:0] address,
	input [31:0] data,
	input [3:0] be,
	input [3:0] cmd,
	output [3:0] resp
);
begin
	request_bus;
	@(posedge clk);
	ad_o <= `BD address;
	cbe_o <= `BD cmd;
	frame_n_o <= `BD 1'b0;
	par_o <= `BD 1'b0;
	@(posedge clk);
	frame_n_o <= 1'b1;
	irdy_n_o <= `BD 1'b0;
	par_o <= `BD ^{ad_o, cbe_o};
	ad_o <= `BD data;
	cbe_o <= `BD ~be;
	while(devsel_n_i || 
		(trdy_n_i && stop_n_i && perr_n_i && serr_n_i)) begin
		@(posedge clk);
		par_o <= `BD ^{ad_o, cbe_o};
	end
	resp = {serr_n_i,perr_n_i,stop_n_i, trdy_n_i};
	irdy_n_o <= `BD 1'b1;
	ad_o <= `BD 'bz;
	cbe_o <= `BD 'bz;
	@(posedge clk);
	frame_n_o <= `BD 1'bz;
	irdy_n_o <= `BD 1'bz;
	par_o <= `BD 'bz;
	release_bus;
end
endtask

task single_read_transfer(
	input [31:0] address,
	input [3:0] be,
	input [3:0] cmd,
	output [31:0] data,
	output [3:0] resp
);
begin
	request_bus;
	@(posedge clk);
	ad_o <= `BD address;
	cbe_o <= `BD cmd;
	frame_n_o <= `BD 1'b0;
	par_o <= `BD 1'b0;
	@(posedge clk);
	par_o <= `BD ^{ad_o, cbe_o};
	frame_n_o <= `BD 1'b1;
	irdy_n_o <= `BD 1'b0;
	ad_o <= `BD 'bz;
	cbe_o <= `BD ~be;
	@(posedge clk);
	par_o <= `BD 'bz;
	while(devsel_n_i || 
		trdy_n_i && stop_n_i && perr_n_i && serr_n_i) begin
		@(posedge clk);
	end
	resp = {serr_n_i,perr_n_i,stop_n_i, trdy_n_i};
	data = ad_i;
	irdy_n_o <= `BD 1'b1;
	cbe_o <= `BD 'bz;
	@(posedge clk);
	frame_n_o <= `BD 1'bz;
	irdy_n_o <= `BD 1'bz;
	release_bus;
end
endtask

task config_write( input [31:0] address,
	input [31:0] data,
	input [3:0] be
);
reg [3:0] resp;
begin
	resp = 4'hF;
	while(resp[0]==1 && resp[3:2]==2'b11) begin
		single_write_transfer(address, data, be, CMD_CONF_WRITE, resp);
		if(resp[0]==0)
			$display("PCI CFG WR @%x = %x (%b), OK", address, data, be);
		else if(resp[3:2]==2'b11)
			$display("PCI CFG WR @%x = %x (%b), Retry (%b)", address, data, be, resp);
		else
			$display("PCI CFG WR @%x = %x (%b), Error (%b)", address, data, be, resp);
	end
end
endtask

task config_read(
	input [31:0] address,
	input [3:0] be,
	output [31:0] data
);
reg [3:0] resp;
begin
	resp = 4'hF;
	while(resp[0]==1 && resp[3:2]==2'b11) begin
		single_read_transfer(address, be, CMD_CONF_READ, data, resp);
		if(resp[0]==0)
			$display("PCI CFG RD @%x, OK (%x)", address, data);
		else if(resp[3:2]==2'b11)
			$display("PCI CFG RD @%x, Retry (%b)", address, resp);
		else
			$display("PCI CFG RD @%x, Error (%b)", address, resp);
	end
end
endtask

task memory_write(
	input [31:0] address,
	input [31:0] data,
	input [3:0] be
);
reg [3:0] resp;
begin
	resp = 4'hF;
	while(resp[0]==1 && resp[3:2]==2'b11) begin
		single_write_transfer(address, data, be, CMD_MEM_WRITE, resp);
		if(resp[0]==0)
			$display("PCI MEM WR @%x = %x (%b), OK", address, data, be);
		else if(resp[3:2]==2'b11)
			$display("PCI MEM WR @%x = %x (%b), Retry (%b)", address, data, be, resp);
		else
			$display("PCI MEM WR @%x = %x (%b), Error (%b)", address, data, be, resp);
	end
end
endtask

task memory_read(
	input [31:0] address,
	input [3:0] be,
	output [31:0] data
);
reg [3:0] resp;
begin
	resp = 4'hF;
	while(resp[0]==1 && resp[3:2]==2'b11) begin
		single_read_transfer(address, be, CMD_MEM_READ, data, resp);
		if(resp[0]==0)
			$display("PCI MEM RD @%x, OK (%x)", address, data);
		else if(resp[3:2]==2'b11)
			$display("PCI MEM RD @%x, Retry (%b)", address, resp);
		else
			$display("PCI MEM RD @%x, Error (%b)", address, resp);
	end
end
endtask

task io_write(
	input [31:0] address,
	input [31:0] data,
	input [3:0] be
);
reg [3:0] resp;
begin
	resp = 4'hF;
	while(resp[0]==1 && resp[3:2]==2'b11) begin
		single_write_transfer(address, data, be, CMD_IO_WRITE, resp);
		if(resp[0]==0)
			$display("PCI IO WR @%x = %x (%b), OK", address, data, be);
		else if(resp[3:2]==2'b11)
			$display("PCI IO WR @%x = %x (%b), Retry (%b)", address, data, be, resp);
		else
			$display("PCI IO WR @%x = %x (%b), Error (%b)", address, data, be, resp);
	end
end
endtask

task io_read(
	input [31:0] address,
	input [3:0] be,
	output [31:0] data
);
reg [3:0] resp;
begin
	resp = 4'hF;
	while(resp[0]==1 && resp[3:2]==2'b11) begin
		single_read_transfer(address, be, CMD_IO_READ, data, resp);
		if(resp[0]==0)
			$display("PCI IO RD @%x, OK (%x)", address, data);
		else if(resp[3:2]==2'b11)
			$display("PCI IO RD @%x, Retry (%b)", address, resp);
		else
			$display("PCI IO RD @%x, Error (%b)", address, resp);
	end
end
endtask

endmodule
