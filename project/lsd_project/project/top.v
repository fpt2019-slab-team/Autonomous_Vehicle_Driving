module HDMI_Top(
  input wire 	  sysclk,
  input wire 	  rst,
  output wire 	  hdmi_tx_clk_n,
  output wire 	  hdmi_tx_clk_p,
  output wire [2:0] hdmi_tx_d_n,
  output wire [2:0] hdmi_tx_d_p
);
//using 640 x 480 size

//Horizontal Timing
parameter H_ACTIVE_PIXEL  =11'd  640;
parameter H_FRONT_PORCH   =11'd   16;
parameter H_SYNC_WIDTH    =11'd   96;
parameter H_BACK_PORCH    =11'd   48;
parameter H_TOTAL         =11'd  800;
parameter H_WIDTH         =11'd   11;

//Vertical Timing
parameter V_ACTIVE_LINE   =11'd  480;
parameter V_FRONT_PORCH   =11'd   10;
parameter V_SYNC_WIDTH    =11'd    2;
parameter V_BACK_PORCH    =11'd   33;
parameter V_TOTAL         =11'd  525;
parameter V_WIDTH         =11'd   10;

wire hsync;
wire vsync;
wire de;

wire 			  sysrst;
wire 			  pixelclk;
wire 			  serialclk;


// ------------
wire [log2(V_TOTAL)-1:0] 	 vcnt;
wire [log2(H_TOTAL)-1:0] 	 hcnt;
wire 			 flag_0,    flag_1;
wire 			 valid_0,   valid_1;
wire [log2(V_TOTAL)-1:0] 	 start_v_0, start_v_0;
wire [log2(V_TOTAL)-1:0] 	 end_v_0,   end_v_1;
wire [log2(H_TOTAL)-1:0] 	 start_h_0, start_h_1;
wire [log2(H_TOTAL)-1:0] 	 end_h_0,   end_h_1;
wire [7:0] 			 angle_0,   angle_1;

// test pixel generation
wire [63:0] 			 rnd;
xorshift128plus xors_0
(  .clock(pixelclk), .n_rst(sysrst), .out_value(rnd) );

// lsd_0
simple_lsd 
#( .BIT_WIDTH(8),
.IMAGE_HEIGHT(V_ACTIVE_LINE), .IMAGE_WIDTH(H_ACTIVE_PIXEL), 
.FRAME_HEIGHT(V_TOTAL),       .FRAME_WIDTH(H_TOTAL) )
lsd_0
(  .clock(pixelclk),    .n_rst(sysrst),
.in_y(rnd[0+:8]),    .in_vcnt(vcnt),      .in_hcnt(hcnt),
.out_flag(flag_0),   .out_valid(valid_0), .out_angle(angle_0),
.out_start_v(start_v_0), .out_start_h(start_h_0),
.out_end_v(end_v_0),     .out_end_h(end_h_0)  );

wire [7:0] 	 r_out;
assign r_out = (flag_0 && valid_0 &&
((start_v_0 == vcnt && start_h_0 == hcnt) ||
(end_v_0 == vcnt   && end_h_0 == hcnt))) ? angle_0 : 0;

// lsd_1
simple_lsd 
#( .BIT_WIDTH(8),
.IMAGE_HEIGHT(V_ACTIVE_LINE), .IMAGE_WIDTH(H_ACTIVE_PIXEL), 
.FRAME_HEIGHT(V_TOTAL),       .FRAME_WIDTH(H_TOTAL) )
lsd_1
(  .clock(pixelclk),    .n_rst(sysrst),
.in_y(rnd[8+:8]),    .in_vcnt(vcnt),      .in_hcnt(hcnt),
.out_flag(flag_1),   .out_valid(valid_1), .out_angle(angle_1),
.out_start_v(start_v_1), .out_start_h(start_h_1),
.out_end_v(end_v_1),     .out_end_h(end_h_1) );

wire [7:0] 	 g_out;
assign g_out = (flag_1 && valid_1 &&
((start_v_1 == vcnt && start_h_1 == hcnt) ||
(end_v_1 == vcnt   && end_h_1 == hcnt))) ? angle_1 : 0;


// ------------

//Using rgb2dvi IPcore
rgb2dvi_0 rgb2dvi_1(
  .TMDS_Clk_p (hdmi_tx_clk_p), 
  .TMDS_Clk_n (hdmi_tx_clk_n),
  .TMDS_Data_p(hdmi_tx_d_p), 
  .TMDS_Data_n(hdmi_tx_d_n), 
  .aRst(!sysrst),
  .vid_pData({r_out, g_out, r_out}),//
  .vid_pVDE(de),
  .vid_pHSync(hsync),
  .vid_pVSync(vsync),
  .PixelClk(pixelclk)
  //.SerialClk(serialclk)
  );

  //Control timing
  HDMI_Timing #(
    .H_ACTIVE_PIXEL(H_ACTIVE_PIXEL),
    .H_FRONT_PORCH (H_FRONT_PORCH ),
    .H_SYNC_WIDTH  (H_SYNC_WIDTH  ),
    .H_BACK_PORCH  (H_BACK_PORCH  ),
    .H_TOTAL       (H_TOTAL       ),
    .H_WIDTH       (H_WIDTH       ),

    .V_ACTIVE_LINE (V_ACTIVE_LINE),
    .V_FRONT_PORCH (V_FRONT_PORCH),
    .V_SYNC_WIDTH  (V_SYNC_WIDTH ),
    .V_BACK_PORCH  (V_BACK_PORCH ),
    .V_TOTAL       (V_TOTAL      ),
    .V_WIDTH       (V_WIDTH      )
  )HDMI_Timing_0 (
    .clk(pixelclk),
    .rst(!sysrst),
    .hsync(hsync),
    .vsync(vsync),
    .h_cnt(hcnt),
    .v_cnt(vcnt),
    .de(de)
  ); 

  clk_wiz_0 instance_name
  (
    // Clock out ports
    .clk_out1(pixelclk),      // output clk_out1
    .clk_out2(serialclk),     // output clk_out2
    // Status and control signals
    // .resetn(rst),          // input resetn
    .locked(sysrst),          // output locked
    // Clock in ports
    .clk_in1(sysclk)
    );      //


    // functions ---------------------------------------------------------------
    function integer log2;
      input integer value;
    begin
      value = value - 1;
      for ( log2 = 0; value > 0; log2 = log2 + 1 )
        value = value >> 1;
      end
    endfunction

    endmodule
