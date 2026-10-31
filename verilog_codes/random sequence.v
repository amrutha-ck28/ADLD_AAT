module Random_Sequence_Generator(
    input clk,
    input reset,
    output reg [3:0] Q
);

wire feedback;

assign feedback = Q[3] ^ Q[0];

always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 4'b0001;
    else
        Q <= {Q[2:0], feedback};
end

endmodule
module Random_Sequence_Generator_tb;

reg clk, reset;
wire [3:0] Q;

Random_Sequence_Generator uut(
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #12;
    reset = 0;

    repeat (16) #10;

    $finish;
end

initial begin
    $monitor("Time=%0t Q=%b", $time, Q);
end

endmodule
