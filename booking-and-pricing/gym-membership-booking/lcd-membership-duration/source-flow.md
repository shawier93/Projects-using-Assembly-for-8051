# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 17"]
B2["B3: instructions - lines 18 to 19"]
B3["B4: instructions - lines 23 to 24"]
B4["B5: instructions - lines 26 to 27"]
B5["B6: instructions - lines 28 to 28"]
B6["B7: instructions - lines 30 to 31"]
B7["B8: instructions - lines 32 to 33"]
B8["B9: instructions - lines 34 to 34"]
B9["B10: START - lines 39 to 40"]
B0 -->|call| B116
B0 -->|after return| B1
B1 -->|call| B100
B1 -->|after return| B2
B2 -->|call| B100
B2 -->|after return| B3
B3 -->|call| B85
B3 -->|after return| B4
B4 -->|call| B91
B4 -->|after return| B5
B5 -->|call| B128
B5 -->|after return| B6
B6 -->|call| B85
B6 -->|after return| B7
B7 -->|call| B91
B7 -->|after return| B8
B8 -->|call| B128
B8 -->|after return| B9
B9 -->|call| B85
B9 -->|after return| B10
B116["Continue at B117 in section 12"]
B100["Continue at B101 in section 11"]
B85["Continue at B86 in section 9"]
B91["Continue at B92 in section 10"]
B128["Continue at B129 in section 13"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

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

### B3

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B4

```asm
MOV DPTR,#MESG1
ACALL SHOW
```

### B5

```asm
MOV DPTR,#MESG2
ACALL SHOW2
```

### B6

```asm
ACALL WSTR
```

### B7

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B8

```asm
MOV DPTR,#MESG4
ACALL SHOW2
```

### B9

```asm
ACALL WSTR
```

### B10

```asm
MOV DPTR,#MESG5
ACALL SHOW
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 41 to 41"]
B11["B12: instructions - lines 43 to 43"]
B12["B13: instructions - lines 44 to 46"]
B13["B14: instructions - lines 47 to 47"]
B14["B15: instructions - lines 48 to 48"]
B15["B16: instructions - lines 51 to 52"]
B16["B17: instructions - lines 53 to 53"]
B17["B18: instructions - lines 54 to 54"]
B18["B19: NEXT - lines 56 to 56"]
B19["B20: instructions - lines 57 to 57"]
B10 -->|call| B100
B10 -->|after return| B11
B11 -->|call| B91
B11 -->|after return| B12
B12 -->|call| B105
B12 -->|after return| B13
B13 -->|call| B100
B13 -->|after return| B14
B14 -->|call| B100
B14 -->|after return| B15
B15 -->|condition true| B18
B15 -->|condition false| B16
B16 -->|call| B36
B16 -->|after return| B17
B17 -->|jump| B26
B18 -->|condition true| B21
B18 -->|condition false| B19
B19 -->|call| B52
B19 -->|after return| B20
B100["Continue at B101 in section 11"]
B91["Continue at B92 in section 10"]
B105["Continue at B106 in section 11"]
B36["Continue at B37 in section 4"]
B26["Continue at B27 in section 3"]
B21["Continue at B22 in section 3"]
B52["Continue at B53 in section 6"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
ACALL SHOW2
```

### B13

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B14

```asm
ACALL DELAY
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
MOV A,30H
CJNE A,#1,NEXT
```

### B17

```asm
ACALL VIP
```

### B18

```asm
AJMP DISPCOST
```

### B19

```asm
CJNE A,#2,NEXT1
```

### B20

```asm
ACALL ONLINE
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 58 to 58"]
B21["B22: NEXT1 - lines 60 to 60"]
B22["B23: instructions - lines 61 to 61"]
B23["B24: instructions - lines 62 to 62"]
B24["B25: NEXT2 - lines 65 to 65"]
B25["B26: instructions - lines 66 to 66"]
B26["B27: DISPCOST - lines 69 to 70"]
B27["B28: instructions - lines 71 to 71"]
B28["B29: instructions - lines 73 to 73"]
B29["B30: instructions - lines 74 to 93"]
B20 -->|jump| B26
B21 -->|condition true| B24
B21 -->|condition false| B22
B22 -->|call| B68
B22 -->|after return| B23
B23 -->|jump| B26
B24 -->|call| B84
B24 -->|after return| B25
B25 -->|jump| B26
B26 -->|call| B85
B26 -->|after return| B27
B27 -->|call| B100
B27 -->|after return| B28
B28 -->|call| B91
B28 -->|after return| B29
B29 -->|call| B105
B29 -->|after return| B30
B68["Continue at B69 in section 7"]
B84["Continue at B85 in section 9"]
B85["Continue at B86 in section 9"]
B100["Continue at B101 in section 11"]
B91["Continue at B92 in section 10"]
B105["Continue at B106 in section 11"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
AJMP DISPCOST
```

### B22

```asm
CJNE A,#3,NEXT2
```

### B23

```asm
ACALL REGULAR
```

### B24

```asm
AJMP DISPCOST
```

### B25

```asm
ACALL WRONG
```

### B26

```asm
AJMP DISPCOST
```

### B27

```asm
MOV DPTR,#MESG11
ACALL SHOW
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
ACALL SHOW2
```

### B30

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

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 94 to 95"]
B31["B32: instructions - lines 96 to 97"]
B32["B33: instructions - lines 98 to 99"]
B33["B34: instructions - lines 100 to 100"]
B34["B35: instructions - lines 101 to 101"]
B35["B36: SJ - lines 103 to 103"]
B36["B37: VIP - lines 108 to 109"]
B37["B38: instructions - lines 110 to 110"]
B38["B39: instructions - lines 112 to 113"]
B39["B40: instructions - lines 114 to 115"]
B30 -->|call| B105
B30 -->|after return| B31
B31 -->|call| B105
B31 -->|after return| B32
B32 -->|call| B105
B32 -->|after return| B33
B33 -->|call| B100
B33 -->|after return| B34
B34 -->|call| B100
B34 -->|after return| B35
B35 -->|jump| B35
B36 -->|call| B85
B36 -->|after return| B37
B37 -->|call| B100
B37 -->|after return| B38
B38 -->|call| B85
B38 -->|after return| B39
B39 -->|call| B91
B39 -->|after return| B40
B105["Continue at B106 in section 11"]
B100["Continue at B101 in section 11"]
B85["Continue at B86 in section 9"]
B91["Continue at B92 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,51H
ACALL WCHR
```

### B32

```asm
MOV A,52H
ACALL WCHR
```

### B33

```asm
MOV A,53H
ACALL WCHR
```

### B34

```asm
ACALL DELAY
```

### B35

```asm
ACALL DELAY
```

### B36

```asm
SJMP SJ
```

### B37

```asm
MOV DPTR,#MESG6
ACALL SHOW
```

### B38

```asm
acall delay
```

### B39

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B40

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 116 to 116"]
B41["B42: instructions - lines 118 to 119"]
B42["B43: instructions - lines 120 to 120"]
B43["B44: instructions - lines 122 to 122"]
B44["B45: instructions - lines 123 to 125"]
B45["B46: instructions - lines 126 to 126"]
B46["B47: instructions - lines 127 to 127"]
B47["B48: instructions - lines 130 to 131"]
B48["B49: instructions - lines 132 to 137"]
B49["B50: YEAR - lines 140 to 140"]
B40 -->|call| B128
B40 -->|after return| B41
B41 -->|call| B85
B41 -->|after return| B42
B42 -->|call| B100
B42 -->|after return| B43
B43 -->|call| B91
B43 -->|after return| B44
B44 -->|call| B105
B44 -->|after return| B45
B45 -->|call| B100
B45 -->|after return| B46
B46 -->|call| B100
B46 -->|after return| B47
B47 -->|condition true| B49
B47 -->|condition false| B48
B48 -->|jump| B51
B49 -->|condition true| B51
B49 -->|condition false| B50
B128["Continue at B129 in section 13"]
B85["Continue at B86 in section 9"]
B100["Continue at B101 in section 11"]
B91["Continue at B92 in section 10"]
B105["Continue at B106 in section 11"]
B51["Continue at B52 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL WSTR
```

### B42

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
ACALL SHOW2
```

### B45

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B46

```asm
ACALL DELAY
```

### B47

```asm
ACALL DELAY
```

### B48

```asm
MOV A,R2
CJNE A,#1,YEAR
```

### B49

```asm
MOV A,#35
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
SJMP EEND
```

### B50

```asm
CJNE A,#2, EEND
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 141 to 145"]
B51["B52: EEND - lines 148 to 148"]
B52["B53: ONLINE - lines 151 to 152"]
B53["B54: instructions - lines 153 to 153"]
B54["B55: instructions - lines 155 to 156"]
B55["B56: instructions - lines 157 to 158"]
B56["B57: instructions - lines 159 to 159"]
B57["B58: instructions - lines 161 to 162"]
B58["B59: instructions - lines 163 to 163"]
B59["B60: instructions - lines 165 to 165"]
B50 -->|next| B51
B52 -->|call| B85
B52 -->|after return| B53
B53 -->|call| B100
B53 -->|after return| B54
B54 -->|call| B85
B54 -->|after return| B55
B55 -->|call| B91
B55 -->|after return| B56
B56 -->|call| B128
B56 -->|after return| B57
B57 -->|call| B85
B57 -->|after return| B58
B58 -->|call| B100
B58 -->|after return| B59
B59 -->|call| B91
B59 -->|after return| B60
B85["Continue at B86 in section 9"]
B100["Continue at B101 in section 11"]
B91["Continue at B92 in section 10"]
B128["Continue at B129 in section 13"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#99
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

```asm
MOV DPTR,#MESG7
ACALL SHOW
```

### B54

```asm
acall delay
```

### B55

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B56

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B57

```asm
ACALL WSTR
```

### B58

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B59

```asm
ACALL DELAY
```

### B60

```asm
ACALL SHOW2
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 166 to 168"]
B61["B62: instructions - lines 169 to 169"]
B62["B63: instructions - lines 170 to 170"]
B63["B64: instructions - lines 172 to 173"]
B64["B65: instructions - lines 174 to 179"]
B65["B66: YEAR1 - lines 182 to 182"]
B66["B67: instructions - lines 183 to 187"]
B67["B68: END1 - lines 190 to 190"]
B68["B69: REGULAR - lines 193 to 194"]
B69["B70: instructions - lines 195 to 195"]
B60 -->|call| B105
B60 -->|after return| B61
B61 -->|call| B100
B61 -->|after return| B62
B62 -->|call| B100
B62 -->|after return| B63
B63 -->|condition true| B65
B63 -->|condition false| B64
B64 -->|jump| B67
B65 -->|condition true| B67
B65 -->|condition false| B66
B66 -->|next| B67
B68 -->|call| B85
B68 -->|after return| B69
B69 -->|call| B100
B69 -->|after return| B70
B105["Continue at B106 in section 11"]
B100["Continue at B101 in section 11"]
B85["Continue at B86 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
ACALL DELAY
```

### B64

```asm
MOV A,R2
CJNE A,#1,YEAR1
```

### B65

```asm
MOV A,#5
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
SJMP END1
```

### B66

```asm
CJNE A,#2, END1
```

### B67

```asm
MOV A,#30
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
```

### B68

Return to the instruction following the active call.

```asm
RET
```

### B69

```asm
MOV DPTR,#MESG8
ACALL SHOW
```

### B70

```asm
acall delay
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 197 to 198"]
B71["B72: instructions - lines 199 to 200"]
B72["B73: instructions - lines 201 to 201"]
B73["B74: instructions - lines 203 to 204"]
B74["B75: instructions - lines 205 to 205"]
B75["B76: instructions - lines 207 to 207"]
B76["B77: instructions - lines 208 to 210"]
B77["B78: instructions - lines 211 to 211"]
B78["B79: instructions - lines 212 to 212"]
B79["B80: instructions - lines 214 to 215"]
B70 -->|call| B85
B70 -->|after return| B71
B71 -->|call| B91
B71 -->|after return| B72
B72 -->|call| B128
B72 -->|after return| B73
B73 -->|call| B85
B73 -->|after return| B74
B74 -->|call| B100
B74 -->|after return| B75
B75 -->|call| B91
B75 -->|after return| B76
B76 -->|call| B105
B76 -->|after return| B77
B77 -->|call| B100
B77 -->|after return| B78
B78 -->|call| B100
B78 -->|after return| B79
B79 -->|condition true| B81
B79 -->|condition false| B80
B85["Continue at B86 in section 9"]
B91["Continue at B92 in section 10"]
B128["Continue at B129 in section 13"]
B100["Continue at B101 in section 11"]
B105["Continue at B106 in section 11"]
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B72

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B73

```asm
ACALL WSTR
```

### B74

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B75

```asm
ACALL DELAY
```

### B76

```asm
ACALL SHOW2
```

### B77

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
ACALL DELAY
```

### B80

```asm
MOV A,R2
CJNE A,#1,YEAR2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 216 to 221"]
B81["B82: YEAR2 - lines 224 to 224"]
B82["B83: instructions - lines 225 to 229"]
B83["B84: END2 - lines 232 to 232"]
B84["B85: WRONG - lines 235 to 237"]
B85["B86: SHOW - lines 240 to 240"]
B86["B87: instructions - lines 241 to 241"]
B87["B88: instructions - lines 242 to 243"]
B88["B89: instructions - lines 245 to 245"]
B89["B90: instructions - lines 246 to 246"]
B80 -->|jump| B83
B81 -->|condition true| B83
B81 -->|condition false| B82
B82 -->|next| B83
B85 -->|call| B123
B85 -->|after return| B86
B86 -->|call| B100
B86 -->|after return| B87
B87 -->|call| B110
B87 -->|after return| B88
B88 -->|call| B128
B88 -->|after return| B89
B89 -->|call| B100
B89 -->|after return| B90
B123["Continue at B124 in section 13"]
B100["Continue at B101 in section 11"]
B110["Continue at B111 in section 12"]
B128["Continue at B129 in section 13"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,#10
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
SJMP END2
```

### B82

```asm
CJNE A,#2, END2
```

### B83

```asm
MOV A,#70
MOV B,31H
MUL AB
MOV 32H,A
MOV 33H,B
```

### B84

Return to the instruction following the active call.

```asm
RET
```

### B85

Return to the instruction following the active call.

```asm
MOV 32H,#0
MOV 33H,#0
RET
```

### B86

```asm
ACALL CLEAR
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A,#80H
ACALL CMD
```

### B89

```asm
ACALL WSTR
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 248 to 248"]
B91["B92: SHOW2 - lines 251 to 252"]
B92["B93: instructions - lines 253 to 253"]
B93["B94: instructions - lines 254 to 254"]
B94["B95: instructions - lines 255 to 255"]
B95["B96: instructions - lines 256 to 256"]
B96["B97: SHOW3 - lines 259 to 260"]
B97["B98: instructions - lines 261 to 261"]
B98["B99: instructions - lines 262 to 262"]
B99["B100: instructions - lines 263 to 263"]
B91 -->|call| B110
B91 -->|after return| B92
B92 -->|call| B100
B92 -->|after return| B93
B93 -->|call| B100
B93 -->|after return| B94
B94 -->|call| B100
B94 -->|after return| B95
B96 -->|call| B110
B96 -->|after return| B97
B97 -->|call| B100
B97 -->|after return| B98
B98 -->|call| B100
B98 -->|after return| B99
B110["Continue at B111 in section 12"]
B100["Continue at B101 in section 11"]
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

```asm
MOV A,#0C0H
ACALL CMD
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
ACALL DELAY
```

### B95

```asm
ACALL DELAY
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
MOV A,#0C5H
ACALL CMD
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
B100["B101: DELAY - lines 265 to 265"]
B101["B102: H1 - lines 266 to 266"]
B102["B103: HH - lines 267 to 267"]
B103["B104: instructions - lines 268 to 268"]
B104["B105: instructions - lines 269 to 269"]
B105["B106: WCHR - lines 273 to 277"]
B106["B107: instructions - lines 278 to 278"]
B107["B108: instructions - lines 279 to 281"]
B108["B109: instructions - lines 282 to 282"]
B109["B110: instructions - lines 283 to 285"]
B100 -->|next| B101
B101 -->|next| B102
B102 -->|condition true| B102
B102 -->|condition false| B103
B103 -->|condition true| B101
B103 -->|condition false| B104
B105 -->|call| B115
B105 -->|after return| B106
B106 -->|call| B121
B106 -->|after return| B107
B107 -->|call| B115
B107 -->|after return| B108
B108 -->|call| B121
B108 -->|after return| B109
B115["Continue at B116 in section 12"]
B121["Continue at B122 in section 13"]
```

### B101

```asm
MOV R0, #250
```

### B102

```asm
MOV R1,#20
```

### B103

```asm
DJNZ R1, HH
```

### B104

```asm
DJNZ R0,H1
```

### B105

Return to the instruction following the active call.

```asm
RET
```

### B106

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B107

```asm
ACALL LDELAY
```

### B108

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B109

```asm
ACALL LDELAY
```

### B110

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 12

```mermaid
flowchart TD
B110["B111: CMD - lines 288 to 290"]
B111["B112: instructions - lines 291 to 291"]
B112["B113: instructions - lines 292 to 294"]
B113["B114: instructions - lines 295 to 295"]
B114["B115: instructions - lines 296 to 296"]
B115["B116: COMMON - lines 299 to 304"]
B116["B117: INLCD - lines 307 to 314"]
B117["B118: instructions - lines 315 to 323"]
B118["B119: instructions - lines 324 to 336"]
B119["B120: instructions - lines 337 to 347"]
B110 -->|call| B115
B110 -->|after return| B111
B111 -->|call| B121
B111 -->|after return| B112
B112 -->|call| B115
B112 -->|after return| B113
B113 -->|call| B121
B113 -->|after return| B114
B116 -->|call| B121
B116 -->|after return| B117
B117 -->|call| B121
B117 -->|after return| B118
B118 -->|call| B121
B118 -->|after return| B119
B119 -->|call| B121
B119 -->|after return| B120
B121["Continue at B122 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B112

```asm
ACALL LDELAY
```

### B113

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B114

```asm
ACALL LDELAY
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B117

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

### B118

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

### B119

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

### B120

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

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 348 to 348"]
B121["B122: LDELAY - lines 351 to 352"]
B122["B123: instructions - lines 353 to 353"]
B123["B124: CLEAR - lines 356 to 357"]
B124["B125: instructions - lines 358 to 358"]
B125["B126: WAIT - lines 359 to 359"]
B126["B127: instructions - lines 360 to 360"]
B127["B128: instructions - lines 361 to 361"]
B128["B129: WSTR - lines 364 to 364"]
B129["B130: CONT1 - lines 366 to 368"]
B121 -->|condition true| B121
B121 -->|condition false| B122
B123 -->|call| B110
B123 -->|after return| B124
B124 -->|next| B125
B125 -->|call| B121
B125 -->|after return| B126
B126 -->|condition true| B125
B126 -->|condition false| B127
B128 -->|next| B129
B129 -->|condition true| B132
B129 -->|condition false| B130
B110["Continue at B111 in section 12"]
B132["Continue at B133 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
RET
```

### B122

```asm
MOV R0, #50
DJNZ R0, $
```

### B123

Return to the instruction following the active call.

```asm
RET
```

### B124

```asm
MOV A,#01H
ACALL CMD
```

### B125

```asm
MOV R7,#14
```

### B126

```asm
ACALL LDELAY
```

### B127

```asm
DJNZ R7,WAIT
```

### B128

Return to the instruction following the active call.

```asm
ret
```

### B129

```asm
PUSH    ACC
```

### B130

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 14

```mermaid
flowchart TD
B130["B131: PRINT - lines 370 to 370"]
B131["B132: instructions - lines 371 to 372"]
B132["B133: EXIT1 - lines 373 to 374"]
B130 -->|call| B105
B130 -->|after return| B131
B131 -->|jump| B129
B105["Continue at B106 in section 11"]
B129["Continue at B130 in section 13"]
```

### B131

```asm
ACALL    WCHR
```

### B132

```asm
INC DPTR
AJMP    CONT1
```

### B133

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
