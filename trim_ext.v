`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:03 01/19/2021 
// Design Name: 
// Module Name:    trim_ext 
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
module trim_ext(
		input [31:0] DIN,
		input [2:0] CTL,
		output [31:0] DOUT
    );

assign DOUT = ((CTL == `FT_LBU) ? { 24'd0, DIN[7:0] } :
					((CTL == `FT_LHU) ? { 16'd0, DIN[15:0] } :
					((CTL == `FT_LB) ? { {24{DIN[7]}}, DIN[7:0] } :
					((CTL == `FT_LH) ? { {16{DIN[15]}}, DIN[15:0] } : DIN))));

endmodule
