# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 17"]
B2["B3: instructions - lines 18 to 19"]
B3["B4: instructions - lines 23 to 24"]
B4["B5: instructions - lines 26 to 27"]
B5["B6: instructions - lines 28 to 28"]
B6["B7: instructions - lines 31 to 32"]
B7["B8: instructions - lines 34 to 35"]
B8["B9: instructions - lines 36 to 36"]
B9["B10: START - lines 41 to 42"]
B0 -->|call| B140
B0 -->|after return| B1
B1 -->|call| B107
B1 -->|after return| B2
B2 -->|call| B107
B2 -->|after return| B3
B3 -->|call| B84
B3 -->|after return| B4
B4 -->|call| B94
B4 -->|after return| B5
B5 -->|call| B152
B5 -->|after return| B6
B6 -->|call| B84
B6 -->|after return| B7
B7 -->|call| B94
B7 -->|after return| B8
B8 -->|call| B152
B8 -->|after return| B9
B9 -->|call| B84
B9 -->|after return| B10
B140["Continue at B141 in section 15"]
B107["Continue at B108 in section 11"]
B84["Continue at B85 in section 9"]
B94["Continue at B95 in section 10"]
B152["Continue at B153 in section 16"]
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
B10["B11: instructions - lines 43 to 43"]
B11["B12: instructions - lines 45 to 45"]
B12["B13: instructions - lines 46 to 46"]
B13["B14: instructions - lines 47 to 47"]
B14["B15: instructions - lines 48 to 48"]
B15["B16: instructions - lines 49 to 55"]
B16["B17: instructions - lines 56 to 56"]
B17["B18: instructions - lines 57 to 57"]
B18["B19: NEXT - lines 59 to 59"]
B19["B20: instructions - lines 60 to 60"]
B10 -->|call| B107
B10 -->|after return| B11
B11 -->|call| B94
B11 -->|after return| B12
B12 -->|call| B112
B12 -->|after return| B13
B13 -->|call| B129
B13 -->|after return| B14
B14 -->|call| B107
B14 -->|after return| B15
B15 -->|condition true| B18
B15 -->|condition false| B16
B16 -->|call| B35
B16 -->|after return| B17
B17 -->|jump| B26
B18 -->|condition true| B21
B18 -->|condition false| B19
B19 -->|call| B51
B19 -->|after return| B20
B107["Continue at B108 in section 11"]
B94["Continue at B95 in section 10"]
B112["Continue at B113 in section 12"]
B129["Continue at B130 in section 13"]
B35["Continue at B36 in section 4"]
B26["Continue at B27 in section 3"]
B21["Continue at B22 in section 3"]
B51["Continue at B52 in section 6"]
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
ACALL KEYPAD
```

### B14

```asm
ACALL WCHR
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
SUBB A,#30H
MOV 30H,A
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
B20["B21: instructions - lines 61 to 61"]
B21["B22: NEXT1 - lines 63 to 63"]
B22["B23: instructions - lines 64 to 64"]
B23["B24: instructions - lines 65 to 65"]
B24["B25: NEXT2 - lines 68 to 68"]
B25["B26: instructions - lines 69 to 69"]
B26["B27: DISPCOST - lines 72 to 73"]
B27["B28: instructions - lines 74 to 74"]
B28["B29: instructions - lines 76 to 76"]
B29["B30: instructions - lines 77 to 96"]
B20 -->|jump| B26
B21 -->|condition true| B24
B21 -->|condition false| B22
B22 -->|call| B67
B22 -->|after return| B23
B23 -->|jump| B26
B24 -->|call| B83
B24 -->|after return| B25
B25 -->|jump| B26
B26 -->|call| B84
B26 -->|after return| B27
B27 -->|call| B107
B27 -->|after return| B28
B28 -->|call| B94
B28 -->|after return| B29
B29 -->|call| B129
B29 -->|after return| B30
B67["Continue at B68 in section 7"]
B83["Continue at B84 in section 9"]
B84["Continue at B85 in section 9"]
B107["Continue at B108 in section 11"]
B94["Continue at B95 in section 10"]
B129["Continue at B130 in section 13"]
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
B30["B31: instructions - lines 97 to 98"]
B31["B32: instructions - lines 99 to 100"]
B32["B33: instructions - lines 101 to 102"]
B33["B34: instructions - lines 103 to 103"]
B34["B35: instructions - lines 104 to 104"]
B35["B36: VIP - lines 111 to 112"]
B36["B37: instructions - lines 113 to 113"]
B37["B38: instructions - lines 115 to 116"]
B38["B39: instructions - lines 117 to 118"]
B39["B40: instructions - lines 119 to 119"]
B30 -->|call| B129
B30 -->|after return| B31
B31 -->|call| B129
B31 -->|after return| B32
B32 -->|call| B129
B32 -->|after return| B33
B33 -->|call| B107
B33 -->|after return| B34
B34 -->|call| B107
B34 -->|after return| B35
B35 -->|call| B84
B35 -->|after return| B36
B36 -->|call| B107
B36 -->|after return| B37
B37 -->|call| B84
B37 -->|after return| B38
B38 -->|call| B94
B38 -->|after return| B39
B39 -->|call| B152
B39 -->|after return| B40
B129["Continue at B130 in section 13"]
B107["Continue at B108 in section 11"]
B84["Continue at B85 in section 9"]
B94["Continue at B95 in section 10"]
B152["Continue at B153 in section 16"]
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
MOV DPTR,#MESG6
ACALL SHOW
```

### B37

```asm
acall delay
```

### B38

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B39

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B40

```asm
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 121 to 122"]
B41["B42: instructions - lines 123 to 123"]
B42["B43: instructions - lines 125 to 125"]
B43["B44: instructions - lines 126 to 126"]
B44["B45: instructions - lines 127 to 127"]
B45["B46: instructions - lines 128 to 128"]
B46["B47: instructions - lines 129 to 134"]
B47["B48: instructions - lines 135 to 137"]
B48["B49: YEAR - lines 140 to 140"]
B49["B50: instructions - lines 141 to 142"]
B40 -->|call| B84
B40 -->|after return| B41
B41 -->|call| B107
B41 -->|after return| B42
B42 -->|call| B94
B42 -->|after return| B43
B43 -->|call| B112
B43 -->|after return| B44
B44 -->|call| B129
B44 -->|after return| B45
B45 -->|call| B107
B45 -->|after return| B46
B46 -->|condition true| B48
B46 -->|condition false| B47
B47 -->|jump| B50
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|next| B50
B84["Continue at B85 in section 9"]
B107["Continue at B108 in section 11"]
B94["Continue at B95 in section 10"]
B112["Continue at B113 in section 12"]
B129["Continue at B130 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B42

```asm
ACALL DELAY
```

### B43

```asm
ACALL SHOW2
```

### B44

```asm
ACALL KEYPAD
```

### B45

```asm
ACALL WCHR
```

### B46

```asm
ACALL DELAY
```

### B47

```asm
SUBB A,#30H
MOV 31H,A
MOV A,31H
CJNE A,#1,YEAR
```

### B48

```asm
MOV A,#35
MOV 32H,A
SJMP EEND
```

### B49

```asm
CJNE A,#2, EEND
```

### B50

```asm
MOV A,#99
MOV 32H,A
```

## Section 6

```mermaid
flowchart TD
B50["B51: EEND - lines 146 to 146"]
B51["B52: ONLINE - lines 149 to 150"]
B52["B53: instructions - lines 151 to 151"]
B53["B54: instructions - lines 153 to 154"]
B54["B55: instructions - lines 155 to 156"]
B55["B56: instructions - lines 157 to 157"]
B56["B57: instructions - lines 159 to 160"]
B57["B58: instructions - lines 161 to 161"]
B58["B59: instructions - lines 163 to 163"]
B59["B60: instructions - lines 164 to 164"]
B51 -->|call| B84
B51 -->|after return| B52
B52 -->|call| B107
B52 -->|after return| B53
B53 -->|call| B84
B53 -->|after return| B54
B54 -->|call| B94
B54 -->|after return| B55
B55 -->|call| B152
B55 -->|after return| B56
B56 -->|call| B84
B56 -->|after return| B57
B57 -->|call| B107
B57 -->|after return| B58
B58 -->|call| B94
B58 -->|after return| B59
B59 -->|call| B112
B59 -->|after return| B60
B84["Continue at B85 in section 9"]
B107["Continue at B108 in section 11"]
B94["Continue at B95 in section 10"]
B152["Continue at B153 in section 16"]
B112["Continue at B113 in section 12"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

```asm
MOV DPTR,#MESG7
ACALL SHOW
```

### B53

```asm
acall delay
```

### B54

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B55

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B56

```asm
ACALL WSTR
```

### B57

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
ACALL SHOW2
```

### B60

```asm
ACALL KEYPAD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 165 to 165"]
B61["B62: instructions - lines 166 to 166"]
B62["B63: instructions - lines 167 to 171"]
B63["B64: instructions - lines 172 to 175"]
B64["B65: YEAR1 - lines 178 to 178"]
B65["B66: instructions - lines 179 to 180"]
B66["B67: END1 - lines 184 to 184"]
B67["B68: REGULAR - lines 187 to 188"]
B68["B69: instructions - lines 189 to 189"]
B69["B70: instructions - lines 191 to 192"]
B60 -->|call| B129
B60 -->|after return| B61
B61 -->|call| B107
B61 -->|after return| B62
B62 -->|condition true| B64
B62 -->|condition false| B63
B63 -->|jump| B66
B64 -->|condition true| B66
B64 -->|condition false| B65
B65 -->|next| B66
B67 -->|call| B84
B67 -->|after return| B68
B68 -->|call| B107
B68 -->|after return| B69
B69 -->|call| B84
B69 -->|after return| B70
B129["Continue at B130 in section 13"]
B107["Continue at B108 in section 11"]
B84["Continue at B85 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL WCHR
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
SUBB A,#30H
MOV 31H,A
MOV A,31H
CJNE A,#1,YEAR1
```

### B64

```asm
MOV A,#5
MOV 32H,A
SJMP END1
```

### B65

```asm
CJNE A,#2, END1
```

### B66

```asm
MOV A,#30
MOV 32H,A
```

### B67

Return to the instruction following the active call.

```asm
RET
```

### B68

```asm
MOV DPTR,#MESG8
ACALL SHOW
```

### B69

```asm
acall delay
```

### B70

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 193 to 194"]
B71["B72: instructions - lines 195 to 195"]
B72["B73: instructions - lines 197 to 198"]
B73["B74: instructions - lines 199 to 199"]
B74["B75: instructions - lines 201 to 201"]
B75["B76: instructions - lines 202 to 202"]
B76["B77: instructions - lines 203 to 203"]
B77["B78: instructions - lines 204 to 204"]
B78["B79: instructions - lines 205 to 209"]
B79["B80: instructions - lines 210 to 213"]
B70 -->|call| B94
B70 -->|after return| B71
B71 -->|call| B152
B71 -->|after return| B72
B72 -->|call| B84
B72 -->|after return| B73
B73 -->|call| B107
B73 -->|after return| B74
B74 -->|call| B94
B74 -->|after return| B75
B75 -->|call| B112
B75 -->|after return| B76
B76 -->|call| B129
B76 -->|after return| B77
B77 -->|call| B107
B77 -->|after return| B78
B78 -->|condition true| B80
B78 -->|condition false| B79
B79 -->|jump| B82
B94["Continue at B95 in section 10"]
B152["Continue at B153 in section 16"]
B84["Continue at B85 in section 9"]
B107["Continue at B108 in section 11"]
B112["Continue at B113 in section 12"]
B129["Continue at B130 in section 13"]
B80["Continue at B81 in section 9"]
B82["Continue at B83 in section 9"]
```

### B71

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B72

```asm
ACALL WSTR
```

### B73

```asm
MOV DPTR,#MESG10
ACALL SHOW
```

### B74

```asm
ACALL DELAY
```

### B75

```asm
ACALL SHOW2
```

### B76

```asm
ACALL KEYPAD
```

### B77

```asm
ACALL WCHR
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
SUBB A,#30H
MOV 31H,A
MOV A,31H
CJNE A,#1,YEAR2
```

### B80

```asm
MOV A,#10
MOV 32H,A
SJMP END2
```

## Section 9

```mermaid
flowchart TD
B80["B81: YEAR2 - lines 216 to 216"]
B81["B82: instructions - lines 217 to 218"]
B82["B83: END2 - lines 221 to 221"]
B83["B84: WRONG - lines 224 to 226"]
B84["B85: SHOW - lines 229 to 229"]
B85["B86: instructions - lines 230 to 230"]
B86["B87: instructions - lines 231 to 231"]
B87["B88: instructions - lines 232 to 232"]
B88["B89: instructions - lines 233 to 234"]
B89["B90: instructions - lines 236 to 236"]
B80 -->|condition true| B82
B80 -->|condition false| B81
B81 -->|next| B82
B84 -->|call| B107
B84 -->|after return| B85
B85 -->|call| B107
B85 -->|after return| B86
B86 -->|call| B147
B86 -->|after return| B87
B87 -->|call| B107
B87 -->|after return| B88
B88 -->|call| B134
B88 -->|after return| B89
B89 -->|call| B152
B89 -->|after return| B90
B107["Continue at B108 in section 11"]
B147["Continue at B148 in section 15"]
B134["Continue at B135 in section 14"]
B152["Continue at B153 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CJNE A,#2, END2
```

### B82

```asm
MOV A,#70
MOV 32H,A
```

### B83

Return to the instruction following the active call.

```asm
RET
```

### B84

Return to the instruction following the active call.

```asm
MOV 32H,#0
MOV 33H,#0
RET
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
ACALL DELAY
```

### B87

```asm
ACALL CLEAR
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
MOV A,#80H
ACALL CMD
```

### B90

```asm
ACALL WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 237 to 237"]
B91["B92: instructions - lines 238 to 238"]
B92["B93: instructions - lines 239 to 239"]
B93["B94: instructions - lines 240 to 240"]
B94["B95: SHOW2 - lines 243 to 244"]
B95["B96: instructions - lines 245 to 245"]
B96["B97: instructions - lines 246 to 246"]
B97["B98: instructions - lines 247 to 247"]
B98["B99: instructions - lines 248 to 248"]
B99["B100: instructions - lines 249 to 249"]
B90 -->|call| B107
B90 -->|after return| B91
B91 -->|call| B107
B91 -->|after return| B92
B92 -->|call| B107
B92 -->|after return| B93
B94 -->|call| B134
B94 -->|after return| B95
B95 -->|call| B107
B95 -->|after return| B96
B96 -->|call| B107
B96 -->|after return| B97
B97 -->|call| B107
B97 -->|after return| B98
B98 -->|call| B107
B98 -->|after return| B99
B99 -->|call| B107
B99 -->|after return| B100
B107["Continue at B108 in section 11"]
B134["Continue at B135 in section 14"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL DELAY
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
ACALL DELAY
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
MOV A,#0C0H
ACALL CMD
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

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 250 to 250"]
B101["B102: SHOW3 - lines 253 to 254"]
B102["B103: instructions - lines 255 to 255"]
B103["B104: instructions - lines 256 to 256"]
B104["B105: instructions - lines 257 to 257"]
B105["B106: instructions - lines 258 to 258"]
B106["B107: instructions - lines 259 to 259"]
B107["B108: DELAY - lines 261 to 261"]
B108["B109: H1 - lines 262 to 262"]
B109["B110: HH - lines 263 to 263"]
B101 -->|call| B134
B101 -->|after return| B102
B102 -->|call| B107
B102 -->|after return| B103
B103 -->|call| B107
B103 -->|after return| B104
B104 -->|call| B107
B104 -->|after return| B105
B105 -->|call| B107
B105 -->|after return| B106
B107 -->|next| B108
B108 -->|next| B109
B109 -->|condition true| B109
B109 -->|condition false| B110
B134["Continue at B135 in section 14"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
MOV A,#0C5H
ACALL CMD
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

```asm
ACALL DELAY
```

### B106

```asm
ACALL DELAY
```

### B107

Return to the instruction following the active call.

```asm
RET
```

### B108

```asm
MOV R0, #250
```

### B109

```asm
MOV R1,#20
```

### B110

```asm
DJNZ R1, HH
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 264 to 264"]
B111["B112: instructions - lines 265 to 265"]
B112["B113: KEYPAD - lines 269 to 269"]
B113["B114: K1 - lines 270 to 273"]
B114["B115: K2 - lines 275 to 277"]
B115["B116: instructions - lines 278 to 278"]
B116["B117: OVER1 - lines 280 to 283"]
B117["B118: instructions - lines 284 to 287"]
B118["B119: instructions - lines 288 to 291"]
B119["B120: instructions - lines 292 to 295"]
B110 -->|condition true| B108
B110 -->|condition false| B111
B112 -->|next| B113
B113 -->|condition true| B113
B113 -->|condition false| B114
B114 -->|condition true| B116
B114 -->|condition false| B115
B115 -->|jump| B114
B116 -->|condition true| B121
B116 -->|condition false| B117
B117 -->|condition true| B122
B117 -->|condition false| B118
B118 -->|condition true| B123
B118 -->|condition false| B119
B119 -->|condition true| B124
B119 -->|condition false| B120
B108["Continue at B109 in section 11"]
B121["Continue at B122 in section 13"]
B122["Continue at B123 in section 13"]
B123["Continue at B124 in section 13"]
B124["Continue at B125 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
DJNZ R0,H1
```

### B112

Return to the instruction following the active call.

```asm
RET
```

### B113

```asm
MOV P0,#01110000B
```

### B114

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B115

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B116

```asm
SJMP K2
```

### B117

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B118

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B119

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B120

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 296 to 296"]
B121["B122: ROW_0 - lines 297 to 298"]
B122["B123: ROW_1 - lines 299 to 300"]
B123["B124: ROW_2 - lines 301 to 302"]
B124["B125: ROW_3 - lines 303 to 303"]
B125["B126: FIND - lines 305 to 305"]
B126["B127: FIND1 - lines 307 to 308"]
B127["B128: instructions - lines 309 to 310"]
B128["B129: MATCH - lines 311 to 313"]
B129["B130: WCHR - lines 316 to 320"]
B120 -->|jump| B114
B121 -->|jump| B125
B122 -->|jump| B125
B123 -->|jump| B125
B124 -->|next| B125
B125 -->|next| B126
B126 -->|condition true| B128
B126 -->|condition false| B127
B127 -->|jump| B126
B129 -->|call| B139
B129 -->|after return| B130
B114["Continue at B115 in section 12"]
B139["Continue at B140 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
LJMP K2
```

### B122

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B123

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B124

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B125

```asm
MOV DPTR,#KCODE3
```

### B126

```asm
RLC A
```

### B127

```asm
RLC A
JNC MATCH
```

### B128

```asm
INC DPTR
SJMP FIND1
```

### B129

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B130

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 321 to 321"]
B131["B132: instructions - lines 322 to 324"]
B132["B133: instructions - lines 325 to 325"]
B133["B134: instructions - lines 326 to 328"]
B134["B135: CMD - lines 331 to 333"]
B135["B136: instructions - lines 334 to 334"]
B136["B137: instructions - lines 335 to 337"]
B137["B138: instructions - lines 338 to 338"]
B138["B139: instructions - lines 339 to 339"]
B139["B140: COMMON - lines 342 to 347"]
B130 -->|call| B145
B130 -->|after return| B131
B131 -->|call| B139
B131 -->|after return| B132
B132 -->|call| B145
B132 -->|after return| B133
B134 -->|call| B139
B134 -->|after return| B135
B135 -->|call| B145
B135 -->|after return| B136
B136 -->|call| B139
B136 -->|after return| B137
B137 -->|call| B145
B137 -->|after return| B138
B145["Continue at B146 in section 15"]
```

### B131

```asm
ACALL LDELAY
```

### B132

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B133

```asm
ACALL LDELAY
```

### B134

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B135

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B136

```asm
ACALL LDELAY
```

### B137

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B138

```asm
ACALL LDELAY
```

### B139

Return to the instruction following the active call.

```asm
RET
```

### B140

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: INLCD - lines 350 to 357"]
B141["B142: instructions - lines 358 to 366"]
B142["B143: instructions - lines 367 to 379"]
B143["B144: instructions - lines 380 to 390"]
B144["B145: instructions - lines 391 to 391"]
B145["B146: LDELAY - lines 394 to 395"]
B146["B147: instructions - lines 396 to 396"]
B147["B148: CLEAR - lines 399 to 400"]
B148["B149: instructions - lines 401 to 401"]
B149["B150: WAIT - lines 402 to 402"]
B140 -->|call| B145
B140 -->|after return| B141
B141 -->|call| B145
B141 -->|after return| B142
B142 -->|call| B145
B142 -->|after return| B143
B143 -->|call| B145
B143 -->|after return| B144
B145 -->|condition true| B145
B145 -->|condition false| B146
B147 -->|call| B134
B147 -->|after return| B148
B148 -->|next| B149
B149 -->|call| B145
B149 -->|after return| B150
B134["Continue at B135 in section 14"]
B150["Continue at B151 in section 16"]
```

### B141

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

### B142

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

### B143

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

### B144

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

### B145

Return to the instruction following the active call.

```asm
RET
```

### B146

```asm
MOV R0, #50
DJNZ R0, $
```

### B147

Return to the instruction following the active call.

```asm
RET
```

### B148

```asm
MOV A,#01H
ACALL CMD
```

### B149

```asm
MOV R7,#14
```

### B150

```asm
ACALL LDELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 403 to 403"]
B151["B152: instructions - lines 404 to 404"]
B152["B153: WSTR - lines 407 to 407"]
B153["B154: CONT1 - lines 409 to 411"]
B154["B155: PRINT - lines 413 to 413"]
B155["B156: instructions - lines 414 to 415"]
B156["B157: EXIT1 - lines 416 to 417"]
B150 -->|condition true| B149
B150 -->|condition false| B151
B152 -->|next| B153
B153 -->|condition true| B156
B153 -->|condition false| B154
B154 -->|call| B129
B154 -->|after return| B155
B155 -->|jump| B153
B149["Continue at B150 in section 15"]
B129["Continue at B130 in section 13"]
```

### B151

```asm
DJNZ R7,WAIT
```

### B152

Return to the instruction following the active call.

```asm
ret
```

### B153

```asm
PUSH    ACC
```

### B154

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B155

```asm
ACALL    WCHR
```

### B156

```asm
INC DPTR
AJMP    CONT1
```

### B157

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
