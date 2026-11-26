# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

Start from the first executable block or the entry selected by the calling application.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3)

## Destinations requiring review

`HERE`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 1 to 8"]
B1["B2: instructions - lines 9 to 11"]
B2["B3: instructions - lines 12 to 12"]
B3["B4: CONT - lines 14 to 15"]
B4["B5: instructions - lines 16 to 16"]
B5["B6: CONT2 - lines 19 to 22"]
B6["B7: instructions - lines 23 to 23"]
B7["B8: CONT3 - lines 25 to 26"]
B8["B9: NEXT1 - lines 28 to 28"]
B9["B10: instructions - lines 29 to 31"]
B0 -->|condition true| B8
B0 -->|condition false| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|next| B3
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|next| B5
B5 -->|condition true| B7
B5 -->|condition false| B6
B6 -->|next| B7
B7 -->|jump| BX1
B8 -->|condition true| B16
B8 -->|condition false| B9
B9 -->|condition true| B11
B9 -->|condition false| B10
BX1["Unresolved destination: HERE"]
B16["Continue at B17 in section 2"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#2
MOV 31H,#1
MOV 32H,#2
MOV 33H,#2
MOV 34H,#1
MOV A,30H
CJNE A,#1,NEXT1
```

### B2

```asm
MOV A,#38
MOV R0,31H
CJNE R0,#1,CONT
```

### B3

```asm
ADD A,#8
```

### B4

```asm
MOV R0,32H
CJNE R0,#1,CONT2
```

### B5

```asm
ADD A,#10
```

### B6

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONT3
```

### B7

```asm
SUBB A, #5
```

### B8

```asm
MOV 35H,A
AJMP HERE
```

### B9

```asm
CJNE A,#2,NEXT2
```

### B10

```asm
MOV A,#45
MOV R0,31H
CJNE R0,#1,CONTT
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 32"]
B11["B12: CONTT - lines 34 to 35"]
B12["B13: instructions - lines 36 to 36"]
B13["B14: CONTT2 - lines 39 to 42"]
B14["B15: instructions - lines 43 to 43"]
B15["B16: CONTT3 - lines 45 to 46"]
B16["B17: NEXT2 - lines 48 to 50"]
B17["B18: instructions - lines 51 to 51"]
B18["B19: CONTTT - lines 53 to 54"]
B19["B20: instructions - lines 55 to 55"]
B10 -->|next| B11
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|next| B13
B13 -->|condition true| B15
B13 -->|condition false| B14
B14 -->|next| B15
B15 -->|jump| BX2
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|next| B18
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|next| B20
BX2["Unresolved destination: HERE"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ADD A,#10
```

### B12

```asm
MOV R0,32H
CJNE R0,#1,CONTT2
```

### B13

```asm
ADD A,#15
```

### B14

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTT3
```

### B15

```asm
SUBB A, #8
```

### B16

```asm
MOV 35H,A
AJMP HERE
```

### B17

```asm
MOV A,#66
MOV R0,31H
CJNE R0,#1,CONTTT
```

### B18

```asm
ADD A,#12
```

### B19

```asm
MOV R0,32H
CJNE R0,#1,CONTTT2
```

### B20

```asm
ADD A,#18
```

## Section 3

```mermaid
flowchart TD
B20["B21: CONTTT2 - lines 58 to 61"]
B21["B22: instructions - lines 62 to 62"]
B22["B23: CONTTT3 - lines 64 to 64"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|next| B22
```

### B21

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTTT3
```

### B22

```asm
SUBB A, #15
```

### B23

```asm
MOV 35H,A
```
