`timescale 1ns / 1ps
module clock_gen
#(
    parameter integer IN_CLK_FREQ  = -1,
    parameter integer OUT_CLK_FREQ = -1
)
(
  input wire    clk,
  input wire    n_rst,
  output wire   clk_14
  //output wire   clk_14_8
  //output wire   clk_14_64
);

  reg [13:0]   cnt;
  //reg [6:0]   cnt_1;

  //assign clk_14_8  = ~cnt[3];
  //assign clk_14_64 = ~cnt_1[6];
  assign clk_14    = ~cnt[13];

  always @(posedge clk )begin
    if (!n_rst)begin
      cnt <= 7'd0;
    end else begin
      cnt <= cnt + 7'd1;
    end
  end

  //always @(posedge clk_14 )begin
  //  if (!n_rst)begin
  //    cnt_1 <= 7'd0;
  //  end else begin
  //    cnt_1 <= cnt_1 + 7'd1;
  //  end
  //end

endmodule
