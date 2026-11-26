# Number and Bit Operations

[Group overview](../../README.md) · [Compare implementations](../README.md)

Use a menu to explore addition, binary display, bit complement, and duplication operations.

**Implementation:** Memory Complement And Duplication

**Input:** values stored in memory.  
**Output:** inspect memory in debugger.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | A menu choice and the operand required by that choice |
| Output | The selected transformed value |

## Worked example

The complement of 11110000 is 00001111: every zero becomes one, and every one becomes zero.

### Calculation details

In the complement option use the assembled byte F0H (11110000 binary). CPL A flips all eight bits, leaving 0FH. In bit order from most to least significant, the complemented byte reads 00001111.

## Program operation

1. Read menu choice.
2. Select addition, binary, complement, or duplication route.
3. Read the selected route’s operand.
4. Perform transformation.
5. Store or display result; follow repeat or exit route.

### Functional flowchart

```mermaid
flowchart TD
N0["Read menu choice"] --> N1
N1["Select addition, binary, complement, or duplication route"] --> N2
N2["Read the selected route’s operand"] --> N3
N3["Perform transformation"] --> N4
N4["Store or display result; follow repeat or exit route"]
```

[Detailed control flow](source-flow.md)

### Simplified block diagram

```mermaid
flowchart TD
A["Input: Values stored in memory"] -->|Values or events| B["8051 application logic"]
B -->|Working values| C["Registers and internal memory"]
C -->|Saved values| B
B -->|Results or control signals| E["Output: Inspect memory in debugger"]
```

**Port registers:** `P1`, `P2`, `P3`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.txt) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
