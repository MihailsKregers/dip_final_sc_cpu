`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:22 01/17/2021 
// Design Name: 
// Module Name:    sign_ext_21 
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
module sign_ext_21(
		input [20:0] UNEXT,
		output [31:0] EXT
    );

	assign EXT = {{11{UNEXT[20]}}, UNEXT};

endmodule
