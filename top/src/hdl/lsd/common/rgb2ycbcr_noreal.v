//-----------------------------------------------------------------------------
// <rgb2ycbcr> 
//  - Pipelined converter from RGB to full-scale YCbCr (BT.709)
//    - Latency: 4 clock cycles
//-----------------------------------------------------------------------------
// Version 1.02 (Nov. 27, 2018)
//  - Improved accuracy
//  - Latency increased from 3 to 4 clock cycles
//  - Changed conversion algorithm from BT.601 to BT.709
//-----------------------------------------------------------------------------
// (C) 2018 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns
  
module rgb2ycbcr
  #( parameter integer BIT_WIDTH    = -1,
     parameter integer FRAME_HEIGHT = -1,
     parameter integer FRAME_WIDTH  = -1 )
   ( clock, 
     in_r,   in_g,   in_b,   in_vcnt,  in_hcnt,
     out_y,  out_cb, out_cr, out_vcnt, out_hcnt );

   // local parameters --------------------------------------------------------
   localparam integer FRAC_BITW = 10;      // MUST BE within [9, 18] !
   localparam integer SUM_BITW  = BIT_WIDTH + FRAC_BITW + 3;
   localparam integer V_BITW    = log2(FRAME_HEIGHT);
   localparam integer H_BITW    = log2(FRAME_WIDTH);
   
   // inputs/outputs ----------------------------------------------------------
   input wire       	      clock;
   input wire [BIT_WIDTH-1:0] in_r,   in_g,   in_b;
   input wire [V_BITW-1:0]    in_vcnt;
   input wire [H_BITW-1:0]    in_hcnt;
   output reg [BIT_WIDTH-1:0] out_y,  out_cb, out_cr;
   output wire [V_BITW-1:0]   out_vcnt;
   output wire [H_BITW-1:0]   out_hcnt;

   // -------------------------------------------------------------------------
   // [stage 1] buffering
   reg [BIT_WIDTH-1:0] 	      r, g, b;
   always @(posedge clock)
     {r, g, b} <= {in_r, in_g, in_b};

   // [stage 2] multiplicaiton
   reg signed [SUM_BITW-1:0] s2_y_r,  s2_y_g,  s2_y_b;
   reg signed [SUM_BITW-1:0] s2_cb_r, s2_cb_g, s2_cb_b;
   reg signed [SUM_BITW-1:0] s2_cr_r, s2_cr_g, s2_cr_b;
   always @(posedge clock) begin
      s2_y_r  <= $signed({1'b0, r}) * 218;
      s2_y_g  <= $signed({1'b0, g}) * 732;
      s2_y_b  <= $signed({1'b0, b}) * 74;
      s2_cb_r <= $signed({1'b0, r}) * (-117);
      s2_cb_g <= $signed({1'b0, g}) * (-395);
      s2_cb_b <= $signed({1'b0, b}) * 512;
      s2_cr_r <= $signed({1'b0, r}) * 512;
      s2_cr_g <= $signed({1'b0, g}) * (-465);
      s2_cr_b <= $signed({1'b0, b}) * (-47);
   end

   // [stage 3] summation
   reg signed [SUM_BITW-1:0] s3_y, s3_cb, s3_cr;
   always @(posedge clock) begin
      s3_y  <= s2_y_r  + s2_y_g  + s2_y_b;
      s3_cb <= s2_cb_r + s2_cb_g + s2_cb_b;
      s3_cr <= s2_cr_r + s2_cr_g + s2_cr_b;
   end

   // [stage 4] rounding
   localparam signed [BIT_WIDTH:0] BIAS = 1024'b1 << (BIT_WIDTH-1);
   always @(posedge clock) begin
      out_y  <=  ((s3_y  >>> (FRAC_BITW - 1)) + 1) >>> 1;
      out_cb <= (((s3_cb >>> (FRAC_BITW - 1)) + 1) >>> 1) + BIAS;
      out_cr <= (((s3_cr >>> (FRAC_BITW - 1)) + 1) >>> 1) + BIAS;
   end
   
   // coordinates adjustment --------------------------------------------------
   coord_adjuster
     #( .FRAME_HEIGHT(FRAME_HEIGHT), .FRAME_WIDTH(FRAME_WIDTH), .LATENCY(4) )
   ca_0
     (  .clock(clock), .in_vcnt(in_vcnt), .in_hcnt(in_hcnt),
	.out_vcnt(out_vcnt), .out_hcnt(out_hcnt) );

   // functions ---------------------------------------------------------------
   // function signed [SUM_BITW-1:0] calc_fixed_weight;
   //    input real weight;
   //    begin
   // 	 calc_fixed_weight = weight * $signed(1024'b1 << FRAC_BITW);
   //    end
   // endfunction

   // limits the value range
   function [BIT_WIDTH-1:0] clip;
      input signed [BIT_WIDTH+2-1:0] val;
      begin
	 clip = (val < 0) ? 0 :	(255 < val) ? 255 : val;
      end
   endfunction
   
   // calculates ceil(log2(value))
   function integer log2;
      input [63:0] value;
      begin
     	 value = value - 1;
	 for(log2 = 0; value > 0; log2 = log2 + 1)
	   value = value >> 1;
      end
   endfunction
   
endmodule
`default_nettype wire

