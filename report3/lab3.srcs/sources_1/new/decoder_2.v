

module decoder_2(input [1:0] a, output [3:0] b);
    and and_1(b[0],~a[0],~a[1] );
    and and_2(b[1], a[0], ~a[1]);
    and and_3(b[2],~a[0], a[1]);
    and and_4(b[3], a[0], a[1]); 
endmodule


