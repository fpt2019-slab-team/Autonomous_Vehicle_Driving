`default_nettype none
`timescale 1ns/1ns

module ov7670_if
	#(
		parameter WIDTH      = 640,
		parameter HEIGHT     = 480,
		parameter IBIT_WIDTH =   8,
		parameter OBIT_WIDTH =  16
	)
	(
			input  wire                    cam_PCLK,
			input  wire                    cam_HREF,
			input  wire                    cam_VSYNC,
			input  wire [IBIT_WIDTH-1:0]   cam_din,
			output wire [OBIT_WIDTH-1:0]   rgb565,
			output wire [$clog2(WIDTH):0]  h_cnt,
			output wire [$clog2(HEIGHT):0] v_cnt
	);

	localparam integer PIXELS = WIDTH * HEIGHT;
	localparam integer WIDTH2 = WIDTH * 2;

	reg [$clog2(PIXELS)+1:0] pixel_count  = 0;
	reg [OBIT_WIDTH-1:0]     rgb565_buf   = 0;
	reg [$clog2(WIDTH2):0]   hcnt_buf     = 0, hcnt_reg;
	reg [$clog2(HEIGHT):0]   vcnt_buf     = 0, vcnt_reg;
	reg [OBIT_WIDTH-1:0]     rgb565_reg   = 0;
	wire                     rgb565_en_buf;
	reg											 rgb565_en;

	always @(posedge cam_PCLK) begin
		if (cam_VSYNC) 
			pixel_count <= 'd0;
		else if (cam_HREF) 
			pixel_count <= pixel_count + 1'b1;
	end

	/* h & v counter */
	always @(posedge cam_PCLK) begin
		hcnt_reg <= hcnt_buf;
		vcnt_reg <= vcnt_buf;
		if (cam_VSYNC) begin
			hcnt_buf <= 'd0;
			vcnt_buf <= 'd0;
		end else begin
			hcnt_buf <= (cam_HREF) ? hcnt_buf + 1'b1 : 'd0;
			vcnt_buf <= (hcnt_buf == WIDTH2-1) ? vcnt_buf + 1'b1 : vcnt_buf;
		end
	end
	assign {h_cnt, rgb565_en_buf} = hcnt_reg;
	assign v_cnt              = vcnt_reg;

	//always @(posedge cam_PCLK) begin
	//		pixel_we <= cam_HREF;
	//end

	always @(posedge cam_PCLK) begin
		rgb565_en <= rgb565_en_buf;
		rgb565_reg <= (rgb565_en) ? rgb565_reg : rgb565_buf;
		if (pixel_count[0] == 1'b0)
			rgb565_buf[7:0]  <= cam_din;
		else
			rgb565_buf[15:8] <= cam_din;          
	end

	assign rgb565 = rgb565_reg;

	//always @(posedge cam_PCLK) begin
	//		pixel_addr <= pixel_count;
	//end

endmodule

`default_nettype wire
