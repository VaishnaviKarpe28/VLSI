`timescale 1ns / 1ps
module mux2to1(
    input A, B, S,
    output Y
);
    assign Y = S ? B : A;                       // S=0 -> A, S=1 -> B
endmodule
