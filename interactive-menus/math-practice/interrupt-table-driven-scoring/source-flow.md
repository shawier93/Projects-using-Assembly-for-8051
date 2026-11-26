# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 30H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 13 to 13"]
B1["B2: instructions - lines 16 to 17"]
B2["B3: MAIN - lines 21 to 24"]
B3["B4: instructions - lines 26 to 35"]
B4["B5: instructions - lines 36 to 37"]
B5["B6: AGAIN - lines 39 to 71"]
B6["B7: USER - lines 73 to 73"]
B7["B8: instructions - lines 75 to 76"]
B8["B9: instructions - lines 79 to 79"]
B9["B10: instructions - lines 80 to 80"]
B0 -->|jump| B2
B2 -->|call| B126
B2 -->|after return| B3
B3 -->|call| B46
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|next| B6
B6 -->|call| B52
B6 -->|after return| B7
B7 -->|condition true| B16
B7 -->|condition false| B8
B8 -->|call| B169
B8 -->|after return| B9
B9 -->|call| B149
B9 -->|after return| B10
B126["Continue at B127 in section 13"]
B46["Continue at B47 in section 5"]
B52["Continue at B53 in section 6"]
B16["Continue at B17 in section 2"]
B169["Continue at B170 in section 17"]
B149["Continue at B150 in section 15"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

Resume the interrupted program.

```asm
MOV 98H,#1
RETI
```

### B3

```asm
MOV 98H,#0
MOV IE,#10000001B
SETB IT0
ACALL INLCD
```

### B4

```asm
MOV	34H,#1
MOV	35H,#0
MOV	36H,#0
MOV 30H,#7
MOV 31H,#4
MOV 32H,#12
MOV 33H,#6
ACALL WELCOME
```

### B5

```asm
MOV	DPTR,#QS
MOV R2,#0
```

### B6

```asm
MOV	DPTR,#QS
CLR	A
ADD A,R2
MOVC A,@A+DPTR
MOV	R1,A
INC	DPTR
CLR	A
ADD A,R2
MOVC A,@A+DPTR
MOV	R3,A
INC	DPTR
CLR	A
ADD A,R2
MOVC A,@A+DPTR
MOV	R4,A
INC	DPTR
CLR	A
ADD A,R2
MOVC A,@A+DPTR
MOV	R5,A
INC	DPTR
CLR	A
ADD A,R2
MOVC A,@A+DPTR
INC	DPTR
MOV	R6,A
MOV A,R2
ADD A,#5
MOV R2,A
MOV 77H,R1
```

### B7

```asm
ACALL QUESTION
```

### B8

```asm
MOV R1,77H
CJNE R1,#'+',NPL
```

### B9

```asm
ACALL KEYPAD
```

### B10

```asm
ACALL WCHR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 81 to 83"]
B11["B12: instructions - lines 84 to 84"]
B12["B13: instructions - lines 86 to 91"]
B13["B14: instructions - lines 92 to 96"]
B14["B15: instructions - lines 97 to 97"]
B15["B16: WWRONG - lines 99 to 99"]
B16["B17: NPL - lines 102 to 102"]
B17["B18: instructions - lines 105 to 105"]
B18["B19: instructions - lines 106 to 106"]
B19["B20: instructions - lines 107 to 109"]
B10 -->|call| B120
B10 -->|after return| B11
B11 -->|call| B62
B11 -->|after return| B12
B12 -->|condition true| B15
B12 -->|condition false| B13
B13 -->|call| B85
B13 -->|after return| B14
B14 -->|jump| B5
B15 -->|jump| B41
B16 -->|condition true| B24
B16 -->|condition false| B17
B17 -->|call| B169
B17 -->|after return| B18
B18 -->|call| B149
B18 -->|after return| B19
B19 -->|call| B120
B19 -->|after return| B20
B120["Continue at B121 in section 13"]
B62["Continue at B63 in section 7"]
B85["Continue at B86 in section 9"]
B5["Continue at B6 in section 1"]
B41["Continue at B42 in section 5"]
B24["Continue at B25 in section 3"]
B169["Continue at B170 in section 17"]
B149["Continue at B150 in section 15"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
SUBB A,#30H
MOV 37H,A
ACALL DELAY
```

### B12

```asm
ACALL ANS
```

### B13

```asm
MOV A,R3
ADD A,R4
MOV 30H,A
MOV	B,37H
CJNE A,B,WWRONG
```

### B14

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B15

```asm
SJMP AGAIN
```

### B16

```asm
AJMP WRONG
```

### B17

```asm
CJNE R1,#'-',NMS
```

### B18

```asm
ACALL KEYPAD
```

### B19

```asm
ACALL WCHR
```

### B20

```asm
SUBB A,#30H
MOV 37H,A
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 110 to 110"]
B21["B22: instructions - lines 111 to 115"]
B22["B23: instructions - lines 116 to 120"]
B23["B24: instructions - lines 121 to 121"]
B24["B25: NMS - lines 125 to 125"]
B25["B26: instructions - lines 128 to 128"]
B26["B27: instructions - lines 129 to 129"]
B27["B28: instructions - lines 130 to 134"]
B28["B29: instructions - lines 135 to 135"]
B29["B30: instructions - lines 136 to 139"]
B20 -->|call| B62
B20 -->|after return| B21
B21 -->|condition true| B41
B21 -->|condition false| B22
B22 -->|call| B85
B22 -->|after return| B23
B23 -->|jump| B5
B24 -->|condition true| B34
B24 -->|condition false| B25
B25 -->|call| B169
B25 -->|after return| B26
B26 -->|call| B149
B26 -->|after return| B27
B27 -->|call| B169
B27 -->|after return| B28
B28 -->|call| B149
B28 -->|after return| B29
B29 -->|call| B120
B29 -->|after return| B30
B62["Continue at B63 in section 7"]
B41["Continue at B42 in section 5"]
B85["Continue at B86 in section 9"]
B5["Continue at B6 in section 1"]
B34["Continue at B35 in section 4"]
B169["Continue at B170 in section 17"]
B149["Continue at B150 in section 15"]
B120["Continue at B121 in section 13"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL ANS
```

### B22

```asm
MOV A,R3
SUBB A,R4
MOV 31H,A
MOV	B,37H
CJNE A,B,WRONG
```

### B23

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B24

```asm
SJMP AGAIN
```

### B25

```asm
CJNE R1,#'*',DVS
```

### B26

```asm
ACALL KEYPAD
```

### B27

```asm
ACALL WCHR
```

### B28

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV 37H,A
ACALL KEYPAD
```

### B29

```asm
ACALL WCHR
```

### B30

```asm
SUBB A,#30H
ADD A,37H
MOV 37H,A
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 141 to 141"]
B31["B32: instructions - lines 143 to 150"]
B32["B33: instructions - lines 151 to 155"]
B33["B34: instructions - lines 156 to 156"]
B34["B35: DVS - lines 162 to 162"]
B35["B36: instructions - lines 163 to 163"]
B36["B37: instructions - lines 164 to 166"]
B37["B38: instructions - lines 167 to 167"]
B38["B39: instructions - lines 170 to 176"]
B39["B40: instructions - lines 177 to 180"]
B30 -->|call| B62
B30 -->|after return| B31
B31 -->|condition true| B41
B31 -->|condition false| B32
B32 -->|call| B85
B32 -->|after return| B33
B33 -->|jump| B5
B34 -->|call| B169
B34 -->|after return| B35
B35 -->|call| B149
B35 -->|after return| B36
B36 -->|call| B120
B36 -->|after return| B37
B37 -->|call| B62
B37 -->|after return| B38
B38 -->|condition true| B41
B38 -->|condition false| B39
B39 -->|call| B85
B39 -->|after return| B40
B62["Continue at B63 in section 7"]
B41["Continue at B42 in section 5"]
B85["Continue at B86 in section 9"]
B5["Continue at B6 in section 1"]
B169["Continue at B170 in section 17"]
B149["Continue at B150 in section 15"]
B120["Continue at B121 in section 13"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL ANS
```

### B32

```asm
MOV A,R3
MOV B,R4
MUL AB
MOV 32H,A
MOV	B,37H
CJNE A,B,WRONG
```

### B33

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B34

```asm
AJMP AGAIN
```

### B35

```asm
ACALL KEYPAD
```

### B36

```asm
ACALL WCHR
```

### B37

```asm
SUBB A,#30H
MOV 37H,A
ACALL DELAY
```

### B38

```asm
ACALL ANS
```

### B39

```asm
MOV A,R3
MOV B,R4
DIV AB
MOV 33H,A
MOV	B,37H
CJNE A,B,WRONG
```

### B40

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
ACALL RIGHT
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 181 to 181"]
B41["B42: WRONG - lines 184 to 184"]
B42["B43: instructions - lines 185 to 187"]
B43["B44: STOP - lines 191 to 191"]
B44["B45: instructions - lines 192 to 192"]
B45["B46: instructions - lines 193 to 193"]
B46["B47: WELCOME - lines 197 to 198"]
B47["B48: instructions - lines 199 to 200"]
B48["B49: instructions - lines 202 to 203"]
B49["B50: instructions - lines 204 to 205"]
B40 -->|jump| B43
B41 -->|call| B68
B41 -->|after return| B42
B42 -->|jump| B6
B43 -->|call| B99
B43 -->|after return| B44
B44 -->|call| B109
B44 -->|after return| B45
B45 -->|jump| B45
B46 -->|call| B146
B46 -->|after return| B47
B47 -->|call| B154
B47 -->|after return| B48
B48 -->|call| B146
B48 -->|after return| B49
B49 -->|call| B154
B49 -->|after return| B50
B68["Continue at B69 in section 7"]
B6["Continue at B7 in section 1"]
B99["Continue at B100 in section 10"]
B109["Continue at B110 in section 11"]
B146["Continue at B147 in section 15"]
B154["Continue at B155 in section 16"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SJMP STOP
```

### B42

```asm
ACALL WRONGG
```

### B43

```asm
INC	36H
DEC	35H
AJMP USER
```

### B44

```asm
ACALL SCORE
```

### B45

```asm
ACALL BYE
```

### B46

```asm
SJMP $
```

### B47

```asm
MOV A, #80H
ACALL CMD
```

### B48

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B49

```asm
MOV A,#0c0H
ACALL CMD
```

### B50

```asm
MOV DPTR, #STR2
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 206 to 206"]
B51["B52: instructions - lines 207 to 207"]
B52["B53: QUESTION - lines 210 to 210"]
B53["B54: instructions - lines 211 to 211"]
B54["B55: instructions - lines 213 to 214"]
B55["B56: instructions - lines 215 to 219"]
B56["B57: instructions - lines 220 to 222"]
B57["B58: instructions - lines 225 to 227"]
B58["B59: instructions - lines 229 to 231"]
B59["B60: instructions - lines 233 to 234"]
B50 -->|call| B120
B50 -->|after return| B51
B52 -->|call| B164
B52 -->|after return| B53
B53 -->|call| B120
B53 -->|after return| B54
B54 -->|call| B146
B54 -->|after return| B55
B55 -->|call| B149
B55 -->|after return| B56
B56 -->|call| B149
B56 -->|after return| B57
B57 -->|call| B149
B57 -->|after return| B58
B58 -->|call| B149
B58 -->|after return| B59
B59 -->|call| B149
B59 -->|after return| B60
B120["Continue at B121 in section 13"]
B164["Continue at B165 in section 17"]
B146["Continue at B147 in section 15"]
B149["Continue at B150 in section 15"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

```asm
ACALL CLEAR
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
MOV A, #80H
ACALL CMD
```

### B56

```asm
MOV A,R3
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B57

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B58

```asm
MOV R1,77H
MOV A,R1
ACALL WCHR
```

### B59

```asm
MOV A,R4
ADD A,#30H
ACALL WCHR
```

### B60

```asm
MOV A,#'='
ACALL WCHR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 235 to 236"]
B61["B62: instructions - lines 238 to 238"]
B62["B63: ANS - lines 241 to 242"]
B63["B64: instructions - lines 243 to 247"]
B64["B65: instructions - lines 248 to 250"]
B65["B66: instructions - lines 251 to 251"]
B66["B67: instructions - lines 252 to 252"]
B67["B68: instructions - lines 253 to 253"]
B68["B69: WRONGG - lines 256 to 257"]
B69["B70: instructions - lines 258 to 259"]
B60 -->|call| B149
B60 -->|after return| B61
B62 -->|call| B146
B62 -->|after return| B63
B63 -->|call| B149
B63 -->|after return| B64
B64 -->|call| B149
B64 -->|after return| B65
B65 -->|call| B120
B65 -->|after return| B66
B66 -->|call| B120
B66 -->|after return| B67
B68 -->|call| B146
B68 -->|after return| B69
B69 -->|call| B154
B69 -->|after return| B70
B149["Continue at B150 in section 15"]
B146["Continue at B147 in section 15"]
B120["Continue at B121 in section 13"]
B154["Continue at B155 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#' '
ACALL WCHR
```

### B62

Return to the instruction following the active call.

```asm
RET
```

### B63

```asm
MOV A,#0c0H
ACALL CMD
```

### B64

```asm
MOV A,37H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B65

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
ACALL DELAY
```

### B68

Return to the instruction following the active call.

```asm
RET
```

### B69

```asm
MOV A,#0c0H
ACALL CMD
```

### B70

```asm
MOV DPTR, #WRONG1
ACALL WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 260 to 260"]
B71["B72: instructions - lines 261 to 262"]
B72["B73: X1 - lines 264 to 264"]
B73["B74: instructions - lines 265 to 265"]
B74["B75: instructions - lines 266 to 266"]
B75["B76: X2 - lines 268 to 268"]
B76["B77: instructions - lines 269 to 269"]
B77["B78: instructions - lines 270 to 271"]
B78["B79: FLASH - lines 274 to 275"]
B79["B80: Y11 - lines 277 to 277"]
B70 -->|call| B120
B70 -->|after return| B71
B71 -->|next| B72
B72 -->|call| B159
B72 -->|after return| B73
B73 -->|condition true| B72
B73 -->|condition false| B74
B74 -->|next| B75
B75 -->|call| B159
B75 -->|after return| B76
B76 -->|condition true| B75
B76 -->|condition false| B77
B78 -->|next| B79
B79 -->|call| B159
B79 -->|after return| B80
B120["Continue at B121 in section 13"]
B159["Continue at B160 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
CLR R
MOV R7,#185
```

### B73

```asm
ACALL LDELAY
```

### B74

```asm
DJNZ R7,X1
```

### B75

```asm
MOV R7,#185
```

### B76

```asm
ACALL LDELAY
```

### B77

```asm
DJNZ R7,X2
```

### B78

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B79

```asm
CLR G
MOV R7,#185
```

### B80

```asm
ACALL LDELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 278 to 278"]
B81["B82: instructions - lines 280 to 280"]
B82["B83: Y22 - lines 282 to 282"]
B83["B84: instructions - lines 283 to 283"]
B84["B85: instructions - lines 284 to 285"]
B85["B86: RIGHT - lines 288 to 288"]
B86["B87: instructions - lines 289 to 289"]
B87["B88: instructions - lines 290 to 291"]
B88["B89: instructions - lines 292 to 293"]
B89["B90: instructions - lines 295 to 296"]
B80 -->|condition true| B79
B80 -->|condition false| B81
B81 -->|next| B82
B82 -->|call| B159
B82 -->|after return| B83
B83 -->|condition true| B82
B83 -->|condition false| B84
B85 -->|call| B164
B85 -->|after return| B86
B86 -->|call| B120
B86 -->|after return| B87
B87 -->|call| B146
B87 -->|after return| B88
B88 -->|call| B154
B88 -->|after return| B89
B89 -->|call| B146
B89 -->|after return| B90
B79["Continue at B80 in section 8"]
B159["Continue at B160 in section 16"]
B164["Continue at B165 in section 17"]
B120["Continue at B121 in section 13"]
B146["Continue at B147 in section 15"]
B154["Continue at B155 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
DJNZ R7,Y11
```

### B82

```asm
MOV R7,#185
```

### B83

```asm
ACALL LDELAY
```

### B84

```asm
DJNZ R7,Y22
```

### B85

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B86

```asm
ACALL CLEAR
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A, #80H
ACALL CMD
```

### B89

```asm
MOV DPTR, #CORRECTT
ACALL WSTR
```

### B90

```asm
MOV A,#0c0H
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 297 to 298"]
B91["B92: instructions - lines 299 to 301"]
B92["B93: instructions - lines 302 to 302"]
B93["B94: instructions - lines 303 to 303"]
B94["B95: instructions - lines 304 to 304"]
B95["B96: instructions - lines 306 to 306"]
B96["B97: instructions - lines 307 to 307"]
B97["B98: instructions - lines 308 to 308"]
B98["B99: instructions - lines 309 to 309"]
B99["B100: SCORE - lines 312 to 313"]
B90 -->|call| B154
B90 -->|after return| B91
B91 -->|call| B149
B91 -->|after return| B92
B92 -->|call| B120
B92 -->|after return| B93
B93 -->|call| B164
B93 -->|after return| B94
B94 -->|call| B120
B94 -->|after return| B95
B95 -->|call| B78
B95 -->|after return| B96
B96 -->|call| B120
B96 -->|after return| B97
B97 -->|call| B120
B97 -->|after return| B98
B99 -->|call| B146
B99 -->|after return| B100
B154["Continue at B155 in section 16"]
B149["Continue at B150 in section 15"]
B120["Continue at B121 in section 13"]
B164["Continue at B165 in section 17"]
B78["Continue at B79 in section 8"]
B146["Continue at B147 in section 15"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B92

```asm
MOV A,35H
ADD A,#30H
ACALL WCHR
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
ACALL CLEAR
```

### B95

```asm
ACALL DELAY
```

### B96

```asm
ACALL FLASH
```

### B97

```asm
ACALL DELAY
```

### B98

```asm
ACALL DELAY
```

### B99

Return to the instruction following the active call.

```asm
RET
```

### B100

```asm
MOV A, #80H
ACALL CMD
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 314 to 315"]
B101["B102: instructions - lines 316 to 320"]
B102["B103: instructions - lines 321 to 323"]
B103["B104: instructions - lines 325 to 325"]
B104["B105: instructions - lines 326 to 327"]
B105["B106: instructions - lines 328 to 329"]
B106["B107: instructions - lines 330 to 332"]
B107["B108: instructions - lines 333 to 333"]
B108["B109: instructions - lines 334 to 334"]
B109["B110: BYE - lines 337 to 337"]
B100 -->|call| B154
B100 -->|after return| B101
B101 -->|call| B149
B101 -->|after return| B102
B102 -->|call| B149
B102 -->|after return| B103
B103 -->|call| B120
B103 -->|after return| B104
B104 -->|call| B146
B104 -->|after return| B105
B105 -->|call| B154
B105 -->|after return| B106
B106 -->|call| B149
B106 -->|after return| B107
B107 -->|call| B120
B107 -->|after return| B108
B109 -->|call| B164
B109 -->|after return| B110
B154["Continue at B155 in section 16"]
B149["Continue at B150 in section 15"]
B120["Continue at B121 in section 13"]
B146["Continue at B147 in section 15"]
B164["Continue at B165 in section 17"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B102

```asm
MOV A,35H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B103

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
MOV A,#0c0H
ACALL CMD
```

### B106

```asm
MOV DPTR, #FAIL
ACALL WSTR
```

### B107

```asm
MOV A,36H
ADD A,#30H
ACALL WCHR
```

### B108

```asm
ACALL DELAY
```

### B109

Return to the instruction following the active call.

```asm
RET
```

### B110

```asm
ACALL CLEAR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 338 to 338"]
B111["B112: instructions - lines 339 to 340"]
B112["B113: instructions - lines 341 to 342"]
B113["B114: instructions - lines 344 to 345"]
B114["B115: instructions - lines 346 to 347"]
B115["B116: instructions - lines 348 to 348"]
B116["B117: instructions - lines 349 to 349"]
B117["B118: INTERRUPT_OCCUR - lines 352 to 354"]
B118["B119: instructions - lines 355 to 355"]
B119["B120: EX - lines 357 to 358"]
B110 -->|call| B120
B110 -->|after return| B111
B111 -->|call| B146
B111 -->|after return| B112
B112 -->|call| B154
B112 -->|after return| B113
B113 -->|call| B146
B113 -->|after return| B114
B114 -->|call| B154
B114 -->|after return| B115
B115 -->|call| B120
B115 -->|after return| B116
B117 -->|condition true| B119
B117 -->|condition false| B118
B118 -->|jump| B2
B120["Continue at B121 in section 13"]
B146["Continue at B147 in section 15"]
B154["Continue at B155 in section 16"]
B2["Continue at B3 in section 1"]
```

### B111

```asm
ACALL DELAY
```

### B112

```asm
MOV A, #80H
ACALL CMD
```

### B113

```asm
MOV DPTR, #OVERR
ACALL WSTR
```

### B114

```asm
MOV A,#0c0H
ACALL CMD
```

### B115

```asm
MOV DPTR, #THANKS
ACALL WSTR
```

### B116

```asm
ACALL DELAY
```

### B117

Return to the instruction following the active call.

```asm
RET
```

### B118

```asm
MOV 99H,A
MOV A,98H
CJNE A,#1,EX
```

### B119

```asm
LJMP MAIN
```

### B120

Return to the instruction following the active call.

```asm
MOV A,99H
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: DELAY - lines 361 to 361"]
B121["B122: HE2 - lines 362 to 362"]
B122["B123: HE - lines 363 to 363"]
B123["B124: instructions - lines 364 to 364"]
B124["B125: instructions - lines 365 to 365"]
B125["B126: instructions - lines 366 to 366"]
B126["B127: INLCD - lines 370 to 371"]
B127["B128: WAIT - lines 373 to 373"]
B128["B129: instructions - lines 374 to 374"]
B129["B130: instructions - lines 376 to 378"]
B120 -->|next| B121
B121 -->|next| B122
B122 -->|condition true| B122
B122 -->|condition false| B123
B123 -->|call| B159
B123 -->|after return| B124
B124 -->|condition true| B121
B124 -->|condition false| B125
B126 -->|next| B127
B127 -->|call| B159
B127 -->|after return| B128
B128 -->|condition true| B127
B128 -->|condition false| B129
B129 -->|call| B146
B129 -->|after return| B130
B159["Continue at B160 in section 16"]
B146["Continue at B147 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV R1,#250
```

### B122

```asm
MOV R0,#100
```

### B123

```asm
DJNZ R0,HE
```

### B124

```asm
acall ldelay
```

### B125

```asm
DJNZ R1,HE2
```

### B126

Return to the instruction following the active call.

```asm
RET
```

### B127

```asm
PUSH 7
MOV R7,#20
```

### B128

```asm
ACALL LDELAY
```

### B129

```asm
DJNZ R7,WAIT
```

### B130

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 379 to 379"]
B131["B132: instructions - lines 380 to 381"]
B132["B133: instructions - lines 382 to 383"]
B133["B134: instructions - lines 384 to 385"]
B134["B135: instructions - lines 386 to 387"]
B135["B136: instructions - lines 388 to 389"]
B136["B137: instructions - lines 390 to 391"]
B137["B138: instructions - lines 392 to 393"]
B138["B139: instructions - lines 394 to 395"]
B139["B140: instructions - lines 396 to 397"]
B130 -->|call| B159
B130 -->|after return| B131
B131 -->|call| B146
B131 -->|after return| B132
B132 -->|call| B146
B132 -->|after return| B133
B133 -->|call| B146
B133 -->|after return| B134
B134 -->|call| B146
B134 -->|after return| B135
B135 -->|call| B146
B135 -->|after return| B136
B136 -->|call| B146
B136 -->|after return| B137
B137 -->|call| B146
B137 -->|after return| B138
B138 -->|call| B146
B138 -->|after return| B139
B139 -->|call| B146
B139 -->|after return| B140
B159["Continue at B160 in section 16"]
B146["Continue at B147 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL LDELAY
```

### B132

```asm
MOV A,#0011B
ACALL CMD
```

### B133

```asm
MOV A,#0011B
ACALL CMD
```

### B134

```asm
MOV A,#0010B
ACALL CMD
```

### B135

```asm
MOV A,#0010B
ACALL CMD
```

### B136

```asm
MOV A,#1000B
ACALL CMD
```

### B137

```asm
MOV A,#0000B
ACALL CMD
```

### B138

```asm
MOV A,#1000B
ACALL CMD
```

### B139

```asm
MOV A,#0
ACALL CMD
```

### B140

```asm
MOV A,#0001B
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 398 to 398"]
B141["B142: instructions - lines 399 to 400"]
B142["B143: instructions - lines 401 to 402"]
B143["B144: instructions - lines 403 to 404"]
B144["B145: instructions - lines 405 to 406"]
B145["B146: instructions - lines 408 to 409"]
B146["B147: CMD - lines 413 to 419"]
B147["B148: instructions - lines 420 to 421"]
B148["B149: instructions - lines 423 to 425"]
B149["B150: WCHR - lines 428 to 434"]
B140 -->|call| B159
B140 -->|after return| B141
B141 -->|call| B146
B141 -->|after return| B142
B142 -->|call| B146
B142 -->|after return| B143
B143 -->|call| B146
B143 -->|after return| B144
B144 -->|call| B146
B144 -->|after return| B145
B146 -->|call| B152
B146 -->|after return| B147
B147 -->|call| B152
B147 -->|after return| B148
B149 -->|call| B152
B149 -->|after return| B150
B159["Continue at B160 in section 16"]
B152["Continue at B153 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL LDELAY
```

### B142

```asm
MOV A,#0000B
ACALL CMD
```

### B143

```asm
MOV A,#0110B
ACALL CMD
```

### B144

```asm
MOV A,#0000B
ACALL CMD
```

### B145

```asm
MOV A,#1111B
ACALL CMD
```

### B146

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B147

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B148

```asm
MOV A,B
ACALL COMMON
```

### B149

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B150

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 435 to 436"]
B151["B152: instructions - lines 438 to 441"]
B152["B153: COMMON - lines 444 to 451"]
B153["B154: instructions - lines 452 to 452"]
B154["B155: WSTR - lines 455 to 455"]
B155["B156: CONT1 - lines 457 to 459"]
B156["B157: instructions - lines 460 to 460"]
B157["B158: instructions - lines 461 to 462"]
B158["B159: EXIT1 - lines 464 to 465"]
B159["B160: LDELAY - lines 468 to 470"]
B150 -->|call| B152
B150 -->|after return| B151
B152 -->|call| B159
B152 -->|after return| B153
B154 -->|next| B155
B155 -->|condition true| B158
B155 -->|condition false| B156
B156 -->|call| B149
B156 -->|after return| B157
B157 -->|jump| B155
B159 -->|next| B160
B149["Continue at B150 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,B
ACALL COMMON
```

### B152

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B153

```asm
CLR RW
SWAP A
ANL A,#11110000B
ANL P0,#00000111B
ORL P0,A
SETB EN
CLR EN
ACALL LDELAY
```

### B154

Return to the instruction following the active call.

```asm
RET
```

### B155

```asm
PUSH ACC
```

### B156

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B157

```asm
ACALL WCHR
```

### B158

```asm
INC DPTR
AJMP CONT1
```

### B159

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B160

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

## Section 17

```mermaid
flowchart TD
B160["B161: CON4 - lines 472 to 472"]
B161["B162: instructions - lines 473 to 474"]
B162["B163: instructions - lines 475 to 475"]
B163["B164: instructions - lines 476 to 478"]
B164["B165: CLEAR - lines 482 to 483"]
B165["B166: instructions - lines 484 to 484"]
B166["B167: WAITT - lines 485 to 485"]
B167["B168: instructions - lines 486 to 486"]
B168["B169: instructions - lines 487 to 487"]
B169["B170: KEYPAD - lines 496 to 496"]
B160 -->|call| B117
B160 -->|after return| B161
B161 -->|condition true| B161
B161 -->|condition false| B162
B162 -->|condition true| B160
B162 -->|condition false| B163
B164 -->|call| B146
B164 -->|after return| B165
B165 -->|next| B166
B166 -->|call| B159
B166 -->|after return| B167
B167 -->|condition true| B166
B167 -->|condition false| B168
B169 -->|next| B170
B117["Continue at B118 in section 12"]
B146["Continue at B147 in section 15"]
B159["Continue at B160 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL INTERRUPT_OCCUR
```

### B162

```asm
MOV R0,#250
DJNZ R0,$
```

### B163

```asm
DJNZ R1,CON4
```

### B164

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B165

```asm
MOV A,#01H
ACALL CMD
```

### B166

```asm
MOV R7,#17
```

### B167

```asm
ACALL LDELAY
```

### B168

```asm
DJNZ R7,WAITT
```

### B169

Return to the instruction following the active call.

```asm
RET
```

### B170

```asm
MOV P2,#11110000B
```

## Section 18

```mermaid
flowchart TD
B170["B171: K1 - lines 498 to 498"]
B171["B172: instructions - lines 499 to 502"]
B172["B173: K2 - lines 504 to 504"]
B173["B174: instructions - lines 505 to 505"]
B174["B175: instructions - lines 506 to 508"]
B175["B176: instructions - lines 509 to 509"]
B176["B177: OVER - lines 511 to 511"]
B177["B178: instructions - lines 512 to 514"]
B178["B179: instructions - lines 515 to 515"]
B179["B180: OVER1 - lines 517 to 520"]
B170 -->|call| B117
B170 -->|after return| B171
B171 -->|condition true| B170
B171 -->|condition false| B172
B172 -->|call| B117
B172 -->|after return| B173
B173 -->|call| B192
B173 -->|after return| B174
B174 -->|condition true| B176
B174 -->|condition false| B175
B175 -->|jump| B172
B176 -->|call| B192
B176 -->|after return| B177
B177 -->|condition true| B179
B177 -->|condition false| B178
B178 -->|jump| B172
B179 -->|condition true| B184
B179 -->|condition false| B180
B117["Continue at B118 in section 12"]
B192["Continue at B193 in section 20"]
B184["Continue at B185 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL INTERRUPT_OCCUR
```

### B172

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B173

```asm
ACALL INTERRUPT_OCCUR
```

### B174

```asm
ACALL TMSEC
```

### B175

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B176

```asm
SJMP K2
```

### B177

```asm
ACALL TMSEC
```

### B178

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B179

```asm
SJMP K2
```

### B180

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 521 to 524"]
B181["B182: instructions - lines 525 to 528"]
B182["B183: instructions - lines 529 to 532"]
B183["B184: instructions - lines 533 to 533"]
B184["B185: ROW_0 - lines 534 to 535"]
B185["B186: ROW_1 - lines 536 to 537"]
B186["B187: ROW_2 - lines 538 to 539"]
B187["B188: ROW_3 - lines 540 to 540"]
B188["B189: FIND - lines 542 to 542"]
B189["B190: FIND1 - lines 544 to 545"]
B180 -->|condition true| B185
B180 -->|condition false| B181
B181 -->|condition true| B186
B181 -->|condition false| B182
B182 -->|condition true| B187
B182 -->|condition false| B183
B183 -->|jump| B172
B184 -->|jump| B188
B185 -->|jump| B188
B186 -->|jump| B188
B187 -->|next| B188
B188 -->|next| B189
B189 -->|condition true| B191
B189 -->|condition false| B190
B172["Continue at B173 in section 18"]
B191["Continue at B192 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B182

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B183

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B184

```asm
LJMP K2
```

### B185

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B186

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B187

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B188

```asm
MOV DPTR,#KCODE3
```

### B189

```asm
SWAP A
```

### B190

```asm
RRC A
JNC MATCH
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 546 to 547"]
B191["B192: MATCH - lines 549 to 551"]
B192["B193: TMSEC - lines 555 to 558"]
B193["B194: BACK - lines 559 to 559"]
B194["B195: instructions - lines 560 to 562"]
B190 -->|jump| B189
B192 -->|next| B193
B193 -->|condition true| B193
B193 -->|condition false| B194
B189["Continue at B190 in section 19"]
```

### B191

```asm
INC DPTR
SJMP FIND1
```

### B192

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B193

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B194

```asm
JNB TF0,BACK
```

### B195

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```
