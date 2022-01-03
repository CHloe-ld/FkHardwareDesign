`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 15:12:22
// Design Name: 
// Module Name: datapath
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


module datapath(
	input wire clk,rst,
	//fetch stage
	output wire[31:0] pcF,//打印出来看的
	input wire[31:0] instrF,//instr_mem输出给datapath�?

	//decode stage
	//input wire pcsrcD,branchD, �?
	//input wire jumpD,//�?
	//output wire equalD,////�?
	//input wire jrD, jalrD,jalD,balD,// 硬综添加/////////要删�?
	output wire[5:0] opD,functD,////打印出来看的

	//execute stage
	input wire memtoregE,
	input wire alusrcE,regdstE,
	input wire regwriteE,
	input wire[7:0] alucontrolE,//改成8�?
	input wire jalE, balE, jalrE,// 0103，没有jrE
	output wire flushE,

	//mem stage
	input wire memtoregM,
	input wire regwriteM,
	output wire[31:0] aluoutM,writedataM,
	input wire[31:0] readdataM,//data_mem输出给datapath�?
	input wire pcsrcM,jumpM,jrM,jalM,jalrM,balM,//0103:分支在mem时�?�判�?
	output wire branchokM,//0103
	output wire flushM,//0103
	
	//writeback stage
	input wire memtoregW,
	input wire regwriteW,
	output wire flushW//0103
    );
	
	//fetch stage
	wire stallF;
	wire flushF;//0103
	//FD
	wire [31:0] pcnextFD,pcnextbrFD,pcplus4F,pcbranchD;

	//decode stage
	wire [31:0] pcplus4D,instrD;
	wire forwardaD,forwardbD;
	wire [4:0] rsD,rtD,rdD;
	wire flushD,stallD; 
	wire [31:0] signimmD,signimmshD;
	wire [31:0] srcaD,srca2D,srcbD,srcb2D;
	wire [4:0] saD;//chloe

	//execute stage
	wire [1:0] forwardaE,forwardbE;
	wire [4:0] rsE,rtE,rdE;
	wire [4:0] writeregE;
	wire [4:0] wirteregE_temp;//0103,用al型指令来判断是写rd还是31号寄存器
	wire [31:0] signimmE;
	wire [31:0] srcaE,srca2E,srcbE,srcb2E,srcb3E;
	wire [31:0] aluoutE;
	wire [4:0] saE;//chole

	//mem stage
	wire [4:0] writeregM;
	wire [4:0] rsM,rtM;//0103
	wire [7:0] alucontrolM;//0103

	//writeback stage
	wire [4:0] writeregW;
	wire [31:0] aluoutW,readdataW,resultW;

	// 传�?�的各个阶段的pc
	wire [31:0] pcD, pcE, pcM, pcW;
	wire stallE, stallM, stallW;

	//hazard detection
	hazard h(
		//fetch stage
		stallF,
		//decode stage
		rsD,rtD,
		branchD,
		forwardaD,forwardbD,
		stallD,
		//execute stage
		rsE,rtE,
		writeregE,
		regwriteE,
		memtoregE,
		forwardaE,forwardbE,
		flushE,
		//mem stage
		writeregM,
		regwriteM,
		memtoregM,
		//write back stage
		writeregW,
		regwriteW
		);

	//next PC logic (operates in fetch an decode)
	mux2 #(32) pcbrmux(pcplus4F,pcbranchD,pcsrcM,pcnextbrFD);//这里把pcsrcD变成了pcsrcM
	mux3 #(32) pcmux(pcnextbrFD,rsD,{pcplus4D[31:28],instrD[25:0],2'b00},{jumpM,(jrM|jalrM)},pcnextFD);//硬综添加
	//jump=0且jr或jalr=0�?00，pc的来源看是否branch：pcsrcM
	//jump=0，jr或jalr=1: 01，pc的来源的看rsD
	//jump=1，jr和jalr都为0: 10，pc的来源看拼接值：{pcplus4D[31:28],instrD[25:0],2'b00}

	//fetch stage logic
	pc #(32) pcreg(clk,rst,~stallF,pcnextFD,pcF);// 将pcnextFD存入pc寄存器中
	adder pcadd1(pcF,32'b100,pcplus4F);// pc+4，输出为pcplus4F

	//decode stage
	//regfile (operates in decode and writeback)
	regfile rf(clk,regwriteW,rsD,rtD,writeregW,resultW,srcaD,srcbD);
	flopenr #(32) r1D(clk,rst,~stallD,pcplus4F,pcplus4D);
	flopenrc #(32) r2D(clk,rst,~stallD,flushD,instrF,instrD);
	flopenrc #(32) pcF2D(clk,rst,~stallD,flushD,pcF,pcD);//硬综添加，要把之前取的pcflush�?
	dataexp se(immed,1,signimmD);// chole 符号扩展
	//signext se(instrD[15:0],signimmD); //chole
	sl2 immsh(signimmD,signimmshD);
	adder pcadd2(pcplus4D,signimmshD,pcbranchD);
	mux2 #(32) forwardamux(srcaD,aluoutM,forwardaD,srca2D);
	mux2 #(32) forwardbmux(srcbD,aluoutM,forwardbD,srcb2D);
	//eqcmp comp(srca2D,srcb2D,equalD);///要删

	assign opD = instrD[31:26];
	assign functD = instrD[5:0];
	assign rsD = instrD[25:21];
	assign rtD = instrD[20:16];
	assign rdD = instrD[15:11];
	assign saD = instrD[10:6];//chole
	assign immed = instrD[15:0];//chole

	//execute stage
	floprc #(32) r1E(clk,rst,flushE,srcaD,srcaE);
	floprc #(32) r2E(clk,rst,flushE,srcbD,srcbE);
	floprc #(32) r3E(clk,rst,flushE,signimmD,signimmE);
	floprc #(5) r4E(clk,rst,flushE,rsD,rsE);
	floprc #(5) r5E(clk,rst,flushE,rtD,rtE);
	floprc #(5) r6E(clk,rst,flushE,rdD,rdE);
	floprc #(5) r7E(clk,rst,flushE,saD,saE);//chole

	flopenr #(32) pcregF2D(clk,rst,~stallE,pcD,pcE);//nikkie
	flopenrc #(32) pcD2E(clk,rst,~stallE,flushE,pcD,pcE);//硬综添加
	
	mux3 #(32) forwardaemux(srcaE,resultW,aluoutM,forwardaE,srca2E_tmp); 
	mux2 #(32) srcamux(srca2E_tmp,pcE,(jalE|balE|jalrE),srca2E);//硬综添加
	mux3 #(32) forwardbemux(srcbE,resultW,aluoutM,forwardbE,srcb2E);
	//mux2 #(32) srcbmux(srcb2E,signimmE,alusrcE,srcb3E);///要修改成mux3
	mux3 #(32) srcbmux(srcb2E,signimmE,32'd00000008,{(jalE|balE|jalrE),alusrcE},srcb3E);
	alu alu(srca2E,srcb3E,alucontrolE,aluoutE);
	mux2 #(5) wrmux(rtE,rdE,regdstE,wirteregE_temp);// 选择WB的地�?（rt：I型指令；r：R型指令）
	mux2 #(5) wrmuxJ(wirteregE_temp,5'b11111,(jalE | balE | ( jalrE & ( rdE == 5'b0 ) ) ),writeregE);//硬综添加

	//mem stage
	flopr #(32) r1M(clk,rst,srcb2E,writedataM);
	flopr #(32) r2M(clk,rst,aluoutE,aluoutM);
	flopr #(5) r3M(clk,rst,writeregE,writeregM);
	flopr #(8) r4M(clk,rst,alucontrolE,alucontrolM);//nikkie
	flopr #(5) r5M(clk,rst,rsE,rsM);//0103
	flopr #(5) r6M(clk,rst,rtE,rtM);//0103
	condition branchcond(rsM,rtM,alucontrolM,branchokM);//nikkie:把分枝跳转的判断全部移动到mem阶段
	flopenrc #(32) pcE2M(clk,rst,~stallM,flushM,pcE,pcM);//硬综添加

	//writeback stage
	flopr #(32) r1W(clk,rst,aluoutM,aluoutW);
	flopr #(32) r2W(clk,rst,readdataM,readdataW);
	flopr #(5) r3W(clk,rst,writeregM,writeregW);
	mux2 #(32) resmux(aluoutW,readdataW,memtoregW,resultW);
	flopenrc #(32) pcM2W(clk,rst,~stallW,flushW,pcM,pcW);//硬综添加
endmodule
