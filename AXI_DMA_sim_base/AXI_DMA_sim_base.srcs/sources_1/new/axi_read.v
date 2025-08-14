////////////////////////////////////////////////////////////////////////////////
// File:	axi_read.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	AXI Reading Model.
////////////////////////////////////////////////////////////////////////////////

module axi_read #
(
    parameter integer RD_FLIP_BYTE   = 0     ,//0������ת  1����ת    //��С���Ƿ�ת
    parameter integer RD_ADDR_WIDTH	= 32    ,                      //��ַλ��
    parameter integer RD_DATA_WIDTH	= 64    ,//32,64,128           //����λ��
    parameter integer RD_LIN	    = 16     //1-256               //ͻ������
)
(
    //�������ź�
    input                               i_wr_done       ,
    //��������  
    input                               M_RD_aclk       ,
    input                               M_RD_aresetn    ,
    output  wire                        M_RD_tlast      ,
    output  wire                        M_RD_tvalid     ,
    output  wire [RD_DATA_WIDTH-1:0]    M_RD_tdata      ,
    input   wire                        M_RD_tready     , 
    //AXI����     
    input   wire                        m_axi_aclk      ,
    input   wire                        m_axi_aresetn   ,
    output  wire                        m_axi_arid      ,
    output  wire [RD_ADDR_WIDTH-1 : 0]  m_axi_araddr    ,
    output  wire [7 : 0]                m_axi_arlen     ,
    output  wire [2 : 0]                m_axi_arsize    ,
    output  wire [1 : 0]                m_axi_arburst   ,
    output  wire                        m_axi_arlock    ,
    output  wire [3 : 0]                m_axi_arcache   ,
    output  wire [2 : 0]                m_axi_arprot    ,
    output  wire [3 : 0]                m_axi_arqos     ,
    output  wire                        m_axi_arvalid   ,
    input   wire                        m_axi_arready   ,
    input   wire                        m_axi_rid       ,
    input   wire [RD_DATA_WIDTH-1 : 0]  m_axi_rdata     ,
    input   wire [1 : 0]                m_axi_rresp     ,
    input   wire                        m_axi_rlast     ,
    input   wire                        m_axi_rvalid    ,
    output  wire                        m_axi_rready    
);

    //����ַ������
    reg     [31:0]              ar_addr     ;
    reg     [7:0]               ar_len      ;
    reg     [2:0]               ar_size     ;
    reg     [1:0]               ar_burst    ;
    reg                         ar_valid    ;
    wire                        ar_ready    ;
    wire    [RD_DATA_WIDTH-1:0] r_data      ;
    wire                        r_resp      ;
    wire                        r_last      ;
    wire                        r_valid     ;
    reg                         r_ready     ;

    //����ַ����ͼ���
    reg     [31:0]              rd_addr_buff;
    reg     [7:0]               num_rd_cnt  ;

    //״̬��
    reg     [2:0]               c_state     ;
    reg     [2:0]               n_state     ;
    localparam  RD_IDLE_0     = 0,           
                RD_ADDR_1     = 1,
                RD_DATA_2     = 2,
                RD_LAST_3     = 3,
                RD_STOP_4     = 4;

    //ʱ�ӡ����ݡ�ͻ����Ϣ����
    wire                        i_clk       ;
    wire                        i_rst_n     ;
    wire    [2:0]               arsize      ;
    wire    [7:0]               arlen       ;
    reg                         o_last      ;
    reg                         o_valid     ;
    wire                        i_ready     ;
    reg     [RD_DATA_WIDTH-1:0]    o_data   ;	

    //״̬ת�� FSM31
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) c_state <= RD_IDLE_0;  // �첽��λ
        else          c_state <= n_state;   // ״̬����
    end

   //״̬��ת���� FSM32
    always @(*) begin : R_FMS2        
        case (c_state)
            RD_IDLE_0:   n_state = (i_wr_done) ? RD_ADDR_1 : RD_IDLE_0;  // ��⵽д�������ת
            RD_ADDR_1:   n_state = (ar_len == 0 && ar_ready && ar_valid) ? RD_LAST_3 : ((ar_valid && ar_ready) ? RD_DATA_2 : RD_ADDR_1); // ��ַ׼��������ת
            RD_DATA_2:   n_state = (num_rd_cnt == ar_len-1 && r_valid && r_ready) ? RD_LAST_3 : RD_DATA_2;  // �������һ����������ת
            RD_LAST_3:   n_state = (r_valid && r_ready) ? RD_STOP_4 : RD_LAST_3;          // ���һ�ʴ����������ת
            RD_STOP_4:   n_state = RD_IDLE_0;                                          // �Զ��ص��ȴ�״̬
            default:   n_state = 0;                                                 // �쳣�����λ
        endcase
    end

    //״ִ̬�еĲ��� FSM33
    always @(posedge i_clk or negedge i_rst_n) begin : R_FMS3
        if (~i_rst_n) begin
            {ar_addr, ar_len, ar_burst, ar_size, ar_valid, o_last} <= 0;
            rd_addr_buff <= 0;
        end
        else case (n_state)            
            RD_ADDR_1: begin
                ar_valid <= 1;
                ar_addr  <= rd_addr_buff;
                ar_len   <= arlen;
                ar_burst <= 2'd1;
                ar_size  <= arsize;
            end
    
            RD_DATA_2: ar_valid <= 0;
    
            RD_LAST_3: begin
                o_last <= 1;
                ar_valid <= 0;
            end
    
            RD_STOP_4: begin
                o_last <= 0;
                rd_addr_buff <= (rd_addr_buff >= 32'h10000 - 4096) ? 0 : rd_addr_buff + 4096;
            end
        endcase
    end
 
    // data valid ready ����    
    always @(*) begin
        r_ready = (c_state == RD_DATA_2 || c_state == RD_LAST_3) ? i_ready : 0;
        o_data  = (c_state == RD_DATA_2 || c_state == RD_LAST_3) ? r_data  : 0;
        o_valid = (c_state == RD_DATA_2 || c_state == RD_LAST_3) ? r_valid : 0;
    end

    //��ͻ�����ݼ���
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)    num_rd_cnt <= 0;
        else             num_rd_cnt <= o_last ? 0 : (r_valid && r_ready) ? num_rd_cnt + 1 : num_rd_cnt;
    end
	
	//��С��ת��
	generate
		if (RD_FLIP_BYTE == 1) begin
			if (RD_DATA_WIDTH == 32) begin
				// 32-bit �ֽڷ�ת
				assign M_RD_tdata = {
					o_data[7:0],   o_data[15:8],
					o_data[23:16], o_data[31:24]
				};
			end else if (RD_DATA_WIDTH == 64) begin
				// 64-bit �ֽڷ�ת
				assign M_RD_tdata = {
					o_data[7:0],    o_data[15:8],
					o_data[23:16],  o_data[31:24],
					o_data[39:32],  o_data[47:40],
					o_data[55:48],  o_data[63:56]
				};
			end else if (RD_DATA_WIDTH == 128) begin
				// 128-bit �ֽڷ�ת
				assign M_RD_tdata = {
					o_data[7:0],     o_data[15:8], 
					o_data[23:16],   o_data[31:24],
					o_data[39:32],   o_data[47:40],
					o_data[55:48],   o_data[63:56],
					o_data[71:64],   o_data[79:72],
					o_data[87:80],   o_data[95:88],
					o_data[103:96],  o_data[111:104],
					o_data[119:112], o_data[127:120]
				};
			end
		end else begin
			assign M_RD_tdata = o_data;  // ����ת
		end
	endgenerate

    //----------------------------------------------------------
    // λ����㺯��
    // ʹ�÷���
    // localparam RD_DATA_WIDTH = clogb2(depth); //����λ��
    //----------------------------------------------------------

    function integer clogb2 (input integer depth);
    begin
        for(clogb2=0; depth>0; clogb2=clogb2+1) 
            depth = depth >> 1;
    end
    endfunction

    assign m_axi_araddr     = ar_addr       ;
    assign m_axi_arlen      = ar_len        ;
    assign m_axi_arsize     = ar_size       ;
    assign m_axi_arburst    = ar_burst      ;
    assign m_axi_arvalid    = ar_valid      ;
    assign ar_ready         = m_axi_arready ;
    
    assign r_data           = m_axi_rdata   ;
    assign r_last           = m_axi_rlast   ;
    assign r_resp           = m_axi_rresp   ;
    assign r_valid          = m_axi_rvalid  ;
    assign m_axi_rready     = r_ready       ;
	
	assign i_clk        = M_RD_aclk                 ;
    assign i_rst_n      = M_RD_aresetn              ;
    assign arsize       = clogb2((RD_DATA_WIDTH/8)-1);
    assign arlen        = RD_LIN - 1                ;
    assign M_RD_tlast   = o_last                    ;
    assign M_RD_tvalid  = o_valid                   ;
    assign i_ready      = M_RD_tready               ;
  

	assign m_axi_arid       = 0;
	assign m_axi_arlock     = 0;
	assign m_axi_arcache    = 3;
	assign m_axi_arprot     = 0;
	assign m_axi_arqos      = 0;

endmodule