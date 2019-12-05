//-----------------------------------------------------------------------------
// <fifo_dc> 
//  - Dual-clock first-in/first-out (queue) module
//    - <INITIAL_SIZE> is the initial queue size.
//      If the value is n (>= 1), the same single clock is given to
//      <wr_clock> and <rd_clock>, and both of <wr_en> and <rd_en> keep
//      being active, this module behaves as the (n+1)-clock delay circuit.
//      <INITIAL_SIZE> MUST be in the range of [1, FIFO_SIZE - 1]
//      for this purpose. Be careful for indefinite values output at first.
//  - Read latency: 1 clock cycle
//    - Any written data MUST be read adequate time after the write.
//      Otherwise the data will not be read properly and will be lost.
//-----------------------------------------------------------------------------
// Version 1.12 (Sep. 3, 2019)
//  - Renamed from <fifo>
//-----------------------------------------------------------------------------
// (C) 2018-2019 Taito Manabe. All rights reserved.
//-----------------------------------------------------------------------------
`default_nettype none
`timescale 1ns/1ns
  
module fifo_dc
  #( parameter integer BIT_WIDTH    = -1,
     parameter integer FIFO_SIZE    = -1,
     parameter integer INITIAL_SIZE = 0 )
   ( wr_clock, rd_clock, n_rst,
     wr_en,    rd_en,
     wr_data,  rd_data  );

   // local parameters --------------------------------------------------------
   localparam integer ADDR_BITW = log2(FIFO_SIZE);

   // inputs/outputs ----------------------------------------------------------
   input wire       	       wr_clock, rd_clock, n_rst;
   input wire 		       wr_en,    rd_en;
   input wire [BIT_WIDTH-1:0]  wr_data;
   output wire [BIT_WIDTH-1:0] rd_data;

   // registers ---------------------------------------------------------------
   reg [ADDR_BITW-1:0] 	       wr_addr,  rd_addr;
   reg 			       rd_en_buf;

   // ram ---------------------------------------------------------------------
   wire [BIT_WIDTH-1:0]        ram_rd_data;
   ram_dc
     #( .WORD_SIZE(BIT_WIDTH), .RAM_SIZE(FIFO_SIZE) )
   ram_0
     (  .wr_clock(wr_clock), .rd_clock(rd_clock), .wr_en(wr_en),
	.wr_addr(wr_addr),   .wr_data(wr_data),
	.rd_addr(rd_addr),   .rd_data(ram_rd_data)    );

   assign rd_data = rd_en_buf ? ram_rd_data : 0;

   // address control ---------------------------------------------------------
   always @(posedge wr_clock) begin
      if(!n_rst)
	wr_addr <= INITIAL_SIZE;
      else begin
	 if(wr_en) begin
	    if(wr_addr == FIFO_SIZE - 1)
	      wr_addr <= 0;
	    else
	      wr_addr <= wr_addr + 1;
	 end
      end
   end
   always @(posedge rd_clock) begin
      if(!n_rst)
	rd_addr <= 0;
      else begin
	 rd_en_buf <= rd_en;
	 if(rd_en) begin
	    if(rd_addr == FIFO_SIZE - 1)
	      rd_addr <= 0;
	    else
	      rd_addr <= rd_addr + 1;
	 end
      end
   end    

   // functions ---------------------------------------------------------------
   function integer log2;
      input integer value;
      begin
     	 value = value - 1;
	 for ( log2 = 0; value > 0; log2 = log2 + 1 )
	   value = value >> 1;
      end
   endfunction
   
endmodule
`default_nettype wire

