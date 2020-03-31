`timescale 1ns / 1ps


module logical(
input [31:0] A,
input [31:0] B,
input [3:0] ALUopt,
output reg [31:0] logicalout
);
always @(*)
begin
    case(ALUopt[1:0])
        2'b00: logicalout = A & B;
        2'b01: logicalout = A | B;
        2'b10: logicalout = A ^ B;
        2'b11: logicalout = ~(A | B);
    endcase
end
endmodule
