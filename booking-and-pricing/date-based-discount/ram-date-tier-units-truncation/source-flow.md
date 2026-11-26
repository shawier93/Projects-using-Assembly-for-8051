# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 6"]
B1["B2: CHECK - lines 9 to 19"]
B2["B3: instructions - lines 20 to 20"]
B3["B4: instructions - lines 21 to 22"]
B4["B5: instructions - lines 23 to 23"]
B5["B6: DISCO1 - lines 26 to 26"]
B6["B7: instructions - lines 27 to 28"]
B7["B8: instructions - lines 29 to 29"]
B8["B9: DISCO2 - lines 32 to 32"]
B9["B10: instructions - lines 33 to 34"]
B0 -->|next| B1
B1 -->|condition true| B8
B1 -->|condition false| B2
B2 -->|condition true| B5
B2 -->|condition false| B3
B3 -->|call| B13
B3 -->|after return| B4
B4 -->|jump| B1
B5 -->|condition true| B8
B5 -->|condition false| B6
B6 -->|call| B13
B6 -->|after return| B7
B7 -->|jump| B1
B8 -->|condition true| B11
B8 -->|condition false| B9
B9 -->|call| B13
B9 -->|after return| B10
B13["Continue at B14 in section 2"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#27H
MOV 31H,#9
MOV 32H,#0
MOV 33H,#0
```

### B2

```asm
MOV A,31H
MOV B,#1
SUBB A,B
MOV B,#10
DIV AB
MOV R1,B
CJNE A,#0H, DISCO2
```

### B3

```asm
CJNE R1,#0H, DISCO1
```

### B4

```asm
MOV 32H,#0
ACALL COST
```

### B5

```asm
AJMP CHECK
```

### B6

```asm
CJNE A,#0H, DISCO2
```

### B7

```asm
MOV 32H,#1
ACALL COST
```

### B8

```asm
AJMP CHECK
```

### B9

```asm
CJNE A,#1H, FREE
```

### B10

```asm
MOV 32H,#2
ACALL COST
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 35 to 35"]
B11["B12: FREE - lines 38 to 39"]
B12["B13: instructions - lines 40 to 40"]
B13["B14: COST - lines 45 to 58"]
B10 -->|jump| B1
B11 -->|call| B13
B11 -->|after return| B12
B12 -->|jump| B1
B1["Continue at B2 in section 1"]
```

### B11

```asm
AJMP CHECK
```

### B12

```asm
MOV 32H,#10
ACALL COST
```

### B13

```asm
AJMP CHECK
```

### B14

Return to the instruction following the active call.

```asm
MOV A,30H
MOV B,#10
DIV AB
MOV R3,A
MOV A,#10
SUBB A,32H
MOV B,A
MOV A,R3
MUL AB
MOV 33H,A
RET
```
