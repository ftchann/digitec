
module results(input[3:0] a, input[3:0] b, output [6:0] D, output s);
    wire [4:0] result1;
    FourBitAdder adder(a,b, result1);
    decoder dec(result1[3:0], D);
    assign s = result1[4];
endmodule
