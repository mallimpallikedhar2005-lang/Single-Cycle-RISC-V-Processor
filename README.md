# Single-Cycle-RISC-V-Processor
Designed and implemented Single Cycle RISC V Processor supporting the RV32I Base instruction set.


## Processor Architecture

![Screenshot_2026-02-11-19-14-46-81_e2d5b3f32b79de1d45acd1fad96fbb0f](https://github.com/user-attachments/assets/ba5d8f03-1bbc-4ff0-93b3-0b0f7b513052)
# Single-Cycle RISC-V Processor (RV32I)


### Description

The above diagram represents the datapath of the 32-bit Single-Cycle RISC-V processor.  
The processor completes instruction fetch, decode, execute, memory access, and write-back within a single clock cycle.

### Main Components

- **Program Counter (PC):** Holds address of next instruction  
- **Instruction Memory:** Stores program instructions  
- **Register File:** 32 × 32-bit registers with two read ports and one write port  
- **ALU:** Performs arithmetic and logical operations  
- **Immediate Generator:** Extracts and sign-extends immediate values  
- **Control Unit:** Generates control signals for datapath  

## 📌 Overview

This project implements a 32-bit Single-Cycle RISC-V Processor based on the RV32I base instruction set architecture using Verilog HDL.

The processor completes instruction Fetch, Decode, Execute, Memory Access, and Write-Back within a single clock cycle.

This project was developed to gain a deep understanding of processor architecture, datapath design, and RTL implementation.

---

## 🏗 Processor Architecture

The processor consists of the following major components:

### 🔹 Program Counter (PC)
- Holds the address of the current instruction
- Updates every clock cycle
- Supports sequential and branch addressing

### 🔹 Instruction Memory
- Stores 32-bit RISC-V instructions
- Outputs instruction based on PC address

### 🔹 Register File
- 32 general-purpose registers (32-bit each)
- Two read ports and one write port
- x0 register permanently hardwired to zero
- Synchronous write, combinational read

### 🔹 ALU (Arithmetic Logic Unit)
Supports:
- ADD, SUB
- AND, OR, XOR
- SLT (Set Less Than)
- Logical and arithmetic operations

### 🔹 Immediate Generator
- Extracts and sign-extends immediate values
- Supports I-type, S-type, and B-type formats

### 🔹 Control Unit
- Generates control signals based on opcode
- Produces ALUOp, RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, Branch signals

### 🔹 ALU Control
- Determines ALU operation using funct3, funct7, and ALUOp
- Enables correct decoding of R-type and I-type instructions

---

## 📚 Instruction Types Implemented

- **R-Type:** ADD, SUB, AND, OR, SLT
- **I-Type:** ADDI, ANDI
- **Load Instructions**
- **Store Instructions**
- **Branch Instructions**

---

## 🔄 Execution Flow

1. PC fetches instruction from Instruction Memory.
2. Instruction is decoded by Control Unit.
3. Register File reads source operands.
4. Immediate Generator extracts required immediate.
5. ALU performs arithmetic/logical operation.
6. Result is written back to destination register.
7. PC updates to next instruction.

All operations complete in a single clock cycle.

---
## working
1. PC fetches instruction from Instruction Memory  
2. Instruction is decoded by Control Unit  
3. Register File reads operands (rs1, rs2)  
4. ALU performs required operation  
5. Result is written back to destination register  
6. PC updates to next instruction

## 🧪 Verification & Simulation

- Simulated using ModelSim.
- Verified correct execution of R-type and I-type instructions.
- Checked register write-back and ALU results through waveform analysis.
- Debugged control signal timing and instruction decoding issues.

---

## 🛠 Tools Used

- Verilog HDL
- ModelSim
- Git & GitHub

---

## 🎯 Learning Outcomes

Through this project, I gained hands-on experience in:

- Processor datapath design
- Control unit implementation
- RISC-V instruction decoding
- RTL debugging and waveform analysis
- Timing and clock-based design
- Hardware-level problem solving

---

## 🚀 Future Improvements

- Pipelined RISC-V implementation
- Hazard detection and forwarding
- Cache integration
- FPGA implementation
- Performance optimization

---

## 📎 Author

Kedhar  
Electronics and Communication Engineering  
Interested in VLSI, Digital Design, Processor Architecture, and RTL Development



