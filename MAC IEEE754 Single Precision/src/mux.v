module mux(
    input [31:0] I0,
    input [31:0] I1,
    input S,
    input clk,
    output reg [31:0] Out
    );
    
    always @ (posedge clk) begin
        
        if(!S)
            Out = I0;
        else
            Out = I1; 
    end
endmodule
