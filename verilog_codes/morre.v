module Moore_FSM(
    input clk,
    input reset,
    input x,
    output reg z
);

reg [1:0] state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else begin
        case(state)
            S0: state <= x ? S1 : S0;
            S1: state <= x ? S1 : S2;
            S2: state <= x ? S3 : S0;
            S3: state <= x ? S1 : S2;
            default: state <= S0;
        endcase
    end
end

always @(*) begin
    z = (state == S3);
end

endmodule
module Moore_FSM_tb;

reg clk, reset, x;
wire z;

Moore_FSM uut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .z(z)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    x = 0;

    #12;
    reset = 0;

    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t x=%b z=%b",
              $time, x, z);
end

endmodule
