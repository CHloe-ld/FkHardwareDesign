`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/03 01:13:23
// Design Name: 
// Module Name: mult_div
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


module mult_div(
    input wire[31:0] a, b,
    input wire mult,
    input wire enable,
    input wire signed_calc,
    input clk, rst, 
    output reg[31:0] res_h, 
    output reg[31:0] res_l,
    output wire ready
    );
    wire[31:0]res_mult;
    wire[63:0] res;
    wire ready_m, ready_d;
    assign ready = mult ? ready_m : ready_d;
    always@(*)begin
        res_h = res[63:32];
        res_l = res[31:0];
    end

mult m(
    signed_calc,
    a,
    b,
    enable & mult,
    res,
    ready_m
);

div divide(
    clk,
    rst,
    signed_calc,
    a,
    b,
    enable&~mult,
    1'b0,
    res,
    ready_d
);


endmodule
