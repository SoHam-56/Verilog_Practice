`timescale 1ns / 1ps

module PIPO_TB(
    input [3:0] Din,
    output [3:0] Dout,
    input en
    );
    
    reg clk;
    reg rst;
    
    PIPO uut (Din, clk, rst, en, Dout);
    
    always #5 clk = ~clk;
    
    initial begin
    
        rst <= 0;
        clk <= 0;

        #10
        Din = 'b1010;
        
    end
    
endmodule