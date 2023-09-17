module adder(sum, A, B);

    output real sum;
    
    input real A, B;

    reg [23:0] temp_sum;
    reg [23:0] Num_A, Num_B;
    
    wire carry_out;
    wire [23:0] carry;

    genvar i;

    assign Num_A[23:0] = A;
    assign Num_B[23:0] = B;
    

    // initial begin
    //     #15
    //     $display("Input A = %b", A);
    //     $display("Input B = %b", B);

    //     $display("Num_A = %b", Num_A);
    //     $display("Num_B = %b", Num_B);

    //     $display("Temp_Sum = %b", temp_sum);
    // end

    generate
        for(i = 0; i < 24; i = i + 1)
            begin
                if (i == 0)
                    Half_adder F (temp_sum[0], carry[0], Num_A[0], Num_B[0]);
                else
                    Full_adder F (temp_sum[i], carry[i], Num_A[i], Num_B[i], carry[i - 1]);
            end
        assign carry_out = carry[23];
    endgenerate

    assign sum = temp_sum;

endmodule

module expo (exponent, sign, a);

    output reg [7:0] exponent;
    output bit sign;
    input real a;

    integer i = 22;
    integer count = 0;

    reg [23:0] temp;
    
    initial begin
        #5
        temp = a;
        
        if (temp[23] == 1) begin
            temp = - a;
            sign = 1;
            while (temp[i] != 1) begin
                count = count + 1;
                i = i - 1;
            end 
        end
        
        else begin
            sign = 0;
            while (temp[i] != 1) begin
                count = count + 1;
                i = i - 1;  
            end
        end
        
        exponent = (a == 0)?1'b0:((22 - count) + 127);
    end
    
endmodule

module mantissa (mantis, exponent, a);
    
    output reg [22:0] mantis;
    input [7:0] exponent;
    input real a;

    int i;
    integer count;
    reg [23:0] temp;
    reg [22:0] temp_man;

    initial begin
        #10
        temp = a;
        temp_man = 0;
        
        count = (22+127 + 1) - exponent;

        if (temp[23] == 0) begin
            temp_man = temp[22:0];
            mantis = temp_man * (2**(count));
        end
        
        else begin

            temp = -temp;
            temp_man = temp[22:0];
            mantis = temp_man * (2**(count));
        
        end
    end

endmodule

module Full_adder (sum, C_out, A, B, C_in);

    output sum, C_out;
    input A, B, C_in;

    wire N1, N2, N3;

    xor(N1, A, B);
    and(N2, A, B);
    xor(sum, N1, C_in);
    and(N3, C_in, N1);
    or(C_out, N3, N2);

endmodule

module Half_adder (sum, C_out, A, B);

    output sum, C_out;
    input A, B;

    xor(sum, A, B);
    and(C_out, A, B);

endmodule