-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Aug 23 11:21:13 2019
-- Host        : flamingo running 64-bit CentOS release 6.10 (Final)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/users/saikai/FPGAs/PYNQ/pspl_comm/project_1/project_1.srcs/sources_1/bd/design_1/design_1_stub.vhdl
-- Design      : design_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1 is
  Port ( 
    led_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pulse1 : out STD_LOGIC;
    pulse2 : out STD_LOGIC
  );

end design_1;

architecture stub of design_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "led_out[3:0],pulse1,pulse2";
begin
end;
