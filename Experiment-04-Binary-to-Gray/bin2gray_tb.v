`timescale 1ns / 1ps
module bin2gray_tb;
    reg [3:0] B;
    wire [3:0] G;
    integer i;

    bin2gray uut(.B(B), .G(G));

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            B = i; #10;   // all 16 inputs, one every 10 ns
        end
        $finish;
    end
endmodule
