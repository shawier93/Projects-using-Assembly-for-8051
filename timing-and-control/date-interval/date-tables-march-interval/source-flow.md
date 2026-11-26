# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 20"]
B1["B2: START - lines 23 to 23"]
B2["B3: instructions - lines 24 to 24"]
B3["B4: instructions - lines 26 to 27"]
B4["B5: instructions - lines 28 to 28"]
B5["B6: instructions - lines 29 to 29"]
B6["B7: SECONDCAT - lines 32 to 32"]
B7["B8: instructions - lines 33 to 33"]
B8["B9: instructions - lines 34 to 34"]
B9["B10: WRONG - lines 37 to 37"]
B0 -->|next| B1
B1 -->|call| B10
B1 -->|after return| B2
B2 -->|call| B13
B2 -->|after return| B3
B3 -->|condition true| B6
B3 -->|condition false| B4
B4 -->|call| B16
B4 -->|after return| B5
B5 -->|call| B23
B5 -->|after return| B6
B6 -->|condition true| B9
B6 -->|condition false| B7
B7 -->|call| B16
B7 -->|after return| B8
B8 -->|call| B23
B8 -->|after return| B9
B9 -->|jump| B9
B10["Continue at B11 in section 2"]
B13["Continue at B14 in section 2"]
B16["Continue at B17 in section 2"]
B23["Continue at B24 in section 3"]
```

### B1

```asm
MOV R7,#'B'
MOV R6,#0
MOV 50H,#0
MOV 51H,#0
MOV 52H,#0
MOV 53H,#0
MOV 30H,#0
MOV 31H,#0
MOV 32H,#0
MOV 33H,#0
MOV 40H,#0
MOV 41H,#0
MOV 42H,#0
MOV 43H,#0
```

### B2

```asm
ACALL ReadDATE
```

### B3

```asm
ACALL ReadVdate
```

### B4

```asm
MOV A,R7
CJNE A,#'A',SECONDCAT
```

### B5

```asm
ACALL DURATION
```

### B6

```asm
ACALL CHECK
```

### B7

```asm
CJNE A,#'B',WRONG
```

### B8

```asm
ACALL DURATION
```

### B9

```asm
ACALL CHECK
```

### B10

```asm
SJMP $
```

## Section 2

```mermaid
flowchart TD
B10["B11: READDATE - lines 41 to 43"]
B11["B12: HERE1 - lines 45 to 50"]
B12["B13: instructions - lines 51 to 51"]
B13["B14: READVDATE - lines 54 to 56"]
B14["B15: HERE - lines 58 to 63"]
B15["B16: instructions - lines 64 to 64"]
B16["B17: DURATION - lines 68 to 71"]
B17["B18: instructions - lines 72 to 73"]
B18["B19: SAVE - lines 75 to 82"]
B19["B20: instructions - lines 83 to 84"]
B10 -->|next| B11
B11 -->|condition true| B11
B11 -->|condition false| B12
B13 -->|next| B14
B14 -->|condition true| B14
B14 -->|condition false| B15
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|next| B18
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|next| B20
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#CdatE
MOV R0,#30H
MOV R2,#4
```

### B12

```asm
CLR A
MOVC A,@A+DPTR
MOV @R0,A
INC R0
INC DPTR
DJNZ R2,HERE1
```

### B13

Return to the instruction following the active call.

```asm
RET
```

### B14

```asm
MOV DPTR,#VdatE
MOV R0,#40H
MOV R2,#4
```

### B15

```asm
CLR A
MOVC A,@A+DPTR
MOV @R0,A
INC R0
INC DPTR
DJNZ R2,HERE
```

### B16

Return to the instruction following the active call.

```asm
RET
```

### B17

```asm
MOV R6,#0
MOV A,30H
SUBB A,40H
JNC SAVE
```

### B18

```asm
ADD A,#30
MOV R6,#1
```

### B19

```asm
MOV 60H,A
CLR C
MOV R5,#0
MOV A,31H
SUBB A,R6
SUBB A,41H
JNC SAVE1
```

### B20

```asm
ADD A,#12
MOV R5,#1
```

## Section 3

```mermaid
flowchart TD
B20["B21: SAVE1 - lines 86 to 97"]
B21["B22: instructions - lines 98 to 98"]
B22["B23: RESULT - lines 102 to 137"]
B23["B24: CHECK - lines 140 to 141"]
B24["B25: instructions - lines 142 to 143"]
B25["B26: NEXTT - lines 145 to 145"]
B26["B27: instructions - lines 147 to 147"]
B27["B28: NEXTT2 - lines 149 to 149"]
B28["B29: instructions - lines 150 to 151"]
B29["B30: CATB - lines 154 to 155"]
B20 -->|call| B22
B20 -->|after return| B21
B23 -->|condition true| B29
B23 -->|condition false| B24
B24 -->|condition true| B25
B24 -->|condition false| B25
B25 -->|condition true| B34
B25 -->|condition false| B26
B26 -->|condition true| B27
B26 -->|condition false| B27
B27 -->|condition true| B34
B27 -->|condition false| B28
B28 -->|jump| B35
B29 -->|condition true| B30
B29 -->|condition false| B30
B34["Continue at B35 in section 4"]
B35["Continue at B36 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV 61H,A
CLR C
MOV A,32H
SUBB A,R5
SUBB A,42H
MOV 62H,A
MOV A,33H
SUBB A,43H
MOV 63H,A
ACALL RESULT
```

### B22

Return to the instruction following the active call.

```asm
RET
```

### B23

Return to the instruction following the active call.

```asm
MOV A,60H
MOV B,#10
DIV AB
MOV R3,B
MOV B,#16
MUL AB
ADD A,R3
MOV 50H,A
MOV A,61H
MOV B,#10
DIV AB
MOV R3,B
MOV B,#16
MUL AB
ADD A,R3
MOV 51H,A
MOV A,62H
MOV B,#10
DIV AB
MOV R3,B
MOV B,#16
MUL AB
ADD A,R3
MOV 52H,A
MOV A,63H
MOV B,#10
DIV AB
MOV R3,B
MOV B,#16
MUL AB
ADD A,R3
MOV 53H,A
RET
```

### B24

```asm
MOV A,R7
CJNE A,#'A',CATB
```

### B25

```asm
MOV A,62H
CJNE A,#1,NEXTT
```

### B26

```asm
JNC ASAP
```

### B27

```asm
CJNE A,#1,NEXTT2
```

### B28

```asm
JNC ASAP
```

### B29

```asm
MOV R6,#0H
SJMP BACK
```

### B30

```asm
MOV A,62H
CJNE A,#1,NEXTT1
```

## Section 4

```mermaid
flowchart TD
B30["B31: NEXTT1 - lines 157 to 157"]
B31["B32: instructions - lines 159 to 159"]
B32["B33: NEXTT22 - lines 161 to 161"]
B33["B34: instructions - lines 162 to 166"]
B34["B35: ASAP - lines 169 to 169"]
B35["B36: BACK - lines 171 to 171"]
B30 -->|condition true| B34
B30 -->|condition false| B31
B31 -->|condition true| B32
B31 -->|condition false| B32
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|jump| B35
B34 -->|next| B35
```

### B31

```asm
JNC ASAP
```

### B32

```asm
CJNE A,#6,NEXTT22
```

### B33

```asm
JNC ASAP
```

### B34

```asm
CLR C
MOV A,61H
SUBB A,#6
MOV R6,A
SJMP BACK
```

### B35

```asm
MOV R6,#0FFH
```

### B36

Return to the instruction following the active call.

```asm
RET
```
