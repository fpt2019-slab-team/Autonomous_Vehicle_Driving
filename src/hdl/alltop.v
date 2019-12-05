`default_nettype none
`timescale 1 ns / 1 ns

module alltop 
  (
    // System Clock
    input  wire        sysclk,  // 125MHz

    // button and switch
    input  wire [1:0]  sw,
    input  wire [3:0]  btn,
    output wire [3:0]  led,
    output wire        led4_g,
    //output wire        led4_r,
    output wire        led5_g,
    //output wire        led5_r,

    // Interface with Camera
    input  wire        pclk_f,   // Front Camera
    input  wire        href_f,     
    input  wire        vs_f,     
    input  wire [7:0]  data_f,
    inout  wire        siod_f,
    input  wire        pclk_r,   // Rear Camera
    input  wire        href_r,     
    input  wire        vs_r,     
    input  wire [7:0]  data_r,
    inout  wire        siod_r,
    output wire        xclk,     // Common
    output wire        cam_reset,    
    output wire        pwdn,
    output wire        sioc,

    // debug HDMI
		output wire       hdmi_tx_clk_n,
		output wire       hdmi_tx_clk_p,
		output wire [2:0] hdmi_tx_d_n,
		output wire [2:0] hdmi_tx_d_p,

    // Interface with Motor
    input  wire        fbr,      // feedback
    input  wire        fbl,
    output wire        pwma,     // connect to PMOD 
    output wire        pwmb,     // connect to PMOD 
    output wire        ain1,     // connect to PMOD 
    output wire        ain2,     // connect to PMOD 
    output wire        bin1,     // connect to PMOD 
    output wire        bin2,     // connect to PMOD 
    output wire        stnby     // connect to PMOD
  );

  // Parameters
  localparam integer BIT_WIDTH    = 8;
  localparam integer IMAGE_WIDTH  = 640;
  localparam integer IMAGE_HEIGHT = 480;
  localparam integer IMAGE_PIXELS = IMAGE_WIDTH * IMAGE_HEIGHT;
  localparam integer BLANK_WIDTH  = 144;
  localparam integer BLANK_HEIGHT = 30;
  localparam integer FRAME_WIDTH  = IMAGE_WIDTH + BLANK_WIDTH;
  localparam integer FRAME_HEIGHT = IMAGE_HEIGHT + BLANK_HEIGHT;
  localparam integer CLOCK_FREQ   = 125 * 10 ** 6;
  localparam integer SCL_FREQ     = 200 * 10 ** 3;
  localparam real    SCALE        = 0.5;
  localparam integer HVC          = 62;
  localparam integer HC           = 5;
  localparam integer DVC          = 50;
  localparam integer F            = 210;
  localparam integer FP           = 210;
  localparam integer THETA        = 15;
  localparam integer CX           = IMAGE_WIDTH / 2;
  localparam integer CY           = IMAGE_HEIGHT / 2;
  localparam integer CXP          = IMAGE_WIDTH/ 2;
  localparam integer CYP          = IMAGE_HEIGHT / 2;

	localparam integer HORIZONTAL_ACTIVE_TIME = 1280;  // for HDMI
	localparam integer HORIZONTAL_BLANKING_TIME = 368;
	localparam integer HORIZONTAL_SYNC_OFFSET = 72;
	localparam integer HORIZONTAL_SYNC_PULSE_WIDTH = 80;
	localparam integer VERTICAL_ACTIVE_TIME = 720;
	localparam integer VERTICAL_BLANKING_TIME = 30;
	localparam integer VERTICAL_SYNC_OFFSET = 3;
	localparam integer VERTICAL_SYNC_PULSE_WIDTH = 5;
	localparam integer WIDTH = HORIZONTAL_ACTIVE_TIME + HORIZONTAL_BLANKING_TIME;
	localparam integer HEIGHT = VERTICAL_ACTIVE_TIME + VERTICAL_BLANKING_TIME;
	localparam integer W_WIDTH = HORIZONTAL_ACTIVE_TIME;
	localparam integer W_HEIGHT = VERTICAL_ACTIVE_TIME;


  // Clock and reset
  wire              locked;
  wire              clk_24m;      
  wire              clk_12m;
  wire              clk_74_25m; // for HDMI
  wire              sys_reset_n;

  clk_wiz_0 clk_wiz_0_inst
  (
    .clk_in1  (sysclk),      // 125MHz : input
    .reset    (btn[0]),
    .locked   (locked),
    .clk_out1 (clk_24m),    //    24 MHz : output
    .clk_out2 (clk_12m),    //    12 MHz : output 
    .clk_out3 (clk_74_25m) // 74.25 MHz : output 
  );

  reg [3:0]         sys_reset_n_sync_regs = 4'h0;
  always @(posedge clk_12m) begin
    sys_reset_n_sync_regs <= {sys_reset_n_sync_regs[2:0], locked};
  end
  assign sys_reset_n = sys_reset_n_sync_regs[3];
  assign cam_reset   = sys_reset_n_sync_regs[3];

  assign pwdn        = 1'b0;
  assign xclk        = clk_24m;


  wire        sccb_busy;     // busy is not used
  wire        sccb_req;
  wire [23:0] sccb_send_data;

  wire [15:0] speed_l;
  wire [15:0] speed_r;

  wire [6:0]  kl_accel;
  wire [7:0]  kl_steer;

  wire write_protect_f, write_protect_r;
  wire PS_CLK;


  /// degub     ///

  assign led[3:2] = speed_r[3:2];

  /// debug end ///


  // PSPL Communication（block design）
  pspl_comm_wrapper
  #(
    .C_S00_AXI_DATA_WIDTH(),
    .C_S00_AXI_ADDR_WIDTH()
  )
  pspl_comm_inst
  (
    .sw  (sw[1]),
    .led (),
    .FCLK_CLK0(PS_CLK), // 100 MHz
    /* From PS to SCCB */
    // .sccb_busy      (sccb_busy),
    .sccb_busy      (sccb_busy),
    .sccb_req       (sccb_req),
    .sccb_send_data (sccb_send_data),

    /* From LSD to PS */
    .lsd_ready_f         (lsdbuf_ready_f),
    .lsd_ready_r         (lsdbuf_ready_r),
    .lsd_line_num_f      (lsdbuf_line_num_f),
    .lsd_line_num_r      (lsdbuf_line_num_r),
    .lsd_line_start_v_f  (lsdbuf_start_v_f),
    .lsd_line_start_v_r  (lsdbuf_start_v_r), 
    .lsd_line_start_h_f  (lsdbuf_start_h_f), 
    .lsd_line_start_h_r  (lsdbuf_start_h_r), 
    .lsd_line_end_v_f    (lsdbuf_end_v_f),   
    .lsd_line_end_v_r    (lsdbuf_end_v_r),   
    .lsd_line_end_h_f    (lsdbuf_end_h_f),   
    .lsd_line_end_h_r    (lsdbuf_end_h_r),   
    .lsd_line_addr_f     (lsd_line_addr_f),          // From PS to LSD
    .lsd_line_addr_r     (lsd_line_addr_r),
    .lsd_write_protect_f (lsd_write_protect_f),
    .lsd_write_protect_r (lsd_write_protect_r),
    .lsd_grad_thres_f    (lsd_grad_thres_f),
    .lsd_grad_thres_r    (lsd_grad_thres_r),

    /* From Topview to PS */
    .topview_ready_f         (topview_ready_f),
    .topview_ready_r         (topview_ready_r),
    .topview_line_num_f      (topview_line_num_f),
    .topview_line_num_r      (topview_line_num_r),
    .topview_line_start_v_f  (topview_start_v_f),
    .topview_line_start_v_r  (topview_start_v_r),
    .topview_line_start_h_f  (topview_start_h_f),
    .topview_line_start_h_r  (topview_start_h_r),
    .topview_line_end_v_f    (topview_end_v_f),
    .topview_line_end_v_r    (topview_end_v_r),
    .topview_line_end_h_f    (topview_end_h_f),
    .topview_line_end_h_r    (topview_end_h_r),
    .topview_line_valid_f    (topview_valid_f),
    .topview_line_valid_r    (topview_valid_r),
    .topview_line_addr_f     (topview_line_addr_f),  // From PS to Topview
    .topview_line_addr_r     (topview_line_addr_r),
    .topview_write_protect_f (),
    .topview_write_protect_r (),

    /* From motor to PS */
    .motor_speed_l (speed_l),
    .motor_speed_r (speed_r),

    /* From PS to motor */
    .kl_accel (kl_accel),
    .kl_steer (kl_steer)
  );


  wire [7:0]                    pixel_data_f;
  wire [7:0]                    pixel_data_r;
  wire [$clog2(FRAME_HEIGHT):0] v_count_f;
  wire [$clog2(FRAME_HEIGHT):0] v_count_r; 
  wire [$clog2(FRAME_WIDTH):0]  h_count_f;
  wire [$clog2(FRAME_WIDTH):0]  h_count_r;


  // カメラモジュール
  cam_top
  #(
    .DATA_WIDTH(BIT_WIDTH),
    .CAM_WINDOW_HEIGHT(IMAGE_HEIGHT),
    .CAM_WINDOW_WIDTH(IMAGE_WIDTH),
    .BLANK_HEIGHT(BLANK_HEIGHT),
    .BLANK_WIDTH(BLANK_WIDTH)
  )
  cam_top_inst_f
  (
    .clk            (clk_12m),
    .n_rst          (sys_reset_n),
    .cam_SIOC       (sioc),
    .cam_SIOD       (siod_f),
    .cam_PCLK       (pclk_f),
    .cam_VSYNC      (vs_f),
    .cam_HREF       (href_f),
    .cam_D          (data_f),
    .sccb_send_data (sccb_send_data),
    .sccb_req       (sccb_req),
    .sccb_busy      (),
    .gray           (pixel_data_f),             // 出力データ
    .gray_v_cnt     (v_count_f),        
    .gray_h_cnt     (h_count_f)
  ),
  cam_top_inst_r
  (
    .clk            (clk_12m),
    .n_rst          (sys_reset_n),
    .cam_SIOC       (),
    .cam_SIOD       (siod_r),
    .cam_PCLK       (pclk_r),
    .cam_VSYNC      (vs_r),
    .cam_HREF       (href_r),
    .cam_D          (data_r),
    .sccb_send_data (sccb_send_data), 
    .sccb_req       (sccb_req),
    .sccb_busy      (),
   .gray           (pixel_data_r),             // 出力データ
    .gray_v_cnt     (v_count_r),        
    .gray_h_cnt     (h_count_r)
  );

  assign {led5_g, led4_g} = {pixel_data_f[7], pixel_data_r[7]};  // for debug

  localparam integer H_BITW = $clog2(FRAME_WIDTH);    // 10
  localparam integer V_BITW = $clog2(FRAME_HEIGHT);   // 9

  wire [31:0]       lsd_line_addr_f, lsd_line_addr_r;   // lsd input (buffer input)
  wire [H_BITW-1:0] lsd_start_h_f, lsd_start_h_r;       // lsd buffer output
  wire [V_BITW-1:0] lsd_start_v_f, lsd_start_v_r;
  wire [H_BITW-1:0] lsd_end_h_f, lsd_end_h_r;
  wire [V_BITW-1:0] lsd_end_v_f, lsd_end_v_r;
  wire              lsd_flag_f, lsd_flag_r;
  wire              lsd_valid_f, lsd_valid_r;
  wire [7:0]        lsd_angle_f, lsd_angle_r;
  wire [39:0]       lsd_line_data_f, lsd_line_data_r;
  wire              lsd_write_protect_f, lsd_write_protect_r;
  wire [16:0]       lsd_grad_thres_f;
  wire [16:0]       lsd_grad_thres_r;
  wire [H_BITW-1:0] lsdbuf_start_h_f, lsdbuf_start_h_r;
  wire [V_BITW-1:0] lsdbuf_start_v_f, lsdbuf_start_v_r;
  wire [H_BITW-1:0] lsdbuf_end_h_f, lsdbuf_end_h_r;
  wire [V_BITW-1:0] lsdbuf_end_v_f, lsdbuf_end_v_r;
  wire              lsdbuf_ready_f, lsdbuf_ready_r;
  wire [31:0]       lsdbuf_line_num_f, lsdbuf_line_num_r;

  // LSD
  simple_lsd
  #(
    .BIT_WIDTH    (),
    .IMAGE_HEIGHT (IMAGE_HEIGHT),
    .IMAGE_WIDTH  (IMAGE_WIDTH),
    .FRAME_HEIGHT (FRAME_HEIGHT),
    .FRAME_WIDTH  (FRAME_WIDTH)
  )
  simple_lsd_inst_f
  (
    .clock         (clk_12m),
    .n_rst         (sys_reset_n),
    .in_y          (pixel_data_f),
    .in_vcnt       (v_count_f),
    .in_hcnt       (h_count_f),
    .in_grad_thres (lsd_grad_thres_f),
    .out_flag      (lsd_flag_f),
    .out_valid     (lsd_valid_f),
    .out_start_v   (lsd_start_v_f),
    .out_end_v     (lsd_end_v_f),
    .out_start_h   (lsd_start_h_f),
    .out_end_h     (lsd_end_h_f),
    .out_angle     (lsd_angle_f)
  ),
  simple_lsd_inst_r
  (
    .clock         (clk_12m),
    .n_rst         (sys_reset_n),
    .in_y          (pixel_data_r),
    .in_vcnt       (v_count_r),
    .in_hcnt       (h_count_r),
    .in_grad_thres (lsd_grad_thres_r),
    .out_flag      (lsd_flag_r),
    .out_valid     (lsd_valid_r),
    .out_start_v   (lsd_start_v_r),
    .out_end_v     (lsd_end_v_r),
    .out_start_h   (lsd_start_h_r),
    .out_end_h     (lsd_end_h_r),
    .out_angle     (lsd_angle_r)
  );

  // LSD buffer
  lsd_output_buffer_wp
  #(
    .BIT_WIDTH    (),
    .IMAGE_HEIGHT (IMAGE_HEIGHT),
    .IMAGE_WIDTH  (IMAGE_WIDTH),
    .FRAME_HEIGHT (FRAME_HEIGHT),
    .FRAME_WIDTH  (FRAME_WIDTH),
    .RAM_SIZE     ()
  )
  lsd_output_buffer_inst_f
  (
    .wclk             (clk_12m), // 12 MHz
    .rclk             (PS_CLK), // PS clock
    .n_rst            (sys_reset_n),
    .in_flag          (lsd_flag_f),
    .in_valid         (lsd_valid_f),
    .in_start_v       (lsd_start_v_f),
    .in_end_v         (lsd_end_v_f),
    .in_start_h       (lsd_start_h_f),
    .in_end_h         (lsd_end_h_f),
    .in_rd_addr       (lsd_line_addr_f),
    .in_write_protect (lsd_write_protect_f),
    .out_ready        (lsdbuf_ready_f),
    .out_line_num     (lsdbuf_line_num_f),
    .out_start_v      (lsdbuf_start_v_f),
    .out_end_v        (lsdbuf_end_v_f),
    .out_start_h      (lsdbuf_start_h_f),
    .out_end_h        (lsdbuf_end_h_f)
  ),
  lsd_output_buffer_inst_r
  (
    .wclk             (clk_12m), // 12 MHz
    .rclk             (PS_CLK), // PS clock
    .n_rst            (sys_reset_n),
    .in_flag          (lsd_flag_r),
    .in_valid         (lsd_valid_r),
    .in_start_v       (lsd_start_v_r),
    .in_end_v         (lsd_end_v_r),
    .in_start_h       (lsd_start_h_r),
    .in_end_h         (lsd_end_h_r),
    .in_rd_addr       (lsd_line_addr_r),
    .in_write_protect (lsd_write_protect_r),
    .out_ready        (lsdbuf_ready_r),
    .out_line_num     (lsdbuf_line_num_r),
    .out_start_v      (lsdbuf_start_v_r),
    .out_end_v        (lsdbuf_end_v_r),
    .out_start_h      (lsdbuf_start_h_r),
    .out_end_h        (lsdbuf_end_h_r)
  );

  /*
  assign lsd_start_v_f = lsd_line_data_f[39:30];
  assign lsd_start_h_f = lsd_line_data_f[29:20];
  assign lsd_end_v_f   = lsd_line_data_f[19:10];
  assign lsd_end_h_f   = lsd_line_data_f[9:0];
  */

  //---------------------- from LSD visualizer to HDMI ----------------------//
  // btn 1 debouncer
  wire btn1_debounced;
  debouncer_with_synchronizer
  #(
    .CLOCK_FREQ(12*10**6), // 12 MHz
    .MASK_DURATION_MS(10), // 10 ms
    .INIT_VAL(0)
  )
  btn1_debouncer
  (
    .clk(clk_12m),
    .n_rst(sys_reset_n),
    .din(btn[1]),
    .dout(btn1_debounced)
  );

  // btn1 toggle switch
  reg  btn1_pre, btn1_toggle;
  always @(posedge clk_12m) begin
    if (!sys_reset_n) begin
      btn1_pre    <= 0;
      btn1_toggle <= 0;
    end else begin
      btn1_pre    <= btn1_debounced;
      btn1_toggle <= (!btn1_pre & btn1_debounced) ? ~btn1_toggle : btn1_toggle;
    end
  end
  assign led[1] = btn1_toggle;

  // Visualize a result of LSD : to HDMI
  wire [7:0] bram_din;
  wire [$clog2(IMAGE_WIDTH):0]  h_count;
  wire [$clog2(IMAGE_HEIGHT):0] v_count;
  assign {h_count, v_count} = {
    (btn1_toggle) ? h_count_r : h_count_f,
    (btn1_toggle) ? v_count_r : v_count_f
  };

  wire [V_BITW-1:0] in_visualizer_start_v, in_visualizer_end_v;
  wire [H_BITW-1:0]  in_visualizer_start_h, in_visualizer_end_h;
  wire in_visualizer_flag, in_visualizer_valid;
  assign {in_visualizer_flag, in_visualizer_valid, in_visualizer_start_v, in_visualizer_end_v, in_visualizer_start_h, in_visualizer_end_h} = {
    (btn1_toggle) ? lsd_flag_r    : lsd_flag_f,
    (btn1_toggle) ? lsd_valid_r   : lsd_valid_f,
    (btn1_toggle) ? lsd_start_v_r : lsd_start_v_f,
    (btn1_toggle) ? lsd_end_v_r   : lsd_end_v_f,
    (btn1_toggle) ? lsd_start_h_r : lsd_start_h_f,
    (btn1_toggle) ? lsd_end_h_r   : lsd_end_h_f
  };
  wire [$clog2(IMAGE_WIDTH ):0] visualizer_h_cnt;
  wire [$clog2(IMAGE_HEIGHT):0] visualizer_v_cnt;
  wire [$clog2(IMAGE_PIXELS):0] visualizer_addr;
  wire visualizer_valid;

  visualizer
  #(
    .BIT_WIDTH(BIT_WIDTH),
    .IMAGE_HEIGHT(IMAGE_HEIGHT),
    .IMAGE_WIDTH(IMAGE_WIDTH),
    .FRAME_HEIGHT(FRAME_HEIGHT),
    .FRAME_WIDTH(FRAME_WIDTH),
    .RAM_SIZE(4096)
  )
  visualizer_inst
  (
    .clock(clk_12m),
    .n_rst(sys_reset_n),
    .in_flag(in_visualizer_flag),
    .in_valid(in_visualizer_valid),
    .in_vcnt(v_count),
    .in_hcnt(h_count),
    .in_start_v(in_visualizer_start_v),
    .in_start_h(in_visualizer_start_h),
    .in_end_v(in_visualizer_end_v),
    .in_end_h(in_visualizer_end_h),
    .out_r(),
    .out_g(bram_din),
    .out_b(),
    .out_vcnt(visualizer_v_cnt),
    .out_hcnt(visualizer_h_cnt)
  );
	assign visualizer_addr  = visualizer_v_cnt * IMAGE_WIDTH + visualizer_h_cnt;
	assign visualizer_valid = (visualizer_h_cnt < IMAGE_WIDTH) & (visualizer_v_cnt < IMAGE_HEIGHT);

	reg [$clog2(WIDTH)-1:0] hcount = 'd0;
	always @(posedge clk_74_25m) begin
		if (!sys_reset_n)
			hcount = 'd0;
		else begin
			if (hcount == WIDTH-1)
				hcount <= 'd0;
			else
				hcount <= hcount + 1'b1;
		end
	end

	reg hs = 1'b0;
	always @(posedge clk_74_25m) begin
		if (!sys_reset_n)
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
		if (!sys_reset_n)
			hvalid <= 1'b0;
		else begin
			if (hcount == W_WIDTH - 1)
				hvalid <= 1'b0;
			else if (hcount == WIDTH-1)
				hvalid <= 1'b1;
		end
	end

	reg [$clog2(HEIGHT)-1:0] vcount = 'd0;

	always @(posedge clk_74_25m) begin
		if (!sys_reset_n)
			vcount = 'd0;
		else begin
			if (hcount == WIDTH-1) begin
				if (vcount == HEIGHT-1)
					vcount <= 'd0;
				else
					vcount <= vcount + 1'b1;
			end
		end
	end

	reg vs = 1'b0;
	always @(posedge clk_74_25m) begin
		if (!sys_reset_n)
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
		if (!sys_reset_n)
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

	//assign {led5_g, led4_g} = bram_din[7:6]; // for debug

	wire [7:0] bram_dout;
	wire [$clog2(WIDTH)-1:0]  hcount_adjusted;
	wire [$clog2(HEIGHT)-1:0] vcount_adjusted;
	wire [$clog2(IMAGE_PIXELS):0] read_address;
	assign {hcount_adjusted, vcount_adjusted} = {hcount, vcount};
	assign read_address = IMAGE_WIDTH * vcount_adjusted + hcount_adjusted;
	//assign read_address = (IMAGE_HEIGHT - 1 - hcount_adjusted) * IMAGE_WIDTH + (IMAGE_WIDTH - 1 - vcount_adjusted);

  dpram_mclk
  #(
    .DATA_WIDTH(1),
    .ADDR_WIDTH(19)
  )
  dpram_mclk_inst
  (
		.clk1(clk_12m),
		.clk2(clk_74_25m),
		.we(visualizer_valid),
		.add1(visualizer_addr),
		.add2(read_address),
		.di(bram_din[0]),
		.do1(),
		.do2(bram_dout)
  );

	reg [$clog2(WIDTH)-1:0]            hcount_d = 'd0;
	reg [$clog2(HEIGHT)-1:0]           vcount_d = 'd0;
	reg                                vs_d, hs_d, de_d;

	always @(posedge clk_74_25m) begin
		hcount_d <= hcount_adjusted;
		vcount_d <= vcount_adjusted;
		hs_d <= hs;      
		vs_d <= vs;
		de_d <= de;
	end

	wire [23:0] rbg_data;
  assign rbg_data = 
  (!de) ? 24'h000000 : 
  (hcount_d < IMAGE_WIDTH && vcount_d < IMAGE_HEIGHT) ? {24{bram_dout[0]}} :
  (vcount_d < W_HEIGHT/2) ?
  (hcount_d < W_WIDTH/2) ? 24'hff0000 : 24'h00ff00 :
  (hcount_d < W_WIDTH/2) ? 24'h0000ff : 24'hffffff ;

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
		.aRst_n(sys_reset_n), 
		// Video in
		.vid_pData(rbg_data),
		.vid_pVDE(de_d), 
		.vid_pHSync(hs_d),
		.vid_pVSync(vs_d),
		.PixelClk(clk_74_25m), // pixel-clock recovered from the DVI interface
		.SerialClk()   // 5x PixelClk
  );
  //---------------------- from LSD visualizer to HDMI ----------------------//

  /*
  assign lsd_start_v_r = lsd_line_data_r[39:30];
  assign lsd_start_h_r = lsd_line_data_r[29:20];
  assign lsd_end_v_r   = lsd_line_data_r[19:10];
  assign lsd_end_h_r   = lsd_line_data_r[9:0];
  */


 localparam integer OUT_WIDTH  = 1 * 640;
 localparam integer OUT_HEIGHT = 1 * 480;
 localparam integer OUT_H_BITW = $clog2(OUT_WIDTH) + 1;   // 11
 localparam integer OUT_V_BITW = $clog2(OUT_HEIGHT) + 1;  // 10
 localparam integer DATA_WIDTH = 2 * (OUT_V_BITW + OUT_H_BITW) + 1;

 wire [31:0]         topview_line_addr_f, topview_line_addr_r;   // topview input
 wire [OUT_V_BITW:0] topview_start_v_f, topview_start_v_r;    
 wire [OUT_H_BITW:0] topview_start_h_f, topview_start_h_r;
 wire [OUT_V_BITW:0] topview_end_v_f, topview_end_v_r;
 wire [OUT_H_BITW:0] topview_end_h_f, topview_end_h_r;
 wire                topview_valid_f, topview_valid_r;           // topview output
 wire                topview_ready_f, topview_ready_r;
 wire [31:0]         topview_line_num_f, topview_line_num_r;
 // wire [38:0]         topview_line_data_f, topview_line_data_r;     

 // 鳥瞰変換のモジュール
 /*
 topview
 #(
   .IN_HEIGHT  (IMAGE_HEIGHT),
   .IN_WIDTH   (IMAGE_WIDTH),
   .OUT_HEIGHT (OUT_HEIGHT),
   .OUT_WIDTH  (OUT_WIDTH),
   .SCALE      (SCALE),
   .HVC        (HVC),
   .HC         (HC),
   .DVC        (DVC),
   .F          (F),
   .FP         (FP),
   .THETA      (THETA),
   .CX         (CX),
   .CY         (CY),
   .CXP        (CXP),
   .CYP        (CYP)
 )
 topview_inst_f
 (
   .clk         (clk_12m),
   .n_rst       (sys_reset_n),
   .in_flag     (lsd_flag_f),
   .in_valid    (lsd_valid_f),
   .in_start_v  (start_v_f),
   .in_start_h  (start_h_f),
   .in_end_v    (end_v_f),
   .in_end_h    (end_h_f),
   .raddr       (topview_line_addr_f),
   .out_start_v (topview_start_v_f),
   .out_start_h (topview_start_h_f),
   .out_end_v   (topview_end_v_f),
   .out_end_h   (topview_end_h_f),
   .out_valid   (topview_valid_f),
   .ready       (topview_ready_f),
   .line_num    (topview_line_num_f)
 ),
 topview_inst_r
 (
   .clk         (clk_12m),
   .n_rst       (sys_reset_n),
   .in_flag     (lsd_flag_r),
   .in_valid    (lsd_valid_r),
   .in_start_v  (start_v_r),
   .in_start_h  (start_h_r),
   .in_end_v    (end_v_r),
   .in_end_h    (end_h_r),
   .raddr       (topview_line_addr_r),
   .out_start_v (topview_start_v_r),
   .out_start_h (topview_start_h_r),
   .out_end_v   (topview_end_v_r),
   .out_end_h   (topview_end_h_r),
   .out_valid   (topview_valid_r),
   .ready       (topview_ready_r),
   .line_num    (topview_line_num_r)
 );
 */

/*
assign led = {
  topview_line_data_f[1:0],  // for debug
  topview_line_data_r[1:0]  // for debug
};
*/

// モーターのモジュール
testset
#(
    .CLK_FREQ(100 * 10 ** 6), // 100 MHz
    .CLK_DIVIDE(8000),
    .FB_EDGE_PERIOD(0.5)      // 0.5 sec
)
testset_inst
(
  .clk        (PS_CLK), // 100 MHz
  .n_rst      (sys_reset_n),
  // .sw         (sw),
  .btn        (sw[0]),      // brake signal 
  .fbr        (fbr),
  .fbl        (fbl),
  .psv        (kl_accel),
  .ste        (kl_steer),
  .out_edge_l (speed_l),
  .out_edge_r (speed_r),
  .pwma       (pwma),
  .pwmb       (pwmb),
  .ain1       (ain1),
  .ain2       (ain2),
  .bin1       (bin1),
  .bin2       (bin2),
  .stnby      (stnby)
);
endmodule

`default_nettype wire
