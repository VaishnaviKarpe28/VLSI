`timescale 1ns / 1ps
module jk_ff(
    input J, K, clk, rst,
    output reg Q,
    output Qb
);
    assign Qb = ~Q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;       // hold
                2'b01: Q <= 1'b0;    // reset
                2'b10: Q <= 1'b1;    // set
                2'b11: Q <= ~Q;      // toggle
            endcase
        end
    end
endmodule
