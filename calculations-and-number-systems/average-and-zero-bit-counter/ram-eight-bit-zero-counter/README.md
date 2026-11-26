# Average Calculator and Binary Zero Counter

[Group overview](../../README.md) · [Compare implementations](../README.md)

Either calculate the average of two numbers or count the zero bits in a binary value. These are two separate menu operations.

**Implementation:** Memory Eight Bit Zero Counter

**Input:** values stored in memory.  
**Output:** inspect memory in debugger.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Two numbers for the average, or one byte for the zero counter |
| Output | An integer average or a count of zero bits |

## Worked example

The average of 23 and 25 is 24. The byte 00110000 contains six zero bits when all eight positions are counted.

### Calculation details

Run with the source defaults. R7 = 2 selects the zero counter and R1 contains 30H (00110000 binary). Eight right rotations move the original bits into carry one at a time. Six have carry clear, so RAM 10H ends at 06H and the program enters its self-loop.

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
A["Input: Values stored in memory"] -->|Values or events| B["8051 application logic"]
B -->|Working values| C["Registers and internal memory"]
C -->|Saved values| B
B -->|Results or control signals| E["Output: Inspect memory in debugger"]
```

Results are available in memory without a display.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
