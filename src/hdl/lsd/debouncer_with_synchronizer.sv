`default_nettype none
`timescale 1ns/1ns

module debouncer_with_synchronizer
  #(
    parameter integer CLOCK_FREQ = 24000000,  // 24 MHz
    parameter integer MASK_DURATION_MS = 10,   // 10 ms
    parameter [0:0] INIT_VAL = 0
  )
  (
    input wire clk,
    input wire n_rst,
    input wire din,
    output reg dout
  );

  localparam integer MAX_COUNT = (CLOCK_FREQ / 1000) * MASK_DURATION_MS - 1;

  wire 	      dsync;
  double_ff
  #(
    .WIDTH(1),
    .INIT_VAL(INIT_VAL)
  )
  double_ff_inst
  (
    .clk(clk),
    .din(din),
    .dout(dsync)
  );

  reg [1:0] 	      shift_reg;
  reg [$clog2(MAX_COUNT):0] count;
  always_ff @(posedge clk) begin
    if (!n_rst) begin
      count <= 'b0;
    end
    else begin
      if (shift_reg[0] ^ shift_reg[1]) begin
        count <= 'b1;
      end
      else if (count != 'b0) begin
        if (count == MAX_COUNT) begin
          count <= 'b0;
        end
        else begin
          count <= count + 1'b1;
        end
      end
    end
  end

  always_ff @(posedge clk) begin
    if (!n_rst) begin
      shift_reg <= {INIT_VAL, INIT_VAL};
    end
    else  begin
      shift_reg <= {shift_reg[0], dsync};
    end
  end

  always_ff @(posedge clk) begin
    if (!n_rst) begin
      dout <= INIT_VAL;
    end
    else if (count == 'b0) begin
      dout <= shift_reg[0];
    end
  end
endmodule

module double_ff
  #(
    parameter integer WIDTH = 32,
    parameter [WIDTH-1:0] INIT_VAL = 0
  )
  (
    input wire              clk,
    input wire [WIDTH-1:0]  din,
    output wire [WIDTH-1:0] dout
  );

  reg [WIDTH-1:0]      tmp_reg = INIT_VAL;
  reg [WIDTH-1:0]      sync_reg = INIT_VAL;

  always @(posedge clk) begin
    tmp_reg <= din;
    sync_reg <= tmp_reg;
  end
  assign dout = sync_reg;
endmodule 

`default_nettype wire
