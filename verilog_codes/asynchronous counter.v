module Asynchronous_Counter(
    input clk,
    input reset,
    output reg [3:0] Q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        Q[0] <= 1'b0;
    else
        Q[0] <= ~Q[0];
end

always @(negedge Q[0] or posedge reset) begin
    if (reset)
        Q[1] <= 1'b0;
    else
        Q[1] <= ~Q[1];
end

always @(negedge Q[1] or posedge reset) begin
    if (reset)
        Q[2] <= 1'b0;
    else
        Q[2] <= ~Q[2];
end

always @(negedge Q[2] or posedge reset) begin
    if (reset)
        Q[3] <= 1'b0;
    else
        Q[3] <= ~Q[3];
end

endmodule
module Asynchronous_Counter_tb;

reg clk, reset;
wire [3:0] Q;

Asynchronous_Counter uut(
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

    repeat (18) #10;

    $finish;
end

initial begin
    $monitor("Time=%0t Q=%b", $time, Q);
end

endmodule
