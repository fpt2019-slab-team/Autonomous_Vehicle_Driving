`default_nettype none
`timescale 1ns/1ns

module sim_lena();
   localparam integer CLOCK_FREQ = 100 * 10 ** 6;
   localparam integer CLOCK_PERIOD_NS = 10 ** 9 / CLOCK_FREQ;
   localparam integer IMG_WIDTH = 640;
   localparam integer IMG_HEIGHT = 480;
   localparam integer DATA_WIDTH = 8;
   localparam integer PIXELS = IMG_WIDTH * IMG_HEIGHT;
   localparam integer SIM_CYCLES = PIXELS + 10;

   logic              clk;
   logic              n_rst;
   wire [$clog2(IMG_WIDTH) - 1:0] hcount;
   wire [$clog2(IMG_HEIGHT) - 1:0] vcount;
   wire [$clog2(PIXELS) - 1:0]     count;
   wire [DATA_WIDTH - 1:0]         dout;
   
   lena
     #(
       .IMG_WIDTH(IMG_WIDTH),
       .IMG_HEIGHT(IMG_HEIGHT),
       .DATA_WIDTH(DATA_WIDTH),
       .NEGA(1)
       )
   lena_inst
     (
      .clk(clk),
      .n_rst(n_rst),
      .hcount(hcount),
      .vcount(vcount),
      .count(count),
      .dout(dout)
      );

   initial begin
      clk <= 1'b0;
      repeat (SIM_CYCLES) begin
         #(CLOCK_PERIOD_NS / 2.0)
         clk <= 1'b0;
         #(CLOCK_PERIOD_NS / 2.0)
         clk <= 1'b1;
         print();
      end
      $finish;
   end

   initial begin
      n_rst <= 1'b1;
      #(CLOCK_PERIOD_NS)
      n_rst <= 1'b0;
      #(CLOCK_PERIOD_NS)
      n_rst <= 1'b1;
   end
   
   task print();
      $write("vcount = %b, hcount = %b, count = %d, ", vcount, hcount, count);
      $write("dout = %02x \n", dout);
   endtask

endmodule

`default_nettype wire
