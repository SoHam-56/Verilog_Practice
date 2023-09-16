`timescale 1ns / 1ps

module Serial_Adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    
    
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

module shift(
    input [3:0] data,
    input clk,
    input en,
    input rst,
    output reg out
    );
    
    reg [3:0] memory;
    
    
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
