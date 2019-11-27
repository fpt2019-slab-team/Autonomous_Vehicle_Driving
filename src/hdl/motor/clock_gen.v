`timescale 1ns / 1ps
module clock_gen(
  input wire    clk,
  input wire    n_rst,
  output wire   clk_8
);
  reg [13:0]   cnt;
  assign clk_8    = ~cnt[13];

  always @(posedge clk )begin
    if (!n_rst)begin
      cnt <= 7'd0;
    end else begin
      cnt <= cnt + 7'd1;
    end
  end

endmodule
