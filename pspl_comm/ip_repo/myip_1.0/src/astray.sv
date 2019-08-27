module astray 
  (
   input wire        clk,
   input wire [12:0] pwmv,
   output wire       pulse
   );

   reg [12:0]        pwmv;

   pwmc mp
     (
      .clk(clk),
      .vq(pwmv),
      .pulse(pulse)
      );

endmodule
