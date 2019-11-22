//-----------------------------------------------------------------------------
// <camera_if>
//  - Converts the input data from the camera into 
//    vcnt, hcnt, and luminance (Y)
//-----------------------------------------------------------------------------
// Version 1.01 (Nov. 18, 2019)
//  - Added <in_href> port
//-----------------------------------------------------------------------------
// (C) 2019 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns

module camera_if
  #( parameter integer IMAGE_HEIGHT = 480,
     parameter integer IMAGE_WIDTH  = 640,
     parameter integer FRAME_HEIGHT = 510,
     parameter integer FRAME_WIDTH  = 784,
     parameter integer V_OFFSET     = 20 )
  ( clk_2x, clk_1x, n_rst, in_vsync, in_href, in_data, 
    out_y, out_vcnt, out_hcnt );

   // parameters --------------------------------------------------------------
   localparam integer BIT_WIDTH = 8;
   
   // following parameters are calculated automatically -----------------------
   localparam integer H_BITW    = log2(FRAME_WIDTH);
   localparam integer V_BITW    = log2(FRAME_HEIGHT);
   
   // inputs / outputs --------------------------------------------------------
   input wire 	               clk_2x;   // camera pixel clock (24MHz)
   input wire 	               clk_1x;   // output pixel clock (12MHz)
   input wire 		       n_rst;    // synchronous negative reset
   input wire 		       in_vsync; // VSYNC
   input wire 		       in_href;  // HREF
   input wire [BIT_WIDTH-1:0]  in_data;
   output wire [BIT_WIDTH-1:0] out_y;
   output wire [V_BITW-1:0]    out_vcnt;
   output wire [H_BITW-1:0]    out_hcnt;

   // generates vcount and hcount ---------------------------------------------
   reg 			       prev_vsync, prev_href;
   reg [V_BITW-1:0] 	       vcnt;
   reg [H_BITW:0] 	       hcnt2;

   // buffering
   always @(posedge clk_2x) begin
      prev_vsync <= in_vsync;
      prev_href  <= in_href;
   end
   // vcount
   always @(posedge clk_2x) begin
      if(!n_rst)
	vcnt <= 0;
      else if(!prev_vsync && in_vsync)
	vcnt <= FRAME_HEIGHT - V_OFFSET;
      else begin
	 if(hcnt2 == FRAME_WIDTH * 2 - 1) begin
	    if(vcnt == FRAME_HEIGHT - 1)
	      vcnt <= 0;
	    else
	      vcnt <= vcnt + 1;
	 end
      end
   end
   // hcount
   always @(posedge clk_2x) begin
      if(!n_rst)
	hcnt2 <= 0;
      else if(!prev_href && in_href)
	hcnt2 <= 1;
      else begin
	 if(hcnt2 == FRAME_WIDTH * 2 - 1)
	   hcnt2 <= 0;
	 else
	   hcnt2 <= hcnt2 + 1;
      end
   end
   
   // FIFO for buffering ------------------------------------------------------
   reg [BIT_WIDTH-1:0]    prev_data;
   wire [4:0] 		  buf_r, buf_b;
   wire [5:0] 		  buf_g;
   wire [V_BITW-1:0] 	  buf_vcnt;
   wire [H_BITW-1:0] 	  buf_hcnt;
   
   always @(posedge clk_2x) begin
      prev_data <= in_data;
   end
   fifo_dc
     #( .BIT_WIDTH(BIT_WIDTH * 2 + V_BITW + H_BITW), 
	.FIFO_SIZE(64), .INITIAL_SIZE(32) )
   fifo_0
     (  .wr_clock(clk_2x), .rd_clock(clk_1x), .n_rst(n_rst),
	.wr_en(hcnt2[0]),  .rd_en(1'b1),
	.wr_data({in_data, prev_data, vcnt, hcnt2[H_BITW:1]}),
	.rd_data({buf_r, buf_g, buf_b, buf_vcnt, buf_hcnt}) );

   // conversion from RGB to gray ---------------------------------------------
   rgb2ycbcr
     #( .BIT_WIDTH(BIT_WIDTH), 
	.FRAME_WIDTH(FRAME_WIDTH), .FRAME_HEIGHT(FRAME_HEIGHT) )
   r2y_0
     (  .clock(clk_1x),             .in_r({buf_r, buf_r[4:2]}), 
	.in_g({buf_g, buf_g[5:4]}), .in_b({buf_b, buf_b[4:2]}),
	.in_vcnt(buf_vcnt),         .in_hcnt(buf_hcnt),
	.out_y(out_y), .out_vcnt(out_vcnt), .out_hcnt(out_hcnt)  );
   
   // functions ---------------------------------------------------------------
   function integer log2;
      input integer value;
      begin
     	 value = value - 1;
	 for(log2 = 0; value > 0; log2 = log2 + 1)
	   value = value >> 1;
      end
   endfunction
   
endmodule
`default_nettype wire
