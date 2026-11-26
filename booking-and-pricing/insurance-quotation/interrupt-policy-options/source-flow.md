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
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 10"]
B2["B3: MAIN0 - lines 12 to 12"]
B3["B4: MAIN - lines 14 to 14"]
B4["B5: instructions - lines 15 to 15"]
B5["B6: instructions - lines 16 to 16"]
B6["B7: instructions - lines 17 to 17"]
B7["B8: instructions - lines 18 to 18"]
B8["B9: instructions - lines 19 to 19"]
B9["B10: instructions - lines 20 to 22"]
B0 -->|call| B158
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B94
B2 -->|after return| B3
B3 -->|call| B82
B3 -->|after return| B4
B4 -->|call| B158
B4 -->|after return| B5
B5 -->|call| B101
B5 -->|after return| B6
B6 -->|call| B186
B6 -->|after return| B7
B7 -->|call| B163
B7 -->|after return| B8
B8 -->|call| B87
B8 -->|after return| B9
B9 -->|condition true| B11
B9 -->|condition false| B10
B158["Continue at B159 in section 16"]
B94["Continue at B95 in section 10"]
B82["Continue at B83 in section 9"]
B101["Continue at B102 in section 11"]
B186["Continue at B187 in section 19"]
B163["Continue at B164 in section 17"]
B87["Continue at B88 in section 9"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
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
```

### B3

```asm
ACALL FN1
```

### B4

```asm
ACALL FLASH
```

### B5

```asm
ACALL INLCD
```

### B6

```asm
ACALL FN2
```

### B7

```asm
ACALL KEYPAD
```

### B8

```asm
ACALL WCHR
```

### B9

```asm
ACALL DELAY
```

### B10

```asm
MOV 30H,A
CJNE A,#'1',CAT2
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 23 to 24"]
B11["B12: CAT2 - lines 27 to 27"]
B12["B13: instructions - lines 28 to 29"]
B13["B14: CAT3 - lines 32 to 32"]
B14["B15: instructions - lines 33 to 34"]
B15["B16: INT - lines 37 to 37"]
B16["B17: instructions - lines 38 to 38"]
B17["B18: ERROR - lines 41 to 41"]
B18["B19: instructions - lines 42 to 42"]
B19["B20: WARR - lines 45 to 45"]
B10 -->|jump| B19
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|jump| B19
B13 -->|condition true| B15
B13 -->|condition false| B14
B14 -->|jump| B19
B15 -->|condition true| B17
B15 -->|condition false| B16
B16 -->|jump| B2
B17 -->|call| B153
B17 -->|after return| B18
B18 -->|jump| B3
B19 -->|call| B26
B19 -->|after return| B20
B2["Continue at B3 in section 1"]
B153["Continue at B154 in section 16"]
B3["Continue at B4 in section 1"]
B26["Continue at B27 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV 36H,#35
AJMP WARR
```

### B12

```asm
CJNE A,#'2',CAT3
```

### B13

```asm
MOV 36H,#28
AJMP WARR
```

### B14

```asm
CJNE A,#'3',INT
```

### B15

```asm
MOV 36H,#44
AJMP WARR
```

### B16

```asm
CJNE A,#'#',ERROR
```

### B17

```asm
LJMP MAIN0
```

### B18

```asm
ACALL ERRR
```

### B19

```asm
SJMP MAIN
```

### B20

```asm
ACALL INSURANCE
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 46 to 46"]
B21["B22: instructions - lines 47 to 47"]
B22["B23: instructions - lines 48 to 48"]
B23["B24: instructions - lines 49 to 50"]
B24["B25: instructions - lines 52 to 52"]
B25["B26: instructions - lines 54 to 54"]
B26["B27: INSURANCE - lines 60 to 60"]
B27["B28: instructions - lines 61 to 61"]
B28["B29: instructions - lines 62 to 63"]
B29["B30: instructions - lines 65 to 65"]
B20 -->|call| B46
B20 -->|after return| B21
B21 -->|call| B66
B21 -->|after return| B22
B22 -->|call| B62
B22 -->|after return| B23
B23 -->|call| B139
B23 -->|after return| B24
B24 -->|call| B82
B24 -->|after return| B25
B25 -->|jump| B203
B26 -->|call| B109
B26 -->|after return| B27
B27 -->|call| B186
B27 -->|after return| B28
B28 -->|call| B163
B28 -->|after return| B29
B29 -->|condition true| B35
B29 -->|condition false| B30
B46["Continue at B47 in section 5"]
B66["Continue at B67 in section 7"]
B62["Continue at B63 in section 7"]
B139["Continue at B140 in section 14"]
B82["Continue at B83 in section 9"]
B203["Continue at B204 in section 21"]
B109["Continue at B110 in section 11"]
B186["Continue at B187 in section 19"]
B163["Continue at B164 in section 17"]
B35["Continue at B36 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL ABROADINSURNCE
```

### B22

```asm
ACALL MEMBERSHIP
```

### B23

```asm
ACALL SUBSCRIPTION
```

### B24

```asm
MOV 35H,36H
ACALL SHOWCOST
```

### B25

```asm
ACALL FLASH
```

### B26

```asm
AJMP ENDD
```

### B27

```asm
ACALL FN3
```

### B28

```asm
ACALL KEYPAD
```

### B29

```asm
MOV 31H,A
ACALL WCHR
```

### B30

```asm
CJNE A,#'1',TWOYEAR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 68 to 69"]
B31["B32: instructions - lines 70 to 73"]
B32["B33: CATT2 - lines 76 to 76"]
B33["B34: instructions - lines 77 to 80"]
B34["B35: CATT3 - lines 83 to 86"]
B35["B36: TWOYEAR - lines 92 to 92"]
B36["B37: instructions - lines 93 to 94"]
B37["B38: instructions - lines 95 to 98"]
B38["B39: CCAT2 - lines 101 to 101"]
B39["B40: instructions - lines 102 to 105"]
B30 -->|condition true| B32
B30 -->|condition false| B31
B31 -->|jump| B45
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|jump| B45
B34 -->|jump| B45
B35 -->|condition true| B41
B35 -->|condition false| B36
B36 -->|condition true| B38
B36 -->|condition false| B37
B37 -->|jump| B45
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B45
B45["Continue at B46 in section 5"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,30H
CJNE A,#1,CATT2
```

### B32

```asm
MOV A,36H
ADD A,#5
MOV 36H,A
SJMP BACK
```

### B33

```asm
CJNE A,#'2',CATT3
```

### B34

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B35

```asm
MOV A,36H
ADD A,#12
MOV 36H,A
SJMP BACK
```

### B36

```asm
CJNE A,#'2',INT1
```

### B37

```asm
MOV A,30H
CJNE A,#1,CCAT2
```

### B38

```asm
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B39

```asm
CJNE A,#2,CCAT3
```

### B40

```asm
MOV A,36H
ADD A,#18
MOV 36H,A
SJMP BACK
```

## Section 5

```mermaid
flowchart TD
B40["B41: CCAT3 - lines 108 to 111"]
B41["B42: INT1 - lines 114 to 114"]
B42["B43: instructions - lines 115 to 115"]
B43["B44: EEE - lines 118 to 118"]
B44["B45: instructions - lines 119 to 119"]
B45["B46: BACK - lines 122 to 122"]
B46["B47: ABROADINSURNCE - lines 126 to 126"]
B47["B48: instructions - lines 127 to 127"]
B48["B49: instructions - lines 128 to 129"]
B49["B50: instructions - lines 130 to 131"]
B40 -->|jump| B45
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B2
B43 -->|call| B153
B43 -->|after return| B44
B44 -->|jump| B26
B46 -->|call| B117
B46 -->|after return| B47
B47 -->|call| B186
B47 -->|after return| B48
B48 -->|call| B163
B48 -->|after return| B49
B49 -->|condition true| B55
B49 -->|condition false| B50
B2["Continue at B3 in section 1"]
B153["Continue at B154 in section 16"]
B26["Continue at B27 in section 3"]
B117["Continue at B118 in section 12"]
B186["Continue at B187 in section 19"]
B163["Continue at B164 in section 17"]
B55["Continue at B56 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,36H
ADD A,#20
MOV 36H,A
SJMP BACK
```

### B42

```asm
CJNE A,#'#',EEE
```

### B43

```asm
LJMP MAIN0
```

### B44

```asm
ACALL ERRR
```

### B45

```asm
SJMP INSURANCE
```

### B46

Return to the instruction following the active call.

```asm
RET
```

### B47

```asm
ACALL FN4
```

### B48

```asm
ACALL KEYPAD
```

### B49

```asm
MOV 32H,A
ACALL WCHR
```

### B50

```asm
MOV A,32H
CJNE A,#'1',NO
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 134 to 135"]
B51["B52: instructions - lines 136 to 139"]
B52["B53: CAT22 - lines 142 to 142"]
B53["B54: instructions - lines 143 to 146"]
B54["B55: CAT33 - lines 149 to 152"]
B55["B56: NO - lines 155 to 155"]
B56["B57: instructions - lines 156 to 156"]
B57["B58: INT2 - lines 159 to 159"]
B58["B59: instructions - lines 160 to 160"]
B59["B60: EERR - lines 163 to 163"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|jump| B61
B52 -->|condition true| B54
B52 -->|condition false| B53
B53 -->|jump| B61
B54 -->|jump| B61
B55 -->|condition true| B57
B55 -->|condition false| B56
B56 -->|jump| B61
B57 -->|condition true| B59
B57 -->|condition false| B58
B58 -->|jump| B2
B59 -->|call| B153
B59 -->|after return| B60
B61["Continue at B62 in section 7"]
B2["Continue at B3 in section 1"]
B153["Continue at B154 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,30H
CJNE A,#1,CAT22
```

### B52

```asm
MOV A,36H
ADD A,#13
MOV 36H,A
SJMP BACK1
```

### B53

```asm
CJNE A,#2,CAT33
```

### B54

```asm
MOV A,36H
ADD A,#22
MOV 36H,A
SJMP BACK1
```

### B55

```asm
MOV A,36H
ADD A,#25
MOV 36H,A
SJMP BACK1
```

### B56

```asm
CJNE A,#'2',INT2
```

### B57

```asm
SJMP BACK1
```

### B58

```asm
CJNE A,#'#',EERR
```

### B59

```asm
LJMP MAIN0
```

### B60

```asm
ACALL ERRR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 164 to 164"]
B61["B62: BACK1 - lines 167 to 167"]
B62["B63: SUBSCRIPTION - lines 171 to 171"]
B63["B64: instructions - lines 172 to 172"]
B64["B65: instructions - lines 173 to 174"]
B65["B66: instructions - lines 175 to 182"]
B66["B67: MEMBERSHIP - lines 186 to 186"]
B67["B68: instructions - lines 187 to 187"]
B68["B69: instructions - lines 188 to 189"]
B69["B70: instructions - lines 190 to 191"]
B60 -->|jump| B46
B62 -->|call| B133
B62 -->|after return| B63
B63 -->|call| B186
B63 -->|after return| B64
B64 -->|call| B163
B64 -->|after return| B65
B66 -->|call| B125
B66 -->|after return| B67
B67 -->|call| B186
B67 -->|after return| B68
B68 -->|call| B163
B68 -->|after return| B69
B69 -->|condition true| B75
B69 -->|condition false| B70
B46["Continue at B47 in section 5"]
B133["Continue at B134 in section 14"]
B186["Continue at B187 in section 19"]
B163["Continue at B164 in section 17"]
B125["Continue at B126 in section 13"]
B75["Continue at B76 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SJMP ABROADINSURNCE
```

### B62

Return to the instruction following the active call.

```asm
RET
```

### B63

```asm
ACALL FN6
```

### B64

```asm
ACALL KEYPAD
```

### B65

```asm
MOV 34H,A
ACALL WCHR
```

### B66

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

### B67

```asm
ACALL FN5
```

### B68

```asm
ACALL KEYPAD
```

### B69

```asm
MOV 33H,A
ACALL WCHR
```

### B70

```asm
MOV A,33H
CJNE A,#'1',NO2
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 194 to 195"]
B71["B72: instructions - lines 196 to 199"]
B72["B73: CATT22 - lines 202 to 202"]
B73["B74: instructions - lines 203 to 206"]
B74["B75: CATT33 - lines 209 to 212"]
B75["B76: NO2 - lines 215 to 215"]
B76["B77: instructions - lines 216 to 216"]
B77["B78: INT3 - lines 219 to 219"]
B78["B79: instructions - lines 220 to 220"]
B79["B80: EERRR - lines 223 to 223"]
B70 -->|condition true| B72
B70 -->|condition false| B71
B71 -->|jump| B81
B72 -->|condition true| B74
B72 -->|condition false| B73
B73 -->|jump| B81
B74 -->|jump| B81
B75 -->|condition true| B77
B75 -->|condition false| B76
B76 -->|jump| B81
B77 -->|condition true| B79
B77 -->|condition false| B78
B78 -->|jump| B2
B79 -->|call| B153
B79 -->|after return| B80
B81["Continue at B82 in section 9"]
B2["Continue at B3 in section 1"]
B153["Continue at B154 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,30H
CJNE A,#1,CATT22
```

### B72

```asm
MOV A,36H
SUBB A,#8
MOV 36H,A
SJMP BACK3
```

### B73

```asm
CJNE A,#2,CATT33
```

### B74

```asm
MOV A,36H
SUBB A,#10
MOV 36H,A
SJMP BACK3
```

### B75

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B76

```asm
CJNE A,#'2',INT3
```

### B77

```asm
SJMP BACK3
```

### B78

```asm
CJNE A,#'#',EERRR
```

### B79

```asm
LJMP MAIN0
```

### B80

```asm
ACALL ERRR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 224 to 224"]
B81["B82: BACK3 - lines 228 to 228"]
B82["B83: FLASH - lines 231 to 231"]
B83["B84: HHE - lines 233 to 234"]
B84["B85: instructions - lines 236 to 237"]
B85["B86: instructions - lines 238 to 238"]
B86["B87: instructions - lines 239 to 239"]
B87["B88: DELAY - lines 242 to 242"]
B88["B89: X3 - lines 243 to 243"]
B89["B90: X2 - lines 244 to 244"]
B80 -->|jump| B66
B82 -->|next| B83
B83 -->|call| B87
B83 -->|after return| B84
B84 -->|call| B87
B84 -->|after return| B85
B85 -->|condition true| B83
B85 -->|condition false| B86
B87 -->|next| B88
B88 -->|next| B89
B89 -->|next| B90
B66["Continue at B67 in section 7"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
SJMP MEMBERSHIP
```

### B82

Return to the instruction following the active call.

```asm
RET
```

### B83

```asm
MOV R7,#5
```

### B84

```asm
MOV P1,#0H
ACALL DELAY
```

### B85

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B86

```asm
DJNZ R7,HHE
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

```asm
MOV	R5,#2
```

### B89

```asm
MOV	R4,#20
```

### B90

```asm
MOV	R3,#250
```

## Section 10

```mermaid
flowchart TD
B90["B91: X1 - lines 245 to 245"]
B91["B92: instructions - lines 246 to 246"]
B92["B93: instructions - lines 247 to 247"]
B93["B94: instructions - lines 248 to 248"]
B94["B95: FN1 - lines 252 to 253"]
B95["B96: instructions - lines 254 to 255"]
B96["B97: instructions - lines 256 to 256"]
B97["B98: instructions - lines 257 to 258"]
B98["B99: instructions - lines 259 to 260"]
B99["B100: instructions - lines 261 to 261"]
B90 -->|condition true| B90
B90 -->|condition false| B91
B91 -->|condition true| B89
B91 -->|condition false| B92
B92 -->|condition true| B88
B92 -->|condition false| B93
B94 -->|call| B168
B94 -->|after return| B95
B95 -->|call| B174
B95 -->|after return| B96
B96 -->|call| B87
B96 -->|after return| B97
B97 -->|call| B168
B97 -->|after return| B98
B98 -->|call| B174
B98 -->|after return| B99
B99 -->|call| B87
B99 -->|after return| B100
B89["Continue at B90 in section 9"]
B88["Continue at B89 in section 9"]
B168["Continue at B169 in section 17"]
B174["Continue at B175 in section 18"]
B87["Continue at B88 in section 9"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
DJNZ	R3,X1
```

### B92

```asm
DJNZ	R4,X2
```

### B93

```asm
DJNZ	R5,X3
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
MOV A, #80H
ACALL CMD
```

### B96

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B97

```asm
ACALL DELAY
```

### B98

```asm
MOV A, #0C0H
ACALL CMD
```

### B99

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 262 to 262"]
B101["B102: FN2 - lines 265 to 265"]
B102["B103: instructions - lines 266 to 267"]
B103["B104: instructions - lines 268 to 269"]
B104["B105: instructions - lines 270 to 270"]
B105["B106: instructions - lines 271 to 272"]
B106["B107: instructions - lines 273 to 274"]
B107["B108: instructions - lines 275 to 275"]
B108["B109: instructions - lines 276 to 276"]
B109["B110: FN3 - lines 279 to 279"]
B101 -->|call| B181
B101 -->|after return| B102
B102 -->|call| B168
B102 -->|after return| B103
B103 -->|call| B174
B103 -->|after return| B104
B104 -->|call| B87
B104 -->|after return| B105
B105 -->|call| B168
B105 -->|after return| B106
B106 -->|call| B174
B106 -->|after return| B107
B107 -->|call| B87
B107 -->|after return| B108
B109 -->|call| B181
B109 -->|after return| B110
B181["Continue at B182 in section 19"]
B168["Continue at B169 in section 17"]
B174["Continue at B175 in section 18"]
B87["Continue at B88 in section 9"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
ACALL CLEAR
```

### B103

```asm
MOV A, #80H
ACALL CMD
```

### B104

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B105

```asm
ACALL DELAY
```

### B106

```asm
MOV A, #0C0H
ACALL CMD
```

### B107

```asm
MOV DPTR, #STR4
ACALL WSTR
```

### B108

```asm
ACALL DELAY
```

### B109

Return to the instruction following the active call.

```asm
RET
```

### B110

```asm
ACALL CLEAR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 280 to 281"]
B111["B112: instructions - lines 282 to 283"]
B112["B113: instructions - lines 284 to 284"]
B113["B114: instructions - lines 285 to 286"]
B114["B115: instructions - lines 287 to 288"]
B115["B116: instructions - lines 289 to 289"]
B116["B117: instructions - lines 290 to 290"]
B117["B118: FN4 - lines 293 to 293"]
B118["B119: instructions - lines 294 to 295"]
B119["B120: instructions - lines 296 to 297"]
B110 -->|call| B168
B110 -->|after return| B111
B111 -->|call| B174
B111 -->|after return| B112
B112 -->|call| B87
B112 -->|after return| B113
B113 -->|call| B168
B113 -->|after return| B114
B114 -->|call| B174
B114 -->|after return| B115
B115 -->|call| B87
B115 -->|after return| B116
B117 -->|call| B181
B117 -->|after return| B118
B118 -->|call| B168
B118 -->|after return| B119
B119 -->|call| B174
B119 -->|after return| B120
B168["Continue at B169 in section 17"]
B174["Continue at B175 in section 18"]
B87["Continue at B88 in section 9"]
B181["Continue at B182 in section 19"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A, #80H
ACALL CMD
```

### B112

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B113

```asm
ACALL DELAY
```

### B114

```asm
MOV A, #0C0H
ACALL CMD
```

### B115

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B116

```asm
ACALL DELAY
```

### B117

Return to the instruction following the active call.

```asm
RET
```

### B118

```asm
ACALL CLEAR
```

### B119

```asm
MOV A, #80H
ACALL CMD
```

### B120

```asm
MOV DPTR, #STR7
ACALL WSTR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 298 to 298"]
B121["B122: instructions - lines 299 to 300"]
B122["B123: instructions - lines 301 to 302"]
B123["B124: instructions - lines 303 to 303"]
B124["B125: instructions - lines 304 to 304"]
B125["B126: FN5 - lines 307 to 307"]
B126["B127: instructions - lines 308 to 309"]
B127["B128: instructions - lines 310 to 311"]
B128["B129: instructions - lines 312 to 312"]
B129["B130: instructions - lines 313 to 314"]
B120 -->|call| B87
B120 -->|after return| B121
B121 -->|call| B168
B121 -->|after return| B122
B122 -->|call| B174
B122 -->|after return| B123
B123 -->|call| B87
B123 -->|after return| B124
B125 -->|call| B181
B125 -->|after return| B126
B126 -->|call| B168
B126 -->|after return| B127
B127 -->|call| B174
B127 -->|after return| B128
B128 -->|call| B87
B128 -->|after return| B129
B129 -->|call| B168
B129 -->|after return| B130
B87["Continue at B88 in section 9"]
B168["Continue at B169 in section 17"]
B174["Continue at B175 in section 18"]
B181["Continue at B182 in section 19"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL DELAY
```

### B122

```asm
MOV A, #0C0H
ACALL CMD
```

### B123

```asm
MOV DPTR, #ANSWER
ACALL WSTR
```

### B124

```asm
ACALL DELAY
```

### B125

Return to the instruction following the active call.

```asm
RET
```

### B126

```asm
ACALL CLEAR
```

### B127

```asm
MOV A, #80H
ACALL CMD
```

### B128

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
MOV A, #0C0H
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 315 to 316"]
B131["B132: instructions - lines 317 to 317"]
B132["B133: instructions - lines 318 to 318"]
B133["B134: FN6 - lines 321 to 321"]
B134["B135: instructions - lines 322 to 323"]
B135["B136: instructions - lines 324 to 325"]
B136["B137: instructions - lines 326 to 326"]
B137["B138: instructions - lines 327 to 328"]
B138["B139: instructions - lines 329 to 329"]
B139["B140: SHOWCOST - lines 332 to 332"]
B130 -->|call| B174
B130 -->|after return| B131
B131 -->|call| B87
B131 -->|after return| B132
B133 -->|call| B181
B133 -->|after return| B134
B134 -->|call| B168
B134 -->|after return| B135
B135 -->|call| B174
B135 -->|after return| B136
B136 -->|call| B87
B136 -->|after return| B137
B137 -->|call| B168
B137 -->|after return| B138
B139 -->|call| B181
B139 -->|after return| B140
B174["Continue at B175 in section 18"]
B87["Continue at B88 in section 9"]
B181["Continue at B182 in section 19"]
B168["Continue at B169 in section 17"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV DPTR, #ANSWER
ACALL WSTR
```

### B132

```asm
ACALL DELAY
```

### B133

Return to the instruction following the active call.

```asm
RET
```

### B134

```asm
ACALL CLEAR
```

### B135

```asm
MOV A, #80H
ACALL CMD
```

### B136

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B137

```asm
ACALL DELAY
```

### B138

```asm
MOV A, #0C0H
ACALL CMD
```

### B139

Return to the instruction following the active call.

```asm
RET
```

### B140

```asm
ACALL CLEAR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 333 to 334"]
B141["B142: instructions - lines 335 to 336"]
B142["B143: instructions - lines 337 to 337"]
B143["B144: instructions - lines 338 to 339"]
B144["B145: instructions - lines 340 to 344"]
B145["B146: instructions - lines 345 to 347"]
B146["B147: instructions - lines 349 to 349"]
B147["B148: instructions - lines 350 to 350"]
B148["B149: instructions - lines 352 to 352"]
B149["B150: instructions - lines 353 to 354"]
B140 -->|call| B168
B140 -->|after return| B141
B141 -->|call| B174
B141 -->|after return| B142
B142 -->|call| B87
B142 -->|after return| B143
B143 -->|call| B168
B143 -->|after return| B144
B144 -->|call| B163
B144 -->|after return| B145
B145 -->|call| B163
B145 -->|after return| B146
B146 -->|call| B87
B146 -->|after return| B147
B147 -->|call| B87
B147 -->|after return| B148
B148 -->|call| B181
B148 -->|after return| B149
B149 -->|call| B168
B149 -->|after return| B150
B168["Continue at B169 in section 17"]
B174["Continue at B175 in section 18"]
B87["Continue at B88 in section 9"]
B163["Continue at B164 in section 17"]
B181["Continue at B182 in section 19"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A, #80H
ACALL CMD
```

### B142

```asm
MOV DPTR, #STR10
ACALL WSTR
```

### B143

```asm
ACALL DELAY
```

### B144

```asm
MOV A, #0C0H
ACALL CMD
```

### B145

```asm
MOV A,35H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B146

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B147

```asm
ACALL DELAY
```

### B148

```asm
ACALL DELAY
```

### B149

```asm
ACALL CLEAR
```

### B150

```asm
MOV A, #80H
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 355 to 356"]
B151["B152: instructions - lines 357 to 357"]
B152["B153: instructions - lines 358 to 358"]
B153["B154: ERRR - lines 363 to 363"]
B154["B155: instructions - lines 364 to 365"]
B155["B156: instructions - lines 366 to 367"]
B156["B157: instructions - lines 368 to 368"]
B157["B158: instructions - lines 369 to 369"]
B158["B159: INLCD - lines 372 to 380"]
B159["B160: instructions - lines 382 to 391"]
B150 -->|call| B174
B150 -->|after return| B151
B151 -->|call| B87
B151 -->|after return| B152
B153 -->|call| B181
B153 -->|after return| B154
B154 -->|call| B168
B154 -->|after return| B155
B155 -->|call| B174
B155 -->|after return| B156
B156 -->|call| B87
B156 -->|after return| B157
B158 -->|call| B179
B158 -->|after return| B159
B159 -->|call| B179
B159 -->|after return| B160
B174["Continue at B175 in section 18"]
B87["Continue at B88 in section 9"]
B181["Continue at B182 in section 19"]
B168["Continue at B169 in section 17"]
B179["Continue at B180 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV DPTR, #THANKS
ACALL WSTR
```

### B152

```asm
ACALL DELAY
```

### B153

Return to the instruction following the active call.

```asm
RET
```

### B154

```asm
ACALL CLEAR
```

### B155

```asm
MOV A, #80H
ACALL CMD
```

### B156

```asm
MOV DPTR, #ERR
ACALL WSTR
```

### B157

```asm
ACALL DELAY
```

### B158

Return to the instruction following the active call.

```asm
RET
```

### B159

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

### B160

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

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 393 to 408"]
B161["B162: instructions - lines 410 to 422"]
B162["B163: instructions - lines 423 to 423"]
B163["B164: WCHR - lines 428 to 432"]
B164["B165: instructions - lines 433 to 433"]
B165["B166: instructions - lines 434 to 436"]
B166["B167: instructions - lines 437 to 437"]
B167["B168: instructions - lines 438 to 440"]
B168["B169: CMD - lines 443 to 445"]
B169["B170: instructions - lines 446 to 446"]
B160 -->|call| B179
B160 -->|after return| B161
B161 -->|call| B179
B161 -->|after return| B162
B163 -->|call| B173
B163 -->|after return| B164
B164 -->|call| B179
B164 -->|after return| B165
B165 -->|call| B173
B165 -->|after return| B166
B166 -->|call| B179
B166 -->|after return| B167
B168 -->|call| B173
B168 -->|after return| B169
B169 -->|call| B179
B169 -->|after return| B170
B179["Continue at B180 in section 18"]
B173["Continue at B174 in section 18"]
B170["Continue at B171 in section 18"]
```

### B161

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

### B162

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

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B165

```asm
ACALL LDELAY
```

### B166

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B167

```asm
ACALL LDELAY
```

### B168

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B169

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B170

```asm
ACALL LDELAY
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 447 to 449"]
B171["B172: instructions - lines 450 to 450"]
B172["B173: instructions - lines 451 to 451"]
B173["B174: COMMON - lines 455 to 460"]
B174["B175: WSTR - lines 464 to 464"]
B175["B176: CONT1 - lines 466 to 468"]
B176["B177: PRINT - lines 470 to 470"]
B177["B178: instructions - lines 471 to 472"]
B178["B179: EXIT1 - lines 473 to 474"]
B179["B180: LDELAY - lines 478 to 479"]
B170 -->|call| B173
B170 -->|after return| B171
B171 -->|call| B179
B171 -->|after return| B172
B174 -->|next| B175
B175 -->|condition true| B178
B175 -->|condition false| B176
B176 -->|call| B163
B176 -->|after return| B177
B177 -->|jump| B175
B179 -->|condition true| B179
B179 -->|condition false| B180
B163["Continue at B164 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B172

```asm
ACALL LDELAY
```

### B173

Return to the instruction following the active call.

```asm
RET
```

### B174

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B175

```asm
PUSH    ACC
```

### B176

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B177

```asm
ACALL    WCHR
```

### B178

```asm
INC DPTR
AJMP    CONT1
```

### B179

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B180

```asm
MOV R0, #50
DJNZ R0, $
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 480 to 480"]
B181["B182: CLEAR - lines 483 to 484"]
B182["B183: instructions - lines 485 to 485"]
B183["B184: WAIT - lines 486 to 486"]
B184["B185: instructions - lines 487 to 487"]
B185["B186: instructions - lines 488 to 488"]
B186["B187: KEYPAD - lines 492 to 492"]
B187["B188: K1 - lines 493 to 496"]
B188["B189: K2 - lines 498 to 500"]
B189["B190: instructions - lines 501 to 501"]
B181 -->|call| B168
B181 -->|after return| B182
B182 -->|next| B183
B183 -->|call| B179
B183 -->|after return| B184
B184 -->|condition true| B183
B184 -->|condition false| B185
B186 -->|next| B187
B187 -->|condition true| B187
B187 -->|condition false| B188
B188 -->|condition true| B190
B188 -->|condition false| B189
B189 -->|jump| B188
B168["Continue at B169 in section 17"]
B179["Continue at B180 in section 18"]
B190["Continue at B191 in section 20"]
```

### B181

Return to the instruction following the active call.

```asm
RET
```

### B182

```asm
MOV A,#01H
ACALL CMD
```

### B183

```asm
MOV R7,#14
```

### B184

```asm
ACALL LDELAY
```

### B185

```asm
DJNZ R7,WAIT
```

### B186

Return to the instruction following the active call.

```asm
RET
```

### B187

```asm
MOV P0,#01110000B
```

### B188

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B189

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B190

```asm
SJMP K2
```

## Section 20

```mermaid
flowchart TD
B190["B191: OVER1 - lines 503 to 506"]
B191["B192: instructions - lines 507 to 510"]
B192["B193: instructions - lines 511 to 514"]
B193["B194: instructions - lines 515 to 518"]
B194["B195: instructions - lines 519 to 519"]
B195["B196: ROW_0 - lines 520 to 521"]
B196["B197: ROW_1 - lines 522 to 523"]
B197["B198: ROW_2 - lines 524 to 525"]
B198["B199: ROW_3 - lines 526 to 526"]
B199["B200: FIND - lines 528 to 528"]
B190 -->|condition true| B195
B190 -->|condition false| B191
B191 -->|condition true| B196
B191 -->|condition false| B192
B192 -->|condition true| B197
B192 -->|condition false| B193
B193 -->|condition true| B198
B193 -->|condition false| B194
B194 -->|jump| B188
B195 -->|jump| B199
B196 -->|jump| B199
B197 -->|jump| B199
B198 -->|next| B199
B199 -->|next| B200
B188["Continue at B189 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B192

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B193

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B194

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B195

```asm
LJMP K2
```

### B196

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B197

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B198

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B199

```asm
MOV DPTR,#KCODE3
```

### B200

```asm
RLC A
```

## Section 21

```mermaid
flowchart TD
B200["B201: FIND1 - lines 530 to 531"]
B201["B202: instructions - lines 532 to 533"]
B202["B203: MATCH - lines 534 to 536"]
B203["B204: ENDD - lines 574 to 574"]
B200 -->|condition true| B202
B200 -->|condition false| B201
B201 -->|jump| B200
B203 -->|jump| B203
```

### B201

```asm
RLC A
JNC MATCH
```

### B202

```asm
INC DPTR
SJMP FIND1
```

### B203

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B204

```asm
sjmp $
```
