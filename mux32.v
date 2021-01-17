`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:39 12/30/2020 
// Design Name: 
// Module Name:    mux32 
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
module mux32(
		input [31:0] IN1,
		input [31:0] IN0,
		input COND,
		output [31:0] OUT
    );

	assign OUT = (COND == 1'b1) ? IN1 : IN0;

endmodule
