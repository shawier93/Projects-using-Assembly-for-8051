# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG	0` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 11 to 11"]
B1["B2: instructions - lines 12 to 12"]
B2["B3: instructions - lines 14 to 14"]
B3["B4: instructions - lines 15 to 15"]
B4["B5: instructions - lines 16 to 16"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: PRICE - lines 20 to 20"]
B7["B8: instructions - lines 21 to 21"]
B8["B9: instructions - lines 22 to 22"]
B9["B10: instructions - lines 23 to 24"]
B0 -->|call| B141
B0 -->|after return| B1
B1 -->|call| B158
B1 -->|after return| B2
B2 -->|call| B100
B2 -->|after return| B3
B3 -->|call| B6
B3 -->|after return| B4
B4 -->|call| B164
B4 -->|after return| B5
B5 -->|jump| B5
B6 -->|call| B148
B6 -->|after return| B7
B7 -->|call| B174
B7 -->|after return| B8
B8 -->|call| B113
B8 -->|after return| B9
B9 -->|condition true| B11
B9 -->|condition false| B10
B141["Continue at B142 in section 15"]
B158["Continue at B159 in section 16"]
B100["Continue at B101 in section 11"]
B164["Continue at B165 in section 17"]
B148["Continue at B149 in section 15"]
B174["Continue at B175 in section 18"]
B113["Continue at B114 in section 12"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
ACALL WELCOME
```

### B3

```asm
ACALL CASH
```

### B4

```asm
ACALL PRICE
```

### B5

```asm
ACALL COMPLETE
```

### B6

```asm
SJMP $
```

### B7

```asm
ACALL CLEAR
```

### B8

```asm
ACALL ENTERTYPE
```

### B9

```asm
ACALL KEYPAD
```

### B10

```asm
SUBB A,#30H
CJNE A,#1H,LC2
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 26 to 27"]
B11["B12: LC2 - lines 29 to 29"]
B12["B13: instructions - lines 31 to 32"]
B13["B14: LC3 - lines 34 to 34"]
B14["B15: instructions - lines 36 to 37"]
B15["B16: LC4 - lines 40 to 40"]
B16["B17: instructions - lines 41 to 41"]
B17["B18: LCR - lines 45 to 45"]
B18["B19: instructions - lines 46 to 46"]
B19["B20: instructions - lines 47 to 47"]
B10 -->|jump| B17
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|jump| B17
B13 -->|condition true| B15
B13 -->|condition false| B14
B14 -->|jump| B17
B15 -->|condition true| B6
B15 -->|condition false| B16
B16 -->|next| B17
B17 -->|call| B148
B17 -->|after return| B18
B18 -->|call| B185
B18 -->|after return| B19
B19 -->|call| B113
B19 -->|after return| B20
B6["Continue at B7 in section 1"]
B148["Continue at B149 in section 15"]
B185["Continue at B186 in section 19"]
B113["Continue at B114 in section 12"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV	33H,#2
SJMP LCR
```

### B12

```asm
CJNE A,#2H,LC3
```

### B13

```asm
MOV	33H,#3
SJMP LCR
```

### B14

```asm
CJNE A,#3H,LC4
```

### B15

```asm
MOV	33H,#3
SJMP LCR
```

### B16

```asm
CJNE A,#4H,PRICE
```

### B17

```asm
MOV	33H,#4
```

### B18

```asm
ACALL CLEAR
```

### B19

```asm
ACALL CUPSIZE
```

### B20

```asm
ACALL KEYPAD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 48 to 49"]
B21["B22: instructions - lines 51 to 51"]
B22["B23: LCR2 - lines 53 to 53"]
B23["B24: instructions - lines 55 to 58"]
B24["B25: LCR3 - lines 60 to 60"]
B25["B26: instructions - lines 62 to 64"]
B26["B27: LMT - lines 69 to 69"]
B27["B28: instructions - lines 70 to 70"]
B28["B29: instructions - lines 71 to 71"]
B29["B30: instructions - lines 72 to 75"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B26
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B26
B24 -->|condition true| B17
B24 -->|condition false| B25
B25 -->|next| B26
B26 -->|call| B148
B26 -->|after return| B27
B27 -->|call| B192
B27 -->|after return| B28
B28 -->|call| B113
B28 -->|after return| B29
B29 -->|condition true| B32
B29 -->|condition false| B30
B17["Continue at B18 in section 2"]
B148["Continue at B149 in section 15"]
B192["Continue at B193 in section 20"]
B113["Continue at B114 in section 12"]
B32["Continue at B33 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
SUBB A,#30H
CJNE A,#1,LCR2
```

### B22

```asm
SJMP LMT
```

### B23

```asm
CJNE A,#2,LCR3
```

### B24

```asm
MOV	A,33H
ADD	A,#1
MOV	33H,A
SJMP LMT
```

### B25

```asm
CJNE A,#3,LCR
```

### B26

```asm
MOV	A,33H
ADD	A,#2
MOV	33H,A
```

### B27

```asm
ACALL CLEAR
```

### B28

```asm
ACALL MILKTYPE
```

### B29

```asm
ACALL KEYPAD
```

### B30

```asm
SUBB A,#30H
MOV 70H,A
CJNE A,#1H,LMT2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 76 to 76"]
B31["B32: instructions - lines 77 to 77"]
B32["B33: LMT2 - lines 81 to 81"]
B33["B34: instructions - lines 82 to 82"]
B34["B35: instructions - lines 83 to 83"]
B35["B36: LMT3 - lines 86 to 86"]
B36["B37: instructions - lines 87 to 87"]
B37["B38: instructions - lines 88 to 88"]
B38["B39: LSL - lines 93 to 93"]
B39["B40: instructions - lines 94 to 94"]
B30 -->|call| B199
B30 -->|after return| B31
B31 -->|jump| B38
B32 -->|condition true| B35
B32 -->|condition false| B33
B33 -->|call| B199
B33 -->|after return| B34
B34 -->|jump| B38
B35 -->|condition true| B26
B35 -->|condition false| B36
B36 -->|call| B199
B36 -->|after return| B37
B37 -->|jump| B38
B38 -->|call| B148
B38 -->|after return| B39
B39 -->|call| B213
B39 -->|after return| B40
B199["Continue at B200 in section 20"]
B26["Continue at B27 in section 3"]
B148["Continue at B149 in section 15"]
B213["Continue at B214 in section 22"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL MILKTYPE2
```

### B32

```asm
Sjmp LSL
```

### B33

```asm
CJNE A,#2,LMT3
```

### B34

```asm
ACALL MILKTYPE2
```

### B35

```asm
Sjmp LSL
```

### B36

```asm
CJNE A,#3,LMT
```

### B37

```asm
ACALL MILKTYPE2
```

### B38

```asm
Sjmp LSL
```

### B39

```asm
ACALL CLEAR
```

### B40

```asm
ACALL SUGARLEVEL
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 95 to 95"]
B41["B42: instructions - lines 96 to 99"]
B42["B43: instructions - lines 100 to 100"]
B43["B44: instructions - lines 101 to 101"]
B44["B45: LSL2 - lines 103 to 103"]
B45["B46: instructions - lines 104 to 104"]
B46["B47: instructions - lines 105 to 105"]
B47["B48: LSL3 - lines 107 to 107"]
B48["B49: instructions - lines 108 to 108"]
B49["B50: instructions - lines 109 to 109"]
B40 -->|call| B113
B40 -->|after return| B41
B41 -->|condition true| B44
B41 -->|condition false| B42
B42 -->|call| B224
B42 -->|after return| B43
B43 -->|jump| B52
B44 -->|condition true| B47
B44 -->|condition false| B45
B45 -->|call| B224
B45 -->|after return| B46
B46 -->|jump| B52
B47 -->|condition true| B50
B47 -->|condition false| B48
B48 -->|call| B224
B48 -->|after return| B49
B49 -->|jump| B52
B113["Continue at B114 in section 12"]
B224["Continue at B225 in section 23"]
B52["Continue at B53 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL KEYPAD
```

### B42

```asm
SUBB A,#30H
MOV 71H,A
CJNE A,#1,LSL2
```

### B43

```asm
ACALL SUGARLEVEL2
```

### B44

```asm
SJMP PRE
```

### B45

```asm
CJNE A,#2,LSL3
```

### B46

```asm
ACALL SUGARLEVEL2
```

### B47

```asm
SJMP PRE
```

### B48

```asm
CJNE A,#3,LSL4
```

### B49

```asm
ACALL SUGARLEVEL2
```

### B50

```asm
SJMP PRE
```

## Section 6

```mermaid
flowchart TD
B50["B51: LSL4 - lines 111 to 111"]
B51["B52: instructions - lines 112 to 112"]
B52["B53: PRE - lines 117 to 117"]
B53["B54: instructions - lines 118 to 118"]
B54["B55: PR - lines 120 to 121"]
B55["B56: instructions - lines 123 to 125"]
B56["B57: instructions - lines 126 to 128"]
B57["B58: instructions - lines 129 to 130"]
B58["B59: instructions - lines 131 to 132"]
B59["B60: instructions - lines 133 to 134"]
B50 -->|condition true| B38
B50 -->|condition false| B51
B51 -->|call| B224
B51 -->|after return| B52
B52 -->|call| B148
B52 -->|after return| B53
B53 -->|next| B54
B54 -->|call| B135
B54 -->|after return| B55
B55 -->|condition true| B65
B55 -->|condition false| B56
B56 -->|call| B130
B56 -->|after return| B57
B57 -->|call| B130
B57 -->|after return| B58
B58 -->|call| B130
B58 -->|after return| B59
B59 -->|call| B135
B59 -->|after return| B60
B38["Continue at B39 in section 4"]
B224["Continue at B225 in section 23"]
B148["Continue at B149 in section 15"]
B135["Continue at B136 in section 14"]
B65["Continue at B66 in section 7"]
B130["Continue at B131 in section 14"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
CJNE A,#4,LSL
```

### B52

```asm
ACALL SUGARLEVEL2
```

### B53

```asm
ACALL CLEAR
```

### B54

```asm
MOV R6,#10
```

### B55

```asm
MOV A,#80H
ACALL CMD
```

### B56

```asm
MOV A,#10
SUBB A,R6
JZ HERE
```

### B57

```asm
MOV R5,A
ADD A,#30H
ACALL WCHR
```

### B58

```asm
MOV A,#'0'
ACALL WCHR
```

### B59

```asm
MOV A,#'%'
ACALL WCHR
```

### B60

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 135 to 135"]
B61["B62: instructions - lines 136 to 136"]
B62["B63: BAR - lines 138 to 139"]
B63["B64: instructions - lines 141 to 141"]
B64["B65: instructions - lines 142 to 142"]
B65["B66: HERE - lines 144 to 144"]
B66["B67: instructions - lines 149 to 149"]
B67["B68: instructions - lines 152 to 152"]
B68["B69: FLASH - lines 154 to 162"]
B69["B70: REPT0 - lines 164 to 165"]
B60 -->|call| B237
B60 -->|after return| B61
B61 -->|call| B237
B61 -->|after return| B62
B62 -->|call| B130
B62 -->|after return| B63
B63 -->|call| B237
B63 -->|after return| B64
B64 -->|condition true| B62
B64 -->|condition false| B65
B65 -->|condition true| B54
B65 -->|condition false| B66
B67 -->|next| B68
B68 -->|call| B237
B68 -->|after return| B69
B69 -->|condition true| B71
B69 -->|condition false| B70
B237["Continue at B238 in section 24"]
B130["Continue at B131 in section 14"]
B54["Continue at B55 in section 6"]
B71["Continue at B72 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
MOV A,#'.'
ACALL WCHR
```

### B64

```asm
ACALL DELAY
```

### B65

```asm
DJNZ R5,BAR
```

### B66

```asm
DJNZ R6,PR
```

### B67

Return to the instruction following the active call.

```asm
RET
```

### B68

```asm
mov p2,#0FFH
```

### B69

```asm
CLR P2.0
SETB P2.1
SETB P2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B70

```asm
MOV A,P2
CJNE A,#00000001B,BACK0
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 166 to 166"]
B71["B72: BACK0 - lines 168 to 168"]
B72["B73: instructions - lines 172 to 180"]
B73["B74: REPT1 - lines 182 to 183"]
B74["B75: instructions - lines 184 to 184"]
B75["B76: BACK1 - lines 186 to 186"]
B76["B77: instructions - lines 189 to 197"]
B77["B78: REPT2 - lines 201 to 202"]
B78["B79: instructions - lines 203 to 203"]
B79["B80: BACK2 - lines 205 to 205"]
B70 -->|jump| B69
B72 -->|call| B237
B72 -->|after return| B73
B73 -->|condition true| B75
B73 -->|condition false| B74
B74 -->|jump| B73
B76 -->|call| B237
B76 -->|after return| B77
B77 -->|condition true| B79
B77 -->|condition false| B78
B78 -->|jump| B77
B69["Continue at B70 in section 7"]
B237["Continue at B238 in section 24"]
```

### B71

```asm
SJMP REPT0
```

### B72

Return to the instruction following the active call.

```asm
RET
```

### B73

```asm
clR p2.0
CLR P2.1
SETB P2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B74

```asm
MOV A,P2
CJNE A,#00000011B,BACK1
```

### B75

```asm
SJMP REPT1
```

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
CLR P2.0
clr p2.1
clr p2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B78

```asm
MOV A,P2
CJNE A,#00000111B,BACK2
```

### B79

```asm
SJMP REPT2
```

### B80

Return to the instruction following the active call.

```asm
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 208 to 216"]
B81["B82: REPT3 - lines 218 to 219"]
B82["B83: instructions - lines 220 to 220"]
B83["B84: BACK3 - lines 222 to 222"]
B84["B85: instructions - lines 225 to 233"]
B85["B86: REPT4 - lines 236 to 237"]
B86["B87: instructions - lines 238 to 238"]
B87["B88: BACK4 - lines 240 to 240"]
B88["B89: instructions - lines 243 to 251"]
B89["B90: REPT5 - lines 254 to 255"]
B80 -->|call| B237
B80 -->|after return| B81
B81 -->|condition true| B83
B81 -->|condition false| B82
B82 -->|jump| B81
B84 -->|call| B237
B84 -->|after return| B85
B85 -->|condition true| B87
B85 -->|condition false| B86
B86 -->|jump| B85
B88 -->|call| B237
B88 -->|after return| B89
B89 -->|condition true| B91
B89 -->|condition false| B90
B237["Continue at B238 in section 24"]
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B82

```asm
MOV A,P2
CJNE A,#00001111B,BACK3
```

### B83

```asm
SJMP REPT3
```

### B84

Return to the instruction following the active call.

```asm
RET
```

### B85

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B86

```asm
MOV A,P2
CJNE A,#00011111B,BACK4
```

### B87

```asm
SJMP REPT4
```

### B88

Return to the instruction following the active call.

```asm
RET
```

### B89

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B90

```asm
MOV A,P2
CJNE A,#00111111B,BACK5
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 256 to 256"]
B91["B92: BACK5 - lines 258 to 258"]
B92["B93: instructions - lines 260 to 268"]
B93["B94: REPT6 - lines 271 to 272"]
B94["B95: instructions - lines 273 to 273"]
B95["B96: BACK6 - lines 275 to 275"]
B96["B97: instructions - lines 277 to 285"]
B97["B98: REPT7 - lines 288 to 289"]
B98["B99: instructions - lines 290 to 290"]
B99["B100: BACK7 - lines 292 to 292"]
B90 -->|jump| B89
B92 -->|call| B237
B92 -->|after return| B93
B93 -->|condition true| B95
B93 -->|condition false| B94
B94 -->|jump| B93
B96 -->|call| B237
B96 -->|after return| B97
B97 -->|condition true| B99
B97 -->|condition false| B98
B98 -->|jump| B97
B89["Continue at B90 in section 9"]
B237["Continue at B238 in section 24"]
```

### B91

```asm
SJMP REPT5
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
clr p2.6
SETB P2.7
Acall DELAY
```

### B94

```asm
MOV A,P2
CJNE A,#01111111B,BACK6
```

### B95

```asm
SJMP REPT6
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
clr p2.6
clr p2.7
Acall DELAY
```

### B98

```asm
MOV A,P2
CJNE A,#11111111B,BACK7
```

### B99

```asm
SJMP REPT7
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: CASH - lines 318 to 318"]
B101["B102: instructions - lines 319 to 319"]
B102["B103: instructions - lines 320 to 320"]
B103["B104: instructions - lines 321 to 321"]
B104["B105: instructions - lines 322 to 327"]
B105["B106: instructions - lines 328 to 328"]
B106["B107: instructions - lines 329 to 334"]
B107["B108: instructions - lines 335 to 335"]
B108["B109: instructions - lines 336 to 336"]
B109["B110: instructions - lines 337 to 342"]
B100 -->|call| B148
B100 -->|after return| B101
B101 -->|call| B170
B101 -->|after return| B102
B102 -->|call| B113
B102 -->|after return| B103
B103 -->|call| B130
B103 -->|after return| B104
B104 -->|call| B113
B104 -->|after return| B105
B105 -->|call| B130
B105 -->|after return| B106
B106 -->|call| B130
B106 -->|after return| B107
B107 -->|call| B113
B107 -->|after return| B108
B108 -->|call| B130
B108 -->|after return| B109
B109 -->|call| B113
B109 -->|after return| B110
B148["Continue at B149 in section 15"]
B170["Continue at B171 in section 18"]
B113["Continue at B114 in section 12"]
B130["Continue at B131 in section 14"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
ACALL ENTERCASH
```

### B103

```asm
ACALL KEYPAD
```

### B104

```asm
ACALL  WCHR
```

### B105

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV 60H,A
ACALL KEYPAD
```

### B106

```asm
ACALL WCHR
```

### B107

```asm
SUBB A,#30H
ADD A,60H
MOV 60H,A
MOV A,#'.'
ACALL WCHR
```

### B108

```asm
ACALL KEYPAD
```

### B109

```asm
ACALL  WCHR
```

### B110

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV 61H,A
ACALL KEYPAD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 343 to 343"]
B111["B112: instructions - lines 344 to 347"]
B112["B113: PROGRAM_ROM - lines 351 to 363"]
B113["B114: KEYPAD - lines 376 to 376"]
B114["B115: K1 - lines 377 to 380"]
B115["B116: K2 - lines 382 to 384"]
B116["B117: instructions - lines 385 to 385"]
B117["B118: OVER1 - lines 387 to 390"]
B118["B119: instructions - lines 391 to 394"]
B119["B120: instructions - lines 395 to 398"]
B110 -->|call| B130
B110 -->|after return| B111
B113 -->|next| B114
B114 -->|condition true| B114
B114 -->|condition false| B115
B115 -->|condition true| B117
B115 -->|condition false| B116
B116 -->|jump| B115
B117 -->|condition true| B122
B117 -->|condition false| B118
B118 -->|condition true| B123
B118 -->|condition false| B119
B119 -->|condition true| B124
B119 -->|condition false| B120
B130["Continue at B131 in section 14"]
B122["Continue at B123 in section 13"]
B123["Continue at B124 in section 13"]
B124["Continue at B125 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL  WCHR
```

### B112

Return to the instruction following the active call.

```asm
SUBB A,#30H
ADD A,61H
MOV 61H,A
RET
```

### B113

Return to the instruction following the active call.

```asm
MOV	DPTR,#INX
CLR	A
MOVC A,@A+DPTR
MOV	30H,A
MOV	DPTR,#INY
CLR	A
MOVC A,@A+DPTR
MOV	31H,A
MOV	DPTR,#TIME_DELAY
CLR	A
MOVC A,@A+DPTR
MOV	32H,A
RET
```

### B114

```asm
MOV P0,#01110000B
```

### B115

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B116

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B117

```asm
SJMP K2
```

### B118

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B119

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B120

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 399 to 402"]
B121["B122: instructions - lines 403 to 403"]
B122["B123: ROW_0 - lines 404 to 405"]
B123["B124: ROW_1 - lines 406 to 407"]
B124["B125: ROW_2 - lines 408 to 409"]
B125["B126: ROW_3 - lines 410 to 410"]
B126["B127: FIND - lines 412 to 412"]
B127["B128: FIND1 - lines 414 to 415"]
B128["B129: instructions - lines 416 to 417"]
B129["B130: MATCH - lines 418 to 420"]
B120 -->|condition true| B125
B120 -->|condition false| B121
B121 -->|jump| B115
B122 -->|jump| B126
B123 -->|jump| B126
B124 -->|jump| B126
B125 -->|next| B126
B126 -->|next| B127
B127 -->|condition true| B129
B127 -->|condition false| B128
B128 -->|jump| B127
B115["Continue at B116 in section 12"]
```

### B121

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B122

```asm
LJMP K2
```

### B123

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B124

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B125

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B126

```asm
MOV DPTR,#KCODE3
```

### B127

```asm
RLC A
```

### B128

```asm
RLC A
JNC MATCH
```

### B129

```asm
INC DPTR
SJMP FIND1
```

### B130

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

## Section 14

```mermaid
flowchart TD
B130["B131: WCHR - lines 423 to 427"]
B131["B132: instructions - lines 428 to 428"]
B132["B133: instructions - lines 429 to 431"]
B133["B134: instructions - lines 432 to 432"]
B134["B135: instructions - lines 433 to 435"]
B135["B136: CMD - lines 438 to 440"]
B136["B137: instructions - lines 441 to 441"]
B137["B138: instructions - lines 442 to 444"]
B138["B139: instructions - lines 445 to 445"]
B139["B140: instructions - lines 446 to 446"]
B130 -->|call| B140
B130 -->|after return| B131
B131 -->|call| B146
B131 -->|after return| B132
B132 -->|call| B140
B132 -->|after return| B133
B133 -->|call| B146
B133 -->|after return| B134
B135 -->|call| B140
B135 -->|after return| B136
B136 -->|call| B146
B136 -->|after return| B137
B137 -->|call| B140
B137 -->|after return| B138
B138 -->|call| B146
B138 -->|after return| B139
B140["Continue at B141 in section 15"]
B146["Continue at B147 in section 15"]
```

### B131

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B132

```asm
ACALL LDELAY
```

### B133

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B134

```asm
ACALL LDELAY
```

### B135

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B136

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B137

```asm
ACALL LDELAY
```

### B138

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B139

```asm
ACALL LDELAY
```

### B140

Return to the instruction following the active call.

```asm
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: COMMON - lines 449 to 454"]
B141["B142: INLCD - lines 457 to 464"]
B142["B143: instructions - lines 465 to 473"]
B143["B144: instructions - lines 474 to 486"]
B144["B145: instructions - lines 487 to 497"]
B145["B146: instructions - lines 498 to 498"]
B146["B147: LDELAY - lines 501 to 502"]
B147["B148: instructions - lines 503 to 503"]
B148["B149: CLEAR - lines 506 to 507"]
B149["B150: instructions - lines 508 to 508"]
B141 -->|call| B146
B141 -->|after return| B142
B142 -->|call| B146
B142 -->|after return| B143
B143 -->|call| B146
B143 -->|after return| B144
B144 -->|call| B146
B144 -->|after return| B145
B146 -->|condition true| B146
B146 -->|condition false| B147
B148 -->|call| B135
B148 -->|after return| B149
B149 -->|next| B150
B135["Continue at B136 in section 14"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B142

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

### B143

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

### B144

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

### B145

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

### B146

Return to the instruction following the active call.

```asm
RET
```

### B147

```asm
MOV R0, #50
DJNZ R0, $
```

### B148

Return to the instruction following the active call.

```asm
RET
```

### B149

```asm
MOV A,#01H
ACALL CMD
```

### B150

```asm
MOV R7,#14
```

## Section 16

```mermaid
flowchart TD
B150["B151: WAIT - lines 509 to 509"]
B151["B152: instructions - lines 510 to 510"]
B152["B153: instructions - lines 511 to 511"]
B153["B154: WSTR - lines 514 to 514"]
B154["B155: CONT1 - lines 516 to 518"]
B155["B156: PRINT - lines 520 to 520"]
B156["B157: instructions - lines 521 to 522"]
B157["B158: EXIT1 - lines 523 to 524"]
B158["B159: WELCOME - lines 528 to 529"]
B159["B160: instructions - lines 530 to 531"]
B150 -->|call| B146
B150 -->|after return| B151
B151 -->|condition true| B150
B151 -->|condition false| B152
B153 -->|next| B154
B154 -->|condition true| B157
B154 -->|condition false| B155
B155 -->|call| B130
B155 -->|after return| B156
B156 -->|jump| B154
B158 -->|call| B135
B158 -->|after return| B159
B159 -->|call| B153
B159 -->|after return| B160
B146["Continue at B147 in section 15"]
B130["Continue at B131 in section 14"]
B135["Continue at B136 in section 14"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL LDELAY
```

### B152

```asm
DJNZ R7,WAIT
```

### B153

Return to the instruction following the active call.

```asm
ret
```

### B154

```asm
PUSH    ACC
```

### B155

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B156

```asm
ACALL    WCHR
```

### B157

```asm
INC DPTR
AJMP    CONT1
```

### B158

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B159

```asm
mov a, #80H
acall cmd
```

### B160

```asm
mov dptr, #WEL1
acall wstr
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 533 to 534"]
B161["B162: instructions - lines 535 to 536"]
B162["B163: instructions - lines 537 to 537"]
B163["B164: instructions - lines 538 to 538"]
B164["B165: COMPLETE - lines 541 to 542"]
B165["B166: instructions - lines 543 to 544"]
B166["B167: instructions - lines 546 to 547"]
B167["B168: instructions - lines 548 to 549"]
B168["B169: instructions - lines 550 to 550"]
B169["B170: instructions - lines 551 to 551"]
B160 -->|call| B135
B160 -->|after return| B161
B161 -->|call| B153
B161 -->|after return| B162
B162 -->|call| B237
B162 -->|after return| B163
B164 -->|call| B135
B164 -->|after return| B165
B165 -->|call| B153
B165 -->|after return| B166
B166 -->|call| B135
B166 -->|after return| B167
B167 -->|call| B153
B167 -->|after return| B168
B168 -->|call| B237
B168 -->|after return| B169
B135["Continue at B136 in section 14"]
B153["Continue at B154 in section 16"]
B237["Continue at B238 in section 24"]
```

### B161

```asm
mov a,#0c0h
acall cmd
```

### B162

```asm
mov dptr, #WEL2
acall wstr
```

### B163

```asm
acall delay
```

### B164

Return to the instruction following the active call.

```asm
ret
```

### B165

```asm
mov a, #80H
acall cmd
```

### B166

```asm
mov dptr, #comp1
acall wstr
```

### B167

```asm
mov a,#0c0h
acall cmd
```

### B168

```asm
mov dptr, #comp2
acall wstr
```

### B169

```asm
acall delay
```

### B170

Return to the instruction following the active call.

```asm
ret
```

## Section 18

```mermaid
flowchart TD
B170["B171: ENTERCASH - lines 554 to 555"]
B171["B172: instructions - lines 556 to 557"]
B172["B173: instructions - lines 558 to 559"]
B173["B174: instructions - lines 560 to 560"]
B174["B175: ENTERTYPE - lines 563 to 564"]
B175["B176: instructions - lines 565 to 566"]
B176["B177: instructions - lines 567 to 567"]
B177["B178: instructions - lines 568 to 568"]
B178["B179: instructions - lines 570 to 571"]
B179["B180: instructions - lines 572 to 573"]
B170 -->|call| B135
B170 -->|after return| B171
B171 -->|call| B153
B171 -->|after return| B172
B172 -->|call| B135
B172 -->|after return| B173
B174 -->|call| B135
B174 -->|after return| B175
B175 -->|call| B153
B175 -->|after return| B176
B176 -->|call| B237
B176 -->|after return| B177
B177 -->|call| B148
B177 -->|after return| B178
B178 -->|call| B135
B178 -->|after return| B179
B179 -->|call| B153
B179 -->|after return| B180
B135["Continue at B136 in section 14"]
B153["Continue at B154 in section 16"]
B237["Continue at B238 in section 24"]
B148["Continue at B149 in section 15"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
mov a, #80H
acall cmd
```

### B172

```asm
mov dptr, #ENT1
acall wstr
```

### B173

```asm
mov a,#0c0h
acall cmd
```

### B174

Return to the instruction following the active call.

```asm
ret
```

### B175

```asm
mov a, #80H
acall cmd
```

### B176

```asm
mov dptr, #T1
acall wstr
```

### B177

```asm
ACALL DELAY
```

### B178

```asm
ACALL CLEAR
```

### B179

```asm
mov a,#80h
acall cmd
```

### B180

```asm
mov dptr, #T2
acall wstr
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 574 to 574"]
B181["B182: instructions - lines 575 to 576"]
B182["B183: instructions - lines 577 to 578"]
B183["B184: instructions - lines 579 to 579"]
B184["B185: instructions - lines 580 to 580"]
B185["B186: CUPSIZE - lines 583 to 584"]
B186["B187: instructions - lines 585 to 586"]
B187["B188: instructions - lines 587 to 587"]
B188["B189: instructions - lines 588 to 589"]
B189["B190: instructions - lines 590 to 591"]
B180 -->|call| B237
B180 -->|after return| B181
B181 -->|call| B135
B181 -->|after return| B182
B182 -->|call| B153
B182 -->|after return| B183
B183 -->|call| B237
B183 -->|after return| B184
B185 -->|call| B135
B185 -->|after return| B186
B186 -->|call| B153
B186 -->|after return| B187
B187 -->|call| B237
B187 -->|after return| B188
B188 -->|call| B135
B188 -->|after return| B189
B189 -->|call| B153
B189 -->|after return| B190
B237["Continue at B238 in section 24"]
B135["Continue at B136 in section 14"]
B153["Continue at B154 in section 16"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
acall delay
```

### B182

```asm
mov a,#0C0h
acall cmd
```

### B183

```asm
mov dptr, #T3
acall wstr
```

### B184

```asm
acall delay
```

### B185

Return to the instruction following the active call.

```asm
ret
```

### B186

```asm
mov a,#80h
acall cmd
```

### B187

```asm
mov dptr, #C1
acall wstr
```

### B188

```asm
acall delay
```

### B189

```asm
mov a,#0C0h
acall cmd
```

### B190

```asm
mov dptr, #C2
acall wstr
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 592 to 592"]
B191["B192: instructions - lines 593 to 593"]
B192["B193: MILKTYPE - lines 596 to 597"]
B193["B194: instructions - lines 598 to 599"]
B194["B195: instructions - lines 600 to 600"]
B195["B196: instructions - lines 601 to 602"]
B196["B197: instructions - lines 603 to 604"]
B197["B198: instructions - lines 605 to 605"]
B198["B199: instructions - lines 606 to 606"]
B199["B200: MILKTYPE2 - lines 609 to 609"]
B190 -->|call| B237
B190 -->|after return| B191
B192 -->|call| B135
B192 -->|after return| B193
B193 -->|call| B153
B193 -->|after return| B194
B194 -->|call| B237
B194 -->|after return| B195
B195 -->|call| B135
B195 -->|after return| B196
B196 -->|call| B153
B196 -->|after return| B197
B197 -->|call| B237
B197 -->|after return| B198
B199 -->|call| B237
B199 -->|after return| B200
B237["Continue at B238 in section 24"]
B135["Continue at B136 in section 14"]
B153["Continue at B154 in section 16"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
acall delay
```

### B192

Return to the instruction following the active call.

```asm
ret
```

### B193

```asm
mov a,#80h
acall cmd
```

### B194

```asm
mov dptr, #M1
acall wstr
```

### B195

```asm
acall delay
```

### B196

```asm
mov a,#0C0h
acall cmd
```

### B197

```asm
mov dptr, #M2
acall wstr
```

### B198

```asm
acall delay
```

### B199

Return to the instruction following the active call.

```asm
ret
```

### B200

```asm
ACALL DELAY
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 610 to 610"]
B201["B202: instructions - lines 611 to 612"]
B202["B203: instructions - lines 613 to 614"]
B203["B204: instructions - lines 615 to 615"]
B204["B205: instructions - lines 616 to 617"]
B205["B206: instructions - lines 618 to 619"]
B206["B207: instructions - lines 620 to 621"]
B207["B208: N1 - lines 622 to 622"]
B208["B209: instructions - lines 623 to 624"]
B209["B210: N2 - lines 626 to 626"]
B200 -->|call| B148
B200 -->|after return| B201
B201 -->|call| B135
B201 -->|after return| B202
B202 -->|call| B153
B202 -->|after return| B203
B203 -->|call| B237
B203 -->|after return| B204
B204 -->|call| B135
B204 -->|after return| B205
B205 -->|condition true| B207
B205 -->|condition false| B206
B206 -->|jump| B210
B207 -->|condition true| B209
B207 -->|condition false| B208
B208 -->|jump| B210
B209 -->|next| B210
B148["Continue at B149 in section 15"]
B135["Continue at B136 in section 14"]
B153["Continue at B154 in section 16"]
B237["Continue at B238 in section 24"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL CLEAR
```

### B202

```asm
mov a,#80h
acall cmd
```

### B203

```asm
mov dptr, #M3
acall wstr
```

### B204

```asm
acall delay
```

### B205

```asm
mov a,#0C0h
acall cmd
```

### B206

```asm
MOV A,70H
CJNE A,#1,N1
```

### B207

```asm
mov dptr, #M4
SJMP N3
```

### B208

```asm
CJNE A,#2,N2
```

### B209

```asm
mov dptr, #M5
SJMP N3
```

### B210

```asm
mov dptr, #M6
```

## Section 22

```mermaid
flowchart TD
B210["B211: N3 - lines 628 to 628"]
B211["B212: instructions - lines 629 to 629"]
B212["B213: instructions - lines 630 to 630"]
B213["B214: SUGARLEVEL - lines 633 to 634"]
B214["B215: instructions - lines 635 to 636"]
B215["B216: instructions - lines 637 to 637"]
B216["B217: instructions - lines 638 to 638"]
B217["B218: instructions - lines 640 to 641"]
B218["B219: instructions - lines 642 to 643"]
B219["B220: instructions - lines 644 to 644"]
B210 -->|call| B153
B210 -->|after return| B211
B211 -->|call| B237
B211 -->|after return| B212
B213 -->|call| B135
B213 -->|after return| B214
B214 -->|call| B153
B214 -->|after return| B215
B215 -->|call| B237
B215 -->|after return| B216
B216 -->|call| B148
B216 -->|after return| B217
B217 -->|call| B135
B217 -->|after return| B218
B218 -->|call| B153
B218 -->|after return| B219
B219 -->|call| B237
B219 -->|after return| B220
B153["Continue at B154 in section 16"]
B237["Continue at B238 in section 24"]
B135["Continue at B136 in section 14"]
B148["Continue at B149 in section 15"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
acall wstr
```

### B212

```asm
acall delay
```

### B213

Return to the instruction following the active call.

```asm
ret
```

### B214

```asm
mov a, #80H
acall cmd
```

### B215

```asm
mov dptr, #S1
acall wstr
```

### B216

```asm
ACALL DELAY
```

### B217

```asm
ACALL CLEAR
```

### B218

```asm
mov a,#80h
acall cmd
```

### B219

```asm
mov dptr, #S2
acall wstr
```

### B220

```asm
acall delay
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 645 to 646"]
B221["B222: instructions - lines 647 to 648"]
B222["B223: instructions - lines 649 to 649"]
B223["B224: instructions - lines 650 to 650"]
B224["B225: SUGARLEVEL2 - lines 653 to 653"]
B225["B226: instructions - lines 654 to 654"]
B226["B227: instructions - lines 655 to 656"]
B227["B228: instructions - lines 658 to 659"]
B228["B229: instructions - lines 660 to 661"]
B229["B230: NN1 - lines 662 to 662"]
B220 -->|call| B135
B220 -->|after return| B221
B221 -->|call| B153
B221 -->|after return| B222
B222 -->|call| B237
B222 -->|after return| B223
B224 -->|call| B237
B224 -->|after return| B225
B225 -->|call| B148
B225 -->|after return| B226
B226 -->|call| B135
B226 -->|after return| B227
B227 -->|condition true| B229
B227 -->|condition false| B228
B228 -->|jump| B234
B229 -->|condition true| B231
B229 -->|condition false| B230
B135["Continue at B136 in section 14"]
B153["Continue at B154 in section 16"]
B237["Continue at B238 in section 24"]
B148["Continue at B149 in section 15"]
B234["Continue at B235 in section 24"]
B231["Continue at B232 in section 24"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
mov a,#0C0h
acall cmd
```

### B222

```asm
mov dptr, #S3
acall wstr
```

### B223

```asm
acall delay
```

### B224

Return to the instruction following the active call.

```asm
ret
```

### B225

```asm
ACALL DELAY
```

### B226

```asm
ACALL CLEAR
```

### B227

```asm
mov a,#80h
acall cmd
```

### B228

```asm
MOV A,71H
CJNE A,#1,NN1
```

### B229

```asm
mov dptr, #S4
SJMP NN4
```

### B230

```asm
CJNE A,#2,NN2
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 663 to 664"]
B231["B232: NN2 - lines 665 to 665"]
B232["B233: instructions - lines 666 to 666"]
B233["B234: NN3 - lines 667 to 667"]
B234["B235: NN4 - lines 669 to 669"]
B235["B236: instructions - lines 670 to 670"]
B236["B237: instructions - lines 671 to 671"]
B237["B238: DELAY - lines 675 to 678"]
B238["B239: L1 - lines 679 to 679"]
B239["B240: L3 - lines 680 to 680"]
B230 -->|jump| B234
B231 -->|condition true| B233
B231 -->|condition false| B232
B232 -->|next| B233
B233 -->|next| B234
B234 -->|call| B153
B234 -->|after return| B235
B235 -->|call| B237
B235 -->|after return| B236
B237 -->|next| B238
B238 -->|next| B239
B239 -->|condition true| B239
B239 -->|condition false| B240
B153["Continue at B154 in section 16"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
mov dptr, #S5
SJMP NN4
```

### B232

```asm
CJNE A,#3,NN3
```

### B233

```asm
mov dptr, #S6
```

### B234

```asm
mov dptr, #S7
```

### B235

```asm
acall wstr
```

### B236

```asm
acall delay
```

### B237

Return to the instruction following the active call.

```asm
ret
```

### B238

```asm
PUSH 0
PUSH 1
PUSH 2
MOV	R0,#4
```

### B239

```asm
MOV	R1,#0
```

### B240

```asm
DJNZ R2,L3
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 681 to 681"]
B241["B242: instructions - lines 682 to 685"]
B240 -->|condition true| B238
B240 -->|condition false| B241
B238["Continue at B239 in section 24"]
```

### B241

```asm
DJNZ R0,L1
```

### B242

Return to the instruction following the active call.

```asm
POP 2
POP 1
POP 0
RET
```
