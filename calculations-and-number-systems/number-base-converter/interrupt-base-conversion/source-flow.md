# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 4"]
B2["B3: MAIN - lines 8 to 10"]
B3["B4: instructions - lines 12 to 13"]
B4["B5: instructions - lines 14 to 15"]
B5["B6: instructions - lines 18 to 19"]
B6["B7: instructions - lines 20 to 21"]
B7["B8: instructions - lines 22 to 22"]
B8["B9: instructions - lines 23 to 23"]
B9["B10: instructions - lines 25 to 26"]
B0 -->|jump| B2
B1 -->|jump| B11
B2 -->|call| B77
B2 -->|after return| B3
B3 -->|call| B71
B3 -->|after return| B4
B4 -->|call| B82
B4 -->|after return| B5
B5 -->|call| B71
B5 -->|after return| B6
B6 -->|call| B82
B6 -->|after return| B7
B7 -->|call| B92
B7 -->|after return| B8
B8 -->|jump| B8
B9 -->|call| B71
B9 -->|after return| B10
B11["Continue at B12 in section 2"]
B77["Continue at B78 in section 8"]
B71["Continue at B72 in section 8"]
B82["Continue at B83 in section 9"]
B92["Continue at B93 in section 10"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
LJMP EXOISR
```

### B3

```asm
MOV IE,#10000001B
SETB IT0
ACALL INLCD
```

### B4

```asm
MOV A, #80H
ACALL CMD
```

### B5

```asm
MOV DPTR, #X1
ACALL WSTR
```

### B6

```asm
MOV A,#0C0H
ACALL CMD
```

### B7

```asm
MOV DPTR, #X2
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
MOV A, #01H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 27 to 27"]
B11["B12: EXOISR - lines 31 to 32"]
B12["B13: instructions - lines 33 to 34"]
B13["B14: instructions - lines 36 to 37"]
B14["B15: instructions - lines 38 to 39"]
B15["B16: instructions - lines 40 to 40"]
B16["B17: instructions - lines 42 to 43"]
B17["B18: instructions - lines 44 to 44"]
B18["B19: instructions - lines 46 to 47"]
B19["B20: instructions - lines 48 to 49"]
B10 -->|call| B89
B10 -->|after return| B11
B11 -->|call| B71
B11 -->|after return| B12
B12 -->|call| B82
B12 -->|after return| B13
B13 -->|call| B71
B13 -->|after return| B14
B14 -->|call| B82
B14 -->|after return| B15
B15 -->|call| B92
B15 -->|after return| B16
B16 -->|call| B71
B16 -->|after return| B17
B17 -->|call| B89
B17 -->|after return| B18
B18 -->|call| B71
B18 -->|after return| B19
B19 -->|call| B82
B19 -->|after return| B20
B89["Continue at B90 in section 9"]
B71["Continue at B72 in section 8"]
B82["Continue at B83 in section 9"]
B92["Continue at B93 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL TMSEC
```

### B12

```asm
MOV A, #80H
ACALL CMD
```

### B13

```asm
MOV DPTR, #X3
ACALL WSTR
```

### B14

```asm
MOV A,#0C0H
ACALL CMD
```

### B15

```asm
MOV DPTR, #X4
ACALL WSTR
```

### B16

```asm
ACALL DELAY_1SEC
```

### B17

```asm
MOV A, #01H
ACALL CMD
```

### B18

```asm
ACALL TMSEC
```

### B19

```asm
MOV A, #80H
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
B20["B21: instructions - lines 50 to 51"]
B21["B22: instructions - lines 52 to 53"]
B22["B23: instructions - lines 54 to 54"]
B23["B24: instructions - lines 55 to 58"]
B24["B25: instructions - lines 59 to 59"]
B25["B26: instructions - lines 61 to 62"]
B26["B27: instructions - lines 63 to 63"]
B27["B28: Y1 - lines 69 to 70"]
B28["B29: instructions - lines 71 to 72"]
B29["B30: instructions - lines 73 to 74"]
B20 -->|call| B71
B20 -->|after return| B21
B21 -->|call| B82
B21 -->|after return| B22
B22 -->|call| B96
B22 -->|after return| B23
B23 -->|call| B66
B23 -->|after return| B24
B24 -->|call| B92
B24 -->|after return| B25
B25 -->|call| B71
B25 -->|after return| B26
B26 -->|call| B89
B26 -->|after return| B27
B27 -->|condition true| B35
B27 -->|condition false| B28
B28 -->|call| B82
B28 -->|after return| B29
B29 -->|call| B71
B29 -->|after return| B30
B71["Continue at B72 in section 8"]
B82["Continue at B83 in section 9"]
B96["Continue at B97 in section 10"]
B66["Continue at B67 in section 7"]
B92["Continue at B93 in section 10"]
B89["Continue at B90 in section 9"]
B35["Continue at B36 in section 4"]
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
MOV 50H,A
MOV R5, A
ACALL WCHR
```

### B25

```asm
ACALL DELAY_1SEC
```

### B26

```asm
MOV A, #01H
ACALL CMD
```

### B27

```asm
ACALL TMSEC
```

### B28

```asm
MOV A,50H
CJNE A,#'1',Y2
```

### B29

```asm
MOV DPTR ,#ENTER_BIN
ACALL WSTR
```

### B30

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 75 to 75"]
B31["B32: instructions - lines 76 to 76"]
B32["B33: instructions - lines 77 to 77"]
B33["B34: instructions - lines 78 to 78"]
B34["B35: instructions - lines 83 to 83"]
B35["B36: Y2 - lines 86 to 86"]
B36["B37: instructions - lines 87 to 88"]
B37["B38: instructions - lines 89 to 90"]
B38["B39: instructions - lines 91 to 91"]
B39["B40: instructions - lines 92 to 92"]
B30 -->|call| B44
B30 -->|after return| B31
B31 -->|call| B54
B31 -->|after return| B32
B32 -->|call| B55
B32 -->|after return| B33
B33 -->|call| B92
B33 -->|after return| B34
B34 -->|jump| B43
B35 -->|condition true| B27
B35 -->|condition false| B36
B36 -->|call| B82
B36 -->|after return| B37
B37 -->|call| B71
B37 -->|after return| B38
B38 -->|call| B49
B38 -->|after return| B39
B39 -->|call| B54
B39 -->|after return| B40
B44["Continue at B45 in section 5"]
B54["Continue at B55 in section 6"]
B55["Continue at B56 in section 6"]
B92["Continue at B93 in section 10"]
B43["Continue at B44 in section 5"]
B27["Continue at B28 in section 3"]
B82["Continue at B83 in section 9"]
B71["Continue at B72 in section 8"]
B49["Continue at B50 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL BinToDec
```

### B32

```asm
ACALL CONVERT
```

### B33

```asm
ACALL DISPLAY
```

### B34

```asm
ACALL DELAY_1SEC
```

### B35

```asm
SJMP STOP
```

### B36

```asm
CJNE A,#'2',Y1
```

### B37

```asm
MOV DPTR ,#ENTER_HEX
ACALL WSTR
```

### B38

```asm
MOV A,#0C0H
ACALL CMD
```

### B39

```asm
ACALL HexToDec
```

### B40

```asm
ACALL CONVERT
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 93 to 93"]
B41["B42: instructions - lines 94 to 94"]
B42["B43: instructions - lines 95 to 95"]
B43["B44: STOP - lines 102 to 102"]
B44["B45: BINTODEC - lines 105 to 108"]
B45["B46: LOOP - lines 113 to 113"]
B46["B47: instructions - lines 114 to 114"]
B47["B48: instructions - lines 115 to 126"]
B48["B49: instructions - lines 127 to 128"]
B49["B50: HEXTODEC - lines 132 to 136"]
B40 -->|call| B92
B40 -->|after return| B41
B41 -->|call| B55
B41 -->|after return| B42
B42 -->|call| B92
B42 -->|after return| B43
B44 -->|next| B45
B45 -->|call| B96
B45 -->|after return| B46
B46 -->|call| B66
B46 -->|after return| B47
B47 -->|condition true| B45
B47 -->|condition false| B48
B49 -->|call| B96
B49 -->|after return| B50
B92["Continue at B93 in section 10"]
B55["Continue at B56 in section 6"]
B96["Continue at B97 in section 10"]
B66["Continue at B67 in section 7"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL DELAY_1SEC
```

### B42

```asm
ACALL DISPLAY
```

### B43

```asm
ACALL DELAY_1SEC
```

### B44

Resume the interrupted program.

```asm
RETI
```

### B45

```asm
MOV R6,#0
MOV R0,#8
MOV R7,#128
```

### B46

```asm
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

### B49

Return to the instruction following the active call.

```asm
MOV 40H ,R6
RET
```

### B50

```asm
MOV R6,#16
MOV DPTR ,#HEX
ACALL KEYPAD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 137 to 137"]
B51["B52: instructions - lines 138 to 146"]
B52["B53: instructions - lines 147 to 147"]
B53["B54: instructions - lines 148 to 153"]
B54["B55: CONVERT - lines 156 to 172"]
B55["B56: DISPLAY - lines 177 to 178"]
B56["B57: instructions - lines 179 to 179"]
B57["B58: instructions - lines 181 to 182"]
B58["B59: instructions - lines 184 to 185"]
B59["B60: instructions - lines 187 to 188"]
B50 -->|call| B66
B50 -->|after return| B51
B51 -->|call| B96
B51 -->|after return| B52
B52 -->|call| B66
B52 -->|after return| B53
B55 -->|call| B71
B55 -->|after return| B56
B56 -->|call| B89
B56 -->|after return| B57
B57 -->|call| B82
B57 -->|after return| B58
B58 -->|condition true| B61
B58 -->|condition false| B59
B59 -->|condition true| B62
B59 -->|condition false| B60
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B71["Continue at B72 in section 8"]
B89["Continue at B90 in section 9"]
B82["Continue at B83 in section 9"]
B61["Continue at B62 in section 7"]
B62["Continue at B63 in section 7"]
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
MOV B,R6
MUL AB
MOV R7,A
INC DPTR
ACALL KEYPAD
```

### B53

```asm
ACALL WCHR
```

### B54

Return to the instruction following the active call.

```asm
CLR C
SUBB A,#30H
ADD A,R7
MOV 40H,A
RET
```

### B55

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

### B56

```asm
MOV A, #01H
ACALL CMD
```

### B57

```asm
ACALL TMSEC
```

### B58

```asm
MOV DPTR,#RESULT
ACALL WSTR
```

### B59

```asm
MOV A,40H
CJNE A,#'0',FIRST
```

### B60

```asm
MOV A,41H
CJNE A,#'0',SECOND
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 190 to 190"]
B61["B62: FIRST - lines 193 to 193"]
B62["B63: SECOND - lines 196 to 197"]
B63["B64: instructions - lines 198 to 198"]
B64["B65: THIRDDIGIT - lines 202 to 203"]
B65["B66: instructions - lines 204 to 204"]
B66["B67: WCHR - lines 208 to 212"]
B67["B68: instructions - lines 213 to 213"]
B68["B69: instructions - lines 214 to 216"]
B69["B70: instructions - lines 217 to 217"]
B60 -->|jump| B64
B61 -->|call| B66
B61 -->|after return| B62
B62 -->|call| B66
B62 -->|after return| B63
B63 -->|jump| B64
B64 -->|call| B66
B64 -->|after return| B65
B66 -->|call| B76
B66 -->|after return| B67
B67 -->|call| B87
B67 -->|after return| B68
B68 -->|call| B76
B68 -->|after return| B69
B69 -->|call| B87
B69 -->|after return| B70
B76["Continue at B77 in section 8"]
B87["Continue at B88 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SJMP ThirdDigit
```

### B62

```asm
ACALL WCHR
```

### B63

```asm
MOV A,41H
ACALL WCHR
```

### B64

```asm
SJMP ThirdDigit
```

### B65

```asm
MOV A,42H
ACALL WCHR
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
PUSH ACC
PUSH B
SETB P1.3
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
B70["B71: instructions - lines 218 to 220"]
B71["B72: CMD - lines 223 to 227"]
B72["B73: instructions - lines 228 to 228"]
B73["B74: instructions - lines 229 to 231"]
B74["B75: instructions - lines 232 to 232"]
B75["B76: instructions - lines 233 to 235"]
B76["B77: COMMON - lines 238 to 245"]
B77["B78: INLCD - lines 248 to 255"]
B78["B79: instructions - lines 256 to 264"]
B79["B80: instructions - lines 265 to 277"]
B71 -->|call| B76
B71 -->|after return| B72
B72 -->|call| B87
B72 -->|after return| B73
B73 -->|call| B76
B73 -->|after return| B74
B74 -->|call| B87
B74 -->|after return| B75
B77 -->|call| B87
B77 -->|after return| B78
B78 -->|call| B87
B78 -->|after return| B79
B79 -->|call| B87
B79 -->|after return| B80
B87["Continue at B88 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B72

```asm
PUSH ACC
PUSH B
CLR P1.3
MOV B,A
ACALL COMMON
```

### B73

```asm
ACALL LDELAY
```

### B74

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B75

```asm
ACALL LDELAY
```

### B76

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B77

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

### B78

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

### B79

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

### B80

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

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 278 to 288"]
B81["B82: instructions - lines 289 to 289"]
B82["B83: WSTR - lines 292 to 292"]
B83["B84: CONT1 - lines 293 to 295"]
B84["B85: instructions - lines 296 to 296"]
B85["B86: instructions - lines 297 to 298"]
B86["B87: EXIT1 - lines 300 to 301"]
B87["B88: LDELAY - lines 304 to 306"]
B88["B89: instructions - lines 307 to 308"]
B89["B90: TMSEC - lines 311 to 314"]
B80 -->|call| B87
B80 -->|after return| B81
B82 -->|next| B83
B83 -->|condition true| B86
B83 -->|condition false| B84
B84 -->|call| B66
B84 -->|after return| B85
B85 -->|jump| B83
B87 -->|condition true| B87
B87 -->|condition false| B88
B89 -->|next| B90
B66["Continue at B67 in section 7"]
B90["Continue at B91 in section 10"]
```

### B81

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

### B82

Return to the instruction following the active call.

```asm
RET
```

### B83

```asm
PUSH ACC
```

### B84

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B85

```asm
ACALL WCHR
```

### B86

```asm
INC DPTR
AJMP CONT1
```

### B87

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B88

```asm
PUSH 0H
MOV R0, #50
DJNZ R0, $
```

### B89

Return to the instruction following the active call.

```asm
POP 0H
RET
```

### B90

```asm
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
SETB TR0
```

## Section 10

```mermaid
flowchart TD
B90["B91: BACK - lines 316 to 316"]
B91["B92: instructions - lines 317 to 319"]
B92["B93: DELAY_1SEC - lines 323 to 324"]
B93["B94: LOOP1 - lines 326 to 326"]
B94["B95: instructions - lines 327 to 327"]
B95["B96: instructions - lines 328 to 329"]
B96["B97: KEYPAD - lines 332 to 332"]
B97["B98: K1 - lines 333 to 336"]
B98["B99: K2 - lines 338 to 340"]
B99["B100: instructions - lines 341 to 341"]
B90 -->|condition true| B90
B90 -->|condition false| B91
B92 -->|next| B93
B93 -->|call| B89
B93 -->|after return| B94
B94 -->|condition true| B93
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|condition true| B97
B97 -->|condition false| B98
B98 -->|condition true| B100
B98 -->|condition false| B99
B99 -->|jump| B98
B89["Continue at B90 in section 9"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
JNB TF0,BACK
```

### B92

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B93

```asm
PUSH 4H
MOV R4, #20
```

### B94

```asm
ACALL TMSEC
```

### B95

```asm
DJNZ R4, LOOP1
```

### B96

Return to the instruction following the active call.

```asm
POP 4H
RET
```

### B97

```asm
MOV P0,#01110000B
```

### B98

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B99

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B100

```asm
SJMP K2
```

## Section 11

```mermaid
flowchart TD
B100["B101: OVER1 - lines 343 to 346"]
B101["B102: instructions - lines 347 to 350"]
B102["B103: instructions - lines 351 to 354"]
B103["B104: instructions - lines 355 to 358"]
B104["B105: instructions - lines 359 to 359"]
B105["B106: ROW_0 - lines 360 to 361"]
B106["B107: ROW_1 - lines 362 to 363"]
B107["B108: ROW_2 - lines 364 to 365"]
B108["B109: ROW_3 - lines 366 to 366"]
B109["B110: FIND - lines 368 to 368"]
B100 -->|condition true| B105
B100 -->|condition false| B101
B101 -->|condition true| B106
B101 -->|condition false| B102
B102 -->|condition true| B107
B102 -->|condition false| B103
B103 -->|condition true| B108
B103 -->|condition false| B104
B104 -->|jump| B98
B105 -->|jump| B109
B106 -->|jump| B109
B107 -->|jump| B109
B108 -->|next| B109
B109 -->|next| B110
B98["Continue at B99 in section 10"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B102

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B103

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B104

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B105

```asm
LJMP K2
```

### B106

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B107

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B108

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B109

```asm
MOV DPTR,#KCODE3
```

### B110

```asm
RLC A
```

## Section 12

```mermaid
flowchart TD
B110["B111: FIND1 - lines 370 to 371"]
B111["B112: instructions - lines 372 to 373"]
B112["B113: MATCH - lines 374 to 376"]
B110 -->|condition true| B112
B110 -->|condition false| B111
B111 -->|jump| B110
```

### B111

```asm
RLC A
JNC MATCH
```

### B112

```asm
INC DPTR
SJMP FIND1
```

### B113

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
