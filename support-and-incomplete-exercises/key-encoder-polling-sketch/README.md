# Key Encoder Polling Sketch

[Back to subject group](../README.md)

Read a key from an encoder, wait for release, and repeat. The main loop does not send the decoded key to a display.

## Implementations

LCD and serial helper routines exist in the file, but their presence does not mean the main loop uses them. This is an input-polling exercise.

| Implementation | Input | Output |
| --- | --- | --- |
| [Encoder Poll And Release](encoder-poll-and-release/README.md) | Keyboard encoder | Decoded value only |
