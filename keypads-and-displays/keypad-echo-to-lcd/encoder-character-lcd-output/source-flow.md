# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6)

## Destinations requiring review

`K14`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
94: movA, ##'
```

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 7 to 7"]
B1["B2: instructions - lines 8 to 11"]
B2["B3: LP - lines 12 to 12"]
B3["B4: instructions - lines 13 to 13"]
B4["B5: instructions - lines 14 to 14"]
B5["B6: LP2 - lines 15 to 15"]
B6["B7: instructions - lines 16 to 16"]
B7["B8: WRCMD40 - lines 20 to 24"]
B8["B9: instructions - lines 25 to 25"]
B9["B10: WRDATA - lines 28 to 32"]
B0 -->|call| B39
B0 -->|after return| B1
B1 -->|call| B7
B1 -->|after return| B2
B2 -->|condition true| B2
B2 -->|condition false| B3
B3 -->|call| B14
B3 -->|after return| B4
B4 -->|call| B9
B4 -->|after return| B5
B5 -->|condition true| B5
B5 -->|condition false| B6
B6 -->|jump| B2
B7 -->|call| B11
B7 -->|after return| B8
B9 -->|call| B11
B9 -->|after return| B10
B39["Continue at B40 in section 4"]
B14["Continue at B15 in section 2"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL LCD_INI
```

### B2

```asm
MOV P1,#0FFH
SETB DAV
MOV A,#80H
ACALL WRCMD40
```

### B3

```asm
JNB DAV,LP
```

### B4

```asm
ACALL KEY
```

### B5

```asm
ACALL WRDATA
```

### B6

```asm
JB DAV,LP2
```

### B7

```asm
SJMP LP
```

### B8

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B9

Return to the instruction following the active call.

```asm
RET
```

### B10

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 33"]
B11["B12: WT40 - lines 36 to 36"]
B12["B13: WT - lines 37 to 37"]
B13["B14: instructions - lines 38 to 38"]
B14["B15: KEY - lines 41 to 46"]
B15["B16: instructions - lines 47 to 47"]
B16["B17: CONV - lines 49 to 49"]
B17["B18: instructions - lines 50 to 51"]
B18["B19: K1 - lines 53 to 53"]
B19["B20: instructions - lines 54 to 55"]
B11 -->|next| B12
B12 -->|condition true| B12
B12 -->|condition false| B13
B14 -->|call| B16
B14 -->|after return| B15
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B38
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B38
B38["Continue at B39 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

Return to the instruction following the active call.

```asm
RET
```

### B12

```asm
MOV R0,#19
```

### B13

```asm
DJNZ R0,WT
```

### B14

Return to the instruction following the active call.

```asm
RET
```

### B15

```asm
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
```

### B16

Return to the instruction following the active call.

```asm
RET
```

### B17

```asm
cjne A, #0, k1
```

### B18

```asm
mov A, #'1'
jmp got_it
```

### B19

```asm
cjne A, #1, k2
```

### B20

```asm
mov A, #'2'
jmp got_it
```

## Section 3

```mermaid
flowchart TD
B20["B21: K2 - lines 57 to 57"]
B21["B22: instructions - lines 58 to 59"]
B22["B23: K4 - lines 61 to 61"]
B23["B24: instructions - lines 62 to 63"]
B24["B25: K5 - lines 65 to 65"]
B25["B26: instructions - lines 66 to 67"]
B26["B27: K6 - lines 69 to 69"]
B27["B28: instructions - lines 70 to 71"]
B28["B29: K8 - lines 73 to 73"]
B29["B30: instructions - lines 74 to 75"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B38
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B38
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B38
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|jump| B38
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B38
B38["Continue at B39 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
cjne A, #2, k4
```

### B22

```asm
mov A, #'3'
jmp got_it
```

### B23

```asm
cjne A, #4, k5
```

### B24

```asm
mov A, #'4'
jmp got_it
```

### B25

```asm
cjne A, #5, k6
```

### B26

```asm
mov A, #'5'
jmp got_it
```

### B27

```asm
cjne A, #6, k8
```

### B28

```asm
mov A, #6'
jmp got_it
```

### B29

```asm
cjne A, #8, k9
```

### B30

```asm
mov A, #'7'
jmp got_it
```

## Section 4

```mermaid
flowchart TD
B30["B31: K9 - lines 77 to 77"]
B31["B32: instructions - lines 78 to 79"]
B32["B33: K10 - lines 81 to 81"]
B33["B34: instructions - lines 82 to 83"]
B34["B35: K12 - lines 85 to 85"]
B35["B36: instructions - lines 86 to 88"]
B36["B37: K13 - lines 90 to 90"]
B37["B38: instructions - lines 91 to 92"]
B38["B39: GOT_IT - lines 96 to 96"]
B39["B40: LCD_INI - lines 102 to 102"]
B30 -->|condition true| B32
B30 -->|condition false| B31
B31 -->|jump| B38
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|jump| B38
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|jump| B38
B36 -->|condition true| BX1
B36 -->|condition false| B37
B37 -->|jump| B38
B39 -->|call| B51
B39 -->|after return| B40
BX1["Unresolved destination: K14"]
B51["Continue at B52 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
cjne A, #9, k10
```

### B32

```asm
mov A, #'8'
jmp got_it
```

### B33

```asm
cjne A, #10, k12
```

### B34

```asm
mov A, #'9'
jmp got_it
```

### B35

```asm
cjne A, #12, k13
```

### B36

```asm
mov A, #™"
jmp got_it
```

### B37

```asm
cjne A, #13, k14
```

### B38

```asm
mov A, #0'
jmp got_it
```

### B39

Return to the instruction following the active call.

```asm
ret
```

### B40

```asm
ACALL WAIT
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 103 to 104"]
B41["B42: instructions - lines 105 to 106"]
B42["B43: instructions - lines 107 to 108"]
B43["B44: instructions - lines 109 to 110"]
B44["B45: instructions - lines 111 to 112"]
B45["B46: instructions - lines 113 to 114"]
B46["B47: instructions - lines 115 to 116"]
B47["B48: instructions - lines 117 to 118"]
B48["B49: instructions - lines 119 to 119"]
B49["B50: WRCMD - lines 122 to 126"]
B40 -->|call| B49
B40 -->|after return| B41
B41 -->|call| B49
B41 -->|after return| B42
B42 -->|call| B49
B42 -->|after return| B43
B43 -->|call| B49
B43 -->|after return| B44
B44 -->|call| B49
B44 -->|after return| B45
B45 -->|call| B49
B45 -->|after return| B46
B46 -->|call| B49
B46 -->|after return| B47
B47 -->|call| B7
B47 -->|after return| B48
B49 -->|call| B51
B49 -->|after return| B50
B7["Continue at B8 in section 1"]
B51["Continue at B52 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#38H
ACALL WRCMD
```

### B42

```asm
MOV A,#038H
ACALL WRCMD
```

### B43

```asm
MOV A,#038H
ACALL WRCMD
```

### B44

```asm
MOV A,#038H
ACALL WRCMD
```

### B45

```asm
MOV A,#8
ACALL WRCMD
```

### B46

```asm
MOV A,#1
ACALL WRCMD
```

### B47

```asm
MOV A,#6
ACALL WRCMD
```

### B48

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 127 to 127"]
B51["B52: WAIT - lines 130 to 130"]
B52["B53: WT0 - lines 131 to 131"]
B53["B54: WT1 - lines 132 to 132"]
B54["B55: WT2 - lines 133 to 133"]
B55["B56: instructions - lines 134 to 134"]
B56["B57: instructions - lines 135 to 135"]
B57["B58: instructions - lines 136 to 136"]
B51 -->|next| B52
B52 -->|next| B53
B53 -->|next| B54
B54 -->|condition true| B54
B54 -->|condition false| B55
B55 -->|condition true| B53
B55 -->|condition false| B56
B56 -->|condition true| B52
B56 -->|condition false| B57
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

```asm
MOV R5,#1
```

### B53

```asm
MOV R6,#28
```

### B54

```asm
MOV R7,#255
```

### B55

```asm
DJNZ R7,WT2
```

### B56

```asm
DJNZ R6,WT1
```

### B57

```asm
DJNZ R5,WT0
```

### B58

Return to the instruction following the active call.

```asm
RET
```
