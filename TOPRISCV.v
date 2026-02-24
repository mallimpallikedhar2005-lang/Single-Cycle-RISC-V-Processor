module single_cycle_risc (
    input clk,
    input reset
);

// -WIRES 
wire [31:0] pc;
wire [31:0] pc_next;
wire [31:0] pc_plus4;
wire [31:0] instruction;
wire Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;
wire [31:0] rd1, rd2;
wire [31:0] imm;
wire [3:0] alu_ctrl;
wire [31:0] alu_result;
wire zero;
wire [31:0] mem_read_data;
wire [31:0] write_back;
wire [31:0] alu_input2;
wire [31:0] branch_target;
wire PCSrc;

// Program Counter
program_counter PC (
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc(pc)
);

// PC + 4 
assign pc_plus4 = pc + 32'd4;

//  INSTRUCTION MEMORY 
instrucion_memory IM (
    .clk(clk),
    .reset(reset),
    .read_address(pc),
    .instruction_out(instruction)
);

//  CONTROL UNIT 
Control_Unit CU (
    .opcode(instruction[6:0]),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemToReg(MemToReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);

// REGISTER FILE
register_files RF (
    .clk(clk),
    .rs1(instruction[19:15]),
    .rs2(instruction[24:20]),
    .rd(instruction[11:7]),
    .reg_Write(RegWrite),
    .write_data(write_back),
    .rd1(rd1),
    .rd2(rd2)
);

// IMMEDIATE GENERATOR 
Immediate_Generator IG (
    .instr(instruction),
    .imm(imm)
);

//  ALU CONTROL 
alu_control ALUC (
    .aluOp(ALUOp),
    .funct3(instruction[14:12]),
    .funct7(instruction[31:25]),
    .alu_ctrl(alu_ctrl)
);

//  ALU INPUT MUX 
assign alu_input2 = (ALUSrc) ? imm : rd2;

//    ALU 
Alu ALU (
    .A(rd1),
    .B(alu_input2),
    .alu_ctrl(alu_ctrl),
    .result(alu_result),
    .zero(zero)
);

//  DATA MEMORY 
Data_Memory DM (
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(alu_result),
    .Write_data(rd2),
    .read_data(mem_read_data)
);

// WRITE BACK MUX 
assign write_back = (MemToReg) ? mem_read_data : alu_result;

//  BRANCH LOGIC
assign PCSrc = Branch & zero;

BTAdder BTA (
    .BT_in1(pc),
    .BT_in2(imm),
    .Branch_Target(branch_target)
);

assign pc_next = (PCSrc) ? branch_target : pc_plus4;

endmodule
