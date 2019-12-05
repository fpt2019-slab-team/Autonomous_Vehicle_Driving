//
// Dual-Port RAM with Synchronous Read (Read Through) using More than One Clock
//
// Based on Xilinx XST User Guide
//

`default_nettype none 
module dpram_mclk
  #(
    parameter integer DATA_WIDTH = 16,
    parameter integer ADDR_WIDTH = 16
    )
   (
    input wire                   clk1,
    input wire                   clk2,
    input wire                   we,
    input wire [ADDR_WIDTH-1:0]  add1,
    input wire [ADDR_WIDTH-1:0]  add2,
    input wire [DATA_WIDTH-1:0]  di,
    output wire [DATA_WIDTH-1:0] do1,
    output wire [DATA_WIDTH-1:0] do2
    );
   
   reg [DATA_WIDTH-1:0]          ram [2**ADDR_WIDTH-1:0];
   reg [ADDR_WIDTH-1:0]          read_add1;
   reg [ADDR_WIDTH-1:0]          read_add2;
   
   always @(posedge clk1) begin
      if (we)
        ram[add1] <= di;
      read_add1 <= add1;
   end

   assign do1 = ram[read_add1];

   always @(posedge clk2) begin
      read_add2 <= add2;
   end

   assign do2 = ram[read_add2];
endmodule
`default_nettype wire
