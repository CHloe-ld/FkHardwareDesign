`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/07 10:58:03
// Design Name: 
// Module Name: mips
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mips(
	input wire clk,rst,
	output wire[31:0] pcF,
	input wire[31:0] instrF,
	output wire memwriteM,
	output wire[31:0] aluoutM,writedataM,
	input wire[31:0] readdataM 
    );
	
	wire [5:0] opD,functD;
	wire regdstE,alusrcE,pcsrcD,memtoregE,memtoregM,memtoregW,
			regwriteE,regwriteM,regwriteW;

	//wire [2:0] alucontrolE; //010322
	//010322****
	wire flushE,equalD;
	wire [4:0]rtD;
	wire flushD,stallD,stallE,flushM,stallM,flushW,stallW;
	wire balD,jrD,jalD,jalrD;
	wire [7:0]alucontrolE;
	wire jalE,jalrE,balE;
	wire branchokM,pcsrcM,jumpM,jrM,jalM,jalrM,balM;
	//010322****

	controller c(
		clk,rst,
		//decode stage
		opD,functD,
		//pcsrcD,branchD,equalD,jumpD,//010322

		rtD,//nikkie
		flushD,stallD,//nikkie
		balD,jrD,jalD,jalrD,//010322

		
		//execute stage
		flushE,
		//stallE,//010322
		memtoregE,alusrcE,
		regdstE,regwriteE,	
		alucontrolE,//010322
		jalE,jalrE,balE,//010322

		//mem stage
		flushM,stallM,//010322
		branchokM,//010322
		memtoregM,memwriteM,
		regwriteM,
		pcsrcM,//010322
		jumpM,jrM,jalM,jalrM,balM,//010322

		//write back stage
		flushW,stallW,//010322
		memtoregW,regwriteW
		);
	datapath dp(
		clk,rst,
		//fetch stage
		pcF,
		instrF,
		//decode stage
		//010322*****
		//pcsrcD,branchD,//shan
		//jumpD,//shan
		//equalD,//shan
		//010322*****
		opD,functD,rtD,
		//execute stage
		memtoregE,
		alusrcE,regdstE,
		regwriteE,
		alucontrolE,
		jalE,balE,jalrE,//010322
		flushE,
		//mem stage
		memtoregM,
		regwriteM,
		aluoutM,writedataM,
		readdataM,
		pcsrcM,jumpM,jrM,jalM,jalrM,balM,//010322
		branchokM,//010322
		flushW,//010322
		//writeback stage
		memtoregW,
		regwriteW
	    );
	
endmodule