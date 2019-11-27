`timescale 1ns/1ns

module sim_simple_lsd();

   reg         base_clock = 0;
   reg [3:0]   state = 0;
   reg 	       clock = 1;
   reg         n_rst = 1;

   // clock generation
   initial begin
      forever begin
	 #1
	   base_clock <= ~base_clock;
      end
   end
   always @(posedge base_clock or negedge base_clock) begin
      clock <= ~clock;
   end
   
   // state control
   always @(posedge clock) begin
      if(state == 0) begin
	 n_rst <= 1;
	 state <= 1;
      end
      else if(state == 1) begin
	 n_rst <= 0;
	 state <= 2;
      end
      else if(state == 2) begin
	 n_rst <= 1;
	 state <= 3;
      end
   end

   // saving configuration and terminate condition ----------------------------
   initial begin
      $shm_open("simple_lsd.shm");
      $shm_probe("AM");
      #1430000
	$finish;
   end

   // initial begin
   //    forever begin
   // 	 #2
   // 	   if(lsd_0.outputting)
   // 	     $display("%d [%d, %d] [%d, %d] (%d, %d)",
   // 		      lsd_0.ram_rd_addr - 1,
   // 		      lsd_0.out_start_v, lsd_0.out_start_h, 
   // 		      lsd_0.out_end_v, lsd_0.out_end_h,
   // 		      lsd_0.out_min_a, lsd_0.out_max_a);
   //    end
   // end
   
   // -------------------------------------------------------------------------
   localparam integer BIT_WIDTH    = 8;
   localparam integer IMAGE_WIDTH  = 960;
   localparam integer IMAGE_HEIGHT = 540;
   localparam integer FRAME_WIDTH  = 1000;
   localparam integer FRAME_HEIGHT = 700;

   // coordinate control
   reg [log2(FRAME_HEIGHT)-1:0]  vcnt;
   reg [log2(FRAME_WIDTH)-1:0]   hcnt;
   always @(posedge clock) begin
      if(!n_rst) begin
	 vcnt <= FRAME_HEIGHT - 1;
	 hcnt <= 0;
      end
      else begin
	 vcnt <= (vcnt + (hcnt == FRAME_WIDTH - 1)) % FRAME_HEIGHT;
	 hcnt <= (hcnt + 1) % FRAME_WIDTH;
      end
   end

   // test pixel generation
   wire [BIT_WIDTH-1:0] r, g, b;
   wire [31:0] 		v2, vh, h2, sum;
   assign v2  = {10'b0, vcnt} * vcnt;
   assign vh  = {10'b0, vcnt} * hcnt;
   assign h2  = {10'b0, hcnt} * hcnt;
   assign sum = {1'b0,  vcnt} + hcnt;
   assign r   = (((v2 + vh) * sum) / 750);
   assign g   = (((v2 + h2) * sum) / 750);
   assign b   = (((h2 + vh) * sum) / 750);

   // conversion from RGB to YCbCr
   wire [BIT_WIDTH-1:0]           y;
   wire [log2(FRAME_HEIGHT)-1:0]  y_vcnt;
   wire [log2(FRAME_WIDTH)-1:0]   y_hcnt;
   rgb2ycbcr
     #( .BIT_WIDTH(BIT_WIDTH), 
	.FRAME_HEIGHT(FRAME_HEIGHT), .FRAME_WIDTH(FRAME_WIDTH))
   r2y_0
     (  .clock(clock),
	.in_r(r), .in_g(g), .in_b(b), .in_vcnt(vcnt), .in_hcnt(hcnt),
	.out_y(y), .out_vcnt(y_vcnt), .out_hcnt(y_hcnt) );
   
   // simple LSD
   wire 			 flag,    valid;
   wire [log2(FRAME_HEIGHT)-1:0] start_v, end_v;
   wire [log2(FRAME_WIDTH)-1:0]  start_h, end_h;
   wire [7:0] 			 angle;
   simple_lsd 
     #( .BIT_WIDTH(BIT_WIDTH),
	.IMAGE_HEIGHT(IMAGE_HEIGHT), .IMAGE_WIDTH(IMAGE_WIDTH), 
	.FRAME_HEIGHT(FRAME_HEIGHT), .FRAME_WIDTH(FRAME_WIDTH) )
   lsd_0
     (  .clock(clock),  .n_rst(n_rst),
	.in_y(y), .in_vcnt(y_vcnt), .in_hcnt(y_hcnt),
	.out_flag(flag),       .out_valid(valid), 
	.out_start_v(start_v), .out_start_h(start_h),
	.out_end_v(end_v),     .out_end_h(end_h),     .out_angle(angle) );

   reg [31:0] 			 res_count = 0;
   always @(posedge clock) begin
      if(flag && valid)
	res_count <= res_count + 1;
   end

   
   // visualizer
   //   #( .BIT_WIDTH(BIT_WIDTH),
   // 	.IMAGE_HEIGHT(IMAGE_HEIGHT), .IMAGE_WIDTH(IMAGE_WIDTH), 
   // 	.FRAME_HEIGHT(FRAME_HEIGHT), .FRAME_WIDTH(FRAME_WIDTH))
   // vis_0
   //   (  .clock(clock), .in_outputting(outputting), .in_valid(valid),
   // 	.in_vcnt(vcnt),       .in_hcnt(hcnt),
   // 	.in_start_v(start_v), .in_start_h(start_h),
   // 	.in_end_v(end_v),     .in_end_h(end_h),
   // 	.in_min_a(min_a),     .in_max_a(max_a)      );

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

