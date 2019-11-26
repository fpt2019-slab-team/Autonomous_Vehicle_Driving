module testset(
  input wire          clk,
  input wire          n_rst,        //using botton ,botton always sends low signal
//  input wire [1:0]    sw,         //control speed with swith
  input wire          btn,        //for brake action
  input wire          fbr,        //con to PMOD
  input wire          fbl,        //con to PMOD
  input wire  [6:0]   psv,        //con to PS
  input wire  [7:0]   ste,        //con to PS
  // input wire  [6:0]   rvw,        //con to PS
  // input wire  [6:0]   lvw,        //con to PS

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

  //reg   [6:0]   psv;
  reg   [6:0]   rvr;
  reg   [6:0]   lvr;

  wire  [6:0]   rvw;
  wire  [6:0]   lvw;
  wire          clk_8;
  wire          pulser;
  wire          pulsel;
  wire [13:0]   pb_rv,pb_lv;
  wire [15:0]   cnt_edge_l;
  wire [15:0]   cnt_edge_r;

  assign out_edge_l = cnt_edge_l;
  assign out_edge_r = cnt_edge_r;

  clock_gen clock_gen_inst (
    .clk(clk),        //in
    .n_rst(n_rst),
    .clk_8(clk_8)    //out
  );

  wire clk_8_bufg;
  BUFG BUFG_inst
  (
    .I(clk_8),
    .O(clk_8_bufg)
  );

  always @(posedge clk_8_bufg) begin
    if (!n_rst)begin
      rvr <= 7'd0;
      lvr <= 7'd0;
    end else begin
      rvr <= rvw;
      lvr <= lvw;  
    end
  end

  /* steering */
  hoge hg(
    .in_acc(psv),
    .in_ste(ste),  //8'b0 means go straight
    .brk(btn),
    .v_r(rvw),
    .v_l(lvw)
  );

  /* buffer function */
  pbsbf4_Top pb_r(
    .n_rst(n_rst),
    .clk(clk_8_bufg), // 8 kHz
    .din(rvr),
    .dout_3(pb_rv)
  );
  pbsbf4_Top pb_l(
    .n_rst(n_rst),
    .clk(clk_8_bufg),
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
  fbmod fbr_inst(
    .clk(clk),       
    .n_rst(n_rst),
    .inp_fbp(fbr),
    .edge_out(cnt_edge_r)
  );
  fbmod fbl_inst(
    .clk(clk),       
    .n_rst(n_rst),
    .inp_fbp(fbl),
    .edge_out(cnt_edge_l)
  );

  /* for debug */
  /*
  reg  [13:0] pb_rv_reg, pb_lv_reg;
  always_ff @(posedge clk_8_bufg) begin
    pb_rv_reg <= pb_rv;
    pb_lv_reg <= pb_lv;
  end
  */

endmodule

