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
	input [31:0] INSTR,
	output [19:0] DIN_IMM,
	output [12:0] PC_IMM_ADD,
	output [1:0] OP2_SEL,
	output [1:0] DIN_SEL,
	output [1:0] TRIM_CTL,
	output [20:0] J_IMM,	
	output [4:0] RS1,
	output [4:0] RS2,
	output [4:0] RD,
	output [11:0] A_IMM,
	output [4:0] A_SHAMT,
	output [12:0] C_IMM,
	output REG_WR,
	output [1:0] IMM_SEL,
	output [3:0] ALU_CTL,
	output [1:0] OP2_SEL,
	output [1:0] MM_WR,
	output [1:0] PC_SEL
    );
	
	
	reg [3:0] alu_op;
	reg rf_allow_wr;
	reg [1:0] mux_op1;
	reg [1:0] mux_op2;
	reg [1:0] mux_din_src;
	
	assign DIN_IMM = INSTR[31:12];
	assign J_IMM = {INSTR[31],INSTR[19:12],INSTR[20],INSTR[30:21],0};
	assign RS1 = INSTR[19:15];
	assign RS2 = INSTR[24:20];
	assign RD = INSTR[11:7];
	assign A_IMM = INSTR[31:20];
	assign A_SHAMT = INSTR[24:20];
	assign C_IMM = {INSTR[31:25],INSTR[11:7]};

	
	
	always@(INSTR) begin
		case (INSTR[6:0]) // opcode case
			`OP_ALU: begin // alu, not immediate
				case (INSTR[14:12]) // funct3 case
					`FT_ADD: begin
						if (INSTR[30] == 0) begin
							alu_op <= `ALU_ADD;
						end else begin
							alu_op <= `ALU_SUB;
						end
					end
					`FT_SLL: alu_op <= `ALU_SLL;
					`FT_SLT: alu_op <= `ALU_LT;
					`FT_SLTU: alu_op <= `ALU_LTU;
					`FT_XOR: alu_op <= `ALU_XOR;
					`FT_SRL: begin
						if (INSTR[30] == 0) begin
							alu_op <= `ALU_SRL;
						end else begin
							alu_op <= `ALU_SRA;
						end
					end
					`FT_OR: alu_op <= `ALU_OR;
					`FT_AND: alu_op <= `ALU_AND;
				endcase
				mux_op1 <= `OP1_SRC_RD1;
				mux_op2 <= `OP2_SRC_RD2;
				mux_din_src <= `DIN_SRC_ALU;
				rf_allow_wr <= `REG_WRITE_ALLOWED;
			end
			`OP_ALU_IMM: begin // alu, immediate
				case (INSTR[14:12]) //funct3 case
					`FT_ADD: alu_op <= `ALU_ADD;
					`FT_SLT: alu_op <= `ALU_LT;
					`FT_SLTU: alu_op <= `ALU_LTU;
					`FT_XOR: alu_op <= `ALU_XOR;
					`FT_OR: alu_op <= `ALU_OR;
					`FT_AND: alu_op <= `ALU_AND;
					`FT_SLL: alu_op <= `ALU_SLL;
					`FT_SRL: begin
						if (INSTR[30] == 0) begin
							alu_op <= `ALU_SRL;
						end else begin
							alu_op <= `ALU_SRA;
						end
					end
				endcase
			end
			`OP_COND_BR: begin
				rs1 <= INSTR[19:15];
				rs2 <= INSTR[24:20];
				jmp_addr <= {INSTR[31],INSTR[7],INSTR[30:25],INSTR[11:8],0};
				alu_c_op <= INSTR[14:12];
			end
			`OP_JAL, `OP_JALR: begin
				rd <= INSTR[11:7];
				allow_wr <= 1'b1;
				
			end
		endcase
	end
	
	assign RS1 = INSTR[19:15];
	assign RS2 = INSTR[24:20];
	assign RD = INSTR[11:7];
	assign IMM = INSTR[31:20];
	assign SHAMT = INSTR[24:20];
	assign IMM_BR = {INSTR[31:25],INSTR[11:7]};
	assign MUX_OP1_IMM = {INSTR[31],INSTR[19:12],INSTR[20],INSTR[30:21],0};
	assign JMP_IMM = {INSTR[31],INSTR[7],INSTR[30:25],INSTR[11:8],0};
	assign IMM_DIN = INSTR[31:12];
	assign ALU_SRC = alu_src; //imm/reg mux
	assign ALU_OP = alu_op;
	assign ALLOW_WR = allow_wr;
	assign JMP_ADDR = jmp_addr;
	assign ALU_C_OP = alu_c_op;

endmodule
