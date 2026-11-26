# Interrupt Driven Keypad Control

[Back to subject group](../README.md)

Respond to an external interrupt by decoding a key and sending the selected message.

## Implementations

This version enters its handler through an interrupt. An interrupt return resumes the interrupted program; it is different from repeatedly polling a key in the main loop.

| Implementation | Input | Output |
| --- | --- | --- |
| [External Interrupt Number Words](external-interrupt-number-words/README.md) | Keyboard encoder | LCD / serial by selected branch |
