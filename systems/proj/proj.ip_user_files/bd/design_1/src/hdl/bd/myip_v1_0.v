`timescale 1 ns / 1 ps

module myip_v1_0
  #( 
    // Users to add parameters here
    parameter integer IMG_WIDTH = 640, 
    parameter integer IMG_HEIGHT = 480, 
    parameter integer PIXELS = IMG_WIDTH * IMG_HEIGHT,
    parameter integer DATA_WIDTH = 8,
    // User parameters ends
    // Do not modify the parameters beyond this line

    // Parameters of Axi Slave Bus Interface S00_AXI
    parameter integer C_S00_AXI_DATA_WIDTH = 32,
    parameter integer C_S00_AXI_ADDR_WIDTH = 4
    )
   (
    // Users to add ports here
    input wire [1:0]                            sw, 
    input wire [DATA_WIDTH - 1:0]               r_data, 
    input wire                                  w_busy, 
    input wire [7:0]                            sccb_rdata,
    input wire                                  sccb_busy,

    output wire [3:0]                           led_out,
    output wire                                 pulse1,
    output wire                                 pulse2, 
    output wire                                 w_req,
    output wire [$clog2(PIXELS) - 1:0]          r_addr,
    output wire                                 camsel,
    output wire                                 sccb_req, 
    output wire                                 sccb_wr,
    output wire [31:0]                          sccb_wdata,
    // User ports ends
    // Do not modify the ports beyond this line

    // Ports of Axi Slave Bus Interface S00_AXI
    input wire                                  s00_axi_aclk,
    input wire                                  s00_axi_aresetn,
    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_awaddr,
    input wire [2 : 0]                          s00_axi_awprot,
    input wire                                  s00_axi_awvalid,
    output wire                                 s00_axi_awready,
    input wire [C_S00_AXI_DATA_WIDTH-1 : 0]     s00_axi_wdata,
    input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
    input wire                                  s00_axi_wvalid,
    output wire                                 s00_axi_wready,
    output wire [1 : 0]                         s00_axi_bresp,
    output wire                                 s00_axi_bvalid,
    input wire                                  s00_axi_bready,
    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_araddr,
    input wire [2 : 0]                          s00_axi_arprot,
    input wire                                  s00_axi_arvalid,
    output wire                                 s00_axi_arready,
    output wire [C_S00_AXI_DATA_WIDTH-1 : 0]    s00_axi_rdata,
    output wire [1 : 0]                         s00_axi_rresp,
    output wire                                 s00_axi_rvalid,
    input wire                                  s00_axi_rready
    );

   // Instantiation of Axi Bus Interface S00_AXI
   myip_v1_0_S00_AXI 
     #( 
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT),
        .DATA_WIDTH(DATA_WIDTH),
        .C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
        ) 
   myip_v1_0_S00_AXI_inst 
     (
      .S_AXI_ACLK(s00_axi_aclk),
      .S_AXI_ARESETN(s00_axi_aresetn),
      .S_AXI_AWADDR(s00_axi_awaddr),
      .S_AXI_AWPROT(s00_axi_awprot),
      .S_AXI_AWVALID(s00_axi_awvalid),
      .S_AXI_AWREADY(s00_axi_awready),
      .S_AXI_WDATA(s00_axi_wdata),
      .S_AXI_WSTRB(s00_axi_wstrb),
      .S_AXI_WVALID(s00_axi_wvalid),
      .S_AXI_WREADY(s00_axi_wready),
      .S_AXI_BRESP(s00_axi_bresp),
      .S_AXI_BVALID(s00_axi_bvalid),
      .S_AXI_BREADY(s00_axi_bready),
      .S_AXI_ARADDR(s00_axi_araddr),
      .S_AXI_ARPROT(s00_axi_arprot),
      .S_AXI_ARVALID(s00_axi_arvalid),
      .S_AXI_ARREADY(s00_axi_arready),
      .S_AXI_RDATA(s00_axi_rdata),
      .S_AXI_RRESP(s00_axi_rresp),
      .S_AXI_RVALID(s00_axi_rvalid),
      .S_AXI_RREADY(s00_axi_rready),
      .sw(sw),
      .r_data(r_data),
      .w_busy(w_busy),
      .sccb_rdata(sccb_rdata),
      .sccb_busy(sccb_busy),
      .led_out(led_out),
      .pulse1(pulse1),
      .pulse2(pulse2),
      .w_req(w_req),
      .r_addr(r_addr),
      .camsel(camsel),
      .sccb_req(sccb_req),
      .sccb_wr(sccb_wr),
      .sccb_wdata(sccb_wdata)
      );
   
   // Add user logic here

   // User logic ends

endmodule
