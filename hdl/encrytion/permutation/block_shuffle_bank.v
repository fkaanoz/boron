`timescale 1ns/1ps


module block_shuffle_bank(
    input [15:0] bsb_in,
    output [15:0] bsb_out
);


assign bsb_out[15:12] = bsb_in[7:4];
assign bsb_out[11:8] = bsb_in[3:0];
assign bsb_out[7:4] = bsb_in[15:12];
assign bsb_out[3:0] = bsb_in[11:8];


endmodule
