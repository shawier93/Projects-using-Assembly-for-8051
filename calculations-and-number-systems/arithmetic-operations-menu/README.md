# Number and Bit Operations

[Back to subject group](../README.md)

Use a menu to explore addition, binary display, bit complement, and duplication operations.

## Implementations

The memory version exposes internal results. LCD versions show menu choices and results. The interrupt version adds an external control event. The complement branch is different from arithmetic negation: it flips bits.

| Implementation | Input | Output |
| --- | --- | --- |
| [Interrupt Bit Transformation Menu](interrupt-bit-transformation-menu/README.md) | Keypad | LCD and internal result bytes |
| [LCD Bit Transformation Menu](lcd-bit-transformation-menu/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Memory Complement And Duplication](ram-complement-and-duplication/README.md) | Values stored in memory | Internal memory |
