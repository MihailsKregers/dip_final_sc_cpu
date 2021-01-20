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
		input [1:0] CTL,
		output [31:0] DOUT
    );

assign DOUT = ((CTL == `MM_WR_B) ? { DIN[7:0], 24'd0 } :
					((CTL == `MM_WR_HW) ? { DIN[15:0], 16'd0} :
					DIN[31:0]));

endmodule
