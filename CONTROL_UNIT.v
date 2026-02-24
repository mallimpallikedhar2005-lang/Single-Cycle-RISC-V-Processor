module Control_Unit(input [6:0] opcode,
                    output reg Branch,
	            output reg MemRead,
		    output reg MemToReg,
		    output reg [1:0] ALUOp,
		    output reg MemWrite,
 		    output reg ALUSrc,
  		    output reg RegWrite);
always @(*)
 begin
  /* // Default Values assigned to avoid forming of latches
 Branch = 1'b0;
  MemRead = 1'b0;
 MemtoReg = 1'b0;
 ALUOp = 2'b00;
 MemWrite = 1'b0;
 ALUSrc = 1'b0;
 RegWrite = 1'b0;
  case (opcode)
                // R-Type 
  7'b0110011: begin 
               
   Branch = 1'b0;
  MemRead = 1'b0;
 MemtoReg = 1'b0;
 ALUOp = 2'b10;
 MemWrite = 1'b0;
 ALUSrc = 1'b0;
 RegWrite = 1'b1;
end
   // L-Type
7'b0000011 : begin
 Branch = 1'b0;
  MemRead = 1'b1;
 MemtoReg = 1'b1;
 ALUOp = 2'b00;
 MemWrite = 1'b0;
 ALUSrc = 1'b1;
 RegWrite = 1'b1;
 end
    // S-Type
7'b0100011: begin
 Branch = 1'b0;
  MemRead = 1'b0;
 MemtoReg = 1'b0;
 ALUOp = 2'b00;
 MemWrite = 1'b1;
 ALUSrc = 1'b1;
 RegWrite = 1'b0;
end 
     //  B-Type
7'b1100011:begin

 Branch = 1'b1;
  MemRead = 1'b0;
 MemtoReg = 1'b0;
 ALUOp = 2'b01;
 MemWrite = 1'b0;
 ALUSrc = 1'b0;
 RegWrite = 1'b0;
end
    //I-Type
7'b0010011:begin

 Branch = 1'b0;
  MemRead = 1'b0;
 MemtoReg = 1'b0;
 ALUOp = 2'b10;
 MemWrite = 1'b0;
 ALUSrc = 1'b1;
 RegWrite = 1'b1;
end
endcase*/
        case (opcode)
            7'b0110011:  // R-type 
            begin  {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            7'b0010011:   // I-type
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            7'b0000011:   // Load 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00};end
            7'b0100011:   // Store 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00};end
            7'b1100011:   // Branch 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 2'b11};end  
            7'b1101111:   // Jump 
            begin  {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            7'b0110111:   // LUI
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            default: 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00};end  
        endcase
   

end
endmodule




