`default_nettype none

module bram(clk,ena,enb,wea,addra,addrb,dia,doa,dob);
input clk;
input ena;
input enb;
input wea;
input [15:0] addra;
input [15:0] addrb;
input [7:0] dia;
output [7:0] doa;
output [7:0] dob;

reg [7:0] ram [307199:0];
reg [15:0] read_addra;
reg [15:0] read_addrb;

//always@(posedge clk) begin
//  if(ena) begin
//    if(wea) begin
//      ram[addra] <= dia;
//    end
//    read_addra <= addra;
//  end
//  if(enb) begin
//    read_addrb <= addrb;
//  end
//end

always@(posedge clk) begin
  if(ena) begin
    if(wea) begin
      ram[addra] <= dia;
    end
    read_addrb <= addra;
  end
end

assign doa = ram[read_addra];
//assign dob = ram[read_addrb];
assign dob = ram[read_addrb];

endmodule

`default_nettype wire
