`timescale 1ns / 1ps

module mac #(parameter len = 31)(
    input [len:0] A_LHS,
    input [len:0] A_RHS,
    input [len:0] B_LHS,
    input [len:0] B_RHS,
    input clk,
    input S,
    output [len:0] Out
    );
    
    wire [len:0] temp1, temp2, temp3, temp4;
    reg [len:0] out1, out2;
    reg [len:0] reg1, reg2;
    reg [len:0] accum;
    
    assign temp1 = out1;
    assign temp2 = out2;
    assign temp3 = reg1;
    assign temp4 = reg2;
    
    floatConvert F1 (A_LHS, A_RHS, clk, temp1);
    floatConvert F2 (B_LHS, B_RHS, clk, temp2);
    
    multiply M (out1, out2, clk, temp3);
    
    Add A (reg1, Out, clk, temp4);
    mux H (Out, reg2, S, clk, Out);
    
endmodule
