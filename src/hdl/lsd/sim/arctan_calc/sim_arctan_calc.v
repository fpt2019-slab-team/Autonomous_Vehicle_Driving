`timescale 1ns/1ns

module sim_arctan_calc();

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
      $shm_open("arctan_calc.shm");
      $shm_probe("ACM");
      #600000
	$finish;
   end
   
   // -------------------------------------------------------------------------
   reg signed [8:0] x1, x2;
   always @(posedge clock) begin
      if(!n_rst) begin
	 x1 <= -255;
	 x2 <= -255;
      end
      else begin
	 if(x2 == 255) begin
	    x2 <= -255;
	    if(x1 == 255)
	      x1 <= -255;
	    else
	      x1 <= x1 + 1;
	 end
	 else
	   x2 <= x2 + 1;
      end
   end

   wire signed [8:0] tgt_x1, tgt_x2;
   delay
     #( .BIT_WIDTH(18), .LATENCY(5) )
   dly_0
     (  .clock(clock), .n_rst(n_rst), .in_data({x1, x2}),
	.out_data({tgt_x1, tgt_x2}));

   wire [7:0] 	     ans, res;
   assign ans = (($atan2(tgt_x1, tgt_x2) / 6.2831853071796) + 1.0) * 256.0;
   
   
   arctan_calc atan_0
     ( .clock(clock), .in_x1(x1), .in_x2(x2), .out_val(res) );

   wire [7:0] 	     diff;
   assign diff = angle_diff(res, ans);

   reg [31:0] 	     count [0:7];
   integer 	     i;
   always @(posedge clock) begin
      if(!n_rst) begin
	 for(i = 0; i < 8; i = i + 1)
	   count[i] <= 0;
      end
      else begin
	 for(i = 0; i < 7; i = i + 1) begin
	    if(diff == i)
	      count[i] <= count[i] + 1;
	 end
	 if(diff >= 7)
	   count[7] <= count[7] + 1;
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

   function [7:0] angle_diff;
      input [7:0] a, b;
      reg [7:0]   abs_diff;  // this is not a register
      begin
	 abs_diff   = (a > b) ? (a - b) : (b - a);
	 angle_diff = ({abs_diff, 1'b0} < (1 << 8)) ?
		      abs_diff : (1 << 8) - abs_diff;
      end
   endfunction

   
endmodule

