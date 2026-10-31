module Shift_Register(
    input clk,
    input reset,
    input serial_in,
    output reg [3:0] Q,
    output serial_out
);

assign serial_out = Q[3];

always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 4'b0000;
    else
        Q <= {Q[2:0], serial_in};
end

endmodule
module Shift_Register_tb;

reg clk, reset, serial_in;
wire [3:0] Q;
wire serial_out;

Shift_Register uut(
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .Q(Q),
    .serial_out(serial_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    serial_in = 0;

    #12;
    reset = 0;

    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;
    serial_in = 0; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t serial_in=%b Q=%b serial_out=%b",
              $time, serial_in, Q, serial_out);
end

endmodule
