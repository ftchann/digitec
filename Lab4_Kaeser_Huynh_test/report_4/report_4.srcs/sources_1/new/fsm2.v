`timescale 1ns / 1ps



module fsm2(input left, input right, input reset, input clk, output reg [5:0] q );
    
    
    //clock new states 0.3s
    clk_div #24 clock1(clk, reset, clk_en);
    
    reg [3:0] state, nextstate;
    
    //output
    parameter S0 = 6'b000000;
    parameter S1 = 6'b001000;
    parameter S2 = 6'b011000;
    parameter S3 = 6'b111000;
    parameter S4 = 6'b000100;
    parameter S5 = 6'b000110;
    parameter S6 = 6'b000111;
   
    //state register
    parameter P0 = 4'b00000;
    parameter P1 = 4'b00001;
    parameter P2 = 4'b00010;
    parameter P3 = 4'b00011;
    parameter P4 = 4'b00100;
    parameter P5 = 4'b00101;
    parameter P6 = 4'b00110;
    parameter P7 = 4'b00111;
    parameter P8 = 4'b01000;
    parameter P9 = 4'b01001;
    parameter P10 = 4'b01010;
    parameter P11 = 4'b01011;
    parameter P12 = 4'b01100;
    
    reg [1:0] count = 0;
    reg ll = 0;
    always @ (posedge clk_en, posedge reset)
    begin
        if (reset) 
        begin
            state <= P0;
        end
        else state <= nextstate;
    end
    //next state logic
    always @ (*)
    begin
        case (state)
            P0: if(left & ~right)
                begin
                    nextstate = P1;
                    ll = 1;
                end
                else
                    if(right & ~left)
                    begin
                        nextstate = P1;
                        ll = 0;
                    end
                    else if(right & left)
                        nextstate = P0;          
            P1: nextstate = P2;
            P2: nextstate = P3;
            P3: nextstate = P4;
            P4: nextstate = P5;
            P5: nextstate = P6;
            P6: nextstate = P7;
            P7: nextstate = P8;
            P8: nextstate = P9;
            P9: nextstate = P10;
            P10: nextstate = P11;
            P11: nextstate = P12;
            P12: nextstate = P0;            
            default: nextstate = P0;
        endcase
    end
    pwm dim(clk, count, led);
    //count logic
    always @ (*)
    begin
        case (state)
                P0: count = 0;
                P1: count = 0;
                P2: count = 1;
                P3: count = 2;
                P4: count = 3;
                P5: count = 0;
                P6: count = 1;
                P7: count = 2;
                P8: count = 3;
                P9: count = 0;
                P10: count = 1;
                P11: count = 2;
                P12: count = 3;
                default: count = 3;
        endcase
    end
    //output logic
    always @ (*)
    begin
        if(ll)
        begin
        case (state)
                P0: q =S0;
                P1: q = led ? S1:S0;
                P2: q = led ? S1:S0;
                P3: q = led ? S1:S0;
                P4: q = led ? S1:S0;
                
                P5: q = led ? S2:S1;
                P6: q = led ? S2:S1;
                P7: q = led ? S2:S1;
                P8: q = led ? S2:S1;
                
                P9: q = led ? S3:S2;
                P10: q = led ? S3:S2;
                P11: q = led ? S3:S2;
                P12: q = led ? S3:S2;
                default: q = 6'b111111;
        endcase
        end
        else
            case (state)
                P0: q = S0;
                P1: q = led ? S4:S0;
                P2: q = led ? S4:S0;
                P3: q = led ? S4:S0;
                P4: q = led ? S4:S0;
                
                P5: q = led ? S5:S4;
                P6: q = led ? S5:S4;
                P7: q = led ? S5:S4;
                P8: q = led ? S5:S4;
                
                P9: q = led ? S6:S5;
                P10: q = led ? S6:S5;
                P11: q = led ? S6:S5;
                P12: q = led ? S6:S5;
                default: q = 6'b111111;
        endcase
        begin       
        end
        end
endmodule

