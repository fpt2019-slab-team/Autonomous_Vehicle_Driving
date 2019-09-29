// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Sep 30 00:58:20 2019
// Host        : flamingo running 64-bit CentOS release 6.10 (Final)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ myip_0_sim_netlist.v
// Design      : myip_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_astray
   (pulse1,
    pulse2,
    Q,
    pulse1_0,
    s00_axi_aclk);
  output pulse1;
  output pulse2;
  input [12:0]Q;
  input [12:0]pulse1_0;
  input s00_axi_aclk;

  wire [12:0]Q;
  wire pulse1;
  wire [12:0]pulse1_0;
  wire pulse2;
  wire s00_axi_aclk;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pwmc mp
       (.Q(Q),
        .pulse1(pulse1),
        .pulse1_0(pulse1_0),
        .pulse2(pulse2),
        .s00_axi_aclk(s00_axi_aclk));
endmodule

(* CHECK_LICENSE_TYPE = "myip_0,myip_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "myip_v1_0,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (sw,
    r_data,
    w_busy,
    sccb_rdata,
    sccb_busy,
    led_out,
    pulse1,
    pulse2,
    w_req,
    r_addr,
    camsel,
    sccb_wdata,
    sccb_req,
    sccb_wr,
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire camsel;
  wire [3:0]led_out;
  wire pulse1;
  wire pulse2;
  wire [18:0]r_addr;
  wire [7:0]r_data;
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
  wire [7:0]sccb_rdata;
  wire sccb_req;
  wire [31:0]sccb_wdata;
  wire sccb_wr;
  wire [1:0]sw;
  wire w_busy;
  wire w_req;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .camsel(camsel),
        .led_out(led_out),
        .pulse1(pulse1),
        .pulse2(pulse2),
        .r_addr(r_addr),
        .r_data(r_data),
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
        .sccb_rdata(sccb_rdata),
        .sccb_req(sccb_req),
        .sccb_wdata(sccb_wdata),
        .sccb_wr(sccb_wr),
        .sw(sw),
        .w_busy(w_busy),
        .w_req(w_req));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_v1_0
   (led_out,
    w_req,
    r_addr,
    camsel,
    sccb_req,
    sccb_wr,
    sccb_wdata,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    pulse1,
    pulse2,
    s00_axi_bvalid,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    sccb_busy,
    sw,
    r_data,
    sccb_rdata,
    w_busy,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [3:0]led_out;
  output w_req;
  output [18:0]r_addr;
  output camsel;
  output sccb_req;
  output sccb_wr;
  output [31:0]sccb_wdata;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output pulse1;
  output pulse2;
  output s00_axi_bvalid;
  input [31:0]s00_axi_wdata;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input sccb_busy;
  input [1:0]sw;
  input [7:0]r_data;
  input [7:0]sccb_rdata;
  input w_busy;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire camsel;
  wire [3:0]led_out;
  wire pulse1;
  wire pulse2;
  wire [18:0]r_addr;
  wire [7:0]r_data;
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
  wire [7:0]sccb_rdata;
  wire sccb_req;
  wire [31:0]sccb_wdata;
  wire sccb_wr;
  wire [1:0]sw;
  wire w_busy;
  wire w_req;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_v1_0_S00_AXI myip_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .camsel(camsel),
        .led_out(led_out),
        .pulse1(pulse1),
        .pulse2(pulse2),
        .r_addr(r_addr),
        .r_data(r_data),
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
        .sccb_rdata(sccb_rdata),
        .sccb_req(sccb_req),
        .sccb_wdata(sccb_wdata),
        .sccb_wr(sccb_wr),
        .sw(sw),
        .w_busy(w_busy),
        .w_req(w_req));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_v1_0_S00_AXI
   (led_out,
    w_req,
    r_addr,
    camsel,
    sccb_req,
    sccb_wr,
    sccb_wdata,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    pulse1,
    pulse2,
    s00_axi_bvalid,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    sccb_busy,
    sw,
    r_data,
    sccb_rdata,
    w_busy,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [3:0]led_out;
  output w_req;
  output [18:0]r_addr;
  output camsel;
  output sccb_req;
  output sccb_wr;
  output [31:0]sccb_wdata;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output pulse1;
  output pulse2;
  output s00_axi_bvalid;
  input [31:0]s00_axi_wdata;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input sccb_busy;
  input [1:0]sw;
  input [7:0]r_data;
  input [7:0]sccb_rdata;
  input w_busy;
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
  wire [3:2]axi_awaddr;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire \axi_rdata[0]_i_4_n_0 ;
  wire \axi_rdata[0]_i_5_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[1]_i_4_n_0 ;
  wire \axi_rdata[1]_i_5_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[2]_i_3_n_0 ;
  wire \axi_rdata[2]_i_4_n_0 ;
  wire \axi_rdata[3]_i_2_n_0 ;
  wire \axi_rdata[3]_i_3_n_0 ;
  wire \axi_rdata[3]_i_4_n_0 ;
  wire \axi_rdata[4]_i_2_n_0 ;
  wire \axi_rdata[4]_i_3_n_0 ;
  wire \axi_rdata[4]_i_4_n_0 ;
  wire \axi_rdata[5]_i_2_n_0 ;
  wire \axi_rdata[5]_i_3_n_0 ;
  wire \axi_rdata[5]_i_4_n_0 ;
  wire \axi_rdata[6]_i_2_n_0 ;
  wire \axi_rdata[6]_i_3_n_0 ;
  wire \axi_rdata[6]_i_4_n_0 ;
  wire \axi_rdata[7]_i_10_n_0 ;
  wire \axi_rdata[7]_i_11_n_0 ;
  wire \axi_rdata[7]_i_2_n_0 ;
  wire \axi_rdata[7]_i_3_n_0 ;
  wire \axi_rdata[7]_i_4_n_0 ;
  wire \axi_rdata[7]_i_5_n_0 ;
  wire \axi_rdata[7]_i_6_n_0 ;
  wire \axi_rdata[7]_i_7_n_0 ;
  wire \axi_rdata[7]_i_8_n_0 ;
  wire \axi_rdata[7]_i_9_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire camsel;
  wire camsel_reg_reg_i_1_n_0;
  wire [3:0]led_out;
  wire \led_out_reg_reg[3]_i_1_n_0 ;
  wire \led_out_reg_reg[3]_i_2_n_0 ;
  wire \led_out_reg_reg[3]_i_3_n_0 ;
  wire \led_out_reg_reg[3]_i_4_n_0 ;
  wire \led_out_reg_reg[3]_i_5_n_0 ;
  wire \led_out_reg_reg[3]_i_6_n_0 ;
  wire \led_out_reg_reg[3]_i_7_n_0 ;
  wire \led_out_reg_reg[3]_i_8_n_0 ;
  wire \led_out_reg_reg[3]_i_9_n_0 ;
  wire [31:7]p_1_in;
  wire pulse1;
  wire pulse2;
  wire [12:0]pwmv1_reg;
  wire \pwmv1_reg_reg[12]_i_1_n_0 ;
  wire [12:0]pwmv2_reg;
  wire \pwmv2_reg_reg[12]_i_1_n_0 ;
  wire [18:0]r_addr;
  wire \r_addr_reg_reg[18]_i_1_n_0 ;
  wire [7:0]r_data;
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
  wire [7:0]sccb_rdata;
  wire sccb_req;
  wire sccb_req_reg_reg_i_1_n_0;
  wire [31:0]sccb_wdata;
  wire \sccb_wdata_reg_reg[31]_i_1_n_0 ;
  wire \sccb_wdata_reg_reg[31]_i_2_n_0 ;
  wire sccb_wr;
  wire sccb_wr_reg_reg_i_1_n_0;
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
  wire w_busy;
  wire w_req;
  wire w_req_reg_reg_i_1_n_0;
  wire w_req_reg_reg_i_2_n_0;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_astray astray_inst1
       (.Q(pwmv2_reg),
        .pulse1(pulse1),
        .pulse1_0(pwmv1_reg),
        .pulse2(pulse2),
        .s00_axi_aclk(s00_axi_aclk));
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
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
        .I5(axi_awaddr[2]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(axi_awaddr[3]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(axi_awaddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(axi_awaddr[3]),
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
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(\axi_rdata[0]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[0]_i_4_n_0 ),
        .O(reg_data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[0]_i_2 
       (.I0(slv_reg1[0]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFCFFF5F5F5F5F)) 
    \axi_rdata[0]_i_3 
       (.I0(\axi_rdata[0]_i_5_n_0 ),
        .I1(slv_reg2[1]),
        .I2(axi_araddr[3]),
        .I3(sccb_busy),
        .I4(slv_reg2[0]),
        .I5(slv_reg2[2]),
        .O(\axi_rdata[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[0]_i_4 
       (.I0(slv_reg2[0]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[0]),
        .O(\axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_5 
       (.I0(sccb_rdata[0]),
        .I1(w_busy),
        .I2(slv_reg2[1]),
        .I3(r_data[0]),
        .I4(slv_reg2[0]),
        .I5(sw[0]),
        .O(\axi_rdata[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg1[10]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[10]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[10]),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg1[11]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[11]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[11]),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg1[12]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[12]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[12]),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg1[13]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[13]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[13]),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg1[14]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[14]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[14]),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg1[15]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[15]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[15]),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg1[16]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[16]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[16]),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg1[17]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[17]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[17]),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg1[18]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[18]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[18]),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg1[19]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[19]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata[1]_i_2_n_0 ),
        .I1(\axi_rdata[1]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[1]_i_4_n_0 ),
        .O(reg_data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[1]_i_2 
       (.I0(slv_reg1[1]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFAFABFBFFFFABFB)) 
    \axi_rdata[1]_i_3 
       (.I0(\axi_rdata[1]_i_5_n_0 ),
        .I1(sw[1]),
        .I2(slv_reg2[0]),
        .I3(r_data[1]),
        .I4(slv_reg2[1]),
        .I5(sccb_rdata[1]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[1]_i_4 
       (.I0(slv_reg2[1]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[1]),
        .O(\axi_rdata[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \axi_rdata[1]_i_5 
       (.I0(slv_reg2[2]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg1[20]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[20]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[20]),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg1[21]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[21]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[21]),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg1[22]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[22]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[22]),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg1[23]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[23]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[23]),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg1[24]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[24]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[24]),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg1[25]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[25]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[25]),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg1[26]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[26]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[26]),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg1[27]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[27]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[27]),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg1[28]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[28]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[28]),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg1[29]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[29]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata[2]_i_2_n_0 ),
        .I1(\axi_rdata[2]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[2]_i_4_n_0 ),
        .O(reg_data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[2]_i_2 
       (.I0(slv_reg1[2]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFDFFFFFFFDFFF)) 
    \axi_rdata[2]_i_3 
       (.I0(axi_araddr[3]),
        .I1(slv_reg2[2]),
        .I2(r_data[2]),
        .I3(slv_reg2[0]),
        .I4(slv_reg2[1]),
        .I5(sccb_rdata[2]),
        .O(\axi_rdata[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[2]_i_4 
       (.I0(slv_reg2[2]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[2]),
        .O(\axi_rdata[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg1[30]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[30]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[30]),
        .O(reg_data_out[30]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg1[31]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[31]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[3]_i_1 
       (.I0(\axi_rdata[3]_i_2_n_0 ),
        .I1(\axi_rdata[3]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[3]_i_4_n_0 ),
        .O(reg_data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[3]_i_2 
       (.I0(slv_reg1[3]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFDFFFFFFFDFFF)) 
    \axi_rdata[3]_i_3 
       (.I0(axi_araddr[3]),
        .I1(slv_reg2[2]),
        .I2(r_data[3]),
        .I3(slv_reg2[0]),
        .I4(slv_reg2[1]),
        .I5(sccb_rdata[3]),
        .O(\axi_rdata[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[3]_i_4 
       (.I0(slv_reg2[3]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[3]),
        .O(\axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[4]_i_1 
       (.I0(\axi_rdata[4]_i_2_n_0 ),
        .I1(\axi_rdata[4]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[4]_i_4_n_0 ),
        .O(reg_data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[4]_i_2 
       (.I0(slv_reg1[4]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFDFFFFFFFDFFF)) 
    \axi_rdata[4]_i_3 
       (.I0(axi_araddr[3]),
        .I1(slv_reg2[2]),
        .I2(r_data[4]),
        .I3(slv_reg2[0]),
        .I4(slv_reg2[1]),
        .I5(sccb_rdata[4]),
        .O(\axi_rdata[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[4]_i_4 
       (.I0(slv_reg2[4]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[4]),
        .O(\axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(\axi_rdata[5]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[5]_i_4_n_0 ),
        .O(reg_data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[5]_i_2 
       (.I0(slv_reg1[5]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFDFFFFFFFDFFF)) 
    \axi_rdata[5]_i_3 
       (.I0(axi_araddr[3]),
        .I1(slv_reg2[2]),
        .I2(r_data[5]),
        .I3(slv_reg2[0]),
        .I4(slv_reg2[1]),
        .I5(sccb_rdata[5]),
        .O(\axi_rdata[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[5]_i_4 
       (.I0(slv_reg2[5]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[5]),
        .O(\axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[6]_i_1 
       (.I0(\axi_rdata[6]_i_2_n_0 ),
        .I1(\axi_rdata[6]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[6]_i_4_n_0 ),
        .O(reg_data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[6]_i_2 
       (.I0(slv_reg1[6]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFDFFFFFFFDFFF)) 
    \axi_rdata[6]_i_3 
       (.I0(axi_araddr[3]),
        .I1(slv_reg2[2]),
        .I2(r_data[6]),
        .I3(slv_reg2[0]),
        .I4(slv_reg2[1]),
        .I5(sccb_rdata[6]),
        .O(\axi_rdata[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[6]_i_4 
       (.I0(slv_reg2[6]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[6]),
        .O(\axi_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAABAFFFFAABA0000)) 
    \axi_rdata[7]_i_1 
       (.I0(\axi_rdata[7]_i_2_n_0 ),
        .I1(\axi_rdata[7]_i_3_n_0 ),
        .I2(\axi_rdata[7]_i_4_n_0 ),
        .I3(\axi_rdata[7]_i_5_n_0 ),
        .I4(axi_araddr[2]),
        .I5(\axi_rdata[7]_i_6_n_0 ),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \axi_rdata[7]_i_10 
       (.I0(slv_reg2[31]),
        .I1(slv_reg2[25]),
        .I2(slv_reg2[12]),
        .I3(slv_reg2[28]),
        .I4(slv_reg2[14]),
        .I5(slv_reg2[15]),
        .O(\axi_rdata[7]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_rdata[7]_i_11 
       (.I0(slv_reg2[8]),
        .I1(slv_reg2[5]),
        .I2(slv_reg2[30]),
        .I3(slv_reg2[6]),
        .O(\axi_rdata[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \axi_rdata[7]_i_2 
       (.I0(slv_reg1[7]),
        .I1(axi_araddr[3]),
        .O(\axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF37F7FFFF)) 
    \axi_rdata[7]_i_3 
       (.I0(r_data[7]),
        .I1(slv_reg2[0]),
        .I2(slv_reg2[1]),
        .I3(sccb_rdata[7]),
        .I4(axi_araddr[3]),
        .I5(slv_reg2[2]),
        .O(\axi_rdata[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \axi_rdata[7]_i_4 
       (.I0(\axi_rdata[7]_i_7_n_0 ),
        .I1(\axi_rdata[7]_i_8_n_0 ),
        .I2(\axi_rdata[7]_i_9_n_0 ),
        .I3(slv_reg2[3]),
        .I4(slv_reg2[22]),
        .I5(slv_reg2[10]),
        .O(\axi_rdata[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \axi_rdata[7]_i_5 
       (.I0(\axi_rdata[7]_i_10_n_0 ),
        .I1(\axi_rdata[7]_i_11_n_0 ),
        .I2(slv_reg2[24]),
        .I3(slv_reg2[9]),
        .I4(slv_reg2[19]),
        .I5(slv_reg2[7]),
        .O(\axi_rdata[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[7]_i_6 
       (.I0(slv_reg2[7]),
        .I1(axi_araddr[3]),
        .I2(slv_reg0[7]),
        .O(\axi_rdata[7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_rdata[7]_i_7 
       (.I0(slv_reg2[26]),
        .I1(slv_reg2[17]),
        .I2(slv_reg2[27]),
        .I3(slv_reg2[13]),
        .O(\axi_rdata[7]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \axi_rdata[7]_i_8 
       (.I0(slv_reg2[18]),
        .I1(slv_reg2[16]),
        .I2(slv_reg2[29]),
        .I3(slv_reg2[20]),
        .O(\axi_rdata[7]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_rdata[7]_i_9 
       (.I0(slv_reg2[21]),
        .I1(slv_reg2[4]),
        .I2(slv_reg2[23]),
        .I3(slv_reg2[11]),
        .O(\axi_rdata[7]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg1[8]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[8]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[8]),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg1[9]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[9]),
        .I3(axi_araddr[3]),
        .I4(slv_reg0[9]),
        .O(reg_data_out[9]));
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
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
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
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
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
    camsel_reg_reg
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(camsel_reg_reg_i_1_n_0),
        .GE(1'b1),
        .Q(camsel));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    camsel_reg_reg_i_1
       (.I0(w_req_reg_reg_i_2_n_0),
        .I1(slv_reg0[1]),
        .I2(slv_reg0[0]),
        .I3(\led_out_reg_reg[3]_i_3_n_0 ),
        .I4(\led_out_reg_reg[3]_i_4_n_0 ),
        .I5(\led_out_reg_reg[3]_i_5_n_0 ),
        .O(camsel_reg_reg_i_1_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_out_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\led_out_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led_out[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_out_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\led_out_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led_out[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_out_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\led_out_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led_out[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \led_out_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\led_out_reg_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(led_out[3]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \led_out_reg_reg[3]_i_1 
       (.I0(\led_out_reg_reg[3]_i_2_n_0 ),
        .I1(slv_reg0[0]),
        .I2(\led_out_reg_reg[3]_i_3_n_0 ),
        .I3(\led_out_reg_reg[3]_i_4_n_0 ),
        .I4(\led_out_reg_reg[3]_i_5_n_0 ),
        .I5(slv_reg0[1]),
        .O(\led_out_reg_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \led_out_reg_reg[3]_i_2 
       (.I0(slv_reg0[3]),
        .I1(slv_reg0[2]),
        .O(\led_out_reg_reg[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \led_out_reg_reg[3]_i_3 
       (.I0(slv_reg0[14]),
        .I1(slv_reg0[24]),
        .I2(slv_reg0[8]),
        .I3(slv_reg0[15]),
        .I4(\led_out_reg_reg[3]_i_6_n_0 ),
        .O(\led_out_reg_reg[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \led_out_reg_reg[3]_i_4 
       (.I0(slv_reg0[18]),
        .I1(slv_reg0[31]),
        .I2(slv_reg0[26]),
        .I3(slv_reg0[27]),
        .I4(\led_out_reg_reg[3]_i_7_n_0 ),
        .O(\led_out_reg_reg[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led_out_reg_reg[3]_i_5 
       (.I0(slv_reg0[4]),
        .I1(slv_reg0[6]),
        .I2(slv_reg0[5]),
        .I3(slv_reg0[7]),
        .I4(\led_out_reg_reg[3]_i_8_n_0 ),
        .I5(\led_out_reg_reg[3]_i_9_n_0 ),
        .O(\led_out_reg_reg[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_out_reg_reg[3]_i_6 
       (.I0(slv_reg0[11]),
        .I1(slv_reg0[9]),
        .I2(slv_reg0[13]),
        .I3(slv_reg0[10]),
        .O(\led_out_reg_reg[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_out_reg_reg[3]_i_7 
       (.I0(slv_reg0[19]),
        .I1(slv_reg0[16]),
        .I2(slv_reg0[25]),
        .I3(slv_reg0[12]),
        .O(\led_out_reg_reg[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_out_reg_reg[3]_i_8 
       (.I0(slv_reg0[30]),
        .I1(slv_reg0[28]),
        .I2(slv_reg0[29]),
        .I3(slv_reg0[22]),
        .O(\led_out_reg_reg[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_out_reg_reg[3]_i_9 
       (.I0(slv_reg0[23]),
        .I1(slv_reg0[20]),
        .I2(slv_reg0[21]),
        .I3(slv_reg0[17]),
        .O(\led_out_reg_reg[3]_i_9_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[12]));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \pwmv1_reg_reg[12]_i_1 
       (.I0(\led_out_reg_reg[3]_i_2_n_0 ),
        .I1(\led_out_reg_reg[3]_i_3_n_0 ),
        .I2(\led_out_reg_reg[3]_i_4_n_0 ),
        .I3(\led_out_reg_reg[3]_i_5_n_0 ),
        .I4(slv_reg0[0]),
        .I5(slv_reg0[1]),
        .O(\pwmv1_reg_reg[12]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv1_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\pwmv1_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv1_reg[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[12]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \pwmv2_reg_reg[12]_i_1 
       (.I0(\led_out_reg_reg[3]_i_2_n_0 ),
        .I1(slv_reg0[1]),
        .I2(slv_reg0[0]),
        .I3(\led_out_reg_reg[3]_i_3_n_0 ),
        .I4(\led_out_reg_reg[3]_i_4_n_0 ),
        .I5(\led_out_reg_reg[3]_i_5_n_0 ),
        .O(\pwmv2_reg_reg[12]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \pwmv2_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\pwmv2_reg_reg[12]_i_1_n_0 ),
        .GE(1'b1),
        .Q(pwmv2_reg[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[18]));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \r_addr_reg_reg[18]_i_1 
       (.I0(w_req_reg_reg_i_2_n_0),
        .I1(\led_out_reg_reg[3]_i_3_n_0 ),
        .I2(\led_out_reg_reg[3]_i_4_n_0 ),
        .I3(\led_out_reg_reg[3]_i_5_n_0 ),
        .I4(slv_reg0[0]),
        .I5(slv_reg0[1]),
        .O(\r_addr_reg_reg[18]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_addr_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\r_addr_reg_reg[18]_i_1_n_0 ),
        .GE(1'b1),
        .Q(r_addr[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    sccb_req_reg_reg
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(sccb_req_reg_reg_i_1_n_0),
        .GE(1'b1),
        .Q(sccb_req));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    sccb_req_reg_reg_i_1
       (.I0(slv_reg0[0]),
        .I1(\led_out_reg_reg[3]_i_5_n_0 ),
        .I2(\led_out_reg_reg[3]_i_4_n_0 ),
        .I3(\led_out_reg_reg[3]_i_3_n_0 ),
        .I4(w_req_reg_reg_i_2_n_0),
        .I5(slv_reg0[1]),
        .O(sccb_req_reg_reg_i_1_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[0] 
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[10] 
       (.CLR(1'b0),
        .D(slv_reg1[10]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[11] 
       (.CLR(1'b0),
        .D(slv_reg1[11]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[12] 
       (.CLR(1'b0),
        .D(slv_reg1[12]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[13] 
       (.CLR(1'b0),
        .D(slv_reg1[13]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[14] 
       (.CLR(1'b0),
        .D(slv_reg1[14]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[15] 
       (.CLR(1'b0),
        .D(slv_reg1[15]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[16] 
       (.CLR(1'b0),
        .D(slv_reg1[16]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[17] 
       (.CLR(1'b0),
        .D(slv_reg1[17]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[18] 
       (.CLR(1'b0),
        .D(slv_reg1[18]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[19] 
       (.CLR(1'b0),
        .D(slv_reg1[19]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[1] 
       (.CLR(1'b0),
        .D(slv_reg1[1]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[20] 
       (.CLR(1'b0),
        .D(slv_reg1[20]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[21] 
       (.CLR(1'b0),
        .D(slv_reg1[21]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[22] 
       (.CLR(1'b0),
        .D(slv_reg1[22]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[23] 
       (.CLR(1'b0),
        .D(slv_reg1[23]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[24] 
       (.CLR(1'b0),
        .D(slv_reg1[24]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[25] 
       (.CLR(1'b0),
        .D(slv_reg1[25]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[26] 
       (.CLR(1'b0),
        .D(slv_reg1[26]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[27] 
       (.CLR(1'b0),
        .D(slv_reg1[27]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[28] 
       (.CLR(1'b0),
        .D(slv_reg1[28]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[29] 
       (.CLR(1'b0),
        .D(slv_reg1[29]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[2] 
       (.CLR(1'b0),
        .D(slv_reg1[2]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[30] 
       (.CLR(1'b0),
        .D(slv_reg1[30]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[31] 
       (.CLR(1'b0),
        .D(slv_reg1[31]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[31]));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \sccb_wdata_reg_reg[31]_i_1 
       (.I0(\led_out_reg_reg[3]_i_3_n_0 ),
        .I1(\led_out_reg_reg[3]_i_4_n_0 ),
        .I2(\led_out_reg_reg[3]_i_5_n_0 ),
        .I3(slv_reg0[0]),
        .I4(slv_reg0[1]),
        .I5(\sccb_wdata_reg_reg[31]_i_2_n_0 ),
        .O(\sccb_wdata_reg_reg[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \sccb_wdata_reg_reg[31]_i_2 
       (.I0(slv_reg0[2]),
        .I1(slv_reg0[3]),
        .O(\sccb_wdata_reg_reg[31]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[3] 
       (.CLR(1'b0),
        .D(slv_reg1[3]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[4] 
       (.CLR(1'b0),
        .D(slv_reg1[4]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[5] 
       (.CLR(1'b0),
        .D(slv_reg1[5]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[6] 
       (.CLR(1'b0),
        .D(slv_reg1[6]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[7] 
       (.CLR(1'b0),
        .D(slv_reg1[7]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[8] 
       (.CLR(1'b0),
        .D(slv_reg1[8]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \sccb_wdata_reg_reg[9] 
       (.CLR(1'b0),
        .D(slv_reg1[9]),
        .G(\sccb_wdata_reg_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(sccb_wdata[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    sccb_wr_reg_reg
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(sccb_wr_reg_reg_i_1_n_0),
        .GE(1'b1),
        .Q(sccb_wr));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    sccb_wr_reg_reg_i_1
       (.I0(slv_reg0[0]),
        .I1(\led_out_reg_reg[3]_i_3_n_0 ),
        .I2(\led_out_reg_reg[3]_i_4_n_0 ),
        .I3(\led_out_reg_reg[3]_i_5_n_0 ),
        .I4(slv_reg0[1]),
        .I5(\sccb_wdata_reg_reg[31]_i_2_n_0 ),
        .O(sccb_wr_reg_reg_i_1_n_0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
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
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
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
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
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
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[1]),
        .I3(axi_awaddr[2]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[2]),
        .I3(axi_awaddr[2]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[3]),
        .I3(axi_awaddr[2]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[0]),
        .I3(axi_awaddr[2]),
        .O(p_1_in[7]));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
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
    w_req_reg_reg
       (.CLR(1'b0),
        .D(slv_reg1[0]),
        .G(w_req_reg_reg_i_1_n_0),
        .GE(1'b1),
        .Q(w_req));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    w_req_reg_reg_i_1
       (.I0(slv_reg0[0]),
        .I1(\led_out_reg_reg[3]_i_3_n_0 ),
        .I2(\led_out_reg_reg[3]_i_4_n_0 ),
        .I3(\led_out_reg_reg[3]_i_5_n_0 ),
        .I4(slv_reg0[1]),
        .I5(w_req_reg_reg_i_2_n_0),
        .O(w_req_reg_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    w_req_reg_reg_i_2
       (.I0(slv_reg0[2]),
        .I1(slv_reg0[3]),
        .O(w_req_reg_reg_i_2_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pwmc
   (pulse1,
    pulse2,
    Q,
    pulse1_0,
    s00_axi_aclk);
  output pulse1;
  output pulse2;
  input [12:0]Q;
  input [12:0]pulse1_0;
  input s00_axi_aclk;

  wire [12:0]Q;
  wire [12:0]\astray_inst2/mp/cnt_reg ;
  wire \cnt_reg[0]_i_1_n_0 ;
  wire \cnt_reg[0]_i_1_n_1 ;
  wire \cnt_reg[0]_i_1_n_2 ;
  wire \cnt_reg[0]_i_1_n_3 ;
  wire \cnt_reg[0]_i_1_n_4 ;
  wire \cnt_reg[0]_i_1_n_5 ;
  wire \cnt_reg[0]_i_1_n_6 ;
  wire \cnt_reg[0]_i_1_n_7 ;
  wire \cnt_reg[12]_i_1_n_7 ;
  wire \cnt_reg[4]_i_1_n_0 ;
  wire \cnt_reg[4]_i_1_n_1 ;
  wire \cnt_reg[4]_i_1_n_2 ;
  wire \cnt_reg[4]_i_1_n_3 ;
  wire \cnt_reg[4]_i_1_n_4 ;
  wire \cnt_reg[4]_i_1_n_5 ;
  wire \cnt_reg[4]_i_1_n_6 ;
  wire \cnt_reg[4]_i_1_n_7 ;
  wire \cnt_reg[8]_i_1_n_0 ;
  wire \cnt_reg[8]_i_1_n_1 ;
  wire \cnt_reg[8]_i_1_n_2 ;
  wire \cnt_reg[8]_i_1_n_3 ;
  wire \cnt_reg[8]_i_1_n_4 ;
  wire \cnt_reg[8]_i_1_n_5 ;
  wire \cnt_reg[8]_i_1_n_6 ;
  wire \cnt_reg[8]_i_1_n_7 ;
  wire [0:0]p_0_in;
  wire pulse1;
  wire [12:0]pulse1_0;
  wire pulse1_INST_0_i_10_n_0;
  wire pulse1_INST_0_i_11_n_0;
  wire pulse1_INST_0_i_12_n_0;
  wire pulse1_INST_0_i_13_n_0;
  wire pulse1_INST_0_i_14_n_0;
  wire pulse1_INST_0_i_15_n_0;
  wire pulse1_INST_0_i_16_n_0;
  wire pulse1_INST_0_i_1_n_0;
  wire pulse1_INST_0_i_1_n_1;
  wire pulse1_INST_0_i_1_n_2;
  wire pulse1_INST_0_i_1_n_3;
  wire pulse1_INST_0_i_2_n_0;
  wire pulse1_INST_0_i_3_n_0;
  wire pulse1_INST_0_i_3_n_1;
  wire pulse1_INST_0_i_3_n_2;
  wire pulse1_INST_0_i_3_n_3;
  wire pulse1_INST_0_i_4_n_0;
  wire pulse1_INST_0_i_5_n_0;
  wire pulse1_INST_0_i_6_n_0;
  wire pulse1_INST_0_i_7_n_0;
  wire pulse1_INST_0_i_8_n_0;
  wire pulse1_INST_0_i_8_n_1;
  wire pulse1_INST_0_i_8_n_2;
  wire pulse1_INST_0_i_8_n_3;
  wire pulse1_INST_0_i_9_n_0;
  wire pulse2;
  wire pulse2_INST_0_i_10_n_0;
  wire pulse2_INST_0_i_11_n_0;
  wire pulse2_INST_0_i_12_n_0;
  wire pulse2_INST_0_i_13_n_0;
  wire pulse2_INST_0_i_14_n_0;
  wire pulse2_INST_0_i_15_n_0;
  wire pulse2_INST_0_i_16_n_0;
  wire pulse2_INST_0_i_1_n_0;
  wire pulse2_INST_0_i_1_n_1;
  wire pulse2_INST_0_i_1_n_2;
  wire pulse2_INST_0_i_1_n_3;
  wire pulse2_INST_0_i_2_n_0;
  wire pulse2_INST_0_i_3_n_0;
  wire pulse2_INST_0_i_3_n_1;
  wire pulse2_INST_0_i_3_n_2;
  wire pulse2_INST_0_i_3_n_3;
  wire pulse2_INST_0_i_4_n_0;
  wire pulse2_INST_0_i_5_n_0;
  wire pulse2_INST_0_i_6_n_0;
  wire pulse2_INST_0_i_7_n_0;
  wire pulse2_INST_0_i_8_n_0;
  wire pulse2_INST_0_i_8_n_1;
  wire pulse2_INST_0_i_8_n_2;
  wire pulse2_INST_0_i_8_n_3;
  wire pulse2_INST_0_i_9_n_0;
  wire s00_axi_aclk;
  wire [3:0]\NLW_cnt_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_cnt_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:1]NLW_pulse1_INST_0_CO_UNCONNECTED;
  wire [3:0]NLW_pulse1_INST_0_O_UNCONNECTED;
  wire [3:0]NLW_pulse1_INST_0_i_1_O_UNCONNECTED;
  wire [3:0]NLW_pulse1_INST_0_i_3_O_UNCONNECTED;
  wire [3:0]NLW_pulse1_INST_0_i_8_O_UNCONNECTED;
  wire [3:1]NLW_pulse2_INST_0_CO_UNCONNECTED;
  wire [3:0]NLW_pulse2_INST_0_O_UNCONNECTED;
  wire [3:0]NLW_pulse2_INST_0_i_1_O_UNCONNECTED;
  wire [3:0]NLW_pulse2_INST_0_i_3_O_UNCONNECTED;
  wire [3:0]NLW_pulse2_INST_0_i_8_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_2 
       (.I0(\astray_inst2/mp/cnt_reg [0]),
        .O(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_1_n_7 ),
        .Q(\astray_inst2/mp/cnt_reg [0]),
        .R(1'b0));
  CARRY4 \cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\cnt_reg[0]_i_1_n_0 ,\cnt_reg[0]_i_1_n_1 ,\cnt_reg[0]_i_1_n_2 ,\cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_reg[0]_i_1_n_4 ,\cnt_reg[0]_i_1_n_5 ,\cnt_reg[0]_i_1_n_6 ,\cnt_reg[0]_i_1_n_7 }),
        .S({\astray_inst2/mp/cnt_reg [3:1],p_0_in}));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_5 ),
        .Q(\astray_inst2/mp/cnt_reg [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_4 ),
        .Q(\astray_inst2/mp/cnt_reg [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_7 ),
        .Q(\astray_inst2/mp/cnt_reg [12]),
        .R(1'b0));
  CARRY4 \cnt_reg[12]_i_1 
       (.CI(\cnt_reg[8]_i_1_n_0 ),
        .CO(\NLW_cnt_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[12]_i_1_O_UNCONNECTED [3:1],\cnt_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,\astray_inst2/mp/cnt_reg [12]}));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_1_n_6 ),
        .Q(\astray_inst2/mp/cnt_reg [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_1_n_5 ),
        .Q(\astray_inst2/mp/cnt_reg [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_1_n_4 ),
        .Q(\astray_inst2/mp/cnt_reg [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_7 ),
        .Q(\astray_inst2/mp/cnt_reg [4]),
        .R(1'b0));
  CARRY4 \cnt_reg[4]_i_1 
       (.CI(\cnt_reg[0]_i_1_n_0 ),
        .CO({\cnt_reg[4]_i_1_n_0 ,\cnt_reg[4]_i_1_n_1 ,\cnt_reg[4]_i_1_n_2 ,\cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_1_n_4 ,\cnt_reg[4]_i_1_n_5 ,\cnt_reg[4]_i_1_n_6 ,\cnt_reg[4]_i_1_n_7 }),
        .S(\astray_inst2/mp/cnt_reg [7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_6 ),
        .Q(\astray_inst2/mp/cnt_reg [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_5 ),
        .Q(\astray_inst2/mp/cnt_reg [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_4 ),
        .Q(\astray_inst2/mp/cnt_reg [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_7 ),
        .Q(\astray_inst2/mp/cnt_reg [8]),
        .R(1'b0));
  CARRY4 \cnt_reg[8]_i_1 
       (.CI(\cnt_reg[4]_i_1_n_0 ),
        .CO({\cnt_reg[8]_i_1_n_0 ,\cnt_reg[8]_i_1_n_1 ,\cnt_reg[8]_i_1_n_2 ,\cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_1_n_4 ,\cnt_reg[8]_i_1_n_5 ,\cnt_reg[8]_i_1_n_6 ,\cnt_reg[8]_i_1_n_7 }),
        .S(\astray_inst2/mp/cnt_reg [11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_6 ),
        .Q(\astray_inst2/mp/cnt_reg [9]),
        .R(1'b0));
  CARRY4 pulse1_INST_0
       (.CI(pulse1_INST_0_i_1_n_0),
        .CO({NLW_pulse1_INST_0_CO_UNCONNECTED[3:1],pulse1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,pulse1_0[12]}),
        .O(NLW_pulse1_INST_0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,pulse1_INST_0_i_2_n_0}));
  CARRY4 pulse1_INST_0_i_1
       (.CI(pulse1_INST_0_i_3_n_0),
        .CO({pulse1_INST_0_i_1_n_0,pulse1_INST_0_i_1_n_1,pulse1_INST_0_i_1_n_2,pulse1_INST_0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(pulse1_0[11:8]),
        .O(NLW_pulse1_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({pulse1_INST_0_i_4_n_0,pulse1_INST_0_i_5_n_0,pulse1_INST_0_i_6_n_0,pulse1_INST_0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_10
       (.I0(pulse1_0[6]),
        .I1(\astray_inst2/mp/cnt_reg [6]),
        .O(pulse1_INST_0_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_11
       (.I0(pulse1_0[5]),
        .I1(\astray_inst2/mp/cnt_reg [5]),
        .O(pulse1_INST_0_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_12
       (.I0(pulse1_0[4]),
        .I1(\astray_inst2/mp/cnt_reg [4]),
        .O(pulse1_INST_0_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_13
       (.I0(pulse1_0[3]),
        .I1(\astray_inst2/mp/cnt_reg [3]),
        .O(pulse1_INST_0_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_14
       (.I0(pulse1_0[2]),
        .I1(\astray_inst2/mp/cnt_reg [2]),
        .O(pulse1_INST_0_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_15
       (.I0(pulse1_0[1]),
        .I1(\astray_inst2/mp/cnt_reg [1]),
        .O(pulse1_INST_0_i_15_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_16
       (.I0(pulse1_0[0]),
        .I1(\astray_inst2/mp/cnt_reg [0]),
        .O(pulse1_INST_0_i_16_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_2
       (.I0(pulse1_0[12]),
        .I1(\astray_inst2/mp/cnt_reg [12]),
        .O(pulse1_INST_0_i_2_n_0));
  CARRY4 pulse1_INST_0_i_3
       (.CI(pulse1_INST_0_i_8_n_0),
        .CO({pulse1_INST_0_i_3_n_0,pulse1_INST_0_i_3_n_1,pulse1_INST_0_i_3_n_2,pulse1_INST_0_i_3_n_3}),
        .CYINIT(1'b0),
        .DI(pulse1_0[7:4]),
        .O(NLW_pulse1_INST_0_i_3_O_UNCONNECTED[3:0]),
        .S({pulse1_INST_0_i_9_n_0,pulse1_INST_0_i_10_n_0,pulse1_INST_0_i_11_n_0,pulse1_INST_0_i_12_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_4
       (.I0(pulse1_0[11]),
        .I1(\astray_inst2/mp/cnt_reg [11]),
        .O(pulse1_INST_0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_5
       (.I0(pulse1_0[10]),
        .I1(\astray_inst2/mp/cnt_reg [10]),
        .O(pulse1_INST_0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_6
       (.I0(pulse1_0[9]),
        .I1(\astray_inst2/mp/cnt_reg [9]),
        .O(pulse1_INST_0_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_7
       (.I0(pulse1_0[8]),
        .I1(\astray_inst2/mp/cnt_reg [8]),
        .O(pulse1_INST_0_i_7_n_0));
  CARRY4 pulse1_INST_0_i_8
       (.CI(1'b0),
        .CO({pulse1_INST_0_i_8_n_0,pulse1_INST_0_i_8_n_1,pulse1_INST_0_i_8_n_2,pulse1_INST_0_i_8_n_3}),
        .CYINIT(1'b0),
        .DI(pulse1_0[3:0]),
        .O(NLW_pulse1_INST_0_i_8_O_UNCONNECTED[3:0]),
        .S({pulse1_INST_0_i_13_n_0,pulse1_INST_0_i_14_n_0,pulse1_INST_0_i_15_n_0,pulse1_INST_0_i_16_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    pulse1_INST_0_i_9
       (.I0(pulse1_0[7]),
        .I1(\astray_inst2/mp/cnt_reg [7]),
        .O(pulse1_INST_0_i_9_n_0));
  CARRY4 pulse2_INST_0
       (.CI(pulse2_INST_0_i_1_n_0),
        .CO({NLW_pulse2_INST_0_CO_UNCONNECTED[3:1],pulse2}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Q[12]}),
        .O(NLW_pulse2_INST_0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,pulse2_INST_0_i_2_n_0}));
  CARRY4 pulse2_INST_0_i_1
       (.CI(pulse2_INST_0_i_3_n_0),
        .CO({pulse2_INST_0_i_1_n_0,pulse2_INST_0_i_1_n_1,pulse2_INST_0_i_1_n_2,pulse2_INST_0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(Q[11:8]),
        .O(NLW_pulse2_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({pulse2_INST_0_i_4_n_0,pulse2_INST_0_i_5_n_0,pulse2_INST_0_i_6_n_0,pulse2_INST_0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_10
       (.I0(Q[6]),
        .I1(\astray_inst2/mp/cnt_reg [6]),
        .O(pulse2_INST_0_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_11
       (.I0(Q[5]),
        .I1(\astray_inst2/mp/cnt_reg [5]),
        .O(pulse2_INST_0_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_12
       (.I0(Q[4]),
        .I1(\astray_inst2/mp/cnt_reg [4]),
        .O(pulse2_INST_0_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_13
       (.I0(Q[3]),
        .I1(\astray_inst2/mp/cnt_reg [3]),
        .O(pulse2_INST_0_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_14
       (.I0(Q[2]),
        .I1(\astray_inst2/mp/cnt_reg [2]),
        .O(pulse2_INST_0_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_15
       (.I0(Q[1]),
        .I1(\astray_inst2/mp/cnt_reg [1]),
        .O(pulse2_INST_0_i_15_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_16
       (.I0(Q[0]),
        .I1(\astray_inst2/mp/cnt_reg [0]),
        .O(pulse2_INST_0_i_16_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_2
       (.I0(Q[12]),
        .I1(\astray_inst2/mp/cnt_reg [12]),
        .O(pulse2_INST_0_i_2_n_0));
  CARRY4 pulse2_INST_0_i_3
       (.CI(pulse2_INST_0_i_8_n_0),
        .CO({pulse2_INST_0_i_3_n_0,pulse2_INST_0_i_3_n_1,pulse2_INST_0_i_3_n_2,pulse2_INST_0_i_3_n_3}),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O(NLW_pulse2_INST_0_i_3_O_UNCONNECTED[3:0]),
        .S({pulse2_INST_0_i_9_n_0,pulse2_INST_0_i_10_n_0,pulse2_INST_0_i_11_n_0,pulse2_INST_0_i_12_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_4
       (.I0(Q[11]),
        .I1(\astray_inst2/mp/cnt_reg [11]),
        .O(pulse2_INST_0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_5
       (.I0(Q[10]),
        .I1(\astray_inst2/mp/cnt_reg [10]),
        .O(pulse2_INST_0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_6
       (.I0(Q[9]),
        .I1(\astray_inst2/mp/cnt_reg [9]),
        .O(pulse2_INST_0_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_7
       (.I0(Q[8]),
        .I1(\astray_inst2/mp/cnt_reg [8]),
        .O(pulse2_INST_0_i_7_n_0));
  CARRY4 pulse2_INST_0_i_8
       (.CI(1'b0),
        .CO({pulse2_INST_0_i_8_n_0,pulse2_INST_0_i_8_n_1,pulse2_INST_0_i_8_n_2,pulse2_INST_0_i_8_n_3}),
        .CYINIT(1'b0),
        .DI(Q[3:0]),
        .O(NLW_pulse2_INST_0_i_8_O_UNCONNECTED[3:0]),
        .S({pulse2_INST_0_i_13_n_0,pulse2_INST_0_i_14_n_0,pulse2_INST_0_i_15_n_0,pulse2_INST_0_i_16_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    pulse2_INST_0_i_9
       (.I0(Q[7]),
        .I1(\astray_inst2/mp/cnt_reg [7]),
        .O(pulse2_INST_0_i_9_n_0));
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
