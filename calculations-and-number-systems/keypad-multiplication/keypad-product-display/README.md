# Keypad Multiplication

[Group overview](../../README.md) · [Compare implementations](../README.md)

Read two single-digit operands separated by a key and display their product.

**Implementation:** Keypad Product Display

**Input:** keypad.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Three key presses: first digit, separator, second digit |
| Output | Two decimal result characters |

## Worked example

Enter 3, then *, then 4. The product is 12. The middle key is displayed; this code does not use it to select an operation.

### Calculation details

Enter 3, *, 4 and begin the conversion with carry clear. The outer two ASCII bytes 33H and 34H become 3 and 4. MUL AB gives 12. DIV AB by 10 yields quotient 1 and remainder 2, which become the displayed characters 1 and 2.

## Program operation

1. Read and echo three keys.
2. Convert first and third keys into numbers.
3. Multiply operands.
4. Split product into tens and units.
5. Write result to LCD.

### Functional flowchart

```mermaid
flowchart TD
N0["Read and echo three keys"] --> N1
N1["Convert first and third keys into numbers"] --> N2
N2["Multiply operands"] --> N3
N3["Split product into tens and units"] --> N4
N4["Write result to LCD"]
```

[Detailed control flow](source-flow.md)

### Simplified block diagram

```mermaid
flowchart TD
A["Input: Keypad; external event where specified"] -->|Values or events| B["8051 application logic"]
B -->|Working values| C["Registers and internal memory"]
C -->|Saved values| B
D["Program memory: text and lookup tables"] -->|Constants and characters| B
B -->|Results or control signals| E["Output: LCD and internal result bytes"]
```

**Port registers:** `P0`, `P0.0`, `P0.1`, `P0.2`, `P2`, `P2.0`, `P2.3`, `P2.4`, `P2.7`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.a51) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
