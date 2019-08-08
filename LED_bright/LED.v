module LED(
  input  wire       clk,
  output wire      led,
  output wire      led_1
);
  reg [31:0] cnt;
  initial begin
    cnt <= 32'b0;
  end

  always@(posedge clk)begin
    cnt <= cnt + 1;
  end

  assign led = cnt[23];
  assign led_1 = cnt[23];
endmodule
