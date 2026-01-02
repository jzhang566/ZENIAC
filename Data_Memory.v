`timescale 1ns / 1ps

module Data_Memory 
#(parameter ADDR_LEN = 16) (
    input [15:0] in,
    input [15:0] addr,
    input mov_sz,
    input write_en,
    input clk, 
    output reg [15:0] out
);

reg [7:0] data [1 << (ADDR_LEN - 1) : 0];

always @ (posedge clk) begin
    if (write_en == 1'b1) begin
        data[addr] <= in[7:0];
        if (mov_sz == 1'b1) begin
            data[addr+1] <= in[15:8]; 
        end
    end
    out <= data[addr];
end

endmodule
