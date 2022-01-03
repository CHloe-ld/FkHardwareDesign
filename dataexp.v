`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/02 16:27:32
// Design Name: 
// Module Name: dataexp
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


module dataexp(
    input wire[15:0] a,
    input wire unsign,
    output wire[31:0] y
    );
    assign y = unsign? {{16{1'b0}},a} : {{16{a[15]}},a};
endmodule
