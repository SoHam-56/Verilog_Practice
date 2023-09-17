module exponent(sum, carry_out, A, B);

    input [7:0] A, B;
    output [7:0] sum;
    output carry_out;

    inout [6:0] carry;
    
    Half_adder F0 (sum[0], carry[0], A[0], B[0]);
    Full_adder F1 (sum[1], carry[1], A[1], B[1], carry[0]);
    Full_adder F2 (sum[2], carry[2], A[2], B[2], carry[1]);
    Full_adder F3 (sum[3], carry[3], A[3], B[3], carry[2]);
    Full_adder F4 (sum[4], carry[4], A[4], B[4], carry[3]);
    Full_adder F5 (sum[5], carry[5], A[5], B[5], carry[4]);
    Full_adder F6 (sum[6], carry[6], A[6], B[6], carry[5]);
    Full_adder F7 (sum[7], carry_out, A[7], B[7], carry[0]);
endmodule

module Full_adder (sum, C_out, A, B, C_in);

    input A, B, C_in;
    output sum, C_out;

    wire N1, N2, N3;

    xor(N1, A, B);
    and(N2, A, B);
    xor(sum, N1, C_in);
    and(N3, C_in, N1);
    or(C_out, N3, N2);

endmodule

module Half_adder (sum, C_out, A, B);

    input A, B;
    output sum, C_out;

    xor(sum, A, B);
    and(C_out, A, B);

endmodule