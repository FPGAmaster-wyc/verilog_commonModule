////////////////////////////////////////////////////////////////////////////////
// File:	axi_write.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	AXI Writing fifo Model.
////////////////////////////////////////////////////////////////////////////////

module axi_write #
(
    parameter integer WR_FLIP_BYTE   = 0     ,//0������ת  1����ת    //��С���Ƿ�ת
    parameter integer WR_ADDR_WIDTH	= 32    ,                      //��ַλ��
    parameter integer WR_DATA_WIDTH	= 64    ,//32,64,128           //����λ��
    parameter integer WR_LIN	    = 16     //1-256               //ͻ������
)
(        
    //д������
    input                               S_WR_aclk       ,
    input                               S_WR_aresetn    ,
    input   wire [WR_DATA_WIDTH-1:0]       S_WR_tdata      ,
    input                               S_WR_tvalid     ,
    input                               S_WR_tlast      ,
    output                              S_WR_tready     ,
    //AXI���� 
    input   wire                        m_axi_aclk      ,
    input   wire                        m_axi_aresetn   ,
    output  wire                        m_axi_awid      ,
    output  wire [WR_ADDR_WIDTH-1 : 0]     m_axi_awaddr    ,
    output  wire [7 : 0]                m_axi_awlen     ,
    output  wire [2 : 0]                m_axi_awsize    ,
    output  wire [1 : 0]                m_axi_awburst   ,
    output  wire                        m_axi_awlock    ,
    output  wire [3 : 0]                m_axi_awcache   ,
    output  wire [2 : 0]                m_axi_awprot    ,
    output  wire [3 : 0]                m_axi_awqos     ,
    output  wire                        m_axi_awvalid   ,
    input   wire                        m_axi_awready   ,
    output  wire [WR_DATA_WIDTH-1 : 0]     m_axi_wdata     ,
    output  wire [WR_DATA_WIDTH/8-1 : 0]   m_axi_wstrb     ,
    output  wire                        m_axi_wlast     ,
    output  wire                        m_axi_wvalid    ,
    input   wire                        m_axi_wready    ,
    input   wire                        m_axi_bid       ,
    input   wire [1 : 0]                m_axi_bresp     ,
    input   wire                        m_axi_bvalid    ,
    output  wire                        m_axi_bready    
);

    //д����    
    reg     [WR_DATA_WIDTH-1:0] w_data 		;
    reg                         w_valid     ;
    wire                        w_ready     ;
    reg                         w_last      ;
    reg     [WR_DATA_WIDTH/8-1:0]  w_strb	; // д�ֽ�ѡͨ�ź� 64λ��1111_1111 (һ���ֽ�һλ��64bitλ8�ֽڣ������ǰ�λ)

    //д��ַ    
    reg     [WR_ADDR_WIDTH-1:0]    aw_addr	;
    reg     [7:0]               aw_len      ; // ͻ���������ͣ�����8�����ݣ���len=7
    reg     [2:0]               aw_size     ; // �����е��ֽ��� 011 ��8B
    reg     [1:0]               aw_burst    ; // ͻ������      01 ������ͻ��
    reg                         aw_valid    ;
    wire                        aw_ready    ;
    
    //д��Ӧ        
    wire    [1:0]               b_resp      ;
    wire                        b_valid     ;
    reg                         b_ready     ;

    //������
    reg     [7:0]   num_wr_cnt  ;       // һ��ͻ����������ݼ���
    reg     [31:0]  aw_addr_cnt ;       // д��ַ����

    //״̬��
    reg     [2:0]   c_state     ;
    reg     [2:0]   n_state     ;
    localparam  WR_IDLE         =   3'd0,
                WR_ADDR         =   3'd1,
                WR_DATA         =   3'd2,
                WR_LAST         =   3'd3,
                WR_STOP         =   3'd4;

    //ʱ�ӡ����ݡ�ͻ����Ϣ����
	wire                        i_clk       ;
    wire                        i_rst_n     ;
    wire    [WR_DATA_WIDTH-1:0] i_data      ;
    wire                        i_valid     ;
    reg                         o_ready     ;
    wire                        i_last      ;
    wire    [2:0]               awsize      ;
    wire    [7:0]               awlen       ;
    wire    [WR_DATA_WIDTH/8-1:0]  wstrb 	;

    //״̬ת�� FSM31
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) c_state <= WR_IDLE;  // �첽��λ
        else          c_state <= n_state;   // ״̬����
    end
   
    // д����״̬������߼� FSM32
    always @(*) begin : W_FMS2
        case (c_state)
            WR_IDLE:  n_state = i_valid ? WR_ADDR : WR_IDLE;  // ������������ַ����״̬            
            WR_ADDR:  n_state = aw_ready ? WR_DATA : WR_ADDR; // ��ַ׼������������ݴ���            
            WR_DATA:  n_state = (num_wr_cnt == aw_len-1 && w_ready && w_valid) ? WR_LAST : WR_DATA;  // ���һ������ʱ�������״̬                     
            WR_LAST:  n_state = (w_ready && w_valid && w_last) ? WR_STOP : WR_LAST;  // ������������ֹͣ״̬            
            WR_STOP:  n_state = WR_IDLE;  // ������ȫ������ص���ʼ״̬           
            default:  n_state = 'bx;  // �쳣�������
        endcase
    end

    // д����״̬��ʱ���߼�
    // ���ܣ�����AXIдͨ�������ź�
    always @(posedge i_clk or negedge i_rst_n) begin : W_FMS3
        // �첽��λ�߼�
        if (~i_rst_n) begin              
            // ��λ����AXIдͨ���ź�
            {w_strb, aw_addr, aw_len, aw_size, aw_burst, aw_valid, w_last} <= 0;
            // ��ʼ��д��ַ������
            aw_addr_cnt <= 32'h0; 
        end
        else case (n_state)            
            WR_ADDR : begin  // ��ַ����״̬
                w_strb   <= wstrb;      // ����д����ѡͨ�ź�
                aw_size  <= awsize;     // ���ô������ݴ�С
                aw_burst <= 2'd1;       // �̶�Ϊ����ͻ��ģʽ
                aw_len   <= awlen;      // ����ͻ������
                aw_valid <= 1;          // �����ַ��Ч�ź�
                aw_addr  <= aw_addr_cnt; // �����ǰ��ַ
            end
            
            WR_DATA :   aw_valid <= 0;          // ��ַͨ���������           
            WR_LAST :   w_last <= 1;            // ������һ������              
            WR_STOP : begin // �������״̬
                w_last  <= 0;           // ���������ݱ��
                // ��ַ������ѭ������
                aw_addr_cnt <= (aw_addr_cnt >= 32'h10000-4096) ? 
                              0 : aw_addr_cnt + 4096;
            end    
            default: ; // ����ԭ��״̬
        endcase
    end
    
    //ͻ�����ݼ���  
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)    num_wr_cnt <= 0;
        else             num_wr_cnt <= w_last ? 0 : (w_valid && w_ready) ? num_wr_cnt + 1 : num_wr_cnt;
    end

    //data valid ready�źŴ���
    always @(*) begin
        o_ready = (c_state == WR_DATA || c_state == WR_LAST) ? w_ready : 0;
        w_data  = (c_state == WR_DATA || c_state == WR_LAST) ? i_data  : 0;
        w_valid = (c_state == WR_DATA || c_state == WR_LAST) ? i_valid : 0;
    end

    //д��Ӧ����
    always @ (posedge i_clk, negedge i_rst_n) begin
        if (~i_rst_n)   b_ready <= 0;
        else            b_ready <= 1;
    end

    //��С��ת��
    generate
        if (WR_FLIP_BYTE == 1) begin
            if (WR_DATA_WIDTH == 32) begin
                // 32-bit �ֽڷ�ת
                assign i_data = {
                    S_WR_tdata[7:0],   S_WR_tdata[15:8],
                    S_WR_tdata[23:16], S_WR_tdata[31:24]
                };
            end else if (WR_DATA_WIDTH == 64) begin
                // 64-bit �ֽڷ�ת
                assign i_data = {
                    S_WR_tdata[7:0],    S_WR_tdata[15:8],
                    S_WR_tdata[23:16],  S_WR_tdata[31:24],
                    S_WR_tdata[39:32],  S_WR_tdata[47:40],
                    S_WR_tdata[55:48],  S_WR_tdata[63:56]
                };
            end else if (WR_DATA_WIDTH == 128) begin
                // 128-bit �ֽڷ�ת
                assign i_data = {
                    S_WR_tdata[7:0],     S_WR_tdata[15:8], 
                    S_WR_tdata[23:16],   S_WR_tdata[31:24],
                    S_WR_tdata[39:32],   S_WR_tdata[47:40],
                    S_WR_tdata[55:48],   S_WR_tdata[63:56],
                    S_WR_tdata[71:64],   S_WR_tdata[79:72],
                    S_WR_tdata[87:80],   S_WR_tdata[95:88],
                    S_WR_tdata[103:96],  S_WR_tdata[111:104],
                    S_WR_tdata[119:112], S_WR_tdata[127:120]
                };
            end
        end else begin
            assign i_data = S_WR_tdata;  // ����ת
        end
    endgenerate

    //----------------------------------------------------------
    // λ����㺯��
    // ʹ�÷���
    // localparam WR_DATA_WIDTH = clogb2(depth); //����λ��
    //----------------------------------------------------------

    function integer clogb2 (input integer depth);
    begin
        for(clogb2=0; depth>0; clogb2=clogb2+1) 
            depth = depth >> 1;
    end
    endfunction
    
    assign m_axi_wdata      = w_data        ;
	assign m_axi_wvalid     = w_valid       ;
	assign m_axi_wlast      = w_last        ;
	assign m_axi_wstrb      = w_strb        ;
	assign w_ready          = m_axi_wready  ;

	assign m_axi_awaddr     = aw_addr       ;
	assign m_axi_awlen      = aw_len        ;
	assign m_axi_awsize     = aw_size       ;
	assign m_axi_awburst    = aw_burst      ;
	assign m_axi_awvalid    = aw_valid      ;
	assign aw_ready         = m_axi_awready ;

	assign b_resp           = m_axi_bresp   ;
	assign b_valid          = m_axi_bvalid  ;
	assign m_axi_bready     = b_ready       ;
	
	assign wstrb        = {(WR_DATA_WIDTH/8){1'b1}}    ;
    assign awsize       = clogb2((WR_DATA_WIDTH/8)-1)  ;
    assign awlen        = WR_LIN - 1                ;
    assign i_clk        = S_WR_aclk                 ;
    assign i_rst_n      = S_WR_aresetn              ;
    assign i_valid      = S_WR_tvalid               ;
    assign i_last       = S_WR_tlast                ;
    assign S_WR_tready  = o_ready                   ;


    assign m_axi_awid       = 0;
    assign m_axi_awlock     = 0;
    assign m_axi_awcache    = 3;
    assign m_axi_awprot     = 0;
    assign m_axi_awqos      = 0;

endmodule