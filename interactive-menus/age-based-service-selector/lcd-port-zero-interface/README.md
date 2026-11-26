# Age-Based Menu Demonstration

[Group overview](../../README.md) · [Compare implementations](../README.md)

Demonstrate a menu that selects a stored response according to an age band or another menu choice.

**Implementation:** LCD Port 0 Interface

**Input:** stored values or prompted choices.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | A menu choice and age |
| Output | A selected response code or stored message |

## Worked example

In the documented age-band calculation, age 21 selects response code 2. This is a classroom branch-selection example, not a medical recommendation.

### Calculation details

Exercise the checkup branch with the numeric age 21 in 31H. Integer division by 10 gives 2. That passes the first threshold and falls below 4, so the routine writes status 2 to 35H. This value is a program branch identifier.

## Program operation

1. Read menu choice.
2. Choose age-band or second menu route.
3. Read required age or choice.
4. Select archived response.
5. Store status or show message; follow menu or exit route.

### Functional flowchart

```mermaid
flowchart TD
N0["Read menu choice"] --> N1
N1["Choose age-band or second menu route"] --> N2
N2["Read required age or choice"] --> N3
N3["Select archived response"] --> N4
N4["Store status or show message; follow menu or exit route"]
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

**Port registers:** `P0`, `P0.0`, `P0.1`, `P0.2`, `P1.0`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.a51) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
