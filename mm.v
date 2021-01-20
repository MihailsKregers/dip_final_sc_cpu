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

	reg [7:0] mem [0:255];
	reg [31:0] value;
	reg [31:0] instruction;
	
	always@ (posedge CLK) begin
		instruction <= {mem[ADDR], mem[ADDR+1], mem[ADDR+2], mem[ADDR+3]};
		if (WR == `MM_WR_B) begin
			mem[D_IN_ADDR] <= D_IN[7:0];
		end else begin 
			if (WR == `MM_WR_HW) begin
				mem[D_IN_ADDR] <= D_IN[7:0];
				mem[D_IN_ADDR+1] <= D_IN[15:8];
			end else begin 
				if (WR == `MM_WR_W) begin
					mem[D_IN_ADDR] <= D_IN[7:0];
				   mem[D_IN_ADDR+1] <= D_IN[15:8];
					mem[D_IN_ADDR+3] <= D_IN[23:16];
				   mem[D_IN_ADDR+4] <= D_IN[31:24];
				end
			end
		end
		value <= {mem[D_OUT_ADDR], mem[D_OUT_ADDR+1], mem[D_OUT_ADDR+2], mem[D_OUT_ADDR+3]};
	end
		
	assign D_OUT = value;
	assign INSTR = instruction;

endmodule
