`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:08 01/17/2021 
// Design Name: 
// Module Name:    sign_ext_12 
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
module sign_ext_12(
		input [11:0] UNEXT,
		output [31:0] EXT
    );

	assign EXT = {{20{UNEXT[11]}}, UNEXT};

endmodule
