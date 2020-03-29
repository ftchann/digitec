`timescale 1ns / 1ps



module fsm2(input left, input right, input reset, input clk, output [5:0] q );
    
    //clock
    
    clk_div clock(clk, reset, clk_en);
    
    reg [5:0] state, nextstate;
    parameter S0 = 6'b000000;
    parameter S1 = 6'b001000;
    parameter S2 = 6'b011000;
    parameter S3 = 6'b111000;
    parameter S4 = 6'b000100;
    parameter S5 = 6'b000110;
    parameter S6 = 6'b000111;
    
    //state register
    always @ (posedge clk_en, posedge reset)
    begin
        if (reset) state <= S0;
        else state <= nextstate;
    end
    //next state logic
    always @ (*)
    begin
        case (state)
            S0: if(left & ~right)
                    nextstate = S1;
                else
                    if(right & ~left)
                        nextstate = S4;
                    else
                        nextstate = S0;          
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S0;
            S4: nextstate = S5;
            S5: nextstate = S6;
            S6: nextstate = S0;
            default: nextstate = S0;
        endcase
    end
    //output logic
    assign q = state;
          
endmodule

