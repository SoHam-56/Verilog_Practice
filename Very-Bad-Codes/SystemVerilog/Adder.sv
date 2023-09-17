module adder(sum, exp_A, exp_B, A, B, OG_A, OG_B);

    output [22:0] sum;
    input [22:0] A, B;
    input [7:0] exp_A, exp_B;
    input real OG_A, OG_B;

    reg [23:0] temp_A, temp_B, temp_sum;
    reg [23:0] Num_A, Num_B;
    reg [23:0] a, b;

    wire carry_out;
    wire [23:0] carry;

    genvar i;
    integer shift;

    assign Num_A[23:0] = OG_A;
    assign Num_B[23:0] = OG_B;

    assign shift = (exp_A > exp_B)?(exp_A - exp_B):(exp_B - exp_A);
    // assign a = (exp_B > exp_A)?(Num_A / (2**shift)):(Num_A);
    // assign b = (exp_A > exp_B)?(Num_B / (2**shift)):(Num_B);
    // assign temp_A = (OG_A < 0)?(-a):(a);
    // assign temp_B = (OG_B < 0)?(b):(-b);

    // initial begin
    //     #15
    //     $display("A = %b", Num_A);
    //     $display("B = %b", OG_B);
    //     $display("B = %b", -Num_B);

    //     $display("%b", Num_A / (2**((22+127) - exp_A)));
    //     $display("%d", Num_B / (2**((22+127 + 1) - exp_B)));

    //     $display(OG_B < 0);

    //     // $display("a = %b", a);
    //     // $display("b = %b", b);
    //     // $display("Temp_A = %b", temp_A);
    //     // $display("Temp_B = %b", temp_B);

    //     $display(OG_B < 0);

    //     // $display(shift);
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

    assign sum = -temp_sum[22:0] ;

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
        
        exponent = (22 - count) + 127;
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
            temp_man = temp[22:0] + temp_man;
            mantis = temp_man * (2**(count));
        end
        
        else begin

            temp = -temp;
            temp_man = temp[22:0] + temp_man;
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