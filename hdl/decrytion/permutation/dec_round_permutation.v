`timescale 1ns/1ps


module dec_round_permutation(
    input [63:0] dec_rp_in,
    output [63:0] dec_rp_out
);



// circular right shift by 9
assign dec_rp_out[63:48] = {dec_rp_in[56:48], dec_rp_in[63:57]};


// circular right shift by 7
assign dec_rp_out[47:32] = {dec_rp_in[38:32], dec_rp_in[47:39]};


// circular right shift by 4
assign dec_rp_out[31:16] = {dec_rp_in[19:16], dec_rp_in[31:20]};


// circular right shift by 1
assign dec_rp_out[15:0] = {dec_rp_in[0], dec_rp_in[15:1]};


endmodule
