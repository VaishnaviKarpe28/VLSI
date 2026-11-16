`timescale 1ns / 1ps
module alu_carry_tb;
    reg [3:0] A, B;
    reg [2:0] sel;
    wire [3:0] Y;
    wire C;

    alu_carry uut(.A(A), .B(B), .sel(sel), .Y(Y), .C(C));

    initial begin
        A = 4'b1011; B = 4'b0110;   // A=11, B=6
        sel = 3'b000; #10;   // ADD   -> Y=0001, C=1
        sel = 3'b001; #10;   // SUB   -> Y=0101
        sel = 3'b010; #10;   // AND   -> Y=0010
        sel = 3'b011; #10;   // OR    -> Y=1111
        sel = 3'b100; #10;   // NOT A -> Y=0100
        sel = 3'b101; #10;   // XOR   -> Y=1101
        sel = 3'b110; #10;   // A<<1 -> Y=0110
        sel = 3'b111; #10;   // B>>1 -> Y=0011
        $finish;
    end
endmodule
