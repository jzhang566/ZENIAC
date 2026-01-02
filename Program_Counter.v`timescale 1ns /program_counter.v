`timescale 1ns / 1ps
module Program_Counter(
    input [15:0] in,
    input write_en,
    input stall,
    input clk,
    input rst,
    output reg [15:0] out
);

    reg [15:0] data;

    initial begin
        data = 16'b0;
    end

    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            data <= 16'b0;
        end else begin
            if (write_en == 1'b1) begin
                data <= in;
            end 
            if (stall == 1'b0 && write_en == 1'b0) begin
                data <= data + 16'b1;
            end
            out <= data;
        end
    end

endmodule
