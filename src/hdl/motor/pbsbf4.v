`timescale 1ns / 1ps
module pbsbf4 #(
  parameter DIN_W       =  -1,
  parameter DOUT_W      =  -1,
  parameter SPLINE_W    =  -1,
  parameter S           =  -1
)(
  input wire                clk,
  input wire                rst,
  input wire  [DIN_W-1:0]   din,
  output wire [DOUT_W-1:0]  dout
);
  
  parameter CNT_W       =   3;
  parameter TABLE_W     =  10;

  reg   [CNT_W-1:0]            cnt;
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
  assign dout   = sum[SPLINE_W-1:S];///1024
  integer i;


  //control data
  always @(posedge clk )begin
    if (~rst)begin
      for (i=0;i<4;i = i+1)data[i] <= 7'd0;
    end else if(cnt == 3'd7)begin
      data[0] <=  data[1];
      data[1] <=  data[2];
      data[2] <=  data[3];
      data[3] <=  din;
    end
  end

  //control cnt
  always @(posedge clk )begin
    if (~rst)begin
      cnt <=  3'd0;
    end else begin
      cnt <=  cnt + 3'b1;
    end
  end

  function [TABLE_W-1:0] get_table_1(
    input [CNT_W-1:0] cnt
  );
    case(cnt)
      3'd0 : get_table_1 = 10'd171 ;
      3'd1 : get_table_1 = 10'd114 ;
      3'd2 : get_table_1 = 10'd72 ;
      3'd3 : get_table_1 = 10'd42 ;
      3'd4 : get_table_1 = 10'd21 ;
      3'd5 : get_table_1 = 10'd9 ;
      3'd6 : get_table_1 = 10'd3 ;
      3'd7 : get_table_1 = 10'd0 ; 
    endcase
  endfunction

  function [TABLE_W-1:0] get_table_2(
    input [CNT_W-1:0] cnt
  );
    case(cnt)
      3'd0 : get_table_2 = 10'd683;
      3'd1 : get_table_2 = 10'd668;
      3'd2 : get_table_2 = 10'd627;
      3'd3 : get_table_2 = 10'd566;
      3'd4 : get_table_2 = 10'd491;
      3'd5 : get_table_2 = 10'd408;
      3'd6 : get_table_2 = 10'd323;
      3'd7 : get_table_2 = 10'd242;
    endcase
  endfunction


  function [TABLE_W-1:0] get_table_3(
    input [CNT_W-1:0] cnt
  );

    case(cnt)
      3'd0 : get_table_3 = 10'd171 ;
      3'd1 : get_table_3 = 10'd242 ;
      3'd2 : get_table_3 = 10'd323 ;
      3'd3 : get_table_3 = 10'd408 ;
      3'd4 : get_table_3 = 10'd491 ;
      3'd5 : get_table_3 = 10'd566 ;
      3'd6 : get_table_3 = 10'd627 ;
      3'd7 : get_table_3 = 10'd668 ;
    endcase
  endfunction

  function [TABLE_W-1:0] get_table_4(
    input [CNT_W-1:0] cnt
  );

    case(cnt)
      3'd0 : get_table_4 = 10'd0 ;
      3'd1 : get_table_4 = 10'd0 ;
      3'd2 : get_table_4 = 10'd3 ;
      3'd3 : get_table_4 = 10'd9 ;
      3'd4 : get_table_4 = 10'd21 ;
      3'd5 : get_table_4 = 10'd42 ;
      3'd6 : get_table_4 = 10'd72 ;
      3'd7 : get_table_4 = 10'd114 ;
    endcase
  endfunction
endmodule
