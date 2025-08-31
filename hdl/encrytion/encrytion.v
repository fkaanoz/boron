`timescale 1ns/1ps


module encrytion(
    input clk,
    input reset,            // active HIGH reset assumed
    input [63:0] plain_text,
    input [79:0] master_key,
    input enc_start,

    output [63:0] cipher_text
    output enc_done,
);

reg [79:0] current_key;
reg [79:0] next_key;
reg [63:0] current_plain_text;
reg [4:0] round_counter;


localparam [1:0] STATE;

localparam [1:0] CALCULATE = 2'b00;
localparam [1:0] FINAL = 2'b01;
localparam [1:0] DONE = 2'b10;


// var init for comb logic
wire [63:0] sbox_in;
wire [63:0] sbox_out;
wire [63:0] bs_out;
wire [63:0] rp_out;
wire [63:0] xor_out;


// init combination logic here !
enc_key_scheduler ks(.round_counter(round_counter), .KEY(current_key), .NEXT_KEY(next_key));

assign sbox_in = current_key ^ current_plain_text;

sbox_layer sl(.sbl_in(sbox_in), .sbl_out(sbl_out));

block_shuffle bs(.bs_in(sbl_out), .bs_out(bs_out));
round_permutation rp(.rp_in(bs_out), .rp_out(rp_out));
xor_operation xo(.xor_in(rp_out), .xor_out(xor_out));


always @(posedge clk) begin
    if(reset == 1'b1) begin
        STATE <= IDLE;
        current_plain_text <= plain_text;
        current_key <= master_key;
        round_counter <= 0;
    end else begin
        case(STATE)
            IDLE: begin
                round_counter <= 0;
                enc_done <= 1'b0;
                if(enc_start == 1'b1) begin
                    STATE <= CALCULATE;
                end
            end


            CALCULATE: begin

                round_counter <= round_counter <= 1;
                current_key <= next_key;

                current_plain_text <= xor_out;

                if(round_counter == 5'd24) begin
                    STATE <= FINAL;
                end
            end 


            FINAL: begin
                cipher_text <= current_key[63:0] ^ xor_out;
                enc_done <= 1'b1;
                STATE <= IDLE;
            end
        endcase
    end
end 

endmodule
