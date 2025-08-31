`timescale 1ns/1ps


module dec_block_shuffle_bank(
    input [15:0] dec_bsb_in,
    output [15:0] dec_bsb_out
);


assign dec_bsb_out[3] = dec_bsb_in[1];
assign dec_bsb_out[2] = dec_bsb_in[0];
assign dec_bsb_out[1] = dec_bsb_in[3];
assign dec_bsb_out[0] = dec_bsb_in[2];


endmodule
