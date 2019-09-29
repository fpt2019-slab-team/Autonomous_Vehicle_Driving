`default_nettype none

// SCCB (Serial Camera Control Bus) interface module
module sccb_if
  #(
    parameter integer CLOCK_FREQ = 125 * 10 ** 6, // system clock of 125 MHz
    parameter integer SCL_FREQ = 200 * 10 ** 3 // sccb clk of 20 kHz (max: 400 kHz)
    )
   (
    input wire        sysclk, // system clock
    input wire        n_rst, // negative reset
    input wire        req, // send request
    input wire        wr, // write: 0, read: 1  
    input wire [31:0] wdata, // 8-bit ID Address 16-bit Sub-address, and 8-bit Write Data
    output wire [7:0] rdata, // 8-bit Read Data
    output wire       busy, // high when running (= writing or reading)
    output wire       scl, // serial clock
    inout wire        sda  // serial data
    );

   // parameters
   localparam integer CLOCK_DIV = CLOCK_FREQ / SCL_FREQ;
   localparam integer START_COND_BIT = 3, STOP_COND_BIT = 3, IDLE_BIT = 1;
   localparam integer BIT_PER_PHASE = 9;
   localparam integer SDA_WRITE_BIT =
                      START_COND_BIT + BIT_PER_PHASE * 4 + STOP_COND_BIT + IDLE_BIT;
   localparam integer SDA_READ_BIT =
                      START_COND_BIT + BIT_PER_PHASE * 3 + STOP_COND_BIT +
                      START_COND_BIT + BIT_PER_PHASE * 2 + STOP_COND_BIT +
                      IDLE_BIT;
   localparam integer SDA_COUNT = (SDA_WRITE_BIT > SDA_READ_BIT)? SDA_WRITE_BIT: SDA_READ_BIT;
   
   // base clock generator
   wire               clk_div;
   reg [$clog2(CLOCK_DIV) - 1:0] clk_div_cnt;
   always_ff @(posedge sysclk) begin
      if (!n_rst) 
        clk_div_cnt <= 'b0;
      else begin
         if (clk_div_cnt == CLOCK_DIV - 1)
           clk_div_cnt <= 'b0;
         else
           clk_div_cnt <= clk_div_cnt + 1'b1;
      end
   end
   // assign clk_div = (clk_div_cnt < CLOCK_DIV / 2)? 1'b1: 1'b0;
   assign clk_div = (clk_div_cnt < (CLOCK_DIV / 2));

   // get pulse of request
   wire flag;
   reg [1:0] req_reg;
   always_ff @(posedge sysclk) begin
      if (!n_rst) 
        req_reg <= 2'b0;
      else begin
         if (clk_div_cnt == CLOCK_DIV - 1) begin
            if (!busy) begin // not accept request when running
               req_reg <= {req_reg[0], req};
            end            
         end
      end         
   end
   assign flag = req_reg[0] & (!req_reg[1]);  
   
   // serial clock count
   reg [$clog2(SDA_COUNT) - 1:0] scl_cnt;
   always_ff @(posedge sysclk) begin
      if (!n_rst)
        scl_cnt <= 'b0;
      else if (clk_div_cnt == CLOCK_DIV - 1) begin
         if (flag) 
           scl_cnt <= SDA_COUNT - 1;
         else if (scl_cnt == 'b0) 
           scl_cnt <= 'b0;
         else 
           scl_cnt <= scl_cnt - 1;
      end
   end
   
   // serial data count
   reg [$clog2(SDA_COUNT) - 1:0] sda_cnt;
   always_ff @(posedge sysclk) begin
      if (!n_rst)
        sda_cnt <= 'b0;
      else if (clk_div_cnt == CLOCK_DIV / 2) begin
         if (flag) 
           sda_cnt <= SDA_COUNT - 1;
         else if (sda_cnt == 'b0) 
           sda_cnt <= 'b0;
         else 
           sda_cnt <= sda_cnt - 1;
      end
   end
   
   // read data
   reg [7:0] rdata_reg;
   always_ff @(posedge sysclk) begin
      if (!n_rst)
        rdata_reg <= 8'd0;
      else begin 
         if (wr == 1'b1) // read
           if (clk_div_cnt == CLOCK_DIV / 2) 
             if (('d5 <= scl_cnt) && (scl_cnt <= 'd12)) // Read Data phase
               rdata_reg <= {rdata_reg[6:0], sda};
      end
   end
   assign rdata = rdata_reg;
   
   // busy
   assign busy = (wr == 1'b0)? 
                 ((scl_cnt <= 'd16)? 1'b0: 1'b1): // write 
                 ((scl_cnt ==  'b0)? 1'b0: 1'b1); // read
   
   // serial clock enable
   wire scl_en;
   reg [SDA_COUNT - 1:0] scl_en_reg;
   always_ff @(posedge sysclk) begin
      if (wr == 1'b0) // write
        scl_en_reg <= {3'b001,            // start-cond
                       8'b11111111, 1'b1, // ID Address and 1'bz
                       8'b11111111, 1'b1, // Sub-address[15:8] and 1'bz
                       8'b11111111, 1'b1, // Sub-address[7:0]  and 1'bz
                       8'b11111111, 1'b1, // Write Data and 1'bz
                       3'b000,            // stop-cond
                       16'd0};            // idle
      else
        scl_en_reg <= {3'b001,            // start-cond
                       8'b11111111, 1'b1, // ID Address and 1'bz
                       8'b11111111, 1'b1, // Sub-address[15:8] and 1'bz
                       8'b11111111, 1'b1, // Sub-address[7:0] and 1'bz
                       3'b000,            // stop-cond
                       3'b001,            // start-cond
                       8'b11111111, 1'b1, // ID Address and 1'bz
                       8'b11111111, 1'b1, // Read Data and 1'bz
                       3'b000,            // stop-cond
                       1'b0};             // idle
   end
   assign scl_en = scl_en_reg[scl_cnt];

   // serial clock
   assign scl = (scl_en)? clk_div: 1'b1;

   // serial data enable 
   wire sda_en;
   reg [SDA_COUNT - 1:0] sda_en_reg;
   always_ff @(posedge sysclk) begin
      if (wr == 1'b0) // write
        sda_en_reg <= {3'b011,            // start-cond
                       8'b11111111, 1'b0, // ID Address and 1'bz
                       8'b11111111, 1'b0, // Sub-address[15:8] and 1'bz
                       8'b11111111, 1'b0, // Sub-address[7:0]  and 1'bz
                       8'b11111111, 1'b0, // Write Data and 1'bz
                       3'b110,            // stop-cond
                       16'd0};            // idle
      else
        sda_en_reg <= {3'b011,            // start-cond
                       8'b11111111, 1'b0, // ID Address and 1'bz
                       8'b11111111, 1'b0, // Sub-address[15:8] and 1'bz
                       8'b11111111, 1'b0, // Sub-address[7:0] and 1'bz
                       3'b110,            // stop-cond
                       3'b011,            // start-cond
                       8'b11111111, 1'b0, // ID Address and 1'bz
                       8'b00000000, 1'b1, // Read Data and 1'b1
                       3'b110,            // stop-cond
                       1'b0};             // idle
   end
   assign sda_en = sda_en_reg[sda_cnt];
   
   // serial data
   reg [SDA_COUNT - 1:0] sda_reg;
   always_ff @(posedge sysclk) begin
      if (wr == 1'b0) // write 
        sda_reg <= {3'b110,             // start-cond
                    wdata[31:24], 1'b0, // ID Address and 1'bz
                    wdata[23:16], 1'b0, // Sub-address[15:8] and 1'bz
                    wdata[15: 8], 1'b0, // Sub-address[7:0]  and 1'bz
                    wdata[ 7: 0], 1'b0, // Write Data and 1'bz
                    3'b011,             // stop-cond
                    ~16'd0};            // idle
      else
        sda_reg <= {3'b110,              // start-cond of write cycle 
                    wdata[31:25], 2'b00, // ID Address and 1'bz
                    // Note: the LSB of ID Address in this cycle is 0 
                    wdata[23:16], 1'b0,  // Sub-address[15:8] and 1'bz
                    wdata[15: 8], 1'b0,  // Sub-address[7:0] and 1'bz
                    3'b011,              // stop-cond of write cycle 
                    3'b110,              // start-cond of read cycle
                    wdata[31:25], 2'b10, // ID Address and 1'bz
                    8'bxxxxxxxx, 1'b1,   // Read Data and 1'b1
                    3'b011,              // stop-cond of read cycle
                    1'b1};               // idle
   end
   assign sda = (sda_en)? sda_reg[sda_cnt]: 1'bz;

endmodule

`default_nettype wire
