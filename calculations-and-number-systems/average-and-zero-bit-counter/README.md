# Average Calculator and Binary Zero Counter

[Back to subject group](../README.md)

Either calculate the average of two numbers or count the zero bits in a binary value. These are two separate menu operations.

## Implementations

Some zero counters repeatedly divide by 2; others rotate one bit at a time through the carry flag. The loop length matters: a loop that examines seven or nine positions is not an eight-bit count. Input validation, repeat menus, and interrupt controls also differ.

| Implementation | Input | Output | Implementation notes |
| --- | --- | --- | --- |
| [Memory Two Number Average](ram-two-number-average/README.md) | Values stored in memory | Internal memory | Division-based bit inspection / arithmetic average |
| [Keypad Average Division Counter](keypad-average-division-counter/README.md) | Keypad | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [Interrupt Average Repeat Menu](interrupt-average-repeat-menu/README.md) | Keypad | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [LCD Fixed Input Average Counter](lcd-preset-average-counter/README.md) | Stored values or prompted choices | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [Interrupt Average Exit Menu](interrupt-average-exit-menu/README.md) | Keypad | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [Interrupt Average With Repeat](interrupt-average-with-repeat/README.md) | Keypad | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [Interrupt Average Rotate Counter](interrupt-average-rotate-counter/README.md) | Keypad | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [Memory Eight Bit Zero Counter](ram-eight-bit-zero-counter/README.md) | Values stored in memory | Internal memory | Rotate bits through carry for zero count |
| [Keypad Average Rotate Counter](keypad-average-rotate-counter/README.md) | Keypad | LCD and internal result bytes | Division-based bit inspection / arithmetic average |
| [LCD Fixed Input Rotate Counter](lcd-preset-rotate-counter/README.md) | Stored values or prompted choices | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Interrupt Average Bit Count](interrupt-average-bit-count/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Keypad Average Bit Count](keypad-average-bit-count/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Keypad Average Display Revision](keypad-average-display-revision/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Interrupt Average Display Revision](interrupt-average-display-revision/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Interrupt Average Status Wait](interrupt-average-status-wait/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Keypad Average Status Display](keypad-average-status-display/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [LCD Fixed Input Average Rotate](lcd-preset-average-rotate/README.md) | Stored values or prompted choices | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Memory Seven Zero Bit Example](ram-seven-zero-bit-example/README.md) | Values stored in memory | Internal memory | Rotate bits through carry for zero count |
| [Keypad Validated Average Count](keypad-validated-average-count/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
| [Interrupt Validated Average Count](interrupt-validated-average-count/README.md) | Keypad | LCD and internal result bytes | Rotate bits through carry for zero count |
