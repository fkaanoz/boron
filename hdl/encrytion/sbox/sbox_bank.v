`timescale 1ns/1ps


module sbox_bank(
    input [15:0] x,
    output [15:0] y
);

sbox s3(.x(x[15:12]), .y(y[15:12]));
sbox s2(.x(x[11:8]), .y(y[11:8]));
sbox s1(.x(x[7:4]), .y(y[7:4]));
sbox s0(.x(x[3:0]), .y(y[3:0]));

endmodule
