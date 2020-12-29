`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:50 12/29/2020 
// Design Name: 
// Module Name:    pc_mux 
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
module pc_mux(
		input [31:0] JUMP,
		input [31:0] NEXT,
		input BRANCH,
		output [31:0] PC
    );

	assign PC = (BRANCH == 1'b1) ? JUMP : NEXT;

endmodule
