`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:06 01/20/2021 
// Design Name: 
// Module Name:    computer_simulator 
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
module computer_simulator(
    );

wire [1:0] mem_write;
wire [31:0] cpu_out_mem_in;
wire [31:0] mem_out_cpu_in;
wire [31:0] pc_cpu_out;
wire [31:0] pc_mem_out;
wire [31:0] pc_mem_read_addr;
wire [31:0] pc_mem_write_addr;

reg clk = 0;
reg rst = 0;

risc_v_32 CPU(
	.INSTRUCTION(pc_mem_out),
	.D_IN(mem_out_cpu_in),
	.CLK(clk),
	.RST(rst),
	.D_OUT(cpu_out_mem_in),
	.D_OUT_ADDR(pc_mem_write_addr),
	.NEXT(pc_cpu_out),
	.D_IN_ADDR(pc_mem_read_addr),
	.WR(mem_write)
);

mm MEMORY(
	.CLK(clk),
	.ADDR(pc_cpu_out),
	.WR(mem_write),
	.D_IN_ADDR(pc_mem_write_addr),
	.D_OUT_ADDR(pc_mem_read_addr),
	.D_IN(cpu_out_mem_in),
	.INSTR(pc_mem_out),
	.D_OUT(mem_out_cpu_in)
);

reg [31:0] instruction;
assign intstruction = {20'd5,5'd3,`OP_LUI};
assign pc_mem_write_addr = 0;
assign cpu_out_mem_in = 1;
assign clk = 1;
assign clk = 0;
assign clk = 1;
endmodule
