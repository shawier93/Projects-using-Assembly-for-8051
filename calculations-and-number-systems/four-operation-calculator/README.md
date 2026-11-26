# Four Operation Calculator

[Back to subject group](../README.md)

Choose addition, subtraction, multiplication, or division for two numbers.

## Implementations

The calculation-only versions use values already in memory. Interactive versions add prompts and keypad entry. Timer-delay and software-delay versions differ in how they wait between display operations. Interrupt versions introduce an external start or continue event.

| Implementation | Input | Output |
| --- | --- | --- |
| [LCD Fixed Input Operands](lcd-preset-operands/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Interrupt Enabled Keypad Calculator](interrupt-enabled-keypad-calculator/README.md) | Keypad | LCD and internal result bytes |
| [Keypad Calculator Timer Delay](keypad-calculator-timer-delay/README.md) | Keypad | LCD and internal result bytes |
| [Keypad Calculator Board Adaptation](keypad-calculator-board-adaptation/README.md) | Keypad | LCD and internal result bytes |
| [LCD Software Delay Calculator](lcd-software-delay-calculator/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Memory Four Operations](ram-four-operations/README.md) | Values stored in memory | Internal memory |
| [Memory Invalid Selection Handling](ram-invalid-selection-handling/README.md) | Values stored in memory | Internal memory |
