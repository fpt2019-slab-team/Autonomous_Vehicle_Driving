`default_nettype none

module bram_fifo
#(
  parameter FIFO_SIZE  = -1
)
(
  input        clk,
  input        n_rst,
  input        ena,
  input        enb,
  input        wea,
  input [7:0]  data_in,
  output [7:0] data_out
);

reg [$clog2(FIFO_SIZE):0] addra;
reg [$clog2(FIFO_SIZE):0] addrb;

bram bram_inst(
  .clk(clk),
  .ena(ena),
  .enb(enb),
  .wea(wea),
  .dia(data_in),
  .dob(data_out),
  .addra(addra),
  .addrb(addrb)
);

always @(posedge clk) begin
  if (!n_rst) begin
    addra <= 10'd0;
    addrb <= 10'd307199;
  end
  else begin
    if (addra == 10'd307199) begin
      addra <= 10'd0;
    end
    else begin
      addra <= addra + 10'b1;
    end

    if (addrb == 10'd307199) begin
      addrb <= 10'd0;
    end
    else begin
      addrb <= addrb + 10'b1;
    end
  end
end


endmodule

`default_nettype wire
