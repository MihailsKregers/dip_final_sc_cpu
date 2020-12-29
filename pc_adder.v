`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:45 12/29/2020 
// Design Name: 
// Module Name:    pc_adder 
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
module pc_adder(
		input [31:0] IN,
		output [31:0] OUT
    );
	 
	 assign OUT = IN + 4;

endmodule
