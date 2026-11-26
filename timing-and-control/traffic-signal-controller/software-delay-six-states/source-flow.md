# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: LOOP - lines 5 to 8"]
B1["B2: instructions - lines 9 to 12"]
B2["B3: instructions - lines 13 to 16"]
B3["B4: instructions - lines 17 to 20"]
B4["B5: instructions - lines 21 to 24"]
B5["B6: instructions - lines 25 to 28"]
B6["B7: instructions - lines 29 to 29"]
B7["B8: DELAY - lines 32 to 34"]
B8["B9: HERE - lines 35 to 35"]
B9["B10: HERE1 - lines 36 to 36"]
B0 -->|call| B7
B0 -->|after return| B1
B1 -->|call| B7
B1 -->|after return| B2
B2 -->|call| B7
B2 -->|after return| B3
B3 -->|call| B7
B3 -->|after return| B4
B4 -->|call| B7
B4 -->|after return| B5
B5 -->|call| B7
B5 -->|after return| B6
B6 -->|jump| B0
B7 -->|next| B8
B8 -->|condition true| B8
B8 -->|condition false| B9
B9 -->|condition true| B9
B9 -->|condition false| B10
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV P1,#00000001B
MOV P2,#00000100B
MOV P3,#00000100B
ACALL DELAY
```

### B2

```asm
MOV P1,#00000010B
MOV P2,#00000010B
MOV P3,#00000100B
ACALL DELAY
```

### B3

```asm
MOV P1,#00000100B
MOV P2,#00000001B
MOV P3,#00000100B
ACALL DELAY
```

### B4

```asm
MOV P1,#00000100B
MOV P2,#00000010B
MOV P3,#00000010B
ACALL DELAY
```

### B5

```asm
MOV P1,#00000100B
MOV P2,#00000100B
MOV P3,#00000001B
ACALL DELAY
```

### B6

```asm
MOV P1,#00000010B
MOV P2,#00000100B
MOV P3,#00000010B
ACALL DELAY
```

### B7

```asm
AJMP LOOP
```

### B8

```asm
MOV R7,#0FFH
MOV R6,#0FFH
MOV R5,#0FFH
```

### B9

```asm
DJNZ R6,HERE
```

### B10

```asm
DJNZ R7,HERE1
```

## Section 2

```mermaid
flowchart TD
B10["B11: HERE2 - lines 37 to 37"]
B11["B12: instructions - lines 38 to 38"]
B10 -->|condition true| B10
B10 -->|condition false| B11
```

### B11

```asm
DJNZ R5,HERE2
```

### B12

Return to the instruction following the active call.

```asm
RET
```
