# Appointment Registration Demonstration

[Back to subject group](../README.md)

Demonstrate a registration menu that uses status answers and a month to select a stored appointment response.

## Implementations

Memory versions isolate month and status calculations. Display and keypad versions add prompts and confirmation. Interrupt versions require an external event at particular stages. The accepted yes/no values differ, so follow the source-specific example.

| Implementation | Input | Output |
| --- | --- | --- |
| [LCD Status And Month Prompts](lcd-status-and-month-prompts/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Keypad Status And Month Entry](keypad-status-and-month-entry/README.md) | Keypad | LCD and internal result bytes |
| [Memory Dose State Update](ram-dose-state-update/README.md) | Values stored in memory | Internal memory |
| [LCD Registration Confirmation](lcd-registration-confirmation/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Interrupt Registration Validation](interrupt-registration-validation/README.md) | Keypad | LCD and internal result bytes |
| [LCD Registration Alternate Prompts](lcd-registration-alternate-prompts/README.md) | Stored values or prompted choices | LCD and internal result bytes |
| [Memory Registration Status Flags](ram-registration-status-flags/README.md) | Values stored in memory | Internal memory |
| [Keypad Appointment Display](keypad-appointment-display/README.md) | Keypad | LCD and internal result bytes |
| [Keypad Appointment Confirmation](keypad-appointment-confirmation/README.md) | Keypad | LCD and internal result bytes |
