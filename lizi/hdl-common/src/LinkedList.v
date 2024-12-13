////////////////////////////////////////////////////////////////////////////////
// File:	LinkedList.v
// Author:	Jonah Liu <liujiahan@gmail.com>
// Description:
//  Double linked list implementation.
//  Maintains a static array for next and prev pointer. Data storage should
//  be statically refered to by pointers. This module does not care about data 
//  at all. It only implements operation on pointers.
//  List items are sorted by index number in rising order, this will make
//  insertion and deletion easier.
//  A last-in-first-out scheme, aka a stack is used for free index allocation.
//
////////////////////////////////////////////////////////////////////////////////
module LinkedList
(
	rst_i,
	clk_i,
	init_done_o,
	size_o,
	new_cmd_i,
	new_rdy_o,
	new_idx_o,
	link_src_i,
	link_dest_i,
	link_cmd_i,
	link_rdy_o,
	lookup_idx_i,
	lookup_cmd_i,
	lookup_rdy_o,
	lookup_next_o,
	lookup_prev_o,
	delete_idx_i,
	delete_cmd_i,
	delete_rdy_o
);
parameter INDEX_BITS=8;

input	rst_i;
input	clk_i;

output	init_done_o;

output	[INDEX_BITS-1:0] size_o;

input	new_cmd_i;
output	new_rdy_o;
output	[INDEX_BITS-1:0] new_idx_o;

input	[INDEX_BITS-1:0] link_src_i;
input	[INDEX_BITS-1:0] link_dest_i;
input	link_cmd_i;
output	link_rdy_o;

input	[INDEX_BITS-1:0] lookup_idx_i;
input	lookup_cmd_i;
output	lookup_rdy_o;
output	[INDEX_BITS-1:0] lookup_next_o;
output	[INDEX_BITS-1:0] lookup_prev_o;

input	[INDEX_BITS-1:0] delete_idx_i;
input	delete_cmd_i;
output	delete_rdy_o;

reg init_done_o;

reg [INDEX_BITS-1:0] size_o;

reg	new_rdy_o;
reg	[INDEX_BITS-1:0] new_idx_o;

reg	link_rdy_o;

reg	lookup_rdy_o;
reg	[INDEX_BITS-1:0] lookup_next_o;
reg	[INDEX_BITS-1:0] lookup_prev_o;

reg	delete_rdy_o;

reg [INDEX_BITS-1:0] free_tbl_mem[0:2**INDEX_BITS-1];
reg [INDEX_BITS-1:0] free_tbl_raddr;
reg [INDEX_BITS-1:0] free_tbl_rdata;
reg [INDEX_BITS-1:0] free_tbl_waddr;
reg [INDEX_BITS-1:0] free_tbl_wdata;
reg free_tbl_write;

reg [INDEX_BITS-1:0] item_prev_mem[0:2**INDEX_BITS-1]; 
reg [INDEX_BITS-1:0] item_next_mem[0:2**INDEX_BITS-1]; 
reg [INDEX_BITS-1:0] item_tbl_raddr;
reg [INDEX_BITS-1:0] item_prev_rdata;
reg [INDEX_BITS-1:0] item_next_rdata;
reg [INDEX_BITS-1:0] item_tbl_waddr;
reg [INDEX_BITS-1:0] item_prev_wdata;
reg [INDEX_BITS-1:0] item_next_wdata;
reg item_prev_write;
reg item_next_write;

reg [INDEX_BITS-1:0] src;
reg [INDEX_BITS-1:0] dest;
reg [INDEX_BITS-1:0] src_prev;
reg [INDEX_BITS-1:0] src_next;
reg [INDEX_BITS-1:0] dest_prev;
reg [INDEX_BITS-1:0] dest_next;

reg free_tbl_empty;
reg no_sibling;

always @(posedge clk_i)
begin
	if(free_tbl_write)
		free_tbl_mem[free_tbl_waddr] <= free_tbl_wdata;
end

always @(posedge clk_i)
begin
	free_tbl_rdata <= free_tbl_mem[free_tbl_raddr];
end

always @(posedge clk_i)
begin
	if(item_prev_write)
		item_prev_mem[item_tbl_waddr] <= item_prev_wdata;
end

always @(posedge clk_i)
begin
	item_prev_rdata <= item_prev_mem[item_tbl_raddr];
end

always @(posedge clk_i)
begin
	if(item_next_write)
		item_next_mem[item_tbl_waddr] <= item_next_wdata;
end

always @(posedge clk_i)
begin
	item_next_rdata <= item_next_mem[item_tbl_raddr];
end

localparam S1_INIT=0;
localparam S1_INIT_0=S1_INIT, S1_INIT_1=S1_INIT+1;

localparam S1_IDLE=10;

localparam S1_NEW=20;
localparam S1_NEW_0=S1_NEW;

localparam S1_LINK=30;
localparam S1_LINK_0=S1_LINK, S1_LINK_1=S1_LINK+1, S1_LINK_2=S1_LINK+2, S1_LINK_3=S1_LINK+3,
			S1_LINK_4=S1_LINK+4, S1_LINK_5=S1_LINK+5;

localparam S1_LOOKUP=40;
localparam S1_LOOKUP_0=S1_LOOKUP, S1_LOOKUP_1=S1_LOOKUP+1, S1_LOOKUP_2=S1_LOOKUP+2;

localparam S1_DELETE=50;
localparam S1_DELETE_0=S1_DELETE, S1_DELETE_1=S1_DELETE+1, S1_DELETE_2=S1_DELETE+2,
			S1_DELETE_3=S1_DELETE+3, S1_DELETE_4=S1_DELETE+4, S1_DELETE_5=S1_DELETE+5;

localparam S1_CHECK=60;
localparam S1_CHECK_0=S1_CHECK, S1_CHECK_1=S1_CHECK+1, S1_CHECK_2=S1_CHECK+2;


integer s1, s1_next;

always @(posedge clk_i, posedge rst_i)
begin
	if(rst_i)
		s1 <= S1_INIT;
	else
		s1 <= s1_next;
end

always @(*)
begin
	case(s1)
		S1_INIT_0: begin
			if(init_done_o)
				s1_next = S1_INIT_1;
			else
				s1_next = S1_INIT_0;
		end
		S1_INIT_1: begin
			s1_next = S1_IDLE;
		end
		S1_IDLE: begin
			if(new_cmd_i && !free_tbl_empty) // if index available
				s1_next = S1_NEW;
			else if(link_cmd_i)
				s1_next = S1_CHECK;
			else if(lookup_cmd_i)
				s1_next = S1_LOOKUP;
			else if(delete_cmd_i)
				s1_next = S1_DELETE;
			else
				s1_next = S1_IDLE;
		end
		S1_NEW_0: begin
			s1_next = S1_IDLE;
		end
		S1_CHECK_0: begin
			s1_next = S1_CHECK_1;
		end
		S1_CHECK_1: begin
			s1_next = S1_CHECK_2;
		end
		S1_CHECK_2: begin
			if(item_next_rdata==dest) // already linked
				s1_next = S1_IDLE;
			else if(item_next_rdata==src) // traverse end
				s1_next = S1_LINK;
			else
				s1_next = S1_CHECK_1;
		end
		S1_LINK_0: begin
			s1_next = S1_LINK_1;
		end
		S1_LINK_1: begin
			s1_next = S1_LINK_2;
		end
		S1_LINK_2: begin
			s1_next = S1_LINK_3;
		end
		S1_LINK_3: begin
			s1_next = S1_LINK_4;
		end
		S1_LINK_4: begin
			s1_next = S1_LINK_5;
		end
		S1_LINK_5: begin
			s1_next = S1_IDLE;
		end
		S1_LOOKUP_0: begin
			s1_next = S1_LOOKUP_1;
		end
		S1_LOOKUP_1: begin
			s1_next = S1_LOOKUP_2;
		end
		S1_LOOKUP_2: begin
			s1_next = S1_IDLE;
		end
		S1_DELETE_0: begin
			s1_next = S1_DELETE_1;
		end
		S1_DELETE_1: begin
			s1_next = S1_DELETE_2;
		end
		S1_DELETE_2: begin
			//if(src_next==src) // no sibling
			if(no_sibling)
				s1_next = S1_IDLE;
			else
				s1_next = S1_DELETE_3;
		end
		S1_DELETE_3: begin
			s1_next = S1_DELETE_4;
		end
		S1_DELETE_4: begin
			s1_next = S1_DELETE_5;
		end
		S1_DELETE_5: begin
			s1_next = S1_IDLE;
		end
		default: begin
			s1_next = 'bx;
		end
	endcase
end

always @(posedge clk_i, posedge rst_i)
begin
	if(rst_i) begin
		free_tbl_raddr <= 'b0;
		free_tbl_waddr <= 'b0;
		free_tbl_wdata <= 'b0;
		free_tbl_write <= 1'b0;

		item_tbl_raddr <= 'bx;
		item_tbl_waddr <= 'b0;
		item_prev_wdata <= 'b0;
		item_next_wdata <= 'b0;
		item_prev_write <= 1'b0;
		item_next_write <= 1'b0;

		new_rdy_o <= 1'b0;
		link_rdy_o <= 1'b0;
		lookup_rdy_o <= 1'b0;
		delete_rdy_o <= 1'b0;

		new_idx_o <= 'bx;

		lookup_prev_o <= 'bx;
		lookup_next_o <= 'bx;

		src <= 'bx;
		dest <= 'bx;
		src_prev <= 'bx;
		src_next <= 'bx;
		dest_prev <= 'bx;
		dest_next <= 'bx;

		size_o <= 'b0;

		init_done_o <= 1'b0;
		free_tbl_empty <= 1'b0;

		no_sibling <= 1'bx;
	end
	else case(s1_next)
		S1_INIT_0: begin
			free_tbl_waddr <= free_tbl_waddr+1;
			free_tbl_raddr <= free_tbl_raddr+1;
			free_tbl_wdata <= free_tbl_wdata+1;
			free_tbl_write <= 1'b1;

			item_tbl_waddr <= item_tbl_waddr+1;
			item_prev_wdata <= 'b0;
			item_prev_write <= 1'b1;
			item_next_wdata <= 'b0;
			item_next_write <= 1'b1;

			init_done_o <= &free_tbl_waddr;
		end
		S1_INIT_1: begin
			// Incr from 0 to 1
			free_tbl_waddr <= free_tbl_waddr+1;
			free_tbl_raddr <= free_tbl_raddr+1;
			free_tbl_write <= 1'b0;

			item_prev_write <= 1'b0;
			item_next_write <= 1'b0;
		end
		S1_IDLE: begin
			new_rdy_o <= 1'b0;
			link_rdy_o <= 1'b0;
			lookup_rdy_o <= 1'b0;
			delete_rdy_o <= 1'b0;

			free_tbl_write <= 1'b0;
			item_prev_write <= 1'b0;
			item_next_write <= 1'b0;

			init_done_o <= 1'b1;

			free_tbl_empty <= !(|free_tbl_raddr);
		end
		S1_NEW_0: begin
			new_idx_o <= free_tbl_rdata;
			new_rdy_o <= 1'b1;

			free_tbl_raddr <= free_tbl_raddr+1;
			free_tbl_waddr <= free_tbl_waddr+1;

			item_tbl_waddr <= free_tbl_rdata;
			item_prev_wdata <= free_tbl_rdata;
			item_prev_write <= 1'b1;
			item_next_wdata <= free_tbl_rdata;
			item_next_write <= 1'b1;

			size_o <= size_o+1;
		end
		S1_LOOKUP_0: begin
			item_tbl_raddr <= lookup_idx_i;
		end
		S1_LOOKUP_1: begin
		end
		S1_LOOKUP_2: begin
			lookup_prev_o <= item_prev_rdata;
			lookup_next_o <= item_next_rdata;
			lookup_rdy_o <= 1'b1;
		end
		S1_DELETE_0: begin // Read current item
			item_tbl_raddr <= delete_idx_i;
			src <= delete_idx_i;
			delete_rdy_o <= 1'b1;
			size_o <= size_o-1;
		end
		S1_DELETE_1: begin // Read latency
			delete_rdy_o <= 1'b0;

			// Push current pointer
			free_tbl_raddr <= free_tbl_raddr-1;
			free_tbl_waddr <= free_tbl_raddr-1;
			free_tbl_wdata <= src;
			free_tbl_write <= 1'b1;
		end
		S1_DELETE_2: begin
			free_tbl_write <= 1'b0;
			// Save prev and next pointer
			src_prev <= item_prev_rdata;
			src_next <= item_next_rdata;

			// Read prev item
			item_tbl_raddr <= item_prev_rdata;

			no_sibling <= item_next_rdata==src;

			// Clear current item
			item_tbl_waddr <= src;
			item_prev_wdata <= 'b0;
			item_prev_write <= 1'b1;
			item_next_wdata <= 'b0;
			item_next_write <= 1'b1;
		end
		S1_DELETE_3: begin
			// Read next item
			item_tbl_raddr <= src_next;

			item_prev_write <= 1'b0;
			item_next_write <= 1'b0;

		end
		S1_DELETE_4: begin
			item_tbl_waddr <= src_prev;
			item_next_wdata <= src_next;
			item_next_write <= 1'b1;
			item_prev_write <= 1'b0;
		end
		S1_DELETE_5: begin
			item_tbl_waddr <= src_next;
			item_prev_wdata <= src_prev;
			item_prev_write <= 1'b1;
			item_next_write <= 1'b0;
		end
		S1_CHECK_0: begin
			item_tbl_raddr <= link_src_i;
			src <= link_src_i;
			dest <= link_dest_i;
			link_rdy_o <= 1'b1;
		end
		S1_CHECK_1: begin
			link_rdy_o <= 1'b0;
		end
		S1_CHECK_2: begin
			item_tbl_raddr <= item_next_rdata;
		end
		S1_LINK_0: begin
			item_tbl_raddr <= link_src_i;
		end
		S1_LINK_1: begin
			item_tbl_raddr <= dest;
			link_rdy_o <= 1'b0;
		end
		S1_LINK_2: begin
			src_prev <= item_prev_rdata;
			src_next <= item_next_rdata;
			item_tbl_raddr <= item_prev_rdata; // src->prev
			// src->prev = dest;
			item_tbl_waddr <= src;
			item_prev_wdata <= dest;
			item_prev_write <= 1'b1;
			item_next_write <= 1'b0;
		end
		S1_LINK_3: begin
			dest_prev <= item_prev_rdata;
			dest_next <= item_next_rdata;
			item_tbl_raddr <= item_next_rdata; // dest->next
			// dest->next = src 
			item_tbl_waddr <= dest;
			item_next_wdata <= src;
			item_next_write <= 1'b1;
			item_prev_write <= 1'b0;
		end
		S1_LINK_4: begin
			// src->prev->next = dest->next
			item_tbl_waddr <= src_prev;
			item_next_wdata <= dest_next;
			item_next_write <= 1'b1;
			item_prev_write <= 1'b0;
		end
		S1_LINK_5: begin
			// dest->next->prev = src->prev
			item_tbl_waddr <= dest_next;
			item_prev_wdata <= src_prev;
			item_prev_write <= 1'b1;
			item_next_write <= 1'b0;
		end
	endcase
end

endmodule

