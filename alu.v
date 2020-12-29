`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:30 12/11/2020 
// Design Name: 
// Module Name:    alu 
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
module alu(
		input CLK,
		input [31:0] RS1,
		input [31:0] RS2,
		input [4:0] OP,
		output [31:0] RD
    );
	 
	 reg [31:0] result;
	 
	 always@(posedge CLK) begin
		case(OP)
			`ALU_ADD: result <= RS1 + RS2;
			`ALU_SUB: result <= RS1 - RS2;
			`ALU_AND: result <= RS1 & RS2;
			`ALU_OR: result <= RS1 | RS2;
			`ALU_XOR: result <= RS1 ^ RS2;
			`ALU_SRL: result <= RS1 >> RS2;
			`ALU_SRA: result <= RS >>> RS2;
			`ALU_SLL: result <= RS1 << RS2;
			`ALU_SLT: result <= $signed(RS1) < $signed(RS2);
			`ALU_SLTU: result <= RS1 < RS2;
		endcase
	 end
	 
	 assign RD = result;


endmodule
