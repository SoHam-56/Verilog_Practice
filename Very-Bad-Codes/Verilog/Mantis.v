module mantis(sum, A, B);

    input [7:0] A, B;
    output [7:0] sum;

    wire carry_out;
    wire [7:0] carry;

    genvar i;

    generate
        for(i = 0; i < 8; i = i + 1)
            begin
                if (i == 0)
                    Half_adder F (sum[0], carry[0], A[0], B[0]);
                else
                    Full_adder F (sum[i], carry[i], A[i], B[i], carry[i - 1]);
            end
        assign carry_out = carry[7];
    endgenerate

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

module floater (a);

    output integer exponent;

    input reg [0:23] a;

    integer i = 0;
    integer count = 0;

    initial begin
        //a = 24'b11101111100111;
        
        while (a[i] != 1) begin
            count = count + 1;
            i = i + 1;  
        end
        //a[count] = 0;
        exponent = 23 - count;
        #10

        $display("a = ",a);
    
        $display("Count = ",count);
        $display("Exponent = ",exponent);
        $display("a = %b",a);
    end
    
endmodule