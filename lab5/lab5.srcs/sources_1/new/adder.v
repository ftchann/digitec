`timescale 1ns / 1ps

module adder(
input [31:0] A,
input [31:0] Bnew,
output [31:0] adderout
);
    wire [31:0] carry;
    genvar i;
    for(i = 0; i < 32; i = i + 1) 
    begin
        if(i == 0)
            FullAdder fulladd1(A[0], Bnew[0], 0, adderout[0], carry[0]);    
        else
            FullAdder fulladd2(A[i], Bnew[i], carry[i-1], adderout[i], carry[i]);
    end
endmodule
module FullAdder(input a, input b, input ci, output s, output co);
    and and_1 (inter1, a, b);
    and and_2 (inter2, a, ci);
    and and_3 (inter3, ci, b);
    or or_1 (co, inter1, inter2 , inter3);
    xor xor_1 (s, a, b,ci);
endmodule
