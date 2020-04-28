`timescale 1ns / 1ps

module clk_div(input clk, input rst, output clk_en);
    //initial was [24:0]
    reg [10:0] clk_count;
    //we set it lower to make the simulation faster
    always @ (posedge clk)
    //posedge defines a rising edge (transition from 0 to 1)
    begin
     if (rst)
        clk_count = 0;
     else
        //$display(clk_count);
        clk_count = clk_count + 1;
    end
    assign clk_en = &clk_count;
endmodule
