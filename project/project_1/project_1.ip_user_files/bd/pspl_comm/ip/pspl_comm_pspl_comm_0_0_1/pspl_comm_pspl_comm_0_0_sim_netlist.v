// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Wed Nov 20 19:18:05 2019
// Host        : cuckoo running 64-bit CentOS release 6.9 (Final)
// Command     : write_verilog -force -mode funcsim
//               /home/users/matsuda/project/Autonomous_Vehicle_Driving/top/project/project_1/project_1.srcs/sources_1/bd/pspl_comm/ip/pspl_comm_pspl_comm_0_0_1/pspl_comm_pspl_comm_0_0_sim_netlist.v
// Design      : pspl_comm_pspl_comm_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pspl_comm_pspl_comm_0_0,pspl_comm_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "pspl_comm_v1_0,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module pspl_comm_pspl_comm_0_0
   (sw,
    led,
    sccb_busy,
    sccb_req,
    sccb_send_data,
    lsd_ready_f,
    lsd_ready_r,
    lsd_line_num_f,
    lsd_line_num_r,
    lsd_line_start_v_f,
    lsd_line_start_v_r,
    lsd_line_start_h_f,
    lsd_line_start_h_r,
    lsd_line_end_v_f,
    lsd_line_end_v_r,
    lsd_line_end_h_f,
    lsd_line_end_h_r,
    lsd_line_addr_f,
    lsd_line_addr_r,
    topview_ready_f,
    topview_ready_r,
    topview_line_num_f,
    topview_line_num_r,
    topview_line_start_v_f,
    topview_line_start_v_r,
    topview_line_start_h_f,
    topview_line_start_h_r,
    topview_line_end_v_f,
    topview_line_end_v_r,
    topview_line_end_h_f,
    topview_line_end_h_r,
    topview_line_valid_f,
    topview_line_valid_r,
    topview_line_addr_f,
    topview_line_addr_r,
    motor_speed_l,
    motor_speed_r,
    kl_accel,
    kl_steer,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
  input [1:0]sw;
  output [3:0]led;
  input sccb_busy;
  output sccb_req;
  output [23:0]sccb_send_data;
  input lsd_ready_f;
  input lsd_ready_r;
  input [31:0]lsd_line_num_f;
  input [31:0]lsd_line_num_r;
  input [31:0]lsd_line_start_v_f;
  input [31:0]lsd_line_start_v_r;
  input [31:0]lsd_line_start_h_f;
  input [31:0]lsd_line_start_h_r;
  input [31:0]lsd_line_end_v_f;
  input [31:0]lsd_line_end_v_r;
  input [31:0]lsd_line_end_h_f;
  input [31:0]lsd_line_end_h_r;
  output [31:0]lsd_line_addr_f;
  output [31:0]lsd_line_addr_r;
  input topview_ready_f;
  input topview_ready_r;
  input [31:0]topview_line_num_f;
  input [31:0]topview_line_num_r;
  input [31:0]topview_line_start_v_f;
  input [31:0]topview_line_start_v_r;
  input [31:0]topview_line_start_h_f;
  input [31:0]topview_line_start_h_r;
  input [31:0]topview_line_end_v_f;
  input [31:0]topview_line_end_v_r;
  input [31:0]topview_line_end_h_f;
  input [31:0]topview_line_end_h_r;
  input topview_line_valid_f;
  input topview_line_valid_r;
  output [31:0]topview_line_addr_f;
  output [31:0]topview_line_addr_r;
  input [15:0]motor_speed_l;
  input [15:0]motor_speed_r;
  output [6:0]kl_accel;
  output [7:0]kl_steer;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN pspl_comm_processing_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN pspl_comm_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire [6:0]kl_accel;
  wire [7:0]kl_steer;
  wire [3:0]led;
  wire [31:0]lsd_line_addr_f;
  wire [31:0]lsd_line_addr_r;
  wire [31:0]lsd_line_end_h_f;
  wire [31:0]lsd_line_end_h_r;
  wire [31:0]lsd_line_end_v_f;
  wire [31:0]lsd_line_end_v_r;
  wire [31:0]lsd_line_num_f;
  wire [31:0]lsd_line_num_r;
  wire [31:0]lsd_line_start_h_f;
  wire [31:0]lsd_line_start_h_r;
  wire [31:0]lsd_line_start_v_f;
  wire [31:0]lsd_line_start_v_r;
  wire lsd_ready_f;
  wire lsd_ready_r;
  wire [15:0]motor_speed_l;
  wire [15:0]motor_speed_r;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire sccb_busy;
  wire sccb_req;
  wire [23:0]sccb_send_data;
  wire [1:0]sw;
  wire [31:0]topview_line_addr_f;
  wire [31:0]topview_line_addr_r;
  wire [31:0]topview_line_end_h_f;
  wire [31:0]topview_line_end_h_r;
  wire [31:0]topview_line_end_v_f;
  wire [31:0]topview_line_end_v_r;
  wire [31:0]topview_line_num_f;
  wire [31:0]topview_line_num_r;
  wire [31:0]topview_line_start_h_f;
  wire [31:0]topview_line_start_h_r;
  wire [31:0]topview_line_start_v_f;
  wire [31:0]topview_line_start_v_r;
  wire topview_line_valid_f;
  wire topview_line_valid_r;
  wire topview_ready_f;
  wire topview_ready_r;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  pspl_comm_pspl_comm_0_0_pspl_comm_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .kl_accel(kl_accel),
        .kl_steer(kl_steer),
        .led(led),
        .lsd_line_addr_f(lsd_line_addr_f),
        .lsd_line_addr_r(lsd_line_addr_r),
        .lsd_line_end_h_f(lsd_line_end_h_f[9:0]),
        .lsd_line_end_h_r(lsd_line_end_h_r[9:0]),
        .lsd_line_end_v_f(lsd_line_end_v_f[9:0]),
        .lsd_line_end_v_r(lsd_line_end_v_r[9:0]),
        .lsd_line_num_f(lsd_line_num_f),
        .lsd_line_num_r(lsd_line_num_r),
        .lsd_line_start_h_f(lsd_line_start_h_f[9:0]),
        .lsd_line_start_h_r(lsd_line_start_h_r[9:0]),
        .lsd_line_start_v_f(lsd_line_start_v_f[9:0]),
        .lsd_line_start_v_r(lsd_line_start_v_r[9:0]),
        .lsd_ready_f(lsd_ready_f),
        .lsd_ready_r(lsd_ready_r),
        .motor_speed_l(motor_speed_l),
        .motor_speed_r(motor_speed_r),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .sccb_busy(sccb_busy),
        .sccb_req(sccb_req),
        .sccb_send_data(sccb_send_data),
        .sw(sw),
        .topview_line_addr_f(topview_line_addr_f),
        .topview_line_addr_r(topview_line_addr_r),
        .topview_line_end_h_f(topview_line_end_h_f[8:0]),
        .topview_line_end_h_r(topview_line_end_h_r[8:0]),
        .topview_line_end_v_f(topview_line_end_v_f[9:0]),
        .topview_line_end_v_r(topview_line_end_v_r[9:0]),
        .topview_line_num_f(topview_line_num_f),
        .topview_line_num_r(topview_line_num_r),
        .topview_line_start_h_f(topview_line_start_h_f[8:0]),
        .topview_line_start_h_r(topview_line_start_h_r[8:0]),
        .topview_line_start_v_f(topview_line_start_v_f[9:0]),
        .topview_line_start_v_r(topview_line_start_v_r[9:0]),
        .topview_line_valid_f(topview_line_valid_f),
        .topview_line_valid_r(topview_line_valid_r),
        .topview_ready_f(topview_ready_f),
        .topview_ready_r(topview_ready_r));
endmodule

(* ORIG_REF_NAME = "pspl_comm_v1_0" *) 
module pspl_comm_pspl_comm_0_0_pspl_comm_v1_0
   (led,
    sccb_req,
    sccb_send_data,
    lsd_line_addr_f,
    lsd_line_addr_r,
    topview_line_addr_f,
    topview_line_addr_r,
    kl_accel,
    kl_steer,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    topview_line_num_r,
    motor_speed_r,
    topview_line_end_v_f,
    topview_line_num_f,
    topview_line_start_v_f,
    topview_line_end_v_r,
    topview_line_start_v_r,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    sw,
    sccb_busy,
    topview_line_end_h_f,
    topview_line_start_h_f,
    motor_speed_l,
    lsd_line_num_r,
    lsd_line_num_f,
    topview_line_end_h_r,
    topview_line_start_h_r,
    lsd_line_end_v_f,
    lsd_line_start_v_f,
    lsd_line_end_v_r,
    lsd_line_start_v_r,
    lsd_line_start_h_r,
    lsd_line_end_h_r,
    lsd_line_end_h_f,
    lsd_line_start_h_f,
    topview_line_valid_f,
    topview_line_valid_r,
    topview_ready_r,
    lsd_ready_r,
    lsd_ready_f,
    topview_ready_f,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [3:0]led;
  output sccb_req;
  output [23:0]sccb_send_data;
  output [31:0]lsd_line_addr_f;
  output [31:0]lsd_line_addr_r;
  output [31:0]topview_line_addr_f;
  output [31:0]topview_line_addr_r;
  output [6:0]kl_accel;
  output [7:0]kl_steer;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input [31:0]topview_line_num_r;
  input [15:0]motor_speed_r;
  input [9:0]topview_line_end_v_f;
  input [31:0]topview_line_num_f;
  input [9:0]topview_line_start_v_f;
  input [9:0]topview_line_end_v_r;
  input [9:0]topview_line_start_v_r;
  input [31:0]s00_axi_wdata;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input [1:0]sw;
  input sccb_busy;
  input [8:0]topview_line_end_h_f;
  input [8:0]topview_line_start_h_f;
  input [15:0]motor_speed_l;
  input [31:0]lsd_line_num_r;
  input [31:0]lsd_line_num_f;
  input [8:0]topview_line_end_h_r;
  input [8:0]topview_line_start_h_r;
  input [9:0]lsd_line_end_v_f;
  input [9:0]lsd_line_start_v_f;
  input [9:0]lsd_line_end_v_r;
  input [9:0]lsd_line_start_v_r;
  input [9:0]lsd_line_start_h_r;
  input [9:0]lsd_line_end_h_r;
  input [9:0]lsd_line_end_h_f;
  input [9:0]lsd_line_start_h_f;
  input topview_line_valid_f;
  input topview_line_valid_r;
  input topview_ready_r;
  input lsd_ready_r;
  input lsd_ready_f;
  input topview_ready_f;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire [6:0]kl_accel;
  wire [7:0]kl_steer;
  wire [3:0]led;
  wire [31:0]lsd_line_addr_f;
  wire [31:0]lsd_line_addr_r;
  wire [9:0]lsd_line_end_h_f;
  wire [9:0]lsd_line_end_h_r;
  wire [9:0]lsd_line_end_v_f;
  wire [9:0]lsd_line_end_v_r;
  wire [31:0]lsd_line_num_f;
  wire [31:0]lsd_line_num_r;
  wire [9:0]lsd_line_start_h_f;
  wire [9:0]lsd_line_start_h_r;
  wire [9:0]lsd_line_start_v_f;
  wire [9:0]lsd_line_start_v_r;
  wire lsd_ready_f;
  wire lsd_ready_r;
  wire [15:0]motor_speed_l;
  wire [15:0]motor_speed_r;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire sccb_busy;
  wire sccb_req;
  wire [23:0]sccb_send_data;
  wire [1:0]sw;
  wire [31:0]topview_line_addr_f;
  wire [31:0]topview_line_addr_r;
  wire [8:0]topview_line_end_h_f;
  wire [8:0]topview_line_end_h_r;
  wire [9:0]topview_line_end_v_f;
  wire [9:0]topview_line_end_v_r;
  wire [31:0]topview_line_num_f;
  wire [31:0]topview_line_num_r;
  wire [8:0]topview_line_start_h_f;
  wire [8:0]topview_line_start_h_r;
  wire [9:0]topview_line_start_v_f;
  wire [9:0]topview_line_start_v_r;
  wire topview_line_valid_f;
  wire topview_line_valid_r;
  wire topview_ready_f;
  wire topview_ready_r;

  pspl_comm_pspl_comm_0_0_pspl_comm_v1_0_S00_AXI pspl_comm_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .kl_accel(kl_accel),
        .kl_steer(kl_steer),
        .led(led),
        .lsd_line_addr_f(lsd_line_addr_f),
        .lsd_line_addr_r(lsd_line_addr_r),
        .lsd_line_end_h_f(lsd_line_end_h_f),
        .lsd_line_end_h_r(lsd_line_end_h_r),
        .lsd_line_end_v_f(lsd_line_end_v_f),
        .lsd_line_end_v_r(lsd_line_end_v_r),
        .lsd_line_num_f(lsd_line_num_f),
        .lsd_line_num_r(lsd_line_num_r),
        .lsd_line_start_h_f(lsd_line_start_h_f),
        .lsd_line_start_h_r(lsd_line_start_h_r),
        .lsd_line_start_v_f(lsd_line_start_v_f),
        .lsd_line_start_v_r(lsd_line_start_v_r),
        .lsd_ready_f(lsd_ready_f),
        .lsd_ready_r(lsd_ready_r),
        .motor_speed_l(motor_speed_l),
        .motor_speed_r(motor_speed_r),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .sccb_busy(sccb_busy),
        .sccb_req(sccb_req),
        .sccb_send_data(sccb_send_data),
        .sw(sw),
        .topview_line_addr_f(topview_line_addr_f),
        .topview_line_addr_r(topview_line_addr_r),
        .topview_line_end_h_f(topview_line_end_h_f),
        .topview_line_end_h_r(topview_line_end_h_r),
        .topview_line_end_v_f(topview_line_end_v_f),
        .topview_line_end_v_r(topview_line_end_v_r),
        .topview_line_num_f(topview_line_num_f),
        .topview_line_num_r(topview_line_num_r),
        .topview_line_start_h_f(topview_line_start_h_f),
        .topview_line_start_h_r(topview_line_start_h_r),
        .topview_line_start_v_f(topview_line_start_v_f),
        .topview_line_start_v_r(topview_line_start_v_r),
        .topview_line_valid_f(topview_line_valid_f),
        .topview_line_valid_r(topview_line_valid_r),
        .topview_ready_f(topview_ready_f),
        .topview_ready_r(topview_ready_r));
endmodule

(* ORIG_REF_NAME = "pspl_comm_v1_0_S00_AXI" *) 
module pspl_comm_pspl_comm_0_0_pspl_comm_v1_0_S00_AXI
   (led,
    sccb_req,
    sccb_send_data,
    lsd_line_addr_f,
    lsd_line_addr_r,
    topview_line_addr_f,
    topview_line_addr_r,
    kl_accel,
    kl_steer,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    topview_line_num_r,
    motor_speed_r,
    topview_line_end_v_f,
    topview_line_num_f,
    topview_line_start_v_f,
    topview_line_end_v_r,
    topview_line_start_v_r,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    sw,
    sccb_busy,
    topview_line_end_h_f,
    topview_line_start_h_f,
    motor_speed_l,
    lsd_line_num_r,
    lsd_line_num_f,
    topview_line_end_h_r,
    topview_line_start_h_r,
    lsd_line_end_v_f,
    lsd_line_start_v_f,
    lsd_line_end_v_r,
    lsd_line_start_v_r,
    lsd_line_start_h_r,
    lsd_line_end_h_r,
    lsd_line_end_h_f,
    lsd_line_start_h_f,
    topview_line_valid_f,
    topview_line_valid_r,
    topview_ready_r,
    lsd_ready_r,
    lsd_ready_f,
    topview_ready_f,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [3:0]led;
  output sccb_req;
  output [23:0]sccb_send_data;
  output [31:0]lsd_line_addr_f;
  output [31:0]lsd_line_addr_r;
  output [31:0]topview_line_addr_f;
  output [31:0]topview_line_addr_r;
  output [6:0]kl_accel;
  output [7:0]kl_steer;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input [31:0]topview_line_num_r;
  input [15:0]motor_speed_r;
  input [9:0]topview_line_end_v_f;
  input [31:0]topview_line_num_f;
  input [9:0]topview_line_start_v_f;
  input [9:0]topview_line_end_v_r;
  input [9:0]topview_line_start_v_r;
  input [31:0]s00_axi_wdata;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input [1:0]sw;
  input sccb_busy;
  input [8:0]topview_line_end_h_f;
  input [8:0]topview_line_start_h_f;
  input [15:0]motor_speed_l;
  input [31:0]lsd_line_num_r;
  input [31:0]lsd_line_num_f;
  input [8:0]topview_line_end_h_r;
  input [8:0]topview_line_start_h_r;
  input [9:0]lsd_line_end_v_f;
  input [9:0]lsd_line_start_v_f;
  input [9:0]lsd_line_end_v_r;
  input [9:0]lsd_line_start_v_r;
  input [9:0]lsd_line_start_h_r;
  input [9:0]lsd_line_end_h_r;
  input [9:0]lsd_line_end_h_f;
  input [9:0]lsd_line_start_h_f;
  input topview_line_valid_f;
  input topview_line_valid_r;
  input topview_ready_r;
  input lsd_ready_r;
  input lsd_ready_f;
  input topview_ready_f;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_10_n_0 ;
  wire \axi_rdata[0]_i_11_n_0 ;
  wire \axi_rdata[0]_i_12_n_0 ;
  wire \axi_rdata[0]_i_13_n_0 ;
  wire \axi_rdata[0]_i_14_n_0 ;
  wire \axi_rdata[0]_i_15_n_0 ;
  wire \axi_rdata[0]_i_16_n_0 ;
  wire \axi_rdata[0]_i_17_n_0 ;
  wire \axi_rdata[0]_i_18_n_0 ;
  wire \axi_rdata[0]_i_19_n_0 ;
  wire \axi_rdata[0]_i_20_n_0 ;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire \axi_rdata[0]_i_4_n_0 ;
  wire \axi_rdata[0]_i_5_n_0 ;
  wire \axi_rdata[0]_i_6_n_0 ;
  wire \axi_rdata[0]_i_7_n_0 ;
  wire \axi_rdata[0]_i_8_n_0 ;
  wire \axi_rdata[0]_i_9_n_0 ;
  wire \axi_rdata[10]_i_3_n_0 ;
  wire \axi_rdata[10]_i_4_n_0 ;
  wire \axi_rdata[10]_i_5_n_0 ;
  wire \axi_rdata[11]_i_3_n_0 ;
  wire \axi_rdata[11]_i_4_n_0 ;
  wire \axi_rdata[11]_i_5_n_0 ;
  wire \axi_rdata[12]_i_3_n_0 ;
  wire \axi_rdata[12]_i_4_n_0 ;
  wire \axi_rdata[12]_i_5_n_0 ;
  wire \axi_rdata[13]_i_3_n_0 ;
  wire \axi_rdata[13]_i_4_n_0 ;
  wire \axi_rdata[13]_i_5_n_0 ;
  wire \axi_rdata[14]_i_3_n_0 ;
  wire \axi_rdata[14]_i_4_n_0 ;
  wire \axi_rdata[14]_i_5_n_0 ;
  wire \axi_rdata[15]_i_2_n_0 ;
  wire \axi_rdata[15]_i_3_n_0 ;
  wire \axi_rdata[15]_i_5_n_0 ;
  wire \axi_rdata[15]_i_6_n_0 ;
  wire \axi_rdata[15]_i_7_n_0 ;
  wire \axi_rdata[16]_i_2_n_0 ;
  wire \axi_rdata[16]_i_3_n_0 ;
  wire \axi_rdata[17]_i_2_n_0 ;
  wire \axi_rdata[17]_i_3_n_0 ;
  wire \axi_rdata[18]_i_2_n_0 ;
  wire \axi_rdata[18]_i_3_n_0 ;
  wire \axi_rdata[19]_i_2_n_0 ;
  wire \axi_rdata[19]_i_3_n_0 ;
  wire \axi_rdata[1]_i_10_n_0 ;
  wire \axi_rdata[1]_i_11_n_0 ;
  wire \axi_rdata[1]_i_12_n_0 ;
  wire \axi_rdata[1]_i_13_n_0 ;
  wire \axi_rdata[1]_i_14_n_0 ;
  wire \axi_rdata[1]_i_15_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[1]_i_4_n_0 ;
  wire \axi_rdata[1]_i_5_n_0 ;
  wire \axi_rdata[1]_i_6_n_0 ;
  wire \axi_rdata[1]_i_7_n_0 ;
  wire \axi_rdata[1]_i_8_n_0 ;
  wire \axi_rdata[1]_i_9_n_0 ;
  wire \axi_rdata[20]_i_2_n_0 ;
  wire \axi_rdata[20]_i_3_n_0 ;
  wire \axi_rdata[21]_i_2_n_0 ;
  wire \axi_rdata[21]_i_3_n_0 ;
  wire \axi_rdata[22]_i_2_n_0 ;
  wire \axi_rdata[22]_i_3_n_0 ;
  wire \axi_rdata[23]_i_2_n_0 ;
  wire \axi_rdata[23]_i_3_n_0 ;
  wire \axi_rdata[24]_i_2_n_0 ;
  wire \axi_rdata[24]_i_3_n_0 ;
  wire \axi_rdata[25]_i_2_n_0 ;
  wire \axi_rdata[25]_i_3_n_0 ;
  wire \axi_rdata[26]_i_2_n_0 ;
  wire \axi_rdata[26]_i_3_n_0 ;
  wire \axi_rdata[27]_i_2_n_0 ;
  wire \axi_rdata[27]_i_3_n_0 ;
  wire \axi_rdata[28]_i_2_n_0 ;
  wire \axi_rdata[28]_i_3_n_0 ;
  wire \axi_rdata[29]_i_2_n_0 ;
  wire \axi_rdata[29]_i_3_n_0 ;
  wire \axi_rdata[2]_i_10_n_0 ;
  wire \axi_rdata[2]_i_11_n_0 ;
  wire \axi_rdata[2]_i_12_n_0 ;
  wire \axi_rdata[2]_i_13_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[2]_i_3_n_0 ;
  wire \axi_rdata[2]_i_4_n_0 ;
  wire \axi_rdata[2]_i_5_n_0 ;
  wire \axi_rdata[2]_i_6_n_0 ;
  wire \axi_rdata[2]_i_7_n_0 ;
  wire \axi_rdata[2]_i_8_n_0 ;
  wire \axi_rdata[2]_i_9_n_0 ;
  wire \axi_rdata[30]_i_2_n_0 ;
  wire \axi_rdata[30]_i_3_n_0 ;
  wire \axi_rdata[31]_i_10_n_0 ;
  wire \axi_rdata[31]_i_11_n_0 ;
  wire \axi_rdata[31]_i_12_n_0 ;
  wire \axi_rdata[31]_i_2_n_0 ;
  wire \axi_rdata[31]_i_3_n_0 ;
  wire \axi_rdata[31]_i_4_n_0 ;
  wire \axi_rdata[31]_i_5_n_0 ;
  wire \axi_rdata[31]_i_6_n_0 ;
  wire \axi_rdata[31]_i_7_n_0 ;
  wire \axi_rdata[31]_i_8_n_0 ;
  wire \axi_rdata[31]_i_9_n_0 ;
  wire \axi_rdata[3]_i_10_n_0 ;
  wire \axi_rdata[3]_i_11_n_0 ;
  wire \axi_rdata[3]_i_12_n_0 ;
  wire \axi_rdata[3]_i_13_n_0 ;
  wire \axi_rdata[3]_i_2_n_0 ;
  wire \axi_rdata[3]_i_3_n_0 ;
  wire \axi_rdata[3]_i_4_n_0 ;
  wire \axi_rdata[3]_i_5_n_0 ;
  wire \axi_rdata[3]_i_6_n_0 ;
  wire \axi_rdata[3]_i_7_n_0 ;
  wire \axi_rdata[3]_i_8_n_0 ;
  wire \axi_rdata[3]_i_9_n_0 ;
  wire \axi_rdata[4]_i_10_n_0 ;
  wire \axi_rdata[4]_i_11_n_0 ;
  wire \axi_rdata[4]_i_12_n_0 ;
  wire \axi_rdata[4]_i_13_n_0 ;
  wire \axi_rdata[4]_i_2_n_0 ;
  wire \axi_rdata[4]_i_3_n_0 ;
  wire \axi_rdata[4]_i_4_n_0 ;
  wire \axi_rdata[4]_i_5_n_0 ;
  wire \axi_rdata[4]_i_6_n_0 ;
  wire \axi_rdata[4]_i_7_n_0 ;
  wire \axi_rdata[4]_i_8_n_0 ;
  wire \axi_rdata[4]_i_9_n_0 ;
  wire \axi_rdata[5]_i_10_n_0 ;
  wire \axi_rdata[5]_i_11_n_0 ;
  wire \axi_rdata[5]_i_12_n_0 ;
  wire \axi_rdata[5]_i_13_n_0 ;
  wire \axi_rdata[5]_i_2_n_0 ;
  wire \axi_rdata[5]_i_3_n_0 ;
  wire \axi_rdata[5]_i_4_n_0 ;
  wire \axi_rdata[5]_i_5_n_0 ;
  wire \axi_rdata[5]_i_6_n_0 ;
  wire \axi_rdata[5]_i_7_n_0 ;
  wire \axi_rdata[5]_i_8_n_0 ;
  wire \axi_rdata[5]_i_9_n_0 ;
  wire \axi_rdata[6]_i_10_n_0 ;
  wire \axi_rdata[6]_i_11_n_0 ;
  wire \axi_rdata[6]_i_12_n_0 ;
  wire \axi_rdata[6]_i_13_n_0 ;
  wire \axi_rdata[6]_i_14_n_0 ;
  wire \axi_rdata[6]_i_2_n_0 ;
  wire \axi_rdata[6]_i_3_n_0 ;
  wire \axi_rdata[6]_i_4_n_0 ;
  wire \axi_rdata[6]_i_5_n_0 ;
  wire \axi_rdata[6]_i_6_n_0 ;
  wire \axi_rdata[6]_i_7_n_0 ;
  wire \axi_rdata[6]_i_8_n_0 ;
  wire \axi_rdata[6]_i_9_n_0 ;
  wire \axi_rdata[7]_i_10_n_0 ;
  wire \axi_rdata[7]_i_11_n_0 ;
  wire \axi_rdata[7]_i_12_n_0 ;
  wire \axi_rdata[7]_i_13_n_0 ;
  wire \axi_rdata[7]_i_14_n_0 ;
  wire \axi_rdata[7]_i_2_n_0 ;
  wire \axi_rdata[7]_i_3_n_0 ;
  wire \axi_rdata[7]_i_4_n_0 ;
  wire \axi_rdata[7]_i_5_n_0 ;
  wire \axi_rdata[7]_i_6_n_0 ;
  wire \axi_rdata[7]_i_7_n_0 ;
  wire \axi_rdata[7]_i_8_n_0 ;
  wire \axi_rdata[7]_i_9_n_0 ;
  wire \axi_rdata[8]_i_10_n_0 ;
  wire \axi_rdata[8]_i_11_n_0 ;
  wire \axi_rdata[8]_i_12_n_0 ;
  wire \axi_rdata[8]_i_13_n_0 ;
  wire \axi_rdata[8]_i_14_n_0 ;
  wire \axi_rdata[8]_i_15_n_0 ;
  wire \axi_rdata[8]_i_16_n_0 ;
  wire \axi_rdata[8]_i_2_n_0 ;
  wire \axi_rdata[8]_i_3_n_0 ;
  wire \axi_rdata[8]_i_4_n_0 ;
  wire \axi_rdata[8]_i_5_n_0 ;
  wire \axi_rdata[8]_i_6_n_0 ;
  wire \axi_rdata[8]_i_7_n_0 ;
  wire \axi_rdata[8]_i_8_n_0 ;
  wire \axi_rdata[8]_i_9_n_0 ;
  wire \axi_rdata[9]_i_10_n_0 ;
  wire \axi_rdata[9]_i_11_n_0 ;
  wire \axi_rdata[9]_i_12_n_0 ;
  wire \axi_rdata[9]_i_13_n_0 ;
  wire \axi_rdata[9]_i_2_n_0 ;
  wire \axi_rdata[9]_i_4_n_0 ;
  wire \axi_rdata[9]_i_5_n_0 ;
  wire \axi_rdata[9]_i_6_n_0 ;
  wire \axi_rdata[9]_i_7_n_0 ;
  wire \axi_rdata[9]_i_8_n_0 ;
  wire \axi_rdata[9]_i_9_n_0 ;
  wire \axi_rdata_reg[10]_i_2_n_0 ;
  wire \axi_rdata_reg[11]_i_2_n_0 ;
  wire \axi_rdata_reg[12]_i_2_n_0 ;
  wire \axi_rdata_reg[13]_i_2_n_0 ;
  wire \axi_rdata_reg[14]_i_2_n_0 ;
  wire \axi_rdata_reg[15]_i_4_n_0 ;
  wire \axi_rdata_reg[9]_i_3_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [6:0]kl_accel;
  wire \kl_accel_reg_reg[6]_i_1_n_0 ;
  wire \kl_accel_reg_reg[6]_i_2_n_0 ;
  wire \kl_accel_reg_reg[6]_i_3_n_0 ;
  wire \kl_accel_reg_reg[6]_i_4_n_0 ;
  wire [7:0]kl_steer;
  wire \kl_steer_reg_reg[7]_i_1_n_0 ;
  wire [3:0]led;
  wire \led_reg_reg[3]_i_1_n_0 ;
  wire \led_reg_reg[3]_i_2_n_0 ;
  wire \led_reg_reg[3]_i_3_n_0 ;
  wire \led_reg_reg[3]_i_4_n_0 ;
  wire \led_reg_reg[3]_i_5_n_0 ;
  wire \led_reg_reg[3]_i_6_n_0 ;
  wire \led_reg_reg[3]_i_7_n_0 ;
  wire [31:0]lsd_line_addr_f;
  wire \lsd_line_addr_f_reg_reg[31]_i_1_n_0 ;
  wire \lsd_line_addr_f_reg_reg[31]_i_2_n_0 ;
  wire \lsd_line_addr_f_reg_reg[31]_i_3_n_0 ;
  wire \lsd_line_addr_f_reg_reg[31]_i_4_n_0 ;
  wire \lsd_line_addr_f_reg_reg[31]_i_5_n_0 ;
  wire [31:0]lsd_line_addr_r;
  wire \lsd_line_addr_r_reg_reg[31]_i_1_n_0 ;
  wire [9:0]lsd_line_end_h_f;
  wire [9:0]lsd_line_end_h_r;
  wire [9:0]lsd_line_end_v_f;
  wire [9:0]lsd_line_end_v_r;
  wire [31:0]lsd_line_num_f;
  wire [31:0]lsd_line_num_r;
  wire [9:0]lsd_line_start_h_f;
  wire [9:0]lsd_line_start_h_r;
  wire [9:0]lsd_line_start_v_f;
  wire [9:0]lsd_line_start_v_r;
  wire lsd_ready_f;
  wire lsd_ready_r;
  wire [15:0]motor_speed_l;
  wire [15:0]motor_speed_r;
  wire [1:0]p_0_in;
  wire [24:0]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire sccb_busy;
  wire sccb_req;
  wire sccb_req_reg_reg_i_1_n_0;
  wire sccb_req_reg_reg_i_2_n_0;
  wire [23:0]sccb_send_data;
  wire \sccb_send_data_reg_reg[23]_i_1_n_0 ;
  wire \sccb_send_data_reg_reg[23]_i_2_n_0 ;
  wire \sccb_send_data_reg_reg[23]_i_3_n_0 ;
  wire [31:0]slv_reg0;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;
  wire [1:0]sw;
  wire [31:0]topview_line_addr_f;
  wire \topview_line_addr_f_reg_reg[31]_i_1_n_0 ;
  wire [31:0]topview_line_addr_r;
  wire \topview_line_addr_r_reg_reg[31]_i_1_n_0 ;
  wire \topview_line_addr_r_reg_reg[31]_i_2_n_0 ;
  wire \topview_line_addr_r_reg_reg[31]_i_3_n_0 ;
  wire [8:0]topview_line_end_h_f;
  wire [8:0]topview_line_end_h_r;
  wire [9:0]topview_line_end_v_f;
  wire [9:0]topview_line_end_v_r;
  wire [31:0]topview_line_num_f;
  wire [31:0]topview_line_num_r;
  wire [8:0]topview_line_start_h_f;
  wire [8:0]topview_line_start_h_r;
  wire [9:0]topview_line_start_v_f;
  wire [9:0]topview_line_start_v_r;
  wire topview_line_valid_f;
  wire topview_line_valid_r;
  wire topview_ready_f;
  wire topview_ready_r;

  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(S_AXI_AWREADY),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(S_AXI_WREADY),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAAA)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(\axi_rdata[0]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata[0]_i_4_n_0 ),
        .I4(\axi_rdata[0]_i_5_n_0 ),
        .I5(\axi_rdata[0]_i_6_n_0 ),
        .O(reg_data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \axi_rdata[0]_i_10 
       (.I0(slv_reg2[3]),
        .I1(slv_reg2[2]),
        .O(\axi_rdata[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAFEFFFEFE)) 
    \axi_rdata[0]_i_11 
       (.I0(slv_reg2[1]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[3]),
        .I3(sccb_busy),
        .I4(slv_reg2[16]),
        .I5(slv_reg2[17]),
        .O(\axi_rdata[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF0D0D0D)) 
    \axi_rdata[0]_i_12 
       (.I0(slv_reg2[18]),
        .I1(motor_speed_l[0]),
        .I2(slv_reg2[17]),
        .I3(topview_line_valid_f),
        .I4(\axi_rdata[0]_i_10_n_0 ),
        .I5(slv_reg2[0]),
        .O(\axi_rdata[0]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[0]_i_13 
       (.I0(lsd_line_end_h_f[0]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[0]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[0]),
        .O(\axi_rdata[0]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hF0C500C5)) 
    \axi_rdata[0]_i_14 
       (.I0(\axi_rdata[0]_i_18_n_0 ),
        .I1(\axi_rdata[0]_i_19_n_0 ),
        .I2(slv_reg2[16]),
        .I3(slv_reg2[1]),
        .I4(\axi_rdata[0]_i_20_n_0 ),
        .O(\axi_rdata[0]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[0]_i_15 
       (.I0(lsd_line_end_h_r[0]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[0]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[0]),
        .O(\axi_rdata[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hCFCF4777FFFF4777)) 
    \axi_rdata[0]_i_16 
       (.I0(topview_line_start_v_r[0]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[17]),
        .I3(topview_ready_r),
        .I4(slv_reg2[3]),
        .I5(topview_line_end_v_r[0]),
        .O(\axi_rdata[0]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[0]_i_17 
       (.I0(topview_line_end_h_r[0]),
        .I1(slv_reg2[3]),
        .I2(topview_line_start_h_r[0]),
        .I3(slv_reg2[2]),
        .I4(topview_line_num_r[0]),
        .O(\axi_rdata[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h4777474747777777)) 
    \axi_rdata[0]_i_18 
       (.I0(lsd_line_end_v_f[0]),
        .I1(slv_reg2[3]),
        .I2(slv_reg2[17]),
        .I3(lsd_line_start_v_f[0]),
        .I4(slv_reg2[2]),
        .I5(lsd_ready_f),
        .O(\axi_rdata[0]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[0]_i_19 
       (.I0(topview_line_start_v_f[0]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_f[0]),
        .I3(slv_reg2[3]),
        .I4(topview_ready_f),
        .O(\axi_rdata[0]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[0]_i_2 
       (.I0(slv_reg0[0]),
        .I1(slv_reg2[0]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[0]),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[0]_i_20 
       (.I0(topview_line_end_h_f[0]),
        .I1(slv_reg2[3]),
        .I2(topview_line_start_h_f[0]),
        .I3(slv_reg2[2]),
        .I4(topview_line_num_f[0]),
        .O(\axi_rdata[0]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h00005455)) 
    \axi_rdata[0]_i_3 
       (.I0(\axi_rdata[0]_i_7_n_0 ),
        .I1(slv_reg2[1]),
        .I2(slv_reg2[16]),
        .I3(\axi_rdata[0]_i_8_n_0 ),
        .I4(\axi_rdata[0]_i_9_n_0 ),
        .O(\axi_rdata[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \axi_rdata[0]_i_4 
       (.I0(slv_reg2[18]),
        .I1(slv_reg2[16]),
        .O(\axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC8C8CCCCFAFACCCF)) 
    \axi_rdata[0]_i_5 
       (.I0(\axi_rdata[0]_i_10_n_0 ),
        .I1(\axi_rdata[0]_i_11_n_0 ),
        .I2(slv_reg2[18]),
        .I3(sw[0]),
        .I4(slv_reg2[17]),
        .I5(slv_reg2[16]),
        .O(\axi_rdata[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFAAEA)) 
    \axi_rdata[0]_i_6 
       (.I0(\axi_rdata[0]_i_12_n_0 ),
        .I1(\axi_rdata[0]_i_13_n_0 ),
        .I2(slv_reg2[1]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[0]_i_14_n_0 ),
        .O(\axi_rdata[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF80FF80FF80FF)) 
    \axi_rdata[0]_i_7 
       (.I0(slv_reg2[3]),
        .I1(slv_reg2[2]),
        .I2(topview_line_valid_r),
        .I3(slv_reg2[0]),
        .I4(slv_reg2[18]),
        .I5(motor_speed_r[0]),
        .O(\axi_rdata[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF00008A808A80)) 
    \axi_rdata[0]_i_8 
       (.I0(slv_reg2[17]),
        .I1(lsd_line_start_v_r[0]),
        .I2(slv_reg2[2]),
        .I3(lsd_ready_r),
        .I4(lsd_line_end_v_r[0]),
        .I5(slv_reg2[3]),
        .O(\axi_rdata[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hE0EC202C)) 
    \axi_rdata[0]_i_9 
       (.I0(\axi_rdata[0]_i_15_n_0 ),
        .I1(slv_reg2[16]),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[0]_i_16_n_0 ),
        .I4(\axi_rdata[0]_i_17_n_0 ),
        .O(\axi_rdata[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[10]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[10]_i_2_n_0 ),
        .I4(\axi_rdata[10]_i_3_n_0 ),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[10]_i_3 
       (.I0(slv_reg2[10]),
        .I1(slv_reg0[10]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[10]),
        .O(\axi_rdata[10]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[10]_i_4 
       (.I0(topview_line_num_f[10]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_f[10]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_l[10]),
        .O(\axi_rdata[10]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[10]_i_5 
       (.I0(topview_line_num_r[10]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_r[10]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_r[10]),
        .O(\axi_rdata[10]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[11]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[11]_i_2_n_0 ),
        .I4(\axi_rdata[11]_i_3_n_0 ),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[11]_i_3 
       (.I0(slv_reg2[11]),
        .I1(slv_reg1[11]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[11]),
        .O(\axi_rdata[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[11]_i_4 
       (.I0(topview_line_num_f[11]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_f[11]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_l[11]),
        .O(\axi_rdata[11]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[11]_i_5 
       (.I0(topview_line_num_r[11]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_r[11]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_r[11]),
        .O(\axi_rdata[11]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[12]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[12]_i_2_n_0 ),
        .I4(\axi_rdata[12]_i_3_n_0 ),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[12]_i_3 
       (.I0(slv_reg1[12]),
        .I1(slv_reg2[12]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg0[12]),
        .O(\axi_rdata[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[12]_i_4 
       (.I0(topview_line_num_f[12]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_f[12]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_l[12]),
        .O(\axi_rdata[12]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[12]_i_5 
       (.I0(topview_line_num_r[12]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_r[12]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_r[12]),
        .O(\axi_rdata[12]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[13]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[13]_i_2_n_0 ),
        .I4(\axi_rdata[13]_i_3_n_0 ),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[13]_i_3 
       (.I0(slv_reg2[13]),
        .I1(slv_reg0[13]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[13]),
        .O(\axi_rdata[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[13]_i_4 
       (.I0(topview_line_num_f[13]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_f[13]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_l[13]),
        .O(\axi_rdata[13]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[13]_i_5 
       (.I0(topview_line_num_r[13]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_r[13]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_r[13]),
        .O(\axi_rdata[13]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[14]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[14]_i_2_n_0 ),
        .I4(\axi_rdata[14]_i_3_n_0 ),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[14]_i_3 
       (.I0(slv_reg2[14]),
        .I1(slv_reg0[14]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[14]),
        .O(\axi_rdata[14]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[14]_i_4 
       (.I0(topview_line_num_f[14]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_f[14]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_l[14]),
        .O(\axi_rdata[14]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[14]_i_5 
       (.I0(topview_line_num_r[14]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_r[14]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_r[14]),
        .O(\axi_rdata[14]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[15]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[15]_i_4_n_0 ),
        .I4(\axi_rdata[15]_i_5_n_0 ),
        .O(reg_data_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFDF)) 
    \axi_rdata[15]_i_2 
       (.I0(slv_reg2[17]),
        .I1(slv_reg2[18]),
        .I2(slv_reg2[1]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[2]),
        .O(\axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \axi_rdata[15]_i_3 
       (.I0(slv_reg2[17]),
        .I1(slv_reg2[18]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[2]),
        .I4(slv_reg2[16]),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[15]_i_5 
       (.I0(slv_reg1[15]),
        .I1(slv_reg2[15]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg0[15]),
        .O(\axi_rdata[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[15]_i_6 
       (.I0(topview_line_num_f[15]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_f[15]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_l[15]),
        .O(\axi_rdata[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[15]_i_7 
       (.I0(topview_line_num_r[15]),
        .I1(slv_reg2[16]),
        .I2(lsd_line_num_r[15]),
        .I3(slv_reg2[1]),
        .I4(motor_speed_r[15]),
        .O(\axi_rdata[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[16]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[16]_i_2_n_0 ),
        .I5(\axi_rdata[16]_i_3_n_0 ),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_2 
       (.I0(topview_line_num_r[16]),
        .I1(lsd_line_num_r[16]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[16]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[16]),
        .O(\axi_rdata[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[16]_i_3 
       (.I0(slv_reg2[16]),
        .I1(slv_reg1[16]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[16]),
        .O(\axi_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[17]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[17]_i_2_n_0 ),
        .I5(\axi_rdata[17]_i_3_n_0 ),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_2 
       (.I0(topview_line_num_r[17]),
        .I1(lsd_line_num_r[17]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[17]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[17]),
        .O(\axi_rdata[17]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[17]_i_3 
       (.I0(slv_reg1[17]),
        .I1(slv_reg2[17]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg0[17]),
        .O(\axi_rdata[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[18]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[18]_i_2_n_0 ),
        .I5(\axi_rdata[18]_i_3_n_0 ),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_2 
       (.I0(topview_line_num_r[18]),
        .I1(lsd_line_num_r[18]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[18]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[18]),
        .O(\axi_rdata[18]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[18]_i_3 
       (.I0(slv_reg2[18]),
        .I1(slv_reg0[18]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[18]),
        .O(\axi_rdata[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[19]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[19]_i_2_n_0 ),
        .I5(\axi_rdata[19]_i_3_n_0 ),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_2 
       (.I0(topview_line_num_r[19]),
        .I1(lsd_line_num_r[19]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[19]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[19]),
        .O(\axi_rdata[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[19]_i_3 
       (.I0(slv_reg0[19]),
        .I1(slv_reg2[19]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[19]),
        .O(\axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABBABAAAAAAAA)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata[1]_i_2_n_0 ),
        .I1(\axi_rdata[1]_i_3_n_0 ),
        .I2(\axi_rdata[1]_i_4_n_0 ),
        .I3(\axi_rdata[1]_i_5_n_0 ),
        .I4(\axi_rdata[31]_i_3_n_0 ),
        .I5(\axi_rdata[1]_i_6_n_0 ),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'hAAAAEFEA)) 
    \axi_rdata[1]_i_10 
       (.I0(\axi_rdata[1]_i_14_n_0 ),
        .I1(topview_line_start_v_r[1]),
        .I2(slv_reg2[2]),
        .I3(topview_line_end_v_r[1]),
        .I4(slv_reg2[1]),
        .O(\axi_rdata[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBB888B888B888)) 
    \axi_rdata[1]_i_11 
       (.I0(\axi_rdata[1]_i_15_n_0 ),
        .I1(slv_reg2[1]),
        .I2(lsd_line_start_v_r[1]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_end_v_r[1]),
        .I5(slv_reg2[3]),
        .O(\axi_rdata[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAFB)) 
    \axi_rdata[1]_i_12 
       (.I0(slv_reg2[0]),
        .I1(slv_reg2[18]),
        .I2(motor_speed_l[1]),
        .I3(slv_reg2[1]),
        .I4(slv_reg2[2]),
        .I5(slv_reg2[3]),
        .O(\axi_rdata[1]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[1]_i_13 
       (.I0(lsd_line_end_h_f[1]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[1]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[1]),
        .O(\axi_rdata[1]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFC0CACA00000A0A)) 
    \axi_rdata[1]_i_14 
       (.I0(topview_line_num_r[1]),
        .I1(topview_line_end_h_r[1]),
        .I2(slv_reg2[3]),
        .I3(topview_line_start_h_r[1]),
        .I4(slv_reg2[2]),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[1]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[1]_i_15 
       (.I0(lsd_line_end_h_r[1]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[1]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[1]),
        .O(\axi_rdata[1]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[1]_i_2 
       (.I0(slv_reg2[1]),
        .I1(slv_reg0[1]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[1]),
        .O(\axi_rdata[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2203)) 
    \axi_rdata[1]_i_3 
       (.I0(\axi_rdata[1]_i_7_n_0 ),
        .I1(\axi_rdata[1]_i_8_n_0 ),
        .I2(\axi_rdata[1]_i_9_n_0 ),
        .I3(slv_reg2[16]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFC1FFFF)) 
    \axi_rdata[1]_i_4 
       (.I0(slv_reg2[1]),
        .I1(slv_reg2[3]),
        .I2(slv_reg2[2]),
        .I3(slv_reg2[18]),
        .I4(slv_reg2[17]),
        .O(\axi_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001010100)) 
    \axi_rdata[1]_i_5 
       (.I0(\axi_rdata[31]_i_4_n_0 ),
        .I1(slv_reg2[16]),
        .I2(slv_reg2[1]),
        .I3(slv_reg2[18]),
        .I4(sw[1]),
        .I5(slv_reg2[17]),
        .O(\axi_rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8B8B8FFFFFFFF)) 
    \axi_rdata[1]_i_6 
       (.I0(\axi_rdata[1]_i_10_n_0 ),
        .I1(slv_reg2[16]),
        .I2(\axi_rdata[1]_i_11_n_0 ),
        .I3(slv_reg2[18]),
        .I4(motor_speed_r[1]),
        .I5(slv_reg2[0]),
        .O(\axi_rdata[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h003F3535FFFFF5F5)) 
    \axi_rdata[1]_i_7 
       (.I0(topview_line_num_f[1]),
        .I1(topview_line_end_h_f[1]),
        .I2(slv_reg2[3]),
        .I3(topview_line_start_h_f[1]),
        .I4(slv_reg2[2]),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF40444000)) 
    \axi_rdata[1]_i_8 
       (.I0(slv_reg2[1]),
        .I1(slv_reg2[16]),
        .I2(topview_line_start_v_f[1]),
        .I3(slv_reg2[2]),
        .I4(topview_line_end_v_f[1]),
        .I5(\axi_rdata[1]_i_12_n_0 ),
        .O(\axi_rdata[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBB888B888B888)) 
    \axi_rdata[1]_i_9 
       (.I0(\axi_rdata[1]_i_13_n_0 ),
        .I1(slv_reg2[1]),
        .I2(lsd_line_end_v_f[1]),
        .I3(slv_reg2[3]),
        .I4(lsd_line_start_v_f[1]),
        .I5(slv_reg2[2]),
        .O(\axi_rdata[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[20]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[20]_i_2_n_0 ),
        .I5(\axi_rdata[20]_i_3_n_0 ),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_2 
       (.I0(topview_line_num_r[20]),
        .I1(lsd_line_num_r[20]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[20]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[20]),
        .O(\axi_rdata[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[20]_i_3 
       (.I0(slv_reg2[20]),
        .I1(slv_reg0[20]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[20]),
        .O(\axi_rdata[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[21]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[21]_i_2_n_0 ),
        .I5(\axi_rdata[21]_i_3_n_0 ),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_2 
       (.I0(topview_line_num_r[21]),
        .I1(lsd_line_num_r[21]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[21]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[21]),
        .O(\axi_rdata[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[21]_i_3 
       (.I0(slv_reg1[21]),
        .I1(slv_reg2[21]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg0[21]),
        .O(\axi_rdata[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[22]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[22]_i_2_n_0 ),
        .I5(\axi_rdata[22]_i_3_n_0 ),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_2 
       (.I0(topview_line_num_r[22]),
        .I1(lsd_line_num_r[22]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[22]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[22]),
        .O(\axi_rdata[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[22]_i_3 
       (.I0(slv_reg2[22]),
        .I1(slv_reg0[22]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[22]),
        .O(\axi_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[23]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[23]_i_2_n_0 ),
        .I5(\axi_rdata[23]_i_3_n_0 ),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_2 
       (.I0(topview_line_num_r[23]),
        .I1(lsd_line_num_r[23]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[23]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[23]),
        .O(\axi_rdata[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[23]_i_3 
       (.I0(slv_reg2[23]),
        .I1(slv_reg0[23]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[23]),
        .O(\axi_rdata[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[24]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[24]_i_2_n_0 ),
        .I5(\axi_rdata[24]_i_3_n_0 ),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_2 
       (.I0(topview_line_num_r[24]),
        .I1(lsd_line_num_r[24]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[24]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[24]),
        .O(\axi_rdata[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[24]_i_3 
       (.I0(slv_reg0[24]),
        .I1(slv_reg1[24]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg2[24]),
        .O(\axi_rdata[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[25]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[25]_i_2_n_0 ),
        .I5(\axi_rdata[25]_i_3_n_0 ),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_2 
       (.I0(topview_line_num_r[25]),
        .I1(lsd_line_num_r[25]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[25]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[25]),
        .O(\axi_rdata[25]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[25]_i_3 
       (.I0(slv_reg0[25]),
        .I1(slv_reg1[25]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg2[25]),
        .O(\axi_rdata[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[26]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[26]_i_2_n_0 ),
        .I5(\axi_rdata[26]_i_3_n_0 ),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_2 
       (.I0(topview_line_num_r[26]),
        .I1(lsd_line_num_r[26]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[26]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[26]),
        .O(\axi_rdata[26]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[26]_i_3 
       (.I0(slv_reg2[26]),
        .I1(slv_reg1[26]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[26]),
        .O(\axi_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[27]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[27]_i_2_n_0 ),
        .I5(\axi_rdata[27]_i_3_n_0 ),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_2 
       (.I0(topview_line_num_r[27]),
        .I1(lsd_line_num_r[27]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[27]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[27]),
        .O(\axi_rdata[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[27]_i_3 
       (.I0(slv_reg2[27]),
        .I1(slv_reg0[27]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[27]),
        .O(\axi_rdata[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[28]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[28]_i_2_n_0 ),
        .I5(\axi_rdata[28]_i_3_n_0 ),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_2 
       (.I0(topview_line_num_r[28]),
        .I1(lsd_line_num_r[28]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[28]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[28]),
        .O(\axi_rdata[28]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[28]_i_3 
       (.I0(slv_reg0[28]),
        .I1(slv_reg2[28]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[28]),
        .O(\axi_rdata[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[29]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[29]_i_2_n_0 ),
        .I5(\axi_rdata[29]_i_3_n_0 ),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_2 
       (.I0(topview_line_num_r[29]),
        .I1(lsd_line_num_r[29]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[29]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[29]),
        .O(\axi_rdata[29]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[29]_i_3 
       (.I0(slv_reg2[29]),
        .I1(slv_reg0[29]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg1[29]),
        .O(\axi_rdata[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBABABABBAAAAAAAA)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata[2]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_4_n_0 ),
        .I2(\axi_rdata[2]_i_3_n_0 ),
        .I3(slv_reg2[1]),
        .I4(\axi_rdata[2]_i_4_n_0 ),
        .I5(\axi_rdata[2]_i_5_n_0 ),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[2]_i_10 
       (.I0(topview_line_start_h_r[2]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[2]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[2]_i_13_n_0 ),
        .O(\axi_rdata[2]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[2]_i_11 
       (.I0(lsd_line_end_h_f[2]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[2]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[2]),
        .O(\axi_rdata[2]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[2]_i_12 
       (.I0(lsd_line_start_v_r[2]),
        .I1(slv_reg2[2]),
        .I2(lsd_line_end_v_r[2]),
        .I3(slv_reg2[3]),
        .O(\axi_rdata[2]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[2]_i_13 
       (.I0(lsd_line_end_h_r[2]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[2]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[2]),
        .O(\axi_rdata[2]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[2]_i_2 
       (.I0(slv_reg0[2]),
        .I1(slv_reg2[2]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[2]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \axi_rdata[2]_i_3 
       (.I0(slv_reg2[1]),
        .I1(\axi_rdata[2]_i_6_n_0 ),
        .I2(topview_line_num_f[2]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[31]_i_4_n_0 ),
        .I5(slv_reg2[0]),
        .O(\axi_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0777)) 
    \axi_rdata[2]_i_4 
       (.I0(lsd_line_end_v_f[2]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_f[2]),
        .I3(slv_reg2[2]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[2]_i_7_n_0 ),
        .O(\axi_rdata[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[2]_i_5 
       (.I0(motor_speed_r[2]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[2]_i_8_n_0 ),
        .I3(\axi_rdata[2]_i_9_n_0 ),
        .I4(\axi_rdata[2]_i_10_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[2]_i_6 
       (.I0(topview_line_start_h_f[2]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[2]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[2]_i_11_n_0 ),
        .O(\axi_rdata[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF000F4F4F0004444)) 
    \axi_rdata[2]_i_7 
       (.I0(slv_reg2[3]),
        .I1(motor_speed_l[2]),
        .I2(slv_reg2[16]),
        .I3(topview_line_start_v_f[2]),
        .I4(slv_reg2[2]),
        .I5(topview_line_end_v_f[2]),
        .O(\axi_rdata[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[2]_i_8 
       (.I0(topview_line_start_v_r[2]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_r[2]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[2]_i_12_n_0 ),
        .O(\axi_rdata[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h1000FFFF)) 
    \axi_rdata[2]_i_9 
       (.I0(slv_reg2[2]),
        .I1(slv_reg2[3]),
        .I2(slv_reg2[16]),
        .I3(topview_line_num_r[2]),
        .I4(slv_reg2[0]),
        .O(\axi_rdata[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \axi_rdata[30]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[31]_i_5_n_0 ),
        .I4(\axi_rdata[30]_i_2_n_0 ),
        .I5(\axi_rdata[30]_i_3_n_0 ),
        .O(reg_data_out[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_2 
       (.I0(topview_line_num_r[30]),
        .I1(lsd_line_num_r[30]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[30]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[30]),
        .O(\axi_rdata[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[30]_i_3 
       (.I0(slv_reg0[30]),
        .I1(slv_reg2[30]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[30]),
        .O(\axi_rdata[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAABAAAAAAAAAA)) 
    \axi_rdata[31]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(\axi_rdata[31]_i_3_n_0 ),
        .I2(\axi_rdata[31]_i_4_n_0 ),
        .I3(slv_reg2[1]),
        .I4(\axi_rdata[31]_i_5_n_0 ),
        .I5(\axi_rdata[31]_i_6_n_0 ),
        .O(reg_data_out[31]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_rdata[31]_i_10 
       (.I0(slv_reg2[7]),
        .I1(slv_reg2[19]),
        .I2(slv_reg2[31]),
        .I3(slv_reg2[26]),
        .O(\axi_rdata[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_rdata[31]_i_11 
       (.I0(slv_reg2[9]),
        .I1(slv_reg2[6]),
        .I2(slv_reg2[28]),
        .I3(slv_reg2[20]),
        .O(\axi_rdata[31]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \axi_rdata[31]_i_12 
       (.I0(axi_araddr[2]),
        .I1(slv_reg2[14]),
        .I2(axi_araddr[3]),
        .I3(slv_reg2[5]),
        .O(\axi_rdata[31]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[31]_i_2 
       (.I0(slv_reg1[31]),
        .I1(slv_reg2[31]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg0[31]),
        .O(\axi_rdata[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \axi_rdata[31]_i_3 
       (.I0(\axi_rdata[31]_i_7_n_0 ),
        .I1(slv_reg2[29]),
        .I2(slv_reg2[11]),
        .I3(slv_reg2[30]),
        .I4(\axi_rdata[31]_i_8_n_0 ),
        .I5(\axi_rdata[31]_i_9_n_0 ),
        .O(\axi_rdata[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \axi_rdata[31]_i_4 
       (.I0(slv_reg2[3]),
        .I1(slv_reg2[2]),
        .O(\axi_rdata[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \axi_rdata[31]_i_5 
       (.I0(slv_reg2[18]),
        .I1(slv_reg2[17]),
        .O(\axi_rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_6 
       (.I0(topview_line_num_r[31]),
        .I1(lsd_line_num_r[31]),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_f[31]),
        .I4(slv_reg2[16]),
        .I5(lsd_line_num_f[31]),
        .O(\axi_rdata[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \axi_rdata[31]_i_7 
       (.I0(slv_reg2[24]),
        .I1(slv_reg2[27]),
        .I2(slv_reg2[22]),
        .I3(slv_reg2[25]),
        .I4(\axi_rdata[31]_i_10_n_0 ),
        .O(\axi_rdata[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \axi_rdata[31]_i_8 
       (.I0(slv_reg2[8]),
        .I1(slv_reg2[12]),
        .I2(slv_reg2[10]),
        .I3(slv_reg2[13]),
        .I4(\axi_rdata[31]_i_11_n_0 ),
        .O(\axi_rdata[31]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \axi_rdata[31]_i_9 
       (.I0(slv_reg2[21]),
        .I1(slv_reg2[4]),
        .I2(slv_reg2[23]),
        .I3(slv_reg2[15]),
        .I4(\axi_rdata[31]_i_12_n_0 ),
        .O(\axi_rdata[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hBABABABBAAAAAAAA)) 
    \axi_rdata[3]_i_1 
       (.I0(\axi_rdata[3]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_4_n_0 ),
        .I2(\axi_rdata[3]_i_3_n_0 ),
        .I3(slv_reg2[1]),
        .I4(\axi_rdata[3]_i_4_n_0 ),
        .I5(\axi_rdata[3]_i_5_n_0 ),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[3]_i_10 
       (.I0(topview_line_start_h_r[3]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[3]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[3]_i_13_n_0 ),
        .O(\axi_rdata[3]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[3]_i_11 
       (.I0(lsd_line_end_h_f[3]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[3]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[3]),
        .O(\axi_rdata[3]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[3]_i_12 
       (.I0(lsd_line_end_v_r[3]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_r[3]),
        .I3(slv_reg2[2]),
        .O(\axi_rdata[3]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[3]_i_13 
       (.I0(lsd_line_end_h_r[3]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[3]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[3]),
        .O(\axi_rdata[3]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[3]_i_2 
       (.I0(slv_reg0[3]),
        .I1(slv_reg2[3]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[3]),
        .O(\axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \axi_rdata[3]_i_3 
       (.I0(slv_reg2[1]),
        .I1(\axi_rdata[3]_i_6_n_0 ),
        .I2(topview_line_num_f[3]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[31]_i_4_n_0 ),
        .I5(slv_reg2[0]),
        .O(\axi_rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0777)) 
    \axi_rdata[3]_i_4 
       (.I0(lsd_line_end_v_f[3]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_f[3]),
        .I3(slv_reg2[2]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[3]_i_7_n_0 ),
        .O(\axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[3]_i_5 
       (.I0(motor_speed_r[3]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[3]_i_8_n_0 ),
        .I3(\axi_rdata[3]_i_9_n_0 ),
        .I4(\axi_rdata[3]_i_10_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[3]_i_6 
       (.I0(topview_line_start_h_f[3]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[3]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[3]_i_11_n_0 ),
        .O(\axi_rdata[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h8888A0FF8888A0A0)) 
    \axi_rdata[3]_i_7 
       (.I0(slv_reg2[16]),
        .I1(topview_line_start_v_f[3]),
        .I2(topview_line_end_v_f[3]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[2]),
        .I5(motor_speed_l[3]),
        .O(\axi_rdata[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[3]_i_8 
       (.I0(topview_line_start_v_r[3]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_r[3]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[3]_i_12_n_0 ),
        .O(\axi_rdata[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h1000FFFF)) 
    \axi_rdata[3]_i_9 
       (.I0(slv_reg2[2]),
        .I1(slv_reg2[3]),
        .I2(slv_reg2[16]),
        .I3(topview_line_num_r[3]),
        .I4(slv_reg2[0]),
        .O(\axi_rdata[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hBABABABBAAAAAAAA)) 
    \axi_rdata[4]_i_1 
       (.I0(\axi_rdata[4]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_4_n_0 ),
        .I2(\axi_rdata[4]_i_3_n_0 ),
        .I3(slv_reg2[1]),
        .I4(\axi_rdata[4]_i_4_n_0 ),
        .I5(\axi_rdata[4]_i_5_n_0 ),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[4]_i_10 
       (.I0(topview_line_start_h_f[4]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[4]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[4]_i_13_n_0 ),
        .O(\axi_rdata[4]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[4]_i_11 
       (.I0(lsd_line_end_h_r[4]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[4]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[4]),
        .O(\axi_rdata[4]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[4]_i_12 
       (.I0(lsd_line_start_v_f[4]),
        .I1(slv_reg2[2]),
        .I2(lsd_line_end_v_f[4]),
        .I3(slv_reg2[3]),
        .O(\axi_rdata[4]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[4]_i_13 
       (.I0(lsd_line_end_h_f[4]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[4]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[4]),
        .O(\axi_rdata[4]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[4]_i_2 
       (.I0(slv_reg2[4]),
        .I1(slv_reg1[4]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[4]),
        .O(\axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F8F8F8FFF8F8F8F)) 
    \axi_rdata[4]_i_3 
       (.I0(slv_reg2[1]),
        .I1(\axi_rdata[4]_i_6_n_0 ),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_r[4]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(\axi_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0777)) 
    \axi_rdata[4]_i_4 
       (.I0(lsd_line_end_v_r[4]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_r[4]),
        .I3(slv_reg2[2]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[4]_i_7_n_0 ),
        .O(\axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[4]_i_5 
       (.I0(motor_speed_l[4]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[4]_i_8_n_0 ),
        .I3(\axi_rdata[4]_i_9_n_0 ),
        .I4(\axi_rdata[4]_i_10_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[4]_i_6 
       (.I0(topview_line_start_h_r[4]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[4]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[4]_i_11_n_0 ),
        .O(\axi_rdata[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF000F4F4F0004444)) 
    \axi_rdata[4]_i_7 
       (.I0(slv_reg2[3]),
        .I1(motor_speed_r[4]),
        .I2(slv_reg2[16]),
        .I3(topview_line_start_v_r[4]),
        .I4(slv_reg2[2]),
        .I5(topview_line_end_v_r[4]),
        .O(\axi_rdata[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[4]_i_8 
       (.I0(topview_line_start_v_f[4]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_f[4]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[4]_i_12_n_0 ),
        .O(\axi_rdata[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \axi_rdata[4]_i_9 
       (.I0(slv_reg2[0]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[16]),
        .I4(topview_line_num_f[4]),
        .O(\axi_rdata[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF44450000)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata[8]_i_4_n_0 ),
        .I1(\axi_rdata[5]_i_2_n_0 ),
        .I2(slv_reg2[1]),
        .I3(\axi_rdata[5]_i_3_n_0 ),
        .I4(\axi_rdata[5]_i_4_n_0 ),
        .I5(\axi_rdata[5]_i_5_n_0 ),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[5]_i_10 
       (.I0(topview_line_start_h_f[5]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[5]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[5]_i_13_n_0 ),
        .O(\axi_rdata[5]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[5]_i_11 
       (.I0(lsd_line_end_h_r[5]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[5]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[5]),
        .O(\axi_rdata[5]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[5]_i_12 
       (.I0(lsd_line_start_v_f[5]),
        .I1(slv_reg2[2]),
        .I2(lsd_line_end_v_f[5]),
        .I3(slv_reg2[3]),
        .O(\axi_rdata[5]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[5]_i_13 
       (.I0(lsd_line_end_h_f[5]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[5]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[5]),
        .O(\axi_rdata[5]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h8F8F8F8FFF8F8F8F)) 
    \axi_rdata[5]_i_2 
       (.I0(slv_reg2[1]),
        .I1(\axi_rdata[5]_i_6_n_0 ),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_r[5]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(\axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0777)) 
    \axi_rdata[5]_i_3 
       (.I0(lsd_line_end_v_r[5]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_r[5]),
        .I3(slv_reg2[2]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[5]_i_7_n_0 ),
        .O(\axi_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[5]_i_4 
       (.I0(motor_speed_l[5]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[5]_i_8_n_0 ),
        .I3(\axi_rdata[5]_i_9_n_0 ),
        .I4(\axi_rdata[5]_i_10_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[5]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[5]_i_5 
       (.I0(slv_reg0[5]),
        .I1(slv_reg2[5]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[5]),
        .O(\axi_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[5]_i_6 
       (.I0(topview_line_start_h_r[5]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[5]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[5]_i_11_n_0 ),
        .O(\axi_rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF000F4F4F0004444)) 
    \axi_rdata[5]_i_7 
       (.I0(slv_reg2[3]),
        .I1(motor_speed_r[5]),
        .I2(slv_reg2[16]),
        .I3(topview_line_start_v_r[5]),
        .I4(slv_reg2[2]),
        .I5(topview_line_end_v_r[5]),
        .O(\axi_rdata[5]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[5]_i_8 
       (.I0(topview_line_start_v_f[5]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_f[5]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[5]_i_12_n_0 ),
        .O(\axi_rdata[5]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \axi_rdata[5]_i_9 
       (.I0(slv_reg2[0]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[16]),
        .I4(topview_line_num_f[5]),
        .O(\axi_rdata[5]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hABAA)) 
    \axi_rdata[6]_i_1 
       (.I0(\axi_rdata[6]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_4_n_0 ),
        .I2(\axi_rdata[6]_i_3_n_0 ),
        .I3(\axi_rdata[6]_i_4_n_0 ),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[6]_i_10 
       (.I0(topview_line_start_h_r[6]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[6]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[6]_i_14_n_0 ),
        .O(\axi_rdata[6]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[6]_i_11 
       (.I0(lsd_line_start_v_f[6]),
        .I1(slv_reg2[2]),
        .I2(lsd_line_end_v_f[6]),
        .I3(slv_reg2[3]),
        .O(\axi_rdata[6]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[6]_i_12 
       (.I0(lsd_line_end_h_f[6]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[6]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[6]),
        .O(\axi_rdata[6]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[6]_i_13 
       (.I0(lsd_line_end_v_r[6]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_r[6]),
        .I3(slv_reg2[2]),
        .O(\axi_rdata[6]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[6]_i_14 
       (.I0(lsd_line_end_h_r[6]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[6]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[6]),
        .O(\axi_rdata[6]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[6]_i_2 
       (.I0(slv_reg0[6]),
        .I1(slv_reg2[6]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[6]),
        .O(\axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000FF000D000D)) 
    \axi_rdata[6]_i_3 
       (.I0(motor_speed_l[6]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[6]_i_5_n_0 ),
        .I3(\axi_rdata[6]_i_6_n_0 ),
        .I4(\axi_rdata[6]_i_7_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[6]_i_4 
       (.I0(motor_speed_r[6]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[6]_i_8_n_0 ),
        .I3(\axi_rdata[6]_i_9_n_0 ),
        .I4(\axi_rdata[6]_i_10_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[6]_i_5 
       (.I0(topview_line_start_v_f[6]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_f[6]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[6]_i_11_n_0 ),
        .O(\axi_rdata[6]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \axi_rdata[6]_i_6 
       (.I0(slv_reg2[0]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[16]),
        .I4(topview_line_num_f[6]),
        .O(\axi_rdata[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[6]_i_7 
       (.I0(topview_line_start_h_f[6]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[6]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[6]_i_12_n_0 ),
        .O(\axi_rdata[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[6]_i_8 
       (.I0(topview_line_start_v_r[6]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_r[6]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[6]_i_13_n_0 ),
        .O(\axi_rdata[6]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h1000FFFF)) 
    \axi_rdata[6]_i_9 
       (.I0(slv_reg2[2]),
        .I1(slv_reg2[3]),
        .I2(slv_reg2[16]),
        .I3(topview_line_num_r[6]),
        .I4(slv_reg2[0]),
        .O(\axi_rdata[6]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hABAA)) 
    \axi_rdata[7]_i_1 
       (.I0(\axi_rdata[7]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_4_n_0 ),
        .I2(\axi_rdata[7]_i_3_n_0 ),
        .I3(\axi_rdata[7]_i_4_n_0 ),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[7]_i_10 
       (.I0(topview_line_start_h_f[7]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[7]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[7]_i_14_n_0 ),
        .O(\axi_rdata[7]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[7]_i_11 
       (.I0(lsd_line_start_v_r[7]),
        .I1(slv_reg2[2]),
        .I2(lsd_line_end_v_r[7]),
        .I3(slv_reg2[3]),
        .O(\axi_rdata[7]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[7]_i_12 
       (.I0(lsd_line_end_h_r[7]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[7]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[7]),
        .O(\axi_rdata[7]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[7]_i_13 
       (.I0(lsd_line_start_v_f[7]),
        .I1(slv_reg2[2]),
        .I2(lsd_line_end_v_f[7]),
        .I3(slv_reg2[3]),
        .O(\axi_rdata[7]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[7]_i_14 
       (.I0(lsd_line_end_h_f[7]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[7]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[7]),
        .O(\axi_rdata[7]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h0ACF0AC0)) 
    \axi_rdata[7]_i_2 
       (.I0(slv_reg2[7]),
        .I1(slv_reg1[7]),
        .I2(axi_araddr[2]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[7]),
        .O(\axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000FF000D000D)) 
    \axi_rdata[7]_i_3 
       (.I0(motor_speed_r[7]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[7]_i_5_n_0 ),
        .I3(\axi_rdata[7]_i_6_n_0 ),
        .I4(\axi_rdata[7]_i_7_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[7]_i_4 
       (.I0(motor_speed_l[7]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[7]_i_8_n_0 ),
        .I3(\axi_rdata[7]_i_9_n_0 ),
        .I4(\axi_rdata[7]_i_10_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[7]_i_5 
       (.I0(topview_line_start_v_r[7]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_r[7]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[7]_i_11_n_0 ),
        .O(\axi_rdata[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h1000FFFF)) 
    \axi_rdata[7]_i_6 
       (.I0(slv_reg2[2]),
        .I1(slv_reg2[3]),
        .I2(slv_reg2[16]),
        .I3(topview_line_num_r[7]),
        .I4(slv_reg2[0]),
        .O(\axi_rdata[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[7]_i_7 
       (.I0(topview_line_start_h_r[7]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[7]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[7]_i_12_n_0 ),
        .O(\axi_rdata[7]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[7]_i_8 
       (.I0(topview_line_start_v_f[7]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_f[7]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[7]_i_13_n_0 ),
        .O(\axi_rdata[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \axi_rdata[7]_i_9 
       (.I0(slv_reg2[0]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[16]),
        .I4(topview_line_num_f[7]),
        .O(\axi_rdata[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00AB0000)) 
    \axi_rdata[8]_i_1 
       (.I0(\axi_rdata[8]_i_2_n_0 ),
        .I1(slv_reg2[1]),
        .I2(\axi_rdata[8]_i_3_n_0 ),
        .I3(\axi_rdata[8]_i_4_n_0 ),
        .I4(\axi_rdata[8]_i_5_n_0 ),
        .I5(\axi_rdata[8]_i_6_n_0 ),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[8]_i_10 
       (.I0(topview_line_start_v_f[8]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_v_f[8]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[8]_i_15_n_0 ),
        .O(\axi_rdata[8]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \axi_rdata[8]_i_11 
       (.I0(slv_reg2[0]),
        .I1(slv_reg2[2]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[16]),
        .I4(topview_line_num_f[8]),
        .O(\axi_rdata[8]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[8]_i_12 
       (.I0(topview_line_start_h_f[8]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_f[8]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[8]_i_16_n_0 ),
        .O(\axi_rdata[8]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[8]_i_13 
       (.I0(lsd_line_end_h_r[8]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_r[8]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_r[8]),
        .O(\axi_rdata[8]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_rdata[8]_i_14 
       (.I0(slv_reg2[25]),
        .I1(slv_reg2[22]),
        .I2(slv_reg2[27]),
        .I3(slv_reg2[24]),
        .O(\axi_rdata[8]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \axi_rdata[8]_i_15 
       (.I0(lsd_line_end_v_f[8]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_f[8]),
        .I3(slv_reg2[2]),
        .O(\axi_rdata[8]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \axi_rdata[8]_i_16 
       (.I0(lsd_line_end_h_f[8]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_h_f[8]),
        .I3(slv_reg2[2]),
        .I4(lsd_line_num_f[8]),
        .O(\axi_rdata[8]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h8F8F8F8FFF8F8F8F)) 
    \axi_rdata[8]_i_2 
       (.I0(slv_reg2[1]),
        .I1(\axi_rdata[8]_i_7_n_0 ),
        .I2(slv_reg2[0]),
        .I3(topview_line_num_r[8]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(\axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0777)) 
    \axi_rdata[8]_i_3 
       (.I0(lsd_line_end_v_r[8]),
        .I1(slv_reg2[3]),
        .I2(lsd_line_start_v_r[8]),
        .I3(slv_reg2[2]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[8]_i_8_n_0 ),
        .O(\axi_rdata[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF8)) 
    \axi_rdata[8]_i_4 
       (.I0(\axi_rdata[15]_i_3_n_0 ),
        .I1(\axi_rdata[1]_i_4_n_0 ),
        .I2(\axi_rdata[8]_i_9_n_0 ),
        .I3(\axi_rdata[31]_i_8_n_0 ),
        .I4(\axi_rdata[31]_i_9_n_0 ),
        .O(\axi_rdata[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF2FFF2)) 
    \axi_rdata[8]_i_5 
       (.I0(motor_speed_l[8]),
        .I1(\axi_rdata[31]_i_4_n_0 ),
        .I2(\axi_rdata[8]_i_10_n_0 ),
        .I3(\axi_rdata[8]_i_11_n_0 ),
        .I4(\axi_rdata[8]_i_12_n_0 ),
        .I5(slv_reg2[1]),
        .O(\axi_rdata[8]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[8]_i_6 
       (.I0(slv_reg0[8]),
        .I1(slv_reg2[8]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[8]),
        .O(\axi_rdata[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \axi_rdata[8]_i_7 
       (.I0(topview_line_start_h_r[8]),
        .I1(slv_reg2[2]),
        .I2(topview_line_end_h_r[8]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[16]),
        .I5(\axi_rdata[8]_i_13_n_0 ),
        .O(\axi_rdata[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8888A0FF8888A0A0)) 
    \axi_rdata[8]_i_8 
       (.I0(slv_reg2[16]),
        .I1(topview_line_start_v_r[8]),
        .I2(topview_line_end_v_r[8]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[2]),
        .I5(motor_speed_r[8]),
        .O(\axi_rdata[8]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \axi_rdata[8]_i_9 
       (.I0(slv_reg2[30]),
        .I1(slv_reg2[11]),
        .I2(slv_reg2[29]),
        .I3(\axi_rdata[31]_i_10_n_0 ),
        .I4(\axi_rdata[8]_i_14_n_0 ),
        .O(\axi_rdata[8]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0700)) 
    \axi_rdata[9]_i_1 
       (.I0(\axi_rdata[15]_i_3_n_0 ),
        .I1(\axi_rdata[9]_i_2_n_0 ),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_rdata_reg[9]_i_3_n_0 ),
        .I4(\axi_rdata[9]_i_4_n_0 ),
        .O(reg_data_out[9]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \axi_rdata[9]_i_10 
       (.I0(topview_line_end_v_f[9]),
        .I1(slv_reg2[1]),
        .I2(topview_line_num_f[9]),
        .I3(slv_reg2[2]),
        .I4(topview_line_start_v_f[9]),
        .I5(slv_reg2[16]),
        .O(\axi_rdata[9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h1111100010001000)) 
    \axi_rdata[9]_i_11 
       (.I0(slv_reg2[1]),
        .I1(slv_reg2[16]),
        .I2(slv_reg2[2]),
        .I3(lsd_line_start_v_r[9]),
        .I4(slv_reg2[3]),
        .I5(lsd_line_end_v_r[9]),
        .O(\axi_rdata[9]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0C0C0A0A00F00)) 
    \axi_rdata[9]_i_12 
       (.I0(lsd_line_start_h_r[9]),
        .I1(lsd_line_end_h_r[9]),
        .I2(slv_reg2[1]),
        .I3(motor_speed_r[9]),
        .I4(slv_reg2[2]),
        .I5(slv_reg2[3]),
        .O(\axi_rdata[9]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \axi_rdata[9]_i_13 
       (.I0(topview_line_end_v_r[9]),
        .I1(slv_reg2[1]),
        .I2(topview_line_num_r[9]),
        .I3(slv_reg2[2]),
        .I4(topview_line_start_v_r[9]),
        .I5(slv_reg2[16]),
        .O(\axi_rdata[9]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFDDFFDDDFDDF)) 
    \axi_rdata[9]_i_2 
       (.I0(slv_reg2[17]),
        .I1(slv_reg2[18]),
        .I2(slv_reg2[2]),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[1]),
        .I5(slv_reg2[16]),
        .O(\axi_rdata[9]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \axi_rdata[9]_i_4 
       (.I0(slv_reg0[9]),
        .I1(slv_reg2[9]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg1[9]),
        .O(\axi_rdata[9]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    \axi_rdata[9]_i_5 
       (.I0(\axi_rdata[9]_i_7_n_0 ),
        .I1(lsd_line_num_f[9]),
        .I2(\axi_rdata[9]_i_8_n_0 ),
        .I3(\axi_rdata[9]_i_9_n_0 ),
        .I4(\axi_rdata[9]_i_10_n_0 ),
        .O(\axi_rdata[9]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    \axi_rdata[9]_i_6 
       (.I0(\axi_rdata[9]_i_7_n_0 ),
        .I1(lsd_line_num_r[9]),
        .I2(\axi_rdata[9]_i_11_n_0 ),
        .I3(\axi_rdata[9]_i_12_n_0 ),
        .I4(\axi_rdata[9]_i_13_n_0 ),
        .O(\axi_rdata[9]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFB)) 
    \axi_rdata[9]_i_7 
       (.I0(slv_reg2[16]),
        .I1(slv_reg2[1]),
        .I2(slv_reg2[3]),
        .I3(slv_reg2[2]),
        .O(\axi_rdata[9]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0A0A0C0C00F00)) 
    \axi_rdata[9]_i_8 
       (.I0(lsd_line_end_h_f[9]),
        .I1(lsd_line_start_h_f[9]),
        .I2(slv_reg2[1]),
        .I3(motor_speed_l[9]),
        .I4(slv_reg2[2]),
        .I5(slv_reg2[3]),
        .O(\axi_rdata[9]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h1111100010001000)) 
    \axi_rdata[9]_i_9 
       (.I0(slv_reg2[1]),
        .I1(slv_reg2[16]),
        .I2(slv_reg2[2]),
        .I3(lsd_line_start_v_f[9]),
        .I4(slv_reg2[3]),
        .I5(lsd_line_end_v_f[9]),
        .O(\axi_rdata[9]_i_9_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[10]_i_2 
       (.I0(\axi_rdata[10]_i_4_n_0 ),
        .I1(\axi_rdata[10]_i_5_n_0 ),
        .O(\axi_rdata_reg[10]_i_2_n_0 ),
        .S(slv_reg2[0]));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[11]_i_2 
       (.I0(\axi_rdata[11]_i_4_n_0 ),
        .I1(\axi_rdata[11]_i_5_n_0 ),
        .O(\axi_rdata_reg[11]_i_2_n_0 ),
        .S(slv_reg2[0]));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[12]_i_2 
       (.I0(\axi_rdata[12]_i_4_n_0 ),
        .I1(\axi_rdata[12]_i_5_n_0 ),
        .O(\axi_rdata_reg[12]_i_2_n_0 ),
        .S(slv_reg2[0]));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[13]_i_2 
       (.I0(\axi_rdata[13]_i_4_n_0 ),
        .I1(\axi_rdata[13]_i_5_n_0 ),
        .O(\axi_rdata_reg[13]_i_2_n_0 ),
        .S(slv_reg2[0]));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[14]_i_2 
       (.I0(\axi_rdata[14]_i_4_n_0 ),
        .I1(\axi_rdata[14]_i_5_n_0 ),
        .O(\axi_rdata_reg[14]_i_2_n_0 ),
        .S(slv_reg2[0]));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[15]_i_4 
       (.I0(\axi_rdata[15]_i_6_n_0 ),
        .I1(\axi_rdata[15]_i_7_n_0 ),
        .O(\axi_rdata_reg[15]_i_4_n_0 ),
        .S(slv_reg2[0]));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[9]_i_3 
       (.I0(\axi_rdata[9]_i_5_n_0 ),
        .I1(\axi_rdata[9]_i_6_n_0 ),
        .O(\axi_rdata_reg[9]_i_3_n_0 ),
        .S(slv_reg2[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_WREADY),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(axi_awready_i_1_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_accel_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\kl_accel_reg_reg[6]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_accel[6]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \kl_accel_reg_reg[6]_i_1 
       (.I0(\topview_line_addr_r_reg_reg[31]_i_3_n_0 ),
        .I1(\kl_accel_reg_reg[6]_i_2_n_0 ),
        .I2(slv_reg0[3]),
        .I3(slv_reg0[4]),
        .I4(\kl_accel_reg_reg[6]_i_3_n_0 ),
        .I5(\kl_accel_reg_reg[6]_i_4_n_0 ),
        .O(\kl_accel_reg_reg[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \kl_accel_reg_reg[6]_i_2 
       (.I0(slv_reg0[2]),
        .I1(slv_reg0[18]),
        .I2(slv_reg0[17]),
        .O(\kl_accel_reg_reg[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \kl_accel_reg_reg[6]_i_3 
       (.I0(\lsd_line_addr_f_reg_reg[31]_i_2_n_0 ),
        .I1(slv_reg0[0]),
        .I2(slv_reg0[16]),
        .O(\kl_accel_reg_reg[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \kl_accel_reg_reg[6]_i_4 
       (.I0(slv_reg0[1]),
        .I1(\led_reg_reg[3]_i_2_n_0 ),
        .O(\kl_accel_reg_reg[6]_i_4_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \kl_steer_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\kl_steer_reg_reg[7]_i_1_n_0 ),
        .GE(1'b1),
        .Q(kl_steer[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \kl_steer_reg_reg[7]_i_1 
       (.I0(\sccb_send_data_reg_reg[23]_i_2_n_0 ),
        .I1(slv_reg0[2]),
        .I2(slv_reg0[18]),
        .I3(slv_reg0[17]),
        .I4(\sccb_send_data_reg_reg[23]_i_3_n_0 ),
        .O(\kl_steer_reg_reg[7]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\led_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\led_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\led_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\led_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led[3]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \led_reg_reg[3]_i_1 
       (.I0(\led_reg_reg[3]_i_2_n_0 ),
        .I1(slv_reg0[17]),
        .I2(slv_reg0[16]),
        .I3(slv_reg0[18]),
        .I4(\led_reg_reg[3]_i_3_n_0 ),
        .I5(\led_reg_reg[3]_i_4_n_0 ),
        .O(\led_reg_reg[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \led_reg_reg[3]_i_2 
       (.I0(\led_reg_reg[3]_i_5_n_0 ),
        .I1(\led_reg_reg[3]_i_6_n_0 ),
        .I2(slv_reg0[23]),
        .I3(slv_reg0[25]),
        .I4(slv_reg0[22]),
        .O(\led_reg_reg[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \led_reg_reg[3]_i_3 
       (.I0(slv_reg0[9]),
        .I1(slv_reg0[10]),
        .I2(slv_reg0[11]),
        .I3(slv_reg0[12]),
        .I4(\led_reg_reg[3]_i_7_n_0 ),
        .O(\led_reg_reg[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \led_reg_reg[3]_i_4 
       (.I0(\topview_line_addr_r_reg_reg[31]_i_3_n_0 ),
        .I1(slv_reg0[1]),
        .I2(slv_reg0[2]),
        .I3(slv_reg0[3]),
        .I4(slv_reg0[4]),
        .O(\led_reg_reg[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \led_reg_reg[3]_i_5 
       (.I0(slv_reg0[30]),
        .I1(slv_reg0[26]),
        .I2(slv_reg0[21]),
        .I3(slv_reg0[29]),
        .I4(slv_reg0[20]),
        .I5(slv_reg0[24]),
        .O(\led_reg_reg[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_reg_reg[3]_i_6 
       (.I0(slv_reg0[28]),
        .I1(slv_reg0[27]),
        .I2(slv_reg0[31]),
        .I3(slv_reg0[19]),
        .O(\led_reg_reg[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_reg_reg[3]_i_7 
       (.I0(slv_reg0[14]),
        .I1(slv_reg0[13]),
        .I2(slv_reg0[0]),
        .I3(slv_reg0[15]),
        .O(\led_reg_reg[3]_i_7_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[19] 
       (.CLR(1'b0),
        .D(slv_reg1[19]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[20] 
       (.CLR(1'b0),
        .D(slv_reg1[20]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[21] 
       (.CLR(1'b0),
        .D(slv_reg1[21]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[22] 
       (.CLR(1'b0),
        .D(slv_reg1[22]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[23] 
       (.CLR(1'b0),
        .D(slv_reg1[23]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[24] 
       (.CLR(1'b0),
        .D(slv_reg1[24]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[25] 
       (.CLR(1'b0),
        .D(slv_reg1[25]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[26] 
       (.CLR(1'b0),
        .D(slv_reg1[26]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[27] 
       (.CLR(1'b0),
        .D(slv_reg1[27]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[28] 
       (.CLR(1'b0),
        .D(slv_reg1[28]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[29] 
       (.CLR(1'b0),
        .D(slv_reg1[29]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[30] 
       (.CLR(1'b0),
        .D(slv_reg1[30]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[31] 
       (.CLR(1'b0),
        .D(slv_reg1[31]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[31]));
  LUT5 #(
    .INIT(32'h00000008)) 
    \lsd_line_addr_f_reg_reg[31]_i_1 
       (.I0(\led_reg_reg[3]_i_2_n_0 ),
        .I1(\lsd_line_addr_f_reg_reg[31]_i_2_n_0 ),
        .I2(slv_reg0[16]),
        .I3(\lsd_line_addr_f_reg_reg[31]_i_3_n_0 ),
        .I4(slv_reg0[0]),
        .O(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \lsd_line_addr_f_reg_reg[31]_i_2 
       (.I0(slv_reg0[13]),
        .I1(slv_reg0[14]),
        .I2(slv_reg0[9]),
        .I3(slv_reg0[10]),
        .I4(\lsd_line_addr_f_reg_reg[31]_i_4_n_0 ),
        .I5(slv_reg0[15]),
        .O(\lsd_line_addr_f_reg_reg[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \lsd_line_addr_f_reg_reg[31]_i_3 
       (.I0(\lsd_line_addr_f_reg_reg[31]_i_5_n_0 ),
        .I1(slv_reg0[4]),
        .I2(slv_reg0[3]),
        .I3(slv_reg0[2]),
        .I4(slv_reg0[1]),
        .I5(slv_reg0[18]),
        .O(\lsd_line_addr_f_reg_reg[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \lsd_line_addr_f_reg_reg[31]_i_4 
       (.I0(slv_reg0[11]),
        .I1(slv_reg0[12]),
        .O(\lsd_line_addr_f_reg_reg[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \lsd_line_addr_f_reg_reg[31]_i_5 
       (.I0(slv_reg0[6]),
        .I1(slv_reg0[7]),
        .I2(slv_reg0[5]),
        .I3(slv_reg0[8]),
        .I4(slv_reg0[17]),
        .O(\lsd_line_addr_f_reg_reg[31]_i_5_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_f_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\lsd_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_f[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[19] 
       (.CLR(1'b0),
        .D(slv_reg1[19]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[20] 
       (.CLR(1'b0),
        .D(slv_reg1[20]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[21] 
       (.CLR(1'b0),
        .D(slv_reg1[21]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[22] 
       (.CLR(1'b0),
        .D(slv_reg1[22]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[23] 
       (.CLR(1'b0),
        .D(slv_reg1[23]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[24] 
       (.CLR(1'b0),
        .D(slv_reg1[24]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[25] 
       (.CLR(1'b0),
        .D(slv_reg1[25]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[26] 
       (.CLR(1'b0),
        .D(slv_reg1[26]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[27] 
       (.CLR(1'b0),
        .D(slv_reg1[27]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[28] 
       (.CLR(1'b0),
        .D(slv_reg1[28]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[29] 
       (.CLR(1'b0),
        .D(slv_reg1[29]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[30] 
       (.CLR(1'b0),
        .D(slv_reg1[30]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[31] 
       (.CLR(1'b0),
        .D(slv_reg1[31]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[31]));
  LUT5 #(
    .INIT(32'h00000800)) 
    \lsd_line_addr_r_reg_reg[31]_i_1 
       (.I0(\led_reg_reg[3]_i_2_n_0 ),
        .I1(\lsd_line_addr_f_reg_reg[31]_i_2_n_0 ),
        .I2(slv_reg0[16]),
        .I3(slv_reg0[0]),
        .I4(\lsd_line_addr_f_reg_reg[31]_i_3_n_0 ),
        .O(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \lsd_line_addr_r_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\lsd_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(lsd_line_addr_r[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    sccb_req_reg_reg
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(sccb_req_reg_reg_i_1_n_0),
        .GE(1'b1),
        .Q(sccb_req));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    sccb_req_reg_reg_i_1
       (.I0(sccb_req_reg_reg_i_2_n_0),
        .I1(slv_reg0[18]),
        .I2(slv_reg0[17]),
        .I3(\led_reg_reg[3]_i_4_n_0 ),
        .O(sccb_req_reg_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    sccb_req_reg_reg_i_2
       (.I0(\led_reg_reg[3]_i_2_n_0 ),
        .I1(slv_reg0[16]),
        .I2(slv_reg0[0]),
        .I3(\lsd_line_addr_f_reg_reg[31]_i_2_n_0 ),
        .O(sccb_req_reg_reg_i_2_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[19] 
       (.CLR(1'b0),
        .D(slv_reg1[19]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[20] 
       (.CLR(1'b0),
        .D(slv_reg1[20]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[21] 
       (.CLR(1'b0),
        .D(slv_reg1[21]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[22] 
       (.CLR(1'b0),
        .D(slv_reg1[22]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[23] 
       (.CLR(1'b0),
        .D(slv_reg1[23]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[23]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \sccb_send_data_reg_reg[23]_i_1 
       (.I0(\sccb_send_data_reg_reg[23]_i_2_n_0 ),
        .I1(slv_reg0[2]),
        .I2(slv_reg0[17]),
        .I3(slv_reg0[18]),
        .I4(\sccb_send_data_reg_reg[23]_i_3_n_0 ),
        .O(\sccb_send_data_reg_reg[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \sccb_send_data_reg_reg[23]_i_2 
       (.I0(\lsd_line_addr_f_reg_reg[31]_i_2_n_0 ),
        .I1(\led_reg_reg[3]_i_2_n_0 ),
        .I2(slv_reg0[1]),
        .O(\sccb_send_data_reg_reg[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFFBF)) 
    \sccb_send_data_reg_reg[23]_i_3 
       (.I0(\topview_line_addr_r_reg_reg[31]_i_3_n_0 ),
        .I1(slv_reg0[0]),
        .I2(slv_reg0[16]),
        .I3(slv_reg0[3]),
        .I4(slv_reg0[4]),
        .O(\sccb_send_data_reg_reg[23]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_send_data_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\sccb_send_data_reg_reg[23]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_send_data[9]));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[31]_i_2 
       (.I0(S_AXI_WREADY),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(p_1_in[8]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(p_1_in[19]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(p_1_in[24]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(p_1_in[0]));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[19]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[24]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[19] 
       (.CLR(1'b0),
        .D(slv_reg1[19]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[20] 
       (.CLR(1'b0),
        .D(slv_reg1[20]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[21] 
       (.CLR(1'b0),
        .D(slv_reg1[21]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[22] 
       (.CLR(1'b0),
        .D(slv_reg1[22]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[23] 
       (.CLR(1'b0),
        .D(slv_reg1[23]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[24] 
       (.CLR(1'b0),
        .D(slv_reg1[24]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[25] 
       (.CLR(1'b0),
        .D(slv_reg1[25]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[26] 
       (.CLR(1'b0),
        .D(slv_reg1[26]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[27] 
       (.CLR(1'b0),
        .D(slv_reg1[27]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[28] 
       (.CLR(1'b0),
        .D(slv_reg1[28]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[29] 
       (.CLR(1'b0),
        .D(slv_reg1[29]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[30] 
       (.CLR(1'b0),
        .D(slv_reg1[30]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[31] 
       (.CLR(1'b0),
        .D(slv_reg1[31]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[31]));
  LUT2 #(
    .INIT(4'h2)) 
    \topview_line_addr_f_reg_reg[31]_i_1 
       (.I0(sccb_req_reg_reg_i_2_n_0),
        .I1(\lsd_line_addr_f_reg_reg[31]_i_3_n_0 ),
        .O(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_f_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\topview_line_addr_f_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_f[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[19] 
       (.CLR(1'b0),
        .D(slv_reg1[19]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[20] 
       (.CLR(1'b0),
        .D(slv_reg1[20]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[21] 
       (.CLR(1'b0),
        .D(slv_reg1[21]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[22] 
       (.CLR(1'b0),
        .D(slv_reg1[22]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[23] 
       (.CLR(1'b0),
        .D(slv_reg1[23]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[24] 
       (.CLR(1'b0),
        .D(slv_reg1[24]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[25] 
       (.CLR(1'b0),
        .D(slv_reg1[25]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[26] 
       (.CLR(1'b0),
        .D(slv_reg1[26]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[27] 
       (.CLR(1'b0),
        .D(slv_reg1[27]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[28] 
       (.CLR(1'b0),
        .D(slv_reg1[28]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[29] 
       (.CLR(1'b0),
        .D(slv_reg1[29]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[30] 
       (.CLR(1'b0),
        .D(slv_reg1[30]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[31] 
       (.CLR(1'b0),
        .D(slv_reg1[31]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[31]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \topview_line_addr_r_reg_reg[31]_i_1 
       (.I0(\sccb_send_data_reg_reg[23]_i_2_n_0 ),
        .I1(slv_reg0[18]),
        .I2(slv_reg0[2]),
        .I3(\topview_line_addr_r_reg_reg[31]_i_2_n_0 ),
        .I4(\topview_line_addr_r_reg_reg[31]_i_3_n_0 ),
        .I5(slv_reg0[17]),
        .O(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hEFFF)) 
    \topview_line_addr_r_reg_reg[31]_i_2 
       (.I0(slv_reg0[4]),
        .I1(slv_reg0[3]),
        .I2(slv_reg0[16]),
        .I3(slv_reg0[0]),
        .O(\topview_line_addr_r_reg_reg[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \topview_line_addr_r_reg_reg[31]_i_3 
       (.I0(slv_reg0[8]),
        .I1(slv_reg0[5]),
        .I2(slv_reg0[7]),
        .I3(slv_reg0[6]),
        .O(\topview_line_addr_r_reg_reg[31]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \topview_line_addr_r_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\topview_line_addr_r_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(topview_line_addr_r[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
