module testbench;
    reg [31:0] A;
    reg [31:0] B;
    reg clk;
    reg [31:0] out;
    
    Add trial(A, B, clk, out);
    
    always #1 clk = ~clk;
    
//    real A, B;

//    bit sign_A, sign_B, sign_Sum;
//    reg [7:0] exp_A, exp_B, exp_Sum;
//    reg [22:0] mantis_A, mantis_B;
//    reg [22:0] mantis_Sum;
    
//    expo ex_a(exp_A, sign_A, A);
//    expo ex_b(exp_B, sign_B, B);

//    mantissa man_a(mantis_A, exp_A, A);
//    mantissa man_b(mantis_B, exp_B, B);

//    adder fa (mantis_Sum, exp_Sum, sign_Sum, sign_A, sign_B, exp_A, exp_B, mantis_A, mantis_B, A, B);

    initial begin
        
        clk = 0;
        A = 'd1; //1
        B = 'd5; //5
        out = 0;
    end
    
    initial begin
        $monitor ("data=%b, out=%b", A, out);
        
        #9
        $display(" ");
        $display("Sign_A = ", A[31]);
        $display("Exponent of A = ", A[30:23]);
        $display("Mantissa of A = %b", A[22:0]);

        $display(" ");
        $display("Sign_B = ", B[31]);
        $display("Exponent of B = ", B[30:23]);
        $display("Mantissa of B = %b", A[22:0]);

        $display(" ");
        $display("Sign_Sum = ", out[30:23]);
        $display("Exponent of Sum = ", out[30:23]);
        $display("Mantissa of Sum = %b", out[22:0]);
        
        

//        A = 3;
//        B = -10;
        
        

//        $display(" ");
//        $display("Sign_A = ", sign_A);
//        $display("Exponent of A = ", exp_A);
//        $display("Mantissa of A = %b", mantis_A);

//        $display(" ");
//        $display("Sign_B = ", sign_B);
//        $display("Exponent of B = ", exp_B);
//        $display("Mantissa of B = %b", mantis_B);

//        $display(" ");
//        $display("Sign_Sum = ", sign_Sum);
//        $display("Exponent of Sum = ", exp_Sum);
//        $display("Mantissa of Sum = %b", mantis_Sum);

    end
    
endmodule