# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Destinations requiring review

`EEND`, `LOOP`, `Q1`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 5 to 5"]
B2["B3: MAIN - lines 9 to 31"]
B3["B4: instructions - lines 32 to 33"]
B4["B5: instructions - lines 34 to 35"]
B5["B6: instructions - lines 36 to 37"]
B6["B7: instructions - lines 38 to 39"]
B7["B8: instructions - lines 41 to 44"]
B8["B9: NEXTBOOKING - lines 47 to 47"]
B9["B10: instructions - lines 48 to 49"]
B0 -->|jump| B2
B1 -->|jump| B64
B2 -->|call| B67
B2 -->|after return| B3
B3 -->|call| B77
B3 -->|after return| B4
B4 -->|call| B83
B4 -->|after return| B5
B5 -->|call| B77
B5 -->|after return| B6
B6 -->|call| B83
B6 -->|after return| B7
B7 -->|next| B8
B8 -->|call| B52
B8 -->|after return| B9
B9 -->|call| B77
B9 -->|after return| B10
B64["Continue at B65 in section 7"]
B67["Continue at B68 in section 7"]
B77["Continue at B78 in section 8"]
B83["Continue at B84 in section 9"]
B52["Continue at B53 in section 6"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
JMP MAIN
```

### B2

```asm
JMP EX0ISR
```

### B3

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

### B4

```asm
MOV A,#80H
ACALL CMD
```

### B5

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B6

```asm
MOV A,#0C0H
ACALL CMD
```

### B7

```asm
MOV DPTR,#STRINT
ACALL WSTR
```

### B8

```asm
MOV IE,#10000001B
SETB IT0
CLR P3.6
SETB P3.6
```

### B9

```asm
ACALL CLEARLCD
```

### B10

```asm
MOV A,#80H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 50 to 51"]
B11["B12: instructions - lines 52 to 52"]
B12["B13: instructions - lines 53 to 56"]
B13["B14: instructions - lines 57 to 57"]
B14["B15: CH1 - lines 61 to 61"]
B15["B16: instructions - lines 63 to 63"]
B16["B17: CH2 - lines 67 to 67"]
B17["B18: instructions - lines 69 to 69"]
B18["B19: CH3 - lines 73 to 73"]
B19["B20: instructions - lines 75 to 75"]
B10 -->|call| B83
B10 -->|after return| B11
B11 -->|call| B93
B11 -->|after return| B12
B12 -->|condition true| B14
B12 -->|condition false| B13
B13 -->|jump| B20
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|jump| B20
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B20
B18 -->|call| B57
B18 -->|after return| B19
B19 -->|jump| B8
B83["Continue at B84 in section 9"]
B93["Continue at B94 in section 10"]
B20["Continue at B21 in section 3"]
B57["Continue at B58 in section 6"]
B8["Continue at B9 in section 1"]
```

### B11

```asm
MOV DPTR,#MENU1
ACALL WSTR
```

### B12

```asm
ACALL KEYPAD
```

### B13

```asm
CLR C
SUBB A,#30H
MOV 30H,A
CJNE A,#1,CH1
```

### B14

```asm
SJMP CONT
```

### B15

```asm
CJNE A,#2,CH2
```

### B16

```asm
SJMP CONT
```

### B17

```asm
CJNE A,#3,CH3
```

### B18

```asm
SJMP CONT
```

### B19

```asm
ACALL SUBERR
```

### B20

```asm
SJMP NEXTBOOKING
```

## Section 3

```mermaid
flowchart TD
B20["B21: CONT - lines 78 to 78"]
B21["B22: instructions - lines 79 to 80"]
B22["B23: instructions - lines 81 to 82"]
B23["B24: instructions - lines 83 to 83"]
B24["B25: instructions - lines 84 to 88"]
B25["B26: instructions - lines 89 to 90"]
B26["B27: instructions - lines 91 to 94"]
B27["B28: instructions - lines 95 to 97"]
B28["B29: NEXT1 - lines 100 to 100"]
B29["B30: instructions - lines 101 to 104"]
B20 -->|call| B52
B20 -->|after return| B21
B21 -->|call| B77
B21 -->|after return| B22
B22 -->|call| B83
B22 -->|after return| B23
B23 -->|call| B93
B23 -->|after return| B24
B24 -->|call| B52
B24 -->|after return| B25
B25 -->|condition true| B28
B25 -->|condition false| B26
B26 -->|condition true| B45
B26 -->|condition false| B27
B27 -->|jump| B37
B28 -->|condition true| B31
B28 -->|condition false| B29
B29 -->|condition true| B45
B29 -->|condition false| B30
B52["Continue at B53 in section 6"]
B77["Continue at B78 in section 8"]
B83["Continue at B84 in section 9"]
B93["Continue at B94 in section 10"]
B45["Continue at B46 in section 5"]
B37["Continue at B38 in section 4"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL CLEARLCD
```

### B22

```asm
MOV A,#80H
ACALL CMD
```

### B23

```asm
MOV DPTR,#STRTICKET
ACALL WSTR
```

### B24

```asm
ACALL KEYPAD
```

### B25

```asm
CLR C
SUBB A,#30H
MOV 40H,A
ACALL CLEARLCD
```

### B26

```asm
MOV A,30H
CJNE A,#1,NEXT1
```

### B27

```asm
MOV A,31H
CLR C
SUBB A,40H
JC NOAVAIL
```

### B28

```asm
MOV 31H,A
MOV B,32H
SJMP CALC
```

### B29

```asm
CJNE A,#2,ERROR
```

### B30

```asm
CLR C
MOV A,41H
SUBB A,40H
JC NOAVAIL
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 105 to 107"]
B31["B32: ERROR - lines 110 to 110"]
B32["B33: instructions - lines 111 to 112"]
B33["B34: instructions - lines 113 to 114"]
B34["B35: ERR2 - lines 115 to 115"]
B35["B36: instructions - lines 116 to 116"]
B36["B37: instructions - lines 117 to 117"]
B37["B38: CALC - lines 121 to 125"]
B38["B39: instructions - lines 126 to 129"]
B39["B40: instructions - lines 130 to 132"]
B30 -->|jump| B37
B31 -->|call| B52
B31 -->|after return| B32
B32 -->|call| B77
B32 -->|after return| B33
B33 -->|next| B34
B34 -->|call| B90
B34 -->|after return| B35
B35 -->|condition true| B34
B35 -->|condition false| B36
B36 -->|jump| B8
B37 -->|call| B83
B37 -->|after return| B38
B38 -->|call| B72
B38 -->|after return| B39
B39 -->|call| B72
B39 -->|after return| B40
B52["Continue at B53 in section 6"]
B77["Continue at B78 in section 8"]
B90["Continue at B91 in section 10"]
B8["Continue at B9 in section 1"]
B83["Continue at B84 in section 9"]
B72["Continue at B73 in section 8"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV 41H,A
MOV B,42H
SJMP CALC
```

### B32

```asm
ACALL CLEARLCD
```

### B33

```asm
MOV A,#80H
ACALL CMD
```

### B34

```asm
MOV DPTR,#STRERR
MOV R7,#2
```

### B35

```asm
ACALL TMSEC
```

### B36

```asm
DJNZ R7,ERR2
```

### B37

```asm
AJMP NEXTBOOKING
```

### B38

```asm
MOV A,40H
MUL AB
MOV 50H,A
MOV DPTR,#STROK
ACALL WSTR
```

### B39

```asm
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
B40["B41: instructions - lines 133 to 134"]
B41["B42: instructions - lines 135 to 135"]
B42["B43: CALC1 - lines 137 to 137"]
B43["B44: instructions - lines 138 to 138"]
B44["B45: instructions - lines 139 to 139"]
B45["B46: NOAVAIL - lines 142 to 142"]
B46["B47: instructions - lines 143 to 144"]
B47["B48: instructions - lines 145 to 146"]
B48["B49: instructions - lines 147 to 147"]
B49["B50: NOAV3 - lines 148 to 148"]
B40 -->|call| B83
B40 -->|after return| B41
B41 -->|next| B42
B42 -->|call| B90
B42 -->|after return| B43
B43 -->|condition true| B42
B43 -->|condition false| B44
B44 -->|jump| B8
B45 -->|call| B52
B45 -->|after return| B46
B46 -->|call| B77
B46 -->|after return| B47
B47 -->|call| B83
B47 -->|after return| B48
B48 -->|next| B49
B49 -->|call| B90
B49 -->|after return| B50
B83["Continue at B84 in section 9"]
B90["Continue at B91 in section 10"]
B8["Continue at B9 in section 1"]
B52["Continue at B53 in section 6"]
B77["Continue at B78 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR,#STRKD
ACALL WSTR
```

### B42

```asm
MOV R7,#5
```

### B43

```asm
ACALL TMSEC
```

### B44

```asm
DJNZ R7,CALC1
```

### B45

```asm
AJMP NEXTBOOKING
```

### B46

```asm
ACALL CLEARLCD
```

### B47

```asm
MOV A,#80H
ACALL CMD
```

### B48

```asm
MOV DPTR,#NOTAV
ACALL WSTR
```

### B49

```asm
MOV R7,#2
```

### B50

```asm
ACALL TMSEC
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 149 to 149"]
B51["B52: instructions - lines 150 to 150"]
B52["B53: CLEARLCD - lines 154 to 155"]
B53["B54: instructions - lines 156 to 156"]
B54["B55: WAIT1 - lines 158 to 158"]
B55["B56: instructions - lines 159 to 159"]
B56["B57: instructions - lines 160 to 160"]
B57["B58: SUBERR - lines 163 to 163"]
B58["B59: instructions - lines 164 to 165"]
B59["B60: instructions - lines 166 to 167"]
B50 -->|condition true| B49
B50 -->|condition false| B51
B51 -->|jump| B8
B52 -->|call| B77
B52 -->|after return| B53
B53 -->|next| B54
B54 -->|call| B88
B54 -->|after return| B55
B55 -->|condition true| B54
B55 -->|condition false| B56
B57 -->|call| B52
B57 -->|after return| B58
B58 -->|call| B77
B58 -->|after return| B59
B59 -->|call| B83
B59 -->|after return| B60
B49["Continue at B50 in section 5"]
B8["Continue at B9 in section 1"]
B77["Continue at B78 in section 8"]
B88["Continue at B89 in section 9"]
B83["Continue at B84 in section 9"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
DJNZ R7,NOAV3
```

### B52

```asm
AJMP NEXTBOOKING
```

### B53

```asm
MOV A,#01H
ACALL CMD
```

### B54

```asm
MOV R7,#14
```

### B55

```asm
ACALL LDELAY
```

### B56

```asm
DJNZ R7,WAIT1
```

### B57

Return to the instruction following the active call.

```asm
RET
```

### B58

```asm
ACALL CLEARLCD
```

### B59

```asm
MOV A,#80H
ACALL CMD
```

### B60

```asm
MOV DPTR,#STRERR
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 168 to 168"]
B61["B62: NOAV2 - lines 169 to 169"]
B62["B63: instructions - lines 170 to 170"]
B63["B64: instructions - lines 171 to 171"]
B64["B65: EX0ISR - lines 176 to 176"]
B65["B66: instructions - lines 177 to 177"]
B66["B67: instructions - lines 178 to 178"]
B67["B68: INLCD - lines 182 to 190"]
B68["B69: instructions - lines 192 to 201"]
B69["B70: instructions - lines 203 to 218"]
B60 -->|next| B61
B61 -->|call| B90
B61 -->|after return| B62
B62 -->|condition true| B61
B62 -->|condition false| B63
B64 -->|call| B93
B64 -->|after return| B65
B65 -->|condition true| B64
B65 -->|condition false| B66
B67 -->|call| B88
B67 -->|after return| B68
B68 -->|call| B88
B68 -->|after return| B69
B69 -->|call| B88
B69 -->|after return| B70
B90["Continue at B91 in section 10"]
B93["Continue at B94 in section 10"]
B88["Continue at B89 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV R7,#2
```

### B62

```asm
ACALL TMSEC
```

### B63

```asm
DJNZ R7,NOAV2
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
ACALL KEYPAD
```

### B66

```asm
CJNE A,#'#',X1
```

### B67

Resume the interrupted program.

```asm
RETI
```

### B68

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

### B69

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

### B70

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

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 220 to 232"]
B71["B72: instructions - lines 233 to 233"]
B72["B73: WCHR - lines 238 to 242"]
B73["B74: instructions - lines 243 to 243"]
B74["B75: instructions - lines 244 to 246"]
B75["B76: instructions - lines 247 to 247"]
B76["B77: instructions - lines 248 to 250"]
B77["B78: CMD - lines 254 to 256"]
B78["B79: instructions - lines 257 to 257"]
B79["B80: instructions - lines 258 to 260"]
B70 -->|call| B88
B70 -->|after return| B71
B72 -->|call| B82
B72 -->|after return| B73
B73 -->|call| B88
B73 -->|after return| B74
B74 -->|call| B82
B74 -->|after return| B75
B75 -->|call| B88
B75 -->|after return| B76
B77 -->|call| B82
B77 -->|after return| B78
B78 -->|call| B88
B78 -->|after return| B79
B79 -->|call| B82
B79 -->|after return| B80
B88["Continue at B89 in section 9"]
B82["Continue at B83 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

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

### B72

Return to the instruction following the active call.

```asm
RET
```

### B73

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B74

```asm
ACALL LDELAY
```

### B75

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B76

```asm
ACALL LDELAY
```

### B77

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B78

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B79

```asm
ACALL LDELAY
```

### B80

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 261 to 261"]
B81["B82: instructions - lines 262 to 262"]
B82["B83: COMMON - lines 266 to 271"]
B83["B84: WSTR - lines 275 to 275"]
B84["B85: CONT1 - lines 277 to 279"]
B85["B86: PRINT - lines 281 to 281"]
B86["B87: instructions - lines 282 to 283"]
B87["B88: EXIT1 - lines 284 to 285"]
B88["B89: LDELAY - lines 289 to 290"]
B89["B90: instructions - lines 291 to 291"]
B80 -->|call| B88
B80 -->|after return| B81
B83 -->|next| B84
B84 -->|condition true| B87
B84 -->|condition false| B85
B85 -->|call| B72
B85 -->|after return| B86
B86 -->|jump| B84
B88 -->|condition true| B88
B88 -->|condition false| B89
B72["Continue at B73 in section 8"]
```

### B81

```asm
ACALL LDELAY
```

### B82

Return to the instruction following the active call.

```asm
RET
```

### B83

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B84

```asm
PUSH    ACC
```

### B85

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B86

```asm
ACALL    WCHR
```

### B87

```asm
INC DPTR
AJMP    CONT1
```

### B88

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B89

```asm
MOV R0, #50
DJNZ R0, $
```

### B90

Return to the instruction following the active call.

```asm
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: TMSEC - lines 295 to 298"]
B91["B92: BACK - lines 300 to 300"]
B92["B93: instructions - lines 301 to 303"]
B93["B94: KEYPAD - lines 308 to 308"]
B94["B95: K1 - lines 309 to 312"]
B95["B96: K2 - lines 314 to 316"]
B96["B97: instructions - lines 317 to 317"]
B97["B98: OVER1 - lines 319 to 322"]
B98["B99: instructions - lines 323 to 326"]
B99["B100: instructions - lines 327 to 330"]
B90 -->|next| B91
B91 -->|condition true| B91
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
B102["Continue at B103 in section 11"]
B103["Continue at B104 in section 11"]
B104["Continue at B105 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B92

```asm
JNB   TF0,BACK
```

### B93

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
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
B100["B101: instructions - lines 331 to 334"]
B101["B102: instructions - lines 335 to 335"]
B102["B103: ROW_0 - lines 336 to 337"]
B103["B104: ROW_1 - lines 338 to 339"]
B104["B105: ROW_2 - lines 340 to 341"]
B105["B106: ROW_3 - lines 342 to 342"]
B106["B107: FIND - lines 345 to 345"]
B107["B108: FIND1 - lines 347 to 348"]
B108["B109: instructions - lines 349 to 350"]
B109["B110: MATCH - lines 351 to 353"]
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

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 383 to 384"]
B111["B112: instructions - lines 385 to 386"]
B112["B113: instructions - lines 387 to 387"]
B113["B114: ELSE - lines 390 to 391"]
B110 -->|condition true| B113
B110 -->|condition false| B111
B111 -->|jump| BX1
B112 -->|jump| BX2
B113 -->|jump| BX3
BX1["Unresolved destination: Q1"]
BX2["Unresolved destination: EEND"]
BX3["Unresolved destination: LOOP"]
```

### B111

```asm
mov R0,#61H
cjne @R0,#0h,else
```

### B112

```asm
mov 61h,#1
ljmp Q1
```

### B113

```asm
sjmp eend
```

### B114

```asm
mov 61h,#0
ljmp LOOP
```
