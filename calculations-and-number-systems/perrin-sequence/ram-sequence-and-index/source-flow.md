# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3)

## Destinations requiring review

`FINISH`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: MENU - lines 6 to 8"]
B2["B3: FUNCTION1 - lines 11 to 11"]
B3["B4: instructions - lines 12 to 12"]
B4["B5: instructions - lines 13 to 13"]
B5["B6: FUNCTION2 - lines 16 to 16"]
B6["B7: instructions - lines 17 to 17"]
B7["B8: instructions - lines 18 to 18"]
B8["B9: FUNCTION3 - lines 21 to 21"]
B9["B10: instructions - lines 23 to 23"]
B0 -->|next| B1
B1 -->|next| B2
B2 -->|condition true| B5
B2 -->|condition false| B3
B3 -->|call| B11
B3 -->|after return| B4
B4 -->|jump| B1
B5 -->|condition true| B8
B5 -->|condition false| B6
B6 -->|call| B14
B6 -->|after return| B7
B7 -->|jump| B1
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|jump| BX1
B11["Continue at B12 in section 2"]
B14["Continue at B15 in section 2"]
B10["Continue at B11 in section 2"]
BX1["Unresolved destination: FINISH"]
```

### B1

```asm
MOV R0,#20H
```

### B2

```asm
MOV 10H,#2
MOV A,10H
```

### B3

```asm
CJNE A,#1,FUNCTION2
```

### B4

```asm
ACALL OPTION1
```

### B5

```asm
SJMP MENU
```

### B6

```asm
CJNE A,#2,FUNCTION3
```

### B7

```asm
ACALL OPTION2
```

### B8

```asm
SJMP MENU
```

### B9

```asm
CJNE A,#3,WRONG
```

### B10

```asm
AJMP FINISH
```

## Section 2

```mermaid
flowchart TD
B10["B11: WRONG - lines 26 to 26"]
B11["B12: OPTION1 - lines 30 to 41"]
B12["B13: LOOP - lines 43 to 52"]
B13["B14: instructions - lines 53 to 53"]
B14["B15: OPTION2 - lines 56 to 70"]
B15["B16: instructions - lines 72 to 72"]
B16["B17: LOOP2 - lines 74 to 83"]
B17["B18: instructions - lines 84 to 85"]
B18["B19: CHECK - lines 88 to 89"]
B19["B20: instructions - lines 90 to 90"]
B10 -->|jump| B1
B11 -->|next| B12
B12 -->|condition true| B12
B12 -->|condition false| B13
B14 -->|call| B18
B14 -->|after return| B15
B15 -->|next| B16
B16 -->|condition true| B16
B16 -->|condition false| B17
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B14
B1["Continue at B2 in section 1"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
SJMP MENU
```

### B12

```asm
MOV R7,#6
MOV A,#3
MOV @R0,A
INC R0
MOV A,#0
MOV @R0,A
INC R0
MOV A,#2
MOV @R0,A
MOV R0,#20H
```

### B13

```asm
MOV A,@R0
INC R0
MOV B,@R0
INC R0
INC R0
ADD A,B
MOV @R0,A
DEC R0
DEC R0
DJNZ R7,LOOP
```

### B14

Return to the instruction following the active call.

```asm
RET
```

### B15

```asm
MOV 30H,#1
MOV R1,#30H
MOV A,30H
SUBB A,#3
MOV R7,A
MOV A,#4
MOV @R0,A
INC R0
MOV A,#2
MOV @R0,A
INC R0
MOV A,#3
MOV @R0,A
ACALL CHECK
```

### B16

```asm
MOV R0,#20H
```

### B17

```asm
MOV A,@R0
INC R0
MOV B,@R0
INC R0
INC R0
ADD A,B
MOV @R0,A
DEC R0
DEC R0
DJNZ R7,LOOP2
```

### B18

Return to the instruction following the active call.

```asm
MOV @R1,A
RET
```

### B19

```asm
MOV A,30H
CJNE A,#0,S
```

### B20

```asm
AJMP OPTION2
```

## Section 3

```mermaid
flowchart TD
B20["B21: S - lines 92 to 92"]
B21["B22: instructions - lines 93 to 94"]
B22["B23: S2 - lines 96 to 96"]
B23["B24: instructions - lines 97 to 98"]
B24["B25: S3 - lines 100 to 100"]
B25["B26: instructions - lines 101 to 102"]
B26["B27: S4 - lines 103 to 103"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B1
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B1
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B1
B1["Continue at B2 in section 1"]
```

### B21

```asm
CJNE A,#1,S2
```

### B22

```asm
MOV @R1,20H
AJMP MENU
```

### B23

```asm
CJNE A,#2,S3
```

### B24

```asm
MOV @R1,21H
AJMP MENU
```

### B25

```asm
CJNE A,#3,S4
```

### B26

```asm
MOV @R1,22H
AJMP MENU
```

### B27

Return to the instruction following the active call.

```asm
RET
```
