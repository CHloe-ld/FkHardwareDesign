`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/03 03:16:48
// Design Name: 
// Module Name: mult
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


module mult(
    input wire signed_mult_i,
    input wire[31:0] opdata1_i,
    input wire[31:0] opdata2_i,
    input wire start,

    output reg[63:0] result_o,
    output reg ready_o
    );
    reg s;
    reg temp;
    always@(*)begin
        if(start)begin
            // signed mult
            if(~signed_mult_i)begin
                result_o = {32'b0, opdata1_i} * {32'b0, opdata2_i};
                ready_o = 1'b1;
            end
            // unsigned mult
            else begin
                s = opdata1_i[31] ^ opdata2_i[31];
                temp = opdata1_i[30:0] * opdata2_i[30:0];
                result_o = {s, 1'b0, temp};
                ready_o = 1'b1;
            end
        end
    end
endmodule
