`default_nettype none
`timescale 1ns/1ns

module sim_testset();
  localparam integer CLOCK_FREQ      = 125 * 10 ** 6; // 125 MHz
  localparam integer CLOCK_PERIOD_NS = 10 ** 9 / CLOCK_FREQ;
  localparam integer DIV_CLOCK_CNT   = 16384;

  reg         clk, n_rst, btn;
  reg         fbr, fbl;
  reg  [6:0]  psv;
  reg  [7:0]  ste;
  wire [15:0] out_edge_l, out_edge_r;
  wire        pwma, pwmb, ain1, ain2, bin1, bin2, stnby;

  /* generate instance */
  testset
  #(
  )
  testset_0
  (
    .clk(clk),
    .n_rst(n_rst),
    .btn(btn),
    .fbr(fbr),
    .fbl(fbl),
    .psv(psv),
    .ste(ste),
    .out_edge_l(out_edge_l),
    .out_edge_r(out_edge_r),
    .pwma(pwma),
    .pwmb(pwmb),
    .ain1(ain1),
    .ain2(ain2),
    .bin1(bin1),
    .bin2(bin2),
    .stnby(stnby)
  );

  /* generate clock */
  initial begin
    clk <= 1'b0;
    forever #(CLOCK_PERIOD_NS / 2) clk <= ~clk;
  end

  /* generate n_rst */
  initial begin
    n_rst <= 1'b1;
    #(CLOCK_PERIOD_NS)
    n_rst <= 1'b0;
    #(CLOCK_PERIOD_NS)
    n_rst <= 1'b1;
  end

  /* simulation */
  initial begin
    psv <= 'd5;
    ste <= 'd5;
    btn <= 'd0;
    
    #(CLOCK_PERIOD_NS * (DIV_CLOCK_CNT * 10000))
    $finish;
  end

  initial begin
    fbr = 1'b0;    
    #(CLOCK_PERIOD_NS * 50);
    fbr = 1'b1;
    #(CLOCK_PERIOD_NS);
    fbr = 1'b0;
    #(CLOCK_PERIOD_NS * 50);
    fbr = 1'b1;
    #(CLOCK_PERIOD_NS);
    fbr = 1'b0;
    #(CLOCK_PERIOD_NS * 50);
    fbr = 1'b1;
    #(CLOCK_PERIOD_NS);
    fbr = 1'b0;
  end

  initial begin
    fbl = 1'b0;    
    #(CLOCK_PERIOD_NS * 50);
    fbl = 1'b1;
    #(CLOCK_PERIOD_NS);
    fbl = 1'b0;
    #(CLOCK_PERIOD_NS * 50);
    fbl = 1'b1;
    #(CLOCK_PERIOD_NS);
    fbl = 1'b0;
    #(CLOCK_PERIOD_NS * 50);
    fbl = 1'b1;
    #(CLOCK_PERIOD_NS);
    fbl = 1'b0;
  end
  /* open shm */
  initial begin
    $shm_open("testset.shm");
    $shm_probe(testset_0,"ACM");
  end

  endmodule

  `default_nettype wire
