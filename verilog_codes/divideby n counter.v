module Divide_By_N #(
    parameter N = 10
)(
    input clk,
    input reset,
    output reg clk_out
);

integer count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
        clk_out <= 0;
    end
    else if (count == (N/2)-1) begin
        count <= 0;
        clk_out <= ~clk_out;
    end
    else begin
        count <= count + 1;
    end
end
module Divide_By_N_tb;

reg clk, reset;
wire clk_out;

Divide_By_N #(.N(10)) uut(
    .clk(clk),
    .reset(reset),
    .clk_out(clk_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #12;
    reset = 0;

    #220;
    $finish;
end

initial begin
    $monitor("Time=%0t clk=%b clk_out=%b",
              $time, clk, clk_out);
end

endmodule

endmodule
