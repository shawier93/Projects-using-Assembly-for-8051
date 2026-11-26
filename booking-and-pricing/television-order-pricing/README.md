# Television Order Pricing

[Back to subject group](../README.md)

Build a television order price from a brand and optional services.

## Implementations

The calculation-only version uses fixed option bytes. Keypad versions collect options. Indicator and interrupt versions add different feedback and control paths. They share a pricing exercise, not a current retail price list.

| Implementation | Input | Output |
| --- | --- | --- |
| [Memory Brand Service Pricing](ram-brand-service-pricing/README.md) | Values stored in memory | Internal memory |
| [Interrupt Brand Order Validation](interrupt-brand-order-validation/README.md) | Keypad | LCD and internal result bytes |
| [Interrupt Brand Order Menu](interrupt-brand-order-menu/README.md) | Keypad | LCD and internal result bytes |
| [Led Brand Service Pricing](led-brand-service-pricing/README.md) | See example | See example |
| [Keypad Brand Service Pricing](keypad-brand-service-pricing/README.md) | Keypad | LCD and internal result bytes |
