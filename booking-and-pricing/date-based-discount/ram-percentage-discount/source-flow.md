# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 5"]
B1["B2: MAINMENUE - lines 8 to 11"]
B2["B3: instructions - lines 12 to 13"]
B3["B4: CASE2 - lines 16 to 16"]
B4["B5: CASE3 - lines 18 to 18"]
B5["B6: instructions - lines 20 to 21"]
B6["B7: CASE4 - lines 23 to 23"]
B7["B8: CASE5 - lines 25 to 25"]
B8["B9: instructions - lines 27 to 28"]
B9["B10: CASE6 - lines 31 to 32"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B10
B3 -->|condition true| B4
B3 -->|condition false| B4
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|jump| B10
B6 -->|condition true| B7
B6 -->|condition false| B7
B7 -->|condition true| B9
B7 -->|condition false| B8
B8 -->|jump| B10
B9 -->|jump| B10
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV R3,#20
MOV R4,#12
MOV R5,#0
```

### B2

```asm
MOV A,R4
SUBB A,#1
CJNE A,#0H,CASE2
```

### B3

```asm
MOV R5,#0H
AJMP CALC
```

### B4

```asm
CJNE A,#10, CASE3
```

### B5

```asm
JNC CASE4
```

### B6

```asm
MOV R5,#1
AJMP CALC
```

### B7

```asm
CJNE A,#20, CASE5
```

### B8

```asm
JNC CASE6
```

### B9

```asm
MOV R5,#2
AJMP CALC
```

### B10

```asm
MOV R5,#10
AJMP CALC
```

## Section 2

```mermaid
flowchart TD
B10["B11: CALC - lines 37 to 45"]
```

### B11

```asm
MOV B,R5
MOV A,R3
MUL AB
MOV B,#10
DIV AB
MOV R5,A
MOV A,R3
SUBB A,R5
MOV R6,A
```
