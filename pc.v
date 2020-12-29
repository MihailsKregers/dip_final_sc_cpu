`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:14 12/29/2020 
// Design Name: 
// Module Name:    pc 
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
module pc(
		input CLK,
		input [31:0] I_PC,
		input I_RST,
		input I_RUN,
		output [31:0] O_PC,
		output O_RUN		
    );
	
	reg [31:0] pc;
	reg run;
	
	always@(posedge CLK) begin
		if (!I_RST) begin
			pc <= 32'b0;
			run <= 1'b1;
		end else begin
			pc <= I_PC;
			run <= I_RUN;
		end
	end
	
	assign O_PC = pc;
	assign O_RUN = run;
	
endmodule
