//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Fri Aug 23 11:19:19 2019
//Host        : flamingo running 64-bit CentOS release 6.10 (Final)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (led_out,
    pulse1,
    pulse2);
  output [3:0]led_out;
  output pulse1;
  output pulse2;

  wire [3:0]led_out;
  wire pulse1;
  wire pulse2;

  design_1 design_1_i
       (.led_out(led_out),
        .pulse1(pulse1),
        .pulse2(pulse2));
endmodule
