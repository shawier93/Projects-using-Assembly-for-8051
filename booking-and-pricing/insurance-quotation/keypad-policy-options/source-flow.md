# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 12"]
B2["B3: MAIN - lines 14 to 14"]
B3["B4: instructions - lines 15 to 15"]
B4["B5: instructions - lines 16 to 16"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 20 to 22"]
B9["B10: instructions - lines 23 to 24"]
B0 -->|call| B149
B0 -->|after return| B1
B1 -->|call| B85
B1 -->|after return| B2
B2 -->|call| B73
B2 -->|after return| B3
B3 -->|call| B149
B3 -->|after return| B4
B4 -->|call| B92
B4 -->|after return| B5
B5 -->|call| B177
B5 -->|after return| B6
B6 -->|call| B154
B6 -->|after return| B7
B7 -->|call| B78
B7 -->|after return| B8
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|jump| B16
B149["Continue at B150 in section 15"]
B85["Continue at B86 in section 9"]
B73["Continue at B74 in section 8"]
B92["Continue at B93 in section 10"]
B177["Continue at B178 in section 18"]
B154["Continue at B155 in section 16"]
B78["Continue at B79 in section 8"]
B10["Continue at B11 in section 2"]
B16["Continue at B17 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#2
MOV 31H,#2
MOV 32H,#1
MOV 33H,#1
MOV 34H,#4
MOV 35H,#0
MOV 36H,#0
ACALL FN1
```

### B3

```asm
ACALL FLASH
```

### B4

```asm
ACALL INLCD
```

### B5

```asm
ACALL FN2
```

### B6

```asm
ACALL KEYPAD
```

### B7

```asm
ACALL WCHR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
MOV 30H,A
CJNE A,#'1',CAT2
```

### B10

```asm
MOV 36H,#35
AJMP WARR
```

## Section 2

```mermaid
flowchart TD
B10["B11: CAT2 - lines 27 to 27"]
B11["B12: instructions - lines 28 to 29"]
B12["B13: CAT3 - lines 32 to 32"]
B13["B14: instructions - lines 33 to 34"]
B14["B15: ERROR - lines 37 to 37"]
B15["B16: instructions - lines 38 to 38"]
B16["B17: WARR - lines 41 to 41"]
B17["B18: instructions - lines 42 to 42"]
B18["B19: instructions - lines 43 to 43"]
B19["B20: instructions - lines 44 to 44"]
B10 -->|condition true| B12
B10 -->|condition false| B11
B11 -->|jump| B16
B12 -->|condition true| B14
B12 -->|condition false| B13
B13 -->|jump| B16
B14 -->|call| B144
B14 -->|after return| B15
B15 -->|jump| B2
B16 -->|call| B23
B16 -->|after return| B17
B17 -->|call| B41
B17 -->|after return| B18
B18 -->|call| B59
B18 -->|after return| B19
B19 -->|call| B55
B19 -->|after return| B20
B144["Continue at B145 in section 15"]
B2["Continue at B3 in section 1"]
B23["Continue at B24 in section 3"]
B41["Continue at B42 in section 5"]
B59["Continue at B60 in section 6"]
B55["Continue at B56 in section 6"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE A,#'2',CAT3
```

### B12

```asm
MOV 36H,#28
AJMP WARR
```

### B13

```asm
CJNE A,#'3',ERROR
```

### B14

```asm
MOV 36H,#44
AJMP WARR
```

### B15

```asm
ACALL ERRR
```

### B16

```asm
SJMP MAIN
```

### B17

```asm
ACALL INSURANCE
```

### B18

```asm
ACALL ABROADINSURNCE
```

### B19

```asm
ACALL MEMBERSHIP
```

### B20

```asm
ACALL SUBSCRIPTION
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 45 to 46"]
B21["B22: instructions - lines 48 to 48"]
B22["B23: instructions - lines 50 to 50"]
B23["B24: INSURANCE - lines 56 to 56"]
B24["B25: instructions - lines 57 to 57"]
B25["B26: instructions - lines 58 to 59"]
B26["B27: instructions - lines 61 to 61"]
B27["B28: instructions - lines 64 to 65"]
B28["B29: instructions - lines 66 to 69"]
B29["B30: CATT2 - lines 72 to 72"]
B20 -->|call| B130
B20 -->|after return| B21
B21 -->|call| B73
B21 -->|after return| B22
B22 -->|jump| B194
B23 -->|call| B100
B23 -->|after return| B24
B24 -->|call| B177
B24 -->|after return| B25
B25 -->|call| B154
B25 -->|after return| B26
B26 -->|condition true| B32
B26 -->|condition false| B27
B27 -->|condition true| B29
B27 -->|condition false| B28
B28 -->|jump| B40
B29 -->|condition true| B31
B29 -->|condition false| B30
B130["Continue at B131 in section 14"]
B73["Continue at B74 in section 8"]
B194["Continue at B195 in section 20"]
B100["Continue at B101 in section 11"]
B177["Continue at B178 in section 18"]
B154["Continue at B155 in section 16"]
B32["Continue at B33 in section 4"]
B40["Continue at B41 in section 5"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV 35H,36H
ACALL SHOWCOST
```

### B22

```asm
ACALL FLASH
```

### B23

```asm
AJMP ENDD
```

### B24

```asm
ACALL FN3
```

### B25

```asm
ACALL KEYPAD
```

### B26

```asm
MOV 31H,A
ACALL WCHR
```

### B27

```asm
CJNE A,#'1',TWOYEAR
```

### B28

```asm
MOV A,30H
CJNE A,#1,CATT2
```

### B29

```asm
MOV A,36H
ADD A,#5
MOV 36H,A
SJMP BACK
```

### B30

```asm
CJNE A,#'2',CATT3
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 73 to 76"]
B31["B32: CATT3 - lines 79 to 82"]
B32["B33: TWOYEAR - lines 86 to 86"]
B33["B34: instructions - lines 87 to 88"]
B34["B35: instructions - lines 89 to 92"]
B35["B36: CCAT2 - lines 95 to 95"]
B36["B37: instructions - lines 96 to 99"]
B37["B38: CCAT3 - lines 102 to 105"]
B38["B39: EEE - lines 108 to 108"]
B39["B40: instructions - lines 109 to 109"]
B30 -->|jump| B40
B31 -->|jump| B40
B32 -->|condition true| B38
B32 -->|condition false| B33
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|jump| B40
B35 -->|condition true| B37
B35 -->|condition false| B36
B36 -->|jump| B40
B37 -->|jump| B40
B38 -->|call| B144
B38 -->|after return| B39
B39 -->|jump| B23
B40["Continue at B41 in section 5"]
B144["Continue at B145 in section 15"]
B23["Continue at B24 in section 3"]
```

### B31

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B32

```asm
MOV A,36H
ADD A,#12
MOV 36H,A
SJMP BACK
```

### B33

```asm
CJNE A,#'2',EEE
```

### B34

```asm
MOV A,30H
CJNE A,#1,CCAT2
```

### B35

```asm
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B36

```asm
CJNE A,#2,CCAT3
```

### B37

```asm
MOV A,36H
ADD A,#18
MOV 36H,A
SJMP BACK
```

### B38

```asm
MOV A,36H
ADD A,#20
MOV 36H,A
SJMP BACK
```

### B39

```asm
ACALL ERRR
```

### B40

```asm
SJMP INSURANCE
```

## Section 5

```mermaid
flowchart TD
B40["B41: BACK - lines 112 to 112"]
B41["B42: ABROADINSURNCE - lines 116 to 116"]
B42["B43: instructions - lines 117 to 117"]
B43["B44: instructions - lines 118 to 119"]
B44["B45: instructions - lines 120 to 121"]
B45["B46: instructions - lines 124 to 125"]
B46["B47: instructions - lines 126 to 129"]
B47["B48: CAT22 - lines 132 to 132"]
B48["B49: instructions - lines 133 to 136"]
B49["B50: CAT33 - lines 139 to 142"]
B41 -->|call| B108
B41 -->|after return| B42
B42 -->|call| B177
B42 -->|after return| B43
B43 -->|call| B154
B43 -->|after return| B44
B44 -->|condition true| B50
B44 -->|condition false| B45
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|jump| B54
B47 -->|condition true| B49
B47 -->|condition false| B48
B48 -->|jump| B54
B49 -->|jump| B54
B108["Continue at B109 in section 11"]
B177["Continue at B178 in section 18"]
B154["Continue at B155 in section 16"]
B50["Continue at B51 in section 6"]
B54["Continue at B55 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

```asm
ACALL FN4
```

### B43

```asm
ACALL KEYPAD
```

### B44

```asm
MOV 32H,A
ACALL WCHR
```

### B45

```asm
MOV A,32H
CJNE A,#'1',NO
```

### B46

```asm
MOV A,30H
CJNE A,#1,CAT22
```

### B47

```asm
MOV A,36H
ADD A,#13
MOV 36H,A
SJMP BACK1
```

### B48

```asm
CJNE A,#2,CAT33
```

### B49

```asm
MOV A,36H
ADD A,#22
MOV 36H,A
SJMP BACK1
```

### B50

```asm
MOV A,36H
ADD A,#25
MOV 36H,A
SJMP BACK1
```

## Section 6

```mermaid
flowchart TD
B50["B51: NO - lines 145 to 145"]
B51["B52: instructions - lines 146 to 146"]
B52["B53: EERR - lines 150 to 150"]
B53["B54: instructions - lines 151 to 151"]
B54["B55: BACK1 - lines 154 to 154"]
B55["B56: SUBSCRIPTION - lines 158 to 158"]
B56["B57: instructions - lines 159 to 159"]
B57["B58: instructions - lines 160 to 161"]
B58["B59: instructions - lines 162 to 169"]
B59["B60: MEMBERSHIP - lines 173 to 173"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|jump| B54
B52 -->|call| B144
B52 -->|after return| B53
B53 -->|jump| B41
B55 -->|call| B124
B55 -->|after return| B56
B56 -->|call| B177
B56 -->|after return| B57
B57 -->|call| B154
B57 -->|after return| B58
B59 -->|call| B116
B59 -->|after return| B60
B144["Continue at B145 in section 15"]
B41["Continue at B42 in section 5"]
B124["Continue at B125 in section 13"]
B177["Continue at B178 in section 18"]
B154["Continue at B155 in section 16"]
B116["Continue at B117 in section 12"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
CJNE A,#'2',EERR
```

### B52

```asm
SJMP BACK1
```

### B53

```asm
ACALL ERRR
```

### B54

```asm
SJMP ABROADINSURNCE
```

### B55

Return to the instruction following the active call.

```asm
RET
```

### B56

```asm
ACALL FN6
```

### B57

```asm
ACALL KEYPAD
```

### B58

```asm
MOV 34H,A
ACALL WCHR
```

### B59

Return to the instruction following the active call.

```asm
MOV A,34H
SUBB A,#30H
MOV 34H,A
MOV A,36H
SUBB A,34H
MOV 36H,A
RET
```

### B60

```asm
ACALL FN5
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 174 to 174"]
B61["B62: instructions - lines 175 to 176"]
B62["B63: instructions - lines 177 to 178"]
B63["B64: instructions - lines 181 to 182"]
B64["B65: instructions - lines 183 to 186"]
B65["B66: CATT22 - lines 189 to 189"]
B66["B67: instructions - lines 190 to 193"]
B67["B68: CATT33 - lines 196 to 199"]
B68["B69: NO2 - lines 202 to 202"]
B69["B70: instructions - lines 203 to 203"]
B60 -->|call| B177
B60 -->|after return| B61
B61 -->|call| B154
B61 -->|after return| B62
B62 -->|condition true| B68
B62 -->|condition false| B63
B63 -->|condition true| B65
B63 -->|condition false| B64
B64 -->|jump| B72
B65 -->|condition true| B67
B65 -->|condition false| B66
B66 -->|jump| B72
B67 -->|jump| B72
B68 -->|condition true| B70
B68 -->|condition false| B69
B69 -->|jump| B72
B177["Continue at B178 in section 18"]
B154["Continue at B155 in section 16"]
B72["Continue at B73 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL KEYPAD
```

### B62

```asm
MOV 33H,A
ACALL WCHR
```

### B63

```asm
MOV A,33H
CJNE A,#'1',NO2
```

### B64

```asm
MOV A,30H
CJNE A,#1,CATT22
```

### B65

```asm
MOV A,36H
SUBB A,#8
MOV 36H,A
SJMP BACK3
```

### B66

```asm
CJNE A,#2,CATT33
```

### B67

```asm
MOV A,36H
SUBB A,#10
MOV 36H,A
SJMP BACK3
```

### B68

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B69

```asm
CJNE A,#'2',EERRR
```

### B70

```asm
SJMP BACK3
```

## Section 8

```mermaid
flowchart TD
B70["B71: EERRR - lines 206 to 206"]
B71["B72: instructions - lines 207 to 207"]
B72["B73: BACK3 - lines 211 to 211"]
B73["B74: FLASH - lines 214 to 214"]
B74["B75: HHE - lines 216 to 217"]
B75["B76: instructions - lines 219 to 220"]
B76["B77: instructions - lines 221 to 221"]
B77["B78: instructions - lines 222 to 222"]
B78["B79: DELAY - lines 225 to 225"]
B79["B80: X3 - lines 226 to 226"]
B70 -->|call| B144
B70 -->|after return| B71
B71 -->|jump| B59
B73 -->|next| B74
B74 -->|call| B78
B74 -->|after return| B75
B75 -->|call| B78
B75 -->|after return| B76
B76 -->|condition true| B74
B76 -->|condition false| B77
B78 -->|next| B79
B79 -->|next| B80
B144["Continue at B145 in section 15"]
B59["Continue at B60 in section 6"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL ERRR
```

### B72

```asm
SJMP MEMBERSHIP
```

### B73

Return to the instruction following the active call.

```asm
RET
```

### B74

```asm
MOV R7,#5
```

### B75

```asm
MOV P1,#0H
ACALL DELAY
```

### B76

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B77

```asm
DJNZ R7,HHE
```

### B78

Return to the instruction following the active call.

```asm
RET
```

### B79

```asm
MOV	R5,#2
```

### B80

```asm
MOV	R4,#20
```

## Section 9

```mermaid
flowchart TD
B80["B81: X2 - lines 227 to 227"]
B81["B82: X1 - lines 228 to 228"]
B82["B83: instructions - lines 229 to 229"]
B83["B84: instructions - lines 230 to 230"]
B84["B85: instructions - lines 231 to 231"]
B85["B86: FN1 - lines 235 to 236"]
B86["B87: instructions - lines 237 to 238"]
B87["B88: instructions - lines 239 to 239"]
B88["B89: instructions - lines 240 to 241"]
B89["B90: instructions - lines 242 to 243"]
B80 -->|next| B81
B81 -->|condition true| B81
B81 -->|condition false| B82
B82 -->|condition true| B80
B82 -->|condition false| B83
B83 -->|condition true| B79
B83 -->|condition false| B84
B85 -->|call| B159
B85 -->|after return| B86
B86 -->|call| B165
B86 -->|after return| B87
B87 -->|call| B78
B87 -->|after return| B88
B88 -->|call| B159
B88 -->|after return| B89
B89 -->|call| B165
B89 -->|after return| B90
B79["Continue at B80 in section 8"]
B159["Continue at B160 in section 16"]
B165["Continue at B166 in section 17"]
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV	R3,#250
```

### B82

```asm
DJNZ	R3,X1
```

### B83

```asm
DJNZ	R4,X2
```

### B84

```asm
DJNZ	R5,X3
```

### B85

Return to the instruction following the active call.

```asm
RET
```

### B86

```asm
MOV A, #80H
ACALL CMD
```

### B87

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
MOV A, #0C0H
ACALL CMD
```

### B90

```asm
MOV DPTR, #STR2
ACALL WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 244 to 244"]
B91["B92: instructions - lines 245 to 245"]
B92["B93: FN2 - lines 248 to 248"]
B93["B94: instructions - lines 249 to 250"]
B94["B95: instructions - lines 251 to 252"]
B95["B96: instructions - lines 253 to 253"]
B96["B97: instructions - lines 254 to 255"]
B97["B98: instructions - lines 256 to 257"]
B98["B99: instructions - lines 258 to 258"]
B99["B100: instructions - lines 259 to 259"]
B90 -->|call| B78
B90 -->|after return| B91
B92 -->|call| B172
B92 -->|after return| B93
B93 -->|call| B159
B93 -->|after return| B94
B94 -->|call| B165
B94 -->|after return| B95
B95 -->|call| B78
B95 -->|after return| B96
B96 -->|call| B159
B96 -->|after return| B97
B97 -->|call| B165
B97 -->|after return| B98
B98 -->|call| B78
B98 -->|after return| B99
B78["Continue at B79 in section 8"]
B172["Continue at B173 in section 18"]
B159["Continue at B160 in section 16"]
B165["Continue at B166 in section 17"]
```

### B91

```asm
ACALL DELAY
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
ACALL CLEAR
```

### B94

```asm
MOV A, #80H
ACALL CMD
```

### B95

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
MOV A, #0C0H
ACALL CMD
```

### B98

```asm
MOV DPTR, #STR4
ACALL WSTR
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
B100["B101: FN3 - lines 262 to 262"]
B101["B102: instructions - lines 263 to 264"]
B102["B103: instructions - lines 265 to 266"]
B103["B104: instructions - lines 267 to 267"]
B104["B105: instructions - lines 268 to 269"]
B105["B106: instructions - lines 270 to 271"]
B106["B107: instructions - lines 272 to 272"]
B107["B108: instructions - lines 273 to 273"]
B108["B109: FN4 - lines 276 to 276"]
B109["B110: instructions - lines 277 to 278"]
B100 -->|call| B172
B100 -->|after return| B101
B101 -->|call| B159
B101 -->|after return| B102
B102 -->|call| B165
B102 -->|after return| B103
B103 -->|call| B78
B103 -->|after return| B104
B104 -->|call| B159
B104 -->|after return| B105
B105 -->|call| B165
B105 -->|after return| B106
B106 -->|call| B78
B106 -->|after return| B107
B108 -->|call| B172
B108 -->|after return| B109
B109 -->|call| B159
B109 -->|after return| B110
B172["Continue at B173 in section 18"]
B159["Continue at B160 in section 16"]
B165["Continue at B166 in section 17"]
B78["Continue at B79 in section 8"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
MOV A, #80H
ACALL CMD
```

### B103

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
MOV A, #0C0H
ACALL CMD
```

### B106

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B107

```asm
ACALL DELAY
```

### B108

Return to the instruction following the active call.

```asm
RET
```

### B109

```asm
ACALL CLEAR
```

### B110

```asm
MOV A, #80H
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 279 to 280"]
B111["B112: instructions - lines 281 to 281"]
B112["B113: instructions - lines 282 to 283"]
B113["B114: instructions - lines 284 to 285"]
B114["B115: instructions - lines 286 to 286"]
B115["B116: instructions - lines 287 to 287"]
B116["B117: FN5 - lines 290 to 290"]
B117["B118: instructions - lines 291 to 292"]
B118["B119: instructions - lines 293 to 294"]
B119["B120: instructions - lines 295 to 295"]
B110 -->|call| B165
B110 -->|after return| B111
B111 -->|call| B78
B111 -->|after return| B112
B112 -->|call| B159
B112 -->|after return| B113
B113 -->|call| B165
B113 -->|after return| B114
B114 -->|call| B78
B114 -->|after return| B115
B116 -->|call| B172
B116 -->|after return| B117
B117 -->|call| B159
B117 -->|after return| B118
B118 -->|call| B165
B118 -->|after return| B119
B119 -->|call| B78
B119 -->|after return| B120
B165["Continue at B166 in section 17"]
B78["Continue at B79 in section 8"]
B159["Continue at B160 in section 16"]
B172["Continue at B173 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B112

```asm
ACALL DELAY
```

### B113

```asm
MOV A, #0C0H
ACALL CMD
```

### B114

```asm
MOV DPTR, #ANSWER
ACALL WSTR
```

### B115

```asm
ACALL DELAY
```

### B116

Return to the instruction following the active call.

```asm
RET
```

### B117

```asm
ACALL CLEAR
```

### B118

```asm
MOV A, #80H
ACALL CMD
```

### B119

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 296 to 297"]
B121["B122: instructions - lines 298 to 299"]
B122["B123: instructions - lines 300 to 300"]
B123["B124: instructions - lines 301 to 301"]
B124["B125: FN6 - lines 304 to 304"]
B125["B126: instructions - lines 305 to 306"]
B126["B127: instructions - lines 307 to 308"]
B127["B128: instructions - lines 309 to 309"]
B128["B129: instructions - lines 310 to 311"]
B129["B130: instructions - lines 312 to 312"]
B120 -->|call| B159
B120 -->|after return| B121
B121 -->|call| B165
B121 -->|after return| B122
B122 -->|call| B78
B122 -->|after return| B123
B124 -->|call| B172
B124 -->|after return| B125
B125 -->|call| B159
B125 -->|after return| B126
B126 -->|call| B165
B126 -->|after return| B127
B127 -->|call| B78
B127 -->|after return| B128
B128 -->|call| B159
B128 -->|after return| B129
B159["Continue at B160 in section 16"]
B165["Continue at B166 in section 17"]
B78["Continue at B79 in section 8"]
B172["Continue at B173 in section 18"]
```

### B121

```asm
MOV A, #0C0H
ACALL CMD
```

### B122

```asm
MOV DPTR, #ANSWER
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
ACALL CLEAR
```

### B126

```asm
MOV A, #80H
ACALL CMD
```

### B127

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B128

```asm
ACALL DELAY
```

### B129

```asm
MOV A, #0C0H
ACALL CMD
```

### B130

Return to the instruction following the active call.

```asm
RET
```

## Section 14

```mermaid
flowchart TD
B130["B131: SHOWCOST - lines 315 to 315"]
B131["B132: instructions - lines 316 to 317"]
B132["B133: instructions - lines 318 to 319"]
B133["B134: instructions - lines 320 to 320"]
B134["B135: instructions - lines 321 to 322"]
B135["B136: instructions - lines 323 to 327"]
B136["B137: instructions - lines 328 to 330"]
B137["B138: instructions - lines 332 to 332"]
B138["B139: instructions - lines 333 to 333"]
B139["B140: instructions - lines 335 to 335"]
B130 -->|call| B172
B130 -->|after return| B131
B131 -->|call| B159
B131 -->|after return| B132
B132 -->|call| B165
B132 -->|after return| B133
B133 -->|call| B78
B133 -->|after return| B134
B134 -->|call| B159
B134 -->|after return| B135
B135 -->|call| B154
B135 -->|after return| B136
B136 -->|call| B154
B136 -->|after return| B137
B137 -->|call| B78
B137 -->|after return| B138
B138 -->|call| B78
B138 -->|after return| B139
B139 -->|call| B172
B139 -->|after return| B140
B172["Continue at B173 in section 18"]
B159["Continue at B160 in section 16"]
B165["Continue at B166 in section 17"]
B78["Continue at B79 in section 8"]
B154["Continue at B155 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL CLEAR
```

### B132

```asm
MOV A, #80H
ACALL CMD
```

### B133

```asm
MOV DPTR, #STR10
ACALL WSTR
```

### B134

```asm
ACALL DELAY
```

### B135

```asm
MOV A, #0C0H
ACALL CMD
```

### B136

```asm
MOV A,35H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B137

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B138

```asm
ACALL DELAY
```

### B139

```asm
ACALL DELAY
```

### B140

```asm
ACALL CLEAR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 336 to 337"]
B141["B142: instructions - lines 338 to 339"]
B142["B143: instructions - lines 340 to 340"]
B143["B144: instructions - lines 341 to 341"]
B144["B145: ERRR - lines 346 to 346"]
B145["B146: instructions - lines 347 to 348"]
B146["B147: instructions - lines 349 to 350"]
B147["B148: instructions - lines 351 to 351"]
B148["B149: instructions - lines 352 to 352"]
B149["B150: INLCD - lines 355 to 363"]
B140 -->|call| B159
B140 -->|after return| B141
B141 -->|call| B165
B141 -->|after return| B142
B142 -->|call| B78
B142 -->|after return| B143
B144 -->|call| B172
B144 -->|after return| B145
B145 -->|call| B159
B145 -->|after return| B146
B146 -->|call| B165
B146 -->|after return| B147
B147 -->|call| B78
B147 -->|after return| B148
B149 -->|call| B170
B149 -->|after return| B150
B159["Continue at B160 in section 16"]
B165["Continue at B166 in section 17"]
B78["Continue at B79 in section 8"]
B172["Continue at B173 in section 18"]
B170["Continue at B171 in section 18"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A, #80H
ACALL CMD
```

### B142

```asm
MOV DPTR, #THANKS
ACALL WSTR
```

### B143

```asm
ACALL DELAY
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
ACALL CLEAR
```

### B146

```asm
MOV A, #80H
ACALL CMD
```

### B147

```asm
MOV DPTR, #ERR
ACALL WSTR
```

### B148

```asm
ACALL DELAY
```

### B149

Return to the instruction following the active call.

```asm
RET
```

### B150

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

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 365 to 374"]
B151["B152: instructions - lines 376 to 391"]
B152["B153: instructions - lines 393 to 405"]
B153["B154: instructions - lines 406 to 406"]
B154["B155: WCHR - lines 411 to 415"]
B155["B156: instructions - lines 416 to 416"]
B156["B157: instructions - lines 417 to 419"]
B157["B158: instructions - lines 420 to 420"]
B158["B159: instructions - lines 421 to 423"]
B159["B160: CMD - lines 426 to 428"]
B150 -->|call| B170
B150 -->|after return| B151
B151 -->|call| B170
B151 -->|after return| B152
B152 -->|call| B170
B152 -->|after return| B153
B154 -->|call| B164
B154 -->|after return| B155
B155 -->|call| B170
B155 -->|after return| B156
B156 -->|call| B164
B156 -->|after return| B157
B157 -->|call| B170
B157 -->|after return| B158
B159 -->|call| B164
B159 -->|after return| B160
B170["Continue at B171 in section 18"]
B164["Continue at B165 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

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

### B152

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

### B153

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

### B154

Return to the instruction following the active call.

```asm
RET
```

### B155

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B156

```asm
ACALL LDELAY
```

### B157

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B158

```asm
ACALL LDELAY
```

### B159

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B160

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 429 to 429"]
B161["B162: instructions - lines 430 to 432"]
B162["B163: instructions - lines 433 to 433"]
B163["B164: instructions - lines 434 to 434"]
B164["B165: COMMON - lines 438 to 443"]
B165["B166: WSTR - lines 447 to 447"]
B166["B167: CONT1 - lines 449 to 451"]
B167["B168: PRINT - lines 453 to 453"]
B168["B169: instructions - lines 454 to 455"]
B169["B170: EXIT1 - lines 456 to 457"]
B160 -->|call| B170
B160 -->|after return| B161
B161 -->|call| B164
B161 -->|after return| B162
B162 -->|call| B170
B162 -->|after return| B163
B165 -->|next| B166
B166 -->|condition true| B169
B166 -->|condition false| B167
B167 -->|call| B154
B167 -->|after return| B168
B168 -->|jump| B166
B170["Continue at B171 in section 18"]
B154["Continue at B155 in section 16"]
```

### B161

```asm
ACALL LDELAY
```

### B162

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B163

```asm
ACALL LDELAY
```

### B164

Return to the instruction following the active call.

```asm
RET
```

### B165

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B166

```asm
PUSH    ACC
```

### B167

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B168

```asm
ACALL    WCHR
```

### B169

```asm
INC DPTR
AJMP    CONT1
```

### B170

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: LDELAY - lines 461 to 462"]
B171["B172: instructions - lines 463 to 463"]
B172["B173: CLEAR - lines 466 to 467"]
B173["B174: instructions - lines 468 to 468"]
B174["B175: WAIT - lines 469 to 469"]
B175["B176: instructions - lines 470 to 470"]
B176["B177: instructions - lines 471 to 471"]
B177["B178: KEYPAD - lines 475 to 475"]
B178["B179: K1 - lines 476 to 479"]
B179["B180: K2 - lines 481 to 483"]
B170 -->|condition true| B170
B170 -->|condition false| B171
B172 -->|call| B159
B172 -->|after return| B173
B173 -->|next| B174
B174 -->|call| B170
B174 -->|after return| B175
B175 -->|condition true| B174
B175 -->|condition false| B176
B177 -->|next| B178
B178 -->|condition true| B178
B178 -->|condition false| B179
B179 -->|condition true| B181
B179 -->|condition false| B180
B159["Continue at B160 in section 16"]
B181["Continue at B182 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV R0, #50
DJNZ R0, $
```

### B172

Return to the instruction following the active call.

```asm
RET
```

### B173

```asm
MOV A,#01H
ACALL CMD
```

### B174

```asm
MOV R7,#14
```

### B175

```asm
ACALL LDELAY
```

### B176

```asm
DJNZ R7,WAIT
```

### B177

Return to the instruction following the active call.

```asm
RET
```

### B178

```asm
MOV P0,#01110000B
```

### B179

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B180

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 484 to 484"]
B181["B182: OVER1 - lines 486 to 489"]
B182["B183: instructions - lines 490 to 493"]
B183["B184: instructions - lines 494 to 497"]
B184["B185: instructions - lines 498 to 501"]
B185["B186: instructions - lines 502 to 502"]
B186["B187: ROW_0 - lines 503 to 504"]
B187["B188: ROW_1 - lines 505 to 506"]
B188["B189: ROW_2 - lines 507 to 508"]
B189["B190: ROW_3 - lines 509 to 509"]
B180 -->|jump| B179
B181 -->|condition true| B186
B181 -->|condition false| B182
B182 -->|condition true| B187
B182 -->|condition false| B183
B183 -->|condition true| B188
B183 -->|condition false| B184
B184 -->|condition true| B189
B184 -->|condition false| B185
B185 -->|jump| B179
B186 -->|jump| B190
B187 -->|jump| B190
B188 -->|jump| B190
B189 -->|next| B190
B179["Continue at B180 in section 18"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
SJMP K2
```

### B182

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B183

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B184

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B185

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B186

```asm
LJMP K2
```

### B187

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B188

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B189

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B190

```asm
MOV DPTR,#KCODE3
```

## Section 20

```mermaid
flowchart TD
B190["B191: FIND - lines 511 to 511"]
B191["B192: FIND1 - lines 513 to 514"]
B192["B193: instructions - lines 515 to 516"]
B193["B194: MATCH - lines 517 to 519"]
B194["B195: ENDD - lines 557 to 557"]
B190 -->|next| B191
B191 -->|condition true| B193
B191 -->|condition false| B192
B192 -->|jump| B191
B194 -->|jump| B194
```

### B191

```asm
RLC A
```

### B192

```asm
RLC A
JNC MATCH
```

### B193

```asm
INC DPTR
SJMP FIND1
```

### B194

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B195

```asm
sjmp $
```
