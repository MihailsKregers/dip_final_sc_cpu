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
		input [31:0] OP1,
		input [31:0] OP2,
		input [4:0] CTL,
		output [31:0] OUT
    );
	 
	 reg [31:0] result;
	 
	 always@(OP1, OP2, CTL) begin
		case(CTL)
			`ALU_ADD:	assign result = OP1 + OP2;
			`ALU_SUB:	assign result = OP1 - OP2;
			`ALU_AND:	assign result = OP1 & OP2;
			`ALU_OR:		assign result = OP1 | OP2;
			`ALU_XOR:	assign result = OP1 ^ OP2;
			`ALU_SRL:	assign result = OP1 >> OP2;
			`ALU_SRA:	assign result = OP1 >>> OP2;
			`ALU_SLL:	assign result = OP1 << OP2;
			`ALU_EQ:		assign result = OP1 == OP2;
			`ALU_NE:		assign result = OP1 != OP2;
			`ALU_LT:		assign result = $signed(OP1) < $signed(OP2);
			`ALU_GE:		assign result = $signed(OP1) >= $signed(OP2);
			`ALU_LTU:	assign result = OP1 < OP2;
			`ALU_GEU:	assign result = OP1 > OP2;
		endcase
	 end
	 
	 assign OUT = result;


endmodule
