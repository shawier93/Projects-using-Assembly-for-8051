# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 4 to 8"]
B2["B3: instructions - lines 9 to 9"]
B3["B4: instructions - lines 10 to 10"]
B4["B5: instructions - lines 12 to 12"]
B5["B6: instructions - lines 14 to 15"]
B6["B7: instructions - lines 16 to 16"]
B7["B8: instructions - lines 17 to 17"]
B8["B9: instructions - lines 18 to 20"]
B9["B10: instructions - lines 21 to 23"]
B0 -->|call| B31
B0 -->|after return| B1
B1 -->|call| B24
B1 -->|after return| B2
B2 -->|call| B52
B2 -->|after return| B3
B3 -->|call| B52
B3 -->|after return| B4
B4 -->|call| B29
B4 -->|after return| B5
B5 -->|call| B41
B5 -->|after return| B6
B6 -->|call| B52
B6 -->|after return| B7
B7 -->|call| B52
B7 -->|after return| B8
B8 -->|call| B41
B8 -->|after return| B9
B9 -->|call| B47
B9 -->|after return| B10
B31["Continue at B32 in section 4"]
B24["Continue at B25 in section 3"]
B52["Continue at B53 in section 6"]
B29["Continue at B30 in section 3"]
B41["Continue at B42 in section 5"]
B47["Continue at B48 in section 5"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV R7,#2
MOV R6,#3
MOV R5,#6
ACALL WELCOME
```

### B3

```asm
ACALL lDELAY
```

### B4

```asm
ACALL LDELAY
```

### B5

```asm
ACALL ADDITION
```

### B6

```asm
MOV A,#01H
ACALL CMD
```

### B7

```asm
ACALL LDELAY
```

### B8

```asm
ACALL LDELAY
```

### B9

```asm
CLR A
MOV A,#85H
ACALL CMD
```

### B10

```asm
CLR A
MOV DPTR,#STR3
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 24 to 24"]
B11["B12: instructions - lines 25 to 26"]
B12["B13: instructions - lines 27 to 31"]
B13["B14: instructions - lines 32 to 34"]
B14["B15: instructions - lines 37 to 37"]
B15["B16: instructions - lines 38 to 46"]
B16["B17: instructions - lines 47 to 47"]
B17["B18: instructions - lines 48 to 48"]
B18["B19: instructions - lines 50 to 51"]
B19["B20: instructions - lines 52 to 54"]
B10 -->|call| B52
B10 -->|after return| B11
B11 -->|call| B41
B11 -->|after return| B12
B12 -->|call| B36
B12 -->|after return| B13
B13 -->|call| B36
B13 -->|after return| B14
B14 -->|call| B30
B14 -->|after return| B15
B15 -->|call| B52
B15 -->|after return| B16
B16 -->|call| B52
B16 -->|after return| B17
B17 -->|call| B52
B17 -->|after return| B18
B18 -->|call| B41
B18 -->|after return| B19
B19 -->|call| B41
B19 -->|after return| B20
B52["Continue at B53 in section 6"]
B41["Continue at B42 in section 5"]
B36["Continue at B37 in section 4"]
B30["Continue at B31 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL LDELAY
```

### B12

```asm
MOV A,#0C0H
ACALL CMD
```

### B13

```asm
MOV A,R3
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B14

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B15

```asm
ACALL CONV
```

### B16

```asm
MOV A,R7
MOV B,#10
DIV AB
MOV 30H,B
MOV B,#10
DIV AB
MOV 31H, B
MOV 32H,A
ACALL LDELAY
```

### B17

```asm
ACALL LDELAY
```

### B18

```asm
ACALL LDELAY
```

### B19

```asm
MOV A,#01H
ACALL CMD
```

### B20

```asm
CLR A
mov A,#0c0H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 56 to 58"]
B21["B22: instructions - lines 60 to 62"]
B22["B23: instructions - lines 64 to 66"]
B23["B24: FINISH - lines 70 to 70"]
B24["B25: WELCOME - lines 74 to 75"]
B25["B26: instructions - lines 76 to 77"]
B26["B27: instructions - lines 78 to 79"]
B27["B28: instructions - lines 80 to 81"]
B28["B29: instructions - lines 82 to 82"]
B29["B30: ADDITION - lines 85 to 90"]
B20 -->|call| B36
B20 -->|after return| B21
B21 -->|call| B36
B21 -->|after return| B22
B22 -->|call| B36
B22 -->|after return| B23
B23 -->|jump| B23
B24 -->|call| B41
B24 -->|after return| B25
B25 -->|call| B47
B25 -->|after return| B26
B26 -->|call| B41
B26 -->|after return| B27
B27 -->|call| B47
B27 -->|after return| B28
B36["Continue at B37 in section 4"]
B41["Continue at B42 in section 5"]
B47["Continue at B48 in section 5"]
```

### B21

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B22

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B23

```asm
MOV A,32H
ADD A,#30H
ACALL WCHR
```

### B24

```asm
SJMP FINISH
```

### B25

```asm
MOV A,#80H
ACALL CMD
```

### B26

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B27

```asm
mov A,#0C0H
ACALL CMD
```

### B28

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B29

Return to the instruction following the active call.

```asm
RET
```

### B30

Return to the instruction following the active call.

```asm
MOV A,R7
ADD A,R6
ADD A,R5
MOV R3,A
RET
```

## Section 4

```mermaid
flowchart TD
B30["B31: CONV - lines 94 to 110"]
B31["B32: INLCD - lines 113 to 121"]
B32["B33: instructions - lines 123 to 132"]
B33["B34: instructions - lines 134 to 149"]
B34["B35: instructions - lines 151 to 163"]
B35["B36: instructions - lines 164 to 164"]
B36["B37: WCHR - lines 169 to 173"]
B37["B38: instructions - lines 174 to 174"]
B38["B39: instructions - lines 175 to 177"]
B39["B40: instructions - lines 178 to 178"]
B31 -->|call| B52
B31 -->|after return| B32
B32 -->|call| B52
B32 -->|after return| B33
B33 -->|call| B52
B33 -->|after return| B34
B34 -->|call| B52
B34 -->|after return| B35
B36 -->|call| B46
B36 -->|after return| B37
B37 -->|call| B52
B37 -->|after return| B38
B38 -->|call| B46
B38 -->|after return| B39
B39 -->|call| B52
B39 -->|after return| B40
B52["Continue at B53 in section 6"]
B46["Continue at B47 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

Return to the instruction following the active call.

```asm
MOV B,#100
MOV A,R7
MUL AB
MOV R4,A,
MOV B,#10
MOV A,R6
MUL AB
MOV R2,A,
MOV A,R5
ADD A,R2
ADD A,R4
SUBB A,R3
MOV R7,A
RET
```

### B32

```asm
CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B33

```asm
SETB P1.2
CLR P1.2
SETB P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B34

```asm
CLR P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
SETB P1.7
SETB P1.6
SETB P1.5
SETB P1.4
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B35

```asm
CLR P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
SETB P1.6
SETB P1.5
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B36

Return to the instruction following the active call.

```asm
RET
```

### B37

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B38

```asm
ACALL LDELAY
```

### B39

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B40

```asm
ACALL LDELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 179 to 181"]
B41["B42: CMD - lines 184 to 186"]
B42["B43: instructions - lines 187 to 187"]
B43["B44: instructions - lines 188 to 190"]
B44["B45: instructions - lines 191 to 191"]
B45["B46: instructions - lines 192 to 192"]
B46["B47: COMMON - lines 196 to 201"]
B47["B48: WSTR - lines 205 to 205"]
B48["B49: CONT1 - lines 207 to 209"]
B49["B50: PRINT - lines 211 to 211"]
B41 -->|call| B46
B41 -->|after return| B42
B42 -->|call| B52
B42 -->|after return| B43
B43 -->|call| B46
B43 -->|after return| B44
B44 -->|call| B52
B44 -->|after return| B45
B47 -->|next| B48
B48 -->|condition true| B51
B48 -->|condition false| B49
B49 -->|call| B36
B49 -->|after return| B50
B52["Continue at B53 in section 6"]
B51["Continue at B52 in section 6"]
B36["Continue at B37 in section 4"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B42

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B43

```asm
ACALL LDELAY
```

### B44

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B45

```asm
ACALL LDELAY
```

### B46

Return to the instruction following the active call.

```asm
RET
```

### B47

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B48

```asm
PUSH    ACC
```

### B49

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B50

```asm
ACALL    WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 212 to 213"]
B51["B52: EXIT1 - lines 214 to 215"]
B52["B53: LDELAY - lines 219 to 220"]
B53["B54: instructions - lines 221 to 221"]
B50 -->|jump| B48
B52 -->|condition true| B52
B52 -->|condition false| B53
B48["Continue at B49 in section 5"]
```

### B51

```asm
INC DPTR
AJMP    CONT1
```

### B52

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B53

```asm
MOV R0, #50
DJNZ R0, $
```

### B54

Return to the instruction following the active call.

```asm
RET
```
