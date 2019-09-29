// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Sep 30 01:06:46 2019
// Host        : flamingo running 64-bit CentOS release 6.10 (Final)
// Command     : write_verilog -force -mode synth_stub
//               /home/users/saikai/Project/Autonomous_Vehicle_Driving/systems/proj/proj.srcs/sources_1/bd/design_1/ip/design_1_myip_0_0/design_1_myip_0_0_stub.v
// Design      : design_1_myip_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "myip_v1_0,Vivado 2018.3" *)
module design_1_myip_0_0(sw, r_data, w_busy, sccb_rdata, sccb_busy, led_out, 
  pulse1, pulse2, w_req, r_addr, camsel, sccb_wdata, sccb_req, sccb_wr, s00_axi_awaddr, 
  s00_axi_awprot, s00_axi_awvalid, s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, 
  s00_axi_wvalid, s00_axi_wready, s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, 
  s00_axi_araddr, s00_axi_arprot, s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, 
  s00_axi_rresp, s00_axi_rvalid, s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="sw[1:0],r_data[7:0],w_busy,sccb_rdata[7:0],sccb_busy,led_out[3:0],pulse1,pulse2,w_req,r_addr[18:0],camsel,sccb_wdata[31:0],sccb_req,sccb_wr,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  input [1:0]sw;
  input [7:0]r_data;
  input w_busy;
  input [7:0]sccb_rdata;
  input sccb_busy;
  output [3:0]led_out;
  output pulse1;
  output pulse2;
  output w_req;
  output [18:0]r_addr;
  output camsel;
  output [31:0]sccb_wdata;
  output sccb_req;
  output sccb_wr;
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
