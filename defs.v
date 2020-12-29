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

`define OP_LUI		7'b0110111
`define OP_AUIPC	7'b0010111
`define OP_JAL		7'b1101111
`define OP_JALR		7'b1100111
`define OP_COND_BR	7'b1100011
`define OP_LDR		7'b0000011
`define OP_STR		7'b0100011
`define OP_ALU_I	7'b0010011
`define OP_ALU		7'b0110011
`define OP_FENCE	7'b0001111
`define OP_E_CSR	7'b1110011

`define ALU_ADD		4'b0000
`define ALU_SUB		4'b1000
`define ALU_SLL		4'b0001
`define ALU_SLT		4'b0010
`define ALU_SLTU	4'b0011
`define ALU_XOR		4'b0100
`define ALU_SRL		4'b0101
`define ALU_SRA		4'b1101
`define ALU_OR		4'b0110
`define ALU_AND		4'b0111

`define ALU_EQ		3'b000
`define ALU_NE		3'b001
`define ALU_LT		3'b100
`define ALU_GE		3'b101
`define ALU_LTU		3'b110
`define ALU_GEU		3'b111

`define FUN_T_E		3'b000
`define FUN_T_RW	3'b001
`define FUN_T_RS	3'b010
`define FUN_T_RC	3'b011
`define FUN_T_RWI	3'b101
`define FUN_T_RSI	3'b110
`define FUN_T_RCI	3'b111

`define FUN_S_NOA	7'b0000000
`define FUN_S_ISA	7'b0100000

`define REG_ZERO 	5'b00000

`endif /* _DEFS_V_ */