`default_nettype none
`timescale 1 ns / 1 ps

`define PLPS_SW                     32'h0000_0000
`define PLPS_SCCB_BUSY              32'h0001_0000
`define PLPS_LSD_READY_F            32'h0002_0000
`define PLPS_LSD_READY_R            32'h0002_0001
`define PLPS_LSD_LINE_NUM_F         32'h0002_0002
`define PLPS_LSD_LINE_NUM_R         32'h0002_0003
`define PLPS_LSD_LINE_START_V_F     32'h0002_0004
`define PLPS_LSD_LINE_START_V_R     32'h0002_0005
`define PLPS_LSD_LINE_START_H_F     32'h0002_0006
`define PLPS_LSD_LINE_START_H_R     32'h0002_0007
`define PLPS_LSD_LINE_END_V_F       32'h0002_0008
`define PLPS_LSD_LINE_END_V_R       32'h0002_0009
`define PLPS_LSD_LINE_END_H_F       32'h0002_000a
`define PLPS_LSD_LINE_END_H_R       32'h0002_000b
`define PLPS_TOPVIEW_READY_F        32'h0003_0000
`define PLPS_TOPVIEW_READY_R        32'h0003_0001
`define PLPS_TOPVIEW_LINE_NUM_F     32'h0003_0002
`define PLPS_TOPVIEW_LINE_NUM_R     32'h0003_0003
`define PLPS_TOPVIEW_LINE_START_V_F 32'h0003_0004
`define PLPS_TOPVIEW_LINE_START_V_R 32'h0003_0005
`define PLPS_TOPVIEW_LINE_START_H_F 32'h0003_0006
`define PLPS_TOPVIEW_LINE_START_H_R 32'h0003_0007
`define PLPS_TOPVIEW_LINE_END_V_F   32'h0003_0008
`define PLPS_TOPVIEW_LINE_END_V_R   32'h0003_0009
`define PLPS_TOPVIEW_LINE_END_H_F   32'h0003_000a
`define PLPS_TOPVIEW_LINE_END_H_R   32'h0003_000b
`define PLPS_TOPVIEW_LINE_VALID_F   32'h0003_000c
`define PLPS_TOPVIEW_LINE_VALID_R   32'h0003_000d
`define PLPS_MOTOR_SPEED_L          32'h0004_0000
`define PLPS_MOTOR_SPEED_R          32'h0004_0001

`define PSPL_LED                    32'h0000_0000
`define PSPL_SCCB_REQ               32'h0001_0000
`define PSPL_SCCB_SEND_DATA         32'h0001_0001
`define PSPL_LSD_LINE_ADDR_F        32'h0002_0000
`define PSPL_LSD_LINE_ADDR_R        32'h0002_0001
`define PSPL_TOPVIEW_LINE_ADDR_F    32'h0003_0000
`define PSPL_TOPVIEW_LINE_ADDR_R    32'h0003_0001
`define PSPL_KL_ACCEL               32'h0005_0000
`define PSPL_KL_STEER               32'h0005_0001

module pspl_comm_v1_0_S00_AXI
  #(
    // Users to add parameters here

    // User parameters ends
    // Do not modify the parameters beyond this line

    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH = 4
    )
   (
    // Users to add ports here

    // Test (prefix: 0x0000)
    input wire                                sw,
    output wire [3:0]                         led,

    // SCCB Interface (prefix: 0x0001)
    input wire                                sccb_busy,
    output wire                               sccb_req,
    output wire [23:0]                        sccb_send_data,

    // LSD to Kalman Filter and Keep Left (prefix: 0x0002)
    input wire                                lsd_ready_f,
    input wire                                lsd_ready_r,
    input wire [31:0]                         lsd_line_num_f, 
    input wire [31:0]                         lsd_line_num_r, 
    input wire [31:0]                          lsd_line_start_v_f,
    input wire [31:0]                          lsd_line_start_v_r,
    input wire [31:0]                          lsd_line_start_h_f,
    input wire [31:0]                          lsd_line_start_h_r,
    input wire [31:0]                          lsd_line_end_v_f,
    input wire [31:0]                          lsd_line_end_v_r,
    input wire [31:0]                          lsd_line_end_h_f,
    input wire [31:0]                          lsd_line_end_h_r,
    output wire [31:0]                        lsd_line_addr_f, 
    output wire [31:0]                        lsd_line_addr_r, 

    // Top View to Kalman Filter (prefix: 0x0003)
    input wire                                topview_ready_f, 
    input wire                                topview_ready_r, 
    input wire [31:0]                         topview_line_num_f, 
    input wire [31:0]                         topview_line_num_r, 
    input wire [31:0]                          topview_line_start_v_f,
    input wire [31:0]                          topview_line_start_v_r,
    input wire [31:0]                          topview_line_start_h_f,
    input wire [31:0]                          topview_line_start_h_r,
    input wire [31:0]                          topview_line_end_v_f,
    input wire [31:0]                          topview_line_end_v_r,
    input wire [31:0]                          topview_line_end_h_f,
    input wire [31:0]                          topview_line_end_h_r,
    input wire                                topview_line_valid_f,
    input wire                                topview_line_valid_r,
    output wire [31:0]                        topview_line_addr_f, 
    output wire [31:0]                        topview_line_addr_r, 

    // Motor Controller Feedback to Kalman Filter (prefix: 0x0004)
    input wire [15:0]                         motor_speed_l,
    input wire [15:0]                         motor_speed_r,

    // Keep Left to Motor Controller (prefix: 0x0005)
    output wire [6:0]                         kl_accel,
    output wire [7:0]                         kl_steer, 

    // User ports ends
    // Do not modify the ports beyond this line

    // Global Clock Signal
    input wire                                S_AXI_ACLK,
    // Global Reset Signal. This Signal is Active LOW
    input wire                                S_AXI_ARESETN,
    // Write address (issued by master, acceped by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    // Write channel Protection type. This signal indicates the
    // privilege and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    input wire [2 : 0]                        S_AXI_AWPROT,
    // Write address valid. This signal indicates that the master signaling
    // valid write address and control information.
    input wire                                S_AXI_AWVALID,
    // Write address ready. This signal indicates that the slave is ready
    // to accept an address and associated control signals.
    output wire                               S_AXI_AWREADY,
    // Write data (issued by master, acceped by Slave)
    input wire [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    // Write strobes. This signal indicates which byte lanes hold
    // valid data. There is one write strobe bit for each eight
    // bits of the write data bus.
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    // Write valid. This signal indicates that valid write
    // data and strobes are available.
    input wire                                S_AXI_WVALID,
    // Write ready. This signal indicates that the slave
    // can accept the write data.
    output wire                               S_AXI_WREADY,
    // Write response. This signal indicates the status
    // of the write transaction.
    output wire [1 : 0]                       S_AXI_BRESP,
    // Write response valid. This signal indicates that the channel
    // is signaling a valid write response.
    output wire                               S_AXI_BVALID,
    // Response ready. This signal indicates that the master
    // can accept a write response.
    input wire                                S_AXI_BREADY,
    // Read address (issued by master, acceped by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether the
    // transaction is a data access or an instruction access.
    input wire [2 : 0]                        S_AXI_ARPROT,
    // Read address valid. This signal indicates that the channel
    // is signaling valid read address and control information.
    input wire                                S_AXI_ARVALID,
    // Read address ready. This signal indicates that the slave is
    // ready to accept an address and associated control signals.
    output wire                               S_AXI_ARREADY,
    // Read data (issued by slave)
    output wire [C_S_AXI_DATA_WIDTH-1 : 0]    S_AXI_RDATA,
    // Read response. This signal indicates the status of the
    // read transfer.
    output wire [1 : 0]                       S_AXI_RRESP,
    // Read valid. This signal indicates that the channel is
    // signaling the required read data.
    output wire                               S_AXI_RVALID,
    // Read ready. This signal indicates that the master can
    // accept the read data and response information.
    input wire                                S_AXI_RREADY
    );

   // AXI4LITE signals
   reg [C_S_AXI_ADDR_WIDTH-1 : 0]             axi_awaddr;
   reg                                        axi_awready;
   reg                                        axi_wready;
   reg [1 : 0]                                axi_bresp;
   reg                                        axi_bvalid;
   reg [C_S_AXI_ADDR_WIDTH-1 : 0]             axi_araddr;
   reg                                        axi_arready;
   reg [C_S_AXI_DATA_WIDTH-1 : 0]             axi_rdata;
   reg [1 : 0]                                axi_rresp;
   reg                                        axi_rvalid;

   // Example-specific design signals
   // local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
   // ADDR_LSB is used for addressing 32/64 bit registers/memories
   // ADDR_LSB = 2 for 32 bits (n downto 2)
   // ADDR_LSB = 3 for 64 bits (n downto 3)
   localparam integer                         ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
   localparam integer                         OPT_MEM_ADDR_BITS = 1;
   //----------------------------------------------
   //-- Signals for user logic register space example
   //------------------------------------------------
   //-- Number of Slave Registers 4
   reg [C_S_AXI_DATA_WIDTH-1:0]               slv_reg0;
   reg [C_S_AXI_DATA_WIDTH-1:0]               slv_reg1;
   reg [C_S_AXI_DATA_WIDTH-1:0]               slv_reg2;
   reg [C_S_AXI_DATA_WIDTH-1:0]               slv_reg3;
   wire                                       slv_reg_rden;
   wire                                       slv_reg_wren;
   reg [C_S_AXI_DATA_WIDTH-1:0]               reg_data_out;
   integer                                    byte_index;
   reg                                        aw_en;

   // I/O Connections assignments

   assign S_AXI_AWREADY	= axi_awready;
   assign S_AXI_WREADY	= axi_wready;
   assign S_AXI_BRESP	= axi_bresp;
   assign S_AXI_BVALID	= axi_bvalid;
   assign S_AXI_ARREADY	= axi_arready;
   assign S_AXI_RDATA	= axi_rdata;
   assign S_AXI_RRESP	= axi_rresp;
   assign S_AXI_RVALID	= axi_rvalid;
   // Implement axi_awready generation
   // axi_awready is asserted for one S_AXI_ACLK clock cycle when both
   // S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
   // de-asserted when reset is low.

   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_awready <= 1'b0;
             aw_en <= 1'b1;
          end
        else
          begin
             if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
               begin
                  // slave is ready to accept write address when
                  // there is a valid write address and write data
                  // on the write address and data bus. This design
                  // expects no outstanding transactions.
                  axi_awready <= 1'b1;
                  aw_en <= 1'b0;
               end
             else if (S_AXI_BREADY && axi_bvalid)
               begin
                  aw_en <= 1'b1;
                  axi_awready <= 1'b0;
               end
             else
               begin
                  axi_awready <= 1'b0;
               end
          end
     end

   // Implement axi_awaddr latching
   // This process is used to latch the address when both
   // S_AXI_AWVALID and S_AXI_WVALID are valid.

   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_awaddr <= 0;
          end
        else
          begin
             if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
               begin
                  // Write Address latching
                  axi_awaddr <= S_AXI_AWADDR;
               end
          end
     end

   // Implement axi_wready generation
   // axi_wready is asserted for one S_AXI_ACLK clock cycle when both
   // S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is
   // de-asserted when reset is low.

   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_wready <= 1'b0;
          end
        else
          begin
             if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
               begin
                  // slave is ready to accept write data when
                  // there is a valid write address and write data
                  // on the write address and data bus. This design
                  // expects no outstanding transactions.
                  axi_wready <= 1'b1;
               end
             else
               begin
                  axi_wready <= 1'b0;
               end
          end
     end

   // Implement memory mapped register select and write logic generation
   // The write data is accepted and written to memory mapped registers when
   // axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
   // select byte enables of slave registers while writing.
   // These registers are cleared when reset (active low) is applied.
   // Slave register write enable is asserted when valid address and data are available
   // and the slave is ready to accept the write address and write data.
   assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             slv_reg0 <= 0;
             slv_reg1 <= 0;
             slv_reg2 <= 0;
             slv_reg3 <= 0;
          end
        else begin
           if (slv_reg_wren)
             begin
                case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
                  2'h0:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                         // Respective byte enables are asserted as per write strobes
                         // Slave register 0
                         slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end
                  2'h1:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                         // Respective byte enables are asserted as per write strobes
                         // Slave register 1
                         slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end
                  2'h2:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                         // Respective byte enables are asserted as per write strobes
                         // Slave register 2
                         slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end
                  2'h3:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                         // Respective byte enables are asserted as per write strobes
                         // Slave register 3
                         slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end
                  default : begin
                     slv_reg0 <= slv_reg0;
                     slv_reg1 <= slv_reg1;
                     slv_reg2 <= slv_reg2;
                     slv_reg3 <= slv_reg3;
                  end
                endcase
             end
        end
     end

   // Implement write response logic generation
   // The write response and response valid signals are asserted by the slave
   // when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.
   // This marks the acceptance of address and indicates the status of
   // write transaction.

   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_bvalid  <= 0;
             axi_bresp   <= 2'b0;
          end
        else
          begin
             if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
               begin
                  // indicates a valid write response is available
                  axi_bvalid <= 1'b1;
                  axi_bresp  <= 2'b0; // 'OKAY' response
               end                   // work error responses in future
             else
               begin
                  if (S_AXI_BREADY && axi_bvalid)
                    //check if bready is asserted while bvalid is high)
                    //(there is a possibility that bready is always asserted high)
                    begin
                       axi_bvalid <= 1'b0;
                    end
               end
          end
     end

   // Implement memory mapped register select and read logic generation
   // Slave register read enable is asserted when valid address is available
   // and the slave is ready to accept the read address.
   assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
   // always @(*)
   //   begin
   //      // Address decoding for reading registers
   //      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
   //        2'h0   : reg_data_out <= slv_reg0;
   //        2'h1   : reg_data_out <= slv_reg1;
   //        2'h2   : reg_data_out <= slv_reg2;
   //        2'h3   : reg_data_out <= slv_reg3;
   //        default : reg_data_out <= 0;
   //      endcase
   //   end

   // Implement axi_arready generation
   // axi_arready is asserted for one S_AXI_ACLK clock cycle when
   // S_AXI_ARVALID is asserted. axi_awready is
   // de-asserted when reset (active low) is asserted.
   // The read address is also latched when S_AXI_ARVALID is
   // asserted. axi_araddr is reset to zero on reset assertion.
   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_arready <= 1'b0;
             axi_araddr  <= 32'b0;
          end
        else
          begin
             if (~axi_arready && S_AXI_ARVALID)
               begin
                  // indicates that the slave has acceped the valid read address
                  axi_arready <= 1'b1;
                  // Read address latching
                  axi_araddr  <= S_AXI_ARADDR;
               end
             else
               begin
                  axi_arready <= 1'b0;
               end
          end
     end

   // Implement axi_arvalid generation
   // axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both
   // S_AXI_ARVALID and axi_arready are asserted. The slave registers
   // data are available on the axi_rdata bus at this instance. The
   // assertion of axi_rvalid marks the validity of read data on the
   // bus and axi_rresp indicates the status of read transaction.axi_rvalid
   // is deasserted on reset (active low). axi_rresp and axi_rdata are
   // cleared to zero on reset (active low).
   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_rvalid <= 0;
             axi_rresp  <= 0;
          end
        else
          begin
             if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
               begin
                  // Valid read data is available at the read data bus
                  axi_rvalid <= 1'b1;
                  axi_rresp  <= 2'b0; // 'OKAY' response
               end
             else if (axi_rvalid && S_AXI_RREADY)
               begin
                  // Read data is accepted by the master
                  axi_rvalid <= 1'b0;
               end
          end
     end

   // Output register or memory read data
   always @( posedge S_AXI_ACLK )
     begin
        if ( S_AXI_ARESETN == 1'b0 )
          begin
             axi_rdata  <= 0;
          end
        else
          begin
             // When there is a valid read address (S_AXI_ARVALID) with
             // acceptance of read address by the slave (axi_arready),
             // output the read dada
             if (slv_reg_rden)
               begin
                  axi_rdata <= reg_data_out; // register read data
               end
          end
     end

   // Add user logic here

   wire [C_S_AXI_DATA_WIDTH-1:0] ps_pl_addr, ps_pl_value, pl_ps_addr;
   assign {ps_pl_addr, ps_pl_value, pl_ps_addr} = {slv_reg0, slv_reg1, slv_reg2};

   // PL to PS (input wire)
   always @(*)
     begin
        // Address decoding for reading registers
        case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
          2'h0: reg_data_out <= slv_reg0;
          2'h1: reg_data_out <= slv_reg1;
          2'h2: reg_data_out <= slv_reg2;
          2'h3: begin
             case (pl_ps_addr)
               // Test 
               `PLPS_SW:                     reg_data_out <= {30'd0, sw};
               // SCCB Interface 
               `PLPS_SCCB_BUSY:              reg_data_out <= {31'd0, sccb_busy};
               // LSD to Kalman's Filter and Keep Left
               `PLPS_LSD_READY_F:            reg_data_out <= {31'd0, lsd_ready_f};
               `PLPS_LSD_READY_R:            reg_data_out <= {31'd0, lsd_ready_r};
               `PLPS_LSD_LINE_NUM_F:         reg_data_out <= lsd_line_num_f;
               `PLPS_LSD_LINE_NUM_R:         reg_data_out <= lsd_line_num_r;
               `PLPS_LSD_LINE_START_V_F:     reg_data_out <= lsd_line_start_v_f;
               `PLPS_LSD_LINE_START_V_R:     reg_data_out <= lsd_line_start_v_r;
               `PLPS_LSD_LINE_START_H_F:     reg_data_out <= lsd_line_start_h_f;
               `PLPS_LSD_LINE_START_H_R:     reg_data_out <= lsd_line_start_h_r;
               `PLPS_LSD_LINE_END_V_F:       reg_data_out <= lsd_line_end_v_f;
               `PLPS_LSD_LINE_END_V_R:       reg_data_out <= lsd_line_end_v_r;
               `PLPS_LSD_LINE_END_H_F:       reg_data_out <= lsd_line_end_h_f;
               `PLPS_LSD_LINE_END_H_R:       reg_data_out <= lsd_line_end_h_r;
               // Top View to Kalman's Filter 
               `PLPS_TOPVIEW_READY_F:        reg_data_out <= topview_ready_f;
               `PLPS_TOPVIEW_READY_R:        reg_data_out <= topview_ready_r;
               `PLPS_TOPVIEW_LINE_NUM_F:     reg_data_out <= topview_line_num_f;
               `PLPS_TOPVIEW_LINE_NUM_R:     reg_data_out <= topview_line_num_r;
               `PLPS_TOPVIEW_LINE_START_V_F: reg_data_out <= topview_line_start_v_f;
               `PLPS_TOPVIEW_LINE_START_V_R: reg_data_out <= topview_line_start_v_r;
               `PLPS_TOPVIEW_LINE_START_H_F: reg_data_out <= topview_line_start_h_f;
               `PLPS_TOPVIEW_LINE_START_H_R: reg_data_out <= topview_line_start_h_r;
               `PLPS_TOPVIEW_LINE_END_V_F:   reg_data_out <= topview_line_end_v_f;
               `PLPS_TOPVIEW_LINE_END_V_R:   reg_data_out <= topview_line_end_v_r;
               `PLPS_TOPVIEW_LINE_END_H_F:   reg_data_out <= topview_line_end_h_f;
               `PLPS_TOPVIEW_LINE_END_H_R:   reg_data_out <= topview_line_end_h_r;
               `PLPS_TOPVIEW_LINE_VALID_F:   reg_data_out <= {31'd0, topview_line_valid_f};
               `PLPS_TOPVIEW_LINE_VALID_R:   reg_data_out <= {31'd0, topview_line_valid_r};
               // Motor Controller Feedback to Kalman's Filter 
               `PLPS_MOTOR_SPEED_L:          reg_data_out <= {16'd0, motor_speed_l};
               `PLPS_MOTOR_SPEED_R:          reg_data_out <= {16'd0, motor_speed_r};
               // Keep Left to Motor Controller 

               default: reg_data_out <= 0;
             endcase
          end
          default : reg_data_out <= 0;
        endcase
     end

   // PS to PL (output wire)
   reg [3:0]                     led_reg;
   reg                           sccb_req_reg;
   reg [23:0]                    sccb_send_data_reg;
   reg [31:0]                    lsd_line_addr_f_reg;
   reg [31:0]                    lsd_line_addr_r_reg;
   reg [31:0]                    topview_line_addr_f_reg;
   reg [31:0]                    topview_line_addr_r_reg;
   reg [6:0]                     kl_accel_reg;
   reg [7:0]                     kl_steer_reg;

   assign led                  = led_reg;
   assign sccb_req             = sccb_req_reg;
   assign sccb_send_data       = sccb_send_data_reg;
   assign lsd_line_addr_f      = lsd_line_addr_f_reg;
   assign lsd_line_addr_r      = lsd_line_addr_r_reg;
   assign topview_line_addr_f  = topview_line_addr_f_reg;
   assign topview_line_addr_r  = topview_line_addr_r_reg;
   assign kl_accel             = kl_accel_reg;
   assign kl_steer             = kl_steer_reg;

   always @(*) begin
      case (ps_pl_addr)
        // Test 
        `PSPL_LED:                 led_reg                 <= ps_pl_value[3:0];
        // SCCB Interface
        `PSPL_SCCB_REQ:            sccb_req_reg            <= ps_pl_value[ 0:0];
        `PSPL_SCCB_SEND_DATA:      sccb_send_data_reg      <= ps_pl_value[23:0];
        // LSD to Kalman's Filter and Keep Left 
        `PSPL_LSD_LINE_ADDR_F:     lsd_line_addr_f_reg     <= ps_pl_value;
        `PSPL_LSD_LINE_ADDR_R:     lsd_line_addr_r_reg     <= ps_pl_value;
        // Top View to Kalman's Filter
        `PSPL_TOPVIEW_LINE_ADDR_F: topview_line_addr_f_reg <= ps_pl_value;
        `PSPL_TOPVIEW_LINE_ADDR_R: topview_line_addr_r_reg <= ps_pl_value;
        // Motor Controller Feedback to Kalman's Filter
        // Keep Left to Motor Controller 
        `PSPL_KL_ACCEL:            kl_accel_reg            <= ps_pl_value[6:0];
        `PSPL_KL_STEER:            kl_steer_reg            <= ps_pl_value[7:0];
      endcase
   end

   // User logic ends

endmodule

`default_nettype wire
