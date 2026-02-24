module instrucion_memory(clk,reset,read_address, instruction_out);
input clk, reset;
input [31:0] read_address;
output [31:0] instruction_out;
reg [31:0] I_Mem [63:0];
assign instruction_out = I_Mem[read_address];
initial
 begin
I_Mem[0] = 32'b0000000000000000000000000000000 ;       // no operation
        I_Mem[4] = 32'b0000000_11001_10000_000_01101_0110011;    // add x13, x16, x25
        I_Mem[8] = 32'b0100000_00011_01000_000_00101_0110011;     // sub x5, x8, x3
        I_Mem[12] = 32'b0000000_00011_00010_111_00001_0110011;    // and x1, x2, x3      
        // I-type
        I_Mem[16]  = 32'b000000000010_10101_000_10110_0010011;     // addi x22, x21, 2
        I_Mem[20]  = 32'b000000000011_01000_110_01001_0010011;     // ori x9, x8, 3 
	I_Mem[24] = 32'b000000000100_01000_110_01001_0010011;     // xori x9, x8, 4
	I_Mem[28] = 32'b000000000101_00010_111_00001_0010011;     // andi x1, x2, 5	 
        // L-type
	I_Mem[32]=  32'b000000000101_00011_000_01001_0000011;     // lb x9, 5(x3)
        // S-type
        I_Mem[36] =  32'b0000000_01111_00011_000_01000_0100011;     // sb x15, 8(x3), x3 = 12	
	//B-type    
	I_Mem[40] = 32'b0_000000_01001_01001_000_0110_0_1100011;     // beq x9, x9, 12, (PC + 12 if x9 = x9 	
	// U-type
        I_Mem[44] =  32'b00000000000000101000_00011_0110111;     // lui x3, 40        
	// J-type
	I_Mem[48] = 32'b0_00000000_0_0000010100_00001_1101111;         // jal x1, 20
end
endmodule 