`default_nettype none

module topview
  #( parameter integer IN_HEIGHT  = -1,
     parameter integer IN_WIDTH   = -1,
     parameter integer OUT_HEIGHT = -1,
     parameter integer OUT_WIDTH  = -1,
     parameter real    SCALE      = -1, 
     parameter integer HVC        = -1,
     parameter integer HC         = -1,
     parameter integer DVC        = -1,
     parameter integer F          = -1,
     parameter integer FP         = -1,
     parameter real    THETA      = -1.0,
     parameter integer signed CX  = -1,
     parameter integer signed CY  = -1,
     parameter integer signed CXP = -1,
     parameter integer signed CYP = -1 )
   ( clk, n_rst,
     in_flag, in_valid, in_start_v, in_start_h, in_end_v, in_end_h,
     out_start_v, out_start_h, out_end_v, out_end_h, out_valid,
     raddr, rdata, ready, line_num
   );

   localparam integer BIT_WIDTH         = 32;
   localparam signed [BIT_WIDTH-1:0] C0 = SCALE * F * HVC * $sin(THETA) - SCALE * HVC * CY * $cos(THETA);
   localparam signed [BIT_WIDTH-1:0] C1 = SCALE * HVC * $cos(THETA);
   localparam signed [BIT_WIDTH-1:0] C2 = SCALE * FP * HC;
   localparam signed [BIT_WIDTH-1:0] C3 = SCALE * FP * HC * CX;
   localparam signed [BIT_WIDTH-1:0] C4 = SCALE * FP * HC * $sin(THETA);
   localparam signed [BIT_WIDTH-1:0] C5 = SCALE * FP * HC * $sin(THETA) * CY + SCALE * FP * HC * F * $cos(THETA);
   localparam signed [BIT_WIDTH-1:0] C6 = CYP + FP * DVC / HVC;

   localparam integer H_BITW  = $clog2(IN_WIDTH);  // 10
   localparam integer V_BITW  = $clog2(IN_HEIGHT); // 9

   localparam integer signed MIN_OUTV_ABS = abs(C6 - C5 / C0);
   localparam integer signed MAX_OUTV_ABS = abs(C6 + (C4 * (IN_HEIGHT - 1) - C5) / (C0 + C1 * (IN_HEIGHT - 1)));
   localparam integer signed MIN_OUTH_ABS = abs(-C3 / C0 + CXP);
   localparam integer signed MAX_OUTH_ABS = abs((C2 * (IN_WIDTH - 1 - CX) - C3) / C0 + CXP);

   // localparam integer OUT_V_BITW = bitW(.minValue(C6 - C5 / C0),   .maxValue(C6 + (C4 * (IN_HEIGHT - 1) - C5) / (C0 + C1 * (IN_HEIGHT - 1)))))
   // localparam integer OUT_H_BITW = bitW(.minValue(-C3 / C0 + CXP), .maxValue((C2 * (IN_WIDTH - 1 - CX) - C3) / C0 + CXP))
   localparam integer OUT_V_BITW = 32;
   localparam integer OUT_H_BITW = 32;

   localparam integer RAM_SIZE = 4096;
   localparam integer RAM_ADDR_W = $clog2(RAM_SIZE);
   localparam integer OUT_H_BITW_2 = $clog2(OUT_WIDTH);
   localparam integer OUT_V_BITW_2 = $clog2(OUT_HEIGHT);
   localparam integer DATA_WIDTH = 2 * (OUT_V_BITW_2 + OUT_H_BITW_2) + 1;
   
   // inputs / outputs --------------------------------------------------------
   input wire 	                clk, n_rst, in_flag, in_valid;   
   input wire [V_BITW-1:0] 	in_start_v, in_end_v;
   input wire [H_BITW-1:0] 	in_start_h, in_end_h;
   input wire [RAM_ADDR_W-1:0] 	raddr;
   
   output wire signed [OUT_V_BITW-1:0] out_start_v, out_end_v;
   output wire signed [OUT_H_BITW-1:0] out_start_h, out_end_h;
   output wire 			       out_valid;
   output wire [DATA_WIDTH-1:0]        rdata;
   output reg 			       ready;
   output reg [RAM_ADDR_W-1:0] 	       line_num;
   
   assign out_valid = 0 <= out_start_h && out_start_h < OUT_WIDTH  && 0 <= out_end_h && out_end_h < OUT_WIDTH &&
		  0 <= out_start_v && out_start_v < OUT_HEIGHT && 0 <= out_end_v && out_end_v < OUT_HEIGHT;
   
   // topview transformation --------------------------------------------------
   topview_trans
     #(  .BIT_WIDTH(BIT_WIDTH), .H_BITW(H_BITW), .V_BITW(V_BITW),
	 .OUT_H_BITW(OUT_H_BITW), .OUT_V_BITW(OUT_V_BITW),
	 .C0(C0), .C1(C1), .C2(C2), .C3(C3), .C4(C4), .C5(C5), .C6(C6),
	 .CXP(CXP) )
   topview_trans_inst0
     (   .clk(clk), 
	 .in_v(in_start_v),   .in_h(in_start_h),
	 .out_v(out_start_v), .out_h(out_start_h) ),
   topview_trans_inst1
     (   .clk(clk), 
	 .in_v(in_end_v),   .in_h(in_end_h),
	 .out_v(out_end_v), .out_h(out_end_h) );

   // BRAM ---------------------------------------------------------------------

   // LSDの出力との遅延分ずらす
   reg flag_buff[0:3], valid_buff[0:3];
   always@(posedge clk) begin
      flag_buff[0] <= in_flag;
      valid_buff[0] <= in_valid;
      for(integer ii = 0; ii < 3; ii = ii + 1) begin
	 flag_buff[ii + 1] <= flag_buff[ii];
	 valid_buff[ii + 1] <= valid_buff[ii];
      end
   end
   

   reg [RAM_ADDR_W-1:0] waddr;
   wire [DATA_WIDTH-1:0] wdata;
   
   assign wdata = {out_start_v[OUT_V_BITW_2-1:0], out_start_h[OUT_H_BITW_2-1:0], 
		     out_end_v[OUT_V_BITW_2-1:0],   out_end_h[OUT_H_BITW_2-1:0], out_valid};
   
   always @(posedge clk) begin
      if(!n_rst) begin
	 ready <= '0;
	 line_num <= '0;
      end else begin
	 if(flag_buff[3]) begin
	    ready <= '0;
	    if(valid_buff[3]) begin
	       waddr <= waddr + 1'b1;
	       line_num <= line_num + 1'b1;
	    end
	 end else begin
	    if(line_num != 0)
	      ready <= 1'b1;
	    waddr <= '1 - 3; // LSDの出力との遅延分ずらし
	 end
      end
   end
   
   
   BRAM 
    #(.DATA_SIZE(RAM_SIZE), .DATA_WIDTH(DATA_WIDTH) )
   topview_ls_bram
     (
      .clk(clk), .wen(flag_buff[3] && valid_buff[3]), 
      .waddr(waddr), .wdata(wdata),
      .raddr(raddr), .rdata(rdata)
      );

   
   // function ----------------------------------------------------------------
   function integer signed abs;
      input integer signed value;
      begin
	 if(value > 0) 
	   abs = value;
	 else
	   abs = -value;
      end
   endfunction

   function integer bitW;
      input integer signed minValue, maxValue;
      integer min_abs = abs(minValue), max_abs = abs(maxValue);
      begin
	 if(max_abs > min_abs) 
	   bitW = $clog2(max_abs) + 1;
	 else
	   bitW = $clog2(min_abs) + 1;
      end
   endfunction
   
endmodule // topview

module topview_trans
  #(
    parameter integer BIT_WIDTH  = 32,
    parameter integer H_BITW     = -1,
    parameter integer V_BITW     = -1,
    parameter integer OUT_H_BITW = -1,
    parameter integer OUT_V_BITW = -1,
    parameter integer signed C0  = -1, 
    parameter integer signed C1  = -1,
    parameter integer signed C2  = -1,
    parameter integer signed C3  = -1,
    parameter integer signed C4  = -1,
    parameter integer signed C5  = -1,
    parameter integer signed C6  = -1,
    parameter integer signed CXP = -1 ) 
   (
    clk,
    in_v, in_h, 
    out_v, out_h
   );

   input wire 	      clk;
   input wire [V_BITW-1:0] in_v;
   input wire [H_BITW-1:0] in_h;
   output wire signed [OUT_V_BITW-1:0] out_v;
   output wire signed [OUT_H_BITW-1:0] out_h;

   
   reg signed [BIT_WIDTH-1:0] 	f[0:2], g[0:2], h[0:1], I[0:1];
   
   always @(posedge clk) begin
      f[0] <= C1 * in_v;
      f[1] <= C2 * in_h;
      f[2] <= C4 * in_v;
      
      g[0] <= C0 + f[0];
      g[1] <= f[1] - C3;
      g[2] <= f[2] - C5;

      h[0] <= g[1] / g[0];
      h[1] <= g[2] / g[0];

      I[0] <= h[0] + CXP;
      I[1] <= C6 + h[1];
   end

   assign out_v = I[1];
   assign out_h = I[0];

   // function ----------------------------------------------------------------
   function integer signed abs;
      input integer signed value;
      begin
	 if(value > 0) 
	   abs = value;
	 else
	   abs = -value;
      end
   endfunction

   function integer bitW;
      input integer signed minValue, maxValue;
      integer min_abs = abs(minValue), max_abs = abs(maxValue);
      begin
	 if(max_abs > min_abs) 
	   bitW = $clog2(max_abs) + 1;
	 else
	   bitW = $clog2(min_abs) + 1;
      end
   endfunction

   
endmodule
   
module BRAM
  # (
     parameter integer DATA_WIDTH = -1, DATA_SIZE = -1
     )(clk, wen, waddr, raddr, wdata, rdata);
   
   localparam integer  ADDR_WIDTH = $clog2(DATA_SIZE);
   input wire clk, wen;
   input wire  [ADDR_WIDTH-1:0] waddr, raddr;
   input wire  [DATA_WIDTH-1:0] wdata;
   output wire [DATA_WIDTH-1:0] rdata;

   reg [ADDR_WIDTH-1:0]        baddr;
   (* RAM_STYLE="BLOCK" *) reg [DATA_WIDTH-1:0] ram[0:2 ** ADDR_WIDTH-1];
   always@ (posedge clk) begin
      if(wen)
	ram[waddr] <= wdata;
      baddr <= raddr; 
   end
   
   assign rdata = ram[baddr];
endmodule


`default_nettype wire
