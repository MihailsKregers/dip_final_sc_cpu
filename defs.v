`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:33 12/16/2020 
// Design Name: 
// Module Name:    defs 
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
`ifndef _DEFS_V_
`define _DEFS_V_

//Alu 1 operand mux option definitions
`define OP1_SRC_PC				2'b01
`define OP1_SRC_INST			2'b10
`define OP1_SRC_RD1			2'b11

//Alu 2 operand mux option definitions
`define OP2_SRC_IMM			2'b01
`define OP2_SRC_INST			2'b10
`define OP2_SRC_RD2			2'b11

//Immediate operand mux option definitions
`define IMM_SRC_IMM			2'b01
`define IMM_SRC_SHAMT			2'b10
`define IMM_SRC_DIMM			2'b11

//Register file input source mux option definitions
`define DIN_SRC_PC				2'b00
`define DIN_SRC_MM				2'b01
`define DIN_SRC_ALU			2'b10
`define DIN_SRC_IMM			2'b11

//PC source mux option definitions
`define PC_SRC_ALU				2'b01
`define PC_SRC_INTERRUPT		2'b10
`define PC_SRC_COND_BR		2'b11
`define PC_SRC_BRANCH_YES	1'b1

//Operation code definitions
`define OP_LUI					7'b0110111
`define OP_AUIPC				7'b0010111
`define OP_JAL					7'b1101111
`define OP_JALR					7'b1100111
`define OP_COND_BR				7'b1100011
`define OP_LDR					7'b0000011
`define OP_STR					7'b0100011
`define OP_ALU_IMM				7'b0010011
`define OP_ALU					7'b0110011
`define OP_FENCE				7'b0001111
`define OP_E_CSR				7'b1110011

//Alu operation signal definitions
`define ALU_ADD					4'b0000
`define ALU_SUB					4'b0001
`define ALU_SLL					4'b0010
`define ALU_XOR					4'b0011
`define ALU_SRL					4'b0100
`define ALU_SRA					4'b0101
`define ALU_OR					4'b0110
`define ALU_AND					4'b0111
`define ALU_EQ					4'b1000
`define ALU_NE					4'b1001
`define ALU_LT					4'b1010
`define ALU_GE					4'b1011
`define ALU_LTU					4'b1100
`define ALU_GEU					4'b1101

//Fun3 definitions
`define FT_ADD					3'b000
`define FT_SLL					3'b001
`define FT_SLT					3'b010
`define FT_SLTU					3'b011
`define FT_XOR					3'b100
`define FT_SRL					3'b101
`define FT_OR					3'b110
`define FT_AND					3'b111

//Fun3 ldr definitions
`define FT_LB					3'b000
`define FT_LH					3'b001
`define FT_LW					3'b010
`define FT_LBU					3'b100
`define FT_LHU					3'b101

//Register file definitions
`define REG_ZERO 				5'b00000
`define REG_WRITE_ALLOWED	1'b1

//Main memory signal definitions
`define MM_WR_N					2'b00
`define MM_WR_B					2'b01
`define MM_WR_HW				2'b10
`define MM_WR_W					2'b11

`endif /* _DEFS_V_ */