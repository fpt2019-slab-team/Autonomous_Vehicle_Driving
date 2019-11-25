-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Nov 14 15:59:57 2019
-- Host        : flamingo running 64-bit CentOS release 6.10 (Final)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ pspl_comm_pspl_comm_0_0_sim_netlist.vhdl
-- Design      : pspl_comm_pspl_comm_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0_S00_AXI is
  port (
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sccb_req : out STD_LOGIC;
    sccb_send_data : out STD_LOGIC_VECTOR ( 23 downto 0 );
    lsd_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    kl_accel : out STD_LOGIC_VECTOR ( 6 downto 0 );
    kl_steer : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    lsd_line_num_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_num_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_data_f : in STD_LOGIC_VECTOR ( 38 downto 0 );
    motor_speed_l : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 );
    topview_line_data_r : in STD_LOGIC_VECTOR ( 38 downto 0 );
    lsd_line_data_r : in STD_LOGIC_VECTOR ( 39 downto 0 );
    topview_ready_r : in STD_LOGIC;
    lsd_ready_r : in STD_LOGIC;
    topview_ready_f : in STD_LOGIC;
    lsd_ready_f : in STD_LOGIC;
    lsd_line_data_f : in STD_LOGIC_VECTOR ( 39 downto 0 );
    motor_speed_r : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sccb_busy : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0_S00_AXI is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_10_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_11_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_12_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_13_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_14_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_15_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_16_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_17_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_10_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_11_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[19]_i_5_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \kl_accel_reg_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \kl_accel_reg_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \kl_steer_reg_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_7_n_0\ : STD_LOGIC;
  signal \led_reg_reg[3]_i_8_n_0\ : STD_LOGIC;
  signal \lsd_line_addr_reg_f_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \lsd_line_addr_reg_f_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \lsd_line_addr_reg_r_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal sccb_req_reg_reg_i_1_n_0 : STD_LOGIC;
  signal sccb_req_reg_reg_i_2_n_0 : STD_LOGIC;
  signal sccb_req_reg_reg_i_3_n_0 : STD_LOGIC;
  signal sccb_req_reg_reg_i_4_n_0 : STD_LOGIC;
  signal sccb_req_reg_reg_i_5_n_0 : STD_LOGIC;
  signal sccb_req_reg_reg_i_6_n_0 : STD_LOGIC;
  signal \sccb_send_data_reg_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \sccb_send_data_reg_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg0[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  signal \topview_line_addr_reg_f_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \topview_line_addr_reg_r_reg[31]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \axi_rdata[0]_i_17\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \axi_rdata[0]_i_8\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axi_rdata[19]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axi_rdata[19]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair4";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_accel_reg_reg[6]\ : label is "LD";
  attribute SOFT_HLUTNM of \kl_accel_reg_reg[6]_i_2\ : label is "soft_lutpair1";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \kl_steer_reg_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \led_reg_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \led_reg_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \led_reg_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \led_reg_reg[3]\ : label is "LD";
  attribute SOFT_HLUTNM of \led_reg_reg[3]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \led_reg_reg[3]_i_8\ : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[16]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[17]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[18]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[19]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[20]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[21]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[22]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[23]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[24]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[25]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[26]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[27]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[28]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[29]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[30]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[31]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_f_reg[9]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[16]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[17]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[18]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[19]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[20]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[21]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[22]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[23]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[24]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[25]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[26]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[27]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[28]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[29]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[30]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[31]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \lsd_line_addr_reg_r_reg[9]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of sccb_req_reg_reg : label is "LD";
  attribute SOFT_HLUTNM of sccb_req_reg_reg_i_5 : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[16]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[17]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[18]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[19]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[20]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[21]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[22]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[23]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \sccb_send_data_reg_reg[9]\ : label is "LD";
  attribute SOFT_HLUTNM of \slv_reg0[31]_i_2\ : label is "soft_lutpair4";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[16]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[17]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[18]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[19]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[20]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[21]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[22]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[23]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[24]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[25]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[26]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[27]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[28]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[29]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[30]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[31]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_f_reg[9]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[0]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[16]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[17]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[18]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[19]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[1]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[20]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[21]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[22]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[23]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[24]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[25]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[26]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[27]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[28]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[29]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[2]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[30]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[31]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[3]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[4]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[5]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[6]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[7]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \topview_line_addr_reg_r_reg[9]\ : label is "LD";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => axi_awready_i_1_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s_axi_awready\,
      I2 => aw_en_reg_n_0,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAAAEAAAAAAAAA"
    )
        port map (
      I0 => \axi_rdata[0]_i_2_n_0\,
      I1 => \axi_rdata[0]_i_3_n_0\,
      I2 => \axi_rdata[0]_i_4_n_0\,
      I3 => slv_reg2(0),
      I4 => \axi_rdata[0]_i_5_n_0\,
      I5 => \axi_rdata[31]_i_3_n_0\,
      O => reg_data_out(0)
    );
\axi_rdata[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010000010FF0000"
    )
        port map (
      I0 => slv_reg2(1),
      I1 => slv_reg2(2),
      I2 => slv_reg2(16),
      I3 => slv_reg2(18),
      I4 => slv_reg2(17),
      I5 => slv_reg2(3),
      O => \axi_rdata[0]_i_10_n_0\
    );
\axi_rdata[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => slv_reg2(16),
      I1 => slv_reg2(18),
      I2 => slv_reg2(10),
      I3 => slv_reg2(9),
      I4 => slv_reg2(5),
      I5 => slv_reg2(6),
      O => \axi_rdata[0]_i_11_n_0\
    );
\axi_rdata[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B391A28000000000"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(16),
      I2 => topview_line_data_f(1),
      I3 => lsd_line_data_f(0),
      I4 => lsd_line_num_f(0),
      I5 => slv_reg2(1),
      O => \axi_rdata[0]_i_12_n_0\
    );
\axi_rdata[0]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CAFFCAF0CA0FCA00"
    )
        port map (
      I0 => topview_ready_f,
      I1 => topview_line_data_f(20),
      I2 => slv_reg2(2),
      I3 => slv_reg2(16),
      I4 => lsd_ready_f,
      I5 => lsd_line_data_f(20),
      O => \axi_rdata[0]_i_13_n_0\
    );
\axi_rdata[0]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF515151"
    )
        port map (
      I0 => slv_reg2(17),
      I1 => slv_reg2(18),
      I2 => motor_speed_l(0),
      I3 => slv_reg2(3),
      I4 => topview_line_data_f(0),
      O => \axi_rdata[0]_i_14_n_0\
    );
\axi_rdata[0]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CAFFCAF0CA0FCA00"
    )
        port map (
      I0 => topview_ready_r,
      I1 => topview_line_data_r(20),
      I2 => slv_reg2(2),
      I3 => slv_reg2(16),
      I4 => lsd_ready_r,
      I5 => lsd_line_data_r(20),
      O => \axi_rdata[0]_i_15_n_0\
    );
\axi_rdata[0]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B391A28000000000"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(16),
      I2 => topview_line_data_r(1),
      I3 => lsd_line_data_r(0),
      I4 => lsd_line_num_r(0),
      I5 => slv_reg2(1),
      O => \axi_rdata[0]_i_16_n_0\
    );
\axi_rdata[0]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => slv_reg2(3),
      I1 => topview_line_data_r(0),
      I2 => slv_reg2(18),
      I3 => motor_speed_r(0),
      O => \axi_rdata[0]_i_17_n_0\
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0CFA0C0A"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg1(0),
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => slv_reg2(0),
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000022222000"
    )
        port map (
      I0 => \axi_rdata[0]_i_6_n_0\,
      I1 => \axi_rdata[0]_i_7_n_0\,
      I2 => \axi_rdata[0]_i_8_n_0\,
      I3 => \axi_rdata[0]_i_9_n_0\,
      I4 => \axi_rdata[0]_i_10_n_0\,
      I5 => \axi_rdata[0]_i_11_n_0\,
      O => \axi_rdata[0]_i_3_n_0\
    );
\axi_rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAABAAAAA"
    )
        port map (
      I0 => \axi_rdata[0]_i_12_n_0\,
      I1 => slv_reg2(1),
      I2 => slv_reg2(17),
      I3 => slv_reg2(3),
      I4 => \axi_rdata[0]_i_13_n_0\,
      I5 => \axi_rdata[0]_i_14_n_0\,
      O => \axi_rdata[0]_i_4_n_0\
    );
\axi_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0400"
    )
        port map (
      I0 => slv_reg2(1),
      I1 => slv_reg2(17),
      I2 => slv_reg2(3),
      I3 => \axi_rdata[0]_i_15_n_0\,
      I4 => \axi_rdata[0]_i_16_n_0\,
      I5 => \axi_rdata[0]_i_17_n_0\,
      O => \axi_rdata[0]_i_5_n_0\
    );
\axi_rdata[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => slv_reg2(13),
      I1 => slv_reg2(12),
      I2 => slv_reg2(4),
      I3 => slv_reg2(11),
      I4 => slv_reg2(14),
      I5 => slv_reg2(15),
      O => \axi_rdata[0]_i_6_n_0\
    );
\axi_rdata[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => slv_reg2(8),
      I1 => slv_reg2(7),
      O => \axi_rdata[0]_i_7_n_0\
    );
\axi_rdata[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => slv_reg2(17),
      I1 => slv_reg2(3),
      I2 => slv_reg2(2),
      I3 => slv_reg2(1),
      O => \axi_rdata[0]_i_8_n_0\
    );
\axi_rdata[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => slv_reg2(18),
      I1 => sw(0),
      I2 => slv_reg2(16),
      I3 => sccb_busy,
      O => \axi_rdata[0]_i_9_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[10]_i_2_n_0\,
      I1 => \axi_rdata[10]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(10)
    );
\axi_rdata[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(10),
      I1 => slv_reg1(10),
      I2 => slv_reg2(10),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[10]_i_2_n_0\
    );
\axi_rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[10]_i_4_n_0\,
      I1 => \axi_rdata[10]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[10]_i_6_n_0\,
      I5 => \axi_rdata[10]_i_7_n_0\,
      O => \axi_rdata[10]_i_3_n_0\
    );
\axi_rdata[10]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(10),
      I1 => lsd_line_data_f(10),
      I2 => topview_line_data_f(11),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[10]_i_4_n_0\
    );
\axi_rdata[10]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(10),
      I1 => lsd_line_data_r(10),
      I2 => topview_line_data_r(11),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[10]_i_5_n_0\
    );
\axi_rdata[10]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(10),
      I2 => lsd_line_data_f(30),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(30),
      O => \axi_rdata[10]_i_6_n_0\
    );
\axi_rdata[10]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(10),
      I2 => lsd_line_data_r(30),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(30),
      O => \axi_rdata[10]_i_7_n_0\
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[11]_i_2_n_0\,
      I1 => \axi_rdata[11]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(11)
    );
\axi_rdata[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(11),
      I1 => slv_reg1(11),
      I2 => slv_reg2(11),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[11]_i_2_n_0\
    );
\axi_rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[11]_i_4_n_0\,
      I1 => \axi_rdata[11]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[11]_i_6_n_0\,
      I5 => \axi_rdata[11]_i_7_n_0\,
      O => \axi_rdata[11]_i_3_n_0\
    );
\axi_rdata[11]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(11),
      I1 => lsd_line_data_f(11),
      I2 => topview_line_data_f(12),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[11]_i_4_n_0\
    );
\axi_rdata[11]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(11),
      I1 => lsd_line_data_r(11),
      I2 => topview_line_data_r(12),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[11]_i_5_n_0\
    );
\axi_rdata[11]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(11),
      I2 => lsd_line_data_f(31),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(31),
      O => \axi_rdata[11]_i_6_n_0\
    );
\axi_rdata[11]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(11),
      I2 => lsd_line_data_r(31),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(31),
      O => \axi_rdata[11]_i_7_n_0\
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[12]_i_2_n_0\,
      I1 => \axi_rdata[12]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(12)
    );
\axi_rdata[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(12),
      I1 => slv_reg1(12),
      I2 => slv_reg2(12),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[12]_i_2_n_0\
    );
\axi_rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[12]_i_4_n_0\,
      I1 => \axi_rdata[12]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[12]_i_6_n_0\,
      I5 => \axi_rdata[12]_i_7_n_0\,
      O => \axi_rdata[12]_i_3_n_0\
    );
\axi_rdata[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(12),
      I1 => lsd_line_data_f(12),
      I2 => topview_line_data_f(13),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[12]_i_4_n_0\
    );
\axi_rdata[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(12),
      I1 => lsd_line_data_r(12),
      I2 => topview_line_data_r(13),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[12]_i_5_n_0\
    );
\axi_rdata[12]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(12),
      I2 => lsd_line_data_f(32),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(32),
      O => \axi_rdata[12]_i_6_n_0\
    );
\axi_rdata[12]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(12),
      I2 => lsd_line_data_r(32),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(32),
      O => \axi_rdata[12]_i_7_n_0\
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[13]_i_2_n_0\,
      I1 => \axi_rdata[13]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(13)
    );
\axi_rdata[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(13),
      I1 => slv_reg1(13),
      I2 => slv_reg2(13),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[13]_i_2_n_0\
    );
\axi_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[13]_i_4_n_0\,
      I1 => \axi_rdata[13]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[13]_i_6_n_0\,
      I5 => \axi_rdata[13]_i_7_n_0\,
      O => \axi_rdata[13]_i_3_n_0\
    );
\axi_rdata[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(13),
      I1 => lsd_line_data_f(13),
      I2 => topview_line_data_f(14),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[13]_i_4_n_0\
    );
\axi_rdata[13]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(13),
      I1 => lsd_line_data_r(13),
      I2 => topview_line_data_r(14),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[13]_i_5_n_0\
    );
\axi_rdata[13]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(13),
      I2 => lsd_line_data_f(33),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(33),
      O => \axi_rdata[13]_i_6_n_0\
    );
\axi_rdata[13]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(13),
      I2 => lsd_line_data_r(33),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(33),
      O => \axi_rdata[13]_i_7_n_0\
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[14]_i_2_n_0\,
      I1 => \axi_rdata[14]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(14)
    );
\axi_rdata[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(14),
      I1 => slv_reg1(14),
      I2 => slv_reg2(14),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[14]_i_2_n_0\
    );
\axi_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[14]_i_4_n_0\,
      I1 => \axi_rdata[14]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[14]_i_6_n_0\,
      I5 => \axi_rdata[14]_i_7_n_0\,
      O => \axi_rdata[14]_i_3_n_0\
    );
\axi_rdata[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(14),
      I1 => lsd_line_data_f(14),
      I2 => topview_line_data_f(15),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[14]_i_4_n_0\
    );
\axi_rdata[14]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(14),
      I1 => lsd_line_data_r(14),
      I2 => topview_line_data_r(15),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[14]_i_5_n_0\
    );
\axi_rdata[14]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(14),
      I2 => lsd_line_data_f(34),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(34),
      O => \axi_rdata[14]_i_6_n_0\
    );
\axi_rdata[14]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(14),
      I2 => lsd_line_data_r(34),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(34),
      O => \axi_rdata[14]_i_7_n_0\
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[15]_i_2_n_0\,
      I1 => \axi_rdata[15]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(15)
    );
\axi_rdata[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(15),
      I1 => slv_reg1(15),
      I2 => slv_reg2(15),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[15]_i_2_n_0\
    );
\axi_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[15]_i_6_n_0\,
      I1 => \axi_rdata[15]_i_7_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[15]_i_8_n_0\,
      I5 => \axi_rdata[15]_i_9_n_0\,
      O => \axi_rdata[15]_i_3_n_0\
    );
\axi_rdata[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEEFEFFFFF"
    )
        port map (
      I0 => slv_reg2(3),
      I1 => \axi_rdata[31]_i_6_n_0\,
      I2 => \axi_rdata[18]_i_6_n_0\,
      I3 => slv_reg2(16),
      I4 => slv_reg2(17),
      I5 => slv_reg2(18),
      O => \axi_rdata[15]_i_4_n_0\
    );
\axi_rdata[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => slv_reg2(14),
      I1 => slv_reg2(15),
      I2 => slv_reg2(13),
      I3 => slv_reg2(12),
      I4 => slv_reg2(11),
      I5 => slv_reg2(10),
      O => \axi_rdata[15]_i_5_n_0\
    );
\axi_rdata[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(15),
      I1 => lsd_line_data_f(15),
      I2 => topview_line_data_f(16),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[15]_i_6_n_0\
    );
\axi_rdata[15]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(15),
      I1 => lsd_line_data_r(15),
      I2 => topview_line_data_r(16),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[15]_i_7_n_0\
    );
\axi_rdata[15]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(15),
      I2 => lsd_line_data_f(35),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(35),
      O => \axi_rdata[15]_i_8_n_0\
    );
\axi_rdata[15]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(15),
      I2 => lsd_line_data_r(35),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(35),
      O => \axi_rdata[15]_i_9_n_0\
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_3_n_0\,
      I2 => \axi_rdata[18]_i_2_n_0\,
      I3 => \axi_rdata[16]_i_2_n_0\,
      I4 => \axi_rdata[16]_i_3_n_0\,
      I5 => \axi_rdata[16]_i_4_n_0\,
      O => reg_data_out(16)
    );
\axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \axi_rdata[16]_i_5_n_0\,
      I1 => topview_line_data_f(36),
      I2 => topview_line_data_f(17),
      I3 => slv_reg2(2),
      I4 => slv_reg2(16),
      I5 => slv_reg2(1),
      O => \axi_rdata[16]_i_2_n_0\
    );
\axi_rdata[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \axi_rdata[16]_i_6_n_0\,
      I1 => topview_line_data_r(36),
      I2 => topview_line_data_r(17),
      I3 => slv_reg2(2),
      I4 => slv_reg2(16),
      I5 => slv_reg2(1),
      O => \axi_rdata[16]_i_3_n_0\
    );
\axi_rdata[16]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0CFA0C0A"
    )
        port map (
      I0 => slv_reg0(16),
      I1 => slv_reg1(16),
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      I4 => slv_reg2(16),
      O => \axi_rdata[16]_i_4_n_0\
    );
\axi_rdata[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7D5A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_f(16),
      I3 => lsd_line_data_f(36),
      I4 => lsd_line_num_f(16),
      I5 => slv_reg2(16),
      O => \axi_rdata[16]_i_5_n_0\
    );
\axi_rdata[16]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7D5A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_r(16),
      I3 => lsd_line_data_r(36),
      I4 => lsd_line_num_r(16),
      I5 => slv_reg2(16),
      O => \axi_rdata[16]_i_6_n_0\
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_3_n_0\,
      I2 => \axi_rdata[18]_i_2_n_0\,
      I3 => \axi_rdata[17]_i_2_n_0\,
      I4 => \axi_rdata[17]_i_3_n_0\,
      I5 => \axi_rdata[17]_i_4_n_0\,
      O => reg_data_out(17)
    );
\axi_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \axi_rdata[17]_i_5_n_0\,
      I1 => topview_line_data_f(37),
      I2 => topview_line_data_f(18),
      I3 => slv_reg2(2),
      I4 => slv_reg2(16),
      I5 => slv_reg2(1),
      O => \axi_rdata[17]_i_2_n_0\
    );
\axi_rdata[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \axi_rdata[17]_i_6_n_0\,
      I1 => topview_line_data_r(37),
      I2 => topview_line_data_r(18),
      I3 => slv_reg2(2),
      I4 => slv_reg2(16),
      I5 => slv_reg2(1),
      O => \axi_rdata[17]_i_3_n_0\
    );
\axi_rdata[17]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(17),
      I1 => slv_reg1(17),
      I2 => slv_reg2(17),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[17]_i_4_n_0\
    );
\axi_rdata[17]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7D5A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_f(17),
      I3 => lsd_line_data_f(37),
      I4 => lsd_line_num_f(17),
      I5 => slv_reg2(16),
      O => \axi_rdata[17]_i_5_n_0\
    );
\axi_rdata[17]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7D5A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_r(17),
      I3 => lsd_line_data_r(37),
      I4 => lsd_line_num_r(17),
      I5 => slv_reg2(16),
      O => \axi_rdata[17]_i_6_n_0\
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_3_n_0\,
      I2 => \axi_rdata[18]_i_2_n_0\,
      I3 => \axi_rdata[18]_i_3_n_0\,
      I4 => \axi_rdata[18]_i_4_n_0\,
      I5 => \axi_rdata[18]_i_5_n_0\,
      O => reg_data_out(18)
    );
\axi_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \axi_rdata[15]_i_5_n_0\,
      I1 => slv_reg2(3),
      I2 => slv_reg2(18),
      I3 => \axi_rdata[31]_i_6_n_0\,
      I4 => \axi_rdata[18]_i_6_n_0\,
      I5 => slv_reg2(17),
      O => \axi_rdata[18]_i_2_n_0\
    );
\axi_rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \axi_rdata[18]_i_7_n_0\,
      I1 => topview_line_data_f(38),
      I2 => topview_line_data_f(19),
      I3 => slv_reg2(2),
      I4 => slv_reg2(16),
      I5 => slv_reg2(1),
      O => \axi_rdata[18]_i_3_n_0\
    );
\axi_rdata[18]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAEEAAAAAA"
    )
        port map (
      I0 => \axi_rdata[18]_i_8_n_0\,
      I1 => topview_line_data_r(38),
      I2 => topview_line_data_r(19),
      I3 => slv_reg2(2),
      I4 => slv_reg2(16),
      I5 => slv_reg2(1),
      O => \axi_rdata[18]_i_4_n_0\
    );
\axi_rdata[18]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(18),
      I1 => slv_reg1(18),
      I2 => slv_reg2(18),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[18]_i_5_n_0\
    );
\axi_rdata[18]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => slv_reg2(1),
      I1 => slv_reg2(2),
      O => \axi_rdata[18]_i_6_n_0\
    );
\axi_rdata[18]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7D5A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_f(18),
      I3 => lsd_line_data_f(38),
      I4 => lsd_line_num_f(18),
      I5 => slv_reg2(16),
      O => \axi_rdata[18]_i_7_n_0\
    );
\axi_rdata[18]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7D5A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_r(18),
      I3 => lsd_line_data_r(38),
      I4 => lsd_line_num_r(18),
      I5 => slv_reg2(16),
      O => \axi_rdata[18]_i_8_n_0\
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAAAAA"
    )
        port map (
      I0 => \axi_rdata[19]_i_2_n_0\,
      I1 => \axi_rdata[19]_i_3_n_0\,
      I2 => \axi_rdata[19]_i_4_n_0\,
      I3 => \axi_rdata[31]_i_3_n_0\,
      I4 => \axi_rdata_reg[19]_i_5_n_0\,
      O => reg_data_out(19)
    );
\axi_rdata[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(19),
      I1 => slv_reg1(19),
      I2 => slv_reg2(19),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[19]_i_2_n_0\
    );
\axi_rdata[19]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEAFFFFF"
    )
        port map (
      I0 => \axi_rdata[31]_i_6_n_0\,
      I1 => slv_reg2(16),
      I2 => slv_reg2(1),
      I3 => slv_reg2(2),
      I4 => slv_reg2(17),
      O => \axi_rdata[19]_i_3_n_0\
    );
\axi_rdata[19]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => slv_reg2(18),
      I1 => slv_reg2(3),
      I2 => \axi_rdata[15]_i_5_n_0\,
      O => \axi_rdata[19]_i_4_n_0\
    );
\axi_rdata[19]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F044444444"
    )
        port map (
      I0 => slv_reg2(16),
      I1 => lsd_line_num_f(19),
      I2 => lsd_line_data_f(39),
      I3 => lsd_line_data_f(19),
      I4 => slv_reg2(1),
      I5 => slv_reg2(2),
      O => \axi_rdata[19]_i_6_n_0\
    );
\axi_rdata[19]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F044444444"
    )
        port map (
      I0 => slv_reg2(16),
      I1 => lsd_line_num_r(19),
      I2 => lsd_line_data_r(39),
      I3 => lsd_line_data_r(19),
      I4 => slv_reg2(1),
      I5 => slv_reg2(2),
      O => \axi_rdata[19]_i_7_n_0\
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABABAAAAAAABAAA"
    )
        port map (
      I0 => \axi_rdata[1]_i_2_n_0\,
      I1 => \axi_rdata[1]_i_3_n_0\,
      I2 => \axi_rdata[1]_i_4_n_0\,
      I3 => \axi_rdata[1]_i_5_n_0\,
      I4 => slv_reg2(0),
      I5 => \axi_rdata[1]_i_6_n_0\,
      O => reg_data_out(1)
    );
\axi_rdata[1]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A000C000"
    )
        port map (
      I0 => topview_line_data_r(2),
      I1 => topview_line_data_r(21),
      I2 => slv_reg2(2),
      I3 => slv_reg2(16),
      I4 => slv_reg2(1),
      O => \axi_rdata[1]_i_10_n_0\
    );
\axi_rdata[1]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000E6C4A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_r(1),
      I3 => lsd_line_data_r(21),
      I4 => lsd_line_num_r(1),
      I5 => slv_reg2(16),
      O => \axi_rdata[1]_i_11_n_0\
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg1(1),
      I2 => slv_reg2(1),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[1]_i_2_n_0\
    );
\axi_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF8A"
    )
        port map (
      I0 => \axi_rdata[18]_i_6_n_0\,
      I1 => slv_reg2(18),
      I2 => slv_reg2(17),
      I3 => slv_reg2(3),
      I4 => \axi_rdata[31]_i_6_n_0\,
      I5 => \axi_rdata[1]_i_7_n_0\,
      O => \axi_rdata[1]_i_3_n_0\
    );
\axi_rdata[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => \axi_rdata[31]_i_9_n_0\,
      I1 => \axi_rdata[31]_i_8_n_0\,
      I2 => \axi_rdata[31]_i_7_n_0\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \axi_rdata[15]_i_5_n_0\,
      O => \axi_rdata[1]_i_4_n_0\
    );
\axi_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAAAAAAA"
    )
        port map (
      I0 => \axi_rdata[1]_i_8_n_0\,
      I1 => slv_reg2(1),
      I2 => slv_reg2(16),
      I3 => slv_reg2(2),
      I4 => topview_line_data_f(2),
      I5 => \axi_rdata[1]_i_9_n_0\,
      O => \axi_rdata[1]_i_5_n_0\
    );
\axi_rdata[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEE"
    )
        port map (
      I0 => \axi_rdata[1]_i_10_n_0\,
      I1 => \axi_rdata[1]_i_11_n_0\,
      I2 => motor_speed_r(1),
      I3 => slv_reg2(18),
      O => \axi_rdata[1]_i_6_n_0\
    );
\axi_rdata[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFF1"
    )
        port map (
      I0 => slv_reg2(18),
      I1 => sw(1),
      I2 => slv_reg2(17),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      I5 => slv_reg2(1),
      O => \axi_rdata[1]_i_7_n_0\
    );
\axi_rdata[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000E6C4A280"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg2(1),
      I2 => lsd_line_data_f(1),
      I3 => lsd_line_data_f(21),
      I4 => lsd_line_num_f(1),
      I5 => slv_reg2(16),
      O => \axi_rdata[1]_i_8_n_0\
    );
\axi_rdata[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080F0800080F080F"
    )
        port map (
      I0 => topview_line_data_f(21),
      I1 => slv_reg2(16),
      I2 => slv_reg2(1),
      I3 => slv_reg2(2),
      I4 => motor_speed_l(1),
      I5 => slv_reg2(18),
      O => \axi_rdata[1]_i_9_n_0\
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(20),
      I4 => lsd_line_num_r(20),
      I5 => \axi_rdata[20]_i_2_n_0\,
      O => reg_data_out(20)
    );
\axi_rdata[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(20),
      I1 => slv_reg1(20),
      I2 => slv_reg2(20),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[20]_i_2_n_0\
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(21),
      I4 => lsd_line_num_r(21),
      I5 => \axi_rdata[21]_i_2_n_0\,
      O => reg_data_out(21)
    );
\axi_rdata[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(21),
      I1 => slv_reg1(21),
      I2 => slv_reg2(21),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[21]_i_2_n_0\
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(22),
      I4 => lsd_line_num_r(22),
      I5 => \axi_rdata[22]_i_2_n_0\,
      O => reg_data_out(22)
    );
\axi_rdata[22]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(22),
      I1 => slv_reg1(22),
      I2 => slv_reg2(22),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[22]_i_2_n_0\
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(23),
      I4 => lsd_line_num_r(23),
      I5 => \axi_rdata[23]_i_2_n_0\,
      O => reg_data_out(23)
    );
\axi_rdata[23]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(23),
      I1 => slv_reg1(23),
      I2 => slv_reg2(23),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[23]_i_2_n_0\
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(24),
      I4 => lsd_line_num_r(24),
      I5 => \axi_rdata[24]_i_2_n_0\,
      O => reg_data_out(24)
    );
\axi_rdata[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(24),
      I1 => slv_reg1(24),
      I2 => slv_reg2(24),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[24]_i_2_n_0\
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(25),
      I4 => lsd_line_num_r(25),
      I5 => \axi_rdata[25]_i_2_n_0\,
      O => reg_data_out(25)
    );
\axi_rdata[25]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(25),
      I1 => slv_reg1(25),
      I2 => slv_reg2(25),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[25]_i_2_n_0\
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(26),
      I4 => lsd_line_num_r(26),
      I5 => \axi_rdata[26]_i_2_n_0\,
      O => reg_data_out(26)
    );
\axi_rdata[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(26),
      I1 => slv_reg1(26),
      I2 => slv_reg2(26),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[26]_i_2_n_0\
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(27),
      I4 => lsd_line_num_r(27),
      I5 => \axi_rdata[27]_i_2_n_0\,
      O => reg_data_out(27)
    );
\axi_rdata[27]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(27),
      I1 => slv_reg1(27),
      I2 => slv_reg2(27),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[27]_i_2_n_0\
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(28),
      I4 => lsd_line_num_r(28),
      I5 => \axi_rdata[28]_i_2_n_0\,
      O => reg_data_out(28)
    );
\axi_rdata[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(28),
      I1 => slv_reg1(28),
      I2 => slv_reg2(28),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[28]_i_2_n_0\
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(29),
      I4 => lsd_line_num_r(29),
      I5 => \axi_rdata[29]_i_2_n_0\,
      O => reg_data_out(29)
    );
\axi_rdata[29]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(29),
      I1 => slv_reg1(29),
      I2 => slv_reg2(29),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[29]_i_2_n_0\
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[2]_i_2_n_0\,
      I1 => \axi_rdata[2]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(2)
    );
\axi_rdata[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg1(2),
      I2 => slv_reg2(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[2]_i_2_n_0\
    );
\axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[2]_i_4_n_0\,
      I1 => \axi_rdata[2]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[2]_i_6_n_0\,
      I5 => \axi_rdata[2]_i_7_n_0\,
      O => \axi_rdata[2]_i_3_n_0\
    );
\axi_rdata[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(2),
      I1 => lsd_line_data_f(2),
      I2 => topview_line_data_f(3),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[2]_i_4_n_0\
    );
\axi_rdata[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(2),
      I1 => lsd_line_data_r(2),
      I2 => topview_line_data_r(3),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[2]_i_5_n_0\
    );
\axi_rdata[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(2),
      I2 => lsd_line_data_f(22),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(22),
      O => \axi_rdata[2]_i_6_n_0\
    );
\axi_rdata[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(2),
      I2 => lsd_line_data_r(22),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(22),
      O => \axi_rdata[2]_i_7_n_0\
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(30),
      I4 => lsd_line_num_r(30),
      I5 => \axi_rdata[30]_i_2_n_0\,
      O => reg_data_out(30)
    );
\axi_rdata[30]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(30),
      I1 => slv_reg1(30),
      I2 => slv_reg2(30),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[30]_i_2_n_0\
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0804000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => \axi_rdata[31]_i_2_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => lsd_line_num_f(31),
      I4 => lsd_line_num_r(31),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => reg_data_out(31)
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \axi_rdata[31]_i_5_n_0\,
      I1 => \axi_rdata[15]_i_5_n_0\,
      I2 => \axi_rdata[31]_i_6_n_0\,
      I3 => slv_reg2(16),
      O => \axi_rdata[31]_i_2_n_0\
    );
\axi_rdata[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => axi_araddr(3),
      I1 => axi_araddr(2),
      I2 => \axi_rdata[31]_i_7_n_0\,
      I3 => \axi_rdata[31]_i_8_n_0\,
      I4 => \axi_rdata[31]_i_9_n_0\,
      O => \axi_rdata[31]_i_3_n_0\
    );
\axi_rdata[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(31),
      I1 => slv_reg1(31),
      I2 => slv_reg2(31),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[31]_i_4_n_0\
    );
\axi_rdata[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => slv_reg2(1),
      I1 => slv_reg2(2),
      I2 => slv_reg2(18),
      I3 => slv_reg2(3),
      I4 => slv_reg2(17),
      O => \axi_rdata[31]_i_5_n_0\
    );
\axi_rdata[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => slv_reg2(9),
      I1 => slv_reg2(8),
      I2 => slv_reg2(7),
      I3 => slv_reg2(6),
      I4 => slv_reg2(4),
      I5 => slv_reg2(5),
      O => \axi_rdata[31]_i_6_n_0\
    );
\axi_rdata[31]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => slv_reg2(20),
      I1 => slv_reg2(30),
      I2 => slv_reg2(29),
      I3 => slv_reg2(22),
      I4 => slv_reg2(19),
      O => \axi_rdata[31]_i_7_n_0\
    );
\axi_rdata[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => slv_reg2(24),
      I1 => slv_reg2(21),
      I2 => slv_reg2(26),
      I3 => slv_reg2(23),
      O => \axi_rdata[31]_i_8_n_0\
    );
\axi_rdata[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => slv_reg2(31),
      I1 => slv_reg2(25),
      I2 => slv_reg2(27),
      I3 => slv_reg2(28),
      O => \axi_rdata[31]_i_9_n_0\
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[3]_i_2_n_0\,
      I1 => \axi_rdata[3]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(3)
    );
\axi_rdata[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(3),
      I1 => slv_reg1(3),
      I2 => slv_reg2(3),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[3]_i_2_n_0\
    );
\axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[3]_i_4_n_0\,
      I1 => \axi_rdata[3]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[3]_i_6_n_0\,
      I5 => \axi_rdata[3]_i_7_n_0\,
      O => \axi_rdata[3]_i_3_n_0\
    );
\axi_rdata[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(3),
      I1 => lsd_line_data_f(3),
      I2 => topview_line_data_f(4),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[3]_i_4_n_0\
    );
\axi_rdata[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(3),
      I1 => lsd_line_data_r(3),
      I2 => topview_line_data_r(4),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[3]_i_5_n_0\
    );
\axi_rdata[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(3),
      I2 => lsd_line_data_f(23),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(23),
      O => \axi_rdata[3]_i_6_n_0\
    );
\axi_rdata[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(3),
      I2 => lsd_line_data_r(23),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(23),
      O => \axi_rdata[3]_i_7_n_0\
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[4]_i_2_n_0\,
      I1 => \axi_rdata[4]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(4)
    );
\axi_rdata[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(4),
      I1 => slv_reg1(4),
      I2 => slv_reg2(4),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[4]_i_2_n_0\
    );
\axi_rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[4]_i_4_n_0\,
      I1 => \axi_rdata[4]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[4]_i_6_n_0\,
      I5 => \axi_rdata[4]_i_7_n_0\,
      O => \axi_rdata[4]_i_3_n_0\
    );
\axi_rdata[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(4),
      I1 => lsd_line_data_f(4),
      I2 => topview_line_data_f(5),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[4]_i_4_n_0\
    );
\axi_rdata[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(4),
      I1 => lsd_line_data_r(4),
      I2 => topview_line_data_r(5),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[4]_i_5_n_0\
    );
\axi_rdata[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(4),
      I2 => lsd_line_data_f(24),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(24),
      O => \axi_rdata[4]_i_6_n_0\
    );
\axi_rdata[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(4),
      I2 => lsd_line_data_r(24),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(24),
      O => \axi_rdata[4]_i_7_n_0\
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[5]_i_2_n_0\,
      I1 => \axi_rdata[5]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(5)
    );
\axi_rdata[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(5),
      I1 => slv_reg1(5),
      I2 => slv_reg2(5),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[5]_i_2_n_0\
    );
\axi_rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[5]_i_4_n_0\,
      I1 => \axi_rdata[5]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[5]_i_6_n_0\,
      I5 => \axi_rdata[5]_i_7_n_0\,
      O => \axi_rdata[5]_i_3_n_0\
    );
\axi_rdata[5]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(5),
      I1 => lsd_line_data_f(5),
      I2 => topview_line_data_f(6),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[5]_i_4_n_0\
    );
\axi_rdata[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(5),
      I1 => lsd_line_data_r(5),
      I2 => topview_line_data_r(6),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[5]_i_5_n_0\
    );
\axi_rdata[5]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(5),
      I2 => lsd_line_data_f(25),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(25),
      O => \axi_rdata[5]_i_6_n_0\
    );
\axi_rdata[5]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(5),
      I2 => lsd_line_data_r(25),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(25),
      O => \axi_rdata[5]_i_7_n_0\
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[6]_i_2_n_0\,
      I1 => \axi_rdata[6]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(6)
    );
\axi_rdata[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(6),
      I1 => slv_reg1(6),
      I2 => slv_reg2(6),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[6]_i_2_n_0\
    );
\axi_rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[6]_i_4_n_0\,
      I1 => \axi_rdata[6]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[6]_i_6_n_0\,
      I5 => \axi_rdata[6]_i_7_n_0\,
      O => \axi_rdata[6]_i_3_n_0\
    );
\axi_rdata[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(6),
      I1 => lsd_line_data_f(6),
      I2 => topview_line_data_f(7),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[6]_i_4_n_0\
    );
\axi_rdata[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(6),
      I1 => lsd_line_data_r(6),
      I2 => topview_line_data_r(7),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[6]_i_5_n_0\
    );
\axi_rdata[6]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(6),
      I2 => lsd_line_data_f(26),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(26),
      O => \axi_rdata[6]_i_6_n_0\
    );
\axi_rdata[6]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(6),
      I2 => lsd_line_data_r(26),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(26),
      O => \axi_rdata[6]_i_7_n_0\
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[7]_i_2_n_0\,
      I1 => \axi_rdata[7]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(7)
    );
\axi_rdata[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(7),
      I1 => slv_reg1(7),
      I2 => slv_reg2(7),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[7]_i_2_n_0\
    );
\axi_rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[7]_i_4_n_0\,
      I1 => \axi_rdata[7]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[7]_i_6_n_0\,
      I5 => \axi_rdata[7]_i_7_n_0\,
      O => \axi_rdata[7]_i_3_n_0\
    );
\axi_rdata[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(7),
      I1 => lsd_line_data_f(7),
      I2 => topview_line_data_f(8),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[7]_i_4_n_0\
    );
\axi_rdata[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(7),
      I1 => lsd_line_data_r(7),
      I2 => topview_line_data_r(8),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[7]_i_5_n_0\
    );
\axi_rdata[7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(7),
      I2 => lsd_line_data_f(27),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(27),
      O => \axi_rdata[7]_i_6_n_0\
    );
\axi_rdata[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(7),
      I2 => lsd_line_data_r(27),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(27),
      O => \axi_rdata[7]_i_7_n_0\
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[8]_i_2_n_0\,
      I1 => \axi_rdata[8]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(8)
    );
\axi_rdata[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(8),
      I1 => slv_reg1(8),
      I2 => slv_reg2(8),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[8]_i_2_n_0\
    );
\axi_rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[8]_i_4_n_0\,
      I1 => \axi_rdata[8]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[8]_i_6_n_0\,
      I5 => \axi_rdata[8]_i_7_n_0\,
      O => \axi_rdata[8]_i_3_n_0\
    );
\axi_rdata[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(8),
      I1 => lsd_line_data_f(8),
      I2 => topview_line_data_f(9),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[8]_i_4_n_0\
    );
\axi_rdata[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(8),
      I1 => lsd_line_data_r(8),
      I2 => topview_line_data_r(9),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[8]_i_5_n_0\
    );
\axi_rdata[8]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(8),
      I2 => lsd_line_data_f(28),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(28),
      O => \axi_rdata[8]_i_6_n_0\
    );
\axi_rdata[8]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(8),
      I2 => lsd_line_data_r(28),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(28),
      O => \axi_rdata[8]_i_7_n_0\
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => \axi_rdata[9]_i_2_n_0\,
      I1 => \axi_rdata[9]_i_3_n_0\,
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => \axi_rdata[15]_i_4_n_0\,
      I4 => \axi_rdata[15]_i_5_n_0\,
      O => reg_data_out(9)
    );
\axi_rdata[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => slv_reg0(9),
      I1 => slv_reg1(9),
      I2 => slv_reg2(9),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      O => \axi_rdata[9]_i_2_n_0\
    );
\axi_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \axi_rdata[9]_i_4_n_0\,
      I1 => \axi_rdata[9]_i_5_n_0\,
      I2 => slv_reg2(1),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[9]_i_6_n_0\,
      I5 => \axi_rdata[9]_i_7_n_0\,
      O => \axi_rdata[9]_i_3_n_0\
    );
\axi_rdata[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_f(9),
      I1 => lsd_line_data_f(9),
      I2 => topview_line_data_f(10),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[9]_i_4_n_0\
    );
\axi_rdata[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CC00AA"
    )
        port map (
      I0 => lsd_line_num_r(9),
      I1 => lsd_line_data_r(9),
      I2 => topview_line_data_r(10),
      I3 => slv_reg2(16),
      I4 => slv_reg2(2),
      O => \axi_rdata[9]_i_5_n_0\
    );
\axi_rdata[9]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_l(9),
      I2 => lsd_line_data_f(29),
      I3 => slv_reg2(16),
      I4 => topview_line_data_f(29),
      O => \axi_rdata[9]_i_6_n_0\
    );
\axi_rdata[9]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => motor_speed_r(9),
      I2 => lsd_line_data_r(29),
      I3 => slv_reg2(16),
      I4 => topview_line_data_r(29),
      O => \axi_rdata[9]_i_7_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[19]_i_6_n_0\,
      I1 => \axi_rdata[19]_i_7_n_0\,
      O => \axi_rdata_reg[19]_i_5_n_0\,
      S => slv_reg2(0)
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_wready\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => axi_awready_i_1_n_0
    );
\kl_accel_reg_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(0)
    );
\kl_accel_reg_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(1)
    );
\kl_accel_reg_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(2)
    );
\kl_accel_reg_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(3)
    );
\kl_accel_reg_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(4)
    );
\kl_accel_reg_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(5)
    );
\kl_accel_reg_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \kl_accel_reg_reg[6]_i_1_n_0\,
      GE => '1',
      Q => kl_accel(6)
    );
\kl_accel_reg_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => \led_reg_reg[3]_i_2_n_0\,
      I1 => \kl_accel_reg_reg[6]_i_2_n_0\,
      I2 => slv_reg0(18),
      I3 => slv_reg0(1),
      I4 => sccb_req_reg_reg_i_2_n_0,
      I5 => sccb_req_reg_reg_i_4_n_0,
      O => \kl_accel_reg_reg[6]_i_1_n_0\
    );
\kl_accel_reg_reg[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => slv_reg0(16),
      I1 => slv_reg0(17),
      O => \kl_accel_reg_reg[6]_i_2_n_0\
    );
\kl_steer_reg_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(0)
    );
\kl_steer_reg_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(1)
    );
\kl_steer_reg_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(2)
    );
\kl_steer_reg_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(3)
    );
\kl_steer_reg_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(4)
    );
\kl_steer_reg_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(5)
    );
\kl_steer_reg_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(6)
    );
\kl_steer_reg_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(7),
      G => \kl_steer_reg_reg[7]_i_1_n_0\,
      GE => '1',
      Q => kl_steer(7)
    );
\kl_steer_reg_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \led_reg_reg[3]_i_2_n_0\,
      I1 => \kl_accel_reg_reg[6]_i_2_n_0\,
      I2 => slv_reg0(0),
      I3 => slv_reg0(18),
      I4 => sccb_req_reg_reg_i_2_n_0,
      I5 => \sccb_send_data_reg_reg[23]_i_2_n_0\,
      O => \kl_steer_reg_reg[7]_i_1_n_0\
    );
\led_reg_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \led_reg_reg[3]_i_1_n_0\,
      GE => '1',
      Q => led(0)
    );
\led_reg_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \led_reg_reg[3]_i_1_n_0\,
      GE => '1',
      Q => led(1)
    );
\led_reg_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \led_reg_reg[3]_i_1_n_0\,
      GE => '1',
      Q => led(2)
    );
\led_reg_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \led_reg_reg[3]_i_1_n_0\,
      GE => '1',
      Q => led(3)
    );
\led_reg_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => \led_reg_reg[3]_i_2_n_0\,
      I1 => \led_reg_reg[3]_i_3_n_0\,
      I2 => \led_reg_reg[3]_i_4_n_0\,
      I3 => slv_reg0(0),
      I4 => slv_reg0(1),
      I5 => slv_reg0(2),
      O => \led_reg_reg[3]_i_1_n_0\
    );
\led_reg_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \led_reg_reg[3]_i_5_n_0\,
      I1 => slv_reg0(21),
      I2 => slv_reg0(20),
      I3 => slv_reg0(19),
      I4 => \led_reg_reg[3]_i_6_n_0\,
      O => \led_reg_reg[3]_i_2_n_0\
    );
\led_reg_reg[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => slv_reg0(15),
      I1 => slv_reg0(16),
      I2 => slv_reg0(17),
      I3 => slv_reg0(18),
      I4 => \led_reg_reg[3]_i_7_n_0\,
      O => \led_reg_reg[3]_i_3_n_0\
    );
\led_reg_reg[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => slv_reg0(3),
      I1 => slv_reg0(4),
      I2 => slv_reg0(5),
      I3 => slv_reg0(6),
      I4 => \led_reg_reg[3]_i_8_n_0\,
      O => \led_reg_reg[3]_i_4_n_0\
    );
\led_reg_reg[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => slv_reg0(25),
      I1 => slv_reg0(24),
      I2 => slv_reg0(23),
      I3 => slv_reg0(22),
      O => \led_reg_reg[3]_i_5_n_0\
    );
\led_reg_reg[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => slv_reg0(26),
      I1 => slv_reg0(27),
      I2 => slv_reg0(28),
      I3 => slv_reg0(29),
      I4 => slv_reg0(31),
      I5 => slv_reg0(30),
      O => \led_reg_reg[3]_i_6_n_0\
    );
\led_reg_reg[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => slv_reg0(14),
      I1 => slv_reg0(13),
      I2 => slv_reg0(12),
      I3 => slv_reg0(11),
      O => \led_reg_reg[3]_i_7_n_0\
    );
\led_reg_reg[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => slv_reg0(10),
      I1 => slv_reg0(9),
      I2 => slv_reg0(8),
      I3 => slv_reg0(7),
      O => \led_reg_reg[3]_i_8_n_0\
    );
\lsd_line_addr_reg_f_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(0)
    );
\lsd_line_addr_reg_f_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(10),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(10)
    );
\lsd_line_addr_reg_f_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(11),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(11)
    );
\lsd_line_addr_reg_f_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(12),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(12)
    );
\lsd_line_addr_reg_f_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(13),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(13)
    );
\lsd_line_addr_reg_f_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(14),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(14)
    );
\lsd_line_addr_reg_f_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(15),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(15)
    );
\lsd_line_addr_reg_f_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(16),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(16)
    );
\lsd_line_addr_reg_f_reg[17]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(17),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(17)
    );
\lsd_line_addr_reg_f_reg[18]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(18),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(18)
    );
\lsd_line_addr_reg_f_reg[19]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(19),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(19)
    );
\lsd_line_addr_reg_f_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(1)
    );
\lsd_line_addr_reg_f_reg[20]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(20),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(20)
    );
\lsd_line_addr_reg_f_reg[21]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(21),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(21)
    );
\lsd_line_addr_reg_f_reg[22]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(22),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(22)
    );
\lsd_line_addr_reg_f_reg[23]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(23),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(23)
    );
\lsd_line_addr_reg_f_reg[24]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(24),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(24)
    );
\lsd_line_addr_reg_f_reg[25]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(25),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(25)
    );
\lsd_line_addr_reg_f_reg[26]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(26),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(26)
    );
\lsd_line_addr_reg_f_reg[27]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(27),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(27)
    );
\lsd_line_addr_reg_f_reg[28]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(28),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(28)
    );
\lsd_line_addr_reg_f_reg[29]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(29),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(29)
    );
\lsd_line_addr_reg_f_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(2)
    );
\lsd_line_addr_reg_f_reg[30]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(30),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(30)
    );
\lsd_line_addr_reg_f_reg[31]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(31),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(31)
    );
\lsd_line_addr_reg_f_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => sccb_req_reg_reg_i_2_n_0,
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      I3 => slv_reg0(17),
      I4 => sccb_req_reg_reg_i_3_n_0,
      I5 => \lsd_line_addr_reg_f_reg[31]_i_2_n_0\,
      O => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\
    );
\lsd_line_addr_reg_f_reg[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => sccb_req_reg_reg_i_6_n_0,
      I1 => slv_reg0(15),
      I2 => slv_reg0(13),
      I3 => slv_reg0(14),
      I4 => slv_reg0(16),
      O => \lsd_line_addr_reg_f_reg[31]_i_2_n_0\
    );
\lsd_line_addr_reg_f_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(3)
    );
\lsd_line_addr_reg_f_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(4)
    );
\lsd_line_addr_reg_f_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(5)
    );
\lsd_line_addr_reg_f_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(6)
    );
\lsd_line_addr_reg_f_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(7),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(7)
    );
\lsd_line_addr_reg_f_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(8),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(8)
    );
\lsd_line_addr_reg_f_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(9),
      G => \lsd_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_f(9)
    );
\lsd_line_addr_reg_r_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(0)
    );
\lsd_line_addr_reg_r_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(10),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(10)
    );
\lsd_line_addr_reg_r_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(11),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(11)
    );
\lsd_line_addr_reg_r_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(12),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(12)
    );
\lsd_line_addr_reg_r_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(13),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(13)
    );
\lsd_line_addr_reg_r_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(14),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(14)
    );
\lsd_line_addr_reg_r_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(15),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(15)
    );
\lsd_line_addr_reg_r_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(16),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(16)
    );
\lsd_line_addr_reg_r_reg[17]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(17),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(17)
    );
\lsd_line_addr_reg_r_reg[18]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(18),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(18)
    );
\lsd_line_addr_reg_r_reg[19]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(19),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(19)
    );
\lsd_line_addr_reg_r_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(1)
    );
\lsd_line_addr_reg_r_reg[20]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(20),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(20)
    );
\lsd_line_addr_reg_r_reg[21]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(21),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(21)
    );
\lsd_line_addr_reg_r_reg[22]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(22),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(22)
    );
\lsd_line_addr_reg_r_reg[23]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(23),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(23)
    );
\lsd_line_addr_reg_r_reg[24]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(24),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(24)
    );
\lsd_line_addr_reg_r_reg[25]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(25),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(25)
    );
\lsd_line_addr_reg_r_reg[26]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(26),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(26)
    );
\lsd_line_addr_reg_r_reg[27]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(27),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(27)
    );
\lsd_line_addr_reg_r_reg[28]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(28),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(28)
    );
\lsd_line_addr_reg_r_reg[29]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(29),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(29)
    );
\lsd_line_addr_reg_r_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(2)
    );
\lsd_line_addr_reg_r_reg[30]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(30),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(30)
    );
\lsd_line_addr_reg_r_reg[31]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(31),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(31)
    );
\lsd_line_addr_reg_r_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => \lsd_line_addr_reg_f_reg[31]_i_2_n_0\,
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      I3 => sccb_req_reg_reg_i_3_n_0,
      I4 => slv_reg0(17),
      I5 => sccb_req_reg_reg_i_2_n_0,
      O => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\
    );
\lsd_line_addr_reg_r_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(3)
    );
\lsd_line_addr_reg_r_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(4)
    );
\lsd_line_addr_reg_r_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(5)
    );
\lsd_line_addr_reg_r_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(6)
    );
\lsd_line_addr_reg_r_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(7),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(7)
    );
\lsd_line_addr_reg_r_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(8),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(8)
    );
\lsd_line_addr_reg_r_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(9),
      G => \lsd_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => lsd_line_addr_r(9)
    );
sccb_req_reg_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => sccb_req_reg_reg_i_1_n_0,
      GE => '1',
      Q => sccb_req
    );
sccb_req_reg_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => sccb_req_reg_reg_i_2_n_0,
      I1 => slv_reg0(1),
      I2 => sccb_req_reg_reg_i_3_n_0,
      I3 => slv_reg0(17),
      I4 => slv_reg0(16),
      I5 => sccb_req_reg_reg_i_4_n_0,
      O => sccb_req_reg_reg_i_1_n_0
    );
sccb_req_reg_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => slv_reg0(4),
      I1 => slv_reg0(3),
      I2 => slv_reg0(2),
      I3 => sccb_req_reg_reg_i_5_n_0,
      I4 => slv_reg0(5),
      I5 => slv_reg0(6),
      O => sccb_req_reg_reg_i_2_n_0
    );
sccb_req_reg_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000020000"
    )
        port map (
      I0 => \led_reg_reg[3]_i_6_n_0\,
      I1 => slv_reg0(19),
      I2 => slv_reg0(20),
      I3 => slv_reg0(21),
      I4 => \led_reg_reg[3]_i_5_n_0\,
      I5 => slv_reg0(18),
      O => sccb_req_reg_reg_i_3_n_0
    );
sccb_req_reg_reg_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => sccb_req_reg_reg_i_6_n_0,
      I1 => slv_reg0(15),
      I2 => slv_reg0(13),
      I3 => slv_reg0(14),
      I4 => slv_reg0(0),
      O => sccb_req_reg_reg_i_4_n_0
    );
sccb_req_reg_reg_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slv_reg0(7),
      I1 => slv_reg0(8),
      O => sccb_req_reg_reg_i_5_n_0
    );
sccb_req_reg_reg_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => slv_reg0(10),
      I1 => slv_reg0(9),
      I2 => slv_reg0(12),
      I3 => slv_reg0(11),
      O => sccb_req_reg_reg_i_6_n_0
    );
\sccb_send_data_reg_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(0)
    );
\sccb_send_data_reg_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(10),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(10)
    );
\sccb_send_data_reg_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(11),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(11)
    );
\sccb_send_data_reg_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(12),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(12)
    );
\sccb_send_data_reg_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(13),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(13)
    );
\sccb_send_data_reg_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(14),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(14)
    );
\sccb_send_data_reg_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(15),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(15)
    );
\sccb_send_data_reg_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(16),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(16)
    );
\sccb_send_data_reg_reg[17]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(17),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(17)
    );
\sccb_send_data_reg_reg[18]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(18),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(18)
    );
\sccb_send_data_reg_reg[19]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(19),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(19)
    );
\sccb_send_data_reg_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(1)
    );
\sccb_send_data_reg_reg[20]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(20),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(20)
    );
\sccb_send_data_reg_reg[21]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(21),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(21)
    );
\sccb_send_data_reg_reg[22]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(22),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(22)
    );
\sccb_send_data_reg_reg[23]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(23),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(23)
    );
\sccb_send_data_reg_reg[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => sccb_req_reg_reg_i_2_n_0,
      I1 => slv_reg0(0),
      I2 => slv_reg0(16),
      I3 => slv_reg0(17),
      I4 => sccb_req_reg_reg_i_3_n_0,
      I5 => \sccb_send_data_reg_reg[23]_i_2_n_0\,
      O => \sccb_send_data_reg_reg[23]_i_1_n_0\
    );
\sccb_send_data_reg_reg[23]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => sccb_req_reg_reg_i_6_n_0,
      I1 => slv_reg0(15),
      I2 => slv_reg0(13),
      I3 => slv_reg0(14),
      I4 => slv_reg0(1),
      O => \sccb_send_data_reg_reg[23]_i_2_n_0\
    );
\sccb_send_data_reg_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(2)
    );
\sccb_send_data_reg_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(3)
    );
\sccb_send_data_reg_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(4)
    );
\sccb_send_data_reg_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(5)
    );
\sccb_send_data_reg_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(6)
    );
\sccb_send_data_reg_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(7),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(7)
    );
\sccb_send_data_reg_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(8),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(8)
    );
\sccb_send_data_reg_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(9),
      G => \sccb_send_data_reg_reg[23]_i_1_n_0\,
      GE => '1',
      Q => sccb_send_data(9)
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      O => \slv_reg0[15]_i_1_n_0\
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      O => \slv_reg0[23]_i_1_n_0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => \^s_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      O => \slv_reg0[7]_i_1_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg0(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg0(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg0(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg0(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg0(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg0(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg0(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg0(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg0(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg0(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg0(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg0(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg0(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg0(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg0(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg0(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg0(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg0(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg0(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg0(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg0(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg0(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg0(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg0(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg0(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg0(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg0(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg0(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg0(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg0(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg0(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg1(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg1(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg1(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg1(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg1(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg1(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg1(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg1(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg1(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg1(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg1(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg1(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg1(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg1(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg1(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg1(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg1(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg1(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg1(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg1(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg1(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg1(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg1(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg1(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg1(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg1(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg1(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg1(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg1(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg1(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg1(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg1(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(0),
      O => p_1_in(8)
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(0),
      O => p_1_in(19)
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(0),
      O => p_1_in(24)
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(0),
      O => p_1_in(0)
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(0),
      Q => slv_reg2(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(10),
      Q => slv_reg2(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(11),
      Q => slv_reg2(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(12),
      Q => slv_reg2(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(13),
      Q => slv_reg2(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(14),
      Q => slv_reg2(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(15),
      Q => slv_reg2(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(16),
      Q => slv_reg2(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(17),
      Q => slv_reg2(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(18),
      Q => slv_reg2(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(19),
      Q => slv_reg2(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(1),
      Q => slv_reg2(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(20),
      Q => slv_reg2(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(21),
      Q => slv_reg2(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(22),
      Q => slv_reg2(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(19),
      D => s00_axi_wdata(23),
      Q => slv_reg2(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(24),
      Q => slv_reg2(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(25),
      Q => slv_reg2(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(26),
      Q => slv_reg2(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(27),
      Q => slv_reg2(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(28),
      Q => slv_reg2(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(29),
      Q => slv_reg2(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(2),
      Q => slv_reg2(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(30),
      Q => slv_reg2(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(31),
      Q => slv_reg2(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => slv_reg2(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => slv_reg2(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => slv_reg2(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => slv_reg2(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => slv_reg2(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(8),
      Q => slv_reg2(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(9),
      Q => slv_reg2(9),
      R => axi_awready_i_1_n_0
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s_axi_arready\,
      O => \slv_reg_rden__0\
    );
\topview_line_addr_reg_f_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(0)
    );
\topview_line_addr_reg_f_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(10),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(10)
    );
\topview_line_addr_reg_f_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(11),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(11)
    );
\topview_line_addr_reg_f_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(12),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(12)
    );
\topview_line_addr_reg_f_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(13),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(13)
    );
\topview_line_addr_reg_f_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(14),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(14)
    );
\topview_line_addr_reg_f_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(15),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(15)
    );
\topview_line_addr_reg_f_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(16),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(16)
    );
\topview_line_addr_reg_f_reg[17]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(17),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(17)
    );
\topview_line_addr_reg_f_reg[18]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(18),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(18)
    );
\topview_line_addr_reg_f_reg[19]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(19),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(19)
    );
\topview_line_addr_reg_f_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(1)
    );
\topview_line_addr_reg_f_reg[20]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(20),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(20)
    );
\topview_line_addr_reg_f_reg[21]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(21),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(21)
    );
\topview_line_addr_reg_f_reg[22]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(22),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(22)
    );
\topview_line_addr_reg_f_reg[23]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(23),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(23)
    );
\topview_line_addr_reg_f_reg[24]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(24),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(24)
    );
\topview_line_addr_reg_f_reg[25]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(25),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(25)
    );
\topview_line_addr_reg_f_reg[26]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(26),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(26)
    );
\topview_line_addr_reg_f_reg[27]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(27),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(27)
    );
\topview_line_addr_reg_f_reg[28]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(28),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(28)
    );
\topview_line_addr_reg_f_reg[29]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(29),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(29)
    );
\topview_line_addr_reg_f_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(2)
    );
\topview_line_addr_reg_f_reg[30]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(30),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(30)
    );
\topview_line_addr_reg_f_reg[31]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(31),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(31)
    );
\topview_line_addr_reg_f_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => sccb_req_reg_reg_i_4_n_0,
      I1 => slv_reg0(1),
      I2 => slv_reg0(16),
      I3 => sccb_req_reg_reg_i_3_n_0,
      I4 => slv_reg0(17),
      I5 => sccb_req_reg_reg_i_2_n_0,
      O => \topview_line_addr_reg_f_reg[31]_i_1_n_0\
    );
\topview_line_addr_reg_f_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(3)
    );
\topview_line_addr_reg_f_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(4)
    );
\topview_line_addr_reg_f_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(5)
    );
\topview_line_addr_reg_f_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(6)
    );
\topview_line_addr_reg_f_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(7),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(7)
    );
\topview_line_addr_reg_f_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(8),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(8)
    );
\topview_line_addr_reg_f_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(9),
      G => \topview_line_addr_reg_f_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_f(9)
    );
\topview_line_addr_reg_r_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(0),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(0)
    );
\topview_line_addr_reg_r_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(10),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(10)
    );
\topview_line_addr_reg_r_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(11),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(11)
    );
\topview_line_addr_reg_r_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(12),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(12)
    );
\topview_line_addr_reg_r_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(13),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(13)
    );
\topview_line_addr_reg_r_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(14),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(14)
    );
\topview_line_addr_reg_r_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(15),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(15)
    );
\topview_line_addr_reg_r_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(16),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(16)
    );
\topview_line_addr_reg_r_reg[17]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(17),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(17)
    );
\topview_line_addr_reg_r_reg[18]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(18),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(18)
    );
\topview_line_addr_reg_r_reg[19]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(19),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(19)
    );
\topview_line_addr_reg_r_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(1),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(1)
    );
\topview_line_addr_reg_r_reg[20]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(20),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(20)
    );
\topview_line_addr_reg_r_reg[21]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(21),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(21)
    );
\topview_line_addr_reg_r_reg[22]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(22),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(22)
    );
\topview_line_addr_reg_r_reg[23]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(23),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(23)
    );
\topview_line_addr_reg_r_reg[24]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(24),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(24)
    );
\topview_line_addr_reg_r_reg[25]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(25),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(25)
    );
\topview_line_addr_reg_r_reg[26]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(26),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(26)
    );
\topview_line_addr_reg_r_reg[27]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(27),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(27)
    );
\topview_line_addr_reg_r_reg[28]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(28),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(28)
    );
\topview_line_addr_reg_r_reg[29]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(29),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(29)
    );
\topview_line_addr_reg_r_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(2),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(2)
    );
\topview_line_addr_reg_r_reg[30]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(30),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(30)
    );
\topview_line_addr_reg_r_reg[31]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(31),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(31)
    );
\topview_line_addr_reg_r_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => sccb_req_reg_reg_i_2_n_0,
      I1 => slv_reg0(0),
      I2 => slv_reg0(16),
      I3 => slv_reg0(17),
      I4 => sccb_req_reg_reg_i_3_n_0,
      I5 => \sccb_send_data_reg_reg[23]_i_2_n_0\,
      O => \topview_line_addr_reg_r_reg[31]_i_1_n_0\
    );
\topview_line_addr_reg_r_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(3),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(3)
    );
\topview_line_addr_reg_r_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(4),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(4)
    );
\topview_line_addr_reg_r_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(5),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(5)
    );
\topview_line_addr_reg_r_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(6),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(6)
    );
\topview_line_addr_reg_r_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(7),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(7)
    );
\topview_line_addr_reg_r_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(8),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(8)
    );
\topview_line_addr_reg_r_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => slv_reg1(9),
      G => \topview_line_addr_reg_r_reg[31]_i_1_n_0\,
      GE => '1',
      Q => topview_line_addr_r(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0 is
  port (
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sccb_req : out STD_LOGIC;
    sccb_send_data : out STD_LOGIC_VECTOR ( 23 downto 0 );
    lsd_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_addr_f : out STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_addr_r : out STD_LOGIC_VECTOR ( 31 downto 0 );
    kl_accel : out STD_LOGIC_VECTOR ( 6 downto 0 );
    kl_steer : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    lsd_line_num_f : in STD_LOGIC_VECTOR ( 31 downto 0 );
    lsd_line_num_r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    topview_line_data_f : in STD_LOGIC_VECTOR ( 38 downto 0 );
    motor_speed_l : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 );
    topview_line_data_r : in STD_LOGIC_VECTOR ( 38 downto 0 );
    lsd_line_data_r : in STD_LOGIC_VECTOR ( 39 downto 0 );
    topview_ready_r : in STD_LOGIC;
    lsd_ready_r : in STD_LOGIC;
    topview_ready_f : in STD_LOGIC;
    lsd_ready_f : in STD_LOGIC;
    lsd_line_data_f : in STD_LOGIC_VECTOR ( 39 downto 0 );
    motor_speed_r : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sccb_busy : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0 is
begin
pspl_comm_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0_S00_AXI
     port map (
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WREADY => S_AXI_WREADY,
      kl_accel(6 downto 0) => kl_accel(6 downto 0),
      kl_steer(7 downto 0) => kl_steer(7 downto 0),
      led(3 downto 0) => led(3 downto 0),
      lsd_line_addr_f(31 downto 0) => lsd_line_addr_f(31 downto 0),
      lsd_line_addr_r(31 downto 0) => lsd_line_addr_r(31 downto 0),
      lsd_line_data_f(39 downto 0) => lsd_line_data_f(39 downto 0),
      lsd_line_data_r(39 downto 0) => lsd_line_data_r(39 downto 0),
      lsd_line_num_f(31 downto 0) => lsd_line_num_f(31 downto 0),
      lsd_line_num_r(31 downto 0) => lsd_line_num_r(31 downto 0),
      lsd_ready_f => lsd_ready_f,
      lsd_ready_r => lsd_ready_r,
      motor_speed_l(15 downto 0) => motor_speed_l(15 downto 0),
      motor_speed_r(15 downto 0) => motor_speed_r(15 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      sccb_busy => sccb_busy,
      sccb_req => sccb_req,
      sccb_send_data(23 downto 0) => sccb_send_data(23 downto 0),
      sw(1 downto 0) => sw(1 downto 0),
      topview_line_addr_f(31 downto 0) => topview_line_addr_f(31 downto 0),
      topview_line_addr_r(31 downto 0) => topview_line_addr_r(31 downto 0),
      topview_line_data_f(38 downto 0) => topview_line_data_f(38 downto 0),
      topview_line_data_r(38 downto 0) => topview_line_data_r(38 downto 0),
      topview_ready_f => topview_ready_f,
      topview_ready_r => topview_ready_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "pspl_comm_pspl_comm_0_0,pspl_comm_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "pspl_comm_v1_0,Vivado 2018.3";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN pspl_comm_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN pspl_comm_processing_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pspl_comm_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      kl_accel(6 downto 0) => kl_accel(6 downto 0),
      kl_steer(7 downto 0) => kl_steer(7 downto 0),
      led(3 downto 0) => led(3 downto 0),
      lsd_line_addr_f(31 downto 0) => lsd_line_addr_f(31 downto 0),
      lsd_line_addr_r(31 downto 0) => lsd_line_addr_r(31 downto 0),
      lsd_line_data_f(39 downto 0) => lsd_line_data_f(39 downto 0),
      lsd_line_data_r(39 downto 0) => lsd_line_data_r(39 downto 0),
      lsd_line_num_f(31 downto 0) => lsd_line_num_f(31 downto 0),
      lsd_line_num_r(31 downto 0) => lsd_line_num_r(31 downto 0),
      lsd_ready_f => lsd_ready_f,
      lsd_ready_r => lsd_ready_r,
      motor_speed_l(15 downto 0) => motor_speed_l(15 downto 0),
      motor_speed_r(15 downto 0) => motor_speed_r(15 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      sccb_busy => sccb_busy,
      sccb_req => sccb_req,
      sccb_send_data(23 downto 0) => sccb_send_data(23 downto 0),
      sw(1 downto 0) => sw(1 downto 0),
      topview_line_addr_f(31 downto 0) => topview_line_addr_f(31 downto 0),
      topview_line_addr_r(31 downto 0) => topview_line_addr_r(31 downto 0),
      topview_line_data_f(38 downto 0) => topview_line_data_f(38 downto 0),
      topview_line_data_r(38 downto 0) => topview_line_data_r(38 downto 0),
      topview_ready_f => topview_ready_f,
      topview_ready_r => topview_ready_r
    );
end STRUCTURE;
