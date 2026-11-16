`timescale 1ns / 1ps
module t_ff(
    input T, clk, rst,
    output reg Q,
    output Qb
);
    assign Qb = ~Q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;     // toggle; T = 0 holds
    end
endmodule
