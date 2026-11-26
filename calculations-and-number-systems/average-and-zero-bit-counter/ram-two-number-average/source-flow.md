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
B0["B1: instructions - lines 2 to 12"]
B1["B2: MIAN - lines 15 to 15"]
B2["B3: instructions - lines 17 to 22"]
B3["B4: ZEROOS - lines 25 to 26"]
B4["B5: instructions - lines 27 to 28"]
B5["B6: instructions - lines 29 to 29"]
B6["B7: BACK - lines 31 to 31"]
B7["B8: COUNT - lines 34 to 34"]
B8["B9: HERE - lines 36 to 39"]
B9["B10: instructions - lines 40 to 40"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B6
B3 -->|call| B7
B3 -->|after return| B4
B4 -->|call| B7
B4 -->|after return| B5
B5 -->|next| B6
B6 -->|jump| B6
B7 -->|next| B8
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|next| B10
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV R1,#2
MOV 40H,#23
MOV 41H,#25
MOV 42H,#0
MOV R5,#0F0H
MOV R6,#0F1H
MOV R7,#0
```

### B2

```asm
CJNE R1,#1,ZEROOS
```

### B3

```asm
MOV A,40H
ADD A,41H
MOV B,#2
DIV AB
MOV 42H,A
SJMP BACK
```

### B4

```asm
MOV A,R5
ACALL COUNT
```

### B5

```asm
MOV A,R6
ACALL COUNT
```

### B6

```asm
MOV 30H,R7
```

### B7

```asm
SJMP BACK
```

### B8

```asm
MOV R4,#7
```

### B9

```asm
MOV B,#2
DIV AB
MOV R0,B
CJNE R0,#0,NO
```

### B10

```asm
INC R7
```

## Section 2

```mermaid
flowchart TD
B10["B11: NO - lines 43 to 43"]
B11["B12: instructions - lines 45 to 45"]
B10 -->|condition true| B8
B10 -->|condition false| B11
B8["Continue at B9 in section 1"]
```

### B11

```asm
DJNZ R4,HERE
```

### B12

Return to the instruction following the active call.

```asm
RET
```
