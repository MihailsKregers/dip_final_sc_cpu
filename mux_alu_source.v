`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:01:23 12/24/2020 
// Design Name: 
// Module Name:    mux_alu_source 
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
module mux_alu_source(
		input [31:0] REGISTER,
		input [31:0] IMMEDIATE,
		input IS_REG,
		output [31:0] ALU
    );
	
	assign ALU = IS_REG ? REGISTER : IMMEDIATE;

endmodule
