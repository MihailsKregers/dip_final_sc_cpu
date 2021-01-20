`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:26 12/11/2020 
// Design Name: 
// Module Name:    reg_file 
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

module reg_file
	(
	input CLK,
	input [4:0] RS1,
	input [4:0] RS2,
	input [4:0] RD,
	input [31:0] DIN,
	input WR,
	output [31:0] RD1,
	output [31:0] RD2
    );
	 
	reg [31:0] file [0:31];
	 
	always@(posedge CLK) begin
		if (WR == 1) begin
			file[RD] <= DIN;
		end
	end
	
	assign RD1 = (RS1 == `REG_ZERO) ? 0 : file[RS1];
	assign RD2 = (RS2 == `REG_ZERO) ? 0 : file[RS2];
	
endmodule
