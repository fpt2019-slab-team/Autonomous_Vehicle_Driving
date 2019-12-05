//
//  OV7670 test desgin
//

`default_nettype none
module cam_top
  #(
        parameter DATA_WIDTH        =  -1,
		parameter CAM_WINDOW_WIDTH  =  -1,
		parameter CAM_WINDOW_HEIGHT =  -1
	)
	(
		input wire        sysclk,        // 125 MHz
    input wire        clk_gray,      //  12 MHz
		input wire				n_rst,
		input wire 				sccb_req,
		input wire [23:0] sccb_send_data,
		output wire				sccb_busy,
		output wire [7:0] sccb_recv_data,
		output wire 			cam_SIOC,
		inout wire        cam_SIOD,
		input wire        cam_PCLK,      // 24 MHz
		input wire        cam_VSYNC,
		input wire        cam_HREF,
		input wire [7:0]  cam_D,
		output wire [DATA_WIDTH-1:0]  gray,
		output wire [$clog2(CAM_WINDOW_WIDTH):0]	gray_h_cnt,
		output wire [$clog2(CAM_WINDOW_WIDTH):0]	gray_v_cnt
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

	localparam int    CAM_WINDOW_PIXELS = CAM_WINDOW_WIDTH * CAM_WINDOW_HEIGHT;
	localparam int		RGB_WIDTH		=	16;

	//
	// Camera0 initilization via SCCB
	//
	sccb_if
	#(
		.CLOCK_FREQ(125 * 10 ** 6),
		.SCL_FREQ(200 * 10 ** 3)
	)
	sccb_if_inst
	(
		.sysclk(sysclk),
		.n_rst(n_rst),
		.req(sccb_req),
		.send_data(sccb_send_data),
		.recv_data(sccb_recv_data),
		.busy(sccb_busy),
		.scl(cam_SIOC),
		.sda(cam_SIOD)
	);
	/* copy this start */

	//
	// ov7670_if
	//
	wire [15:0]													rgb565;
	wire [$clog2(CAM_WINDOW_WIDTH):0]		h_cnt;
	wire [$clog2(CAM_WINDOW_HEIGHT):0]	v_cnt;	

	ov7670_if
	#(
		.WIDTH(CAM_WINDOW_WIDTH),
		.HEIGHT(CAM_WINDOW_HEIGHT),
		.IBIT_WIDTH(8),
		.OBIT_WIDTH(16)
	)
	ov7670_if_inst
	(
		.cam_PCLK(cam_PCLK),
		.cam_HREF(cam_HREF),
		.cam_VSYNC(cam_VSYNC),
		.cam_din(cam_D),
		.rgb565(rgb565),
		.h_cnt(h_cnt),
		.v_cnt(v_cnt)	
	);

	//
	//rgb to gray
	//
	wire [DATA_WIDTH-1:0] in_r, in_g, in_b;
	assign {in_r,in_g,in_b} = {{1'd0, rgb565[15:11], 2'd0}, {rgb565[10:5], 2'd0}, {1'd0, rgb565[4:0], 2'd0}};

	rgb2ycbcr
	#(
		.BIT_WIDTH(DATA_WIDTH),
		.FRAME_WIDTH(CAM_WINDOW_WIDTH),
		.FRAME_HEIGHT(CAM_WINDOW_HEIGHT)
	)
	rgb2ycbr_inst
	(
		//.clock(cam_PCLK),
		.clock(clk_gray),
		.in_r(in_r),
		.in_g(in_g),
		.in_b(in_b),
		.in_hcnt(h_cnt),
		.in_vcnt(v_cnt),
		.in_addr(),
		.out_y(gray),
		.out_cb(),
		.out_cr(),
		.out_hcnt(gray_h_cnt),
		.out_vcnt(gray_v_cnt),
		.out_addr()
	);	
endmodule
`default_nettype wire
