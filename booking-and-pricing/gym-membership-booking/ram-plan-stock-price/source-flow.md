# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3)

## Destinations requiring review

`OUT`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 13"]
B1["B2: VIP - lines 16 to 17"]
B2["B3: MONTHLY - lines 20 to 21"]
B3["B4: instructions - lines 22 to 22"]
B4["B5: NEXT - lines 25 to 30"]
B5["B6: YEARLY - lines 33 to 33"]
B6["B7: instructions - lines 34 to 35"]
B7["B8: instructions - lines 36 to 36"]
B8["B9: NEXT2 - lines 39 to 44"]
B9["B10: ONLINE - lines 50 to 50"]
B0 -->|condition true| B9
B0 -->|condition false| B1
B1 -->|condition true| B5
B1 -->|condition false| B2
B2 -->|condition true| B4
B2 -->|condition false| B3
B3 -->|jump| B27
B4 -->|jump| BX1
B5 -->|condition true| B1
B5 -->|condition false| B6
B6 -->|condition true| B8
B6 -->|condition false| B7
B7 -->|jump| B27
B8 -->|jump| BX2
B9 -->|condition true| B18
B9 -->|condition false| B10
B27["Continue at B28 in section 3"]
BX1["Unresolved destination: OUT"]
BX2["Unresolved destination: OUT"]
B18["Continue at B19 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#2
MOV 31H,#1
MOV 32H,#0
MOV 40H,#5
MOV 41H,#5
MOV 42H,#30
MOV 43H,#30
MOV 44H,#20
MOV 45H,#20
MOV A,30H
CJNE A,#1,ONLINE
```

### B2

```asm
MOV A,31H
CJNE A,#1,YEARLY
```

### B3

```asm
MOV R1,40H
DJNZ R1,NEXT
```

### B4

```asm
SJMP WRONG
```

### B5

```asm
CLR A
DEC 40H
MOV DPTR,#VIPM
MOVC A,@A+DPTR
MOV 32H,A
SJMP OUT
```

### B6

```asm
CJNE A,#2,VIP
```

### B7

```asm
MOV R2,41H
DJNZ R2,NEXT2
```

### B8

```asm
SJMP WRONG
```

### B9

```asm
CLR A
DEC 41H
MOV DPTR,#VIPY
MOVC A,@A+DPTR
MOV 32H,A
SJMP OUT
```

### B10

```asm
CJNE A,#2,REGULAR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 51 to 52"]
B11["B12: MONTHLY2 - lines 55 to 56"]
B12["B13: instructions - lines 57 to 57"]
B13["B14: NEXT3 - lines 60 to 65"]
B14["B15: YEARLY2 - lines 68 to 68"]
B15["B16: instructions - lines 69 to 70"]
B16["B17: instructions - lines 71 to 71"]
B17["B18: NEXT4 - lines 74 to 79"]
B18["B19: REGULAR - lines 84 to 84"]
B19["B20: instructions - lines 85 to 86"]
B10 -->|condition true| B14
B10 -->|condition false| B11
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|jump| B27
B13 -->|jump| BX3
B14 -->|condition true| B9
B14 -->|condition false| B15
B15 -->|condition true| B17
B15 -->|condition false| B16
B16 -->|jump| B27
B17 -->|jump| BX4
B18 -->|condition true| B27
B18 -->|condition false| B19
B19 -->|condition true| B23
B19 -->|condition false| B20
B27["Continue at B28 in section 3"]
BX3["Unresolved destination: OUT"]
B9["Continue at B10 in section 1"]
BX4["Unresolved destination: OUT"]
B23["Continue at B24 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,31H
CJNE A,#1,YEARLY2
```

### B12

```asm
MOV R1,42H
DJNZ R1,NEXT3
```

### B13

```asm
SJMP WRONG
```

### B14

```asm
CLR A
DEC 42H
MOV DPTR,#ONM
MOVC A,@A+DPTR
MOV 32H,A
SJMP OUT
```

### B15

```asm
CJNE A,#2,ONLINE
```

### B16

```asm
MOV R2,43H
DJNZ R2,NEXT4
```

### B17

```asm
SJMP WRONG
```

### B18

```asm
CLR A
DEC 43H
MOV DPTR,#ONY
MOVC A,@A+DPTR
MOV 32H,A
SJMP OUT
```

### B19

```asm
CJNE A,#3,WRONG
```

### B20

```asm
MOV A,31H
CJNE A,#1,YEARLY3
```

## Section 3

```mermaid
flowchart TD
B20["B21: MONTHLY3 - lines 89 to 90"]
B21["B22: instructions - lines 91 to 91"]
B22["B23: NEXT5 - lines 94 to 99"]
B23["B24: YEARLY3 - lines 102 to 102"]
B24["B25: instructions - lines 103 to 104"]
B25["B26: instructions - lines 105 to 105"]
B26["B27: NEXT6 - lines 108 to 113"]
B27["B28: WRONG - lines 116 to 116"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B27
B22 -->|jump| BX5
B23 -->|condition true| B18
B23 -->|condition false| B24
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B27
B26 -->|jump| BX6
B27 -->|jump| B27
BX5["Unresolved destination: OUT"]
B18["Continue at B19 in section 2"]
BX6["Unresolved destination: OUT"]
```

### B21

```asm
MOV R1,44H
DJNZ R1,NEXT5
```

### B22

```asm
SJMP WRONG
```

### B23

```asm
CLR A
DEC 44H
MOV DPTR,#REGM
MOVC A,@A+DPTR
MOV 32H,A
SJMP OUT
```

### B24

```asm
CJNE A,#2,REGULAR
```

### B25

```asm
MOV R2,45H
DJNZ R2,NEXT6
```

### B26

```asm
SJMP WRONG
```

### B27

```asm
CLR A
DEC 45H
MOV DPTR,#REGY
MOVC A,@A+DPTR
MOV 32H,A
SJMP OUT
```

### B28

```asm
SJMP $
```
