# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG	0` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27) · [Section 28](#section-28) · [Section 29](#section-29)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 11 to 12"]
B1["B2: instructions - lines 13 to 13"]
B2["B3: instructions - lines 14 to 14"]
B3["B4: instructions - lines 15 to 15"]
B4["B5: instructions - lines 16 to 16"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 20 to 20"]
B9["B10: instructions - lines 21 to 21"]
B0 -->|call| B75
B0 -->|after return| B1
B1 -->|call| B147
B1 -->|after return| B2
B2 -->|call| B164
B2 -->|after return| B3
B3 -->|call| B75
B3 -->|after return| B4
B4 -->|call| B112
B4 -->|after return| B5
B5 -->|call| B100
B5 -->|after return| B6
B6 -->|call| B75
B6 -->|after return| B7
B7 -->|call| B11
B7 -->|after return| B8
B8 -->|call| B75
B8 -->|after return| B9
B9 -->|call| B113
B9 -->|after return| B10
B75["Continue at B76 in section 8"]
B147["Continue at B148 in section 15"]
B164["Continue at B165 in section 17"]
B112["Continue at B113 in section 12"]
B100["Continue at B101 in section 11"]
B11["Continue at B12 in section 2"]
B113["Continue at B114 in section 12"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV R3,#-1
acall flash
```

### B2

```asm
ACALL INLCD
```

### B3

```asm
ACALL WELCOME
```

### B4

```asm
acall flash
```

### B5

```asm
ACALL PROGRAM_ROM
```

### B6

```asm
ACALL CASH
```

### B7

```asm
acall flash
```

### B8

```asm
ACALL PRICE
```

### B9

```asm
acall flash
```

### B10

```asm
ACALL DISPLAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 22 to 22"]
B11["B12: PRICE - lines 27 to 27"]
B12["B13: instructions - lines 28 to 28"]
B13["B14: instructions - lines 29 to 29"]
B14["B15: instructions - lines 30 to 31"]
B15["B16: instructions - lines 33 to 34"]
B16["B17: LC2 - lines 36 to 36"]
B17["B18: instructions - lines 38 to 39"]
B18["B19: LC3 - lines 41 to 41"]
B19["B20: instructions - lines 43 to 44"]
B10 -->|jump| B10
B11 -->|call| B154
B11 -->|after return| B12
B12 -->|call| B180
B12 -->|after return| B13
B13 -->|call| B119
B13 -->|after return| B14
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|jump| B22
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B22
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B22
B154["Continue at B155 in section 16"]
B180["Continue at B181 in section 19"]
B119["Continue at B120 in section 12"]
B22["Continue at B23 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
SJMP $
```

### B12

```asm
ACALL CLEAR
```

### B13

```asm
ACALL ENTERTYPE
```

### B14

```asm
ACALL KEYPAD
```

### B15

```asm
SUBB A,#30H
CJNE A,#1H,LC2
```

### B16

```asm
MOV	33H,#2
SJMP LCR
```

### B17

```asm
CJNE A,#2H,LC3
```

### B18

```asm
MOV	33H,#3
SJMP LCR
```

### B19

```asm
CJNE A,#3H,LC4
```

### B20

```asm
MOV	33H,#3
SJMP LCR
```

## Section 3

```mermaid
flowchart TD
B20["B21: LC4 - lines 47 to 47"]
B21["B22: instructions - lines 48 to 48"]
B22["B23: LCR - lines 54 to 54"]
B23["B24: instructions - lines 56 to 56"]
B24["B25: instructions - lines 57 to 57"]
B25["B26: instructions - lines 58 to 58"]
B26["B27: instructions - lines 59 to 60"]
B27["B28: instructions - lines 62 to 62"]
B28["B29: LCR2 - lines 64 to 64"]
B29["B30: instructions - lines 66 to 69"]
B20 -->|condition true| B11
B20 -->|condition false| B21
B21 -->|next| B22
B22 -->|call| B75
B22 -->|after return| B23
B23 -->|call| B154
B23 -->|after return| B24
B24 -->|call| B191
B24 -->|after return| B25
B25 -->|call| B119
B25 -->|after return| B26
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|jump| B32
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B32
B11["Continue at B12 in section 2"]
B75["Continue at B76 in section 8"]
B154["Continue at B155 in section 16"]
B191["Continue at B192 in section 20"]
B119["Continue at B120 in section 12"]
B32["Continue at B33 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
CJNE A,#4H,PRICE
```

### B22

```asm
MOV	33H,#4
```

### B23

```asm
acall flash
```

### B24

```asm
ACALL CLEAR
```

### B25

```asm
ACALL CUPSIZE
```

### B26

```asm
ACALL KEYPAD
```

### B27

```asm
SUBB A,#30H
CJNE A,#1,LCR2
```

### B28

```asm
SJMP LMT
```

### B29

```asm
CJNE A,#2,LCR3
```

### B30

```asm
MOV	A,33H
ADD	A,#1
MOV	33H,A
SJMP LMT
```

## Section 4

```mermaid
flowchart TD
B30["B31: LCR3 - lines 71 to 71"]
B31["B32: instructions - lines 73 to 75"]
B32["B33: LMT - lines 82 to 82"]
B33["B34: instructions - lines 84 to 84"]
B34["B35: instructions - lines 85 to 85"]
B35["B36: instructions - lines 86 to 86"]
B36["B37: instructions - lines 87 to 90"]
B37["B38: instructions - lines 91 to 91"]
B38["B39: instructions - lines 92 to 92"]
B39["B40: LMT2 - lines 96 to 96"]
B30 -->|condition true| B22
B30 -->|condition false| B31
B31 -->|next| B32
B32 -->|call| B75
B32 -->|after return| B33
B33 -->|call| B154
B33 -->|after return| B34
B34 -->|call| B198
B34 -->|after return| B35
B35 -->|call| B119
B35 -->|after return| B36
B36 -->|condition true| B39
B36 -->|condition false| B37
B37 -->|call| B205
B37 -->|after return| B38
B38 -->|jump| B45
B39 -->|condition true| B42
B39 -->|condition false| B40
B22["Continue at B23 in section 3"]
B75["Continue at B76 in section 8"]
B154["Continue at B155 in section 16"]
B198["Continue at B199 in section 20"]
B119["Continue at B120 in section 12"]
B205["Continue at B206 in section 21"]
B45["Continue at B46 in section 5"]
B42["Continue at B43 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#3,LCR
```

### B32

```asm
MOV	A,33H
ADD	A,#2
MOV	33H,A
```

### B33

```asm
acall flash
```

### B34

```asm
ACALL CLEAR
```

### B35

```asm
ACALL MILKTYPE
```

### B36

```asm
ACALL KEYPAD
```

### B37

```asm
SUBB A,#30H
MOV 70H,A
CJNE A,#1H,LMT2
```

### B38

```asm
ACALL MILKTYPE2
```

### B39

```asm
Sjmp LSL
```

### B40

```asm
CJNE A,#2,LMT3
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 97 to 97"]
B41["B42: instructions - lines 98 to 98"]
B42["B43: LMT3 - lines 101 to 101"]
B43["B44: instructions - lines 102 to 102"]
B44["B45: instructions - lines 103 to 103"]
B45["B46: LSL - lines 110 to 110"]
B46["B47: instructions - lines 112 to 112"]
B47["B48: instructions - lines 113 to 113"]
B48["B49: instructions - lines 114 to 114"]
B49["B50: instructions - lines 115 to 118"]
B40 -->|call| B205
B40 -->|after return| B41
B41 -->|jump| B45
B42 -->|condition true| B32
B42 -->|condition false| B43
B43 -->|call| B205
B43 -->|after return| B44
B44 -->|jump| B45
B45 -->|call| B75
B45 -->|after return| B46
B46 -->|call| B154
B46 -->|after return| B47
B47 -->|call| B219
B47 -->|after return| B48
B48 -->|call| B119
B48 -->|after return| B49
B49 -->|condition true| B52
B49 -->|condition false| B50
B205["Continue at B206 in section 21"]
B32["Continue at B33 in section 4"]
B75["Continue at B76 in section 8"]
B154["Continue at B155 in section 16"]
B219["Continue at B220 in section 22"]
B119["Continue at B120 in section 12"]
B52["Continue at B53 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL MILKTYPE2
```

### B42

```asm
Sjmp LSL
```

### B43

```asm
CJNE A,#3,LMT
```

### B44

```asm
ACALL MILKTYPE2
```

### B45

```asm
Sjmp LSL
```

### B46

```asm
acall flash
```

### B47

```asm
ACALL CLEAR
```

### B48

```asm
ACALL SUGARLEVEL
```

### B49

```asm
ACALL KEYPAD
```

### B50

```asm
SUBB A,#30H
MOV 71H,A
CJNE A,#1,LSL2
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 119 to 119"]
B51["B52: instructions - lines 120 to 120"]
B52["B53: LSL2 - lines 122 to 122"]
B53["B54: instructions - lines 123 to 123"]
B54["B55: instructions - lines 124 to 124"]
B55["B56: LSL3 - lines 126 to 126"]
B56["B57: instructions - lines 127 to 127"]
B57["B58: instructions - lines 128 to 128"]
B58["B59: LSL4 - lines 130 to 130"]
B59["B60: instructions - lines 131 to 131"]
B50 -->|call| B230
B50 -->|after return| B51
B51 -->|jump| B60
B52 -->|condition true| B55
B52 -->|condition false| B53
B53 -->|call| B230
B53 -->|after return| B54
B54 -->|jump| B60
B55 -->|condition true| B58
B55 -->|condition false| B56
B56 -->|call| B230
B56 -->|after return| B57
B57 -->|jump| B60
B58 -->|condition true| B45
B58 -->|condition false| B59
B59 -->|call| B230
B59 -->|after return| B60
B230["Continue at B231 in section 24"]
B60["Continue at B61 in section 7"]
B45["Continue at B46 in section 5"]
```

### B51

```asm
ACALL SUGARLEVEL2
```

### B52

```asm
SJMP PRE
```

### B53

```asm
CJNE A,#2,LSL3
```

### B54

```asm
ACALL SUGARLEVEL2
```

### B55

```asm
SJMP PRE
```

### B56

```asm
CJNE A,#3,LSL4
```

### B57

```asm
ACALL SUGARLEVEL2
```

### B58

```asm
SJMP PRE
```

### B59

```asm
CJNE A,#4,LSL
```

### B60

```asm
ACALL SUGARLEVEL2
```

## Section 7

```mermaid
flowchart TD
B60["B61: PRE - lines 136 to 136"]
B61["B62: instructions - lines 137 to 137"]
B62["B63: PR - lines 139 to 140"]
B63["B64: instructions - lines 142 to 144"]
B64["B65: instructions - lines 145 to 147"]
B65["B66: instructions - lines 148 to 149"]
B66["B67: instructions - lines 150 to 151"]
B67["B68: instructions - lines 152 to 153"]
B68["B69: instructions - lines 154 to 154"]
B69["B70: instructions - lines 155 to 155"]
B60 -->|call| B154
B60 -->|after return| B61
B61 -->|next| B62
B62 -->|call| B141
B62 -->|after return| B63
B63 -->|condition true| B73
B63 -->|condition false| B64
B64 -->|call| B136
B64 -->|after return| B65
B65 -->|call| B136
B65 -->|after return| B66
B66 -->|call| B136
B66 -->|after return| B67
B67 -->|call| B141
B67 -->|after return| B68
B68 -->|call| B274
B68 -->|after return| B69
B69 -->|call| B274
B69 -->|after return| B70
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B73["Continue at B74 in section 8"]
B136["Continue at B137 in section 14"]
B274["Continue at B275 in section 28"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL CLEAR
```

### B62

```asm
MOV R6,#10
```

### B63

```asm
MOV A,#80H
ACALL CMD
```

### B64

```asm
MOV A,#10
SUBB A,R6
JZ HERE
```

### B65

```asm
MOV R5,A
ADD A,#30H
ACALL WCHR
```

### B66

```asm
MOV A,#'0'
ACALL WCHR
```

### B67

```asm
MOV A,#'%'
ACALL WCHR
```

### B68

```asm
MOV A,#0C0H
ACALL CMD
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: BAR - lines 157 to 158"]
B71["B72: instructions - lines 160 to 160"]
B72["B73: instructions - lines 161 to 161"]
B73["B74: HERE - lines 163 to 163"]
B74["B75: instructions - lines 165 to 165"]
B75["B76: FLASH - lines 170 to 179"]
B76["B77: instructions - lines 181 to 182"]
B77["B78: instructions - lines 183 to 191"]
B78["B79: instructions - lines 192 to 192"]
B79["B80: REPT1 - lines 195 to 195"]
B70 -->|call| B136
B70 -->|after return| B71
B71 -->|call| B274
B71 -->|after return| B72
B72 -->|condition true| B70
B72 -->|condition false| B73
B73 -->|condition true| B62
B73 -->|condition false| B74
B75 -->|call| B274
B75 -->|after return| B76
B76 -->|condition true| B79
B76 -->|condition false| B77
B77 -->|call| B274
B77 -->|after return| B78
B78 -->|jump| B94
B79 -->|condition true| B82
B79 -->|condition false| B80
B136["Continue at B137 in section 14"]
B274["Continue at B275 in section 28"]
B62["Continue at B63 in section 7"]
B94["Continue at B95 in section 10"]
B82["Continue at B83 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#'.'
ACALL WCHR
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
DJNZ R5,BAR
```

### B74

```asm
DJNZ R6,PR
```

### B75

Return to the instruction following the active call.

```asm
RET
```

### B76

```asm
INC R3
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

### B77

```asm
MOV A,R3
CJNE A,#1,REPT1
```

### B78

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

### B79

```asm
LJMP BACK7
```

### B80

```asm
CJNE A,#2,REPT2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 196 to 204"]
B81["B82: instructions - lines 205 to 205"]
B82["B83: REPT2 - lines 208 to 208"]
B83["B84: instructions - lines 209 to 217"]
B84["B85: REPT3 - lines 220 to 220"]
B85["B86: instructions - lines 221 to 229"]
B86["B87: instructions - lines 230 to 230"]
B87["B88: REPT4 - lines 233 to 233"]
B88["B89: instructions - lines 234 to 242"]
B89["B90: instructions - lines 243 to 243"]
B80 -->|call| B274
B80 -->|after return| B81
B81 -->|jump| B94
B82 -->|condition true| B84
B82 -->|condition false| B83
B83 -->|jump| B94
B84 -->|condition true| B87
B84 -->|condition false| B85
B85 -->|call| B274
B85 -->|after return| B86
B86 -->|jump| B94
B87 -->|condition true| B90
B87 -->|condition false| B88
B88 -->|call| B274
B88 -->|after return| B89
B89 -->|jump| B94
B274["Continue at B275 in section 28"]
B94["Continue at B95 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

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

### B82

```asm
LJMP BACK7
```

### B83

```asm
CJNE A,#3,REPT3
```

### B84

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
SJMP BACK7
```

### B85

```asm
CJNE A,#4,REPT4
```

### B86

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

### B87

```asm
LJMP BACK7
```

### B88

```asm
CJNE A,#5,REPT5
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
LJMP BACK7
```

## Section 10

```mermaid
flowchart TD
B90["B91: REPT5 - lines 247 to 247"]
B91["B92: instructions - lines 248 to 256"]
B92["B93: instructions - lines 257 to 257"]
B93["B94: REPT6 - lines 261 to 269"]
B94["B95: BACK7 - lines 272 to 272"]
B95["B96: instructions - lines 273 to 273"]
B96["B97: instructions - lines 274 to 274"]
B97["B98: instructions - lines 275 to 275"]
B98["B99: instructions - lines 276 to 276"]
B99["B100: instructions - lines 277 to 277"]
B90 -->|condition true| B93
B90 -->|condition false| B91
B91 -->|call| B274
B91 -->|after return| B92
B92 -->|jump| B94
B93 -->|call| B274
B93 -->|after return| B94
B94 -->|call| B147
B94 -->|after return| B95
B95 -->|call| B274
B95 -->|after return| B96
B96 -->|call| B274
B96 -->|after return| B97
B97 -->|call| B274
B97 -->|after return| B98
B98 -->|call| B274
B98 -->|after return| B99
B274["Continue at B275 in section 28"]
B147["Continue at B148 in section 15"]
```

### B91

```asm
CJNE A,#6,REPT6
```

### B92

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
CLR P2.6
SETB P2.7
Acall DELAY
```

### B93

```asm
LJMP BACK7
```

### B94

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

### B95

```asm
ACALL INLCD
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
ACALL DELAY
```

### B98

```asm
ACALL DELAY
```

### B99

```asm
ACALL DELAY
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: CASH - lines 284 to 284"]
B101["B102: instructions - lines 285 to 285"]
B102["B103: instructions - lines 286 to 286"]
B103["B104: instructions - lines 287 to 287"]
B104["B105: instructions - lines 288 to 293"]
B105["B106: instructions - lines 294 to 294"]
B106["B107: instructions - lines 295 to 300"]
B107["B108: instructions - lines 301 to 301"]
B108["B109: instructions - lines 302 to 302"]
B109["B110: instructions - lines 303 to 308"]
B100 -->|call| B154
B100 -->|after return| B101
B101 -->|call| B176
B101 -->|after return| B102
B102 -->|call| B119
B102 -->|after return| B103
B103 -->|call| B136
B103 -->|after return| B104
B104 -->|call| B119
B104 -->|after return| B105
B105 -->|call| B136
B105 -->|after return| B106
B106 -->|call| B136
B106 -->|after return| B107
B107 -->|call| B119
B107 -->|after return| B108
B108 -->|call| B136
B108 -->|after return| B109
B109 -->|call| B119
B109 -->|after return| B110
B154["Continue at B155 in section 16"]
B176["Continue at B177 in section 18"]
B119["Continue at B120 in section 12"]
B136["Continue at B137 in section 14"]
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
B110["B111: instructions - lines 309 to 309"]
B111["B112: instructions - lines 310 to 313"]
B112["B113: PROGRAM_ROM - lines 317 to 329"]
B113["B114: DISPLAY - lines 332 to 344"]
B114["B115: instructions - lines 346 to 350"]
B115["B116: BORROW - lines 353 to 361"]
B116["B117: COOMP - lines 364 to 364"]
B117["B118: instructions - lines 365 to 365"]
B118["B119: instructions - lines 366 to 366"]
B119["B120: KEYPAD - lines 378 to 378"]
B110 -->|call| B136
B110 -->|after return| B111
B113 -->|condition true| B115
B113 -->|condition false| B114
B114 -->|jump| B116
B115 -->|next| B116
B116 -->|call| B243
B116 -->|after return| B117
B117 -->|call| B170
B117 -->|after return| B118
B119 -->|next| B120
B136["Continue at B137 in section 14"]
B243["Continue at B244 in section 25"]
B170["Continue at B171 in section 18"]
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
MOV A,33H
MOV B,#25
MUL AB
MOV 55H,A
MOV B,#100
DIV AB
MOV 50H,A
MOV 51H,B
MOV A,61H
MOV B,51H
DIV AB
JZ BORROW
```

### B115

```asm
MOV A,61H
SUBB A,51H
MOV  66H,A
MOV 65H,60H
SJMP COOMP
```

### B116

```asm
MOV A,60H
SUBB A,#1
SUBB A,50h
MOV 65H,A
MOV A,61H
ADD A,#100
SUBB A,51H
MOV  66H,A
```

### B117

```asm
ACALL SHOWPRICE
```

### B118

```asm
ACALL COMPLETE
```

### B119

Return to the instruction following the active call.

```asm
RET
```

### B120

```asm
MOV P0,#01110000B
```

## Section 13

```mermaid
flowchart TD
B120["B121: K1 - lines 379 to 382"]
B121["B122: K2 - lines 384 to 386"]
B122["B123: instructions - lines 387 to 387"]
B123["B124: OVER1 - lines 389 to 392"]
B124["B125: instructions - lines 393 to 396"]
B125["B126: instructions - lines 397 to 400"]
B126["B127: instructions - lines 401 to 404"]
B127["B128: instructions - lines 405 to 405"]
B128["B129: ROW_0 - lines 406 to 407"]
B129["B130: ROW_1 - lines 408 to 409"]
B120 -->|condition true| B120
B120 -->|condition false| B121
B121 -->|condition true| B123
B121 -->|condition false| B122
B122 -->|jump| B121
B123 -->|condition true| B128
B123 -->|condition false| B124
B124 -->|condition true| B129
B124 -->|condition false| B125
B125 -->|condition true| B130
B125 -->|condition false| B126
B126 -->|condition true| B131
B126 -->|condition false| B127
B127 -->|jump| B121
B128 -->|jump| B132
B129 -->|jump| B132
B130["Continue at B131 in section 14"]
B131["Continue at B132 in section 14"]
B132["Continue at B133 in section 14"]
```

### B121

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B122

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B123

```asm
SJMP K2
```

### B124

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B125

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B126

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B127

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B128

```asm
LJMP K2
```

### B129

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B130

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

## Section 14

```mermaid
flowchart TD
B130["B131: ROW_2 - lines 410 to 411"]
B131["B132: ROW_3 - lines 412 to 412"]
B132["B133: FIND - lines 414 to 414"]
B133["B134: FIND1 - lines 416 to 417"]
B134["B135: instructions - lines 418 to 419"]
B135["B136: MATCH - lines 420 to 422"]
B136["B137: WCHR - lines 425 to 429"]
B137["B138: instructions - lines 430 to 430"]
B138["B139: instructions - lines 431 to 433"]
B139["B140: instructions - lines 434 to 434"]
B130 -->|jump| B132
B131 -->|next| B132
B132 -->|next| B133
B133 -->|condition true| B135
B133 -->|condition false| B134
B134 -->|jump| B133
B136 -->|call| B146
B136 -->|after return| B137
B137 -->|call| B152
B137 -->|after return| B138
B138 -->|call| B146
B138 -->|after return| B139
B139 -->|call| B152
B139 -->|after return| B140
B146["Continue at B147 in section 15"]
B152["Continue at B153 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B132

```asm
MOV DPTR,#KCODE3
```

### B133

```asm
RLC A
```

### B134

```asm
RLC A
JNC MATCH
```

### B135

```asm
INC DPTR
SJMP FIND1
```

### B136

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B137

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B138

```asm
ACALL LDELAY
```

### B139

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B140

```asm
ACALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 435 to 437"]
B141["B142: CMD - lines 440 to 442"]
B142["B143: instructions - lines 443 to 443"]
B143["B144: instructions - lines 444 to 446"]
B144["B145: instructions - lines 447 to 447"]
B145["B146: instructions - lines 448 to 448"]
B146["B147: COMMON - lines 451 to 456"]
B147["B148: INLCD - lines 459 to 466"]
B148["B149: instructions - lines 467 to 475"]
B149["B150: instructions - lines 476 to 488"]
B141 -->|call| B146
B141 -->|after return| B142
B142 -->|call| B152
B142 -->|after return| B143
B143 -->|call| B146
B143 -->|after return| B144
B144 -->|call| B152
B144 -->|after return| B145
B147 -->|call| B152
B147 -->|after return| B148
B148 -->|call| B152
B148 -->|after return| B149
B149 -->|call| B152
B149 -->|after return| B150
B152["Continue at B153 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B142

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B143

```asm
ACALL LDELAY
```

### B144

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B145

```asm
ACALL LDELAY
```

### B146

Return to the instruction following the active call.

```asm
RET
```

### B147

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B148

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

### B149

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

### B150

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

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 489 to 499"]
B151["B152: instructions - lines 500 to 500"]
B152["B153: LDELAY - lines 503 to 504"]
B153["B154: instructions - lines 505 to 505"]
B154["B155: CLEAR - lines 508 to 509"]
B155["B156: instructions - lines 510 to 510"]
B156["B157: WAIT - lines 511 to 511"]
B157["B158: instructions - lines 512 to 512"]
B158["B159: instructions - lines 513 to 513"]
B159["B160: WSTR - lines 516 to 516"]
B150 -->|call| B152
B150 -->|after return| B151
B152 -->|condition true| B152
B152 -->|condition false| B153
B154 -->|call| B141
B154 -->|after return| B155
B155 -->|next| B156
B156 -->|call| B152
B156 -->|after return| B157
B157 -->|condition true| B156
B157 -->|condition false| B158
B159 -->|next| B160
B141["Continue at B142 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

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

### B152

Return to the instruction following the active call.

```asm
RET
```

### B153

```asm
MOV R0, #50
DJNZ R0, $
```

### B154

Return to the instruction following the active call.

```asm
RET
```

### B155

```asm
MOV A,#01H
ACALL CMD
```

### B156

```asm
MOV R7,#14
```

### B157

```asm
ACALL LDELAY
```

### B158

```asm
DJNZ R7,WAIT
```

### B159

Return to the instruction following the active call.

```asm
ret
```

### B160

```asm
PUSH    ACC
```

## Section 17

```mermaid
flowchart TD
B160["B161: CONT1 - lines 518 to 520"]
B161["B162: PRINT - lines 522 to 522"]
B162["B163: instructions - lines 523 to 524"]
B163["B164: EXIT1 - lines 525 to 526"]
B164["B165: WELCOME - lines 530 to 531"]
B165["B166: instructions - lines 532 to 533"]
B166["B167: instructions - lines 535 to 536"]
B167["B168: instructions - lines 537 to 538"]
B168["B169: instructions - lines 539 to 539"]
B169["B170: instructions - lines 540 to 540"]
B160 -->|condition true| B163
B160 -->|condition false| B161
B161 -->|call| B136
B161 -->|after return| B162
B162 -->|jump| B160
B164 -->|call| B141
B164 -->|after return| B165
B165 -->|call| B159
B165 -->|after return| B166
B166 -->|call| B141
B166 -->|after return| B167
B167 -->|call| B159
B167 -->|after return| B168
B168 -->|call| B274
B168 -->|after return| B169
B136["Continue at B137 in section 14"]
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
```

### B161

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B162

```asm
ACALL    WCHR
```

### B163

```asm
INC DPTR
AJMP    CONT1
```

### B164

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B165

```asm
mov a, #80H
acall cmd
```

### B166

```asm
mov dptr, #WEL1
acall wstr
```

### B167

```asm
mov a,#0c0h
acall cmd
```

### B168

```asm
mov dptr, #WEL2
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
B170["B171: COMPLETE - lines 543 to 544"]
B171["B172: instructions - lines 545 to 546"]
B172["B173: instructions - lines 548 to 549"]
B173["B174: instructions - lines 550 to 551"]
B174["B175: instructions - lines 552 to 552"]
B175["B176: instructions - lines 553 to 553"]
B176["B177: ENTERCASH - lines 556 to 557"]
B177["B178: instructions - lines 558 to 559"]
B178["B179: instructions - lines 560 to 561"]
B179["B180: instructions - lines 562 to 562"]
B170 -->|call| B141
B170 -->|after return| B171
B171 -->|call| B159
B171 -->|after return| B172
B172 -->|call| B141
B172 -->|after return| B173
B173 -->|call| B159
B173 -->|after return| B174
B174 -->|call| B274
B174 -->|after return| B175
B176 -->|call| B141
B176 -->|after return| B177
B177 -->|call| B159
B177 -->|after return| B178
B178 -->|call| B141
B178 -->|after return| B179
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
```

### B171

```asm
mov a, #80H
acall cmd
```

### B172

```asm
mov dptr, #comp1
acall wstr
```

### B173

```asm
mov a,#0c0h
acall cmd
```

### B174

```asm
mov dptr, #comp2
acall wstr
```

### B175

```asm
acall delay
```

### B176

Return to the instruction following the active call.

```asm
ret
```

### B177

```asm
mov a, #80H
acall cmd
```

### B178

```asm
mov dptr, #ENT1
acall wstr
```

### B179

```asm
mov a,#0c0h
acall cmd
```

### B180

Return to the instruction following the active call.

```asm
ret
```

## Section 19

```mermaid
flowchart TD
B180["B181: ENTERTYPE - lines 565 to 566"]
B181["B182: instructions - lines 567 to 568"]
B182["B183: instructions - lines 569 to 569"]
B183["B184: instructions - lines 570 to 570"]
B184["B185: instructions - lines 572 to 573"]
B185["B186: instructions - lines 574 to 575"]
B186["B187: instructions - lines 576 to 576"]
B187["B188: instructions - lines 577 to 578"]
B188["B189: instructions - lines 579 to 580"]
B189["B190: instructions - lines 581 to 581"]
B180 -->|call| B141
B180 -->|after return| B181
B181 -->|call| B159
B181 -->|after return| B182
B182 -->|call| B274
B182 -->|after return| B183
B183 -->|call| B154
B183 -->|after return| B184
B184 -->|call| B141
B184 -->|after return| B185
B185 -->|call| B159
B185 -->|after return| B186
B186 -->|call| B274
B186 -->|after return| B187
B187 -->|call| B141
B187 -->|after return| B188
B188 -->|call| B159
B188 -->|after return| B189
B189 -->|call| B274
B189 -->|after return| B190
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
B154["Continue at B155 in section 16"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
mov a, #80H
acall cmd
```

### B182

```asm
mov dptr, #Type1
acall wstr
```

### B183

```asm
ACALL DELAY
```

### B184

```asm
ACALL CLEAR
```

### B185

```asm
mov a,#80h
acall cmd
```

### B186

```asm
mov dptr, #Type2
acall wstr
```

### B187

```asm
acall delay
```

### B188

```asm
mov a,#0C0h
acall cmd
```

### B189

```asm
mov dptr, #Type3
acall wstr
```

### B190

```asm
acall delay
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 582 to 582"]
B191["B192: CUPSIZE - lines 585 to 586"]
B192["B193: instructions - lines 587 to 588"]
B193["B194: instructions - lines 589 to 589"]
B194["B195: instructions - lines 590 to 591"]
B195["B196: instructions - lines 592 to 593"]
B196["B197: instructions - lines 594 to 594"]
B197["B198: instructions - lines 595 to 595"]
B198["B199: MILKTYPE - lines 598 to 599"]
B199["B200: instructions - lines 600 to 601"]
B191 -->|call| B141
B191 -->|after return| B192
B192 -->|call| B159
B192 -->|after return| B193
B193 -->|call| B274
B193 -->|after return| B194
B194 -->|call| B141
B194 -->|after return| B195
B195 -->|call| B159
B195 -->|after return| B196
B196 -->|call| B274
B196 -->|after return| B197
B198 -->|call| B141
B198 -->|after return| B199
B199 -->|call| B159
B199 -->|after return| B200
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
B200["Continue at B201 in section 21"]
```

### B191

Return to the instruction following the active call.

```asm
ret
```

### B192

```asm
mov a,#80h
acall cmd
```

### B193

```asm
mov dptr, #Cup1
acall wstr
```

### B194

```asm
acall delay
```

### B195

```asm
mov a,#0C0h
acall cmd
```

### B196

```asm
mov dptr, #Cup2
acall wstr
```

### B197

```asm
acall delay
```

### B198

Return to the instruction following the active call.

```asm
ret
```

### B199

```asm
mov a,#80h
acall cmd
```

### B200

```asm
mov dptr, #Milk1
acall wstr
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 602 to 602"]
B201["B202: instructions - lines 603 to 604"]
B202["B203: instructions - lines 605 to 606"]
B203["B204: instructions - lines 607 to 607"]
B204["B205: instructions - lines 608 to 608"]
B205["B206: MILKTYPE2 - lines 611 to 611"]
B206["B207: instructions - lines 612 to 612"]
B207["B208: instructions - lines 613 to 614"]
B208["B209: instructions - lines 615 to 616"]
B209["B210: instructions - lines 617 to 617"]
B200 -->|call| B274
B200 -->|after return| B201
B201 -->|call| B141
B201 -->|after return| B202
B202 -->|call| B159
B202 -->|after return| B203
B203 -->|call| B274
B203 -->|after return| B204
B205 -->|call| B274
B205 -->|after return| B206
B206 -->|call| B154
B206 -->|after return| B207
B207 -->|call| B141
B207 -->|after return| B208
B208 -->|call| B159
B208 -->|after return| B209
B209 -->|call| B274
B209 -->|after return| B210
B274["Continue at B275 in section 28"]
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B154["Continue at B155 in section 16"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
acall delay
```

### B202

```asm
mov a,#0C0h
acall cmd
```

### B203

```asm
mov dptr, #Milk2
acall wstr
```

### B204

```asm
acall delay
```

### B205

Return to the instruction following the active call.

```asm
ret
```

### B206

```asm
ACALL DELAY
```

### B207

```asm
ACALL CLEAR
```

### B208

```asm
mov a,#80h
acall cmd
```

### B209

```asm
mov dptr, #Milk3
acall wstr
```

### B210

```asm
acall delay
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 618 to 619"]
B211["B212: instructions - lines 620 to 621"]
B212["B213: instructions - lines 622 to 623"]
B213["B214: N1 - lines 624 to 624"]
B214["B215: instructions - lines 625 to 626"]
B215["B216: N2 - lines 628 to 628"]
B216["B217: N3 - lines 630 to 630"]
B217["B218: instructions - lines 631 to 631"]
B218["B219: instructions - lines 632 to 632"]
B219["B220: SUGARLEVEL - lines 635 to 636"]
B210 -->|call| B141
B210 -->|after return| B211
B211 -->|condition true| B213
B211 -->|condition false| B212
B212 -->|jump| B216
B213 -->|condition true| B215
B213 -->|condition false| B214
B214 -->|jump| B216
B215 -->|next| B216
B216 -->|call| B159
B216 -->|after return| B217
B217 -->|call| B274
B217 -->|after return| B218
B219 -->|call| B141
B219 -->|after return| B220
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
mov a,#0C0h
acall cmd
```

### B212

```asm
MOV A,70H
CJNE A,#1,N1
```

### B213

```asm
mov dptr, #Milk4
SJMP N3
```

### B214

```asm
CJNE A,#2,N2
```

### B215

```asm
mov dptr, #Milk5
SJMP N3
```

### B216

```asm
mov dptr, #Milk6
```

### B217

```asm
acall wstr
```

### B218

```asm
acall delay
```

### B219

Return to the instruction following the active call.

```asm
ret
```

### B220

```asm
mov a, #80H
acall cmd
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 637 to 638"]
B221["B222: instructions - lines 639 to 639"]
B222["B223: instructions - lines 640 to 640"]
B223["B224: instructions - lines 642 to 643"]
B224["B225: instructions - lines 644 to 645"]
B225["B226: instructions - lines 646 to 646"]
B226["B227: instructions - lines 647 to 648"]
B227["B228: instructions - lines 649 to 650"]
B228["B229: instructions - lines 651 to 651"]
B229["B230: instructions - lines 652 to 652"]
B220 -->|call| B159
B220 -->|after return| B221
B221 -->|call| B274
B221 -->|after return| B222
B222 -->|call| B154
B222 -->|after return| B223
B223 -->|call| B141
B223 -->|after return| B224
B224 -->|call| B159
B224 -->|after return| B225
B225 -->|call| B274
B225 -->|after return| B226
B226 -->|call| B141
B226 -->|after return| B227
B227 -->|call| B159
B227 -->|after return| B228
B228 -->|call| B274
B228 -->|after return| B229
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
```

### B221

```asm
mov dptr, #Sugar1
acall wstr
```

### B222

```asm
ACALL DELAY
```

### B223

```asm
ACALL CLEAR
```

### B224

```asm
mov a,#80h
acall cmd
```

### B225

```asm
mov dptr, #Sugar2
acall wstr
```

### B226

```asm
acall delay
```

### B227

```asm
mov a,#0C0h
acall cmd
```

### B228

```asm
mov dptr, #Sugar3
acall wstr
```

### B229

```asm
acall delay
```

### B230

Return to the instruction following the active call.

```asm
ret
```

## Section 24

```mermaid
flowchart TD
B230["B231: SUGARLEVEL2 - lines 655 to 655"]
B231["B232: instructions - lines 656 to 656"]
B232["B233: instructions - lines 657 to 658"]
B233["B234: instructions - lines 660 to 661"]
B234["B235: instructions - lines 662 to 663"]
B235["B236: NN1 - lines 664 to 664"]
B236["B237: instructions - lines 665 to 666"]
B237["B238: NN2 - lines 667 to 667"]
B238["B239: instructions - lines 668 to 668"]
B239["B240: NN3 - lines 669 to 669"]
B230 -->|call| B274
B230 -->|after return| B231
B231 -->|call| B154
B231 -->|after return| B232
B232 -->|call| B141
B232 -->|after return| B233
B233 -->|condition true| B235
B233 -->|condition false| B234
B234 -->|jump| B240
B235 -->|condition true| B237
B235 -->|condition false| B236
B236 -->|jump| B240
B237 -->|condition true| B239
B237 -->|condition false| B238
B238 -->|next| B239
B239 -->|next| B240
B274["Continue at B275 in section 28"]
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
ACALL DELAY
```

### B232

```asm
ACALL CLEAR
```

### B233

```asm
mov a,#80h
acall cmd
```

### B234

```asm
MOV A,71H
CJNE A,#1,NN1
```

### B235

```asm
mov dptr, #Sugar4
SJMP NN4
```

### B236

```asm
CJNE A,#2,NN2
```

### B237

```asm
mov dptr, #Sugar5
SJMP NN4
```

### B238

```asm
CJNE A,#3,NN3
```

### B239

```asm
mov dptr, #Sugar6
```

### B240

```asm
mov dptr, #Sugar7
```

## Section 25

```mermaid
flowchart TD
B240["B241: NN4 - lines 671 to 671"]
B241["B242: instructions - lines 672 to 672"]
B242["B243: instructions - lines 673 to 673"]
B243["B244: SHOWPRICE - lines 676 to 676"]
B244["B245: instructions - lines 677 to 677"]
B245["B246: instructions - lines 678 to 679"]
B246["B247: instructions - lines 680 to 681"]
B247["B248: instructions - lines 682 to 686"]
B248["B249: instructions - lines 687 to 689"]
B249["B250: instructions - lines 690 to 691"]
B240 -->|call| B159
B240 -->|after return| B241
B241 -->|call| B274
B241 -->|after return| B242
B243 -->|call| B274
B243 -->|after return| B244
B244 -->|call| B154
B244 -->|after return| B245
B245 -->|call| B141
B245 -->|after return| B246
B246 -->|call| B159
B246 -->|after return| B247
B247 -->|call| B136
B247 -->|after return| B248
B248 -->|call| B136
B248 -->|after return| B249
B249 -->|call| B136
B249 -->|after return| B250
B159["Continue at B160 in section 16"]
B274["Continue at B275 in section 28"]
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B136["Continue at B137 in section 14"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
acall wstr
```

### B242

```asm
acall delay
```

### B243

Return to the instruction following the active call.

```asm
ret
```

### B244

```asm
ACALL DELAY
```

### B245

```asm
ACALL CLEAR
```

### B246

```asm
mov a,#80h
acall cmd
```

### B247

```asm
mov dptr, #CASH1
acall wstr
```

### B248

```asm
mov a,60h
mov b,#10
div ab
add a,#30h
acall wchr
```

### B249

```asm
mov a,b
add a,#30h
acall wchr
```

### B250

```asm
mov a,#'.'
acall wchr
```

## Section 26

```mermaid
flowchart TD
B250["B251: instructions - lines 692 to 696"]
B251["B252: instructions - lines 697 to 699"]
B252["B253: instructions - lines 700 to 700"]
B253["B254: instructions - lines 701 to 701"]
B254["B255: instructions - lines 703 to 704"]
B255["B256: instructions - lines 705 to 706"]
B256["B257: instructions - lines 707 to 711"]
B257["B258: instructions - lines 712 to 714"]
B258["B259: instructions - lines 715 to 716"]
B259["B260: instructions - lines 717 to 721"]
B250 -->|call| B136
B250 -->|after return| B251
B251 -->|call| B136
B251 -->|after return| B252
B252 -->|call| B274
B252 -->|after return| B253
B253 -->|call| B274
B253 -->|after return| B254
B254 -->|call| B141
B254 -->|after return| B255
B255 -->|call| B159
B255 -->|after return| B256
B256 -->|call| B136
B256 -->|after return| B257
B257 -->|call| B136
B257 -->|after return| B258
B258 -->|call| B136
B258 -->|after return| B259
B259 -->|call| B136
B259 -->|after return| B260
B136["Continue at B137 in section 14"]
B274["Continue at B275 in section 28"]
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B260["Continue at B261 in section 27"]
```

### B251

```asm
mov a,61h
mov b,#10
div ab
add a,#30h
acall wchr
```

### B252

```asm
mov a,b
add a,#30h
acall wchr
```

### B253

```asm
acall delay
```

### B254

```asm
acall delay
```

### B255

```asm
mov a,#0c0h
acall cmd
```

### B256

```asm
mov dptr, #CASH2
acall wstr
```

### B257

```asm
mov a,50h
mov b,#10
div ab
add a,#30h
acall wchr
```

### B258

```asm
mov a,b
add a,#30h
acall wchr
```

### B259

```asm
mov a,#'.'
acall wchr
```

### B260

```asm
mov a,51h
mov b,#10
div ab
add a,#30h
acall wchr
```

## Section 27

```mermaid
flowchart TD
B260["B261: instructions - lines 722 to 724"]
B261["B262: instructions - lines 726 to 726"]
B262["B263: instructions - lines 727 to 727"]
B263["B264: instructions - lines 729 to 729"]
B264["B265: instructions - lines 730 to 731"]
B265["B266: instructions - lines 732 to 733"]
B266["B267: instructions - lines 734 to 738"]
B267["B268: instructions - lines 739 to 741"]
B268["B269: instructions - lines 742 to 743"]
B269["B270: instructions - lines 744 to 748"]
B260 -->|call| B136
B260 -->|after return| B261
B261 -->|call| B274
B261 -->|after return| B262
B262 -->|call| B274
B262 -->|after return| B263
B263 -->|call| B154
B263 -->|after return| B264
B264 -->|call| B141
B264 -->|after return| B265
B265 -->|call| B159
B265 -->|after return| B266
B266 -->|call| B136
B266 -->|after return| B267
B267 -->|call| B136
B267 -->|after return| B268
B268 -->|call| B136
B268 -->|after return| B269
B269 -->|call| B136
B269 -->|after return| B270
B136["Continue at B137 in section 14"]
B274["Continue at B275 in section 28"]
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B270["Continue at B271 in section 28"]
```

### B261

```asm
mov a,b
add a,#30h
acall wchr
```

### B262

```asm
acall delay
```

### B263

```asm
acall delay
```

### B264

```asm
acall clear
```

### B265

```asm
mov a,#80h
acall cmd
```

### B266

```asm
mov dptr, #CASH3
acall wstr
```

### B267

```asm
mov a,65h
mov b,#10
div ab
add a,#30h
acall wchr
```

### B268

```asm
mov a,b
add a,#30h
acall wchr
```

### B269

```asm
mov a,#'.'
acall wchr
```

### B270

```asm
mov a,66h
mov b,#10
div ab
add a,#30h
acall wchr
```

## Section 28

```mermaid
flowchart TD
B270["B271: instructions - lines 749 to 751"]
B271["B272: instructions - lines 753 to 753"]
B272["B273: instructions - lines 754 to 754"]
B273["B274: instructions - lines 756 to 756"]
B274["B275: DELAY - lines 760 to 763"]
B275["B276: L1 - lines 764 to 764"]
B276["B277: L2 - lines 765 to 765"]
B277["B278: L3 - lines 766 to 766"]
B278["B279: instructions - lines 767 to 767"]
B279["B280: instructions - lines 768 to 768"]
B270 -->|call| B136
B270 -->|after return| B271
B271 -->|call| B274
B271 -->|after return| B272
B272 -->|call| B274
B272 -->|after return| B273
B274 -->|next| B275
B275 -->|next| B276
B276 -->|next| B277
B277 -->|condition true| B277
B277 -->|condition false| B278
B278 -->|condition true| B276
B278 -->|condition false| B279
B279 -->|condition true| B275
B279 -->|condition false| B280
B136["Continue at B137 in section 14"]
B280["Continue at B281 in section 29"]
```

### B271

```asm
mov a,b
add a,#30h
acall wchr
```

### B272

```asm
acall delay
```

### B273

```asm
acall delay
```

### B274

Return to the instruction following the active call.

```asm
RET
```

### B275

```asm
PUSH 0
PUSH 1
PUSH 2
MOV	R0,#4
```

### B276

```asm
MOV	R1,#2
```

### B277

```asm
MOV R2,32H
```

### B278

```asm
DJNZ R2,L3
```

### B279

```asm
DJNZ R1,L2
```

### B280

```asm
DJNZ R0,L1
```

## Section 29

```mermaid
flowchart TD
B280["B281: instructions - lines 769 to 772"]
```

### B281

Return to the instruction following the active call.

```asm
POP 2
POP 1
POP 0
RET
```
