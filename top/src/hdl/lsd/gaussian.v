//-----------------------------------------------------------------------------
// <gaussian> 
//  - Applies Gaussian filter
//  - Latency: (FRAME_WIDTH + 7) clock cycles
//-----------------------------------------------------------------------------
// Version 1.01 (Nov. 9, 2019)
//  - Fixed the bug that can result in wrong vcnt/hcnt bit widths
//-----------------------------------------------------------------------------
// (C) 2019 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns

module gaussian
  #( parameter integer BIT_WIDTH    = -1,
     parameter integer IMAGE_HEIGHT = -1,
     parameter integer IMAGE_WIDTH  = -1,
     parameter integer FRAME_HEIGHT = -1,
     parameter integer FRAME_WIDTH  = -1 )
   ( clock,     n_rst,
     in_pixel,  in_vcnt,   in_hcnt,
     out_pixel, out_vcnt,  out_hcnt );

   // local parameters --------------------------------------------------------
   localparam integer PATCH_SIZE = 3;
   localparam integer V_BITW     = log2(FRAME_HEIGHT);
   localparam integer H_BITW     = log2(FRAME_WIDTH);
   localparam integer PATCH_PIXS = PATCH_SIZE * PATCH_SIZE;  // 9
   localparam integer PATCH_BITW = PATCH_PIXS * BIT_WIDTH;
   localparam integer CENTER     = (PATCH_SIZE - 1) / 2;     // 1

   // inputs / outputs --------------------------------------------------------
   input wire 	               clock, n_rst;
   input wire [BIT_WIDTH-1:0]  in_pixel;
   input wire [V_BITW-1:0]     in_vcnt;
   input wire [H_BITW-1:0]     in_hcnt;
   output wire [BIT_WIDTH-1:0] out_pixel;
   output wire [V_BITW-1:0]    out_vcnt;
   output wire [H_BITW-1:0]    out_hcnt;

   // genvar ------------------------------------------------------------------
   genvar 		      v, h;   
   
   // patch extraction --------------------------------------------------------
   wire [0:PATCH_BITW-1]      raveled_patch;
   wire [V_BITW-1:0] 	      stp_vcnt;
   wire [H_BITW-1:0] 	      stp_hcnt;
   stream_patch
     #( .BIT_WIDTH(BIT_WIDTH),       .PADDING(1),
	.IMAGE_HEIGHT(IMAGE_HEIGHT), .IMAGE_WIDTH(IMAGE_WIDTH),
	.FRAME_HEIGHT(FRAME_HEIGHT), .FRAME_WIDTH(FRAME_WIDTH),
	.PATCH_HEIGHT(PATCH_SIZE),   .PATCH_WIDTH(PATCH_SIZE),
	.CENTER_V(CENTER),           .CENTER_H(CENTER) )
   stp_0
     (  .clock(clock),             .n_rst(n_rst),
	.in_pixel(in_pixel),       .in_vcnt(in_vcnt),   .in_hcnt(in_hcnt),
        .out_patch(raveled_patch), .out_vcnt(stp_vcnt), .out_hcnt(stp_hcnt) );

   // reshapes into 2-dimensional array ---------------------------------------
   wire [BIT_WIDTH-1:0]       stp_patch[0:PATCH_SIZE-1][0:PATCH_SIZE-1];
   generate
      for(v = 0; v < PATCH_SIZE; v = v + 1) begin: gauss_reshape_v
	 for(h = 0; h < PATCH_SIZE; h = h + 1) begin: gauss_reshape_h
	    assign stp_patch[v][h]
	      = raveled_patch[(v * PATCH_SIZE + h) * BIT_WIDTH +: BIT_WIDTH];
	 end
      end
   endgenerate

   // [please write your code in this section] --------------------------------
   localparam integer SUM_BITW  = BIT_WIDTH + 4;
   
   // multiplication
   wire [0:PATCH_PIXS*SUM_BITW-1] 	prods;
   generate
      for(v = 0; v < PATCH_SIZE; v = v + 1) begin: gauss_mult_v
	 for(h = 0; h < PATCH_SIZE; h = h + 1) begin: gauss_mult_h
	    if(v == CENTER && h == CENTER) begin: gauss_mult_1x
	       assign prods[(v*PATCH_SIZE+h)*SUM_BITW +: SUM_BITW]
		 = {stp_patch[v][h], 2'b0};
	    end
	    else if ((v + h) % 2 == 1) begin: gauss_mult_half
	       assign prods[(v*PATCH_SIZE+h)*SUM_BITW +: SUM_BITW]
		 = {stp_patch[v][h], 1'b0};
	    end
	    else begin: gauss_mult_quarter
	       assign prods[(v*PATCH_SIZE+h)*SUM_BITW +: SUM_BITW]
		 = stp_patch[v][h];
	    end
	 end
      end
   endgenerate   
   
   // summation
   wire [SUM_BITW-1:0] sum;
   tree_adder
     #( .IN_NUM(PATCH_PIXS), .BIT_WIDTH(SUM_BITW) )
   tad_0
     (  .clock(clock), .in_values(prods), .out_value(sum) );

   assign out_pixel = (sum + 8) >> 4;

   // coordinates adjustment
   coord_adjuster
     #( .FRAME_HEIGHT(FRAME_HEIGHT), .FRAME_WIDTH(FRAME_WIDTH), 
	.LATENCY(log2(PATCH_PIXS)) )
   ca_0
     (  .clock(clock), 
	.in_vcnt(stp_vcnt),  .in_hcnt(stp_hcnt), 
	.out_vcnt(out_vcnt), .out_hcnt(out_hcnt) );
   
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
