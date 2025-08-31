`timescale 1ns/1ps


module dec_block_shuffle(
    input [63:0] dec_bs_in,
    output [63:0] dec_bs_out
);

dec_block_shuffle_bank bsb3(.dec_bsb_in(dec_bs_in[63:48]), .dec_bsb_out(dec_bs_out[63:48]));
dec_block_shuffle_bank bsb2(.dec_bsb_in(dec_bs_in[47:32]), .dec_bsb_out(dec_bs_out[47:32]));
dec_block_shuffle_bank bsb1(.dec_bsb_in(dec_bs_in[31:16]), .dec_bsb_out(dec_bs_out[31:16]));
dec_block_shuffle_bank bsb0(.dec_bsb_in(dec_bs_in[15:0]), .dec_bsb_out(dec_bs_out[15:0]));


endmodule
