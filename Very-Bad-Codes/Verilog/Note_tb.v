`timescale 1ns / 1ns
//`include "Note.v"

module Note_tb;

reg A;
wire B;

hello uut(A, B);

initial begin

    $dumpfile("Note_tb.vcd");
    $dumpvars(0, Note_tb);

    A = 0;
    #20;
    
    A = 1;
    #20;

    A = 0;
    #20;

    $display("Test Completed");
end

endmodule