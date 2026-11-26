# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 12"]
B1["B2: START - lines 18 to 19"]
B2["B3: instructions - lines 20 to 20"]
B3["B4: instructions - lines 21 to 21"]
B4["B5: POSITIVE - lines 24 to 24"]
B5["B6: instructions - lines 25 to 25"]
B6["B7: instructions - lines 26 to 26"]
B7["B8: ERROR - lines 30 to 30"]
B8["B9: BACK - lines 33 to 33"]
B9["B10: NEG - lines 40 to 41"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|call| B9
B2 -->|after return| B3
B3 -->|jump| B8
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B17
B5 -->|after return| B6
B6 -->|jump| B8
B7 -->|jump| B8
B8 -->|jump| B1
B9 -->|condition true| B11
B9 -->|condition false| B10
B17["Continue at B18 in section 2"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#0
MOV 31H,#4
MOV 32H,#1
MOV 36H,#11
MOV 33H,#1
MOV 34H,#100
MOV 35H,#1
```

### B2

```asm
MOV A,30H
CJNE A,#0,POSITIVE
```

### B3

```asm
ACALL NEG
```

### B4

```asm
SJMP BACK
```

### B5

```asm
CJNE A,#1,ERROR
```

### B6

```asm
ACALL POS
```

### B7

```asm
SJMP BACK
```

### B8

```asm
SJMP BACK
```

### B9

```asm
SJMP START
```

### B10

```asm
MOV A,32H
CJNE A,#0,SecondDozee
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 42 to 43"]
B11["B12: SECONDDOZEE - lines 48 to 48"]
B12["B13: instructions - lines 49 to 52"]
B13["B14: instructions - lines 53 to 56"]
B14["B15: ERROR3 - lines 59 to 59"]
B15["B16: BACK3 - lines 61 to 61"]
B16["B17: instructions - lines 62 to 62"]
B17["B18: POS - lines 66 to 69"]
B18["B19: instructions - lines 71 to 73"]
B19["B20: instructions - lines 74 to 77"]
B10 -->|jump| B15
B11 -->|condition true| B14
B11 -->|condition false| B12
B12 -->|call| B25
B12 -->|after return| B13
B13 -->|jump| B15
B14 -->|jump| B15
B15 -->|call| B30
B15 -->|after return| B16
B17 -->|condition true| B20
B17 -->|condition false| B18
B18 -->|call| B25
B18 -->|after return| B19
B19 -->|jump| B23
B25["Continue at B26 in section 3"]
B30["Continue at B31 in section 4"]
B20["Continue at B21 in section 3"]
B23["Continue at B24 in section 3"]
```

### B11

```asm
MOV 34H,#0
SJMP BACK3
```

### B12

```asm
CJNE A,#1,ERROR3
```

### B13

```asm
MOV R7,36H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B14

```asm
MOV 33H,A
MOV 34H,#4
SJMP BACK3
```

### B15

```asm
SJMP BACK3
```

### B16

```asm
ACALL CONFIRM
```

### B17

Return to the instruction following the active call.

```asm
RET
```

### B18

```asm
MOV R7,31H
MOV A,32H
CJNE A,#0,SecondDoze
```

### B19

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B20

```asm
MOV 33H,A
MOV 34H,#1
SJMP BACK1
```

## Section 3

```mermaid
flowchart TD
B20["B21: SECONDDOZE - lines 80 to 80"]
B21["B22: instructions - lines 82 to 84"]
B22["B23: instructions - lines 85 to 87"]
B23["B24: ERROR1 - lines 92 to 92"]
B24["B25: instructions - lines 94 to 94"]
B25["B26: CHEACK - lines 98 to 98"]
B26["B27: instructions - lines 99 to 99"]
B27["B28: CONTINUE - lines 101 to 101"]
B28["B29: instructions - lines 102 to 102"]
B29["B30: BACK2 - lines 105 to 105"]
B20 -->|condition true| B23
B20 -->|condition false| B21
B21 -->|call| B25
B21 -->|after return| B22
B22 -->|jump| B23
B23 -->|call| B30
B23 -->|after return| B24
B25 -->|condition true| B27
B25 -->|condition false| B26
B26 -->|jump| B29
B27 -->|condition true| B29
B27 -->|condition false| B28
B28 -->|next| B29
B30["Continue at B31 in section 4"]
```

### B21

```asm
CJNE A,#1,ERROR1
```

### B22

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B23

```asm
MOV 33H,A
MOV 34H,#2
SJMP BACK1
```

### B24

```asm
ACALL CONFIRM
```

### B25

Return to the instruction following the active call.

```asm
RET
```

### B26

```asm
CJNE A,#12,CONTINUE
```

### B27

```asm
SJMP BACK2
```

### B28

```asm
JC BACK2
```

### B29

```asm
SUBB A,#12
```

### B30

Return to the instruction following the active call.

```asm
RET
```

## Section 4

```mermaid
flowchart TD
B30["B31: CONFIRM - lines 109 to 110"]
B31["B32: instructions - lines 112 to 112"]
B30 -->|condition true| B30
B30 -->|condition false| B31
```

### B31

```asm
MOV A,35H
CJNE A,#1,CONFIRM
```

### B32

Return to the instruction following the active call.

```asm
RET
```
