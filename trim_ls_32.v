`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:29 01/16/2021 
// Design Name: 
// Module Name:    trim_ls_32 
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
module trim_ls_32(
		input [31:0] IN,
		output OUT
    );

assign OUT = IN[0];

endmodule
