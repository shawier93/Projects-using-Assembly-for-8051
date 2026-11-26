# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG` begins at B1.

## Navigation

[Section 1](#section-1)

## Destinations requiring review

`BACK`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
18: SET BP1.2
28: SETBP1.5
```

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 5 to 8"]
B1["B2: instructions - lines 9 to 10"]
B2["B3: instructions - lines 11 to 11"]
B3["B4: AGAIN - lines 12 to 12"]
B4["B5: DATA_DISPLAY - lines 16 to 16"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: instructions - lines 19 to 22"]
B7["B8: READY - lines 24 to 26"]
B8["B9: instructions - lines 29 to 30"]
B9["B10: instructions - lines 31 to 31"]
B0 -->|call| B4
B0 -->|after return| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B0
B3 -->|jump| B3
B4 -->|call| B7
B4 -->|after return| B5
B8 -->|condition true| BX1
B8 -->|condition false| B9
BX1["Unresolved destination: BACK"]
```

### B1

```asm
MOV DPTR,#STRING
CLR A
MOVC A,@A+DPTR
ACALL DATA_DISPLAY
```

### B2

```asm
INC DPTR
JZ AGAIN
```

### B3

```asm
SJMP START
```

### B4

```asm
SJMP AGAIN
```

### B5

```asm
ACALL READY
```

### B6

```asm
MOV P1,A
```

### B7

Return to the instruction following the active call.

```asm
CLR P1.3
SETB P1.5
CLR P1.5
RET
```

### B8

```asm
SETB P1.7
CLR P1.2
SETB P1.5
```

### B9

```asm
CLR P1.5
JB P1.7,BACK
```

### B10

Return to the instruction following the active call.

```asm
RET
```
