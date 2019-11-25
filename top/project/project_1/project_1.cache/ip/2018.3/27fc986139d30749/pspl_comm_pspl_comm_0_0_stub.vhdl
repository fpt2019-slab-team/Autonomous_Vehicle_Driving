-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Nov 14 15:59:57 2019
-- Host        : flamingo running 64-bit CentOS release 6.10 (Final)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ pspl_comm_pspl_comm_0_0_stub.vhdl
-- Design      : pspl_comm_pspl_comm_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
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
    lsd_line_data_f : in STD_LOGIC_VECTOR ( 39 downto 0 );
    lsd_line_data_r : in STD_LOGIC_VECTOR ( 39 downto 0 );
    lsd_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_ready_f : in STD_LOGIC;
    topview_ready_r : in STD_LOGIC;
    topview_line_num_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_num_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_data_f : in STD_LOGIC_VECTOR ( 38 downto 0 );
    topview_line_data_r : in STD_LOGIC_VECTOR ( 38 downto 0 );
    topview_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
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

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sw[1:0],led[3:0],sccb_busy,sccb_req,sccb_send_data[23:0],lsd_ready_f,lsd_ready_r,lsd_line_num_f[31:0],lsd_line_num_r[31:0],lsd_line_data_f[39:0],lsd_line_data_r[39:0],lsd_line_addr_f[31:0],lsd_line_addr_r[31:0],topview_ready_f,topview_ready_r,topview_line_num_f[31:0],topview_line_num_r[31:0],topview_line_data_f[38:0],topview_line_data_r[38:0],topview_line_addr_f[31:0],topview_line_addr_r[31:0],motor_speed_l[15:0],motor_speed_r[15:0],kl_accel[6:0],kl_steer[7:0],s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pspl_comm_v1_0,Vivado 2018.3";
begin
end;
