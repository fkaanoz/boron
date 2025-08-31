`timescale 1ns/1ps


module dec_sbox_layer(
    input [63:0] dec_sbl_in,
    output [63:0] dec_sbl_out
);


dec_sbox_bank dsb3(.x(sbl_in[63:48]), .y[sbl_out[63:48]]);
dec_sbox_bank dsb2(.x(sbl_in[47:32]), .y[sbl_out[47:32]]);
dec_sbox_bank dsb1(.x(sbl_in[31:16]), .y[sbl_out[31:16]]);
dec_sbox_bank dsb0(.x(sbl_in[15:0]), .y[sbl_out[15:0]]);



endmodule
