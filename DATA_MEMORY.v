module Data_Memory (input clk, MemRead, MemWrite, 
                    input [31:0] address,
                    input [31:0] Write_data,
                    output  [31:0] read_data );
 reg [31:0] Data_mem [255:0] ;
 assign read_data = (MemRead) ? Data_mem[address[9:2]] : 32'b0;
always @(posedge clk)
 begin
if (MemWrite)
 Data_mem[address[9:2]] <= Write_data;
end
endmodule 