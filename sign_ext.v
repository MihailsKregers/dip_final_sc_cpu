`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:21 12/28/2020 
// Design Name: 
// Module Name:    sign_ext 
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
module sign_ext(
		input [11:0] UNEXT,
		output [31:0] EXT
    );

	assign EXT = {{20{UNEXT[11]}}, UNEXT};

endmodule
