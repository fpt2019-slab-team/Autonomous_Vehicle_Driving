module fbmod (
	input wire          clk,		  //50MHz
	input wire          n_rst,			
	input wire          inp_fbp,	
  output wire [15:0]  edge_out
);

  localparam integer CLK_CNT_MAX = 25 * 10 ** 6;

  reg                         inp_fbp_tmp, inp_fbp_sync;
	reg                         sta_fbp;
  reg [$clog2(CLK_CNT_MAX):0] clk_cnt;
  reg [15:0]                  cnt_edge_reg; 
  reg [15:0]                  cnt_edge;     // to Fukui

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
      cnt_edge <= 16'd0;
    end if(clk_cnt == CLK_CNT_MAX - 1)begin
      cnt_edge <= 16'b0;
    end else if(!sta_fbp && inp_fbp_sync)begin
      cnt_edge <= cnt_edge + 16'b1;
    end
  end

  always @(posedge clk)begin
    if (!n_rst)begin
      clk_cnt <= 'b0;
    end else if(clk_cnt == CLK_CNT_MAX - 1)begin
      clk_cnt <= 'b0;
    end else begin
      clk_cnt <= clk_cnt + 'b1;
    end 
  end

  always @(posedge clk)begin
    if (!n_rst) begin
      cnt_edge_reg <= 16'b0;
    end else if (clk_cnt == CLK_CNT_MAX - 1)begin
      cnt_edge_reg <= cnt_edge;
    end
  end

endmodule
