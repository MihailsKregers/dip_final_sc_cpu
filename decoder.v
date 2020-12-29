`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:36 12/16/2020 
// Design Name: 
// Module Name:    decoder 
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
module decoder
	(
	input CLK,
	input [31:0] INSTR,
	output [4:0] RS1,
	output [4:0] RS2,
	output [4:0] RD,
	output [3:0] ALU_OP,
	output ALU_SRC,
	output [11:0] IMM,
	output ALLOW_WR, 
	output [12:0] JMP_ADDR,
	output ALU_C_OP
    );
	
	reg alu_src;
	reg [4:0] rs1;
	reg [4:0] rs2;
	reg [4:0] rd;
	reg [3:0] alu_op;
	reg [11:0] imm;
	reg allow_wr;
	reg [12:0] jmp_addr;
	reg [2:0] alu_c_op;
	
	always@(CLK) begin
		case (INSTR[6:0])
			`OP_ALU, `OP_ALU_I: begin
				alu_src <= INSTR[5];
				rs1 <= INSTR[19:15];
				rs2 <= INSTR[24:20];
				rd <= INSTR[11:7];
				imm <= INSTR[31:20];
				alu_op[2:0] <= INSTR[14:12];
				allow_wr <= 1;
				alu_op[3] <= (INSTR[5] == 1'b1 || INSTR[14:12] == 3'b101) ? INSTR[30] : 1'b0;
			end
			`OP_COND_BR: begin
				rs1 <= INSTR[19:15];
				rs2 <= INSTR[24:20];
				jmp_addr <= {INSTR[31],INSTR[7],INSTR[30:25],INSTR[11:8],0};
				alu_c_op <= INSTR[14:12];
			end
		endcase
	end
	
	assign ALU_SRC = alu_src;
	assign RS1 = rs1;
	assign RS2 = rs2;
	assign RD = rd;
	assign ALU_OP = alu_op;
	assign IMM = imm;
	assign ALLOW_WR = allow_wr;
	assign JMP_ADDR = jmp_addr;
	assign ALU_C_OP = alu_c_op;

endmodule
