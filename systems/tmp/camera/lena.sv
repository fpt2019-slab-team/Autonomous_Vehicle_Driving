`default_nettype none

// lena stream module 
module lena
  #(
    parameter integer IMG_WIDTH = 640,
    parameter integer IMG_HEIGHT = 480,
    parameter integer DATA_WIDTH = 8,
    parameter integer PIXELS = IMG_WIDTH * IMG_HEIGHT,
    parameter integer NEGA = 0
    )
   (
    input wire                             clk,
    input wire                             n_rst,
    output wire [$clog2(IMG_WIDTH) - 1:0]  hcount, 
    output wire [$clog2(IMG_HEIGHT) - 1:0] vcount, 
    output wire [$clog2(PIXELS) - 1:0]     count,
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
   
   // total count
   reg [$clog2(PIXELS) - 1:0] count_reg;
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         count_reg <= 'b0;
      end else begin
         if (count_reg == PIXELS - 1) begin
            count_reg <= 'b0;
         end else begin
            count_reg <= count_reg + 1'b1;
         end
      end
   end
   assign count = count_reg;

   // dout
   logic [DATA_WIDTH - 1:0] lena;
   always_comb begin
      case (count_reg)
`include "lena.txt"
        default: lena <= 8'bx;
      endcase
   end
   assign dout = (NEGA == 0)? lena: ~lena;
   
endmodule

`default_nettype wire
