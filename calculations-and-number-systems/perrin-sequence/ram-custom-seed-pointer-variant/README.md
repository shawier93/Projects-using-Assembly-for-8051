# Perrin Sequence

[Group overview](../../README.md) · [Compare implementations](../README.md)

Generate a number sequence in which each new value is the sum of the values two and three places before it. Some versions also let you request a particular term.

**Implementation:** Memory Custom Seed Pointer Variant

**Input:** values stored in memory.  
**Output:** inspect memory in debugger.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Three starting numbers and a length or position |
| Output | A sequence of numbers or the requested term |

## Worked example

Starting with 3, 0, 2 gives 3, 0, 2, 3, 2, 5, 5. For example, the fourth value is 3 + 0 = 3.

### Calculation details

At entry to PERRINSEQ, use A = 3 iterations and seed RAM 20H–22H with 4, 2, 3. The three sums are 4 + 2 = 6, 2 + 3 = 5 and 3 + 6 = 9. Inspect 23H–25H for 06H, 05H and 09H.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Read or load three starting terms"] --> B["Read requested length or index"]
B --> C{"Another term needed?"}
C -->|Yes| D["Add terms two and three positions back"]
D --> E["Store new term and advance position"]
E --> C
C -->|No| F["Use sequence or select requested term"]
F --> G["Store or display result"]
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

1. Open the [assembly source](source.txt) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
