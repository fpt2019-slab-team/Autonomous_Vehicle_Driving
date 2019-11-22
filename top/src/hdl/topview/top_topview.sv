`timescale 1ns/1ps
`default_nettype none

module top_topview
  (
   clk, n_rst, in_start_v, in_end_v, in_start_h, in_end_h,
   out_start_v, out_end_v, out_start_h, out_end_h, valid
   );

   
   parameter int      IN_WIDTH   = 640;
   parameter int      IN_HEIGHT  = 480;
   parameter int      OUT_WIDTH  = 180;
   parameter int      OUT_HEIGHT = 480; // 480
   parameter int      SCALE      = 1;
   parameter integer  HVC        = 40; // 40
   parameter integer  HC         = 5;
   parameter integer  DVC        = 45; // 45
   parameter integer  F          = 210;
   parameter integer  FP         = 210;
   parameter real     THETA      = 20 * $acos(-1) / 180.0;
   parameter integer signed CX   = IN_WIDTH / 2;
   parameter integer signed CY   = IN_HEIGHT / 2;
   parameter integer signed CXP  = OUT_WIDTH / 2;
   parameter integer signed CYP  = OUT_HEIGHT / 2;
      
   localparam integer OUT_V_BITW = 32;
   localparam integer OUT_H_BITW = 32;
   
   input wire clk, n_rst;
   input wire [$clog2(IN_HEIGHT):0] in_start_v, in_end_v;
   input wire [$clog2(IN_WIDTH):0] in_start_h, in_end_h;

   output wire signed [OUT_V_BITW-1:0] out_start_v, out_end_v;
   output wire signed [OUT_H_BITW-1:0] out_start_h, out_end_h;
   output wire 			 valid;
   
   topview
     #(
       .IN_WIDTH(IN_WIDTH), .IN_HEIGHT(IN_HEIGHT),
       .OUT_WIDTH(OUT_WIDTH), .OUT_HEIGHT(OUT_HEIGHT),
       .SCALE(SCALE),
       .HVC(HVC), .HC(HC), .DVC(DVC),
       .F(F), .FP(FP),
       .THETA(THETA),
       .CX(CX), .CY(CY),
       .CXP(CXP), .CYP(CYP)
       )
   topview_inst
     (
      .clk(clk), .n_rst(n_rst),
      .in_start_v(in_start_v), .in_start_h(in_start_h), .in_end_v(in_end_v), .in_end_h(in_end_h),
      .out_start_v(out_start_v), .out_start_h(out_start_h), .out_end_v(out_end_v), .out_end_h(out_end_h),
      .valid(valid)
      );
      
endmodule
`default_nettype wire
