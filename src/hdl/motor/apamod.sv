`timescale 1ns / 1ps

module apamod (
	input wire pwmr,
	input wire pwml,
	input wire brk,

	output wire pwma,
	output wire pwmb,
	output wire ain1,
	output wire ain2,
	output wire bin1,
	output wire bin2,
	output wire stnby
);

	assign pwma = pwmr;
	assign pwmb = pwml;

	assign ain1 = 1'b1; 
	assign bin2 = 1'b1;

	assign ain2 = brk;
	assign bin1 = brk;

	assign stnby = 1'b1;

endmodule
