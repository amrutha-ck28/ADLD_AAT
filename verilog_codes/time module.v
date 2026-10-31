module Timer #(
    parameter N = 9
)(
    input clk,
    input reset,
    output reg done
);

reg [31:0] count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
        done <= 0;
    end
    else if (count == N) begin
        count <= 0;
        done <= 1;
    end
    else begin
        count <= count + 1;
        done <= 0;
    end
end

endmodule
module Timer_tb;

reg clk, reset;
wire done;

Timer #(.N(4)) uut(
    .clk(clk),
    .reset(reset),
    .done(done)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #12;
    reset = 0;

    #120;
    $finish;
end

initial begin
    $monitor("Time=%0t reset=%b done=%b",
              $time, reset, done);
end

endmodule
