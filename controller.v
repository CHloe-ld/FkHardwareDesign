`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:21:30
// Design Name: 
// Module Name: controller
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


module controller(
	input wire clk,rst,
	//decode stage
	input wire[5:0] opD,functD,
	//output wire pcsrcD,branchD,equalD,jumpD//要删
	input wire[4:0] rtD,//nikkie
	input wire flushD,stallD,// 硬综添加
	output wire balD,jrD,jalD,jalrD, // 硬综添加

	//execute stage
	input wire flushE,
	input wire stallE,// 硬综添加
	output wire memtoregE,alusrcE,
	output wire regdstE,regwriteE,	
	output wire[7:0] alucontrolE,//改成8未
	output wire jalE, jalrE, balE,//0103，没有jrE

	//mem stage
	input wire flushM,stallM,// 硬综添加
	input wire branchokM,//0103
	output wire memtoregM,memwriteM,
				regwriteM,
	output wire pcsrcM,//0103
	output wire jumpM,jrM,jalM,jalrM,balM,//0103
	//write back stage
	input wire flushW,stallW,// 硬综添加
	output wire memtoregW,regwriteW 
    );
	
	//decode stage
	//wire[1:0] aluopD; //�?
	wire memtoregD,memwriteD,alusrcD,
		regdstD,regwriteD;
	wire[7:0] alucontrolD;//改成�?8�?
	wire branchD,jumpD;//0103

	//execute stage
	wire memwriteE;
	wire jumpE,jrE,branchE; // 0103,还有�?些al指令作为了输出，因为要控制alu计算pc+8以及控制目标写寄存器
	//wire jrE, jalE, jalrE, balE//0103

	//memory stage
	wire branchM;//0103

	maindec md(
		opD,functD,rtD,//add funcD & rtD
		memtoregD,memwriteD,
		branchD,alusrcD,
		regdstD,regwriteD,
		jumpD,
		jrD,jalD,jalrD,balD//0103
		//aluopD //�?
		);


	aludec ad(
		opD,functD,rtD,
		//aluopD,
		alucontrolD);

	//assign pcsrcD = branchD & equalD; //nikkie
	assign pcsrcM = branchM & branchokM;//0103:mem阶段才判断是否分�?

	//pipeline registers
	floprc #(8) regE(
		clk,
		rst,
		flushE,
		{memtoregD,memwriteD,alusrcD,regdstD,regwriteD,alucontrolD,branchD,jumpD,jrD,jalD,jalrD},//add branchD及其之后�?
		{memtoregE,memwriteE,alusrcE,regdstE,regwriteE,alucontrolE,branchE,jumpE,jrE,jalE,jalrE}//add branchE及其之后�?
		);
	flopr #(8) regM(
		clk,rst,
		{memtoregE,memwriteE,regwriteE,branchE,jumpE,jrE,jalE,jalrE},//add branchE及其之后�?
		{memtoregM,memwriteM,regwriteM,branchM,jumpM,jrM,jalM,jalrM}//add branchM及其之后�?
		);
	flopr #(8) regW(
		clk,rst,
		{memtoregM,regwriteM},
		{memtoregW,regwriteW}
		);
endmodule
