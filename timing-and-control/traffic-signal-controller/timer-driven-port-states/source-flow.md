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
B0["B1: START - lines 4 to 5"]
B1["B2: TRRAFIC - lines 10 to 13"]
B2["B3: instructions - lines 14 to 20"]
B3["B4: CASE2 - lines 23 to 23"]
B4["B5: instructions - lines 24 to 31"]
B5["B6: CASE1 - lines 33 to 38"]
B6["B7: BACK - lines 41 to 45"]
B7["B8: instructions - lines 47 to 51"]
B8["B9: instructions - lines 53 to 53"]
B9["B10: instructions - lines 55 to 55"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B6
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|jump| B6
B5 -->|next| B6
B6 -->|call| B10
B6 -->|after return| B7
B7 -->|call| B10
B7 -->|after return| B8
B8 -->|condition true| B1
B8 -->|condition false| B9
B9 -->|jump| B0
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV TMOD,#01
MOV R6,#3
```

### B2

```asm
MOV A,R6
CJNE A,#3,CASE2
```

### B3

```asm
MOV R1,#1H
MOV R2,#4H
MOV R3,#4H
MOV R4,#1H
MOV R5,#2H
MOV R0,#4H
SJMP BACK
```

### B4

```asm
CJNE A,#2,CASE1
```

### B5

```asm
MOV R1,#4H
MOV R2,#1H
MOV R3,#4H
MOV R4,#4H
MOV R5,#1H
MOV R0,#2H
SJMP BACK
```

### B6

```asm
MOV R1,#4H
MOV R2,#4H
MOV R3,#1H
MOV R4,#2H
MOV R5,#4H
MOV R0,#1H
```

### B7

```asm
MOV P1,R1
MOV P2,R2
MOV P3,R3
MOV R7,#40
ACALL DELAY
```

### B8

```asm
MOV P1,R4
MOV P2,R5
MOV P3,R0
MOV R7,#20
ACALL DELAY
```

### B9

```asm
DJNZ R6,TRRAFIC
```

### B10

```asm
SJMP START
```

## Section 2

```mermaid
flowchart TD
B10["B11: DELAY - lines 61 to 61"]
B11["B12: AGAIN - lines 63 to 65"]
B12["B13: HERE - lines 66 to 66"]
B13["B14: instructions - lines 67 to 69"]
B14["B15: instructions - lines 70 to 70"]
B10 -->|next| B11
B11 -->|next| B12
B12 -->|condition true| B12
B12 -->|condition false| B13
B13 -->|condition true| B11
B13 -->|condition false| B14
```

### B11

```asm
MOV R7,#20
```

### B12

```asm
MOV TH0,#3CH
MOV TL0,#0ADH
SETB TR0
```

### B13

```asm
JNB TF0,HERE
```

### B14

```asm
CLR TR0
CLR TF0
DJNZ R7,AGAIN
```

### B15

Return to the instruction following the active call.

```asm
RET
```
