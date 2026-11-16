`timescale 1ns / 1ps
module tff_tb;
    reg T, clk, rst;
    wire Q, Qb;

    t_ff uut(.T(T), .clk(clk), .rst(rst), .Q(Q), .Qb(Qb));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; T = 0;
        #10 rst = 0;
        T = 0; #10;        // hold   -> Q = 0
        T = 1; #10;        // toggle -> Q = 1
        T = 1; #10;        // toggle -> Q = 0
        T = 0; #10;        // hold   -> Q = 0
        T = 1; #10;        // toggle -> Q = 1
        $finish;
    end
endmodule
