module Parity(
    input [3:0] D,
    input P_in,
    output P_gen,
    output error
);

assign P_gen = ^D;
assign error = ^{D, P_in};

endmodule
module Parity_tb;

reg [3:0] D;
reg P_in;
wire P_gen, error;

Parity uut(
    .D(D),
    .P_in(P_in),
    .P_gen(P_gen),
    .error(error)
);

initial begin
    D = 4'b1010;
    P_in = 1'b0; #10;

    D = 4'b1010;
    P_in = 1'b1; #10;

    D = 4'b1110;
    P_in = 1'b0; #10;

    D = 4'b1110;
    P_in = 1'b1; #10;

    $finish;
end

initial begin
    $monitor("D=%b P_in=%b P_gen=%b error=%b",
              D, P_in, P_gen, error);
end

endmodule
