`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:36 12/29/2020 
// Design Name: 
// Module Name:    risc_v_32 
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
module risc_v_32(
		input [31:0] INSTRUCTION,
		input [31:0] D_IN,
		input CLK,
		input RST,
		output [31:0] D_OUT,
		output [31:0] D_OUT_ADDR,
		output [31:0] NEXT,
		output [31:0] D_IN_ADDR,
		output [1:0] WR
    );

	wire [19:0] decoder_fill_din;
	wire [12:0] decoder_sext_jadder;
	wire [1:0] decoder_op1_sel;
	wire [1:0] decoder_din_sel;
	wire [2:0] decoder_trimc;
	wire [20:0] decoder_sext_jimm;
	wire [4:0] decoder_rf_rs1;
	wire [4:0] decoder_rf_rs2;
	wire [4:0] decoder_rf_rd;
	wire [11:0] decoder_sext_aimm;
	wire [4:0] decoder_bext_ashamt;
	wire [12:0] decoder_sext_cimm;
	wire decoder_rf_wr;
	wire [1:0] decoder_imm_sel;
	wire [3:0] decoder_aluc;
	wire [19:0] decoder_fill_uimm;
	wire [1:0] decoder_op2_sel;
	wire [1:0] decoder_pc_sel;
	
	decoder DECODER(
		.INSTR(INSTRUCTION),
		.DIN_IMM(decoder_fill_din),
		.PC_IMM_ADD(decoder_sext_jadder),
		.OP1_SEL(decoder_op1_sel),
		.DIN_SEL(decoder_din_sel),
		.TRIM_CTL(decoder_trimc),
		.J_IMM(decoder_sext_jimm),	
		.RS1(decoder_rf_rs1),
		.RS2(decoder_rf_rs2),
		.RD(decoder_rf_rd),
		.A_IMM(decoder_sext_aimm),
		.A_SHAMT(decoder_bext_ashamt),
		.C_IMM(decoder_sext_cimm),
		.REG_WR(decoder_rf_wr),
		.IMM_SEL(decoder_imm_sel),
		.ALU_CTL(decoder_aluc),
		.U_IMM(decoder_fill_uimm),
		.OP2_SEL(decoder_op2_sel),
		.MM_WR(WR),
		.PC_SEL(decoder_pc_sel)
	);
	wire [31:0] sel_din_rf;
	wire [31:0] rf_sel_op1;
	wire [31:0] rf_sel_op2_mm;
	reg_file RF(
		.CLK(CLK),
		.RS1(decoder_rf_rs1),
		.RS2(decoder_rf_rs2),
		.RD(decoder_rf_rd),
		.DIN(sel_din_rf),
		.WR(decoder_rf_wr),
		.RD1(rf_sel_op2_mm),
		.RD2(rf_sel_op2_mm)
	);
	
	wire [31:0] sext_imm_sel_imm;
	sign_ext_12 IMM_EXT(
		.UNEXT(decoder_sext_aimm),
		.EXT(sext_imm_sel_imm)
	);
	
	wire [31:0] bext_shamt_sel_imm;
	bit_ext SHAMT_EXT(
		.UNEXT(decoder_bext_ashamt),
		.EXT(bext_shamt_sel_imm)
	);
	wire [31:0] sext_cimm_sel_imm;
	sign_ext_12 CIMM_EXT(
		.UNEXT(decoder_sext_cimm),
		.EXT(sext_cimm_sel_imm)
	);
	wire [31:0] fill_jimm_sel_op2;
	fill_0_20 FILL_JIMM(
		.IN(decoder_fill_uimm),
		.OUT(fill_jimm_sel_op2)
	);
	wire [31:0] sel_imm_sel_op2;
	mux_imm IMM_SEL(
		.IMM(sext_imm_sel_imm),
		.SHAMT(bext_shamt_sel_imm),
		.DBL(sext_cimm_sel_imm),
		.CTL(decoder_imm_sel),
		.OUT(sel_imm_sel_op2)
	);
	wire [31:0] sext_jimm_alu;
	sign_ext_21 JIMM_EXT(
		.UNEXT(decoder_sext_jimm),
		.EXT(sext_immop2_alu)
	);
	wire [31:0] sel_op2_alu;
	mux_op2 OP2_SEL(
		.IMM(sel_imm_sel_op2),
		.INST(fill_jimm_sel_op2),
		.RD(rf_sel_op2_mm),
		.CTL(decoder_op2_sel),
		.OUT(sel_op2_alu)
	);
	
	wire [31:0] sel_op1_alu;
	wire [31:0] pc_mm_sel_op1;
	mux_op1 OP1_SEL(
		.PC(pc_mm_sel_op1),
		.INST(decoder_sext_jimm),
		.RD(rf_sel_op1),
		.CTL(decoder_op1_sel),
		.OUT(sel_op1_alu)
	);
	
	wire [31:0] alu_out;
	alu ALU(
		.OP1(sel_op1_alu),
		.OP2(sel_op2_alu),
		.CTL(decoder_aluc),
		.OUT(alu_out)
	);
	wire [31:0] fill_din_sel_imm;
	fill_0_20 FILL_DIN_SEL(
		.IN(decoder_fill_din),
		.OUT(fill_din_sel_imm)
	);
	
	mux_din_src DIN_SEL(
		.PC(),
		.MM(trim_fill_din_sel),
		.ALU(alu_out),
		.INST(fill_din_sel_imm),
		.CTL(decoder_din_sel),
		.OUT(sel_din_rf)
	);
	wire [31:0] trim_fill_din_sel;
	trim_ext TRIM_EXT(
		.DIN(D_IN),
		.CTL(decoder_trimc),
		.DOUT(trim_fill_din_sel)
	);
	wire [31:0] pc_in;
	wire [31:0] pc_out;
	pc PC(
		.IN(pc_in),
		.RST(RST),
		.OUT(pc_out)
	);
	wire [31:0] adder4_pc_out;
	adder4 ADDER4_PC(
		.IN(pc_out),
		.OUT(adder4_pc_out)
	);
	
	wire [31:0] sext_jadder_pc_adder;
	sign_ext_13 SEXT_JADDER(
		.UNEXT(decoder_sext_jadder),
		.EXT(sext_jadder_pc_adder)
	);
	wire [31:0] adder_j_pc_out;
	pc_adder PC_IMM_ADDER(
		.PC(pc_out),
		.IMM(sext_jadder_pc_adder),
		.OUT(adder_j_pc_out)
	);
	
	set_ls0_32 LS_PC_COND(
		.IN(alu_out),
		.OUT()
	);
	
	trim_ls_32 TRIM_PC_SEL(
		.IN(alu_out),
		.OUT(alu_cond_pc_sel)
	);
	wire alu_cond_pc_sel;
	wire [31:0] ls_alu_pc_sel;
	mux_pc_src PC_SEL(
		.ALU(ls_alu_pc_sel),
		.INTERRUPT(interrupt_pc_sel),
		.COND_BR(adder_j_pc_out),
		.PC_ADDER(adder4_pc_out),
		.CTL(decoder_pc_sel),
		.COND(alu_cond_pc_sel),
		.OUT(pc_in)
	);
	wire [31:0] interrupt_pc_sel;
	interrupt_vector INTERRUPT(
		.OUT(interrupt_pc_sel)
	);
	assign pc_out = NEXT;
endmodule
