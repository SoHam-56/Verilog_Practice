module multiply #(parameter width = 31)
                                (input [width:0] A,
                                 input [width:0] B,
                                 input clk,
                                 output reg [width:0] result);

    reg [23:0] A_Mantissa, B_Mantissa;
    reg [22:0] Mantissa;
    reg [47:0] Temp_Mantissa;
    reg [7:0] A_Exponent, B_Exponent, Temp_Exponent, diff_Exponent, Exponent;
    reg A_sign, B_sign, Sign;
    
    always @ (posedge clk) begin
        A_Mantissa = {1'b1,A[22:0]};
        A_Exponent = A[30:23];
        A_sign = A[width];
          
        B_Mantissa = {1'b1,B[22:0]};
        B_Exponent = B[30:23];
        B_sign = B[width];
        
        Temp_Exponent = A_Exponent + B_Exponent - 127;
        Temp_Mantissa = A_Mantissa * B_Mantissa;
        
        Mantissa = Temp_Mantissa[47] ? Temp_Mantissa[46:24] : Temp_Mantissa[45:23];
        Exponent = Temp_Mantissa[47] ? Temp_Exponent + 1'b1 : Temp_Exponent;
        
        Sign = A_sign ^ B_sign;
        
        result = {Sign, Exponent, Mantissa};
    end
endmodule