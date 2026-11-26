# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 6"]
B1["B2: MAIN - lines 10 to 12"]
B2["B3: instructions - lines 13 to 13"]
B3["B4: instructions - lines 14 to 14"]
B4["B5: COVIDCHEACK - lines 17 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: EXIT - lines 23 to 23"]
B7["B8: CECKUP - lines 27 to 35"]
B8["B9: NEXT1 - lines 37 to 37"]
B9["B10: instructions - lines 39 to 40"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|call| B7
B2 -->|after return| B3
B3 -->|jump| B6
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|call| B17
B5 -->|after return| B6
B6 -->|jump| B6
B7 -->|condition true| B8
B7 -->|condition false| B8
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|jump| B16
B17["Continue at B18 in section 2"]
B10["Continue at B11 in section 2"]
B16["Continue at B17 in section 2"]
```

### B1

```asm
MOV 30H,#1
MOV 31H,#21
MOV 32H,#1
MOV 35H,#00
```

### B2

```asm
MOV A,30H
CJNE A,#1,COVIDCHEACK
```

### B3

```asm
ACALL CECKUP
```

### B4

```asm
SJMP EXIT
```

### B5

```asm
CJNE A,#2,EXIT
```

### B6

```asm
ACALL COVID
```

### B7

```asm
SJMP EXIT
```

### B8

```asm
MOV A,31H
MOV B,#10
DIV AB
CJNE A,#2,NEXT1
```

### B9

```asm
JNC LEVEL2
```

### B10

```asm
MOV 35H,#1
SJMP EE
```

## Section 2

```mermaid
flowchart TD
B10["B11: LEVEL2 - lines 43 to 43"]
B11["B12: NEXT2 - lines 45 to 45"]
B12["B13: instructions - lines 47 to 48"]
B13["B14: LEVEL3 - lines 51 to 52"]
B14["B15: instructions - lines 53 to 54"]
B15["B16: FEMALE - lines 57 to 58"]
B16["B17: EE - lines 61 to 61"]
B17["B18: COVID - lines 64 to 66"]
B18["B19: NEXT - lines 68 to 68"]
B19["B20: instructions - lines 70 to 71"]
B10 -->|condition true| B11
B10 -->|condition false| B11
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|jump| B16
B13 -->|condition true| B15
B13 -->|condition false| B14
B14 -->|jump| B16
B15 -->|jump| B16
B17 -->|condition true| B18
B17 -->|condition false| B18
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B21
B20["Continue at B21 in section 3"]
B21["Continue at B22 in section 3"]
```

### B11

```asm
CJNE A,#4,NEXT2
```

### B12

```asm
JNC LEVEL3
```

### B13

```asm
MOV 35H,#2
SJMP EE
```

### B14

```asm
MOV A,32H
CJNE A,#1,FEMALE
```

### B15

```asm
MOV 35H,#3
SJMP EE
```

### B16

```asm
MOV 35H,#4
SJMP EE
```

### B17

Return to the instruction following the active call.

```asm
RET
```

### B18

```asm
MOV A,31H
CJNE A,#5,NEXT
```

### B19

```asm
JNC OKAY
```

### B20

```asm
MOV 35H,#5
SJMP EEE
```

## Section 3

```mermaid
flowchart TD
B20["B21: OKAY - lines 74 to 74"]
B21["B22: EEE - lines 77 to 77"]
B20 -->|next| B21
```

### B21

```asm
MOV 35H,#6
```

### B22

Return to the instruction following the active call.

```asm
RET
```
