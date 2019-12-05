module testset
#(
    parameter integer CLK_FREQ       = -1,
    parameter integer CLK_DIVIDE     = -1,
    parameter real    FB_EDGE_PERIOD = -1
)
(
  input wire          clk,
  input wire          n_rst,        //using botton ,botton always sends low signal
  input wire          btn,        //for brake action
  input wire          fbr,        //con to PMOD
  input wire          fbl,        //con to PMOD
  input wire  [6:0]   psv,        //con to PS
  input wire  [7:0]   ste,        //con to PS

  output wire [15:0]  out_edge_l, //con to PS 
  output wire [15:0]  out_edge_r, //con to PS 
  output wire         pwma,       //con to PMOD        
  output wire         pwmb,       //con to PMOD
  output wire         ain1,       //con to PMOD
  output wire         ain2,       //con to PMOD
  output wire         bin1,       //con to PMOD
  output wire         bin2,       //con to PMOD
  output wire         stnby       //con to PMOD
);

localparam integer CLK_CNT_MAX = CLK_FREQ / CLK_DIVIDE;

  reg   [6:0]   rvr;
  reg   [6:0]   lvr;

  wire  [6:0]   rvw;
  wire  [6:0]   lvw;
  wire          pulser;
  wire          pulsel;
  wire [13:0]   pb_rv,pb_lv;
  wire [15:0]   cnt_edge_l;
  wire [15:0]   cnt_edge_r;

  assign out_edge_l = cnt_edge_l;
  assign out_edge_r = cnt_edge_r;

  reg [14:0]    clk_cnt;

  always @(posedge clk)begin
    if (!n_rst)begin
      clk_cnt <= 15'd0;
    end else if (clk_cnt == CLK_CNT_MAX - 1)begin
      clk_cnt <= 15'd0; 
    end else begin
      clk_cnt <= clk_cnt + 1'b1;
    end
  end

  always @(posedge clk) begin
    if (!n_rst)begin
      rvr <= 7'd0;
      lvr <= 7'd0;
    end else if (clk_cnt == CLK_CNT_MAX - 1)begin
      rvr <= rvw;
      lvr <= lvw;  
    end
  end

  /* steering */
  hoge hg(
    .in_acc(psv),
    .in_ste(ste),  
    .brk(btn),
    .v_r(rvw),
    .v_l(lvw)
  );

  /* buffer function */
  pbsbf4_Top 
  #(
    .CLK_FREQ(CLK_FREQ),
    .CLK_DIVIDE(CLK_DIVIDE)
  )pb_r(
    .n_rst(n_rst),
    .clk(clk), 
    .din(rvr),
    .dout_3(pb_rv)
  ),
  pb_l(
    .n_rst(n_rst),
    .clk(clk),
    .din(lvr),
    .dout_3(pb_lv)
  );

  /* pwm */
  pwm14	pwm14l(
    .n_rst(n_rst),
    .vq(pb_lv),
    .clk(clk), // 125 MHz
    .pulse(pulsel)
  );
  pwm14	pwm14r(
    .n_rst(n_rst),
    .vq(pb_rv),
    .clk(clk),
    .pulse(pulser)
  );

  /* ppam */
  apamod apm(
    .pwmr(pulser),
    .pwml(pulsel),
    .brk(btn),
    //.pwma(pwma),
    .pwma(pwma),
    .pwmb(pwmb),
    .ain1(ain1),
    .ain2(ain2),
    .bin1(bin1),
    .bin2(bin2),
    .stnby(stnby)
  );

  // feedback from right motor
  fbmod
  #(
    .CLK_FREQ(CLK_FREQ),
    .EDGE_PERIOD(FB_EDGE_PERIOD)
  )
  fbr_inst(
    .clk(clk),       
    .n_rst(n_rst),
    .inp_fbp(fbr),
    .edge_out(cnt_edge_r)
  ),
  fbl_inst(
    .clk(clk),       
    .n_rst(n_rst),
    .inp_fbp(fbl),
    .edge_out(cnt_edge_l)
  );

endmodule

