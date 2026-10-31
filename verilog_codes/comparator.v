module Comparator(
    input [3:0] A, B,
    output GT, EQ, LT
);

assign GT = (A > B);
assign EQ = (A == B);
assign LT = (A < B);

endmodule
module Comparator_tb;

reg [3:0] A, B;
wire GT, EQ, LT;

Comparator uut(
    .A(A),
    .B(B),
    .GT(GT),
    .EQ(EQ),
    .LT(LT)
);

initial begin
    A = 9; B = 5; #10;
    A = 4; B = 4; #10;
    A = 2; B = 7; #10;

    $finish;
end

initial begin
    $monitor("A=%d B=%d GT=%b EQ=%b LT=%b",
              A, B, GT, EQ, LT);
end

endmodule
