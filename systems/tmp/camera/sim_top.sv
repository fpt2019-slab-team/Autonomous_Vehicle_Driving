`default_nettype none
`timescale 1ns/1ns

module sim_top();
   localparam real CLOCK_FREQ = 100 * 10 ** 6; // 100 MHz
   localparam real CLOCK_PERIOD_NS = 10 ** 9 / CLOCK_FREQ; // ns

   localparam integer WRITE_CYCLES = 640 * 480;
   localparam integer OFFSET = 500;
   localparam integer SIM_CYCLES = WRITE_CYCLES + OFFSET;

   localparam integer IMG_WIDTH = 640;
   localparam integer IMG_HEIGHT = 480;
   localparam integer PIXELS = IMG_WIDTH * IMG_HEIGHT;
   localparam integer DATA_WIDTH = 8;
   
   logic              clk, n_rst, w_req;
   logic [$clog2(PIXELS):0] r_addr;
   wire [$clog2(IMG_WIDTH) - 1:0] hcount;
   wire [$clog2(IMG_HEIGHT) - 1:0] vcount;
   wire [DATA_WIDTH - 1:0]  dout;
   
   top
     #(
       .IMG_WIDTH(IMG_WIDTH),
       .IMG_HEIGHT(IMG_HEIGHT),
       .DATA_WIDTH(DATA_WIDTH)
       )
   top_inst
     (
      .clk(clk),
      .n_rst(n_rst),
      .w_req(w_req), // write request
      .r_addr(r_addr) // read address
      .dout(dout)
      );

   initial begin
      clk <= 1'b0;
      forever begin
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
      #(CLOCK_PERIOD_NS * 2)
      n_rst <= 1'b0;
      #(CLOCK_PERIOD_NS)
      n_rst <= 1'b1;
   end
   
   initial begin
      w_req <= 1'b0;
      r_addr <= 'h0;
      #(CLOCK_PERIOD_NS * 10)
      w_req <= 1'b1;
      #(SIM_CYCLES)
      w_req <= 1'b0;
      #(WRITE_CYCLES * CLOCK_PERIOD_NS)
      r_addr <= 'hfc;
      #(OFFSET * CLOCK_PERIOD_NS)
      w_req <= 1'b1;
      #(WRITE_CYCLES * CLOCK_PERIOD_NS)
      w_req <= 1'b0;
      $finish;
   end

   initial begin
      $shm_open("top.shm");
      $shm_probe(top_inst, "ACM");
   end

   task print();
      $write("hcount = %d, vcount = %d, dout = %02x \n", 
             top_inst.hcount top_inst.vcount, dout);
   endtask
   
endmodule // sim_top

`default_nettype wire
