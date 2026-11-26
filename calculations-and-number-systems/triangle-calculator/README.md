# Triangle Calculator

[Back to subject group](../README.md)

Calculate a triangle’s area from its base and height, or its perimeter from three side lengths.

## Implementations

Memory versions expose results in the debugger. Display versions format them on an LCD. Keypad versions read dimensions at runtime. One draft divides the area product by 10 instead of 2; its result is intentionally documented as incorrect.

| Implementation | Input | Output | Implementation notes |
| --- | --- | --- | --- |
| [LCD Area And Perimeter](lcd-area-and-perimeter/README.md) | Stored values or prompted choices | LCD and internal result bytes | Area by division by 2; perimeter by addition |
| [Interrupt Triangle Dimensions](interrupt-triangle-dimensions/README.md) | Keypad | LCD and internal result bytes | Area by division by 2; perimeter by addition |
| [Keypad Triangle Board Adaptation](keypad-triangle-board-adaptation/README.md) | Keypad | LCD and internal result bytes | Area by division by 2; perimeter by addition |
| [Keypad Triangle Dimensions](keypad-triangle-dimensions/README.md) | Keypad | LCD and internal result bytes | Area by division by 2; perimeter by addition |
| [LCD Area Divisor Ten](lcd-area-divisor-ten/README.md) | Stored values or prompted choices | LCD and internal result bytes | Area divides product by 10: known defect |
| [LCD Triangle Serial Support](lcd-triangle-serial-support/README.md) | Stored values or prompted choices | LCD and internal result bytes | Area by division by 2; perimeter by addition |
| [Memory Area With Remainder](ram-area-with-remainder/README.md) | Values stored in memory | Internal memory | Area by division by 2; perimeter by addition |
| [Memory Perimeter Result](ram-perimeter-result/README.md) | Values stored in memory | Internal memory | Preset perimeter example |
| [Memory Perimeter Format Variant](ram-perimeter-format-variant/README.md) | Values stored in memory | Internal memory | Preset perimeter example |
