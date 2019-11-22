`timescale 1ns/1ps
`default_nettype none

module sim_topview();
   localparam integer SIM_CYCLES = 700000;
   localparam real    CLOCK_PERIOD = 1000.0 / 27; // (27MHz)
   parameter integer  IN_WIDTH   = 640;
   parameter integer  IN_HEIGHT  = 80;
   parameter integer  OUT_WIDTH  = 1 * 640; // 180 1640
   parameter integer  OUT_HEIGHT = 1 * 480; // 480 3000
   parameter real     SCALE      = 0.5;
   parameter integer  HVC        = 62; // 40 50
   parameter integer  HC         = 5;  // 5
   parameter integer  DVC        = 50; // 45 50
   parameter integer  F          = 210;
   parameter integer  FP         = 210;
   parameter real     THETA      = 15 * $acos(-1) / 180.0; // 20 13.5
   parameter integer  CX   = IN_WIDTH / 2;
   parameter integer  CY   = IN_HEIGHT / 2;
   parameter integer  CXP  = OUT_WIDTH / 2;
   parameter integer  CYP  = OUT_HEIGHT / 2;

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

   localparam integer H_BITW  = $clog2(IN_WIDTH) + 1;  // 10
   localparam integer V_BITW  = $clog2(IN_HEIGHT) + 1; // 9
   localparam integer OUT_H_BITW = $clog2(OUT_WIDTH) + 1;   
   localparam integer OUT_V_BITW = $clog2(OUT_HEIGHT) + 1;

   localparam integer RAM_SIZE = 4096;
   localparam integer RAM_ADDR_W = $clog2(RAM_SIZE) + 1;
   localparam integer DATA_WIDTH = 2 * (OUT_V_BITW + OUT_H_BITW) + 1;
   
   reg clk, n_rst;
   reg [$clog2(IN_HEIGHT):0] in_start_v, in_end_v;
   reg [$clog2(IN_WIDTH):0]  in_start_h, in_end_h;
   reg [RAM_ADDR_W-1:0]      raddr;
   
   wire signed [OUT_V_BITW-1:0]  out_start_v, out_end_v;
   wire signed [OUT_H_BITW-1:0]  out_start_h, out_end_h;
   wire 			 valid;
   wire [DATA_WIDTH-1:0] 	 rdata;
   
   topview
     #(
       .IN_WIDTH(IN_WIDTH), .IN_HEIGHT(IN_HEIGHT),
       .OUT_WIDTH(OUT_WIDTH), .OUT_HEIGHT(OUT_HEIGHT),
       .SCALE(SCALE),
       .HVC(HVC), .HC(HC), .DVC(DVC),
       .F(F), .FP(FP),
       .THETA(THETA),
       .CX(CX), .CY(CY),
       .CXP(CXP), .CYP(CYP)
       )
   topview_inst
     (
      .clk(clk), .n_rst(n_rst),
      .in_start_v(in_start_v), .in_start_h(in_start_h), .in_end_v(in_end_v), .in_end_h(in_end_h),
      .out_start_v(out_start_v), .out_start_h(out_start_h), .out_end_v(out_end_v), .out_end_h(out_end_h),
      .valid(valid),
      .raddr(raddr), .rdata(rdata)
      );
     
   initial begin
      raddr <= '0;
      clk <= 1'b0;
      repeat(SIM_CYCLES) begin
	 #(CLOCK_PERIOD / 2)
	 clk <= 1'b1;
	 #(CLOCK_PERIOD / 2)
	 clk <= 1'b0;
      end
      $finish;
   end

   initial begin
      n_rst <= 1'b0;
      #(CLOCK_PERIOD)
      n_rst <= 1'b1;
   end
   /*
   initial begin
      integer flag = 0;
      $write("C0=%d C1=%d C2=%d C3=%d C4=%d C5=%d\n", topview_inst.C0, topview_inst.C1, topview_inst.C2, topview_inst.C3, topview_inst.C4, topview_inst.C5);

      in_start_h <= '0;
      in_start_v <= '0;
      in_end_h <= '0;
      in_end_v <= '0;
      
      forever begin
	 $write(" %9d %9d ", in_start_v, in_start_h);
	 $write(" %9d %9d ", out_start_v, out_start_h);
	 $write("\n");

	 @(posedge clk);	 
	 if(in_start_h == IN_WIDTH - 1) begin
	    in_start_h <= '0;
	    if(in_start_v == IN_HEIGHT - 1) begin
	       in_start_v <= '0;
	       flag = 1;
	    end else
	      in_start_v <= in_start_v + 1'b1;
	 end else
	   in_start_h <= in_start_h + 1'b1;

	 if(flag > 0) flag++;
	 
	 // if(out_start_h != 'x && out_start_v != 'x && out_end_h != 'x && out_end_v != 'x)
	 // if(-2 * IN_WIDTH <= out_start_h && out_start_h < 2 * IN_WIDTH && -2 * IN_WIDTH <= out_end_h && out_end_h < 2 * IN_WIDTH && -2 * IN_HEIGHT <= out_start_v && out_start_v < 2 * IN_HEIGHT && -2 * IN_HEIGHT <= out_end_v && out_end_v < 2 * IN_HEIGHT)
	 
	 if(flag == 5)
	   $finish;
      end
   end
   */
   
    initial begin
       integer fd1, fd2, in_h0, in_v0, in_h1, in_v1, fscanf_ret, cnt;
       // fd1 = $fopen("road2_segment.dat", "r");
       // fd2 = $fopen("road2_top_segment_draw.dat", "w");
       fd1 = $fopen("segment2.dat", "r");
       fd2 = $fopen("top_segment2_draw.dat", "w");
       cnt = 0;

       $write("H_BITW=%d V_BITW=%d OUT_H_BITW=%d OUT_V_BITW=%d \n", H_BITW, V_BITW, OUT_H_BITW, OUT_V_BITW);
       $write("C0=%d C1=%d C2=%d C3=%d C4=%d C5=%d C6=%d\n", topview_inst.C0, topview_inst.C1, topview_inst.C2, topview_inst.C3, topview_inst.C4, topview_inst.C5, topview_inst.C6);
       $write("C0_W=%d C1_W=%d C2_W=%d C3_W=%d C4_W=%d C5_W=%d C6_W=%d\n", topview_inst.C0_WIDTH, topview_inst.C1_WIDTH, topview_inst.C2_WIDTH, topview_inst.C3_WIDTH, topview_inst.C4_WIDTH, topview_inst.C5_WIDTH, topview_inst.C6_WIDTH);
       
      forever begin
	 // fscanf_ret = $fscanf(fd1, "%d %d %d %d", in_h0, in_v0, in_h1, in_v1);
	 fscanf_ret = $fscanf(fd1, "%f %f %f %f", in_h0, in_v0, in_h1, in_v1);
	 
	 $write(" %3d %3d %3d %3d", in_h0, in_v0, in_h1, in_v1);
	 $write(" %9d %9d %9d %9d ", topview_inst.out_h0, topview_inst.out_v0, topview_inst.out_h1, topview_inst.out_v1);
	 $write(" %9d %9d %9d %9d %3d", out_start_h, out_start_v, out_end_h, out_end_v, valid);
	 $write("\n");
	 
	 if(fscanf_ret == 4) begin
	    in_start_h <= in_h0;
	    in_start_v <= in_v0;
	    in_end_h <= in_h1;
	    in_end_v <= in_v1;
	 end else begin
	    cnt = cnt + 1;
	 end
	 
	 @(posedge clk);
	 // if(out_start_h != 'x && out_start_v != 'x && out_end_h != 'x && out_end_v != 'x)
	 // if(-IN_WIDTH <= out_start_h && out_start_h < 2 * IN_WIDTH && -IN_WIDTH <= out_end_h && out_end_h < 2 * IN_WIDTH && -IN_HEIGHT <= out_start_v && out_start_v < 2 * IN_HEIGHT && -IN_HEIGHT <= out_end_v && out_end_v < 2 * IN_HEIGHT)
	 // if(0 <= out_start_h && out_start_h < IN_WIDTH && 0 <= out_end_h && out_end_h < IN_WIDTH && 0 <= out_start_v && out_start_v < IN_HEIGHT && 0 <= out_end_v && out_end_v < IN_HEIGHT)
	 if(valid)  
	   $fwrite(fd2, " %d %d \n %d %d \n\n", out_start_h, OUT_HEIGHT-out_start_v, out_end_h, OUT_HEIGHT-out_end_v);
	 if(cnt == 4)
	   $finish;
      end
   end
    
   
   initial begin
      $shm_open("topview.shm");
      $shm_probe(topview_inst, "A");
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
endmodule
`default_nettype wire
