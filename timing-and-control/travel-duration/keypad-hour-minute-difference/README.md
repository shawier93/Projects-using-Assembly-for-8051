# Travel Duration

[Group overview](../../README.md) · [Compare implementations](../README.md)

Subtract departure time from arrival time and format the elapsed hours and minutes.

**Implementation:** Keypad Hour Minute Difference

**Input:** keypad.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | Departure and arrival hours and minutes |
| Output | Elapsed time on the display |

## Worked example

Departure 09:15 and arrival 10:45 give 1 hour 30 minutes. The source separates the displayed fields with a slash.

### Calculation details

Enter arrival 10:45 and departure 09:15. Hours subtract to 1 and minutes to 30. No minute borrow is required. With carry clear at the initial subtraction, 40H holds 01H and 41H holds 1EH. The display code separates the fields with a slash.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Read departure and arrival times"] --> B{"Arrival minutes less than departure minutes?"}
B -->|Yes| C["Borrow one hour and add 60 minutes"]
B -->|No| D["Keep hour and minute fields"]
C --> E["Subtract minute fields"]
D --> E
E --> F["Subtract hour fields with any borrow"]
F --> G["Format hours and minutes"]
G --> H["Display elapsed time"]
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

**Port registers:** `P0`, `P0.4`, `P0.6`, `P1`, `P1.2`, `P1.3`, `P1.4`, `P1.5`, `P1.6`, `P1.7`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
