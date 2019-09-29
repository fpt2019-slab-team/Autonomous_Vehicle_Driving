`default_nettype none

/* Memory for image */
module img_mem
  #(
    parameter integer WIDTH = 640, // width of image
    parameter integer HEIGHT = 480, // height of image
    parameter integer BIT_WIDTH = 8 // 8-bit gray scale of pixel
    )
   (
    input wire                            clk,
    input wire                            n_rst,
    input wire                            w_req, // write data request
    input wire [$clog2(WIDTH * HEIGHT):0] r_addr, // read address
    input wire [BIT_WIDTH - 1:0]          din, // write data
    output wire [BIT_WIDTH - 1:0]         dout // read data
    );

   localparam integer                     FIFO_SIZE = WIDTH * HEIGHT;

   /* create write flag as a pulse */
   wire                                   w_flag;
   reg                                    w_req_prev;
   always_ff @(posedge clk) begin
      if (!n_rst) begin
         w_req_prev <= 1'b0;
      end else begin
         w_req_prev <= w_req;
      end
   end
   assign w_flag = w_req & (!w_req_prev);

   /* write address */
   reg w_busy;
   reg [$clog2(WIDTH * HEIGHT):0] w_addr;

   always_ff @(posedge clk) begin
      if (!n_rst) begin
         w_busy <= 1'b0;
      end else begin
         if (w_flag) begin
            w_busy <= 1'b1;
         end
         if (w_addr == FIFO_SIZE - 1) begin
            w_busy <= 1'b0;
         end
      end
   end

   always_ff @(posedge clk) begin
      if (!n_rst) begin
         w_addr <= 'b0;
      end else begin
         if (w_flag) begin
            w_addr <= 'b0;
         end
         if (w_busy) begin
            w_addr <= w_addr + 1'b1;
            if (w_addr == FIFO_SIZE - 1) begin
               w_addr <= 'b0;
            end
         end
      end
   end

   wire ena, enb, wea;
   assign {ena, enb, wea} = {1'b1, !w_busy, w_busy};

   bram 
     #(
       .WIDTH(WIDTH),
       .HEIGHT(HEIGHT),
       .BIT_WIDTH(BIT_WIDTH)
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
