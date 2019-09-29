`default_nettype none

module stream8bit
  (
   input wire       clk,
   input wire       n_rst,
   output wire [7:0] dout
   );

   reg [7:0]         dout_reg;
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         dout_reg <= 8'b1111_1111;
      end else begin
         dout_reg <= dout_reg + 1'b1;
      end
   end
   assign dout = dout_reg;
   
endmodule

`default_nettype wire
