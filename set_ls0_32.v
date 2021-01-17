`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:51 01/16/2021 
// Design Name: 
// Module Name:    set_ls0_32 
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
module set_ls0_32(
		input [31:0] IN,
		output [31:0] OUT
    );

assign OUT = {IN [31:1], 0};

endmodule
