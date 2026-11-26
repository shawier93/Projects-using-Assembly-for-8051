# Math Practice and Scoring

[Group overview](../../README.md) · [Compare implementations](../README.md)

Present arithmetic questions, compare the answers with the program’s answer key, and update a score.

**Implementation:** Interrupt Gated Answer Assessment

**Input:** keypad.  
**Output:** LCD and internal result bytes.

## Inputs and results

| Parameter | Description |
| --- | --- |
| Input | An answer for each question |
| Output | Correct-answer feedback, retry feedback, and score |

## Worked example

For the question 5 + 2, enter 7. The answer matches and the score increases according to that question’s weight.

### Calculation details

The ROM tables begin with 5 and 2. The first pair adds to 7 and the program stores 07H at 18H. The next pairs compute 5 − 1 = 4, 2 × 6 = 12 and 12 ÷ 2 = 6, stored at 19H, 20H and 21H. These are the quiz answer bytes.

## Program operation

### Functional flowchart

```mermaid
flowchart TD
A["Initialize questions, answer key, and score"] --> B["Present next question"]
B --> C["Read stored or entered answer"]
C --> D{"Answer matches key?"}
D -->|Yes| E["Apply correct-answer score"]
D -->|No| F["Apply this version's error or penalty rule"]
F --> G["Retry or termination branch; see source flow"]
E --> H{"Questions remain?"}
H -->|Yes| B
H -->|No| I["Final score or end message"]
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

**Port registers:** `P0`, `P0.0`, `P0.3`, `P0.4`, `P0.7`, `P1`, `P1.2`, `P1.3`, `P1.4`, `P1.5`, `P1.6`, `P1.7`, `P3.2`, `p1.0`, `p1.2`.

## Technical limitations

No additional defect was recorded in the earlier source review. This is not evidence of a successful build or hardware test.

## Build and test

1. Open the [assembly source](source.asm) in an 8051 assembler or simulator.
2. Review the technical limitations and configure the peripherals required by this implementation.
3. Check the expected result using the example inputs.
