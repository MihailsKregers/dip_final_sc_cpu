`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:04 12/29/2020 
// Design Name: 
// Module Name:    alu_cmp 
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
module alu_cmp(
		input [31:0] RS1,
		input [31:0] RS2,
		input [2:0] OP,
		output OUT
    );

	assign OUT = (OP == `ALU_EQ) ? (RS1 == RS2) : (
	(OP == `ALU_NE) ? (RS1 != RS2) : (
	(OP == `ALU_LT) ? ($signed(RS1) < $signed(RS2)) : (
	(OP == `ALU_GE) ? ($signed(RS1) >= $signed(RS2)) : (
	(OP == `ALU_LTU) ? (RS1 < RS2) : (RS1 >= RS2) ) ) ) );

endmodule
