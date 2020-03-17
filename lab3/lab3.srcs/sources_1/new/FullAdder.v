

module FullAdder(input a, input b, input ci, output s, output co);
    and and_1 (inter1, a, b);
    and and_2 (inter2, a, ci);
    and and_3 (inter3, ci, b);
    or or_1 (co, inter1, inter2 , inter3);
    xor xor_1 (s, a, b,ci);
endmodule
