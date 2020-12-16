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

`define FUN_T_ADD	3'b000
`define FUN_T_SLL	3'b001
`define FUN_T_SLT	3'b010
`define FUN_T_SLTU	3'b011
`define FUN_T_XOR	3'b100
`define FUN_T_SRL	3'b101
`define FUN_T_OR	3'b110
`define FUN_T_AND	3'b111

`define FUN_T_E		3'b000
`define FUN_T_RW	3'b001
`define FUN_T_RS	3'b010
`define FUN_T_RC	3'b011
`define FUN_T_RWI	3'b101
`define FUN_T_RSI	3'b110
`define FUN_T_RCI	3'b111

`define FUN_S_NOA	7'b0000000
`define FUN_S_ISA	7'b0100000

`endif /* _DEFS_V_ */