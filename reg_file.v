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
	input [31:0] D,
	input [4:0] AA,
	input [4:0] AB,
	input [4:0] AD,
	input WR,
	output [31:0] A,
	output [31:0] B
    );
	 
	reg [31:0] file [0:31];
	 
	always@(*) begin
		if (WR == 1) begin
			file[AD] <= D;
		end
	end
	
	assign A = file[AA];
	assign B = file[BB];
	
endmodule
