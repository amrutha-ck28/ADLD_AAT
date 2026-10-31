module Barrel_Shifter(
    input [3:0] A,
    input [1:0] shift,
    input dir,
    output reg [3:0] Y
);

always @(*) begin
    if (dir == 1'b0)
        Y = A >> shift;
    else
        Y = A << shift;
end

endmodule
module Barrel_Shifter_tb;

reg [3:0] A;
reg [1:0] shift;
reg dir;
wire [3:0] Y;

Barrel_Shifter uut(
    .A(A),
    .shift(shift),
    .dir(dir),
    .Y(Y)
);

initial begin
    A = 4'b1011;

    dir = 0;
    shift = 1; #10;
    shift = 2; #10;

    dir = 1;
    shift = 1; #10;
    shift = 2; #10;

    $finish;
end

initial begin
    $monitor("A=%b dir=%b shift=%d Y=%b",
              A, dir, shift, Y);
end

endmodule
