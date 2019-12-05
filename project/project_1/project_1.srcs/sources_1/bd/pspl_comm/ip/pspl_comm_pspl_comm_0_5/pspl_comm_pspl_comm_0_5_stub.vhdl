-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Nov 29 17:59:14 2019
-- Host        : flamingo running 64-bit CentOS release 6.10 (Final)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/users/matsuda/project/Autonomous_Vehicle_Driving/project/project_1/project_1.srcs/sources_1/bd/pspl_comm/ip/pspl_comm_pspl_comm_0_5/pspl_comm_pspl_comm_0_5_stub.vhdl
-- Design      : pspl_comm_pspl_comm_0_5
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pspl_comm_pspl_comm_0_5 is
  Port ( 
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 );
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sccb_busy : in STD_LOGIC;
    sccb_req : out STD_LOGIC;
    sccb_send_data : out STD_LOGIC_VECTOR ( 23 downto 0 );
    lsd_ready_f : in STD_LOGIC;
    lsd_ready_r : in STD_LOGIC;
    lsd_line_num_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_num_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_start_v_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_start_v_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_start_h_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_start_h_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_end_v_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_end_v_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_end_h_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_end_h_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_write_protect_f : out STD_LOGIC;
    lsd_write_protect_r : out STD_LOGIC;
    lsd_grad_thres_f : out STD_LOGIC_VECTOR ( 16 downto 0 );
    lsd_grad_thres_r : out STD_LOGIC_VECTOR ( 16 downto 0 );
    topview_ready_f : in STD_LOGIC;
    topview_ready_r : in STD_LOGIC;
    topview_line_num_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_num_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_start_v_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_start_v_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_start_h_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_start_h_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_end_v_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_end_v_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_end_h_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_end_h_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_valid_f : in STD_LOGIC;
    topview_line_valid_r : in STD_LOGIC;
    topview_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_write_protect_f : out STD_LOGIC;
    topview_write_protect_r : out STD_LOGIC;
    motor_speed_l : in STD_LOGIC_VECTOR ( 15 downto 0 );
    motor_speed_r : in STD_LOGIC_VECTOR ( 15 downto 0 );
    kl_accel : out STD_LOGIC_VECTOR ( 6 downto 0 );
    kl_steer : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end pspl_comm_pspl_comm_0_5;

architecture stub of pspl_comm_pspl_comm_0_5 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sw[1:0],led[3:0],sccb_busy,sccb_req,sccb_send_data[23:0],lsd_ready_f,lsd_ready_r,lsd_line_num_f[31:0],lsd_line_num_r[31:0],lsd_line_start_v_f[31:0],lsd_line_start_v_r[31:0],lsd_line_start_h_f[31:0],lsd_line_start_h_r[31:0],lsd_line_end_v_f[31:0],lsd_line_end_v_r[31:0],lsd_line_end_h_f[31:0],lsd_line_end_h_r[31:0],lsd_line_addr_f[31:0],lsd_line_addr_r[31:0],lsd_write_protect_f,lsd_write_protect_r,lsd_grad_thres_f[16:0],lsd_grad_thres_r[16:0],topview_ready_f,topview_ready_r,topview_line_num_f[31:0],topview_line_num_r[31:0],topview_line_start_v_f[31:0],topview_line_start_v_r[31:0],topview_line_start_h_f[31:0],topview_line_start_h_r[31:0],topview_line_end_v_f[31:0],topview_line_end_v_r[31:0],topview_line_end_h_f[31:0],topview_line_end_h_r[31:0],topview_line_valid_f,topview_line_valid_r,topview_line_addr_f[31:0],topview_line_addr_r[31:0],topview_write_protect_f,topview_write_protect_r,motor_speed_l[15:0],motor_speed_r[15:0],kl_accel[6:0],kl_steer[7:0],s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pspl_comm_v1_0,Vivado 2018.3";
begin
end;
