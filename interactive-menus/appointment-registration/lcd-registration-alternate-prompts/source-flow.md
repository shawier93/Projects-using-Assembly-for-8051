# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 8 to 19"]
B1["B2: START - lines 30 to 30"]
B2["B3: instructions - lines 31 to 31"]
B3["B4: instructions - lines 34 to 34"]
B4["B5: MENU - lines 39 to 39"]
B5["B6: instructions - lines 43 to 43"]
B6["B7: CH1 - lines 45 to 45"]
B7["B8: instructions - lines 46 to 46"]
B8["B9: instructions - lines 47 to 47"]
B9["B10: instructions - lines 48 to 48"]
B0 -->|next| B1
B1 -->|call| B72
B1 -->|after return| B2
B2 -->|call| B117
B2 -->|after return| B3
B3 -->|call| B101
B3 -->|after return| B4
B4 -->|call| B124
B4 -->|after return| B5
B5 -->|next| B6
B6 -->|condition true| B10
B6 -->|condition false| B7
B7 -->|call| B144
B7 -->|after return| B8
B8 -->|call| B15
B8 -->|after return| B9
B9 -->|jump| B4
B72["Continue at B73 in section 8"]
B117["Continue at B118 in section 12"]
B101["Continue at B102 in section 11"]
B124["Continue at B125 in section 13"]
B10["Continue at B11 in section 2"]
B144["Continue at B145 in section 15"]
B15["Continue at B16 in section 2"]
```

### B1

```asm
mov 68,#0
mov 67,#0
mov 66,#1
MOV 50H,#1
MOV 51H,#4
MOV 54H,#1
```

### B2

```asm
acall INLCD
```

### B3

```asm
ACALL WELCOMEMSG
```

### B4

```asm
acall flash
```

### B5

```asm
acall MENUMSG
```

### B6

```asm
mov a,54h
```

### B7

```asm
CJNE A,#1,CH2
```

### B8

```asm
acall vaccreg
```

### B9

```asm
ACALL loop
```

### B10

```asm
sjmp menu
```

## Section 2

```mermaid
flowchart TD
B10["B11: CH2 - lines 51 to 51"]
B11["B12: instructions - lines 52 to 52"]
B12["B13: instructions - lines 53 to 53"]
B13["B14: ERRORX - lines 56 to 56"]
B14["B15: instructions - lines 57 to 57"]
B15["B16: LOOP - lines 62 to 62"]
B16["B17: instructions - lines 63 to 63"]
B17["B18: CH3 - lines 65 to 65"]
B18["B19: instructions - lines 66 to 66"]
B19["B20: CH4 - lines 69 to 69"]
B10 -->|condition true| B13
B10 -->|condition false| B11
B11 -->|call| B132
B11 -->|after return| B12
B12 -->|jump| B210
B13 -->|call| B138
B13 -->|after return| B14
B14 -->|jump| B4
B15 -->|call| B150
B15 -->|after return| B16
B16 -->|next| B17
B17 -->|condition true| B19
B17 -->|condition false| B18
B18 -->|jump| B22
B19 -->|condition true| B26
B19 -->|condition false| B20
B132["Continue at B133 in section 14"]
B210["Continue at B211 in section 22"]
B138["Continue at B139 in section 14"]
B4["Continue at B5 in section 1"]
B150["Continue at B151 in section 16"]
B22["Continue at B23 in section 3"]
B26["Continue at B27 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE A,#2,ERRORx
```

### B12

```asm
ACALL EXITMSG
```

### B13

```asm
aJMP stop
```

### B14

```asm
ACALL ERROR1MSG
```

### B15

```asm
SJMP MENU
```

### B16

```asm
acall mes1
```

### B17

```asm
mov a,50h
```

### B18

```asm
CJNE A,#1,CH4
```

### B19

```asm
sjmp op1
```

### B20

```asm
cjne a,#0h,error
```

## Section 3

```mermaid
flowchart TD
B20["B21: M - lines 70 to 70"]
B21["B22: instructions - lines 71 to 71"]
B22["B23: OP1 - lines 82 to 83"]
B23["B24: instructions - lines 84 to 84"]
B24["B25: instructions - lines 85 to 85"]
B25["B26: instructions - lines 86 to 86"]
B26["B27: ERROR - lines 89 to 89"]
B27["B28: OP2 - lines 94 to 94"]
B28["B29: instructions - lines 95 to 96"]
B29["B30: instructions - lines 98 to 99"]
B20 -->|call| B173
B20 -->|after return| B21
B21 -->|jump| B27
B22 -->|condition true| B26
B22 -->|condition false| B23
B23 -->|call| B164
B23 -->|after return| B24
B24 -->|call| B36
B24 -->|after return| B25
B25 -->|jump| B15
B26 -->|jump| B15
B27 -->|call| B191
B27 -->|after return| B28
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B34
B173["Continue at B174 in section 18"]
B164["Continue at B165 in section 17"]
B36["Continue at B37 in section 4"]
B15["Continue at B16 in section 2"]
B191["Continue at B192 in section 20"]
B30["Continue at B31 in section 4"]
B34["Continue at B35 in section 4"]
```

### B21

```asm
acall no
```

### B22

```asm
sjmp op2
```

### B23

```asm
mov a,66
CJNE A,#1,ERROR
```

### B24

```asm
acall yes
```

### B25

```asm
ACALL POS
```

### B26

```asm
SJMP loop
```

### B27

```asm
SJMP loop
```

### B28

```asm
acall fdoze
```

### B29

```asm
MOV A,52H
CJNE A,#0,SecondDozee
```

### B30

```asm
MOV 60H,#0
SJMP BACK3
```

## Section 4

```mermaid
flowchart TD
B30["B31: SECONDDOZEE - lines 104 to 104"]
B31["B32: instructions - lines 105 to 108"]
B32["B33: instructions - lines 109 to 112"]
B33["B34: ERROR3 - lines 115 to 115"]
B34["B35: BACK3 - lines 118 to 118"]
B35["B36: instructions - lines 119 to 119"]
B36["B37: POS - lines 123 to 123"]
B37["B38: instructions - lines 126 to 129"]
B38["B39: instructions - lines 130 to 130"]
B39["B40: instructions - lines 133 to 135"]
B30 -->|condition true| B33
B30 -->|condition false| B31
B31 -->|call| B49
B31 -->|after return| B32
B32 -->|jump| B34
B33 -->|jump| B34
B34 -->|call| B54
B34 -->|after return| B35
B36 -->|call| B156
B36 -->|after return| B37
B37 -->|call| B191
B37 -->|after return| B38
B38 -->|condition true| B41
B38 -->|condition false| B39
B39 -->|call| B49
B39 -->|after return| B40
B49["Continue at B50 in section 5"]
B54["Continue at B55 in section 6"]
B156["Continue at B157 in section 16"]
B191["Continue at B192 in section 20"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#1,ERROR3
```

### B32

```asm
MOV R7,53H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B33

```asm
MOV 60H,A
MOV 61H,#4
SJMP BACK3
```

### B34

```asm
SJMP BACK3
```

### B35

```asm
ACALL CONFIRM
```

### B36

Return to the instruction following the active call.

```asm
RET
```

### B37

```asm
acall  mes4
```

### B38

```asm
MOV R7,51H
MOV A,67h
acall fdoze
```

### B39

```asm
CJNE A,#0,SecondDoze
```

### B40

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 136 to 139"]
B41["B42: SECONDDOZE - lines 142 to 142"]
B42["B43: instructions - lines 143 to 143"]
B43["B44: instructions - lines 144 to 146"]
B44["B45: instructions - lines 148 to 148"]
B45["B46: instructions - lines 149 to 151"]
B46["B47: instructions - lines 152 to 154"]
B47["B48: ERROR1 - lines 159 to 159"]
B48["B49: instructions - lines 161 to 161"]
B49["B50: CHEACK - lines 165 to 165"]
B40 -->|jump| B47
B41 -->|call| B191
B41 -->|after return| B42
B42 -->|call| B179
B42 -->|after return| B43
B43 -->|condition true| B47
B43 -->|condition false| B44
B44 -->|call| B204
B44 -->|after return| B45
B45 -->|call| B49
B45 -->|after return| B46
B46 -->|jump| B47
B47 -->|call| B54
B47 -->|after return| B48
B49 -->|condition true| B51
B49 -->|condition false| B50
B191["Continue at B192 in section 20"]
B179["Continue at B180 in section 18"]
B204["Continue at B205 in section 21"]
B54["Continue at B55 in section 6"]
B51["Continue at B52 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV 60H,A
MOV 61H,#1
SJMP BACK1
```

### B42

```asm
acall fdoze
```

### B43

```asm
acall yes1
```

### B44

```asm
mov a,68h
CJNE A,#1,ERROR1
```

### B45

```asm
acall sedoze
```

### B46

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B47

```asm
MOV 60H,A
MOV 61H,#2
SJMP BACK1
```

### B48

```asm
ACALL CONFIRM
```

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
CJNE A,#12,CONTINUE
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 166 to 166"]
B51["B52: CONTINUE - lines 168 to 168"]
B52["B53: instructions - lines 169 to 169"]
B53["B54: BACK2 - lines 172 to 172"]
B54["B55: CONFIRM - lines 176 to 177"]
B55["B56: instructions - lines 179 to 179"]
B56["B57: CLEAR - lines 188 to 189"]
B57["B58: instructions - lines 190 to 190"]
B58["B59: WAIT - lines 191 to 191"]
B59["B60: instructions - lines 192 to 192"]
B50 -->|jump| B53
B51 -->|condition true| B53
B51 -->|condition false| B52
B52 -->|next| B53
B54 -->|condition true| B54
B54 -->|condition false| B55
B56 -->|call| B66
B56 -->|after return| B57
B57 -->|next| B58
B58 -->|call| B94
B58 -->|after return| B59
B59 -->|condition true| B58
B59 -->|condition false| B60
B66["Continue at B67 in section 7"]
B94["Continue at B95 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
SJMP BACK2
```

### B52

```asm
JC BACK2
```

### B53

```asm
SUBB A,#12
```

### B54

Return to the instruction following the active call.

```asm
RET
```

### B55

```asm
MOV A,62H
CJNE A,#1,CONFIRM
```

### B56

Return to the instruction following the active call.

```asm
RET
```

### B57

```asm
MOV A,#01H
ACALL CMD
```

### B58

```asm
MOV R5,#14
```

### B59

```asm
ACALL LDELAY
```

### B60

```asm
DJNZ R5,WAIT
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 193 to 193"]
B61["B62: WCHR - lines 196 to 200"]
B62["B63: instructions - lines 201 to 201"]
B63["B64: instructions - lines 202 to 204"]
B64["B65: instructions - lines 205 to 205"]
B65["B66: instructions - lines 206 to 208"]
B66["B67: CMD - lines 213 to 215"]
B67["B68: instructions - lines 216 to 216"]
B68["B69: instructions - lines 217 to 219"]
B69["B70: instructions - lines 220 to 220"]
B61 -->|call| B71
B61 -->|after return| B62
B62 -->|call| B94
B62 -->|after return| B63
B63 -->|call| B71
B63 -->|after return| B64
B64 -->|call| B94
B64 -->|after return| B65
B66 -->|call| B71
B66 -->|after return| B67
B67 -->|call| B94
B67 -->|after return| B68
B68 -->|call| B71
B68 -->|after return| B69
B69 -->|call| B94
B69 -->|after return| B70
B71["Continue at B72 in section 8"]
B94["Continue at B95 in section 10"]
B70["Continue at B71 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
RET
```

### B62

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B63

```asm
ACALL LDELAY
```

### B64

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B65

```asm
ACALL LDELAY
```

### B66

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B67

```asm
CLR P1.3
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
B70["B71: instructions - lines 221 to 221"]
B71["B72: COMMON - lines 226 to 231"]
B72["B73: INLCD - lines 235 to 242"]
B73["B74: instructions - lines 243 to 251"]
B74["B75: instructions - lines 252 to 264"]
B75["B76: instructions - lines 265 to 275"]
B76["B77: instructions - lines 276 to 276"]
B77["B78: KEYPAD - lines 280 to 280"]
B78["B79: K1 - lines 281 to 284"]
B79["B80: K2 - lines 286 to 288"]
B72 -->|call| B94
B72 -->|after return| B73
B73 -->|call| B94
B73 -->|after return| B74
B74 -->|call| B94
B74 -->|after return| B75
B75 -->|call| B94
B75 -->|after return| B76
B77 -->|next| B78
B78 -->|condition true| B78
B78 -->|condition false| B79
B79 -->|condition true| B81
B79 -->|condition false| B80
B94["Continue at B95 in section 10"]
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B73

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

### B74

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

### B75

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

### B76

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

### B77

Return to the instruction following the active call.

```asm
RET
```

### B78

```asm
MOV P0,#01110000B
```

### B79

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B80

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 289 to 289"]
B81["B82: OVER1 - lines 291 to 294"]
B82["B83: instructions - lines 295 to 298"]
B83["B84: instructions - lines 299 to 302"]
B84["B85: instructions - lines 303 to 306"]
B85["B86: instructions - lines 307 to 307"]
B86["B87: ROW_0 - lines 308 to 309"]
B87["B88: ROW_1 - lines 310 to 311"]
B88["B89: ROW_2 - lines 312 to 313"]
B89["B90: ROW_3 - lines 314 to 314"]
B80 -->|jump| B79
B81 -->|condition true| B86
B81 -->|condition false| B82
B82 -->|condition true| B87
B82 -->|condition false| B83
B83 -->|condition true| B88
B83 -->|condition false| B84
B84 -->|condition true| B89
B84 -->|condition false| B85
B85 -->|jump| B79
B86 -->|jump| B90
B87 -->|jump| B90
B88 -->|jump| B90
B89 -->|next| B90
B79["Continue at B80 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
SJMP K2
```

### B82

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B83

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B84

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B85

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B86

```asm
LJMP K2
```

### B87

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B88

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B89

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B90

```asm
MOV DPTR,#KCODE3
```

## Section 10

```mermaid
flowchart TD
B90["B91: FIND - lines 316 to 316"]
B91["B92: FIND1 - lines 318 to 319"]
B92["B93: instructions - lines 320 to 321"]
B93["B94: MATCH - lines 322 to 324"]
B94["B95: LDELAY - lines 328 to 329"]
B95["B96: instructions - lines 330 to 330"]
B96["B97: WSTR - lines 333 to 333"]
B97["B98: CONT1 - lines 335 to 337"]
B98["B99: PRINT - lines 339 to 339"]
B99["B100: instructions - lines 340 to 341"]
B90 -->|next| B91
B91 -->|condition true| B93
B91 -->|condition false| B92
B92 -->|jump| B91
B94 -->|condition true| B94
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|condition true| B100
B97 -->|condition false| B98
B98 -->|call| B61
B98 -->|after return| B99
B99 -->|jump| B97
B100["Continue at B101 in section 11"]
B61["Continue at B62 in section 7"]
```

### B91

```asm
RLC A
```

### B92

```asm
RLC A
JNC MATCH
```

### B93

```asm
INC DPTR
SJMP FIND1
```

### B94

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B95

```asm
MOV R0, #50
DJNZ R0, $
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
PUSH ACC
```

### B98

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B99

```asm
ACALL WCHR
```

### B100

```asm
INC DPTR
AJMP CONT1
```

## Section 11

```mermaid
flowchart TD
B100["B101: EXIT1 - lines 342 to 343"]
B101["B102: FLASH - lines 348 to 348"]
B102["B103: T3 - lines 349 to 350"]
B103["B104: instructions - lines 351 to 352"]
B104["B105: instructions - lines 353 to 353"]
B105["B106: instructions - lines 354 to 354"]
B106["B107: DELAY - lines 358 to 358"]
B107["B108: X3 - lines 359 to 359"]
B108["B109: X2 - lines 360 to 360"]
B109["B110: X1 - lines 361 to 361"]
B101 -->|next| B102
B102 -->|call| B106
B102 -->|after return| B103
B103 -->|call| B106
B103 -->|after return| B104
B104 -->|condition true| B102
B104 -->|condition false| B105
B106 -->|next| B107
B107 -->|next| B108
B108 -->|next| B109
B109 -->|condition true| B109
B109 -->|condition false| B110
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B102

```asm
MOV R6,#3
```

### B103

```asm
MOV P1,#0H
ACALL DELAY
```

### B104

```asm
MOV P1,#0fFH
ACALL DELAY
```

### B105

```asm
DJNZ R6,T3
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

```asm
MOV R5,#2
```

### B108

```asm
MOV R4,#20
```

### B109

```asm
MOV R3,#200
```

### B110

```asm
DJNZ R3,X1
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 362 to 362"]
B111["B112: instructions - lines 363 to 363"]
B112["B113: instructions - lines 364 to 364"]
B113["B114: NDELAY - lines 367 to 367"]
B114["B115: D1 - lines 368 to 368"]
B115["B116: instructions - lines 369 to 369"]
B116["B117: instructions - lines 370 to 370"]
B117["B118: WELCOMEMSG - lines 373 to 374"]
B118["B119: instructions - lines 375 to 376"]
B119["B120: instructions - lines 377 to 377"]
B110 -->|condition true| B108
B110 -->|condition false| B111
B111 -->|condition true| B107
B111 -->|condition false| B112
B113 -->|next| B114
B114 -->|call| B94
B114 -->|after return| B115
B115 -->|condition true| B114
B115 -->|condition false| B116
B117 -->|call| B66
B117 -->|after return| B118
B118 -->|call| B96
B118 -->|after return| B119
B119 -->|call| B106
B119 -->|after return| B120
B108["Continue at B109 in section 11"]
B107["Continue at B108 in section 11"]
B94["Continue at B95 in section 10"]
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
DJNZ R4,X2
```

### B112

```asm
DJNZ R5,X3
```

### B113

Return to the instruction following the active call.

```asm
RET
```

### B114

```asm
MOV R5,#250
```

### B115

```asm
ACALL LDELAY
```

### B116

```asm
DJNZ R5,d1
```

### B117

Return to the instruction following the active call.

```asm
ret
```

### B118

```asm
MOV A,#80H
ACALL CMD
```

### B119

```asm
MOV DPTR,#ro1
ACALL WSTR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 378 to 379"]
B121["B122: instructions - lines 380 to 381"]
B122["B123: instructions - lines 382 to 382"]
B123["B124: instructions - lines 383 to 383"]
B124["B125: MENUMSG - lines 388 to 388"]
B125["B126: instructions - lines 389 to 390"]
B126["B127: instructions - lines 391 to 392"]
B127["B128: instructions - lines 393 to 394"]
B128["B129: instructions - lines 395 to 396"]
B129["B130: instructions - lines 397 to 397"]
B120 -->|call| B66
B120 -->|after return| B121
B121 -->|call| B96
B121 -->|after return| B122
B122 -->|call| B106
B122 -->|after return| B123
B124 -->|call| B72
B124 -->|after return| B125
B125 -->|call| B66
B125 -->|after return| B126
B126 -->|call| B96
B126 -->|after return| B127
B127 -->|call| B66
B127 -->|after return| B128
B128 -->|call| B96
B128 -->|after return| B129
B129 -->|call| B106
B129 -->|after return| B130
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B72["Continue at B73 in section 8"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A,#0c0H
ACALL CMD
```

### B122

```asm
MOV DPTR,#ro2
ACALL WSTR
```

### B123

```asm
ACALL DELAY
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

```asm
ACALL INLCD
```

### B126

```asm
MOV A,#80H
ACALL CMD
```

### B127

```asm
MOV DPTR,#ro3
ACALL WSTR
```

### B128

```asm
MOV A,#0C0H
ACALL CMD
```

### B129

```asm
MOV DPTR,#ro4
ACALL WSTR
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 398 to 398"]
B131["B132: instructions - lines 399 to 399"]
B132["B133: EXITMSG - lines 402 to 402"]
B133["B134: instructions - lines 403 to 404"]
B134["B135: instructions - lines 405 to 406"]
B135["B136: instructions - lines 407 to 407"]
B136["B137: instructions - lines 408 to 408"]
B137["B138: instructions - lines 409 to 409"]
B138["B139: ERROR1MSG - lines 413 to 413"]
B139["B140: instructions - lines 414 to 415"]
B130 -->|call| B56
B130 -->|after return| B131
B132 -->|call| B72
B132 -->|after return| B133
B133 -->|call| B66
B133 -->|after return| B134
B134 -->|call| B96
B134 -->|after return| B135
B135 -->|call| B106
B135 -->|after return| B136
B136 -->|call| B56
B136 -->|after return| B137
B138 -->|call| B72
B138 -->|after return| B139
B139 -->|call| B66
B139 -->|after return| B140
B56["Continue at B57 in section 6"]
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL clear
```

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

```asm
ACALL INLCD
```

### B134

```asm
MOV A,#80H
ACALL CMD
```

### B135

```asm
MOV DPTR,#ro6
acall wstr
```

### B136

```asm
ACALL DELAY
```

### B137

```asm
ACALL clear
```

### B138

Return to the instruction following the active call.

```asm
RET
```

### B139

```asm
ACALL INLCD
```

### B140

```asm
MOV A,#80H
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 416 to 417"]
B141["B142: instructions - lines 418 to 418"]
B142["B143: instructions - lines 419 to 419"]
B143["B144: instructions - lines 420 to 420"]
B144["B145: VACCREG - lines 423 to 423"]
B145["B146: instructions - lines 424 to 425"]
B146["B147: instructions - lines 426 to 427"]
B147["B148: instructions - lines 428 to 428"]
B148["B149: instructions - lines 429 to 429"]
B149["B150: instructions - lines 430 to 430"]
B140 -->|call| B96
B140 -->|after return| B141
B141 -->|call| B106
B141 -->|after return| B142
B142 -->|call| B56
B142 -->|after return| B143
B144 -->|call| B72
B144 -->|after return| B145
B145 -->|call| B66
B145 -->|after return| B146
B146 -->|call| B96
B146 -->|after return| B147
B147 -->|call| B106
B147 -->|after return| B148
B148 -->|call| B56
B148 -->|after return| B149
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
```

### B141

```asm
MOV DPTR,#ro5
ACALL WSTR
```

### B142

```asm
ACALL DELAY
```

### B143

```asm
ACALL clear
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
ACALL INLCD
```

### B146

```asm
MOV A,#80H
ACALL CMD
```

### B147

```asm
MOV DPTR,#ro7
acall wstr
```

### B148

```asm
ACALL DELAY
```

### B149

```asm
ACALL clear
```

### B150

Return to the instruction following the active call.

```asm
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: MES1 - lines 433 to 433"]
B151["B152: instructions - lines 434 to 435"]
B152["B153: instructions - lines 436 to 437"]
B153["B154: instructions - lines 438 to 438"]
B154["B155: instructions - lines 439 to 439"]
B155["B156: instructions - lines 440 to 440"]
B156["B157: MES4 - lines 443 to 443"]
B157["B158: instructions - lines 444 to 445"]
B158["B159: instructions - lines 446 to 447"]
B159["B160: instructions - lines 448 to 449"]
B150 -->|call| B72
B150 -->|after return| B151
B151 -->|call| B66
B151 -->|after return| B152
B152 -->|call| B96
B152 -->|after return| B153
B153 -->|call| B106
B153 -->|after return| B154
B154 -->|call| B56
B154 -->|after return| B155
B156 -->|call| B72
B156 -->|after return| B157
B157 -->|call| B66
B157 -->|after return| B158
B158 -->|call| B96
B158 -->|after return| B159
B159 -->|call| B66
B159 -->|after return| B160
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL INLCD
```

### B152

```asm
MOV A,#80H
ACALL CMD
```

### B153

```asm
MOV DPTR,#ro8
ACALL WSTR
```

### B154

```asm
ACALL DELAY
```

### B155

```asm
acall clear
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
ACALL INLCD
```

### B158

```asm
MOV A,#80H
ACALL CMD
```

### B159

```asm
MOV DPTR,#ro14
ACALL WSTR
```

### B160

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 450 to 451"]
B161["B162: instructions - lines 452 to 452"]
B162["B163: instructions - lines 453 to 453"]
B163["B164: instructions - lines 454 to 454"]
B164["B165: YES - lines 457 to 457"]
B165["B166: instructions - lines 458 to 459"]
B166["B167: instructions - lines 460 to 461"]
B167["B168: instructions - lines 462 to 463"]
B168["B169: instructions - lines 464 to 464"]
B169["B170: instructions - lines 465 to 465"]
B160 -->|call| B96
B160 -->|after return| B161
B161 -->|call| B106
B161 -->|after return| B162
B162 -->|call| B56
B162 -->|after return| B163
B164 -->|call| B72
B164 -->|after return| B165
B165 -->|call| B66
B165 -->|after return| B166
B166 -->|condition true| B199
B166 -->|condition false| B167
B167 -->|call| B96
B167 -->|after return| B168
B168 -->|call| B106
B168 -->|after return| B169
B169 -->|call| B56
B169 -->|after return| B170
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
B199["Continue at B200 in section 20"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV DPTR,#ro15
ACALL WSTR
```

### B162

```asm
ACALL DELAY
```

### B163

```asm
ACALL clear
```

### B164

Return to the instruction following the active call.

```asm
RET
```

### B165

```asm
ACALL INLCD
```

### B166

```asm
MOV A,#80H
ACALL CMD
```

### B167

```asm
mov a,66
cjne a,#01,next
```

### B168

```asm
MOV DPTR,#ro9
ACALL WSTR
```

### B169

```asm
ACALL DELAY
```

### B170

```asm
acall clear
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 466 to 466"]
B171["B172: NEXTC - lines 468 to 468"]
B172["B173: BLOCK0 - lines 471 to 471"]
B173["B174: NO - lines 474 to 474"]
B174["B175: instructions - lines 475 to 476"]
B175["B176: instructions - lines 477 to 478"]
B176["B177: instructions - lines 479 to 479"]
B177["B178: instructions - lines 480 to 480"]
B178["B179: instructions - lines 481 to 481"]
B179["B180: YES1 - lines 484 to 484"]
B170 -->|jump| B172
B171 -->|jump| B15
B173 -->|call| B72
B173 -->|after return| B174
B174 -->|call| B66
B174 -->|after return| B175
B175 -->|call| B96
B175 -->|after return| B176
B176 -->|call| B106
B176 -->|after return| B177
B177 -->|call| B56
B177 -->|after return| B178
B179 -->|call| B72
B179 -->|after return| B180
B15["Continue at B16 in section 2"]
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
sjmp block0
```

### B172

```asm
Ljmp loop
```

### B173

Return to the instruction following the active call.

```asm
RET
```

### B174

```asm
ACALL INLCD
```

### B175

```asm
MOV A,#80H
ACALL CMD
```

### B176

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B177

```asm
ACALL DELAY
```

### B178

```asm
ACALL clear
```

### B179

Return to the instruction following the active call.

```asm
RET
```

### B180

```asm
ACALL INLCD
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 485 to 486"]
B181["B182: instructions - lines 487 to 488"]
B182["B183: instructions - lines 489 to 489"]
B183["B184: instructions - lines 490 to 490"]
B184["B185: instructions - lines 491 to 491"]
B185["B186: MONTH - lines 494 to 494"]
B186["B187: instructions - lines 495 to 496"]
B187["B188: instructions - lines 497 to 498"]
B188["B189: instructions - lines 499 to 499"]
B189["B190: instructions - lines 500 to 500"]
B180 -->|call| B66
B180 -->|after return| B181
B181 -->|call| B96
B181 -->|after return| B182
B182 -->|call| B106
B182 -->|after return| B183
B183 -->|call| B56
B183 -->|after return| B184
B185 -->|call| B72
B185 -->|after return| B186
B186 -->|call| B66
B186 -->|after return| B187
B187 -->|call| B96
B187 -->|after return| B188
B188 -->|call| B106
B188 -->|after return| B189
B189 -->|call| B56
B189 -->|after return| B190
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B72["Continue at B73 in section 8"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV A,#80H
ACALL CMD
```

### B182

```asm
MOV DPTR,#ro17
ACALL WSTR
```

### B183

```asm
ACALL DELAY
```

### B184

```asm
ACALL clear
```

### B185

Return to the instruction following the active call.

```asm
RET
```

### B186

```asm
ACALL INLCD
```

### B187

```asm
MOV A,#80H
ACALL CMD
```

### B188

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B189

```asm
ACALL DELAY
```

### B190

```asm
ACALL clear
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 501 to 501"]
B191["B192: FDOZE - lines 504 to 504"]
B192["B193: instructions - lines 505 to 506"]
B193["B194: instructions - lines 507 to 508"]
B194["B195: instructions - lines 509 to 510"]
B195["B196: instructions - lines 511 to 512"]
B196["B197: instructions - lines 513 to 514"]
B197["B198: instructions - lines 515 to 515"]
B198["B199: instructions - lines 516 to 516"]
B199["B200: NEXT - lines 519 to 520"]
B191 -->|call| B72
B191 -->|after return| B192
B192 -->|call| B66
B192 -->|after return| B193
B193 -->|call| B96
B193 -->|after return| B194
B194 -->|call| B66
B194 -->|after return| B195
B195 -->|condition true| B199
B195 -->|condition false| B196
B196 -->|call| B96
B196 -->|after return| B197
B197 -->|call| B106
B197 -->|after return| B198
B198 -->|call| B56
B198 -->|after return| B199
B199 -->|call| B66
B199 -->|after return| B200
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B200["Continue at B201 in section 21"]
```

### B191

Return to the instruction following the active call.

```asm
RET
```

### B192

```asm
ACALL INLCD
```

### B193

```asm
MOV A,#80H
ACALL CMD
```

### B194

```asm
MOV DPTR,#ro16
ACALL WSTR
```

### B195

```asm
MOV A,#0C0H
ACALL CMD
```

### B196

```asm
mov a,67
cjne a,#01,next
```

### B197

```asm
MOV DPTR,#ro17
ACALL WSTR
```

### B198

```asm
ACALL DELAY
```

### B199

```asm
acall clear
```

### B200

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 521 to 522"]
B201["B202: instructions - lines 523 to 523"]
B202["B203: instructions - lines 524 to 524"]
B203["B204: instructions - lines 525 to 525"]
B204["B205: SEDOZE - lines 528 to 528"]
B205["B206: instructions - lines 529 to 530"]
B206["B207: instructions - lines 531 to 532"]
B207["B208: instructions - lines 533 to 533"]
B208["B209: instructions - lines 534 to 534"]
B209["B210: instructions - lines 535 to 535"]
B200 -->|call| B96
B200 -->|after return| B201
B201 -->|call| B106
B201 -->|after return| B202
B202 -->|call| B56
B202 -->|after return| B203
B204 -->|call| B72
B204 -->|after return| B205
B205 -->|call| B66
B205 -->|after return| B206
B206 -->|call| B96
B206 -->|after return| B207
B207 -->|call| B106
B207 -->|after return| B208
B208 -->|call| B56
B208 -->|after return| B209
B96["Continue at B97 in section 10"]
B106["Continue at B107 in section 11"]
B56["Continue at B57 in section 6"]
B72["Continue at B73 in section 8"]
B66["Continue at B67 in section 7"]
```

### B201

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B202

```asm
ACALL DELAY
```

### B203

```asm
acall clear
```

### B204

Return to the instruction following the active call.

```asm
RET
```

### B205

```asm
ACALL INLCD
```

### B206

```asm
MOV A,#80H
ACALL CMD
```

### B207

```asm
MOV DPTR,#ro18
ACALL WSTR
```

### B208

```asm
ACALL DELAY
```

### B209

```asm
acall clear
```

### B210

Return to the instruction following the active call.

```asm
RET
```

## Section 22

```mermaid
flowchart TD
B210["B211: STOP - lines 600 to 600"]
B210 -->|jump| B210
```

### B211

```asm
sjmp stop
```
