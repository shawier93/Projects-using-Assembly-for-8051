# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 24"]
B1["B2: NEXTBOOKING - lines 26 to 27"]
B2["B3: instructions - lines 28 to 31"]
B3["B4: instructions - lines 32 to 34"]
B4["B5: NEXT1 - lines 36 to 36"]
B5["B6: instructions - lines 37 to 42"]
B6["B7: ERROR - lines 44 to 44"]
B7["B8: CALC - lines 46 to 49"]
B8["B9: NOAVAIL - lines 51 to 51"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|condition true| B8
B2 -->|condition false| B3
B3 -->|jump| B7
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|jump| B7
B6 -->|jump| B6
B7 -->|jump| B1
B8 -->|jump| B8
```

### B1

```asm
MOV 30H,#2
MOV 40H,#4
MOV 50H,#0
MOV 31H,#0
MOV 32H,#0
MOV 41H,#0
MOV 42H,#0
MOV DPTR,#GOLD
CLR A
MOVC A,@A+DPTR
MOV 31H,A
INC DPTR
CLR A
MOVC A,@A+DPTR
MOV 32H,A
MOV DPTR,#SILVER
CLR A
MOVC A,@A+DPTR
MOV 41H,A
INC DPTR
CLR A
MOVC A,@A+DPTR
MOV 42H,A
```

### B2

```asm
MOV A,30H
CJNE A,#1,NEXT1
```

### B3

```asm
MOV A,31H
CLR C
SUBB A,40H
JC NOAVAIL
```

### B4

```asm
MOV 31H,A
MOV B,32H
SJMP CALC
```

### B5

```asm
CJNE A,#2,ERROR
```

### B6

```asm
CLR C
MOV A,41H
SUBB A,40H
MOV 41H,A
MOV B,42H
SJMP CALC
```

### B7

```asm
SJMP $
```

### B8

```asm
MOV A,40H
MUL AB
MOV 50H,A
SJMP NEXTBOOKING
```

### B9

```asm
SJMP $
```
