`timescale 1ns / 1ps

module adder(
input [31:0] A,
input [31:0] Bnew,
output [31:0] adderout
);
    assign adderout = A + Bnew;
endmodule

