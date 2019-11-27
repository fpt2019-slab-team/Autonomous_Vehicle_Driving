//-----------------------------------------------------------------------------
// <xorshift128plus>
//  - Generates 64-bit pseudo random numbers with the XORShift128+ algorithm
//    - Period length: 2^128 - 1
//  - INITIAL_STATE_0 and 1 MUST NOT be 0
//-----------------------------------------------------------------------------
// Version 1.00 (July 23, 2018)
//  - Initial version
//-----------------------------------------------------------------------------
// Taito Manabe
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns
  
module xorshift128plus
  #( parameter [63:0] INITIAL_STATE_0 = 1,
     parameter [63:0] INITIAL_STATE_1 = 2 )
   ( clock, n_rst, out_value );

   // local parameters --------------------------------------------------------
   localparam integer  BIT_WIDTH = 64;
   
   // inputs / outputs --------------------------------------------------------
   input wire         	      clock, n_rst;
   output reg [BIT_WIDTH-1:0] out_value;

   // registers ---------------------------------------------------------------
   reg [BIT_WIDTH-1:0] 	      state_0, state_1;
   
   // -------------------------------------------------------------------------
   always @(posedge clock) begin
      if(!n_rst) begin
	 out_value <= INITIAL_STATE_1 + 
		      next_s1(INITIAL_STATE_1, INITIAL_STATE_0);
	 state_0   <= next_s1(INITIAL_STATE_1, INITIAL_STATE_0);
	 state_1   <= next_s1(next_s1(INITIAL_STATE_1, INITIAL_STATE_0),
			      INITIAL_STATE_1);
      end
      else begin
	 out_value <= state_0 + state_1;
	 state_0   <= state_1;
	 state_1   <= next_s1(state_1, state_0);
      end
   end

   // functions ---------------------------------------------------------------
   function [BIT_WIDTH-1:0] next_s1;
      input [BIT_WIDTH-1:0] s0, s1;
      begin
   	 s1      = s1 ^ (s1 << 23);
   	 next_s1 = s1 ^ (s1 >> 17) ^ s0 ^ (s0 >> 26);
      end
   endfunction
   
endmodule
`default_nettype wire
