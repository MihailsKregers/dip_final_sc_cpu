`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:07 12/29/2020 
// Design Name: 
// Module Name:    sign_ext_13 
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
module sign_ext_13(
		input [12:0] UNEXT,
		output [31:0] EXT
    );

	assign EXT = {{19{UNEXT[12]}}, UNEXT};

endmodule