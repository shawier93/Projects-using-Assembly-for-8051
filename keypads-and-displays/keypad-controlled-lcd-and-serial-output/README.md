# Keypad Controlled LCD And Serial Output

[Back to subject group](../README.md)

Use an encoder key to select a message and send characters to the LCD and serial interface.

## Implementations

The word-selection and transmit revisions differ in their branches and output sequences. Follow the example for the selected implementation rather than assuming every key behaves identically.

| Implementation | Input | Output |
| --- | --- | --- |
| [Encoder Serial Number Words](encoder-uart-number-words/README.md) | Keyboard encoder | LCD / serial by selected branch |
| [Encoder Number Word Selector](encoder-number-word-selector/README.md) | Keyboard encoder | LCD / serial by selected branch |
| [Encoder Number Word Transmit Revision](encoder-number-word-transmit-revision/README.md) | Keyboard encoder | LCD / serial by selected branch |
