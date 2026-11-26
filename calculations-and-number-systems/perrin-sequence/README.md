# Perrin Sequence

[Back to subject group](../README.md)

Generate a number sequence in which each new value is the sum of the values two and three places before it. Some versions also let you request a particular term.

## Implementations

Fixed starting values make the calculation easy to inspect. Entered starting values make it interactive. The indexed versions select a term; the custom-seed versions allow a different sequence. A length and a final index are not interchangeable: index 6 includes seven terms when counting from zero.

| Implementation | Input | Output | Implementation notes |
| --- | --- | --- | --- |
| [Sequence Menu Fixed Input Seeds](sequence-menu-preset-seeds/README.md) | See example | See example | Sequence and indexed-term menu or calculation |
| [Interrupt Menu User Seeds](interrupt-menu-user-seeds/README.md) | Keypad | LCD and internal result bytes | Sequence and indexed-term menu or calculation |
| [Keypad Menu User Seeds](keypad-menu-user-seeds/README.md) | Keypad | LCD and internal result bytes | Sequence and indexed-term menu or calculation |
| [Memory Sequence And Index](ram-sequence-and-index/README.md) | Values stored in memory | Internal memory | Sequence and indexed-term menu or calculation |
| [Keypad Indexed Sequence](keypad-indexed-sequence/README.md) | Keypad | LCD and internal result bytes | Final-index sequence calculation |
| [Keypad Indexed Sequence Revised](keypad-indexed-sequence-revised/README.md) | Keypad | LCD and internal result bytes | Final-index sequence calculation |
| [LCD Fixed Input Sixth Index](lcd-preset-sixth-index/README.md) | Stored values or prompted choices | LCD and internal result bytes | Final-index sequence calculation |
| [Keypad Sequence Length](keypad-sequence-length/README.md) | Keypad | LCD and internal result bytes | Final-index sequence calculation |
| [Memory Custom Seed Sequence](ram-custom-seed-sequence/README.md) | Values stored in memory | Internal memory | Custom starting terms |
| [Memory Custom Seed Pointer Variant](ram-custom-seed-pointer-variant/README.md) | Values stored in memory | Internal memory | Custom starting terms |
| [LCD Custom Seed Sequence](lcd-custom-seed-sequence/README.md) | Stored values or prompted choices | LCD and internal result bytes | Custom starting terms |
| [LCD Custom Seed Port 0 Interface](lcd-custom-seed-port-zero-interface/README.md) | Stored values or prompted choices | LCD and internal result bytes | Custom starting terms |
