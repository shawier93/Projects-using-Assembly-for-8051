# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9)

## Destinations requiring review

`CONVERTER`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
152: ;100's digit
157: ;10's digit
163: ;1's digit
```

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 6 to 6"]
B1["B2: instructions - lines 9 to 10"]
B2["B3: instructions - lines 12 to 13"]
B3["B4: instructions - lines 14 to 15"]
B4["B5: instructions - lines 18 to 19"]
B5["B6: instructions - lines 20 to 20"]
B6["B7: instructions - lines 22 to 23"]
B7["B8: instructions - lines 24 to 24"]
B8["B9: instructions - lines 25 to 26"]
B9["B10: instructions - lines 27 to 28"]
B0 -->|call| B72
B0 -->|after return| B1
B1 -->|call| B66
B1 -->|after return| B2
B2 -->|call| B56
B2 -->|after return| B3
B3 -->|call| B66
B3 -->|after return| B4
B4 -->|call| B56
B4 -->|after return| B5
B5 -->|call| B82
B5 -->|after return| B6
B6 -->|call| B66
B6 -->|after return| B7
B7 -->|call| B79
B7 -->|after return| B8
B8 -->|call| B66
B8 -->|after return| B9
B9 -->|call| B56
B9 -->|after return| B10
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
B56["Continue at B57 in section 6"]
B82["Continue at B83 in section 9"]
B79["Continue at B80 in section 8"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A,#80H
ACALL CMD
```

### B3

```asm
MOV DPTR, #WELCOME1
ACALL WSTR
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
MOV DPTR, #WELCOME2
ACALL WSTR
```

### B6

```asm
ACALL DELAY_1SEC
```

### B7

```asm
MOV A, #1H
ACALL CMD
```

### B8

```asm
ACALL TMSEC
```

### B9

```asm
MOV A,#80H
ACALL CMD
```

### B10

```asm
MOV DPTR, #MSG1
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 29 to 30"]
B11["B12: instructions - lines 31 to 32"]
B12["B13: instructions - lines 33 to 33"]
B13["B14: instructions - lines 38 to 39"]
B14["B15: instructions - lines 40 to 40"]
B15["B16: instructions - lines 41 to 42"]
B16["B17: instructions - lines 43 to 44"]
B17["B18: instructions - lines 45 to 46"]
B18["B19: instructions - lines 47 to 48"]
B19["B20: instructions - lines 49 to 52"]
B10 -->|call| B66
B10 -->|after return| B11
B11 -->|call| B56
B11 -->|after return| B12
B12 -->|call| B82
B12 -->|after return| B13
B13 -->|call| B66
B13 -->|after return| B14
B14 -->|call| B79
B14 -->|after return| B15
B15 -->|call| B66
B15 -->|after return| B16
B16 -->|call| B56
B16 -->|after return| B17
B17 -->|call| B66
B17 -->|after return| B18
B18 -->|call| B56
B18 -->|after return| B19
B19 -->|call| B61
B19 -->|after return| B20
B66["Continue at B67 in section 7"]
B56["Continue at B57 in section 6"]
B82["Continue at B83 in section 9"]
B79["Continue at B80 in section 8"]
B61["Continue at B62 in section 7"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR, #MSG2
ACALL WSTR
```

### B13

```asm
ACALL DELAY_1SEC
```

### B14

```asm
MOV A, #1H
ACALL CMD
```

### B15

```asm
ACALL TMSEC
```

### B16

```asm
MOV A,#80H
ACALL CMD
```

### B17

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B18

```asm
MOV A,#0C0H
ACALL CMD
```

### B19

```asm
MOV DPTR, #CHOICE
ACALL WSTR
```

### B20

```asm
MOV 50H,#'2'
MOV A, 50H
MOV R5, A
ACALL WCHR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 53 to 53"]
B21["B22: instructions - lines 55 to 56"]
B22["B23: instructions - lines 58 to 59"]
B23["B24: instructions - lines 60 to 61"]
B24["B25: instructions - lines 62 to 63"]
B25["B26: instructions - lines 64 to 65"]
B26["B27: instructions - lines 66 to 67"]
B27["B28: instructions - lines 68 to 68"]
B28["B29: instructions - lines 69 to 70"]
B29["B30: instructions - lines 71 to 71"]
B20 -->|call| B82
B20 -->|after return| B21
B21 -->|condition true| B44
B21 -->|condition false| B22
B22 -->|call| B66
B22 -->|after return| B23
B23 -->|call| B66
B23 -->|after return| B24
B24 -->|call| B56
B24 -->|after return| B25
B25 -->|call| B66
B25 -->|after return| B26
B26 -->|call| B56
B26 -->|after return| B27
B27 -->|call| B47
B27 -->|after return| B28
B28 -->|call| BX1
B28 -->|after return| B29
B29 -->|jump| B39
B82["Continue at B83 in section 9"]
B44["Continue at B45 in section 5"]
B66["Continue at B67 in section 7"]
B56["Continue at B57 in section 6"]
B47["Continue at B48 in section 5"]
BX1["Unresolved destination: CONVERTER"]
B39["Continue at B40 in section 4"]
```

### B21

```asm
ACALL DELAY_1SEC
```

### B22

```asm
MOV R5,50H
CJNE R5, #'1', HEXADECIMAL
```

### B23

```asm
MOV A, #1H
ACALL CMD
```

### B24

```asm
MOV A,#80H
ACALL CMD
```

### B25

```asm
MOV DPTR, #ENTER1
ACALL WSTR
```

### B26

```asm
MOV A,#0C0H
ACALL CMD
```

### B27

```asm
MOV DPTR, #NUMBER_MSG
ACALL WSTR
```

### B28

```asm
ACALL BinToDec
```

### B29

```asm
MOV A, R0
ACALL Converter
```

### B30

```asm
SJMP STOP
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 73 to 73"]
B31["B32: instructions - lines 75 to 76"]
B32["B33: instructions - lines 77 to 77"]
B33["B34: instructions - lines 78 to 79"]
B34["B35: instructions - lines 80 to 81"]
B35["B36: instructions - lines 82 to 83"]
B36["B37: instructions - lines 84 to 85"]
B37["B38: instructions - lines 86 to 86"]
B38["B39: instructions - lines 87 to 87"]
B39["B40: STOP - lines 88 to 88"]
B30 -->|condition true| B39
B30 -->|condition false| B31
B31 -->|call| B66
B31 -->|after return| B32
B32 -->|call| B79
B32 -->|after return| B33
B33 -->|call| B66
B33 -->|after return| B34
B34 -->|call| B56
B34 -->|after return| B35
B35 -->|call| B66
B35 -->|after return| B36
B36 -->|call| B56
B36 -->|after return| B37
B37 -->|call| B51
B37 -->|after return| B38
B38 -->|call| BX2
B38 -->|after return| B39
B39 -->|jump| B39
B66["Continue at B67 in section 7"]
B79["Continue at B80 in section 8"]
B56["Continue at B57 in section 6"]
B51["Continue at B52 in section 6"]
BX2["Unresolved destination: CONVERTER"]
```

### B31

```asm
CJNE R5, #'2', STOP
```

### B32

```asm
MOV A, #1H
ACALL CMD
```

### B33

```asm
ACALL TMSEC
```

### B34

```asm
MOV A,#80H
ACALL CMD
```

### B35

```asm
MOV DPTR, #ENTER2
ACALL WSTR
```

### B36

```asm
MOV A,#0C0H
ACALL CMD
```

### B37

```asm
MOV DPTR, #NUMBER_MSG
ACALL WSTR
```

### B38

```asm
ACALL HexToDec
```

### B39

```asm
ACALL Converter
```

### B40

```asm
SJMP $
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 90 to 97"]
B41["B42: instructions - lines 99 to 99"]
B42["B43: instructions - lines 100 to 101"]
B43["B44: instructions - lines 102 to 102"]
B44["B45: HEXADECIMAL - lines 104 to 104"]
B45["B46: instructions - lines 106 to 106"]
B46["B47: instructions - lines 107 to 107"]
B47["B48: BINTODEC - lines 110 to 113"]
B48["B49: LOOP - lines 116 to 118"]
B49["B50: instructions - lines 119 to 130"]
B40 -->|condition true| B44
B40 -->|condition false| B41
B41 -->|call| B47
B41 -->|after return| B42
B42 -->|call| BX3
B42 -->|after return| B43
B43 -->|jump| B39
B44 -->|condition true| B39
B44 -->|condition false| B45
B45 -->|call| B51
B45 -->|after return| B46
B46 -->|call| BX4
B46 -->|after return| B47
B47 -->|next| B48
B48 -->|call| B61
B48 -->|after return| B49
B49 -->|condition true| B48
B49 -->|condition false| B50
BX3["Unresolved destination: CONVERTER"]
B39["Continue at B40 in section 4"]
B51["Continue at B52 in section 6"]
BX4["Unresolved destination: CONVERTER"]
B61["Continue at B62 in section 7"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV 50H, #'2'
MOV 40H, #'0'
MOV 41H, #'0'
MOV 42H, #'0'
MOV A, 50H
CJNE A, #'2', HEXADECIMAL
```

### B42

```asm
ACALL BinToDec
```

### B43

```asm
MOV A, R0
ACALL Converter
```

### B44

```asm
SJMP STOP
```

### B45

```asm
CJNE A, #'1', STOP
```

### B46

```asm
ACALL HexToDec
```

### B47

```asm
ACALL Converter
```

### B48

```asm
mov R2,#8
MOV R0,#0
MOV R1,#128
MOV DPTR,#Binary
```

### B49

```asm
CLR A
MOVC A,@A+DPTR
ACALL WCHR
```

### B50

```asm
CLR C
SUBB A,#30H
MOV B,R1
MUL AB
ADD A,R0
MOV R0,A
MOV A,R1
MOV B,#2
DIV AB
MOV R1,A
INC DPTR
DJNZ R2,LOOP
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 131"]
B51["B52: HEXTODEC - lines 134 to 145"]
B52["B53: instructions - lines 146 to 149"]
B53["B54: instructions - lines 153 to 156"]
B54["B55: instructions - lines 158 to 162"]
B55["B56: instructions - lines 164 to 167"]
B56["B57: WSTR - lines 171 to 171"]
B57["B58: CONT1 - lines 173 to 175"]
B58["B59: PRINT - lines 177 to 177"]
B59["B60: instructions - lines 178 to 179"]
B51 -->|call| B61
B51 -->|after return| B52
B56 -->|next| B57
B57 -->|condition true| B60
B57 -->|condition false| B58
B58 -->|call| B61
B58 -->|after return| B59
B59 -->|jump| B57
B61["Continue at B62 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

```asm
MOV DPTR,#HEX
CLR A
MOVC A,@A+DPTR
CLR C
SUBB A,#30H
MOV B,#16
MUL AB
MOV R0,A
INC DPTR
CLR A
MOVC A,@A+DPTR
ACALL WCHR
```

### B53

Return to the instruction following the active call.

```asm
CLR C
SUBB A,#30H
ADD A,R0
RET
```

### B54

```asm
MOV B, #100
DIV AB
ADD A, #30H
MOV 40H, A ;Store the 100's digit to RAM location 40H
```

### B55

```asm
MOV A, B
MOV B, #10
DIV AB
ADD A, #30H
MOV 41H, A ;Store the 10's digit to RAM location 41H
```

### B56

Return to the instruction following the active call.

```asm
MOV A, B
ADD A, #30H
MOV 42H, A ;Store the 1's digit to RAM location 42H
RET
```

### B57

```asm
PUSH ACC
```

### B58

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B59

```asm
ACALL WCHR
```

### B60

```asm
INC DPTR
AJMP CONT1
```

## Section 7

```mermaid
flowchart TD
B60["B61: EXIT1 - lines 180 to 181"]
B61["B62: WCHR - lines 185 to 189"]
B62["B63: instructions - lines 190 to 190"]
B63["B64: instructions - lines 191 to 193"]
B64["B65: instructions - lines 194 to 194"]
B65["B66: instructions - lines 195 to 197"]
B66["B67: CMD - lines 200 to 202"]
B67["B68: instructions - lines 203 to 203"]
B68["B69: instructions - lines 204 to 206"]
B69["B70: instructions - lines 207 to 207"]
B61 -->|call| B71
B61 -->|after return| B62
B62 -->|call| B77
B62 -->|after return| B63
B63 -->|call| B71
B63 -->|after return| B64
B64 -->|call| B77
B64 -->|after return| B65
B66 -->|call| B71
B66 -->|after return| B67
B67 -->|call| B77
B67 -->|after return| B68
B68 -->|call| B71
B68 -->|after return| B69
B69 -->|call| B77
B69 -->|after return| B70
B71["Continue at B72 in section 8"]
B77["Continue at B78 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B62

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B63

```asm
ACALL LDELAY
```

### B64

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B65

```asm
ACALL LDELAY
```

### B66

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B67

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B68

```asm
ACALL LDELAY
```

### B69

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B70

```asm
ACALL LDELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 208 to 208"]
B71["B72: COMMON - lines 211 to 216"]
B72["B73: INLCD - lines 219 to 226"]
B73["B74: instructions - lines 227 to 235"]
B74["B75: instructions - lines 236 to 248"]
B75["B76: instructions - lines 249 to 259"]
B76["B77: instructions - lines 260 to 260"]
B77["B78: LDELAY - lines 263 to 264"]
B78["B79: instructions - lines 265 to 265"]
B79["B80: TMSEC - lines 269 to 272"]
B72 -->|call| B77
B72 -->|after return| B73
B73 -->|call| B77
B73 -->|after return| B74
B74 -->|call| B77
B74 -->|after return| B75
B75 -->|call| B77
B75 -->|after return| B76
B77 -->|condition true| B77
B77 -->|condition false| B78
B79 -->|next| B80
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B73

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

### B74

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

### B75

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

### B76

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

### B77

Return to the instruction following the active call.

```asm
RET
```

### B78

```asm
MOV R3, #50
DJNZ R3, $
```

### B79

Return to the instruction following the active call.

```asm
RET
```

### B80

```asm
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
SETB TR0
```

## Section 9

```mermaid
flowchart TD
B80["B81: BACK - lines 274 to 274"]
B81["B82: instructions - lines 275 to 277"]
B82["B83: DELAY_1SEC - lines 281 to 282"]
B83["B84: LOOP2 - lines 284 to 284"]
B84["B85: instructions - lines 285 to 285"]
B85["B86: instructions - lines 286 to 287"]
B80 -->|condition true| B80
B80 -->|condition false| B81
B82 -->|next| B83
B83 -->|call| B79
B83 -->|after return| B84
B84 -->|condition true| B83
B84 -->|condition false| B85
B79["Continue at B80 in section 8"]
```

### B81

```asm
JNB TF0,BACK
```

### B82

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B83

```asm
PUSH 07H
MOV R7, #20
```

### B84

```asm
ACALL TMSEC
```

### B85

```asm
DJNZ R7, LOOP2
```

### B86

Return to the instruction following the active call.

```asm
POP 07H
RET
```
