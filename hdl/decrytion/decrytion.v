`timescale 1ns/1ps


module decrytion(
    input clk,
    input reset,           // active HIGH reset assumed
    input [63:0] cipher_text,
    input [79:0] master_key,
    input dec_start,      // 1-clock high signal to start to dec

    output reg [63:0] plain_text,
    output reg dec_done
);


reg [4:0] round_counter;    // up to 25, then go back
reg [63:0] current_cipher;
reg [63:0] current_plain_text;
reg [79:0] current_key;

reg [79:0] next_key;
reg [79:0] prev_key;


reg [1:0] STATE;

localparam [1:0] IDLE = 2'b00;
localparam [1:0] FORWARD = 2'b01;
localparam [1:0] BACKWARD = 2'b10;
localparam [1:0] FINAL = 2'b11;


// vars for combinational logic
wire [63:0] rw_xor_in;
wire [63:0] rw_xor_out;

wire [63:0] rw_rp_out;
wire [63:0] rw_bs_out;
wire [63:0] rw_sbox_out;


// combinational logic
enc_key_scheduler enc_ks(.round_counter(round_counter), .KEY(current_key), .NEXT_KEY(next_key));
dec_key_scheduler dec_ks(.round_counter(round_counter), .KEY(current_key), .PREV_KEY(prev_key));

assign rw_xor_in = (round_counter == 5'd25 ? cipher ^ current_key : current_plain_text);


dec_xor_operation dec_xop(.dec_xor_in(rw_xor_in), .dec_xor_out(rw_xor_out));
dec_round_permutation dec_rp(.dec_rp_in(rw_xor_out), .dec_rp_out(rw_rp_out));
dec_block_shuffle dec_bs(.dec_bs_in(rw_rp_out), .dec_bs_out(rw_bs_out));

dec_sbox_layer dec_sbox(.dec_sbl_in(rw_bs_out), .dec_sbl_out(rw_sbox_out)); 

assign current_plain_text = rw_sbox_out ^ current_key;


always @(posedge clk) begin
    if(reset == 1'b1) begin
        STATE <= IDLE;
        current_cipher <= cipher_text;
        current_key <= master_key;
        round_counter <= 0;
    end else begin

        case(STATE)
            IDLE: begin
                current_cipher <= cipher_text;
                current_key <= master_key;
                round_counter <= 0;
                dec_done <= 0;
                if(dec_start == 1'b1) begin
                    STATE <= FORWARD;
                end
            end


            // while key scheduler going back
            FORWARD: begin
                round_counter <= round_counter + 1;
                current_key <= next_key;

                if(round_counter == 5'd25) begin
                    STATE <= BACKWARD;          // at that point, proper key is achieved.
                    current_cipher <= cipher_text;
                end
            end



            // while key scheduler going back
            BACKWARD: begin
                round_counter <= round_counter - 1;
                current_key <= prev_key;
                
                if(round_counter == 5'd0) begin
                    STATE <= FINAL;
                    plain_text <= current_plain_text;
                end
            end


            FINAL: begin
                dec_done <= 1'b1;
                STATE <= IDLE;
                plain_text <= current_cipher;           // done => cipher is plain text at that step 
            end

        endcase

    end
end

endmodule
