# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Destinations requiring review

`CONVERTER`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
135: ;100's digit
140: ;10's digit
146: ;1's digit
```

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 7 to 7"]
B1["B2: instructions - lines 12 to 13"]
B2["B3: instructions - lines 15 to 16"]
B3["B4: instructions - lines 17 to 18"]
B4["B5: instructions - lines 21 to 22"]
B5["B6: instructions - lines 23 to 23"]
B6["B7: instructions - lines 25 to 26"]
B7["B8: instructions - lines 27 to 27"]
B8["B9: instructions - lines 28 to 29"]
B9["B10: instructions - lines 30 to 31"]
B0 -->|call| B86
B0 -->|after return| B1
B1 -->|call| B80
B1 -->|after return| B2
B2 -->|call| B70
B2 -->|after return| B3
B3 -->|call| B80
B3 -->|after return| B4
B4 -->|call| B70
B4 -->|after return| B5
B5 -->|call| B96
B5 -->|after return| B6
B6 -->|call| B80
B6 -->|after return| B7
B7 -->|call| B93
B7 -->|after return| B8
B8 -->|call| B80
B8 -->|after return| B9
B9 -->|call| B70
B9 -->|after return| B10
B86["Continue at B87 in section 9"]
B80["Continue at B81 in section 9"]
B70["Continue at B71 in section 8"]
B96["Continue at B97 in section 10"]
B93["Continue at B94 in section 10"]
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
B10["B11: instructions - lines 32 to 33"]
B11["B12: instructions - lines 34 to 35"]
B12["B13: instructions - lines 36 to 36"]
B13["B14: instructions - lines 40 to 41"]
B14["B15: instructions - lines 42 to 42"]
B15["B16: instructions - lines 43 to 44"]
B16["B17: instructions - lines 45 to 46"]
B17["B18: instructions - lines 47 to 48"]
B18["B19: instructions - lines 49 to 50"]
B19["B20: instructions - lines 51 to 51"]
B10 -->|call| B80
B10 -->|after return| B11
B11 -->|call| B70
B11 -->|after return| B12
B12 -->|call| B96
B12 -->|after return| B13
B13 -->|call| B80
B13 -->|after return| B14
B14 -->|call| B93
B14 -->|after return| B15
B15 -->|call| B80
B15 -->|after return| B16
B16 -->|call| B70
B16 -->|after return| B17
B17 -->|call| B80
B17 -->|after return| B18
B18 -->|call| B70
B18 -->|after return| B19
B19 -->|call| B100
B19 -->|after return| B20
B80["Continue at B81 in section 9"]
B70["Continue at B71 in section 8"]
B96["Continue at B97 in section 10"]
B93["Continue at B94 in section 10"]
B100["Continue at B101 in section 11"]
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
ACALL KEYPAD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 52 to 53"]
B21["B22: instructions - lines 54 to 54"]
B22["B23: instructions - lines 57 to 57"]
B23["B24: instructions - lines 59 to 60"]
B24["B25: instructions - lines 61 to 61"]
B25["B26: instructions - lines 62 to 63"]
B26["B27: instructions - lines 64 to 65"]
B27["B28: instructions - lines 66 to 67"]
B28["B29: instructions - lines 68 to 69"]
B29["B30: instructions - lines 70 to 70"]
B20 -->|call| B75
B20 -->|after return| B21
B21 -->|call| B96
B21 -->|after return| B22
B22 -->|condition true| B33
B22 -->|condition false| B23
B23 -->|call| B80
B23 -->|after return| B24
B24 -->|call| B93
B24 -->|after return| B25
B25 -->|call| B80
B25 -->|after return| B26
B26 -->|call| B70
B26 -->|after return| B27
B27 -->|call| B80
B27 -->|after return| B28
B28 -->|call| B70
B28 -->|after return| B29
B29 -->|call| B44
B29 -->|after return| B30
B75["Continue at B76 in section 8"]
B96["Continue at B97 in section 10"]
B33["Continue at B34 in section 4"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B70["Continue at B71 in section 8"]
B44["Continue at B45 in section 5"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV R5,A
ACALL WCHR
```

### B22

```asm
ACALL DELAY_1SEC
```

### B23

```asm
CJNE R5, #'1', HEXADECIMAL
```

### B24

```asm
MOV A, #1H
ACALL CMD
```

### B25

```asm
ACALL TMSEC
```

### B26

```asm
MOV A,#80H
ACALL CMD
```

### B27

```asm
MOV DPTR, #ENTER1
ACALL WSTR
```

### B28

```asm
MOV A,#0C0H
ACALL CMD
```

### B29

```asm
MOV DPTR, #NUMBER_MSG
ACALL WSTR
```

### B30

```asm
ACALL BinToDec
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 71 to 72"]
B31["B32: instructions - lines 73 to 73"]
B32["B33: instructions - lines 74 to 74"]
B33["B34: HEXADECIMAL - lines 76 to 76"]
B34["B35: instructions - lines 78 to 79"]
B35["B36: instructions - lines 80 to 80"]
B36["B37: instructions - lines 81 to 82"]
B37["B38: instructions - lines 83 to 84"]
B38["B39: instructions - lines 85 to 86"]
B39["B40: instructions - lines 87 to 88"]
B30 -->|call| BX1
B30 -->|after return| B31
B31 -->|call| B58
B31 -->|after return| B32
B32 -->|jump| B43
B33 -->|condition true| B43
B33 -->|condition false| B34
B34 -->|call| B80
B34 -->|after return| B35
B35 -->|call| B93
B35 -->|after return| B36
B36 -->|call| B80
B36 -->|after return| B37
B37 -->|call| B70
B37 -->|after return| B38
B38 -->|call| B80
B38 -->|after return| B39
B39 -->|call| B70
B39 -->|after return| B40
BX1["Unresolved destination: CONVERTER"]
B58["Continue at B59 in section 6"]
B43["Continue at B44 in section 5"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B70["Continue at B71 in section 8"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A, R0
ACALL Converter
```

### B32

```asm
ACALL DISPLAY
```

### B33

```asm
SJMP STOP
```

### B34

```asm
CJNE R5, #'2', STOP
```

### B35

```asm
MOV A, #1H
ACALL CMD
```

### B36

```asm
ACALL TMSEC
```

### B37

```asm
MOV A,#80H
ACALL CMD
```

### B38

```asm
MOV DPTR, #ENTER2
ACALL WSTR
```

### B39

```asm
MOV A,#0C0H
ACALL CMD
```

### B40

```asm
MOV DPTR, #NUMBER_MSG
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 89 to 89"]
B41["B42: instructions - lines 90 to 90"]
B42["B43: instructions - lines 91 to 91"]
B43["B44: STOP - lines 92 to 92"]
B44["B45: BINTODEC - lines 96 to 99"]
B45["B46: LOOP - lines 102 to 103"]
B46["B47: instructions - lines 104 to 104"]
B47["B48: instructions - lines 105 to 115"]
B48["B49: instructions - lines 116 to 116"]
B49["B50: HEXTODEC - lines 119 to 119"]
B40 -->|call| B49
B40 -->|after return| B41
B41 -->|call| BX2
B41 -->|after return| B42
B42 -->|call| B58
B42 -->|after return| B43
B43 -->|jump| B43
B44 -->|next| B45
B45 -->|call| B100
B45 -->|after return| B46
B46 -->|call| B75
B46 -->|after return| B47
B47 -->|condition true| B45
B47 -->|condition false| B48
B49 -->|call| B100
B49 -->|after return| B50
BX2["Unresolved destination: CONVERTER"]
B58["Continue at B59 in section 6"]
B100["Continue at B101 in section 11"]
B75["Continue at B76 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL HexToDec
```

### B42

```asm
ACALL Converter
```

### B43

```asm
ACALL DISPLAY
```

### B44

```asm
SJMP $
```

### B45

```asm
mov R2,#8
MOV R0,#0
MOV R1,#128
MOV DPTR,#Binary
```

### B46

```asm
CLR A
ACALL KEYPAD
```

### B47

```asm
ACALL WCHR
```

### B48

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

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
ACALL KEYPAD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 120 to 120"]
B51["B52: instructions - lines 121 to 126"]
B52["B53: instructions - lines 127 to 127"]
B53["B54: instructions - lines 128 to 131"]
B54["B55: instructions - lines 132 to 132"]
B55["B56: instructions - lines 136 to 139"]
B56["B57: instructions - lines 141 to 145"]
B57["B58: instructions - lines 147 to 150"]
B58["B59: DISPLAY - lines 153 to 154"]
B59["B60: instructions - lines 155 to 155"]
B50 -->|call| B75
B50 -->|after return| B51
B51 -->|call| B100
B51 -->|after return| B52
B52 -->|call| B75
B52 -->|after return| B53
B53 -->|call| B96
B53 -->|after return| B54
B58 -->|call| B80
B58 -->|after return| B59
B59 -->|call| B93
B59 -->|after return| B60
B75["Continue at B76 in section 8"]
B100["Continue at B101 in section 11"]
B96["Continue at B97 in section 10"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL WCHR
```

### B52

```asm
CLR C
SUBB A,#30H
MOV B,#16
MUL AB
MOV R0,A
ACALL KEYPAD
```

### B53

```asm
ACALL WCHR
```

### B54

```asm
CLR C
SUBB A,#30H
ADD A,R0
ACALL DELAY_1SEC
```

### B55

Return to the instruction following the active call.

```asm
RET
```

### B56

```asm
MOV B, #100
DIV AB
ADD A, #30H
MOV 40H, A ;Store the 100's digit to RAM location 40H
```

### B57

```asm
MOV A, B
MOV B, #10
DIV AB
ADD A, #30H
MOV 41H, A ;Store the 10's digit to RAM location 41H
```

### B58

Return to the instruction following the active call.

```asm
MOV A, B
ADD A, #30H
MOV 42H, A ;Store the 1's digit to RAM location 42H
RET
```

### B59

```asm
MOV A, #1H
ACALL CMD
```

### B60

```asm
ACALL TMSEC
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 156 to 157"]
B61["B62: instructions - lines 158 to 159"]
B62["B63: instructions - lines 160 to 161"]
B63["B64: instructions - lines 162 to 162"]
B64["B65: FIRSTZERO - lines 165 to 165"]
B65["B66: instructions - lines 166 to 167"]
B66["B67: instructions - lines 168 to 168"]
B67["B68: SECONDZERO - lines 171 to 171"]
B68["B69: THIRDDIGIT - lines 175 to 176"]
B69["B70: instructions - lines 178 to 178"]
B60 -->|call| B70
B60 -->|after return| B61
B61 -->|condition true| B64
B61 -->|condition false| B62
B62 -->|condition true| B67
B62 -->|condition false| B63
B63 -->|jump| B68
B64 -->|call| B75
B64 -->|after return| B65
B65 -->|call| B75
B65 -->|after return| B66
B66 -->|jump| B68
B67 -->|call| B75
B67 -->|after return| B68
B68 -->|call| B75
B68 -->|after return| B69
B70["Continue at B71 in section 8"]
B75["Continue at B76 in section 8"]
```

### B61

```asm
MOV DPTR ,#DISPLAY_MSG
ACALL WSTR
```

### B62

```asm
MOV A,40H
CJNE A,#'0',FIRSTZERO
```

### B63

```asm
MOV A, 41H
CJNE A,#'0',SECONDZERO
```

### B64

```asm
SJMP THIRDDIGIT
```

### B65

```asm
ACALL WCHR
```

### B66

```asm
MOV A,41H
ACALL WCHR
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
MOV A,42H
ACALL WCHR
```

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: WSTR - lines 181 to 181"]
B71["B72: CONT1 - lines 183 to 185"]
B72["B73: PRINT - lines 187 to 187"]
B73["B74: instructions - lines 188 to 189"]
B74["B75: EXIT1 - lines 190 to 191"]
B75["B76: WCHR - lines 195 to 199"]
B76["B77: instructions - lines 200 to 200"]
B77["B78: instructions - lines 201 to 203"]
B78["B79: instructions - lines 204 to 204"]
B79["B80: instructions - lines 205 to 207"]
B70 -->|next| B71
B71 -->|condition true| B74
B71 -->|condition false| B72
B72 -->|call| B75
B72 -->|after return| B73
B73 -->|jump| B71
B75 -->|call| B85
B75 -->|after return| B76
B76 -->|call| B91
B76 -->|after return| B77
B77 -->|call| B85
B77 -->|after return| B78
B78 -->|call| B91
B78 -->|after return| B79
B85["Continue at B86 in section 9"]
B91["Continue at B92 in section 10"]
```

### B71

```asm
PUSH ACC
```

### B72

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B73

```asm
ACALL WCHR
```

### B74

```asm
INC DPTR
AJMP CONT1
```

### B75

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B76

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B77

```asm
ACALL LDELAY
```

### B78

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B79

```asm
ACALL LDELAY
```

### B80

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: CMD - lines 210 to 212"]
B81["B82: instructions - lines 213 to 213"]
B82["B83: instructions - lines 214 to 216"]
B83["B84: instructions - lines 217 to 217"]
B84["B85: instructions - lines 218 to 218"]
B85["B86: COMMON - lines 221 to 226"]
B86["B87: INLCD - lines 229 to 236"]
B87["B88: instructions - lines 237 to 245"]
B88["B89: instructions - lines 246 to 258"]
B89["B90: instructions - lines 259 to 269"]
B80 -->|call| B85
B80 -->|after return| B81
B81 -->|call| B91
B81 -->|after return| B82
B82 -->|call| B85
B82 -->|after return| B83
B83 -->|call| B91
B83 -->|after return| B84
B86 -->|call| B91
B86 -->|after return| B87
B87 -->|call| B91
B87 -->|after return| B88
B88 -->|call| B91
B88 -->|after return| B89
B89 -->|call| B91
B89 -->|after return| B90
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B82

```asm
ACALL LDELAY
```

### B83

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B84

```asm
ACALL LDELAY
```

### B85

Return to the instruction following the active call.

```asm
RET
```

### B86

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B87

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

### B88

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

### B89

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

### B90

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

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 270 to 270"]
B91["B92: LDELAY - lines 273 to 274"]
B92["B93: instructions - lines 275 to 275"]
B93["B94: TMSEC - lines 279 to 282"]
B94["B95: BACK - lines 284 to 284"]
B95["B96: instructions - lines 285 to 287"]
B96["B97: DELAY_1SEC - lines 291 to 292"]
B97["B98: LOOP2 - lines 294 to 294"]
B98["B99: instructions - lines 295 to 295"]
B99["B100: instructions - lines 296 to 297"]
B91 -->|condition true| B91
B91 -->|condition false| B92
B93 -->|next| B94
B94 -->|condition true| B94
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|call| B93
B97 -->|after return| B98
B98 -->|condition true| B97
B98 -->|condition false| B99
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

```asm
MOV R3, #50
DJNZ R3, $
```

### B93

Return to the instruction following the active call.

```asm
RET
```

### B94

```asm
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
SETB TR0
```

### B95

```asm
JNB TF0,BACK
```

### B96

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B97

```asm
PUSH 07H
MOV R7, #20
```

### B98

```asm
ACALL TMSEC
```

### B99

```asm
DJNZ R7, LOOP2
```

### B100

Return to the instruction following the active call.

```asm
POP 07H
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: KEYPAD - lines 302 to 302"]
B101["B102: K1 - lines 303 to 306"]
B102["B103: K2 - lines 308 to 310"]
B103["B104: instructions - lines 311 to 311"]
B104["B105: OVER1 - lines 313 to 316"]
B105["B106: instructions - lines 317 to 320"]
B106["B107: instructions - lines 321 to 324"]
B107["B108: instructions - lines 325 to 328"]
B108["B109: instructions - lines 329 to 329"]
B109["B110: ROW_0 - lines 330 to 331"]
B100 -->|next| B101
B101 -->|condition true| B101
B101 -->|condition false| B102
B102 -->|condition true| B104
B102 -->|condition false| B103
B103 -->|jump| B102
B104 -->|condition true| B109
B104 -->|condition false| B105
B105 -->|condition true| B110
B105 -->|condition false| B106
B106 -->|condition true| B111
B106 -->|condition false| B107
B107 -->|condition true| B112
B107 -->|condition false| B108
B108 -->|jump| B102
B109 -->|jump| B113
B110["Continue at B111 in section 12"]
B111["Continue at B112 in section 12"]
B112["Continue at B113 in section 12"]
B113["Continue at B114 in section 12"]
```

### B101

```asm
MOV P0,#01110000B
```

### B102

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B103

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B104

```asm
SJMP K2
```

### B105

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B106

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B107

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B108

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B109

```asm
LJMP K2
```

### B110

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 12

```mermaid
flowchart TD
B110["B111: ROW_1 - lines 332 to 333"]
B111["B112: ROW_2 - lines 334 to 335"]
B112["B113: ROW_3 - lines 336 to 336"]
B113["B114: FIND - lines 338 to 338"]
B114["B115: FIND1 - lines 340 to 341"]
B115["B116: instructions - lines 342 to 343"]
B116["B117: MATCH - lines 344 to 346"]
B110 -->|jump| B113
B111 -->|jump| B113
B112 -->|next| B113
B113 -->|next| B114
B114 -->|condition true| B116
B114 -->|condition false| B115
B115 -->|jump| B114
```

### B111

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B112

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B113

```asm
MOV DPTR,#KCODE3
```

### B114

```asm
RLC A
```

### B115

```asm
RLC A
JNC MATCH
```

### B116

```asm
INC DPTR
SJMP FIND1
```

### B117

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
