`timescale 1ns / 1ps

module ALU(
input [31:0] A,
input [31:0] B,
input [3:0] ALUopt,
output reg [31:0] ALUout,
output reg zero
);
wire [31:0] logicout;
wire [31:0] arithout;
arithmetic arith(A, B, ALUopt, arithout);
logical log(A, B, ALUopt, logicout);

always @(*)
begin 
    ALUout = (ALUopt[2]) ? logicout : arithout; 
    if(ALUout == 32'b0)
        zero = 1;
    else
        zero = 0;
end
endmodule
