# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 9 to 9"]
B1["B2: instructions - lines 10 to 10"]
B2["B3: instructions - lines 11 to 11"]
B3["B4: instructions - lines 13 to 18"]
B4["B5: NEXT - lines 21 to 21"]
B5["B6: instructions - lines 22 to 25"]
B6["B7: instructions - lines 27 to 27"]
B7["B8: SMALLER - lines 30 to 34"]
B8["B9: DURAT - lines 37 to 38"]
B9["B10: instructions - lines 39 to 39"]
B0 -->|call| B59
B0 -->|after return| B1
B1 -->|call| B22
B1 -->|after return| B2
B2 -->|call| B38
B2 -->|after return| B3
B3 -->|condition true| B4
B3 -->|condition false| B4
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|jump| B8
B6 -->|jump| B21
B7 -->|next| B8
B8 -->|call| B69
B8 -->|after return| B9
B9 -->|call| B56
B9 -->|after return| B10
B59["Continue at B60 in section 6"]
B22["Continue at B23 in section 3"]
B38["Continue at B39 in section 4"]
B21["Continue at B22 in section 3"]
B69["Continue at B70 in section 7"]
B56["Continue at B57 in section 6"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
ACALL FIRSTNUMBER
```

### B3

```asm
ACALL SECNUMBER
```

### B4

```asm
MOV A,30H
SUBB A,20H
MOV 40H,A
MOV A,31H
CJNE A,21H,NEXT
```

### B5

```asm
JC SMALLER
```

### B6

```asm
MOV A,31H
SUBB A,21H
MOV 41H,A
SJMP DURAT
```

### B7

```asm
SJMP EEND
```

### B8

```asm
DEC 40H
MOV A,31H
ADD A,#60
SUBB A,21H
MOV 41H,A
```

### B9

```asm
MOV A,#01H
ACALL CMD
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 40 to 40"]
B11["B12: instructions - lines 41 to 42"]
B12["B13: instructions - lines 43 to 44"]
B13["B14: instructions - lines 45 to 46"]
B14["B15: instructions - lines 48 to 49"]
B15["B16: instructions - lines 50 to 51"]
B16["B17: instructions - lines 52 to 53"]
B17["B18: instructions - lines 54 to 55"]
B18["B19: instructions - lines 57 to 58"]
B19["B20: instructions - lines 59 to 60"]
B10 -->|call| B56
B10 -->|after return| B11
B11 -->|call| B69
B11 -->|after return| B12
B12 -->|call| B75
B12 -->|after return| B13
B13 -->|call| B69
B13 -->|after return| B14
B14 -->|call| B55
B14 -->|after return| B15
B15 -->|call| B64
B15 -->|after return| B16
B16 -->|call| B64
B16 -->|after return| B17
B17 -->|call| B64
B17 -->|after return| B18
B18 -->|call| B55
B18 -->|after return| B19
B19 -->|call| B64
B19 -->|after return| B20
B56["Continue at B57 in section 6"]
B69["Continue at B70 in section 7"]
B75["Continue at B76 in section 8"]
B55["Continue at B56 in section 6"]
B64["Continue at B65 in section 7"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
MOV A,#80H
ACALL CMD
```

### B13

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B14

```asm
MOV A,#0C0H
ACALL CMD
```

### B15

```asm
MOV R4,40H
ACALL CONV
```

### B16

```asm
MOV A,12H
ACALL WCHR
```

### B17

```asm
MOV A,13H
ACALL WCHR
```

### B18

```asm
MOV A,#'/'
ACALL WCHR
```

### B19

```asm
MOV R4,41H
ACALL CONV
```

### B20

```asm
MOV A,12H
ACALL WCHR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 61 to 62"]
B21["B22: EEND - lines 67 to 67"]
B22["B23: FIRSTNUMBER - lines 70 to 71"]
B23["B24: instructions - lines 72 to 72"]
B24["B25: instructions - lines 73 to 73"]
B25["B26: instructions - lines 74 to 75"]
B26["B27: instructions - lines 76 to 77"]
B27["B28: instructions - lines 78 to 79"]
B28["B29: instructions - lines 80 to 80"]
B29["B30: instructions - lines 81 to 81"]
B20 -->|call| B64
B20 -->|after return| B21
B21 -->|jump| B21
B22 -->|call| B69
B22 -->|after return| B23
B23 -->|call| B56
B23 -->|after return| B24
B24 -->|call| B56
B24 -->|after return| B25
B25 -->|call| B69
B25 -->|after return| B26
B26 -->|call| B75
B26 -->|after return| B27
B27 -->|call| B69
B27 -->|after return| B28
B28 -->|call| B80
B28 -->|after return| B29
B29 -->|call| B64
B29 -->|after return| B30
B64["Continue at B65 in section 7"]
B69["Continue at B70 in section 7"]
B56["Continue at B57 in section 6"]
B75["Continue at B76 in section 8"]
B80["Continue at B81 in section 9"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,13H
ACALL WCHR
```

### B22

```asm
SJMP EEND
```

### B23

```asm
MOV A,#01H
ACALL CMD
```

### B24

```asm
ACALL DELAY
```

### B25

```asm
ACALL DELAY
```

### B26

```asm
MOV A,#80H
ACALL CMD
```

### B27

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B28

```asm
MOV A,#0C0H
ACALL CMD
```

### B29

```asm
ACALL KEYPAD
```

### B30

```asm
ACALL WCHR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 82 to 84"]
B31["B32: instructions - lines 85 to 85"]
B32["B33: instructions - lines 86 to 88"]
B33["B34: instructions - lines 89 to 89"]
B34["B35: instructions - lines 90 to 92"]
B35["B36: instructions - lines 93 to 93"]
B36["B37: instructions - lines 94 to 97"]
B37["B38: instructions - lines 98 to 100"]
B38["B39: SECNUMBER - lines 103 to 104"]
B39["B40: instructions - lines 105 to 105"]
B30 -->|call| B80
B30 -->|after return| B31
B31 -->|call| B64
B31 -->|after return| B32
B32 -->|call| B80
B32 -->|after return| B33
B33 -->|call| B64
B33 -->|after return| B34
B34 -->|call| B80
B34 -->|after return| B35
B35 -->|call| B64
B35 -->|after return| B36
B36 -->|call| B54
B36 -->|after return| B37
B38 -->|call| B69
B38 -->|after return| B39
B39 -->|call| B56
B39 -->|after return| B40
B80["Continue at B81 in section 9"]
B64["Continue at B65 in section 7"]
B54["Continue at B55 in section 6"]
B69["Continue at B70 in section 7"]
B56["Continue at B57 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
SUBB A,#30H
MOV 50H,A
ACALL KEYPAD
```

### B32

```asm
ACALL WCHR
```

### B33

```asm
SUBB A,#30H
MOV 51H,A
ACALL KEYPAD
```

### B34

```asm
ACALL WCHR
```

### B35

```asm
SUBB A,#30H
MOV 52H,A
ACALL KEYPAD
```

### B36

```asm
ACALL WCHR
```

### B37

```asm
SUBB A,#30H
MOV 53H,A
ACALL INCONV
```

### B38

Return to the instruction following the active call.

```asm
MOV 30H,65H
MOV 31H,66H
RET
```

### B39

```asm
MOV A,#01H
ACALL CMD
```

### B40

```asm
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 106 to 106"]
B41["B42: instructions - lines 107 to 108"]
B42["B43: instructions - lines 109 to 110"]
B43["B44: instructions - lines 111 to 112"]
B44["B45: instructions - lines 113 to 113"]
B45["B46: instructions - lines 114 to 114"]
B46["B47: instructions - lines 115 to 117"]
B47["B48: instructions - lines 118 to 118"]
B48["B49: instructions - lines 119 to 121"]
B49["B50: instructions - lines 122 to 122"]
B40 -->|call| B56
B40 -->|after return| B41
B41 -->|call| B69
B41 -->|after return| B42
B42 -->|call| B75
B42 -->|after return| B43
B43 -->|call| B69
B43 -->|after return| B44
B44 -->|call| B80
B44 -->|after return| B45
B45 -->|call| B64
B45 -->|after return| B46
B46 -->|call| B80
B46 -->|after return| B47
B47 -->|call| B64
B47 -->|after return| B48
B48 -->|call| B80
B48 -->|after return| B49
B49 -->|call| B64
B49 -->|after return| B50
B56["Continue at B57 in section 6"]
B69["Continue at B70 in section 7"]
B75["Continue at B76 in section 8"]
B80["Continue at B81 in section 9"]
B64["Continue at B65 in section 7"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL DELAY
```

### B42

```asm
MOV A,#80H
ACALL CMD
```

### B43

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B44

```asm
MOV A,#0C0H
ACALL CMD
```

### B45

```asm
ACALL KEYPAD
```

### B46

```asm
ACALL WCHR
```

### B47

```asm
SUBB A,#30H
MOV 50H,A
ACALL KEYPAD
```

### B48

```asm
ACALL WCHR
```

### B49

```asm
SUBB A,#30H
MOV 51H,A
ACALL KEYPAD
```

### B50

```asm
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 123 to 125"]
B51["B52: instructions - lines 126 to 126"]
B52["B53: instructions - lines 127 to 130"]
B53["B54: instructions - lines 131 to 133"]
B54["B55: INCONV - lines 136 to 158"]
B55["B56: CONV - lines 161 to 169"]
B56["B57: DELAY - lines 172 to 172"]
B57["B58: HH - lines 173 to 173"]
B58["B59: instructions - lines 174 to 174"]
B59["B60: INLCD - lines 178 to 186"]
B50 -->|call| B80
B50 -->|after return| B51
B51 -->|call| B64
B51 -->|after return| B52
B52 -->|call| B54
B52 -->|after return| B53
B56 -->|next| B57
B57 -->|condition true| B57
B57 -->|condition false| B58
B59 -->|call| B56
B59 -->|after return| B60
B80["Continue at B81 in section 9"]
B64["Continue at B65 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
SUBB A,#30H
MOV 52H,A
ACALL KEYPAD
```

### B52

```asm
ACALL WCHR
```

### B53

```asm
SUBB A,#30H
MOV 53H,A
ACALL INCONV
```

### B54

Return to the instruction following the active call.

```asm
MOV 20H,65H
MOV 21H,66H
RET
```

### B55

Return to the instruction following the active call.

```asm
MOV A,50H
MOV 60H,A
MOV A,51H
MOV 61H,A
MOV B,#10
MOV A,60H
MUL AB
ADD A,61H
MOV 65H,A
MOV A,52H
MOV 60H,A
MOV A,53H
MOV 61H,A
MOV B,#10
MOV A,60H
MUL AB
ADD A,61H
MOV 66H,A
RET
```

### B56

Return to the instruction following the active call.

```asm
MOV B,#10
MOV A,R4
DIV AB
ADD A,#30H
MOV 12H,A
MOV A,B
ADD A,#30H
MOV 13H,A
RET
```

### B57

```asm
MOV R0, #250
```

### B58

```asm
DJNZ R0, HH
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL DELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 188 to 197"]
B61["B62: instructions - lines 199 to 214"]
B62["B63: instructions - lines 216 to 228"]
B63["B64: instructions - lines 229 to 229"]
B64["B65: WCHR - lines 234 to 238"]
B65["B66: instructions - lines 239 to 239"]
B66["B67: instructions - lines 240 to 242"]
B67["B68: instructions - lines 243 to 243"]
B68["B69: instructions - lines 244 to 246"]
B69["B70: CMD - lines 249 to 251"]
B60 -->|call| B56
B60 -->|after return| B61
B61 -->|call| B56
B61 -->|after return| B62
B62 -->|call| B56
B62 -->|after return| B63
B64 -->|call| B74
B64 -->|after return| B65
B65 -->|call| B56
B65 -->|after return| B66
B66 -->|call| B74
B66 -->|after return| B67
B67 -->|call| B56
B67 -->|after return| B68
B69 -->|call| B74
B69 -->|after return| B70
B56["Continue at B57 in section 6"]
B74["Continue at B75 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SETB P1.2
CLR P1.2
SETB P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL DELAY
```

### B62

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
ACALL DELAY
```

### B63

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
ACALL DELAY
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B68

```asm
ACALL DELAY
```

### B69

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B70

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 252 to 252"]
B71["B72: instructions - lines 253 to 255"]
B72["B73: instructions - lines 256 to 256"]
B73["B74: instructions - lines 257 to 257"]
B74["B75: COMMON - lines 261 to 266"]
B75["B76: WSTR - lines 270 to 270"]
B76["B77: CONT1 - lines 272 to 274"]
B77["B78: PRINT - lines 276 to 276"]
B78["B79: instructions - lines 277 to 278"]
B79["B80: EXIT1 - lines 279 to 280"]
B70 -->|call| B56
B70 -->|after return| B71
B71 -->|call| B74
B71 -->|after return| B72
B72 -->|call| B56
B72 -->|after return| B73
B75 -->|next| B76
B76 -->|condition true| B79
B76 -->|condition false| B77
B77 -->|call| B64
B77 -->|after return| B78
B78 -->|jump| B76
B56["Continue at B57 in section 6"]
B64["Continue at B65 in section 7"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B73

```asm
ACALL DELAY
```

### B74

Return to the instruction following the active call.

```asm
RET
```

### B75

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B76

```asm
PUSH    ACC
```

### B77

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B78

```asm
ACALL    WCHR
```

### B79

```asm
INC DPTR
AJMP    CONT1
```

### B80

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: KEYPAD - lines 284 to 284"]
B81["B82: K1 - lines 285 to 288"]
B82["B83: K2 - lines 290 to 292"]
B83["B84: instructions - lines 293 to 293"]
B84["B85: OVER1 - lines 295 to 298"]
B85["B86: instructions - lines 299 to 302"]
B86["B87: instructions - lines 303 to 306"]
B87["B88: instructions - lines 307 to 310"]
B88["B89: instructions - lines 311 to 311"]
B89["B90: ROW_0 - lines 312 to 313"]
B80 -->|next| B81
B81 -->|condition true| B81
B81 -->|condition false| B82
B82 -->|condition true| B84
B82 -->|condition false| B83
B83 -->|jump| B82
B84 -->|condition true| B89
B84 -->|condition false| B85
B85 -->|condition true| B90
B85 -->|condition false| B86
B86 -->|condition true| B91
B86 -->|condition false| B87
B87 -->|condition true| B92
B87 -->|condition false| B88
B88 -->|jump| B82
B89 -->|jump| B93
B90["Continue at B91 in section 10"]
B91["Continue at B92 in section 10"]
B92["Continue at B93 in section 10"]
B93["Continue at B94 in section 10"]
```

### B81

```asm
MOV P0,#01110000B
```

### B82

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B83

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B84

```asm
SJMP K2
```

### B85

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B86

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B87

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B88

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B89

```asm
LJMP K2
```

### B90

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 10

```mermaid
flowchart TD
B90["B91: ROW_1 - lines 314 to 315"]
B91["B92: ROW_2 - lines 316 to 317"]
B92["B93: ROW_3 - lines 318 to 318"]
B93["B94: FIND - lines 320 to 320"]
B94["B95: FIND1 - lines 322 to 323"]
B95["B96: instructions - lines 324 to 325"]
B96["B97: MATCH - lines 326 to 328"]
B97["B98: instructions - lines 345 to 345"]
B90 -->|jump| B93
B91 -->|jump| B93
B92 -->|next| B93
B93 -->|next| B94
B94 -->|condition true| B96
B94 -->|condition false| B95
B95 -->|jump| B94
```

### B91

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B92

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B93

```asm
MOV DPTR,#KCODE3
```

### B94

```asm
RLC A
```

### B95

```asm
RLC A
JNC MATCH
```

### B96

```asm
INC DPTR
SJMP FIND1
```

### B97

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B98

Return to the instruction following the active call.

```asm
RET
```
