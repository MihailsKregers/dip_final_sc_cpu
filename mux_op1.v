`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:15 01/16/2021 
// Design Name: 
// Module Name:    mux_op1 
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
module mux_op1(
		input [31:0] IMM,
		input [31:0] INST,
		input [31:0] RD,
		input [1:0] CTL,
		output [31:0] OUT
    );

assign OUT = (CTL == `OP1_SRC_IMM) ? IMM :
					((CTL == `OP1_SRC_INST) ? INST : RD);

endmodule
