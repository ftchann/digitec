`timescale 1ns / 1ps

module adder(
input [31:0] A,
input [31:0] Bnew,
output [31:0] adderout
);
    wire [31:0] carry;
    genvar i;
    for(i = 0; i < 29; i = i + 4) 
    begin
        if(i == 0)
            begin FourBitAdder fourbitadder(A [i+3:i], Bnew[i+3:i], 1'b0, adderout[i+3:i], carry[i+3]); end
        else
            begin FourBitAdder fourbitadder(A [i+3:i], Bnew [i+3:i], carry[i-1], adderout[i+3:i], carry[i+3]); end 
    end
endmodule
module FullAdder(input a, input b, input ci, output s, output co);
    and and_1 (inter1, a, b);
    and and_2 (inter2, a, ci);
    and and_3 (inter3, ci, b);
    or or_1 (co, inter1, inter2 , inter3);
    xor xor_1 (s, a, b,ci);
endmodule

module FourBitAdder(input[3:0] a, input[3:0] b, input cin, output[3:0] s, output cout);
    FullAdder adder_1(a[0], b[0], cin, s[0], wire_1);
    FullAdder adder_2(a[1], b[1], wire_1, s[1], wire_2);
    FullAdder adder_3(a[2], b[2], wire_2, s[2], wire_3);
    FullAdder adder_4(a[3], b[3], wire_3, s[3], cout);
endmodule

