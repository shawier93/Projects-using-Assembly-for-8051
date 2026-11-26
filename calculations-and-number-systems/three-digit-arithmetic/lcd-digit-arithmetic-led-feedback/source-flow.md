# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 4 to 9"]
B2["B3: instructions - lines 10 to 10"]
B3["B4: instructions - lines 11 to 11"]
B4["B5: instructions - lines 12 to 12"]
B5["B6: instructions - lines 13 to 13"]
B6["B7: instructions - lines 14 to 14"]
B7["B8: instructions - lines 15 to 15"]
B8["B9: instructions - lines 17 to 17"]
B9["B10: instructions - lines 19 to 20"]
B0 -->|call| B43
B0 -->|after return| B1
B1 -->|call| B33
B1 -->|after return| B2
B2 -->|call| B33
B2 -->|after return| B3
B3 -->|call| B33
B3 -->|after return| B4
B4 -->|call| B43
B4 -->|after return| B5
B5 -->|call| B36
B5 -->|after return| B6
B6 -->|call| B64
B6 -->|after return| B7
B7 -->|call| B64
B7 -->|after return| B8
B8 -->|call| B41
B8 -->|after return| B9
B9 -->|call| B53
B9 -->|after return| B10
B43["Continue at B44 in section 5"]
B33["Continue at B34 in section 4"]
B36["Continue at B37 in section 4"]
B64["Continue at B65 in section 7"]
B41["Continue at B42 in section 5"]
B53["Continue at B54 in section 6"]
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
MOV P1,#00H
ACALL FLASHING
```

### B3

```asm
ACALL FLASHING
```

### B4

```asm
ACALL FLASHING
```

### B5

```asm
ACALL INLCD
```

### B6

```asm
ACALL WELCOME
```

### B7

```asm
ACALL lDELAY
```

### B8

```asm
ACALL LDELAY
```

### B9

```asm
ACALL ADDITION
```

### B10

```asm
MOV A,#01H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 21 to 21"]
B11["B12: instructions - lines 22 to 22"]
B12["B13: instructions - lines 23 to 25"]
B13["B14: instructions - lines 26 to 28"]
B14["B15: instructions - lines 29 to 29"]
B15["B16: instructions - lines 30 to 31"]
B16["B17: instructions - lines 32 to 36"]
B17["B18: instructions - lines 37 to 39"]
B18["B19: instructions - lines 40 to 40"]
B19["B20: instructions - lines 41 to 41"]
B10 -->|call| B64
B10 -->|after return| B11
B11 -->|call| B64
B11 -->|after return| B12
B12 -->|call| B53
B12 -->|after return| B13
B13 -->|call| B59
B13 -->|after return| B14
B14 -->|call| B64
B14 -->|after return| B15
B15 -->|call| B53
B15 -->|after return| B16
B16 -->|call| B48
B16 -->|after return| B17
B17 -->|call| B48
B17 -->|after return| B18
B18 -->|call| B64
B18 -->|after return| B19
B19 -->|call| B64
B19 -->|after return| B20
B64["Continue at B65 in section 7"]
B53["Continue at B54 in section 6"]
B59["Continue at B60 in section 6"]
B48["Continue at B49 in section 5"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL LDELAY
```

### B12

```asm
ACALL LDELAY
```

### B13

```asm
CLR A
MOV A,#85H
ACALL CMD
```

### B14

```asm
CLR A
MOV DPTR,#STR3
ACALL WSTR
```

### B15

```asm
ACALL LDELAY
```

### B16

```asm
MOV A,#0C0H
ACALL CMD
```

### B17

```asm
MOV A,R3
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B18

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
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
B20["B21: instructions - lines 48 to 48"]
B21["B22: instructions - lines 49 to 57"]
B22["B23: instructions - lines 58 to 58"]
B23["B24: instructions - lines 59 to 59"]
B24["B25: instructions - lines 62 to 63"]
B25["B26: instructions - lines 64 to 64"]
B26["B27: instructions - lines 65 to 66"]
B27["B28: instructions - lines 68 to 70"]
B28["B29: instructions - lines 71 to 72"]
B29["B30: instructions - lines 73 to 75"]
B20 -->|call| B42
B20 -->|after return| B21
B21 -->|call| B64
B21 -->|after return| B22
B22 -->|call| B64
B22 -->|after return| B23
B23 -->|call| B64
B23 -->|after return| B24
B24 -->|call| B53
B24 -->|after return| B25
B25 -->|call| B66
B25 -->|after return| B26
B26 -->|call| B53
B26 -->|after return| B27
B27 -->|call| B48
B27 -->|after return| B28
B28 -->|call| B53
B28 -->|after return| B29
B29 -->|call| B48
B29 -->|after return| B30
B42["Continue at B43 in section 5"]
B64["Continue at B65 in section 7"]
B53["Continue at B54 in section 6"]
B66["Continue at B67 in section 7"]
B48["Continue at B49 in section 5"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL CONV
```

### B22

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

### B23

```asm
ACALL LDELAY
```

### B24

```asm
ACALL LDELAY
```

### B25

```asm
MOV A,#1H
ACALL CMD
```

### B26

```asm
Acall TMSEC
```

### B27

```asm
MOV A,#0C0H
ACALL CMD
```

### B28

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B29

```asm
MOV A,#0C3H
ACALL CMD
```

### B30

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 77 to 78"]
B31["B32: instructions - lines 79 to 81"]
B32["B33: FINISH - lines 86 to 86"]
B33["B34: FLASHING - lines 89 to 90"]
B34["B35: instructions - lines 91 to 92"]
B35["B36: instructions - lines 94 to 94"]
B36["B37: WELCOME - lines 97 to 98"]
B37["B38: instructions - lines 99 to 100"]
B38["B39: instructions - lines 101 to 102"]
B39["B40: instructions - lines 103 to 104"]
B30 -->|call| B53
B30 -->|after return| B31
B31 -->|call| B48
B31 -->|after return| B32
B32 -->|jump| B32
B33 -->|call| B66
B33 -->|after return| B34
B34 -->|call| B66
B34 -->|after return| B35
B36 -->|call| B53
B36 -->|after return| B37
B37 -->|call| B59
B37 -->|after return| B38
B38 -->|call| B53
B38 -->|after return| B39
B39 -->|call| B59
B39 -->|after return| B40
B53["Continue at B54 in section 6"]
B48["Continue at B49 in section 5"]
B66["Continue at B67 in section 7"]
B59["Continue at B60 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#0C6H
ACALL CMD
```

### B32

```asm
MOV A,32H
ADD A,#30H
ACALL WCHR
```

### B33

```asm
SJMP FINISH
```

### B34

```asm
CLR P1.0
ACALL TMSEC
```

### B35

```asm
SETB P1.0
ACALL TMSEC
```

### B36

Return to the instruction following the active call.

```asm
RET
```

### B37

```asm
MOV A,#80H
ACALL CMD
```

### B38

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B39

```asm
mov A,#0C0H
ACALL CMD
```

### B40

```asm
MOV DPTR,#STR2
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 105 to 105"]
B41["B42: ADDITION - lines 108 to 113"]
B42["B43: CONV - lines 117 to 133"]
B43["B44: INLCD - lines 136 to 144"]
B44["B45: instructions - lines 146 to 155"]
B45["B46: instructions - lines 157 to 172"]
B46["B47: instructions - lines 174 to 186"]
B47["B48: instructions - lines 187 to 187"]
B48["B49: WCHR - lines 192 to 196"]
B49["B50: instructions - lines 197 to 197"]
B43 -->|call| B64
B43 -->|after return| B44
B44 -->|call| B64
B44 -->|after return| B45
B45 -->|call| B64
B45 -->|after return| B46
B46 -->|call| B64
B46 -->|after return| B47
B48 -->|call| B58
B48 -->|after return| B49
B49 -->|call| B64
B49 -->|after return| B50
B64["Continue at B65 in section 7"]
B58["Continue at B59 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

Return to the instruction following the active call.

```asm
MOV A,R7
ADD A,R6
ADD A,R5
MOV R3,A
RET
```

### B43

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

### B44

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

### B45

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

### B46

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

### B47

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

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B50

```asm
ACALL LDELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 198 to 200"]
B51["B52: instructions - lines 201 to 201"]
B52["B53: instructions - lines 202 to 204"]
B53["B54: CMD - lines 207 to 209"]
B54["B55: instructions - lines 210 to 210"]
B55["B56: instructions - lines 211 to 213"]
B56["B57: instructions - lines 214 to 214"]
B57["B58: instructions - lines 215 to 215"]
B58["B59: COMMON - lines 219 to 224"]
B59["B60: WSTR - lines 228 to 228"]
B50 -->|call| B58
B50 -->|after return| B51
B51 -->|call| B64
B51 -->|after return| B52
B53 -->|call| B58
B53 -->|after return| B54
B54 -->|call| B64
B54 -->|after return| B55
B55 -->|call| B58
B55 -->|after return| B56
B56 -->|call| B64
B56 -->|after return| B57
B59 -->|next| B60
B64["Continue at B65 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B52

```asm
ACALL LDELAY
```

### B53

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B54

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B55

```asm
ACALL LDELAY
```

### B56

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B57

```asm
ACALL LDELAY
```

### B58

Return to the instruction following the active call.

```asm
RET
```

### B59

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B60

```asm
PUSH    ACC
```

## Section 7

```mermaid
flowchart TD
B60["B61: CONT1 - lines 230 to 232"]
B61["B62: PRINT - lines 234 to 234"]
B62["B63: instructions - lines 235 to 236"]
B63["B64: EXIT1 - lines 237 to 238"]
B64["B65: LDELAY - lines 242 to 243"]
B65["B66: instructions - lines 244 to 244"]
B66["B67: TMSEC - lines 249 to 252"]
B67["B68: BACK - lines 254 to 254"]
B68["B69: instructions - lines 255 to 257"]
B69["B70: instructions - lines 271 to 272"]
B60 -->|condition true| B63
B60 -->|condition false| B61
B61 -->|call| B48
B61 -->|after return| B62
B62 -->|jump| B60
B64 -->|condition true| B64
B64 -->|condition false| B65
B66 -->|next| B67
B67 -->|condition true| B67
B67 -->|condition false| B68
B69 -->|call| B53
B69 -->|after return| B70
B48["Continue at B49 in section 5"]
B53["Continue at B54 in section 6"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B62

```asm
ACALL    WCHR
```

### B63

```asm
INC DPTR
AJMP    CONT1
```

### B64

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B65

```asm
MOV R0, #50
DJNZ R0, $
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B68

```asm
JNB   TF0,BACK
```

### B69

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```

### B70

```asm
MOV A,#1H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 273 to 273"]
B70 -->|call| B66
B66["Continue at B67 in section 7"]
```

### B71

```asm
Acall TMSEC
```
