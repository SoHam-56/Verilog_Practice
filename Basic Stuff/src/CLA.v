`timescale 1ns / 1ps

module CLA(
    input [4:1] A,
    input [4:1] B,
    input [4:0] Cin,
    output [4:1] Sum,
    output Cout
    );
    
    wire [4:1] prop, gen;
    
    assign gen = A&B;
    assign prop = A^B;
    genvar i;
    
//    assign Cin[0] = 0;
    for (i = 1; i <= 4; i = i + 1) begin
        assign Cin[i] = gen[i] | prop[i]&Cin[i - 1];
        assign Sum[i] = prop[i]^Cin[i];
    end
    
    assign Cout = Cin[3];
    
endmodule
