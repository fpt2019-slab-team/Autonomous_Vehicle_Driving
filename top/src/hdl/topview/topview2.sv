`default_nettype none

module topview
  #( parameter integer IN_HEIGHT  = -1,
     parameter integer IN_WIDTH   = -1,
     parameter integer OUT_HEIGHT = -1,
     parameter integer OUT_WIDTH  = -1,
     parameter real    SCALE      =  1.0, 
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
     raddr, ready, line_num
   );

   // localparam integer BIT_WIDTH     = 32;
   localparam C0_WIDTH                 = bitW(SCALE * F * HVC * $sin(THETA) - SCALE * HVC * CY * $cos(THETA));
   localparam signed [C0_WIDTH-1:0] C0 =      SCALE * F * HVC * $sin(THETA) - SCALE * HVC * CY * $cos(THETA);   
   localparam C1_WIDTH                 = bitW(SCALE * HVC * $cos(THETA));
   localparam signed [C1_WIDTH-1:0] C1 =      SCALE * HVC * $cos(THETA);
   localparam C2_WIDTH                 = bitW(SCALE * FP * HC);
   localparam signed [C2_WIDTH-1:0] C2 =      SCALE * FP * HC;
   localparam C3_WIDTH                 = bitW(SCALE * FP * HC * CX);
   localparam signed [C3_WIDTH-1:0] C3 =      SCALE * FP * HC * CX;
   localparam C4_WIDTH                 = bitW(SCALE * FP * HC * $sin(THETA));
   localparam signed [C4_WIDTH-1:0] C4 =      SCALE * FP * HC * $sin(THETA);
   localparam C5_WIDTH                 = bitW(SCALE * FP * HC * $sin(THETA) * CY + SCALE * FP * HC * F * $cos(THETA));
   localparam signed [C5_WIDTH-1:0] C5 =      SCALE * FP * HC * $sin(THETA) * CY + SCALE * FP * HC * F * $cos(THETA);
   localparam C6_WIDTH                 = bitW(CYP + FP * DVC / HVC);
   localparam signed [C6_WIDTH-1:0] C6 =      CYP + FP * DVC / HVC;

   localparam integer H_BITW  = $clog2(IN_WIDTH);  // 10
   localparam integer V_BITW  = $clog2(IN_HEIGHT); // 9
   localparam integer OUT_H_BITW = $clog2(OUT_WIDTH);   
   localparam integer OUT_V_BITW = $clog2(OUT_HEIGHT);

   localparam integer RAM_SIZE = 4096;
   localparam integer RAM_ADDR_W = $clog2(RAM_SIZE);
   localparam integer DATA_WIDTH = 2 * (OUT_V_BITW + OUT_H_BITW) + 1;
   
   // inputs / outputs --------------------------------------------------------
   input wire 	                clk, n_rst, in_flag, in_valid;   
   input wire [V_BITW-1:0] 	in_start_v, in_end_v;
   input wire [H_BITW-1:0] 	in_start_h, in_end_h;
   input wire [RAM_ADDR_W-1:0] 	raddr;

   output wire [OUT_V_BITW-1:0] out_start_v, out_end_v;
   output wire [OUT_H_BITW-1:0] out_start_h, out_end_h;
   output wire 			       out_valid;
   output reg 			       ready;
   output reg [RAM_ADDR_W-1:0] 	       line_num;
   
   // topview transformation --------------------------------------------------
   localparam integer DIV_W = 32;
   reg signed [DIV_W-1:0] out_h0, out_v0, out_h1, out_v1;
   
   topview_trans
     #(  .IN_HEIGHT(IN_HEIGHT), .IN_WIDTH(IN_WIDTH),
	 .DIV_W(DIV_W),
	 .C0(C0), .C1(C1), .C2(C2), .C3(C3), .C4(C4), .C5(C5), .C6(C6),
	 .CXP(CXP) )
   topview_trans_inst0
     (   .clk(clk), 
	  .in_v(in_start_v), .in_h(in_start_h),
	 .out_v(out_v0),    .out_h(out_h0) ),
   topview_trans_inst1
     (   .clk(clk), 
	  .in_v(in_end_v), .in_h(in_end_h),
	 .out_v(out_v1),  .out_h(out_h1) );

   wire 		  valid;
   assign valid = 0 <= out_h0 && out_h0 < OUT_WIDTH  && 0 <= out_h1 && out_h1 < OUT_WIDTH &&
		  0 <= out_v0 && out_v0 < OUT_HEIGHT && 0 <= out_v1 && out_v1 < OUT_HEIGHT;
   
   // BRAM ---------------------------------------------------------------------
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

   
   assign wdata = {out_v0[OUT_V_BITW-1:0], out_h0[OUT_H_BITW-1:0], 
		   out_v1[OUT_V_BITW-1:0], out_h1[OUT_H_BITW-1:0], 
		   valid};
   
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
	    waddr <= '0;
	 end
      end
   end
   
   BRAM 
    #(.DATA_SIZE(RAM_SIZE), .DATA_WIDTH(DATA_WIDTH) )
   topview_ls_bram
     (
      .clk(clk), .wen(flag_buff[3] && valid_buff[3]), 
      .waddr(waddr), .wdata(wdata),
      .raddr(raddr), .rdata({out_start_v, out_start_h, out_end_v, out_end_h, out_valid})
      );

   
   // function ----------------------------------------------------------------
   function integer log2;  
      input integer value;  
      begin  
         value = value-1;  
         for (log2=0; value>0; log2=log2+1)  
           value = value>>1;  
      end  
   endfunction  
   
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
      input integer signed value;
      begin
	 bitW = log2(abs(value)) + 1;
      end
   endfunction
endmodule // topview

module topview_trans
  #(
    parameter IN_HEIGHT  = -1,
    parameter IN_WIDTH   = -1,
    parameter DIV_W      = -1,
    parameter signed C0  = -1, 
    parameter signed C1  = -1,
    parameter signed C2  = -1,
    parameter signed C3  = -1,
    parameter signed C4  = -1,
    parameter signed C5  = -1,
    parameter signed C6  = -1,
    parameter signed CXP = -1 ) 
   (
    clk,
    in_v, in_h, 
    out_v, out_h
   );

   input wire 	      clk;
   input wire [$clog2(IN_HEIGHT)-1:0] in_v;
   input wire [$clog2(IN_WIDTH)-1:0] in_h;
   output reg signed [DIV_W-1:0] out_v;
   output reg signed [DIV_W-1:0] out_h;
   
   localparam f0_WID = bitW(C1 * (IN_HEIGHT-1));
   localparam f1_WID = bitW(C2 * ( IN_WIDTH-1));
   localparam f2_WID = bitW(C4 * (IN_HEIGHT-1));
   localparam g0_WID = bitW2( C0, C0 + C1 * (IN_HEIGHT-1));
   localparam g1_WID = bitW2(-C3, C2 * ( IN_WIDTH-1) - C3);
   localparam g2_WID = bitW2(-C5, C4 * (IN_HEIGHT-1) - C5);

   localparam N_WID = (g1_WID > g2_WID) ? g1_WID : g2_WID;
      
   reg signed [f0_WID-1:0] f0;
   reg signed [f1_WID-1:0] f1;
   reg signed [f2_WID-1:0] f2;
   reg signed [g0_WID-1:0] g0;
   reg signed [ N_WID-1:0] g1;
   reg signed [ N_WID-1:0] g2;
   reg signed [DIV_W-1:0]  h0;   
   reg signed [DIV_W-1:0]  h1;

   wire signed [N_WID-1:0] g1_d_g0, g2_d_g0;
   
   divider
     #( 
	.N_WID(N_WID), 
	.D_WID(g0_WID) 
     )
   divider_inst0
     (
	.clk(clk), 
	.N(g1), .D(g0), 
	.Q(g1_d_g0)
     ),
   divider_inst1
     (
	.clk(clk), 
	.N(g2), .D(g0), 
	.Q(g2_d_g0)
     );
   
   always @(posedge clk) begin
      // 0 --------------------------------------------
      f0 <= C1 * in_v;
      f1 <= C2 * in_h;
      f2 <= C4 * in_v;

      // 1 ------------------------------------------
      g0 <= C0 + f0;
      g1 <= f1 - C3;
      g2 <= f2 - C5;

      // 2~N_WID+4 -----------------------------------------
      h0 <= g1_d_g0;
      h1 <= g2_d_g0;

      // N_WID+5 --------------------------------------------
      out_h <= h0 + CXP;
      out_v <= C6 + h1;
   end

   // function ----------------------------------------------------------------
   function integer log2;  
      input integer value;  
      begin  
         value = value-1;  
         for (log2=0; value>0; log2=log2+1)  
           value = value>>1;  
      end  
   endfunction  
   
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
      input integer signed value;
      begin
	 bitW = log2(abs(value)) + 1;
      end
   endfunction

   function integer bitW2;
      input integer signed v0, v1;
      begin
	 if(abs(v0) > abs(v1)) 
	   bitW2 = log2(abs(v0)) + 1;
	 else
	   bitW2 = log2(abs(v1)) + 1;
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

/*
function integer bitW2;
      input integer signed v0, v1;
      begin
	 if(abs(v0) > abs(v1)) 
	   bitW2 = log2(abs(v0)) + 1;
	 else
	   bitW2 = log2(abs(v1)) + 1;
      end
   endfunction

   function integer bitW4;
      input integer signed v0, v1, v2, v3;
      begin
	 if(abs(v0) > abs(v1) && abs(v0) > abs(v2) && abs(v0) > abs(v3)) 
	   bitW4 = log2(abs(v0)) + 1;
	 else if(abs(v1) > abs(v0) && abs(v1) > abs(v2) && abs(v1) > abs(v3)) 
	   bitW4 = log2(abs(v1)) + 1;
	 else if(abs(v2) > abs(v0) && abs(v2) > abs(v1) && abs(v2) > abs(v3))
	   bitW4 = log2(abs(v2)) + 1;
	 else
	   bitW4 = log2(abs(v3)) + 1;
      end
   endfunction
*/


// Q = N / D
// N_WID + 2
// D = 0
//       N  < 0 -> Q = -inf
//       N >= 0 -> Q =  inf
module divider
  # (
     parameter N_WID = -1,
     parameter D_WID = -1
     ) 
   (clk, N, D, Q);

   localparam signed [N_WID-1:0] MIN = 1 << (N_WID - 1);
   localparam signed [N_WID-1:0] MAX = ~MIN;
      
   input wire clk;
   input wire signed [N_WID-1:0] N;
   input wire signed [D_WID-1:0] D;
   output reg signed [N_WID-1:0] Q;

   reg invers[0:N_WID];
   reg d_zero[0:N_WID];
   wire N_plus, D_plus;
   assign N_plus = ~N[N_WID-1];
   assign D_plus = ~D[D_WID-1];
   wire [N_WID-1:0] N_abs;
   wire [D_WID-1:0] D_abs;
   assign N_abs = (N_plus) ? N : -N;
   assign D_abs = (D_plus) ? D : -D;
   
   reg [N_WID-1:0]   Ns[0:N_WID-1];
   reg [D_WID-1:0]   Ds[0:N_WID-1];
   reg [D_WID+1-1:0] Rs[0:N_WID-1];
   reg [N_WID-1:0]   Qs[0:N_WID];

   wire [D_WID+1-1:0] R_sub_D[0:N_WID-1];
   genvar i;
   generate
      for (i = 0; i < N_WID; i = i + 1) begin : compare_RD
	 assign R_sub_D[i] = Rs[i] - Ds[i];
      end
   endgenerate
   
   always @(posedge clk) begin
      // 0 : set absolute value, sign-------------------------------------------
      invers[0] <= N_plus ^ D_plus;
      d_zero[0] <= (D == 0); 
      Ns[0] <= N_abs;
      Ds[0] <= D_abs;
      Rs[0] <= N_abs[N_WID-1];
      
      // 1~N_WID-1 --------------------------------------------
      for (integer ii = 0; ii < N_WID - 1; ii = ii + 1) begin
	 invers[ii + 1] <= invers[ii];
	 d_zero[ii + 1] <= d_zero[ii];
	 Ns[ii + 1] <= Ns[ii];
	 Ds[ii + 1] <= Ds[ii];
	 for(integer j = N_WID - ii; j < N_WID; j = j + 1)
	   Qs[ii + 1][j] <= Qs[ii][j];
	 
	 if (R_sub_D[ii][D_WID] == 1'b0) begin // R > D	    
	    Qs[ii + 1][N_WID-1 - ii] <= 1'b1;
	    Rs[ii + 1] <= {R_sub_D[ii][D_WID-1:0], Ns[ii][N_WID-2 - ii]};
	 end else begin
	    Qs[ii + 1][N_WID-1 - ii] <= 1'b0;
	    Rs[ii + 1] <= {Rs[ii][D_WID-1:0], Ns[ii][N_WID-2 - ii]};
	 end	 
      end

      // N_WID ---------------------------------------------------
      invers[N_WID] <= invers[N_WID-1];
      d_zero[N_WID] <= d_zero[N_WID-1];
      Qs[N_WID][N_WID-1:1] <= Qs[N_WID-1][N_WID-1:1];
      Qs[N_WID][0] <= ~R_sub_D[N_WID-1][D_WID];
      
      // N_WID+1 : inverse --------------------------------------------------
      Q <= (invers[N_WID]) ? 
	   ((d_zero[N_WID]) ? MIN : $signed(-Qs[N_WID])) : 
	   ((d_zero[N_WID]) ? MAX : $signed(Qs[N_WID]));
   end
endmodule


`default_nettype wire
