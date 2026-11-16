`timescale 1ns / 1ps
module siso(
    input clk, rst, din,
    output dout
);
    reg [3:0] q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else
            q <= {q[2:0], din};    // shift, new bit enters
    end

    assign dout = q[3];                              // last bit comes out
endmodule
