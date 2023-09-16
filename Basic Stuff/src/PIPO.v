`timescale 1ns / 1ps

module PIPO(
    input [3:0] Din,
    input clk, 
    input rst,
    input en,
    output [3:0]Dout
    );
    
    genvar i;
    for(i = 0; i < 4; i = i + 1) begin
        DFF D(Din[i], clk, en, rst, Dout[i]);
    end
    
endmodule

module DFF(
    input D,
    input clk,
    input en,
    input rst,
    output reg Q
    );
    
    always @ (posedge clk or posedge rst) begin
    if (rst)
      Q = 0;
    else
      if (en)
        Q = D;
  end
    
endmodule
