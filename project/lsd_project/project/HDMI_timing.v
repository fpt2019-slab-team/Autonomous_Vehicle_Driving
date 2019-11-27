module HDMI_Timing#(
//Horizontal Timing
  parameter H_ACTIVE_PIXEL  = -1,
  parameter H_FRONT_PORCH   = -1,
  parameter H_SYNC_WIDTH    = -1,
  parameter H_BACK_PORCH    = -1,
  parameter H_TOTAL         = -1,
  parameter H_WIDTH         = -1,

  //Vertical Timing
  parameter V_ACTIVE_LINE   = -1,
  parameter V_FRONT_PORCH   = -1,
  parameter V_SYNC_WIDTH    = -1,
  parameter V_BACK_PORCH    = -1,
  parameter V_TOTAL         = -1,
  parameter V_WIDTH         = -1
)(
  clk, rst, hsync, vsync, de, h_cnt, v_cnt
  );


   input wire      clk;
   input wire      rst;
   output wire     hsync;
   output wire     vsync;
   output wire     de;
   output reg [H_WIDTH-1:0] h_cnt;
   output reg [V_WIDTH-1:0] v_cnt;
   
   reg vsync_reg;
   reg hsync_reg;
   //reg de_reg;
  
  //assign hsync  = hsync_reg;
  assign hsync  = !(h_cnt < H_ACTIVE_PIXEL+H_FRONT_PORCH+H_SYNC_WIDTH && h_cnt > H_ACTIVE_PIXEL+H_FRONT_PORCH-1);
  //assign vsync  = vsync_reg;

 assign vsync  = !(v_cnt < V_ACTIVE_LINE+V_FRONT_PORCH+V_SYNC_WIDTH && v_cnt > V_ACTIVE_LINE+V_FRONT_PORCH-1);
  assign de     = h_cnt < H_ACTIVE_PIXEL && v_cnt < V_ACTIVE_LINE;
  //assign de     = de_reg;
  
//  always @(posedge clk)begin
//    if(rst)begin
//        //de_reg <= 1'b0;
//        hsync_reg <= 1'b1;
//        vsync_reg <= 1'b1;
//    end else begin
//        //de_reg <= (h_cnt < H_ACTIVE_PIXEL && v_cnt < V_ACTIVE_LINE);
//        hsync_reg <= !(h_cnt < H_ACTIVE_PIXEL+H_FRONT_PORCH+H_SYNC_WIDTH && h_cnt > H_ACTIVE_PIXEL+H_FRONT_PORCH-1);
//        vsync_reg <= !(v_cnt < V_ACTIVE_LINE+V_FRONT_PORCH+V_SYNC_WIDTH && v_cnt > V_ACTIVE_LINE+V_FRONT_PORCH-1);
//    end
//  end

  //control hsync
  always @(posedge clk)begin
    if(rst)begin
      h_cnt <= 1'b0;
    end else if(h_cnt == H_TOTAL-1)begin
      h_cnt <= 1'b0;
    end else begin
      h_cnt <= h_cnt + 1'b1;
    end
  end
  
  //control vsync
  always @(posedge clk)begin
    if(rst)begin
      v_cnt <= 1'b0;
    end else if (v_cnt == V_TOTAL-1 && h_cnt == H_TOTAL-1)begin
      v_cnt <= 1'b0;
    end else if (h_cnt == H_TOTAL-1)begin
      v_cnt <= v_cnt + 1'b1;
    end
  end

endmodule
