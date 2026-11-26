# Gold and Silver Ticket Booking

[Group overview](../../README.md) · [Compare implementations](../README.md)

Select gold or silver tickets, calculate the charge, and update the stored number of tickets.

**Implementation:** LCD Booking Stock Tables

**Input:** stored values or prompted choices.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Ticket class, requested quantity, and available stock |
| Output | Total price and remaining stock, or an unavailable message |

## Worked example

With 9 gold tickets in stock, price 5, and a request for 2: charge 10 and remaining stock 7.

### Calculation details

Use the gold calculation with stock 9, unit price 5 and quantity 2. On the successful path the remaining stock is 9 − 2 = 7 and the charge is 2 × 5 = 10. A debugger shows 0AH in the accumulator immediately after MUL AB. Check the stock comparison separately with a request above 9.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Read class and quantity"] --> B{"Gold or silver?"}
B -->|Gold| C["Select gold price and stock"]
B -->|Silver| D["Select silver price and stock"]
C --> E["Run this version's availability comparison"]
D --> E
E --> F{"Comparison accepts request?"}
F -->|Yes| G["Subtract quantity from stock"]
G --> H["Multiply quantity by price"]
H --> I["Store or display charge"]
F -->|No| J["Unavailable or rejection route"]
B -->|Other| K["Invalid-selection route"]
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
