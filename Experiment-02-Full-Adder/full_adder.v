`timescale 1ns / 1ps
module full_adder(
    input A, B, Cin,
    output Sum, Cout
);
    wire s1, c1, c2;

    half_adder ha1(.A(A), .B(B),    .S(s1), .C(c1));
    half_adder ha2(.A(s1), .B(Cin), .S(Sum), .C(c2));

    assign Cout = c1 | c2;
endmodule
