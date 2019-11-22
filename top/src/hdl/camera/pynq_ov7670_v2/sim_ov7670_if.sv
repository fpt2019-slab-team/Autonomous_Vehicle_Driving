`default_nettype none
`timescale 1ns/1ns

module sim_ov7670_if ();
	localparam integer CLOCK_FREQ      = 24 * 10 ** 6; // 24 MHz
	localparam integer CLOCK_PERIOD_NS = 10 ** 9 / CLOCK_FREQ; 
	localparam integer WIDTH           = 640;
	localparam integer HEIGHT          = 480;
	localparam integer IBIT_WIDTH      =   8;
	localparam integer OBIT_WIDTH      =  16;

	reg                     cam_PCLK;
	reg                     n_rst;
	reg                     cam_HREF;
	reg                     cam_VSYNC;
	reg  [IBIT_WIDTH-1:0]   cam_din;
	wire [OBIT_WIDTH-1:0]   rgb565;
	wire [$clog2(WIDTH):0]  h_cnt;
	wire [$clog2(HEIGHT):0] v_cnt;

	/* generate pixel clock */
	initial begin
			cam_PCLK <= 1'b1;
			forever #(CLOCK_PERIOD_NS / 2) cam_PCLK <= ~cam_PCLK;
	end

	/* simulation */
	initial begin
		cam_din <= 'd0;
		forever #(CLOCK_PERIOD_NS) cam_din <= cam_din + 1'b1;
	end

	initial begin
			repeat (2) begin // frames
					cam_VSYNC <= 1'b0;
					cam_HREF <= 1'b1;
					repeat (480) begin // v sync
							#(CLOCK_PERIOD_NS * WIDTH * 2) // sync
							cam_HREF <= 1'b0;
							#(CLOCK_PERIOD_NS * 50) // blank
							cam_HREF <= 1'b1;
					end
					cam_VSYNC <= 1'b1;
					repeat (5) begin // v blank
							#(CLOCK_PERIOD_NS * WIDTH * 2) // h sync
							cam_HREF <= 1'b0;
							#(CLOCK_PERIOD_NS * 50) // h blank
							cam_HREF <= 1'b1;
					end
			end
			$finish;
	end

	ov7670_if
	#(
		.WIDTH(WIDTH),
		.HEIGHT(HEIGHT),
		.IBIT_WIDTH(IBIT_WIDTH),
		.OBIT_WIDTH(OBIT_WIDTH)
	)
	ov7670_if_inst
	(
		.cam_PCLK(cam_PCLK),
		.n_rst(n_rst),
		.cam_HREF(cam_HREF),
		.cam_VSYNC(cam_VSYNC),
		.cam_din(cam_din),
		.rgb565(rgb565),
		.h_cnt(h_cnt),
		.v_cnt(v_cnt)
	);

	/* open shm */
	initial begin
		$shm_open("sim_ov7670_if.shm");
		$shm_probe("ACM");
	end
endmodule

`default_nettype wire
