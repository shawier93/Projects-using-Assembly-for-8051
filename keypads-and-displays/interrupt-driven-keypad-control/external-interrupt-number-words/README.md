# Interrupt Driven Keypad Control

[Group overview](../../README.md) · [Compare implementations](../README.md)

Respond to an external interrupt by decoding a key and sending the selected message.

**Implementation:** External Interrupt Number Words

**Input:** keyboard encoder.  
**Output:** LCD / serial by selected branch.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | External interrupt 1 and an encoder key |
| Output | A response on the LCD and serial interface |

## Worked example

For decoded key 1, the documented handler sends ONE. The serial sequence begins with a carriage return.

### Calculation details

Trigger external interrupt 1 with decoded key 1. A equals 31H, so the handler clears the LCD and transmits a carriage return. It sends O, N and E to COUT and WRDATA. The serial byte sequence is 0DH, 4FH, 4EH, 45H, and the LCD receives ONE.

## Program operation

1. Initialize interrupt support.
2. External interrupt enters handler.
3. Decode key and choose response.
4. Send response through output routines.
5. Return from interrupt to suspended program.

### Functional flowchart

```mermaid
flowchart TD
N0["Initialize interrupt support"] --> N1
N1["External interrupt enters handler"] --> N2
N2["Decode key and choose response"] --> N3
N3["Send response through output routines"] --> N4
N4["Return from interrupt to suspended program"]
```

[Detailed control flow](source-flow.md)

### Simplified block diagram

```mermaid
flowchart TD
A["Input: Keyboard encoder"] -->|Values or events| B["8051 application logic"]
B -->|Working values| C["Registers and internal memory"]
C -->|Saved values| B
B -->|Results or control signals| E["Output: LCD / serial by selected branch"]
```

**Port registers:** `P1`, `P2`, `P3.2`, `P3.5`, `P3.6`, `P3.7`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
