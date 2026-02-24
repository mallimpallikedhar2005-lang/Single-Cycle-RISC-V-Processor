# Single-Cycle-RISC-V-Processor
Designed and implemented Single Cycle RISC V Processor supporting the RV32I Base instruction set.
## Processor Architecture

![Screenshot_2026-02-11-19-14-46-81_e2d5b3f32b79de1d45acd1fad96fbb0f](https://github.com/user-attachments/assets/ba5d8f03-1bbc-4ff0-93b3-0b0f7b513052)



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

### Working

1. PC fetches instruction from Instruction Memory  
2. Instruction is decoded by Control Unit  
3. Register File reads operands (rs1, rs2)  
4. ALU performs required operation  
5. Result is written back to destination register  
6. PC updates to next instruction
