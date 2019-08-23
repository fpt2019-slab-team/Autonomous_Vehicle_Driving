module astray 
  (
   input wire       clk,
   // input wire [3:0] sw,
   input wire [9:0] pwmv,
   // output wire      pulseH,
   // output wire      pulseG
   output wire      pulse
   );
   
   // wire             zclk;
   reg [9:0]        pwmv;
   
   // assign pulseH = sw[2] ? pulse: 1'b0;
   // assign pulseG = sw[2] ? 1'b0: pulse;
   
   // always @(posedge clk) begin
   //    // STOP
   //    if (!sw[0]) begin
   //       pwmv <= 10'b0;
   //    end
   //    // OTHER
   //    else if (sw[0]) begin
   //       // FULL POWER
   //       if (sw[1]) begin
   //          pwmv <= 10'h3FF;
   //       end
   //       else begin
   //          pwmv <= 10'h1FF;
   //       end
   //    end
   // end
	
   // zynqclk zc 
   //   (
   //    .refclk(clk),
   //    .outclk_0(zclk)
   //    );
   
   pwmc mp
     (
      .clk(clk),
      .vq(pwmv),
      .pulse(pulse)
      );
   
endmodule
