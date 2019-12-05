// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Fri Nov 29 17:59:14 2019
// Host        : flamingo running 64-bit CentOS release 6.10 (Final)
// Command     : write_verilog -force -mode synth_stub
//               /home/users/matsuda/project/Autonomous_Vehicle_Driving/project/project_1/project_1.srcs/sources_1/bd/pspl_comm/ip/pspl_comm_pspl_comm_0_5/pspl_comm_pspl_comm_0_5_stub.v
// Design      : pspl_comm_pspl_comm_0_5
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pspl_comm_v1_0,Vivado 2018.3" *)
module pspl_comm_pspl_comm_0_5(sw, led, sccb_busy, sccb_req, sccb_send_data, 
  lsd_ready_f, lsd_ready_r, lsd_line_num_f, lsd_line_num_r, lsd_line_start_v_f, 
  lsd_line_start_v_r, lsd_line_start_h_f, lsd_line_start_h_r, lsd_line_end_v_f, 
  lsd_line_end_v_r, lsd_line_end_h_f, lsd_line_end_h_r, lsd_line_addr_f, lsd_line_addr_r, 
  lsd_write_protect_f, lsd_write_protect_r, lsd_grad_thres_f, lsd_grad_thres_r, 
  topview_ready_f, topview_ready_r, topview_line_num_f, topview_line_num_r, 
  topview_line_start_v_f, topview_line_start_v_r, topview_line_start_h_f, 
  topview_line_start_h_r, topview_line_end_v_f, topview_line_end_v_r, 
  topview_line_end_h_f, topview_line_end_h_r, topview_line_valid_f, topview_line_valid_r, 
  topview_line_addr_f, topview_line_addr_r, topview_write_protect_f, 
  topview_write_protect_r, motor_speed_l, motor_speed_r, kl_accel, kl_steer, s00_axi_awaddr, 
  s00_axi_awprot, s00_axi_awvalid, s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, 
  s00_axi_wvalid, s00_axi_wready, s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, 
  s00_axi_araddr, s00_axi_arprot, s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, 
  s00_axi_rresp, s00_axi_rvalid, s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="sw[1:0],led[3:0],sccb_busy,sccb_req,sccb_send_data[23:0],lsd_ready_f,lsd_ready_r,lsd_line_num_f[31:0],lsd_line_num_r[31:0],lsd_line_start_v_f[31:0],lsd_line_start_v_r[31:0],lsd_line_start_h_f[31:0],lsd_line_start_h_r[31:0],lsd_line_end_v_f[31:0],lsd_line_end_v_r[31:0],lsd_line_end_h_f[31:0],lsd_line_end_h_r[31:0],lsd_line_addr_f[31:0],lsd_line_addr_r[31:0],lsd_write_protect_f,lsd_write_protect_r,lsd_grad_thres_f[16:0],lsd_grad_thres_r[16:0],topview_ready_f,topview_ready_r,topview_line_num_f[31:0],topview_line_num_r[31:0],topview_line_start_v_f[31:0],topview_line_start_v_r[31:0],topview_line_start_h_f[31:0],topview_line_start_h_r[31:0],topview_line_end_v_f[31:0],topview_line_end_v_r[31:0],topview_line_end_h_f[31:0],topview_line_end_h_r[31:0],topview_line_valid_f,topview_line_valid_r,topview_line_addr_f[31:0],topview_line_addr_r[31:0],topview_write_protect_f,topview_write_protect_r,motor_speed_l[15:0],motor_speed_r[15:0],kl_accel[6:0],kl_steer[7:0],s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
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
  output lsd_write_protect_f;
  output lsd_write_protect_r;
  output [16:0]lsd_grad_thres_f;
  output [16:0]lsd_grad_thres_r;
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
  output topview_write_protect_f;
  output topview_write_protect_r;
  input [15:0]motor_speed_l;
  input [15:0]motor_speed_r;
  output [6:0]kl_accel;
  output [7:0]kl_steer;
  input [3:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [3:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axi_aclk;
  input s00_axi_aresetn;
endmodule
