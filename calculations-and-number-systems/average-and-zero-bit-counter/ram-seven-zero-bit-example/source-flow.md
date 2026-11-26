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
B0["B1: X0 - lines 4 to 6"]
B1["B2: X1 - lines 9 to 17"]
B2["B3: X2 - lines 20 to 20"]
B3["B4: instructions - lines 21 to 24"]
B4["B5: X - lines 27 to 28"]
B5["B6: instructions - lines 29 to 29"]
B6["B7: instructions - lines 30 to 30"]
B7["B8: ZEROS - lines 33 to 34"]
B8["B9: instructions - lines 35 to 35"]
B9["B10: X3 - lines 38 to 38"]
B0 -->|condition true| B2
B0 -->|condition false| B1
B1 -->|jump| B1
B2 -->|condition true| B9
B2 -->|condition false| B3
B3 -->|next| B4
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|condition true| B4
B5 -->|condition false| B6
B6 -->|jump| B6
B7 -->|condition true| B4
B7 -->|condition false| B8
B8 -->|jump| B8
B9 -->|condition true| B0
B9 -->|condition false| B10
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV R3,#2
CJNE R3,#1,X2
```

### B2

```asm
MOV R0,#39
MOV A,R0
SUBB A,#1
ADD A,R0
MOV B,#2
DIV AB
MOV R6,A
SJMP $
```

### B3

```asm
CJNE R3,#2,X3
```

### B4

```asm
MOV R0,#40H
MOV R1,#8
MOV 20H,#0
MOV A,R0
```

### B5

```asm
RRC A
JNC ZEROS
```

### B6

```asm
DJNZ R1,X
```

### B7

```asm
SJMP $
```

### B8

```asm
INC 20H
DJNZ R1,X
```

### B9

```asm
SJMP $
```

### B10

```asm
CJNE A,#3, X0
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 39 to 39"]
B10 -->|jump| B10
```

### B11

```asm
SJMP $
```
