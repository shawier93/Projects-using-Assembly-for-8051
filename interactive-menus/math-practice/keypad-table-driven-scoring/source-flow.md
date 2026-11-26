# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 12 to 12"]
B1["B2: instructions - lines 14 to 17"]
B2["B3: instructions - lines 18 to 19"]
B3["B4: AGAIN - lines 21 to 53"]
B4["B5: USER - lines 55 to 55"]
B5["B6: instructions - lines 57 to 58"]
B6["B7: instructions - lines 61 to 61"]
B7["B8: instructions - lines 62 to 62"]
B8["B9: instructions - lines 63 to 65"]
B9["B10: instructions - lines 67 to 67"]
B0 -->|call| B119
B0 -->|after return| B1
B1 -->|call| B44
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|next| B4
B4 -->|call| B50
B4 -->|after return| B5
B5 -->|condition true| B14
B5 -->|condition false| B6
B6 -->|call| B161
B6 -->|after return| B7
B7 -->|call| B142
B7 -->|after return| B8
B8 -->|call| B114
B8 -->|after return| B9
B9 -->|call| B60
B9 -->|after return| B10
B119["Continue at B120 in section 12"]
B44["Continue at B45 in section 5"]
B50["Continue at B51 in section 6"]
B14["Continue at B15 in section 2"]
B161["Continue at B162 in section 17"]
B142["Continue at B143 in section 15"]
B114["Continue at B115 in section 12"]
B60["Continue at B61 in section 7"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV	34H,#1
MOV	35H,#0
MOV	36H,#0
ACALL WELCOME
```

### B3

```asm
MOV	DPTR,#QS
MOV R2,#0
```

### B4

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

### B5

```asm
ACALL QUESTION
```

### B6

```asm
MOV R1,77H
CJNE R1,#'+',NPL
```

### B7

```asm
ACALL KEYPAD
```

### B8

```asm
ACALL WCHR
```

### B9

```asm
SUBB A,#30H
MOV 37H,A
ACALL DELAY
```

### B10

```asm
ACALL ANS
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 68 to 74"]
B11["B12: instructions - lines 75 to 79"]
B12["B13: instructions - lines 80 to 80"]
B13["B14: WWRONG - lines 82 to 82"]
B14["B15: NPL - lines 85 to 85"]
B15["B16: instructions - lines 88 to 88"]
B16["B17: instructions - lines 89 to 89"]
B17["B18: instructions - lines 90 to 92"]
B18["B19: instructions - lines 94 to 94"]
B19["B20: instructions - lines 95 to 100"]
B10 -->|condition true| B13
B10 -->|condition false| B11
B11 -->|call| B82
B11 -->|after return| B12
B12 -->|jump| B3
B13 -->|jump| B39
B14 -->|condition true| B22
B14 -->|condition false| B15
B15 -->|call| B161
B15 -->|after return| B16
B16 -->|call| B142
B16 -->|after return| B17
B17 -->|call| B114
B17 -->|after return| B18
B18 -->|call| B60
B18 -->|after return| B19
B19 -->|condition true| B39
B19 -->|condition false| B20
B82["Continue at B83 in section 9"]
B3["Continue at B4 in section 1"]
B39["Continue at B40 in section 4"]
B22["Continue at B23 in section 3"]
B161["Continue at B162 in section 17"]
B142["Continue at B143 in section 15"]
B114["Continue at B115 in section 12"]
B60["Continue at B61 in section 7"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,R3
ADD A,R4
MOV 30H,A
MOV	B,37H
CJNE A,B,WWRONG
```

### B12

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B13

```asm
SJMP AGAIN
```

### B14

```asm
AJMP WRONG
```

### B15

```asm
CJNE R1,#'-',NMS
```

### B16

```asm
ACALL KEYPAD
```

### B17

```asm
ACALL WCHR
```

### B18

```asm
SUBB A,#30H
MOV 37H,A
ACALL DELAY
```

### B19

```asm
ACALL ANS
```

### B20

```asm
MOV A,R3
SUBB A,R4
MOV 31H,A
MOV	B,37H
CJNE A,B,WRONG
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 101 to 105"]
B21["B22: instructions - lines 106 to 106"]
B22["B23: NMS - lines 110 to 110"]
B23["B24: instructions - lines 113 to 113"]
B24["B25: instructions - lines 114 to 114"]
B25["B26: instructions - lines 115 to 119"]
B26["B27: instructions - lines 120 to 120"]
B27["B28: instructions - lines 121 to 124"]
B28["B29: instructions - lines 126 to 126"]
B29["B30: instructions - lines 128 to 135"]
B20 -->|call| B82
B20 -->|after return| B21
B21 -->|jump| B3
B22 -->|condition true| B32
B22 -->|condition false| B23
B23 -->|call| B161
B23 -->|after return| B24
B24 -->|call| B142
B24 -->|after return| B25
B25 -->|call| B161
B25 -->|after return| B26
B26 -->|call| B142
B26 -->|after return| B27
B27 -->|call| B114
B27 -->|after return| B28
B28 -->|call| B60
B28 -->|after return| B29
B29 -->|condition true| B39
B29 -->|condition false| B30
B82["Continue at B83 in section 9"]
B3["Continue at B4 in section 1"]
B32["Continue at B33 in section 4"]
B161["Continue at B162 in section 17"]
B142["Continue at B143 in section 15"]
B114["Continue at B115 in section 12"]
B60["Continue at B61 in section 7"]
B39["Continue at B40 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B22

```asm
SJMP AGAIN
```

### B23

```asm
CJNE R1,#'*',DVS
```

### B24

```asm
ACALL KEYPAD
```

### B25

```asm
ACALL WCHR
```

### B26

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV 37H,A
ACALL KEYPAD
```

### B27

```asm
ACALL WCHR
```

### B28

```asm
SUBB A,#30H
ADD A,37H
MOV 37H,A
ACALL DELAY
```

### B29

```asm
ACALL ANS
```

### B30

```asm
MOV A,R3
MOV B,R4
MUL AB
MOV 32H,A
MOV	B,37H
CJNE A,B,WRONG
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 136 to 140"]
B31["B32: instructions - lines 141 to 141"]
B32["B33: DVS - lines 147 to 147"]
B33["B34: instructions - lines 148 to 148"]
B34["B35: instructions - lines 149 to 151"]
B35["B36: instructions - lines 153 to 153"]
B36["B37: instructions - lines 156 to 162"]
B37["B38: instructions - lines 163 to 166"]
B38["B39: instructions - lines 167 to 167"]
B39["B40: WRONG - lines 170 to 170"]
B30 -->|call| B82
B30 -->|after return| B31
B31 -->|jump| B3
B32 -->|call| B161
B32 -->|after return| B33
B33 -->|call| B142
B33 -->|after return| B34
B34 -->|call| B114
B34 -->|after return| B35
B35 -->|call| B60
B35 -->|after return| B36
B36 -->|condition true| B39
B36 -->|condition false| B37
B37 -->|call| B82
B37 -->|after return| B38
B38 -->|jump| B41
B39 -->|call| B65
B39 -->|after return| B40
B82["Continue at B83 in section 9"]
B3["Continue at B4 in section 1"]
B161["Continue at B162 in section 17"]
B142["Continue at B143 in section 15"]
B114["Continue at B115 in section 12"]
B60["Continue at B61 in section 7"]
B41["Continue at B42 in section 5"]
B65["Continue at B66 in section 7"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B32

```asm
AJMP AGAIN
```

### B33

```asm
ACALL KEYPAD
```

### B34

```asm
ACALL WCHR
```

### B35

```asm
SUBB A,#30H
MOV 37H,A
ACALL DELAY
```

### B36

```asm
ACALL ANS
```

### B37

```asm
MOV A,R3
MOV B,R4
DIV AB
MOV 33H,A
MOV	B,37H
CJNE A,B,WRONG
```

### B38

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
ACALL RIGHT
```

### B39

```asm
SJMP STOP
```

### B40

```asm
ACALL WRONGG
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 171 to 173"]
B41["B42: STOP - lines 177 to 177"]
B42["B43: instructions - lines 178 to 178"]
B43["B44: instructions - lines 179 to 179"]
B44["B45: WELCOME - lines 183 to 184"]
B45["B46: instructions - lines 185 to 186"]
B46["B47: instructions - lines 188 to 189"]
B47["B48: instructions - lines 190 to 191"]
B48["B49: instructions - lines 192 to 192"]
B49["B50: instructions - lines 193 to 193"]
B40 -->|jump| B4
B41 -->|call| B96
B41 -->|after return| B42
B42 -->|call| B106
B42 -->|after return| B43
B43 -->|jump| B43
B44 -->|call| B139
B44 -->|after return| B45
B45 -->|call| B147
B45 -->|after return| B46
B46 -->|call| B139
B46 -->|after return| B47
B47 -->|call| B147
B47 -->|after return| B48
B48 -->|call| B114
B48 -->|after return| B49
B4["Continue at B5 in section 1"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B139["Continue at B140 in section 14"]
B147["Continue at B148 in section 15"]
B114["Continue at B115 in section 12"]
```

### B41

```asm
INC	36H
DEC	35H
AJMP USER
```

### B42

```asm
ACALL SCORE
```

### B43

```asm
ACALL BYE
```

### B44

```asm
SJMP $
```

### B45

```asm
MOV A, #80H
ACALL CMD
```

### B46

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B47

```asm
MOV A,#90H
ACALL CMD
```

### B48

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B49

```asm
ACALL DELAY
```

### B50

Return to the instruction following the active call.

```asm
RET
```

## Section 6

```mermaid
flowchart TD
B50["B51: QUESTION - lines 196 to 196"]
B51["B52: instructions - lines 197 to 197"]
B52["B53: instructions - lines 199 to 200"]
B53["B54: instructions - lines 201 to 205"]
B54["B55: instructions - lines 206 to 208"]
B55["B56: instructions - lines 211 to 213"]
B56["B57: instructions - lines 215 to 217"]
B57["B58: instructions - lines 219 to 220"]
B58["B59: instructions - lines 221 to 222"]
B59["B60: instructions - lines 224 to 224"]
B50 -->|call| B156
B50 -->|after return| B51
B51 -->|call| B114
B51 -->|after return| B52
B52 -->|call| B139
B52 -->|after return| B53
B53 -->|call| B142
B53 -->|after return| B54
B54 -->|call| B142
B54 -->|after return| B55
B55 -->|call| B142
B55 -->|after return| B56
B56 -->|call| B142
B56 -->|after return| B57
B57 -->|call| B142
B57 -->|after return| B58
B58 -->|call| B142
B58 -->|after return| B59
B156["Continue at B157 in section 16"]
B114["Continue at B115 in section 12"]
B139["Continue at B140 in section 14"]
B142["Continue at B143 in section 15"]
```

### B51

```asm
ACALL CLEAR
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
MOV A, #80H
ACALL CMD
```

### B54

```asm
MOV A,R3
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B55

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B56

```asm
MOV R1,77H
MOV A,R1
ACALL WCHR
```

### B57

```asm
MOV A,R4
ADD A,#30H
ACALL WCHR
```

### B58

```asm
MOV A,#'='
ACALL WCHR
```

### B59

```asm
MOV A,#' '
ACALL WCHR
```

### B60

Return to the instruction following the active call.

```asm
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: ANS - lines 227 to 228"]
B61["B62: instructions - lines 229 to 233"]
B62["B63: instructions - lines 234 to 236"]
B63["B64: instructions - lines 237 to 237"]
B64["B65: instructions - lines 238 to 238"]
B65["B66: WRONGG - lines 241 to 242"]
B66["B67: instructions - lines 243 to 244"]
B67["B68: instructions - lines 245 to 245"]
B68["B69: instructions - lines 246 to 247"]
B69["B70: X1 - lines 249 to 249"]
B60 -->|call| B139
B60 -->|after return| B61
B61 -->|call| B142
B61 -->|after return| B62
B62 -->|call| B142
B62 -->|after return| B63
B63 -->|call| B114
B63 -->|after return| B64
B65 -->|call| B139
B65 -->|after return| B66
B66 -->|call| B147
B66 -->|after return| B67
B67 -->|call| B114
B67 -->|after return| B68
B68 -->|next| B69
B69 -->|call| B152
B69 -->|after return| B70
B139["Continue at B140 in section 14"]
B142["Continue at B143 in section 15"]
B114["Continue at B115 in section 12"]
B147["Continue at B148 in section 15"]
B152["Continue at B153 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#90H
ACALL CMD
```

### B62

```asm
MOV A,37H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B63

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B64

```asm
ACALL DELAY
```

### B65

Return to the instruction following the active call.

```asm
RET
```

### B66

```asm
MOV A,#90H
ACALL CMD
```

### B67

```asm
MOV DPTR, #WRONG1
ACALL WSTR
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
CLR R
MOV R7,#185
```

### B70

```asm
ACALL LDELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 250 to 250"]
B71["B72: instructions - lines 251 to 251"]
B72["B73: X2 - lines 253 to 253"]
B73["B74: instructions - lines 254 to 254"]
B74["B75: instructions - lines 255 to 256"]
B75["B76: FLASH - lines 259 to 260"]
B76["B77: Y11 - lines 262 to 262"]
B77["B78: instructions - lines 263 to 263"]
B78["B79: instructions - lines 265 to 265"]
B79["B80: Y22 - lines 267 to 267"]
B70 -->|condition true| B69
B70 -->|condition false| B71
B71 -->|next| B72
B72 -->|call| B152
B72 -->|after return| B73
B73 -->|condition true| B72
B73 -->|condition false| B74
B75 -->|next| B76
B76 -->|call| B152
B76 -->|after return| B77
B77 -->|condition true| B76
B77 -->|condition false| B78
B78 -->|next| B79
B79 -->|call| B152
B79 -->|after return| B80
B69["Continue at B70 in section 7"]
B152["Continue at B153 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
DJNZ R7,X1
```

### B72

```asm
MOV R7,#185
```

### B73

```asm
ACALL LDELAY
```

### B74

```asm
DJNZ R7,X2
```

### B75

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B76

```asm
CLR G
MOV R7,#185
```

### B77

```asm
ACALL LDELAY
```

### B78

```asm
DJNZ R7,Y11
```

### B79

```asm
MOV R7,#185
```

### B80

```asm
ACALL LDELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 268 to 268"]
B81["B82: instructions - lines 269 to 270"]
B82["B83: RIGHT - lines 273 to 273"]
B83["B84: instructions - lines 274 to 274"]
B84["B85: instructions - lines 275 to 276"]
B85["B86: instructions - lines 277 to 278"]
B86["B87: instructions - lines 280 to 281"]
B87["B88: instructions - lines 282 to 283"]
B88["B89: instructions - lines 284 to 286"]
B89["B90: instructions - lines 287 to 287"]
B80 -->|condition true| B79
B80 -->|condition false| B81
B82 -->|call| B156
B82 -->|after return| B83
B83 -->|call| B114
B83 -->|after return| B84
B84 -->|call| B139
B84 -->|after return| B85
B85 -->|call| B147
B85 -->|after return| B86
B86 -->|call| B139
B86 -->|after return| B87
B87 -->|call| B147
B87 -->|after return| B88
B88 -->|call| B142
B88 -->|after return| B89
B89 -->|call| B114
B89 -->|after return| B90
B79["Continue at B80 in section 8"]
B156["Continue at B157 in section 16"]
B114["Continue at B115 in section 12"]
B139["Continue at B140 in section 14"]
B147["Continue at B148 in section 15"]
B142["Continue at B143 in section 15"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
DJNZ R7,Y22
```

### B82

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B83

```asm
ACALL CLEAR
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
MOV A, #80H
ACALL CMD
```

### B86

```asm
MOV DPTR, #CORRECTT
ACALL WSTR
```

### B87

```asm
MOV A,#90H
ACALL CMD
```

### B88

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B89

```asm
MOV A,35H
ADD A,#30H
ACALL WCHR
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 288 to 288"]
B91["B92: instructions - lines 289 to 289"]
B92["B93: instructions - lines 291 to 291"]
B93["B94: instructions - lines 292 to 292"]
B94["B95: instructions - lines 293 to 293"]
B95["B96: instructions - lines 294 to 294"]
B96["B97: SCORE - lines 297 to 298"]
B97["B98: instructions - lines 299 to 300"]
B98["B99: instructions - lines 301 to 305"]
B99["B100: instructions - lines 306 to 308"]
B90 -->|call| B156
B90 -->|after return| B91
B91 -->|call| B114
B91 -->|after return| B92
B92 -->|call| B75
B92 -->|after return| B93
B93 -->|call| B114
B93 -->|after return| B94
B94 -->|call| B114
B94 -->|after return| B95
B96 -->|call| B139
B96 -->|after return| B97
B97 -->|call| B147
B97 -->|after return| B98
B98 -->|call| B142
B98 -->|after return| B99
B99 -->|call| B142
B99 -->|after return| B100
B156["Continue at B157 in section 16"]
B114["Continue at B115 in section 12"]
B75["Continue at B76 in section 8"]
B139["Continue at B140 in section 14"]
B147["Continue at B148 in section 15"]
B142["Continue at B143 in section 15"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL CLEAR
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
ACALL FLASH
```

### B94

```asm
ACALL DELAY
```

### B95

```asm
ACALL DELAY
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
MOV A, #80H
ACALL CMD
```

### B98

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B99

```asm
MOV A,35H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B100

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 310 to 310"]
B101["B102: instructions - lines 311 to 312"]
B102["B103: instructions - lines 313 to 314"]
B103["B104: instructions - lines 315 to 317"]
B104["B105: instructions - lines 318 to 318"]
B105["B106: instructions - lines 319 to 319"]
B106["B107: BYE - lines 322 to 322"]
B107["B108: instructions - lines 323 to 323"]
B108["B109: instructions - lines 324 to 325"]
B109["B110: instructions - lines 326 to 327"]
B100 -->|call| B114
B100 -->|after return| B101
B101 -->|call| B139
B101 -->|after return| B102
B102 -->|call| B147
B102 -->|after return| B103
B103 -->|call| B142
B103 -->|after return| B104
B104 -->|call| B114
B104 -->|after return| B105
B106 -->|call| B156
B106 -->|after return| B107
B107 -->|call| B114
B107 -->|after return| B108
B108 -->|call| B139
B108 -->|after return| B109
B109 -->|call| B147
B109 -->|after return| B110
B114["Continue at B115 in section 12"]
B139["Continue at B140 in section 14"]
B147["Continue at B148 in section 15"]
B142["Continue at B143 in section 15"]
B156["Continue at B157 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL DELAY
```

### B102

```asm
MOV A,#90H
ACALL CMD
```

### B103

```asm
MOV DPTR, #FAIL
ACALL WSTR
```

### B104

```asm
MOV A,36H
ADD A,#30H
ACALL WCHR
```

### B105

```asm
ACALL DELAY
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

```asm
ACALL CLEAR
```

### B108

```asm
ACALL DELAY
```

### B109

```asm
MOV A, #80H
ACALL CMD
```

### B110

```asm
MOV DPTR, #OVERR
ACALL WSTR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 329 to 330"]
B111["B112: instructions - lines 331 to 332"]
B112["B113: instructions - lines 333 to 333"]
B113["B114: instructions - lines 334 to 334"]
B114["B115: DELAY - lines 338 to 338"]
B115["B116: HE2 - lines 339 to 339"]
B116["B117: HE - lines 340 to 340"]
B117["B118: instructions - lines 341 to 341"]
B118["B119: instructions - lines 342 to 342"]
B119["B120: INLCD - lines 346 to 347"]
B110 -->|call| B139
B110 -->|after return| B111
B111 -->|call| B147
B111 -->|after return| B112
B112 -->|call| B114
B112 -->|after return| B113
B114 -->|next| B115
B115 -->|next| B116
B116 -->|condition true| B116
B116 -->|condition false| B117
B117 -->|condition true| B115
B117 -->|condition false| B118
B119 -->|next| B120
B139["Continue at B140 in section 14"]
B147["Continue at B148 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A,#90H
ACALL CMD
```

### B112

```asm
MOV DPTR, #THANKS
ACALL WSTR
```

### B113

```asm
ACALL DELAY
```

### B114

Return to the instruction following the active call.

```asm
RET
```

### B115

```asm
MOV R1,#250
```

### B116

```asm
MOV R0,#100
```

### B117

```asm
DJNZ R0,HE
```

### B118

```asm
DJNZ R1,HE2
```

### B119

Return to the instruction following the active call.

```asm
RET
```

### B120

```asm
PUSH 7
MOV R7,#20
```

## Section 13

```mermaid
flowchart TD
B120["B121: WAIT - lines 349 to 349"]
B121["B122: instructions - lines 350 to 350"]
B122["B123: instructions - lines 352 to 354"]
B123["B124: instructions - lines 355 to 355"]
B124["B125: instructions - lines 356 to 357"]
B125["B126: instructions - lines 358 to 359"]
B126["B127: instructions - lines 360 to 361"]
B127["B128: instructions - lines 362 to 363"]
B128["B129: instructions - lines 364 to 365"]
B129["B130: instructions - lines 366 to 367"]
B120 -->|call| B152
B120 -->|after return| B121
B121 -->|condition true| B120
B121 -->|condition false| B122
B122 -->|call| B139
B122 -->|after return| B123
B123 -->|call| B152
B123 -->|after return| B124
B124 -->|call| B139
B124 -->|after return| B125
B125 -->|call| B139
B125 -->|after return| B126
B126 -->|call| B139
B126 -->|after return| B127
B127 -->|call| B139
B127 -->|after return| B128
B128 -->|call| B139
B128 -->|after return| B129
B129 -->|call| B139
B129 -->|after return| B130
B152["Continue at B153 in section 16"]
B139["Continue at B140 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL LDELAY
```

### B122

```asm
DJNZ R7,WAIT
```

### B123

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B124

```asm
ACALL LDELAY
```

### B125

```asm
MOV A,#0011B
ACALL CMD
```

### B126

```asm
MOV A,#0011B
ACALL CMD
```

### B127

```asm
MOV A,#0010B
ACALL CMD
```

### B128

```asm
MOV A,#0010B
ACALL CMD
```

### B129

```asm
MOV A,#1000B
ACALL CMD
```

### B130

```asm
MOV A,#0000B
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 368 to 369"]
B131["B132: instructions - lines 370 to 371"]
B132["B133: instructions - lines 372 to 373"]
B133["B134: instructions - lines 374 to 374"]
B134["B135: instructions - lines 375 to 376"]
B135["B136: instructions - lines 377 to 378"]
B136["B137: instructions - lines 379 to 380"]
B137["B138: instructions - lines 381 to 382"]
B138["B139: instructions - lines 384 to 385"]
B139["B140: CMD - lines 389 to 395"]
B130 -->|call| B139
B130 -->|after return| B131
B131 -->|call| B139
B131 -->|after return| B132
B132 -->|call| B139
B132 -->|after return| B133
B133 -->|call| B152
B133 -->|after return| B134
B134 -->|call| B139
B134 -->|after return| B135
B135 -->|call| B139
B135 -->|after return| B136
B136 -->|call| B139
B136 -->|after return| B137
B137 -->|call| B139
B137 -->|after return| B138
B139 -->|call| B145
B139 -->|after return| B140
B152["Continue at B153 in section 16"]
B145["Continue at B146 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,#1000B
ACALL CMD
```

### B132

```asm
MOV A,#0
ACALL CMD
```

### B133

```asm
MOV A,#0001B
ACALL CMD
```

### B134

```asm
ACALL LDELAY
```

### B135

```asm
MOV A,#0000B
ACALL CMD
```

### B136

```asm
MOV A,#0110B
ACALL CMD
```

### B137

```asm
MOV A,#0000B
ACALL CMD
```

### B138

```asm
MOV A,#1111B
ACALL CMD
```

### B139

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B140

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 396 to 397"]
B141["B142: instructions - lines 399 to 401"]
B142["B143: WCHR - lines 404 to 410"]
B143["B144: instructions - lines 411 to 412"]
B144["B145: instructions - lines 414 to 416"]
B145["B146: COMMON - lines 419 to 426"]
B146["B147: instructions - lines 427 to 427"]
B147["B148: WSTR - lines 430 to 430"]
B148["B149: CONT1 - lines 432 to 434"]
B149["B150: instructions - lines 435 to 435"]
B140 -->|call| B145
B140 -->|after return| B141
B142 -->|call| B145
B142 -->|after return| B143
B143 -->|call| B145
B143 -->|after return| B144
B145 -->|call| B152
B145 -->|after return| B146
B147 -->|next| B148
B148 -->|condition true| B151
B148 -->|condition false| B149
B149 -->|call| B142
B149 -->|after return| B150
B152["Continue at B153 in section 16"]
B151["Continue at B152 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,B
ACALL COMMON
```

### B142

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B143

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B144

```asm
MOV A,B
ACALL COMMON
```

### B145

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B146

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

### B147

Return to the instruction following the active call.

```asm
RET
```

### B148

```asm
PUSH ACC
```

### B149

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B150

```asm
ACALL WCHR
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 436 to 437"]
B151["B152: EXIT1 - lines 439 to 440"]
B152["B153: LDELAY - lines 443 to 445"]
B153["B154: CON4 - lines 447 to 448"]
B154["B155: instructions - lines 449 to 449"]
B155["B156: instructions - lines 450 to 452"]
B156["B157: CLEAR - lines 456 to 457"]
B157["B158: instructions - lines 458 to 458"]
B158["B159: WAITT - lines 459 to 459"]
B159["B160: instructions - lines 460 to 460"]
B150 -->|jump| B148
B152 -->|next| B153
B153 -->|condition true| B153
B153 -->|condition false| B154
B154 -->|condition true| B153
B154 -->|condition false| B155
B156 -->|call| B139
B156 -->|after return| B157
B157 -->|next| B158
B158 -->|call| B152
B158 -->|after return| B159
B159 -->|condition true| B158
B159 -->|condition false| B160
B148["Continue at B149 in section 15"]
B139["Continue at B140 in section 14"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
INC DPTR
AJMP CONT1
```

### B152

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B153

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B154

```asm
MOV R0,#250
DJNZ R0,$
```

### B155

```asm
DJNZ R1,CON4
```

### B156

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B157

```asm
MOV A,#01H
ACALL CMD
```

### B158

```asm
MOV R7,#17
```

### B159

```asm
ACALL LDELAY
```

### B160

```asm
DJNZ R7,WAITT
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 461 to 461"]
B161["B162: KEYPAD - lines 469 to 469"]
B162["B163: K1 - lines 470 to 473"]
B163["B164: K2 - lines 474 to 474"]
B164["B165: instructions - lines 475 to 477"]
B165["B166: instructions - lines 478 to 478"]
B166["B167: OVER - lines 480 to 480"]
B167["B168: instructions - lines 481 to 483"]
B168["B169: instructions - lines 484 to 484"]
B169["B170: OVER1 - lines 486 to 489"]
B161 -->|next| B162
B162 -->|condition true| B162
B162 -->|condition false| B163
B163 -->|call| B182
B163 -->|after return| B164
B164 -->|condition true| B166
B164 -->|condition false| B165
B165 -->|jump| B163
B166 -->|call| B182
B166 -->|after return| B167
B167 -->|condition true| B169
B167 -->|condition false| B168
B168 -->|jump| B163
B169 -->|condition true| B174
B169 -->|condition false| B170
B182["Continue at B183 in section 19"]
B174["Continue at B175 in section 18"]
B170["Continue at B171 in section 18"]
```

### B161

Return to the instruction following the active call.

```asm
RET
```

### B162

```asm
MOV P2,#11110000B
```

### B163

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B164

```asm
ACALL TMSEC
```

### B165

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B166

```asm
SJMP K2
```

### B167

```asm
ACALL TMSEC
```

### B168

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B169

```asm
SJMP K2
```

### B170

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 490 to 493"]
B171["B172: instructions - lines 494 to 497"]
B172["B173: instructions - lines 498 to 501"]
B173["B174: instructions - lines 502 to 502"]
B174["B175: ROW_0 - lines 503 to 504"]
B175["B176: ROW_1 - lines 505 to 506"]
B176["B177: ROW_2 - lines 507 to 508"]
B177["B178: ROW_3 - lines 509 to 509"]
B178["B179: FIND - lines 511 to 511"]
B179["B180: FIND1 - lines 513 to 514"]
B170 -->|condition true| B175
B170 -->|condition false| B171
B171 -->|condition true| B176
B171 -->|condition false| B172
B172 -->|condition true| B177
B172 -->|condition false| B173
B173 -->|jump| B163
B174 -->|jump| B178
B175 -->|jump| B178
B176 -->|jump| B178
B177 -->|next| B178
B178 -->|next| B179
B179 -->|condition true| B181
B179 -->|condition false| B180
B163["Continue at B164 in section 17"]
B181["Continue at B182 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B172

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B173

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B174

```asm
LJMP K2
```

### B175

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B176

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B177

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B178

```asm
MOV DPTR,#KCODE3
```

### B179

```asm
SWAP A
```

### B180

```asm
RRC A
JNC MATCH
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 515 to 516"]
B181["B182: MATCH - lines 518 to 520"]
B182["B183: TMSEC - lines 524 to 527"]
B183["B184: BACK - lines 528 to 528"]
B184["B185: instructions - lines 529 to 531"]
B180 -->|jump| B179
B182 -->|next| B183
B183 -->|condition true| B183
B183 -->|condition false| B184
B179["Continue at B180 in section 18"]
```

### B181

```asm
INC DPTR
SJMP FIND1
```

### B182

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B183

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B184

```asm
JNB TF0,BACK
```

### B185

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```
