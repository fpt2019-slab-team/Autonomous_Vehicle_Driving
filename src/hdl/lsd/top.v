`default_nettype none

module top
  #( parameter integer WIDTH    = 858,
     parameter integer HEIGHT   = 525,
     parameter integer W_WIDTH  = 640,
     parameter integer W_HEIGHT = 480 )
   ( clk,   n_rst, 
     r_in,  g_in,  b_in,  hcount_in,  vcount_in,
     r_out, g_out, b_out, hcount_out, vcount_out );

   // local parameters
   localparam integer BIT_WIDTH = 8;
   localparam integer H_BITW = log2(WIDTH);
   localparam integer V_BITW = log2(HEIGHT);

   // inputs / outputs
   input wire 	               clk, n_rst;
   input wire [BIT_WIDTH-1:0]  r_in, g_in, b_in;
   input wire [H_BITW-1:0]     hcount_in;
   input wire [V_BITW-1:0]     vcount_in;
   output wire [BIT_WIDTH-1:0] r_out, g_out, b_out;
   output wire [H_BITW-1:0]    hcount_out;
   output wire [V_BITW-1:0]    vcount_out;

   // buffering
   reg [BIT_WIDTH-1:0] 	       r, g, b;
   reg [H_BITW-1:0] 	       hcount;
   reg [V_BITW-1:0] 	       vcount;
   always @(posedge clk) begin
      if (!n_rst)
	{r, g, b, hcount, vcount} <= 0;
      else
	{r, g, b, hcount, vcount} <= {r_in, g_in, b_in, hcount_in, vcount_in};
   end

   // -------------------------------------------------------------------------
   wire              outputting,  out_valid;
   wire [V_BITW-1:0] out_start_v, out_end_v;
   wire [H_BITW-1:0] out_start_h, out_end_h;
   wire [7:0] 	     out_min_a,   out_max_a;
   
   simple_lsd
     #( .BIT_WIDTH(BIT_WIDTH),
	.IMAGE_HEIGHT(W_WIDTH), .IMAGE_WIDTH(W_HEIGHT),
	.FRAME_HEIGHT(HEIGHT),  .FRAME_WIDTH(WIDTH)      )
   lsd_0
     (  .clock(clk), .n_rst(n_rst),
	.in_r(r), .in_g(g), .in_b(b), .in_vcnt(vcount), .in_hcnt(hcount),
	.outputting(outputting),   .out_valid(out_valid),
	.out_start_v(out_start_v), .out_start_h(out_start_h), 
	.out_end_v(out_end_v),     .out_end_h(out_end_h),
	.out_min_a(out_min_a),     .out_max_a(out_max_a)   );

   assign r_out = (outputting && out_valid &&
		   ((out_start_v == vcount && out_start_h == hcount) ||
		    (out_end_v == vcount && out_end_h == hcount))) ? 
		  ({1'b0, out_min_a} + out_max_a) >> 1 : 0;   // | tekitou
   assign g_out = r_out;                                      // | \(^o^)/
   assign b_out = r_out;                                      // |  chaos
   assign vcount_out = vcount;
   assign hcount_out = hcount;

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
