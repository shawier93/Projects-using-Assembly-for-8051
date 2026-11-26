# Coffee Machine

[Back to subject group](../README.md)

Choose a drink and options, calculate its price, and process the credit available for the purchase.

## Implementations

The whole-unit versions use simpler prices. Fractional-price versions maintain whole and fractional parts. Switch versions read port bits; keypad versions ask for each selection. Completion messages and credit-handling paths differ.

| Implementation | Input | Output | Implementation notes |
| --- | --- | --- | --- |
| [Keypad Order Price Display](keypad-order-price-display/README.md) | Keypad | LCD and internal result bytes | Whole-unit price calculations |
| [Keypad Order Completion](keypad-order-completion/README.md) | Keypad | LCD and internal result bytes | Whole-unit price calculations |
| [Switch Selected Drink Options](switch-selected-drink-options/README.md) | Switch or port inputs | Port feedback and available output routines | Whole-unit price calculations |
| [Keypad Fractional Price Order](keypad-fractional-price-order/README.md) | Keypad | LCD and internal result bytes | Separate whole and fractional price parts |
| [Keypad Fractional Price Alternate](keypad-fractional-price-alternate/README.md) | Keypad | LCD and internal result bytes | Separate whole and fractional price parts |
| [Switch Price Normalization](switch-price-normalization/README.md) | Switch or port inputs | Port feedback and available output routines | Separate whole and fractional price parts |
| [Keypad Fractional Price Revised](keypad-fractional-price-revised/README.md) | Keypad | LCD and internal result bytes | Separate whole and fractional price parts |
| [Switch Price Led Feedback](switch-price-led-feedback/README.md) | Switch or port inputs | Port feedback and available output routines | Separate whole and fractional price parts |
