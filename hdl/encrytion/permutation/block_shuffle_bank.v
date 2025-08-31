`timescale 1ns/1ps


module block_shuffle_bank(
    input [15:0] bsb_in,
    output [15:0] bsb_out
);


assign bsb_out[3] = bsb_in[1];
assign bsb_out[2] = bsb_in[0];
assign bsb_out[1] = bsb_in[3];
assign bsb_out[0] = bsb_in[2];


endmodule
