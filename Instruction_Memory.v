`timescale 1ns / 1ps

module Instruction_Memory 
#(parameter ADDR_LEN = 16) (
    input [ADDR_LEN-1 : 0] in,
    input clk, 
    output reg [31:0] out
);

reg [31:0] data [1 << (ADDR_LEN - 1) : 0];
always @ (posedge clk) begin
    out <= data[in];
end

endmodule
