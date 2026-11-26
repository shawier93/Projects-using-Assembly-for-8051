# Coffee Machine

[Group overview](../../README.md) · [Compare implementations](../README.md)

Choose a drink and options, calculate its price, and process the credit available for the purchase.

**Implementation:** Keypad Order Completion

**Input:** keypad.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Credit, drink type, cup size, and supported milk or sugar choices |
| Output | Selected drink price and, where implemented, balance or insufficient-credit feedback |

## Worked example

A fractional-price calculation of 2.75 plus 0.50 gives 3.25: 125 hundredths become one whole unit and 25 hundredths.

### Calculation details

In the drink-type branch choose option 1. After conversion to the numeric menu value, comparison with 1 succeeds and the program writes 2 to 33H. This is the base price before the cup-size and extra-option steps.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Read credit and drink selection"] --> B["Select base price"]
B --> C["Read size, milk, and sugar options"]
C --> D["Apply supported extra charges"]
D --> E["Normalize fractional price if used"]
E --> F["Compare charge and credit where implemented"]
F --> G{"Credit accepted?"}
G -->|Yes| H["Calculate remaining credit and completion output"]
G -->|No| I["Additional-credit or rejection route"]
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

**Port registers:** `P0`, `P1`, `P1.2`, `P1.3`, `P1.4`, `P1.5`, `P1.6`, `P1.7`, `P2`, `P2.0`, `P2.1`, `P2.2`, `P2.3`, `P2.4`, `P2.5`, `P2.6`, `P2.7`, `p2`, `p2.0`, `p2.1`, `p2.2`, `p2.3`, `p2.4`, `p2.5`, `p2.6`, `p2.7`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
