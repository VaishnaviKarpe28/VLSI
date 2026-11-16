`timescale 1ns / 1ps
module tb_up_down;
    reg clk, rst_n, up_down;
    wire [2:0] count;

    // DIV = 4 only for simulation (fast); board uses 49_999_999
    up_down #(.DIV(4)) uut(.clk(clk), .rst_n(rst_n), .up_down(up_down), .count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; up_down = 1;
        #20 rst_n = 1;       // release reset, count up
        #400 up_down = 0;    // count down
        #400 $finish;
    end
endmodule
