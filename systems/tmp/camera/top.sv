`default_nettype none

module top
  #(
    parameter integer IMG_WIDTH = 640, 
    parameter integer IMG_HEIGHT = 480, 
    parameter integer PIXELS = IMG_WIDTH * IMG_HEIGHT,
    parameter integer DATA_WIDTH = 8
    )
   (
    input wire                    clk,
    input wire                    n_rst,
    input wire                    w_req,
    input wire [$clog2(PIXELS):0] r_addr
    );

   wire [$clog2(IMG_WIDTH) - 1:0] hcount;
   wire [$clog2(IMG_HEIGHT) - 1:0] vcount;
   wire [DATA_WIDTH - 1:0]         din;
   
   cam
     #(
       .IMG_WIDTH(IMG_WIDTH),
       .IMG_HEIGHT(IMG_HEIGHT),
       .DATA_WIDTH(DATA_WIDTH),
       .OPTION(0)
       )
   cam_inst
     (
      .clk(clk),
      .n_rst(n_rst),
      .hcount(hcount),
      .vcount(vcount),
      .dout(din)
      );

   wire                            w_busy;
   wire [DATA_WIDTH - 1:0]         dout;
   
   img_mem
     #(
       .IMG_WIDTH(IMG_WIDTH),
       .IMG_HEIGHT(IMG_HEIGHT),
       .DATA_WIDTH(DATA_WIDTH)
       )
   img_mem_inst
     (
      .clk(clk),
      .n_rst(n_rst),
      .w_req(w_req),
      .hcount(hcount),
      .vcount(vcount),
      .r_addr(r_addr),
      .din(din),
      .w_busy(w_busy),
      .dout(dout)
      );
   
endmodule

`default_nettype wire
