
module results(input [1:0] c,input[3:0] a, input[3:0] b, output [6:0] D, output s, output [3:0] AN);
    wire [4:0] result1;
    FourBitAdder adder(a,b, result1);
    decoder dec(result1[3:0], D);
    wire [3:0] result2;
    decoder_2 dec2(c, result2);
    assign AN = ~result2;
    assign s = result1[4];
endmodule
