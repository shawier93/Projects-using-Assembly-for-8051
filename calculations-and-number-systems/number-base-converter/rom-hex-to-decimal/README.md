# Number Base Converter

[Group overview](../../README.md) · [Compare implementations](../README.md)

Convert a binary or hexadecimal-position number into decimal digits.

**Implementation:** Stored Hex To Decimal

**Input:** see input example.  
**Output:** see result example.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | A conversion mode and digits in that input format |
| Output | Decimal characters or decimal digit bytes |

## Worked example

Binary 10101011 equals 128 + 32 + 8 + 2 + 1 = 171. Hexadecimal 51 equals 5 × 16 + 1 = 81.

### Calculation details

Use the listing’s mode character 2 and its ROM string 99. The ASCII digits become 9 and 9. The weighted sum is 9 × 16 + 9 = 153. CONVERT divides by 100, then by 10, leaving ASCII 31H, 35H, 33H at 40H–42H. The result reads 153.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Select input base"] --> B{"Binary or hexadecimal?"}
B -->|Binary| C["Read binary digits"]
C --> D["Accumulate powers of two"]
B -->|Hexadecimal| E["Read two character digits"]
E --> F["Convert supported characters; first times 16 plus second"]
D --> G["Divide value into hundreds, tens, and units"]
F --> G
G --> H["Convert digits into character codes"]
H --> I["Store or display decimal result"]
B -->|Other| J["Selection handling in source flow"]
```

[Detailed control flow](source-flow.md)

### Simplified block diagram

```mermaid
flowchart TD
A["Input: See input example"] -->|Values or events| B["8051 application logic"]
B -->|Working values| C["Registers and internal memory"]
C -->|Saved values| B
D["Program memory: text and lookup tables"] -->|Constants and characters| B
B -->|Results or control signals| E["Output: See result example"]
```

Results are available in memory without a display.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
