`timescale 1ns / 1ps



module extender(
input toextend,
output reg [31:0] extended
);
always @(*)
begin
    extended <= {{31{toextend}},toextend};
end
endmodule
