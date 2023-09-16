`timescale 1ns / 1ps

module Parallel_Adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
    );
    
    genvar i;
    wire [3:0] c;
    
    for(i = 0; i < 4; i = i + 1) begin
        if (i == 0)
            Full_Adder F (A[i], B[i], Cin, Sum[i], c[i]);
        else
            Full_Adder F (A[i], B[i], c[i - 1], Sum[i], c[i]);
    end
    assign Cout = c[3];
    
endmodule


module Full_Adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    
    assign Sum = A ^ B;
    assign Cout = (A&B) | ((A^B)&Cin);
endmodule
