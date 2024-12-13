`timescale 1ns/1ps
module axi_master_model
#(
	parameter   M_AXI_ID_WIDTH = 4,
	parameter	M_AXI_DATA_WIDTH = 32,
	parameter	M_AXI_STRB_WIDTH = M_AXI_DATA_WIDTH/8
)
(
	// AXI Clock & Reset
	input   m_axi_aresetn,
	input	m_axi_aclk,

	// AXI Master Write Address
	output reg	[31:0]	m_axi_awaddr,
	output reg	m_axi_awvalid,
	input	m_axi_awready,
	output reg	[M_AXI_ID_WIDTH-1:0]	m_axi_awid,
	output reg	[7:0]	m_axi_awlen,
	output reg	[2:0]	m_axi_awsize,
	output reg	[1:0]	m_axi_awburst,
	//output	[0:0]	m_axi_awlock,
	//output	[3:0]	m_axi_awcache,
	//output	[2:0]	m_axi_awprot,
	//output	[3:0]	m_axi_awqos,

	// AXI Master Write Data
	output reg  [M_AXI_ID_WIDTH-1:0]    m_axi_wid,
	output reg	[M_AXI_DATA_WIDTH-1:0]	m_axi_wdata,
	output reg	[M_AXI_STRB_WIDTH-1:0]	m_axi_wstrb,
	output reg	m_axi_wvalid,
	input	m_axi_wready,
	output reg	m_axi_wlast,

	// AXI Master Write Response
	output reg	m_axi_bready,
	input	[1:0]	m_axi_bresp,
	input	m_axi_bvalid,
	input	[M_AXI_ID_WIDTH-1:0]	m_axi_bid,

	// AXI Master Read Address
	output reg	[31:0]	m_axi_araddr,
	output reg	m_axi_arvalid,
	input	m_axi_arready,
	output reg	[M_AXI_ID_WIDTH-1:0]	m_axi_arid,
	output reg	[7:0]	m_axi_arlen,
	output reg	[2:0]	m_axi_arsize,
	output reg	[1:0]	m_axi_arburst,
	//output	[0:0]	m_axi_arlock,
	//output	[3:0]	m_axi_arcache,
	//output	[2:0]	m_axi_arprot,
	//output	[3:0]	m_axi_arqos,

	// AXI Master Read Data
	output reg	m_axi_rready,
	input	[M_AXI_DATA_WIDTH-1:0]	m_axi_rdata,
	input	[1:0]	m_axi_rresp,
	input	m_axi_rvalid,
	input	[M_AXI_ID_WIDTH-1:0]	m_axi_rid,
	input	m_axi_rlast
);

reg [M_AXI_DATA_WIDTH-1:0] mem_rdata[0:255];
reg [M_AXI_DATA_WIDTH-1:0] mem_wdata[0:255];
reg [M_AXI_STRB_WIDTH-1:0] mem_wstrb[0:255];
reg [M_AXI_ID_WIDTH-1:0] id;
reg always_bready;
reg always_rready;
reg [7:0] read_idx;
reg [8:0] last_read_length;

integer read_count;
integer write_count;

task set_write_data(input [7:0] addr, input [M_AXI_DATA_WIDTH-1:0] data);
	mem_wdata[addr]=data;
endtask

task set_write_strb(input [7:0] addr, input [M_AXI_DATA_WIDTH-1:0] strb);
	mem_wstrb[addr]=strb;
endtask

task get_read_data(input [7:0] addr, output [M_AXI_DATA_WIDTH-1:0] data);
	data=mem_rdata[addr];
endtask

task set_id(input [M_AXI_ID_WIDTH-1:0] ids);
	id=ids;
endtask

task dump_read_data;
	integer i;
	begin
		$display("=========Read Data========");
		for(i=0;i<last_read_length;i=i+1)
			$display("%x",mem_rdata[i]);
		$display("============END===========");
	end
endtask

task write(input [31:0] addr, input [8:0] length);
	begin
		@(posedge m_axi_aclk);
		$display($time,,,"Write: %x %x",addr,length);

		fork 
			begin:ADDR
				m_axi_awid <= id;
				m_axi_awaddr <= addr;
				m_axi_awlen <= length-1;
				m_axi_awburst <= 2'b0;
				m_axi_awvalid <= 1'b1;
				@(posedge m_axi_aclk);
				while(!m_axi_awready) @(posedge m_axi_aclk);
				m_axi_awvalid <= 1'b0;
			end
			begin:DATA
				integer i;
				for(i=0;i<length;i=i+1) begin
					m_axi_wid <= id;
					m_axi_wdata <= mem_wdata[i];
					m_axi_wstrb <= mem_wstrb[i];
					m_axi_wvalid <= 1'b1;
					m_axi_wlast <= (i+1==length);
					@(posedge m_axi_aclk);
					while(!m_axi_wready) @(posedge m_axi_aclk);
				end
				m_axi_wvalid <= 1'b0;
			end
		join
		@(posedge m_axi_aclk);
	end
endtask

task wait_for_write();
	begin
		while(write_count>0)
			@(posedge m_axi_aclk);
	end
endtask

task read(input [31:0] addr, input [8:0] length);
	begin
		@(posedge m_axi_aclk);
		$display($time,,,"Read: %x %x",addr,length);

		m_axi_arid <= id;
		m_axi_araddr <= addr;
		m_axi_arlen <= length-1;
		m_axi_arburst <= 2'b0;
		m_axi_arvalid <= 1'b1;
		@(posedge m_axi_aclk);
		while(!m_axi_arready) @(posedge m_axi_aclk);
		m_axi_arvalid <= 1'b0;
	end
endtask

task wait_for_read();
	begin
		while(read_count>0)
			@(posedge m_axi_aclk);
	end
endtask

always @(posedge m_axi_aclk)
begin
	if(always_bready) begin
		m_axi_bready <= 1'b1;
	end
	else if(!m_axi_bready && m_axi_bvalid) begin
		m_axi_bready <= 1'b1;
	end
	else begin
		m_axi_bready <= 1'b0;
	end
end

always @(posedge m_axi_aclk)
begin
	if(always_rready) begin
		m_axi_rready <= 1'b1;
	end
	else if(!m_axi_rready && m_axi_rvalid) begin
		m_axi_rready <= 1'b1;
	end
	else begin
		m_axi_rready <= 1'b0;
	end
end

always @(posedge m_axi_aclk)
begin
	if(m_axi_bvalid && m_axi_bready) begin
		$display($time,,,"Write Resp: %x %x", m_axi_bid, m_axi_bresp);
	end
end

always @(posedge m_axi_aclk)
begin
	if(m_axi_rvalid && m_axi_rready) begin
		mem_rdata[read_idx] = m_axi_rdata;
		if(m_axi_rlast) begin
			last_read_length=read_idx+1;
			$display($time,,, "Read Resp: %x %x %x", m_axi_rid, m_axi_rresp, last_read_length);
			read_idx <= 0;
		end
		else begin
			read_idx <= read_idx+1;
		end
	end
end

always @(posedge m_axi_aclk)
begin
	if(m_axi_arvalid && m_axi_arready) begin
		if(!(m_axi_rvalid && m_axi_rready && m_axi_rlast)) begin
			read_count <= read_count+1;
		end
	end
	else if(m_axi_rvalid && m_axi_rready && m_axi_rlast) begin
		read_count <= read_count-1;
	end
end

always @(posedge m_axi_aclk)
begin
	if(m_axi_awvalid && m_axi_awready) begin
		if(!(m_axi_bvalid && m_axi_bready)) begin
			write_count <= write_count+1;
		end
	end
	else if(m_axi_bvalid && m_axi_bready) begin
		write_count <= write_count-1;
	end
end

initial
begin
	m_axi_awaddr = 0;
	m_axi_awvalid =0;
	m_axi_awid = 0;
	m_axi_awlen = 0;
	m_axi_awsize = M_AXI_STRB_WIDTH;
	m_axi_awburst = 0;
	m_axi_wdata = 0;
	m_axi_wstrb = 0;
	m_axi_wvalid = 0;
	m_axi_wlast = 0;
	m_axi_bready = 0;
	m_axi_araddr = 0;
	m_axi_arvalid = 0;
	m_axi_arid = 0;
	m_axi_arlen = 0;
	m_axi_arsize = M_AXI_STRB_WIDTH;
	m_axi_arburst = 0;
	m_axi_rready = 0;
	id = 0;
	always_rready=0;
	always_bready=0;
	read_idx = 0;
	last_read_length = 0;

	read_count = 0;
	write_count = 0;
end

endmodule
