`timescale 1ns / 1ps
module up_down #(parameter DIV = 49_999_999)(
    input clk, rst_n, up_down,
    output reg [2:0] count
);
    reg [25:0] counter;
    reg clk_div;

    // Block 1: clock divider (100 MHz -> 1 Hz)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            clk_div <= 0;
        end
        else if (counter == DIV) begin
            counter <= 0;
            clk_div <= ~clk_div;
        end
        else
            counter <= counter + 1;
    end

    // Block 2: up/down counter on the slow clock
    always @(posedge clk_div or negedge rst_n) begin
        if (!rst_n)
            count <= 0;
        else if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
endmodule
