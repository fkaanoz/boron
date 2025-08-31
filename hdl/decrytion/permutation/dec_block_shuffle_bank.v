`timescale 1ns/1ps


module dec_block_shuffle_bank(
    input [15:0] dec_bsb_in,
    output [15:0] dec_bsb_out
);


assign dec_bsb_out[15:12] = dec_bsb_in[7:4];
assign dec_bsb_out[11:8] = dec_bsb_in[3:0];
assign dec_bsb_out[7:4] = dec_bsb_in[15:12];
assign dec_bsb_out[3:0] = dec_bsb_in[11:8];


endmodule
