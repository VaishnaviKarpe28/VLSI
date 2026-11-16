`timescale 1ns / 1ps
module siso_tb;
    reg clk, rst, din;
    wire dout;

    siso uut(.clk(clk), .rst(rst), .din(din), .dout(dout));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; din = 0;
        #10 rst = 0;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #40;      // watch 1, 0, 1, 1 come out
        $finish;
    end
endmodule
