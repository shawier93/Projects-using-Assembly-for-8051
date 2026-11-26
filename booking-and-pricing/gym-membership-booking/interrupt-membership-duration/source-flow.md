# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 30H` begins at B4.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 4"]
B1["B2: H - lines 8 to 9"]
B2["B3: instructions - lines 10 to 10"]
B3["B4: STARTT - lines 14 to 14"]
B4["B5: instructions - lines 15 to 29"]
B5["B6: instructions - lines 30 to 31"]
B6["B7: instructions - lines 35 to 36"]
B7["B8: instructions - lines 38 to 39"]
B8["B9: instructions - lines 40 to 40"]
B9["B10: instructions - lines 43 to 44"]
B0 -->|jump| B3
B1 -->|condition true| B1
B1 -->|condition false| B2
B3 -->|call| B144
B3 -->|after return| B4
B4 -->|call| B111
B4 -->|after return| B5
B5 -->|call| B111
B5 -->|after return| B6
B6 -->|call| B88
B6 -->|after return| B7
B7 -->|call| B98
B7 -->|after return| B8
B8 -->|call| B156
B8 -->|after return| B9
B9 -->|call| B88
B9 -->|after return| B10
B144["Continue at B145 in section 15"]
B111["Continue at B112 in section 12"]
B88["Continue at B89 in section 9"]
B98["Continue at B99 in section 10"]
B156["Continue at B157 in section 16"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP STARTT
```

### B2

```asm
MOV A,P2
JB ACC.5,H
```

### B3

Resume the interrupted program.

```asm
RETI
```

### B4

```asm
ACALL INLCD
```

### B5

```asm
MOV 40H,#5
MOV 41H,#5
MOV 42H,#30
MOV 43H,#30
MOV 44H,#20
MOV 45H,#20
MOV 30H,#2
MOV R2,#1
MOV 31H,#2
MOV 32H,#0
MOV 33H,#0
MOV P1,#00
ACALL DELAY
```

### B6

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B7

```asm
MOV DPTR,#MESG1
ACALL SHOW
```

### B8

```asm
MOV DPTR,#MESG2
ACALL SHOW2
```

### B9

```asm
ACALL WSTR
```

### B10

```asm
MOV DPTR,#MESG13
ACALL SHOW
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 45 to 52"]
B11["B12: instructions - lines 54 to 55"]
B12["B13: instructions - lines 56 to 56"]
B13["B14: START - lines 61 to 62"]
B14["B15: instructions - lines 63 to 63"]
B15["B16: instructions - lines 65 to 65"]
B16["B17: instructions - lines 66 to 66"]
B17["B18: instructions - lines 67 to 67"]
B18["B19: instructions - lines 68 to 68"]
B19["B20: instructions - lines 69 to 75"]
B10 -->|call| B88
B10 -->|after return| B11
B11 -->|call| B98
B11 -->|after return| B12
B12 -->|call| B156
B12 -->|after return| B13
B13 -->|call| B88
B13 -->|after return| B14
B14 -->|call| B111
B14 -->|after return| B15
B15 -->|call| B98
B15 -->|after return| B16
B16 -->|call| B116
B16 -->|after return| B17
B17 -->|call| B133
B17 -->|after return| B18
B18 -->|call| B111
B18 -->|after return| B19
B19 -->|condition true| B22
B19 -->|condition false| B20
B88["Continue at B89 in section 9"]
B98["Continue at B99 in section 10"]
B156["Continue at B157 in section 16"]
B111["Continue at B112 in section 12"]
B116["Continue at B117 in section 12"]
B133["Continue at B134 in section 14"]
B22["Continue at B23 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV IE,#10000001B
SETB IT0
CLR P3.6
SETB P3.6
MOV DPTR,#MESG3
ACALL SHOW
```

### B12

```asm
MOV DPTR,#MESG4
ACALL SHOW2
```

### B13

```asm
ACALL WSTR
```

### B14

```asm
MOV DPTR,#MESG5
ACALL SHOW
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
ACALL SHOW2
```

### B17

```asm
ACALL KEYPAD
```

### B18

```asm
ACALL WCHR
```

### B19

```asm
ACALL DELAY
```

### B20

```asm
SUBB A,#30H
MOV 30H,A
MOV A,30H
CJNE A,#1,NEXT
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 76 to 76"]
B21["B22: instructions - lines 77 to 77"]
B22["B23: NEXT - lines 79 to 79"]
B23["B24: instructions - lines 80 to 80"]
B24["B25: instructions - lines 81 to 81"]
B25["B26: NEXT1 - lines 83 to 83"]
B26["B27: instructions - lines 84 to 84"]
B27["B28: instructions - lines 85 to 85"]
B28["B29: NEXT2 - lines 88 to 88"]
B29["B30: instructions - lines 89 to 89"]
B20 -->|call| B39
B20 -->|after return| B21
B21 -->|jump| B30
B22 -->|condition true| B25
B22 -->|condition false| B23
B23 -->|call| B55
B23 -->|after return| B24
B24 -->|jump| B30
B25 -->|condition true| B28
B25 -->|condition false| B26
B26 -->|call| B71
B26 -->|after return| B27
B27 -->|jump| B30
B28 -->|call| B87
B28 -->|after return| B29
B29 -->|jump| B30
B39["Continue at B40 in section 4"]
B30["Continue at B31 in section 4"]
B55["Continue at B56 in section 6"]
B71["Continue at B72 in section 8"]
B87["Continue at B88 in section 9"]
```

### B21

```asm
ACALL VIP
```

### B22

```asm
AJMP DISPCOST
```

### B23

```asm
CJNE A,#2,NEXT1
```

### B24

```asm
ACALL ONLINE
```

### B25

```asm
AJMP DISPCOST
```

### B26

```asm
CJNE A,#3,NEXT2
```

### B27

```asm
ACALL REGULAR
```

### B28

```asm
AJMP DISPCOST
```

### B29

```asm
ACALL WRONG
```

### B30

```asm
AJMP DISPCOST
```

## Section 4

```mermaid
flowchart TD
B30["B31: DISPCOST - lines 92 to 93"]
B31["B32: instructions - lines 94 to 94"]
B32["B33: instructions - lines 96 to 96"]
B33["B34: instructions - lines 97 to 116"]
B34["B35: instructions - lines 117 to 118"]
B35["B36: instructions - lines 119 to 120"]
B36["B37: instructions - lines 121 to 122"]
B37["B38: instructions - lines 123 to 123"]
B38["B39: instructions - lines 124 to 124"]
B39["B40: VIP - lines 131 to 132"]
B30 -->|call| B88
B30 -->|after return| B31
B31 -->|call| B111
B31 -->|after return| B32
B32 -->|call| B98
B32 -->|after return| B33
B33 -->|call| B133
B33 -->|after return| B34
B34 -->|call| B133
B34 -->|after return| B35
B35 -->|call| B133
B35 -->|after return| B36
B36 -->|call| B133
B36 -->|after return| B37
B37 -->|call| B111
B37 -->|after return| B38
B38 -->|call| B111
B38 -->|after return| B39
B39 -->|call| B88
B39 -->|after return| B40
B88["Continue at B89 in section 9"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B133["Continue at B134 in section 14"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV DPTR,#MESG11
ACALL SHOW
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
ACALL SHOW2
```

### B34

```asm
MOV A,33H
MOV B,#10
DIV AB
ADD A,#30H
MOV 50H,A
MOV A,B
ADD A,#30H
MOV 51H,A
MOV A,32H
MOV B,#10
DIV AB
ADD A,#30H
MOV 52H,A
MOV A,B
ADD A,#30H
MOV 53H,A
MOV A,50H
ACALL WCHR
```

### B35

```asm
MOV A,51H
ACALL WCHR
```

### B36

```asm
MOV A,52H
ACALL WCHR
```

### B37

```asm
MOV A,53H
ACALL WCHR
```

### B38

```asm
ACALL DELAY
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
MOV DPTR,#MESG6
ACALL SHOW
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 133 to 133"]
B41["B42: instructions - lines 135 to 136"]
B42["B43: instructions - lines 137 to 138"]
B43["B44: instructions - lines 139 to 139"]
B44["B45: instructions - lines 141 to 142"]
B45["B46: instructions - lines 143 to 143"]
B46["B47: instructions - lines 145 to 145"]
B47["B48: instructions - lines 146 to 146"]
B48["B49: instructions - lines 147 to 147"]
B49["B50: instructions - lines 148 to 148"]
B40 -->|call| B111
B40 -->|after return| B41
B41 -->|call| B88
B41 -->|after return| B42
B42 -->|call| B98
B42 -->|after return| B43
B43 -->|call| B156
B43 -->|after return| B44
B44 -->|call| B88
B44 -->|after return| B45
B45 -->|call| B111
B45 -->|after return| B46
B46 -->|call| B98
B46 -->|after return| B47
B47 -->|call| B116
B47 -->|after return| B48
B48 -->|call| B133
B48 -->|after return| B49
B49 -->|call| B111
B49 -->|after return| B50
B111["Continue at B112 in section 12"]
B88["Continue at B89 in section 9"]
B98["Continue at B99 in section 10"]
B156["Continue at B157 in section 16"]
B116["Continue at B117 in section 12"]
B133["Continue at B134 in section 14"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
acall delay
```

### B42

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B43

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B44

```asm
ACALL WSTR
```

### B45

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B46

```asm
ACALL DELAY
```

### B47

```asm
ACALL SHOW2
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
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 149 to 154"]
B51["B52: instructions - lines 155 to 157"]
B52["B53: YEAR - lines 160 to 160"]
B53["B54: instructions - lines 161 to 162"]
B54["B55: EEND - lines 166 to 166"]
B55["B56: ONLINE - lines 169 to 170"]
B56["B57: instructions - lines 171 to 171"]
B57["B58: instructions - lines 173 to 174"]
B58["B59: instructions - lines 175 to 176"]
B59["B60: instructions - lines 177 to 177"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|jump| B54
B52 -->|condition true| B54
B52 -->|condition false| B53
B53 -->|next| B54
B55 -->|call| B88
B55 -->|after return| B56
B56 -->|call| B111
B56 -->|after return| B57
B57 -->|call| B88
B57 -->|after return| B58
B58 -->|call| B98
B58 -->|after return| B59
B59 -->|call| B156
B59 -->|after return| B60
B88["Continue at B89 in section 9"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B156["Continue at B157 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
SUBB A,#30H
MOV 31H,A
MOV A,31H
CJNE A,#1,YEAR
```

### B52

```asm
MOV A,#35
MOV 32H,A
SJMP EEND
```

### B53

```asm
CJNE A,#2, EEND
```

### B54

```asm
MOV A,#99
MOV 32H,A
```

### B55

Return to the instruction following the active call.

```asm
RET
```

### B56

```asm
MOV DPTR,#MESG7
ACALL SHOW
```

### B57

```asm
acall delay
```

### B58

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B59

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B60

```asm
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 179 to 180"]
B61["B62: instructions - lines 181 to 181"]
B62["B63: instructions - lines 183 to 183"]
B63["B64: instructions - lines 184 to 184"]
B64["B65: instructions - lines 185 to 185"]
B65["B66: instructions - lines 186 to 186"]
B66["B67: instructions - lines 187 to 191"]
B67["B68: instructions - lines 192 to 195"]
B68["B69: YEAR1 - lines 198 to 198"]
B69["B70: instructions - lines 199 to 200"]
B60 -->|call| B88
B60 -->|after return| B61
B61 -->|call| B111
B61 -->|after return| B62
B62 -->|call| B98
B62 -->|after return| B63
B63 -->|call| B116
B63 -->|after return| B64
B64 -->|call| B133
B64 -->|after return| B65
B65 -->|call| B111
B65 -->|after return| B66
B66 -->|condition true| B68
B66 -->|condition false| B67
B67 -->|jump| B70
B68 -->|condition true| B70
B68 -->|condition false| B69
B69 -->|next| B70
B88["Continue at B89 in section 9"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B116["Continue at B117 in section 12"]
B133["Continue at B134 in section 14"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
ACALL SHOW2
```

### B64

```asm
ACALL KEYPAD
```

### B65

```asm
ACALL WCHR
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
SUBB A,#30H
MOV 31H,A
MOV A,31H
CJNE A,#1,YEAR1
```

### B68

```asm
MOV A,#5
MOV 32H,A
SJMP END1
```

### B69

```asm
CJNE A,#2, END1
```

### B70

```asm
MOV A,#30
MOV 32H,A
```

## Section 8

```mermaid
flowchart TD
B70["B71: END1 - lines 204 to 204"]
B71["B72: REGULAR - lines 207 to 208"]
B72["B73: instructions - lines 209 to 209"]
B73["B74: instructions - lines 211 to 212"]
B74["B75: instructions - lines 213 to 214"]
B75["B76: instructions - lines 215 to 215"]
B76["B77: instructions - lines 217 to 218"]
B77["B78: instructions - lines 219 to 219"]
B78["B79: instructions - lines 221 to 221"]
B79["B80: instructions - lines 222 to 222"]
B71 -->|call| B88
B71 -->|after return| B72
B72 -->|call| B111
B72 -->|after return| B73
B73 -->|call| B88
B73 -->|after return| B74
B74 -->|call| B98
B74 -->|after return| B75
B75 -->|call| B156
B75 -->|after return| B76
B76 -->|call| B88
B76 -->|after return| B77
B77 -->|call| B111
B77 -->|after return| B78
B78 -->|call| B98
B78 -->|after return| B79
B79 -->|call| B116
B79 -->|after return| B80
B88["Continue at B89 in section 9"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B156["Continue at B157 in section 16"]
B116["Continue at B117 in section 12"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
MOV DPTR,#MESG8
ACALL SHOW
```

### B73

```asm
acall delay
```

### B74

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B75

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B76

```asm
ACALL WSTR
```

### B77

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
ACALL SHOW2
```

### B80

```asm
ACALL KEYPAD
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 223 to 223"]
B81["B82: instructions - lines 224 to 224"]
B82["B83: instructions - lines 225 to 229"]
B83["B84: instructions - lines 230 to 233"]
B84["B85: YEAR2 - lines 236 to 236"]
B85["B86: instructions - lines 237 to 238"]
B86["B87: END2 - lines 241 to 241"]
B87["B88: WRONG - lines 244 to 246"]
B88["B89: SHOW - lines 249 to 249"]
B89["B90: instructions - lines 250 to 250"]
B80 -->|call| B133
B80 -->|after return| B81
B81 -->|call| B111
B81 -->|after return| B82
B82 -->|condition true| B84
B82 -->|condition false| B83
B83 -->|jump| B86
B84 -->|condition true| B86
B84 -->|condition false| B85
B85 -->|next| B86
B88 -->|call| B111
B88 -->|after return| B89
B89 -->|call| B111
B89 -->|after return| B90
B133["Continue at B134 in section 14"]
B111["Continue at B112 in section 12"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL WCHR
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
SUBB A,#30H
MOV 31H,A
MOV A,31H
CJNE A,#1,YEAR2
```

### B84

```asm
MOV A,#10
MOV 32H,A
SJMP END2
```

### B85

```asm
CJNE A,#2, END2
```

### B86

```asm
MOV A,#70
MOV 32H,A
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

Return to the instruction following the active call.

```asm
MOV 32H,#0
MOV 33H,#0
RET
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 251 to 251"]
B91["B92: instructions - lines 252 to 252"]
B92["B93: instructions - lines 253 to 254"]
B93["B94: instructions - lines 256 to 256"]
B94["B95: instructions - lines 257 to 257"]
B95["B96: instructions - lines 258 to 258"]
B96["B97: instructions - lines 259 to 259"]
B97["B98: instructions - lines 260 to 260"]
B98["B99: SHOW2 - lines 263 to 264"]
B99["B100: instructions - lines 265 to 265"]
B90 -->|call| B151
B90 -->|after return| B91
B91 -->|call| B111
B91 -->|after return| B92
B92 -->|call| B138
B92 -->|after return| B93
B93 -->|call| B156
B93 -->|after return| B94
B94 -->|call| B111
B94 -->|after return| B95
B95 -->|call| B111
B95 -->|after return| B96
B96 -->|call| B111
B96 -->|after return| B97
B98 -->|call| B138
B98 -->|after return| B99
B99 -->|call| B111
B99 -->|after return| B100
B151["Continue at B152 in section 16"]
B111["Continue at B112 in section 12"]
B138["Continue at B139 in section 14"]
B156["Continue at B157 in section 16"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL CLEAR
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
MOV A,#80H
ACALL CMD
```

### B94

```asm
ACALL WSTR
```

### B95

```asm
ACALL DELAY
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

Return to the instruction following the active call.

```asm
RET
```

### B99

```asm
MOV A,#0C0H
ACALL CMD
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 266 to 266"]
B101["B102: instructions - lines 267 to 267"]
B102["B103: instructions - lines 268 to 268"]
B103["B104: instructions - lines 269 to 269"]
B104["B105: instructions - lines 270 to 270"]
B105["B106: SHOW3 - lines 273 to 274"]
B106["B107: instructions - lines 275 to 275"]
B107["B108: instructions - lines 276 to 276"]
B108["B109: instructions - lines 277 to 277"]
B109["B110: instructions - lines 278 to 278"]
B100 -->|call| B111
B100 -->|after return| B101
B101 -->|call| B111
B101 -->|after return| B102
B102 -->|call| B111
B102 -->|after return| B103
B103 -->|call| B111
B103 -->|after return| B104
B105 -->|call| B138
B105 -->|after return| B106
B106 -->|call| B111
B106 -->|after return| B107
B107 -->|call| B111
B107 -->|after return| B108
B108 -->|call| B111
B108 -->|after return| B109
B109 -->|call| B111
B109 -->|after return| B110
B111["Continue at B112 in section 12"]
B138["Continue at B139 in section 14"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL DELAY
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
ACALL DELAY
```

### B104

```asm
ACALL DELAY
```

### B105

Return to the instruction following the active call.

```asm
RET
```

### B106

```asm
MOV A,#0C5H
ACALL CMD
```

### B107

```asm
ACALL DELAY
```

### B108

```asm
ACALL DELAY
```

### B109

```asm
ACALL DELAY
```

### B110

```asm
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 279 to 279"]
B111["B112: DELAY - lines 281 to 281"]
B112["B113: H1 - lines 282 to 282"]
B113["B114: HH - lines 283 to 283"]
B114["B115: instructions - lines 284 to 284"]
B115["B116: instructions - lines 285 to 285"]
B116["B117: KEYPAD - lines 289 to 289"]
B117["B118: K1 - lines 290 to 293"]
B118["B119: K2 - lines 295 to 297"]
B119["B120: instructions - lines 298 to 298"]
B111 -->|next| B112
B112 -->|next| B113
B113 -->|condition true| B113
B113 -->|condition false| B114
B114 -->|condition true| B112
B114 -->|condition false| B115
B116 -->|next| B117
B117 -->|condition true| B117
B117 -->|condition false| B118
B118 -->|condition true| B120
B118 -->|condition false| B119
B119 -->|jump| B118
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
RET
```

### B112

```asm
MOV R0, #250
```

### B113

```asm
MOV R1,#20
```

### B114

```asm
DJNZ R1, HH
```

### B115

```asm
DJNZ R0,H1
```

### B116

Return to the instruction following the active call.

```asm
RET
```

### B117

```asm
MOV P0,#01110000B
```

### B118

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B119

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B120

```asm
SJMP K2
```

## Section 13

```mermaid
flowchart TD
B120["B121: OVER1 - lines 300 to 303"]
B121["B122: instructions - lines 304 to 307"]
B122["B123: instructions - lines 308 to 311"]
B123["B124: instructions - lines 312 to 315"]
B124["B125: instructions - lines 316 to 316"]
B125["B126: ROW_0 - lines 317 to 318"]
B126["B127: ROW_1 - lines 319 to 320"]
B127["B128: ROW_2 - lines 321 to 322"]
B128["B129: ROW_3 - lines 323 to 323"]
B129["B130: FIND - lines 325 to 325"]
B120 -->|condition true| B125
B120 -->|condition false| B121
B121 -->|condition true| B126
B121 -->|condition false| B122
B122 -->|condition true| B127
B122 -->|condition false| B123
B123 -->|condition true| B128
B123 -->|condition false| B124
B124 -->|jump| B118
B125 -->|jump| B129
B126 -->|jump| B129
B127 -->|jump| B129
B128 -->|next| B129
B129 -->|next| B130
B118["Continue at B119 in section 12"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B122

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B123

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B124

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B125

```asm
LJMP K2
```

### B126

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B127

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B128

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B129

```asm
MOV DPTR,#KCODE3
```

### B130

```asm
RLC A
```

## Section 14

```mermaid
flowchart TD
B130["B131: FIND1 - lines 327 to 328"]
B131["B132: instructions - lines 329 to 330"]
B132["B133: MATCH - lines 331 to 333"]
B133["B134: WCHR - lines 336 to 340"]
B134["B135: instructions - lines 341 to 341"]
B135["B136: instructions - lines 342 to 344"]
B136["B137: instructions - lines 345 to 345"]
B137["B138: instructions - lines 346 to 348"]
B138["B139: CMD - lines 351 to 353"]
B139["B140: instructions - lines 354 to 354"]
B130 -->|condition true| B132
B130 -->|condition false| B131
B131 -->|jump| B130
B133 -->|call| B143
B133 -->|after return| B134
B134 -->|call| B149
B134 -->|after return| B135
B135 -->|call| B143
B135 -->|after return| B136
B136 -->|call| B149
B136 -->|after return| B137
B138 -->|call| B143
B138 -->|after return| B139
B139 -->|call| B149
B139 -->|after return| B140
B143["Continue at B144 in section 15"]
B149["Continue at B150 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
RLC A
JNC MATCH
```

### B132

```asm
INC DPTR
SJMP FIND1
```

### B133

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B134

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B135

```asm
ACALL LDELAY
```

### B136

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B137

```asm
ACALL LDELAY
```

### B138

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B139

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B140

```asm
ACALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 355 to 357"]
B141["B142: instructions - lines 358 to 358"]
B142["B143: instructions - lines 359 to 359"]
B143["B144: COMMON - lines 362 to 367"]
B144["B145: INLCD - lines 370 to 377"]
B145["B146: instructions - lines 378 to 386"]
B146["B147: instructions - lines 387 to 399"]
B147["B148: instructions - lines 400 to 410"]
B148["B149: instructions - lines 411 to 411"]
B149["B150: LDELAY - lines 414 to 415"]
B140 -->|call| B143
B140 -->|after return| B141
B141 -->|call| B149
B141 -->|after return| B142
B144 -->|call| B149
B144 -->|after return| B145
B145 -->|call| B149
B145 -->|after return| B146
B146 -->|call| B149
B146 -->|after return| B147
B147 -->|call| B149
B147 -->|after return| B148
B149 -->|condition true| B149
B149 -->|condition false| B150
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B142

```asm
ACALL LDELAY
```

### B143

Return to the instruction following the active call.

```asm
RET
```

### B144

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B145

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

### B146

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

### B147

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

### B148

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

### B149

Return to the instruction following the active call.

```asm
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
B150["B151: instructions - lines 416 to 416"]
B151["B152: CLEAR - lines 419 to 420"]
B152["B153: instructions - lines 421 to 421"]
B153["B154: WAIT - lines 422 to 422"]
B154["B155: instructions - lines 423 to 423"]
B155["B156: instructions - lines 424 to 424"]
B156["B157: WSTR - lines 427 to 427"]
B157["B158: CONT1 - lines 429 to 431"]
B158["B159: PRINT - lines 433 to 433"]
B159["B160: instructions - lines 434 to 435"]
B151 -->|call| B138
B151 -->|after return| B152
B152 -->|next| B153
B153 -->|call| B149
B153 -->|after return| B154
B154 -->|condition true| B153
B154 -->|condition false| B155
B156 -->|next| B157
B157 -->|condition true| B160
B157 -->|condition false| B158
B158 -->|call| B133
B158 -->|after return| B159
B159 -->|jump| B157
B138["Continue at B139 in section 14"]
B149["Continue at B150 in section 15"]
B160["Continue at B161 in section 17"]
B133["Continue at B134 in section 14"]
```

### B151

Return to the instruction following the active call.

```asm
RET
```

### B152

```asm
MOV A,#01H
ACALL CMD
```

### B153

```asm
MOV R7,#14
```

### B154

```asm
ACALL LDELAY
```

### B155

```asm
DJNZ R7,WAIT
```

### B156

Return to the instruction following the active call.

```asm
ret
```

### B157

```asm
PUSH    ACC
```

### B158

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B159

```asm
ACALL    WCHR
```

### B160

```asm
INC DPTR
AJMP    CONT1
```

## Section 17

```mermaid
flowchart TD
B160["B161: EXIT1 - lines 436 to 437"]
```

### B161

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
