////////////////////////////////////////////////////////////////////////////////
// File:	axi_write.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	AXI Writing Model.
//
////////////////////////////////////////////////////////////////////////////////

module axi_write #
(
    parameter integer FLIP_BYTE   = 0     ,//0������ת  1����ת    //��С���Ƿ�ת
    parameter integer ADDR_WIDTH	= 32    ,                      //��ַλ��
    parameter integer DATA_WIDTH	= 64    ,//32,64,128           //����λ��
    parameter integer AW_LIN	    = 16     //1-256               //ͻ������
)
(        
    //д������
    input                               S_WR_aclk       ,
    input                               S_WR_aresetn    ,
    input   wire [DATA_WIDTH-1:0]       S_WR_tdata      ,
    input                               S_WR_tvalid     ,
    input                               S_WR_tlast      ,
    output                              S_WR_tready     ,
    //AXI���� 
    input   wire                        m_axi_aclk      ,
    input   wire                        m_axi_aresetn   ,
    output  wire                        m_axi_awid      ,
    output  wire [ADDR_WIDTH-1 : 0]     m_axi_awaddr    ,
    output  wire [7 : 0]                m_axi_awlen     ,
    output  wire [2 : 0]                m_axi_awsize    ,
    output  wire [1 : 0]                m_axi_awburst   ,
    output  wire                        m_axi_awlock    ,
    output  wire [3 : 0]                m_axi_awcache   ,
    output  wire [2 : 0]                m_axi_awprot    ,
    output  wire [3 : 0]                m_axi_awqos     ,
    output  wire                        m_axi_awvalid   ,
    input   wire                        m_axi_awready   ,
    output  wire [DATA_WIDTH-1 : 0]     m_axi_wdata     ,
    output  wire [DATA_WIDTH/8-1 : 0]   m_axi_wstrb     ,
    output  wire                        m_axi_wlast     ,
    output  wire                        m_axi_wvalid    ,
    input   wire                        m_axi_wready    ,
    input   wire                        m_axi_bid       ,
    input   wire [1 : 0]                m_axi_bresp     ,
    input   wire                        m_axi_bvalid    ,
    output  wire                        m_axi_bready    
);

    //д����    
    reg     [DATA_WIDTH-1:0]    w_data      ;
    reg                         w_valid     ;
    wire                        w_ready     ;
    reg                         w_last      ;
    reg     [DATA_WIDTH/8-1:0]  w_strb      ; // д�ֽ�ѡͨ�ź� 64λ��1111_1111 (һ���ֽ�һλ��64bitλ8�ֽڣ������ǰ�λ)

    //д��ַ    
    reg     [ADDR_WIDTH-1:0]    aw_addr     ;
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
    reg     [11:0]  number_cnt  ;       // һ��ͻ����������ݼ���
    reg     [31:0]  aw_addr_cnt ;       // д��ַ����

    //״̬��
    reg     [2:0]   c_state     ;
    reg     [2:0]   n_state     ;
    localparam  WR_IDLE         =   3'd0,
                WR_ADDR         =   3'd2,
                WR_DATA         =   3'd3,
                WR_LAST         =   3'd4,
                WR_STOP         =   3'd5;

    //ʱ�ӡ����ݡ�ͻ����Ϣ����
    wire    [DATA_WIDTH-1:0]    i_data      ;
    wire                        i_valid     ;
    reg                         o_ready     ;
    wire                        i_last      ;
    wire    [2:0]               awsize      ;
    wire    [7:0]               awlen       ;
    wire    [DATA_WIDTH/8-1:0]  wstrb       ;

    assign wstrb        = {(DATA_WIDTH/8){1'b1}}    ;
    assign awsize       = clogb2((DATA_WIDTH/8)-1)  ;
    assign awlen        = AW_LIN - 1                ;
    assign i_clk        = S_WR_aclk                 ;
    assign i_rst_n      = S_WR_aresetn              ;
    assign i_valid      = S_WR_tvalid               ;
    assign i_last       = S_WR_tlast                ;
    assign S_WR_tready  = o_ready                   ;
	
	//��С��ת��
	generate
		if (FLIP_BYTE == 1) begin
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
		end else begin
			assign i_data = S_WR_tdata;  // ����ת
		end
	endgenerate

    //״̬ת�� FSM31
    always @ (posedge i_clk, negedge i_rst_n) begin  :   W_FMS1
        if (~i_rst_n)
            c_state <= 0;
        else
            c_state <= n_state;
    end
   
    //״̬��ת���� FSM32
    always @ (*) begin  :   W_FMS2
            case (c_state)
                WR_IDLE :   begin
                                if (i_valid)
                                    n_state = WR_ADDR;
                                else
                                    n_state = WR_IDLE;
                end

                WR_ADDR :   begin
                                if (aw_ready)
                                    n_state = WR_DATA;
                                else    
                                    n_state = WR_ADDR;
                end

                WR_DATA :   begin 
                                if (number_cnt == aw_len - 1 && w_ready && w_valid)
                                    n_state = WR_LAST;
                                else
                                    n_state = WR_DATA;
                end

                WR_LAST :   begin
                                if (w_ready && w_valid && w_last)
                                    n_state = WR_STOP;
                                else
                                    n_state = WR_LAST;
                end

                WR_STOP :   begin
                                n_state = WR_IDLE;
                end

                default :  n_state = 'bx ;

            endcase
    end

    //״ִ̬�еĲ��� FSM33
    always @ (posedge i_clk, negedge i_rst_n) begin  :   W_FMS3
        if (~i_rst_n)
            begin   
                w_data          <= 0;
                w_valid         <= 0;
                w_last          <= 0;
                w_strb          <= 0;
                aw_addr         <= 0;
                aw_len          <= 0;
                aw_size         <= 0;
                aw_burst        <= 0;
                aw_valid        <= 0;  

                aw_addr_cnt     <= 32'h10000000;
             
            end
        else
            case (n_state)

                WR_ADDR :   begin
                                w_strb          <= wstrb        ;
                                aw_size         <= awsize       ;
                                aw_burst        <= 2'd1         ;
                                aw_len          <= awlen        ;

                                aw_valid        <= 1            ;
                                aw_addr         <= aw_addr_cnt  ;
                end

                WR_DATA :   begin
                                aw_valid <= 0;
                                if (i_valid)
                                    begin                                        
                                        if (w_ready)
                                            begin
                                                w_valid     <= 1;
                                                w_data <= i_data;

                                            end
                                        else
                                            begin
                                                //w_valid     <= 0;
                                                w_data <= w_data;
                                            end                                            
                                    end
                                else
                                    begin
                                        w_valid     <= 0;
                                        w_data      <= w_data;
                                    end
                end

                WR_LAST :   begin
                                if (i_valid)
                                    begin
                                        w_valid     <= 1;
                                        w_last      <= 1;
                                        w_data      <= i_data;
                                    end
                                else
                                    begin
                                        w_valid     <= 0;
                                        w_data      <= w_data;
                                    end
                end

                WR_STOP :   begin
                                w_last  <= 0        ;
                                w_valid <= 0        ;
//								  if (aw_addr_cnt >= 32'h100000-1)
//                                	  aw_addr_cnt <= 0;
//                                else
//                              	  aw_addr_cnt <= aw_addr_cnt + 256*8;
                end

                default :   ;
            endcase
    end   
    
    //ͻ�����ݼ���
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            number_cnt <= 0;
        else if (w_last || (w_valid && w_ready))
            number_cnt <= (w_last) ? 0 : (number_cnt + 1);
    end

    //fifo ready�źŴ���
    always @(*) begin
        case (n_state) /* full_case */
            WR_DATA :   o_ready = w_ready;
            WR_LAST :   o_ready = w_ready;            
            WR_STOP :   o_ready = 0;
            default :   o_ready = 0;
        endcase
    end

    //д��Ӧ����
    always @ (posedge i_clk, negedge i_rst_n) begin
        if (~i_rst_n)
            b_ready <= 0;
        else
            b_ready <= 1;
    end

    //----------------------------------------------------------
    // λ����㺯��
    // ʹ�÷���
    // localparam DATA_WIDTH = clogb2(depth); //����λ��
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


    assign m_axi_awid       = 0;
    assign m_axi_awlock     = 0;
    assign m_axi_awcache    = 3;
    assign m_axi_awprot     = 0;
    assign m_axi_awqos      = 0;

endmodule