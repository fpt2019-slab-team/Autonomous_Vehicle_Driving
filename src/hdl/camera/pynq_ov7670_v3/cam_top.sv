//
//  OV7670 test desgin
//

`default_nettype none
module cam_top
    #(
        parameter integer WINDOW_WIDTH  = 640,
        parameter integer WINDOW_HEIGHT = 480,
        parameter integer DATA_SIZE = 8
    )
	(
		input wire				clk_12m,	
		input wire				n_rst,
		output wire       cam_SIOC,
		inout wire        cam_SIOD,
		input wire        cam_PCLK,
		input wire        cam_VSYNC,
		input wire        cam_HREF,
		input wire [7:0]  cam_D,
		input wire				sccb_req,
		input wire [23:0] sccb_send_data,
		output wire				sccb_busy,
		output wire	[DATA_SIZE-1:0]              	gray,	
		output wire	[$clog2(WINDOW_WIDTH )-1:0] gray_h_cnt,			
		output wire [$clog2(WINDOW_HEIGHT)-1:0] gray_v_cnt		
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
	localparam integer FRAME_HEIGHT = CAM_WINDOW_HEIGHT + 30;
	localparam integer FRAME_WIDTH  = CAM_WINDOW_WIDTH  + 144;
	localparam int    DATA_WIDTH	= 8;

	//
	// Camera initilization via SCCB
	//
	sccb_if
	#( 
		.CLOCK_FREQ(12 * 10 ** 6),
		.SCL_FREQ(200 * 10 ** 3)
	)  
	sccb_if_inst
	(  
		.sysclk(clk_12m),
		.n_rst(n_rst),
		.req(sccb_req),
		.send_data(sccb_send_data),
		.recv_data(),
		.busy(sccb_busy),
		.scl(cam_SIOC),
		.sda(cam_SIOD)
	);
	//
	// camera if for ov7670
	//
	camera_if
	#(
		.IMAGE_HEIGHT(CAM_WINDOW_HEIGHT),
		.IMAGE_WIDTH(CAM_WINDOW_WIDTH),
		.FRAME_HEIGHT(FRAME_HEIGHT),
		.FRAME_WIDTH(FRAME_WIDTH),
		.V_OFFSET(20)
	)
	camera_if_inst
	(
		.clk_2x(cam_PCLK), 
		.clk_1x(clk_12m),
		.n_rst(n_rst),
		.in_vsync(cam_VSYNC),
		.in_href(cam_HREF),
		.in_data(cam_D),
		.out_y(gray), 
		.out_vcnt(gray_v_cnt), 
		.out_hcnt(gray_h_cnt)
	);

endmodule
`default_nettype wire
