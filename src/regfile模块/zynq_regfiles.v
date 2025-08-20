`timescale 1 ns / 1 ps

module zynq_regfiles #
	(		
		parameter integer DATA_WIDTH	= 32,   // Width of S_AXI data bus
		parameter integer ADDR_WIDTH	= 32    // Width of S_AXI address bus
	)
	(   // AXI4 Lite port
        input   wire                        S_AXI_ACLK      ,
        input   wire                        S_AXI_ARESETN   ,
        input   wire [ADDR_WIDTH-1 : 0]     S_AXI_AWADDR    ,
        input   wire [2 : 0]                S_AXI_AWPROT    ,
        input   wire                        S_AXI_AWVALID   ,
        output  wire                        S_AXI_AWREADY   ,
        input   wire [DATA_WIDTH-1 : 0]     S_AXI_WDATA     ,
        input   wire [(DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB     ,
        input   wire                        S_AXI_WVALID    ,
        output  wire                        S_AXI_WREADY    ,
        output  wire [1 : 0]                S_AXI_BRESP     ,
        output  wire                        S_AXI_BVALID    ,
        input   wire                        S_AXI_BREADY    ,
        input   wire [ADDR_WIDTH-1 : 0]     S_AXI_ARADDR    ,
        input   wire [2 : 0]                S_AXI_ARPROT    ,
        input   wire                        S_AXI_ARVALID   ,
        output  wire                        S_AXI_ARREADY   ,
        output  wire [DATA_WIDTH-1 : 0]     S_AXI_RDATA     ,
        output  wire [1 : 0]                S_AXI_RRESP     ,
        output  wire                        S_AXI_RVALID    ,
        input   wire                        S_AXI_RREADY    ,
        // Users to add ports here
        output   wire [31:0]                 DATA_COUNT                           
	);

	// Don't move
    reg [DATA_WIDTH-1:0]	reg_data_out;
    reg [ADDR_WIDTH-1 : 0] 	axi_awaddr  ;
    reg [ADDR_WIDTH-1 : 0] 	axi_araddr  ;
    wire	                slv_reg_wren;
	
///////////////////////////////////////////////////////////////////////////////////////////
// Add user logic here
    // read register file
	reg [31:0]	slv_reg0    ;
	reg [31:0]	softrst_reg ;

    // output logic
	assign DATA_COUNT = slv_reg0;

    //*********************CPU → FPGA  DATA********************************//
    //（读写地址不能覆盖，写进去的数据，在读的地方写一下，要不然会清零）
	always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            slv_reg0 <= 0;
            softrst_reg <= 0;
        end 
        else if (slv_reg_wren) begin
            case (axi_awaddr[15:0])
                16'h00: begin
                    if (S_AXI_WSTRB[0]) slv_reg0[7:0]   <= S_AXI_WDATA[7:0];   // Byte 0
                    if (S_AXI_WSTRB[1]) slv_reg0[15:8]  <= S_AXI_WDATA[15:8];  // Byte 1
                    if (S_AXI_WSTRB[2]) slv_reg0[23:16] <= S_AXI_WDATA[23:16]; // Byte 2
                    if (S_AXI_WSTRB[3]) slv_reg0[31:24] <= S_AXI_WDATA[31:24]; // Byte 3
                end
                16'h04: begin
                    if (S_AXI_WSTRB[0]) softrst_reg[7:0]   <= S_AXI_WDATA[7:0];   // Byte 0
                    if (S_AXI_WSTRB[1]) softrst_reg[15:8]  <= S_AXI_WDATA[15:8];  // Byte 1
                    if (S_AXI_WSTRB[2]) softrst_reg[23:16] <= S_AXI_WDATA[23:16]; // Byte 2
                    if (S_AXI_WSTRB[3]) softrst_reg[31:24] <= S_AXI_WDATA[31:24]; // Byte 3
                end  
				
				default : ;	
            endcase
        end
        else begin   // self-clean registers 自主清零，比如：软件复位，只需要一个脉冲即可，就需要把这个信号拉高后，FPGA给他清零。
            softrst_reg <= 0; 
        end
    end

    //*********************FPGA → CPU  DATA********************************//
    always @(*) begin
        case ( axi_araddr[15:0])
            // CPU → FPGA 的数据要在这里返回过去
            16'h00   : reg_data_out = slv_reg0;
            16'h04   : reg_data_out = softrst_reg;

            //FPGA → CPU 数据
            16'h08   : reg_data_out = 32'h39;
            16'h0C   : reg_data_out = 32'h98;

            default : reg_data_out = 0;
        endcase
    end

///////////////////////////////////////////////////////////////////////////////////////////
// AXI stage

	// AXI4LITE signals	
	reg  	                        axi_awready ;
	reg  	                        axi_wready  ;
	reg [1 : 0] 	                axi_bresp   ;
	reg  	                        axi_bvalid  ;
	reg  	                        axi_arready ;
	reg [DATA_WIDTH-1 : 0] 	        axi_rdata   ;
	reg [1 : 0] 	                axi_rresp   ;
	reg  	                        axi_rvalid  ;
    wire	                        slv_reg_rden;	
    reg	                            aw_en       ;	

    always @( posedge S_AXI_ACLK ) begin
        if ( S_AXI_ARESETN == 1'b0 ) begin
            axi_awready <= 1'b0;
            aw_en <= 1'b1;
        end 
        else begin    
            if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin
                axi_awready <= 1'b1;
                aw_en <= 1'b0;
            end
            else if (S_AXI_BREADY && axi_bvalid) begin
                aw_en <= 1'b1;
                axi_awready <= 1'b0;
            end
            else     
                axi_awready <= 1'b0;
        end 
    end       

    always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 )
        axi_awaddr <= 0;
    else if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
        axi_awaddr <= S_AXI_AWADDR;
    end       

    always @( posedge S_AXI_ACLK ) begin
        if ( S_AXI_ARESETN == 1'b0 )
            axi_wready <= 1'b0;
        else if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
            axi_wready <= 1'b1;
        else
            axi_wready <= 1'b0;
    end    

    always @( posedge S_AXI_ACLK ) begin
        if ( S_AXI_ARESETN == 1'b0 ) begin
            axi_bvalid  <= 0;
            axi_bresp   <= 2'b0;
        end 
        else if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID) begin
            axi_bvalid <= 1'b1;
            axi_bresp  <= 2'b0; 
        end                  
        else if (S_AXI_BREADY && axi_bvalid)   
            axi_bvalid <= 1'b0;      
    end   

    always @( posedge S_AXI_ACLK ) begin
        if ( S_AXI_ARESETN == 1'b0 ) begin
            axi_arready <= 1'b0;
            axi_araddr  <= 32'b0;
        end 
        else if (~axi_arready && S_AXI_ARVALID) begin
            axi_arready <= 1'b1;
            axi_araddr  <= S_AXI_ARADDR;
        end
        else
            axi_arready <= 1'b0;         
    end       

    always @ (posedge S_AXI_ACLK) begin
        if (S_AXI_ARESETN == 1'b0) begin
            axi_rvalid <= 0;
            axi_rresp  <= 0;
        end 
        else begin    
            if (axi_arready && S_AXI_ARVALID && ~axi_rvalid) begin
                axi_rvalid <= 1'b1;
                axi_rresp  <= 2'b0; 
            end   
            else if (axi_rvalid && S_AXI_RREADY)
                axi_rvalid <= 1'b0;
        end
    end    

    always @( posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN)
            axi_rdata  <= 0;
        else if (slv_reg_rden)
            axi_rdata <= reg_data_out;     
    end    

    assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	    = axi_wready;
	assign S_AXI_BRESP	    = axi_bresp;
	assign S_AXI_BVALID	    = axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	    = axi_rdata;
	assign S_AXI_RRESP	    = axi_rresp;
	assign S_AXI_RVALID	    = axi_rvalid;
    assign slv_reg_wren     = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
    assign slv_reg_rden     = axi_arready & S_AXI_ARVALID & ~axi_rvalid;

endmodule