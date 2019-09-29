`default_nettype none

module cam
  #(
    parameter integer IMG_WIDTH = 640,
    parameter integer IMG_HEIGHT = 480,
    parameter integer DATA_WIDTH = 8,
    parameter integer PIXELS = IMG_WIDTH * IMG_HEIGHT,
    parameter integer OPTION = 0
    )
   (
    input wire                             clk,
    input wire                             n_rst,
    output wire [$clog2(IMG_WIDTH) - 1:0]  hcount, 
    output wire [$clog2(IMG_HEIGHT) - 1:0] vcount, 
    output wire [DATA_WIDTH - 1:0]         dout
    );

   // horizontal count 
   reg [$clog2(IMG_WIDTH) - 1:0]           hcount_reg;
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         hcount_reg <= '0;
      end else begin
         if (hcount_reg == IMG_WIDTH - 1) begin
            hcount_reg <= 'b0;
         end else begin
            hcount_reg <= hcount_reg + 1'b1;
         end
      end
   end
   assign hcount = hcount_reg;
   
   // vertical count
   reg [$clog2(IMG_HEIGHT) - 1:0] vcount_reg;
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         vcount_reg <= 'b0;
      end else begin
         if (hcount_reg == IMG_WIDTH - 1) begin
            if (vcount_reg == IMG_HEIGHT - 1) begin
               vcount_reg <= '0;
            end else begin
               vcount_reg <= vcount_reg + 1'b1;
            end
         end
      end
   end
   assign vcount = vcount_reg;

   logic [DATA_WIDTH - 1:0] tmp;
   always_comb begin
      if (vcount_reg < IMG_HEIGHT / 2) begin
         if (hcount_reg < IMG_WIDTH / 2) begin
            tmp <= 8'h00;
         end else begin
            tmp <= 8'h40;
         end
      end else begin
         if (hcount_reg < IMG_WIDTH / 2) begin
            tmp <= 8'h80;
         end else begin
            tmp <= 8'hff;
         end
      end
   end
   assign dout = (OPTION == 0)? tmp: ~tmp;
   
endmodule
   
`default_nettype wire
