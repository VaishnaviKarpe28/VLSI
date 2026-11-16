`timescale 1ns / 1ps
module half_adder(
    input A, B,
    output S, C
);
    assign S = A ^ B;                         // Sum   = XOR
    assign C = A & B;                         // Carry = AND
endmodule
