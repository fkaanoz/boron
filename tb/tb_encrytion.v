`timescale 1ns/1ps

module tb_encrytion();

reg clk_tb;

initial begin 
    forever begin
        clk_tb = 0;
        #10 clk_tb = ~clk_tb;
     end 
end



reg reset_tb;
reg [63:0] plain_text_tb;
reg [79:0] master_key_tb;
reg enc_start;

wire [63:0] cipher_text;
wire enc_done;


encrytion enc(
    .clk(clk_tb),
    .reset(reset_tb),
    .plain_text(plain_text_tb),
    .master_key(master_key_tb),
    .enc_start(enc_start_tb),
    .cipher_text(cipher_text_tb),
    .enc_done(enc_done_tb)
);


initial begin
    #30 reset_tb <= 1'b1; plain_text_tb <= 64'b0; master_key_tb <= 80'b0;
    #50 reset_tb <= 1'b0;

    #4000;
end


endmodule
