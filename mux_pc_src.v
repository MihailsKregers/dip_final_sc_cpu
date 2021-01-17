`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:40 01/17/2021 
// Design Name: 
// Module Name:    mux_pc_src 
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
module mux_pc_src(
		input [31:0] ALU,
		input [31:0] INTERRUPT,
		input [31:0] COND_BR,
		input [31:0] PC_ADDER,
		input [1:0] CTL,
		input COND,
		output [31:0] OUT
    );

assign OUT = (CTL == `PC_SRC_ALU) ? ALU:
					((CTL == `PC_SRC_INTERRUPT) ? INTERRUPT : 
					((CTL == `PC_SRC_COND_BR && COND == `PC_SRC_BRANCH_YES) ? COND_BR : PC_ADDER));

endmodule
