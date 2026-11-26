# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Destinations requiring review

`CONVERTER`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
144: ;100's digit
149: ;10's digit
155: ;1's digit
```

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 5 to 5"]
B1["B2: instructions - lines 7 to 7"]
B2["B3: MAIN - lines 11 to 13"]
B3["B4: instructions - lines 18 to 19"]
B4["B5: instructions - lines 21 to 22"]
B5["B6: instructions - lines 23 to 24"]
B6["B7: instructions - lines 27 to 28"]
B7["B8: instructions - lines 29 to 29"]
B8["B9: instructions - lines 30 to 30"]
B9["B10: EX0ISR - lines 33 to 34"]
B0 -->|jump| B2
B1 -->|jump| B9
B2 -->|call| B89
B2 -->|after return| B3
B3 -->|call| B83
B3 -->|after return| B4
B4 -->|call| B73
B4 -->|after return| B5
B5 -->|call| B83
B5 -->|after return| B6
B6 -->|call| B73
B6 -->|after return| B7
B7 -->|call| B99
B7 -->|after return| B8
B8 -->|jump| B8
B9 -->|call| B83
B9 -->|after return| B10
B89["Continue at B90 in section 9"]
B83["Continue at B84 in section 9"]
B73["Continue at B74 in section 8"]
B99["Continue at B100 in section 10"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
LJMP EX0ISR
```

### B3

```asm
MOV IE,#10000001B
SETB IT0
ACALL INLCD
```

### B4

```asm
MOV A,#80H
ACALL CMD
```

### B5

```asm
MOV DPTR, #WELCOME1
ACALL WSTR
```

### B6

```asm
MOV A,#0C0H
ACALL CMD
```

### B7

```asm
MOV DPTR, #WELCOME2
ACALL WSTR
```

### B8

```asm
ACALL DELAY_1SEC
```

### B9

```asm
SJMP $
```

### B10

```asm
MOV A, #1H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 35 to 35"]
B11["B12: instructions - lines 36 to 37"]
B12["B13: instructions - lines 38 to 39"]
B13["B14: instructions - lines 40 to 41"]
B14["B15: instructions - lines 42 to 43"]
B15["B16: instructions - lines 44 to 44"]
B16["B17: instructions - lines 48 to 49"]
B17["B18: instructions - lines 50 to 50"]
B18["B19: instructions - lines 51 to 52"]
B19["B20: instructions - lines 53 to 54"]
B10 -->|call| B96
B10 -->|after return| B11
B11 -->|call| B83
B11 -->|after return| B12
B12 -->|call| B73
B12 -->|after return| B13
B13 -->|call| B83
B13 -->|after return| B14
B14 -->|call| B73
B14 -->|after return| B15
B15 -->|call| B99
B15 -->|after return| B16
B16 -->|call| B83
B16 -->|after return| B17
B17 -->|call| B96
B17 -->|after return| B18
B18 -->|call| B83
B18 -->|after return| B19
B19 -->|call| B73
B19 -->|after return| B20
B96["Continue at B97 in section 10"]
B83["Continue at B84 in section 9"]
B73["Continue at B74 in section 8"]
B99["Continue at B100 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL TMSEC
```

### B12

```asm
MOV A,#80H
ACALL CMD
```

### B13

```asm
MOV DPTR, #MSG1
ACALL WSTR
```

### B14

```asm
MOV A,#0C0H
ACALL CMD
```

### B15

```asm
MOV DPTR, #MSG2
ACALL WSTR
```

### B16

```asm
ACALL DELAY_1SEC
```

### B17

```asm
MOV A, #1H
ACALL CMD
```

### B18

```asm
ACALL TMSEC
```

### B19

```asm
MOV A,#80H
ACALL CMD
```

### B20

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 55 to 56"]
B21["B22: instructions - lines 57 to 58"]
B22["B23: instructions - lines 59 to 59"]
B23["B24: instructions - lines 60 to 61"]
B24["B25: instructions - lines 62 to 62"]
B25["B26: instructions - lines 65 to 65"]
B26["B27: instructions - lines 67 to 68"]
B27["B28: instructions - lines 69 to 69"]
B28["B29: instructions - lines 70 to 71"]
B29["B30: instructions - lines 72 to 73"]
B20 -->|call| B83
B20 -->|after return| B21
B21 -->|call| B73
B21 -->|after return| B22
B22 -->|call| B103
B22 -->|after return| B23
B23 -->|call| B78
B23 -->|after return| B24
B24 -->|call| B99
B24 -->|after return| B25
B25 -->|condition true| B36
B25 -->|condition false| B26
B26 -->|call| B83
B26 -->|after return| B27
B27 -->|call| B96
B27 -->|after return| B28
B28 -->|call| B83
B28 -->|after return| B29
B29 -->|call| B73
B29 -->|after return| B30
B83["Continue at B84 in section 9"]
B73["Continue at B74 in section 8"]
B103["Continue at B104 in section 11"]
B78["Continue at B79 in section 8"]
B99["Continue at B100 in section 10"]
B36["Continue at B37 in section 4"]
B96["Continue at B97 in section 10"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#0C0H
ACALL CMD
```

### B22

```asm
MOV DPTR, #CHOICE
ACALL WSTR
```

### B23

```asm
ACALL KEYPAD
```

### B24

```asm
MOV R5,A
ACALL WCHR
```

### B25

```asm
ACALL DELAY_1SEC
```

### B26

```asm
CJNE R5, #'1', HEXADECIMAL
```

### B27

```asm
MOV A, #1H
ACALL CMD
```

### B28

```asm
ACALL TMSEC
```

### B29

```asm
MOV A,#80H
ACALL CMD
```

### B30

```asm
MOV DPTR, #ENTER1
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 74 to 75"]
B31["B32: instructions - lines 76 to 77"]
B32["B33: instructions - lines 78 to 78"]
B33["B34: instructions - lines 79 to 80"]
B34["B35: instructions - lines 81 to 81"]
B35["B36: instructions - lines 82 to 82"]
B36["B37: HEXADECIMAL - lines 84 to 84"]
B37["B38: instructions - lines 86 to 87"]
B38["B39: instructions - lines 88 to 88"]
B39["B40: instructions - lines 89 to 90"]
B30 -->|call| B83
B30 -->|after return| B31
B31 -->|call| B73
B31 -->|after return| B32
B32 -->|call| B47
B32 -->|after return| B33
B33 -->|call| BX1
B33 -->|after return| B34
B34 -->|call| B61
B34 -->|after return| B35
B35 -->|jump| B46
B36 -->|condition true| B46
B36 -->|condition false| B37
B37 -->|call| B83
B37 -->|after return| B38
B38 -->|call| B96
B38 -->|after return| B39
B39 -->|call| B83
B39 -->|after return| B40
B83["Continue at B84 in section 9"]
B73["Continue at B74 in section 8"]
B47["Continue at B48 in section 5"]
BX1["Unresolved destination: CONVERTER"]
B61["Continue at B62 in section 7"]
B46["Continue at B47 in section 5"]
B96["Continue at B97 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#0C0H
ACALL CMD
```

### B32

```asm
MOV DPTR, #NUMBER_MSG
ACALL WSTR
```

### B33

```asm
ACALL BinToDec
```

### B34

```asm
MOV A, R0
ACALL Converter
```

### B35

```asm
ACALL DISPLAY
```

### B36

```asm
SJMP STOP
```

### B37

```asm
CJNE R5, #'2', STOP
```

### B38

```asm
MOV A, #1H
ACALL CMD
```

### B39

```asm
ACALL TMSEC
```

### B40

```asm
MOV A,#80H
ACALL CMD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 91 to 92"]
B41["B42: instructions - lines 93 to 94"]
B42["B43: instructions - lines 95 to 96"]
B43["B44: instructions - lines 97 to 97"]
B44["B45: instructions - lines 98 to 98"]
B45["B46: instructions - lines 99 to 99"]
B46["B47: STOP - lines 100 to 100"]
B47["B48: BINTODEC - lines 105 to 108"]
B48["B49: LOOP - lines 111 to 112"]
B49["B50: instructions - lines 113 to 113"]
B40 -->|call| B73
B40 -->|after return| B41
B41 -->|call| B83
B41 -->|after return| B42
B42 -->|call| B73
B42 -->|after return| B43
B43 -->|call| B52
B43 -->|after return| B44
B44 -->|call| BX2
B44 -->|after return| B45
B45 -->|call| B61
B45 -->|after return| B46
B47 -->|next| B48
B48 -->|call| B103
B48 -->|after return| B49
B49 -->|call| B78
B49 -->|after return| B50
B73["Continue at B74 in section 8"]
B83["Continue at B84 in section 9"]
B52["Continue at B53 in section 6"]
BX2["Unresolved destination: CONVERTER"]
B61["Continue at B62 in section 7"]
B103["Continue at B104 in section 11"]
B78["Continue at B79 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR, #ENTER2
ACALL WSTR
```

### B42

```asm
MOV A,#0C0H
ACALL CMD
```

### B43

```asm
MOV DPTR, #NUMBER_MSG
ACALL WSTR
```

### B44

```asm
ACALL HexToDec
```

### B45

```asm
ACALL Converter
```

### B46

```asm
ACALL DISPLAY
```

### B47

Resume the interrupted program.

```asm
RETI
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
ACALL KEYPAD
```

### B50

```asm
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 114 to 124"]
B51["B52: instructions - lines 125 to 125"]
B52["B53: HEXTODEC - lines 128 to 128"]
B53["B54: instructions - lines 129 to 129"]
B54["B55: instructions - lines 130 to 135"]
B55["B56: instructions - lines 136 to 136"]
B56["B57: instructions - lines 137 to 140"]
B57["B58: instructions - lines 141 to 141"]
B58["B59: instructions - lines 145 to 148"]
B59["B60: instructions - lines 150 to 154"]
B50 -->|condition true| B48
B50 -->|condition false| B51
B52 -->|call| B103
B52 -->|after return| B53
B53 -->|call| B78
B53 -->|after return| B54
B54 -->|call| B103
B54 -->|after return| B55
B55 -->|call| B78
B55 -->|after return| B56
B56 -->|call| B99
B56 -->|after return| B57
B48["Continue at B49 in section 5"]
B103["Continue at B104 in section 11"]
B78["Continue at B79 in section 8"]
B99["Continue at B100 in section 10"]
```

### B51

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
DJNZ R2,LOOP
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

```asm
ACALL KEYPAD
```

### B54

```asm
ACALL WCHR
```

### B55

```asm
CLR C
SUBB A,#30H
MOV B,#16
MUL AB
MOV R0,A
ACALL KEYPAD
```

### B56

```asm
ACALL WCHR
```

### B57

```asm
CLR C
SUBB A,#30H
ADD A,R0
ACALL DELAY_1SEC
```

### B58

Return to the instruction following the active call.

```asm
RET
```

### B59

```asm
MOV B, #100
DIV AB
ADD A, #30H
MOV 40H, A ;Store the 100's digit to RAM location 40H
```

### B60

```asm
MOV A, B
MOV B, #10
DIV AB
ADD A, #30H
MOV 41H, A ;Store the 10's digit to RAM location 41H
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 156 to 159"]
B61["B62: DISPLAY - lines 162 to 163"]
B62["B63: instructions - lines 164 to 164"]
B63["B64: instructions - lines 165 to 166"]
B64["B65: instructions - lines 167 to 168"]
B65["B66: instructions - lines 169 to 170"]
B66["B67: instructions - lines 171 to 171"]
B67["B68: FIRSTZERO - lines 174 to 174"]
B68["B69: instructions - lines 175 to 176"]
B69["B70: instructions - lines 177 to 177"]
B61 -->|call| B83
B61 -->|after return| B62
B62 -->|call| B96
B62 -->|after return| B63
B63 -->|call| B73
B63 -->|after return| B64
B64 -->|condition true| B67
B64 -->|condition false| B65
B65 -->|condition true| B70
B65 -->|condition false| B66
B66 -->|jump| B71
B67 -->|call| B78
B67 -->|after return| B68
B68 -->|call| B78
B68 -->|after return| B69
B69 -->|jump| B71
B83["Continue at B84 in section 9"]
B96["Continue at B97 in section 10"]
B73["Continue at B74 in section 8"]
B70["Continue at B71 in section 8"]
B71["Continue at B72 in section 8"]
B78["Continue at B79 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
MOV A, B
ADD A, #30H
MOV 42H, A ;Store the 1's digit to RAM location 42H
RET
```

### B62

```asm
MOV A, #1H
ACALL CMD
```

### B63

```asm
ACALL TMSEC
```

### B64

```asm
MOV DPTR ,#DISPLAY_MSG
ACALL WSTR
```

### B65

```asm
MOV A,40H
CJNE A,#'0',FIRSTZERO
```

### B66

```asm
MOV A, 41H
CJNE A,#'0',SECONDZERO
```

### B67

```asm
SJMP THIRDDIGIT
```

### B68

```asm
ACALL WCHR
```

### B69

```asm
MOV A,41H
ACALL WCHR
```

### B70

```asm
SJMP THIRDDIGIT
```

## Section 8

```mermaid
flowchart TD
B70["B71: SECONDZERO - lines 180 to 180"]
B71["B72: THIRDDIGIT - lines 184 to 185"]
B72["B73: instructions - lines 187 to 187"]
B73["B74: WSTR - lines 190 to 190"]
B74["B75: CONT1 - lines 192 to 194"]
B75["B76: PRINT - lines 196 to 196"]
B76["B77: instructions - lines 197 to 198"]
B77["B78: EXIT1 - lines 199 to 200"]
B78["B79: WCHR - lines 204 to 208"]
B79["B80: instructions - lines 209 to 209"]
B70 -->|call| B78
B70 -->|after return| B71
B71 -->|call| B78
B71 -->|after return| B72
B73 -->|next| B74
B74 -->|condition true| B77
B74 -->|condition false| B75
B75 -->|call| B78
B75 -->|after return| B76
B76 -->|jump| B74
B78 -->|call| B88
B78 -->|after return| B79
B79 -->|call| B94
B79 -->|after return| B80
B88["Continue at B89 in section 9"]
B94["Continue at B95 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL WCHR
```

### B72

```asm
MOV A,42H
ACALL WCHR
```

### B73

Return to the instruction following the active call.

```asm
RET
```

### B74

```asm
PUSH ACC
```

### B75

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B76

```asm
ACALL WCHR
```

### B77

```asm
INC DPTR
AJMP CONT1
```

### B78

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B79

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B80

```asm
ACALL LDELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 210 to 212"]
B81["B82: instructions - lines 213 to 213"]
B82["B83: instructions - lines 214 to 216"]
B83["B84: CMD - lines 219 to 221"]
B84["B85: instructions - lines 222 to 222"]
B85["B86: instructions - lines 223 to 225"]
B86["B87: instructions - lines 226 to 226"]
B87["B88: instructions - lines 227 to 227"]
B88["B89: COMMON - lines 230 to 235"]
B89["B90: INLCD - lines 238 to 245"]
B80 -->|call| B88
B80 -->|after return| B81
B81 -->|call| B94
B81 -->|after return| B82
B83 -->|call| B88
B83 -->|after return| B84
B84 -->|call| B94
B84 -->|after return| B85
B85 -->|call| B88
B85 -->|after return| B86
B86 -->|call| B94
B86 -->|after return| B87
B89 -->|call| B94
B89 -->|after return| B90
B94["Continue at B95 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B82

```asm
ACALL LDELAY
```

### B83

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B84

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B85

```asm
ACALL LDELAY
```

### B86

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B87

```asm
ACALL LDELAY
```

### B88

Return to the instruction following the active call.

```asm
RET
```

### B89

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B90

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

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 246 to 254"]
B91["B92: instructions - lines 255 to 267"]
B92["B93: instructions - lines 268 to 278"]
B93["B94: instructions - lines 279 to 279"]
B94["B95: LDELAY - lines 282 to 283"]
B95["B96: instructions - lines 284 to 284"]
B96["B97: TMSEC - lines 288 to 291"]
B97["B98: BACK - lines 293 to 293"]
B98["B99: instructions - lines 294 to 296"]
B99["B100: DELAY_1SEC - lines 300 to 301"]
B90 -->|call| B94
B90 -->|after return| B91
B91 -->|call| B94
B91 -->|after return| B92
B92 -->|call| B94
B92 -->|after return| B93
B94 -->|condition true| B94
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|condition true| B97
B97 -->|condition false| B98
B99 -->|next| B100
B100["Continue at B101 in section 11"]
```

### B91

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

### B92

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

### B93

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

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
MOV R3, #50
DJNZ R3, $
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
SETB TR0
```

### B98

```asm
JNB TF0,BACK
```

### B99

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B100

```asm
PUSH 07H
MOV R7, #20
```

## Section 11

```mermaid
flowchart TD
B100["B101: LOOP2 - lines 303 to 303"]
B101["B102: instructions - lines 304 to 304"]
B102["B103: instructions - lines 305 to 306"]
B103["B104: KEYPAD - lines 311 to 311"]
B104["B105: K1 - lines 312 to 315"]
B105["B106: K2 - lines 317 to 319"]
B106["B107: instructions - lines 320 to 320"]
B107["B108: OVER1 - lines 322 to 325"]
B108["B109: instructions - lines 326 to 329"]
B109["B110: instructions - lines 330 to 333"]
B100 -->|call| B96
B100 -->|after return| B101
B101 -->|condition true| B100
B101 -->|condition false| B102
B103 -->|next| B104
B104 -->|condition true| B104
B104 -->|condition false| B105
B105 -->|condition true| B107
B105 -->|condition false| B106
B106 -->|jump| B105
B107 -->|condition true| B112
B107 -->|condition false| B108
B108 -->|condition true| B113
B108 -->|condition false| B109
B109 -->|condition true| B114
B109 -->|condition false| B110
B96["Continue at B97 in section 10"]
B112["Continue at B113 in section 12"]
B113["Continue at B114 in section 12"]
B114["Continue at B115 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL TMSEC
```

### B102

```asm
DJNZ R7, LOOP2
```

### B103

Return to the instruction following the active call.

```asm
POP 07H
RET
```

### B104

```asm
MOV P0,#01110000B
```

### B105

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B106

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B107

```asm
SJMP K2
```

### B108

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B109

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B110

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 334 to 337"]
B111["B112: instructions - lines 338 to 338"]
B112["B113: ROW_0 - lines 339 to 340"]
B113["B114: ROW_1 - lines 341 to 342"]
B114["B115: ROW_2 - lines 343 to 344"]
B115["B116: ROW_3 - lines 345 to 345"]
B116["B117: FIND - lines 347 to 347"]
B117["B118: FIND1 - lines 349 to 350"]
B118["B119: instructions - lines 351 to 352"]
B119["B120: MATCH - lines 353 to 355"]
B110 -->|condition true| B115
B110 -->|condition false| B111
B111 -->|jump| B105
B112 -->|jump| B116
B113 -->|jump| B116
B114 -->|jump| B116
B115 -->|next| B116
B116 -->|next| B117
B117 -->|condition true| B119
B117 -->|condition false| B118
B118 -->|jump| B117
B105["Continue at B106 in section 11"]
```

### B111

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B112

```asm
LJMP K2
```

### B113

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B114

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B115

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B116

```asm
MOV DPTR,#KCODE3
```

### B117

```asm
RLC A
```

### B118

```asm
RLC A
JNC MATCH
```

### B119

```asm
INC DPTR
SJMP FIND1
```

### B120

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
