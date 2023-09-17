//`include "OG_Abstract_Adder.sv"

module test;

    real A, B, Sum;

    bit sign_A, sign_B, sign_Sum;
    reg [7:0] exp_A, exp_B, exp_Sum;
    reg [22:0] mantis_A, mantis_B, mantis_Sum;
    
    expo ex_a(exp_A, sign_A, A);
    expo ex_b(exp_B, sign_B, B);
    expo ex_Sum(exp_Sum, sign_Sum, Sum);

    mantissa man_a(mantis_A, exp_A, A);
    mantissa man_b(mantis_B, exp_B, B);
    mantissa man_Sum(mantis_Sum, exp_Sum, Sum);

    adder fa (Sum, A, B);
    
    initial begin

        A = 3;
        B = -10;

        #15

        $display("A = ", A);
        $display("Sign_A = ", sign_A);
        $display("Exponent of A = ", exp_A);
        $display("Mantissa of A = %b", mantis_A);

        $display(" ");
        $display("B = ", B);
        $display("Sign_B = ", sign_B);
        $display("Exponent of B = ", exp_B);
        $display("Mantissa of B = %b", mantis_B);

        $display(" ");
        $display("Sign_Sum = ", sign_Sum);
        $display("Exponent of Sum = ", exp_Sum);
        $display("Mantissa of Sum = %b", mantis_Sum);

    end
    
endmodule