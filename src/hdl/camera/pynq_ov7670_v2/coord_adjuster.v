//-----------------------------------------------------------------------------
// <coord_adjuster>
//  - Adjusts coordinates based on the given latency
//  - <LATENCY> must be >= 1
//-----------------------------------------------------------------------------
// Version 1.01 (Nov. 12, 2018)
//  - Changed some parameter names
//-----------------------------------------------------------------------------
// (C) 2018 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns

module coord_adjuster
  #( parameter integer FRAME_HEIGHT = -1,  // | frame size (including sync.)
     parameter integer FRAME_WIDTH  = -1,  // |
     parameter integer LATENCY      = -1 )
   ( clock, in_vcnt, in_hcnt, out_vcnt, out_hcnt );

   // local parameters --------------------------------------------------------
   localparam integer V_BITW        = log2(FRAME_HEIGHT);
   localparam integer H_BITW        = log2(FRAME_WIDTH);
   localparam integer EQUIV_LATENCY = (LATENCY - 1) % 
		      (FRAME_HEIGHT * FRAME_WIDTH);
   localparam integer V_LATENCY     = EQUIV_LATENCY / FRAME_WIDTH;
   localparam integer H_LATENCY     = EQUIV_LATENCY % FRAME_WIDTH;

   // inputs / outputs --------------------------------------------------------
   input wire              clock;
   input wire [V_BITW-1:0] in_vcnt;
   input wire [H_BITW-1:0] in_hcnt;
   output reg [V_BITW-1:0] out_vcnt;
   output reg [H_BITW-1:0] out_hcnt;

   // vcnt adjustment ---------------------------------------------------------
   wire [V_BITW-1:0] 	   v_diff;
   assign v_diff = V_LATENCY + (in_hcnt < H_LATENCY);
   always @(posedge clock) begin
      if(in_vcnt < v_diff)
	out_vcnt <= ({1'b0, in_vcnt} + FRAME_HEIGHT) - v_diff;
      else
	out_vcnt <= in_vcnt - v_diff;
   end

   // hcnt adjustment ---------------------------------------------------------
   always @(posedge clock) begin
      if(in_hcnt < H_LATENCY)
	out_hcnt <= ({1'b0, in_hcnt} + FRAME_WIDTH) - H_LATENCY;
      else
	out_hcnt <= in_hcnt - H_LATENCY;
   end

   // functions ---------------------------------------------------------------
   function integer log2;
      input integer value;
      begin
     	 value = value - 1;
	 for ( log2 = 0; value > 0; log2 = log2 + 1 )
	   value = value >> 1;
      end
   endfunction
   
endmodule
`default_nettype wire
