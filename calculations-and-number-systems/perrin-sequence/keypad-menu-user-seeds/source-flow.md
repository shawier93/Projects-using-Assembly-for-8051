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
B0["B1: instructions - lines 12 to 12"]
B1["B2: instructions - lines 14 to 17"]
B2["B3: instructions - lines 18 to 18"]
B3["B4: instructions - lines 20 to 20"]
B4["B5: instructions - lines 22 to 23"]
B5["B6: instructions - lines 24 to 24"]
B6["B7: instructions - lines 26 to 26"]
B7["B8: instructions - lines 28 to 29"]
B8["B9: instructions - lines 30 to 30"]
B9["B10: instructions - lines 32 to 32"]
B0 -->|call| B144
B0 -->|after return| B1
B1 -->|call| B172
B1 -->|after return| B2
B2 -->|call| B126
B2 -->|after return| B3
B3 -->|call| B138
B3 -->|after return| B4
B4 -->|call| B172
B4 -->|after return| B5
B5 -->|call| B126
B5 -->|after return| B6
B6 -->|call| B141
B6 -->|after return| B7
B7 -->|call| B172
B7 -->|after return| B8
B8 -->|call| B126
B8 -->|after return| B9
B9 -->|call| B138
B9 -->|after return| B10
B144["Continue at B145 in section 15"]
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B138["Continue at B139 in section 14"]
B141["Continue at B142 in section 15"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV R0,#20H
MOV DPTR,#B12
ACALL WSTR
```

### B3

```asm
ACALL TIME
```

### B4

```asm
ACALL LINE2
```

### B5

```asm
MOV DPTR,#B13
ACALL WSTR
```

### B6

```asm
ACALL TIME
```

### B7

```asm
ACALL CLCD
```

### B8

```asm
MOV DPTR,#B14
ACALL WSTR
```

### B9

```asm
ACALL TIME
```

### B10

```asm
ACALL LINE2
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 34 to 35"]
B11["B12: instructions - lines 36 to 36"]
B12["B13: MENU - lines 41 to 41"]
B13["B14: instructions - lines 43 to 44"]
B14["B15: instructions - lines 45 to 45"]
B15["B16: instructions - lines 47 to 47"]
B16["B17: instructions - lines 49 to 50"]
B17["B18: instructions - lines 51 to 51"]
B18["B19: instructions - lines 53 to 53"]
B19["B20: instructions - lines 55 to 56"]
B10 -->|call| B172
B10 -->|after return| B11
B11 -->|call| B126
B11 -->|after return| B12
B12 -->|call| B141
B12 -->|after return| B13
B13 -->|call| B172
B13 -->|after return| B14
B14 -->|call| B126
B14 -->|after return| B15
B15 -->|call| B138
B15 -->|after return| B16
B16 -->|call| B172
B16 -->|after return| B17
B17 -->|call| B126
B17 -->|after return| B18
B18 -->|call| B141
B18 -->|after return| B19
B19 -->|call| B172
B19 -->|after return| B20
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B141["Continue at B142 in section 15"]
B138["Continue at B139 in section 14"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#B15
ACALL WSTR
```

### B12

```asm
ACALL TIME
```

### B13

```asm
ACALL CLCD
```

### B14

```asm
MOV DPTR,#B1
ACALL WSTR
```

### B15

```asm
ACALL TIME
```

### B16

```asm
ACALL LINE2
```

### B17

```asm
MOV DPTR,#B2
ACALL WSTR
```

### B18

```asm
ACALL TIME
```

### B19

```asm
ACALL CLCD
```

### B20

```asm
MOV DPTR,#B3
ACALL WSTR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 57 to 57"]
B21["B22: instructions - lines 61 to 61"]
B22["B23: instructions - lines 62 to 62"]
B23["B24: instructions - lines 63 to 66"]
B24["B25: instructions - lines 68 to 68"]
B25["B26: FUNCTION1 - lines 70 to 70"]
B26["B27: instructions - lines 71 to 71"]
B27["B28: instructions - lines 72 to 72"]
B28["B29: instructions - lines 73 to 73"]
B29["B30: FUNCTION2 - lines 76 to 76"]
B20 -->|call| B126
B20 -->|after return| B21
B21 -->|call| B184
B21 -->|after return| B22
B22 -->|call| B167
B22 -->|after return| B23
B23 -->|call| B138
B23 -->|after return| B24
B24 -->|next| B25
B25 -->|condition true| B29
B25 -->|condition false| B26
B26 -->|call| B132
B26 -->|after return| B27
B27 -->|call| B44
B27 -->|after return| B28
B28 -->|jump| B12
B29 -->|condition true| B33
B29 -->|condition false| B30
B126["Continue at B127 in section 13"]
B184["Continue at B185 in section 19"]
B167["Continue at B168 in section 17"]
B138["Continue at B139 in section 14"]
B132["Continue at B133 in section 14"]
B44["Continue at B45 in section 5"]
B12["Continue at B13 in section 2"]
B33["Continue at B34 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL TIME
```

### B22

```asm
ACALL KEYPAD
```

### B23

```asm
ACALL WCHR
```

### B24

```asm
SUBB A,#30H
MOV 66H,A
ACALL LINE2
```

### B25

```asm
MOV A,66H
```

### B26

```asm
CJNE A,#1,FUNCTION2
```

### B27

```asm
ACALL GLED
```

### B28

```asm
ACALL OPTION1
```

### B29

```asm
SJMP MENU
```

### B30

```asm
CJNE A,#2,FUNCTION3
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 77 to 77"]
B31["B32: instructions - lines 78 to 78"]
B32["B33: instructions - lines 79 to 79"]
B33["B34: FUNCTION3 - lines 82 to 82"]
B34["B35: instructions - lines 83 to 83"]
B35["B36: instructions - lines 84 to 85"]
B36["B37: instructions - lines 86 to 86"]
B37["B38: instructions - lines 88 to 88"]
B38["B39: instructions - lines 90 to 90"]
B39["B40: WRONG - lines 94 to 94"]
B30 -->|call| B132
B30 -->|after return| B31
B31 -->|call| B62
B31 -->|after return| B32
B32 -->|jump| B12
B33 -->|condition true| B39
B33 -->|condition false| B34
B34 -->|call| B132
B34 -->|after return| B35
B35 -->|call| B172
B35 -->|after return| B36
B36 -->|call| B126
B36 -->|after return| B37
B37 -->|call| B141
B37 -->|after return| B38
B38 -->|jump| B181
B39 -->|call| B130
B39 -->|after return| B40
B132["Continue at B133 in section 14"]
B62["Continue at B63 in section 7"]
B12["Continue at B13 in section 2"]
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B141["Continue at B142 in section 15"]
B181["Continue at B182 in section 19"]
B130["Continue at B131 in section 14"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL GLED
```

### B32

```asm
ACALL OPTION2
```

### B33

```asm
SJMP MENU
```

### B34

```asm
CJNE A,#3,WRONG
```

### B35

```asm
ACALL GLED
```

### B36

```asm
MOV DPTR,#B10
ACALL WSTR
```

### B37

```asm
ACALL TIME
```

### B38

```asm
ACALL CLCD
```

### B39

```asm
AJMP FINISH
```

### B40

```asm
ACALL RLED
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 96 to 97"]
B41["B42: instructions - lines 98 to 98"]
B42["B43: instructions - lines 100 to 100"]
B43["B44: instructions - lines 101 to 101"]
B44["B45: OPTION1 - lines 105 to 106"]
B45["B46: instructions - lines 107 to 107"]
B46["B47: instructions - lines 109 to 109"]
B47["B48: instructions - lines 111 to 112"]
B48["B49: instructions - lines 113 to 113"]
B49["B50: instructions - lines 115 to 118"]
B40 -->|call| B172
B40 -->|after return| B41
B41 -->|call| B126
B41 -->|after return| B42
B42 -->|call| B141
B42 -->|after return| B43
B43 -->|jump| B12
B44 -->|call| B172
B44 -->|after return| B45
B45 -->|call| B126
B45 -->|after return| B46
B46 -->|call| B141
B46 -->|after return| B47
B47 -->|call| B172
B47 -->|after return| B48
B48 -->|call| B126
B48 -->|after return| B49
B49 -->|call| B184
B49 -->|after return| B50
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B141["Continue at B142 in section 15"]
B12["Continue at B13 in section 2"]
B184["Continue at B185 in section 19"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR,#B6
ACALL WSTR
```

### B42

```asm
ACALL TIME
```

### B43

```asm
ACALL CLCD
```

### B44

```asm
SJMP MENU
```

### B45

```asm
MOV DPTR,#B4
ACALL WSTR
```

### B46

```asm
ACALL TIME
```

### B47

```asm
ACALL CLCD
```

### B48

```asm
MOV DPTR,#B5
ACALL WSTR
```

### B49

```asm
ACALL TIME
```

### B50

```asm
MOV R7,#6
ACALL KEYPAD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 119 to 119"]
B51["B52: instructions - lines 120 to 126"]
B52["B53: instructions - lines 127 to 127"]
B53["B54: instructions - lines 128 to 133"]
B54["B55: instructions - lines 134 to 134"]
B55["B56: instructions - lines 135 to 139"]
B56["B57: instructions - lines 141 to 141"]
B57["B58: LOOP - lines 143 to 150"]
B58["B59: instructions - lines 151 to 151"]
B59["B60: instructions - lines 152 to 152"]
B50 -->|call| B167
B50 -->|after return| B51
B51 -->|call| B184
B51 -->|after return| B52
B52 -->|call| B167
B52 -->|after return| B53
B53 -->|call| B184
B53 -->|after return| B54
B54 -->|call| B167
B54 -->|after return| B55
B55 -->|call| B138
B55 -->|after return| B56
B56 -->|next| B57
B57 -->|call| B113
B57 -->|after return| B58
B58 -->|call| B126
B58 -->|after return| B59
B59 -->|call| B126
B59 -->|after return| B60
B167["Continue at B168 in section 17"]
B184["Continue at B185 in section 19"]
B138["Continue at B139 in section 14"]
B113["Continue at B114 in section 12"]
B126["Continue at B127 in section 13"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
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
ACALL WCHR
```

### B54

```asm
SUBB A,#30H
MOV @R0,A
INC R0
ACALL KEYPAD
```

### B55

```asm
ACALL WCHR
```

### B56

```asm
SUBB A,#30H
MOV @R0,A
ACALL LINE2
```

### B57

```asm
MOV R0,#20H
```

### B58

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

### B59

```asm
ACALL TIME
```

### B60

```asm
ACALL TIME
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 153 to 155"]
B61["B62: instructions - lines 156 to 156"]
B62["B63: OPTION2 - lines 159 to 160"]
B63["B64: instructions - lines 161 to 161"]
B64["B65: OPTION2X - lines 164 to 164"]
B65["B66: instructions - lines 166 to 167"]
B66["B67: instructions - lines 168 to 168"]
B67["B68: instructions - lines 171 to 171"]
B68["B69: instructions - lines 172 to 172"]
B69["B70: instructions - lines 173 to 179"]
B60 -->|condition true| B57
B60 -->|condition false| B61
B62 -->|call| B172
B62 -->|after return| B63
B63 -->|call| B126
B63 -->|after return| B64
B64 -->|call| B141
B64 -->|after return| B65
B65 -->|call| B172
B65 -->|after return| B66
B66 -->|call| B126
B66 -->|after return| B67
B67 -->|call| B184
B67 -->|after return| B68
B68 -->|call| B167
B68 -->|after return| B69
B69 -->|call| B184
B69 -->|after return| B70
B57["Continue at B58 in section 6"]
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B141["Continue at B142 in section 15"]
B184["Continue at B185 in section 19"]
B167["Continue at B168 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
DEC R0
DEC R0
DJNZ R7,LOOP
```

### B62

Return to the instruction following the active call.

```asm
RET
```

### B63

```asm
MOV DPTR,#B7
ACALL WSTR
```

### B64

```asm
ACALL TIME
```

### B65

```asm
ACALL CLCD
```

### B66

```asm
MOV DPTR,#B5
ACALL WSTR
```

### B67

```asm
ACALL TIME
```

### B68

```asm
ACALL KEYPAD
```

### B69

```asm
ACALL WCHR
```

### B70

```asm
SUBB A,#30H
MOV @R0,A
INC R0
ACALL KEYPAD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 180 to 180"]
B71["B72: instructions - lines 181 to 186"]
B72["B73: instructions - lines 187 to 187"]
B73["B74: instructions - lines 188 to 192"]
B74["B75: instructions - lines 194 to 195"]
B75["B76: instructions - lines 196 to 196"]
B76["B77: instructions - lines 198 to 198"]
B77["B78: instructions - lines 199 to 199"]
B78["B79: instructions - lines 200 to 202"]
B79["B80: instructions - lines 203 to 203"]
B70 -->|call| B167
B70 -->|after return| B71
B71 -->|call| B184
B71 -->|after return| B72
B72 -->|call| B167
B72 -->|after return| B73
B73 -->|call| B138
B73 -->|after return| B74
B74 -->|call| B172
B74 -->|after return| B75
B75 -->|call| B126
B75 -->|after return| B76
B76 -->|call| B184
B76 -->|after return| B77
B77 -->|call| B167
B77 -->|after return| B78
B78 -->|call| B126
B78 -->|after return| B79
B79 -->|call| B126
B79 -->|after return| B80
B167["Continue at B168 in section 17"]
B184["Continue at B185 in section 19"]
B138["Continue at B139 in section 14"]
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL WCHR
```

### B72

```asm
SUBB A,#30H
MOV @R0,A
INC R0
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
ACALL LINE2
```

### B75

```asm
MOV DPTR,#B8
ACALL WSTR
```

### B76

```asm
ACALL TIME
```

### B77

```asm
ACALL KEYPAD
```

### B78

```asm
ACALL WCHR
```

### B79

```asm
SUBB A,#30H
MOV 30H,A
ACALL TIME
```

### B80

```asm
ACALL TIME
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 205 to 211"]
B81["B82: instructions - lines 213 to 213"]
B82["B83: instructions - lines 215 to 215"]
B83["B84: LOOP2 - lines 217 to 226"]
B84["B85: instructions - lines 227 to 230"]
B85["B86: instructions - lines 231 to 231"]
B86["B87: instructions - lines 234 to 235"]
B87["B88: instructions - lines 236 to 236"]
B88["B89: instructions - lines 237 to 237"]
B89["B90: instructions - lines 238 to 238"]
B80 -->|call| B141
B80 -->|after return| B81
B81 -->|call| B91
B81 -->|after return| B82
B82 -->|next| B83
B83 -->|condition true| B83
B83 -->|condition false| B84
B84 -->|call| B172
B84 -->|after return| B85
B85 -->|call| B126
B85 -->|after return| B86
B86 -->|call| B113
B86 -->|after return| B87
B87 -->|call| B126
B87 -->|after return| B88
B88 -->|call| B126
B88 -->|after return| B89
B89 -->|call| B141
B89 -->|after return| B90
B141["Continue at B142 in section 15"]
B91["Continue at B92 in section 10"]
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B113["Continue at B114 in section 12"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV R1,#30H
MOV A,30H
SUBB A,#3
MOV R7,A
ACALL CLCD
```

### B82

```asm
ACALL CHECK
```

### B83

```asm
MOV R0,#20H
```

### B84

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

### B85

```asm
MOV @R1,A
MOV DPTR,#B9
ACALL WSTR
```

### B86

```asm
ACALL TIME
```

### B87

```asm
MOV A,@R1
ACALL WRITE
```

### B88

```asm
ACALL TIME
```

### B89

```asm
ACALL TIME
```

### B90

```asm
ACALL CLCD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 240 to 240"]
B91["B92: CHECK - lines 243 to 244"]
B92["B93: instructions - lines 245 to 245"]
B93["B94: instructions - lines 246 to 246"]
B94["B95: S - lines 248 to 248"]
B95["B96: instructions - lines 249 to 251"]
B96["B97: instructions - lines 252 to 252"]
B97["B98: instructions - lines 255 to 256"]
B98["B99: instructions - lines 257 to 257"]
B99["B100: instructions - lines 258 to 258"]
B91 -->|condition true| B94
B91 -->|condition false| B92
B92 -->|call| B134
B92 -->|after return| B93
B93 -->|jump| B64
B94 -->|condition true| B100
B94 -->|condition false| B95
B95 -->|call| B172
B95 -->|after return| B96
B96 -->|call| B126
B96 -->|after return| B97
B97 -->|call| B113
B97 -->|after return| B98
B98 -->|call| B141
B98 -->|after return| B99
B99 -->|jump| B12
B134["Continue at B135 in section 14"]
B64["Continue at B65 in section 7"]
B100["Continue at B101 in section 11"]
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B113["Continue at B114 in section 12"]
B141["Continue at B142 in section 15"]
B12["Continue at B13 in section 2"]
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

```asm
MOV A,30H
CJNE A,#0,S
```

### B93

```asm
ACALL YLED
```

### B94

```asm
AJMP OPTION2X
```

### B95

```asm
CJNE A,#1,S2
```

### B96

```asm
MOV @R1,20H
MOV DPTR,#B9
ACALL WSTR
```

### B97

```asm
ACALL TIME
```

### B98

```asm
MOV A,@R1
ACALL WRITE
```

### B99

```asm
ACALL CLCD
```

### B100

```asm
AJMP MENU
```

## Section 11

```mermaid
flowchart TD
B100["B101: S2 - lines 260 to 260"]
B101["B102: instructions - lines 261 to 263"]
B102["B103: instructions - lines 264 to 264"]
B103["B104: instructions - lines 267 to 268"]
B104["B105: instructions - lines 269 to 269"]
B105["B106: instructions - lines 270 to 270"]
B106["B107: S3 - lines 272 to 272"]
B107["B108: instructions - lines 273 to 275"]
B108["B109: instructions - lines 276 to 276"]
B109["B110: instructions - lines 279 to 280"]
B100 -->|condition true| B106
B100 -->|condition false| B101
B101 -->|call| B172
B101 -->|after return| B102
B102 -->|call| B126
B102 -->|after return| B103
B103 -->|call| B113
B103 -->|after return| B104
B104 -->|call| B141
B104 -->|after return| B105
B105 -->|jump| B12
B106 -->|condition true| B112
B106 -->|condition false| B107
B107 -->|call| B172
B107 -->|after return| B108
B108 -->|call| B126
B108 -->|after return| B109
B109 -->|call| B113
B109 -->|after return| B110
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B113["Continue at B114 in section 12"]
B141["Continue at B142 in section 15"]
B12["Continue at B13 in section 2"]
B112["Continue at B113 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
CJNE A,#2,S3
```

### B102

```asm
MOV @R1,21H
MOV DPTR,#B9
ACALL WSTR
```

### B103

```asm
ACALL TIME
```

### B104

```asm
MOV A,@R1
ACALL WRITE
```

### B105

```asm
ACALL CLCD
```

### B106

```asm
AJMP MENU
```

### B107

```asm
CJNE A,#3,S4
```

### B108

```asm
MOV @R1,22H
MOV DPTR,#B9
ACALL WSTR
```

### B109

```asm
ACALL TIME
```

### B110

```asm
MOV A,@R1
ACALL WRITE
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 281 to 281"]
B111["B112: instructions - lines 282 to 282"]
B112["B113: S4 - lines 283 to 283"]
B113["B114: WRITE - lines 287 to 287"]
B114["B115: X - lines 289 to 289"]
B115["B116: instructions - lines 290 to 293"]
B116["B117: instructions - lines 294 to 294"]
B117["B118: instructions - lines 295 to 295"]
B118["B119: ONE - lines 297 to 298"]
B119["B120: instructions - lines 299 to 299"]
B110 -->|call| B141
B110 -->|after return| B111
B111 -->|jump| B12
B113 -->|condition true| B114
B113 -->|condition false| B114
B114 -->|condition true| B118
B114 -->|condition false| B115
B115 -->|call| B167
B115 -->|after return| B116
B116 -->|call| B177
B116 -->|after return| B117
B117 -->|next| B118
B118 -->|call| B167
B118 -->|after return| B119
B119 -->|call| B177
B119 -->|after return| B120
B141["Continue at B142 in section 15"]
B12["Continue at B13 in section 2"]
B167["Continue at B168 in section 17"]
B177["Continue at B178 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL CLCD
```

### B112

```asm
AJMP MENU
```

### B113

Return to the instruction following the active call.

```asm
RET
```

### B114

```asm
CJNE A,#10,X
```

### B115

```asm
JC ONE
```

### B116

```asm
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B117

```asm
ACALL LDELAY
```

### B118

```asm
MOV A,B
```

### B119

```asm
ADD A,#30H
ACALL WCHR
```

### B120

```asm
ACALL LDELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 301 to 302"]
B121["B122: instructions - lines 303 to 303"]
B122["B123: instructions - lines 304 to 304"]
B123["B124: T - lines 307 to 310"]
B124["B125: BACK - lines 312 to 312"]
B125["B126: instructions - lines 313 to 315"]
B126["B127: TIME - lines 318 to 318"]
B127["B128: T2 - lines 319 to 319"]
B128["B129: instructions - lines 320 to 320"]
B129["B130: instructions - lines 321 to 321"]
B120 -->|call| B167
B120 -->|after return| B121
B121 -->|call| B177
B121 -->|after return| B122
B123 -->|next| B124
B124 -->|condition true| B124
B124 -->|condition false| B125
B126 -->|next| B127
B127 -->|call| B123
B127 -->|after return| B128
B128 -->|condition true| B127
B128 -->|condition false| B129
B167["Continue at B168 in section 17"]
B177["Continue at B178 in section 18"]
```

### B121

```asm
MOV A,#' '
ACALL WCHR
```

### B122

```asm
ACALL LDELAY
```

### B123

Return to the instruction following the active call.

```asm
RET
```

### B124

```asm
MOV TMOD,#21H
MOV TL0,#0EEH
MOV TH0,#0B7H
SETB TR0
```

### B125

```asm
JNB TF0,BACK
```

### B126

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B127

```asm
MOV R6,#200
```

### B128

```asm
ACALL T
```

### B129

```asm
DJNZ R6,T2
```

### B130

Return to the instruction following the active call.

```asm
RET
```

## Section 14

```mermaid
flowchart TD
B130["B131: RLED - lines 324 to 325"]
B131["B132: instructions - lines 326 to 327"]
B132["B133: GLED - lines 330 to 331"]
B133["B134: instructions - lines 332 to 333"]
B134["B135: YLED - lines 336 to 337"]
B135["B136: instructions - lines 338 to 338"]
B136["B137: instructions - lines 339 to 339"]
B137["B138: instructions - lines 340 to 341"]
B138["B139: LINE2 - lines 344 to 345"]
B139["B140: instructions - lines 346 to 346"]
B130 -->|call| B126
B130 -->|after return| B131
B132 -->|call| B126
B132 -->|after return| B133
B134 -->|call| B126
B134 -->|after return| B135
B135 -->|call| B126
B135 -->|after return| B136
B136 -->|call| B126
B136 -->|after return| B137
B138 -->|call| B164
B138 -->|after return| B139
B139 -->|call| B126
B139 -->|after return| B140
B126["Continue at B127 in section 13"]
B164["Continue at B165 in section 17"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
CLR R
ACALL TIME
```

### B132

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B133

```asm
CLR G
ACALL TIME
```

### B134

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B135

```asm
CLR Y
ACALL TIME
```

### B136

```asm
ACALL TIME
```

### B137

```asm
ACALL TIME
```

### B138

Return to the instruction following the active call.

```asm
SETB Y
RET
```

### B139

```asm
MOV A,#0C0H
ACALL CMD
```

### B140

```asm
ACALL TIME
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 347 to 347"]
B141["B142: CLCD - lines 350 to 351"]
B142["B143: instructions - lines 352 to 352"]
B143["B144: instructions - lines 353 to 353"]
B144["B145: INLCD - lines 358 to 359"]
B145["B146: WAIT - lines 361 to 361"]
B146["B147: instructions - lines 362 to 362"]
B147["B148: instructions - lines 364 to 366"]
B148["B149: instructions - lines 367 to 367"]
B149["B150: instructions - lines 368 to 369"]
B141 -->|call| B164
B141 -->|after return| B142
B142 -->|call| B126
B142 -->|after return| B143
B144 -->|next| B145
B145 -->|call| B177
B145 -->|after return| B146
B146 -->|condition true| B145
B146 -->|condition false| B147
B147 -->|call| B164
B147 -->|after return| B148
B148 -->|call| B177
B148 -->|after return| B149
B149 -->|call| B164
B149 -->|after return| B150
B164["Continue at B165 in section 17"]
B126["Continue at B127 in section 13"]
B177["Continue at B178 in section 18"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
RET
```

### B142

```asm
MOV A,#1
ACALL CMD
```

### B143

```asm
ACALL TIME
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
PUSH 7
MOV R7,#20
```

### B146

```asm
ACALL LDELAY
```

### B147

```asm
DJNZ R7,WAIT
```

### B148

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B149

```asm
ACALL LDELAY
```

### B150

```asm
MOV A,#0011B
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 370 to 371"]
B151["B152: instructions - lines 372 to 373"]
B152["B153: instructions - lines 374 to 375"]
B153["B154: instructions - lines 376 to 377"]
B154["B155: instructions - lines 378 to 379"]
B155["B156: instructions - lines 380 to 381"]
B156["B157: instructions - lines 382 to 383"]
B157["B158: instructions - lines 384 to 385"]
B158["B159: instructions - lines 386 to 386"]
B159["B160: instructions - lines 387 to 388"]
B150 -->|call| B164
B150 -->|after return| B151
B151 -->|call| B164
B151 -->|after return| B152
B152 -->|call| B164
B152 -->|after return| B153
B153 -->|call| B164
B153 -->|after return| B154
B154 -->|call| B164
B154 -->|after return| B155
B155 -->|call| B164
B155 -->|after return| B156
B156 -->|call| B164
B156 -->|after return| B157
B157 -->|call| B164
B157 -->|after return| B158
B158 -->|call| B177
B158 -->|after return| B159
B159 -->|call| B164
B159 -->|after return| B160
B164["Continue at B165 in section 17"]
B177["Continue at B178 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#0011B
ACALL CMD
```

### B152

```asm
MOV A,#0010B
ACALL CMD
```

### B153

```asm
MOV A,#0010B
ACALL CMD
```

### B154

```asm
MOV A,#1000B
ACALL CMD
```

### B155

```asm
MOV A,#0000B
ACALL CMD
```

### B156

```asm
MOV A,#1000B
ACALL CMD
```

### B157

```asm
MOV A,#0
ACALL CMD
```

### B158

```asm
MOV A,#0001B
ACALL CMD
```

### B159

```asm
ACALL LDELAY
```

### B160

```asm
MOV A,#0000B
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 389 to 390"]
B161["B162: instructions - lines 391 to 392"]
B162["B163: instructions - lines 393 to 394"]
B163["B164: instructions - lines 396 to 397"]
B164["B165: CMD - lines 401 to 407"]
B165["B166: instructions - lines 408 to 409"]
B166["B167: instructions - lines 411 to 413"]
B167["B168: WCHR - lines 416 to 422"]
B168["B169: instructions - lines 423 to 424"]
B169["B170: instructions - lines 426 to 428"]
B160 -->|call| B164
B160 -->|after return| B161
B161 -->|call| B164
B161 -->|after return| B162
B162 -->|call| B164
B162 -->|after return| B163
B164 -->|call| B170
B164 -->|after return| B165
B165 -->|call| B170
B165 -->|after return| B166
B167 -->|call| B170
B167 -->|after return| B168
B168 -->|call| B170
B168 -->|after return| B169
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#0110B
ACALL CMD
```

### B162

```asm
MOV A,#0000B
ACALL CMD
```

### B163

```asm
MOV A,#1111B
ACALL CMD
```

### B164

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B165

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B166

```asm
MOV A,B
ACALL COMMON
```

### B167

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B168

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B169

```asm
MOV A,B
ACALL COMMON
```

### B170

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: COMMON - lines 431 to 438"]
B171["B172: instructions - lines 439 to 439"]
B172["B173: WSTR - lines 442 to 442"]
B173["B174: CONT1 - lines 444 to 446"]
B174["B175: instructions - lines 447 to 447"]
B175["B176: instructions - lines 448 to 449"]
B176["B177: EXIT1 - lines 451 to 452"]
B177["B178: LDELAY - lines 455 to 457"]
B178["B179: CON4 - lines 459 to 460"]
B179["B180: instructions - lines 461 to 461"]
B170 -->|call| B177
B170 -->|after return| B171
B172 -->|next| B173
B173 -->|condition true| B176
B173 -->|condition false| B174
B174 -->|call| B167
B174 -->|after return| B175
B175 -->|jump| B173
B177 -->|next| B178
B178 -->|condition true| B178
B178 -->|condition false| B179
B179 -->|condition true| B178
B179 -->|condition false| B180
B167["Continue at B168 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

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
JZ EXIT1
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
PUSH 0
PUSH 1
MOV R1,#20
```

### B179

```asm
MOV R0,#250
DJNZ R0,$
```

### B180

```asm
DJNZ R1,CON4
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 462 to 464"]
B181["B182: FINISH - lines 485 to 486"]
B182["B183: instructions - lines 487 to 487"]
B183["B184: instructions - lines 488 to 488"]
B184["B185: KEYPAD - lines 491 to 491"]
B185["B186: K1 - lines 492 to 495"]
B186["B187: K2 - lines 496 to 496"]
B187["B188: instructions - lines 497 to 499"]
B188["B189: instructions - lines 500 to 500"]
B189["B190: OVER - lines 502 to 502"]
B181 -->|call| B172
B181 -->|after return| B182
B182 -->|call| B126
B182 -->|after return| B183
B183 -->|jump| B183
B184 -->|next| B185
B185 -->|condition true| B185
B185 -->|condition false| B186
B186 -->|call| B205
B186 -->|after return| B187
B187 -->|condition true| B189
B187 -->|condition false| B188
B188 -->|jump| B186
B189 -->|call| B205
B189 -->|after return| B190
B172["Continue at B173 in section 18"]
B126["Continue at B127 in section 13"]
B205["Continue at B206 in section 21"]
B190["Continue at B191 in section 20"]
```

### B181

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B182

```asm
MOV DPTR,#B11
ACALL WSTR
```

### B183

```asm
ACALL TIME
```

### B184

```asm
AJMP $
```

### B185

```asm
MOV P2,#11110000B
```

### B186

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B187

```asm
ACALL TMSEC
```

### B188

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B189

```asm
SJMP K2
```

### B190

```asm
ACALL TMSEC
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 503 to 505"]
B191["B192: instructions - lines 506 to 506"]
B192["B193: OVER1 - lines 508 to 511"]
B193["B194: instructions - lines 512 to 515"]
B194["B195: instructions - lines 516 to 519"]
B195["B196: instructions - lines 520 to 523"]
B196["B197: instructions - lines 524 to 524"]
B197["B198: ROW_0 - lines 525 to 526"]
B198["B199: ROW_1 - lines 527 to 528"]
B199["B200: ROW_2 - lines 529 to 530"]
B190 -->|condition true| B192
B190 -->|condition false| B191
B191 -->|jump| B186
B192 -->|condition true| B197
B192 -->|condition false| B193
B193 -->|condition true| B198
B193 -->|condition false| B194
B194 -->|condition true| B199
B194 -->|condition false| B195
B195 -->|condition true| B200
B195 -->|condition false| B196
B196 -->|jump| B186
B197 -->|jump| B201
B198 -->|jump| B201
B199 -->|jump| B201
B186["Continue at B187 in section 19"]
B200["Continue at B201 in section 21"]
B201["Continue at B202 in section 21"]
```

### B191

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B192

```asm
SJMP K2
```

### B193

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B194

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B195

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B196

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B197

```asm
LJMP K2
```

### B198

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B199

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B200

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

## Section 21

```mermaid
flowchart TD
B200["B201: ROW_3 - lines 531 to 531"]
B201["B202: FIND - lines 533 to 533"]
B202["B203: FIND1 - lines 535 to 536"]
B203["B204: instructions - lines 537 to 538"]
B204["B205: MATCH - lines 540 to 542"]
B205["B206: TMSEC - lines 547 to 550"]
B206["B207: BACK8 - lines 551 to 551"]
B207["B208: instructions - lines 552 to 554"]
B200 -->|next| B201
B201 -->|next| B202
B202 -->|condition true| B204
B202 -->|condition false| B203
B203 -->|jump| B202
B205 -->|next| B206
B206 -->|condition true| B206
B206 -->|condition false| B207
```

### B201

```asm
MOV DPTR,#KCODE3
```

### B202

```asm
SWAP A
```

### B203

```asm
RRC A
JNC MATCH
```

### B204

```asm
INC DPTR
SJMP FIND1
```

### B205

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B206

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B207

```asm
JNB TF0,BACK8
```

### B208

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```
