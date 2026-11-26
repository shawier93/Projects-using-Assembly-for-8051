# Date Based Discount

[Back to subject group](../README.md)

Choose a discount tier from a day value and calculate the amount payable.

## Implementations

The percentage versions calculate and subtract a discount. Earlier versions operate on whole tens: amount 29 can produce 25 when the units are retained, or 16 when they are dropped. These are materially different algorithms, not just display changes.

| Implementation | Input | Output | Implementation notes |
| --- | --- | --- | --- |
| [Interrupt Date Tier Payment](interrupt-date-tier-payment/README.md) | Keypad | LCD and internal result bytes | Whole-tens discount; units retained |
| [Keypad Date Tier Payment](keypad-date-tier-payment/README.md) | Keypad | LCD and internal result bytes | Whole-tens discount; units retained |
| [LCD Date Tier Payment](lcd-date-tier-payment/README.md) | Stored values or prompted choices | LCD and internal result bytes | Whole-tens discount; units retained |
| [Memory Date Tier Units Truncation](ram-date-tier-units-truncation/README.md) | Values stored in memory | Internal memory | Whole-tens discount; units discarded |
| [LCD Percentage Discount](lcd-percentage-discount/README.md) | Stored values or prompted choices | LCD and internal result bytes | Percentage of amount, then subtraction |
| [Memory Percentage Discount](ram-percentage-discount/README.md) | Values stored in memory | Internal memory | Percentage of amount, then subtraction |
| [Interrupt Percentage Discount](interrupt-percentage-discount/README.md) | Keypad | LCD and internal result bytes | Percentage of amount, then subtraction |
| [Keypad Percentage Discount](keypad-percentage-discount/README.md) | Keypad | LCD and internal result bytes | Percentage of amount, then subtraction |
