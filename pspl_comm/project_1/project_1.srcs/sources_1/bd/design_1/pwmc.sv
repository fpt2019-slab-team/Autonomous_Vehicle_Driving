//13bits PWM
//vqの有効な値: 0~8191
module pwmc (
	     input wire       clk,
	     input wire [12:0] vq, 
	     output wire      pulse
);
   wire [13:0] 		      qc = {1'b1, vq} - {1'b0, cnt} - 13'b1;
   reg [12:0] 		      cnt;
   
   assign pulse = qc[13];
   
   always @(posedge clk) begin
      cnt <= cnt + 13'b1;
   end

   initial begin
      cnt = 13'b0;
   end

endmodule
