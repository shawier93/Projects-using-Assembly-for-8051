# Math Practice and Scoring

[Back to subject group](../README.md)

Present arithmetic questions, compare the answers with the program’s answer key, and update a score.

## Implementations

One version uses fixed answers in memory. Another computes an answer key from operand tables. Table-driven versions store the operation, operands, expected answer, and score weight together. Their retry and penalty rules must be read separately; they are not all the same quiz.

| Implementation | Input | Output | Implementation notes |
| --- | --- | --- | --- |
| [Fixed Input Answers Weighted Score](preset-answers-weighted-score/README.md) | Values stored in memory | Internal memory | Fixed answer bytes and score penalties |
| [Interrupt Gated Answer Assessment](interrupt-gated-answer-assessment/README.md) | Keypad | LCD and internal result bytes | Answer key calculated from operand tables |
| [Keypad Answer Assessment](keypad-answer-assessment/README.md) | Keypad | LCD and internal result bytes | Answer key calculated from operand tables |
| [LCD Table Driven Scoring](lcd-table-driven-scoring/README.md) | Stored values or prompted choices | LCD and internal result bytes | Question records include answer and score weight |
| [Interrupt Table Driven Scoring](interrupt-table-driven-scoring/README.md) | Keypad | LCD and internal result bytes | Question records include answer and score weight |
| [Keypad Scoring Board Adaptation](keypad-scoring-board-adaptation/README.md) | Keypad | LCD and internal result bytes | Question records include answer and score weight |
| [Keypad Table Driven Scoring](keypad-table-driven-scoring/README.md) | Keypad | LCD and internal result bytes | Question records include answer and score weight |
| [LCD Scoring Port 0 Interface](lcd-scoring-port-zero-interface/README.md) | Stored values or prompted choices | LCD and internal result bytes | Question records include answer and score weight |
| [Keypad Scoring Exercise Variant](keypad-scoring-exercise-variant/README.md) | Keypad | LCD and internal result bytes | Question records include answer and score weight |
