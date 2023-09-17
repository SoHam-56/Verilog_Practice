`include "Note.sv"

module test;

    reg [7:0] a, b;
    //reg c_in;
    output [7:0] sum;
    output carry_out;

    exponent fa (sum, carry_out, a, b);

    initial begin

        //$monitor("A, B, carry_in, Sum");

        a = 8'b00000101; b = 8'b00000100;

        $display(sum);
        
    end
    
endmodule