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
B0["B1: instructions - lines 2 to 8"]
B1["B2: START - lines 13 to 15"]
B2["B3: instructions - lines 16 to 18"]
B3["B4: WRONG1 - lines 19 to 19"]
B4["B5: QUESTION2 - lines 23 to 25"]
B5["B6: instructions - lines 26 to 30"]
B6["B7: WRONG2 - lines 32 to 34"]
B7["B8: QUESTION3 - lines 38 to 40"]
B8["B9: instructions - lines 41 to 45"]
B9["B10: WRONG3 - lines 47 to 49"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B4
B3 -->|jump| B1
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|jump| B7
B6 -->|jump| B4
B7 -->|condition true| B9
B7 -->|condition false| B8
B8 -->|jump| B10
B9 -->|jump| B7
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#7
MOV 31H,#00
MOV 32H,#00
MOV 33H,#6
MOV 34H,#00
MOV 35H,#00
MOV R3,#0H
```

### B2

```asm
MOV DPTR,#Q1
MOV A,30H
CJNE A,#7, WRONG1
```

### B3

```asm
INC R3
MOV 35H,R3
SJMP QUESTION2
```

### B4

```asm
SJMP START
```

### B5

```asm
MOV DPTR,#Q2
MOV A,31H
CJNE A,#4, WRONG2
```

### B6

```asm
MOV A,#2
ADD A,R3
MOV R3,A
MOV 35H,R3
SJMP QUESTION3
```

### B7

```asm
DEC R3
MOV 35H,R3
SJMP QUESTION2
```

### B8

```asm
MOV DPTR,#Q3
MOV A,32H
CJNE A,#12, WRONG3
```

### B9

```asm
MOV A,#3
ADD A,R3
MOV R3,A
MOV 35H,R3
SJMP QUESTION4
```

### B10

```asm
DEC R3
MOV 35H,R3
SJMP QUESTION3
```

## Section 2

```mermaid
flowchart TD
B10["B11: QUESTION4 - lines 53 to 55"]
B11["B12: instructions - lines 56 to 60"]
B12["B13: WRONG4 - lines 62 to 64"]
B13["B14: NEXT - lines 66 to 66"]
B10 -->|condition true| B12
B10 -->|condition false| B11
B11 -->|jump| B13
B12 -->|jump| B7
B13 -->|jump| B13
B7["Continue at B8 in section 1"]
```

### B11

```asm
MOV DPTR,#Q4
MOV A,33H
CJNE A,#6, WRONG4
```

### B12

```asm
MOV A,#4
ADD A,R3
MOV R3,A
MOV 35H,R3
SJMP NEXT
```

### B13

```asm
DEC R3
MOV 35H,R3
SJMP QUESTION3
```

### B14

```asm
SJMP NEXT
```
