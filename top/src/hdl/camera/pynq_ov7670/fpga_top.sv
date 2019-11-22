//
//  OV7670 test desgin
//

`default_nettype none
module fpga_top
  (
   input wire        sysclk,
   input wire [3:0]  btn,
   input wire [1:0]  sw,
   output wire [3:0] led,
   output wire       cam_PWDN,
   output wire       cam_XCLK,
   output wire       cam_RESET,
   output wire 			 cam_SIOC,
   inout wire        cam0_SIOD,
   input wire        cam0_PCLK,
   input wire        cam0_VSYNC,
   input wire        cam0_HREF,
   input wire [7:0]  cam0_D,
   inout wire        cam1_SIOD,
   input wire        cam1_PCLK,
   input wire        cam1_VSYNC,
   input wire        cam1_HREF,
   input wire [7:0]  cam1_D,
   output wire       led4_g,
   output wire       led5_g,
   output wire       hdmi_tx_clk_n,
   output wire       hdmi_tx_clk_p,
   output wire [2:0] hdmi_tx_d_n,
   output wire [2:0] hdmi_tx_d_p   
   );

   //
   // Parameters
   //
   localparam int    HORIZONTAL_ACTIVE_TIME = 1280;
   localparam int    HORIZONTAL_BLANKING_TIME = 368;
   localparam int    HORIZONTAL_SYNC_OFFSET = 72;
   localparam int    HORIZONTAL_SYNC_PULSE_WIDTH = 80;
   localparam int    VERTICAL_ACTIVE_TIME = 720;
   localparam int    VERTICAL_BLANKING_TIME = 30;
   localparam int    VERTICAL_SYNC_OFFSET = 3;
   localparam int    VERTICAL_SYNC_PULSE_WIDTH = 5;

   localparam int    WIDTH = HORIZONTAL_ACTIVE_TIME + HORIZONTAL_BLANKING_TIME;
   localparam int    HEIGHT = VERTICAL_ACTIVE_TIME + VERTICAL_BLANKING_TIME;
   localparam int    W_WIDTH = HORIZONTAL_ACTIVE_TIME;
   localparam int    W_HEIGHT = VERTICAL_ACTIVE_TIME;

   localparam int    CAM_WINDOW_WIDTH  = 640;
   localparam int    CAM_WINDOW_HEIGHT = 480;
   localparam int    CAM_WINDOW_PIXELS = CAM_WINDOW_WIDTH * CAM_WINDOW_HEIGHT;
   localparam int    DATA_WIDTH	= 8;

   //
   // PS PL Communication
   //
   design_2 design_2_inst
     (
      .sccb_recv_data(sccb_recv_data),
      .sccb_busy(sccb_busy),
      .sccb_req(sccb_req),
      .sccb_send_data(sccb_send_data)
      );
   
   //
   // Clock and reset
   //
   wire              locked;
   wire              clk_24m, rst_24m;      
   wire              clk_74_25m, rst_74_25m;

   clk_wiz_0 clk_wiz_0_inst
     (
      .clk_in1(sysclk),     // 125MHz
      .reset(btn[0]),
      .locked(locked),
      .clk_out1(clk_24m),   // 24M Hz
      .clk_out2(clk_74_25m) // 74.25 MHz
      );

   reg [3:0]         rst_24m_sync_regs = 4'h0;
   always @(posedge clk_24m) begin
      rst_24m_sync_regs <= {rst_24m_sync_regs[2:0], ~locked};
   end
   assign rst_24m = rst_24m_sync_regs[3];

   reg [3:0] rst_74_25m_sync_regs = 4'h0;
   always @(posedge clk_74_25m) begin
      rst_74_25m_sync_regs <= {rst_74_25m_sync_regs[2:0], ~locked};
   end
   assign rst_74_25m = rst_74_25m_sync_regs[3];

   //
   // Camera0 initilization via SCCB
   //
   wire sccb_req, sccb_busy;
   wire [23:0] sccb_send_data;
   wire [7:0]  sccb_recv_data;
   sccb_if
     #(
       .CLOCK_FREQ(125 * 10 ** 6),
       .SCL_FREQ(200 * 10 ** 3)
       )
   sccb_if_inst
     (
      .sysclk(sysclk),
      .n_rst(!rst_74_25m),
      .req(sccb_req),
      .send_data(sccb_send_data),
      .recv_data(sccb_recv_data),
      .busy(sccb_busy),
      .scl(cam_SIOC),
      .sda(cam_SIOD)
      );
   assign cam_PWDN = 1'b0;
   assign cam_XCLK = clk_24m;
   assign cam_RESET = locked;
   
   //
   // camera1 inirilization via SCCB
   //

   //
   // Pixel input
   //
   reg [$clog2(CAM_WINDOW_PIXELS)+2:0] pixel0_count, pixel0_addr, graypixel0_addr;
   reg [15:0]                          pixel0_reg;
   reg                                 pixel0_we;
   reg [$clog2(CAM_WINDOW_PIXELS)+2:0] pixel1_count, pixel1_addr, graypixel1_addr;
   reg [15:0]                          pixel1_reg;
   reg                                 pixel1_we;

	 /* copy this start */
   always @(posedge cam0_PCLK) begin
      pixel0_we <= cam0_HREF;
   end

   always @(posedge cam0_PCLK) begin
      if (pixel0_count[0] == 1'b0)
	pixel0_reg[7:0] <= cam0_D;
      else
	pixel0_reg[15:8] <= cam0_D;          
   end

   always @(posedge cam0_PCLK) begin
      if (cam0_VSYNC) 
	pixel0_count <= '0;
      else if (cam0_HREF) 
	pixel0_count <= pixel0_count + 1'b1;
   end

   always @(posedge cam0_PCLK) begin
      pixel0_addr <= pixel0_count;
   end
	 /* copy this end */

   //
   // HDMI timing generators
   //
   reg [$clog2(WIDTH)-1:0] hcount = '0;
   always @(posedge clk_74_25m) begin
      if (rst_74_25m)
	hcount = '0;
      else begin
	 if (hcount == WIDTH-1)
	   hcount <= '0;
	 else
	   hcount <= hcount + 1'b1;
      end
   end

   reg hs = 1'b0;
   always @(posedge clk_74_25m) begin
      if (rst_74_25m)
	hs <= 1'b0;
      else begin
	 if (hcount == HORIZONTAL_ACTIVE_TIME+HORIZONTAL_SYNC_OFFSET-1)
	   hs <= 1'b1;
	 else if (hcount == HORIZONTAL_ACTIVE_TIME+HORIZONTAL_SYNC_OFFSET
		  +HORIZONTAL_SYNC_PULSE_WIDTH-1)
	   hs <= 1'b0;
      end
   end

   reg hvalid = 1'b0;
   always @(posedge clk_74_25m) begin
      if (rst_74_25m)
	hvalid <= 1'b0;
      else begin
	 if (hcount == W_WIDTH - 1)
	   hvalid <= 1'b0;
	 else if (hcount == WIDTH-1)
	   hvalid <= 1'b1;
      end
   end

   reg [$clog2(HEIGHT)-1:0] vcount = '0;

   always @(posedge clk_74_25m) begin
      if (rst_74_25m)
	vcount = '0;
      else begin
	 if (hcount == WIDTH-1) begin
	    if (vcount == HEIGHT-1)
	      vcount <= '0;
	    else
	      vcount <= vcount + 1'b1;
	 end
      end
   end

   reg vs = 1'b0;
   always @(posedge clk_74_25m) begin
      if (rst_74_25m)
	vs <= 1'b0;
      else begin
	 if (vcount == VERTICAL_ACTIVE_TIME+VERTICAL_SYNC_OFFSET-1)
	   vs <= 1'b1;
	 else if (vcount == VERTICAL_ACTIVE_TIME+VERTICAL_SYNC_OFFSET
		  +VERTICAL_SYNC_PULSE_WIDTH-1)
	   vs <= 1'b0;
      end
   end

   reg vvalid = 1'b0;
   always @(posedge clk_74_25m) begin
      if (rst_74_25m)
	vvalid <= 1'b0;
      else begin
	 if (hcount == WIDTH-1) begin
	    if (vcount == W_HEIGHT-1)
	      vvalid <= 1'b0;
	    else if (vcount == HEIGHT-1)
	      vvalid <= 1'b1;
	 end        
      end
   end 

   wire de;
   assign de = hvalid & vvalid;

   //
   //rgb to gray
   //
   wire [DATA_WIDTH-1:0] in0_r, in0_g, in0_b;
   wire [DATA_WIDTH-1:1] in1_r, in1_g, in1_b;
   assign {in0_r,in0_g,in0_b} = {{1'd0, pixel0_reg[15:11], 2'd0}, {pixel0_reg[10:5], 2'd0}, {1'd0, pixel0_reg[4:0], 2'd0}};
   assign {in1_r,in1_g,in1_b} = {{2'd0, pixel1_reg[15:11], 1'd0}, {1'd0, pixel1_reg[10:5], 1'd0}, {2'd0, pixel1_reg[4:0], 1'd0}};


   reg [DATA_WIDTH-1:0]  gray0, gray1;	
	 wire [DATA_WIDTH-1:0] bram_din;
	 assign bram_din = (sw[0]) ? gray1 : gray0;
   assign {led5_g, led4_g} = bram_din[7:6]; // for debug

   rgb2ycbcr
     #(
       .BIT_WIDTH(DATA_WIDTH),
       .FRAME_WIDTH(CAM_WINDOW_WIDTH),
       .FRAME_HEIGHT(CAM_WINDOW_HEIGHT)
       )
   rgb2ycbr_inst0
     (
      .clock(cam0_PCLK),
      .in_r(in0_r),
      .in_g(in0_g),
      .in_b(in0_b),
      .in_hcnt(),
      .in_vcnt(),
      .in_addr(pixel0_addr),
      .out_y(gray0),
      .out_cb(),
      .out_cr(),
      .out_hcnt(),
      .out_vcnt(),
      .out_addr(graypixel0_addr)
      );	

/*
   rgb2ycbcr
     #(
       .BIT_WIDTH(DATA_WIDTH),
       .FRAME_WIDTH(CAM_WINDOW_WIDTH),
       .FRAME_HEIGHT(CAM_WINDOW_HEIGHT)
       )
   rgb2ycbr_inst1
     (
      .clock(cam1_PCLK),
      .in_r(in1_r),
      .in_g(in1_g),
      .in_b(in1_b),
      .in_hcnt(),
      .in_vcnt(),
      .in_addr(pixel1_addr),
      .out_y(gray1),
      .out_cb(),
      .out_cr(),
      .out_hcnt(),
      .out_vcnt(),
      .out_addr(graypixel1_addr)
      );	
*/

   //
   // BRAM for image data
   //
   wire [DATA_WIDTH-1:0] bram_dout;
   wire [$clog2(CAM_WINDOW_PIXELS):0] read_address;
	 wire cam_PCLK, pixel_we;
	 wire [$clog2(CAM_WINDOW_PIXELS)+2:0] graypixel_addr;

	 //assign cam_PCLK = (sw[0]) ? cam1_PCLK: cam0_PCLK;
	 assign cam_PCLK = cam0_PCLK;
	 assign pixel_we = (sw[0]) ? pixel1_we: pixel0_we;
	 assign graypixel_addr = (sw[0]) ? graypixel1_addr : graypixel0_addr;

   assign read_address = hcount + vcount * CAM_WINDOW_WIDTH;

   dpram_mclk
     #(
       .DATA_WIDTH(DATA_WIDTH),
       .ADDR_WIDTH(19)
       )
   dpram_mclk_inst
     (
      .clk1(cam_PCLK),
      .clk2(clk_74_25m),
      .we(pixel_we & (graypixel_addr[20] == 1'b0)),
      .add1(graypixel_addr[19:1]),
      .add2(read_address),
      .di(bram_din),
      .do1(),
      .do2(bram_dout)
      );

   //
   // Pipeline registers for HDMI timing
   //
   reg [$clog2(WIDTH)-1:0]            hcount_d = '0;
   reg [$clog2(HEIGHT)-1:0]           vcount_d = '0;
   reg                                vs_d, hs_d, de_d;

   always @(posedge clk_74_25m) begin
      hcount_d <= hcount;
      vcount_d <= vcount;
      hs_d <= hs;      
      vs_d <= vs;
      de_d <= de;
   end

   //
   // Pixels for display 
   //
   logic [23:0] rbg_data;

   always_comb begin
      if (!de)
	rbg_data <= 24'h000000;
      else begin
	 if (hcount_d < CAM_WINDOW_WIDTH && vcount_d < CAM_WINDOW_HEIGHT) begin
	    rbg_data <= {
			 bram_dout[DATA_WIDTH-1:0],   // Red
			 bram_dout[DATA_WIDTH-1:0],   // Blue
			 bram_dout[DATA_WIDTH-1:0]    // Green
			 };       
	 end
	 else begin
	    if (vcount_d < W_HEIGHT/2)
	      rbg_data <= (hcount_d < W_WIDTH/2)? 24'hff0000: 24'h00ff00;
	    else 
	      rbg_data <= (hcount_d < W_WIDTH/2)? 24'h0000ff: 24'hffffff;
	 end
      end
   end

   //
   // HDMI core
   //
   rgb2dvi
     #(
       .kGenerateSerialClk(1'b1),
       .kClkPrimitive("PLL"),
       .kClkRange(3),
       .kRstActiveHigh(1'b1),
       .kD0Swap(1'b0),
       .kD1Swap(1'b0),
       .kD2Swap(1'b0),
       .kClkSwap(1'b0)
       )
   rgb2dvi_inst
     (
      // DVI 1.0 TMDS video interface
      .TMDS_Clk_p(hdmi_tx_clk_p),
      .TMDS_Clk_n(hdmi_tx_clk_n), 
      .TMDS_Data_p(hdmi_tx_d_p[2:0]),
      .TMDS_Data_n(hdmi_tx_d_n[2:0]),
      // Auxiliary signals
      // asynchronous reset; must be reset when RefClk is not within spec
      .aRst(rst_74_25m),
      // asynchronous reset; must be reset when RefClk is not within spec
      .aRst_n(), 
      // Video in
      .vid_pData(rbg_data),
      .vid_pVDE(de_d), 
      .vid_pHSync(hs_d),
      .vid_pVSync(vs_d),
      .PixelClk(clk_74_25m), // pixel-clock recovered from the DVI interface
      .SerialClk()   // 5x PixelClk
      );

   //
   // Test counter
   //
   reg [28:0] cnt;
   always @(posedge clk_24m) begin
      if (rst_24m)
	cnt <= '0;
      else
	cnt <= cnt + 1'b1;
   end

   // assign led = cnt[28:25];
   assign led = {cnt[25], sccb_req, sccb_busy};

endmodule
`default_nettype wire
