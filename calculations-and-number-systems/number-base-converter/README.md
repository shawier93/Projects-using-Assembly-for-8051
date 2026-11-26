# Number Base Converter

[Back to subject group](../README.md)

Convert a binary or hexadecimal-position number into decimal digits.

## Implementations

Stored-input versions read fixed character tables. Keypad versions collect digits. The hexadecimal routines must be checked individually: subtracting the character code for 0 only converts characters 0–9, so it does not by itself support A–F.

| Implementation | Input | Output |
| --- | --- | --- |
| [Stored Hex To Decimal](rom-hex-to-decimal/README.md) | See example | See example |
| [Interrupt Base Conversion](interrupt-base-conversion/README.md) | Keypad | LCD and internal result bytes |
| [LCD Fixed Input Base Conversion](lcd-preset-base-conversion/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Keypad Base Conversion](keypad-base-conversion/README.md) | Keypad | LCD and internal result bytes |
| [Interrupt Binary Hex Conversion](interrupt-binary-hex-conversion/README.md) | Keypad | LCD and internal result bytes |
| [Keypad Binary Hex Conversion](keypad-binary-hex-conversion/README.md) | Keypad | LCD and internal result bytes |
| [LCD Binary Hex Conversion](lcd-binary-hex-conversion/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Memory Binary Weight Accumulation](ram-binary-weight-accumulation/README.md) | Values stored in memory | Internal memory |
