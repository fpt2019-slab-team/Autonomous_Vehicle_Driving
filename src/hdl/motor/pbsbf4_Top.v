module pbsbf4_Top 
#(
  parameter CLK_DIVIDE = -1,
  parameter CLK_FREQ   = -1  
)
(
  input wire         clk,
  //input wire         clk_8,
  //input wire         clk_64,
  input wire         n_rst,
  input wire [6:0]   din,
  //output wire[13:0]  dout_1, // For debug
  //output wire[26:0]  dout_2, // For debug
  output wire[13:0]  dout_3
  //output wire[DOUT_W-1:0]  dout
);
  
  //wire [16:0]     din_parent;
  //wire [26:0]     din_child;
  //wire [13:0]     dout;

  //assign dout_1 = din_parent;
  //assign dout_2 = din_child;
  //assign dout_3 = dout;

  //  clock_gen cg(
  //    .clk(clk),
  //    .n_rst(n_rst),
  //    .clk_14_8(clk_8)
  //    //.clkout_64(clkout_64)
  //  );

  pbsbf4_renew #(
    .DIN_W(7),
    .DOUT_W(14),
    .SPLINE_W(17),
    .S(3),
    .CLK_DIVIDE(CLK_DIVIDE),
    .CLK_FREQ(CLK_FREQ)
  )Parent(
    .clk(clk),
    .din(din),
    .n_rst(n_rst),
    .dout(dout_3)
  );

//  pbsbf4 #(
//    .DIN_W(17),
//    .DOUT_W(27),
//    .SPLINE_W(27),
//    .S(0)
//  )child(
//    .clk(clk_8),
//    .n_rst(n_rst),
//    .din(din_parent),
//    .dout(din_child)
//  );
//
//  pbsbf4 #(
//    .DIN_W(27),
//    .DOUT_W(14),
//    .SPLINE_W(37),
//    .S(23)
//  )grandchild(
//    .clk(clk),
//    .n_rst(n_rst),
//    .din(din_child),
//    .dout(dout)
//  );

endmodule
