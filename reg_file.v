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
module reg_file
	(
	input CLK,
	input [31:0] RD,
	input [4:0] A1,
	input [4:0] A2,
	input [4:0] AD,
	input WR,
	output [31:0] RS1,
	output [31:0] RS2
    );
	 
	reg [31:0] file [0:31];
	 
	always@(posedge CLK) begin
		if (WR == 1) begin
			file[AD] <= RD;
		end
	end
	
	assign A = file[AA];
	assign B = file[BB];
	
endmodule
