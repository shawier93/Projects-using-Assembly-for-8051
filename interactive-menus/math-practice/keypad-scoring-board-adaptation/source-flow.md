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
B1["B2: instructions - lines 14 to 22"]
B2["B3: instructions - lines 23 to 24"]
B3["B4: AGAIN - lines 26 to 58"]
B4["B5: USER - lines 60 to 60"]
B5["B6: instructions - lines 62 to 63"]
B6["B7: instructions - lines 66 to 66"]
B7["B8: instructions - lines 67 to 67"]
B8["B9: instructions - lines 68 to 70"]
B9["B10: instructions - lines 71 to 71"]
B0 -->|call| B120
B0 -->|after return| B1
B1 -->|call| B44
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|next| B4
B4 -->|call| B50
B4 -->|after return| B5
B5 -->|condition true| B14
B5 -->|condition false| B6
B6 -->|call| B162
B6 -->|after return| B7
B7 -->|call| B143
B7 -->|after return| B8
B8 -->|call| B115
B8 -->|after return| B9
B9 -->|call| B60
B9 -->|after return| B10
B120["Continue at B121 in section 13"]
B44["Continue at B45 in section 5"]
B50["Continue at B51 in section 6"]
B14["Continue at B15 in section 2"]
B162["Continue at B163 in section 17"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
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
MOV 30H,#7
MOV 31H,#4
MOV 32H,#12
MOV 33H,#6
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
B10["B11: instructions - lines 73 to 78"]
B11["B12: instructions - lines 79 to 83"]
B12["B13: instructions - lines 84 to 84"]
B13["B14: WWRONG - lines 86 to 86"]
B14["B15: NPL - lines 89 to 89"]
B15["B16: instructions - lines 92 to 92"]
B16["B17: instructions - lines 93 to 93"]
B17["B18: instructions - lines 94 to 96"]
B18["B19: instructions - lines 97 to 97"]
B19["B20: instructions - lines 98 to 102"]
B10 -->|condition true| B13
B10 -->|condition false| B11
B11 -->|call| B83
B11 -->|after return| B12
B12 -->|jump| B3
B13 -->|jump| B39
B14 -->|condition true| B22
B14 -->|condition false| B15
B15 -->|call| B162
B15 -->|after return| B16
B16 -->|call| B143
B16 -->|after return| B17
B17 -->|call| B115
B17 -->|after return| B18
B18 -->|call| B60
B18 -->|after return| B19
B19 -->|condition true| B39
B19 -->|condition false| B20
B83["Continue at B84 in section 9"]
B3["Continue at B4 in section 1"]
B39["Continue at B40 in section 4"]
B22["Continue at B23 in section 3"]
B162["Continue at B163 in section 17"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
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
B20["B21: instructions - lines 103 to 107"]
B21["B22: instructions - lines 108 to 108"]
B22["B23: NMS - lines 112 to 112"]
B23["B24: instructions - lines 115 to 115"]
B24["B25: instructions - lines 116 to 116"]
B25["B26: instructions - lines 117 to 121"]
B26["B27: instructions - lines 122 to 122"]
B27["B28: instructions - lines 123 to 126"]
B28["B29: instructions - lines 128 to 128"]
B29["B30: instructions - lines 130 to 137"]
B20 -->|call| B83
B20 -->|after return| B21
B21 -->|jump| B3
B22 -->|condition true| B32
B22 -->|condition false| B23
B23 -->|call| B162
B23 -->|after return| B24
B24 -->|call| B143
B24 -->|after return| B25
B25 -->|call| B162
B25 -->|after return| B26
B26 -->|call| B143
B26 -->|after return| B27
B27 -->|call| B115
B27 -->|after return| B28
B28 -->|call| B60
B28 -->|after return| B29
B29 -->|condition true| B39
B29 -->|condition false| B30
B83["Continue at B84 in section 9"]
B3["Continue at B4 in section 1"]
B32["Continue at B33 in section 4"]
B162["Continue at B163 in section 17"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
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
B30["B31: instructions - lines 138 to 142"]
B31["B32: instructions - lines 143 to 143"]
B32["B33: DVS - lines 149 to 149"]
B33["B34: instructions - lines 150 to 150"]
B34["B35: instructions - lines 151 to 153"]
B35["B36: instructions - lines 154 to 154"]
B36["B37: instructions - lines 157 to 163"]
B37["B38: instructions - lines 164 to 167"]
B38["B39: instructions - lines 168 to 168"]
B39["B40: WRONG - lines 171 to 171"]
B30 -->|call| B83
B30 -->|after return| B31
B31 -->|jump| B3
B32 -->|call| B162
B32 -->|after return| B33
B33 -->|call| B143
B33 -->|after return| B34
B34 -->|call| B115
B34 -->|after return| B35
B35 -->|call| B60
B35 -->|after return| B36
B36 -->|condition true| B39
B36 -->|condition false| B37
B37 -->|call| B83
B37 -->|after return| B38
B38 -->|jump| B41
B39 -->|call| B66
B39 -->|after return| B40
B83["Continue at B84 in section 9"]
B3["Continue at B4 in section 1"]
B162["Continue at B163 in section 17"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B60["Continue at B61 in section 7"]
B41["Continue at B42 in section 5"]
B66["Continue at B67 in section 7"]
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
MOV	B,37H L USER ANSWER
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
B40["B41: instructions - lines 172 to 174"]
B41["B42: STOP - lines 178 to 178"]
B42["B43: instructions - lines 179 to 179"]
B43["B44: instructions - lines 180 to 180"]
B44["B45: WELCOME - lines 184 to 185"]
B45["B46: instructions - lines 186 to 187"]
B46["B47: instructions - lines 189 to 190"]
B47["B48: instructions - lines 191 to 192"]
B48["B49: instructions - lines 193 to 193"]
B49["B50: instructions - lines 194 to 194"]
B40 -->|jump| B4
B41 -->|call| B97
B41 -->|after return| B42
B42 -->|call| B107
B42 -->|after return| B43
B43 -->|jump| B43
B44 -->|call| B140
B44 -->|after return| B45
B45 -->|call| B148
B45 -->|after return| B46
B46 -->|call| B140
B46 -->|after return| B47
B47 -->|call| B148
B47 -->|after return| B48
B48 -->|call| B115
B48 -->|after return| B49
B4["Continue at B5 in section 1"]
B97["Continue at B98 in section 10"]
B107["Continue at B108 in section 11"]
B140["Continue at B141 in section 15"]
B148["Continue at B149 in section 15"]
B115["Continue at B116 in section 12"]
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
MOV A,#0C0H
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
B50["B51: QUESTION - lines 197 to 197"]
B51["B52: instructions - lines 198 to 198"]
B52["B53: instructions - lines 200 to 201"]
B53["B54: instructions - lines 202 to 206"]
B54["B55: instructions - lines 207 to 209"]
B55["B56: instructions - lines 212 to 214"]
B56["B57: instructions - lines 216 to 218"]
B57["B58: instructions - lines 220 to 221"]
B58["B59: instructions - lines 222 to 223"]
B59["B60: instructions - lines 225 to 225"]
B50 -->|call| B157
B50 -->|after return| B51
B51 -->|call| B115
B51 -->|after return| B52
B52 -->|call| B140
B52 -->|after return| B53
B53 -->|call| B143
B53 -->|after return| B54
B54 -->|call| B143
B54 -->|after return| B55
B55 -->|call| B143
B55 -->|after return| B56
B56 -->|call| B143
B56 -->|after return| B57
B57 -->|call| B143
B57 -->|after return| B58
B58 -->|call| B143
B58 -->|after return| B59
B157["Continue at B158 in section 16"]
B115["Continue at B116 in section 12"]
B140["Continue at B141 in section 15"]
B143["Continue at B144 in section 15"]
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
B60["B61: ANS - lines 228 to 229"]
B61["B62: instructions - lines 230 to 234"]
B62["B63: instructions - lines 235 to 237"]
B63["B64: instructions - lines 238 to 238"]
B64["B65: instructions - lines 239 to 239"]
B65["B66: instructions - lines 240 to 240"]
B66["B67: WRONGG - lines 243 to 244"]
B67["B68: instructions - lines 245 to 246"]
B68["B69: instructions - lines 247 to 247"]
B69["B70: instructions - lines 248 to 249"]
B60 -->|call| B140
B60 -->|after return| B61
B61 -->|call| B143
B61 -->|after return| B62
B62 -->|call| B143
B62 -->|after return| B63
B63 -->|call| B115
B63 -->|after return| B64
B64 -->|call| B115
B64 -->|after return| B65
B66 -->|call| B140
B66 -->|after return| B67
B67 -->|call| B148
B67 -->|after return| B68
B68 -->|call| B115
B68 -->|after return| B69
B69 -->|next| B70
B140["Continue at B141 in section 15"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B148["Continue at B149 in section 15"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#0C0H
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

```asm
ACALL DELAY
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
MOV A,#0C0H
ACALL CMD
```

### B68

```asm
MOV DPTR, #WRONG1
ACALL WSTR
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
CLR R
MOV R7,#185
```

## Section 8

```mermaid
flowchart TD
B70["B71: X1 - lines 251 to 251"]
B71["B72: instructions - lines 252 to 252"]
B72["B73: instructions - lines 253 to 253"]
B73["B74: X2 - lines 255 to 255"]
B74["B75: instructions - lines 256 to 256"]
B75["B76: instructions - lines 257 to 258"]
B76["B77: FLASH - lines 261 to 262"]
B77["B78: Y11 - lines 264 to 264"]
B78["B79: instructions - lines 265 to 265"]
B79["B80: instructions - lines 267 to 267"]
B70 -->|call| B153
B70 -->|after return| B71
B71 -->|condition true| B70
B71 -->|condition false| B72
B72 -->|next| B73
B73 -->|call| B153
B73 -->|after return| B74
B74 -->|condition true| B73
B74 -->|condition false| B75
B76 -->|next| B77
B77 -->|call| B153
B77 -->|after return| B78
B78 -->|condition true| B77
B78 -->|condition false| B79
B79 -->|next| B80
B153["Continue at B154 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL LDELAY
```

### B72

```asm
DJNZ R7,X1
```

### B73

```asm
MOV R7,#185
```

### B74

```asm
ACALL LDELAY
```

### B75

```asm
DJNZ R7,X2
```

### B76

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B77

```asm
CLR G
MOV R7,#185
```

### B78

```asm
ACALL LDELAY
```

### B79

```asm
DJNZ R7,Y11
```

### B80

```asm
MOV R7,#185
```

## Section 9

```mermaid
flowchart TD
B80["B81: Y22 - lines 269 to 269"]
B81["B82: instructions - lines 270 to 270"]
B82["B83: instructions - lines 271 to 272"]
B83["B84: RIGHT - lines 275 to 275"]
B84["B85: instructions - lines 276 to 276"]
B85["B86: instructions - lines 277 to 278"]
B86["B87: instructions - lines 279 to 280"]
B87["B88: instructions - lines 282 to 283"]
B88["B89: instructions - lines 284 to 285"]
B89["B90: instructions - lines 286 to 288"]
B80 -->|call| B153
B80 -->|after return| B81
B81 -->|condition true| B80
B81 -->|condition false| B82
B83 -->|call| B157
B83 -->|after return| B84
B84 -->|call| B115
B84 -->|after return| B85
B85 -->|call| B140
B85 -->|after return| B86
B86 -->|call| B148
B86 -->|after return| B87
B87 -->|call| B140
B87 -->|after return| B88
B88 -->|call| B148
B88 -->|after return| B89
B89 -->|call| B143
B89 -->|after return| B90
B153["Continue at B154 in section 16"]
B157["Continue at B158 in section 16"]
B115["Continue at B116 in section 12"]
B140["Continue at B141 in section 15"]
B148["Continue at B149 in section 15"]
B143["Continue at B144 in section 15"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL LDELAY
```

### B82

```asm
DJNZ R7,Y22
```

### B83

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B84

```asm
ACALL CLEAR
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
MOV A, #80H
ACALL CMD
```

### B87

```asm
MOV DPTR, #CORRECTT
ACALL WSTR
```

### B88

```asm
MOV A,#0C0H
ACALL CMD
```

### B89

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B90

```asm
MOV A,35H
ADD A,#30H
ACALL WCHR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 289 to 289"]
B91["B92: instructions - lines 290 to 290"]
B92["B93: instructions - lines 291 to 291"]
B93["B94: instructions - lines 293 to 293"]
B94["B95: instructions - lines 294 to 294"]
B95["B96: instructions - lines 295 to 295"]
B96["B97: instructions - lines 296 to 296"]
B97["B98: SCORE - lines 299 to 300"]
B98["B99: instructions - lines 301 to 302"]
B99["B100: instructions - lines 303 to 307"]
B90 -->|call| B115
B90 -->|after return| B91
B91 -->|call| B157
B91 -->|after return| B92
B92 -->|call| B115
B92 -->|after return| B93
B93 -->|call| B76
B93 -->|after return| B94
B94 -->|call| B115
B94 -->|after return| B95
B95 -->|call| B115
B95 -->|after return| B96
B97 -->|call| B140
B97 -->|after return| B98
B98 -->|call| B148
B98 -->|after return| B99
B99 -->|call| B143
B99 -->|after return| B100
B115["Continue at B116 in section 12"]
B157["Continue at B158 in section 16"]
B76["Continue at B77 in section 8"]
B140["Continue at B141 in section 15"]
B148["Continue at B149 in section 15"]
B143["Continue at B144 in section 15"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL DELAY
```

### B92

```asm
ACALL CLEAR
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
ACALL FLASH
```

### B95

```asm
ACALL DELAY
```

### B96

```asm
ACALL DELAY
```

### B97

Return to the instruction following the active call.

```asm
RET
```

### B98

```asm
MOV A, #80H
ACALL CMD
```

### B99

```asm
MOV DPTR, #SCOREE
ACALL WSTR
```

### B100

```asm
MOV A,35H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 308 to 310"]
B101["B102: instructions - lines 312 to 312"]
B102["B103: instructions - lines 313 to 314"]
B103["B104: instructions - lines 315 to 316"]
B104["B105: instructions - lines 317 to 319"]
B105["B106: instructions - lines 320 to 320"]
B106["B107: instructions - lines 321 to 321"]
B107["B108: BYE - lines 324 to 324"]
B108["B109: instructions - lines 325 to 325"]
B109["B110: instructions - lines 326 to 327"]
B100 -->|call| B143
B100 -->|after return| B101
B101 -->|call| B115
B101 -->|after return| B102
B102 -->|call| B140
B102 -->|after return| B103
B103 -->|call| B148
B103 -->|after return| B104
B104 -->|call| B143
B104 -->|after return| B105
B105 -->|call| B115
B105 -->|after return| B106
B107 -->|call| B157
B107 -->|after return| B108
B108 -->|call| B115
B108 -->|after return| B109
B109 -->|call| B140
B109 -->|after return| B110
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B140["Continue at B141 in section 15"]
B148["Continue at B149 in section 15"]
B157["Continue at B158 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
MOV A,#0C0H
ACALL CMD
```

### B104

```asm
MOV DPTR, #FAIL
ACALL WSTR
```

### B105

```asm
MOV A,36H
ADD A,#30H
ACALL WCHR
```

### B106

```asm
ACALL DELAY
```

### B107

Return to the instruction following the active call.

```asm
RET
```

### B108

```asm
ACALL CLEAR
```

### B109

```asm
ACALL DELAY
```

### B110

```asm
MOV A, #80H
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 328 to 329"]
B111["B112: instructions - lines 331 to 332"]
B112["B113: instructions - lines 333 to 334"]
B113["B114: instructions - lines 335 to 335"]
B114["B115: instructions - lines 336 to 336"]
B115["B116: DELAY - lines 340 to 340"]
B116["B117: HE2 - lines 341 to 341"]
B117["B118: HE - lines 342 to 342"]
B118["B119: instructions - lines 343 to 343"]
B119["B120: instructions - lines 344 to 344"]
B110 -->|call| B148
B110 -->|after return| B111
B111 -->|call| B140
B111 -->|after return| B112
B112 -->|call| B148
B112 -->|after return| B113
B113 -->|call| B115
B113 -->|after return| B114
B115 -->|next| B116
B116 -->|next| B117
B117 -->|condition true| B117
B117 -->|condition false| B118
B118 -->|condition true| B116
B118 -->|condition false| B119
B148["Continue at B149 in section 15"]
B140["Continue at B141 in section 15"]
```

### B111

```asm
MOV DPTR, #OVERR
ACALL WSTR
```

### B112

```asm
MOV A,#0C0H
ACALL CMD
```

### B113

```asm
MOV DPTR, #THANKS
ACALL WSTR
```

### B114

```asm
ACALL DELAY
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
MOV R1,#250
```

### B117

```asm
MOV R0,#100
```

### B118

```asm
DJNZ R0,HE
```

### B119

```asm
DJNZ R1,HE2
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: INLCD - lines 348 to 349"]
B121["B122: WAIT - lines 351 to 351"]
B122["B123: instructions - lines 352 to 352"]
B123["B124: instructions - lines 354 to 356"]
B124["B125: instructions - lines 357 to 357"]
B125["B126: instructions - lines 358 to 359"]
B126["B127: instructions - lines 360 to 361"]
B127["B128: instructions - lines 362 to 363"]
B128["B129: instructions - lines 364 to 365"]
B129["B130: instructions - lines 366 to 367"]
B120 -->|next| B121
B121 -->|call| B153
B121 -->|after return| B122
B122 -->|condition true| B121
B122 -->|condition false| B123
B123 -->|call| B140
B123 -->|after return| B124
B124 -->|call| B153
B124 -->|after return| B125
B125 -->|call| B140
B125 -->|after return| B126
B126 -->|call| B140
B126 -->|after return| B127
B127 -->|call| B140
B127 -->|after return| B128
B128 -->|call| B140
B128 -->|after return| B129
B129 -->|call| B140
B129 -->|after return| B130
B153["Continue at B154 in section 16"]
B140["Continue at B141 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
PUSH 7
MOV R7,#20
```

### B122

```asm
ACALL LDELAY
```

### B123

```asm
DJNZ R7,WAIT
```

### B124

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B125

```asm
ACALL LDELAY
```

### B126

```asm
MOV A,#0011B
ACALL CMD
```

### B127

```asm
MOV A,#0011B
ACALL CMD
```

### B128

```asm
MOV A,#0010B
ACALL CMD
```

### B129

```asm
MOV A,#0010B
ACALL CMD
```

### B130

```asm
MOV A,#1000B
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 368 to 369"]
B131["B132: instructions - lines 370 to 371"]
B132["B133: instructions - lines 372 to 373"]
B133["B134: instructions - lines 374 to 375"]
B134["B135: instructions - lines 376 to 376"]
B135["B136: instructions - lines 377 to 378"]
B136["B137: instructions - lines 379 to 380"]
B137["B138: instructions - lines 381 to 382"]
B138["B139: instructions - lines 383 to 384"]
B139["B140: instructions - lines 386 to 387"]
B130 -->|call| B140
B130 -->|after return| B131
B131 -->|call| B140
B131 -->|after return| B132
B132 -->|call| B140
B132 -->|after return| B133
B133 -->|call| B140
B133 -->|after return| B134
B134 -->|call| B153
B134 -->|after return| B135
B135 -->|call| B140
B135 -->|after return| B136
B136 -->|call| B140
B136 -->|after return| B137
B137 -->|call| B140
B137 -->|after return| B138
B138 -->|call| B140
B138 -->|after return| B139
B140["Continue at B141 in section 15"]
B153["Continue at B154 in section 16"]
```

### B131

```asm
MOV A,#0000B
ACALL CMD
```

### B132

```asm
MOV A,#1000B
ACALL CMD
```

### B133

```asm
MOV A,#0
ACALL CMD
```

### B134

```asm
MOV A,#0001B
ACALL CMD
```

### B135

```asm
ACALL LDELAY
```

### B136

```asm
MOV A,#0000B
ACALL CMD
```

### B137

```asm
MOV A,#0110B
ACALL CMD
```

### B138

```asm
MOV A,#0000B
ACALL CMD
```

### B139

```asm
MOV A,#1111B
ACALL CMD
```

### B140

Return to the instruction following the active call.

```asm
POP 7
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: CMD - lines 391 to 397"]
B141["B142: instructions - lines 398 to 399"]
B142["B143: instructions - lines 401 to 403"]
B143["B144: WCHR - lines 406 to 412"]
B144["B145: instructions - lines 413 to 414"]
B145["B146: instructions - lines 416 to 418"]
B146["B147: COMMON - lines 421 to 428"]
B147["B148: instructions - lines 429 to 429"]
B148["B149: WSTR - lines 432 to 432"]
B149["B150: CONT1 - lines 434 to 436"]
B140 -->|call| B146
B140 -->|after return| B141
B141 -->|call| B146
B141 -->|after return| B142
B143 -->|call| B146
B143 -->|after return| B144
B144 -->|call| B146
B144 -->|after return| B145
B146 -->|call| B153
B146 -->|after return| B147
B148 -->|next| B149
B149 -->|condition true| B152
B149 -->|condition false| B150
B153["Continue at B154 in section 16"]
B152["Continue at B153 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B142

```asm
MOV A,B
ACALL COMMON
```

### B143

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B144

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B145

```asm
MOV A,B
ACALL COMMON
```

### B146

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B147

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

### B148

Return to the instruction following the active call.

```asm
RET
```

### B149

```asm
PUSH ACC
```

### B150

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 437 to 437"]
B151["B152: instructions - lines 438 to 439"]
B152["B153: EXIT1 - lines 441 to 442"]
B153["B154: LDELAY - lines 445 to 447"]
B154["B155: CON4 - lines 449 to 450"]
B155["B156: instructions - lines 451 to 451"]
B156["B157: instructions - lines 452 to 454"]
B157["B158: CLEAR - lines 458 to 459"]
B158["B159: instructions - lines 460 to 460"]
B159["B160: WAITT - lines 461 to 461"]
B150 -->|call| B143
B150 -->|after return| B151
B151 -->|jump| B149
B153 -->|next| B154
B154 -->|condition true| B154
B154 -->|condition false| B155
B155 -->|condition true| B154
B155 -->|condition false| B156
B157 -->|call| B140
B157 -->|after return| B158
B158 -->|next| B159
B159 -->|call| B153
B159 -->|after return| B160
B143["Continue at B144 in section 15"]
B149["Continue at B150 in section 15"]
B140["Continue at B141 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL WCHR
```

### B152

```asm
INC DPTR
AJMP CONT1
```

### B153

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B154

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B155

```asm
MOV R0,#250
DJNZ R0,$
```

### B156

```asm
DJNZ R1,CON4
```

### B157

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B158

```asm
MOV A,#01H
ACALL CMD
```

### B159

```asm
MOV R7,#17
```

### B160

```asm
ACALL LDELAY
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 462 to 462"]
B161["B162: instructions - lines 463 to 463"]
B162["B163: KEYPAD - lines 471 to 471"]
B163["B164: K1 - lines 472 to 475"]
B164["B165: K2 - lines 476 to 476"]
B165["B166: instructions - lines 477 to 479"]
B166["B167: instructions - lines 480 to 480"]
B167["B168: OVER - lines 482 to 482"]
B168["B169: instructions - lines 483 to 485"]
B169["B170: instructions - lines 486 to 486"]
B160 -->|condition true| B159
B160 -->|condition false| B161
B162 -->|next| B163
B163 -->|condition true| B163
B163 -->|condition false| B164
B164 -->|call| B183
B164 -->|after return| B165
B165 -->|condition true| B167
B165 -->|condition false| B166
B166 -->|jump| B164
B167 -->|call| B183
B167 -->|after return| B168
B168 -->|condition true| B170
B168 -->|condition false| B169
B169 -->|jump| B164
B159["Continue at B160 in section 16"]
B183["Continue at B184 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
DJNZ R7,WAITT
```

### B162

Return to the instruction following the active call.

```asm
RET
```

### B163

```asm
MOV P2,#11110000B
```

### B164

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B165

```asm
ACALL TMSEC
```

### B166

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B167

```asm
SJMP K2
```

### B168

```asm
ACALL TMSEC
```

### B169

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B170

```asm
SJMP K2
```

## Section 18

```mermaid
flowchart TD
B170["B171: OVER1 - lines 488 to 491"]
B171["B172: instructions - lines 492 to 495"]
B172["B173: instructions - lines 496 to 499"]
B173["B174: instructions - lines 500 to 503"]
B174["B175: instructions - lines 504 to 504"]
B175["B176: ROW_0 - lines 505 to 506"]
B176["B177: ROW_1 - lines 507 to 508"]
B177["B178: ROW_2 - lines 509 to 510"]
B178["B179: ROW_3 - lines 511 to 511"]
B179["B180: FIND - lines 513 to 513"]
B170 -->|condition true| B175
B170 -->|condition false| B171
B171 -->|condition true| B176
B171 -->|condition false| B172
B172 -->|condition true| B177
B172 -->|condition false| B173
B173 -->|condition true| B178
B173 -->|condition false| B174
B174 -->|jump| B164
B175 -->|jump| B179
B176 -->|jump| B179
B177 -->|jump| B179
B178 -->|next| B179
B179 -->|next| B180
B164["Continue at B165 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B172

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B173

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B174

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B175

```asm
LJMP K2
```

### B176

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B177

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B178

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B179

```asm
MOV DPTR,#KCODE3
```

### B180

```asm
SWAP A
```

## Section 19

```mermaid
flowchart TD
B180["B181: FIND1 - lines 515 to 516"]
B181["B182: instructions - lines 517 to 518"]
B182["B183: MATCH - lines 520 to 522"]
B183["B184: TMSEC - lines 526 to 529"]
B184["B185: BACK - lines 530 to 530"]
B185["B186: instructions - lines 531 to 533"]
B180 -->|condition true| B182
B180 -->|condition false| B181
B181 -->|jump| B180
B183 -->|next| B184
B184 -->|condition true| B184
B184 -->|condition false| B185
```

### B181

```asm
RRC A
JNC MATCH
```

### B182

```asm
INC DPTR
SJMP FIND1
```

### B183

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B184

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B185

```asm
JNB TF0,BACK
```

### B186

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```
