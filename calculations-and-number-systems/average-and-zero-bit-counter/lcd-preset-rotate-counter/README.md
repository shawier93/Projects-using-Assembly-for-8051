# Average Calculator and Binary Zero Counter

[Group overview](../../README.md) · [Compare implementations](../README.md)

Either calculate the average of two numbers or count the zero bits in a binary value. These are two separate menu operations.

**Implementation:** LCD Fixed Input Rotate Counter

**Input:** stored values or prompted choices.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Two numbers for the average, or one byte for the zero counter |
| Output | An integer average or a count of zero bits |

## Worked example

The average of 23 and 25 is 24. The byte 00110000 contains six zero bits when all eight positions are counted.

### Calculation details

The zero-count path loads 31H (00110001 binary), sets R5 to 8 and clears 20H. Five of the eight rotations shift out zero, so 20H reaches 05H. Inspect it after the eighth DJNZ, before the display or menu path modifies state.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Read operation choice"] --> B{"Average or zero count?"}
B -->|Average| C["Read two operands"]
C --> D["Add and divide by two"]
B -->|Zero count| E["Load byte and clear counter"]
E --> F{"More bit positions?"}
F -->|Yes| G["Extract next bit by rotation or division"]
G --> H{"Extracted bit is zero?"}
H -->|Yes| I["Increase zero count"]
H -->|No| J["Advance bit position"]
I --> J
J --> F
F -->|No| K["Store or display zero count"]
D --> L["Store or display integer average"]
B -->|Other| M["Exit or invalid-choice route"]
```

[Detailed control flow](source-flow.md)

### Simplified block diagram

```mermaid
flowchart TD
A["Input: Stored values or prompted choices"] -->|Values or events| B["8051 application logic"]
B -->|Working values| C["Registers and internal memory"]
C -->|Saved values| B
D["Program memory: text and lookup tables"] -->|Constants and characters| B
B -->|Results or control signals| E["Output: LCD and internal result bytes"]
```

**Port registers:** `P1`, `P1.2`, `P1.3`, `P1.4`, `P1.5`, `P1.6`, `P1.7`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
