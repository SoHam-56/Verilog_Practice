`include "Mantis.v"

module test;

    real a;
    real b;
    
    wire [7:0] sum;

    mantis fa (sum, a, b);
    floater ex(a);

    initial begin

        a = 15335;
        b = 8'b100;
        #10
        $display("a = %b", a);
        $display("b = ", b);
        $display("sum = %b", sum);
        
    end
    
endmodule