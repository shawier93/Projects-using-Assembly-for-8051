# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7)

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
B0 -->|call| B36
B0 -->|after return| B1
B1 -->|call| B29
B1 -->|after return| B2
B2 -->|call| B57
B2 -->|after return| B3
B3 -->|call| B57
B3 -->|after return| B4
B4 -->|call| B34
B4 -->|after return| B5
B5 -->|call| B46
B5 -->|after return| B6
B6 -->|call| B57
B6 -->|after return| B7
B7 -->|call| B57
B7 -->|after return| B8
B8 -->|call| B46
B8 -->|after return| B9
B9 -->|call| B52
B9 -->|after return| B10
B36["Continue at B37 in section 4"]
B29["Continue at B30 in section 3"]
B57["Continue at B58 in section 6"]
B34["Continue at B35 in section 4"]
B46["Continue at B47 in section 5"]
B52["Continue at B53 in section 6"]
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
B14["B15: instructions - lines 35 to 35"]
B15["B16: instructions - lines 36 to 36"]
B16["B17: instructions - lines 43 to 43"]
B17["B18: instructions - lines 44 to 52"]
B18["B19: instructions - lines 53 to 53"]
B19["B20: instructions - lines 54 to 54"]
B10 -->|call| B57
B10 -->|after return| B11
B11 -->|call| B46
B11 -->|after return| B12
B12 -->|call| B41
B12 -->|after return| B13
B13 -->|call| B41
B13 -->|after return| B14
B14 -->|call| B57
B14 -->|after return| B15
B15 -->|call| B57
B15 -->|after return| B16
B16 -->|call| B35
B16 -->|after return| B17
B17 -->|call| B57
B17 -->|after return| B18
B18 -->|call| B57
B18 -->|after return| B19
B19 -->|call| B57
B19 -->|after return| B20
B57["Continue at B58 in section 6"]
B46["Continue at B47 in section 5"]
B41["Continue at B42 in section 5"]
B35["Continue at B36 in section 4"]
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
ACALL LDELAY
```

### B16

```asm
ACALL LDELAY
```

### B17

```asm
ACALL CONV
```

### B18

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

### B19

```asm
ACALL LDELAY
```

### B20

```asm
ACALL LDELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 57 to 58"]
B21["B22: instructions - lines 59 to 59"]
B22["B23: instructions - lines 60 to 61"]
B23["B24: instructions - lines 63 to 65"]
B24["B25: instructions - lines 66 to 67"]
B25["B26: instructions - lines 68 to 70"]
B26["B27: instructions - lines 72 to 73"]
B27["B28: instructions - lines 74 to 76"]
B28["B29: FINISH - lines 81 to 81"]
B29["B30: WELCOME - lines 85 to 86"]
B20 -->|call| B46
B20 -->|after return| B21
B21 -->|call| B59
B21 -->|after return| B22
B22 -->|call| B46
B22 -->|after return| B23
B23 -->|call| B41
B23 -->|after return| B24
B24 -->|call| B46
B24 -->|after return| B25
B25 -->|call| B41
B25 -->|after return| B26
B26 -->|call| B46
B26 -->|after return| B27
B27 -->|call| B41
B27 -->|after return| B28
B28 -->|jump| B28
B29 -->|call| B46
B29 -->|after return| B30
B46["Continue at B47 in section 5"]
B59["Continue at B60 in section 6"]
B41["Continue at B42 in section 5"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#1H
ACALL CMD
```

### B22

```asm
Acall TMSEC
```

### B23

```asm
MOV A,#0C0H
ACALL CMD
```

### B24

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B25

```asm
MOV A,#0C3H
ACALL CMD
```

### B26

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B27

```asm
MOV A,#0C5H
ACALL CMD
```

### B28

```asm
MOV A,32H
ADD A,#30H
ACALL WCHR
```

### B29

```asm
SJMP FINISH
```

### B30

```asm
MOV A,#80H
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 87 to 88"]
B31["B32: instructions - lines 89 to 90"]
B32["B33: instructions - lines 91 to 92"]
B33["B34: instructions - lines 93 to 93"]
B34["B35: ADDITION - lines 96 to 101"]
B35["B36: CONV - lines 105 to 121"]
B36["B37: INLCD - lines 124 to 132"]
B37["B38: instructions - lines 134 to 143"]
B38["B39: instructions - lines 145 to 160"]
B39["B40: instructions - lines 162 to 174"]
B30 -->|call| B52
B30 -->|after return| B31
B31 -->|call| B46
B31 -->|after return| B32
B32 -->|call| B52
B32 -->|after return| B33
B36 -->|call| B57
B36 -->|after return| B37
B37 -->|call| B57
B37 -->|after return| B38
B38 -->|call| B57
B38 -->|after return| B39
B39 -->|call| B57
B39 -->|after return| B40
B52["Continue at B53 in section 6"]
B46["Continue at B47 in section 5"]
B57["Continue at B58 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B32

```asm
mov A,#0C0H
ACALL CMD
```

### B33

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B34

Return to the instruction following the active call.

```asm
RET
```

### B35

Return to the instruction following the active call.

```asm
MOV A,R7
ADD A,R6
ADD A,R5
MOV R3,A
RET
```

### B36

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

### B37

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

### B38

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

### B39

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

### B40

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

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 175 to 175"]
B41["B42: WCHR - lines 180 to 184"]
B42["B43: instructions - lines 185 to 185"]
B43["B44: instructions - lines 186 to 188"]
B44["B45: instructions - lines 189 to 189"]
B45["B46: instructions - lines 190 to 192"]
B46["B47: CMD - lines 195 to 197"]
B47["B48: instructions - lines 198 to 198"]
B48["B49: instructions - lines 199 to 201"]
B49["B50: instructions - lines 202 to 202"]
B41 -->|call| B51
B41 -->|after return| B42
B42 -->|call| B57
B42 -->|after return| B43
B43 -->|call| B51
B43 -->|after return| B44
B44 -->|call| B57
B44 -->|after return| B45
B46 -->|call| B51
B46 -->|after return| B47
B47 -->|call| B57
B47 -->|after return| B48
B48 -->|call| B51
B48 -->|after return| B49
B49 -->|call| B57
B49 -->|after return| B50
B51["Continue at B52 in section 6"]
B57["Continue at B58 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

```asm
PUSH ACC
PUSH B
SETB P1.3
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
POP B
POP ACC
RET
```

### B47

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B48

```asm
ACALL LDELAY
```

### B49

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B50

```asm
ACALL LDELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 203 to 203"]
B51["B52: COMMON - lines 207 to 212"]
B52["B53: WSTR - lines 216 to 216"]
B53["B54: CONT1 - lines 218 to 220"]
B54["B55: PRINT - lines 222 to 222"]
B55["B56: instructions - lines 223 to 224"]
B56["B57: EXIT1 - lines 225 to 226"]
B57["B58: LDELAY - lines 230 to 231"]
B58["B59: instructions - lines 232 to 232"]
B59["B60: TMSEC - lines 237 to 240"]
B52 -->|next| B53
B53 -->|condition true| B56
B53 -->|condition false| B54
B54 -->|call| B41
B54 -->|after return| B55
B55 -->|jump| B53
B57 -->|condition true| B57
B57 -->|condition false| B58
B59 -->|next| B60
B41["Continue at B42 in section 5"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B53

```asm
PUSH    ACC
```

### B54

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B55

```asm
ACALL    WCHR
```

### B56

```asm
INC DPTR
AJMP    CONT1
```

### B57

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B58

```asm
MOV R0, #50
DJNZ R0, $
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

## Section 7

```mermaid
flowchart TD
B60["B61: BACK - lines 242 to 242"]
B61["B62: instructions - lines 243 to 245"]
B62["B63: instructions - lines 259 to 260"]
B63["B64: instructions - lines 261 to 261"]
B60 -->|condition true| B60
B60 -->|condition false| B61
B62 -->|call| B46
B62 -->|after return| B63
B63 -->|call| B59
B46["Continue at B47 in section 5"]
B59["Continue at B60 in section 6"]
```

### B61

```asm
JNB   TF0,BACK
```

### B62

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```

### B63

```asm
MOV A,#1H
ACALL CMD
```

### B64

```asm
Acall TMSEC
```
