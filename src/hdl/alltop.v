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
localparam integer FRAME_WIDTH  = 784;
localparam integer FRAME_HEIGHT = 510;
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

// Clock and reset
wire              locked;
wire              axi_aclk;    // 50MHz 
wire              clk_24m;     // 24MHz 
wire              clk_12m;     // 12MHz
wire              sys_reset_n;

clk_wiz_0 clk_wiz_0_inst
(
  .clk_in1  (sysclk),     // 125MHz : input
  .reset    (btn[0]),
  .locked   (locked),
  .clk_out1 (clk_24m),    //  24MHz : output
  .clk_out2 (clk_12m)     //  12MHz : output 
);

/// Synchronizer ///
reg [3:0]         sys_reset_n_sync_regs = 4'h0;
always @(posedge clk_12m) begin
  sys_reset_n_sync_regs <= {sys_reset_n_sync_regs[2:0], locked};
end
///////////////////

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


/// degub (Using LED)  ///

assign led = speed_r[3:0];

/// debug end          ///


// PSPL Communication（block design）
pspl_comm
#(
  .C_S00_AXI_DATA_WIDTH(),
  .C_S00_AXI_ADDR_WIDTH()
)
pspl_comm_inst
(
  .sw       (sw[1]),
  .led      (),
  .axi_aclk (axi_aclk),

  /* From PS to SCCB */
  .sccb_busy      (sccb_busy),
  .sccb_req       (sccb_req),
  .sccb_send_data (sccb_send_data),

  /* From LSD to PS */
  // .lsd_ready_f        (lsd_ready_f),
  // .lsd_ready_r        (lsd_ready_r),
  // .lsd_line_num_f     (lsd_line_num_f),
  // .lsd_line_num_r     (lsd_line_num_r),
  // .lsd_line_start_v_f (start_v_f),
  // .lsd_line_start_v_r (start_v_r), 
  // .lsd_line_start_h_f (start_h_f), 
  // .lsd_line_start_h_r (start_h_r), 
  // .lsd_line_end_v_f   (end_v_f),   
  // .lsd_line_end_v_r   (end_v_r),   
  // .lsd_line_end_h_f   (end_h_f),   
  // .lsd_line_end_h_r   (end_h_r),   
  // .lsd_line_addr_f    (lsd_line_addr_f),          // From PS to LSD
  // .lsd_line_addr_r    (lsd_line_addr_r),

  .lsd_ready_f        (1'b1),
  .lsd_ready_r        (1'b1),
  .lsd_line_num_f     (1'b1),
  .lsd_line_num_r     (1'b1),
  .lsd_line_start_v_f ('d120),
  .lsd_line_start_v_r ('d360), 
  .lsd_line_start_h_f ('d160), 
  .lsd_line_start_h_r ('d160), 
  .lsd_line_end_v_f   ('d360),   
  .lsd_line_end_v_r   ('d120),   
  .lsd_line_end_h_f   ('d480),   
  .lsd_line_end_h_r   ('d480),   
  .lsd_line_addr_f    (lsd_line_addr_f),          // From PS to LSD
  .lsd_line_addr_r    (lsd_line_addr_r),

  /* From Topview to PS */
  .topview_ready_f        (topview_ready_f),
  .topview_ready_r        (topview_ready_r),
  .topview_line_num_f     (topview_line_num_f),
  .topview_line_num_r     (topview_line_num_r),
  .topview_line_start_v_f (topview_start_v_f),
  .topview_line_start_v_r (topview_start_v_r),
  .topview_line_start_h_f (topview_start_h_f),
  .topview_line_start_h_r (topview_start_h_r),
  .topview_line_end_v_f   (topview_end_v_f),
  .topview_line_end_v_r   (topview_end_v_r),
  .topview_line_end_h_f   (topview_end_h_f),
  .topview_line_end_h_r   (topview_end_h_r),
  .topview_line_valid_f   (topview_valid_f),
  .topview_line_valid_r   (topview_valid_r),
  .topview_line_addr_f    (topview_line_addr_f),  // From PS to Topview
  .topview_line_addr_r    (topview_line_addr_r),

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


// Camera module
cam_top
#(
    .DATA_WIDTH(BIT_WIDTH),
    .CAM_WINDOW_HEIGHT(IMAGE_HEIGHT),
    .CAM_WINDOW_WIDTH(IMAGE_WIDTH)
)
cam_top_inst_f
(
  .clk_12m        (clk_12m),
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
  .clk_12m        (clk_12m),
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
wire [H_BITW-1:0] start_h_f, start_h_r;               // lsd output
wire [V_BITW-1:0] start_v_f, start_v_r;
wire [H_BITW-1:0] end_h_f, end_h_r;
wire [V_BITW-1:0] end_v_f, end_v_r;
wire [H_BITW-1:0] lsd_start_h_f, lsd_start_h_r;       // lsd buffer output
wire [V_BITW-1:0] lsd_start_v_f, lsd_start_v_r;
wire [H_BITW-1:0] lsd_end_h_f, lsd_end_h_r;
wire [V_BITW-1:0] lsd_end_v_f, lsd_end_v_r;
wire              lsd_ready_f, lsd_ready_r;
wire              lsd_flag_f, lsd_flag_r;
wire              lsd_valid_f, lsd_valid_r;
wire [7:0]        lsd_angle_f, lsd_angle_r;
wire [31:0]       lsd_line_num_f, lsd_line_num_r;
wire [39:0]       lsd_line_data_f, lsd_line_data_r;

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
  .clock       (clk_12m),
  .n_rst       (sys_reset_n),
  .in_y        (pixel_data_f),
  .in_vcnt     (v_count_f),
  .in_hcnt     (h_count_f),
  .out_flag    (lsd_flag_f),
  .out_valid   (lsd_valid_f),
  .out_start_v (start_v_f),
  .out_end_v   (end_v_f),
  .out_start_h (start_h_f),
  .out_end_h   (end_h_f),
  .out_angle   (lsd_angle_f)
),
simple_lsd_inst_r
(
  .clock       (clk_12m),
  .n_rst       (sys_reset_n),
  .in_y        (pixel_data_r),
  .in_vcnt     (v_count_r),
  .in_hcnt     (h_count_r),
  .out_flag    (lsd_flag_r),
  .out_valid   (lsd_valid_r),
  .out_start_v (start_v_r),
  .out_end_v   (end_v_r),
  .out_start_h (start_h_r),
  .out_end_h   (end_h_r),
  .out_angle   (lsd_angle_r)
);

lsd_output_buffer
lsd_output_buffer_inst_f
(
  .clock            (clk_12m),
  .n_rst            (sys_reset_n),
  .in_flag          (lsd_flag_f),
  .in_valid         (lsd_valid_f),
  .in_start_v       (start_v_f),
  .in_end_v         (end_v_f),
  .in_start_h       (start_h_f),
  .in_end_h         (end_h_f),
  .in_rd_addr       (lsd_line_addr_f),
  // .in_write_project (),
  .out_ready        (lsd_ready_f),
  .out_line_num     (lsd_line_num_f),
  .out_data         (),
  .out_start_v      (lsd_start_v_f),
  .out_end_v        (lsd_end_v_f),
  .out_start_h      (lsd_start_h_f),
  .out_end_h        (lsd_end_h_f)
),
lsd_output_buffer_inst_r
(
  .clock            (clk_12m),
  .n_rst            (sys_reset_n),
  .in_flag          (lsd_flag_f),
  .in_valid         (lsd_valid_r),
  .in_start_v       (start_v_r),
  .in_end_v         (end_v_r),
  .in_start_h       (start_h_r),
  .in_end_h         (end_h_r),
  .in_rd_addr       (lsd_line_addr_r),
  // .in_write_project (),
  .out_ready        (lsd_ready_r),
  .out_line_num     (lsd_line_num_r),
  .out_data         (),
  .out_start_v      (lsd_start_v_r),
  .out_end_v        (lsd_end_v_r),
  .out_start_h      (lsd_start_h_r),
  .out_end_h        (lsd_end_h_r)
);


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

// Topview module
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

// Motor module
testset
testset_inst
(
  .clk        (axi_aclk),
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
