`default_nettype none

module top
  (
   input wire        clk,
   input wire [1:0]  sw,
   output wire [5:0] led_out,
   output wire       pulse1,
   output wire       pulse2
   );
   
   design_1 uut
     (
      .sw(sw),
      .led_out(led_out[3:0]),
      .pulse1(pulse1),
      .pulse2(pulse2)      
      );

   assign led_out[5:4] = sw;
   
endmodule

`default_nettype wire
