module alu_control (input [1:0] aluOp, input [2:0] funct3, input [6:0] funct7,
                    output reg [3:0] alu_ctrl);
always @(*)
begin
 case(aluOp)
  // load / store
   2'b00 : begin
   alu_ctrl = 4'b0010;
      end
    // branch
  2'b01: begin 
   alu_ctrl = 4'b0110;
  end
  2'b10: begin
  case(funct3)
   // Add or Sub
     3'b000: begin
               if (funct7 == 7'b0100000) 
                alu_ctrl = 4'b0110; // sub
                else
                      alu_ctrl = 4'b0010; // add
                end
     3'b111: alu_ctrl = 4'b0000; //and
     3'b110: alu_ctrl = 4'b0001; // or
     3'b011:  alu_ctrl = 4'b0111;  // sltu

default : alu_ctrl = 4'b0010; // add
endcase 
end
default: alu_ctrl = 4'b0010; // safe add
endcase
end
endmodule 