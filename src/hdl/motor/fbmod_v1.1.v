module fbmod
#(
    parameter integer CLK_FREQ    = -1,
    parameter real    EDGE_PERIOD = -1 
) 
(
	input wire          clk,		  //125MHz
	input wire          n_rst,			
	(* mark_debug = "true" *) input wire          inp_fbp,	

  (* mark_debug = "true" *) output wire [15:0]  edge_out
);

    localparam integer CLK_CNT_MAX = CLK_FREQ * EDGE_PERIOD - 1;
  //localparam integer CLK_CNT_MAX = 26'd62499999;

  reg         inp_fbp_tmp, inp_fbp_sync;
	reg         sta_fbp;
  reg [25:0]  clk_cnt;
  (* mark_debug = "true" *) reg [15:0]  cnt_edge_reg; 
  (* mark_debug = "true" *) reg [15:0]  cnt_edge;     // to Fukui

  assign edge_out = cnt_edge_reg;

  always @(posedge clk)begin
    if (!n_rst)begin
      inp_fbp_tmp  <= 1'b0;
      inp_fbp_sync <= 1'b0;
    end else begin
      inp_fbp_tmp  <= inp_fbp;
      inp_fbp_sync <= inp_fbp_tmp;
    end
  end

  always @(posedge clk)begin
    if (!n_rst)begin
      sta_fbp <= 1'b0;
    end else begin
      sta_fbp <= inp_fbp_sync;
    end
  end
  
  always @(posedge clk)begin
    if (!n_rst)begin
      cnt_edge <= 16'b0;
    end if(clk_cnt == CLK_CNT_MAX)begin
      cnt_edge <= 16'b0;
    end else if(!sta_fbp && inp_fbp_sync)begin
      cnt_edge <= cnt_edge + 16'b1;
    end
  end

  always @(posedge clk)begin
    if (!n_rst)begin
      clk_cnt <= 26'b0;
    end else if(clk_cnt == CLK_CNT_MAX)begin
      clk_cnt <= 26'b0;
    end else begin
      clk_cnt <= clk_cnt + 26'b1;
    end 
  end

  always @(posedge clk)begin
    if (!n_rst) begin
      cnt_edge_reg <= 16'b0;
    end else if (clk_cnt == CLK_CNT_MAX)begin
      cnt_edge_reg <= cnt_edge;
    end
  end

endmodule
