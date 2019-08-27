// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Aug 27 16:22:15 2019
// Host        : swan.cis.nagasaki-u.ac.jp running 64-bit CentOS release 6.10 (Final)
// Command     : write_verilog -force -mode synth_stub
//               /home/users/saikai/Project/Autonomous_Vehicle_Driving/pspl_comm/project_1/project_1.srcs/sources_1/bd/design_1/design_1_stub.v
// Design      : design_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module design_1(led_out, pulse1, pulse2, sw)
/* synthesis syn_black_box black_box_pad_pin="led_out[3:0],pulse1,pulse2,sw[1:0]" */;
  output [3:0]led_out;
  output pulse1;
  output pulse2;
  input [1:0]sw;
endmodule
