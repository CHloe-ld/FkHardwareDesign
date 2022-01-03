`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 14:29:33
// Design Name: 
// Module Name: signext
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


module signext(
	input wire[15:0] a,
	input wire immi,//判断是否为立即数
	output wire[31:0] y
    );

	assign y = (immi ==1)?{{16{1'b0}} ,a}:{{16{a[15]}},a};
	//如果是立即数的话，说明要进行立即数的逻辑运算，需要将16位的立即数符号扩展，高位填0
endmodule
