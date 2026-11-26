# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6)

## Destinations requiring review

`DELAY`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 14"]
B1["B2: MAIN - lines 17 to 17"]
B2["B3: instructions - lines 19 to 20"]
B3["B4: instructions - lines 21 to 21"]
B4["B5: instructions - lines 24 to 25"]
B5["B6: instructions - lines 26 to 26"]
B6["B7: instructions - lines 29 to 30"]
B7["B8: instructions - lines 31 to 31"]
B8["B9: instructions - lines 34 to 35"]
B9["B10: instructions - lines 36 to 36"]
B0 -->|next| B1
B1 -->|call| B14
B1 -->|after return| B2
B2 -->|call| B17
B2 -->|after return| B3
B3 -->|call| B18
B3 -->|after return| B4
B4 -->|call| B17
B4 -->|after return| B5
B5 -->|call| B27
B5 -->|after return| B6
B6 -->|call| B17
B6 -->|after return| B7
B7 -->|call| B34
B7 -->|after return| B8
B8 -->|call| B17
B8 -->|after return| B9
B9 -->|call| B41
B9 -->|after return| B10
B14["Continue at B15 in section 2"]
B17["Continue at B18 in section 2"]
B18["Continue at B19 in section 2"]
B27["Continue at B28 in section 3"]
B34["Continue at B35 in section 4"]
B41["Continue at B42 in section 5"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV P2,#0FFH
MOV P1,#00H
MOV R7,#0H
MOV R5,#0
MOV R4,#0
MOV R3,#0
MOV 40H,#0
MOV 41H,#0
MOV 42H,#0
MOV 43H,#0
MOV 45H,#0
```

### B2

```asm
ACALL SHOW_CASH
```

### B3

```asm
MOV R6,#00000011B
ACALL READ
```

### B4

```asm
ACALL TYPE
```

### B5

```asm
MOV R6,#00001100B
ACALL READ
```

### B6

```asm
ACALL SIZE
```

### B7

```asm
MOV R6,#00110000B
ACALL READ
```

### B8

```asm
ACALL MILK
```

### B9

```asm
MOV R6,#11000000B
ACALL READ
```

### B10

```asm
ACALL SUGAR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 39 to 39"]
B11["B12: instructions - lines 40 to 40"]
B12["B13: instructions - lines 41 to 41"]
B13["B14: instructions - lines 46 to 46"]
B14["B15: SHOW_CASH - lines 53 to 55"]
B15["B16: instructions - lines 56 to 58"]
B16["B17: instructions - lines 59 to 59"]
B17["B18: READ - lines 62 to 64"]
B18["B19: TYPE - lines 67 to 67"]
B19["B20: instructions - lines 68 to 70"]
B10 -->|call| B48
B10 -->|after return| B11
B11 -->|call| B49
B11 -->|after return| B12
B12 -->|call| B53
B12 -->|after return| B13
B13 -->|jump| B1
B14 -->|call| BX1
B14 -->|after return| B15
B15 -->|call| BX2
B15 -->|after return| B16
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B26
B48["Continue at B49 in section 5"]
B49["Continue at B50 in section 5"]
B53["Continue at B54 in section 6"]
B1["Continue at B2 in section 1"]
BX1["Unresolved destination: DELAY"]
BX2["Unresolved destination: DELAY"]
B20["Continue at B21 in section 3"]
B26["Continue at B27 in section 3"]
```

### B11

```asm
ACALL COST
```

### B12

```asm
ACALL SHOW_COST
```

### B13

```asm
ACALL SHOW_REST
```

### B14

```asm
SJMP MAIN
```

### B15

```asm
MOV A,#CASHX
MOV P1,A
ACALL DELAY
```

### B16

```asm
MOV A,#CASHY
MOV P1,A
ACALL DELAY
```

### B17

Return to the instruction following the active call.

```asm
RET
```

### B18

Return to the instruction following the active call.

```asm
MOV A,P2
ANL A,R6
RET
```

### B19

```asm
CJNE A,#00H, NEXT1
```

### B20

```asm
MOV R3,#AMER
MOV 40H,#1
SJMP BACK
```

## Section 3

```mermaid
flowchart TD
B20["B21: NEXT1 - lines 72 to 72"]
B21["B22: instructions - lines 73 to 75"]
B22["B23: NEXT2 - lines 77 to 77"]
B23["B24: instructions - lines 78 to 80"]
B24["B25: NEXT3 - lines 82 to 82"]
B25["B26: instructions - lines 83 to 85"]
B26["B27: ERROR - lines 88 to 88"]
B27["B28: SIZE - lines 91 to 91"]
B28["B29: instructions - lines 92 to 94"]
B29["B30: NEXTT1 - lines 96 to 96"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B26
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B26
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B26
B27 -->|condition true| B29
B27 -->|condition false| B28
B28 -->|jump| B33
B29 -->|condition true| B31
B29 -->|condition false| B30
B33["Continue at B34 in section 4"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
CJNE A,#01H,NEXT2
```

### B22

```asm
MOV R3,#CAP
MOV 40H,#2
SJMP BACK
```

### B23

```asm
CJNE A,#02H,NEXT3
```

### B24

```asm
MOV R3,#LATTE
MOV 40H,#3
SJMP BACK
```

### B25

```asm
CJNE A,#03H,ERROR
```

### B26

```asm
MOV R4,#MOCHA
MOV 40H,#4
SJMP BACK
```

### B27

Return to the instruction following the active call.

```asm
RET
```

### B28

```asm
CJNE A,#00B, NEXTT1
```

### B29

```asm
MOV R5,#SMALL
MOV 41H,#1
SJMP BACK1
```

### B30

```asm
CJNE A,#0100B,NEXTT2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 97 to 99"]
B31["B32: NEXTT2 - lines 101 to 101"]
B32["B33: instructions - lines 102 to 104"]
B33["B34: ERROR1 - lines 108 to 108"]
B34["B35: MILK - lines 111 to 111"]
B35["B36: instructions - lines 112 to 113"]
B36["B37: NEXTTT1 - lines 115 to 115"]
B37["B38: instructions - lines 116 to 117"]
B38["B39: NEXTTT2 - lines 119 to 119"]
B39["B40: instructions - lines 120 to 121"]
B30 -->|jump| B33
B31 -->|condition true| B33
B31 -->|condition false| B32
B32 -->|jump| B33
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|jump| B40
B36 -->|condition true| B38
B36 -->|condition false| B37
B37 -->|jump| B40
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B40
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV R5,#MED
MOV 41H,#2
SJMP BACK1
```

### B32

```asm
CJNE A,#1000B,ERROR1
```

### B33

```asm
MOV R5,#LARGE
MOV 41H,#3
SJMP BACK1
```

### B34

Return to the instruction following the active call.

```asm
RET
```

### B35

```asm
CJNE A,#000000B, NEXTTT1
```

### B36

```asm
MOV 42H,#1
SJMP BACK2
```

### B37

```asm
CJNE A,#010000B,NEXTTT2
```

### B38

```asm
MOV 42H,#2
SJMP BACK2
```

### B39

```asm
CJNE A,#100000B,ERROR2
```

### B40

```asm
MOV 42H,#3
SJMP BACK2
```

## Section 5

```mermaid
flowchart TD
B40["B41: ERROR2 - lines 125 to 125"]
B41["B42: SUGAR - lines 128 to 128"]
B42["B43: instructions - lines 129 to 130"]
B43["B44: NEXTTT11 - lines 132 to 132"]
B44["B45: instructions - lines 133 to 134"]
B45["B46: NEXTTT22 - lines 136 to 136"]
B46["B47: instructions - lines 137 to 138"]
B47["B48: ERROR3 - lines 141 to 141"]
B48["B49: COST - lines 144 to 152"]
B49["B50: SHOW_COST - lines 155 to 156"]
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B47
B43 -->|condition true| B45
B43 -->|condition false| B44
B44 -->|jump| B47
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|jump| B47
B49 -->|call| BX3
B49 -->|after return| B50
BX3["Unresolved destination: DELAY"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

```asm
CJNE A,#00000000B, NEXTTT11
```

### B43

```asm
MOV 43H,#1
SJMP BACK3
```

### B44

```asm
CJNE A,#01000000B,NEXTTT22
```

### B45

```asm
MOV 43H,#2
SJMP BACK3
```

### B46

```asm
CJNE A,#10000000B,ERROR3
```

### B47

```asm
MOV 43H,#3
SJMP BACK3
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

Return to the instruction following the active call.

```asm
MOV A,R3
ADD A,R5
MOV R3,A
MOV B,#100
DIV AB
MOV R3,B
ADD A,R4
MOV R4,A
RET
```

### B50

```asm
MOV P1,R4
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 157 to 158"]
B51["B52: instructions - lines 159 to 159"]
B52["B53: instructions - lines 160 to 160"]
B53["B54: SHOW_REST - lines 163 to 166"]
B54["B55: instructions - lines 167 to 170"]
B55["B56: LDE - lines 173 to 173"]
B56["B57: instructions - lines 174 to 175"]
B57["B58: instructions - lines 176 to 176"]
B50 -->|call| BX4
B50 -->|after return| B51
B51 -->|call| BX5
B51 -->|after return| B52
B53 -->|call| BX6
B53 -->|after return| B54
B55 -->|call| BX7
B55 -->|after return| B56
B56 -->|call| BX8
B56 -->|after return| B57
BX4["Unresolved destination: DELAY"]
BX5["Unresolved destination: DELAY"]
BX6["Unresolved destination: DELAY"]
BX7["Unresolved destination: DELAY"]
BX8["Unresolved destination: DELAY"]
```

### B51

```asm
MOV P1,R3
ACALL DELAY
```

### B52

```asm
ACALL DELAY
```

### B53

Return to the instruction following the active call.

```asm
RET
```

### B54

```asm
MOV A,#CASHX
SUBB A,R4
MOV P1,A
ACALL DELAY
```

### B55

Return to the instruction following the active call.

```asm
MOV A,#CASHY
SUBB A,R3
MOV P1,A
RET
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
MOV P1,R7
ACALL DELAY
```

### B58

Return to the instruction following the active call.

```asm
RET
```
