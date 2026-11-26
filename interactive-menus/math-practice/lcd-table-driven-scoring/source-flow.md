# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 4"]
B1["B2: instructions - lines 6 to 9"]
B2["B3: instructions - lines 10 to 11"]
B3["B4: AGAIN - lines 13 to 45"]
B4["B5: USER - lines 48 to 48"]
B5["B6: instructions - lines 49 to 50"]
B6["B7: instructions - lines 53 to 54"]
B7["B8: instructions - lines 55 to 58"]
B8["B9: instructions - lines 59 to 63"]
B9["B10: instructions - lines 64 to 64"]
B0 -->|call| B94
B0 -->|after return| B1
B1 -->|call| B26
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|next| B4
B4 -->|call| B32
B4 -->|after return| B5
B5 -->|condition true| B10
B5 -->|condition false| B6
B6 -->|call| B40
B6 -->|after return| B7
B7 -->|condition true| B21
B7 -->|condition false| B8
B8 -->|call| B49
B8 -->|after return| B9
B9 -->|jump| B3
B94["Continue at B95 in section 10"]
B26["Continue at B27 in section 3"]
B32["Continue at B33 in section 4"]
B10["Continue at B11 in section 2"]
B40["Continue at B41 in section 5"]
B21["Continue at B22 in section 3"]
B49["Continue at B50 in section 5"]
```

### B1

```asm
acall inlcd
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
B10["B11: NPL - lines 67 to 67"]
B11["B12: instructions - lines 71 to 72"]
B12["B13: instructions - lines 73 to 76"]
B13["B14: instructions - lines 77 to 82"]
B14["B15: NMS - lines 86 to 86"]
B15["B16: instructions - lines 89 to 90"]
B16["B17: instructions - lines 92 to 95"]
B17["B18: instructions - lines 96 to 101"]
B18["B19: DVS - lines 107 to 108"]
B19["B20: instructions - lines 110 to 113"]
B10 -->|condition true| B14
B10 -->|condition false| B11
B11 -->|call| B40
B11 -->|after return| B12
B12 -->|condition true| B21
B12 -->|condition false| B13
B13 -->|jump| B3
B14 -->|condition true| B18
B14 -->|condition false| B15
B15 -->|call| B40
B15 -->|after return| B16
B16 -->|condition true| B21
B16 -->|condition false| B17
B17 -->|jump| B3
B18 -->|call| B40
B18 -->|after return| B19
B19 -->|condition true| B21
B19 -->|condition false| B20
B40["Continue at B41 in section 5"]
B21["Continue at B22 in section 3"]
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
SJMP AGAIN
```

### B15

```asm
CJNE R1,#'*',DVS
```

### B16

```asm
MOV	37H,#12
ACALL ANS
```

### B17

```asm
MOV	32H,R5
MOV	A,32H
MOV	B,37H
CJNE A,B,WRONG
```

### B18

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
INC	34H
SJMP AGAIN
```

### B19

```asm
MOV	37H,#6
ACALL ANS
```

### B20

```asm
MOV	33H,R5
MOV	A,33H
MOV	B,37H
CJNE A,B,WRONG
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 114 to 118"]
B21["B22: WRONG - lines 121 to 121"]
B22["B23: instructions - lines 122 to 124"]
B23["B24: STOP - lines 128 to 128"]
B24["B25: instructions - lines 129 to 129"]
B25["B26: instructions - lines 130 to 130"]
B26["B27: WELCOME - lines 134 to 135"]
B27["B28: instructions - lines 136 to 137"]
B28["B29: instructions - lines 139 to 140"]
B29["B30: instructions - lines 141 to 142"]
B20 -->|jump| B23
B21 -->|call| B45
B21 -->|after return| B22
B22 -->|jump| B4
B23 -->|call| B60
B23 -->|after return| B24
B24 -->|call| B70
B24 -->|after return| B25
B25 -->|jump| B25
B26 -->|call| B88
B26 -->|after return| B27
B27 -->|call| B106
B27 -->|after return| B28
B28 -->|call| B88
B28 -->|after return| B29
B29 -->|call| B106
B29 -->|after return| B30
B45["Continue at B46 in section 5"]
B4["Continue at B5 in section 1"]
B60["Continue at B61 in section 7"]
B70["Continue at B71 in section 8"]
B88["Continue at B89 in section 9"]
B106["Continue at B107 in section 11"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV	A,35H
ADD	A,R6
MOV	35H,A
SJMP STOP
```

### B22

```asm
ACALL WRONGG
```

### B23

```asm
INC	36H
DEC	35H
SJMP USER
```

### B24

```asm
ACALL SCORE
```

### B25

```asm
ACALL BYE
```

### B26

```asm
SJMP $
```

### B27

```asm
mov a, #80H
acall cmd
```

### B28

```asm
mov dptr, #str1
acall wstr
```

### B29

```asm
mov a,#0c0h
acall cmd
```

### B30

```asm
mov dptr, #str2
acall wstr
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 143 to 143"]
B31["B32: instructions - lines 144 to 144"]
B32["B33: QUESTION - lines 147 to 147"]
B33["B34: instructions - lines 148 to 148"]
B34["B35: instructions - lines 149 to 150"]
B35["B36: instructions - lines 151 to 155"]
B36["B37: instructions - lines 156 to 158"]
B37["B38: instructions - lines 161 to 163"]
B38["B39: instructions - lines 164 to 166"]
B39["B40: instructions - lines 167 to 167"]
B30 -->|call| B78
B30 -->|after return| B31
B32 -->|call| B78
B32 -->|after return| B33
B33 -->|call| B101
B33 -->|after return| B34
B34 -->|call| B88
B34 -->|after return| B35
B35 -->|call| B83
B35 -->|after return| B36
B36 -->|call| B83
B36 -->|after return| B37
B37 -->|call| B83
B37 -->|after return| B38
B38 -->|call| B83
B38 -->|after return| B39
B78["Continue at B79 in section 8"]
B101["Continue at B102 in section 11"]
B88["Continue at B89 in section 9"]
B83["Continue at B84 in section 9"]
```

### B31

```asm
acall delay
```

### B32

Return to the instruction following the active call.

```asm
ret
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
ACALL CLEAR
```

### B35

```asm
mov a, #80H
acall cmd
```

### B36

```asm
mov A,R3
MOV B,#10
DIV AB
ADD A,#30H
Acall WCHR
```

### B37

```asm
MOV A,B
ADD A,#30H
Acall WCHR
```

### B38

```asm
MOV R1,77H
mov A,R1
Acall WCHR
```

### B39

```asm
mov A,R4
ADD A,#30H
Acall WCHR
```

### B40

Return to the instruction following the active call.

```asm
ret
```

## Section 5

```mermaid
flowchart TD
B40["B41: ANS - lines 170 to 171"]
B41["B42: instructions - lines 172 to 176"]
B42["B43: instructions - lines 177 to 179"]
B43["B44: instructions - lines 180 to 180"]
B44["B45: instructions - lines 181 to 181"]
B45["B46: WRONGG - lines 184 to 185"]
B46["B47: instructions - lines 186 to 187"]
B47["B48: instructions - lines 188 to 188"]
B48["B49: instructions - lines 189 to 189"]
B49["B50: RIGHT - lines 193 to 193"]
B40 -->|call| B88
B40 -->|after return| B41
B41 -->|call| B83
B41 -->|after return| B42
B42 -->|call| B83
B42 -->|after return| B43
B43 -->|call| B78
B43 -->|after return| B44
B45 -->|call| B88
B45 -->|after return| B46
B46 -->|call| B106
B46 -->|after return| B47
B47 -->|call| B78
B47 -->|after return| B48
B49 -->|call| B101
B49 -->|after return| B50
B88["Continue at B89 in section 9"]
B83["Continue at B84 in section 9"]
B78["Continue at B79 in section 8"]
B106["Continue at B107 in section 11"]
B101["Continue at B102 in section 11"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov a,#0c0h
ACALL CMD
```

### B42

```asm
mov A,37H
MOV B,#10
DIV AB
ADD A,#30H
Acall WCHR
```

### B43

```asm
MOV A,B
ADD A,#30H
Acall WCHR
```

### B44

```asm
acall delay
```

### B45

Return to the instruction following the active call.

```asm
RET
```

### B46

```asm
mov a,#0C0h
acall cmd
```

### B47

```asm
mov dptr, #WRONGGG
acall wstr
```

### B48

```asm
acall delay
```

### B49

Return to the instruction following the active call.

```asm
ret
```

### B50

```asm
ACALL CLEAR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 194 to 194"]
B51["B52: instructions - lines 195 to 196"]
B52["B53: instructions - lines 197 to 198"]
B53["B54: instructions - lines 199 to 200"]
B54["B55: instructions - lines 201 to 202"]
B55["B56: instructions - lines 203 to 205"]
B56["B57: instructions - lines 206 to 206"]
B57["B58: instructions - lines 207 to 207"]
B58["B59: instructions - lines 208 to 208"]
B59["B60: instructions - lines 209 to 209"]
B50 -->|call| B78
B50 -->|after return| B51
B51 -->|call| B88
B51 -->|after return| B52
B52 -->|call| B106
B52 -->|after return| B53
B53 -->|call| B88
B53 -->|after return| B54
B54 -->|call| B106
B54 -->|after return| B55
B55 -->|call| B83
B55 -->|after return| B56
B56 -->|call| B78
B56 -->|after return| B57
B57 -->|call| B101
B57 -->|after return| B58
B58 -->|call| B78
B58 -->|after return| B59
B78["Continue at B79 in section 8"]
B88["Continue at B89 in section 9"]
B106["Continue at B107 in section 11"]
B83["Continue at B84 in section 9"]
B101["Continue at B102 in section 11"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
mov a, #80H
acall cmd
```

### B53

```asm
mov dptr, #correctt
acall wstr
```

### B54

```asm
mov a,#0c0h
acall cmd
```

### B55

```asm
mov dptr, #scoree
acall wstr
```

### B56

```asm
mov A,35H
ADD A,#30H
Acall WCHR
```

### B57

```asm
ACALL DELAY
```

### B58

```asm
ACALL CLEAR
```

### B59

```asm
ACALL DELAY
```

### B60

Return to the instruction following the active call.

```asm
ret
```

## Section 7

```mermaid
flowchart TD
B60["B61: SCORE - lines 212 to 213"]
B61["B62: instructions - lines 214 to 215"]
B62["B63: instructions - lines 216 to 220"]
B63["B64: instructions - lines 221 to 223"]
B64["B65: instructions - lines 225 to 225"]
B65["B66: instructions - lines 226 to 227"]
B66["B67: instructions - lines 228 to 229"]
B67["B68: instructions - lines 230 to 232"]
B68["B69: instructions - lines 233 to 233"]
B69["B70: instructions - lines 234 to 234"]
B60 -->|call| B88
B60 -->|after return| B61
B61 -->|call| B106
B61 -->|after return| B62
B62 -->|call| B83
B62 -->|after return| B63
B63 -->|call| B83
B63 -->|after return| B64
B64 -->|call| B78
B64 -->|after return| B65
B65 -->|call| B88
B65 -->|after return| B66
B66 -->|call| B106
B66 -->|after return| B67
B67 -->|call| B83
B67 -->|after return| B68
B68 -->|call| B78
B68 -->|after return| B69
B88["Continue at B89 in section 9"]
B106["Continue at B107 in section 11"]
B83["Continue at B84 in section 9"]
B78["Continue at B79 in section 8"]
```

### B61

```asm
mov a, #80H
acall cmd
```

### B62

```asm
mov dptr, #SCOREE
acall wstr
```

### B63

```asm
mov A,35H
MOV B,#10
DIV AB
ADD A,#30H
Acall WCHR
```

### B64

```asm
MOV A,B
ADD A,#30H
Acall WCHR
```

### B65

```asm
acall delay
```

### B66

```asm
mov a,#0c0h
acall cmd
```

### B67

```asm
mov dptr, #FAIL
acall wstr
```

### B68

```asm
mov A,36H
ADD A,#30H
Acall WCHR
```

### B69

```asm
ACALL DELAY
```

### B70

Return to the instruction following the active call.

```asm
ret
```

## Section 8

```mermaid
flowchart TD
B70["B71: BYE - lines 237 to 237"]
B71["B72: instructions - lines 238 to 238"]
B72["B73: instructions - lines 239 to 240"]
B73["B74: instructions - lines 241 to 242"]
B74["B75: instructions - lines 244 to 245"]
B75["B76: instructions - lines 246 to 247"]
B76["B77: instructions - lines 248 to 248"]
B77["B78: instructions - lines 249 to 249"]
B78["B79: DELAY - lines 253 to 253"]
B79["B80: HE2 - lines 254 to 254"]
B70 -->|call| B101
B70 -->|after return| B71
B71 -->|call| B78
B71 -->|after return| B72
B72 -->|call| B88
B72 -->|after return| B73
B73 -->|call| B106
B73 -->|after return| B74
B74 -->|call| B88
B74 -->|after return| B75
B75 -->|call| B106
B75 -->|after return| B76
B76 -->|call| B78
B76 -->|after return| B77
B78 -->|next| B79
B79 -->|next| B80
B101["Continue at B102 in section 11"]
B88["Continue at B89 in section 9"]
B106["Continue at B107 in section 11"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL CLEAR
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
mov a, #80H
acall cmd
```

### B74

```asm
mov dptr, #OVERR
acall wstr
```

### B75

```asm
mov a,#0c0h
acall cmd
```

### B76

```asm
mov dptr, #THANKS
acall wstr
```

### B77

```asm
acall delay
```

### B78

Return to the instruction following the active call.

```asm
RET
```

### B79

```asm
MOV R1,#100
```

### B80

```asm
MOV R0,#10
```

## Section 9

```mermaid
flowchart TD
B80["B81: HE - lines 255 to 255"]
B81["B82: instructions - lines 256 to 256"]
B82["B83: instructions - lines 257 to 257"]
B83["B84: WCHR - lines 261 to 265"]
B84["B85: instructions - lines 266 to 266"]
B85["B86: instructions - lines 267 to 269"]
B86["B87: instructions - lines 270 to 270"]
B87["B88: instructions - lines 271 to 273"]
B88["B89: CMD - lines 276 to 278"]
B89["B90: instructions - lines 279 to 279"]
B80 -->|condition true| B80
B80 -->|condition false| B81
B81 -->|condition true| B79
B81 -->|condition false| B82
B83 -->|call| B93
B83 -->|after return| B84
B84 -->|call| B99
B84 -->|after return| B85
B85 -->|call| B93
B85 -->|after return| B86
B86 -->|call| B99
B86 -->|after return| B87
B88 -->|call| B93
B88 -->|after return| B89
B89 -->|call| B99
B89 -->|after return| B90
B79["Continue at B80 in section 8"]
B93["Continue at B94 in section 10"]
B99["Continue at B100 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
DJNZ R0,he
```

### B82

```asm
djnz r1,he2
```

### B83

Return to the instruction following the active call.

```asm
RET
```

### B84

```asm
PUSH ACC
PUSH B
SETB P1.3
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
POP B
POP ACC
RET
```

### B89

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B90

```asm
ACALL LDELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 280 to 282"]
B91["B92: instructions - lines 283 to 283"]
B92["B93: instructions - lines 284 to 284"]
B93["B94: COMMON - lines 287 to 292"]
B94["B95: INLCD - lines 295 to 302"]
B95["B96: instructions - lines 303 to 311"]
B96["B97: instructions - lines 312 to 324"]
B97["B98: instructions - lines 325 to 335"]
B98["B99: instructions - lines 336 to 336"]
B99["B100: LDELAY - lines 339 to 340"]
B90 -->|call| B93
B90 -->|after return| B91
B91 -->|call| B99
B91 -->|after return| B92
B94 -->|call| B99
B94 -->|after return| B95
B95 -->|call| B99
B95 -->|after return| B96
B96 -->|call| B99
B96 -->|after return| B97
B97 -->|call| B99
B97 -->|after return| B98
B99 -->|condition true| B99
B99 -->|condition false| B100
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B92

```asm
ACALL LDELAY
```

### B93

Return to the instruction following the active call.

```asm
RET
```

### B94

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B95

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

### B96

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

### B97

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

### B98

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

### B99

Return to the instruction following the active call.

```asm
RET
```

### B100

```asm
MOV R0, #50
DJNZ R0, $
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 341 to 341"]
B101["B102: CLEAR - lines 344 to 345"]
B102["B103: instructions - lines 346 to 346"]
B103["B104: WAIT - lines 347 to 347"]
B104["B105: instructions - lines 348 to 348"]
B105["B106: instructions - lines 349 to 349"]
B106["B107: WSTR - lines 352 to 352"]
B107["B108: CONT1 - lines 354 to 356"]
B108["B109: PRINT - lines 358 to 358"]
B109["B110: instructions - lines 359 to 360"]
B101 -->|call| B88
B101 -->|after return| B102
B102 -->|next| B103
B103 -->|call| B99
B103 -->|after return| B104
B104 -->|condition true| B103
B104 -->|condition false| B105
B106 -->|next| B107
B107 -->|condition true| B110
B107 -->|condition false| B108
B108 -->|call| B83
B108 -->|after return| B109
B109 -->|jump| B107
B88["Continue at B89 in section 9"]
B99["Continue at B100 in section 10"]
B110["Continue at B111 in section 12"]
B83["Continue at B84 in section 9"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
MOV A,#01H
ACALL CMD
```

### B103

```asm
MOV R7,#14
```

### B104

```asm
ACALL LDELAY
```

### B105

```asm
DJNZ R7,WAIT
```

### B106

Return to the instruction following the active call.

```asm
ret
```

### B107

```asm
PUSH    ACC
```

### B108

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B109

```asm
ACALL    WCHR
```

### B110

```asm
INC DPTR
AJMP    CONT1
```

## Section 12

```mermaid
flowchart TD
B110["B111: EXIT1 - lines 361 to 362"]
```

### B111

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
