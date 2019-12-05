`default_nettype none
`timescale 1 ns / 1 ps

module pspl_comm_v1_0 
  #(
    // Users to add parameters here

    // User parameters ends
    // Do not modify the parameters beyond this line

    // Parameters of Axi Slave Bus Interface S00_AXI
    parameter integer C_S00_AXI_DATA_WIDTH = 32,
    parameter integer C_S00_AXI_ADDR_WIDTH = 4
    )
   (
    // Users to add ports here

    // Test (prefix: 0x0000)
    input wire [1:0]                            sw,
    output wire [3:0]                           led,

    // SCCB Interface (prefix: 0x0001)
    input wire                                  sccb_busy,
    output wire                                 sccb_req,
    output wire [23:0]                          sccb_send_data,

    // LSD to Kalman Filter and Keep Left (prefix: 0x0002)
    input wire                                  lsd_ready_f,
    input wire                                  lsd_ready_r,
    input wire [31:0]                           lsd_line_num_f, 
    input wire [31:0]                           lsd_line_num_r, 
    input wire [9:0]                            lsd_line_start_v_f,
    input wire [9:0]                            lsd_line_start_v_r,
    input wire [9:0]                            lsd_line_start_h_f,
    input wire [9:0]                            lsd_line_start_h_r,
    input wire [9:0]                            lsd_line_end_v_f,
    input wire [9:0]                            lsd_line_end_v_r,
    input wire [9:0]                            lsd_line_end_h_f,
    input wire [9:0]                            lsd_line_end_h_r,
    output wire [31:0]                          lsd_line_addr_f, 
    output wire [31:0]                          lsd_line_addr_r, 
    output wire                                 lsd_write_protect_f,
    output wire                                 lsd_write_protect_r,
    
    // Top View to Kalman Filter (prefix: 0x0003)
    input wire                                  topview_ready_f, 
    input wire                                  topview_ready_r, 
    input wire [31:0]                           topview_line_num_f, 
    input wire [31:0]                           topview_line_num_r, 
    input wire [9:0]                            topview_line_start_v_f,
    input wire [9:0]                            topview_line_start_v_r,
    input wire [8:0]                            topview_line_start_h_f,
    input wire [8:0]                            topview_line_start_h_r,
    input wire [9:0]                            topview_line_end_v_f,
    input wire [9:0]                            topview_line_end_v_r,
    input wire [8:0]                            topview_line_end_h_f,
    input wire [8:0]                            topview_line_end_h_r,
    input wire                                  topview_line_valid_f,
    input wire                                  topview_line_valid_r,
    output wire [31:0]                          topview_line_addr_f, 
    output wire [31:0]                          topview_line_addr_r, 
    output wire                                 topview_write_protect_f,
    output wire                                 topview_write_protect_r,

    // Motor Controller Feedback to Kalman Filter (prefix: 0x0004)
    input wire [15:0]                           motor_speed_l,
    input wire [15:0]                           motor_speed_r,

    // Keep Left to Motor Controller (prefix: 0x0005)
    output wire [6:0]                           kl_accel,
    output wire [7:0]                           kl_steer,

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
   pspl_comm_v1_0_S00_AXI 
     #( 
        .C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
        ) 
   pspl_comm_v1_0_S00_AXI_inst 
     (
      // Test
      .sw(sw),
      .led(led),
      // SCCB
      .sccb_busy(sccb_busy),
      .sccb_req(sccb_req),
      .sccb_send_data(sccb_send_data),
      // LSD to Kalman Filter
      .lsd_ready_f(lsd_ready_f),
      .lsd_ready_r(lsd_ready_r),
      .lsd_line_num_f(lsd_line_num_f),
      .lsd_line_num_r(lsd_line_num_r),
      .lsd_line_start_v_f(lsd_line_start_v_f),
      .lsd_line_start_v_r(lsd_line_start_v_r), 
      .lsd_line_start_h_f(lsd_line_start_h_f), 
      .lsd_line_start_h_r(lsd_line_start_h_r), 
      .lsd_line_end_v_f(lsd_line_end_v_f),   
      .lsd_line_end_v_r(lsd_line_end_v_r),   
      .lsd_line_end_h_f(lsd_line_end_h_f),   
      .lsd_line_end_h_r(lsd_line_end_h_r),   
      .lsd_line_addr_f(lsd_line_addr_f),
      .lsd_line_addr_r(lsd_line_addr_r),
      .lsd_write_protect_f(lsd_write_protect_f),
      .lsd_write_protect_r(lsd_write_protect_r),
      // Top View to Kalman Filter
      .topview_ready_f(topview_ready_f),
      .topview_ready_r(topview_ready_r),
      .topview_line_num_f(topview_line_num_f),
      .topview_line_num_r(topview_line_num_r),
      .topview_line_start_v_f(topview_line_start_v_f),
      .topview_line_start_v_r(topview_line_start_v_r),
      .topview_line_start_h_f(topview_line_start_h_f),
      .topview_line_start_h_r(topview_line_start_h_r),
      .topview_line_end_v_f(topview_line_end_v_f),
      .topview_line_end_v_r(topview_line_end_v_r),
      .topview_line_end_h_f(topview_line_end_h_f),
      .topview_line_end_h_r(topview_line_end_h_r),
      .topview_line_valid_f(topview_line_valid_f),
      .topview_line_valid_r(topview_line_valid_r),
      .topview_line_addr_f(topview_line_addr_f),
      .topview_line_addr_r(topview_line_addr_r),
      .topview_write_protect_f(topview_write_protect_f),
      .topview_write_protect_r(topview_write_protect_r),
      // Motor Controller Feedback to Kalman Filter
      .motor_speed_l(motor_speed_l),
      .motor_speed_r(motor_speed_r),
      // Keep Left to Motor Controller
      .kl_accel(kl_accel),
      .kl_steer(kl_steer),
      // AXI
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
      .S_AXI_RREADY(s00_axi_rready)
      );

   // Add user logic here

   // User logic ends

endmodule
`default_nettype wire
