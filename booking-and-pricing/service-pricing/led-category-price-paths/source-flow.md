# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

Start from the first executable block or the entry selected by the calling application.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6)

## Destinations requiring review

`HERE`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 1 to 10"]
B1["B2: instructions - lines 11 to 11"]
B2["B3: instructions - lines 12 to 12"]
B3["B4: NEXT1 - lines 14 to 14"]
B4["B5: instructions - lines 15 to 15"]
B5["B6: instructions - lines 16 to 16"]
B6["B7: NEXT2 - lines 18 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: CAT1 - lines 22 to 23"]
B9["B10: instructions - lines 24 to 25"]
B0 -->|condition true| B3
B0 -->|condition false| B1
B1 -->|call| B8
B1 -->|after return| B2
B2 -->|jump| BX1
B3 -->|condition true| B6
B3 -->|condition false| B4
B4 -->|call| B23
B4 -->|after return| B5
B5 -->|jump| BX2
B6 -->|call| B38
B6 -->|after return| B7
B7 -->|jump| BX3
B8 -->|call| B53
B8 -->|after return| B9
B9 -->|call| B53
B9 -->|after return| B10
BX1["Unresolved destination: HERE"]
B23["Continue at B24 in section 3"]
BX2["Unresolved destination: HERE"]
B38["Continue at B39 in section 4"]
BX3["Unresolved destination: HERE"]
B53["Continue at B54 in section 6"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#1
MOV 31H,#1
MOV 32H,#2
MOV 33H,#2
MOV 34H,#1
MOV P1,00H
MOV P1,#0FFH
MOV A,30H
CJNE A,#1,NEXT1
```

### B2

```asm
ACALL CAT1
```

### B3

```asm
AJMP HERE
```

### B4

```asm
CJNE A,#2,NEXT2
```

### B5

```asm
ACALL CAT2
```

### B6

```asm
AJMP HERE
```

### B7

```asm
ACALL CAT3
```

### B8

```asm
AJMP HERE
```

### B9

```asm
CLR P1.0
ACALL DELAY
```

### B10

```asm
SETB P1.0
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 26 to 28"]
B11["B12: instructions - lines 29 to 29"]
B12["B13: CONT - lines 31 to 32"]
B13["B14: instructions - lines 33 to 34"]
B14["B15: instructions - lines 35 to 36"]
B15["B16: instructions - lines 37 to 37"]
B16["B17: CONT2 - lines 39 to 40"]
B17["B18: instructions - lines 41 to 42"]
B18["B19: instructions - lines 44 to 47"]
B19["B20: instructions - lines 48 to 48"]
B10 -->|condition true| B12
B10 -->|condition false| B11
B11 -->|next| B12
B12 -->|call| B53
B12 -->|after return| B13
B13 -->|call| B53
B13 -->|after return| B14
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|next| B16
B16 -->|call| B53
B16 -->|after return| B17
B17 -->|call| B53
B17 -->|after return| B18
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|next| B20
B53["Continue at B54 in section 6"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#38
MOV R0,31H
CJNE R0,#1,CONT
```

### B12

```asm
ADD A,#8
```

### B13

```asm
CLR P1.0
ACALL DELAY
```

### B14

```asm
SETB P1.0
ACALL DELAY
```

### B15

```asm
MOV R0,32H
CJNE R0,#1,CONT2
```

### B16

```asm
ADD A,#10
```

### B17

```asm
CLR P1.0
ACALL DELAY
```

### B18

```asm
SETB P1.0
ACALL DELAY
```

### B19

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONT3
```

### B20

```asm
SUBB A, #5
```

## Section 3

```mermaid
flowchart TD
B20["B21: CONT3 - lines 50 to 52"]
B21["B22: instructions - lines 53 to 54"]
B22["B23: instructions - lines 56 to 56"]
B23["B24: CAT2 - lines 58 to 59"]
B24["B25: instructions - lines 60 to 61"]
B25["B26: instructions - lines 62 to 64"]
B26["B27: instructions - lines 65 to 65"]
B27["B28: CONTT - lines 67 to 68"]
B28["B29: instructions - lines 69 to 70"]
B29["B30: instructions - lines 71 to 72"]
B20 -->|call| B53
B20 -->|after return| B21
B21 -->|call| B53
B21 -->|after return| B22
B23 -->|call| B53
B23 -->|after return| B24
B24 -->|call| B53
B24 -->|after return| B25
B25 -->|condition true| B27
B25 -->|condition false| B26
B26 -->|next| B27
B27 -->|call| B53
B27 -->|after return| B28
B28 -->|call| B53
B28 -->|after return| B29
B29 -->|condition true| B31
B29 -->|condition false| B30
B53["Continue at B54 in section 6"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV 35H,A
CLR P1.0
ACALL DELAY
```

### B22

```asm
SETB P1.0
ACALL DELAY
```

### B23

Return to the instruction following the active call.

```asm
RET
```

### B24

```asm
CLR P1.1
ACALL DELAY
```

### B25

```asm
SETB P1.1
ACALL DELAY
```

### B26

```asm
MOV A,#45
MOV R0,31H
CJNE R0,#1,CONTT
```

### B27

```asm
ADD A,#10
```

### B28

```asm
CLR P1.1
ACALL DELAY
```

### B29

```asm
SETB P1.1
ACALL DELAY
```

### B30

```asm
MOV R0,32H
CJNE R0,#1,CONTT2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 73 to 73"]
B31["B32: CONTT2 - lines 75 to 76"]
B32["B33: instructions - lines 77 to 78"]
B33["B34: instructions - lines 80 to 83"]
B34["B35: instructions - lines 84 to 84"]
B35["B36: CONTT3 - lines 86 to 88"]
B36["B37: instructions - lines 89 to 90"]
B37["B38: instructions - lines 92 to 92"]
B38["B39: CAT3 - lines 94 to 95"]
B39["B40: instructions - lines 96 to 97"]
B30 -->|next| B31
B31 -->|call| B53
B31 -->|after return| B32
B32 -->|call| B53
B32 -->|after return| B33
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|next| B35
B35 -->|call| B53
B35 -->|after return| B36
B36 -->|call| B53
B36 -->|after return| B37
B38 -->|call| B53
B38 -->|after return| B39
B39 -->|call| B53
B39 -->|after return| B40
B53["Continue at B54 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ADD A,#15
```

### B32

```asm
CLR P1.1
ACALL DELAY
```

### B33

```asm
SETB P1.1
ACALL DELAY
```

### B34

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTT3
```

### B35

```asm
SUBB A, #8
```

### B36

```asm
MOV 35H,A
CLR P1.1
ACALL DELAY
```

### B37

```asm
SETB P1.1
ACALL DELAY
```

### B38

Return to the instruction following the active call.

```asm
RET
```

### B39

```asm
CLR P1.2
ACALL DELAY
```

### B40

```asm
SETB P1.2
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 98 to 100"]
B41["B42: instructions - lines 101 to 101"]
B42["B43: CONTTT - lines 103 to 104"]
B43["B44: instructions - lines 105 to 106"]
B44["B45: instructions - lines 107 to 108"]
B45["B46: instructions - lines 109 to 109"]
B46["B47: CONTTT2 - lines 111 to 112"]
B47["B48: instructions - lines 113 to 114"]
B48["B49: instructions - lines 116 to 119"]
B49["B50: instructions - lines 120 to 120"]
B40 -->|condition true| B42
B40 -->|condition false| B41
B41 -->|next| B42
B42 -->|call| B53
B42 -->|after return| B43
B43 -->|call| B53
B43 -->|after return| B44
B44 -->|condition true| B46
B44 -->|condition false| B45
B45 -->|next| B46
B46 -->|call| B53
B46 -->|after return| B47
B47 -->|call| B53
B47 -->|after return| B48
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|next| B50
B53["Continue at B54 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#66
MOV R0,31H
CJNE R0,#1,CONTTT
```

### B42

```asm
ADD A,#12
```

### B43

```asm
CLR P1.2
ACALL DELAY
```

### B44

```asm
SETB P1.2
ACALL DELAY
```

### B45

```asm
MOV R0,32H
CJNE R0,#1,CONTTT2
```

### B46

```asm
ADD A,#18
```

### B47

```asm
CLR P1.2
ACALL DELAY
```

### B48

```asm
SETB P1.2
ACALL DELAY
```

### B49

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTTT3
```

### B50

```asm
SUBB A, #15
```

## Section 6

```mermaid
flowchart TD
B50["B51: CONTTT3 - lines 122 to 124"]
B51["B52: instructions - lines 125 to 126"]
B52["B53: instructions - lines 127 to 127"]
B53["B54: DELAY - lines 130 to 131"]
B54["B55: HERE1 - lines 133 to 133"]
B55["B56: instructions - lines 134 to 134"]
B56["B57: instructions - lines 135 to 135"]
B50 -->|call| B53
B50 -->|after return| B51
B51 -->|call| B53
B51 -->|after return| B52
B53 -->|next| B54
B54 -->|condition true| B54
B54 -->|condition false| B55
B55 -->|condition true| B54
B55 -->|condition false| B56
```

### B51

```asm
MOV 35H,A
CLR P1.2
ACALL DELAY
```

### B52

```asm
SETB P1.2
ACALL DELAY
```

### B53

Return to the instruction following the active call.

```asm
RET
```

### B54

```asm
MOV R1,#100
MOV R0,#10
```

### B55

```asm
DJNZ R1,HERE2
```

### B56

```asm
DJNZ R0,HERE1
```

### B57

Return to the instruction following the active call.

```asm
RET
```
