//-----------------------------------------------------------------------------
// <visualizer>
//  - Visualizes the line segments output from <simple_lsd>
//    - Compatible with <simple_lsd> from version 1.06 to 1.07
//-----------------------------------------------------------------------------
// Version 1.00 (Nov. 12, 2019)
//  - Initial version
//-----------------------------------------------------------------------------
// (C) 2019 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns

module visualizer
  #( parameter integer BIT_WIDTH    = 8,
     parameter integer IMAGE_HEIGHT = -1,
     parameter integer IMAGE_WIDTH  = -1,
     parameter integer FRAME_HEIGHT = -1,
     parameter integer FRAME_WIDTH  = -1,
     parameter integer RAM_SIZE     = 4096 ) // must be the power of 2
   ( clock, n_rst,
     in_flag, in_valid, in_start_v, in_start_h, in_end_v, in_end_h, 
     in_vcnt, in_hcnt, out_vcnt, out_hcnt, out_r, out_g, out_b );

   // following parameters are calculated automatically -----------------------
   localparam integer H_BITW       = log2(FRAME_WIDTH);
   localparam integer V_BITW       = log2(FRAME_HEIGHT);
   localparam integer COORD_BITW   = (H_BITW > V_BITW) ? H_BITW : V_BITW;
   localparam integer LS_ADDR_BITW = log2(RAM_SIZE);
   localparam integer FB_ADDR_BITW = log2(IMAGE_HEIGHT * IMAGE_WIDTH);
   localparam integer WORD_SIZE    = 1 + COORD_BITW * 4;
   
   // inputs / outputs --------------------------------------------------------
   input wire 	                clock, n_rst, in_flag, in_valid;
   input wire [V_BITW-1:0] 	in_vcnt, in_start_v, in_end_v;
   input wire [H_BITW-1:0] 	in_hcnt, in_start_h, in_end_h;
   output wire [BIT_WIDTH-1:0] 	out_r, out_g, out_b;
   output reg [V_BITW-1:0] 	out_vcnt;
   output reg [H_BITW-1:0] 	out_hcnt;

   // RAM for line segments ---------------------------------------------------
   reg 				ls_ram_wr_en;
   reg [LS_ADDR_BITW-1:0] 	ls_ram_wr_addr;
   reg [LS_ADDR_BITW-1:0] 	ls_ram_rd_addr;
   reg [LS_ADDR_BITW-1:0] 	ls_ram_total_lines;
   reg [LS_ADDR_BITW:0] 	ls_ram_current_id, ls_ram_total_cands;   
   reg [WORD_SIZE-1:0] 		ls_ram_wr_data;
   wire [WORD_SIZE-1:0] 	ls_ram_rd_data;
   ram_sc
     #( .WORD_SIZE(WORD_SIZE), .RAM_SIZE(RAM_SIZE) )
   ls_ram
     (  .clock(clock),            .wr_en(ls_ram_wr_en),
	.wr_addr(ls_ram_wr_addr), .wr_data(ls_ram_wr_data),
	.rd_addr(ls_ram_rd_addr), .rd_data(ls_ram_rd_data) );

   // writes the input line segment into RAM ----------------------------------
   wire [COORD_BITW-1:0] 	dist_v, wrt_v1, wrt_v2;
   wire [COORD_BITW-1:0] 	dist_h, wrt_h1, wrt_h2;
   wire 			wrt_swap_axis;
   assign dist_v = (in_start_v > in_end_v) 
     ? in_start_v - in_end_v : in_end_v - in_start_v;
   assign dist_h = (in_start_h > in_end_h) 
     ? in_start_h - in_end_h : in_end_h - in_start_h;
   assign wrt_swap_axis = dist_v > dist_h;
   assign wrt_v1 = wrt_swap_axis ? in_start_h : in_start_v;
   assign wrt_v2 = wrt_swap_axis ? in_end_h   : in_end_v;
   assign wrt_h1 = wrt_swap_axis ? in_start_v : in_start_h;
   assign wrt_h2 = wrt_swap_axis ? in_end_v   : in_end_h;
   always @(posedge clock) begin
      if(!n_rst) begin
	 ls_ram_wr_en <= 0;
      end
      else begin
	 ls_ram_wr_en <= in_flag && in_valid;
	 if(!in_flag) begin
	    ls_ram_wr_addr     <= -1;
	    ls_ram_current_id  <= 0;
	 end
	 else begin
	    if(in_valid) begin
	       ls_ram_wr_addr     <= ls_ram_wr_addr + 1;
	       ls_ram_total_lines <= ls_ram_wr_addr + 2;
	    end
	    ls_ram_current_id  <= ls_ram_current_id + 1;
	    ls_ram_total_cands <= ls_ram_current_id + 1;
	 end
	 if(wrt_h2 < wrt_h1)
	   ls_ram_wr_data <= {wrt_swap_axis, wrt_v2, wrt_v1, wrt_h2, wrt_h1};
	 else
	   ls_ram_wr_data <= {wrt_swap_axis, wrt_v1, wrt_v2, wrt_h1, wrt_h2};
      end
   end
   
   // RAM for frame buffer ----------------------------------------------------
   reg 				fb_ram_wr_en;
   reg [FB_ADDR_BITW-1:0] 	fb_ram_wr_addr;
   wire 			fb_ram_rd_data;
   ram_sc
     #( .WORD_SIZE(1), .RAM_SIZE(IMAGE_HEIGHT * IMAGE_WIDTH) )
   fb_ram
     (  .clock(clock),  .wr_data(fb_ram_wr_en ? 1'b1 : 1'b0),       
	.wr_en(fb_ram_wr_en ||
	       ((out_vcnt < IMAGE_HEIGHT) && (out_hcnt < IMAGE_WIDTH))),
	.wr_addr(fb_ram_wr_en ? fb_ram_wr_addr : 
		 calc_addr(out_vcnt, out_hcnt)), 
	.rd_addr(calc_addr(in_vcnt, in_hcnt)), .rd_data(fb_ram_rd_data) );

   // state control -----------------------------------------------------------
   reg [2:0] 			state;   
   reg 				swap_axis;
   reg [COORD_BITW-1:0] 	v1, v2, h1, h2, h;
   wire [COORD_BITW-1:0] 	v;
   reg signed [COORD_BITW+9:0] 	slope;
   wire 			div_out_flag;
   wire [COORD_BITW+9:0] 	div_out_q;

   always @(posedge clock) begin
      if(!n_rst) begin
	 state <= 5;
      end
      // [0] loads the line segment data from RAM
      else if(state == 0) begin
	 state <= 1;
      end
      // [1] starts calculating slope
      else if(state == 1) begin
	 state <= 2;
      end
      // [2] calculates slope
      else if(state == 2) begin
	 if(div_out_flag)
	   state <= 3;
      end
      // [3] draws pixels on the line
      else if(state == 3) begin
	 if(h == h2)
	   state <= 4;
      end
      // [4] checks if there are unprocessed line segments
      else if(state == 4) begin
	 if(ls_ram_rd_addr == ls_ram_total_lines)
	   state <= 5;
	 else
	   state <= 0;
      end
      // [5] waits for line segment update to start
      else if(state == 5) begin
	 if(in_flag)
	   state <= 6;
      end
      // [6] waits for line segment update to finish
      else if(state == 6) begin
	 if(!in_flag)
	   state <= 0;
      end
   end

   // draw line segments ------------------------------------------------------
   divider_iter
     #( .BIT_WIDTH(COORD_BITW + 1 + 8) )
   div_0
     (  .clock(clock), .n_rst(n_rst), .in_en(state == 1),
	.in_a({({1'b0, v2} - v1), 8'b0}), .in_b({9'b0, h2} - h1), 
	.out_flag(div_out_flag),      .out_q(div_out_q)        );

   assign v = (slope * $signed({8'b0, (h - h1)}) + 128) / 256 + v1;
   
   always @(posedge clock) begin
      if(!n_rst) begin
	 ls_ram_rd_addr <= 0;
	 fb_ram_wr_en   <= 0;
      end
      // [0] loads the line segment data from RAM
      else if(state == 0) begin
	 {swap_axis, v1, v2, h1, h2} <= ls_ram_rd_data;
      end
      // [2] calculates slope
      else if(state == 2) begin
	 if(div_out_flag) begin
	    slope <= div_out_q;
	    h     <= h1;	    
	 end
      end
      // [3] draws pixels on the line
      else if(state == 3) begin
	 fb_ram_wr_en   <= 1;
	 fb_ram_wr_addr <= swap_axis ? calc_addr(h, v) : calc_addr(v, h);
	 if(h == h2)
	   ls_ram_rd_addr <= ls_ram_rd_addr + 1;
	 h <= h + 1;
      end
      // [4] checks if there are unprocessed line segments
      else if(state == 4) begin
	 fb_ram_wr_en <= 0;
	 if(ls_ram_rd_addr == ls_ram_total_lines)
	   ls_ram_rd_addr <= 0;
      end
   end

   // outputs -----------------------------------------------------------------
   always @(posedge clock) begin
      {out_vcnt, out_hcnt} <= {in_vcnt, in_hcnt};
   end
   wire valid_pixel;
   assign valid_pixel 
     = fb_ram_rd_data && (out_vcnt < IMAGE_HEIGHT) && (out_hcnt < IMAGE_WIDTH);
   assign out_r = valid_pixel ? -1 : 0;
   assign out_g 
     = (valid_pixel || 
	((out_vcnt < 20) &&
	 (out_hcnt < (ls_ram_total_cands * IMAGE_WIDTH) / RAM_SIZE))) ? -1 : 0;
   assign out_b = valid_pixel ? -1 : 0;
    
   // functions ---------------------------------------------------------------
   function integer log2;
      input integer value;
      begin
     	 value = value - 1;
	 for(log2 = 0; value > 0; log2 = log2 + 1)
	   value = value >> 1;
      end
   endfunction

   function [FB_ADDR_BITW-1:0] calc_addr;
      input [FB_ADDR_BITW-1:0] v, h;
      begin
	 calc_addr = v * IMAGE_WIDTH + h;
      end
   endfunction
   
endmodule
`default_nettype wire
