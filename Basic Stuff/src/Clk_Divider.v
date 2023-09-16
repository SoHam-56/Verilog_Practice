`timescale 1ns / 1ps

module Clk_Divider(
    input OG_clk
    );
    
    parameter n = 3;
    
    wire [n:0] din;
    wire [n:0] clkdiv;
     
    DFF D0 (din[0], OG_clk, rst, clkdiv[0]);
     
    genvar i;
    
    for (i = 1; i <= n; i = i + 1) begin
        DFF D (din[i], clkdiv[i-1], rst, clkdiv[i]);
    end

      
    assign din = ~clkdiv;
endmodule

module DFF(
    input D,
    input clk,
    input rst,
    output reg Q
    );
    
    always @ (posedge clk or posedge rst) begin
    if (rst)
        Q = 0;
    else
        Q = D;
    end
    
endmodule
