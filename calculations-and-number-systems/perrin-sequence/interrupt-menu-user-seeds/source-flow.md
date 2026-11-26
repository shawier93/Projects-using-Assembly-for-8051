# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 11 to 11"]
B1["B2: instructions - lines 13 to 13"]
B2["B3: MAIN - lines 16 to 19"]
B3["B4: instructions - lines 20 to 21"]
B4["B5: instructions - lines 22 to 22"]
B5["B6: instructions - lines 24 to 24"]
B6["B7: instructions - lines 26 to 27"]
B7["B8: instructions - lines 28 to 28"]
B8["B9: instructions - lines 29 to 29"]
B9["B10: EX01SR - lines 35 to 35"]
B0 -->|jump| B2
B1 -->|jump| B9
B2 -->|call| B148
B2 -->|after return| B3
B3 -->|call| B176
B3 -->|after return| B4
B4 -->|call| B130
B4 -->|after return| B5
B5 -->|call| B142
B5 -->|after return| B6
B6 -->|call| B176
B6 -->|after return| B7
B7 -->|call| B130
B7 -->|after return| B8
B8 -->|jump| B8
B9 -->|next| B10
B148["Continue at B149 in section 15"]
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
B142["Continue at B143 in section 15"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
LJMP EX01SR
```

### B3

```asm
MOV IE,#10000001B
SETB IT0
ACALL INLCD
```

### B4

```asm
MOV DPTR,#B12
ACALL WSTR
```

### B5

```asm
ACALL TIME
```

### B6

```asm
ACALL LINE2
```

### B7

```asm
MOV DPTR,#B13
ACALL WSTR
```

### B8

```asm
ACALL TIME
```

### B9

```asm
SJMP $
```

### B10

```asm
MOV R0,#20H
```

## Section 2

```mermaid
flowchart TD
B10["B11: MENU - lines 38 to 38"]
B11["B12: instructions - lines 40 to 41"]
B12["B13: instructions - lines 42 to 42"]
B13["B14: instructions - lines 44 to 44"]
B14["B15: instructions - lines 46 to 47"]
B15["B16: instructions - lines 48 to 48"]
B16["B17: instructions - lines 50 to 50"]
B17["B18: instructions - lines 52 to 53"]
B18["B19: instructions - lines 54 to 54"]
B19["B20: instructions - lines 58 to 58"]
B10 -->|call| B145
B10 -->|after return| B11
B11 -->|call| B176
B11 -->|after return| B12
B12 -->|call| B130
B12 -->|after return| B13
B13 -->|call| B142
B13 -->|after return| B14
B14 -->|call| B176
B14 -->|after return| B15
B15 -->|call| B130
B15 -->|after return| B16
B16 -->|call| B145
B16 -->|after return| B17
B17 -->|call| B176
B17 -->|after return| B18
B18 -->|call| B130
B18 -->|after return| B19
B19 -->|call| B188
B19 -->|after return| B20
B145["Continue at B146 in section 15"]
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
B142["Continue at B143 in section 15"]
B188["Continue at B189 in section 19"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL CLCD
```

### B12

```asm
MOV DPTR,#B1
ACALL WSTR
```

### B13

```asm
ACALL TIME
```

### B14

```asm
ACALL LINE2
```

### B15

```asm
MOV DPTR,#B2
ACALL WSTR
```

### B16

```asm
ACALL TIME
```

### B17

```asm
ACALL CLCD
```

### B18

```asm
MOV DPTR,#B3
ACALL WSTR
```

### B19

```asm
ACALL TIME
```

### B20

```asm
ACALL KEYPAD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 59 to 59"]
B21["B22: instructions - lines 60 to 63"]
B22["B23: instructions - lines 65 to 65"]
B23["B24: FUNCTION1 - lines 67 to 67"]
B24["B25: instructions - lines 68 to 68"]
B25["B26: instructions - lines 69 to 69"]
B26["B27: instructions - lines 70 to 70"]
B27["B28: FUNCTION2 - lines 73 to 73"]
B28["B29: instructions - lines 74 to 74"]
B29["B30: instructions - lines 75 to 75"]
B20 -->|call| B171
B20 -->|after return| B21
B21 -->|call| B142
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|condition true| B27
B23 -->|condition false| B24
B24 -->|call| B136
B24 -->|after return| B25
B25 -->|call| B42
B25 -->|after return| B26
B27 -->|condition true| B31
B27 -->|condition false| B28
B28 -->|call| B136
B28 -->|after return| B29
B29 -->|call| B66
B29 -->|after return| B30
B171["Continue at B172 in section 18"]
B142["Continue at B143 in section 15"]
B136["Continue at B137 in section 14"]
B42["Continue at B43 in section 5"]
B31["Continue at B32 in section 4"]
B66["Continue at B67 in section 7"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL WCHR
```

### B22

```asm
SUBB A,#30H
MOV 66H,A
ACALL LINE2
```

### B23

```asm
MOV A,66H
```

### B24

```asm
CJNE A,#1,FUNCTION2
```

### B25

```asm
ACALL GLED
```

### B26

```asm
ACALL OPTION1
```

### B27

Resume the interrupted program.

```asm
RETI
```

### B28

```asm
CJNE A,#2,FUNCTION3
```

### B29

```asm
ACALL GLED
```

### B30

```asm
ACALL OPTION2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 76 to 76"]
B31["B32: FUNCTION3 - lines 79 to 79"]
B32["B33: instructions - lines 80 to 80"]
B33["B34: instructions - lines 81 to 82"]
B34["B35: instructions - lines 83 to 83"]
B35["B36: instructions - lines 85 to 85"]
B36["B37: instructions - lines 87 to 87"]
B37["B38: WRONG - lines 91 to 91"]
B38["B39: instructions - lines 93 to 94"]
B39["B40: instructions - lines 95 to 95"]
B31 -->|condition true| B37
B31 -->|condition false| B32
B32 -->|call| B136
B32 -->|after return| B33
B33 -->|call| B176
B33 -->|after return| B34
B34 -->|call| B130
B34 -->|after return| B35
B35 -->|call| B145
B35 -->|after return| B36
B37 -->|call| B134
B37 -->|after return| B38
B38 -->|call| B176
B38 -->|after return| B39
B39 -->|call| B130
B39 -->|after return| B40
B136["Continue at B137 in section 14"]
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
B145["Continue at B146 in section 15"]
B134["Continue at B135 in section 14"]
B40["Continue at B41 in section 5"]
```

### B31

Resume the interrupted program.

```asm
RETI
```

### B32

```asm
CJNE A,#3,WRONG
```

### B33

```asm
ACALL GLED
```

### B34

```asm
MOV DPTR,#B10
ACALL WSTR
```

### B35

```asm
ACALL TIME
```

### B36

```asm
ACALL CLCD
```

### B37

Resume the interrupted program.

```asm
RETI
```

### B38

```asm
ACALL RLED
```

### B39

```asm
MOV DPTR,#B6
ACALL WSTR
```

### B40

```asm
ACALL TIME
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 97 to 97"]
B41["B42: instructions - lines 98 to 98"]
B42["B43: OPTION1 - lines 102 to 103"]
B43["B44: instructions - lines 104 to 104"]
B44["B45: instructions - lines 106 to 106"]
B45["B46: instructions - lines 108 to 109"]
B46["B47: instructions - lines 110 to 110"]
B47["B48: instructions - lines 112 to 115"]
B48["B49: instructions - lines 116 to 117"]
B49["B50: instructions - lines 118 to 124"]
B40 -->|call| B145
B40 -->|after return| B41
B41 -->|jump| B10
B42 -->|call| B176
B42 -->|after return| B43
B43 -->|call| B130
B43 -->|after return| B44
B44 -->|call| B145
B44 -->|after return| B45
B45 -->|call| B176
B45 -->|after return| B46
B46 -->|call| B130
B46 -->|after return| B47
B47 -->|call| B188
B47 -->|after return| B48
B48 -->|call| B171
B48 -->|after return| B49
B49 -->|call| B188
B49 -->|after return| B50
B145["Continue at B146 in section 15"]
B10["Continue at B11 in section 2"]
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
B188["Continue at B189 in section 19"]
B171["Continue at B172 in section 18"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL CLCD
```

### B42

```asm
SJMP MENU
```

### B43

```asm
MOV DPTR,#B4
ACALL WSTR
```

### B44

```asm
ACALL TIME
```

### B45

```asm
ACALL CLCD
```

### B46

```asm
MOV DPTR,#B5
ACALL WSTR
```

### B47

```asm
ACALL TIME
```

### B48

```asm
MOV R7,#6
ACALL KEYPAD
```

### B49

```asm
MOV 30H,A
ACALL WCHR
```

### B50

```asm
SUBB A,#30H
MOV @R0,A
INC R0
ACALL KEYPAD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 125 to 126"]
B51["B52: instructions - lines 127 to 132"]
B52["B53: instructions - lines 133 to 134"]
B53["B54: instructions - lines 135 to 139"]
B54["B55: instructions - lines 141 to 142"]
B55["B56: instructions - lines 144 to 145"]
B56["B57: instructions - lines 147 to 148"]
B57["B58: instructions - lines 150 to 151"]
B58["B59: instructions - lines 153 to 154"]
B59["B60: instructions - lines 156 to 157"]
B50 -->|call| B171
B50 -->|after return| B51
B51 -->|call| B188
B51 -->|after return| B52
B52 -->|call| B171
B52 -->|after return| B53
B53 -->|call| B142
B53 -->|after return| B54
B54 -->|call| B171
B54 -->|after return| B55
B55 -->|call| B171
B55 -->|after return| B56
B56 -->|call| B171
B56 -->|after return| B57
B57 -->|call| B171
B57 -->|after return| B58
B58 -->|call| B171
B58 -->|after return| B59
B59 -->|call| B171
B59 -->|after return| B60
B171["Continue at B172 in section 18"]
B188["Continue at B189 in section 19"]
B142["Continue at B143 in section 15"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV 31H,A
ACALL WCHR
```

### B52

```asm
SUBB A,#30H
MOV @R0,A
INC R0
ACALL KEYPAD
```

### B53

```asm
MOV 32H,A
ACALL WCHR
```

### B54

```asm
SUBB A,#30H
MOV @R0,A
ACALL LINE2
```

### B55

```asm
MOV A,30H
ACALL WCHR
```

### B56

```asm
MOV A,#' '
ACALL WCHR
```

### B57

```asm
MOV A,31H
ACALL WCHR
```

### B58

```asm
MOV A,#' '
ACALL WCHR
```

### B59

```asm
MOV A,32H
ACALL WCHR
```

### B60

```asm
MOV A,#' '
ACALL WCHR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 159 to 159"]
B61["B62: LOOP - lines 161 to 168"]
B62["B63: instructions - lines 169 to 169"]
B63["B64: instructions - lines 170 to 170"]
B64["B65: instructions - lines 171 to 173"]
B65["B66: instructions - lines 174 to 174"]
B66["B67: OPTION2 - lines 177 to 178"]
B67["B68: instructions - lines 179 to 179"]
B68["B69: OPTION2X - lines 182 to 182"]
B69["B70: instructions - lines 184 to 185"]
B60 -->|next| B61
B61 -->|call| B117
B61 -->|after return| B62
B62 -->|call| B130
B62 -->|after return| B63
B63 -->|call| B130
B63 -->|after return| B64
B64 -->|condition true| B61
B64 -->|condition false| B65
B66 -->|call| B176
B66 -->|after return| B67
B67 -->|call| B130
B67 -->|after return| B68
B68 -->|call| B145
B68 -->|after return| B69
B69 -->|call| B176
B69 -->|after return| B70
B117["Continue at B118 in section 12"]
B130["Continue at B131 in section 14"]
B176["Continue at B177 in section 18"]
B145["Continue at B146 in section 15"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV R0,#20H
```

### B62

```asm
MOV A,@R0
INC R0
MOV B,@R0
INC R0
INC R0
ADD A,B
MOV @R0,A
ACALL WRITE
```

### B63

```asm
ACALL TIME
```

### B64

```asm
ACALL TIME
```

### B65

```asm
DEC R0
DEC R0
DJNZ R7,LOOP
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
MOV DPTR,#B7
ACALL WSTR
```

### B68

```asm
ACALL TIME
```

### B69

```asm
ACALL CLCD
```

### B70

```asm
MOV DPTR,#B5
ACALL WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 186 to 186"]
B71["B72: instructions - lines 189 to 189"]
B72["B73: instructions - lines 190 to 190"]
B73["B74: instructions - lines 191 to 197"]
B74["B75: instructions - lines 198 to 198"]
B75["B76: instructions - lines 199 to 204"]
B76["B77: instructions - lines 205 to 205"]
B77["B78: instructions - lines 206 to 210"]
B78["B79: instructions - lines 212 to 213"]
B79["B80: instructions - lines 214 to 214"]
B70 -->|call| B130
B70 -->|after return| B71
B71 -->|call| B188
B71 -->|after return| B72
B72 -->|call| B171
B72 -->|after return| B73
B73 -->|call| B188
B73 -->|after return| B74
B74 -->|call| B171
B74 -->|after return| B75
B75 -->|call| B188
B75 -->|after return| B76
B76 -->|call| B171
B76 -->|after return| B77
B77 -->|call| B142
B77 -->|after return| B78
B78 -->|call| B176
B78 -->|after return| B79
B79 -->|call| B130
B79 -->|after return| B80
B130["Continue at B131 in section 14"]
B188["Continue at B189 in section 19"]
B171["Continue at B172 in section 18"]
B142["Continue at B143 in section 15"]
B176["Continue at B177 in section 18"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL TIME
```

### B72

```asm
ACALL KEYPAD
```

### B73

```asm
ACALL WCHR
```

### B74

```asm
SUBB A,#30H
MOV @R0,A
INC R0
ACALL KEYPAD
```

### B75

```asm
ACALL WCHR
```

### B76

```asm
SUBB A,#30H
MOV @R0,A
INC R0
ACALL KEYPAD
```

### B77

```asm
ACALL WCHR
```

### B78

```asm
SUBB A,#30H
MOV @R0,A
ACALL LINE2
```

### B79

```asm
MOV DPTR,#B8
ACALL WSTR
```

### B80

```asm
ACALL TIME
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 216 to 216"]
B81["B82: instructions - lines 217 to 217"]
B82["B83: instructions - lines 218 to 220"]
B83["B84: instructions - lines 221 to 221"]
B84["B85: instructions - lines 223 to 229"]
B85["B86: instructions - lines 231 to 231"]
B86["B87: instructions - lines 233 to 233"]
B87["B88: LOOP2 - lines 235 to 244"]
B88["B89: instructions - lines 245 to 248"]
B89["B90: instructions - lines 249 to 249"]
B80 -->|call| B188
B80 -->|after return| B81
B81 -->|call| B171
B81 -->|after return| B82
B82 -->|call| B130
B82 -->|after return| B83
B83 -->|call| B130
B83 -->|after return| B84
B84 -->|call| B145
B84 -->|after return| B85
B85 -->|call| B95
B85 -->|after return| B86
B86 -->|next| B87
B87 -->|condition true| B87
B87 -->|condition false| B88
B88 -->|call| B176
B88 -->|after return| B89
B89 -->|call| B130
B89 -->|after return| B90
B188["Continue at B189 in section 19"]
B171["Continue at B172 in section 18"]
B130["Continue at B131 in section 14"]
B145["Continue at B146 in section 15"]
B95["Continue at B96 in section 10"]
B176["Continue at B177 in section 18"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL KEYPAD
```

### B82

```asm
ACALL WCHR
```

### B83

```asm
SUBB A,#30H
MOV 30H,A
ACALL TIME
```

### B84

```asm
ACALL TIME
```

### B85

```asm
MOV R1,#30H
MOV A,30H
SUBB A,#3
MOV R7,A
ACALL CLCD
```

### B86

```asm
ACALL CHECK
```

### B87

```asm
MOV R0,#20H
```

### B88

```asm
MOV A,@R0
INC R0
MOV B,@R0
INC R0
INC R0
ADD A,B
MOV @R0,A
DEC R0
DEC R0
DJNZ R7,LOOP2
```

### B89

```asm
MOV @R1,A
MOV DPTR,#B9
ACALL WSTR
```

### B90

```asm
ACALL TIME
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 252 to 253"]
B91["B92: instructions - lines 254 to 254"]
B92["B93: instructions - lines 255 to 255"]
B93["B94: instructions - lines 256 to 256"]
B94["B95: instructions - lines 258 to 258"]
B95["B96: CHECK - lines 261 to 262"]
B96["B97: instructions - lines 263 to 263"]
B97["B98: instructions - lines 264 to 264"]
B98["B99: S - lines 266 to 266"]
B99["B100: instructions - lines 267 to 269"]
B90 -->|call| B117
B90 -->|after return| B91
B91 -->|call| B130
B91 -->|after return| B92
B92 -->|call| B130
B92 -->|after return| B93
B93 -->|call| B145
B93 -->|after return| B94
B95 -->|condition true| B98
B95 -->|condition false| B96
B96 -->|call| B138
B96 -->|after return| B97
B97 -->|jump| B68
B98 -->|condition true| B104
B98 -->|condition false| B99
B99 -->|call| B176
B99 -->|after return| B100
B117["Continue at B118 in section 12"]
B130["Continue at B131 in section 14"]
B145["Continue at B146 in section 15"]
B138["Continue at B139 in section 14"]
B68["Continue at B69 in section 7"]
B104["Continue at B105 in section 11"]
B176["Continue at B177 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,@R1
ACALL WRITE
```

### B92

```asm
ACALL TIME
```

### B93

```asm
ACALL TIME
```

### B94

```asm
ACALL CLCD
```

### B95

Return to the instruction following the active call.

```asm
RET
```

### B96

```asm
MOV A,30H
CJNE A,#0,S
```

### B97

```asm
ACALL YLED
```

### B98

```asm
AJMP OPTION2X
```

### B99

```asm
CJNE A,#1,S2
```

### B100

```asm
MOV @R1,20H
MOV DPTR,#B9
ACALL WSTR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 270 to 270"]
B101["B102: instructions - lines 273 to 274"]
B102["B103: instructions - lines 275 to 275"]
B103["B104: instructions - lines 276 to 276"]
B104["B105: S2 - lines 278 to 278"]
B105["B106: instructions - lines 279 to 281"]
B106["B107: instructions - lines 282 to 282"]
B107["B108: instructions - lines 285 to 286"]
B108["B109: instructions - lines 287 to 287"]
B109["B110: instructions - lines 288 to 288"]
B100 -->|call| B130
B100 -->|after return| B101
B101 -->|call| B117
B101 -->|after return| B102
B102 -->|call| B145
B102 -->|after return| B103
B103 -->|jump| B10
B104 -->|condition true| B110
B104 -->|condition false| B105
B105 -->|call| B176
B105 -->|after return| B106
B106 -->|call| B130
B106 -->|after return| B107
B107 -->|call| B117
B107 -->|after return| B108
B108 -->|call| B145
B108 -->|after return| B109
B109 -->|jump| B10
B130["Continue at B131 in section 14"]
B117["Continue at B118 in section 12"]
B145["Continue at B146 in section 15"]
B10["Continue at B11 in section 2"]
B110["Continue at B111 in section 12"]
B176["Continue at B177 in section 18"]
```

### B101

```asm
ACALL TIME
```

### B102

```asm
MOV A,@R1
ACALL WRITE
```

### B103

```asm
ACALL CLCD
```

### B104

```asm
AJMP MENU
```

### B105

```asm
CJNE A,#2,S3
```

### B106

```asm
MOV @R1,21H
MOV DPTR,#B9
ACALL WSTR
```

### B107

```asm
ACALL TIME
```

### B108

```asm
MOV A,@R1
ACALL WRITE
```

### B109

```asm
ACALL CLCD
```

### B110

```asm
AJMP MENU
```

## Section 12

```mermaid
flowchart TD
B110["B111: S3 - lines 290 to 290"]
B111["B112: instructions - lines 291 to 293"]
B112["B113: instructions - lines 294 to 294"]
B113["B114: instructions - lines 297 to 298"]
B114["B115: instructions - lines 299 to 299"]
B115["B116: instructions - lines 300 to 300"]
B116["B117: S4 - lines 301 to 301"]
B117["B118: WRITE - lines 305 to 305"]
B118["B119: X - lines 307 to 307"]
B119["B120: instructions - lines 308 to 311"]
B110 -->|condition true| B116
B110 -->|condition false| B111
B111 -->|call| B176
B111 -->|after return| B112
B112 -->|call| B130
B112 -->|after return| B113
B113 -->|call| B117
B113 -->|after return| B114
B114 -->|call| B145
B114 -->|after return| B115
B115 -->|jump| B10
B117 -->|condition true| B118
B117 -->|condition false| B118
B118 -->|condition true| B122
B118 -->|condition false| B119
B119 -->|call| B171
B119 -->|after return| B120
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
B145["Continue at B146 in section 15"]
B10["Continue at B11 in section 2"]
B122["Continue at B123 in section 13"]
B171["Continue at B172 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
CJNE A,#3,S4
```

### B112

```asm
MOV @R1,22H
MOV DPTR,#B9
ACALL WSTR
```

### B113

```asm
ACALL TIME
```

### B114

```asm
MOV A,@R1
ACALL WRITE
```

### B115

```asm
ACALL CLCD
```

### B116

```asm
AJMP MENU
```

### B117

Return to the instruction following the active call.

```asm
RET
```

### B118

```asm
CJNE A,#10,X
```

### B119

```asm
JC ONE
```

### B120

```asm
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 312 to 312"]
B121["B122: instructions - lines 313 to 313"]
B122["B123: ONE - lines 315 to 316"]
B123["B124: instructions - lines 317 to 317"]
B124["B125: instructions - lines 319 to 320"]
B125["B126: instructions - lines 321 to 321"]
B126["B127: instructions - lines 322 to 322"]
B127["B128: T - lines 325 to 328"]
B128["B129: BACK - lines 330 to 330"]
B129["B130: instructions - lines 331 to 333"]
B120 -->|call| B181
B120 -->|after return| B121
B121 -->|next| B122
B122 -->|call| B171
B122 -->|after return| B123
B123 -->|call| B181
B123 -->|after return| B124
B124 -->|call| B171
B124 -->|after return| B125
B125 -->|call| B181
B125 -->|after return| B126
B127 -->|next| B128
B128 -->|condition true| B128
B128 -->|condition false| B129
B181["Continue at B182 in section 19"]
B171["Continue at B172 in section 18"]
```

### B121

```asm
ACALL LDELAY
```

### B122

```asm
MOV A,B
```

### B123

```asm
ADD A,#30H
ACALL WCHR
```

### B124

```asm
ACALL LDELAY
```

### B125

```asm
MOV A,#' '
ACALL WCHR
```

### B126

```asm
ACALL LDELAY
```

### B127

Return to the instruction following the active call.

```asm
RET
```

### B128

```asm
MOV TMOD,#21H
MOV TL0,#0EEH
MOV TH0,#0B7H
SETB TR0
```

### B129

```asm
JNB TF0,BACK
```

### B130

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

## Section 14

```mermaid
flowchart TD
B130["B131: TIME - lines 336 to 336"]
B131["B132: T2 - lines 337 to 337"]
B132["B133: instructions - lines 338 to 338"]
B133["B134: instructions - lines 339 to 339"]
B134["B135: RLED - lines 342 to 343"]
B135["B136: instructions - lines 344 to 345"]
B136["B137: GLED - lines 348 to 349"]
B137["B138: instructions - lines 350 to 351"]
B138["B139: YLED - lines 354 to 355"]
B139["B140: instructions - lines 356 to 356"]
B130 -->|next| B131
B131 -->|call| B127
B131 -->|after return| B132
B132 -->|condition true| B131
B132 -->|condition false| B133
B134 -->|call| B130
B134 -->|after return| B135
B136 -->|call| B130
B136 -->|after return| B137
B138 -->|call| B130
B138 -->|after return| B139
B139 -->|call| B130
B139 -->|after return| B140
B127["Continue at B128 in section 13"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV R6,#200
```

### B132

```asm
ACALL T
```

### B133

```asm
DJNZ R6,T2
```

### B134

Return to the instruction following the active call.

```asm
RET
```

### B135

```asm
CLR R
ACALL TIME
```

### B136

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B137

```asm
CLR G
ACALL TIME
```

### B138

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B139

```asm
CLR Y
ACALL TIME
```

### B140

```asm
ACALL TIME
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 357 to 357"]
B141["B142: instructions - lines 358 to 359"]
B142["B143: LINE2 - lines 362 to 363"]
B143["B144: instructions - lines 364 to 364"]
B144["B145: instructions - lines 365 to 365"]
B145["B146: CLCD - lines 368 to 369"]
B146["B147: instructions - lines 370 to 370"]
B147["B148: instructions - lines 371 to 371"]
B148["B149: INLCD - lines 376 to 377"]
B149["B150: WAIT - lines 379 to 379"]
B140 -->|call| B130
B140 -->|after return| B141
B142 -->|call| B168
B142 -->|after return| B143
B143 -->|call| B130
B143 -->|after return| B144
B145 -->|call| B168
B145 -->|after return| B146
B146 -->|call| B130
B146 -->|after return| B147
B148 -->|next| B149
B149 -->|call| B181
B149 -->|after return| B150
B130["Continue at B131 in section 14"]
B168["Continue at B169 in section 17"]
B181["Continue at B182 in section 19"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL TIME
```

### B142

Return to the instruction following the active call.

```asm
SETB Y
RET
```

### B143

```asm
MOV A,#0C0H
ACALL CMD
```

### B144

```asm
ACALL TIME
```

### B145

Return to the instruction following the active call.

```asm
RET
```

### B146

```asm
MOV A,#1
ACALL CMD
```

### B147

```asm
ACALL TIME
```

### B148

Return to the instruction following the active call.

```asm
RET
```

### B149

```asm
PUSH 7
MOV R7,#20
```

### B150

```asm
ACALL LDELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 380 to 380"]
B151["B152: instructions - lines 382 to 384"]
B152["B153: instructions - lines 385 to 385"]
B153["B154: instructions - lines 386 to 387"]
B154["B155: instructions - lines 388 to 389"]
B155["B156: instructions - lines 390 to 391"]
B156["B157: instructions - lines 392 to 393"]
B157["B158: instructions - lines 394 to 395"]
B158["B159: instructions - lines 396 to 397"]
B159["B160: instructions - lines 398 to 399"]
B150 -->|condition true| B149
B150 -->|condition false| B151
B151 -->|call| B168
B151 -->|after return| B152
B152 -->|call| B181
B152 -->|after return| B153
B153 -->|call| B168
B153 -->|after return| B154
B154 -->|call| B168
B154 -->|after return| B155
B155 -->|call| B168
B155 -->|after return| B156
B156 -->|call| B168
B156 -->|after return| B157
B157 -->|call| B168
B157 -->|after return| B158
B158 -->|call| B168
B158 -->|after return| B159
B159 -->|call| B168
B159 -->|after return| B160
B149["Continue at B150 in section 15"]
B168["Continue at B169 in section 17"]
B181["Continue at B182 in section 19"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
DJNZ R7,WAIT
```

### B152

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B153

```asm
ACALL LDELAY
```

### B154

```asm
MOV A,#0011B
ACALL CMD
```

### B155

```asm
MOV A,#0011B
ACALL CMD
```

### B156

```asm
MOV A,#0010B
ACALL CMD
```

### B157

```asm
MOV A,#0010B
ACALL CMD
```

### B158

```asm
MOV A,#1000B
ACALL CMD
```

### B159

```asm
MOV A,#0000B
ACALL CMD
```

### B160

```asm
MOV A,#1000B
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 400 to 401"]
B161["B162: instructions - lines 402 to 403"]
B162["B163: instructions - lines 404 to 404"]
B163["B164: instructions - lines 405 to 406"]
B164["B165: instructions - lines 407 to 408"]
B165["B166: instructions - lines 409 to 410"]
B166["B167: instructions - lines 411 to 412"]
B167["B168: instructions - lines 414 to 415"]
B168["B169: CMD - lines 419 to 425"]
B169["B170: instructions - lines 426 to 427"]
B160 -->|call| B168
B160 -->|after return| B161
B161 -->|call| B168
B161 -->|after return| B162
B162 -->|call| B181
B162 -->|after return| B163
B163 -->|call| B168
B163 -->|after return| B164
B164 -->|call| B168
B164 -->|after return| B165
B165 -->|call| B168
B165 -->|after return| B166
B166 -->|call| B168
B166 -->|after return| B167
B168 -->|call| B174
B168 -->|after return| B169
B169 -->|call| B174
B169 -->|after return| B170
B181["Continue at B182 in section 19"]
B174["Continue at B175 in section 18"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#0
ACALL CMD
```

### B162

```asm
MOV A,#0001B
ACALL CMD
```

### B163

```asm
ACALL LDELAY
```

### B164

```asm
MOV A,#0000B
ACALL CMD
```

### B165

```asm
MOV A,#0110B
ACALL CMD
```

### B166

```asm
MOV A,#0000B
ACALL CMD
```

### B167

```asm
MOV A,#1111B
ACALL CMD
```

### B168

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B169

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B170

```asm
MOV A,B
ACALL COMMON
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 429 to 431"]
B171["B172: WCHR - lines 434 to 440"]
B172["B173: instructions - lines 441 to 442"]
B173["B174: instructions - lines 444 to 446"]
B174["B175: COMMON - lines 449 to 456"]
B175["B176: instructions - lines 457 to 457"]
B176["B177: WSTR - lines 460 to 460"]
B177["B178: CONT1 - lines 462 to 464"]
B178["B179: instructions - lines 465 to 465"]
B179["B180: instructions - lines 466 to 467"]
B171 -->|call| B174
B171 -->|after return| B172
B172 -->|call| B174
B172 -->|after return| B173
B174 -->|call| B181
B174 -->|after return| B175
B176 -->|next| B177
B177 -->|condition true| B180
B177 -->|condition false| B178
B178 -->|call| B171
B178 -->|after return| B179
B179 -->|jump| B177
B181["Continue at B182 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B172

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B173

```asm
MOV A,B
ACALL COMMON
```

### B174

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B175

```asm
CLR RW
SWAP A
ANL A,#11110000B
ANL P0,#00000111B
ORL P0,A
SETB EN
CLR EN
ACALL LDELAY
```

### B176

Return to the instruction following the active call.

```asm
RET
```

### B177

```asm
PUSH ACC
```

### B178

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B179

```asm
ACALL WCHR
```

### B180

```asm
INC DPTR
AJMP CONT1
```

## Section 19

```mermaid
flowchart TD
B180["B181: EXIT1 - lines 469 to 470"]
B181["B182: LDELAY - lines 473 to 475"]
B182["B183: CON4 - lines 477 to 478"]
B183["B184: instructions - lines 479 to 479"]
B184["B185: instructions - lines 480 to 482"]
B185["B186: FINISH - lines 501 to 502"]
B186["B187: instructions - lines 503 to 503"]
B187["B188: instructions - lines 504 to 504"]
B188["B189: KEYPAD - lines 507 to 507"]
B189["B190: K1 - lines 508 to 511"]
B181 -->|next| B182
B182 -->|condition true| B182
B182 -->|condition false| B183
B183 -->|condition true| B182
B183 -->|condition false| B184
B185 -->|call| B176
B185 -->|after return| B186
B186 -->|call| B130
B186 -->|after return| B187
B187 -->|jump| B187
B188 -->|next| B189
B189 -->|condition true| B189
B189 -->|condition false| B190
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
B190["Continue at B191 in section 20"]
```

### B181

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B182

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B183

```asm
MOV R0,#250
DJNZ R0,$
```

### B184

```asm
DJNZ R1,CON4
```

### B185

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B186

```asm
MOV DPTR,#B11
ACALL WSTR
```

### B187

```asm
ACALL TIME
```

### B188

```asm
AJMP $
```

### B189

```asm
MOV P2,#11110000B
```

### B190

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

## Section 20

```mermaid
flowchart TD
B190["B191: K2 - lines 512 to 512"]
B191["B192: instructions - lines 513 to 515"]
B192["B193: instructions - lines 516 to 516"]
B193["B194: OVER - lines 518 to 518"]
B194["B195: instructions - lines 519 to 521"]
B195["B196: instructions - lines 522 to 522"]
B196["B197: OVER1 - lines 524 to 527"]
B197["B198: instructions - lines 528 to 531"]
B198["B199: instructions - lines 532 to 535"]
B199["B200: instructions - lines 536 to 539"]
B190 -->|call| B209
B190 -->|after return| B191
B191 -->|condition true| B193
B191 -->|condition false| B192
B192 -->|jump| B190
B193 -->|call| B209
B193 -->|after return| B194
B194 -->|condition true| B196
B194 -->|condition false| B195
B195 -->|jump| B190
B196 -->|condition true| B201
B196 -->|condition false| B197
B197 -->|condition true| B202
B197 -->|condition false| B198
B198 -->|condition true| B203
B198 -->|condition false| B199
B199 -->|condition true| B204
B199 -->|condition false| B200
B209["Continue at B210 in section 21"]
B201["Continue at B202 in section 21"]
B202["Continue at B203 in section 21"]
B203["Continue at B204 in section 21"]
B204["Continue at B205 in section 21"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
ACALL TMSEC
```

### B192

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B193

```asm
SJMP K2
```

### B194

```asm
ACALL TMSEC
```

### B195

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B196

```asm
SJMP K2
```

### B197

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B198

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B199

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B200

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 540 to 540"]
B201["B202: ROW_0 - lines 541 to 542"]
B202["B203: ROW_1 - lines 543 to 544"]
B203["B204: ROW_2 - lines 545 to 546"]
B204["B205: ROW_3 - lines 547 to 547"]
B205["B206: FIND - lines 549 to 549"]
B206["B207: FIND1 - lines 551 to 552"]
B207["B208: instructions - lines 553 to 554"]
B208["B209: MATCH - lines 556 to 558"]
B209["B210: TMSEC - lines 563 to 566"]
B200 -->|jump| B190
B201 -->|jump| B205
B202 -->|jump| B205
B203 -->|jump| B205
B204 -->|next| B205
B205 -->|next| B206
B206 -->|condition true| B208
B206 -->|condition false| B207
B207 -->|jump| B206
B209 -->|next| B210
B190["Continue at B191 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
LJMP K2
```

### B202

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B203

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B204

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B205

```asm
MOV DPTR,#KCODE3
```

### B206

```asm
SWAP A
```

### B207

```asm
RRC A
JNC MATCH
```

### B208

```asm
INC DPTR
SJMP FIND1
```

### B209

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B210

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

## Section 22

```mermaid
flowchart TD
B210["B211: BACK8 - lines 567 to 567"]
B211["B212: instructions - lines 568 to 570"]
B210 -->|condition true| B210
B210 -->|condition false| B211
```

### B211

```asm
JNB TF0,BACK8
```

### B212

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```
