module register_files(clk,rs1,rs2,rd,reg_Write,write_data, rd1,rd2);
input clk,reg_Write;
input [4:0] rs1;
input [4:0] rs2;
input [4:0] rd;
input [31:0] write_data;
output  [31:0] rd1;
output  [31:0] rd2;
reg [31:0] Registers [31:0] ;
initial begin
Registers[0] = 0;
Registers[1] = 3;
Registers[2] = 2;
Registers[3] = 12;
Registers[4] = 20;
Registers[5] = 3;
Registers[6] = 44;
Registers[7] = 4;
Registers[8] = 2;
Registers[9] = 1;
Registers[10] = 23;
Registers[11] = 4;
Registers[12] = 90;
Registers[13] = 10;
Registers[14] = 20;
Registers[15] = 30;
Registers[16] = 40;
Registers[17] = 50;
Registers[18] = 60;
Registers[19] = 70;
Registers[20] = 80;
Registers[21] = 80;
Registers[22] = 90;
Registers[23] = 70;
Registers[24] = 60;
Registers[25] = 65;
Registers[26] = 4;
Registers[27] = 32;
Registers[28] = 12;
Registers[29] = 34;
Registers[30] = 5;
Registers[31] = 10;
end

always @ (posedge clk)
 begin
  if (reg_Write & (rd != 0 ))
  begin 
   Registers[rd] <= write_data;
 end
end
assign rd1 = (rs1 == 0) ? 32'b0 : Registers[rs1];
assign rd2 = (rs2 == 0) ? 32'b0 : Registers[rs2];
endmodule
  