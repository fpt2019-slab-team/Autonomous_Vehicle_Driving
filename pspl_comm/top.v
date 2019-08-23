`default_nettype none

module top
  (
   output wire [3:0] led_out,
   output wire       pulse1,
   output wire       pulse2
   );
   
   design_1 uut
     (
      .led_out(led_out),
      .pulse1(pulse1),
      .pulse2(pulse2)      
      );
   
endmodule

`default_nettype wire
