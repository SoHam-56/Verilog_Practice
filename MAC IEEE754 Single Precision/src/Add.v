module Add(input [31:0] A,
           input [31:0] B,
           input clk,
           output reg [31:0] result);

    integer i;
    
    reg [23:0] BigMan, SmallMan;
    reg [23:0] TempMan;
    
    reg [22:0] Mantissa;
    reg [7:0] Exponent;
    reg Sign;
    
    reg [7:0] BigExp, SmallExp, TempExp, DifferenceExp;
    reg BigSign, SmallSign, Temp_sign;
    reg [32:0] Temp;
    reg carry;
    reg comp;
    reg [7:0] shift;
    
    always @(negedge clk && A) begin
    
        comp =  (A[30:23] >= B[30:23])? 1'b1 : 1'b0;
          
        BigMan = comp ? {1'b1,A[22:0]} : {1'b1,B[22:0]};
        BigExp = comp ? (A[30:23] - 127) : (B[30:23] - 127);
        BigSign = comp ? A[31] : B[31];
          
        SmallMan = comp ? {1'b1,B[22:0]} : {1'b1,A[22:0]};
        SmallExp = comp ? (B[30:23] - 127) : (A[30:23] - 127);
        SmallSign = comp ? B[31] : A[31];
        
        DifferenceExp = BigExp - SmallExp;
        SmallMan = (SmallMan >> DifferenceExp);
        {carry, TempMan} =  (BigSign ~^ SmallSign)? (BigMan + SmallMan) : (BigMan - SmallMan); 
        shift = BigExp;
        
//        $display("Carry = ", carry);
//        $display("TempMan = ", TempMan);
        
        if(carry) 
            begin
                TempMan = TempMan >> 1;
                shift = shift + 1'b1;
            end
        else begin
            for(i = 0; i < 24; i = i + 1) begin
                if(!TempMan[23]) begin
                    TempMan = TempMan << 1;
                    shift =  shift - 1'b1;
                end
                
            end
//            while(!TempMan[23]) 
//                begin
//                    TempMan = TempMan << 1;
//                    shift =  shift - 1'b1;
//                end
        end
        
 
        Sign = BigSign;
        Mantissa = TempMan[22:0];
        Exponent = shift + 127;
        result = {Sign, Exponent, Mantissa};

    end
endmodule