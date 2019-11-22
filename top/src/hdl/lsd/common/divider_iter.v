//-----------------------------------------------------------------------------
// <divider_iter>
//  - Simple divider (not pipelined)
//    - a = bq + r
//    - <in_a>, <in_b>, <out_q>, and <out_r> are all signed.
//      Please do not forget bit extension if you want to use unsigned values
//    - The quotient <q> will be truncated toward 0.
//      Thus, if <a> is negative, the remainder <r> will also be negative
//    - if <b> is 0, the quotient <q> will be 0 no matter what <a> is
//  - Overall latency is (BIT_WIDTH + 2) clock cycles
//-----------------------------------------------------------------------------
// Version 1.00 (Nov. 14, 2018)
//  - Initial version
//-----------------------------------------------------------------------------
// (C) 2018 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns
  
module divider_iter
  #( parameter integer BIT_WIDTH = -1 )
   ( clock, n_rst, in_en, in_a, in_b, out_flag, out_ready, out_q, out_r );

   // inputs / outputs --------------------------------------------------------
   input wire         	             clock, n_rst, in_en;
   input wire signed [BIT_WIDTH-1:0] in_a, in_b;
   output reg 			     out_flag, out_ready;
   output reg signed [BIT_WIDTH:0]   out_q;
   output reg signed [BIT_WIDTH-1:0] out_r;
   
   // variables ---------------------------------------------------------------
   integer 			     i;

   // state control -----------------------------------------------------------
   reg [log2(BIT_WIDTH+1+1)-1:0]     count;
   always @(posedge clock) begin
      if(!n_rst)
	count <= 0;
      else if(count == 0) begin
	 if(in_en)
	   count <= 1;
      end
      else begin
	 if(count == BIT_WIDTH + 1)
	   count <= 0;
	 else
	   count <= count + 1;
      end
   end

   // iteration ---------------------------------------------------------------
   reg [BIT_WIDTH-1:0]        r, b, q;
   reg [0:1] 		      minus;
   wire [BIT_WIDTH-1:0]       bq;
   wire signed [BIT_WIDTH:0]  diff;
   localparam [BIT_WIDTH-1:0] ONE = 1;
   assign bq   = b << (BIT_WIDTH - count);
   assign diff = $signed({1'b0, r}) - $signed({1'b0, bq});
   
   always @(posedge clock) begin
      if(count == 0) begin
	 if(in_en) begin
	    r     <= (in_a >= 0) ? in_a : in_a * (-1);
	    b     <= (in_b >= 0) ? in_b : in_b * (-1);
	    q     <= 0;
	    minus <= {(in_a < 0), (in_b < 0)};
	 end
      end
      else if(count < BIT_WIDTH + 1) begin
	 if(((b >> count) == 0) && (diff >= 0)) begin
	    r <= diff;
	    q <= q | (ONE << (BIT_WIDTH - count));
	 end
      end
   end

   always @(posedge clock) begin
      if(!n_rst)
	{out_flag, out_ready, out_q, out_r} <= 0;
      else if(count == 0) begin
	 if(in_en)
	   {out_flag, out_ready, out_q, out_r} <= 0;
      end
      else if(count == BIT_WIDTH + 1) begin
	 out_flag  <= 1;
	 out_ready <= 1;
	 out_r     <= minus[0] ? r * (-1) : r;
	 out_q     <= (b == 0) ? 0 : (^minus) ? q * (-1) : q;
      end
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
