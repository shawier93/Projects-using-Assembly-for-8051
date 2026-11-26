# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 7 to 13"]
B1["B2: instructions - lines 14 to 18"]
B2["B3: instructions - lines 22 to 23"]
B3["B4: LP - lines 26 to 26"]
B4["B5: HERE - lines 28 to 29"]
B5["B6: instructions - lines 30 to 31"]
B6["B7: instructions - lines 32 to 33"]
B7["B8: NEXT - lines 35 to 38"]
B8["B9: instructions - lines 39 to 39"]
B9["B10: instructions - lines 40 to 40"]
B0 -->|call| B28
B0 -->|after return| B1
B1 -->|call| B14
B1 -->|after return| B2
B2 -->|call| B38
B2 -->|after return| B3
B3 -->|condition true| B3
B3 -->|condition false| B4
B4 -->|call| B38
B4 -->|after return| B5
B5 -->|condition true| B7
B5 -->|condition false| B6
B6 -->|next| B7
B7 -->|call| B16
B7 -->|after return| B8
B8 -->|call| B16
B8 -->|after return| B9
B9 -->|call| B16
B9 -->|after return| B10
B28["Continue at B29 in section 3"]
B14["Continue at B15 in section 2"]
B38["Continue at B39 in section 4"]
B16["Continue at B17 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV TMOD, #06H
MOV TH0, #0
MOV TL0, #0
MOV P1,#0FFH
SETB P3.4
ACALL LCD_INI
```

### B2

```asm
SETB TR0
SETB DAV
MOV A,#80H
ACALL WRCMD40
```

### B3

```asm
MOV A,#1
ACALL WRCMD
```

### B4

```asm
JNB DAV,LP
```

### B5

```asm
MOV A,#80h
ACALL WRCMD
```

### B6

```asm
MOV A, TL0
CJNE A,#10,NEXT
```

### B7

```asm
MOV A,#0
MOV TL0,#0
```

### B8

```asm
ADD A,#30H
MOV R4,A
MOV A,#30h
ACALL WRDATA
```

### B9

```asm
ACALL WRDATA
```

### B10

```asm
ACALL WRDATA
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 41 to 41"]
B11["B12: instructions - lines 42 to 43"]
B12["B13: LP2 - lines 45 to 45"]
B13["B14: instructions - lines 46 to 46"]
B14["B15: WRCMD40 - lines 50 to 54"]
B15["B16: instructions - lines 55 to 55"]
B16["B17: WRDATA - lines 58 to 62"]
B17["B18: instructions - lines 63 to 63"]
B18["B19: WT40 - lines 66 to 66"]
B19["B20: WT - lines 67 to 67"]
B10 -->|call| B16
B10 -->|after return| B11
B11 -->|call| B16
B11 -->|after return| B12
B12 -->|condition true| B12
B12 -->|condition false| B13
B13 -->|jump| B3
B14 -->|call| B18
B14 -->|after return| B15
B16 -->|call| B18
B16 -->|after return| B17
B18 -->|next| B19
B19 -->|condition true| B19
B19 -->|condition false| B20
B3["Continue at B4 in section 1"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL WRDATA
```

### B12

```asm
MOV A,R4
ACALL WRDATA
```

### B13

```asm
JB DAV,LP2
```

### B14

```asm
SJMP LP
```

### B15

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B16

Return to the instruction following the active call.

```asm
RET
```

### B17

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

### B18

Return to the instruction following the active call.

```asm
RET
```

### B19

```asm
MOV R0,#19
```

### B20

```asm
DJNZ R0,WT
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 68 to 68"]
B21["B22: WAIT - lines 71 to 71"]
B22["B23: WT0 - lines 72 to 72"]
B23["B24: WT1 - lines 73 to 73"]
B24["B25: WT2 - lines 74 to 74"]
B25["B26: instructions - lines 75 to 75"]
B26["B27: instructions - lines 76 to 76"]
B27["B28: instructions - lines 77 to 77"]
B28["B29: LCD_INI - lines 82 to 82"]
B29["B30: instructions - lines 83 to 84"]
B21 -->|next| B22
B22 -->|next| B23
B23 -->|next| B24
B24 -->|condition true| B24
B24 -->|condition false| B25
B25 -->|condition true| B23
B25 -->|condition false| B26
B26 -->|condition true| B22
B26 -->|condition false| B27
B28 -->|call| B21
B28 -->|after return| B29
B29 -->|call| B38
B29 -->|after return| B30
B38["Continue at B39 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

Return to the instruction following the active call.

```asm
RET
```

### B22

```asm
MOV R5,#1
```

### B23

```asm
MOV R6,#28
```

### B24

```asm
MOV R7,#255
```

### B25

```asm
DJNZ R7,WT2
```

### B26

```asm
DJNZ R6,WT1
```

### B27

```asm
DJNZ R5,WT0
```

### B28

Return to the instruction following the active call.

```asm
RET
```

### B29

```asm
ACALL WAIT
```

### B30

```asm
MOV A,#38H
ACALL WRCMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 85 to 86"]
B31["B32: instructions - lines 87 to 88"]
B32["B33: instructions - lines 89 to 90"]
B33["B34: instructions - lines 91 to 92"]
B34["B35: instructions - lines 93 to 94"]
B35["B36: instructions - lines 95 to 96"]
B36["B37: instructions - lines 97 to 98"]
B37["B38: instructions - lines 99 to 99"]
B38["B39: WRCMD - lines 102 to 106"]
B39["B40: instructions - lines 107 to 107"]
B30 -->|call| B38
B30 -->|after return| B31
B31 -->|call| B38
B31 -->|after return| B32
B32 -->|call| B38
B32 -->|after return| B33
B33 -->|call| B38
B33 -->|after return| B34
B34 -->|call| B38
B34 -->|after return| B35
B35 -->|call| B38
B35 -->|after return| B36
B36 -->|call| B14
B36 -->|after return| B37
B38 -->|call| B21
B38 -->|after return| B39
B14["Continue at B15 in section 2"]
B21["Continue at B22 in section 3"]
```

### B31

```asm
MOV A,#038H
ACALL WRCMD
```

### B32

```asm
MOV A,#038H
ACALL WRCMD
```

### B33

```asm
MOV A,#038H
ACALL WRCMD
```

### B34

```asm
MOV A,#8
ACALL WRCMD
```

### B35

```asm
MOV A,#1
ACALL WRCMD
```

### B36

```asm
MOV A,#6
ACALL WRCMD
```

### B37

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B38

Return to the instruction following the active call.

```asm
RET
```

### B39

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

### B40

Return to the instruction following the active call.

```asm
RET
```
