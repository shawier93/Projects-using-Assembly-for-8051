# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 6 to 6"]
B1["B2: Y1 - lines 8 to 9"]
B2["B3: instructions - lines 10 to 10"]
B3["B4: instructions - lines 11 to 11"]
B4["B5: instructions - lines 12 to 12"]
B5["B6: Y2 - lines 15 to 15"]
B6["B7: instructions - lines 16 to 16"]
B7["B8: instructions - lines 17 to 17"]
B8["B9: instructions - lines 18 to 18"]
B9["B10: STOP - lines 20 to 20"]
B0 -->|next| B1
B1 -->|condition true| B5
B1 -->|condition false| B2
B2 -->|call| B10
B2 -->|after return| B3
B3 -->|call| B14
B3 -->|after return| B4
B4 -->|jump| B1
B5 -->|condition true| B1
B5 -->|condition false| B6
B6 -->|call| B13
B6 -->|after return| B7
B7 -->|call| B14
B7 -->|after return| B8
B8 -->|jump| B1
B9 -->|jump| B9
B10["Continue at B11 in section 2"]
B14["Continue at B15 in section 2"]
B13["Continue at B14 in section 2"]
```

### B1

```asm
MOV 50H,#'2'
```

### B2

```asm
MOV A,50H
CJNE A,#'1',Y2
```

### B3

```asm
ACALL BinToDec
```

### B4

```asm
ACALL CONVERT
```

### B5

```asm
SJMP Y1
```

### B6

```asm
CJNE A,#'2',Y1
```

### B7

```asm
ACALL HexToDec
```

### B8

```asm
ACALL CONVERT
```

### B9

```asm
SJMP Y1
```

### B10

```asm
SJMP $
```

## Section 2

```mermaid
flowchart TD
B10["B11: BINTODEC - lines 23 to 26"]
B11["B12: LOOP - lines 29 to 42"]
B12["B13: instructions - lines 43 to 44"]
B13["B14: HEXTODEC - lines 48 to 65"]
B14["B15: CONVERT - lines 68 to 84"]
B10 -->|next| B11
B11 -->|condition true| B11
B11 -->|condition false| B12
```

### B11

```asm
MOV R6,#0
MOV DPTR,#BINARY
MOV R0,#8
MOV R7,#128
```

### B12

```asm
CLR A
MOVC A,@A+DPTR
CLR C
SUBB A,#30H
MOV B ,R7
MUL AB
ADD A ,R6
MOV R6 ,A
MOV A,R7
MOV B,#2
DIV AB
MOV R7,A
INC DPTR
DJNZ R0,LOOP
```

### B13

Return to the instruction following the active call.

```asm
MOV 40H ,R6
RET
```

### B14

Return to the instruction following the active call.

```asm
MOV R6,#16
MOV DPTR ,#HEX
CLR A
MOVC A,@A+DPTR
CLR C
SUBB A,#30H
MOV B,R6
MUL AB
MOV R7,A
INC DPTR
CLR A
MOVC A,@A+DPTR
CLR C
SUBB A,#30H
ADD A,R7
MOV 40H,A
RET
```

### B15

Return to the instruction following the active call.

```asm
MOV A,40H
MOV R1,A
MOV B,#100
DIV AB
ADD A,#30H
MOV 40H,A
MOV A,B
MOV B,#10
DIV AB
ADD A,#30H
MOV 41H,A
MOV A,B
ADD A,#30H
MOV 42H,A
RET
```
