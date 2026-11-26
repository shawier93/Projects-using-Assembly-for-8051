# Insurance Quotation

[Back to subject group](../README.md)

Calculate an example policy price from a category and selected options.

## Implementations

Preset and keypad versions use different sample selections. Some versions use indicator outputs; others show the total on an LCD. Subscription handling in these sources subtracts a value; it should not be described as real-world insurance pricing.

| Implementation | Input | Output |
| --- | --- | --- |
| [Keypad Policy Options](keypad-policy-options/README.md) | Keypad | LCD and internal result bytes |
| [Led Policy Pricing Draft](led-policy-pricing-draft/README.md) | See example | See example |
| [Memory Policy Pricing](ram-policy-pricing/README.md) | Values stored in memory | Internal memory |
| [Interrupt Policy Options](interrupt-policy-options/README.md) | Keypad | LCD and internal result bytes |
