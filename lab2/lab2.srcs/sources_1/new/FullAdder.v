`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2020 15:47:51
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(input a, input b, input ci, output s, output co);
    and and_1 (inter1, a, b);
    and and_2 (inter2, a, ci);
    and and_3 (inter3, ci, b);
    or or_1 (co, inter1, inter2 , inter3);
    xor xor_1 (s, a, b,ci);
endmodule
