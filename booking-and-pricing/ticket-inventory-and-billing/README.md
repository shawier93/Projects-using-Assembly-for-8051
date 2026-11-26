# Gold and Silver Ticket Booking

[Back to subject group](../README.md)

Select gold or silver tickets, calculate the charge, and update the stored number of tickets.

## Implementations

Some versions use price tables; others use direct constants. Preset versions demonstrate a specific class and quantity. Keypad and interrupt versions add interaction. A comparison that checks stock against itself cannot reject an oversized request, even if the normal example works.

| Implementation | Input | Output |
| --- | --- | --- |
| [Memory Stock And Price Tables](ram-stock-and-price-tables/README.md) | Values stored in memory | Internal memory |
| [Keypad Booking Stock Check](keypad-booking-stock-check/README.md) | Keypad | LCD and internal result bytes |
| [LCD Booking Stock Tables](lcd-booking-stock-tables/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Interrupt Booking Stock Tables](interrupt-booking-stock-tables/README.md) | Keypad | LCD and internal result bytes |
| [Interrupt Ticket Price Selection](interrupt-ticket-price-selection/README.md) | Keypad | LCD and internal result bytes |
| [LCD Fixed Input Ticket Order](lcd-preset-ticket-order/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Keypad Ticket Price Selection](keypad-ticket-price-selection/README.md) | Keypad | LCD and internal result bytes |
| [Memory Silver Ticket Order](ram-silver-ticket-order/README.md) | Values stored in memory | Internal memory |
| [Interrupt Gold Silver Inventory](interrupt-gold-silver-inventory/README.md) | Keypad | LCD and internal result bytes |
| [Keypad Gold Silver Inventory](keypad-gold-silver-inventory/README.md) | Keypad | LCD and internal result bytes |
| [LCD Gold Silver Inventory](lcd-gold-silver-inventory/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Memory Gold Stock Comparison](ram-gold-stock-comparison/README.md) | Values stored in memory | Internal memory |
