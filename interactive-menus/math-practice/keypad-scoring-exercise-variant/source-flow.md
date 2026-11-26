# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 12 to 12"]
B1["B2: instructions - lines 14 to 17"]
B2["B3: instructions - lines 18 to 19"]
B3["B4: AGAIN - lines 21 to 53"]
B4["B5: USER - lines 55 to 55"]
B5["B6: instructions - lines 57 to 58"]
B6["B7: instructions - lines 61 to 62"]
B7["B8: instructions - lines 63 to 66"]
B8["B9: instructions - lines 67 to 71"]
B9["B10: instructions - lines 72 to 72"]
B0 -->|call| B100
B0 -->|after return| B1
B1 -->|call| B29
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|next| B4
B4 -->|call| B35
B4 -->|after return| B5
B5 -->|condition true| B10
B5 -->|condition false| B6
B6 -->|call| B43
B6 -->|after return| B7
B7 -->|condition true| B24
B7 -->|condition false| B8
B8 -->|call| B65
B8 -->|after return| B9
B9 -->|jump| B3
B100["Continue at B101 in section 11"]
B29["Continue at B30 in section 3"]
B35["Continue at B36 in section 4"]
B10["Continue at B11 in section 2"]
B43["Continue at B44 in section 5"]
B24["Continue at B25 in section 3"]
B65["Continue at B66 in section 7"]
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
MOV	37H,#7
ACALL ANS
```

### B8

```asm
MOV	30H,R5
MOV	A,30H
MOV	B,37H
CJNE A,B,WRONG
```

### B9

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B10

```asm
SJMP AGAIN
```

## Section 2

```mermaid
flowchart TD
B10["B11: NPL - lines 75 to 75"]
B11["B12: instructions - lines 79 to 80"]
B12["B13: instructions - lines 81 to 84"]
B13["B14: instructions - lines 85 to 89"]
B14["B15: instructions - lines 90 to 90"]
B15["B16: NMS - lines 94 to 94"]
B16["B17: instructions - lines 97 to 98"]
B17["B18: instructions - lines 100 to 103"]
B18["B19: instructions - lines 104 to 108"]
B19["B20: instructions - lines 109 to 109"]
B10 -->|condition true| B15
B10 -->|condition false| B11
B11 -->|call| B43
B11 -->|after return| B12
B12 -->|condition true| B24
B12 -->|condition false| B13
B13 -->|call| B65
B13 -->|after return| B14
B14 -->|jump| B3
B15 -->|condition true| B20
B15 -->|condition false| B16
B16 -->|call| B43
B16 -->|after return| B17
B17 -->|condition true| B24
B17 -->|condition false| B18
B18 -->|call| B65
B18 -->|after return| B19
B19 -->|jump| B3
B43["Continue at B44 in section 5"]
B24["Continue at B25 in section 3"]
B65["Continue at B66 in section 7"]
B3["Continue at B4 in section 1"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE R1,#'-',NMS
```

### B12

```asm
MOV	37H,#4
ACALL ANS
```

### B13

```asm
MOV	31H,R5
MOV	A,31H
MOV	B,37H
CJNE A,B,WRONG
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
CJNE R1,#'*',DVS
```

### B17

```asm
MOV	37H,#12
ACALL ANS
```

### B18

```asm
MOV	32H,R5
MOV	A,32H
MOV	B,37H
CJNE A,B,WRONG
```

### B19

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
ACALL RIGHT
```

### B20

```asm
SJMP AGAIN
```

## Section 3

```mermaid
flowchart TD
B20["B21: DVS - lines 115 to 116"]
B21["B22: instructions - lines 118 to 121"]
B22["B23: instructions - lines 122 to 125"]
B23["B24: instructions - lines 126 to 126"]
B24["B25: WRONG - lines 129 to 129"]
B25["B26: instructions - lines 130 to 132"]
B26["B27: STOP - lines 136 to 136"]
B27["B28: instructions - lines 137 to 137"]
B28["B29: instructions - lines 138 to 138"]
B29["B30: WELCOME - lines 142 to 143"]
B20 -->|call| B43
B20 -->|after return| B21
B21 -->|condition true| B24
B21 -->|condition false| B22
B22 -->|call| B65
B22 -->|after return| B23
B23 -->|jump| B26
B24 -->|call| B48
B24 -->|after return| B25
B25 -->|jump| B4
B26 -->|call| B77
B26 -->|after return| B27
B27 -->|call| B87
B27 -->|after return| B28
B28 -->|jump| B28
B29 -->|call| B120
B29 -->|after return| B30
B43["Continue at B44 in section 5"]
B65["Continue at B66 in section 7"]
B48["Continue at B49 in section 5"]
B4["Continue at B5 in section 1"]
B77["Continue at B78 in section 8"]
B87["Continue at B88 in section 9"]
B120["Continue at B121 in section 13"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV	37H,#6
ACALL ANS
```

### B22

```asm
MOV	33H,R5
MOV	A,33H
MOV	B,37H
CJNE A,B,WRONG
```

### B23

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
ACALL RIGHT
```

### B24

```asm
SJMP STOP
```

### B25

```asm
ACALL WRONGG
```

### B26

```asm
INC	36H
DEC	35H
SJMP USER
```

### B27

```asm
ACALL SCORE
```

### B28

```asm
ACALL BYE
```

### B29

```asm
SJMP $
```

### B30

```asm
MOV A, #80H
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 144 to 145"]
B31["B32: instructions - lines 147 to 148"]
B32["B33: instructions - lines 149 to 150"]
B33["B34: instructions - lines 151 to 151"]
B34["B35: instructions - lines 152 to 152"]
B35["B36: QUESTION - lines 155 to 155"]
B36["B37: instructions - lines 156 to 156"]
B37["B38: instructions - lines 157 to 158"]
B38["B39: instructions - lines 159 to 163"]
B39["B40: instructions - lines 164 to 166"]
B30 -->|call| B128
B30 -->|after return| B31
B31 -->|call| B120
B31 -->|after return| B32
B32 -->|call| B128
B32 -->|after return| B33
B33 -->|call| B95
B33 -->|after return| B34
B35 -->|call| B95
B35 -->|after return| B36
B36 -->|call| B137
B36 -->|after return| B37
B37 -->|call| B120
B37 -->|after return| B38
B38 -->|call| B123
B38 -->|after return| B39
B39 -->|call| B123
B39 -->|after return| B40
B128["Continue at B129 in section 13"]
B120["Continue at B121 in section 13"]
B95["Continue at B96 in section 10"]
B137["Continue at B138 in section 14"]
B123["Continue at B124 in section 13"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B32

```asm
MOV A,#90H
ACALL CMD
```

### B33

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B34

```asm
ACALL DELAY
```

### B35

Return to the instruction following the active call.

```asm
RET
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
ACALL CLEAR
```

### B38

```asm
MOV A, #80H
ACALL CMD
```

### B39

```asm
MOV A,R3
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B40

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 169 to 171"]
B41["B42: instructions - lines 173 to 175"]
B42["B43: instructions - lines 177 to 177"]
B43["B44: ANS - lines 180 to 181"]
B44["B45: instructions - lines 182 to 186"]
B45["B46: instructions - lines 187 to 189"]
B46["B47: instructions - lines 190 to 190"]
B47["B48: instructions - lines 191 to 191"]
B48["B49: WRONGG - lines 194 to 195"]
B49["B50: instructions - lines 196 to 197"]
B40 -->|call| B123
B40 -->|after return| B41
B41 -->|call| B123
B41 -->|after return| B42
B43 -->|call| B120
B43 -->|after return| B44
B44 -->|call| B123
B44 -->|after return| B45
B45 -->|call| B123
B45 -->|after return| B46
B46 -->|call| B95
B46 -->|after return| B47
B48 -->|call| B120
B48 -->|after return| B49
B49 -->|call| B128
B49 -->|after return| B50
B123["Continue at B124 in section 13"]
B120["Continue at B121 in section 13"]
B95["Continue at B96 in section 10"]
B128["Continue at B129 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV R1,77H
MOV A,R1
ACALL WCHR
```

### B42

```asm
MOV A,R4
ADD A,#30H
ACALL WCHR
```

### B43

Return to the instruction following the active call.

```asm
RET
```

### B44

```asm
MOV A,#90H
ACALL CMD
```

### B45

```asm
MOV A,37H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B46

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B47

```asm
ACALL DELAY
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
MOV A,#90H
ACALL CMD
```

### B50

```asm
MOV DPTR, #WRONG1
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 198 to 198"]
B51["B52: instructions - lines 199 to 200"]
B52["B53: X1 - lines 202 to 202"]
B53["B54: instructions - lines 203 to 203"]
B54["B55: instructions - lines 204 to 204"]
B55["B56: X2 - lines 206 to 206"]
B56["B57: instructions - lines 207 to 207"]
B57["B58: instructions - lines 208 to 209"]
B58["B59: FLASH - lines 212 to 213"]
B59["B60: Y11 - lines 215 to 215"]
B50 -->|call| B95
B50 -->|after return| B51
B51 -->|next| B52
B52 -->|call| B133
B52 -->|after return| B53
B53 -->|condition true| B52
B53 -->|condition false| B54
B54 -->|next| B55
B55 -->|call| B133
B55 -->|after return| B56
B56 -->|condition true| B55
B56 -->|condition false| B57
B58 -->|next| B59
B59 -->|call| B133
B59 -->|after return| B60
B95["Continue at B96 in section 10"]
B133["Continue at B134 in section 14"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
CLR R
MOV R7,#185
```

### B53

```asm
ACALL LDELAY
```

### B54

```asm
DJNZ R7,X1
```

### B55

```asm
MOV R7,#185
```

### B56

```asm
ACALL LDELAY
```

### B57

```asm
DJNZ R7,X2
```

### B58

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B59

```asm
CLR G
MOV R7,#185
```

### B60

```asm
ACALL LDELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 216 to 216"]
B61["B62: instructions - lines 218 to 218"]
B62["B63: Y22 - lines 220 to 220"]
B63["B64: instructions - lines 221 to 221"]
B64["B65: instructions - lines 222 to 223"]
B65["B66: RIGHT - lines 226 to 226"]
B66["B67: instructions - lines 227 to 227"]
B67["B68: instructions - lines 228 to 229"]
B68["B69: instructions - lines 230 to 231"]
B69["B70: instructions - lines 233 to 234"]
B60 -->|condition true| B59
B60 -->|condition false| B61
B61 -->|next| B62
B62 -->|call| B133
B62 -->|after return| B63
B63 -->|condition true| B62
B63 -->|condition false| B64
B65 -->|call| B137
B65 -->|after return| B66
B66 -->|call| B95
B66 -->|after return| B67
B67 -->|call| B120
B67 -->|after return| B68
B68 -->|call| B128
B68 -->|after return| B69
B69 -->|call| B120
B69 -->|after return| B70
B59["Continue at B60 in section 6"]
B133["Continue at B134 in section 14"]
B137["Continue at B138 in section 14"]
B95["Continue at B96 in section 10"]
B120["Continue at B121 in section 13"]
B128["Continue at B129 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
DJNZ R7,Y11
```

### B62

```asm
MOV R7,#185
```

### B63

```asm
ACALL LDELAY
```

### B64

```asm
DJNZ R7,Y22
```

### B65

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B66

```asm
ACALL CLEAR
```

### B67

```asm
ACALL DELAY
```

### B68

```asm
MOV A, #80H
ACALL CMD
```

### B69

```asm
MOV DPTR, #CORRECTT
ACALL WSTR
```

### B70

```asm
MOV A,#90H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 235 to 236"]
B71["B72: instructions - lines 237 to 239"]
B72["B73: instructions - lines 240 to 240"]
B73["B74: instructions - lines 241 to 241"]
B74["B75: instructions - lines 242 to 242"]
B75["B76: instructions - lines 244 to 244"]
B76["B77: instructions - lines 245 to 245"]
B77["B78: SCORE - lines 248 to 249"]
B78["B79: instructions - lines 250 to 251"]
B79["B80: instructions - lines 252 to 256"]
B70 -->|call| B128
B70 -->|after return| B71
B71 -->|call| B123
B71 -->|after return| B72
B72 -->|call| B95
B72 -->|after return| B73
B73 -->|call| B137
B73 -->|after return| B74
B74 -->|call| B95
B74 -->|after return| B75
B75 -->|call| B58
B75 -->|after return| B76
B77 -->|call| B120
B77 -->|after return| B78
B78 -->|call| B128
B78 -->|after return| B79
B79 -->|call| B123
B79 -->|after return| B80
B128["Continue at B129 in section 13"]
B123["Continue at B124 in section 13"]
B95["Continue at B96 in section 10"]
B137["Continue at B138 in section 14"]
B58["Continue at B59 in section 6"]
B120["Continue at B121 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B72

```asm
MOV A,35H
ADD A,#30H
ACALL WCHR
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
ACALL CLEAR
```

### B75

```asm
ACALL DELAY
```

### B76

```asm
ACALL FLASH
```

### B77

Return to the instruction following the active call.

```asm
RET
```

### B78

```asm
MOV A, #80H
ACALL CMD
```

### B79

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B80

```asm
MOV A,35H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 257 to 259"]
B81["B82: instructions - lines 261 to 261"]
B82["B83: instructions - lines 262 to 263"]
B83["B84: instructions - lines 264 to 265"]
B84["B85: instructions - lines 266 to 268"]
B85["B86: instructions - lines 269 to 269"]
B86["B87: instructions - lines 270 to 270"]
B87["B88: BYE - lines 273 to 273"]
B88["B89: instructions - lines 274 to 274"]
B89["B90: instructions - lines 275 to 276"]
B80 -->|call| B123
B80 -->|after return| B81
B81 -->|call| B95
B81 -->|after return| B82
B82 -->|call| B120
B82 -->|after return| B83
B83 -->|call| B128
B83 -->|after return| B84
B84 -->|call| B123
B84 -->|after return| B85
B85 -->|call| B95
B85 -->|after return| B86
B87 -->|call| B137
B87 -->|after return| B88
B88 -->|call| B95
B88 -->|after return| B89
B89 -->|call| B120
B89 -->|after return| B90
B123["Continue at B124 in section 13"]
B95["Continue at B96 in section 10"]
B120["Continue at B121 in section 13"]
B128["Continue at B129 in section 13"]
B137["Continue at B138 in section 14"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
MOV A,#90H
ACALL CMD
```

### B84

```asm
MOV DPTR, #FAIL
ACALL WSTR
```

### B85

```asm
MOV A,36H
ADD A,#30H
ACALL WCHR
```

### B86

```asm
ACALL DELAY
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

```asm
ACALL CLEAR
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
MOV A, #80H
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 277 to 278"]
B91["B92: instructions - lines 280 to 281"]
B92["B93: instructions - lines 282 to 283"]
B93["B94: instructions - lines 284 to 284"]
B94["B95: instructions - lines 285 to 285"]
B95["B96: DELAY - lines 289 to 289"]
B96["B97: HE2 - lines 290 to 290"]
B97["B98: HE - lines 291 to 291"]
B98["B99: instructions - lines 292 to 292"]
B99["B100: instructions - lines 293 to 293"]
B90 -->|call| B128
B90 -->|after return| B91
B91 -->|call| B120
B91 -->|after return| B92
B92 -->|call| B128
B92 -->|after return| B93
B93 -->|call| B95
B93 -->|after return| B94
B95 -->|next| B96
B96 -->|next| B97
B97 -->|condition true| B97
B97 -->|condition false| B98
B98 -->|condition true| B96
B98 -->|condition false| B99
B128["Continue at B129 in section 13"]
B120["Continue at B121 in section 13"]
```

### B91

```asm
MOV DPTR, #OVERR
ACALL WSTR
```

### B92

```asm
MOV A,#90H
ACALL CMD
```

### B93

```asm
MOV DPTR, #THANKS
ACALL WSTR
```

### B94

```asm
ACALL DELAY
```

### B95

Return to the instruction following the active call.

```asm
RET
```

### B96

```asm
MOV R1,#100
```

### B97

```asm
MOV R0,#10
```

### B98

```asm
DJNZ R0,HE
```

### B99

```asm
DJNZ R1,HE2
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: INLCD - lines 297 to 298"]
B101["B102: WAIT - lines 300 to 300"]
B102["B103: instructions - lines 301 to 301"]
B103["B104: instructions - lines 303 to 305"]
B104["B105: instructions - lines 306 to 306"]
B105["B106: instructions - lines 307 to 308"]
B106["B107: instructions - lines 309 to 310"]
B107["B108: instructions - lines 311 to 312"]
B108["B109: instructions - lines 313 to 314"]
B109["B110: instructions - lines 315 to 316"]
B100 -->|next| B101
B101 -->|call| B133
B101 -->|after return| B102
B102 -->|condition true| B101
B102 -->|condition false| B103
B103 -->|call| B120
B103 -->|after return| B104
B104 -->|call| B133
B104 -->|after return| B105
B105 -->|call| B120
B105 -->|after return| B106
B106 -->|call| B120
B106 -->|after return| B107
B107 -->|call| B120
B107 -->|after return| B108
B108 -->|call| B120
B108 -->|after return| B109
B109 -->|call| B120
B109 -->|after return| B110
B133["Continue at B134 in section 14"]
B120["Continue at B121 in section 13"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
PUSH 7
MOV R7,#20
```

### B102

```asm
ACALL LDELAY
```

### B103

```asm
DJNZ R7,WAIT
```

### B104

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B105

```asm
ACALL LDELAY
```

### B106

```asm
MOV A,#0011B
ACALL CMD
```

### B107

```asm
MOV A,#0011B
ACALL CMD
```

### B108

```asm
MOV A,#0010B
ACALL CMD
```

### B109

```asm
MOV A,#0010B
ACALL CMD
```

### B110

```asm
MOV A,#1000B
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 317 to 318"]
B111["B112: instructions - lines 319 to 320"]
B112["B113: instructions - lines 321 to 322"]
B113["B114: instructions - lines 323 to 324"]
B114["B115: instructions - lines 325 to 325"]
B115["B116: instructions - lines 326 to 327"]
B116["B117: instructions - lines 328 to 329"]
B117["B118: instructions - lines 330 to 331"]
B118["B119: instructions - lines 332 to 333"]
B119["B120: instructions - lines 335 to 336"]
B110 -->|call| B120
B110 -->|after return| B111
B111 -->|call| B120
B111 -->|after return| B112
B112 -->|call| B120
B112 -->|after return| B113
B113 -->|call| B120
B113 -->|after return| B114
B114 -->|call| B133
B114 -->|after return| B115
B115 -->|call| B120
B115 -->|after return| B116
B116 -->|call| B120
B116 -->|after return| B117
B117 -->|call| B120
B117 -->|after return| B118
B118 -->|call| B120
B118 -->|after return| B119
B120["Continue at B121 in section 13"]
B133["Continue at B134 in section 14"]
```

### B111

```asm
MOV A,#0000B
ACALL CMD
```

### B112

```asm
MOV A,#1000B
ACALL CMD
```

### B113

```asm
MOV A,#0
ACALL CMD
```

### B114

```asm
MOV A,#0001B
ACALL CMD
```

### B115

```asm
ACALL LDELAY
```

### B116

```asm
MOV A,#0000B
ACALL CMD
```

### B117

```asm
MOV A,#0110B
ACALL CMD
```

### B118

```asm
MOV A,#0000B
ACALL CMD
```

### B119

```asm
MOV A,#1111B
ACALL CMD
```

### B120

Return to the instruction following the active call.

```asm
POP 7
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: CMD - lines 340 to 346"]
B121["B122: instructions - lines 347 to 348"]
B122["B123: instructions - lines 350 to 352"]
B123["B124: WCHR - lines 355 to 361"]
B124["B125: instructions - lines 362 to 363"]
B125["B126: instructions - lines 365 to 367"]
B126["B127: COMMON - lines 370 to 377"]
B127["B128: instructions - lines 378 to 378"]
B128["B129: WSTR - lines 381 to 381"]
B129["B130: CONT1 - lines 383 to 385"]
B120 -->|call| B126
B120 -->|after return| B121
B121 -->|call| B126
B121 -->|after return| B122
B123 -->|call| B126
B123 -->|after return| B124
B124 -->|call| B126
B124 -->|after return| B125
B126 -->|call| B133
B126 -->|after return| B127
B128 -->|next| B129
B129 -->|condition true| B132
B129 -->|condition false| B130
B133["Continue at B134 in section 14"]
B132["Continue at B133 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B122

```asm
MOV A,B
ACALL COMMON
```

### B123

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B124

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B125

```asm
MOV A,B
ACALL COMMON
```

### B126

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B127

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

### B128

Return to the instruction following the active call.

```asm
RET
```

### B129

```asm
PUSH ACC
```

### B130

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 386 to 386"]
B131["B132: instructions - lines 387 to 388"]
B132["B133: EXIT1 - lines 390 to 391"]
B133["B134: LDELAY - lines 394 to 396"]
B134["B135: CON4 - lines 398 to 399"]
B135["B136: instructions - lines 400 to 400"]
B136["B137: instructions - lines 401 to 403"]
B137["B138: CLEAR - lines 407 to 408"]
B138["B139: instructions - lines 409 to 409"]
B139["B140: WAITT - lines 410 to 410"]
B130 -->|call| B123
B130 -->|after return| B131
B131 -->|jump| B129
B133 -->|next| B134
B134 -->|condition true| B134
B134 -->|condition false| B135
B135 -->|condition true| B134
B135 -->|condition false| B136
B137 -->|call| B120
B137 -->|after return| B138
B138 -->|next| B139
B139 -->|call| B133
B139 -->|after return| B140
B123["Continue at B124 in section 13"]
B129["Continue at B130 in section 13"]
B120["Continue at B121 in section 13"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL WCHR
```

### B132

```asm
INC DPTR
AJMP CONT1
```

### B133

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B134

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B135

```asm
MOV R0,#250
DJNZ R0,$
```

### B136

```asm
DJNZ R1,CON4
```

### B137

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B138

```asm
MOV A,#01H
ACALL CMD
```

### B139

```asm
MOV R7,#17
```

### B140

```asm
ACALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 411 to 411"]
B141["B142: instructions - lines 412 to 412"]
B140 -->|condition true| B139
B140 -->|condition false| B141
B139["Continue at B140 in section 14"]
```

### B141

```asm
DJNZ R7,WAITT
```

### B142

Return to the instruction following the active call.

```asm
RET
```
