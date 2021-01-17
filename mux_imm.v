`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:19 01/16/2021 
// Design Name: 
// Module Name:    mux_imm 
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
`include "defs.v"
module mux_imm(
		input [31:0] IMM,
		input [31:0] SHAMT,
		input [31:0] DBL,
		input [1:0] CTL,
		output [31:0] OUT
    );

assign OUT = (CTL == `IMM_SRC_IMM) ? IMM :
					((CTL == `IMM_SRC_SHAMT) ? SHAMT : DBL);

endmodule
