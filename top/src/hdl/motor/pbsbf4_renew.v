`timescale 1ns / 1ps
module pbsbf4_renew#(
  parameter DIN_W       =  -1,
  parameter DOUT_W      =  -1,
  parameter SPLINE_W    =  -1,
  parameter S           =  -1
)(
  input wire                clk,
  input wire                n_rst,
  input wire  [DIN_W-1:0]   din,
  output wire [DOUT_W-1:0]  dout
  );

  parameter TABLE_W     =  7;

  reg                          cnt;
  reg   [DIN_W-1:0]      data[0:3];
  wire  [SPLINE_W-1:0]    spline_1;
  wire  [SPLINE_W-1:0]    spline_2;
  wire  [SPLINE_W-1:0]    spline_3;
  wire  [SPLINE_W-1:0]    spline_4;
  wire  [SPLINE_W-1:0]         sum;

  wire  [DIN_W-1:0]       P_Data_1;
  wire  [DIN_W-1:0]       P_Data_2;
  wire  [DIN_W-1:0]       P_Data_3;
  wire  [DIN_W-1:0]       P_Data_4;

  assign P_Data_1 = data[0];
  assign P_Data_2 = data[1];
  assign P_Data_3 = data[2];
  assign P_Data_4 = data[3];

  assign spline_1 =  get_table_1(cnt) * data[0];
  assign spline_2 =  get_table_2(cnt) * data[1];
  assign spline_3 =  get_table_3(cnt) * data[2];
  assign spline_4 =  get_table_4(cnt) * data[3];

  assign sum    = spline_1 + spline_2 +spline_3 +spline_4;
  //assign dout   = sum[SPLINE_W-1:S];///1024
  assign dout = sum;
  integer i;

  //control data
  always @(posedge clk )begin
    if (!n_rst)begin
      for (i=0;i<4;i = i+1)data[i] <= 7'd0;
    end else if(cnt == 1'd1)begin
      data[0] <=  data[1];
      data[1] <=  data[2];
      data[2] <=  data[3];
      data[3] <=  din;
    end
  end

  //control cnt
  always @(posedge clk )begin
    if (!n_rst)begin
      cnt <=  1'd0;
    end else begin
      cnt <=  cnt + 1'b1;
    end
  end

  function [TABLE_W-1:0] get_table_1(
    input  cnt
    );
    case(cnt)
      1'd0 : get_table_1 = 7'd21;
      1'd1 : get_table_1 = 7'd3;
    endcase
  endfunction

  function [TABLE_W-1:0] get_table_2(
    input  cnt
  );
    case(cnt)
      1'd0 : get_table_2 = 7'd85;
      1'd1 : get_table_2 = 7'd61;
    endcase
  endfunction


  function [TABLE_W-1:0] get_table_3(
    input  cnt
  );
    case(cnt)
      1'd0 : get_table_3 = 7'd21;
      1'd1 : get_table_3 = 7'd61;
    endcase
  endfunction

  function [TABLE_W-1:0] get_table_4(
    input  cnt
  );
    case(cnt)
      1'd0 : get_table_4 = 7'd0;
      1'd1 : get_table_4 = 7'd3;
    endcase
  endfunction
endmodule
