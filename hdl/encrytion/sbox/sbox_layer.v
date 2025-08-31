`timescale 1ns/1ps


module sbox_layer(
    input [63:0] sbl_in,
    output [63:0] sbl_out
);

sbox_bank sb3(.x(sbl_in[63:48]), .y[sbl_out[63:48]]);
sbox_bank sb2(.x(sbl_in[47:32]), .y[sbl_out[47:32]]);
sbox_bank sb1(.x(sbl_in[31:16]), .y[sbl_out[31:16]]);
sbox_bank sb0(.x(sbl_in[15:0]), .y[sbl_out[15:0]]);

endmodule
