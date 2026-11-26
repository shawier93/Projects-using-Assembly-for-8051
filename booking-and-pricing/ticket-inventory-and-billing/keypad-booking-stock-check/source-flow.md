# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 23"]
B1["B2: instructions - lines 24 to 25"]
B2["B3: instructions - lines 26 to 27"]
B3["B4: instructions - lines 28 to 28"]
B4["B5: WAIT0 - lines 30 to 30"]
B5["B6: instructions - lines 31 to 31"]
B6["B7: NEXTBOOKING - lines 34 to 34"]
B7["B8: instructions - lines 35 to 36"]
B8["B9: instructions - lines 37 to 38"]
B9["B10: instructions - lines 39 to 39"]
B0 -->|call| B66
B0 -->|after return| B1
B1 -->|call| B76
B1 -->|after return| B2
B2 -->|call| B82
B2 -->|after return| B3
B3 -->|next| B4
B4 -->|call| B89
B4 -->|after return| B5
B5 -->|condition true| B4
B5 -->|condition false| B6
B6 -->|call| B54
B6 -->|after return| B7
B7 -->|call| B76
B7 -->|after return| B8
B8 -->|call| B82
B8 -->|after return| B9
B9 -->|call| B92
B9 -->|after return| B10
B66["Continue at B67 in section 7"]
B76["Continue at B77 in section 8"]
B82["Continue at B83 in section 9"]
B89["Continue at B90 in section 9"]
B54["Continue at B55 in section 6"]
B92["Continue at B93 in section 10"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 50H,#0
MOV 31H,#0
MOV 32H,#0
MOV 41H,#0
MOV 42H,#0
MOV DPTR,#GOLD
CLR A
MOVC A,@A+DPTR
MOV 31H,A
INC DPTR
CLR A
MOVC A,@A+DPTR
MOV 32H,A
MOV DPTR,#SILVER
CLR A
MOVC A,@A+DPTR
MOV 41H,A
INC DPTR
CLR A
MOVC A,@A+DPTR
MOV 42H,A
ACALL INLCD
```

### B2

```asm
MOV A,#80H
ACALL CMD
```

### B3

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B4

```asm
MOV R7,#2
```

### B5

```asm
ACALL TMSEC
```

### B6

```asm
DJNZ R7,WAIT0
```

### B7

```asm
ACALL CLEARLCD
```

### B8

```asm
MOV A,#80H
ACALL CMD
```

### B9

```asm
MOV DPTR,#MENU1
ACALL WSTR
```

### B10

```asm
ACALL KEYPAD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 40 to 43"]
B11["B12: instructions - lines 44 to 44"]
B12["B13: CH1 - lines 46 to 46"]
B13["B14: instructions - lines 47 to 47"]
B14["B15: CH2 - lines 49 to 49"]
B15["B16: instructions - lines 50 to 50"]
B16["B17: CH3 - lines 52 to 52"]
B17["B18: instructions - lines 53 to 53"]
B18["B19: TOEXIT - lines 55 to 55"]
B19["B20: instructions - lines 56 to 57"]
B10 -->|condition true| B12
B10 -->|condition false| B11
B11 -->|jump| B22
B12 -->|condition true| B14
B12 -->|condition false| B13
B13 -->|jump| B22
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|jump| B22
B16 -->|call| B59
B16 -->|after return| B17
B17 -->|jump| B6
B18 -->|call| B54
B18 -->|after return| B19
B19 -->|call| B76
B19 -->|after return| B20
B22["Continue at B23 in section 3"]
B59["Continue at B60 in section 6"]
B6["Continue at B7 in section 1"]
B54["Continue at B55 in section 6"]
B76["Continue at B77 in section 8"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CLR C
SUBB A,#30H
MOV 30H,A
CJNE A,#1,CH1
```

### B12

```asm
SJMP CONT
```

### B13

```asm
CJNE A,#2,CH2
```

### B14

```asm
SJMP CONT
```

### B15

```asm
CJNE A,#3,CH3
```

### B16

```asm
SJMP CONT
```

### B17

```asm
ACALL SUBERR
```

### B18

```asm
SJMP NEXTBOOKING
```

### B19

```asm
ACALL CLEARLCD
```

### B20

```asm
MOV A,#80H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 58 to 59"]
B21["B22: instructions - lines 60 to 60"]
B22["B23: CONT - lines 63 to 63"]
B23["B24: instructions - lines 64 to 65"]
B24["B25: instructions - lines 66 to 67"]
B25["B26: instructions - lines 68 to 68"]
B26["B27: instructions - lines 69 to 72"]
B27["B28: instructions - lines 73 to 74"]
B28["B29: instructions - lines 75 to 78"]
B29["B30: instructions - lines 79 to 81"]
B20 -->|call| B82
B20 -->|after return| B21
B21 -->|jump| B21
B22 -->|call| B54
B22 -->|after return| B23
B23 -->|call| B76
B23 -->|after return| B24
B24 -->|call| B82
B24 -->|after return| B25
B25 -->|call| B92
B25 -->|after return| B26
B26 -->|call| B54
B26 -->|after return| B27
B27 -->|condition true| B30
B27 -->|condition false| B28
B28 -->|condition true| B47
B28 -->|condition false| B29
B29 -->|jump| B39
B82["Continue at B83 in section 9"]
B54["Continue at B55 in section 6"]
B76["Continue at B77 in section 8"]
B92["Continue at B93 in section 10"]
B30["Continue at B31 in section 4"]
B47["Continue at B48 in section 5"]
B39["Continue at B40 in section 4"]
```

### B21

```asm
MOV DPTR,#STRTOEXIT
ACALL WSTR
```

### B22

```asm
SJMP $
```

### B23

```asm
ACALL CLEARLCD
```

### B24

```asm
MOV A,#80H
ACALL CMD
```

### B25

```asm
MOV DPTR,#STRTICKET
ACALL WSTR
```

### B26

```asm
ACALL KEYPAD
```

### B27

```asm
CLR C
SUBB A,#30H
MOV 40H,A
ACALL CLEARLCD
```

### B28

```asm
MOV A,30H
CJNE A,#1,NEXT1
```

### B29

```asm
MOV A,31H
CLR C
SUBB A,40H
JC NOAVAIL
```

### B30

```asm
MOV 31H,A
MOV B,32H
SJMP CALC
```

## Section 4

```mermaid
flowchart TD
B30["B31: NEXT1 - lines 84 to 84"]
B31["B32: instructions - lines 85 to 88"]
B32["B33: instructions - lines 89 to 91"]
B33["B34: ERROR - lines 94 to 94"]
B34["B35: instructions - lines 95 to 96"]
B35["B36: instructions - lines 97 to 98"]
B36["B37: ERR2 - lines 100 to 100"]
B37["B38: instructions - lines 101 to 101"]
B38["B39: instructions - lines 102 to 102"]
B39["B40: CALC - lines 105 to 109"]
B30 -->|condition true| B33
B30 -->|condition false| B31
B31 -->|condition true| B47
B31 -->|condition false| B32
B32 -->|jump| B39
B33 -->|call| B54
B33 -->|after return| B34
B34 -->|call| B76
B34 -->|after return| B35
B35 -->|next| B36
B36 -->|call| B89
B36 -->|after return| B37
B37 -->|condition true| B36
B37 -->|condition false| B38
B38 -->|jump| B6
B39 -->|call| B82
B39 -->|after return| B40
B47["Continue at B48 in section 5"]
B54["Continue at B55 in section 6"]
B76["Continue at B77 in section 8"]
B89["Continue at B90 in section 9"]
B6["Continue at B7 in section 1"]
B82["Continue at B83 in section 9"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#2,ERROR
```

### B32

```asm
CLR C
MOV A,41H
SUBB A,40H
JC NOAVAIL
```

### B33

```asm
MOV 41H,A
MOV B,42H
SJMP CALC
```

### B34

```asm
ACALL CLEARLCD
```

### B35

```asm
MOV A,#80H
ACALL CMD
```

### B36

```asm
MOV DPTR,#STRERR
MOV R7,#2
```

### B37

```asm
ACALL TMSEC
```

### B38

```asm
DJNZ R7,ERR2
```

### B39

```asm
SJMP NEXTBOOKING
```

### B40

```asm
MOV A,40H
MUL AB
MOV 50H,A
MOV DPTR,#STROK
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 110 to 113"]
B41["B42: instructions - lines 114 to 116"]
B42["B43: instructions - lines 117 to 118"]
B43["B44: instructions - lines 119 to 119"]
B44["B45: CALC1 - lines 121 to 121"]
B45["B46: instructions - lines 122 to 122"]
B46["B47: instructions - lines 123 to 123"]
B47["B48: NOAVAIL - lines 126 to 126"]
B48["B49: instructions - lines 127 to 128"]
B49["B50: instructions - lines 129 to 130"]
B40 -->|call| B71
B40 -->|after return| B41
B41 -->|call| B71
B41 -->|after return| B42
B42 -->|call| B82
B42 -->|after return| B43
B43 -->|next| B44
B44 -->|call| B89
B44 -->|after return| B45
B45 -->|condition true| B44
B45 -->|condition false| B46
B46 -->|jump| B6
B47 -->|call| B54
B47 -->|after return| B48
B48 -->|call| B76
B48 -->|after return| B49
B49 -->|call| B82
B49 -->|after return| B50
B71["Continue at B72 in section 8"]
B82["Continue at B83 in section 9"]
B89["Continue at B90 in section 9"]
B6["Continue at B7 in section 1"]
B54["Continue at B55 in section 6"]
B76["Continue at B77 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B42

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B43

```asm
MOV DPTR,#STRKD
ACALL WSTR
```

### B44

```asm
MOV R7,#5
```

### B45

```asm
ACALL TMSEC
```

### B46

```asm
DJNZ R7,CALC1
```

### B47

```asm
AJMP NEXTBOOKING
```

### B48

```asm
ACALL CLEARLCD
```

### B49

```asm
MOV A,#80H
ACALL CMD
```

### B50

```asm
MOV DPTR,#NOTAV
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 131"]
B51["B52: NOAV3 - lines 133 to 133"]
B52["B53: instructions - lines 134 to 134"]
B53["B54: instructions - lines 135 to 135"]
B54["B55: CLEARLCD - lines 139 to 140"]
B55["B56: instructions - lines 141 to 141"]
B56["B57: WAIT1 - lines 143 to 143"]
B57["B58: instructions - lines 144 to 144"]
B58["B59: instructions - lines 145 to 145"]
B59["B60: SUBERR - lines 148 to 148"]
B50 -->|next| B51
B51 -->|call| B89
B51 -->|after return| B52
B52 -->|condition true| B51
B52 -->|condition false| B53
B53 -->|jump| B6
B54 -->|call| B76
B54 -->|after return| B55
B55 -->|next| B56
B56 -->|call| B87
B56 -->|after return| B57
B57 -->|condition true| B56
B57 -->|condition false| B58
B59 -->|call| B54
B59 -->|after return| B60
B89["Continue at B90 in section 9"]
B6["Continue at B7 in section 1"]
B76["Continue at B77 in section 8"]
B87["Continue at B88 in section 9"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV R7,#2
```

### B52

```asm
ACALL TMSEC
```

### B53

```asm
DJNZ R7,NOAV3
```

### B54

```asm
AJMP NEXTBOOKING
```

### B55

```asm
MOV A,#01H
ACALL CMD
```

### B56

```asm
MOV R7,#14
```

### B57

```asm
ACALL LDELAY
```

### B58

```asm
DJNZ R7,WAIT1
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
ACALL CLEARLCD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 149 to 150"]
B61["B62: instructions - lines 151 to 152"]
B62["B63: instructions - lines 153 to 153"]
B63["B64: NOAV2 - lines 154 to 154"]
B64["B65: instructions - lines 155 to 155"]
B65["B66: instructions - lines 156 to 156"]
B66["B67: INLCD - lines 160 to 168"]
B67["B68: instructions - lines 170 to 179"]
B68["B69: instructions - lines 181 to 196"]
B69["B70: instructions - lines 198 to 210"]
B60 -->|call| B76
B60 -->|after return| B61
B61 -->|call| B82
B61 -->|after return| B62
B62 -->|next| B63
B63 -->|call| B89
B63 -->|after return| B64
B64 -->|condition true| B63
B64 -->|condition false| B65
B66 -->|call| B87
B66 -->|after return| B67
B67 -->|call| B87
B67 -->|after return| B68
B68 -->|call| B87
B68 -->|after return| B69
B69 -->|call| B87
B69 -->|after return| B70
B76["Continue at B77 in section 8"]
B82["Continue at B83 in section 9"]
B89["Continue at B90 in section 9"]
B87["Continue at B88 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#80H
ACALL CMD
```

### B62

```asm
MOV DPTR,#STRERR
ACALL WSTR
```

### B63

```asm
MOV R7,#2
```

### B64

```asm
ACALL TMSEC
```

### B65

```asm
DJNZ R7,NOAV2
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

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

### B68

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

### B69

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

### B70

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

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 211 to 211"]
B71["B72: WCHR - lines 216 to 220"]
B72["B73: instructions - lines 221 to 221"]
B73["B74: instructions - lines 222 to 224"]
B74["B75: instructions - lines 225 to 225"]
B75["B76: instructions - lines 226 to 228"]
B76["B77: CMD - lines 232 to 234"]
B77["B78: instructions - lines 235 to 235"]
B78["B79: instructions - lines 236 to 238"]
B79["B80: instructions - lines 239 to 239"]
B71 -->|call| B81
B71 -->|after return| B72
B72 -->|call| B87
B72 -->|after return| B73
B73 -->|call| B81
B73 -->|after return| B74
B74 -->|call| B87
B74 -->|after return| B75
B76 -->|call| B81
B76 -->|after return| B77
B77 -->|call| B87
B77 -->|after return| B78
B78 -->|call| B81
B78 -->|after return| B79
B79 -->|call| B87
B79 -->|after return| B80
B81["Continue at B82 in section 9"]
B87["Continue at B88 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
PUSH ACC
PUSH B
SETB P1.3
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

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B78

```asm
ACALL LDELAY
```

### B79

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B80

```asm
ACALL LDELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 240 to 240"]
B81["B82: COMMON - lines 244 to 249"]
B82["B83: WSTR - lines 253 to 253"]
B83["B84: CONT1 - lines 255 to 257"]
B84["B85: PRINT - lines 259 to 259"]
B85["B86: instructions - lines 260 to 261"]
B86["B87: EXIT1 - lines 262 to 263"]
B87["B88: LDELAY - lines 267 to 268"]
B88["B89: instructions - lines 269 to 269"]
B89["B90: TMSEC - lines 273 to 276"]
B82 -->|next| B83
B83 -->|condition true| B86
B83 -->|condition false| B84
B84 -->|call| B71
B84 -->|after return| B85
B85 -->|jump| B83
B87 -->|condition true| B87
B87 -->|condition false| B88
B89 -->|next| B90
B71["Continue at B72 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

Return to the instruction following the active call.

```asm
RET
```

### B82

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B83

```asm
PUSH    ACC
```

### B84

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B85

```asm
ACALL    WCHR
```

### B86

```asm
INC DPTR
AJMP    CONT1
```

### B87

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B88

```asm
MOV R0, #50
DJNZ R0, $
```

### B89

Return to the instruction following the active call.

```asm
RET
```

### B90

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

## Section 10

```mermaid
flowchart TD
B90["B91: BACK - lines 278 to 278"]
B91["B92: instructions - lines 279 to 281"]
B92["B93: KEYPAD - lines 286 to 286"]
B93["B94: K1 - lines 287 to 290"]
B94["B95: K2 - lines 292 to 294"]
B95["B96: instructions - lines 295 to 295"]
B96["B97: OVER1 - lines 297 to 300"]
B97["B98: instructions - lines 301 to 304"]
B98["B99: instructions - lines 305 to 308"]
B99["B100: instructions - lines 309 to 312"]
B90 -->|condition true| B90
B90 -->|condition false| B91
B92 -->|next| B93
B93 -->|condition true| B93
B93 -->|condition false| B94
B94 -->|condition true| B96
B94 -->|condition false| B95
B95 -->|jump| B94
B96 -->|condition true| B101
B96 -->|condition false| B97
B97 -->|condition true| B102
B97 -->|condition false| B98
B98 -->|condition true| B103
B98 -->|condition false| B99
B99 -->|condition true| B104
B99 -->|condition false| B100
B101["Continue at B102 in section 11"]
B102["Continue at B103 in section 11"]
B103["Continue at B104 in section 11"]
B104["Continue at B105 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
JNB   TF0,BACK
```

### B92

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```

### B93

```asm
MOV P0,#01110000B
```

### B94

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B95

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B96

```asm
SJMP K2
```

### B97

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B98

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B99

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B100

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 313 to 313"]
B101["B102: ROW_0 - lines 314 to 315"]
B102["B103: ROW_1 - lines 316 to 317"]
B103["B104: ROW_2 - lines 318 to 319"]
B104["B105: ROW_3 - lines 320 to 320"]
B105["B106: FIND - lines 323 to 323"]
B106["B107: FIND1 - lines 325 to 326"]
B107["B108: instructions - lines 327 to 328"]
B108["B109: MATCH - lines 329 to 331"]
B100 -->|jump| B94
B101 -->|jump| B105
B102 -->|jump| B105
B103 -->|jump| B105
B104 -->|next| B105
B105 -->|next| B106
B106 -->|condition true| B108
B106 -->|condition false| B107
B107 -->|jump| B106
B94["Continue at B95 in section 10"]
```

### B101

```asm
LJMP K2
```

### B102

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B103

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B104

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B105

```asm
MOV DPTR,#KCODE3
```

### B106

```asm
RLC A
```

### B107

```asm
RLC A
JNC MATCH
```

### B108

```asm
INC DPTR
SJMP FIND1
```

### B109

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
