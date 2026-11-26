# Television Order Pricing

[Group overview](../../README.md) · [Compare implementations](../README.md)

Build a television order price from a brand and optional services.

**Implementation:** Keypad Brand Service Pricing

**Input:** keypad.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Brand, warranty, maintenance, delivery, quantity, and membership |
| Output | Total order charge |

## Worked example

For the documented brand-2 case: 55 + 2 + 3 + 3 = 63 each; two cost 126; subtracting 17 gives 109.

### Calculation details

Select brand 2, warranty 1, maintenance 1, delivery 1, quantity 2 and membership 1. Follow the calculation with these numeric choices in the option bytes. The base price of 55 gains 2 for warranty, 3 for maintenance and 3 for delivery. Multiplying 63 by 2 gives 126. The brand-2 membership adjustment subtracts 17, leaving 109 (6DH) in the cost byte at 36H.

## Program operation

1. Read brand and options.
2. Select brand price.
3. Add warranty, maintenance, and delivery.
4. Multiply by quantity.
5. Apply membership adjustment and output charge.

### Functional flowchart

```mermaid
flowchart TD
N0["Read brand and options"] --> N1
N1["Select brand price"] --> N2
N2["Add warranty, maintenance, and delivery"] --> N3
N3["Multiply by quantity"] --> N4
N4["Apply membership adjustment and output charge"]
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

**Port registers:** `P0`, `P1`, `P1.2`, `P1.3`, `P1.4`, `P1.5`, `P1.6`, `P1.7`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
