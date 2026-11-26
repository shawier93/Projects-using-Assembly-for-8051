# External Pulse Counter

[Back to subject group](../README.md)

Count external pulses and display the count when the display event is detected.

## Implementations

Timer 0 is used as an event counter rather than a time delay. The code clears the count when a sampled value equals 10; it does not implement a general multi-digit decimal counter.

| Implementation | Input | Output |
| --- | --- | --- |
| [Timer Zero Pulse Display](timer-zero-pulse-display/README.md) | External pulses and display event | LCD count |
