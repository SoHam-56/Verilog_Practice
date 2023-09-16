`timescale 1ns/1ps

module TB;
    
    parameter len = 31;
    reg [len:0] A, B, C, D;
    reg S;
    reg clk;
    wire [len:0] accum;

    mac uut1 (A, B, C, D, clk, S, accum);
    
//    floatConvert uut1 (A, B, clk, out1);
//    floatConvert uut2 (C, D, clk, out2);
    
//    multiply uut3 (out1, out2, clk, accum);
    
//    Add uut5 (reg1, accum, clk, reg2);
    
//    mux uut6 (accum, reg2, S, clk, accum); 
   
    always #5 clk = ~clk;
    
    initial begin
//        clk = 0;
//        A = 0;
//        B = 0;
//        C = 0;
//        D = 0;
//        S = 0;
        
//        #2 A = 3; 
//        #3 B = 0;
        
//        #2 C = -100; 
//        #3 D = 0;
        
//        #17 $display("Answers: %b, %b, %b", out1, out2, accum);

     
       #2 A = 3; 
       #3 B = 1415927;
       
       #2 C = 100; 
       #3 D = 1;
       #16 $display("Answers: %b", accum);
       
       #5 S = 1;
       #16 $display("Answers: %b", accum);
       #2 S = 0;
       
       $display(" ");
       
       #2 A = 10; 
       #3 B = 1415927;
       
       #2 C = 300; 
       #3 D = 1;
       #16 $display("Answers: %b", accum);
       
       #16 $display("Answers: %b", accum);
       
       #15 $finish;
        
    end
    
endmodule
