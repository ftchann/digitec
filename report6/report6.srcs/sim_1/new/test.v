`timescale 1ns / 1ps


module test;
//input
reg left;
reg right;
reg reset;
//testclock
reg clk;
//inputclock
reg input_clk;
//output
wire [5:0] q;
reg[10:0] vec_cnt;
//testvec
reg [2:0] testvec[1:0];
always
    begin
        clk=1; #1_000_000_000; //50ns
        clk=0; #1_000_000_000;
    end //100ns clock
    always
    begin
        input_clk=1; #5; //5ns
        input_clk=0; #5;
    end //10ns clock
initial
    begin
        $readmemb("testvec.txt", testvec);
        vec_cnt = 0;
    end    
always @ (posedge clk)
begin
    #20;
    {left, right, reset} = testvec[vec_cnt];
    #60;
    vec_cnt = vec_cnt + 1;
    if((testvec[vec_cnt][0] === 1'bx))
    begin
        $display("fertig");
        #20;
        $finish;
    end
end
fsm2 fsm(left, right, reset, input_clk, q);    
endmodule
