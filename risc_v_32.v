`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:36 12/29/2020 
// Design Name: 
// Module Name:    risc_v_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module risc_v_32(
		input [31:0] INSTRUCTION,
		input [31:0] D_IN,
		input CLK,
		output [31:0] D_OUT,
		output [31:0] D_OUT_ADDR,
		output [31:0] NEXT,
		output [31:0] D_IN_ADDR,
		output [31:0] WR
    );

	wire [31:0] pc_mm_adder4;
	wire [31:0] mm_decoder;
	wire [4:0] decoder_regf_rs1;
	wire [4:0] decoder_regf_rs2;
	wire [4:0] decoder_regf_rd;
	wire [19:0] decoder_fillop1;
	wire [11:0] decoder_sext_imm;
	wire [4:0] decoder_bext_sh;
	wire [11:0] decoder_sext_cm;
	wire [1:0] decoder_muxi;
	wire [1:0] decoder_mux1;
	wire [1:0] decoder_mux2;
	wire [1:0] decoder_muxd;
	wire [3:0] decoder_aluc;
	wire [19:0] decoder_filldin;
	wire [20:0] decoder_sext21;

endmodule
