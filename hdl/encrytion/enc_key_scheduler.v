`timescale 1ns/1ps


module enc_key_scheduler(
    input [4:0] round_counter,
    input [79:0] KEY,
    output [79:0] NEXT_KEY
);

wire [3:0] temp1;
sbox s0(.x(KEY[70:67]), .y(temp1));

wire [4:0] temp2;
assign temp2 = KEY[50:46] ^ round_counter;

assign NEXT_KEY = {KEY[66:51], temp2, KEY[45:0], KEY[79:71], temp1};


endmodule
