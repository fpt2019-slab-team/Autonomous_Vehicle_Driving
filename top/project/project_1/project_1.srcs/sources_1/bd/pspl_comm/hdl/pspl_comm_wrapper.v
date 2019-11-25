//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Wed Nov 20 19:17:12 2019
//Host        : cuckoo running 64-bit CentOS release 6.9 (Final)
//Command     : generate_target pspl_comm_wrapper.bd
//Design      : pspl_comm_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pspl_comm_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    kl_accel,
    kl_steer,
    led,
    lsd_line_addr_f,
    lsd_line_addr_r,
    lsd_line_end_h_f,
    lsd_line_end_h_r,
    lsd_line_end_v_f,
    lsd_line_end_v_r,
    lsd_line_num_f,
    lsd_line_num_r,
    lsd_line_start_h_f,
    lsd_line_start_h_r,
    lsd_line_start_v_f,
    lsd_line_start_v_r,
    lsd_ready_f,
    lsd_ready_r,
    motor_speed_l,
    motor_speed_r,
    sccb_busy,
    sccb_req,
    sccb_send_data,
    sw,
    topview_line_addr_f,
    topview_line_addr_r,
    topview_line_end_h_f,
    topview_line_end_h_r,
    topview_line_end_v_f,
    topview_line_end_v_r,
    topview_line_num_f,
    topview_line_num_r,
    topview_line_start_h_f,
    topview_line_start_h_r,
    topview_line_start_v_f,
    topview_line_start_v_r,
    topview_line_valid_f,
    topview_line_valid_r,
    topview_ready_f,
    topview_ready_r);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [6:0]kl_accel;
  output [7:0]kl_steer;
  output [3:0]led;
  output [31:0]lsd_line_addr_f;
  output [31:0]lsd_line_addr_r;
  input [31:0]lsd_line_end_h_f;
  input [31:0]lsd_line_end_h_r;
  input [31:0]lsd_line_end_v_f;
  input [31:0]lsd_line_end_v_r;
  input [31:0]lsd_line_num_f;
  input [31:0]lsd_line_num_r;
  input [31:0]lsd_line_start_h_f;
  input [31:0]lsd_line_start_h_r;
  input [31:0]lsd_line_start_v_f;
  input [31:0]lsd_line_start_v_r;
  input lsd_ready_f;
  input lsd_ready_r;
  input [15:0]motor_speed_l;
  input [15:0]motor_speed_r;
  input sccb_busy;
  output sccb_req;
  output [23:0]sccb_send_data;
  input [1:0]sw;
  output [31:0]topview_line_addr_f;
  output [31:0]topview_line_addr_r;
  input [31:0]topview_line_end_h_f;
  input [31:0]topview_line_end_h_r;
  input [31:0]topview_line_end_v_f;
  input [31:0]topview_line_end_v_r;
  input [31:0]topview_line_num_f;
  input [31:0]topview_line_num_r;
  input [31:0]topview_line_start_h_f;
  input [31:0]topview_line_start_h_r;
  input [31:0]topview_line_start_v_f;
  input [31:0]topview_line_start_v_r;
  input topview_line_valid_f;
  input topview_line_valid_r;
  input topview_ready_f;
  input topview_ready_r;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
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

  pspl_comm pspl_comm_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
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
