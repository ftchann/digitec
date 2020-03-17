`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2020 15:54:31
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(input[3:0] a, input[3:0] b, output[4:0] s);
    FullAdder adder_1(a[0], b[0], 0, s[0], wire_1);
    FullAdder adder_2(a[1], b[1], wire_1, s[1], wire_2);
    FullAdder adder_3(a[2], b[2], wire_2, s[2], wire_3);
    FullAdder adder_4(a[3], b[3], wire_3, s[3], s[4]);
endmodule
