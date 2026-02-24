module Alu (input [31:0] A,
            input [31:0] B,
            input [3:0] alu_ctrl, 
            output reg [31:0] result,
            output  zero);
always @(*)
 begin
 case(alu_ctrl)
 4'b0000: result = A & B;  //and
 4'b0001: result = A | B;  // or
 4'b0010: result = A + B;  // add
 4'b0110: result = A - B;  //sub
 4'b0011: result = A ^ B;  // exor
 4'b0101: result = A << B[4:0];  // sll
 4'b0100: result = A >> B[4:0];  // srl
 4'b0111: result = $signed(A) >>> B[4:0]; //sra
 4'b1000: result = ($signed (A) < $signed (B)) ? 32'd1:32'd0;
default: result = 32'b0;
endcase
end
assign zero = (result == 32'b0) ? 1'b1 : 1'b0 ;
endmodule
