# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 13"]
B1["B2: START - lines 17 to 18"]
B2["B3: instructions - lines 19 to 19"]
B3["B4: instructions - lines 20 to 20"]
B4["B5: NEXT - lines 22 to 22"]
B5["B6: instructions - lines 23 to 23"]
B6["B7: instructions - lines 24 to 24"]
B7["B8: NEXT1 - lines 26 to 26"]
B8["B9: instructions - lines 27 to 27"]
B9["B10: instructions - lines 28 to 28"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|call| B12
B2 -->|after return| B3
B3 -->|jump| B1
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B17
B5 -->|after return| B6
B6 -->|jump| B1
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B22
B8 -->|after return| B9
B9 -->|jump| B1
B12["Continue at B13 in section 2"]
B17["Continue at B18 in section 2"]
B10["Continue at B11 in section 2"]
B22["Continue at B23 in section 3"]
```

### B1

```asm
MOV 40H,#5
MOV 41H,#5
MOV 42H,#30
MOV 43H,#30
MOV 44H,#20
MOV 45H,#20
MOV 30H,#2
MOV R2,#1
MOV 31H,#2
MOV 32H,#0
MOV 33H,#0
```

### B2

```asm
MOV A,30H
CJNE A,#1,NEXT
```

### B3

```asm
ACALL VIP
```

### B4

```asm
AJMP START
```

### B5

```asm
CJNE A,#2,NEXT1
```

### B6

```asm
ACALL ONLINE
```

### B7

```asm
AJMP START
```

### B8

```asm
CJNE A,#3,NEXT2
```

### B9

```asm
ACALL REGULAR
```

### B10

```asm
AJMP START
```

## Section 2

```mermaid
flowchart TD
B10["B11: NEXT2 - lines 31 to 31"]
B11["B12: instructions - lines 32 to 32"]
B12["B13: VIP - lines 37 to 38"]
B13["B14: instructions - lines 39 to 44"]
B14["B15: YEAR - lines 47 to 47"]
B15["B16: instructions - lines 48 to 52"]
B16["B17: END - lines 55 to 55"]
B17["B18: ONLINE - lines 58 to 59"]
B18["B19: instructions - lines 60 to 65"]
B19["B20: YEAR1 - lines 68 to 68"]
B10 -->|call| B27
B10 -->|after return| B11
B11 -->|jump| B1
B12 -->|condition true| B14
B12 -->|condition false| B13
B13 -->|jump| B16
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|next| B16
B17 -->|condition true| B19
B17 -->|condition false| B18
B18 -->|jump| B21
B19 -->|condition true| B21
B19 -->|condition false| B20
B27["Continue at B28 in section 3"]
B1["Continue at B2 in section 1"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL WRONG
```

### B12

```asm
AJMP START
```

### B13

```asm
MOV A,R2
CJNE A,#1,YEAR
```

### B14

```asm
MOV A,#35
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
SJMP END
```

### B15

```asm
CJNE A,#2, END
```

### B16

```asm
MOV A,#99
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
```

### B17

Return to the instruction following the active call.

```asm
RET
```

### B18

```asm
MOV A,R2
CJNE A,#1,YEAR1
```

### B19

```asm
MOV A,#5
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
SJMP END1
```

### B20

```asm
CJNE A,#2, END1
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 69 to 73"]
B21["B22: END1 - lines 76 to 76"]
B22["B23: REGULAR - lines 79 to 80"]
B23["B24: instructions - lines 81 to 86"]
B24["B25: YEAR2 - lines 89 to 89"]
B25["B26: instructions - lines 90 to 94"]
B26["B27: END2 - lines 97 to 97"]
B27["B28: WRONG - lines 100 to 102"]
B20 -->|next| B21
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B26
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|next| B26
```

### B21

```asm
MOV A,#30
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
```

### B22

Return to the instruction following the active call.

```asm
RET
```

### B23

```asm
MOV A,R2
CJNE A,#1,YEAR2
```

### B24

```asm
MOV A,#10
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
SJMP END2
```

### B25

```asm
CJNE A,#2, END2
```

### B26

```asm
MOV A,#70
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
```

### B27

Return to the instruction following the active call.

```asm
RET
```

### B28

Return to the instruction following the active call.

```asm
MOV 32H,#0
MOV 33H,#0
RET
```
