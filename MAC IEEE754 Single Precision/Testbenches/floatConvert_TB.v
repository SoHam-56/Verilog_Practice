`timescale 1s / 1ms

module testbench;
    reg [31:0] A;
    reg [31:0] B;
    reg clk;
    wire [31:0] out;
    
    multiply trial(A, B, clk, out);
    
    always #1 clk = ~clk;

    initial begin
        
        clk = 0;
        A = 'd1; //1
        B = 'd5; //5
        
    end
    
    initial begin
        
        #10
        $monitor ("data=%b, out=%b", A, out);
        
        $display(" ");
        $display("Sign_A = ", A[31]);
        $display("Exponent of A = ", A[30:23]);
        $display("Mantissa of A = %b", A[22:0]);

        $display(" ");
        $display("Sign_B = ", B[31]);
        $display("Exponent of B = ", B[30:23]);
        $display("Mantissa of B = %b", B[22:0]);

        $display(" ");
        $display("Sign_Sum = ", out[30:23]);
        $display("Exponent of Sum = ", out[30:23]);
        $display("Mantissa of Sum = %b", out[22:0]);


    end
    
endmodule