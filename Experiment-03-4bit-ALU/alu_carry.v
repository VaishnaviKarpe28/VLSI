`timescale 1ns / 1ps
module alu_carry(
    input [3:0] A, B,
    input [2:0] sel,
    output reg [3:0] Y,
    output reg C
);
    reg [4:0] temp;

    always @(*) begin
        Y = 4'b0000; C = 1'b0; temp = 5'b00000;
        case (sel)
            3'b000: begin temp = A + B; Y = temp[3:0]; C = temp[4]; end
            3'b001: Y = A - B;
            3'b010: Y = A & B;
            3'b011: Y = A | B;
            3'b100: Y = ~A;
            3'b101: Y = A ^ B;
            3'b110: Y = A << 1;
            3'b111: Y = B >> 1;
            default: Y = 4'b0000;
        endcase
    end
endmodule
