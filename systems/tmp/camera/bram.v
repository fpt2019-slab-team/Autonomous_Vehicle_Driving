`default_nettype none

// Dual-port BRAM module
module bram
  #(
    parameter integer IMG_WIDTH = 640,
    parameter integer IMG_HEIGHT = 480,
    parameter integer PIXELS = IMG_WIDTH * IMG_HEIGHT,
    parameter integer DATA_WIDTH = 8
    )
   (
    input wire                        clk,
    input wire                        ena,
    input wire                        enb,
    input wire                        wea,
    input wire [$clog2(PIXELS) - 1:0] addra,
    input wire [$clog2(PIXELS) - 1:0] addrb,
    input wire [DATA_WIDTH - 1:0]     dia,
    output wire [DATA_WIDTH - 1:0]    doa,
    output wire [DATA_WIDTH - 1:0]    dob
    );

   reg [DATA_WIDTH - 1:0]          ram [PIXELS - 1:0];
   reg [$clog2(PIXELS) - 1:0]      read_addra;
   reg [$clog2(PIXELS) - 1:0]      read_addrb;
   
   always @(posedge clk) begin
      if (ena) begin
         if (wea) begin
            ram[addra] <= dia;
         end
         read_addra <= addra;
      end
      if (enb) begin
         read_addrb <= addrb;
      end
   end
   
   assign doa = ram[read_addra];
   assign dob = ram[read_addrb];
   
endmodule

`default_nettype wire
