`timescale 1ns / 1ps



module extender(
input toextend,
output reg [31:0] extended
);
always @(*)
begin
    extended <= {32{toextend}};
end
endmodule
