`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:36 12/28/2020 
// Design Name: 
// Module Name:    bit_ext 
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
module bit_ext(
		input [4:0] UNEXT,
		output [31:0] EXT
    );

	assign EXT = UNEXT;

endmodule
