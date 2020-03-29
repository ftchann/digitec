`timescale 1ns / 1ps



module fsm2(input left, input right, input reset, input clk, output reg [5:0] q );
    
    
    //clock new states 0.3s
    clk_div #26 clock1(clk, reset, clk_en);
    clk_div #24 clock2(clk, reset, clk_out);
    
    reg [5:0] state, nextstate;
    parameter S0 = 6'b000000;
    parameter S1 = 6'b001000;
    parameter S2 = 6'b011000;
    parameter S3 = 6'b111000;
    parameter S4 = 6'b000100;
    parameter S5 = 6'b000110;
    parameter S6 = 6'b000111;
   
    
    //state register
    reg [1:0] count;
    always @ (posedge clk_en, posedge reset)
    begin
        if (reset) 
        begin
            state <= S0;
        end
        else state <= nextstate;
    end
    //next state logic
    always @ (posedge clk)
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
    pwm dim(clk, count, led);
    always @ (posedge clk_out)
    begin
        count = count + 1;
    end
    always @ (posedge clk)
    begin
        case (state)    
            S0: q = S0;
            S1: q = (led) ? state : S0;
            S2: q = (led) ? state : S1;
            S3: q = (led) ? state : S2;
            
            S4: q = (led) ? state : S0;
            S5: q = (led) ? state : S4;
            S6: q = (led) ? state : S5;
            default: q = 6'b111111;
        endcase
    end
endmodule

