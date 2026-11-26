# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21)

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
B7["B8: instructions - lines 47 to 47"]
B8["B9: instructions - lines 48 to 48"]
B9["B10: CH2 - lines 51 to 51"]
B0 -->|next| B1
B1 -->|call| B71
B1 -->|after return| B2
B2 -->|call| B116
B2 -->|after return| B3
B3 -->|call| B100
B3 -->|after return| B4
B4 -->|call| B123
B4 -->|after return| B5
B5 -->|next| B6
B6 -->|condition true| B9
B6 -->|condition false| B7
B7 -->|call| B14
B7 -->|after return| B8
B8 -->|jump| B4
B9 -->|condition true| B12
B9 -->|condition false| B10
B71["Continue at B72 in section 8"]
B116["Continue at B117 in section 12"]
B100["Continue at B101 in section 11"]
B123["Continue at B124 in section 13"]
B14["Continue at B15 in section 2"]
B12["Continue at B13 in section 2"]
B10["Continue at B11 in section 2"]
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
ACALL loop
```

### B9

```asm
sjmp menu
```

### B10

```asm
CJNE A,#2,ERRORx
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 52 to 52"]
B11["B12: instructions - lines 53 to 53"]
B12["B13: ERRORX - lines 56 to 56"]
B13["B14: instructions - lines 57 to 57"]
B14["B15: LOOP - lines 61 to 61"]
B15["B16: instructions - lines 62 to 62"]
B16["B17: CH3 - lines 64 to 64"]
B17["B18: instructions - lines 65 to 65"]
B18["B19: CH4 - lines 68 to 68"]
B19["B20: M - lines 69 to 69"]
B10 -->|call| B131
B10 -->|after return| B11
B11 -->|jump| B209
B12 -->|call| B137
B12 -->|after return| B13
B13 -->|jump| B4
B14 -->|call| B149
B14 -->|after return| B15
B15 -->|next| B16
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B21
B18 -->|condition true| B25
B18 -->|condition false| B19
B19 -->|call| B172
B19 -->|after return| B20
B131["Continue at B132 in section 14"]
B209["Continue at B210 in section 21"]
B137["Continue at B138 in section 14"]
B4["Continue at B5 in section 1"]
B149["Continue at B150 in section 15"]
B21["Continue at B22 in section 3"]
B25["Continue at B26 in section 3"]
B172["Continue at B173 in section 18"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL EXITMSG
```

### B12

```asm
aJMP stop
```

### B13

```asm
ACALL ERROR1MSG
```

### B14

```asm
SJMP MENU
```

### B15

```asm
acall mes1
```

### B16

```asm
mov a,50h
```

### B17

```asm
CJNE A,#1,CH4
```

### B18

```asm
sjmp op1
```

### B19

```asm
cjne a,#0h,error
```

### B20

```asm
acall no
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 70 to 70"]
B21["B22: OP1 - lines 81 to 82"]
B22["B23: instructions - lines 83 to 83"]
B23["B24: instructions - lines 84 to 84"]
B24["B25: instructions - lines 85 to 85"]
B25["B26: ERROR - lines 88 to 88"]
B26["B27: OP2 - lines 93 to 93"]
B27["B28: instructions - lines 94 to 95"]
B28["B29: instructions - lines 97 to 98"]
B29["B30: SECONDDOZEE - lines 103 to 103"]
B20 -->|jump| B26
B21 -->|condition true| B25
B21 -->|condition false| B22
B22 -->|call| B163
B22 -->|after return| B23
B23 -->|call| B35
B23 -->|after return| B24
B24 -->|jump| B14
B25 -->|jump| B14
B26 -->|call| B190
B26 -->|after return| B27
B27 -->|condition true| B29
B27 -->|condition false| B28
B28 -->|jump| B33
B29 -->|condition true| B32
B29 -->|condition false| B30
B163["Continue at B164 in section 17"]
B35["Continue at B36 in section 4"]
B14["Continue at B15 in section 2"]
B190["Continue at B191 in section 20"]
B33["Continue at B34 in section 4"]
B32["Continue at B33 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
sjmp op2
```

### B22

```asm
mov a,66
CJNE A,#1,ERROR
```

### B23

```asm
acall yes
```

### B24

```asm
ACALL POS
```

### B25

```asm
SJMP loop
```

### B26

```asm
SJMP loop
```

### B27

```asm
acall fdoze
```

### B28

```asm
MOV A,52H
CJNE A,#0,SecondDozee
```

### B29

```asm
MOV 60H,#0
SJMP BACK3
```

### B30

```asm
CJNE A,#1,ERROR3
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 104 to 107"]
B31["B32: instructions - lines 108 to 111"]
B32["B33: ERROR3 - lines 114 to 114"]
B33["B34: BACK3 - lines 117 to 117"]
B34["B35: instructions - lines 118 to 118"]
B35["B36: POS - lines 122 to 122"]
B36["B37: instructions - lines 125 to 128"]
B37["B38: instructions - lines 129 to 129"]
B38["B39: instructions - lines 132 to 134"]
B39["B40: instructions - lines 135 to 138"]
B30 -->|call| B48
B30 -->|after return| B31
B31 -->|jump| B33
B32 -->|jump| B33
B33 -->|call| B53
B33 -->|after return| B34
B35 -->|call| B155
B35 -->|after return| B36
B36 -->|call| B190
B36 -->|after return| B37
B37 -->|condition true| B40
B37 -->|condition false| B38
B38 -->|call| B48
B38 -->|after return| B39
B39 -->|jump| B46
B48["Continue at B49 in section 5"]
B53["Continue at B54 in section 6"]
B155["Continue at B156 in section 16"]
B190["Continue at B191 in section 20"]
B40["Continue at B41 in section 5"]
B46["Continue at B47 in section 5"]
```

### B31

```asm
MOV R7,53H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B32

```asm
MOV 60H,A
MOV 61H,#4
SJMP BACK3
```

### B33

```asm
SJMP BACK3
```

### B34

```asm
ACALL CONFIRM
```

### B35

Return to the instruction following the active call.

```asm
RET
```

### B36

```asm
acall  mes4
```

### B37

```asm
MOV R7,51H
MOV A,67h
acall fdoze
```

### B38

```asm
CJNE A,#0,SecondDoze
```

### B39

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B40

```asm
MOV 60H,A
MOV 61H,#1
SJMP BACK1
```

## Section 5

```mermaid
flowchart TD
B40["B41: SECONDDOZE - lines 141 to 141"]
B41["B42: instructions - lines 142 to 142"]
B42["B43: instructions - lines 143 to 145"]
B43["B44: instructions - lines 147 to 147"]
B44["B45: instructions - lines 148 to 150"]
B45["B46: instructions - lines 151 to 153"]
B46["B47: ERROR1 - lines 158 to 158"]
B47["B48: instructions - lines 160 to 160"]
B48["B49: CHEACK - lines 164 to 164"]
B49["B50: instructions - lines 165 to 165"]
B40 -->|call| B190
B40 -->|after return| B41
B41 -->|call| B178
B41 -->|after return| B42
B42 -->|condition true| B46
B42 -->|condition false| B43
B43 -->|call| B203
B43 -->|after return| B44
B44 -->|call| B48
B44 -->|after return| B45
B45 -->|jump| B46
B46 -->|call| B53
B46 -->|after return| B47
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|jump| B52
B190["Continue at B191 in section 20"]
B178["Continue at B179 in section 18"]
B203["Continue at B204 in section 21"]
B53["Continue at B54 in section 6"]
B50["Continue at B51 in section 6"]
B52["Continue at B53 in section 6"]
```

### B41

```asm
acall fdoze
```

### B42

```asm
acall yes1
```

### B43

```asm
mov a,68h
CJNE A,#1,ERROR1
```

### B44

```asm
acall sedoze
```

### B45

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B46

```asm
MOV 60H,A
MOV 61H,#2
SJMP BACK1
```

### B47

```asm
ACALL CONFIRM
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
CJNE A,#12,CONTINUE
```

### B50

```asm
SJMP BACK2
```

## Section 6

```mermaid
flowchart TD
B50["B51: CONTINUE - lines 167 to 167"]
B51["B52: instructions - lines 168 to 168"]
B52["B53: BACK2 - lines 171 to 171"]
B53["B54: CONFIRM - lines 175 to 176"]
B54["B55: instructions - lines 178 to 178"]
B55["B56: CLEAR - lines 187 to 188"]
B56["B57: instructions - lines 189 to 189"]
B57["B58: WAIT - lines 190 to 190"]
B58["B59: instructions - lines 191 to 191"]
B59["B60: instructions - lines 192 to 192"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|next| B52
B53 -->|condition true| B53
B53 -->|condition false| B54
B55 -->|call| B65
B55 -->|after return| B56
B56 -->|next| B57
B57 -->|call| B93
B57 -->|after return| B58
B58 -->|condition true| B57
B58 -->|condition false| B59
B65["Continue at B66 in section 7"]
B93["Continue at B94 in section 10"]
```

### B51

```asm
JC BACK2
```

### B52

```asm
SUBB A,#12
```

### B53

Return to the instruction following the active call.

```asm
RET
```

### B54

```asm
MOV A,62H
CJNE A,#1,CONFIRM
```

### B55

Return to the instruction following the active call.

```asm
RET
```

### B56

```asm
MOV A,#01H
ACALL CMD
```

### B57

```asm
MOV R5,#14
```

### B58

```asm
ACALL LDELAY
```

### B59

```asm
DJNZ R5,WAIT
```

### B60

Return to the instruction following the active call.

```asm
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: WCHR - lines 195 to 199"]
B61["B62: instructions - lines 200 to 200"]
B62["B63: instructions - lines 201 to 203"]
B63["B64: instructions - lines 204 to 204"]
B64["B65: instructions - lines 205 to 207"]
B65["B66: CMD - lines 212 to 214"]
B66["B67: instructions - lines 215 to 215"]
B67["B68: instructions - lines 216 to 218"]
B68["B69: instructions - lines 219 to 219"]
B69["B70: instructions - lines 220 to 220"]
B60 -->|call| B70
B60 -->|after return| B61
B61 -->|call| B93
B61 -->|after return| B62
B62 -->|call| B70
B62 -->|after return| B63
B63 -->|call| B93
B63 -->|after return| B64
B65 -->|call| B70
B65 -->|after return| B66
B66 -->|call| B93
B66 -->|after return| B67
B67 -->|call| B70
B67 -->|after return| B68
B68 -->|call| B93
B68 -->|after return| B69
B70["Continue at B71 in section 8"]
B93["Continue at B94 in section 10"]
```

### B61

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B62

```asm
ACALL LDELAY
```

### B63

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B64

```asm
ACALL LDELAY
```

### B65

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B66

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B67

```asm
ACALL LDELAY
```

### B68

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B69

```asm
ACALL LDELAY
```

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: COMMON - lines 225 to 230"]
B71["B72: INLCD - lines 234 to 241"]
B72["B73: instructions - lines 242 to 250"]
B73["B74: instructions - lines 251 to 263"]
B74["B75: instructions - lines 264 to 274"]
B75["B76: instructions - lines 275 to 275"]
B76["B77: KEYPAD - lines 279 to 279"]
B77["B78: K1 - lines 280 to 283"]
B78["B79: K2 - lines 285 to 287"]
B79["B80: instructions - lines 288 to 288"]
B71 -->|call| B93
B71 -->|after return| B72
B72 -->|call| B93
B72 -->|after return| B73
B73 -->|call| B93
B73 -->|after return| B74
B74 -->|call| B93
B74 -->|after return| B75
B76 -->|next| B77
B77 -->|condition true| B77
B77 -->|condition false| B78
B78 -->|condition true| B80
B78 -->|condition false| B79
B79 -->|jump| B78
B93["Continue at B94 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B72

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

### B73

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

### B74

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

### B75

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

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
MOV P0,#01110000B
```

### B78

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B79

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B80

```asm
SJMP K2
```

## Section 9

```mermaid
flowchart TD
B80["B81: OVER1 - lines 290 to 293"]
B81["B82: instructions - lines 294 to 297"]
B82["B83: instructions - lines 298 to 301"]
B83["B84: instructions - lines 302 to 305"]
B84["B85: instructions - lines 306 to 306"]
B85["B86: ROW_0 - lines 307 to 308"]
B86["B87: ROW_1 - lines 309 to 310"]
B87["B88: ROW_2 - lines 311 to 312"]
B88["B89: ROW_3 - lines 313 to 313"]
B89["B90: FIND - lines 315 to 315"]
B80 -->|condition true| B85
B80 -->|condition false| B81
B81 -->|condition true| B86
B81 -->|condition false| B82
B82 -->|condition true| B87
B82 -->|condition false| B83
B83 -->|condition true| B88
B83 -->|condition false| B84
B84 -->|jump| B78
B85 -->|jump| B89
B86 -->|jump| B89
B87 -->|jump| B89
B88 -->|next| B89
B89 -->|next| B90
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B82

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B83

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B84

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B85

```asm
LJMP K2
```

### B86

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B87

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B88

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B89

```asm
MOV DPTR,#KCODE3
```

### B90

```asm
RLC A
```

## Section 10

```mermaid
flowchart TD
B90["B91: FIND1 - lines 317 to 318"]
B91["B92: instructions - lines 319 to 320"]
B92["B93: MATCH - lines 321 to 323"]
B93["B94: LDELAY - lines 327 to 328"]
B94["B95: instructions - lines 329 to 329"]
B95["B96: WSTR - lines 332 to 332"]
B96["B97: CONT1 - lines 334 to 336"]
B97["B98: PRINT - lines 338 to 338"]
B98["B99: instructions - lines 339 to 340"]
B99["B100: EXIT1 - lines 341 to 342"]
B90 -->|condition true| B92
B90 -->|condition false| B91
B91 -->|jump| B90
B93 -->|condition true| B93
B93 -->|condition false| B94
B95 -->|next| B96
B96 -->|condition true| B99
B96 -->|condition false| B97
B97 -->|call| B60
B97 -->|after return| B98
B98 -->|jump| B96
B60["Continue at B61 in section 7"]
```

### B91

```asm
RLC A
JNC MATCH
```

### B92

```asm
INC DPTR
SJMP FIND1
```

### B93

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B94

```asm
MOV R0, #50
DJNZ R0, $
```

### B95

Return to the instruction following the active call.

```asm
RET
```

### B96

```asm
PUSH ACC
```

### B97

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B98

```asm
ACALL WCHR
```

### B99

```asm
INC DPTR
AJMP CONT1
```

### B100

Return to the instruction following the active call.

```asm
POP ACC
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: FLASH - lines 347 to 347"]
B101["B102: T3 - lines 348 to 349"]
B102["B103: instructions - lines 350 to 351"]
B103["B104: instructions - lines 352 to 352"]
B104["B105: instructions - lines 353 to 353"]
B105["B106: DELAY - lines 357 to 357"]
B106["B107: X3 - lines 358 to 358"]
B107["B108: X2 - lines 359 to 359"]
B108["B109: X1 - lines 360 to 360"]
B109["B110: instructions - lines 361 to 361"]
B100 -->|next| B101
B101 -->|call| B105
B101 -->|after return| B102
B102 -->|call| B105
B102 -->|after return| B103
B103 -->|condition true| B101
B103 -->|condition false| B104
B105 -->|next| B106
B106 -->|next| B107
B107 -->|next| B108
B108 -->|condition true| B108
B108 -->|condition false| B109
B109 -->|condition true| B107
B109 -->|condition false| B110
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV R6,#3
```

### B102

```asm
MOV P1,#0H
ACALL DELAY
```

### B103

```asm
MOV P1,#0fFH
ACALL DELAY
```

### B104

```asm
DJNZ R6,T3
```

### B105

Return to the instruction following the active call.

```asm
RET
```

### B106

```asm
MOV R5,#2
```

### B107

```asm
MOV R4,#20
```

### B108

```asm
MOV R3,#200
```

### B109

```asm
DJNZ R3,X1
```

### B110

```asm
DJNZ R4,X2
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 362 to 362"]
B111["B112: instructions - lines 363 to 363"]
B112["B113: NDELAY - lines 366 to 366"]
B113["B114: D1 - lines 367 to 367"]
B114["B115: instructions - lines 368 to 368"]
B115["B116: instructions - lines 369 to 369"]
B116["B117: WELCOMEMSG - lines 372 to 373"]
B117["B118: instructions - lines 374 to 375"]
B118["B119: instructions - lines 376 to 376"]
B119["B120: instructions - lines 377 to 378"]
B110 -->|condition true| B106
B110 -->|condition false| B111
B112 -->|next| B113
B113 -->|call| B93
B113 -->|after return| B114
B114 -->|condition true| B113
B114 -->|condition false| B115
B116 -->|call| B65
B116 -->|after return| B117
B117 -->|call| B95
B117 -->|after return| B118
B118 -->|call| B105
B118 -->|after return| B119
B119 -->|call| B65
B119 -->|after return| B120
B106["Continue at B107 in section 11"]
B93["Continue at B94 in section 10"]
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
DJNZ R5,X3
```

### B112

Return to the instruction following the active call.

```asm
RET
```

### B113

```asm
MOV R5,#250
```

### B114

```asm
ACALL LDELAY
```

### B115

```asm
DJNZ R5,d1
```

### B116

Return to the instruction following the active call.

```asm
ret
```

### B117

```asm
MOV A,#80H
ACALL CMD
```

### B118

```asm
MOV DPTR,#ro1
ACALL WSTR
```

### B119

```asm
ACALL DELAY
```

### B120

```asm
MOV A,#0c0H
ACALL CMD
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 379 to 380"]
B121["B122: instructions - lines 381 to 381"]
B122["B123: instructions - lines 382 to 382"]
B123["B124: MENUMSG - lines 387 to 387"]
B124["B125: instructions - lines 388 to 389"]
B125["B126: instructions - lines 390 to 391"]
B126["B127: instructions - lines 392 to 393"]
B127["B128: instructions - lines 394 to 395"]
B128["B129: instructions - lines 396 to 396"]
B129["B130: instructions - lines 397 to 397"]
B120 -->|call| B95
B120 -->|after return| B121
B121 -->|call| B105
B121 -->|after return| B122
B123 -->|call| B71
B123 -->|after return| B124
B124 -->|call| B65
B124 -->|after return| B125
B125 -->|call| B95
B125 -->|after return| B126
B126 -->|call| B65
B126 -->|after return| B127
B127 -->|call| B95
B127 -->|after return| B128
B128 -->|call| B105
B128 -->|after return| B129
B129 -->|call| B55
B129 -->|after return| B130
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B55["Continue at B56 in section 6"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV DPTR,#ro2
ACALL WSTR
```

### B122

```asm
ACALL DELAY
```

### B123

Return to the instruction following the active call.

```asm
RET
```

### B124

```asm
ACALL INLCD
```

### B125

```asm
MOV A,#80H
ACALL CMD
```

### B126

```asm
MOV DPTR,#ro3
ACALL WSTR
```

### B127

```asm
MOV A,#0C0H
ACALL CMD
```

### B128

```asm
MOV DPTR,#ro4
ACALL WSTR
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
ACALL clear
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 398 to 398"]
B131["B132: EXITMSG - lines 401 to 401"]
B132["B133: instructions - lines 402 to 403"]
B133["B134: instructions - lines 404 to 405"]
B134["B135: instructions - lines 406 to 406"]
B135["B136: instructions - lines 407 to 407"]
B136["B137: instructions - lines 408 to 408"]
B137["B138: ERROR1MSG - lines 412 to 412"]
B138["B139: instructions - lines 413 to 414"]
B139["B140: instructions - lines 415 to 416"]
B131 -->|call| B71
B131 -->|after return| B132
B132 -->|call| B65
B132 -->|after return| B133
B133 -->|call| B95
B133 -->|after return| B134
B134 -->|call| B105
B134 -->|after return| B135
B135 -->|call| B55
B135 -->|after return| B136
B137 -->|call| B71
B137 -->|after return| B138
B138 -->|call| B65
B138 -->|after return| B139
B139 -->|call| B95
B139 -->|after return| B140
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

```asm
ACALL INLCD
```

### B133

```asm
MOV A,#80H
ACALL CMD
```

### B134

```asm
MOV DPTR,#ro6
acall wstr
```

### B135

```asm
ACALL DELAY
```

### B136

```asm
ACALL clear
```

### B137

Return to the instruction following the active call.

```asm
RET
```

### B138

```asm
ACALL INLCD
```

### B139

```asm
MOV A,#80H
ACALL CMD
```

### B140

```asm
MOV DPTR,#ro5
ACALL WSTR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 417 to 417"]
B141["B142: instructions - lines 418 to 418"]
B142["B143: instructions - lines 419 to 419"]
B143["B144: VACCREG - lines 422 to 422"]
B144["B145: instructions - lines 423 to 424"]
B145["B146: instructions - lines 425 to 426"]
B146["B147: instructions - lines 427 to 427"]
B147["B148: instructions - lines 428 to 428"]
B148["B149: instructions - lines 429 to 429"]
B149["B150: MES1 - lines 432 to 432"]
B140 -->|call| B105
B140 -->|after return| B141
B141 -->|call| B55
B141 -->|after return| B142
B143 -->|call| B71
B143 -->|after return| B144
B144 -->|call| B65
B144 -->|after return| B145
B145 -->|call| B95
B145 -->|after return| B146
B146 -->|call| B105
B146 -->|after return| B147
B147 -->|call| B55
B147 -->|after return| B148
B149 -->|call| B71
B149 -->|after return| B150
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL DELAY
```

### B142

```asm
ACALL clear
```

### B143

Return to the instruction following the active call.

```asm
RET
```

### B144

```asm
ACALL INLCD
```

### B145

```asm
MOV A,#80H
ACALL CMD
```

### B146

```asm
MOV DPTR,#ro7
acall wstr
```

### B147

```asm
ACALL DELAY
```

### B148

```asm
ACALL clear
```

### B149

Return to the instruction following the active call.

```asm
RET
```

### B150

```asm
ACALL INLCD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 433 to 434"]
B151["B152: instructions - lines 435 to 436"]
B152["B153: instructions - lines 437 to 437"]
B153["B154: instructions - lines 438 to 438"]
B154["B155: instructions - lines 439 to 439"]
B155["B156: MES4 - lines 442 to 442"]
B156["B157: instructions - lines 443 to 444"]
B157["B158: instructions - lines 445 to 446"]
B158["B159: instructions - lines 447 to 448"]
B159["B160: instructions - lines 449 to 450"]
B150 -->|call| B65
B150 -->|after return| B151
B151 -->|call| B95
B151 -->|after return| B152
B152 -->|call| B105
B152 -->|after return| B153
B153 -->|call| B55
B153 -->|after return| B154
B155 -->|call| B71
B155 -->|after return| B156
B156 -->|call| B65
B156 -->|after return| B157
B157 -->|call| B95
B157 -->|after return| B158
B158 -->|call| B65
B158 -->|after return| B159
B159 -->|call| B95
B159 -->|after return| B160
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B71["Continue at B72 in section 8"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#80H
ACALL CMD
```

### B152

```asm
MOV DPTR,#ro8
ACALL WSTR
```

### B153

```asm
ACALL DELAY
```

### B154

```asm
acall clear
```

### B155

Return to the instruction following the active call.

```asm
RET
```

### B156

```asm
ACALL INLCD
```

### B157

```asm
MOV A,#80H
ACALL CMD
```

### B158

```asm
MOV DPTR,#ro14
ACALL WSTR
```

### B159

```asm
MOV A,#0C0H
ACALL CMD
```

### B160

```asm
MOV DPTR,#ro15
ACALL WSTR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 451 to 451"]
B161["B162: instructions - lines 452 to 452"]
B162["B163: instructions - lines 453 to 453"]
B163["B164: YES - lines 456 to 456"]
B164["B165: instructions - lines 457 to 458"]
B165["B166: instructions - lines 459 to 460"]
B166["B167: instructions - lines 461 to 462"]
B167["B168: instructions - lines 463 to 463"]
B168["B169: instructions - lines 464 to 464"]
B169["B170: instructions - lines 465 to 465"]
B160 -->|call| B105
B160 -->|after return| B161
B161 -->|call| B55
B161 -->|after return| B162
B163 -->|call| B71
B163 -->|after return| B164
B164 -->|call| B65
B164 -->|after return| B165
B165 -->|condition true| B198
B165 -->|condition false| B166
B166 -->|call| B95
B166 -->|after return| B167
B167 -->|call| B105
B167 -->|after return| B168
B168 -->|call| B55
B168 -->|after return| B169
B169 -->|jump| B171
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B198["Continue at B199 in section 20"]
B95["Continue at B96 in section 10"]
B171["Continue at B172 in section 18"]
```

### B161

```asm
ACALL DELAY
```

### B162

```asm
ACALL clear
```

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
ACALL INLCD
```

### B165

```asm
MOV A,#80H
ACALL CMD
```

### B166

```asm
mov a,66
cjne a,#01,next
```

### B167

```asm
MOV DPTR,#ro9
ACALL WSTR
```

### B168

```asm
ACALL DELAY
```

### B169

```asm
acall clear
```

### B170

```asm
sjmp block0
```

## Section 18

```mermaid
flowchart TD
B170["B171: NEXTC - lines 467 to 467"]
B171["B172: BLOCK0 - lines 470 to 470"]
B172["B173: NO - lines 473 to 473"]
B173["B174: instructions - lines 474 to 475"]
B174["B175: instructions - lines 476 to 477"]
B175["B176: instructions - lines 478 to 478"]
B176["B177: instructions - lines 479 to 479"]
B177["B178: instructions - lines 480 to 480"]
B178["B179: YES1 - lines 483 to 483"]
B179["B180: instructions - lines 484 to 485"]
B170 -->|jump| B14
B172 -->|call| B71
B172 -->|after return| B173
B173 -->|call| B65
B173 -->|after return| B174
B174 -->|call| B95
B174 -->|after return| B175
B175 -->|call| B105
B175 -->|after return| B176
B176 -->|call| B55
B176 -->|after return| B177
B178 -->|call| B71
B178 -->|after return| B179
B179 -->|call| B65
B179 -->|after return| B180
B14["Continue at B15 in section 2"]
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
Ljmp loop
```

### B172

Return to the instruction following the active call.

```asm
RET
```

### B173

```asm
ACALL INLCD
```

### B174

```asm
MOV A,#80H
ACALL CMD
```

### B175

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B176

```asm
ACALL DELAY
```

### B177

```asm
ACALL clear
```

### B178

Return to the instruction following the active call.

```asm
RET
```

### B179

```asm
ACALL INLCD
```

### B180

```asm
MOV A,#80H
ACALL CMD
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 486 to 487"]
B181["B182: instructions - lines 488 to 488"]
B182["B183: instructions - lines 489 to 489"]
B183["B184: instructions - lines 490 to 490"]
B184["B185: MONTH - lines 493 to 493"]
B185["B186: instructions - lines 494 to 495"]
B186["B187: instructions - lines 496 to 497"]
B187["B188: instructions - lines 498 to 498"]
B188["B189: instructions - lines 499 to 499"]
B189["B190: instructions - lines 500 to 500"]
B180 -->|call| B95
B180 -->|after return| B181
B181 -->|call| B105
B181 -->|after return| B182
B182 -->|call| B55
B182 -->|after return| B183
B184 -->|call| B71
B184 -->|after return| B185
B185 -->|call| B65
B185 -->|after return| B186
B186 -->|call| B95
B186 -->|after return| B187
B187 -->|call| B105
B187 -->|after return| B188
B188 -->|call| B55
B188 -->|after return| B189
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
```

### B181

```asm
MOV DPTR,#ro17
ACALL WSTR
```

### B182

```asm
ACALL DELAY
```

### B183

```asm
ACALL clear
```

### B184

Return to the instruction following the active call.

```asm
RET
```

### B185

```asm
ACALL INLCD
```

### B186

```asm
MOV A,#80H
ACALL CMD
```

### B187

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B188

```asm
ACALL DELAY
```

### B189

```asm
ACALL clear
```

### B190

Return to the instruction following the active call.

```asm
RET
```

## Section 20

```mermaid
flowchart TD
B190["B191: FDOZE - lines 503 to 503"]
B191["B192: instructions - lines 504 to 505"]
B192["B193: instructions - lines 506 to 507"]
B193["B194: instructions - lines 508 to 509"]
B194["B195: instructions - lines 510 to 511"]
B195["B196: instructions - lines 512 to 513"]
B196["B197: instructions - lines 514 to 514"]
B197["B198: instructions - lines 515 to 515"]
B198["B199: NEXT - lines 518 to 519"]
B199["B200: instructions - lines 520 to 521"]
B190 -->|call| B71
B190 -->|after return| B191
B191 -->|call| B65
B191 -->|after return| B192
B192 -->|call| B95
B192 -->|after return| B193
B193 -->|call| B65
B193 -->|after return| B194
B194 -->|condition true| B198
B194 -->|condition false| B195
B195 -->|call| B95
B195 -->|after return| B196
B196 -->|call| B105
B196 -->|after return| B197
B197 -->|call| B55
B197 -->|after return| B198
B198 -->|call| B65
B198 -->|after return| B199
B199 -->|call| B95
B199 -->|after return| B200
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
ACALL INLCD
```

### B192

```asm
MOV A,#80H
ACALL CMD
```

### B193

```asm
MOV DPTR,#ro16
ACALL WSTR
```

### B194

```asm
MOV A,#0C0H
ACALL CMD
```

### B195

```asm
mov a,67
cjne a,#01,next
```

### B196

```asm
MOV DPTR,#ro17
ACALL WSTR
```

### B197

```asm
ACALL DELAY
```

### B198

```asm
acall clear
```

### B199

```asm
MOV A,#0C0H
ACALL CMD
```

### B200

```asm
MOV DPTR,#ro10
ACALL WSTR
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 522 to 522"]
B201["B202: instructions - lines 523 to 523"]
B202["B203: instructions - lines 524 to 524"]
B203["B204: SEDOZE - lines 527 to 527"]
B204["B205: instructions - lines 528 to 529"]
B205["B206: instructions - lines 530 to 531"]
B206["B207: instructions - lines 532 to 532"]
B207["B208: instructions - lines 533 to 533"]
B208["B209: instructions - lines 534 to 534"]
B209["B210: STOP - lines 599 to 599"]
B200 -->|call| B105
B200 -->|after return| B201
B201 -->|call| B55
B201 -->|after return| B202
B203 -->|call| B71
B203 -->|after return| B204
B204 -->|call| B65
B204 -->|after return| B205
B205 -->|call| B95
B205 -->|after return| B206
B206 -->|call| B105
B206 -->|after return| B207
B207 -->|call| B55
B207 -->|after return| B208
B209 -->|jump| B209
B105["Continue at B106 in section 11"]
B55["Continue at B56 in section 6"]
B71["Continue at B72 in section 8"]
B65["Continue at B66 in section 7"]
B95["Continue at B96 in section 10"]
```

### B201

```asm
ACALL DELAY
```

### B202

```asm
acall clear
```

### B203

Return to the instruction following the active call.

```asm
RET
```

### B204

```asm
ACALL INLCD
```

### B205

```asm
MOV A,#80H
ACALL CMD
```

### B206

```asm
MOV DPTR,#ro18
ACALL WSTR
```

### B207

```asm
ACALL DELAY
```

### B208

```asm
acall clear
```

### B209

Return to the instruction following the active call.

```asm
RET
```

### B210

```asm
sjmp stop
```
