`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:14 01/16/2021 
// Design Name: 
// Module Name:    fill_0_20 
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
module fill_0_20(
		input [19:0] IN,
		output [31:0] OUT
    );

assign OUT = { 12'h0, IN };

endmodule
