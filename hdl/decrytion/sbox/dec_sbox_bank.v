`timescale 1ns/1ps


module dec_sbox_bank(
    input [15:0] x,
    output [15:0] y
);

dec_sbox ds3(.x(x[15:12]), .y(y[15:12]));
dec_sbox ds2(.x(x[11:8]), .y(y[11:8]));
dec_sbox ds1(.x(x[7:4]), .y(y[7:4]));
dec_sbox ds0(.x(x[3:0]), .y(y[3:0]));

endmodule
