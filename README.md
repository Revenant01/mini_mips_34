# Mini-MIPS 34 Processor

A VHDL implementation of a 32-bit MIPS-subset processor, available in two architectural variants: **single-cycle** and **5-stage pipelined**.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Instruction Set](#instruction-set)
- [Directory Structure](#directory-structure)
- [Single-Cycle Implementation](#single-cycle-implementation)
- [Pipelined Implementation](#pipelined-implementation)
- [Hazard Resolution](#hazard-resolution)
- [Simulation & Tools](#simulation--tools)
- [Design Schematic](#design-schematic)

---

## Overview

Mini-MIPS 34 is a reduced MIPS processor supporting 11 instructions. It features:

- 32-bit data and address bus
- 32-register file (R0 hardwired to zero)
- Separate instruction memory and data memory
- Two complete implementations:
  - **Single-cycle**: one instruction executed per clock cycle
  - **5-stage pipelined**: overlapped execution with hazard detection and forwarding

The project was developed using VHDL and targeted at Xilinx FPGAs using Vivado.

---

## Architecture

### Instruction Format

Every instruction is 32 bits wide with the following fixed encoding:

```
 31      22  21  20    15  14    10  9      5  4      0
 ┌─────────┬───┬────────┬──────────┬─────────┬─────────┐
 │  Opcode │I/R│  (res) │   Arg1   │  Arg2   │  Arg3   │
 │  [10b]  │[1b]│  [5b] │  [5b]   │  [5b]   │  [5b]   │
 └─────────┴───┴────────┴──────────┴─────────┴─────────┘
```

| Field | Bits | Description |
|-------|------|-------------|
| Opcode | 31:22 | Identifies the instruction |
| I/R Indicator | 21 | `0` = Register operand, `1` = Immediate operand |
| Arg1 | 14:10 | Destination or first source register |
| Arg2 | 9:5 | Second source register |
| Arg3 / Imm | 4:0 | Third source register or 5-bit immediate |

### Register File

- 32 general-purpose registers: R0–R31
- R0 is permanently zero (writes to R0 are ignored)
- Two simultaneous read ports, one synchronous write port

---

## Instruction Set

| Instruction | Opcode (bits 31:22) | I/R | Operation |
|-------------|---------------------|-----|-----------|
| ADD | `0000000001` | 0 | Rd = Rs + Rt |
| ADDI | `0000000001` | 1 | Rd = Rs + imm |
| SUB | `0000000010` | 0 | Rd = Rs − Rt |
| SUBI | `0000000010` | 1 | Rd = Rs − imm |
| AND | `0000001000` | 1 | Rd = Rs AND Rt |
| OR | `0000010000` | 1 | Rd = Rs OR Rt |
| LW | `0000100000` | — | Rd = Mem[Rs + imm] |
| SW | `0001000000` | — | Mem[Rs + imm] = Rt |
| JR | `0010000000` | — | PC = Rs + imm |
| BEQZ | `0100000000` | — | if (Rs == 0) PC = Rt + imm |

### Instruction Examples

```
ADD  R1, R2, R3   →  R1 = R2 + R3
ADDI R1, R2, 5   →  R1 = R2 + 5
SUB  R1, R2, R3   →  R1 = R2 − R3
SUBI R1, R2, 5   →  R1 = R2 − 5
AND  R1, R2, R3   →  R1 = R2 AND R3
OR   R1, R2, R3   →  R1 = R2 OR R3
LW   R1, 5, R2    →  R1 = Mem[R2 + 5]
SW   R1, 5, R2    →  Mem[R2 + 5] = R1
JR   R1, 5        →  PC = R1 + 5
BEQZ R1, 5, R2    →  if (R1 == 0) PC = R2 + 5
```

---

## Directory Structure

```
mini_mips_34/
├── README.md                              ← This file
├── piplinedMIPS.drawio.pdf               ← Architecture diagram
├── Elect 707 Project explanation.docx    ← Course project specification
│
├── single_cycle/                          ← Single-cycle implementation
│   ├── README.md
│   ├── LICENSE
│   ├── top_module.vhd                    ← Top-level test wrapper
│   ├── mips.vhd                          ← Main processor datapath
│   ├── control_unit.vhd                  ← Instruction decoder
│   ├── reg_file.vhd                      ← 32-register file
│   ├── alu.vhd                           ← Arithmetic/logic unit
│   ├── adder.vhd                         ← PC and address adder
│   ├── sign_extend.vhd                   ← 5→32-bit sign extension
│   ├── imem.vhd                          ← Instruction memory
│   ├── dmem.vhd                          ← Data memory
│   ├── flopr.vhd                         ← Flip-flop register (PC)
│   ├── MUX2X1.vhd                        ← 2-to-1 multiplexer
│   ├── MUX3X1.vhd                        ← 3-to-1 multiplexer
│   ├── testbench.vhd                     ← Simulation testbench
│   └── single_cycle/                     ← Vivado project files
│
└── piplined/                              ← 5-stage pipelined implementation
    ├── mips.vhd                          ← Top-level pipelined processor
    ├── fetch_stage.vhd                   ← Stage 1: Instruction Fetch
    ├── decode_stage.vhd                  ← Stage 2: Instruction Decode
    ├── execute_stage.vhd                 ← Stage 3: Execute
    ├── memory_stage.vhd                  ← Stage 4: Memory Access
    ├── writeback_stage.vhd               ← Stage 5: Write Back
    ├── hazard_unit.vhd                   ← Hazard detection & forwarding
    ├── control_unit.vhd                  ← Instruction decoder
    ├── reg_file.vhd                      ← 32-register file
    ├── alu.vhd                           ← Arithmetic/logic unit
    ├── adder.vhd                         ← Adder
    ├── sign_extend.vhd                   ← Sign extension
    ├── imem.vhd                          ← Instruction memory
    ├── dmem.vhd                          ← Data memory
    ├── generic_reg.vhd                   ← Parameterizable register
    ├── pip_regFD.vhd                     ← Fetch/Decode pipeline register
    ├── pip_regDE.vhd                     ← Decode/Execute pipeline register
    ├── pip_regEM.vhd                     ← Execute/Memory pipeline register
    ├── pip_regMW.vhd                     ← Memory/Writeback pipeline register
    ├── MUX2X1.vhd                        ← 2-to-1 multiplexer
    ├── MUX3X1.vhd                        ← 3-to-1 multiplexer
    ├── testbench.vhd                     ← Full processor testbench
    ├── fetch_stage_tb.vhd                ← Fetch stage testbench
    ├── execute_stage_tb.vhd              ← Execute stage testbench
    └── piplined_five_stage_mips/         ← Vivado project files
```

---

## Single-Cycle Implementation

Each instruction completes in a single clock cycle. The datapath is entirely combinational, with only the program counter (PC) registered.

### Component Descriptions

| File | Entity | Role |
|------|--------|------|
| `mips.vhd` | `mips` | Central datapath — wires all components together, routes PC and data signals |
| `control_unit.vhd` | `control_unit` | Decodes 10-bit opcode + I/R indicator into all control signals |
| `reg_file.vhd` | `reg_file` | 32×32-bit register file with 2 read ports and 1 write port |
| `alu.vhd` | `alu` | 32-bit ALU: ADD, SUB, AND, OR (selected by 2-bit control) |
| `adder.vhd` | `adder` | 32-bit unsigned adder (used for PC+4 and branch targets) |
| `sign_extend.vhd` | `sign_extend` | Extends 5-bit immediate to 32-bit signed value |
| `imem.vhd` | `imem` | Instruction memory — asynchronous read |
| `dmem.vhd` | `dmem` | Data memory — synchronous write, asynchronous read (64 words) |
| `flopr.vhd` | `flopr` | Generic flip-flop with synchronous reset — stores the PC |
| `MUX2X1.vhd` | `MUX2X1` | Generic 2-to-1 multiplexer |
| `MUX3X1.vhd` | `MUX3X1` | Generic 3-to-1 multiplexer |
| `top_module.vhd` | `top_module` | Test wrapper that exposes PC, write data, and data address |
| `testbench.vhd` | `testbench` | Drives 9 instruction patterns through the processor |

### Control Signals

The `control_unit` produces the following signals:

| Signal | Width | Meaning |
|--------|-------|---------|
| `o_alu_control` | 2 | ALU operation: `00`=ADD, `01`=SUB, `10`=AND, `11`=OR |
| `o_reg_write` | 1 | Enable write to register file |
| `o_mem_write` | 1 | Enable write to data memory |
| `o_alu_src` | 1 | ALU B input: `0`=register, `1`=sign-extended immediate |
| `o_mem_2_reg` | 1 | Write-back source: `0`=ALU result, `1`=memory read data |
| `o_branch_en` | 1 | Enable branch (BEQZ) |
| `o_jump` | 1 | Enable jump (JR) |
| `o_sw_en` | 1 | Store word data select |
| `o_jr_src` | 1 | Jump register source select |
| `o_lw_vs_imm` | 1 | Load word vs immediate select |

### Datapath Flow

```
PC → IMEM → [Instruction]
                  │
            Control Unit ──────────────────────────────────────────────┐
                  │                                                      │
         ┌────────┴────────┐                                            │
         ↓                 ↓                                            │
      Reg File         Sign Extend                                      │
     (Rs, Rt read)    (5-bit imm)                                      │
         │                 │                                            │
         └────────┬────────┘                                            │
                  ↓                                                     │
               ALU ←── ALU control ────────────────────────────────────┘
                  │
         ┌────────┴────────┐
         ↓                 ↓
       DMEM           Reg File
     (optional)      (write back)
```

---

## Pipelined Implementation

Implements the classic 5-stage MIPS pipeline: **IF → ID → EX → MEM → WB**. Instructions overlap in execution, increasing throughput.

### Pipeline Stages

#### Stage 1 — Instruction Fetch (`fetch_stage.vhd`)

- Reads instruction from `imem` at current PC
- Increments PC by 4 (word-addressed)
- Selects next PC from: sequential, branch target, or jump target
- Stores result in the **F/D pipeline register** (`pip_regFD`)
- Supports stalling (freeze PC and F/D register)

#### Stage 2 — Instruction Decode (`decode_stage.vhd`)

- Passes instruction through `control_unit` to generate control signals
- Reads two source registers from `reg_file`
- Sign-extends the 5-bit immediate field to 32 bits
- Evaluates branch condition (Rs == 0) and computes branch target
- Applies forwarding for branch operands from later stages
- Stores results in the **D/E pipeline register** (`pip_regDE`)

#### Stage 3 — Execute (`execute_stage.vhd`)

- Selects ALU operands via 3-to-1 forwarding multiplexers
- Performs ALU operation (ADD/SUB/AND/OR)
- Selects between register Rt and sign-extended immediate as ALU B input
- Propagates register destination and write data
- Stores results in the **E/M pipeline register** (`pip_regEM`)

#### Stage 4 — Memory Access (`memory_stage.vhd`)

- Reads from or writes to `dmem` using ALU result as address
- Forwards ALU result to earlier stages (for non-memory instructions)
- Stores results in the **M/W pipeline register** (`pip_regMW`)

#### Stage 5 — Write Back

- Selects between ALU result and memory read data via multiplexer
- Writes selected value back to the register file
- Controlled by `o_mem_2_reg` signal

### Pipeline Registers

| Register | File | Carries |
|----------|------|---------|
| F/D | `pip_regFD.vhd` | Instruction word |
| D/E | `pip_regDE.vhd` | Control signals, register values, register addresses, sign-extended immediate |
| E/M | `pip_regEM.vhd` | Control signals, ALU result, store data, destination register |
| M/W | `pip_regMW.vhd` | ALU result, memory read data, control signals, destination register |

All registers except M/W support a **clear** input for flushing on hazards. F/D and D/E additionally support a **stall** input that holds the current value.

---

## Hazard Resolution

Managed entirely by `hazard_unit.vhd`.

### Data Hazards (Read After Write)

When an instruction reads a register that a preceding instruction has not yet written back:

**Forwarding** routes the result directly from a later pipeline stage back to the Execute stage inputs, avoiding stalls where possible.

```
Forwarding paths:
  forwardAE / forwardBE  (2-bit, for Execute-stage ALU inputs)
    "00" → use register file output (no hazard)
    "01" → forward from Memory stage (E/M register)
    "10" → forward from Writeback stage (M/W register)

  forwardAD / forwardBD  (1-bit, for Decode-stage branch comparator)
    forward from Memory or Writeback stages
```

**Stalling** is used when a `LW` result is needed by the immediately following instruction (load-use hazard). The hazard unit:
1. Asserts `stallF` and `stallD` to freeze Fetch and Decode
2. Asserts `flushE` to insert a NOP bubble into Execute

### Branch Hazards

Branch condition is resolved in the **Decode** stage:

- If the branch operand is available from Memory or Writeback stage → forward it
- If the branch operand is still in the Execute stage → stall for one cycle
- On a taken branch → flush the incorrectly fetched instruction in Fetch

### Hazard Unit Signal Summary

| Signal | Direction | Meaning |
|--------|-----------|---------|
| `stallF` | → Fetch | Freeze PC and F/D register |
| `stallD` | → Decode | Freeze D/E register |
| `flushE` | → Execute | Clear E/M register (insert NOP) |
| `forwardAE[1:0]` | → Execute | MUX select for ALU input A |
| `forwardBE[1:0]` | → Execute | MUX select for ALU input B |
| `forwardAD` | → Decode | Forward to branch comparator input A |
| `forwardBD` | → Decode | Forward to branch comparator input B |

---

## Simulation & Tools

### Requirements

- **Xilinx Vivado** (any edition that supports VHDL simulation)
- The project was developed with Vivado; `.xpr` project files are in the respective `single_cycle/` and `piplined_five_stage_mips/` subdirectories

### Running Simulations

**Single-cycle:**
1. Open Vivado and load `single_cycle/single_cycle/*.xpr`
2. Set `testbench.vhd` as the simulation top
3. Run behavioral simulation
4. Observe `o_pc`, `o_write_data`, and `o_data_adr` signals

**Pipelined:**
1. Open Vivado and load `piplined/piplined_five_stage_mips/*.xpr`
2. Set `testbench.vhd` as the simulation top for full-system testing
3. Alternatively use `fetch_stage_tb.vhd` or `execute_stage_tb.vhd` for stage-level testing
4. Run behavioral simulation

### Testbench Clock

The testbench uses a **10 ns clock period** (5 ns high / 5 ns low) with a synchronous reset held for the first two clock cycles.

### Sample Test Vectors

The single-cycle testbench drives the following instruction sequence:

```
X"00408405"  →  ADD
X"00808823"  →  SUB
X"00400C41"  →  AND
X"10000CE1"  →  BEQZ
X"00801022"  →  OR
X"02001483"  →  LW
X"100004C5"  →  BEQZ
X"08001925"  →  SW
X"04001C26"  →  BEQZ
```

---

## Design Schematic

The full pipelined datapath schematic is included as [`piplinedMIPS.drawio.pdf`](piplinedMIPS.drawio.pdf).

![Pipelined MIPS Schematic](https://github.com/Revenant01/mini_mips_34/assets/99401515/e9b3fe9f-cead-475b-9cc1-a61df326d12b)

---

## Implementation Comparison

| Feature | Single-Cycle | 5-Stage Pipelined |
|---------|-------------|-------------------|
| VHDL source files | 13 | 21 |
| CPI (ideal) | 1 | ~1 |
| CPI (with hazards) | 1 | ~1.2 average |
| Hazard handling | Not needed | Forwarding + stalling |
| Max clock frequency | Lower (critical path = full datapath) | Higher (critical path = one stage) |
| Design complexity | Simple | Advanced |
| Simulation entry point | `top_module.vhd` | `mips.vhd` |
