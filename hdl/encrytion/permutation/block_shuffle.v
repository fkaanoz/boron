`timescale 1ns/1ps


module block_shuffle(
    input [63:0] bs_in,
    output [63:0] bs_out
);


block_shuffle_bank bsb3(.bsb_in(bs_in[63:48]), .bsb_out(bs_out[63:48]));
block_shuffle_bank bsb2(.bsb_in(bs_in[47:32]), .bsb_out(bs_out[47:32]));
block_shuffle_bank bsb1(.bsb_in(bs_in[31:16]), .bsb_out(bs_out[31:16]));
block_shuffle_bank bsb0(.bsb_in(bs_in[15:0]), .bsb_out(bs_out[15:0]));

endmodule
