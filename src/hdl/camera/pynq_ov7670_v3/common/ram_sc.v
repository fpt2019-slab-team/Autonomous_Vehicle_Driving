//-----------------------------------------------------------------------------
// <ram_sc>
//  - Single-clock random access memory module without reset
//    - Read latency: 1 clock cycle
//  - If <wr_addr> == <rd_addr>, <wr_data> will be forwarded
//-----------------------------------------------------------------------------
// Version 1.00 (Sep. 3, 2019)
//  - Initial version
//-----------------------------------------------------------------------------
// Taito Manabe
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns
  
module ram_sc
  #( parameter integer WORD_SIZE = -1,
     parameter integer RAM_SIZE  = -1   )
   ( clock,    wr_en,
     wr_addr,  wr_data,
     rd_addr,  rd_data  );

   // local parameters --------------------------------------------------------
   localparam integer ADDR_BITW = log2(RAM_SIZE);

   // inputs/outputs ----------------------------------------------------------
   input wire 	               clock,   wr_en;
   input wire [ADDR_BITW-1:0]  wr_addr, rd_addr;
   input wire [WORD_SIZE-1:0]  wr_data;
   output wire [WORD_SIZE-1:0] rd_data;

   // memory access -----------------------------------------------------------
   reg [WORD_SIZE-1:0] 	      memory [0:RAM_SIZE-1];
   reg [WORD_SIZE-1:0] 	      rd_data_reg;   
   always @(posedge clock) begin
      if(wr_en)
	memory[wr_addr] <= wr_data;
      rd_data_reg <= memory[rd_addr];
   end

   // forwarding --------------------------------------------------------------
   reg 			      forward;
   reg [WORD_SIZE-1:0] 	      forward_data;
   always @(posedge clock) begin
      forward      <= (wr_addr == rd_addr);
      forward_data <= wr_data;
   end
   
   assign rd_data = (forward) ? forward_data : rd_data_reg;
   
   // functions ---------------------------------------------------------------
   function integer log2;
      input integer value;
      begin
     	 value = value - 1;
	 for(log2 = 0; value > 0; log2 = log2 + 1)
	   value = value >> 1;
      end
   endfunction 

endmodule
`default_nettype wire
