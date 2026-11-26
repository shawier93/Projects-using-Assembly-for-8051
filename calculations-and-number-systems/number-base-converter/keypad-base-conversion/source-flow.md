# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11)

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 3 to 3"]
B1["B2: instructions - lines 5 to 6"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 11 to 12"]
B4["B5: instructions - lines 13 to 14"]
B5["B6: instructions - lines 15 to 15"]
B6["B7: instructions - lines 17 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 22 to 23"]
B9["B10: instructions - lines 24 to 25"]
B0 -->|call| B74
B0 -->|after return| B1
B1 -->|call| B68
B1 -->|after return| B2
B2 -->|call| B79
B2 -->|after return| B3
B3 -->|call| B68
B3 -->|after return| B4
B4 -->|call| B79
B4 -->|after return| B5
B5 -->|call| B89
B5 -->|after return| B6
B6 -->|call| B68
B6 -->|after return| B7
B7 -->|call| B86
B7 -->|after return| B8
B8 -->|call| B68
B8 -->|after return| B9
B9 -->|call| B79
B9 -->|after return| B10
B74["Continue at B75 in section 8"]
B68["Continue at B69 in section 7"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B86["Continue at B87 in section 9"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A, #80H
ACALL CMD
```

### B3

```asm
MOV DPTR, #X1
ACALL WSTR
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
MOV DPTR, #X2
ACALL WSTR
```

### B6

```asm
ACALL DELAY_1SEC
```

### B7

```asm
MOV A, #01H
ACALL CMD
```

### B8

```asm
ACALL TMSEC
```

### B9

```asm
MOV A, #80H
ACALL CMD
```

### B10

```asm
MOV DPTR, #X3
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 27 to 28"]
B11["B12: instructions - lines 29 to 30"]
B12["B13: instructions - lines 31 to 31"]
B13["B14: instructions - lines 33 to 34"]
B14["B15: instructions - lines 35 to 35"]
B15["B16: instructions - lines 37 to 38"]
B16["B17: instructions - lines 39 to 40"]
B17["B18: instructions - lines 41 to 42"]
B18["B19: instructions - lines 43 to 44"]
B19["B20: instructions - lines 45 to 45"]
B10 -->|call| B68
B10 -->|after return| B11
B11 -->|call| B79
B11 -->|after return| B12
B12 -->|call| B89
B12 -->|after return| B13
B13 -->|call| B68
B13 -->|after return| B14
B14 -->|call| B86
B14 -->|after return| B15
B15 -->|call| B68
B15 -->|after return| B16
B16 -->|call| B79
B16 -->|after return| B17
B17 -->|call| B68
B17 -->|after return| B18
B18 -->|call| B79
B18 -->|after return| B19
B19 -->|call| B93
B19 -->|after return| B20
B68["Continue at B69 in section 7"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B86["Continue at B87 in section 9"]
B93["Continue at B94 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR, #X4
ACALL WSTR
```

### B13

```asm
ACALL DELAY_1SEC
```

### B14

```asm
MOV A, #01H
ACALL CMD
```

### B15

```asm
ACALL TMSEC
```

### B16

```asm
MOV A, #80H
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
B20["B21: instructions - lines 46 to 49"]
B21["B22: instructions - lines 50 to 50"]
B22["B23: instructions - lines 52 to 53"]
B23["B24: instructions - lines 54 to 54"]
B24["B25: Y1 - lines 60 to 61"]
B25["B26: instructions - lines 62 to 63"]
B26["B27: instructions - lines 64 to 65"]
B27["B28: instructions - lines 66 to 66"]
B28["B29: instructions - lines 67 to 67"]
B29["B30: instructions - lines 68 to 68"]
B20 -->|call| B63
B20 -->|after return| B21
B21 -->|call| B89
B21 -->|after return| B22
B22 -->|call| B68
B22 -->|after return| B23
B23 -->|call| B86
B23 -->|after return| B24
B24 -->|condition true| B32
B24 -->|condition false| B25
B25 -->|call| B79
B25 -->|after return| B26
B26 -->|call| B68
B26 -->|after return| B27
B27 -->|call| B41
B27 -->|after return| B28
B28 -->|call| B51
B28 -->|after return| B29
B29 -->|call| B52
B29 -->|after return| B30
B63["Continue at B64 in section 7"]
B89["Continue at B90 in section 9"]
B68["Continue at B69 in section 7"]
B86["Continue at B87 in section 9"]
B32["Continue at B33 in section 4"]
B79["Continue at B80 in section 8"]
B41["Continue at B42 in section 5"]
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV 50H,A
MOV R5, A
ACALL WCHR
```

### B22

```asm
ACALL DELAY_1SEC
```

### B23

```asm
MOV A, #01H
ACALL CMD
```

### B24

```asm
ACALL TMSEC
```

### B25

```asm
MOV A,50H
CJNE A,#'1',Y2
```

### B26

```asm
MOV DPTR ,#ENTER_BIN
ACALL WSTR
```

### B27

```asm
MOV A,#0C0H
ACALL CMD
```

### B28

```asm
ACALL BinToDec
```

### B29

```asm
ACALL CONVERT
```

### B30

```asm
ACALL DISPLAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 69 to 69"]
B31["B32: instructions - lines 74 to 74"]
B32["B33: Y2 - lines 77 to 77"]
B33["B34: instructions - lines 78 to 79"]
B34["B35: instructions - lines 80 to 81"]
B35["B36: instructions - lines 82 to 82"]
B36["B37: instructions - lines 83 to 83"]
B37["B38: instructions - lines 84 to 84"]
B38["B39: instructions - lines 85 to 85"]
B39["B40: instructions - lines 86 to 86"]
B30 -->|call| B89
B30 -->|after return| B31
B31 -->|jump| B40
B32 -->|condition true| B24
B32 -->|condition false| B33
B33 -->|call| B79
B33 -->|after return| B34
B34 -->|call| B68
B34 -->|after return| B35
B35 -->|call| B46
B35 -->|after return| B36
B36 -->|call| B51
B36 -->|after return| B37
B37 -->|call| B89
B37 -->|after return| B38
B38 -->|call| B52
B38 -->|after return| B39
B39 -->|call| B89
B39 -->|after return| B40
B89["Continue at B90 in section 9"]
B40["Continue at B41 in section 5"]
B24["Continue at B25 in section 3"]
B79["Continue at B80 in section 8"]
B68["Continue at B69 in section 7"]
B46["Continue at B47 in section 5"]
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
```

### B31

```asm
ACALL DELAY_1SEC
```

### B32

```asm
SJMP STOP
```

### B33

```asm
CJNE A,#'2',Y1
```

### B34

```asm
MOV DPTR ,#ENTER_HEX
ACALL WSTR
```

### B35

```asm
MOV A,#0C0H
ACALL CMD
```

### B36

```asm
ACALL HexToDec
```

### B37

```asm
ACALL CONVERT
```

### B38

```asm
ACALL DELAY_1SEC
```

### B39

```asm
ACALL DISPLAY
```

### B40

```asm
ACALL DELAY_1SEC
```

## Section 5

```mermaid
flowchart TD
B40["B41: STOP - lines 93 to 93"]
B41["B42: BINTODEC - lines 96 to 99"]
B42["B43: LOOP - lines 104 to 104"]
B43["B44: instructions - lines 105 to 105"]
B44["B45: instructions - lines 106 to 117"]
B45["B46: instructions - lines 118 to 119"]
B46["B47: HEXTODEC - lines 123 to 127"]
B47["B48: instructions - lines 128 to 128"]
B48["B49: instructions - lines 129 to 137"]
B49["B50: instructions - lines 138 to 138"]
B40 -->|jump| B40
B41 -->|next| B42
B42 -->|call| B93
B42 -->|after return| B43
B43 -->|call| B63
B43 -->|after return| B44
B44 -->|condition true| B42
B44 -->|condition false| B45
B46 -->|call| B93
B46 -->|after return| B47
B47 -->|call| B63
B47 -->|after return| B48
B48 -->|call| B93
B48 -->|after return| B49
B49 -->|call| B63
B49 -->|after return| B50
B93["Continue at B94 in section 10"]
B63["Continue at B64 in section 7"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SJMP $
```

### B42

```asm
MOV R6,#0
MOV R0,#8
MOV R7,#128
```

### B43

```asm
ACALL KEYPAD
```

### B44

```asm
ACALL WCHR
```

### B45

```asm
CLR C
SUBB A,#30H
MOV B ,R7
MUL AB
ADD A ,R6
MOV R6 ,A
MOV A,R7
MOV B,#2
DIV AB
MOV R7,A
DJNZ R0,LOOP
```

### B46

Return to the instruction following the active call.

```asm
MOV 40H ,R6
RET
```

### B47

```asm
MOV R6,#16
MOV DPTR ,#HEX
ACALL KEYPAD
```

### B48

```asm
ACALL WCHR
```

### B49

```asm
CLR C
SUBB A,#30H
MOV B,R6
MUL AB
MOV R7,A
INC DPTR
ACALL KEYPAD
```

### B50

```asm
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 139 to 144"]
B51["B52: CONVERT - lines 147 to 163"]
B52["B53: DISPLAY - lines 168 to 169"]
B53["B54: instructions - lines 170 to 170"]
B54["B55: instructions - lines 172 to 173"]
B55["B56: instructions - lines 175 to 176"]
B56["B57: instructions - lines 178 to 179"]
B57["B58: instructions - lines 181 to 181"]
B58["B59: FIRST - lines 184 to 184"]
B59["B60: SECOND - lines 187 to 188"]
B52 -->|call| B68
B52 -->|after return| B53
B53 -->|call| B86
B53 -->|after return| B54
B54 -->|call| B79
B54 -->|after return| B55
B55 -->|condition true| B58
B55 -->|condition false| B56
B56 -->|condition true| B59
B56 -->|condition false| B57
B57 -->|jump| B61
B58 -->|call| B63
B58 -->|after return| B59
B59 -->|call| B63
B59 -->|after return| B60
B68["Continue at B69 in section 7"]
B86["Continue at B87 in section 9"]
B79["Continue at B80 in section 8"]
B61["Continue at B62 in section 7"]
B63["Continue at B64 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
CLR C
SUBB A,#30H
ADD A,R7
MOV 40H,A
RET
```

### B52

Return to the instruction following the active call.

```asm
MOV A,40H
MOV R1,A
MOV B,#100
DIV AB
ADD A,#30H
MOV 40H,A
MOV A,B
MOV B,#10
DIV AB
ADD A,#30H
MOV 41H,A
MOV A,B
ADD A,#30H
MOV 42H,A
RET
```

### B53

```asm
MOV A, #01H
ACALL CMD
```

### B54

```asm
ACALL TMSEC
```

### B55

```asm
MOV DPTR,#RESULT
ACALL WSTR
```

### B56

```asm
MOV A,40H
CJNE A,#'0',FIRST
```

### B57

```asm
MOV A,41H
CJNE A,#'0',SECOND
```

### B58

```asm
SJMP ThirdDigit
```

### B59

```asm
ACALL WCHR
```

### B60

```asm
MOV A,41H
ACALL WCHR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 189 to 189"]
B61["B62: THIRDDIGIT - lines 193 to 194"]
B62["B63: instructions - lines 195 to 195"]
B63["B64: WCHR - lines 199 to 203"]
B64["B65: instructions - lines 204 to 204"]
B65["B66: instructions - lines 205 to 207"]
B66["B67: instructions - lines 208 to 208"]
B67["B68: instructions - lines 209 to 211"]
B68["B69: CMD - lines 214 to 218"]
B69["B70: instructions - lines 219 to 219"]
B60 -->|jump| B61
B61 -->|call| B63
B61 -->|after return| B62
B63 -->|call| B73
B63 -->|after return| B64
B64 -->|call| B84
B64 -->|after return| B65
B65 -->|call| B73
B65 -->|after return| B66
B66 -->|call| B84
B66 -->|after return| B67
B68 -->|call| B73
B68 -->|after return| B69
B69 -->|call| B84
B69 -->|after return| B70
B73["Continue at B74 in section 8"]
B84["Continue at B85 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SJMP ThirdDigit
```

### B62

```asm
MOV A,42H
ACALL WCHR
```

### B63

Return to the instruction following the active call.

```asm
RET
```

### B64

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B65

```asm
ACALL LDELAY
```

### B66

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B67

```asm
ACALL LDELAY
```

### B68

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B69

```asm
PUSH ACC
PUSH B
CLR P1.3
MOV B,A
ACALL COMMON
```

### B70

```asm
ACALL LDELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 220 to 222"]
B71["B72: instructions - lines 223 to 223"]
B72["B73: instructions - lines 224 to 226"]
B73["B74: COMMON - lines 229 to 236"]
B74["B75: INLCD - lines 239 to 246"]
B75["B76: instructions - lines 247 to 255"]
B76["B77: instructions - lines 256 to 268"]
B77["B78: instructions - lines 269 to 279"]
B78["B79: instructions - lines 280 to 280"]
B79["B80: WSTR - lines 283 to 283"]
B70 -->|call| B73
B70 -->|after return| B71
B71 -->|call| B84
B71 -->|after return| B72
B74 -->|call| B84
B74 -->|after return| B75
B75 -->|call| B84
B75 -->|after return| B76
B76 -->|call| B84
B76 -->|after return| B77
B77 -->|call| B84
B77 -->|after return| B78
B79 -->|next| B80
B84["Continue at B85 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B72

```asm
ACALL LDELAY
```

### B73

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B74

Return to the instruction following the active call.

```asm
PUSH ACC
ANL A,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
POP ACC
RET
```

### B75

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

### B76

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

### B77

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

### B78

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

### B79

Return to the instruction following the active call.

```asm
RET
```

### B80

```asm
PUSH ACC
```

## Section 9

```mermaid
flowchart TD
B80["B81: CONT1 - lines 284 to 286"]
B81["B82: instructions - lines 287 to 287"]
B82["B83: instructions - lines 288 to 289"]
B83["B84: EXIT1 - lines 291 to 292"]
B84["B85: LDELAY - lines 295 to 297"]
B85["B86: instructions - lines 298 to 299"]
B86["B87: TMSEC - lines 302 to 305"]
B87["B88: BACK - lines 307 to 307"]
B88["B89: instructions - lines 308 to 310"]
B89["B90: DELAY_1SEC - lines 314 to 315"]
B80 -->|condition true| B83
B80 -->|condition false| B81
B81 -->|call| B63
B81 -->|after return| B82
B82 -->|jump| B80
B84 -->|condition true| B84
B84 -->|condition false| B85
B86 -->|next| B87
B87 -->|condition true| B87
B87 -->|condition false| B88
B89 -->|next| B90
B63["Continue at B64 in section 7"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B82

```asm
ACALL WCHR
```

### B83

```asm
INC DPTR
AJMP CONT1
```

### B84

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B85

```asm
PUSH 0H
MOV R0, #50
DJNZ R0, $
```

### B86

Return to the instruction following the active call.

```asm
POP 0H
RET
```

### B87

```asm
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
SETB TR0
```

### B88

```asm
JNB TF0,BACK
```

### B89

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B90

```asm
PUSH 4H
MOV R4, #20
```

## Section 10

```mermaid
flowchart TD
B90["B91: LOOP1 - lines 317 to 317"]
B91["B92: instructions - lines 318 to 318"]
B92["B93: instructions - lines 319 to 320"]
B93["B94: KEYPAD - lines 323 to 323"]
B94["B95: K1 - lines 324 to 327"]
B95["B96: K2 - lines 329 to 331"]
B96["B97: instructions - lines 332 to 332"]
B97["B98: OVER1 - lines 334 to 337"]
B98["B99: instructions - lines 338 to 341"]
B99["B100: instructions - lines 342 to 345"]
B90 -->|call| B86
B90 -->|after return| B91
B91 -->|condition true| B90
B91 -->|condition false| B92
B93 -->|next| B94
B94 -->|condition true| B94
B94 -->|condition false| B95
B95 -->|condition true| B97
B95 -->|condition false| B96
B96 -->|jump| B95
B97 -->|condition true| B102
B97 -->|condition false| B98
B98 -->|condition true| B103
B98 -->|condition false| B99
B99 -->|condition true| B104
B99 -->|condition false| B100
B86["Continue at B87 in section 9"]
B102["Continue at B103 in section 11"]
B103["Continue at B104 in section 11"]
B104["Continue at B105 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL TMSEC
```

### B92

```asm
DJNZ R4, LOOP1
```

### B93

Return to the instruction following the active call.

```asm
POP 4H
RET
```

### B94

```asm
MOV P0,#01110000B
```

### B95

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B96

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B97

```asm
SJMP K2
```

### B98

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B99

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B100

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 346 to 349"]
B101["B102: instructions - lines 350 to 350"]
B102["B103: ROW_0 - lines 351 to 352"]
B103["B104: ROW_1 - lines 353 to 354"]
B104["B105: ROW_2 - lines 355 to 356"]
B105["B106: ROW_3 - lines 357 to 357"]
B106["B107: FIND - lines 359 to 359"]
B107["B108: FIND1 - lines 361 to 362"]
B108["B109: instructions - lines 363 to 364"]
B109["B110: MATCH - lines 365 to 367"]
B100 -->|condition true| B105
B100 -->|condition false| B101
B101 -->|jump| B95
B102 -->|jump| B106
B103 -->|jump| B106
B104 -->|jump| B106
B105 -->|next| B106
B106 -->|next| B107
B107 -->|condition true| B109
B107 -->|condition false| B108
B108 -->|jump| B107
B95["Continue at B96 in section 10"]
```

### B101

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B102

```asm
LJMP K2
```

### B103

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B104

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B105

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B106

```asm
MOV DPTR,#KCODE3
```

### B107

```asm
RLC A
```

### B108

```asm
RLC A
JNC MATCH
```

### B109

```asm
INC DPTR
SJMP FIND1
```

### B110

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
