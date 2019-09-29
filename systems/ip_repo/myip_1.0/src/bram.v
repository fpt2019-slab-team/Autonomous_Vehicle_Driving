`default_nettype none

module bram 
  #(
    parameter integer WIDTH = 640,
    parameter integer HEIGHT = 480,
    parameter integer BIT_WIDTH = 8    
    )
   (
    input wire                            clk,
    input wire                            ena,
    input wire                            enb,
    input wire                            wea,
    input wire [$clog2(WIDTH * HEIGHT):0] addra,
    input wire [$clog2(WIDTH * HEIGHT):0] addrb,
    input wire [BIT_WIDTH - 1:0]          dia,
    output wire [BIT_WIDTH - 1:0]         doa,
    output wire [BIT_WIDTH - 1:0]         dob
    );

   reg [BIT_WIDTH - 1:0]                  ram [WIDTH * HEIGHT - 1:0];
   reg [$clog2(WIDTH * HEIGHT):0]         read_addra;
   reg [$clog2(WIDTH * HEIGHT):0]         read_addrb;
   
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
