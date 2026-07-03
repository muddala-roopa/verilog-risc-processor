# 16-bit RISC Processor (Verilog HDL)
This project implements a simple 16-bit RISC processor using Verilog HDL and verifies its functionality using Vivado simulation.
## Project Description
The processor is designed with basic RISC architecture including ALU, Control Unit, Register File, Data Memory, and Program Counter. It supports simple arithmetic, logical, load and store operations.
## Features
- 16-bit instruction format
- 4 general-purpose registers
- ALU operations: ADD, SUB, AND, OR
- Control Unit for instruction decoding
- Register File for data storage
- Data Memory module
- Sequential execution using Program Counter
## Instruction Format
- [15:12] → Opcode  
- [11:10] → Destination Register (rd)  
- [9:8]   → Source Register 1 (rs)  
- [7:6]   → Source Register 2 (rt)
## Supported Operations
- ADD
- SUB
- AND
- OR
- LOAD
- STORE
- MOV
- MOVI
## Simulation Tool
- Vivado Design Suite
## Output Verification
- Instruction execution verified using waveform simulation
- Correct ALU outputs observed
- Proper register updates
- Sequential instruction execution using PC
## Files Included
- ALU.v
