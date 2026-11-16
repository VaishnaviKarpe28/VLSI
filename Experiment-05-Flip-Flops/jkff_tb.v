`timescale 1ns / 1ps
module jkff_tb;
    reg J, K, clk, rst;
    wire Q, Qb;

    jk_ff uut(.J(J), .K(K), .clk(clk), .rst(rst), .Q(Q), .Qb(Qb));

    always #5 clk = ~clk;                         // 10 ns clock

    initial begin
        clk = 0; rst = 1; J = 0; K = 0;
        #10 rst = 0;
        J = 0; K = 0; #10;         // hold   -> Q = 0
        J = 1; K = 0; #10;         // set    -> Q = 1
        J = 0; K = 1; #10;         // reset -> Q = 0
        J = 1; K = 1; #10;         // toggle -> Q = 1
        J = 1; K = 1; #10;         // toggle -> Q = 0
        $finish;
    end
endmodule
