//
//  OV7670 test desgin
//

`default_nettype none
module camera_if
  (
   input  wire       sysclk,
   input  wire [3:0] btn,
   input  wire [1:0] sw,
   inout  wire       cam_SIOD,
   input  wire       cam_PCLK,
   input  wire       cam_VSYNC,
   input  wire       cam_HREF,
   input  wire [7:0] cam_D,
   output wire       cam_PWDN,
   output wire       cam_XCLK,
   output wire       cam_RESET,
   output wire 			 cam_SIOC,

   input  wire       clk_24m,
   input  wire       rst_24m,
   input  wire       locked,
   output wire       pclk_2,
   output wire       v_count,
   output wire       h_count,
   output wire       pixel_data
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


   /*
   wire      clk_74_25m;
   reg [3:0] rst_74_25m_sync_regs = 4'h0;
   always @(posedge clk_74_25m) begin
      rst_74_25m_sync_regs <= {rst_74_25m_sync_regs[2:0], ~locked};
   end
   assign rst_74_25m = rst_74_25m_sync_regs[3];
   */

   //
   // Camera0 initilization via SCCB
   //
   wire        sccb_req, sccb_busy;
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
      .n_rst(!rst_24m),
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
   always @(posedge cam_PCLK) begin
      pixel0_we <= cam_HREF;
   end

   always @(posedge cam_PCLK) begin
      if (pixel0_count[0] == 1'b0)
	pixel0_reg[7:0] <= cam_D;
      else
	pixel0_reg[15:8] <= cam_D;          
   end

   always @(posedge cam_PCLK) begin
      if (cam_VSYNC) 
	pixel0_count <= '0;
      else if (cam_HREF) 
	pixel0_count <= pixel0_count + 1'b1;
   end

   always @(posedge cam_PCLK) begin
      pixel0_addr <= pixel0_count;
   end
	 /* copy this end */


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
//   assign {led5_g, led4_g} = bram_din[7:6]; // for debug

   rgb2ycbcr
     #(
       .BIT_WIDTH(DATA_WIDTH),
       .FRAME_WIDTH(CAM_WINDOW_WIDTH),
       .FRAME_HEIGHT(CAM_WINDOW_HEIGHT)
       )
   rgb2ycbr_inst0
     (
      .clock(cam_PCLK),
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

   rgb2ycbcr
     #(
       .BIT_WIDTH(DATA_WIDTH),
       .FRAME_WIDTH(CAM_WINDOW_WIDTH),
       .FRAME_HEIGHT(CAM_WINDOW_HEIGHT)
       )
   rgb2ycbr_inst1
     (
      .clock(cam_PCLK),
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


endmodule
`default_nettype wire
