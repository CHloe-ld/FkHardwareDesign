`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 14:52:16
// Design Name: 
// Module Name: alu
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


module alu(
	input wire[31:0] a,b,
	input wire[7:0] op,//变成�?8位，宏定�?
	input wire[4:0] sa,//移位操作
	output reg[31:0] y,
	output reg overflow,
	output wire zero,

	// 乘除法器信号
	output reg[31:0] md_a,
	output reg[31:0] md_b,
	output reg mult,
	output reg md,
	output reg signed_calc
    );


	wire[31:0] s,bout;
	assign bout = op[2] ? ~b : b;
	assign s = a + bout + op[2];
	always @(*) begin
		case (op[7:0])
			`EXE_AND_OP: y = a & b;          		 //and
			`EXE_OR_OP: y = a | b; 				 	 //or
			`EXE_XOR_OP: y = a ^ b;  				 //xor
			`EXE_NOR_OP: y = a ^~ b; 				 //nor
			`EXE_ANDI_OP: y = a & b;  				 //andi
			`EXE_XORI_OP: y = a ^ b;  				 //xori
			`EXE_LUI_OP: y = {b[15:0], {16{1'b0}}};  //lui
			`EXE_SLLV_OP: y = a << b[4:0];			 //sllv
			`EXE_SRLV_OP: y = a >> b[4:0];			 //srlv
			`EXE_SRAV_OP: y = a >>> b[4:0];			 //srav

			`EXE_AND_OP: y = a + b;				 	 //add  无符号运算与有符号运算在不检查溢出时相同
			`EXE_ADDU_OP: y = a + b;				 //addu
			`EXE_SUB_OP: y = a - b;				 	 //sub  无符号运算与有符号运算在不检查溢出时相同
			`EXE_SUBU_OP: y = a - b;				 //subu
			`EXE_SLT_OP: y = (a[31] ^ b[31]) ?   	 //slt
							 (a[31] ? 1 : 0) : 
							 (a[31]? a > b : a < b);
			`EXE_SLTU_OP: y = (a < b)? 1 : 0;	 	 //sltu
			`EXE_MULT_OP: begin 
						 md_a = a;				 	 //mult
						 md_b = b;
						 mult = 1'b1;
						 md = 1'b1;
						 signed_calc = 1'b1;
			end
			`EXE_MULTU_OP: begin
						 md_a = a;				 	 //multu
						 md_b = b;
						 mult = 1'b1;
						 md = 1'b1;
						 signed_calc = 1'b0;
			end
			`EXE_DIV_OP: begin
						 md_a = a;				 	 //div
						 md_b = b;
						 mult = 1'b0;
						 md = 1'b1;
						 signed_calc = 1'b1;
			end
			`EXE_DIVU_OP: begin
						 md_a = a;				 	 //divu
						 md_b = b;
						 mult = 1'b0;
						 md = 1'b1;
						 signed_calc = 1'b0;
			end
			default : y <= 32'b0;
		endcase	
	end
	assign zero = (y == 32'b0);

	always @(*) begin
		case (op[2:1])
			2'b01:overflow <= a[31] & b[31] & ~s[31] |
							~a[31] & ~b[31] & s[31];
			2'b11:overflow <= ~a[31] & b[31] & s[31] |
							a[31] & ~b[31] & ~s[31];
			default : overflow <= 1'b0;
		endcase	
	end
endmodule

