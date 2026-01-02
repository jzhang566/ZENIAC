`timescale 1ns / 1ps

module Registers(
    input [3:0] sel1, 
    input [3:0] sel2,
    input [15:0] in,
    input write_en,  
    input clk, 
    input rst, 
    input [15:0] pc,
    input [3:0] flags_in, 
    output reg [15:0] out1, 
    output reg [15:0] out2,
    output reg [3:0] flags_out
);

reg [15:0] data [3:0];

always @ (posedge clk) begin
    data[15] <= pc;
    if (write_en == 1'b1 && sel1 !== 4'b0000) begin
        data[sel1] <= in;
    end
    out1 <= data[sel1];
    out2 <= data[sel2];
    data[14] = flags_in;
    flags_out = data[14];
end

endmodule
