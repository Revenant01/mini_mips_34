# MIPS34 Processor Implementation

## Project Overview

### Introduction

This project involves the VHDL implementation of a sophisticated five-stage pipelined processor, Mini-MIPS, which is designed as a subset of the 32-bit MIPS architecture. Mini-MIPS supports a carefully selected set of 11 instructions, including ADD, SUB, ADDI, SUBI, AND, OR, LW, SW, JR, ENC, and BEQZ. The processor follows a 5-stage pipeline structure, incorporating advanced features such as a 32-register file, dedicated memory access for select instructions, and a robust data hazard resolution mechanism using a forwarding unit.

### Specifications

- **Pipeline Stages:** The MIPS34 processor comprises five stages: Instruction Fetch, Instruction Decode, Execution, Memory Access, and Write Back.
  
- **Supported Instructions:** A set of 11 instructions, including ADD, SUB, ADDI, SUBI, AND, OR, LW, SW, JR, ENC, and BEQZ.
  
- **Memory Access:** Only two instructions (LW, SW) have access to the memory.

- **Registers:** The processor is equipped with a 32-register file, with Register R0 consistently set to zero.

- **Data Hazard Resolution:** Data hazards are efficiently resolved through a forwarding unit.

- **Memory Access Synchronization:** The processor assumes synchronous memory access, requiring only one clock cycle for memory operations.

## Project Explanation

### Instruction Format

In the Instruction Fetch stage, instructions are read from program memory and loaded into the Instruction Register. Each memory line is 32 bits, structured as follows:

```
Opcode   I/R Indicator   First Argument   Second Argument   Third Argument
31:22    7               21:15            14:10             9:5             4:0
```

*Example:*
```
ADD      R1              R2               R3
00000000011111110000100001000011
```

### Opcode Assignment

| Instruction | Opcode        | I/R Indicator |
|-------------|---------------|---------------|
| ADD/AddI    | 0000000001    | 0/1           |
| SUB/SUBI    | 0000000010    | 0/1           |
| AND         | 0000001000    | 1             |
| OR          | 0000010000    | 1             |
| LW          | 0000100000    | Do not care   |
| SW          | 0001000000    | Do not care   |
| JR          | 0010000000    | Do not care   |
| BEQZ        | 0100000000    | Do not care   |

### Instruction Functions & Example Program Memory Entries

- **ADD R1, R2, R3:** R2 + R3 -> R1
- **SUB R1, R2, R3:** R2 – R3 -> R1
- **ADDI R1, R2, 5:** R2 + 5 -> R1
- **SUBI R1, R2, 5:** R2 – 5 -> R1
- **AND R1, R2, R3:** R2 AND R3 -> R1
- **OR R1, R2, R3:** R2 OR R3 -> R1
- **LW R1, 5, R2:** Data inside address (R2 + 5) -> R1
- **SW R1, 5, R2:** R1 -> To address (R2 + 5)
- **JR R1, 5:** R1 + 5 -> Program Counter (PC)
- **BEQZ R1, 5, R2:** if (R1 = 0) then { R2 + 5 -> Program Counter (PC) }

### Register File

The Register file encompasses 32 Registers (R0, R1, R2 … R31), each 32 bits. The special register R0 consistently holds the value zero.

### Program Memory vs Register File

Program memory stores opcodes, arguments, and data (Van-Neumann architecture), while the Register File provides rapid data access and temporary storage during program execution.

### Additional Considerations

- The MIPS34 processor, being 5 stages pipelined, expertly addresses data hazards, particularly the Read After Write (RAW) dependency, employing forwarding and stalling techniques discussed in lectures and tutorials.
- Branch hazards are meticulously handled based on lecture insights and will be further addressed in upcoming tutorials.

## Deliverables

1. A meticulously detailed drawing of the Register file and its internal components, including signal names.
2. An intricate illustration of the RAW hazard resolving technique, complemented by supporting drawings.
3. Neatly crafted drawings depicting Fetch, Decode, Memory, and Write Back stages, accompanied by fully functional VHDL codes for these stages.
4. A comprehensive Control Unit block and the final project delivery.

---

*Note: This README serves as a comprehensive guide to the MIPS34 processor implementation project, providing a clear understanding of its objectives, specifications, and deliverables.*
