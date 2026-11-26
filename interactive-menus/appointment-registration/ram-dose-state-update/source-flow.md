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
B0["B1: instructions - lines 8 to 19"]
B1["B2: START - lines 24 to 25"]
B2["B3: instructions - lines 26 to 26"]
B3["B4: instructions - lines 27 to 27"]
B4["B5: OP1 - lines 31 to 31"]
B5["B6: instructions - lines 32 to 32"]
B6["B7: instructions - lines 33 to 33"]
B7["B8: ERROR - lines 36 to 36"]
B8["B9: OP2 - lines 41 to 42"]
B9["B10: instructions - lines 43 to 44"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|call| B8
B2 -->|after return| B3
B3 -->|jump| B1
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B16
B5 -->|after return| B6
B6 -->|jump| B1
B7 -->|jump| B1
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|jump| B14
B16["Continue at B17 in section 2"]
B10["Continue at B11 in section 2"]
B14["Continue at B15 in section 2"]
```

### B1

```asm
MOV 10H,#0
MOV 11H,#4
MOV 12H,#1
MOV 13H,#11
MOV 14H,#1
MOV 15H,#100
MOV 16H,#1
```

### B2

```asm
MOV A,10H
CJNE A,#0,op1
```

### B3

```asm
ACALL op2
```

### B4

```asm
SJMP loop
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
SJMP loop
```

### B8

```asm
SJMP loop
```

### B9

```asm
MOV A,12H
CJNE A,#0,SecondDozee
```

### B10

```asm
MOV 14H,#0
SJMP BACK3
```

## Section 2

```mermaid
flowchart TD
B10["B11: SECONDDOZEE - lines 49 to 49"]
B11["B12: instructions - lines 50 to 53"]
B12["B13: instructions - lines 54 to 57"]
B13["B14: ERROR3 - lines 60 to 60"]
B14["B15: BACK3 - lines 63 to 63"]
B15["B16: instructions - lines 64 to 64"]
B16["B17: POS - lines 68 to 71"]
B17["B18: instructions - lines 73 to 75"]
B18["B19: instructions - lines 76 to 79"]
B19["B20: SECONDDOZE - lines 82 to 82"]
B10 -->|condition true| B13
B10 -->|condition false| B11
B11 -->|call| B24
B11 -->|after return| B12
B12 -->|jump| B14
B13 -->|jump| B14
B14 -->|call| B29
B14 -->|after return| B15
B16 -->|condition true| B19
B16 -->|condition false| B17
B17 -->|call| B24
B17 -->|after return| B18
B18 -->|jump| B22
B19 -->|condition true| B22
B19 -->|condition false| B20
B24["Continue at B25 in section 3"]
B29["Continue at B30 in section 3"]
B22["Continue at B23 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE A,#1,ERROR3
```

### B12

```asm
MOV R7,13H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B13

```asm
MOV 14H,A
MOV 15H,#4
SJMP BACK3
```

### B14

```asm
SJMP BACK3
```

### B15

```asm
ACALL CONFIRM
```

### B16

Return to the instruction following the active call.

```asm
RET
```

### B17

```asm
MOV R7,11H
MOV A,12H
CJNE A,#0,SecondDoze
```

### B18

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B19

```asm
MOV 14H,A
MOV 15H,#1
SJMP BACK1
```

### B20

```asm
CJNE A,#1,ERROR1
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 84 to 86"]
B21["B22: instructions - lines 87 to 89"]
B22["B23: ERROR1 - lines 94 to 94"]
B23["B24: instructions - lines 96 to 96"]
B24["B25: CHEACK - lines 100 to 100"]
B25["B26: instructions - lines 101 to 101"]
B26["B27: CONTINUE - lines 103 to 103"]
B27["B28: instructions - lines 104 to 104"]
B28["B29: BACK2 - lines 107 to 107"]
B29["B30: CONFIRM - lines 111 to 112"]
B20 -->|call| B24
B20 -->|after return| B21
B21 -->|jump| B22
B22 -->|call| B29
B22 -->|after return| B23
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B28
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|next| B28
B29 -->|condition true| B29
B29 -->|condition false| B30
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B22

```asm
MOV 14H,A
MOV 15H,#2
SJMP BACK1
```

### B23

```asm
ACALL CONFIRM
```

### B24

Return to the instruction following the active call.

```asm
RET
```

### B25

```asm
CJNE A,#12,CONTINUE
```

### B26

```asm
SJMP BACK2
```

### B27

```asm
JC BACK2
```

### B28

```asm
SUBB A,#12
```

### B29

Return to the instruction following the active call.

```asm
RET
```

### B30

```asm
MOV A,16H
CJNE A,#1,CONFIRM
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 114 to 114"]
```

### B31

Return to the instruction following the active call.

```asm
RET
```
