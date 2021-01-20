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
	output [1:0] OP1_SEL,
	output [1:0] DIN_SEL,
	output [2:0] TRIM_CTL,
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
	output [19:0] U_IMM,
	output [1:0] OP2_SEL,
	output [1:0] MM_WR,
	output [1:0] PC_SEL
    );
	
	
	reg [3:0] alu_op;
	reg rf_allow_wr;
	reg [1:0] mux_op1;
	reg [1:0] mux_op2;
	reg [1:0] mux_din_src;
	reg [2:0] load_trim_ctl;
	reg [1:0] mm_write_amount;
	
	assign DIN_IMM = INSTR[31:12];
	assign J_IMM = {INSTR[31],INSTR[19:12],INSTR[20],INSTR[30:21],0};
	assign RS1 = INSTR[19:15];
	assign RS2 = INSTR[24:20];
	assign RD = INSTR[11:7];
	assign A_IMM = INSTR[31:20];
	assign A_SHAMT = INSTR[24:20];
	assign C_IMM = {INSTR[31:25],INSTR[11:7]};
	
	assign ALU_CTL = alu_op;
	assign REG_WR = rf_allow_wr;
	assign OP1_SEL = mux_op1;
	assign OP2_SEL = mux_op2;
	assign DIN_SEL = mux_din_src;
	assign TRIM_CTL = load_trim_ctl;
	assign MM_WR = mm_write_amount;
	
	
	always@(INSTR) begin
		mm_write_amount <= `MM_WR_N;
		rf_allow_wr <= 1'b0;
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
			`OP_LDR: begin
				load_trim_ctl <= INSTR[14:12];
				rf_allow_wr <= 1'b1;
			end
			`OP_STR: begin
				case(INSTR[14:12])
					`FT_LB: mm_write_amount <= `MM_WR_B;
					`FT_LH: mm_write_amount <= `MM_WR_HW;
					`FT_LW: mm_write_amount <= `MM_WR_W;
				endcase
			end
			`OP_LUI: begin
				rf_allow_wr <= 1'b1;
				mux_din_src <= `DIN_SRC_IMM;
			end
		endcase
	end

endmodule
