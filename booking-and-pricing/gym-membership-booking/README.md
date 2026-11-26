# Gym Membership Booking

[Back to subject group](../README.md)

Select a membership plan and billing term, then use the corresponding price and availability.

## Implementations

One set organizes stock and price by plan and term. Another includes duration entry. Memory, LCD, keypad, and interrupt versions expose the same type of decision through different interfaces.

| Implementation | Input | Output |
| --- | --- | --- |
| [Interrupt Plan Stock Price](interrupt-plan-stock-price/README.md) | Keypad | LCD and internal result bytes |
| [Keypad Plan Stock Price](keypad-plan-stock-price/README.md) | Keypad | LCD and internal result bytes |
| [LCD Plan Stock Price](lcd-plan-stock-price/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Memory Plan Stock Price](ram-plan-stock-price/README.md) | Values stored in memory | Internal memory |
| [Interrupt Membership Duration](interrupt-membership-duration/README.md) | Keypad | LCD and internal result bytes |
| [Memory Membership Duration](ram-membership-duration/README.md) | Values stored in memory | Internal memory |
| [LCD Membership Duration Modified](lcd-membership-duration-modified/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Keypad Membership Duration](keypad-membership-duration/README.md) | Keypad | LCD and internal result bytes |
| [LCD Membership Duration](lcd-membership-duration/README.md) | Stored values or prompted choices | LCD and internal result bytes |
