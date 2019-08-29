`default_nettype none

module top_cam
(
  input wire                       clk,
  input wire [7:0]                 data,
  input wire [$clog2(FIFO_SIZE):0] addr
);

localparam int FIFO_SIZE = 307200   // resolution = 640 * 480

bram_fifo bram_fifo_inst
#(
  .FIFO_SIZE(FIFO_SIZE)
)
(
  .clk(clk),
  .n_rst(n_rst),
  .wea(wea),
  .data_in(data),
  .addra(addr)
);

endmodule

`default_nettype wire
