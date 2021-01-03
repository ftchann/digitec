`timescale 1ns / 1ps

module n33r(input [3:0] d, input op, output[1:0] s);
    assign s = op ? (d[1:0] - d[3:2]): (d[3:2] + d[1:0]);
endmodule
module top(input wire [6:0] instr, input wire op, output wire [7:0] c);
    wire [1:0] r1, r2;
    n33r i0 (instr[4:0], instr[7], r1);
    n33r i1 (instr[3:2], instr[0], r2);
    assign z = r1 | r2;
endmodule
