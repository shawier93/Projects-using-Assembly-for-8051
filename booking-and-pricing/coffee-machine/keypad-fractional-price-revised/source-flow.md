# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27) · [Section 28](#section-28) · [Section 29](#section-29) · [Section 30](#section-30) · [Section 31](#section-31) · [Section 32](#section-32) · [Section 33](#section-33) · [Section 34](#section-34) · [Section 35](#section-35) · [Section 36](#section-36)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 20 to 21"]
B1["B2: instructions - lines 22 to 22"]
B2["B3: instructions - lines 23 to 23"]
B3["B4: instructions - lines 24 to 24"]
B4["B5: instructions - lines 26 to 26"]
B5["B6: instructions - lines 27 to 27"]
B6["B7: instructions - lines 30 to 30"]
B7["B8: instructions - lines 31 to 31"]
B8["B9: instructions - lines 32 to 32"]
B9["B10: instructions - lines 35 to 35"]
B0 -->|call| B330
B0 -->|after return| B1
B1 -->|call| B325
B1 -->|after return| B2
B2 -->|call| B275
B2 -->|after return| B3
B3 -->|call| B180
B3 -->|after return| B4
B4 -->|call| B26
B4 -->|after return| B5
B5 -->|call| B186
B5 -->|after return| B6
B6 -->|call| B48
B6 -->|after return| B7
B7 -->|call| B64
B7 -->|after return| B8
B8 -->|call| B192
B8 -->|after return| B9
B9 -->|call| B80
B9 -->|after return| B10
B330["Continue at B331 in section 34"]
B325["Continue at B326 in section 33"]
B275["Continue at B276 in section 28"]
B180["Continue at B181 in section 19"]
B26["Continue at B27 in section 3"]
B186["Continue at B187 in section 19"]
B48["Continue at B49 in section 5"]
B64["Continue at B65 in section 7"]
B192["Continue at B193 in section 20"]
B80["Continue at B81 in section 9"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV P1,#0FFH
LCALL INLCD
```

### B2

```asm
LCALL Clear
```

### B3

```asm
LCALL MSG_WELCOME
```

### B4

```asm
ACALL LCDCONT1
```

### B5

```asm
ACALL ENTER_CASH
```

### B6

```asm
ACALL LCDCONT2
```

### B7

```asm
ACALL COFFEE_1
```

### B8

```asm
ACALL TYPE
```

### B9

```asm
ACALL LCDCONT3
```

### B10

```asm
ACALL COFFEE_2
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 36 to 36"]
B11["B12: instructions - lines 37 to 37"]
B12["B13: instructions - lines 40 to 40"]
B13["B14: instructions - lines 41 to 41"]
B14["B15: instructions - lines 42 to 42"]
B15["B16: instructions - lines 45 to 45"]
B16["B17: instructions - lines 46 to 46"]
B17["B18: instructions - lines 47 to 47"]
B18["B19: instructions - lines 50 to 50"]
B19["B20: instructions - lines 51 to 51"]
B10 -->|call| B86
B10 -->|after return| B11
B11 -->|call| B198
B11 -->|after return| B12
B12 -->|call| B100
B12 -->|after return| B13
B13 -->|call| B106
B13 -->|after return| B14
B14 -->|call| B204
B14 -->|after return| B15
B15 -->|call| B120
B15 -->|after return| B16
B16 -->|call| B126
B16 -->|after return| B17
B17 -->|call| B210
B17 -->|after return| B18
B18 -->|call| B142
B18 -->|after return| B19
B19 -->|call| B156
B19 -->|after return| B20
B86["Continue at B87 in section 9"]
B198["Continue at B199 in section 20"]
B100["Continue at B101 in section 11"]
B106["Continue at B107 in section 11"]
B204["Continue at B205 in section 21"]
B120["Continue at B121 in section 13"]
B126["Continue at B127 in section 13"]
B210["Continue at B211 in section 22"]
B142["Continue at B143 in section 15"]
B156["Continue at B157 in section 16"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL SIZE
```

### B12

```asm
ACALL LCDCONT4
```

### B13

```asm
ACALL COFFEE_3
```

### B14

```asm
ACALL MILK
```

### B15

```asm
ACALL LCDCONT5
```

### B16

```asm
ACALL COFFEE_4
```

### B17

```asm
ACALL SUGAR
```

### B18

```asm
ACALL LCDCONT6
```

### B19

```asm
ACALL ORDER
```

### B20

```asm
ACALL COST
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 52 to 52"]
B21["B22: instructions - lines 55 to 55"]
B22["B23: instructions - lines 56 to 56"]
B23["B24: instructions - lines 57 to 57"]
B24["B25: instructions - lines 58 to 58"]
B25["B26: instructions - lines 65 to 65"]
B26["B27: ENTER_CASH - lines 71 to 71"]
B27["B28: instructions - lines 72 to 73"]
B28["B29: instructions - lines 74 to 74"]
B29["B30: instructions - lines 75 to 75"]
B20 -->|call| B216
B20 -->|after return| B21
B21 -->|call| B166
B21 -->|after return| B22
B22 -->|call| B222
B22 -->|after return| B23
B23 -->|call| B228
B23 -->|after return| B24
B24 -->|call| B270
B24 -->|after return| B25
B25 -->|jump| B0
B26 -->|call| B298
B26 -->|after return| B27
B27 -->|call| B314
B27 -->|after return| B28
B28 -->|call| B301
B28 -->|after return| B29
B29 -->|call| B337
B29 -->|after return| B30
B216["Continue at B217 in section 22"]
B166["Continue at B167 in section 17"]
B222["Continue at B223 in section 23"]
B228["Continue at B229 in section 23"]
B270["Continue at B271 in section 28"]
B0["Continue at B1 in section 1"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B337["Continue at B338 in section 34"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL LCDCONT7
```

### B22

```asm
ACALL SHOW_BILL
```

### B23

```asm
ACALL LCDCONT8
```

### B24

```asm
ACALL READY
```

### B25

```asm
LCALL FLASH
```

### B26

```asm
LJMP MAIN
```

### B27

```asm
ACALL SETUP_ROW1
```

### B28

```asm
MOV DPTR,#L2
ACALL WSTR
```

### B29

```asm
ACALL SETUP_ROW2
```

### B30

```asm
ACALL KEYPAD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 76 to 77"]
B31["B32: instructions - lines 78 to 82"]
B32["B33: instructions - lines 83 to 83"]
B33["B34: instructions - lines 84 to 85"]
B34["B35: instructions - lines 86 to 91"]
B35["B36: instructions - lines 92 to 93"]
B36["B37: instructions - lines 94 to 94"]
B37["B38: instructions - lines 95 to 104"]
B38["B39: JJ1 - lines 105 to 105"]
B39["B40: instructions - lines 106 to 106"]
B30 -->|call| B309
B30 -->|after return| B31
B31 -->|call| B309
B31 -->|after return| B32
B32 -->|call| B337
B32 -->|after return| B33
B33 -->|call| B309
B33 -->|after return| B34
B34 -->|call| B337
B34 -->|after return| B35
B35 -->|call| B309
B35 -->|after return| B36
B36 -->|call| B303
B36 -->|after return| B37
B37 -->|condition true| B38
B37 -->|condition false| B38
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B45
B309["Continue at B310 in section 31"]
B337["Continue at B338 in section 34"]
B303["Continue at B304 in section 31"]
B40["Continue at B41 in section 5"]
B45["Continue at B46 in section 5"]
```

### B31

```asm
MOV 50H,A
ACALL WCHR
```

### B32

```asm
MOV A,50H
SUBB A,#30H
MOV 50H,A
MOV A,#'.'
ACALL WCHR
```

### B33

```asm
ACALL KEYPAD
```

### B34

```asm
MOV 51H,A
ACALL WCHR
```

### B35

```asm
MOV A,51H
SUBB A,#30H
MOV B,#10
MUL AB
MOV 51H,A
ACALL KEYPAD
```

### B36

```asm
MOV 52H,A
ACALL WCHR
```

### B37

```asm
ACALL LOOPLDELAY
```

### B38

```asm
MOV A,52H
SUBB A,#30H
MOV 52H,A
ADD A,51H
MOV 53H,A
MOV A,50H
CLR C
CJNE A,#1,JJ1
```

### B39

```asm
JC EP1
```

### B40

```asm
SJMP ZA
```

## Section 5

```mermaid
flowchart TD
B40["B41: EP1 - lines 109 to 111"]
B41["B42: JJ - lines 112 to 112"]
B42["B43: instructions - lines 113 to 113"]
B43["B44: EP - lines 114 to 114"]
B44["B45: instructions - lines 115 to 115"]
B45["B46: ZA - lines 117 to 117"]
B46["B47: READ - lines 120 to 120"]
B47["B48: instructions - lines 121 to 122"]
B48["B49: COFFEE_1 - lines 126 to 126"]
B49["B50: instructions - lines 127 to 128"]
B40 -->|condition true| B41
B40 -->|condition false| B41
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B45
B43 -->|call| B176
B43 -->|after return| B44
B44 -->|jump| B26
B46 -->|call| B337
B46 -->|after return| B47
B48 -->|call| B298
B48 -->|after return| B49
B49 -->|call| B314
B49 -->|after return| B50
B176["Continue at B177 in section 18"]
B26["Continue at B27 in section 3"]
B337["Continue at B338 in section 34"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,53H
CLR C
CJNE A,#50,JJ
```

### B42

```asm
JC EP
```

### B43

```asm
SJMP ZA
```

### B44

```asm
ACALL ERROR_MSG
```

### B45

```asm
LJMP MMM
```

### B46

Return to the instruction following the active call.

```asm
RET
```

### B47

```asm
ACALL KEYPAD
```

### B48

Return to the instruction following the active call.

```asm
SUBB A,#30H
RET
```

### B49

```asm
ACALL SETUP_ROW1
```

### B50

```asm
MOV DPTR,#L3
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 129 to 129"]
B51["B52: instructions - lines 130 to 131"]
B52["B53: instructions - lines 132 to 132"]
B53["B54: instructions - lines 134 to 134"]
B54["B55: instructions - lines 135 to 136"]
B55["B56: instructions - lines 137 to 137"]
B56["B57: instructions - lines 138 to 139"]
B57["B58: instructions - lines 140 to 140"]
B58["B59: instructions - lines 141 to 141"]
B59["B60: instructions - lines 142 to 143"]
B50 -->|call| B301
B50 -->|after return| B51
B51 -->|call| B314
B51 -->|after return| B52
B52 -->|call| B303
B52 -->|after return| B53
B53 -->|call| B298
B53 -->|after return| B54
B54 -->|call| B314
B54 -->|after return| B55
B55 -->|call| B301
B55 -->|after return| B56
B56 -->|call| B314
B56 -->|after return| B57
B57 -->|call| B303
B57 -->|after return| B58
B58 -->|call| B298
B58 -->|after return| B59
B59 -->|call| B314
B59 -->|after return| B60
B301["Continue at B302 in section 31"]
B314["Continue at B315 in section 32"]
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL SETUP_ROW2
```

### B52

```asm
MOV DPTR,#L4
ACALL WSTR
```

### B53

```asm
ACALL LOOPLDELAY
```

### B54

```asm
ACALL SETUP_ROW1
```

### B55

```asm
MOV DPTR,#L5
ACALL WSTR
```

### B56

```asm
ACALL SETUP_ROW2
```

### B57

```asm
MOV DPTR,#L6
ACALL WSTR
```

### B58

```asm
ACALL LOOPLDELAY
```

### B59

```asm
ACALL SETUP_ROW1
```

### B60

```asm
MOV DPTR,#L7
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 144 to 144"]
B61["B62: instructions - lines 145 to 146"]
B62["B63: instructions - lines 147 to 147"]
B63["B64: instructions - lines 148 to 148"]
B64["B65: TYPE - lines 153 to 153"]
B65["B66: instructions - lines 154 to 155"]
B66["B67: instructions - lines 156 to 156"]
B67["B68: instructions - lines 157 to 158"]
B68["B69: instructions - lines 160 to 160"]
B69["B70: AMERICANO - lines 163 to 163"]
B60 -->|call| B301
B60 -->|after return| B61
B61 -->|call| B314
B61 -->|after return| B62
B62 -->|call| B303
B62 -->|after return| B63
B64 -->|call| B298
B64 -->|after return| B65
B65 -->|call| B314
B65 -->|after return| B66
B66 -->|call| B301
B66 -->|after return| B67
B67 -->|call| B314
B67 -->|after return| B68
B68 -->|call| B46
B68 -->|after return| B69
B69 -->|condition true| B71
B69 -->|condition false| B70
B301["Continue at B302 in section 31"]
B314["Continue at B315 in section 32"]
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B46["Continue at B47 in section 5"]
B71["Continue at B72 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL SETUP_ROW2
```

### B62

```asm
MOV DPTR,#L8
ACALL WSTR
```

### B63

```asm
ACALL LOOPLDELAY
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
ACALL SETUP_ROW1
```

### B66

```asm
MOV DPTR,#TY1
ACALL WSTR
```

### B67

```asm
ACALL SETUP_ROW2
```

### B68

```asm
MOV DPTR,#TY2
ACALL WSTR
```

### B69

```asm
ACALL READ
```

### B70

```asm
CJNE A,#1,Cappuccino
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 164 to 167"]
B71["B72: CAPPUCCINO - lines 170 to 170"]
B72["B73: instructions - lines 171 to 174"]
B73["B74: LATTEE - lines 177 to 177"]
B74["B75: instructions - lines 178 to 181"]
B75["B76: MOCHAA - lines 184 to 184"]
B76["B77: instructions - lines 185 to 188"]
B77["B78: ERROR - lines 191 to 191"]
B78["B79: instructions - lines 192 to 192"]
B79["B80: BACK - lines 194 to 194"]
B70 -->|jump| B79
B71 -->|condition true| B73
B71 -->|condition false| B72
B72 -->|jump| B79
B73 -->|condition true| B75
B73 -->|condition false| B74
B74 -->|jump| B79
B75 -->|condition true| B77
B75 -->|condition false| B76
B76 -->|jump| B79
B77 -->|call| B176
B77 -->|after return| B78
B78 -->|jump| B64
B176["Continue at B177 in section 18"]
B64["Continue at B65 in section 7"]
```

### B71

```asm
MOV R3,#AMER
MOV R4,#0
MOV 40H,#1
SJMP BACK
```

### B72

```asm
CJNE A,#2,Lattee
```

### B73

```asm
MOV R3,#CAP
MOV R4,#0
MOV 40H,#2
SJMP BACK
```

### B74

```asm
CJNE A,#3,Mochaa
```

### B75

```asm
MOV R3,#LATTE
MOV R4,#0
MOV 40H,#3
SJMP BACK
```

### B76

```asm
CJNE A,#4,ERROR
```

### B77

```asm
MOV R4,#MOCHA
MOV R3,#0
MOV 40H,#4
SJMP BACK
```

### B78

```asm
ACALL ERROR_MSG
```

### B79

```asm
LJMP ZZZ
```

### B80

Return to the instruction following the active call.

```asm
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: COFFEE_2 - lines 198 to 198"]
B81["B82: instructions - lines 199 to 200"]
B82["B83: instructions - lines 201 to 201"]
B83["B84: instructions - lines 202 to 203"]
B84["B85: instructions - lines 204 to 204"]
B85["B86: instructions - lines 205 to 205"]
B86["B87: SIZE - lines 210 to 210"]
B87["B88: instructions - lines 211 to 212"]
B88["B89: instructions - lines 213 to 213"]
B89["B90: instructions - lines 214 to 215"]
B80 -->|call| B298
B80 -->|after return| B81
B81 -->|call| B314
B81 -->|after return| B82
B82 -->|call| B301
B82 -->|after return| B83
B83 -->|call| B314
B83 -->|after return| B84
B84 -->|call| B303
B84 -->|after return| B85
B86 -->|call| B298
B86 -->|after return| B87
B87 -->|call| B314
B87 -->|after return| B88
B88 -->|call| B301
B88 -->|after return| B89
B89 -->|call| B314
B89 -->|after return| B90
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B303["Continue at B304 in section 31"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL SETUP_ROW1
```

### B82

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B83

```asm
ACALL SETUP_ROW2
```

### B84

```asm
MOV DPTR,#L10
ACALL WSTR
```

### B85

```asm
ACALL LOOPLDELAY
```

### B86

Return to the instruction following the active call.

```asm
RET
```

### B87

```asm
ACALL SETUP_ROW1
```

### B88

```asm
MOV DPTR,#CY1
ACALL WSTR
```

### B89

```asm
ACALL SETUP_ROW2
```

### B90

```asm
MOV DPTR,#CY2
ACALL WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 216 to 216"]
B91["B92: SMALLL - lines 218 to 218"]
B92["B93: instructions - lines 219 to 221"]
B93["B94: MEDIUM - lines 224 to 224"]
B94["B95: instructions - lines 225 to 227"]
B95["B96: LARGEE - lines 230 to 230"]
B96["B97: instructions - lines 231 to 233"]
B97["B98: ERROR1 - lines 236 to 236"]
B98["B99: instructions - lines 237 to 237"]
B99["B100: BACK1 - lines 239 to 239"]
B90 -->|call| B46
B90 -->|after return| B91
B91 -->|condition true| B93
B91 -->|condition false| B92
B92 -->|jump| B99
B93 -->|condition true| B95
B93 -->|condition false| B94
B94 -->|jump| B99
B95 -->|condition true| B97
B95 -->|condition false| B96
B96 -->|jump| B99
B97 -->|call| B176
B97 -->|after return| B98
B98 -->|jump| B86
B46["Continue at B47 in section 5"]
B176["Continue at B177 in section 18"]
B86["Continue at B87 in section 9"]
```

### B91

```asm
ACALL READ
```

### B92

```asm
CJNE A,#1,Medium
```

### B93

```asm
MOV R5,#SMALL
MOV 41H,#1
SJMP BACK1
```

### B94

```asm
CJNE A,#2,Largee
```

### B95

```asm
MOV R5,#MED
MOV 41H,#2
SJMP BACK1
```

### B96

```asm
CJNE A,#3,ERROR1
```

### B97

```asm
MOV R5,#LARGE
MOV 41H,#3
SJMP BACK1
```

### B98

```asm
ACALL ERROR_MSG
```

### B99

```asm
LJMP XXX
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: COFFEE_3 - lines 243 to 243"]
B101["B102: instructions - lines 244 to 245"]
B102["B103: instructions - lines 246 to 246"]
B103["B104: instructions - lines 247 to 248"]
B104["B105: instructions - lines 249 to 249"]
B105["B106: instructions - lines 250 to 250"]
B106["B107: MILK - lines 256 to 256"]
B107["B108: instructions - lines 257 to 258"]
B108["B109: instructions - lines 259 to 259"]
B109["B110: instructions - lines 260 to 261"]
B100 -->|call| B298
B100 -->|after return| B101
B101 -->|call| B314
B101 -->|after return| B102
B102 -->|call| B301
B102 -->|after return| B103
B103 -->|call| B314
B103 -->|after return| B104
B104 -->|call| B303
B104 -->|after return| B105
B106 -->|call| B298
B106 -->|after return| B107
B107 -->|call| B314
B107 -->|after return| B108
B108 -->|call| B301
B108 -->|after return| B109
B109 -->|call| B314
B109 -->|after return| B110
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B303["Continue at B304 in section 31"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL SETUP_ROW1
```

### B102

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B103

```asm
ACALL SETUP_ROW2
```

### B104

```asm
MOV DPTR,#L11
ACALL WSTR
```

### B105

```asm
ACALL LOOPLDELAY
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

```asm
ACALL SETUP_ROW1
```

### B108

```asm
MOV DPTR,#MY1
ACALL WSTR
```

### B109

```asm
ACALL SETUP_ROW2
```

### B110

```asm
MOV DPTR,#MY2
ACALL WSTR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 263 to 263"]
B111["B112: SKIMMED - lines 266 to 266"]
B112["B113: instructions - lines 267 to 268"]
B113["B114: HALF - lines 271 to 271"]
B114["B115: instructions - lines 272 to 273"]
B115["B116: FULL - lines 276 to 276"]
B116["B117: instructions - lines 277 to 278"]
B117["B118: ERROR2 - lines 281 to 281"]
B118["B119: instructions - lines 282 to 282"]
B119["B120: BACK2 - lines 284 to 284"]
B110 -->|call| B46
B110 -->|after return| B111
B111 -->|condition true| B113
B111 -->|condition false| B112
B112 -->|jump| B119
B113 -->|condition true| B115
B113 -->|condition false| B114
B114 -->|jump| B119
B115 -->|condition true| B117
B115 -->|condition false| B116
B116 -->|jump| B119
B117 -->|call| B176
B117 -->|after return| B118
B118 -->|jump| B106
B46["Continue at B47 in section 5"]
B176["Continue at B177 in section 18"]
B106["Continue at B107 in section 11"]
```

### B111

```asm
ACALL READ
```

### B112

```asm
CJNE A,#1,Half
```

### B113

```asm
MOV 42H,#1
SJMP BACK2
```

### B114

```asm
CJNE A,#2,Full
```

### B115

```asm
MOV 42H,#2
SJMP BACK2
```

### B116

```asm
CJNE A,#3,ERROR2
```

### B117

```asm
MOV 42H,#3
SJMP BACK2
```

### B118

```asm
ACALL ERROR_MSG
```

### B119

```asm
LJMP CCC
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: COFFEE_4 - lines 288 to 288"]
B121["B122: instructions - lines 289 to 290"]
B122["B123: instructions - lines 291 to 291"]
B123["B124: instructions - lines 292 to 293"]
B124["B125: instructions - lines 294 to 294"]
B125["B126: instructions - lines 295 to 295"]
B126["B127: SUGAR - lines 300 to 300"]
B127["B128: instructions - lines 301 to 302"]
B128["B129: instructions - lines 303 to 303"]
B129["B130: instructions - lines 304 to 305"]
B120 -->|call| B298
B120 -->|after return| B121
B121 -->|call| B314
B121 -->|after return| B122
B122 -->|call| B301
B122 -->|after return| B123
B123 -->|call| B314
B123 -->|after return| B124
B124 -->|call| B303
B124 -->|after return| B125
B126 -->|call| B298
B126 -->|after return| B127
B127 -->|call| B314
B127 -->|after return| B128
B128 -->|call| B301
B128 -->|after return| B129
B129 -->|call| B314
B129 -->|after return| B130
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B303["Continue at B304 in section 31"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL SETUP_ROW1
```

### B122

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B123

```asm
ACALL SETUP_ROW2
```

### B124

```asm
MOV DPTR,#L12
ACALL WSTR
```

### B125

```asm
ACALL LOOPLDELAY
```

### B126

Return to the instruction following the active call.

```asm
RET
```

### B127

```asm
ACALL SETUP_ROW1
```

### B128

```asm
MOV DPTR,#SY1
ACALL WSTR
```

### B129

```asm
ACALL SETUP_ROW2
```

### B130

```asm
MOV DPTR,#SY2
ACALL WSTR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 307 to 307"]
B131["B132: NONE - lines 310 to 310"]
B132["B133: instructions - lines 311 to 312"]
B133["B134: LOW1 - lines 315 to 315"]
B134["B135: instructions - lines 316 to 317"]
B135["B136: MEDIUM2 - lines 320 to 320"]
B136["B137: instructions - lines 321 to 322"]
B137["B138: HIGH1 - lines 325 to 325"]
B138["B139: instructions - lines 326 to 327"]
B139["B140: ERROR3 - lines 330 to 330"]
B130 -->|call| B46
B130 -->|after return| B131
B131 -->|condition true| B133
B131 -->|condition false| B132
B132 -->|jump| B141
B133 -->|condition true| B135
B133 -->|condition false| B134
B134 -->|jump| B141
B135 -->|condition true| B137
B135 -->|condition false| B136
B136 -->|jump| B141
B137 -->|condition true| B139
B137 -->|condition false| B138
B138 -->|jump| B141
B139 -->|call| B176
B139 -->|after return| B140
B46["Continue at B47 in section 5"]
B141["Continue at B142 in section 15"]
B176["Continue at B177 in section 18"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL READ
```

### B132

```asm
CJNE A,#1,Low1
```

### B133

```asm
MOV 43H,#1
SJMP BACK3
```

### B134

```asm
CJNE A,#2,Medium2
```

### B135

```asm
MOV 43H,#2
SJMP BACK3
```

### B136

```asm
CJNE A,#3,High1
```

### B137

```asm
MOV 43H,#3
SJMP BACK3
```

### B138

```asm
CJNE A,#4,ERROR3
```

### B139

```asm
MOV 43H,#4
SJMP BACK3
```

### B140

```asm
ACALL ERROR_MSG
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 331 to 331"]
B141["B142: BACK3 - lines 333 to 333"]
B142["B143: ORDER - lines 337 to 337"]
B143["B144: instructions - lines 338 to 339"]
B144["B145: instructions - lines 340 to 340"]
B145["B146: instructions - lines 341 to 341"]
B146["B147: instructions - lines 343 to 343"]
B147["B148: instructions - lines 344 to 344"]
B148["B149: instructions - lines 345 to 345"]
B149["B150: instructions - lines 346 to 346"]
B140 -->|jump| B126
B142 -->|call| B298
B142 -->|after return| B143
B143 -->|call| B314
B143 -->|after return| B144
B144 -->|call| B244
B144 -->|after return| B145
B145 -->|call| B314
B145 -->|after return| B146
B146 -->|call| B301
B146 -->|after return| B147
B147 -->|call| B234
B147 -->|after return| B148
B148 -->|call| B314
B148 -->|after return| B149
B149 -->|call| B252
B149 -->|after return| B150
B126["Continue at B127 in section 13"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B244["Continue at B245 in section 25"]
B301["Continue at B302 in section 31"]
B234["Continue at B235 in section 24"]
B252["Continue at B253 in section 26"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
LJMP VVV
```

### B142

Return to the instruction following the active call.

```asm
RET
```

### B143

```asm
ACALL SETUP_ROW1
```

### B144

```asm
MOV DPTR,#LO
ACALL WSTR
```

### B145

```asm
ACALL SELECTION2
```

### B146

```asm
ACALL WSTR
```

### B147

```asm
ACALL SETUP_ROW2
```

### B148

```asm
ACALL SELECTION1
```

### B149

```asm
ACALL WSTR
```

### B150

```asm
ACALL SELECTION3
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 347 to 347"]
B151["B152: instructions - lines 348 to 348"]
B152["B153: instructions - lines 349 to 349"]
B153["B154: instructions - lines 350 to 350"]
B154["B155: instructions - lines 351 to 351"]
B155["B156: instructions - lines 352 to 352"]
B156["B157: COST - lines 355 to 364"]
B157["B158: instructions - lines 365 to 366"]
B158["B159: instructions - lines 367 to 367"]
B159["B160: instructions - lines 368 to 370"]
B150 -->|call| B314
B150 -->|after return| B151
B151 -->|call| B260
B151 -->|after return| B152
B152 -->|call| B314
B152 -->|after return| B153
B153 -->|call| B303
B153 -->|after return| B154
B154 -->|call| B303
B154 -->|after return| B155
B156 -->|call| B298
B156 -->|after return| B157
B157 -->|call| B314
B157 -->|after return| B158
B158 -->|call| B301
B158 -->|after return| B159
B159 -->|call| B309
B159 -->|after return| B160
B314["Continue at B315 in section 32"]
B260["Continue at B261 in section 27"]
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B301["Continue at B302 in section 31"]
B309["Continue at B310 in section 31"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL WSTR
```

### B152

```asm
ACALL SELECTION4
```

### B153

```asm
ACALL WSTR
```

### B154

```asm
ACALL LOOPLDELAY
```

### B155

```asm
ACALL LOOPLDELAY
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
MOV A,R3
ADD A,R5
MOV R3,A
MOV B,#100
DIV AB
MOV R3,B
ADD A,R4
MOV R4,A
ACALL SETUP_ROW1
```

### B158

```asm
MOV DPTR,#L13
ACALL WSTR
```

### B159

```asm
ACALL SETUP_ROW2
```

### B160

```asm
MOV A,R4
ADD A,#30H
ACALL WCHR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 371 to 372"]
B161["B162: instructions - lines 373 to 378"]
B162["B163: instructions - lines 379 to 381"]
B163["B164: instructions - lines 382 to 382"]
B164["B165: instructions - lines 383 to 383"]
B165["B166: instructions - lines 384 to 384"]
B166["B167: SHOW_BILL - lines 389 to 389"]
B167["B168: instructions - lines 390 to 391"]
B168["B169: instructions - lines 392 to 392"]
B169["B170: instructions - lines 393 to 394"]
B160 -->|call| B309
B160 -->|after return| B161
B161 -->|call| B309
B161 -->|after return| B162
B162 -->|call| B309
B162 -->|after return| B163
B163 -->|call| B303
B163 -->|after return| B164
B164 -->|call| B303
B164 -->|after return| B165
B166 -->|call| B298
B166 -->|after return| B167
B167 -->|call| B314
B167 -->|after return| B168
B168 -->|call| B301
B168 -->|after return| B169
B169 -->|call| B314
B169 -->|after return| B170
B309["Continue at B310 in section 31"]
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#'.'
ACALL WCHR
```

### B162

```asm
MOV A,R3
MOV B,#10
DIV AB
MOV 65H,B
ADD A,#30H
ACALL WCHR
```

### B163

```asm
MOV A,65H
ADD A,#30H
ACALL WCHR
```

### B164

```asm
ACALL LOOPLDELAY
```

### B165

```asm
ACALL LOOPLDELAY
```

### B166

Return to the instruction following the active call.

```asm
RET
```

### B167

```asm
ACALL SETUP_ROW1
```

### B168

```asm
MOV DPTR,#L16
ACALL WSTR
```

### B169

```asm
ACALL SETUP_ROW2
```

### B170

```asm
MOV DPTR,#L17
ACALL WSTR
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 396 to 398"]
B171["B172: instructions - lines 399 to 400"]
B172["B173: instructions - lines 401 to 403"]
B173["B174: instructions - lines 404 to 406"]
B174["B175: instructions - lines 407 to 407"]
B175["B176: instructions - lines 408 to 408"]
B176["B177: ERROR_MSG - lines 412 to 412"]
B177["B178: instructions - lines 413 to 414"]
B178["B179: instructions - lines 415 to 415"]
B179["B180: instructions - lines 416 to 416"]
B170 -->|call| B309
B170 -->|after return| B171
B171 -->|call| B309
B171 -->|after return| B172
B172 -->|call| B309
B172 -->|after return| B173
B173 -->|call| B309
B173 -->|after return| B174
B174 -->|call| B303
B174 -->|after return| B175
B176 -->|call| B298
B176 -->|after return| B177
B177 -->|call| B314
B177 -->|after return| B178
B178 -->|call| B303
B178 -->|after return| B179
B309["Continue at B310 in section 31"]
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
```

### B171

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B172

```asm
MOV A,#'.'
ACALL WCHR
```

### B173

```asm
MOV A,61H
ADD A,#30H
ACALL WCHR
```

### B174

```asm
MOV A,62H
ADD A,#30H
ACALL WCHR
```

### B175

```asm
ACALL LOOPLDELAY
```

### B176

Return to the instruction following the active call.

```asm
RET
```

### B177

```asm
ACALL SETUP_ROW1
```

### B178

```asm
MOV DPTR,#L9
ACALL WSTR
```

### B179

```asm
ACALL LOOPLDELAY
```

### B180

Return to the instruction following the active call.

```asm
RET
```

## Section 19

```mermaid
flowchart TD
B180["B181: LCDCONT1 - lines 420 to 420"]
B181["B182: instructions - lines 421 to 422"]
B182["B183: instructions - lines 423 to 423"]
B183["B184: instructions - lines 424 to 425"]
B184["B185: instructions - lines 426 to 426"]
B185["B186: instructions - lines 427 to 427"]
B186["B187: LCDCONT2 - lines 429 to 429"]
B187["B188: instructions - lines 430 to 431"]
B188["B189: instructions - lines 432 to 432"]
B189["B190: instructions - lines 433 to 434"]
B180 -->|call| B298
B180 -->|after return| B181
B181 -->|call| B314
B181 -->|after return| B182
B182 -->|call| B301
B182 -->|after return| B183
B183 -->|call| B314
B183 -->|after return| B184
B184 -->|call| B303
B184 -->|after return| B185
B186 -->|call| B298
B186 -->|after return| B187
B187 -->|call| B314
B187 -->|after return| B188
B188 -->|call| B301
B188 -->|after return| B189
B189 -->|call| B314
B189 -->|after return| B190
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B303["Continue at B304 in section 31"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL SETUP_ROW1
```

### B182

```asm
MOV DPTR,#X1
ACALL WSTR
```

### B183

```asm
ACALL SETUP_ROW2
```

### B184

```asm
MOV DPTR,#X2
ACALL WSTR
```

### B185

```asm
ACALL LOOPLDELAY
```

### B186

Return to the instruction following the active call.

```asm
RET
```

### B187

```asm
ACALL SETUP_ROW1
```

### B188

```asm
MOV DPTR,#X3
ACALL WSTR
```

### B189

```asm
ACALL SETUP_ROW2
```

### B190

```asm
MOV DPTR,#X4
ACALL WSTR
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 435 to 435"]
B191["B192: instructions - lines 436 to 436"]
B192["B193: LCDCONT3 - lines 438 to 438"]
B193["B194: instructions - lines 439 to 440"]
B194["B195: instructions - lines 441 to 441"]
B195["B196: instructions - lines 442 to 443"]
B196["B197: instructions - lines 444 to 444"]
B197["B198: instructions - lines 445 to 445"]
B198["B199: LCDCONT4 - lines 447 to 447"]
B199["B200: instructions - lines 448 to 449"]
B190 -->|call| B303
B190 -->|after return| B191
B192 -->|call| B298
B192 -->|after return| B193
B193 -->|call| B314
B193 -->|after return| B194
B194 -->|call| B301
B194 -->|after return| B195
B195 -->|call| B314
B195 -->|after return| B196
B196 -->|call| B303
B196 -->|after return| B197
B198 -->|call| B298
B198 -->|after return| B199
B199 -->|call| B314
B199 -->|after return| B200
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
ACALL LOOPLDELAY
```

### B192

Return to the instruction following the active call.

```asm
RET
```

### B193

```asm
ACALL SETUP_ROW1
```

### B194

```asm
MOV DPTR,#X5
ACALL WSTR
```

### B195

```asm
ACALL SETUP_ROW2
```

### B196

```asm
MOV DPTR,#X6
ACALL WSTR
```

### B197

```asm
ACALL LOOPLDELAY
```

### B198

Return to the instruction following the active call.

```asm
RET
```

### B199

```asm
ACALL SETUP_ROW1
```

### B200

```asm
MOV DPTR,#X7
ACALL WSTR
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 450 to 450"]
B201["B202: instructions - lines 451 to 452"]
B202["B203: instructions - lines 453 to 453"]
B203["B204: instructions - lines 454 to 454"]
B204["B205: LCDCONT5 - lines 456 to 456"]
B205["B206: instructions - lines 457 to 458"]
B206["B207: instructions - lines 459 to 459"]
B207["B208: instructions - lines 460 to 461"]
B208["B209: instructions - lines 462 to 462"]
B209["B210: instructions - lines 463 to 463"]
B200 -->|call| B301
B200 -->|after return| B201
B201 -->|call| B314
B201 -->|after return| B202
B202 -->|call| B303
B202 -->|after return| B203
B204 -->|call| B298
B204 -->|after return| B205
B205 -->|call| B314
B205 -->|after return| B206
B206 -->|call| B301
B206 -->|after return| B207
B207 -->|call| B314
B207 -->|after return| B208
B208 -->|call| B303
B208 -->|after return| B209
B301["Continue at B302 in section 31"]
B314["Continue at B315 in section 32"]
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
```

### B201

```asm
ACALL SETUP_ROW2
```

### B202

```asm
MOV DPTR,#X8
ACALL WSTR
```

### B203

```asm
ACALL LOOPLDELAY
```

### B204

Return to the instruction following the active call.

```asm
RET
```

### B205

```asm
ACALL SETUP_ROW1
```

### B206

```asm
MOV DPTR,#X9
ACALL WSTR
```

### B207

```asm
ACALL SETUP_ROW2
```

### B208

```asm
MOV DPTR,#X10
ACALL WSTR
```

### B209

```asm
ACALL LOOPLDELAY
```

### B210

Return to the instruction following the active call.

```asm
RET
```

## Section 22

```mermaid
flowchart TD
B210["B211: LCDCONT6 - lines 465 to 465"]
B211["B212: instructions - lines 466 to 467"]
B212["B213: instructions - lines 468 to 468"]
B213["B214: instructions - lines 469 to 470"]
B214["B215: instructions - lines 471 to 471"]
B215["B216: instructions - lines 472 to 472"]
B216["B217: LCDCONT7 - lines 474 to 474"]
B217["B218: instructions - lines 475 to 476"]
B218["B219: instructions - lines 477 to 477"]
B219["B220: instructions - lines 478 to 479"]
B210 -->|call| B298
B210 -->|after return| B211
B211 -->|call| B314
B211 -->|after return| B212
B212 -->|call| B301
B212 -->|after return| B213
B213 -->|call| B314
B213 -->|after return| B214
B214 -->|call| B303
B214 -->|after return| B215
B216 -->|call| B298
B216 -->|after return| B217
B217 -->|call| B314
B217 -->|after return| B218
B218 -->|call| B301
B218 -->|after return| B219
B219 -->|call| B314
B219 -->|after return| B220
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B303["Continue at B304 in section 31"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
ACALL SETUP_ROW1
```

### B212

```asm
MOV DPTR,#X11
ACALL WSTR
```

### B213

```asm
ACALL SETUP_ROW2
```

### B214

```asm
MOV DPTR,#X12
ACALL WSTR
```

### B215

```asm
ACALL LOOPLDELAY
```

### B216

Return to the instruction following the active call.

```asm
RET
```

### B217

```asm
ACALL SETUP_ROW1
```

### B218

```asm
MOV DPTR,#X13
ACALL WSTR
```

### B219

```asm
ACALL SETUP_ROW2
```

### B220

```asm
MOV DPTR,#X14
ACALL WSTR
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 480 to 480"]
B221["B222: instructions - lines 481 to 481"]
B222["B223: LCDCONT8 - lines 483 to 483"]
B223["B224: instructions - lines 484 to 485"]
B224["B225: instructions - lines 486 to 486"]
B225["B226: instructions - lines 487 to 488"]
B226["B227: instructions - lines 489 to 489"]
B227["B228: instructions - lines 490 to 490"]
B228["B229: READY - lines 493 to 493"]
B229["B230: instructions - lines 494 to 495"]
B220 -->|call| B303
B220 -->|after return| B221
B222 -->|call| B298
B222 -->|after return| B223
B223 -->|call| B314
B223 -->|after return| B224
B224 -->|call| B301
B224 -->|after return| B225
B225 -->|call| B314
B225 -->|after return| B226
B226 -->|call| B303
B226 -->|after return| B227
B228 -->|call| B298
B228 -->|after return| B229
B229 -->|call| B314
B229 -->|after return| B230
B303["Continue at B304 in section 31"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
ACALL LOOPLDELAY
```

### B222

Return to the instruction following the active call.

```asm
RET
```

### B223

```asm
ACALL SETUP_ROW1
```

### B224

```asm
MOV DPTR,#X15
ACALL WSTR
```

### B225

```asm
ACALL SETUP_ROW2
```

### B226

```asm
MOV DPTR,#X16
ACALL WSTR
```

### B227

```asm
ACALL LOOPLDELAY
```

### B228

Return to the instruction following the active call.

```asm
RET
```

### B229

```asm
ACALL SETUP_ROW1
```

### B230

```asm
MOV DPTR,#L14
ACALL WSTR
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 496 to 496"]
B231["B232: instructions - lines 497 to 498"]
B232["B233: instructions - lines 499 to 499"]
B233["B234: instructions - lines 500 to 500"]
B234["B235: SELECTION1 - lines 503 to 503"]
B235["B236: GG1 - lines 504 to 504"]
B236["B237: instructions - lines 505 to 506"]
B237["B238: Z1 - lines 507 to 507"]
B238["B239: instructions - lines 508 to 509"]
B239["B240: Z2 - lines 510 to 510"]
B230 -->|call| B301
B230 -->|after return| B231
B231 -->|call| B314
B231 -->|after return| B232
B232 -->|call| B303
B232 -->|after return| B233
B234 -->|next| B235
B235 -->|condition true| B237
B235 -->|condition false| B236
B236 -->|jump| B243
B237 -->|condition true| B239
B237 -->|condition false| B238
B238 -->|jump| B243
B239 -->|condition true| B241
B239 -->|condition false| B240
B301["Continue at B302 in section 31"]
B314["Continue at B315 in section 32"]
B303["Continue at B304 in section 31"]
B243["Continue at B244 in section 25"]
B241["Continue at B242 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
ACALL SETUP_ROW2
```

### B232

```asm
MOV DPTR,#L15
ACALL WSTR
```

### B233

```asm
ACALL LOOPLDELAY
```

### B234

Return to the instruction following the active call.

```asm
RET
```

### B235

```asm
MOV A,40H
```

### B236

```asm
CJNE A,#1H,Z1
```

### B237

```asm
MOV DPTR ,#T1
SJMP GO1
```

### B238

```asm
CJNE A,#2H,Z2
```

### B239

```asm
MOV DPTR ,#T2
SJMP GO1
```

### B240

```asm
CJNE A,#3H,Z3
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 511 to 512"]
B241["B242: Z3 - lines 513 to 513"]
B242["B243: instructions - lines 514 to 514"]
B243["B244: GO1 - lines 516 to 516"]
B244["B245: SELECTION2 - lines 519 to 519"]
B245["B246: GG2 - lines 520 to 520"]
B246["B247: instructions - lines 521 to 522"]
B247["B248: A1 - lines 523 to 523"]
B248["B249: instructions - lines 524 to 525"]
B249["B250: A2 - lines 526 to 526"]
B240 -->|jump| B243
B241 -->|condition true| B235
B241 -->|condition false| B242
B242 -->|next| B243
B244 -->|next| B245
B245 -->|condition true| B247
B245 -->|condition false| B246
B246 -->|jump| B251
B247 -->|condition true| B249
B247 -->|condition false| B248
B248 -->|jump| B251
B249 -->|condition true| B245
B249 -->|condition false| B250
B235["Continue at B236 in section 24"]
B251["Continue at B252 in section 26"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
MOV DPTR ,#T3
SJMP GO1
```

### B242

```asm
CJNE A,#4H,GG1
```

### B243

```asm
MOV DPTR ,#T4
```

### B244

Return to the instruction following the active call.

```asm
RET
```

### B245

```asm
MOV A,41H
```

### B246

```asm
CJNE A,#1H,A1
```

### B247

```asm
MOV DPTR ,#C1
SJMP GO2
```

### B248

```asm
CJNE A,#2H,A2
```

### B249

```asm
MOV DPTR ,#C2
SJMP GO2
```

### B250

```asm
CJNE A,#3H,GG2
```

## Section 26

```mermaid
flowchart TD
B250["B251: instructions - lines 527 to 527"]
B251["B252: GO2 - lines 529 to 529"]
B252["B253: SELECTION3 - lines 532 to 532"]
B253["B254: GG3 - lines 533 to 533"]
B254["B255: instructions - lines 534 to 535"]
B255["B256: Q1 - lines 536 to 536"]
B256["B257: instructions - lines 537 to 538"]
B257["B258: Q2 - lines 539 to 539"]
B258["B259: instructions - lines 540 to 540"]
B259["B260: GO3 - lines 542 to 542"]
B250 -->|next| B251
B252 -->|next| B253
B253 -->|condition true| B255
B253 -->|condition false| B254
B254 -->|jump| B259
B255 -->|condition true| B257
B255 -->|condition false| B256
B256 -->|jump| B259
B257 -->|condition true| B253
B257 -->|condition false| B258
B258 -->|next| B259
```

### B251

```asm
MOV DPTR ,#C3
```

### B252

Return to the instruction following the active call.

```asm
RET
```

### B253

```asm
MOV A,42H
```

### B254

```asm
CJNE A,#1H,Q1
```

### B255

```asm
MOV DPTR ,#M1
SJMP GO3
```

### B256

```asm
CJNE A,#2H,Q2
```

### B257

```asm
MOV DPTR ,#M2
SJMP GO3
```

### B258

```asm
CJNE A,#3H,GG3
```

### B259

```asm
MOV DPTR ,#M3
```

### B260

Return to the instruction following the active call.

```asm
RET
```

## Section 27

```mermaid
flowchart TD
B260["B261: SELECTION4 - lines 545 to 545"]
B261["B262: GG4 - lines 546 to 546"]
B262["B263: instructions - lines 547 to 548"]
B263["B264: W1 - lines 549 to 549"]
B264["B265: instructions - lines 550 to 551"]
B265["B266: W2 - lines 552 to 552"]
B266["B267: instructions - lines 553 to 554"]
B267["B268: W3 - lines 555 to 555"]
B268["B269: instructions - lines 556 to 556"]
B269["B270: GO4 - lines 558 to 558"]
B260 -->|next| B261
B261 -->|condition true| B263
B261 -->|condition false| B262
B262 -->|jump| B269
B263 -->|condition true| B265
B263 -->|condition false| B264
B264 -->|jump| B269
B265 -->|condition true| B267
B265 -->|condition false| B266
B266 -->|jump| B269
B267 -->|condition true| B261
B267 -->|condition false| B268
B268 -->|next| B269
```

### B261

```asm
MOV A,43H
```

### B262

```asm
CJNE A,#1H,W1
```

### B263

```asm
MOV DPTR ,#S1
SJMP GO4
```

### B264

```asm
CJNE A,#2H,W2
```

### B265

```asm
MOV DPTR ,#S2
SJMP GO4
```

### B266

```asm
CJNE A,#3H,W3
```

### B267

```asm
MOV DPTR ,#S3
SJMP GO4
```

### B268

```asm
CJNE A,#4H,GG4
```

### B269

```asm
MOV DPTR ,#S4
```

### B270

Return to the instruction following the active call.

```asm
RET
```

## Section 28

```mermaid
flowchart TD
B270["B271: FLASH - lines 562 to 562"]
B271["B272: RE - lines 564 to 565"]
B272["B273: instructions - lines 566 to 567"]
B273["B274: instructions - lines 568 to 568"]
B274["B275: instructions - lines 569 to 569"]
B275["B276: MSG_WELCOME - lines 573 to 574"]
B276["B277: instructions - lines 575 to 576"]
B277["B278: instructions - lines 577 to 577"]
B278["B279: instructions - lines 578 to 578"]
B279["B280: instructions - lines 579 to 579"]
B270 -->|next| B271
B271 -->|call| B280
B271 -->|after return| B272
B272 -->|call| B280
B272 -->|after return| B273
B273 -->|condition true| B271
B273 -->|condition false| B274
B275 -->|call| B319
B275 -->|after return| B276
B276 -->|call| B314
B276 -->|after return| B277
B277 -->|call| B303
B277 -->|after return| B278
B278 -->|call| B325
B278 -->|after return| B279
B280["Continue at B281 in section 29"]
B319["Continue at B320 in section 32"]
B314["Continue at B315 in section 32"]
B303["Continue at B304 in section 31"]
B325["Continue at B326 in section 33"]
```

### B271

```asm
MOV R6,#3H
```

### B272

```asm
MOV P1,#00H
ACALL DELAY
```

### B273

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B274

```asm
DJNZ R6,RE
```

### B275

Return to the instruction following the active call.

```asm
RET
```

### B276

```asm
MOV A,#85H
ACALL CMD
```

### B277

```asm
MOV DPTR ,#L1
ACALL WSTR
```

### B278

```asm
ACALL LOOPLDELAY
```

### B279

```asm
ACALL CLEAR
```

### B280

Return to the instruction following the active call.

```asm
RET
```

## Section 29

```mermaid
flowchart TD
B280["B281: DELAY - lines 584 to 588"]
B281["B282: Y1254 - lines 591 to 591"]
B282["B283: X1234 - lines 594 to 596"]
B283["B284: AGAIIN44 - lines 597 to 597"]
B284["B285: instructions - lines 598 to 601"]
B285["B286: instructions - lines 603 to 603"]
B286["B287: BALANCE - lines 609 to 609"]
B287["B288: RFV - lines 611 to 611"]
B288["B289: instructions - lines 612 to 613"]
B289["B290: instructions - lines 614 to 614"]
B280 -->|next| B281
B281 -->|next| B282
B282 -->|next| B283
B283 -->|condition true| B283
B283 -->|condition false| B284
B284 -->|condition true| B282
B284 -->|condition false| B285
B286 -->|jump| B297
B287 -->|call| B298
B287 -->|after return| B288
B288 -->|call| B314
B288 -->|after return| B289
B289 -->|call| B301
B289 -->|after return| B290
B297["Continue at B298 in section 30"]
B298["Continue at B299 in section 30"]
B314["Continue at B315 in section 32"]
B301["Continue at B302 in section 31"]
B290["Continue at B291 in section 30"]
```

### B281

```asm
CLR C
MOV A,#255
MOV R2,#TIME_DELAY
SUBB A,R2
ADDC A,#1
```

### B282

```asm
MOV 73H,2
```

### B283

```asm
MOV TMOD,#02H
MOV TH0,A
SETB TR0
```

### B284

```asm
JNB TF0,AGAIIN44
```

### B285

```asm
CLR TR0
CLR TF0
DJNZ 73H,X1234
```

### B286

Return to the instruction following the active call.

```asm
RET
```

### B287

```asm
SJMP XSW
```

### B288

```asm
ACALL SETUP_ROW1
```

### B289

```asm
MOV DPTR,#L18
ACALL WSTR
```

### B290

```asm
ACALL SETUP_ROW2
```

## Section 30

```mermaid
flowchart TD
B290["B291: instructions - lines 615 to 616"]
B291["B292: instructions - lines 617 to 617"]
B292["B293: instructions - lines 618 to 620"]
B293["B294: instructions - lines 621 to 622"]
B294["B295: instructions - lines 623 to 625"]
B295["B296: instructions - lines 626 to 628"]
B296["B297: instructions - lines 629 to 629"]
B297["B298: XSW - lines 631 to 631"]
B298["B299: SETUP_ROW1 - lines 635 to 635"]
B299["B300: instructions - lines 636 to 637"]
B290 -->|call| B314
B290 -->|after return| B291
B291 -->|call| B303
B291 -->|after return| B292
B292 -->|call| B309
B292 -->|after return| B293
B293 -->|call| B309
B293 -->|after return| B294
B294 -->|call| B309
B294 -->|after return| B295
B295 -->|call| B309
B295 -->|after return| B296
B296 -->|call| B26
B296 -->|after return| B297
B298 -->|call| B325
B298 -->|after return| B299
B299 -->|call| B319
B299 -->|after return| B300
B314["Continue at B315 in section 32"]
B303["Continue at B304 in section 31"]
B309["Continue at B310 in section 31"]
B26["Continue at B27 in section 3"]
B325["Continue at B326 in section 33"]
B319["Continue at B320 in section 32"]
B300["Continue at B301 in section 31"]
```

### B291

```asm
MOV DPTR,#L19
ACALL WSTR
```

### B292

```asm
ACALL LOOPLDELAY
```

### B293

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B294

```asm
MOV A,#'.'
ACALL WCHR
```

### B295

```asm
MOV A,61H
ADD A,#30H
ACALL WCHR
```

### B296

```asm
MOV A,62H
ADD A,#30H
ACALL WCHR
```

### B297

```asm
ACALL ENTER_CASH
```

### B298

Return to the instruction following the active call.

```asm
RET
```

### B299

```asm
ACALL CLEAR
```

### B300

```asm
MOV A,#80H
ACALL CMD
```

## Section 31

```mermaid
flowchart TD
B300["B301: instructions - lines 638 to 638"]
B301["B302: SETUP_ROW2 - lines 640 to 641"]
B302["B303: instructions - lines 642 to 642"]
B303["B304: LOOPLDELAY - lines 645 to 645"]
B304["B305: KL - lines 646 to 646"]
B305["B306: WAIT18 - lines 647 to 647"]
B306["B307: instructions - lines 648 to 648"]
B307["B308: instructions - lines 649 to 649"]
B308["B309: instructions - lines 650 to 650"]
B309["B310: WCHR - lines 654 to 658"]
B301 -->|call| B319
B301 -->|after return| B302
B303 -->|next| B304
B304 -->|next| B305
B305 -->|call| B335
B305 -->|after return| B306
B306 -->|condition true| B305
B306 -->|condition false| B307
B307 -->|condition true| B304
B307 -->|condition false| B308
B309 -->|call| B324
B309 -->|after return| B310
B319["Continue at B320 in section 32"]
B335["Continue at B336 in section 34"]
B324["Continue at B325 in section 33"]
B310["Continue at B311 in section 32"]
```

### B301

Return to the instruction following the active call.

```asm
RET
```

### B302

```asm
MOV A,#0C0H
ACALL CMD
```

### B303

Return to the instruction following the active call.

```asm
RET
```

### B304

```asm
MOV 71H,#7
```

### B305

```asm
MOV 72H,#250
```

### B306

```asm
ACALL LDELAY
```

### B307

```asm
DJNZ 72H,WAIT18
```

### B308

```asm
DJNZ 71H,KL
```

### B309

Return to the instruction following the active call.

```asm
RET
```

### B310

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

## Section 32

```mermaid
flowchart TD
B310["B311: instructions - lines 659 to 659"]
B311["B312: instructions - lines 660 to 662"]
B312["B313: instructions - lines 663 to 663"]
B313["B314: instructions - lines 664 to 666"]
B314["B315: WSTR - lines 669 to 669"]
B315["B316: CONT1 - lines 671 to 673"]
B316["B317: PRINT - lines 675 to 675"]
B317["B318: instructions - lines 676 to 677"]
B318["B319: EXIT1 - lines 678 to 679"]
B319["B320: CMD - lines 682 to 684"]
B310 -->|call| B335
B310 -->|after return| B311
B311 -->|call| B324
B311 -->|after return| B312
B312 -->|call| B335
B312 -->|after return| B313
B314 -->|next| B315
B315 -->|condition true| B318
B315 -->|condition false| B316
B316 -->|call| B309
B316 -->|after return| B317
B317 -->|jump| B315
B319 -->|call| B324
B319 -->|after return| B320
B335["Continue at B336 in section 34"]
B324["Continue at B325 in section 33"]
B309["Continue at B310 in section 31"]
B320["Continue at B321 in section 33"]
```

### B311

```asm
ACALL LDELAY
```

### B312

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B313

```asm
ACALL LDELAY
```

### B314

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B315

```asm
PUSH ACC
```

### B316

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B317

```asm
ACALL WCHR
```

### B318

```asm
INC DPTR
AJMP CONT1
```

### B319

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B320

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 33

```mermaid
flowchart TD
B320["B321: instructions - lines 685 to 685"]
B321["B322: instructions - lines 686 to 688"]
B322["B323: instructions - lines 689 to 689"]
B323["B324: instructions - lines 690 to 690"]
B324["B325: COMMON - lines 693 to 698"]
B325["B326: CLEAR - lines 701 to 702"]
B326["B327: instructions - lines 703 to 703"]
B327["B328: WAIT11 - lines 704 to 704"]
B328["B329: instructions - lines 705 to 705"]
B329["B330: instructions - lines 706 to 706"]
B320 -->|call| B335
B320 -->|after return| B321
B321 -->|call| B324
B321 -->|after return| B322
B322 -->|call| B335
B322 -->|after return| B323
B325 -->|call| B319
B325 -->|after return| B326
B326 -->|next| B327
B327 -->|call| B335
B327 -->|after return| B328
B328 -->|condition true| B327
B328 -->|condition false| B329
B335["Continue at B336 in section 34"]
B319["Continue at B320 in section 32"]
```

### B321

```asm
ACALL LDELAY
```

### B322

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B323

```asm
ACALL LDELAY
```

### B324

Return to the instruction following the active call.

```asm
RET
```

### B325

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B326

```asm
MOV A,#01H
ACALL CMD
```

### B327

```asm
MOV R7,#14
```

### B328

```asm
ACALL LDELAY
```

### B329

```asm
DJNZ R7,WAIT11
```

### B330

Return to the instruction following the active call.

```asm
ret
```

## Section 34

```mermaid
flowchart TD
B330["B331: INLCD - lines 709 to 716"]
B331["B332: instructions - lines 717 to 725"]
B332["B333: instructions - lines 726 to 738"]
B333["B334: instructions - lines 739 to 749"]
B334["B335: instructions - lines 750 to 750"]
B335["B336: LDELAY - lines 753 to 754"]
B336["B337: instructions - lines 755 to 755"]
B337["B338: KEYPAD - lines 760 to 760"]
B338["B339: K1 - lines 763 to 766"]
B339["B340: K2 - lines 768 to 770"]
B330 -->|call| B335
B330 -->|after return| B331
B331 -->|call| B335
B331 -->|after return| B332
B332 -->|call| B335
B332 -->|after return| B333
B333 -->|call| B335
B333 -->|after return| B334
B335 -->|condition true| B335
B335 -->|condition false| B336
B337 -->|next| B338
B338 -->|condition true| B338
B338 -->|condition false| B339
B339 -->|condition true| B341
B339 -->|condition false| B340
B341["Continue at B342 in section 35"]
B340["Continue at B341 in section 35"]
```

### B331

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

### B332

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

### B333

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

### B334

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

### B335

Return to the instruction following the active call.

```asm
RET
```

### B336

```asm
MOV R0, #50
DJNZ R0, $
```

### B337

Return to the instruction following the active call.

```asm
RET
```

### B338

```asm
MOV P0,#01110000B
```

### B339

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B340

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

## Section 35

```mermaid
flowchart TD
B340["B341: instructions - lines 771 to 771"]
B341["B342: OVER1 - lines 774 to 777"]
B342["B343: instructions - lines 778 to 781"]
B343["B344: instructions - lines 782 to 785"]
B344["B345: instructions - lines 786 to 789"]
B345["B346: instructions - lines 791 to 791"]
B346["B347: ROW_0 - lines 794 to 795"]
B347["B348: ROW_1 - lines 798 to 799"]
B348["B349: ROW_2 - lines 801 to 802"]
B349["B350: ROW_3 - lines 804 to 804"]
B340 -->|jump| B339
B341 -->|condition true| B346
B341 -->|condition false| B342
B342 -->|condition true| B347
B342 -->|condition false| B343
B343 -->|condition true| B348
B343 -->|condition false| B344
B344 -->|condition true| B349
B344 -->|condition false| B345
B345 -->|jump| B339
B346 -->|jump| B350
B347 -->|jump| B350
B348 -->|jump| B350
B349 -->|next| B350
B339["Continue at B340 in section 34"]
B350["Continue at B351 in section 36"]
```

### B341

```asm
SJMP K2
```

### B342

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B343

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B344

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B345

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B346

```asm
LJMP K2
```

### B347

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B348

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B349

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B350

```asm
MOV DPTR,#KCODE3
```

## Section 36

```mermaid
flowchart TD
B350["B351: FIND - lines 808 to 808"]
B351["B352: FIND1 - lines 810 to 811"]
B352["B353: instructions - lines 812 to 813"]
B353["B354: MATCH - lines 815 to 817"]
B354["B355: STOP - lines 979 to 979"]
B350 -->|next| B351
B351 -->|condition true| B353
B351 -->|condition false| B352
B352 -->|jump| B351
B354 -->|jump| B354
```

### B351

```asm
RLC A
```

### B352

```asm
RLC A
JNC MATCH
```

### B353

```asm
INC DPTR
SJMP FIND1
```

### B354

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B355

```asm
SJMP STOP
```
