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
B0["B1: START - lines 13 to 13"]
B1["B2: instructions - lines 14 to 14"]
B2["B3: instructions - lines 15 to 15"]
B3["B4: instructions - lines 16 to 16"]
B4["B5: instructions - lines 17 to 17"]
B5["B6: instructions - lines 20 to 20"]
B6["B7: instructions - lines 21 to 21"]
B7["B8: instructions - lines 22 to 22"]
B8["B9: instructions - lines 25 to 25"]
B9["B10: instructions - lines 26 to 26"]
B0 -->|call| B276
B0 -->|after return| B1
B1 -->|call| B182
B1 -->|after return| B2
B2 -->|call| B282
B2 -->|after return| B3
B3 -->|call| B28
B3 -->|after return| B4
B4 -->|call| B188
B4 -->|after return| B5
B5 -->|call| B50
B5 -->|after return| B6
B6 -->|call| B66
B6 -->|after return| B7
B7 -->|call| B194
B7 -->|after return| B8
B8 -->|call| B82
B8 -->|after return| B9
B9 -->|call| B88
B9 -->|after return| B10
B276["Continue at B277 in section 28"]
B182["Continue at B183 in section 19"]
B282["Continue at B283 in section 29"]
B28["Continue at B29 in section 3"]
B188["Continue at B189 in section 19"]
B50["Continue at B51 in section 6"]
B66["Continue at B67 in section 7"]
B194["Continue at B195 in section 20"]
B82["Continue at B83 in section 9"]
B88["Continue at B89 in section 9"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LCALL MSG_WELCOME
```

### B2

```asm
ACALL LCDCONT1
```

### B3

```asm
ACALL DELAY
```

### B4

```asm
ACALL ENTER_CASH
```

### B5

```asm
ACALL LCDCONT2
```

### B6

```asm
ACALL COFFEE_1
```

### B7

```asm
ACALL TYPE
```

### B8

```asm
ACALL LCDCONT3
```

### B9

```asm
ACALL COFFEE_2
```

### B10

```asm
ACALL SIZE
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 27 to 27"]
B11["B12: instructions - lines 30 to 30"]
B12["B13: instructions - lines 31 to 31"]
B13["B14: instructions - lines 32 to 32"]
B14["B15: instructions - lines 35 to 35"]
B15["B16: instructions - lines 36 to 36"]
B16["B17: instructions - lines 37 to 37"]
B17["B18: instructions - lines 40 to 40"]
B18["B19: instructions - lines 41 to 41"]
B19["B20: instructions - lines 42 to 42"]
B10 -->|call| B200
B10 -->|after return| B11
B11 -->|call| B102
B11 -->|after return| B12
B12 -->|call| B108
B12 -->|after return| B13
B13 -->|call| B206
B13 -->|after return| B14
B14 -->|call| B122
B14 -->|after return| B15
B15 -->|call| B128
B15 -->|after return| B16
B16 -->|call| B212
B16 -->|after return| B17
B17 -->|call| B144
B17 -->|after return| B18
B18 -->|call| B158
B18 -->|after return| B19
B19 -->|call| B218
B19 -->|after return| B20
B200["Continue at B201 in section 21"]
B102["Continue at B103 in section 11"]
B108["Continue at B109 in section 11"]
B206["Continue at B207 in section 21"]
B122["Continue at B123 in section 13"]
B128["Continue at B129 in section 13"]
B212["Continue at B213 in section 22"]
B144["Continue at B145 in section 15"]
B158["Continue at B159 in section 16"]
B218["Continue at B219 in section 22"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL LCDCONT4
```

### B12

```asm
ACALL COFFEE_3
```

### B13

```asm
ACALL MILK
```

### B14

```asm
ACALL LCDCONT5
```

### B15

```asm
ACALL COFFEE_4
```

### B16

```asm
ACALL SUGAR
```

### B17

```asm
ACALL LCDCONT6
```

### B18

```asm
ACALL ORDER
```

### B19

```asm
ACALL COST
```

### B20

```asm
ACALL LCDCONT7
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 43 to 43"]
B21["B22: instructions - lines 44 to 44"]
B22["B23: instructions - lines 46 to 46"]
B23["B24: instructions - lines 47 to 47"]
B24["B25: instructions - lines 48 to 48"]
B25["B26: instructions - lines 49 to 49"]
B26["B27: instructions - lines 52 to 52"]
B27["B28: instructions - lines 54 to 54"]
B28["B29: ENTER_CASH - lines 60 to 60"]
B29["B30: instructions - lines 61 to 62"]
B20 -->|call| B282
B20 -->|after return| B21
B21 -->|call| B282
B21 -->|after return| B22
B22 -->|call| B168
B22 -->|after return| B23
B23 -->|call| B224
B23 -->|after return| B24
B24 -->|call| B230
B24 -->|after return| B25
B25 -->|call| B272
B25 -->|after return| B26
B26 -->|call| B333
B26 -->|after return| B27
B27 -->|jump| B0
B28 -->|call| B301
B28 -->|after return| B29
B29 -->|call| B317
B29 -->|after return| B30
B282["Continue at B283 in section 29"]
B168["Continue at B169 in section 17"]
B224["Continue at B225 in section 23"]
B230["Continue at B231 in section 24"]
B272["Continue at B273 in section 28"]
B333["Continue at B334 in section 34"]
B0["Continue at B1 in section 1"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL DELAY
```

### B22

```asm
ACALL DELAY
```

### B23

```asm
ACALL SHOW_BILL
```

### B24

```asm
ACALL LCDCONT8
```

### B25

```asm
ACALL READY
```

### B26

```asm
LCALL FLASH
```

### B27

```asm
LCALL INLCD
```

### B28

```asm
LJMP MAIN
```

### B29

```asm
ACALL SETUP_ROW1
```

### B30

```asm
MOV DPTR,#L2
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 63 to 63"]
B31["B32: instructions - lines 64 to 64"]
B32["B33: instructions - lines 65 to 66"]
B33["B34: instructions - lines 67 to 71"]
B34["B35: instructions - lines 72 to 72"]
B35["B36: instructions - lines 73 to 74"]
B36["B37: instructions - lines 75 to 80"]
B37["B38: instructions - lines 81 to 82"]
B38["B39: instructions - lines 83 to 83"]
B39["B40: instructions - lines 84 to 93"]
B30 -->|call| B304
B30 -->|after return| B31
B31 -->|call| B340
B31 -->|after return| B32
B32 -->|call| B312
B32 -->|after return| B33
B33 -->|call| B312
B33 -->|after return| B34
B34 -->|call| B340
B34 -->|after return| B35
B35 -->|call| B312
B35 -->|after return| B36
B36 -->|call| B340
B36 -->|after return| B37
B37 -->|call| B312
B37 -->|after return| B38
B38 -->|call| B306
B38 -->|after return| B39
B39 -->|condition true| B40
B39 -->|condition false| B40
B304["Continue at B305 in section 31"]
B340["Continue at B341 in section 35"]
B312["Continue at B313 in section 32"]
B306["Continue at B307 in section 31"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL SETUP_ROW2
```

### B32

```asm
ACALL KEYPAD
```

### B33

```asm
MOV 50H,A
ACALL WCHR
```

### B34

```asm
MOV A,50H
SUBB A,#30H
MOV 50H,A
MOV A,#'.'
ACALL WCHR
```

### B35

```asm
ACALL KEYPAD
```

### B36

```asm
MOV 51H,A
ACALL WCHR
```

### B37

```asm
MOV A,51H
SUBB A,#30H
MOV B,#10
MUL AB
MOV 51H,A
ACALL KEYPAD
```

### B38

```asm
MOV 52H,A
ACALL WCHR
```

### B39

```asm
ACALL LOOPLDELAY
```

### B40

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

## Section 5

```mermaid
flowchart TD
B40["B41: JJ1 - lines 94 to 94"]
B41["B42: instructions - lines 95 to 95"]
B42["B43: EP1 - lines 98 to 100"]
B43["B44: JJ - lines 101 to 101"]
B44["B45: instructions - lines 102 to 102"]
B45["B46: EP - lines 103 to 103"]
B46["B47: instructions - lines 104 to 104"]
B47["B48: ZA - lines 106 to 106"]
B48["B49: READ - lines 109 to 109"]
B49["B50: instructions - lines 110 to 111"]
B40 -->|condition true| B42
B40 -->|condition false| B41
B41 -->|jump| B47
B42 -->|condition true| B43
B42 -->|condition false| B43
B43 -->|condition true| B45
B43 -->|condition false| B44
B44 -->|jump| B47
B45 -->|call| B178
B45 -->|after return| B46
B46 -->|jump| B28
B48 -->|call| B340
B48 -->|after return| B49
B178["Continue at B179 in section 18"]
B28["Continue at B29 in section 3"]
B340["Continue at B341 in section 35"]
```

### B41

```asm
JC EP1
```

### B42

```asm
SJMP ZA
```

### B43

```asm
MOV A,53H
CLR C
CJNE A,#50,JJ
```

### B44

```asm
JC EP
```

### B45

```asm
SJMP ZA
```

### B46

```asm
ACALL ERROR_MSG
```

### B47

```asm
LJMP MMM
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
ACALL KEYPAD
```

### B50

Return to the instruction following the active call.

```asm
SUBB A,#30H
RET
```

## Section 6

```mermaid
flowchart TD
B50["B51: COFFEE_1 - lines 115 to 115"]
B51["B52: instructions - lines 116 to 117"]
B52["B53: instructions - lines 118 to 118"]
B53["B54: instructions - lines 119 to 120"]
B54["B55: instructions - lines 121 to 121"]
B55["B56: instructions - lines 123 to 123"]
B56["B57: instructions - lines 124 to 125"]
B57["B58: instructions - lines 126 to 126"]
B58["B59: instructions - lines 127 to 128"]
B59["B60: instructions - lines 129 to 129"]
B50 -->|call| B301
B50 -->|after return| B51
B51 -->|call| B317
B51 -->|after return| B52
B52 -->|call| B304
B52 -->|after return| B53
B53 -->|call| B317
B53 -->|after return| B54
B54 -->|call| B306
B54 -->|after return| B55
B55 -->|call| B301
B55 -->|after return| B56
B56 -->|call| B317
B56 -->|after return| B57
B57 -->|call| B304
B57 -->|after return| B58
B58 -->|call| B317
B58 -->|after return| B59
B59 -->|call| B306
B59 -->|after return| B60
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL SETUP_ROW1
```

### B52

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B53

```asm
ACALL SETUP_ROW2
```

### B54

```asm
MOV DPTR,#L4
ACALL WSTR
```

### B55

```asm
ACALL LOOPLDELAY
```

### B56

```asm
ACALL SETUP_ROW1
```

### B57

```asm
MOV DPTR,#L5
ACALL WSTR
```

### B58

```asm
ACALL SETUP_ROW2
```

### B59

```asm
MOV DPTR,#L6
ACALL WSTR
```

### B60

```asm
ACALL LOOPLDELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 130 to 130"]
B61["B62: instructions - lines 131 to 132"]
B62["B63: instructions - lines 133 to 133"]
B63["B64: instructions - lines 134 to 135"]
B64["B65: instructions - lines 136 to 136"]
B65["B66: instructions - lines 137 to 137"]
B66["B67: TYPE - lines 142 to 142"]
B67["B68: instructions - lines 143 to 144"]
B68["B69: instructions - lines 145 to 145"]
B69["B70: instructions - lines 146 to 147"]
B60 -->|call| B301
B60 -->|after return| B61
B61 -->|call| B317
B61 -->|after return| B62
B62 -->|call| B304
B62 -->|after return| B63
B63 -->|call| B317
B63 -->|after return| B64
B64 -->|call| B306
B64 -->|after return| B65
B66 -->|call| B301
B66 -->|after return| B67
B67 -->|call| B317
B67 -->|after return| B68
B68 -->|call| B304
B68 -->|after return| B69
B69 -->|call| B317
B69 -->|after return| B70
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL SETUP_ROW1
```

### B62

```asm
MOV DPTR,#L7
ACALL WSTR
```

### B63

```asm
ACALL SETUP_ROW2
```

### B64

```asm
MOV DPTR,#L8
ACALL WSTR
```

### B65

```asm
ACALL LOOPLDELAY
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
ACALL SETUP_ROW1
```

### B68

```asm
MOV DPTR,#TY1
ACALL WSTR
```

### B69

```asm
ACALL SETUP_ROW2
```

### B70

```asm
MOV DPTR,#TY2
ACALL WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 149 to 149"]
B71["B72: AMERICANO - lines 152 to 152"]
B72["B73: instructions - lines 153 to 155"]
B73["B74: CAPPUCCINO - lines 158 to 158"]
B74["B75: instructions - lines 159 to 161"]
B75["B76: LATTEE - lines 164 to 164"]
B76["B77: instructions - lines 165 to 167"]
B77["B78: MOCHAA - lines 170 to 170"]
B78["B79: instructions - lines 171 to 173"]
B79["B80: ERROR - lines 176 to 176"]
B70 -->|call| B48
B70 -->|after return| B71
B71 -->|condition true| B73
B71 -->|condition false| B72
B72 -->|jump| B81
B73 -->|condition true| B75
B73 -->|condition false| B74
B74 -->|jump| B81
B75 -->|condition true| B77
B75 -->|condition false| B76
B76 -->|jump| B81
B77 -->|condition true| B79
B77 -->|condition false| B78
B78 -->|jump| B81
B79 -->|call| B178
B79 -->|after return| B80
B48["Continue at B49 in section 5"]
B81["Continue at B82 in section 9"]
B178["Continue at B179 in section 18"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL READ
```

### B72

```asm
CJNE A,#1,Cappuccino
```

### B73

```asm
MOV R3,#AMER
MOV 40H,#1
SJMP BACK
```

### B74

```asm
CJNE A,#2,Lattee
```

### B75

```asm
MOV R3,#CAP
MOV 40H,#2
SJMP BACK
```

### B76

```asm
CJNE A,#3,Mochaa
```

### B77

```asm
MOV R3,#LATTE
MOV 40H,#3
SJMP BACK
```

### B78

```asm
CJNE A,#4,ERROR
```

### B79

```asm
MOV R4,#MOCHA
MOV 40H,#4
SJMP BACK
```

### B80

```asm
ACALL ERROR_MSG
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 177 to 177"]
B81["B82: BACK - lines 179 to 179"]
B82["B83: COFFEE_2 - lines 183 to 183"]
B83["B84: instructions - lines 184 to 185"]
B84["B85: instructions - lines 186 to 186"]
B85["B86: instructions - lines 187 to 188"]
B86["B87: instructions - lines 189 to 189"]
B87["B88: instructions - lines 190 to 190"]
B88["B89: SIZE - lines 195 to 195"]
B89["B90: instructions - lines 196 to 197"]
B80 -->|jump| B66
B82 -->|call| B301
B82 -->|after return| B83
B83 -->|call| B317
B83 -->|after return| B84
B84 -->|call| B304
B84 -->|after return| B85
B85 -->|call| B317
B85 -->|after return| B86
B86 -->|call| B306
B86 -->|after return| B87
B88 -->|call| B301
B88 -->|after return| B89
B89 -->|call| B317
B89 -->|after return| B90
B66["Continue at B67 in section 7"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
LJMP ZZZ
```

### B82

Return to the instruction following the active call.

```asm
RET
```

### B83

```asm
ACALL SETUP_ROW1
```

### B84

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B85

```asm
ACALL SETUP_ROW2
```

### B86

```asm
MOV DPTR,#L10
ACALL WSTR
```

### B87

```asm
ACALL LOOPLDELAY
```

### B88

Return to the instruction following the active call.

```asm
RET
```

### B89

```asm
ACALL SETUP_ROW1
```

### B90

```asm
MOV DPTR,#CY1
ACALL WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 198 to 198"]
B91["B92: instructions - lines 199 to 200"]
B92["B93: instructions - lines 201 to 201"]
B93["B94: SMALLL - lines 203 to 203"]
B94["B95: instructions - lines 204 to 206"]
B95["B96: MEDIUM - lines 209 to 209"]
B96["B97: instructions - lines 210 to 212"]
B97["B98: LARGEE - lines 215 to 215"]
B98["B99: instructions - lines 216 to 218"]
B99["B100: ERROR1 - lines 221 to 221"]
B90 -->|call| B304
B90 -->|after return| B91
B91 -->|call| B317
B91 -->|after return| B92
B92 -->|call| B48
B92 -->|after return| B93
B93 -->|condition true| B95
B93 -->|condition false| B94
B94 -->|jump| B101
B95 -->|condition true| B97
B95 -->|condition false| B96
B96 -->|jump| B101
B97 -->|condition true| B99
B97 -->|condition false| B98
B98 -->|jump| B101
B99 -->|call| B178
B99 -->|after return| B100
B304["Continue at B305 in section 31"]
B317["Continue at B318 in section 32"]
B48["Continue at B49 in section 5"]
B101["Continue at B102 in section 11"]
B178["Continue at B179 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL SETUP_ROW2
```

### B92

```asm
MOV DPTR,#CY2
ACALL WSTR
```

### B93

```asm
ACALL READ
```

### B94

```asm
CJNE A,#1,Medium
```

### B95

```asm
MOV R5,#SMALL
MOV 41H,#1
SJMP BACK1
```

### B96

```asm
CJNE A,#2,Largee
```

### B97

```asm
MOV R5,#MED
MOV 41H,#2
SJMP BACK1
```

### B98

```asm
CJNE A,#3,ERROR1
```

### B99

```asm
MOV R5,#LARGE
MOV 41H,#3
SJMP BACK1
```

### B100

```asm
ACALL ERROR_MSG
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 222 to 222"]
B101["B102: BACK1 - lines 224 to 224"]
B102["B103: COFFEE_3 - lines 228 to 228"]
B103["B104: instructions - lines 229 to 230"]
B104["B105: instructions - lines 231 to 231"]
B105["B106: instructions - lines 232 to 233"]
B106["B107: instructions - lines 234 to 234"]
B107["B108: instructions - lines 235 to 235"]
B108["B109: MILK - lines 241 to 241"]
B109["B110: instructions - lines 242 to 243"]
B100 -->|jump| B88
B102 -->|call| B301
B102 -->|after return| B103
B103 -->|call| B317
B103 -->|after return| B104
B104 -->|call| B304
B104 -->|after return| B105
B105 -->|call| B317
B105 -->|after return| B106
B106 -->|call| B306
B106 -->|after return| B107
B108 -->|call| B301
B108 -->|after return| B109
B109 -->|call| B317
B109 -->|after return| B110
B88["Continue at B89 in section 9"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
LJMP XXX
```

### B102

Return to the instruction following the active call.

```asm
RET
```

### B103

```asm
ACALL SETUP_ROW1
```

### B104

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B105

```asm
ACALL SETUP_ROW2
```

### B106

```asm
MOV DPTR,#L11
ACALL WSTR
```

### B107

```asm
ACALL LOOPLDELAY
```

### B108

Return to the instruction following the active call.

```asm
RET
```

### B109

```asm
ACALL SETUP_ROW1
```

### B110

```asm
MOV DPTR,#MY1
ACALL WSTR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 244 to 244"]
B111["B112: instructions - lines 245 to 246"]
B112["B113: instructions - lines 248 to 248"]
B113["B114: SKIMMED - lines 251 to 251"]
B114["B115: instructions - lines 252 to 253"]
B115["B116: HALF - lines 256 to 256"]
B116["B117: instructions - lines 257 to 258"]
B117["B118: FULL - lines 261 to 261"]
B118["B119: instructions - lines 262 to 263"]
B119["B120: ERROR2 - lines 266 to 266"]
B110 -->|call| B304
B110 -->|after return| B111
B111 -->|call| B317
B111 -->|after return| B112
B112 -->|call| B48
B112 -->|after return| B113
B113 -->|condition true| B115
B113 -->|condition false| B114
B114 -->|jump| B121
B115 -->|condition true| B117
B115 -->|condition false| B116
B116 -->|jump| B121
B117 -->|condition true| B119
B117 -->|condition false| B118
B118 -->|jump| B121
B119 -->|call| B178
B119 -->|after return| B120
B304["Continue at B305 in section 31"]
B317["Continue at B318 in section 32"]
B48["Continue at B49 in section 5"]
B121["Continue at B122 in section 13"]
B178["Continue at B179 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL SETUP_ROW2
```

### B112

```asm
MOV DPTR,#MY2
ACALL WSTR
```

### B113

```asm
ACALL READ
```

### B114

```asm
CJNE A,#1,Half
```

### B115

```asm
MOV 42H,#1
SJMP BACK2
```

### B116

```asm
CJNE A,#2,Full
```

### B117

```asm
MOV 42H,#2
SJMP BACK2
```

### B118

```asm
CJNE A,#3,ERROR2
```

### B119

```asm
MOV 42H,#3
SJMP BACK2
```

### B120

```asm
ACALL ERROR_MSG
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 267 to 267"]
B121["B122: BACK2 - lines 269 to 269"]
B122["B123: COFFEE_4 - lines 273 to 273"]
B123["B124: instructions - lines 274 to 275"]
B124["B125: instructions - lines 276 to 276"]
B125["B126: instructions - lines 277 to 278"]
B126["B127: instructions - lines 279 to 279"]
B127["B128: instructions - lines 280 to 280"]
B128["B129: SUGAR - lines 285 to 285"]
B129["B130: instructions - lines 286 to 287"]
B120 -->|jump| B108
B122 -->|call| B301
B122 -->|after return| B123
B123 -->|call| B317
B123 -->|after return| B124
B124 -->|call| B304
B124 -->|after return| B125
B125 -->|call| B317
B125 -->|after return| B126
B126 -->|call| B306
B126 -->|after return| B127
B128 -->|call| B301
B128 -->|after return| B129
B129 -->|call| B317
B129 -->|after return| B130
B108["Continue at B109 in section 11"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
LJMP CCC
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

```asm
ACALL SETUP_ROW1
```

### B124

```asm
MOV DPTR,#L3
ACALL WSTR
```

### B125

```asm
ACALL SETUP_ROW2
```

### B126

```asm
MOV DPTR,#L12
ACALL WSTR
```

### B127

```asm
ACALL LOOPLDELAY
```

### B128

Return to the instruction following the active call.

```asm
RET
```

### B129

```asm
ACALL SETUP_ROW1
```

### B130

```asm
MOV DPTR,#SY1
ACALL WSTR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 288 to 288"]
B131["B132: instructions - lines 289 to 290"]
B132["B133: instructions - lines 292 to 292"]
B133["B134: NONE - lines 295 to 295"]
B134["B135: instructions - lines 296 to 297"]
B135["B136: LOW1 - lines 300 to 300"]
B136["B137: instructions - lines 301 to 302"]
B137["B138: MEDIUM2 - lines 305 to 305"]
B138["B139: instructions - lines 306 to 307"]
B139["B140: HIGH1 - lines 310 to 310"]
B130 -->|call| B304
B130 -->|after return| B131
B131 -->|call| B317
B131 -->|after return| B132
B132 -->|call| B48
B132 -->|after return| B133
B133 -->|condition true| B135
B133 -->|condition false| B134
B134 -->|jump| B143
B135 -->|condition true| B137
B135 -->|condition false| B136
B136 -->|jump| B143
B137 -->|condition true| B139
B137 -->|condition false| B138
B138 -->|jump| B143
B139 -->|condition true| B141
B139 -->|condition false| B140
B304["Continue at B305 in section 31"]
B317["Continue at B318 in section 32"]
B48["Continue at B49 in section 5"]
B143["Continue at B144 in section 15"]
B141["Continue at B142 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL SETUP_ROW2
```

### B132

```asm
MOV DPTR,#SY2
ACALL WSTR
```

### B133

```asm
ACALL READ
```

### B134

```asm
CJNE A,#1,Low1
```

### B135

```asm
MOV 43H,#1
SJMP BACK3
```

### B136

```asm
CJNE A,#2,Medium2
```

### B137

```asm
MOV 43H,#2
SJMP BACK3
```

### B138

```asm
CJNE A,#3,High1
```

### B139

```asm
MOV 43H,#3
SJMP BACK3
```

### B140

```asm
CJNE A,#4,ERROR3
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 311 to 312"]
B141["B142: ERROR3 - lines 315 to 315"]
B142["B143: instructions - lines 316 to 316"]
B143["B144: BACK3 - lines 318 to 318"]
B144["B145: ORDER - lines 322 to 322"]
B145["B146: instructions - lines 323 to 324"]
B146["B147: instructions - lines 325 to 325"]
B147["B148: instructions - lines 326 to 326"]
B148["B149: instructions - lines 328 to 328"]
B149["B150: instructions - lines 329 to 329"]
B140 -->|jump| B143
B141 -->|call| B178
B141 -->|after return| B142
B142 -->|jump| B128
B144 -->|call| B301
B144 -->|after return| B145
B145 -->|call| B317
B145 -->|after return| B146
B146 -->|call| B246
B146 -->|after return| B147
B147 -->|call| B317
B147 -->|after return| B148
B148 -->|call| B304
B148 -->|after return| B149
B149 -->|call| B236
B149 -->|after return| B150
B178["Continue at B179 in section 18"]
B128["Continue at B129 in section 13"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B246["Continue at B247 in section 25"]
B304["Continue at B305 in section 31"]
B236["Continue at B237 in section 24"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV 43H,#4
SJMP BACK3
```

### B142

```asm
ACALL ERROR_MSG
```

### B143

```asm
LJMP VVV
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
ACALL SETUP_ROW1
```

### B146

```asm
MOV DPTR,#LO
ACALL WSTR
```

### B147

```asm
ACALL SELECTION2
```

### B148

```asm
ACALL WSTR
```

### B149

```asm
ACALL SETUP_ROW2
```

### B150

```asm
ACALL SELECTION1
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 330 to 330"]
B151["B152: instructions - lines 331 to 331"]
B152["B153: instructions - lines 332 to 332"]
B153["B154: instructions - lines 333 to 333"]
B154["B155: instructions - lines 334 to 334"]
B155["B156: instructions - lines 335 to 335"]
B156["B157: instructions - lines 336 to 336"]
B157["B158: instructions - lines 337 to 337"]
B158["B159: COST - lines 340 to 349"]
B159["B160: instructions - lines 350 to 351"]
B150 -->|call| B317
B150 -->|after return| B151
B151 -->|call| B254
B151 -->|after return| B152
B152 -->|call| B317
B152 -->|after return| B153
B153 -->|call| B262
B153 -->|after return| B154
B154 -->|call| B317
B154 -->|after return| B155
B155 -->|call| B306
B155 -->|after return| B156
B156 -->|call| B306
B156 -->|after return| B157
B158 -->|call| B301
B158 -->|after return| B159
B159 -->|call| B317
B159 -->|after return| B160
B317["Continue at B318 in section 32"]
B254["Continue at B255 in section 26"]
B262["Continue at B263 in section 27"]
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL WSTR
```

### B152

```asm
ACALL SELECTION3
```

### B153

```asm
ACALL WSTR
```

### B154

```asm
ACALL SELECTION4
```

### B155

```asm
ACALL WSTR
```

### B156

```asm
ACALL LOOPLDELAY
```

### B157

```asm
ACALL LOOPLDELAY
```

### B158

Return to the instruction following the active call.

```asm
RET
```

### B159

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

### B160

```asm
MOV DPTR,#L13
ACALL WSTR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 352 to 352"]
B161["B162: instructions - lines 353 to 355"]
B162["B163: instructions - lines 356 to 357"]
B163["B164: instructions - lines 358 to 363"]
B164["B165: instructions - lines 364 to 366"]
B165["B166: instructions - lines 367 to 367"]
B166["B167: instructions - lines 368 to 368"]
B167["B168: instructions - lines 369 to 369"]
B168["B169: SHOW_BILL - lines 374 to 374"]
B169["B170: instructions - lines 375 to 376"]
B160 -->|call| B304
B160 -->|after return| B161
B161 -->|call| B312
B161 -->|after return| B162
B162 -->|call| B312
B162 -->|after return| B163
B163 -->|call| B312
B163 -->|after return| B164
B164 -->|call| B312
B164 -->|after return| B165
B165 -->|call| B306
B165 -->|after return| B166
B166 -->|call| B306
B166 -->|after return| B167
B168 -->|call| B301
B168 -->|after return| B169
B169 -->|call| B317
B169 -->|after return| B170
B304["Continue at B305 in section 31"]
B312["Continue at B313 in section 32"]
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL SETUP_ROW2
```

### B162

```asm
MOV A,R4
ADD A,#30H
ACALL WCHR
```

### B163

```asm
MOV A,#'.'
ACALL WCHR
```

### B164

```asm
MOV A,R3
MOV B,#10
DIV AB
MOV 65H,B
ADD A,#30H
ACALL WCHR
```

### B165

```asm
MOV A,65H
ADD A,#30H
ACALL WCHR
```

### B166

```asm
ACALL LOOPLDELAY
```

### B167

```asm
ACALL LOOPLDELAY
```

### B168

Return to the instruction following the active call.

```asm
RET
```

### B169

```asm
ACALL SETUP_ROW1
```

### B170

```asm
MOV DPTR,#L16
ACALL WSTR
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 377 to 377"]
B171["B172: instructions - lines 378 to 379"]
B172["B173: instructions - lines 381 to 383"]
B173["B174: instructions - lines 384 to 385"]
B174["B175: instructions - lines 386 to 388"]
B175["B176: instructions - lines 389 to 391"]
B176["B177: instructions - lines 392 to 392"]
B177["B178: instructions - lines 393 to 393"]
B178["B179: ERROR_MSG - lines 397 to 397"]
B179["B180: instructions - lines 398 to 399"]
B170 -->|call| B304
B170 -->|after return| B171
B171 -->|call| B317
B171 -->|after return| B172
B172 -->|call| B312
B172 -->|after return| B173
B173 -->|call| B312
B173 -->|after return| B174
B174 -->|call| B312
B174 -->|after return| B175
B175 -->|call| B312
B175 -->|after return| B176
B176 -->|call| B306
B176 -->|after return| B177
B178 -->|call| B301
B178 -->|after return| B179
B179 -->|call| B317
B179 -->|after return| B180
B304["Continue at B305 in section 31"]
B317["Continue at B318 in section 32"]
B312["Continue at B313 in section 32"]
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL SETUP_ROW2
```

### B172

```asm
MOV DPTR,#L17
ACALL WSTR
```

### B173

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B174

```asm
MOV A,#'.'
ACALL WCHR
```

### B175

```asm
MOV A,61H
ADD A,#30H
ACALL WCHR
```

### B176

```asm
MOV A,62H
ADD A,#30H
ACALL WCHR
```

### B177

```asm
ACALL LOOPLDELAY
```

### B178

Return to the instruction following the active call.

```asm
RET
```

### B179

```asm
ACALL SETUP_ROW1
```

### B180

```asm
MOV DPTR,#L9
ACALL WSTR
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 400 to 400"]
B181["B182: instructions - lines 401 to 401"]
B182["B183: LCDCONT1 - lines 405 to 405"]
B183["B184: instructions - lines 406 to 407"]
B184["B185: instructions - lines 408 to 408"]
B185["B186: instructions - lines 409 to 410"]
B186["B187: instructions - lines 411 to 411"]
B187["B188: instructions - lines 412 to 412"]
B188["B189: LCDCONT2 - lines 414 to 414"]
B189["B190: instructions - lines 415 to 416"]
B180 -->|call| B306
B180 -->|after return| B181
B182 -->|call| B301
B182 -->|after return| B183
B183 -->|call| B317
B183 -->|after return| B184
B184 -->|call| B304
B184 -->|after return| B185
B185 -->|call| B317
B185 -->|after return| B186
B186 -->|call| B306
B186 -->|after return| B187
B188 -->|call| B301
B188 -->|after return| B189
B189 -->|call| B317
B189 -->|after return| B190
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL LOOPLDELAY
```

### B182

Return to the instruction following the active call.

```asm
RET
```

### B183

```asm
ACALL SETUP_ROW1
```

### B184

```asm
MOV DPTR,#X1
ACALL WSTR
```

### B185

```asm
ACALL SETUP_ROW2
```

### B186

```asm
MOV DPTR,#X2
ACALL WSTR
```

### B187

```asm
ACALL LOOPLDELAY
```

### B188

Return to the instruction following the active call.

```asm
RET
```

### B189

```asm
ACALL SETUP_ROW1
```

### B190

```asm
MOV DPTR,#X3
ACALL WSTR
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 417 to 417"]
B191["B192: instructions - lines 418 to 419"]
B192["B193: instructions - lines 420 to 420"]
B193["B194: instructions - lines 421 to 421"]
B194["B195: LCDCONT3 - lines 423 to 423"]
B195["B196: instructions - lines 424 to 425"]
B196["B197: instructions - lines 426 to 426"]
B197["B198: instructions - lines 427 to 428"]
B198["B199: instructions - lines 429 to 429"]
B199["B200: instructions - lines 430 to 430"]
B190 -->|call| B304
B190 -->|after return| B191
B191 -->|call| B317
B191 -->|after return| B192
B192 -->|call| B306
B192 -->|after return| B193
B194 -->|call| B301
B194 -->|after return| B195
B195 -->|call| B317
B195 -->|after return| B196
B196 -->|call| B304
B196 -->|after return| B197
B197 -->|call| B317
B197 -->|after return| B198
B198 -->|call| B306
B198 -->|after return| B199
B304["Continue at B305 in section 31"]
B317["Continue at B318 in section 32"]
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
```

### B191

```asm
ACALL SETUP_ROW2
```

### B192

```asm
MOV DPTR,#X4
ACALL WSTR
```

### B193

```asm
ACALL LOOPLDELAY
```

### B194

Return to the instruction following the active call.

```asm
RET
```

### B195

```asm
ACALL SETUP_ROW1
```

### B196

```asm
MOV DPTR,#X5
ACALL WSTR
```

### B197

```asm
ACALL SETUP_ROW2
```

### B198

```asm
MOV DPTR,#X6
ACALL WSTR
```

### B199

```asm
ACALL LOOPLDELAY
```

### B200

Return to the instruction following the active call.

```asm
RET
```

## Section 21

```mermaid
flowchart TD
B200["B201: LCDCONT4 - lines 432 to 432"]
B201["B202: instructions - lines 433 to 434"]
B202["B203: instructions - lines 435 to 435"]
B203["B204: instructions - lines 436 to 437"]
B204["B205: instructions - lines 438 to 438"]
B205["B206: instructions - lines 439 to 439"]
B206["B207: LCDCONT5 - lines 441 to 441"]
B207["B208: instructions - lines 442 to 443"]
B208["B209: instructions - lines 444 to 444"]
B209["B210: instructions - lines 445 to 446"]
B200 -->|call| B301
B200 -->|after return| B201
B201 -->|call| B317
B201 -->|after return| B202
B202 -->|call| B304
B202 -->|after return| B203
B203 -->|call| B317
B203 -->|after return| B204
B204 -->|call| B306
B204 -->|after return| B205
B206 -->|call| B301
B206 -->|after return| B207
B207 -->|call| B317
B207 -->|after return| B208
B208 -->|call| B304
B208 -->|after return| B209
B209 -->|call| B317
B209 -->|after return| B210
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL SETUP_ROW1
```

### B202

```asm
MOV DPTR,#X7
ACALL WSTR
```

### B203

```asm
ACALL SETUP_ROW2
```

### B204

```asm
MOV DPTR,#X8
ACALL WSTR
```

### B205

```asm
ACALL LOOPLDELAY
```

### B206

Return to the instruction following the active call.

```asm
RET
```

### B207

```asm
ACALL SETUP_ROW1
```

### B208

```asm
MOV DPTR,#X9
ACALL WSTR
```

### B209

```asm
ACALL SETUP_ROW2
```

### B210

```asm
MOV DPTR,#X10
ACALL WSTR
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 447 to 447"]
B211["B212: instructions - lines 448 to 448"]
B212["B213: LCDCONT6 - lines 450 to 450"]
B213["B214: instructions - lines 451 to 452"]
B214["B215: instructions - lines 453 to 453"]
B215["B216: instructions - lines 454 to 455"]
B216["B217: instructions - lines 456 to 456"]
B217["B218: instructions - lines 457 to 457"]
B218["B219: LCDCONT7 - lines 459 to 459"]
B219["B220: instructions - lines 460 to 461"]
B210 -->|call| B306
B210 -->|after return| B211
B212 -->|call| B301
B212 -->|after return| B213
B213 -->|call| B317
B213 -->|after return| B214
B214 -->|call| B304
B214 -->|after return| B215
B215 -->|call| B317
B215 -->|after return| B216
B216 -->|call| B306
B216 -->|after return| B217
B218 -->|call| B301
B218 -->|after return| B219
B219 -->|call| B317
B219 -->|after return| B220
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
ACALL LOOPLDELAY
```

### B212

Return to the instruction following the active call.

```asm
RET
```

### B213

```asm
ACALL SETUP_ROW1
```

### B214

```asm
MOV DPTR,#X11
ACALL WSTR
```

### B215

```asm
ACALL SETUP_ROW2
```

### B216

```asm
MOV DPTR,#X12
ACALL WSTR
```

### B217

```asm
ACALL LOOPLDELAY
```

### B218

Return to the instruction following the active call.

```asm
RET
```

### B219

```asm
ACALL SETUP_ROW1
```

### B220

```asm
MOV DPTR,#X13
ACALL WSTR
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 462 to 462"]
B221["B222: instructions - lines 463 to 464"]
B222["B223: instructions - lines 465 to 465"]
B223["B224: instructions - lines 466 to 466"]
B224["B225: LCDCONT8 - lines 468 to 468"]
B225["B226: instructions - lines 469 to 470"]
B226["B227: instructions - lines 471 to 471"]
B227["B228: instructions - lines 472 to 473"]
B228["B229: instructions - lines 474 to 474"]
B229["B230: instructions - lines 475 to 475"]
B220 -->|call| B304
B220 -->|after return| B221
B221 -->|call| B317
B221 -->|after return| B222
B222 -->|call| B306
B222 -->|after return| B223
B224 -->|call| B301
B224 -->|after return| B225
B225 -->|call| B317
B225 -->|after return| B226
B226 -->|call| B304
B226 -->|after return| B227
B227 -->|call| B317
B227 -->|after return| B228
B228 -->|call| B306
B228 -->|after return| B229
B304["Continue at B305 in section 31"]
B317["Continue at B318 in section 32"]
B306["Continue at B307 in section 31"]
B301["Continue at B302 in section 31"]
```

### B221

```asm
ACALL SETUP_ROW2
```

### B222

```asm
MOV DPTR,#X14
ACALL WSTR
```

### B223

```asm
ACALL LOOPLDELAY
```

### B224

Return to the instruction following the active call.

```asm
RET
```

### B225

```asm
ACALL SETUP_ROW1
```

### B226

```asm
MOV DPTR,#X15
ACALL WSTR
```

### B227

```asm
ACALL SETUP_ROW2
```

### B228

```asm
MOV DPTR,#X16
ACALL WSTR
```

### B229

```asm
ACALL LOOPLDELAY
```

### B230

Return to the instruction following the active call.

```asm
RET
```

## Section 24

```mermaid
flowchart TD
B230["B231: READY - lines 478 to 478"]
B231["B232: instructions - lines 479 to 480"]
B232["B233: instructions - lines 481 to 481"]
B233["B234: instructions - lines 482 to 483"]
B234["B235: instructions - lines 484 to 484"]
B235["B236: instructions - lines 485 to 485"]
B236["B237: SELECTION1 - lines 488 to 488"]
B237["B238: GG1 - lines 489 to 489"]
B238["B239: instructions - lines 490 to 491"]
B239["B240: Z1 - lines 492 to 492"]
B230 -->|call| B301
B230 -->|after return| B231
B231 -->|call| B317
B231 -->|after return| B232
B232 -->|call| B304
B232 -->|after return| B233
B233 -->|call| B317
B233 -->|after return| B234
B234 -->|call| B306
B234 -->|after return| B235
B236 -->|next| B237
B237 -->|condition true| B239
B237 -->|condition false| B238
B238 -->|jump| B245
B239 -->|condition true| B241
B239 -->|condition false| B240
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B245["Continue at B246 in section 25"]
B241["Continue at B242 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
ACALL SETUP_ROW1
```

### B232

```asm
MOV DPTR,#L14
ACALL WSTR
```

### B233

```asm
ACALL SETUP_ROW2
```

### B234

```asm
MOV DPTR,#L15
ACALL WSTR
```

### B235

```asm
ACALL LOOPLDELAY
```

### B236

Return to the instruction following the active call.

```asm
RET
```

### B237

```asm
MOV A,40H
```

### B238

```asm
CJNE A,#1H,Z1
```

### B239

```asm
MOV DPTR ,#T1
SJMP GO1
```

### B240

```asm
CJNE A,#2H,Z2
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 493 to 494"]
B241["B242: Z2 - lines 495 to 495"]
B242["B243: instructions - lines 496 to 497"]
B243["B244: Z3 - lines 498 to 498"]
B244["B245: instructions - lines 499 to 499"]
B245["B246: GO1 - lines 501 to 501"]
B246["B247: SELECTION2 - lines 504 to 504"]
B247["B248: GG2 - lines 505 to 505"]
B248["B249: instructions - lines 506 to 507"]
B249["B250: A1 - lines 508 to 508"]
B240 -->|jump| B245
B241 -->|condition true| B243
B241 -->|condition false| B242
B242 -->|jump| B245
B243 -->|condition true| B237
B243 -->|condition false| B244
B244 -->|next| B245
B246 -->|next| B247
B247 -->|condition true| B249
B247 -->|condition false| B248
B248 -->|jump| B253
B249 -->|condition true| B251
B249 -->|condition false| B250
B237["Continue at B238 in section 24"]
B253["Continue at B254 in section 26"]
B251["Continue at B252 in section 26"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
MOV DPTR ,#T2
SJMP GO1
```

### B242

```asm
CJNE A,#3H,Z3
```

### B243

```asm
MOV DPTR ,#T3
SJMP GO1
```

### B244

```asm
CJNE A,#4H,GG1
```

### B245

```asm
MOV DPTR ,#T4
```

### B246

Return to the instruction following the active call.

```asm
RET
```

### B247

```asm
MOV A,41H
```

### B248

```asm
CJNE A,#1H,A1
```

### B249

```asm
MOV DPTR ,#C1
SJMP GO2
```

### B250

```asm
CJNE A,#2H,A2
```

## Section 26

```mermaid
flowchart TD
B250["B251: instructions - lines 509 to 510"]
B251["B252: A2 - lines 511 to 511"]
B252["B253: instructions - lines 512 to 512"]
B253["B254: GO2 - lines 514 to 514"]
B254["B255: SELECTION3 - lines 517 to 517"]
B255["B256: GG3 - lines 518 to 518"]
B256["B257: instructions - lines 519 to 520"]
B257["B258: Q1 - lines 521 to 521"]
B258["B259: instructions - lines 522 to 523"]
B259["B260: Q2 - lines 524 to 524"]
B250 -->|jump| B253
B251 -->|condition true| B247
B251 -->|condition false| B252
B252 -->|next| B253
B254 -->|next| B255
B255 -->|condition true| B257
B255 -->|condition false| B256
B256 -->|jump| B261
B257 -->|condition true| B259
B257 -->|condition false| B258
B258 -->|jump| B261
B259 -->|condition true| B255
B259 -->|condition false| B260
B247["Continue at B248 in section 25"]
B261["Continue at B262 in section 27"]
B260["Continue at B261 in section 27"]
```

### B251

```asm
MOV DPTR ,#C2
SJMP GO2
```

### B252

```asm
CJNE A,#3H,GG2
```

### B253

```asm
MOV DPTR ,#C3
```

### B254

Return to the instruction following the active call.

```asm
RET
```

### B255

```asm
MOV A,42H
```

### B256

```asm
CJNE A,#1H,Q1
```

### B257

```asm
MOV DPTR ,#M1
SJMP GO3
```

### B258

```asm
CJNE A,#2H,Q2
```

### B259

```asm
MOV DPTR ,#M2
SJMP GO3
```

### B260

```asm
CJNE A,#3H,GG3
```

## Section 27

```mermaid
flowchart TD
B260["B261: instructions - lines 525 to 525"]
B261["B262: GO3 - lines 527 to 527"]
B262["B263: SELECTION4 - lines 530 to 530"]
B263["B264: GG4 - lines 531 to 531"]
B264["B265: instructions - lines 532 to 533"]
B265["B266: W1 - lines 534 to 534"]
B266["B267: instructions - lines 535 to 536"]
B267["B268: W2 - lines 537 to 537"]
B268["B269: instructions - lines 538 to 539"]
B269["B270: W3 - lines 540 to 540"]
B260 -->|next| B261
B262 -->|next| B263
B263 -->|condition true| B265
B263 -->|condition false| B264
B264 -->|jump| B271
B265 -->|condition true| B267
B265 -->|condition false| B266
B266 -->|jump| B271
B267 -->|condition true| B269
B267 -->|condition false| B268
B268 -->|jump| B271
B269 -->|condition true| B263
B269 -->|condition false| B270
B271["Continue at B272 in section 28"]
B270["Continue at B271 in section 28"]
```

### B261

```asm
MOV DPTR ,#M3
```

### B262

Return to the instruction following the active call.

```asm
RET
```

### B263

```asm
MOV A,43H
```

### B264

```asm
CJNE A,#1H,W1
```

### B265

```asm
MOV DPTR ,#S1
SJMP GO4
```

### B266

```asm
CJNE A,#2H,W2
```

### B267

```asm
MOV DPTR ,#S2
SJMP GO4
```

### B268

```asm
CJNE A,#3H,W3
```

### B269

```asm
MOV DPTR ,#S3
SJMP GO4
```

### B270

```asm
CJNE A,#4H,GG4
```

## Section 28

```mermaid
flowchart TD
B270["B271: instructions - lines 541 to 541"]
B271["B272: GO4 - lines 543 to 543"]
B272["B273: FLASH - lines 547 to 548"]
B273["B274: RE - lines 550 to 552"]
B274["B275: instructions - lines 553 to 553"]
B275["B276: instructions - lines 554 to 559"]
B276["B277: MSG_WELCOME - lines 562 to 562"]
B277["B278: instructions - lines 563 to 564"]
B278["B279: instructions - lines 565 to 566"]
B279["B280: instructions - lines 567 to 567"]
B270 -->|next| B271
B272 -->|next| B273
B273 -->|call| B282
B273 -->|after return| B274
B274 -->|condition true| B273
B274 -->|condition false| B275
B276 -->|call| B333
B276 -->|after return| B277
B277 -->|call| B322
B277 -->|after return| B278
B278 -->|call| B317
B278 -->|after return| B279
B279 -->|call| B306
B279 -->|after return| B280
B282["Continue at B283 in section 29"]
B333["Continue at B334 in section 34"]
B322["Continue at B323 in section 33"]
B317["Continue at B318 in section 32"]
B306["Continue at B307 in section 31"]
B280["Continue at B281 in section 29"]
```

### B271

```asm
MOV DPTR ,#S4
```

### B272

Return to the instruction following the active call.

```asm
RET
```

### B273

```asm
MOV R6,#6H
MOV A,#0FFH
```

### B274

```asm
CPL A
MOV P1,A
ACALL DELAY
```

### B275

```asm
DJNZ R6,RE
```

### B276

Return to the instruction following the active call.

```asm
MOV P1,#00H
RET
```

### B277

```asm
ACALL INLCD
```

### B278

```asm
MOV A,#85H
ACALL CMD
```

### B279

```asm
MOV DPTR ,#L1
ACALL WSTR
```

### B280

```asm
ACALL LOOPLDELAY
```

## Section 29

```mermaid
flowchart TD
B280["B281: instructions - lines 568 to 568"]
B281["B282: instructions - lines 569 to 569"]
B282["B283: DELAY - lines 575 to 575"]
B283["B284: X333 - lines 576 to 576"]
B284["B285: X233 - lines 577 to 577"]
B285["B286: X133 - lines 578 to 578"]
B286["B287: instructions - lines 579 to 579"]
B287["B288: instructions - lines 580 to 580"]
B288["B289: instructions - lines 581 to 581"]
B289["B290: BALANCE - lines 587 to 587"]
B280 -->|call| B328
B280 -->|after return| B281
B282 -->|next| B283
B283 -->|next| B284
B284 -->|next| B285
B285 -->|condition true| B285
B285 -->|condition false| B286
B286 -->|condition true| B284
B286 -->|condition false| B287
B287 -->|condition true| B283
B287 -->|condition false| B288
B289 -->|jump| B300
B328["Continue at B329 in section 33"]
B300["Continue at B301 in section 31"]
```

### B281

```asm
ACALL CLEAR
```

### B282

Return to the instruction following the active call.

```asm
RET
```

### B283

```asm
MOV R1,#7
```

### B284

```asm
MOV R2,#20
```

### B285

```asm
MOV 73H,#200
```

### B286

```asm
DJNZ 73H,X133
```

### B287

```asm
DJNZ R2,X233
```

### B288

```asm
DJNZ R1,X333
```

### B289

Return to the instruction following the active call.

```asm
RET
```

### B290

```asm
SJMP XSW
```

## Section 30

```mermaid
flowchart TD
B290["B291: RFV - lines 589 to 589"]
B291["B292: instructions - lines 590 to 591"]
B292["B293: instructions - lines 592 to 592"]
B293["B294: instructions - lines 593 to 594"]
B294["B295: instructions - lines 595 to 595"]
B295["B296: instructions - lines 596 to 598"]
B296["B297: instructions - lines 599 to 600"]
B297["B298: instructions - lines 601 to 603"]
B298["B299: instructions - lines 604 to 606"]
B299["B300: instructions - lines 607 to 607"]
B290 -->|call| B301
B290 -->|after return| B291
B291 -->|call| B317
B291 -->|after return| B292
B292 -->|call| B304
B292 -->|after return| B293
B293 -->|call| B317
B293 -->|after return| B294
B294 -->|call| B306
B294 -->|after return| B295
B295 -->|call| B312
B295 -->|after return| B296
B296 -->|call| B312
B296 -->|after return| B297
B297 -->|call| B312
B297 -->|after return| B298
B298 -->|call| B312
B298 -->|after return| B299
B299 -->|call| B28
B299 -->|after return| B300
B301["Continue at B302 in section 31"]
B317["Continue at B318 in section 32"]
B304["Continue at B305 in section 31"]
B306["Continue at B307 in section 31"]
B312["Continue at B313 in section 32"]
B28["Continue at B29 in section 3"]
B300["Continue at B301 in section 31"]
```

### B291

```asm
ACALL SETUP_ROW1
```

### B292

```asm
MOV DPTR,#L18
ACALL WSTR
```

### B293

```asm
ACALL SETUP_ROW2
```

### B294

```asm
MOV DPTR,#L19
ACALL WSTR
```

### B295

```asm
ACALL LOOPLDELAY
```

### B296

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B297

```asm
MOV A,#'.'
ACALL WCHR
```

### B298

```asm
MOV A,61H
ADD A,#30H
ACALL WCHR
```

### B299

```asm
MOV A,62H
ADD A,#30H
ACALL WCHR
```

### B300

```asm
ACALL ENTER_CASH
```

## Section 31

```mermaid
flowchart TD
B300["B301: XSW - lines 609 to 609"]
B301["B302: SETUP_ROW1 - lines 613 to 613"]
B302["B303: instructions - lines 614 to 615"]
B303["B304: instructions - lines 616 to 616"]
B304["B305: SETUP_ROW2 - lines 618 to 619"]
B305["B306: instructions - lines 620 to 620"]
B306["B307: LOOPLDELAY - lines 623 to 623"]
B307["B308: KL - lines 624 to 624"]
B308["B309: WAIT18 - lines 625 to 625"]
B309["B310: instructions - lines 626 to 626"]
B301 -->|call| B328
B301 -->|after return| B302
B302 -->|call| B322
B302 -->|after return| B303
B304 -->|call| B322
B304 -->|after return| B305
B306 -->|next| B307
B307 -->|next| B308
B308 -->|call| B338
B308 -->|after return| B309
B309 -->|condition true| B308
B309 -->|condition false| B310
B328["Continue at B329 in section 33"]
B322["Continue at B323 in section 33"]
B338["Continue at B339 in section 34"]
B310["Continue at B311 in section 32"]
```

### B301

Return to the instruction following the active call.

```asm
RET
```

### B302

```asm
ACALL CLEAR
```

### B303

```asm
MOV A,#80H
ACALL CMD
```

### B304

Return to the instruction following the active call.

```asm
RET
```

### B305

```asm
MOV A,#0C0H
ACALL CMD
```

### B306

Return to the instruction following the active call.

```asm
RET
```

### B307

```asm
MOV 71H,#7
```

### B308

```asm
MOV 72H,#250
```

### B309

```asm
ACALL LDELAY
```

### B310

```asm
DJNZ 72H,WAIT18
```

## Section 32

```mermaid
flowchart TD
B310["B311: instructions - lines 627 to 627"]
B311["B312: instructions - lines 628 to 628"]
B312["B313: WCHR - lines 632 to 636"]
B313["B314: instructions - lines 637 to 637"]
B314["B315: instructions - lines 638 to 640"]
B315["B316: instructions - lines 641 to 641"]
B316["B317: instructions - lines 642 to 644"]
B317["B318: WSTR - lines 647 to 647"]
B318["B319: CONT1 - lines 649 to 651"]
B319["B320: PRINT - lines 653 to 653"]
B310 -->|condition true| B307
B310 -->|condition false| B311
B312 -->|call| B327
B312 -->|after return| B313
B313 -->|call| B338
B313 -->|after return| B314
B314 -->|call| B327
B314 -->|after return| B315
B315 -->|call| B338
B315 -->|after return| B316
B317 -->|next| B318
B318 -->|condition true| B321
B318 -->|condition false| B319
B319 -->|call| B312
B319 -->|after return| B320
B307["Continue at B308 in section 31"]
B327["Continue at B328 in section 33"]
B338["Continue at B339 in section 34"]
B321["Continue at B322 in section 33"]
B320["Continue at B321 in section 33"]
```

### B311

```asm
DJNZ 71H,KL
```

### B312

Return to the instruction following the active call.

```asm
RET
```

### B313

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B314

```asm
ACALL LDELAY
```

### B315

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B316

```asm
ACALL LDELAY
```

### B317

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B318

```asm
PUSH ACC
```

### B319

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B320

```asm
ACALL WCHR
```

## Section 33

```mermaid
flowchart TD
B320["B321: instructions - lines 654 to 655"]
B321["B322: EXIT1 - lines 656 to 657"]
B322["B323: CMD - lines 660 to 662"]
B323["B324: instructions - lines 663 to 663"]
B324["B325: instructions - lines 664 to 666"]
B325["B326: instructions - lines 667 to 667"]
B326["B327: instructions - lines 668 to 668"]
B327["B328: COMMON - lines 671 to 676"]
B328["B329: CLEAR - lines 679 to 680"]
B329["B330: instructions - lines 681 to 681"]
B320 -->|jump| B318
B322 -->|call| B327
B322 -->|after return| B323
B323 -->|call| B338
B323 -->|after return| B324
B324 -->|call| B327
B324 -->|after return| B325
B325 -->|call| B338
B325 -->|after return| B326
B328 -->|call| B322
B328 -->|after return| B329
B329 -->|next| B330
B318["Continue at B319 in section 32"]
B338["Continue at B339 in section 34"]
B330["Continue at B331 in section 34"]
```

### B321

```asm
INC DPTR
AJMP CONT1
```

### B322

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B323

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B324

```asm
ACALL LDELAY
```

### B325

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B326

```asm
ACALL LDELAY
```

### B327

Return to the instruction following the active call.

```asm
RET
```

### B328

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B329

```asm
MOV A,#01H
ACALL CMD
```

### B330

```asm
MOV R7,#14
```

## Section 34

```mermaid
flowchart TD
B330["B331: WAIT11 - lines 682 to 682"]
B331["B332: instructions - lines 683 to 683"]
B332["B333: instructions - lines 684 to 684"]
B333["B334: INLCD - lines 687 to 694"]
B334["B335: instructions - lines 695 to 703"]
B335["B336: instructions - lines 704 to 716"]
B336["B337: instructions - lines 717 to 727"]
B337["B338: instructions - lines 728 to 728"]
B338["B339: LDELAY - lines 731 to 732"]
B339["B340: instructions - lines 733 to 733"]
B330 -->|call| B338
B330 -->|after return| B331
B331 -->|condition true| B330
B331 -->|condition false| B332
B333 -->|call| B338
B333 -->|after return| B334
B334 -->|call| B338
B334 -->|after return| B335
B335 -->|call| B338
B335 -->|after return| B336
B336 -->|call| B338
B336 -->|after return| B337
B338 -->|condition true| B338
B338 -->|condition false| B339
```

### B331

```asm
ACALL LDELAY
```

### B332

```asm
DJNZ R7,WAIT11
```

### B333

Return to the instruction following the active call.

```asm
ret
```

### B334

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

### B335

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

### B336

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

### B337

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

### B338

Return to the instruction following the active call.

```asm
RET
```

### B339

```asm
MOV R0, #50
DJNZ R0, $
```

### B340

Return to the instruction following the active call.

```asm
RET
```

## Section 35

```mermaid
flowchart TD
B340["B341: KEYPAD - lines 738 to 738"]
B341["B342: K1 - lines 741 to 744"]
B342["B343: K2 - lines 746 to 748"]
B343["B344: instructions - lines 749 to 749"]
B344["B345: OVER1 - lines 752 to 755"]
B345["B346: instructions - lines 756 to 759"]
B346["B347: instructions - lines 760 to 763"]
B347["B348: instructions - lines 764 to 767"]
B348["B349: instructions - lines 769 to 769"]
B349["B350: ROW_0 - lines 772 to 773"]
B340 -->|next| B341
B341 -->|condition true| B341
B341 -->|condition false| B342
B342 -->|condition true| B344
B342 -->|condition false| B343
B343 -->|jump| B342
B344 -->|condition true| B349
B344 -->|condition false| B345
B345 -->|condition true| B350
B345 -->|condition false| B346
B346 -->|condition true| B351
B346 -->|condition false| B347
B347 -->|condition true| B352
B347 -->|condition false| B348
B348 -->|jump| B342
B349 -->|jump| B353
B350["Continue at B351 in section 36"]
B351["Continue at B352 in section 36"]
B352["Continue at B353 in section 36"]
B353["Continue at B354 in section 36"]
```

### B341

```asm
MOV P0,#01110000B
```

### B342

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B343

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B344

```asm
SJMP K2
```

### B345

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B346

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B347

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B348

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B349

```asm
LJMP K2
```

### B350

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 36

```mermaid
flowchart TD
B350["B351: ROW_1 - lines 776 to 777"]
B351["B352: ROW_2 - lines 779 to 780"]
B352["B353: ROW_3 - lines 782 to 782"]
B353["B354: FIND - lines 786 to 786"]
B354["B355: FIND1 - lines 788 to 789"]
B355["B356: instructions - lines 790 to 791"]
B356["B357: MATCH - lines 793 to 795"]
B357["B358: STOP - lines 953 to 953"]
B350 -->|jump| B353
B351 -->|jump| B353
B352 -->|next| B353
B353 -->|next| B354
B354 -->|condition true| B356
B354 -->|condition false| B355
B355 -->|jump| B354
B357 -->|jump| B357
```

### B351

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B352

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B353

```asm
MOV DPTR,#KCODE3
```

### B354

```asm
RLC A
```

### B355

```asm
RLC A
JNC MATCH
```

### B356

```asm
INC DPTR
SJMP FIND1
```

### B357

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B358

```asm
SJMP STOP
```
