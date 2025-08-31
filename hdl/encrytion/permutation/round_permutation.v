`timescale 1ns/1ps


module round_permutation(
    input [63:0] rp_in,
    output [63:0] rp_out
);


// circular left shift by 9
assign rp_out[63:48] = {rp_in[54:48], rp_in[63:55]};


// circular left shift by 7
assign rp_out[47:32] = {rp_in[40:32], rp_in[47:41]};


// circular left shift by 4
assign rp_out[31:16] = {rp_in[27:16], rp_in[31:28]};


// circular left shift by 1
assign rp_out[15:0] = {rp_in[14:0], rp_in[15]};



endmodule
