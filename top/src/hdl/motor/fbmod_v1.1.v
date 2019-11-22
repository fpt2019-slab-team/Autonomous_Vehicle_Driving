module fbmod (
	input wire          clk,		  //125MHz
	input wire          n_rst,			
	(* mark_debug = "true" *) input wire          inp_fbp,	

  (* mark_debug = "true" *) output wire [15:0]  edge_out
);

  wire clk_1;     

	reg         sta_fbp;
  reg [26:0]  clk_cnt;
  reg [15:0]  cnt_edge_reg; 
  reg [15:0]  cnt_edge;     // to Fukui

  assign clk_1 = (!(clk_cnt[0] |clk_cnt[1] |clk_cnt[2] |clk_cnt[3] 
                    |clk_cnt[4] |clk_cnt[5] |clk_cnt[6] |clk_cnt[7] 
                    |clk_cnt[8] |clk_cnt[9] |clk_cnt[10] |clk_cnt[11] 
                    |clk_cnt[12] |clk_cnt[13] |clk_cnt[14] |clk_cnt[15] 
                    |clk_cnt[16] |clk_cnt[17] |clk_cnt[18] |clk_cnt[19] 
                    |clk_cnt[20] |clk_cnt[21] |clk_cnt[22] |clk_cnt[23] 
                    |clk_cnt[24] |clk_cnt[25] |clk_cnt[26])) ? 1'b1 : 1'b0;

  assign edge_out = cnt_edge_reg;

  always @(posedge clk)begin
    if (!n_rst)begin
      sta_fbp <= 1'b0;
    end else begin
      sta_fbp <= inp_fbp;
    end
  end
  
  always @(posedge clk)begin
    if (!n_rst)begin
      #1 cnt_edge <= 16'd0;
    end else if(!sta_fbp && inp_fbp)begin
      #1 cnt_edge <= cnt_edge + 16'b1;
    end else if(clk_1)begin
      #1 cnt_edge <= 16'b0;
    end
  end

  always @(posedge clk)begin
    if (!n_rst)begin
      #1 clk_cnt <= 27'b0;
    end else if(clk_cnt == 27'd124999999)begin
      #1 clk_cnt <= 27'b0;
    end else begin
      #1 clk_cnt <= clk_cnt + 27'b1;
    end 
  end

  always @(posedge clk_1)begin
    #1 cnt_edge_reg <= cnt_edge;
  end

endmodule
