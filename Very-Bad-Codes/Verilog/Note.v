module accum #(parameter len = 4)(input clk, 
                                  input CLR, 
                                  input [len - 1:0] D, 
                                  output [len - 1:0] Q); 

    reg [3:0] tmp;  
     
    always @(posedge clk or posedge CLR)
        tmp = CLR ? 'b0 : tmp + D;
 
    assign Q = tmp;
    
endmodule