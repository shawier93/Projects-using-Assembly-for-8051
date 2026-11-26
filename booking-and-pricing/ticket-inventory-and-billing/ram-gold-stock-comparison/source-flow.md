# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Destinations requiring review

`EXIT`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 6 to 14"]
B1["B2: GOLD_TICKETS - lines 18 to 18"]
B2["B3: instructions - lines 19 to 27"]
B3["B4: instructions - lines 28 to 28"]
B4["B5: OTHERWISE - lines 30 to 30"]
B5["B6: instructions - lines 31 to 31"]
B6["B7: LESS_EQUAL - lines 34 to 45"]
B7["B8: SILVER_TICKETS - lines 49 to 49"]
B8["B9: instructions - lines 50 to 57"]
B9["B10: instructions - lines 58 to 58"]
B0 -->|next| B1
B1 -->|condition true| B7
B1 -->|condition false| B2
B2 -->|condition true| B4
B2 -->|condition false| B3
B3 -->|jump| B6
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|jump| B1
B6 -->|jump| BX1
B7 -->|condition true| BX2
B7 -->|condition false| B8
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|jump| B12
BX1["Unresolved destination: EXIT"]
BX2["Unresolved destination: EXIT"]
B10["Continue at B11 in section 2"]
B12["Continue at B13 in section 2"]
```

### B1

```asm
MOV 30H,#01H
MOV 33H,#09H
MOV 34H,#09H
MOV 40H,#06H
MOV A, 30H
MOV R2, A
```

### B2

```asm
CJNE R2, #1, SILVER_TICKETS
```

### B3

```asm
MOV A, 40H
MOV R1, A
MOV A,33H
MOV B,A
MOV R3,A
MOV A,R3
CJNE A, B, OTHERWISE
```

### B4

```asm
SJMP LESS_EQUAL
```

### B5

```asm
JC LESS_EQUAL
```

### B6

```asm
SJMP GOLD_TICKETS
```

### B7

```asm
MOV A, R3
CLR C
SUBB A,R1
MOV 33H,A
MOV A,R1
MOV B, A
CLR A
MOV DPTR, #GOLD_Price
MOVC A, @A+DPTR
MUL AB
MOV 50H,A
SJMP EXIT
```

### B8

```asm
CJNE R2, #2, EXIT
```

### B9

```asm
MOV A, 40H
MOV R1, A
MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B,OTHERWISE0
```

### B10

```asm
SJMP LESS_EQUAL0
```

## Section 2

```mermaid
flowchart TD
B10["B11: OTHERWISE0 - lines 60 to 60"]
B11["B12: instructions - lines 61 to 61"]
B12["B13: LESS_EQUAL0 - lines 64 to 75"]
B10 -->|condition true| B12
B10 -->|condition false| B11
B11 -->|jump| B7
B12 -->|jump| BX3
B7["Continue at B8 in section 1"]
BX3["Unresolved destination: EXIT"]
```

### B11

```asm
JC LESS_EQUAL0
```

### B12

```asm
SJMP SILVER_TICKETS
```

### B13

```asm
MOV A, R3
CLR C
SUBB A,R1
MOV 34H,A
MOV A,R1
MOV B, A
CLR A
MOV DPTR, #SILVER_Price
MOVC A, @A+DPTR
MUL AB
MOV 50H,A
SJMP EXIT
```
