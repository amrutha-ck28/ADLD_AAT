module Ring_Counter(
    input clk,
    input reset,
    output reg [3:0] Q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 4'b0001;
    else
        Q <= {Q[2:0], Q[3]};
end

endmodule
module Ring_Counter_tb;

reg clk, reset;
wire [3:0] Q;

Ring_Counter uut(
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

    repeat (8) #10;

    $finish;
end

initial begin
    $monitor("Time=%0t Q=%b", $time, Q);
end

endmodule
