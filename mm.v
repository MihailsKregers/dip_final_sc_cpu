`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:59 01/17/2021 
// Design Name: 
// Module Name:    mm 
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
module mm(
		input CLK,
		input [31:0] ADDR,
		input [1:0] WR,
		input [31:0] D_IN_ADDR,
		input [31:0] D_OUT_ADDR,
		input [31:0] D_IN,
		output [31:0] INSTR,
		output [31:0] D_OUT
    );

	reg [1023:0] mem;
	reg [31:0] value;
	reg [31:0] instruction;
	
	always@ (posedge CLK) begin
		value <= mem[D_OUT_ADDR+31:D_OUT_ADDR];
		instruction <= mem[ADDR+31:ADDR];
		if (WR == `MM_WR_B) begin
			mem[D_IN_ADDR+7:D_IN_ADDR] <= D_IN[7:0];
		end else begin 
			if (WR == `MM_WR_HW) begin
				mem[D_IN_ADDR+15:D_IN_ADDR] <= D_IN[15:0];
			end else begin 
				if (WR == `MM_WR_W) begin
					mem[D_IN_ADDR+31:D_IN_ADDR] <= D_IN[31:0];
				end
			end
		end
	end
		
	assign D_OUT = value;
	assign INSTR = instruction;

endmodule
