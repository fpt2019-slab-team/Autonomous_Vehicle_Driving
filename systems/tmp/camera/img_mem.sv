`default_nettype none

// image memory (BRAM) module 
module img_mem
  #(
    parameter integer IMG_WIDTH = 640, // width of image
    parameter integer IMG_HEIGHT = 480, // height of image
    parameter integer PIXELS = IMG_WIDTH * IMG_HEIGHT, // # of pixels 
    parameter integer DATA_WIDTH = 8 // 8-bit gray scale of pixel
    )
   (
    input wire                            clk,
    input wire                            n_rst,
    input wire                            w_req, // write data request
    input wire [$clog2(IMG_WIDTH) - 1:0]  hcount, // horizontal count of image
    input wire [$clog2(IMG_HEIGHT) - 1:0] vcount, // vertical count of image
    input wire [$clog2(PIXELS) - 1:0]     r_addr, // read address
    input wire [DATA_WIDTH - 1:0]         din, // write data
    output wire                           w_busy, // write busy (active: writing)
    output wire [DATA_WIDTH - 1:0]        dout // read data
    );
   
   /* create write flag as a pulse */
   wire                                   w_flag;                                  
   assign w_flag = w_req && (hcount == IMG_WIDTH - 1) && (vcount == IMG_HEIGHT - 1);
   
   /* write address */
   reg [$clog2(PIXELS) - 1:0]             w_addr;
   
   reg                                    w_busy_reg;
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         w_busy_reg <= 1'b0;
      end else begin
         if (w_flag) begin
            w_busy_reg <= 1'b1;
         end
         if (w_addr == PIXELS - 1) begin
            w_busy_reg <= 1'b0;
         end
      end
   end   
   assign w_busy = w_busy_reg;
   
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         w_addr <= 'b0;
      end else begin
         if (w_flag) begin
            w_addr <= 'b0;
         end
         if (w_busy_reg) begin
            w_addr <= w_addr + 1'b1;
            if (w_addr == PIXELS - 1) begin
               w_addr <= 'b0;
            end
         end
      end
   end
   
   wire ena, enb, wea;
   assign {ena, enb, wea} = {1'b1, !w_busy_reg, w_busy_reg}; 
   
   bram 
     #(
       .IMG_WIDTH(IMG_WIDTH),
       .IMG_HEIGHT(IMG_HEIGHT),
       .DATA_WIDTH(DATA_WIDTH)
       ) 
   bram_inst
     (
      .clk(clk),      // clock
      .ena(ena),      // read enable port a
      .enb(enb),      // read enable port b
      .wea(wea),      // write enable port a
      .addra(w_addr), // write address
      .addrb(r_addr), // read address
      .dia(din),      // write data
      .dob(dout)      // read data
      );

   // Timing chart
   // clk    ___---___---___---___---___ ... ---___---___---___---___
   // w_frag _________------____________ ... ________________________
   //                   ^ external write request     ^ end of writing
   // w_busy _______________------------ ... ------------____________
   
endmodule // img_mem

`default_nettype wire
