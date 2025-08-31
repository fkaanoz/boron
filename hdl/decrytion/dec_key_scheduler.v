`timescale 1ns/1ps


module dec_key_scheduler(
    input [4:0] round_counter,
    input [79:0] KEY,
    output [79:0] PREV_KEY
);


wire [3:0] temp1;
dec_sbox s0(.x(KEY[3:0]), .y(temp1));


wire [4:0] temp2;
assign temp2 = KEY[63:59] ^ round_counter;


assign PREV_KEY = {KEY[12:4], temp1, KEY[79:64], temp2, KEY[58:13] };

endmodule
