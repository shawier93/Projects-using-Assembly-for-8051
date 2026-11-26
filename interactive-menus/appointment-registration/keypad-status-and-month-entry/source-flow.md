# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 8 to 22"]
B1["B2: instructions - lines 23 to 23"]
B2["B3: instructions - lines 24 to 24"]
B3["B4: instructions - lines 25 to 25"]
B4["B5: START - lines 28 to 28"]
B5["B6: instructions - lines 29 to 29"]
B6["B7: instructions - lines 30 to 30"]
B7["B8: instructions - lines 31 to 31"]
B8["B9: instructions - lines 32 to 32"]
B9["B10: instructions - lines 35 to 35"]
B0 -->|call| B127
B0 -->|after return| B1
B1 -->|call| B156
B1 -->|after return| B2
B2 -->|call| B99
B2 -->|after return| B3
B3 -->|call| B127
B3 -->|after return| B4
B4 -->|call| B163
B4 -->|after return| B5
B5 -->|call| B132
B5 -->|after return| B6
B6 -->|call| B116
B6 -->|after return| B7
B7 -->|call| B104
B7 -->|after return| B8
B8 -->|call| B104
B8 -->|after return| B9
B9 -->|condition true| B22
B9 -->|condition false| B10
B127["Continue at B128 in section 13"]
B156["Continue at B157 in section 16"]
B99["Continue at B100 in section 10"]
B163["Continue at B164 in section 17"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B104["Continue at B105 in section 11"]
B22["Continue at B23 in section 3"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 50H,#0
MOV 51H,#4
MOV 52H,#1
MOV 53H,#3
MOV 54H,#1
MOV 55H,#100
MOV 56H,#1
MOV 57H,#1
MOV 58H,#1
ACALL INLCD
```

### B2

```asm
ACALL WELCOMEMSG
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
ACALL MENUMSG
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
ACALL DELAY
```

### B10

```asm
CJNE A,#'1', EXIT
```

## Section 2

```mermaid
flowchart TD
B10["B11: LOOP - lines 38 to 38"]
B11["B12: instructions - lines 39 to 39"]
B12["B13: instructions - lines 40 to 40"]
B13["B14: instructions - lines 41 to 42"]
B14["B15: instructions - lines 44 to 44"]
B15["B16: instructions - lines 45 to 45"]
B16["B17: instructions - lines 46 to 46"]
B17["B18: OP1 - lines 50 to 50"]
B18["B19: instructions - lines 51 to 51"]
B19["B20: instructions - lines 52 to 52"]
B10 -->|call| B180
B10 -->|after return| B11
B11 -->|call| B132
B11 -->|after return| B12
B12 -->|call| B116
B12 -->|after return| B13
B13 -->|call| B104
B13 -->|after return| B14
B14 -->|condition true| B17
B14 -->|condition false| B15
B15 -->|call| B36
B15 -->|after return| B16
B16 -->|jump| B27
B17 -->|condition true| B20
B17 -->|condition false| B18
B18 -->|call| B61
B18 -->|after return| B19
B19 -->|jump| B27
B180["Continue at B181 in section 19"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B104["Continue at B105 in section 11"]
B36["Continue at B37 in section 4"]
B27["Continue at B28 in section 3"]
B20["Continue at B21 in section 3"]
B61["Continue at B62 in section 7"]
```

### B11

```asm
ACALL MES1
```

### B12

```asm
ACALL KEYPAD
```

### B13

```asm
ACALL WCHR
```

### B14

```asm
SUBB A,#30H
ACALL DELAY
```

### B15

```asm
CJNE A,#0,op1
```

### B16

```asm
ACALL op2
```

### B17

```asm
SJMP AGAINN
```

### B18

```asm
CJNE A,#1,ERROR
```

### B19

```asm
ACALL POS
```

### B20

```asm
SJMP AGAINN
```

## Section 3

```mermaid
flowchart TD
B20["B21: ERROR - lines 55 to 55"]
B21["B22: instructions - lines 56 to 56"]
B22["B23: EXIT - lines 60 to 60"]
B23["B24: instructions - lines 61 to 61"]
B24["B25: HEREE - lines 62 to 62"]
B25["B26: ERRORX - lines 65 to 65"]
B26["B27: instructions - lines 66 to 66"]
B27["B28: AGAINN - lines 69 to 69"]
B28["B29: instructions - lines 70 to 70"]
B29["B30: instructions - lines 71 to 71"]
B20 -->|call| B175
B20 -->|after return| B21
B21 -->|jump| B10
B22 -->|condition true| B25
B22 -->|condition false| B23
B23 -->|call| B170
B23 -->|after return| B24
B24 -->|jump| B24
B25 -->|call| B175
B25 -->|after return| B26
B26 -->|jump| B4
B27 -->|call| B225
B27 -->|after return| B28
B28 -->|call| B132
B28 -->|after return| B29
B29 -->|call| B116
B29 -->|after return| B30
B175["Continue at B176 in section 18"]
B10["Continue at B11 in section 2"]
B170["Continue at B171 in section 18"]
B4["Continue at B5 in section 1"]
B225["Continue at B226 in section 23"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL ERROR1MSG
```

### B22

```asm
SJMP loop
```

### B23

```asm
CJNE A,#'2',ERRORx
```

### B24

```asm
ACALL EXITMSG
```

### B25

```asm
SJMP HEREE
```

### B26

```asm
ACALL ERROR1MSG
```

### B27

```asm
SJMP START
```

### B28

```asm
ACALL MES5
```

### B29

```asm
ACALL KEYPAD
```

### B30

```asm
ACALL WCHR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 72 to 73"]
B31["B32: instructions - lines 74 to 74"]
B32["B33: instructions - lines 75 to 75"]
B33["B34: STO - lines 77 to 77"]
B34["B35: instructions - lines 78 to 78"]
B35["B36: SS - lines 79 to 79"]
B36["B37: OP2 - lines 87 to 87"]
B37["B38: instructions - lines 88 to 88"]
B38["B39: instructions - lines 89 to 89"]
B39["B40: instructions - lines 90 to 91"]
B30 -->|call| B104
B30 -->|after return| B31
B31 -->|condition true| B33
B31 -->|condition false| B32
B32 -->|jump| B10
B33 -->|condition true| B27
B33 -->|condition false| B34
B34 -->|call| B170
B34 -->|after return| B35
B35 -->|jump| B35
B36 -->|call| B195
B36 -->|after return| B37
B37 -->|call| B132
B37 -->|after return| B38
B38 -->|call| B116
B38 -->|after return| B39
B39 -->|call| B104
B39 -->|after return| B40
B104["Continue at B105 in section 11"]
B10["Continue at B11 in section 2"]
B27["Continue at B28 in section 3"]
B170["Continue at B171 in section 18"]
B195["Continue at B196 in section 20"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
SUBB A,#30H
ACALL DELAY
```

### B32

```asm
CJNE A,#1,STO
```

### B33

```asm
SJMP LOOP
```

### B34

```asm
CJNE A,#0,AGAINN
```

### B35

```asm
ACALL EXITMSG
```

### B36

```asm
SJMP SS
```

### B37

```asm
ACALL MES22
```

### B38

```asm
ACALL KEYPAD
```

### B39

```asm
ACALL WCHR
```

### B40

```asm
SUBB A,#30H
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 93 to 93"]
B41["B42: instructions - lines 94 to 94"]
B42["B43: instructions - lines 95 to 96"]
B43["B44: instructions - lines 97 to 97"]
B44["B45: instructions - lines 98 to 98"]
B45["B46: SECONDDOZEE - lines 103 to 103"]
B46["B47: instructions - lines 104 to 104"]
B47["B48: instructions - lines 105 to 105"]
B48["B49: instructions - lines 106 to 106"]
B49["B50: instructions - lines 107 to 109"]
B40 -->|condition true| B45
B40 -->|condition false| B41
B41 -->|call| B207
B41 -->|after return| B42
B42 -->|call| B104
B42 -->|after return| B43
B43 -->|call| B104
B43 -->|after return| B44
B44 -->|jump| B59
B45 -->|condition true| B57
B45 -->|condition false| B46
B46 -->|call| B220
B46 -->|after return| B47
B47 -->|call| B132
B47 -->|after return| B48
B48 -->|call| B116
B48 -->|after return| B49
B49 -->|call| B104
B49 -->|after return| B50
B207["Continue at B208 in section 21"]
B104["Continue at B105 in section 11"]
B59["Continue at B60 in section 6"]
B57["Continue at B58 in section 6"]
B220["Continue at B221 in section 23"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
CJNE A,#0,SecondDozee
```

### B42

```asm
ACALL MES33
```

### B43

```asm
MOV 54H,#0
ACALL DELAY
```

### B44

```asm
ACALL DELAY
```

### B45

```asm
SJMP BACK3
```

### B46

```asm
CJNE A,#1,ERROR3
```

### B47

```asm
ACALL MES44
```

### B48

```asm
ACALL KEYPAD
```

### B49

```asm
ACALL WCHR
```

### B50

```asm
SUBB A,#30H
MOV 53H,A
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 111 to 111"]
B51["B52: instructions - lines 112 to 115"]
B52["B53: instructions - lines 116 to 118"]
B53["B54: instructions - lines 119 to 120"]
B54["B55: instructions - lines 121 to 124"]
B55["B56: instructions - lines 125 to 125"]
B56["B57: instructions - lines 126 to 126"]
B57["B58: ERROR3 - lines 129 to 129"]
B58["B59: instructions - lines 130 to 130"]
B59["B60: BACK3 - lines 133 to 133"]
B50 -->|call| B202
B50 -->|after return| B51
B51 -->|call| B89
B51 -->|after return| B52
B52 -->|call| B116
B52 -->|after return| B53
B53 -->|call| B116
B53 -->|after return| B54
B54 -->|call| B116
B54 -->|after return| B55
B55 -->|call| B104
B55 -->|after return| B56
B56 -->|jump| B59
B57 -->|call| B175
B57 -->|after return| B58
B58 -->|jump| B36
B59 -->|call| B94
B59 -->|after return| B60
B202["Continue at B203 in section 21"]
B89["Continue at B90 in section 9"]
B116["Continue at B117 in section 12"]
B104["Continue at B105 in section 11"]
B175["Continue at B176 in section 18"]
B36["Continue at B37 in section 4"]
B94["Continue at B95 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL MES3
```

### B52

```asm
MOV R7,53H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B53

```asm
MOV 54H,A
ADD A,#30H
ACALL WCHR
```

### B54

```asm
MOV A,#'/'
ACALL WCHR
```

### B55

```asm
MOV 55H,#4
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
SJMP BACK3
```

### B58

```asm
ACALL ERROR1MSG
```

### B59

```asm
SJMP OP2
```

### B60

```asm
ACALL CONFIRM
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 134 to 134"]
B61["B62: POS - lines 138 to 138"]
B62["B63: instructions - lines 139 to 139"]
B63["B64: instructions - lines 140 to 140"]
B64["B65: instructions - lines 141 to 142"]
B65["B66: instructions - lines 146 to 146"]
B66["B67: instructions - lines 147 to 147"]
B67["B68: instructions - lines 148 to 148"]
B68["B69: instructions - lines 149 to 150"]
B69["B70: instructions - lines 153 to 153"]
B61 -->|call| B188
B61 -->|after return| B62
B62 -->|call| B132
B62 -->|after return| B63
B63 -->|call| B116
B63 -->|after return| B64
B64 -->|call| B104
B64 -->|after return| B65
B65 -->|call| B195
B65 -->|after return| B66
B66 -->|call| B132
B66 -->|after return| B67
B67 -->|call| B116
B67 -->|after return| B68
B68 -->|call| B104
B68 -->|after return| B69
B69 -->|condition true| B79
B69 -->|condition false| B70
B188["Continue at B189 in section 19"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B104["Continue at B105 in section 11"]
B195["Continue at B196 in section 20"]
B79["Continue at B80 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
RET
```

### B62

```asm
ACALL MES2
```

### B63

```asm
ACALL KEYPAD
```

### B64

```asm
ACALL WCHR
```

### B65

```asm
SUBB A,#30H
ACALL DELAY
```

### B66

```asm
ACALL MES22
```

### B67

```asm
ACALL KEYPAD
```

### B68

```asm
ACALL WCHR
```

### B69

```asm
SUBB A,#30H
ACALL DELAY
```

### B70

```asm
CJNE A,#0,SecondDoze
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 155 to 155"]
B71["B72: instructions - lines 156 to 156"]
B72["B73: instructions - lines 157 to 159"]
B73["B74: instructions - lines 160 to 162"]
B74["B75: instructions - lines 163 to 164"]
B75["B76: instructions - lines 165 to 168"]
B76["B77: instructions - lines 169 to 169"]
B77["B78: instructions - lines 170 to 170"]
B78["B79: instructions - lines 171 to 171"]
B79["B80: SECONDDOZE - lines 174 to 174"]
B70 -->|call| B202
B70 -->|after return| B71
B71 -->|call| B104
B71 -->|after return| B72
B72 -->|call| B89
B72 -->|after return| B73
B73 -->|call| B116
B73 -->|after return| B74
B74 -->|call| B116
B74 -->|after return| B75
B75 -->|call| B116
B75 -->|after return| B76
B76 -->|call| B104
B76 -->|after return| B77
B77 -->|call| B104
B77 -->|after return| B78
B78 -->|jump| B87
B79 -->|condition true| B87
B79 -->|condition false| B80
B202["Continue at B203 in section 21"]
B104["Continue at B105 in section 11"]
B89["Continue at B90 in section 9"]
B116["Continue at B117 in section 12"]
B87["Continue at B88 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL MES3
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B74

```asm
MOV 54H,A
ADD A,#30H
ACALL WCHR
```

### B75

```asm
MOV A,#'/'
ACALL WCHR
```

### B76

```asm
MOV 55H,#1
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B77

```asm
ACALL DELAY
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
SJMP BACK1
```

### B80

```asm
CJNE A,#1,ERROR1
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 176 to 176"]
B81["B82: instructions - lines 177 to 179"]
B82["B83: instructions - lines 180 to 182"]
B83["B84: instructions - lines 183 to 184"]
B84["B85: instructions - lines 185 to 188"]
B85["B86: instructions - lines 189 to 189"]
B86["B87: instructions - lines 190 to 190"]
B87["B88: ERROR1 - lines 195 to 195"]
B88["B89: instructions - lines 197 to 197"]
B89["B90: CHEACK - lines 201 to 201"]
B80 -->|call| B202
B80 -->|after return| B81
B81 -->|call| B89
B81 -->|after return| B82
B82 -->|call| B116
B82 -->|after return| B83
B83 -->|call| B116
B83 -->|after return| B84
B84 -->|call| B116
B84 -->|after return| B85
B85 -->|call| B104
B85 -->|after return| B86
B86 -->|jump| B87
B87 -->|call| B94
B87 -->|after return| B88
B89 -->|condition true| B91
B89 -->|condition false| B90
B202["Continue at B203 in section 21"]
B116["Continue at B117 in section 12"]
B104["Continue at B105 in section 11"]
B94["Continue at B95 in section 10"]
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL MES3
```

### B82

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B83

```asm
MOV 54H,A
ADD A,#30H
ACALL WCHR
```

### B84

```asm
MOV A,#'/'
ACALL WCHR
```

### B85

```asm
MOV 55H,#2
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B86

```asm
ACALL DELAY
```

### B87

```asm
SJMP BACK1
```

### B88

```asm
ACALL CONFIRM
```

### B89

Return to the instruction following the active call.

```asm
RET
```

### B90

```asm
CJNE A,#12,CONTINUE
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 202 to 202"]
B91["B92: CONTINUE - lines 204 to 204"]
B92["B93: instructions - lines 205 to 205"]
B93["B94: BACK2 - lines 208 to 208"]
B94["B95: CONFIRM - lines 212 to 212"]
B95["B96: instructions - lines 213 to 213"]
B96["B97: instructions - lines 214 to 214"]
B97["B98: instructions - lines 215 to 217"]
B98["B99: instructions - lines 219 to 219"]
B99["B100: FLASH - lines 222 to 222"]
B90 -->|jump| B93
B91 -->|condition true| B93
B91 -->|condition false| B92
B92 -->|next| B93
B94 -->|call| B213
B94 -->|after return| B95
B95 -->|call| B132
B95 -->|after return| B96
B96 -->|call| B116
B96 -->|after return| B97
B97 -->|condition true| B94
B97 -->|condition false| B98
B99 -->|next| B100
B213["Continue at B214 in section 22"]
B132["Continue at B133 in section 14"]
B116["Continue at B117 in section 12"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
SJMP BACK2
```

### B92

```asm
JC BACK2
```

### B93

```asm
SUBB A,#12
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
ACALL MES4
```

### B96

```asm
ACALL KEYPAD
```

### B97

```asm
ACALL WCHR
```

### B98

```asm
SUBB A,#30H
CJNE A,#1,CONFIRM
```

### B99

Return to the instruction following the active call.

```asm
RET
```

### B100

```asm
MOV R6,#3
```

## Section 11

```mermaid
flowchart TD
B100["B101: T3 - lines 223 to 224"]
B101["B102: instructions - lines 225 to 226"]
B102["B103: instructions - lines 227 to 227"]
B103["B104: instructions - lines 228 to 228"]
B104["B105: DELAY - lines 232 to 232"]
B105["B106: X3 - lines 233 to 233"]
B106["B107: X2 - lines 234 to 234"]
B107["B108: X1 - lines 235 to 235"]
B108["B109: instructions - lines 236 to 236"]
B109["B110: instructions - lines 237 to 237"]
B100 -->|call| B104
B100 -->|after return| B101
B101 -->|call| B104
B101 -->|after return| B102
B102 -->|condition true| B100
B102 -->|condition false| B103
B104 -->|next| B105
B105 -->|next| B106
B106 -->|next| B107
B107 -->|condition true| B107
B107 -->|condition false| B108
B108 -->|condition true| B106
B108 -->|condition false| B109
B109 -->|condition true| B105
B109 -->|condition false| B110
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV P1,#0H
ACALL DELAY
```

### B102

```asm
MOV P1,#0fFH
ACALL DELAY
```

### B103

```asm
DJNZ R6,T3
```

### B104

Return to the instruction following the active call.

```asm
RET
```

### B105

```asm
MOV R5,#2
```

### B106

```asm
MOV R4,#20
```

### B107

```asm
MOV R3,#200
```

### B108

```asm
DJNZ R3,X1
```

### B109

```asm
DJNZ R4,X2
```

### B110

```asm
DJNZ R5,X3
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 238 to 238"]
B111["B112: CLEAR - lines 245 to 246"]
B112["B113: instructions - lines 247 to 247"]
B113["B114: WAIT - lines 248 to 248"]
B114["B115: instructions - lines 249 to 249"]
B115["B116: instructions - lines 250 to 250"]
B116["B117: WCHR - lines 253 to 257"]
B117["B118: instructions - lines 258 to 258"]
B118["B119: instructions - lines 259 to 261"]
B119["B120: instructions - lines 262 to 262"]
B111 -->|call| B121
B111 -->|after return| B112
B112 -->|next| B113
B113 -->|call| B149
B113 -->|after return| B114
B114 -->|condition true| B113
B114 -->|condition false| B115
B116 -->|call| B126
B116 -->|after return| B117
B117 -->|call| B149
B117 -->|after return| B118
B118 -->|call| B126
B118 -->|after return| B119
B119 -->|call| B149
B119 -->|after return| B120
B121["Continue at B122 in section 13"]
B149["Continue at B150 in section 15"]
B126["Continue at B127 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
RET
```

### B112

```asm
MOV A,#01H
ACALL CMD
```

### B113

```asm
MOV R5,#14
```

### B114

```asm
ACALL LDELAY
```

### B115

```asm
DJNZ R5,WAIT
```

### B116

Return to the instruction following the active call.

```asm
RET
```

### B117

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B118

```asm
ACALL LDELAY
```

### B119

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B120

```asm
ACALL LDELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 263 to 265"]
B121["B122: CMD - lines 270 to 272"]
B122["B123: instructions - lines 273 to 273"]
B123["B124: instructions - lines 274 to 276"]
B124["B125: instructions - lines 277 to 277"]
B125["B126: instructions - lines 278 to 278"]
B126["B127: COMMON - lines 283 to 288"]
B127["B128: INLCD - lines 292 to 299"]
B128["B129: instructions - lines 300 to 308"]
B129["B130: instructions - lines 309 to 321"]
B121 -->|call| B126
B121 -->|after return| B122
B122 -->|call| B149
B122 -->|after return| B123
B123 -->|call| B126
B123 -->|after return| B124
B124 -->|call| B149
B124 -->|after return| B125
B127 -->|call| B149
B127 -->|after return| B128
B128 -->|call| B149
B128 -->|after return| B129
B129 -->|call| B149
B129 -->|after return| B130
B149["Continue at B150 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B122

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B123

```asm
ACALL LDELAY
```

### B124

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B125

```asm
ACALL LDELAY
```

### B126

Return to the instruction following the active call.

```asm
RET
```

### B127

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B128

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

### B129

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

### B130

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

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 322 to 332"]
B131["B132: instructions - lines 333 to 333"]
B132["B133: KEYPAD - lines 337 to 337"]
B133["B134: K1 - lines 338 to 341"]
B134["B135: K2 - lines 343 to 345"]
B135["B136: instructions - lines 346 to 346"]
B136["B137: OVER1 - lines 348 to 351"]
B137["B138: instructions - lines 352 to 355"]
B138["B139: instructions - lines 356 to 359"]
B139["B140: instructions - lines 360 to 363"]
B130 -->|call| B149
B130 -->|after return| B131
B132 -->|next| B133
B133 -->|condition true| B133
B133 -->|condition false| B134
B134 -->|condition true| B136
B134 -->|condition false| B135
B135 -->|jump| B134
B136 -->|condition true| B141
B136 -->|condition false| B137
B137 -->|condition true| B142
B137 -->|condition false| B138
B138 -->|condition true| B143
B138 -->|condition false| B139
B139 -->|condition true| B144
B139 -->|condition false| B140
B149["Continue at B150 in section 15"]
B141["Continue at B142 in section 15"]
B142["Continue at B143 in section 15"]
B143["Continue at B144 in section 15"]
B144["Continue at B145 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

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

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

```asm
MOV P0,#01110000B
```

### B134

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B135

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B136

```asm
SJMP K2
```

### B137

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B138

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B139

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B140

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 364 to 364"]
B141["B142: ROW_0 - lines 365 to 366"]
B142["B143: ROW_1 - lines 367 to 368"]
B143["B144: ROW_2 - lines 369 to 370"]
B144["B145: ROW_3 - lines 371 to 371"]
B145["B146: FIND - lines 373 to 373"]
B146["B147: FIND1 - lines 375 to 376"]
B147["B148: instructions - lines 377 to 378"]
B148["B149: MATCH - lines 379 to 381"]
B149["B150: LDELAY - lines 385 to 386"]
B140 -->|jump| B134
B141 -->|jump| B145
B142 -->|jump| B145
B143 -->|jump| B145
B144 -->|next| B145
B145 -->|next| B146
B146 -->|condition true| B148
B146 -->|condition false| B147
B147 -->|jump| B146
B149 -->|condition true| B149
B149 -->|condition false| B150
B134["Continue at B135 in section 14"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
LJMP K2
```

### B142

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B143

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B144

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B145

```asm
MOV DPTR,#KCODE3
```

### B146

```asm
RLC A
```

### B147

```asm
RLC A
JNC MATCH
```

### B148

```asm
INC DPTR
SJMP FIND1
```

### B149

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B150

```asm
MOV R0, #50
DJNZ R0, $
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 387 to 387"]
B151["B152: WSTR - lines 390 to 390"]
B152["B153: CONT1 - lines 392 to 394"]
B153["B154: PRINT - lines 396 to 396"]
B154["B155: instructions - lines 397 to 398"]
B155["B156: EXIT1 - lines 399 to 400"]
B156["B157: WELCOMEMSG - lines 404 to 405"]
B157["B158: instructions - lines 406 to 407"]
B158["B159: instructions - lines 408 to 408"]
B159["B160: instructions - lines 409 to 410"]
B151 -->|next| B152
B152 -->|condition true| B155
B152 -->|condition false| B153
B153 -->|call| B116
B153 -->|after return| B154
B154 -->|jump| B152
B156 -->|call| B121
B156 -->|after return| B157
B157 -->|call| B151
B157 -->|after return| B158
B158 -->|call| B104
B158 -->|after return| B159
B159 -->|call| B121
B159 -->|after return| B160
B116["Continue at B117 in section 12"]
B121["Continue at B122 in section 13"]
B104["Continue at B105 in section 11"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
RET
```

### B152

```asm
PUSH ACC
```

### B153

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B154

```asm
ACALL WCHR
```

### B155

```asm
INC DPTR
AJMP CONT1
```

### B156

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B157

```asm
MOV A,#80H
ACALL CMD
```

### B158

```asm
MOV DPTR,#ro1
ACALL WSTR
```

### B159

```asm
ACALL DELAY
```

### B160

```asm
MOV A,#0c0H
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 411 to 412"]
B161["B162: instructions - lines 413 to 413"]
B162["B163: instructions - lines 414 to 414"]
B163["B164: MENUMSG - lines 417 to 417"]
B164["B165: instructions - lines 418 to 419"]
B165["B166: instructions - lines 420 to 421"]
B166["B167: instructions - lines 422 to 423"]
B167["B168: instructions - lines 424 to 425"]
B168["B169: instructions - lines 426 to 426"]
B169["B170: instructions - lines 428 to 428"]
B160 -->|call| B151
B160 -->|after return| B161
B161 -->|call| B104
B161 -->|after return| B162
B163 -->|call| B111
B163 -->|after return| B164
B164 -->|call| B121
B164 -->|after return| B165
B165 -->|call| B151
B165 -->|after return| B166
B166 -->|call| B121
B166 -->|after return| B167
B167 -->|call| B151
B167 -->|after return| B168
B168 -->|call| B104
B168 -->|after return| B169
B151["Continue at B152 in section 16"]
B104["Continue at B105 in section 11"]
B111["Continue at B112 in section 12"]
B121["Continue at B122 in section 13"]
```

### B161

```asm
MOV DPTR,#ro2
ACALL WSTR
```

### B162

```asm
ACALL DELAY
```

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
ACALL CLEAR
```

### B165

```asm
MOV A,#80H
ACALL CMD
```

### B166

```asm
MOV DPTR,#ro3
ACALL WSTR
```

### B167

```asm
MOV A,#0C0H
ACALL CMD
```

### B168

```asm
MOV DPTR,#ro4
ACALL WSTR
```

### B169

```asm
ACALL DELAY
```

### B170

Return to the instruction following the active call.

```asm
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: EXITMSG - lines 431 to 431"]
B171["B172: instructions - lines 432 to 433"]
B172["B173: instructions - lines 434 to 435"]
B173["B174: instructions - lines 436 to 436"]
B174["B175: instructions - lines 437 to 437"]
B175["B176: ERROR1MSG - lines 441 to 441"]
B176["B177: instructions - lines 442 to 443"]
B177["B178: instructions - lines 444 to 445"]
B178["B179: instructions - lines 446 to 446"]
B179["B180: instructions - lines 447 to 447"]
B170 -->|call| B111
B170 -->|after return| B171
B171 -->|call| B121
B171 -->|after return| B172
B172 -->|call| B151
B172 -->|after return| B173
B173 -->|call| B104
B173 -->|after return| B174
B175 -->|call| B111
B175 -->|after return| B176
B176 -->|call| B121
B176 -->|after return| B177
B177 -->|call| B151
B177 -->|after return| B178
B178 -->|call| B104
B178 -->|after return| B179
B111["Continue at B112 in section 12"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B104["Continue at B105 in section 11"]
```

### B171

```asm
ACALL CLEAR
```

### B172

```asm
MOV A,#80H
ACALL CMD
```

### B173

```asm
MOV DPTR,#ro6
acall wstr
```

### B174

```asm
ACALL DELAY
```

### B175

Return to the instruction following the active call.

```asm
RET
```

### B176

```asm
ACALL CLEAR
```

### B177

```asm
MOV A,#80H
ACALL CMD
```

### B178

```asm
MOV DPTR,#ro5
ACALL WSTR
```

### B179

```asm
ACALL DELAY
```

### B180

Return to the instruction following the active call.

```asm
RET
```

## Section 19

```mermaid
flowchart TD
B180["B181: MES1 - lines 450 to 450"]
B181["B182: instructions - lines 451 to 452"]
B182["B183: instructions - lines 453 to 454"]
B183["B184: instructions - lines 455 to 455"]
B184["B185: instructions - lines 456 to 457"]
B185["B186: instructions - lines 458 to 459"]
B186["B187: instructions - lines 460 to 460"]
B187["B188: instructions - lines 461 to 461"]
B188["B189: MES2 - lines 464 to 464"]
B189["B190: instructions - lines 465 to 466"]
B180 -->|call| B111
B180 -->|after return| B181
B181 -->|call| B121
B181 -->|after return| B182
B182 -->|call| B151
B182 -->|after return| B183
B183 -->|call| B104
B183 -->|after return| B184
B184 -->|call| B121
B184 -->|after return| B185
B185 -->|call| B151
B185 -->|after return| B186
B186 -->|call| B104
B186 -->|after return| B187
B188 -->|call| B111
B188 -->|after return| B189
B189 -->|call| B121
B189 -->|after return| B190
B111["Continue at B112 in section 12"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B104["Continue at B105 in section 11"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL CLEAR
```

### B182

```asm
MOV A,#80H
ACALL CMD
```

### B183

```asm
MOV DPTR,#ro7
ACALL WSTR
```

### B184

```asm
ACALL DELAY
```

### B185

```asm
MOV A,#0C0H
ACALL CMD
```

### B186

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B187

```asm
ACALL DELAY
```

### B188

Return to the instruction following the active call.

```asm
RET
```

### B189

```asm
ACALL CLEAR
```

### B190

```asm
MOV A,#80H
ACALL CMD
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 467 to 468"]
B191["B192: instructions - lines 469 to 470"]
B192["B193: instructions - lines 471 to 472"]
B193["B194: instructions - lines 473 to 473"]
B194["B195: instructions - lines 474 to 474"]
B195["B196: MES22 - lines 477 to 477"]
B196["B197: instructions - lines 478 to 479"]
B197["B198: instructions - lines 480 to 481"]
B198["B199: instructions - lines 482 to 483"]
B199["B200: instructions - lines 484 to 485"]
B190 -->|call| B151
B190 -->|after return| B191
B191 -->|call| B121
B191 -->|after return| B192
B192 -->|call| B151
B192 -->|after return| B193
B193 -->|call| B104
B193 -->|after return| B194
B195 -->|call| B111
B195 -->|after return| B196
B196 -->|call| B121
B196 -->|after return| B197
B197 -->|call| B151
B197 -->|after return| B198
B198 -->|call| B121
B198 -->|after return| B199
B199 -->|call| B151
B199 -->|after return| B200
B151["Continue at B152 in section 16"]
B121["Continue at B122 in section 13"]
B104["Continue at B105 in section 11"]
B111["Continue at B112 in section 12"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV DPTR,#ro8
ACALL WSTR
```

### B192

```asm
MOV A,#0C0H
ACALL CMD
```

### B193

```asm
MOV DPTR,#ro9
ACALL WSTR
```

### B194

```asm
ACALL DELAY
```

### B195

Return to the instruction following the active call.

```asm
RET
```

### B196

```asm
ACALL CLEAR
```

### B197

```asm
MOV A,#80H
ACALL CMD
```

### B198

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B199

```asm
MOV A,#0C0H
ACALL CMD
```

### B200

```asm
MOV DPTR,#ro11
ACALL WSTR
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 486 to 486"]
B201["B202: instructions - lines 487 to 487"]
B202["B203: MES3 - lines 492 to 492"]
B203["B204: instructions - lines 493 to 494"]
B204["B205: instructions - lines 495 to 496"]
B205["B206: instructions - lines 497 to 498"]
B206["B207: instructions - lines 500 to 500"]
B207["B208: MES33 - lines 503 to 503"]
B208["B209: instructions - lines 504 to 505"]
B209["B210: instructions - lines 506 to 507"]
B200 -->|call| B104
B200 -->|after return| B201
B202 -->|call| B111
B202 -->|after return| B203
B203 -->|call| B121
B203 -->|after return| B204
B204 -->|call| B151
B204 -->|after return| B205
B205 -->|call| B121
B205 -->|after return| B206
B207 -->|call| B111
B207 -->|after return| B208
B208 -->|call| B121
B208 -->|after return| B209
B209 -->|call| B151
B209 -->|after return| B210
B104["Continue at B105 in section 11"]
B111["Continue at B112 in section 12"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL DELAY
```

### B202

Return to the instruction following the active call.

```asm
RET
```

### B203

```asm
ACALL CLEAR
```

### B204

```asm
MOV A,#80H
ACALL CMD
```

### B205

```asm
MOV DPTR,#ro12
ACALL WSTR
```

### B206

```asm
MOV A,#0C0H
ACALL CMD
```

### B207

Return to the instruction following the active call.

```asm
RET
```

### B208

```asm
ACALL CLEAR
```

### B209

```asm
MOV A,#80H
ACALL CMD
```

### B210

```asm
MOV DPTR,#ro12
ACALL WSTR
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 508 to 509"]
B211["B212: instructions - lines 510 to 511"]
B212["B213: instructions - lines 512 to 512"]
B213["B214: MES4 - lines 515 to 515"]
B214["B215: instructions - lines 516 to 517"]
B215["B216: instructions - lines 518 to 519"]
B216["B217: instructions - lines 520 to 521"]
B217["B218: instructions - lines 522 to 523"]
B218["B219: instructions - lines 524 to 524"]
B219["B220: instructions - lines 525 to 525"]
B210 -->|call| B121
B210 -->|after return| B211
B211 -->|call| B151
B211 -->|after return| B212
B213 -->|call| B111
B213 -->|after return| B214
B214 -->|call| B121
B214 -->|after return| B215
B215 -->|call| B151
B215 -->|after return| B216
B216 -->|call| B121
B216 -->|after return| B217
B217 -->|call| B151
B217 -->|after return| B218
B218 -->|call| B104
B218 -->|after return| B219
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B111["Continue at B112 in section 12"]
B104["Continue at B105 in section 11"]
```

### B211

```asm
MOV A,#0C0H
ACALL CMD
```

### B212

```asm
MOV DPTR,#ro14
ACALL WSTR
```

### B213

Return to the instruction following the active call.

```asm
RET
```

### B214

```asm
ACALL CLEAR
```

### B215

```asm
MOV A,#80H
ACALL CMD
```

### B216

```asm
MOV DPTR,#ro13
ACALL WSTR
```

### B217

```asm
MOV A,#0C0H
ACALL CMD
```

### B218

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B219

```asm
ACALL DELAY
```

### B220

Return to the instruction following the active call.

```asm
RET
```

## Section 23

```mermaid
flowchart TD
B220["B221: MES44 - lines 528 to 528"]
B221["B222: instructions - lines 529 to 530"]
B222["B223: instructions - lines 531 to 532"]
B223["B224: instructions - lines 533 to 534"]
B224["B225: instructions - lines 535 to 535"]
B225["B226: MES5 - lines 538 to 538"]
B226["B227: instructions - lines 539 to 540"]
B227["B228: instructions - lines 541 to 542"]
B228["B229: instructions - lines 543 to 544"]
B229["B230: instructions - lines 545 to 546"]
B220 -->|call| B111
B220 -->|after return| B221
B221 -->|call| B121
B221 -->|after return| B222
B222 -->|call| B151
B222 -->|after return| B223
B223 -->|call| B121
B223 -->|after return| B224
B225 -->|call| B111
B225 -->|after return| B226
B226 -->|call| B121
B226 -->|after return| B227
B227 -->|call| B151
B227 -->|after return| B228
B228 -->|call| B121
B228 -->|after return| B229
B229 -->|call| B151
B229 -->|after return| B230
B111["Continue at B112 in section 12"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
ACALL CLEAR
```

### B222

```asm
MOV A,#80H
ACALL CMD
```

### B223

```asm
MOV DPTR,#ro111
ACALL WSTR
```

### B224

```asm
MOV A,#0C0H
ACALL CMD
```

### B225

Return to the instruction following the active call.

```asm
RET
```

### B226

```asm
ACALL CLEAR
```

### B227

```asm
MOV A,#80H
ACALL CMD
```

### B228

```asm
MOV DPTR,#ro15
ACALL WSTR
```

### B229

```asm
MOV A,#0C0H
ACALL CMD
```

### B230

```asm
MOV DPTR,#ro11
ACALL WSTR
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 547 to 547"]
B231["B232: instructions - lines 548 to 548"]
B230 -->|call| B104
B230 -->|after return| B231
B104["Continue at B105 in section 11"]
```

### B231

```asm
ACALL DELAY
```

### B232

Return to the instruction following the active call.

```asm
RET
```
