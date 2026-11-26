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
B0["B1: instructions - lines 2 to 7"]
B1["B2: START - lines 10 to 11"]
B2["B3: instructions - lines 12 to 13"]
B3["B4: instructions - lines 14 to 14"]
B4["B5: OPTION2 - lines 17 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: instructions - lines 19 to 19"]
B7["B8: OPTION3 - lines 22 to 22"]
B8["B9: instructions - lines 23 to 23"]
B9["B10: WRONG - lines 26 to 26"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|call| B11
B2 -->|after return| B3
B3 -->|jump| B10
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B14
B5 -->|after return| B6
B6 -->|jump| B10
B7 -->|condition true| B9
B7 -->|condition false| B8
B8 -->|jump| B10
B9 -->|jump| B1
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
B14["Continue at B15 in section 2"]
```

### B1

```asm
MOV 10H,#2
MOV R1,#23H
MOV 20H,#4
MOV 21H,#2
MOV 22H,#3
MOV 30H,#00H
```

### B2

```asm
MOV A,10H
CJNE A,#1,OPTION2
```

### B3

```asm
MOV A,#6
ACALL PERRINSEQ
```

### B4

```asm
SJMP EXIT
```

### B5

```asm
CJNE A,#2,OPTION3
```

### B6

```asm
ACALL NthNumber
```

### B7

```asm
SJMP EXIT
```

### B8

```asm
CJNE A,#2,WRONG
```

### B9

```asm
SJMP EXIT
```

### B10

```asm
SJMP START
```

## Section 2

```mermaid
flowchart TD
B10["B11: EXIT - lines 29 to 29"]
B11["B12: PERRINSEQ - lines 33 to 34"]
B12["B13: ST - lines 36 to 49"]
B13["B14: instructions - lines 50 to 50"]
B14["B15: NTHNUMBER - lines 53 to 55"]
B15["B16: instructions - lines 56 to 57"]
B10 -->|jump| B10
B11 -->|next| B12
B12 -->|condition true| B12
B12 -->|condition false| B13
B14 -->|call| B11
B14 -->|after return| B15
```

### B11

```asm
SJMP $
```

### B12

```asm
MOV R7,A
MOV R0,#22H
```

### B13

```asm
INC R0
MOV A,R0
DEC R0
DEC R0
MOV A,@R0
DEC R0
ADD A,@R0
MOV R3,A
MOV A,R0
ADD A,#3
MOV R0,A
MOV A,R3
MOV @R0,A
DJNZ R7,ST
```

### B14

Return to the instruction following the active call.

```asm
RET
```

### B15

```asm
MOV A,#6
SUBB A,#3
ACALL PERRINSEQ
```

### B16

Return to the instruction following the active call.

```asm
MOV 30H,R3
RET
```
