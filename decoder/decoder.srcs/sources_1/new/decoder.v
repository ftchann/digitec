`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 16:20:12
// Design Name: 
// Module Name: decoder
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


module decoder(input [1:0] a, output [3:0] b);
    and and_1(b[0],~a);
    and and_2(b[1],~a[0], a[1]);
    and and_3(b[2], a[0], ~a[1]);
    and and_4(b[3], a); 
endmodule
