`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:21:30
// Design Name: 
// Module Name: maindec
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

`include "defines2.vh"
module maindec(
	input wire[5:0] op,
	input wire[5:0] func,//nikkie
	input wire[4:0] rt,//nikkie
	output wire memtoreg,memwrite,
	output wire branch,alusrc,
	output wire regdst,regwrite,
	output wire jump,
	//output wire[1:0] aluop,//nikkie
	output wire jr,jal,jalr,bal //Ӳ�����
    );
	reg[8:0] controls;
	assign {regwrite,regdst,alusrc,branch,
			memwrite,memtoreg,jump,//aluop,//nikkie
			jr,jal,jalr,bal,//nikkie
			imme//chole
			} = controls;

	always @(*) begin
		case (op)
			`R_TYPE:begin
			  	case(func)
			  		`JR: controls<=12'b0000_001_1000_0;/////��������jump�ò���Ϊ1??
					`JALR: controls<=12'b1100_001_0010_0;///���jalrû��rd�ֶ�Ҳ��Ĭ��??31�żĴ���
					default:
						controls<=12'b0000_000_0000_0;
				  endcase
			end
			`J: controls<=12'b0000_001_0000_0;//����jump
			`JAL: controls<=12'b1000_001_0100_0;//jump�˻�Ҫдpc+8??31�żĴ���
			`BEQ,`BNE,`BGTZ,`BLEZ:controls<=12'b0001_000_0000_0;//���ǵ�op��һ??
			`EXE_REGIMM_INST:begin//��Щbranch��op??����??����Ҫ����rt��һ����??
			  case(rt)
			  	`BLTZ, `BGEZ://����ͨbranchΨһ��������rs??0�Ƚ�
				  	controls <= 12'b0001_000_0000_0;
				`BLTZAL,`BGEZAL://������������ͬ���ǣ�������Ҫд�Ĵ���regwrite��regdstû����Ϊ??31??
					begin
						controls <= 12'b1001_000_0001_0;
					end
					endcase
			 end	
			 endcase
			 end
			 	


//	always @(*) begin
//		case (op)
//			6'b000000:controls <= 9'b110000010;//R-TYRE
//			6'b100011:controls <= 9'b101001000;//LW
//			6'b101011:controls <= 9'b001010000;//SW
//			6'b000100:controls <= 9'b000100001;//BEQ
//			6'b001000:controls <= 9'b101000000;//ADDI
//
//			6'b000010:controls <= 9'b000000100;//J
//			default:  controls <= 9'b000000000;//illegal op
//		endcase
//	end

endmodule
