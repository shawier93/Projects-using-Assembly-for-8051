# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

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
B0 -->|call| B131
B0 -->|after return| B1
B1 -->|call| B159
B1 -->|after return| B2
B2 -->|call| B111
B2 -->|after return| B3
B3 -->|call| B125
B3 -->|after return| B4
B4 -->|call| B159
B4 -->|after return| B5
B5 -->|call| B111
B5 -->|after return| B6
B6 -->|call| B128
B6 -->|after return| B7
B7 -->|call| B159
B7 -->|after return| B8
B8 -->|call| B111
B8 -->|after return| B9
B9 -->|call| B125
B9 -->|after return| B10
B131["Continue at B132 in section 14"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B125["Continue at B126 in section 13"]
B128["Continue at B129 in section 13"]
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
B10 -->|call| B159
B10 -->|after return| B11
B11 -->|call| B111
B11 -->|after return| B12
B12 -->|call| B128
B12 -->|after return| B13
B13 -->|call| B159
B13 -->|after return| B14
B14 -->|call| B111
B14 -->|after return| B15
B15 -->|call| B125
B15 -->|after return| B16
B16 -->|call| B159
B16 -->|after return| B17
B17 -->|call| B111
B17 -->|after return| B18
B18 -->|call| B128
B18 -->|after return| B19
B19 -->|call| B159
B19 -->|after return| B20
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B128["Continue at B129 in section 13"]
B125["Continue at B126 in section 13"]
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
B21["B22: instructions - lines 59 to 62"]
B22["B23: instructions - lines 64 to 64"]
B23["B24: FUNCTION1 - lines 68 to 68"]
B24["B25: instructions - lines 69 to 69"]
B25["B26: instructions - lines 70 to 70"]
B26["B27: instructions - lines 71 to 71"]
B27["B28: FUNCTION2 - lines 74 to 74"]
B28["B29: instructions - lines 75 to 75"]
B29["B30: instructions - lines 76 to 76"]
B20 -->|call| B111
B20 -->|after return| B21
B21 -->|call| B98
B21 -->|after return| B22
B22 -->|call| B125
B22 -->|after return| B23
B23 -->|condition true| B27
B23 -->|condition false| B24
B24 -->|call| B118
B24 -->|after return| B25
B25 -->|call| B42
B25 -->|after return| B26
B26 -->|jump| B12
B27 -->|condition true| B31
B27 -->|condition false| B28
B28 -->|call| B118
B28 -->|after return| B29
B29 -->|call| B55
B29 -->|after return| B30
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B125["Continue at B126 in section 13"]
B118["Continue at B119 in section 12"]
B42["Continue at B43 in section 5"]
B12["Continue at B13 in section 2"]
B31["Continue at B32 in section 4"]
B55["Continue at B56 in section 6"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL TIME
```

### B22

```asm
MOV 10H,#2
MOV A,10H
ACALL WRITE
```

### B23

```asm
ACALL LINE2
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

```asm
SJMP MENU
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
B30["B31: instructions - lines 77 to 77"]
B31["B32: FUNCTION3 - lines 80 to 80"]
B32["B33: instructions - lines 81 to 81"]
B33["B34: instructions - lines 82 to 83"]
B34["B35: instructions - lines 84 to 84"]
B35["B36: instructions - lines 86 to 86"]
B36["B37: instructions - lines 88 to 88"]
B37["B38: WRONG - lines 92 to 92"]
B38["B39: instructions - lines 94 to 95"]
B39["B40: instructions - lines 96 to 96"]
B30 -->|jump| B12
B31 -->|condition true| B37
B31 -->|condition false| B32
B32 -->|call| B118
B32 -->|after return| B33
B33 -->|call| B159
B33 -->|after return| B34
B34 -->|call| B111
B34 -->|after return| B35
B35 -->|call| B128
B35 -->|after return| B36
B36 -->|jump| B168
B37 -->|call| B115
B37 -->|after return| B38
B38 -->|call| B159
B38 -->|after return| B39
B39 -->|call| B111
B39 -->|after return| B40
B12["Continue at B13 in section 2"]
B118["Continue at B119 in section 12"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B128["Continue at B129 in section 13"]
B168["Continue at B169 in section 17"]
B115["Continue at B116 in section 12"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
SJMP MENU
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

```asm
AJMP FINISH
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
B40["B41: instructions - lines 98 to 98"]
B41["B42: instructions - lines 99 to 99"]
B42["B43: OPTION1 - lines 103 to 104"]
B43["B44: instructions - lines 105 to 105"]
B44["B45: instructions - lines 107 to 107"]
B45["B46: instructions - lines 109 to 110"]
B46["B47: instructions - lines 111 to 111"]
B47["B48: instructions - lines 113 to 116"]
B48["B49: instructions - lines 117 to 120"]
B49["B50: instructions - lines 121 to 124"]
B40 -->|call| B128
B40 -->|after return| B41
B41 -->|jump| B12
B42 -->|call| B159
B42 -->|after return| B43
B43 -->|call| B111
B43 -->|after return| B44
B44 -->|call| B128
B44 -->|after return| B45
B45 -->|call| B159
B45 -->|after return| B46
B46 -->|call| B111
B46 -->|after return| B47
B47 -->|call| B98
B47 -->|after return| B48
B48 -->|call| B98
B48 -->|after return| B49
B49 -->|call| B98
B49 -->|after return| B50
B128["Continue at B129 in section 13"]
B12["Continue at B13 in section 2"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
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
MOV A,#3
MOV @R0,A
ACALL WRITE
```

### B49

```asm
INC R0
MOV A,#0
MOV @R0,A
ACALL WRITE
```

### B50

```asm
INC R0
MOV A,#2
MOV @R0,A
ACALL WRITE
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 126 to 126"]
B51["B52: instructions - lines 128 to 128"]
B52["B53: LOOP - lines 130 to 137"]
B53["B54: instructions - lines 138 to 140"]
B54["B55: instructions - lines 141 to 141"]
B55["B56: OPTION2 - lines 144 to 145"]
B56["B57: instructions - lines 146 to 146"]
B57["B58: OPTION2X - lines 149 to 149"]
B58["B59: instructions - lines 151 to 152"]
B59["B60: instructions - lines 153 to 153"]
B50 -->|call| B125
B50 -->|after return| B51
B51 -->|next| B52
B52 -->|call| B98
B52 -->|after return| B53
B53 -->|condition true| B52
B53 -->|condition false| B54
B55 -->|call| B159
B55 -->|after return| B56
B56 -->|call| B111
B56 -->|after return| B57
B57 -->|call| B128
B57 -->|after return| B58
B58 -->|call| B159
B58 -->|after return| B59
B59 -->|call| B111
B59 -->|after return| B60
B125["Continue at B126 in section 13"]
B98["Continue at B99 in section 10"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B128["Continue at B129 in section 13"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL LINE2
```

### B52

```asm
MOV R0,#20H
```

### B53

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

### B54

```asm
DEC R0
DEC R0
DJNZ R7,LOOP
```

### B55

Return to the instruction following the active call.

```asm
RET
```

### B56

```asm
MOV DPTR,#B7
ACALL WSTR
```

### B57

```asm
ACALL TIME
```

### B58

```asm
ACALL CLCD
```

### B59

```asm
MOV DPTR,#B5
ACALL WSTR
```

### B60

```asm
ACALL TIME
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 155 to 163"]
B61["B62: instructions - lines 164 to 167"]
B62["B63: instructions - lines 168 to 171"]
B63["B64: instructions - lines 173 to 173"]
B64["B65: instructions - lines 175 to 176"]
B65["B66: instructions - lines 177 to 177"]
B66["B67: instructions - lines 179 to 180"]
B67["B68: instructions - lines 181 to 181"]
B68["B69: instructions - lines 183 to 183"]
B69["B70: instructions - lines 185 to 185"]
B60 -->|call| B98
B60 -->|after return| B61
B61 -->|call| B98
B61 -->|after return| B62
B62 -->|call| B98
B62 -->|after return| B63
B63 -->|call| B125
B63 -->|after return| B64
B64 -->|call| B159
B64 -->|after return| B65
B65 -->|call| B111
B65 -->|after return| B66
B66 -->|call| B98
B66 -->|after return| B67
B67 -->|call| B128
B67 -->|after return| B68
B68 -->|call| B76
B68 -->|after return| B69
B69 -->|next| B70
B98["Continue at B99 in section 10"]
B125["Continue at B126 in section 13"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B128["Continue at B129 in section 13"]
B76["Continue at B77 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV 30H,#1
MOV R1,#30H
MOV A,30H
SUBB A,#3
MOV R7,A
MOV A,#4
MOV @R0,A
ACALL WRITE
```

### B62

```asm
INC R0
MOV A,#2
MOV @R0,A
ACALL WRITE
```

### B63

```asm
INC R0
MOV A,#3
MOV @R0,A
ACALL WRITE
```

### B64

```asm
ACALL LINE2
```

### B65

```asm
MOV DPTR,#B8
ACALL WSTR
```

### B66

```asm
ACALL TIME
```

### B67

```asm
MOV A,30H
ACALL WRITE
```

### B68

```asm
ACALL CLCD
```

### B69

```asm
ACALL CHECK
```

### B70

```asm
MOV R0,#20H
```

## Section 8

```mermaid
flowchart TD
B70["B71: LOOP2 - lines 187 to 196"]
B71["B72: instructions - lines 197 to 200"]
B72["B73: instructions - lines 201 to 201"]
B73["B74: instructions - lines 204 to 205"]
B74["B75: instructions - lines 206 to 206"]
B75["B76: instructions - lines 208 to 208"]
B76["B77: CHECK - lines 211 to 212"]
B77["B78: instructions - lines 213 to 213"]
B78["B79: instructions - lines 214 to 214"]
B79["B80: S - lines 216 to 216"]
B70 -->|condition true| B70
B70 -->|condition false| B71
B71 -->|call| B159
B71 -->|after return| B72
B72 -->|call| B111
B72 -->|after return| B73
B73 -->|call| B98
B73 -->|after return| B74
B74 -->|call| B128
B74 -->|after return| B75
B76 -->|condition true| B79
B76 -->|condition false| B77
B77 -->|call| B121
B77 -->|after return| B78
B78 -->|jump| B57
B79 -->|condition true| B85
B79 -->|condition false| B80
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B128["Continue at B129 in section 13"]
B121["Continue at B122 in section 13"]
B57["Continue at B58 in section 6"]
B85["Continue at B86 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

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

### B72

```asm
MOV @R1,A
MOV DPTR,#B9
ACALL WSTR
```

### B73

```asm
ACALL TIME
```

### B74

```asm
MOV A,@R1
ACALL WRITE
```

### B75

```asm
ACALL CLCD
```

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
MOV A,30H
CJNE A,#0,S
```

### B78

```asm
ACALL YLED
```

### B79

```asm
AJMP OPTION2X
```

### B80

```asm
CJNE A,#1,S2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 217 to 219"]
B81["B82: instructions - lines 220 to 220"]
B82["B83: instructions - lines 223 to 224"]
B83["B84: instructions - lines 225 to 225"]
B84["B85: instructions - lines 226 to 226"]
B85["B86: S2 - lines 228 to 228"]
B86["B87: instructions - lines 229 to 231"]
B87["B88: instructions - lines 232 to 232"]
B88["B89: instructions - lines 235 to 236"]
B89["B90: instructions - lines 237 to 237"]
B80 -->|call| B159
B80 -->|after return| B81
B81 -->|call| B111
B81 -->|after return| B82
B82 -->|call| B98
B82 -->|after return| B83
B83 -->|call| B128
B83 -->|after return| B84
B84 -->|jump| B12
B85 -->|condition true| B91
B85 -->|condition false| B86
B86 -->|call| B159
B86 -->|after return| B87
B87 -->|call| B111
B87 -->|after return| B88
B88 -->|call| B98
B88 -->|after return| B89
B89 -->|call| B128
B89 -->|after return| B90
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B98["Continue at B99 in section 10"]
B128["Continue at B129 in section 13"]
B12["Continue at B13 in section 2"]
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV @R1,20H
MOV DPTR,#B9
ACALL WSTR
```

### B82

```asm
ACALL TIME
```

### B83

```asm
MOV A,@R1
ACALL WRITE
```

### B84

```asm
ACALL CLCD
```

### B85

```asm
AJMP MENU
```

### B86

```asm
CJNE A,#2,S3
```

### B87

```asm
MOV @R1,21H
MOV DPTR,#B9
ACALL WSTR
```

### B88

```asm
ACALL TIME
```

### B89

```asm
MOV A,@R1
ACALL WRITE
```

### B90

```asm
ACALL CLCD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 238 to 238"]
B91["B92: S3 - lines 240 to 240"]
B92["B93: instructions - lines 241 to 243"]
B93["B94: instructions - lines 244 to 244"]
B94["B95: instructions - lines 247 to 248"]
B95["B96: instructions - lines 249 to 249"]
B96["B97: instructions - lines 250 to 250"]
B97["B98: S4 - lines 251 to 251"]
B98["B99: WRITE - lines 255 to 255"]
B99["B100: X - lines 257 to 257"]
B90 -->|jump| B12
B91 -->|condition true| B97
B91 -->|condition false| B92
B92 -->|call| B159
B92 -->|after return| B93
B93 -->|call| B111
B93 -->|after return| B94
B94 -->|call| B98
B94 -->|after return| B95
B95 -->|call| B128
B95 -->|after return| B96
B96 -->|jump| B12
B98 -->|condition true| B99
B98 -->|condition false| B99
B99 -->|condition true| B103
B99 -->|condition false| B100
B12["Continue at B13 in section 2"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B128["Continue at B129 in section 13"]
B103["Continue at B104 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
AJMP MENU
```

### B92

```asm
CJNE A,#3,S4
```

### B93

```asm
MOV @R1,22H
MOV DPTR,#B9
ACALL WSTR
```

### B94

```asm
ACALL TIME
```

### B95

```asm
MOV A,@R1
ACALL WRITE
```

### B96

```asm
ACALL CLCD
```

### B97

```asm
AJMP MENU
```

### B98

Return to the instruction following the active call.

```asm
RET
```

### B99

```asm
CJNE A,#10,X
```

### B100

```asm
JC ONE
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 258 to 261"]
B101["B102: instructions - lines 262 to 262"]
B102["B103: instructions - lines 263 to 263"]
B103["B104: ONE - lines 265 to 266"]
B104["B105: instructions - lines 267 to 267"]
B105["B106: instructions - lines 269 to 270"]
B106["B107: instructions - lines 271 to 271"]
B107["B108: instructions - lines 272 to 272"]
B108["B109: T - lines 275 to 278"]
B109["B110: BACK - lines 280 to 280"]
B100 -->|call| B154
B100 -->|after return| B101
B101 -->|call| B164
B101 -->|after return| B102
B102 -->|next| B103
B103 -->|call| B154
B103 -->|after return| B104
B104 -->|call| B164
B104 -->|after return| B105
B105 -->|call| B154
B105 -->|after return| B106
B106 -->|call| B164
B106 -->|after return| B107
B108 -->|next| B109
B109 -->|condition true| B109
B109 -->|condition false| B110
B154["Continue at B155 in section 16"]
B164["Continue at B165 in section 17"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B102

```asm
ACALL LDELAY
```

### B103

```asm
MOV A,B
```

### B104

```asm
ADD A,#30H
ACALL WCHR
```

### B105

```asm
ACALL LDELAY
```

### B106

```asm
MOV A,#' '
ACALL WCHR
```

### B107

```asm
ACALL LDELAY
```

### B108

Return to the instruction following the active call.

```asm
RET
```

### B109

```asm
MOV TMOD,#21H
MOV TL0,#0EEH
MOV TH0,#0B7H
SETB TR0
```

### B110

```asm
JNB TF0,BACK
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 281 to 283"]
B111["B112: TIME - lines 286 to 286"]
B112["B113: T2 - lines 287 to 287"]
B113["B114: instructions - lines 288 to 288"]
B114["B115: instructions - lines 289 to 289"]
B115["B116: RLED - lines 292 to 293"]
B116["B117: instructions - lines 294 to 294"]
B117["B118: instructions - lines 295 to 296"]
B118["B119: GLED - lines 299 to 300"]
B119["B120: instructions - lines 301 to 301"]
B111 -->|next| B112
B112 -->|call| B108
B112 -->|after return| B113
B113 -->|condition true| B112
B113 -->|condition false| B114
B115 -->|call| B111
B115 -->|after return| B116
B116 -->|call| B111
B116 -->|after return| B117
B118 -->|call| B111
B118 -->|after return| B119
B119 -->|call| B111
B119 -->|after return| B120
B108["Continue at B109 in section 11"]
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B112

```asm
MOV R7,#100
```

### B113

```asm
ACALL T
```

### B114

```asm
DJNZ R7,T2
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
CLR R
ACALL TIME
```

### B117

```asm
ACALL TIME
```

### B118

Return to the instruction following the active call.

```asm
SETB R
RET
```

### B119

```asm
CLR G
ACALL TIME
```

### B120

```asm
ACALL TIME
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 302 to 303"]
B121["B122: YLED - lines 306 to 307"]
B122["B123: instructions - lines 308 to 308"]
B123["B124: instructions - lines 309 to 309"]
B124["B125: instructions - lines 310 to 311"]
B125["B126: LINE2 - lines 314 to 315"]
B126["B127: instructions - lines 316 to 316"]
B127["B128: instructions - lines 317 to 317"]
B128["B129: CLCD - lines 320 to 321"]
B129["B130: instructions - lines 322 to 322"]
B121 -->|call| B111
B121 -->|after return| B122
B122 -->|call| B111
B122 -->|after return| B123
B123 -->|call| B111
B123 -->|after return| B124
B125 -->|call| B151
B125 -->|after return| B126
B126 -->|call| B111
B126 -->|after return| B127
B128 -->|call| B151
B128 -->|after return| B129
B129 -->|call| B111
B129 -->|after return| B130
B111["Continue at B112 in section 12"]
B151["Continue at B152 in section 16"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B122

```asm
CLR Y
ACALL TIME
```

### B123

```asm
ACALL TIME
```

### B124

```asm
ACALL TIME
```

### B125

Return to the instruction following the active call.

```asm
SETB Y
RET
```

### B126

```asm
MOV A,#0C0H
ACALL CMD
```

### B127

```asm
ACALL TIME
```

### B128

Return to the instruction following the active call.

```asm
RET
```

### B129

```asm
MOV A,#1
ACALL CMD
```

### B130

```asm
ACALL TIME
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 323 to 323"]
B131["B132: INLCD - lines 328 to 329"]
B132["B133: WAIT - lines 331 to 331"]
B133["B134: instructions - lines 332 to 332"]
B134["B135: instructions - lines 334 to 336"]
B135["B136: instructions - lines 337 to 337"]
B136["B137: instructions - lines 338 to 339"]
B137["B138: instructions - lines 340 to 341"]
B138["B139: instructions - lines 342 to 343"]
B139["B140: instructions - lines 344 to 345"]
B131 -->|next| B132
B132 -->|call| B164
B132 -->|after return| B133
B133 -->|condition true| B132
B133 -->|condition false| B134
B134 -->|call| B151
B134 -->|after return| B135
B135 -->|call| B164
B135 -->|after return| B136
B136 -->|call| B151
B136 -->|after return| B137
B137 -->|call| B151
B137 -->|after return| B138
B138 -->|call| B151
B138 -->|after return| B139
B139 -->|call| B151
B139 -->|after return| B140
B164["Continue at B165 in section 17"]
B151["Continue at B152 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

```asm
PUSH 7
MOV R7,#20
```

### B133

```asm
ACALL LDELAY
```

### B134

```asm
DJNZ R7,WAIT
```

### B135

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B136

```asm
ACALL LDELAY
```

### B137

```asm
MOV A,#0011B
ACALL CMD
```

### B138

```asm
MOV A,#0011B
ACALL CMD
```

### B139

```asm
MOV A,#0010B
ACALL CMD
```

### B140

```asm
MOV A,#0010B
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 346 to 347"]
B141["B142: instructions - lines 348 to 349"]
B142["B143: instructions - lines 350 to 351"]
B143["B144: instructions - lines 352 to 353"]
B144["B145: instructions - lines 354 to 355"]
B145["B146: instructions - lines 356 to 356"]
B146["B147: instructions - lines 357 to 358"]
B147["B148: instructions - lines 359 to 360"]
B148["B149: instructions - lines 361 to 362"]
B149["B150: instructions - lines 363 to 364"]
B140 -->|call| B151
B140 -->|after return| B141
B141 -->|call| B151
B141 -->|after return| B142
B142 -->|call| B151
B142 -->|after return| B143
B143 -->|call| B151
B143 -->|after return| B144
B144 -->|call| B151
B144 -->|after return| B145
B145 -->|call| B164
B145 -->|after return| B146
B146 -->|call| B151
B146 -->|after return| B147
B147 -->|call| B151
B147 -->|after return| B148
B148 -->|call| B151
B148 -->|after return| B149
B149 -->|call| B151
B149 -->|after return| B150
B151["Continue at B152 in section 16"]
B164["Continue at B165 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,#1000B
ACALL CMD
```

### B142

```asm
MOV A,#0000B
ACALL CMD
```

### B143

```asm
MOV A,#1000B
ACALL CMD
```

### B144

```asm
MOV A,#0
ACALL CMD
```

### B145

```asm
MOV A,#0001B
ACALL CMD
```

### B146

```asm
ACALL LDELAY
```

### B147

```asm
MOV A,#0000B
ACALL CMD
```

### B148

```asm
MOV A,#0110B
ACALL CMD
```

### B149

```asm
MOV A,#0000B
ACALL CMD
```

### B150

```asm
MOV A,#1111B
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 366 to 367"]
B151["B152: CMD - lines 371 to 377"]
B152["B153: instructions - lines 378 to 379"]
B153["B154: instructions - lines 381 to 383"]
B154["B155: WCHR - lines 386 to 392"]
B155["B156: instructions - lines 393 to 394"]
B156["B157: instructions - lines 396 to 398"]
B157["B158: COMMON - lines 401 to 408"]
B158["B159: instructions - lines 409 to 409"]
B159["B160: WSTR - lines 412 to 412"]
B151 -->|call| B157
B151 -->|after return| B152
B152 -->|call| B157
B152 -->|after return| B153
B154 -->|call| B157
B154 -->|after return| B155
B155 -->|call| B157
B155 -->|after return| B156
B157 -->|call| B164
B157 -->|after return| B158
B159 -->|next| B160
B164["Continue at B165 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B152

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B153

```asm
MOV A,B
ACALL COMMON
```

### B154

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B155

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B156

```asm
MOV A,B
ACALL COMMON
```

### B157

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B158

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

### B159

Return to the instruction following the active call.

```asm
RET
```

### B160

```asm
PUSH ACC
```

## Section 17

```mermaid
flowchart TD
B160["B161: CONT1 - lines 414 to 416"]
B161["B162: instructions - lines 417 to 417"]
B162["B163: instructions - lines 418 to 419"]
B163["B164: EXIT1 - lines 421 to 422"]
B164["B165: LDELAY - lines 425 to 427"]
B165["B166: CON4 - lines 429 to 430"]
B166["B167: instructions - lines 431 to 431"]
B167["B168: instructions - lines 432 to 434"]
B168["B169: FINISH - lines 455 to 456"]
B169["B170: instructions - lines 457 to 457"]
B160 -->|condition true| B163
B160 -->|condition false| B161
B161 -->|call| B154
B161 -->|after return| B162
B162 -->|jump| B160
B164 -->|next| B165
B165 -->|condition true| B165
B165 -->|condition false| B166
B166 -->|condition true| B165
B166 -->|condition false| B167
B168 -->|call| B159
B168 -->|after return| B169
B169 -->|call| B111
B169 -->|after return| B170
B154["Continue at B155 in section 16"]
B159["Continue at B160 in section 16"]
B111["Continue at B112 in section 12"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B162

```asm
ACALL WCHR
```

### B163

```asm
INC DPTR
AJMP CONT1
```

### B164

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B165

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B166

```asm
MOV R0,#250
DJNZ R0,$
```

### B167

```asm
DJNZ R1,CON4
```

### B168

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B169

```asm
MOV DPTR,#B11
ACALL WSTR
```

### B170

```asm
ACALL TIME
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 458 to 458"]
B170 -->|jump| B170
```

### B171

```asm
AJMP $
```
