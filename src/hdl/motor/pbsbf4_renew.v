`timescale 1ns / 1ps
module pbsbf4_renew#(
  parameter DIN_W       =   -1,
  parameter DOUT_W      =   -1,
  parameter SPLINE_W    =   -1,
  parameter S           =   -1,
  parameter CLK_DIVIDE  =   -1,
  parameter CLK_FREQ    =   -1
)(
  input wire                clk,
  input wire                n_rst,
  input wire  [DIN_W-1:0]   din,
  output wire [DOUT_W-1:0]  dout
  );

  localparam integer TABLE_W     =  7;
  localparam integer CLK_CNT_MAX = CLK_FREQ / CLK_DIVIDE;

  reg                          cnt;
  reg   [DIN_W-1:0]      data[0:3];
  // wire  [SPLINE_W-1:0]    spline_1;
  // wire  [SPLINE_W-1:0]    spline_2;
  // wire  [SPLINE_W-1:0]    spline_3;
  // wire  [SPLINE_W-1:0]    spline_4;
  wire  [SPLINE_W-1:0]         sum;

  reg   [SPLINE_W-1:0]    spline_1;
  reg   [SPLINE_W-1:0]    spline_2;
  reg   [SPLINE_W-1:0]    spline_3;
  reg   [SPLINE_W-1:0]    spline_4;

  always @(posedge clk) begin
    if (!n_rst) begin
      spline_1 <= 'b0;
      spline_2 <= 'b0;
      spline_3 <= 'b0;
      spline_4 <= 'b0;
    end
    else begin
      spline_1 <= get_table_1(cnt) * data[0];
      spline_2 <= get_table_2(cnt) * data[1];
      spline_3 <= get_table_3(cnt) * data[2];
      spline_4 <= get_table_4(cnt) * data[3];
    end
  end
  // assign spline_1 =  get_table_1(cnt) * data[0];
  // assign spline_2 =  get_table_2(cnt) * data[1];
  // assign spline_3 =  get_table_3(cnt) * data[2];
  // assign spline_4 =  get_table_4(cnt) * data[3];

  assign sum    = spline_1 + spline_2 +spline_3 +spline_4;
  assign dout = sum;
  integer i;

  ////////////// attached HERE   ////////////////
  reg   [14:0]  clk_cnt;

  always @(posedge clk)begin
    if (!n_rst)begin
      clk_cnt <= 15'd0;
    end else if (clk_cnt == CLK_CNT_MAX - 1)begin
      clk_cnt <= 15'd0; 
    end else begin
      clk_cnt <= clk_cnt + 1'b1;
    end
  end

  always @(posedge clk)begin
    if (!n_rst)begin
      cnt <= 1'b0;
    end else if(clk_cnt == CLK_CNT_MAX - 1)begin
      cnt <= cnt + 1'b1;
    end else begin
      // do nothing
    end
  end

  always @(posedge clk)begin
    if (!n_rst)begin
      for (i=0;i<4;i = i+1)data[i] <= 7'd0;
    end else if(cnt == 1'd1 && clk_cnt == CLK_CNT_MAX - 1)begin
      data[0] <=  data[1];
      data[1] <=  data[2];
      data[2] <=  data[3];
      data[3] <=  din;
    end
  end

  /////////////////////////////////////////////////////
  
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
