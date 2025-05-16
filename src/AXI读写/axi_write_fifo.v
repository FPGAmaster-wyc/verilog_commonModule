////////////////////////////////////////////////////////////////////////////////
// File:	axi_write.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	AXI Writing fifo Model.
////////////////////////////////////////////////////////////////////////////////

module axi_write #
(
    parameter integer WR_FLIP_BYTE   = 0     ,//0：不翻转  1：翻转    //大小端是否翻转
    parameter integer WR_ADDR_WIDTH	= 32    ,                      //地址位宽
    parameter integer WR_DATA_WIDTH	= 64    ,//32,64,128           //数据位宽
    parameter integer WR_LIN	    = 16     //1-256               //突发长度
)
(        
    //写入数据
    input                               S_WR_aclk       ,
    input                               S_WR_aresetn    ,
    input   wire [WR_DATA_WIDTH-1:0]       S_WR_tdata      ,
    input                               S_WR_tvalid     ,
    input                               S_WR_tlast      ,
    output                              S_WR_tready     ,
    //AXI总线 
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

    //写数据    
    reg     [WR_DATA_WIDTH-1:0] w_data 		;
    reg                         w_valid     ;
    wire                        w_ready     ;
    reg                         w_last      ;
    reg     [WR_DATA_WIDTH/8-1:0]  w_strb	; // 写字节选通信号 64位：1111_1111 (一个字节一位，64bit位8字节，所以是八位)

    //写地址    
    reg     [WR_ADDR_WIDTH-1:0]    aw_addr	;
    reg     [7:0]               aw_len      ; // 突发长度类型：传输8个数据，则len=7
    reg     [2:0]               aw_size     ; // 传输中的字节数 011 ：8B
    reg     [1:0]               aw_burst    ; // 突发类型      01 ：递增突发
    reg                         aw_valid    ;
    wire                        aw_ready    ;
    
    //写响应        
    wire    [1:0]               b_resp      ;
    wire                        b_valid     ;
    reg                         b_ready     ;

    //计数器
    reg     [7:0]   num_wr_cnt  ;       // 一次突发传输的数据计数
    reg     [31:0]  aw_addr_cnt ;       // 写地址计数

    //状态机
    reg     [2:0]   c_state     ;
    reg     [2:0]   n_state     ;
    localparam  WR_IDLE         =   3'd0,
                WR_ADDR         =   3'd1,
                WR_DATA         =   3'd2,
                WR_LAST         =   3'd3,
                WR_STOP         =   3'd4;

    //时钟、数据、突发信息传递
	wire                        i_clk       ;
    wire                        i_rst_n     ;
    wire    [WR_DATA_WIDTH-1:0] i_data      ;
    wire                        i_valid     ;
    reg                         o_ready     ;
    wire                        i_last      ;
    wire    [2:0]               awsize      ;
    wire    [7:0]               awlen       ;
    wire    [WR_DATA_WIDTH/8-1:0]  wstrb 	;

    //状态转换 FSM31
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) c_state <= WR_IDLE;  // 异步复位
        else          c_state <= n_state;   // 状态更新
    end
   
    // 写操作状态机组合逻辑 FSM32
    always @(*) begin : W_FMS2
        case (c_state)
            WR_IDLE:  n_state = i_valid ? WR_ADDR : WR_IDLE;  // 有数据则进入地址发送状态            
            WR_ADDR:  n_state = aw_ready ? WR_DATA : WR_ADDR; // 地址准备好则进入数据传输            
            WR_DATA:  n_state = (num_wr_cnt == aw_len-1 && w_ready && w_valid) ? WR_LAST : WR_DATA;  // 最后一笔数据时进入结束状态                     
            WR_LAST:  n_state = (w_ready && w_valid && w_last) ? WR_STOP : WR_LAST;  // 完成最后传输后进入停止状态            
            WR_STOP:  n_state = WR_IDLE;  // 传输完全结束后回到初始状态           
            default:  n_state = 'bx;  // 异常情况处理
        endcase
    end

    // 写操作状态机时序逻辑
    // 功能：管理AXI写通道控制信号
    always @(posedge i_clk or negedge i_rst_n) begin : W_FMS3
        // 异步复位逻辑
        if (~i_rst_n) begin              
            // 复位所有AXI写通道信号
            {w_strb, aw_addr, aw_len, aw_size, aw_burst, aw_valid, w_last} <= 0;
            // 初始化写地址计数器
            aw_addr_cnt <= 32'h0; 
        end
        else case (n_state)            
            WR_ADDR : begin  // 地址发送状态
                w_strb   <= wstrb;      // 设置写数据选通信号
                aw_size  <= awsize;     // 设置传输数据大小
                aw_burst <= 2'd1;       // 固定为增量突发模式
                aw_len   <= awlen;      // 设置突发长度
                aw_valid <= 1;          // 置起地址有效信号
                aw_addr  <= aw_addr_cnt; // 输出当前地址
            end
            
            WR_DATA :   aw_valid <= 0;          // 地址通道握手完成           
            WR_LAST :   w_last <= 1;            // 标记最后一笔数据              
            WR_STOP : begin // 传输结束状态
                w_last  <= 0;           // 清除最后数据标记
                // 地址计数器循环处理
                aw_addr_cnt <= (aw_addr_cnt >= 32'h10000-4096) ? 
                              0 : aw_addr_cnt + 4096;
            end    
            default: ; // 保持原有状态
        endcase
    end
    
    //突发数据计数  
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)    num_wr_cnt <= 0;
        else             num_wr_cnt <= w_last ? 0 : (w_valid && w_ready) ? num_wr_cnt + 1 : num_wr_cnt;
    end

    //data valid ready信号处理
    always @(*) begin
        o_ready = (c_state == WR_DATA || c_state == WR_LAST) ? w_ready : 0;
        w_data  = (c_state == WR_DATA || c_state == WR_LAST) ? i_data  : 0;
        w_valid = (c_state == WR_DATA || c_state == WR_LAST) ? i_valid : 0;
    end

    //写响应处理
    always @ (posedge i_clk, negedge i_rst_n) begin
        if (~i_rst_n)   b_ready <= 0;
        else            b_ready <= 1;
    end

    //大小端转换
    generate
        if (WR_FLIP_BYTE == 1) begin
            if (WR_DATA_WIDTH == 32) begin
                // 32-bit 字节翻转
                assign i_data = {
                    S_WR_tdata[7:0],   S_WR_tdata[15:8],
                    S_WR_tdata[23:16], S_WR_tdata[31:24]
                };
            end else if (WR_DATA_WIDTH == 64) begin
                // 64-bit 字节翻转
                assign i_data = {
                    S_WR_tdata[7:0],    S_WR_tdata[15:8],
                    S_WR_tdata[23:16],  S_WR_tdata[31:24],
                    S_WR_tdata[39:32],  S_WR_tdata[47:40],
                    S_WR_tdata[55:48],  S_WR_tdata[63:56]
                };
            end else if (WR_DATA_WIDTH == 128) begin
                // 128-bit 字节翻转
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
            assign i_data = S_WR_tdata;  // 不翻转
        end
    endgenerate

    //----------------------------------------------------------
    // 位宽计算函数
    // 使用方法
    // localparam WR_DATA_WIDTH = clogb2(depth); //数据位宽
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