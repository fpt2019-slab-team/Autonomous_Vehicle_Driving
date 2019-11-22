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
		output wire 	  	cam_SIOC,
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
	// Clock and reset
	//
	wire              locked;
	wire              pll_rst;
	wire              clk_24m;      
	wire              clk_74_25m;

	clk_wiz_0 clk_wiz_0_inst
	(
		.clk_in1(sysclk),     // 125MHz
		.reset(btn[0]),
		.locked(locked),
		.clk_out1(clk_24m),   // 24M Hz
		.clk_out2(clk_74_25m) // 74.25 MHz
	);
	assign pll_rst = locked;

	//
	// Camera0 initilization via SCCB
	//
	wire sccb_req, sccb_busy0, sccb_busy1;
	wire [23:0] sccb_send_data;
	wire [7:0]  sccb_recv0_data, sccb_recv1_data;

	//
	// PS PL Communication
	//
	design_1_wrapper design_1_wrapper_inst
	(
		.sccb_recv0_data(sccb_recv0_data),
		.sccb_recv1_data(sccb_recv1_data),
		.sccb_busy0(sccb_busy0),
		.sccb_busy1(sccb_busy1),
		.sccb_req(sccb_req),
		.sccb_send_data(sccb_send_data)
	);

	assign cam_PWDN = 1'b0;
	assign cam_XCLK = clk_24m;
	assign cam_RESET = locked;

	wire [DATA_WIDTH-1:0]  gray0, gray1;	
	wire [$clog2(CAM_WINDOW_WIDTH):0]  gray_h_cnt0, gray_v_cnt0;	
	wire [$clog2(CAM_WINDOW_HEIGHT):0]  gray_h_cnt1, gray_v_cnt1;	
	wire [DATA_WIDTH-1:0] bram_din;
	assign bram_din = (sw[0]) ? gray1 : gray0;

	cam_top
	#(
	)
	cam_top_inst0
	(
		.sysclk(sysclk),
		.n_rst(pll_rst),
		.sccb_req(sccb_req),
		.sccb_send_data(sccb_send_data),
		.sccb_busy(sccb_busy0),
		.sccb_recv_data(sccb_recv0_data),
		.cam_SIOC(),
		.cam_SIOD(cam0_SIOD),
		.cam_PCLK(cam0_PCLK),
		.cam_VSYNC(cam0_VSYNC),
		.cam_HREF(cam0_HREF),
		.cam_D(cam0_D),
		.gray(gray0),
		.gray_h_cnt(gray_h_cnt0),
		.gray_v_cnt(gray_v_cnt0)
	);
	cam_top cam_top_inst1
	(
		.sysclk(sysclk),
		.n_rst(pll_rst),
		.sccb_req(sccb_req),
		.sccb_send_data(sccb_send_data),
		.sccb_busy(sccb_busy1),
		.sccb_recv_data(sccb_recv1_data),
		.cam_SIOC(cam_SIOC),
		.cam_SIOD(cam1_SIOD),
		.cam_PCLK(cam1_PCLK),
		.cam_VSYNC(cam1_VSYNC),
		.cam_HREF(cam1_HREF),
		.cam_D(cam1_D),
		.gray(gray1),
		.gray_h_cnt(gray_h_cnt1),
		.gray_v_cnt(gray_v_cnt1)
	);


	reg pixel0_we,pixel0_wea,pixel0_web,pixel0_wec,pixel0_wed;
	reg pixel1_we,pixel1_wea,pixel1_web,pixel1_wec,pixel1_wed;
	/* copy this start */

	always @(posedge cam0_PCLK) begin
		pixel0_wea <= cam0_HREF;
		pixel0_web <= pixel0_wea;
		pixel0_wec <= pixel0_web;
		pixel0_wed <= pixel0_wec;
		pixel0_we <= pixel0_wed;
	end

	/* copy this end */
	always @(posedge cam1_PCLK) begin
		pixel1_wea <= cam1_HREF;
		pixel1_web <= pixel1_wea;
		pixel1_wec <= pixel1_web;
		pixel1_wed <= pixel1_wec;
		pixel1_we <= pixel1_wed;
	end
	//
	// HDMI timing generators
	//
	reg [$clog2(WIDTH)-1:0] hcount = '0;
	always @(posedge clk_74_25m) begin
		if (!pll_rst)
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
		if (!pll_rst)
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
		if (!pll_rst)
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
		if (!pll_rst)
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
		if (!pll_rst)
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
		if (!pll_rst)
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

	assign {led5_g, led4_g} = bram_din[7:6]; // for debug

	wire VSYNC;
	wire [DATA_WIDTH-1:0] bram_dout;
	wire [$clog2(CAM_WINDOW_PIXELS):0] read_address;
	wire cam_PCLK, pixel_we;
	wire [$clog2(CAM_WINDOW_PIXELS):0] graypixel_addr;

	wire [19:0] graypixel0_addr;
	wire [19:0] graypixel1_addr;

	assign cam_PCLK = (sw[0]) ? cam1_PCLK: cam0_PCLK;
	assign pixel_we = (sw[0]) ? pixel1_we : pixel0_we;
	assign VSYNC = (sw[0]) ? cam1_VSYNC : cam0_VSYNC;

	assign graypixel0_addr = gray_v_cnt0 * 640 + gray_h_cnt0;
	assign graypixel1_addr = gray_v_cnt1 * 640 + gray_h_cnt1;
	assign graypixel_addr = (sw[0]) ? graypixel1_addr : graypixel0_addr;

	assign read_address = hcount + vcount * CAM_WINDOW_WIDTH;

	//---------------------------- begin of for debug ----------------------------//
	// {
	//
	// BRAM for image data
	//
	dpram_mclk
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(19)
	)
	dpram_mclk_inst
	(
		.clk1(cam_PCLK),
		.clk2(clk_74_25m),
		//	.we(pixel_we & (graypixel_addr[20] == 1'b0)),
		.we(pixel_we & !VSYNC),
		.add1(graypixel_addr[18:0]),
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
		.aRst(),
		// asynchronous reset; must be reset when RefClk is not within spec
		.aRst_n(pll_rst), 
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
		if (!pll_rst)
			cnt <= '0;
		else
			cnt <= cnt + 1'b1;
	end

	// assign led = cnt[28:25];
	assign led = {cnt[25], sccb_req, sccb_busy0};
	// }
	//---------------------------- end of for debug ----------------------------//

endmodule
`default_nettype wire
