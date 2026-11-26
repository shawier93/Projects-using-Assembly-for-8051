# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27) · [Section 28](#section-28) · [Section 29](#section-29)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 8 to 20"]
B1["B2: U - lines 21 to 21"]
B2["B3: instructions - lines 22 to 22"]
B3["B4: instructions - lines 23 to 23"]
B4["B5: instructions - lines 24 to 24"]
B5["B6: instructions - lines 25 to 25"]
B6["B7: START - lines 27 to 27"]
B7["B8: instructions - lines 28 to 28"]
B8["B9: instructions - lines 29 to 29"]
B9["B10: instructions - lines 30 to 30"]
B0 -->|call| B148
B0 -->|after return| B1
B1 -->|call| B177
B1 -->|after return| B2
B2 -->|call| B120
B2 -->|after return| B3
B3 -->|call| B148
B3 -->|after return| B4
B4 -->|call| B260
B4 -->|after return| B5
B5 -->|call| B182
B5 -->|after return| B6
B6 -->|call| B187
B6 -->|after return| B7
B7 -->|call| B153
B7 -->|after return| B8
B8 -->|call| B137
B8 -->|after return| B9
B9 -->|call| B125
B9 -->|after return| B10
B148["Continue at B149 in section 15"]
B177["Continue at B178 in section 18"]
B120["Continue at B121 in section 13"]
B260["Continue at B261 in section 27"]
B182["Continue at B183 in section 19"]
B187["Continue at B188 in section 19"]
B153["Continue at B154 in section 16"]
B137["Continue at B138 in section 14"]
B125["Continue at B126 in section 13"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 51H,#4
MOV 52H,#1
MOV 53H,#3
MOV 54H,#1
MOV 55H,#100
MOV 56H,#1
MOV 57H,#1
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
acall press
```

### B6

```asm
acall name
```

### B7

```asm
ACALL MENUMSG
```

### B8

```asm
aCALL KEYPAD
```

### B9

```asm
ACALL WCHR
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 31 to 31"]
B11["B12: instructions - lines 34 to 34"]
B12["B13: LOOP - lines 37 to 37"]
B13["B14: instructions - lines 38 to 38"]
B14["B15: instructions - lines 39 to 39"]
B15["B16: instructions - lines 40 to 41"]
B16["B17: instructions - lines 43 to 43"]
B17["B18: instructions - lines 44 to 44"]
B18["B19: instructions - lines 45 to 45"]
B19["B20: OP1 - lines 49 to 49"]
B10 -->|call| B125
B10 -->|after return| B11
B11 -->|condition true| B24
B11 -->|condition false| B12
B12 -->|call| B205
B12 -->|after return| B13
B13 -->|call| B153
B13 -->|after return| B14
B14 -->|call| B137
B14 -->|after return| B15
B15 -->|call| B125
B15 -->|after return| B16
B16 -->|condition true| B19
B16 -->|condition false| B17
B17 -->|call| B38
B17 -->|after return| B18
B18 -->|jump| B29
B19 -->|condition true| B22
B19 -->|condition false| B20
B125["Continue at B126 in section 13"]
B24["Continue at B25 in section 3"]
B205["Continue at B206 in section 21"]
B153["Continue at B154 in section 16"]
B137["Continue at B138 in section 14"]
B38["Continue at B39 in section 4"]
B29["Continue at B30 in section 3"]
B22["Continue at B23 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
CJNE A,#'1', EXIT
```

### B13

```asm
ACALL MES1
```

### B14

```asm
ACALL KEYPAD
```

### B15

```asm
ACALL WCHR
```

### B16

```asm
SUBB A,#30H
ACALL DELAY
```

### B17

```asm
CJNE A,#0,op1
```

### B18

```asm
ACALL op2
```

### B19

```asm
SJMP AGAINN
```

### B20

```asm
CJNE A,#1,ERROR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 50 to 50"]
B21["B22: instructions - lines 51 to 51"]
B22["B23: ERROR - lines 54 to 54"]
B23["B24: instructions - lines 55 to 55"]
B24["B25: EXIT - lines 59 to 59"]
B25["B26: instructions - lines 60 to 60"]
B26["B27: HEREE - lines 61 to 61"]
B27["B28: ERRORX - lines 64 to 64"]
B28["B29: instructions - lines 65 to 65"]
B29["B30: AGAINN - lines 68 to 68"]
B20 -->|call| B72
B20 -->|after return| B21
B21 -->|jump| B29
B22 -->|call| B200
B22 -->|after return| B23
B23 -->|jump| B12
B24 -->|condition true| B27
B24 -->|condition false| B25
B25 -->|call| B194
B25 -->|after return| B26
B26 -->|jump| B26
B27 -->|call| B200
B27 -->|after return| B28
B28 -->|jump| B6
B29 -->|call| B250
B29 -->|after return| B30
B72["Continue at B73 in section 8"]
B200["Continue at B201 in section 21"]
B12["Continue at B13 in section 2"]
B194["Continue at B195 in section 20"]
B6["Continue at B7 in section 1"]
B250["Continue at B251 in section 26"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL POS
```

### B22

```asm
SJMP AGAINN
```

### B23

```asm
ACALL ERROR1MSG
```

### B24

```asm
SJMP loop
```

### B25

```asm
CJNE A,#'2',ERRORx
```

### B26

```asm
ACALL EXITMSG
```

### B27

```asm
SJMP HEREE
```

### B28

```asm
ACALL ERROR1MSG
```

### B29

```asm
SJMP START
```

### B30

```asm
ACALL MES5
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 69 to 69"]
B31["B32: instructions - lines 70 to 70"]
B32["B33: instructions - lines 71 to 72"]
B33["B34: instructions - lines 73 to 73"]
B34["B35: instructions - lines 74 to 74"]
B35["B36: STO - lines 76 to 76"]
B36["B37: instructions - lines 77 to 77"]
B37["B38: SS - lines 78 to 78"]
B38["B39: OP2 - lines 86 to 86"]
B39["B40: instructions - lines 87 to 87"]
B30 -->|call| B153
B30 -->|after return| B31
B31 -->|call| B137
B31 -->|after return| B32
B32 -->|call| B125
B32 -->|after return| B33
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|jump| B12
B35 -->|condition true| B29
B35 -->|condition false| B36
B36 -->|call| B194
B36 -->|after return| B37
B37 -->|jump| B37
B38 -->|call| B220
B38 -->|after return| B39
B39 -->|call| B153
B39 -->|after return| B40
B153["Continue at B154 in section 16"]
B137["Continue at B138 in section 14"]
B125["Continue at B126 in section 13"]
B12["Continue at B13 in section 2"]
B29["Continue at B30 in section 3"]
B194["Continue at B195 in section 20"]
B220["Continue at B221 in section 23"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL KEYPAD
```

### B32

```asm
ACALL WCHR
```

### B33

```asm
SUBB A,#30H
ACALL DELAY
```

### B34

```asm
CJNE A,#1,STO
```

### B35

```asm
SJMP LOOP
```

### B36

```asm
CJNE A,#0,AGAINN
```

### B37

```asm
ACALL EXITMSG
```

### B38

```asm
SJMP SS
```

### B39

```asm
ACALL MES22
```

### B40

```asm
ACALL KEYPAD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 88 to 88"]
B41["B42: instructions - lines 89 to 91"]
B42["B43: instructions - lines 92 to 92"]
B43["B44: instructions - lines 93 to 93"]
B44["B45: NEXT - lines 96 to 96"]
B45["B46: instructions - lines 97 to 97"]
B46["B47: instructions - lines 98 to 98"]
B47["B48: WRONG - lines 101 to 101"]
B48["B49: instructions - lines 102 to 102"]
B49["B50: Z - lines 104 to 104"]
B40 -->|call| B137
B40 -->|after return| B41
B41 -->|condition true| B44
B41 -->|condition false| B42
B42 -->|call| B125
B42 -->|after return| B43
B43 -->|jump| B49
B44 -->|condition true| B47
B44 -->|condition false| B45
B45 -->|call| B125
B45 -->|after return| B46
B46 -->|jump| B49
B47 -->|call| B200
B47 -->|after return| B48
B48 -->|jump| B38
B49 -->|condition true| B54
B49 -->|condition false| B50
B137["Continue at B138 in section 14"]
B125["Continue at B126 in section 13"]
B200["Continue at B201 in section 21"]
B38["Continue at B39 in section 4"]
B54["Continue at B55 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL WCHR
```

### B42

```asm
SUBB A,#30H
cjne a,#0h,next
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
sjmp z
```

### B45

```asm
cjne a,#01,wrong
```

### B46

```asm
acall delay
```

### B47

```asm
sjmp z
```

### B48

```asm
acall ERROR1MSG
```

### B49

```asm
sjmp op2
```

### B50

```asm
CJNE A,#0,SecondDozee
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 105 to 105"]
B51["B52: instructions - lines 106 to 107"]
B52["B53: instructions - lines 108 to 108"]
B53["B54: instructions - lines 109 to 109"]
B54["B55: SECONDDOZEE - lines 113 to 113"]
B55["B56: instructions - lines 114 to 114"]
B56["B57: instructions - lines 115 to 115"]
B57["B58: instructions - lines 116 to 116"]
B58["B59: instructions - lines 118 to 123"]
B59["B60: instructions - lines 124 to 125"]
B50 -->|call| B232
B50 -->|after return| B51
B51 -->|call| B125
B51 -->|after return| B52
B52 -->|call| B125
B52 -->|after return| B53
B53 -->|jump| B70
B54 -->|condition true| B68
B54 -->|condition false| B55
B55 -->|call| B245
B55 -->|after return| B56
B56 -->|call| B153
B56 -->|after return| B57
B57 -->|call| B137
B57 -->|after return| B58
B58 -->|call| B153
B58 -->|after return| B59
B59 -->|call| B125
B59 -->|after return| B60
B232["Continue at B233 in section 24"]
B125["Continue at B126 in section 13"]
B70["Continue at B71 in section 8"]
B68["Continue at B69 in section 7"]
B245["Continue at B246 in section 25"]
B153["Continue at B154 in section 16"]
B137["Continue at B138 in section 14"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL MES33
```

### B52

```asm
MOV 54H,#0
ACALL DELAY
```

### B53

```asm
ACALL DELAY
```

### B54

```asm
SJMP BACK3
```

### B55

```asm
CJNE A,#1,ERROR3
```

### B56

```asm
ACALL MES44
```

### B57

```asm
ACALL KEYPAD
```

### B58

```asm
ACALL WCHR
```

### B59

```asm
subb a,#30h
mov b,10
mul ab
mov 30h,a
acall keypad
```

### B60

```asm
add a,30h
acall delay
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 127 to 129"]
B61["B62: instructions - lines 131 to 131"]
B62["B63: instructions - lines 132 to 135"]
B63["B64: instructions - lines 136 to 137"]
B64["B65: instructions - lines 138 to 139"]
B65["B66: instructions - lines 140 to 143"]
B66["B67: instructions - lines 144 to 144"]
B67["B68: instructions - lines 145 to 145"]
B68["B69: ERROR3 - lines 148 to 148"]
B69["B70: instructions - lines 149 to 149"]
B60 -->|call| B125
B60 -->|after return| B61
B61 -->|call| B227
B61 -->|after return| B62
B62 -->|call| B110
B62 -->|after return| B63
B63 -->|call| B257
B63 -->|after return| B64
B64 -->|call| B137
B64 -->|after return| B65
B65 -->|call| B137
B65 -->|after return| B66
B66 -->|call| B125
B66 -->|after return| B67
B67 -->|jump| B70
B68 -->|call| B200
B68 -->|after return| B69
B69 -->|jump| B38
B125["Continue at B126 in section 13"]
B227["Continue at B228 in section 23"]
B110["Continue at B111 in section 12"]
B257["Continue at B258 in section 26"]
B137["Continue at B138 in section 14"]
B70["Continue at B71 in section 8"]
B200["Continue at B201 in section 21"]
B38["Continue at B39 in section 4"]
```

### B61

```asm
SUBB A,#30H
MOV 53H,A
ACALL DELAY
```

### B62

```asm
ACALL MES3
```

### B63

```asm
MOV R7,53H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B64

```asm
MOV 54H,A
acall convert
```

### B65

```asm
MOV A,#'/'
ACALL WCHR
```

### B66

```asm
MOV 55H,#4
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B67

```asm
ACALL DELAY
```

### B68

```asm
SJMP BACK3
```

### B69

```asm
ACALL ERROR1MSG
```

### B70

```asm
SJMP OP2
```

## Section 8

```mermaid
flowchart TD
B70["B71: BACK3 - lines 152 to 152"]
B71["B72: instructions - lines 153 to 153"]
B72["B73: POS - lines 157 to 157"]
B73["B74: instructions - lines 158 to 158"]
B74["B75: instructions - lines 159 to 159"]
B75["B76: instructions - lines 160 to 160"]
B76["B77: instructions - lines 162 to 162"]
B77["B78: instructions - lines 163 to 163"]
B78["B79: N - lines 167 to 167"]
B79["B80: instructions - lines 168 to 168"]
B70 -->|call| B115
B70 -->|after return| B71
B72 -->|call| B213
B72 -->|after return| B73
B73 -->|call| B153
B73 -->|after return| B74
B74 -->|call| B137
B74 -->|after return| B75
B75 -->|call| B125
B75 -->|after return| B76
B76 -->|call| B269
B76 -->|after return| B77
B77 -->|next| B78
B78 -->|call| B220
B78 -->|after return| B79
B79 -->|call| B153
B79 -->|after return| B80
B115["Continue at B116 in section 12"]
B213["Continue at B214 in section 22"]
B153["Continue at B154 in section 16"]
B137["Continue at B138 in section 14"]
B125["Continue at B126 in section 13"]
B269["Continue at B270 in section 27"]
B220["Continue at B221 in section 23"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL CONFIRM
```

### B72

Return to the instruction following the active call.

```asm
RET
```

### B73

```asm
ACALL MES2
```

### B74

```asm
ACALL KEYPAD
```

### B75

```asm
ACALL WCHR
```

### B76

```asm
acall delay
```

### B77

```asm
acall wrongm
```

### B78

```asm
MOV R7,A
```

### B79

```asm
ACALL MES22
```

### B80

```asm
ACALL KEYPAD
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 169 to 169"]
B81["B82: instructions - lines 170 to 172"]
B82["B83: instructions - lines 173 to 173"]
B83["B84: instructions - lines 174 to 174"]
B84["B85: NEXT5 - lines 177 to 177"]
B85["B86: instructions - lines 178 to 178"]
B86["B87: instructions - lines 179 to 179"]
B87["B88: WRONG5 - lines 182 to 182"]
B88["B89: instructions - lines 183 to 183"]
B89["B90: M - lines 185 to 185"]
B80 -->|call| B137
B80 -->|after return| B81
B81 -->|condition true| B84
B81 -->|condition false| B82
B82 -->|call| B125
B82 -->|after return| B83
B83 -->|jump| B89
B84 -->|condition true| B87
B84 -->|condition false| B85
B85 -->|call| B125
B85 -->|after return| B86
B86 -->|jump| B89
B87 -->|call| B200
B87 -->|after return| B88
B88 -->|jump| B78
B89 -->|call| B125
B89 -->|after return| B90
B137["Continue at B138 in section 14"]
B125["Continue at B126 in section 13"]
B200["Continue at B201 in section 21"]
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL WCHR
```

### B82

```asm
SUBB A,#30H
cjne a,#0h,next5
```

### B83

```asm
ACALL DELAY
```

### B84

```asm
sjmp m
```

### B85

```asm
cjne a,#01,wrong5
```

### B86

```asm
acall delay
```

### B87

```asm
sjmp m
```

### B88

```asm
acall ERROR1MSG
```

### B89

```asm
sjmp n
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 187 to 187"]
B91["B92: instructions - lines 189 to 189"]
B92["B93: instructions - lines 190 to 190"]
B93["B94: instructions - lines 191 to 193"]
B94["B95: instructions - lines 194 to 195"]
B95["B96: instructions - lines 196 to 197"]
B96["B97: instructions - lines 198 to 201"]
B97["B98: instructions - lines 202 to 202"]
B98["B99: instructions - lines 203 to 203"]
B99["B100: instructions - lines 204 to 204"]
B90 -->|condition true| B100
B90 -->|condition false| B91
B91 -->|call| B227
B91 -->|after return| B92
B92 -->|call| B125
B92 -->|after return| B93
B93 -->|call| B110
B93 -->|after return| B94
B94 -->|call| B257
B94 -->|after return| B95
B95 -->|call| B137
B95 -->|after return| B96
B96 -->|call| B137
B96 -->|after return| B97
B97 -->|call| B125
B97 -->|after return| B98
B98 -->|call| B125
B98 -->|after return| B99
B99 -->|jump| B108
B100["Continue at B101 in section 11"]
B227["Continue at B228 in section 23"]
B125["Continue at B126 in section 13"]
B110["Continue at B111 in section 12"]
B257["Continue at B258 in section 26"]
B137["Continue at B138 in section 14"]
B108["Continue at B109 in section 11"]
```

### B91

```asm
CJNE A,#0,SecondDoze
```

### B92

```asm
ACALL MES3
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B95

```asm
MOV 54H,A
acall convert
```

### B96

```asm
MOV A,#'/'
ACALL WCHR
```

### B97

```asm
MOV 55H,#1
MOV A,55H
ADD A,#30H
ACALL WCHR
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

```asm
SJMP BACK1
```

## Section 11

```mermaid
flowchart TD
B100["B101: SECONDDOZE - lines 207 to 207"]
B101["B102: instructions - lines 209 to 209"]
B102["B103: instructions - lines 210 to 212"]
B103["B104: instructions - lines 213 to 214"]
B104["B105: instructions - lines 215 to 216"]
B105["B106: instructions - lines 217 to 220"]
B106["B107: instructions - lines 221 to 221"]
B107["B108: instructions - lines 222 to 222"]
B108["B109: ERROR1 - lines 227 to 227"]
B109["B110: instructions - lines 229 to 229"]
B100 -->|condition true| B108
B100 -->|condition false| B101
B101 -->|call| B227
B101 -->|after return| B102
B102 -->|call| B110
B102 -->|after return| B103
B103 -->|call| B257
B103 -->|after return| B104
B104 -->|call| B137
B104 -->|after return| B105
B105 -->|call| B137
B105 -->|after return| B106
B106 -->|call| B125
B106 -->|after return| B107
B107 -->|jump| B108
B108 -->|call| B115
B108 -->|after return| B109
B227["Continue at B228 in section 23"]
B110["Continue at B111 in section 12"]
B257["Continue at B258 in section 26"]
B137["Continue at B138 in section 14"]
B125["Continue at B126 in section 13"]
B115["Continue at B116 in section 12"]
```

### B101

```asm
CJNE A,#1,ERROR1
```

### B102

```asm
ACALL MES3
```

### B103

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B104

```asm
MOV 54H,A
acall convert
```

### B105

```asm
MOV A,#'/'
ACALL WCHR
```

### B106

```asm
MOV 55H,#2
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B107

```asm
ACALL DELAY
```

### B108

```asm
SJMP BACK1
```

### B109

```asm
ACALL CONFIRM
```

### B110

Return to the instruction following the active call.

```asm
RET
```

## Section 12

```mermaid
flowchart TD
B110["B111: CHEACK - lines 233 to 233"]
B111["B112: instructions - lines 234 to 234"]
B112["B113: CONTINUE - lines 237 to 237"]
B113["B114: instructions - lines 238 to 240"]
B114["B115: BACK2 - lines 242 to 242"]
B115["B116: CONFIRM - lines 246 to 246"]
B116["B117: instructions - lines 247 to 247"]
B117["B118: instructions - lines 248 to 248"]
B118["B119: instructions - lines 249 to 251"]
B119["B120: instructions - lines 253 to 253"]
B110 -->|condition true| B112
B110 -->|condition false| B111
B111 -->|jump| B114
B112 -->|condition true| B114
B112 -->|condition false| B113
B113 -->|jump| B114
B115 -->|call| B238
B115 -->|after return| B116
B116 -->|call| B153
B116 -->|after return| B117
B117 -->|call| B137
B117 -->|after return| B118
B118 -->|condition true| B115
B118 -->|condition false| B119
B238["Continue at B239 in section 24"]
B153["Continue at B154 in section 16"]
B137["Continue at B138 in section 14"]
```

### B111

```asm
CJNE A,#12,CONTINUE
```

### B112

```asm
SJMP BACK2
```

### B113

```asm
JC BACK2
```

### B114

```asm
SUBB A,#12
sjmp back2
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
ACALL MES4
```

### B117

```asm
ACALL KEYPAD
```

### B118

```asm
ACALL WCHR
```

### B119

```asm
SUBB A,#30H
CJNE A,#1,CONFIRM
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: FLASH - lines 256 to 256"]
B121["B122: T3 - lines 257 to 258"]
B122["B123: instructions - lines 259 to 260"]
B123["B124: instructions - lines 261 to 261"]
B124["B125: instructions - lines 262 to 262"]
B125["B126: DELAY - lines 266 to 266"]
B126["B127: X3 - lines 267 to 267"]
B127["B128: X2 - lines 268 to 268"]
B128["B129: X1 - lines 269 to 269"]
B129["B130: instructions - lines 270 to 270"]
B120 -->|next| B121
B121 -->|call| B125
B121 -->|after return| B122
B122 -->|call| B125
B122 -->|after return| B123
B123 -->|condition true| B121
B123 -->|condition false| B124
B125 -->|next| B126
B126 -->|next| B127
B127 -->|next| B128
B128 -->|condition true| B128
B128 -->|condition false| B129
B129 -->|condition true| B127
B129 -->|condition false| B130
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV R6,#3
```

### B122

```asm
MOV P1,#0H
ACALL DELAY
```

### B123

```asm
MOV P1,#0fFH
ACALL DELAY
```

### B124

```asm
DJNZ R6,T3
```

### B125

Return to the instruction following the active call.

```asm
RET
```

### B126

```asm
MOV R5,#2
```

### B127

```asm
MOV R4,#20
```

### B128

```asm
MOV R3,#200
```

### B129

```asm
DJNZ R3,X1
```

### B130

```asm
DJNZ R4,X2
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 271 to 271"]
B131["B132: instructions - lines 272 to 272"]
B132["B133: CLEAR - lines 279 to 280"]
B133["B134: instructions - lines 281 to 281"]
B134["B135: WAIT - lines 282 to 282"]
B135["B136: instructions - lines 283 to 283"]
B136["B137: instructions - lines 284 to 284"]
B137["B138: WCHR - lines 287 to 291"]
B138["B139: instructions - lines 292 to 292"]
B139["B140: instructions - lines 293 to 295"]
B130 -->|condition true| B126
B130 -->|condition false| B131
B132 -->|call| B142
B132 -->|after return| B133
B133 -->|next| B134
B134 -->|call| B170
B134 -->|after return| B135
B135 -->|condition true| B134
B135 -->|condition false| B136
B137 -->|call| B147
B137 -->|after return| B138
B138 -->|call| B170
B138 -->|after return| B139
B139 -->|call| B147
B139 -->|after return| B140
B126["Continue at B127 in section 13"]
B142["Continue at B143 in section 15"]
B170["Continue at B171 in section 18"]
B147["Continue at B148 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
DJNZ R5,X3
```

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

```asm
MOV A,#01H
ACALL CMD
```

### B134

```asm
MOV R5,#14
```

### B135

```asm
ACALL LDELAY
```

### B136

```asm
DJNZ R5,WAIT
```

### B137

Return to the instruction following the active call.

```asm
RET
```

### B138

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B139

```asm
ACALL LDELAY
```

### B140

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 296 to 296"]
B141["B142: instructions - lines 297 to 299"]
B142["B143: CMD - lines 304 to 306"]
B143["B144: instructions - lines 307 to 307"]
B144["B145: instructions - lines 308 to 310"]
B145["B146: instructions - lines 311 to 311"]
B146["B147: instructions - lines 312 to 312"]
B147["B148: COMMON - lines 317 to 322"]
B148["B149: INLCD - lines 326 to 333"]
B149["B150: instructions - lines 334 to 342"]
B140 -->|call| B170
B140 -->|after return| B141
B142 -->|call| B147
B142 -->|after return| B143
B143 -->|call| B170
B143 -->|after return| B144
B144 -->|call| B147
B144 -->|after return| B145
B145 -->|call| B170
B145 -->|after return| B146
B148 -->|call| B170
B148 -->|after return| B149
B149 -->|call| B170
B149 -->|after return| B150
B170["Continue at B171 in section 18"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL LDELAY
```

### B142

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B143

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B144

```asm
ACALL LDELAY
```

### B145

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B146

```asm
ACALL LDELAY
```

### B147

Return to the instruction following the active call.

```asm
RET
```

### B148

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B149

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

### B150

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

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 343 to 355"]
B151["B152: instructions - lines 356 to 366"]
B152["B153: instructions - lines 367 to 367"]
B153["B154: KEYPAD - lines 371 to 371"]
B154["B155: K1 - lines 372 to 375"]
B155["B156: K2 - lines 377 to 379"]
B156["B157: instructions - lines 380 to 380"]
B157["B158: OVER1 - lines 382 to 385"]
B158["B159: instructions - lines 386 to 389"]
B159["B160: instructions - lines 390 to 393"]
B150 -->|call| B170
B150 -->|after return| B151
B151 -->|call| B170
B151 -->|after return| B152
B153 -->|next| B154
B154 -->|condition true| B154
B154 -->|condition false| B155
B155 -->|condition true| B157
B155 -->|condition false| B156
B156 -->|jump| B155
B157 -->|condition true| B162
B157 -->|condition false| B158
B158 -->|condition true| B163
B158 -->|condition false| B159
B159 -->|condition true| B164
B159 -->|condition false| B160
B170["Continue at B171 in section 18"]
B162["Continue at B163 in section 17"]
B163["Continue at B164 in section 17"]
B164["Continue at B165 in section 17"]
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
SETB P1.7
SETB P1.6
SETB P1.5
SETB P1.4
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
SETB P1.6
SETB P1.5
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B153

Return to the instruction following the active call.

```asm
RET
```

### B154

```asm
MOV P0,#01110000B
```

### B155

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B156

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B157

```asm
SJMP K2
```

### B158

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B159

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B160

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 394 to 397"]
B161["B162: instructions - lines 398 to 398"]
B162["B163: ROW_0 - lines 399 to 400"]
B163["B164: ROW_1 - lines 401 to 402"]
B164["B165: ROW_2 - lines 403 to 404"]
B165["B166: ROW_3 - lines 405 to 405"]
B166["B167: FIND - lines 407 to 407"]
B167["B168: FIND1 - lines 409 to 410"]
B168["B169: instructions - lines 411 to 412"]
B169["B170: MATCH - lines 413 to 415"]
B160 -->|condition true| B165
B160 -->|condition false| B161
B161 -->|jump| B155
B162 -->|jump| B166
B163 -->|jump| B166
B164 -->|jump| B166
B165 -->|next| B166
B166 -->|next| B167
B167 -->|condition true| B169
B167 -->|condition false| B168
B168 -->|jump| B167
B155["Continue at B156 in section 16"]
```

### B161

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B162

```asm
LJMP K2
```

### B163

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B164

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B165

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B166

```asm
MOV DPTR,#KCODE3
```

### B167

```asm
RLC A
```

### B168

```asm
RLC A
JNC MATCH
```

### B169

```asm
INC DPTR
SJMP FIND1
```

### B170

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: LDELAY - lines 419 to 420"]
B171["B172: instructions - lines 421 to 421"]
B172["B173: WSTR - lines 424 to 424"]
B173["B174: CONT1 - lines 426 to 428"]
B174["B175: PRINT - lines 430 to 430"]
B175["B176: instructions - lines 431 to 432"]
B176["B177: EXIT1 - lines 433 to 434"]
B177["B178: WELCOMEMSG - lines 438 to 439"]
B178["B179: instructions - lines 440 to 441"]
B179["B180: instructions - lines 442 to 442"]
B170 -->|condition true| B170
B170 -->|condition false| B171
B172 -->|next| B173
B173 -->|condition true| B176
B173 -->|condition false| B174
B174 -->|call| B137
B174 -->|after return| B175
B175 -->|jump| B173
B177 -->|call| B142
B177 -->|after return| B178
B178 -->|call| B172
B178 -->|after return| B179
B179 -->|call| B125
B179 -->|after return| B180
B137["Continue at B138 in section 14"]
B142["Continue at B143 in section 15"]
B125["Continue at B126 in section 13"]
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
PUSH ACC
```

### B174

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B175

```asm
ACALL WCHR
```

### B176

```asm
INC DPTR
AJMP CONT1
```

### B177

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B178

```asm
MOV A,#80H
ACALL CMD
```

### B179

```asm
MOV DPTR,#ro1
ACALL WSTR
```

### B180

```asm
ACALL DELAY
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 443 to 443"]
B181["B182: instructions - lines 444 to 444"]
B182["B183: NAME - lines 447 to 448"]
B183["B184: instructions - lines 449 to 450"]
B184["B185: instructions - lines 451 to 451"]
B185["B186: instructions - lines 452 to 452"]
B186["B187: instructions - lines 453 to 453"]
B187["B188: MENUMSG - lines 457 to 457"]
B188["B189: instructions - lines 458 to 459"]
B189["B190: instructions - lines 460 to 461"]
B180 -->|call| B132
B180 -->|after return| B181
B182 -->|call| B142
B182 -->|after return| B183
B183 -->|call| B172
B183 -->|after return| B184
B184 -->|call| B125
B184 -->|after return| B185
B185 -->|call| B132
B185 -->|after return| B186
B187 -->|call| B132
B187 -->|after return| B188
B188 -->|call| B142
B188 -->|after return| B189
B189 -->|call| B172
B189 -->|after return| B190
B132["Continue at B133 in section 14"]
B142["Continue at B143 in section 15"]
B172["Continue at B173 in section 18"]
B125["Continue at B126 in section 13"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
acall clear
```

### B182

Return to the instruction following the active call.

```asm
ret
```

### B183

```asm
MOV A,#80H
ACALL CMD
```

### B184

```asm
MOV DPTR,#ro2
ACALL WSTR
```

### B185

```asm
ACALL DELAY
```

### B186

```asm
acall clear
```

### B187

Return to the instruction following the active call.

```asm
RET
```

### B188

```asm
ACALL CLEAR
```

### B189

```asm
MOV A,#80H
ACALL CMD
```

### B190

```asm
MOV DPTR,#ro3
ACALL WSTR
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 462 to 463"]
B191["B192: instructions - lines 464 to 465"]
B192["B193: instructions - lines 466 to 466"]
B193["B194: instructions - lines 468 to 468"]
B194["B195: EXITMSG - lines 471 to 471"]
B195["B196: instructions - lines 472 to 473"]
B196["B197: instructions - lines 474 to 475"]
B197["B198: instructions - lines 476 to 476"]
B198["B199: instructions - lines 477 to 477"]
B199["B200: instructions - lines 478 to 478"]
B190 -->|call| B142
B190 -->|after return| B191
B191 -->|call| B172
B191 -->|after return| B192
B192 -->|call| B125
B192 -->|after return| B193
B194 -->|call| B132
B194 -->|after return| B195
B195 -->|call| B142
B195 -->|after return| B196
B196 -->|call| B172
B196 -->|after return| B197
B197 -->|call| B125
B197 -->|after return| B198
B198 -->|jump| B1
B142["Continue at B143 in section 15"]
B172["Continue at B173 in section 18"]
B125["Continue at B126 in section 13"]
B132["Continue at B133 in section 14"]
B1["Continue at B2 in section 1"]
```

### B191

```asm
MOV A,#0C0H
ACALL CMD
```

### B192

```asm
MOV DPTR,#ro4
ACALL WSTR
```

### B193

```asm
ACALL DELAY
```

### B194

Return to the instruction following the active call.

```asm
RET
```

### B195

```asm
ACALL CLEAR
```

### B196

```asm
MOV A,#80H
ACALL CMD
```

### B197

```asm
MOV DPTR,#ro6
acall wstr
```

### B198

```asm
ACALL DELAY
```

### B199

```asm
ljmp u
```

### B200

Return to the instruction following the active call.

```asm
RET
```

## Section 21

```mermaid
flowchart TD
B200["B201: ERROR1MSG - lines 482 to 482"]
B201["B202: instructions - lines 483 to 484"]
B202["B203: instructions - lines 485 to 486"]
B203["B204: instructions - lines 487 to 487"]
B204["B205: instructions - lines 488 to 488"]
B205["B206: MES1 - lines 491 to 491"]
B206["B207: instructions - lines 492 to 493"]
B207["B208: instructions - lines 494 to 495"]
B208["B209: instructions - lines 496 to 496"]
B209["B210: instructions - lines 497 to 498"]
B200 -->|call| B132
B200 -->|after return| B201
B201 -->|call| B142
B201 -->|after return| B202
B202 -->|call| B172
B202 -->|after return| B203
B203 -->|call| B125
B203 -->|after return| B204
B205 -->|call| B132
B205 -->|after return| B206
B206 -->|call| B142
B206 -->|after return| B207
B207 -->|call| B172
B207 -->|after return| B208
B208 -->|call| B125
B208 -->|after return| B209
B209 -->|call| B142
B209 -->|after return| B210
B132["Continue at B133 in section 14"]
B142["Continue at B143 in section 15"]
B172["Continue at B173 in section 18"]
B125["Continue at B126 in section 13"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL CLEAR
```

### B202

```asm
MOV A,#80H
ACALL CMD
```

### B203

```asm
MOV DPTR,#ro5
ACALL WSTR
```

### B204

```asm
ACALL DELAY
```

### B205

Return to the instruction following the active call.

```asm
RET
```

### B206

```asm
ACALL CLEAR
```

### B207

```asm
MOV A,#80H
ACALL CMD
```

### B208

```asm
MOV DPTR,#ro7
ACALL WSTR
```

### B209

```asm
ACALL DELAY
```

### B210

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 499 to 500"]
B211["B212: instructions - lines 501 to 501"]
B212["B213: instructions - lines 502 to 502"]
B213["B214: MES2 - lines 505 to 505"]
B214["B215: instructions - lines 506 to 507"]
B215["B216: instructions - lines 508 to 509"]
B216["B217: instructions - lines 510 to 511"]
B217["B218: instructions - lines 512 to 513"]
B218["B219: instructions - lines 514 to 514"]
B219["B220: instructions - lines 515 to 515"]
B210 -->|call| B172
B210 -->|after return| B211
B211 -->|call| B125
B211 -->|after return| B212
B213 -->|call| B132
B213 -->|after return| B214
B214 -->|call| B142
B214 -->|after return| B215
B215 -->|call| B172
B215 -->|after return| B216
B216 -->|call| B142
B216 -->|after return| B217
B217 -->|call| B172
B217 -->|after return| B218
B218 -->|call| B125
B218 -->|after return| B219
B172["Continue at B173 in section 18"]
B125["Continue at B126 in section 13"]
B132["Continue at B133 in section 14"]
B142["Continue at B143 in section 15"]
```

### B211

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B212

```asm
ACALL DELAY
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
MOV DPTR,#ro8
ACALL WSTR
```

### B217

```asm
MOV A,#0C0H
ACALL CMD
```

### B218

```asm
MOV DPTR,#ro9
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
B220["B221: MES22 - lines 518 to 518"]
B221["B222: instructions - lines 519 to 520"]
B222["B223: instructions - lines 521 to 522"]
B223["B224: instructions - lines 523 to 524"]
B224["B225: instructions - lines 525 to 526"]
B225["B226: instructions - lines 527 to 527"]
B226["B227: instructions - lines 528 to 528"]
B227["B228: MES3 - lines 533 to 533"]
B228["B229: instructions - lines 534 to 535"]
B229["B230: instructions - lines 536 to 537"]
B220 -->|call| B132
B220 -->|after return| B221
B221 -->|call| B142
B221 -->|after return| B222
B222 -->|call| B172
B222 -->|after return| B223
B223 -->|call| B142
B223 -->|after return| B224
B224 -->|call| B172
B224 -->|after return| B225
B225 -->|call| B125
B225 -->|after return| B226
B227 -->|call| B132
B227 -->|after return| B228
B228 -->|call| B142
B228 -->|after return| B229
B229 -->|call| B172
B229 -->|after return| B230
B132["Continue at B133 in section 14"]
B142["Continue at B143 in section 15"]
B172["Continue at B173 in section 18"]
B125["Continue at B126 in section 13"]
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
MOV DPTR,#ro10
ACALL WSTR
```

### B224

```asm
MOV A,#0C0H
ACALL CMD
```

### B225

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B226

```asm
ACALL DELAY
```

### B227

Return to the instruction following the active call.

```asm
RET
```

### B228

```asm
ACALL CLEAR
```

### B229

```asm
MOV A,#80H
ACALL CMD
```

### B230

```asm
MOV DPTR,#ro12
ACALL WSTR
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 538 to 539"]
B231["B232: instructions - lines 541 to 541"]
B232["B233: MES33 - lines 544 to 544"]
B233["B234: instructions - lines 545 to 546"]
B234["B235: instructions - lines 547 to 548"]
B235["B236: instructions - lines 549 to 550"]
B236["B237: instructions - lines 551 to 552"]
B237["B238: instructions - lines 553 to 553"]
B238["B239: MES4 - lines 556 to 556"]
B239["B240: instructions - lines 557 to 558"]
B230 -->|call| B142
B230 -->|after return| B231
B232 -->|call| B132
B232 -->|after return| B233
B233 -->|call| B142
B233 -->|after return| B234
B234 -->|call| B172
B234 -->|after return| B235
B235 -->|call| B142
B235 -->|after return| B236
B236 -->|call| B172
B236 -->|after return| B237
B238 -->|call| B132
B238 -->|after return| B239
B239 -->|call| B142
B239 -->|after return| B240
B142["Continue at B143 in section 15"]
B132["Continue at B133 in section 14"]
B172["Continue at B173 in section 18"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
MOV A,#0C0H
ACALL CMD
```

### B232

Return to the instruction following the active call.

```asm
RET
```

### B233

```asm
ACALL CLEAR
```

### B234

```asm
MOV A,#80H
ACALL CMD
```

### B235

```asm
MOV DPTR,#ro12
ACALL WSTR
```

### B236

```asm
MOV A,#0C0H
ACALL CMD
```

### B237

```asm
MOV DPTR,#ro14
ACALL WSTR
```

### B238

Return to the instruction following the active call.

```asm
RET
```

### B239

```asm
ACALL CLEAR
```

### B240

```asm
MOV A,#80H
ACALL CMD
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 559 to 560"]
B241["B242: instructions - lines 561 to 562"]
B242["B243: instructions - lines 563 to 564"]
B243["B244: instructions - lines 565 to 565"]
B244["B245: instructions - lines 566 to 566"]
B245["B246: MES44 - lines 569 to 569"]
B246["B247: instructions - lines 570 to 571"]
B247["B248: instructions - lines 572 to 573"]
B248["B249: instructions - lines 574 to 575"]
B249["B250: instructions - lines 576 to 576"]
B240 -->|call| B172
B240 -->|after return| B241
B241 -->|call| B142
B241 -->|after return| B242
B242 -->|call| B172
B242 -->|after return| B243
B243 -->|call| B125
B243 -->|after return| B244
B245 -->|call| B132
B245 -->|after return| B246
B246 -->|call| B142
B246 -->|after return| B247
B247 -->|call| B172
B247 -->|after return| B248
B248 -->|call| B142
B248 -->|after return| B249
B172["Continue at B173 in section 18"]
B142["Continue at B143 in section 15"]
B125["Continue at B126 in section 13"]
B132["Continue at B133 in section 14"]
```

### B241

```asm
MOV DPTR,#ro13
ACALL WSTR
```

### B242

```asm
MOV A,#0C0H
ACALL CMD
```

### B243

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B244

```asm
ACALL DELAY
```

### B245

Return to the instruction following the active call.

```asm
RET
```

### B246

```asm
ACALL CLEAR
```

### B247

```asm
MOV A,#80H
ACALL CMD
```

### B248

```asm
MOV DPTR,#ro111
ACALL WSTR
```

### B249

```asm
MOV A,#0C0H
ACALL CMD
```

### B250

Return to the instruction following the active call.

```asm
RET
```

## Section 26

```mermaid
flowchart TD
B250["B251: MES5 - lines 579 to 579"]
B251["B252: instructions - lines 580 to 581"]
B252["B253: instructions - lines 582 to 583"]
B253["B254: instructions - lines 584 to 585"]
B254["B255: instructions - lines 586 to 587"]
B255["B256: instructions - lines 588 to 588"]
B256["B257: instructions - lines 589 to 589"]
B257["B258: CONVERT - lines 593 to 596"]
B258["B259: instructions - lines 597 to 599"]
B259["B260: instructions - lines 600 to 600"]
B250 -->|call| B132
B250 -->|after return| B251
B251 -->|call| B142
B251 -->|after return| B252
B252 -->|call| B172
B252 -->|after return| B253
B253 -->|call| B142
B253 -->|after return| B254
B254 -->|call| B172
B254 -->|after return| B255
B255 -->|call| B125
B255 -->|after return| B256
B257 -->|call| B137
B257 -->|after return| B258
B258 -->|call| B137
B258 -->|after return| B259
B132["Continue at B133 in section 14"]
B142["Continue at B143 in section 15"]
B172["Continue at B173 in section 18"]
B125["Continue at B126 in section 13"]
B137["Continue at B138 in section 14"]
```

### B251

```asm
ACALL CLEAR
```

### B252

```asm
MOV A,#80H
ACALL CMD
```

### B253

```asm
MOV DPTR,#ro15
ACALL WSTR
```

### B254

```asm
MOV A,#0C0H
ACALL CMD
```

### B255

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B256

```asm
ACALL DELAY
```

### B257

Return to the instruction following the active call.

```asm
RET
```

### B258

```asm
Mov b,#10
Div ab
Add A,#30H
Acall wchr
```

### B259

```asm
Mov a,b
Add a,#30h
Acall wchr
```

### B260

Return to the instruction following the active call.

```asm
ret
```

## Section 27

```mermaid
flowchart TD
B260["B261: PRESS - lines 603 to 604"]
B261["B262: instructions - lines 605 to 606"]
B262["B263: instructions - lines 607 to 608"]
B263["B264: instructions - lines 609 to 610"]
B264["B265: C1 - lines 612 to 612"]
B265["B266: instructions - lines 613 to 613"]
B266["B267: instructions - lines 614 to 615"]
B267["B268: instructions - lines 616 to 616"]
B268["B269: instructions - lines 617 to 617"]
B269["B270: WRONGM - lines 621 to 621"]
B260 -->|call| B142
B260 -->|after return| B261
B261 -->|call| B172
B261 -->|after return| B262
B262 -->|call| B142
B262 -->|after return| B263
B263 -->|call| B172
B263 -->|after return| B264
B264 -->|call| B153
B264 -->|after return| B265
B265 -->|condition true| B264
B265 -->|condition false| B266
B266 -->|call| B172
B266 -->|after return| B267
B267 -->|call| B132
B267 -->|after return| B268
B269 -->|condition true| B273
B269 -->|condition false| B270
B142["Continue at B143 in section 15"]
B172["Continue at B173 in section 18"]
B153["Continue at B154 in section 16"]
B132["Continue at B133 in section 14"]
B273["Continue at B274 in section 28"]
B270["Continue at B271 in section 28"]
```

### B261

```asm
mov a,#80h
acall cmd
```

### B262

```asm
mov dptr ,#t1
acall wstr
```

### B263

```asm
mov a,#0c0h
acall cmd
```

### B264

```asm
mov dptr ,#t2
acall wstr
```

### B265

```asm
acall keypad
```

### B266

```asm
cjne a,#30h,c1
```

### B267

```asm
mov dptr ,#t1
acall wstr
```

### B268

```asm
acall clear
```

### B269

Return to the instruction following the active call.

```asm
ret
```

### B270

```asm
cjne a,#'#',false1
```

## Section 28

```mermaid
flowchart TD
B270["B271: instructions - lines 622 to 622"]
B271["B272: instructions - lines 623 to 623"]
B272["B273: instructions - lines 624 to 624"]
B273["B274: FALSE1 - lines 627 to 627"]
B274["B275: instructions - lines 628 to 628"]
B275["B276: instructions - lines 629 to 629"]
B276["B277: instructions - lines 630 to 630"]
B277["B278: FALSE2 - lines 634 to 639"]
B278["B279: instructions - lines 640 to 642"]
B279["B280: instructions - lines 643 to 643"]
B270 -->|call| B200
B270 -->|after return| B271
B271 -->|call| B125
B271 -->|after return| B272
B272 -->|jump| B72
B273 -->|condition true| B277
B273 -->|condition false| B274
B274 -->|call| B200
B274 -->|after return| B275
B275 -->|call| B125
B275 -->|after return| B276
B276 -->|jump| B72
B277 -->|call| B153
B277 -->|after return| B278
B278 -->|call| B125
B278 -->|after return| B279
B200["Continue at B201 in section 21"]
B125["Continue at B126 in section 13"]
B72["Continue at B73 in section 8"]
B153["Continue at B154 in section 16"]
```

### B271

```asm
acall ERROR1MSG
```

### B272

```asm
ACALL DELAY
```

### B273

```asm
ljmp c
```

### B274

```asm
cjne a,#'*',false2
```

### B275

```asm
acall ERROR1MSG
```

### B276

```asm
ACALL DELAY
```

### B277

```asm
ljmp c
```

### B278

```asm
subb a,#30h
mov b,10
mul ab
mov a,#30h
acall keypad
```

### B279

```asm
subb a,#30h
add a,30h
acall delay
```

### B280

Return to the instruction following the active call.

```asm
ret
```

## Section 29

```mermaid
flowchart TD
B280["B281: STOP - lines 700 to 700"]
B280 -->|jump| B280
```

### B281

```asm
sjmp stop
```
