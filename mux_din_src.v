`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:59 01/16/2021 
// Design Name: 
// Module Name:    mux_din_src 
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
`include "defs.v"
module mux_din_src(
		input [31:0] PC,
		input [31:0] MM,
		input [31:0] ALU,
		input [31:0] INST,
		input [1:0] CTL,
		output [31:0] OUT
    );

assign OUT = (CTL == `DIN_SRC_PC) ? PC :
					((CTL == `DIN_SRC_MM) ? MM : 
					((CTL == `DIN_SRC_ALU) ? ALU : INST));

endmodule
