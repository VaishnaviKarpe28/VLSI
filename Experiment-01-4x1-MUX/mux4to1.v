`timescale 1ns / 1ps
module mux4to1(
    input I0, I1, I2, I3,
    input S1, S0,
    output Y
);
    wire a, b;

    mux2to1 m1(.A(I0), .B(I1), .S(S0), .Y(a));
    mux2to1 m2(.A(I2), .B(I3), .S(S0), .Y(b));
    mux2to1 m3(.A(a), .B(b), .S(S1), .Y(Y));
endmodule
