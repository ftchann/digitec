`timescale 1ns / 1ps


module arithmetic(
input [31:0] A,
input [31:0] B,
input [3:0] ALUopt,
output reg [31:0] arithout
);
reg [31:0] Bnew;
always @(*)
begin Bnew = (ALUopt[1]) ? ((~B) + 1): B; end
wire [31:0] adderout;
adder adder1(A, Bnew, adderout);
extender extender1(adderout[31], extendout);
always @(*)
begin arithout = (ALUopt[3]) ? extendout: adderout; end
endmodule
