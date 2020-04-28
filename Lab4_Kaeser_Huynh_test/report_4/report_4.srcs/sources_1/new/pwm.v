


module pwm(
    input clk,
    input [1:0] duty_led,
    output reg led
    );
    
    reg[1:0] counter = 0;
    always @ (posedge clk)
    begin
        counter = counter + 1;
        if(counter <= duty_led)
        begin
            led = 1;
        end
        else
        begin
            led = 0;
        end
    end
endmodule
