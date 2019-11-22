module pwm14 (
  input wire [13:0] vq,
  input wire n_rst,
  input wire clk,
  output wire pulse
);

  reg [13:0] cnt;
    reg rpulse;
    
  assign pulse = rpulse;

  always @(posedge clk) begin
    if(!n_rst)begin
      cnt <= 14'd0;
        rpulse <= 1'b0;
    end else begin
      cnt <= cnt + 14'b1;
      
    if (cnt < vq) begin
        rpulse <= 1'b1;
       end else begin
        rpulse <= 1'b0;
       end
    end
      
    end
    

endmodule
