`timescale 1ns/1ps


module dec_xor_operation(
    input [63:0] dec_xor_in,
    output [63:0] dec_xor_out
);

assign dec_xor_out[63:48] = xor_in[63:48] ^ xor_in[47:32];
assign dec_xor_out[47:32] = xor_in[47:32] ^ xor_in[31:16] ^ xor_in[15:0];
assign dec_xor_out[31:16] = xor_in[63:48] ^ xor_in[47:32] ^ xor_in[31:16];
assign dec_xor_out[15:0] = xor_in[31:16] ^ xor_in[15:0];



endmodule
