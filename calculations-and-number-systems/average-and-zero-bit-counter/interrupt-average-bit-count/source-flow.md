# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 0003H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 5 to 5"]
B2["B3: MAIN - lines 8 to 8"]
B3["B4: instructions - lines 9 to 10"]
B4["B5: instructions - lines 11 to 12"]
B5["B6: instructions - lines 14 to 15"]
B6["B7: instructions - lines 16 to 17"]
B7["B8: instructions - lines 18 to 18"]
B8["B9: instructions - lines 19 to 19"]
B9["B10: instructions - lines 21 to 21"]
B0 -->|jump| B2
B1 -->|jump| B95
B2 -->|call| B117
B2 -->|after return| B3
B3 -->|call| B127
B3 -->|after return| B4
B4 -->|call| B133
B4 -->|after return| B5
B5 -->|call| B127
B5 -->|after return| B6
B6 -->|call| B133
B6 -->|after return| B7
B7 -->|call| B140
B7 -->|after return| B8
B8 -->|call| B140
B8 -->|after return| B9
B9 -->|call| B147
B9 -->|after return| B10
B95["Continue at B96 in section 10"]
B117["Continue at B118 in section 12"]
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B140["Continue at B141 in section 15"]
B147["Continue at B148 in section 15"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
LJMP INTERRUPT0
```

### B3

```asm
ACALL INLCD
```

### B4

```asm
MOV A,#80H
ACALL CMD
```

### B5

```asm
MOV DPTR,#NAME
ACALL WSTR
```

### B6

```asm
MOV A,#0C0H
ACALL CMD
```

### B7

```asm
MOV DPTR,#ID
ACALL WSTR
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
ACALL CLEAR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 22 to 25"]
B11["B12: START - lines 30 to 30"]
B12["B13: instructions - lines 31 to 31"]
B13["B14: instructions - lines 32 to 33"]
B14["B15: instructions - lines 34 to 35"]
B15["B16: instructions - lines 37 to 38"]
B16["B17: instructions - lines 39 to 40"]
B17["B18: instructions - lines 41 to 41"]
B18["B19: instructions - lines 42 to 42"]
B19["B20: instructions - lines 46 to 47"]
B10 -->|next| B11
B11 -->|call| B140
B11 -->|after return| B12
B12 -->|call| B147
B12 -->|after return| B13
B13 -->|call| B127
B13 -->|after return| B14
B14 -->|call| B133
B14 -->|after return| B15
B15 -->|call| B127
B15 -->|after return| B16
B16 -->|call| B133
B16 -->|after return| B17
B17 -->|call| B140
B17 -->|after return| B18
B18 -->|call| B147
B18 -->|after return| B19
B19 -->|call| B127
B19 -->|after return| B20
B140["Continue at B141 in section 15"]
B147["Continue at B148 in section 15"]
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV IE,#10000001B
SETB IT0
CLR P3.6
SETB P3.6
```

### B12

```asm
ACALL DELAY
```

### B13

```asm
ACALL CLEAR
```

### B14

```asm
MOV A,#80H
ACALL CMD
```

### B15

```asm
MOV DPTR,#MENU1
ACALL WSTR
```

### B16

```asm
MOV A,#0C0H
ACALL CMD
```

### B17

```asm
MOV DPTR,#MENU2
ACALL WSTR
```

### B18

```asm
ACALL DELAY
```

### B19

```asm
ACALL CLEAR
```

### B20

```asm
MOV A,#80H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 48 to 49"]
B21["B22: instructions - lines 51 to 52"]
B22["B23: instructions - lines 53 to 54"]
B23["B24: instructions - lines 55 to 55"]
B24["B25: instructions - lines 56 to 56"]
B25["B26: instructions - lines 59 to 60"]
B26["B27: instructions - lines 61 to 62"]
B27["B28: instructions - lines 64 to 65"]
B28["B29: instructions - lines 66 to 67"]
B29["B30: instructions - lines 68 to 68"]
B20 -->|call| B133
B20 -->|after return| B21
B21 -->|call| B127
B21 -->|after return| B22
B22 -->|call| B133
B22 -->|after return| B23
B23 -->|call| B140
B23 -->|after return| B24
B24 -->|call| B147
B24 -->|after return| B25
B25 -->|call| B127
B25 -->|after return| B26
B26 -->|call| B133
B26 -->|after return| B27
B27 -->|call| B127
B27 -->|after return| B28
B28 -->|call| B133
B28 -->|after return| B29
B29 -->|call| B140
B29 -->|after return| B30
B133["Continue at B134 in section 14"]
B127["Continue at B128 in section 13"]
B140["Continue at B141 in section 15"]
B147["Continue at B148 in section 15"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV DPTR,#CHOICE1
ACALL WSTR
```

### B22

```asm
MOV A,#0C0H
ACALL CMD
```

### B23

```asm
MOV DPTR,#CH1
ACALL WSTR
```

### B24

```asm
ACALL DELAY
```

### B25

```asm
ACALL CLEAR
```

### B26

```asm
MOV A,#80H
ACALL CMD
```

### B27

```asm
MOV DPTR,#CHOICE2
ACALL WSTR
```

### B28

```asm
MOV A,#0C0H
ACALL CMD
```

### B29

```asm
MOV DPTR,#CH2
ACALL WSTR
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 69 to 69"]
B31["B32: instructions - lines 72 to 73"]
B32["B33: instructions - lines 74 to 75"]
B33["B34: instructions - lines 76 to 76"]
B34["B35: instructions - lines 77 to 77"]
B35["B36: instructions - lines 82 to 83"]
B36["B37: instructions - lines 84 to 84"]
B37["B38: instructions - lines 87 to 87"]
B38["B39: SELECTION1 - lines 90 to 91"]
B39["B40: instructions - lines 92 to 93"]
B30 -->|call| B147
B30 -->|after return| B31
B31 -->|call| B127
B31 -->|after return| B32
B32 -->|call| B133
B32 -->|after return| B33
B33 -->|call| B138
B33 -->|after return| B34
B34 -->|call| B140
B34 -->|after return| B35
B35 -->|call| B127
B35 -->|after return| B36
B36 -->|call| B100
B36 -->|after return| B37
B37 -->|condition true| B57
B37 -->|condition false| B38
B38 -->|call| B127
B38 -->|after return| B39
B39 -->|call| B133
B39 -->|after return| B40
B147["Continue at B148 in section 15"]
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B138["Continue at B139 in section 14"]
B140["Continue at B141 in section 15"]
B100["Continue at B101 in section 11"]
B57["Continue at B58 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL CLEAR
```

### B32

```asm
MOV A,#80H
ACALL CMD
```

### B33

```asm
MOV DPTR,#CHOICE3
ACALL WSTR
```

### B34

```asm
ACALL LDELAY
```

### B35

```asm
ACALL DELAY
```

### B36

```asm
MOV A,#0C0H
ACALL CMD
```

### B37

```asm
ACALL KEYPAD
```

### B38

```asm
CJNE A,#'1',SELECTION2
```

### B39

```asm
MOV A,#80H
ACALL CMD
```

### B40

```asm
MOV DPTR,#CHO1
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 95 to 96"]
B41["B42: instructions - lines 97 to 98"]
B42["B43: instructions - lines 99 to 99"]
B43["B44: instructions - lines 100 to 100"]
B44["B45: instructions - lines 102 to 102"]
B45["B46: instructions - lines 103 to 103"]
B46["B47: instructions - lines 104 to 109"]
B47["B48: instructions - lines 110 to 110"]
B48["B49: instructions - lines 111 to 114"]
B49["B50: instructions - lines 115 to 124"]
B40 -->|call| B127
B40 -->|after return| B41
B41 -->|call| B133
B41 -->|after return| B42
B42 -->|call| B140
B42 -->|after return| B43
B43 -->|call| B147
B43 -->|after return| B44
B44 -->|call| B100
B44 -->|after return| B45
B45 -->|call| B122
B45 -->|after return| B46
B46 -->|call| B100
B46 -->|after return| B47
B47 -->|call| B122
B47 -->|after return| B48
B48 -->|call| B100
B48 -->|after return| B49
B49 -->|call| B127
B49 -->|after return| B50
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B140["Continue at B141 in section 15"]
B147["Continue at B148 in section 15"]
B100["Continue at B101 in section 11"]
B122["Continue at B123 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#0C0H
ACALL CMD
```

### B42

```asm
MOV DPTR,#CHO11
ACALL WSTR
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
ACALL CLEAR
```

### B45

```asm
ACALL KEYPAD
```

### B46

```asm
ACALL WCHR
```

### B47

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B48

```asm
ACALL WCHR
```

### B49

```asm
SUBB A,#30H
ADD A,R1
MOV R1,A
ACALL KEYPAD
```

### B50

```asm
MOV A,R1
INC A
MOV R2,A
ADD A,R1
MOV B,#2
DIV AB
MOV R2,A
MOV A,#80H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 126 to 127"]
B51["B52: instructions - lines 128 to 129"]
B52["B53: instructions - lines 130 to 134"]
B53["B54: instructions - lines 135 to 135"]
B54["B55: instructions - lines 136 to 138"]
B55["B56: instructions - lines 139 to 139"]
B56["B57: instructions - lines 140 to 140"]
B57["B58: SELECTION2 - lines 143 to 143"]
B58["B59: instructions - lines 145 to 146"]
B59["B60: instructions - lines 147 to 148"]
B50 -->|call| B133
B50 -->|after return| B51
B51 -->|call| B127
B51 -->|after return| B52
B52 -->|call| B122
B52 -->|after return| B53
B53 -->|call| B138
B53 -->|after return| B54
B54 -->|call| B122
B54 -->|after return| B55
B55 -->|call| B140
B55 -->|after return| B56
B56 -->|jump| B56
B57 -->|condition true| B80
B57 -->|condition false| B58
B58 -->|call| B127
B58 -->|after return| B59
B59 -->|call| B133
B59 -->|after return| B60
B133["Continue at B134 in section 14"]
B127["Continue at B128 in section 13"]
B122["Continue at B123 in section 13"]
B138["Continue at B139 in section 14"]
B140["Continue at B141 in section 15"]
B80["Continue at B81 in section 9"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV DPTR,#AVERGAE
ACALL WSTR
```

### B52

```asm
MOV A,#0C0H
ACALL CMD
```

### B53

```asm
MOV A,R2
mov b,#10
div ab
add a,#30h
ACALL WCHR
```

### B54

```asm
acall LDELAY
```

### B55

```asm
mov a,b
add a,#30h
ACALL WCHR
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
SJMP $
```

### B58

```asm
CJNE A,#'2',SELECTION3
```

### B59

```asm
MOV A,#80H
ACALL CMD
```

### B60

```asm
MOV DPTR,#CHO1
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 150 to 151"]
B61["B62: instructions - lines 152 to 153"]
B62["B63: instructions - lines 154 to 154"]
B63["B64: instructions - lines 155 to 155"]
B64["B65: instructions - lines 158 to 158"]
B65["B66: instructions - lines 159 to 159"]
B66["B67: instructions - lines 160 to 165"]
B67["B68: instructions - lines 166 to 166"]
B68["B69: instructions - lines 167 to 171"]
B69["B70: instructions - lines 172 to 173"]
B60 -->|call| B127
B60 -->|after return| B61
B61 -->|call| B133
B61 -->|after return| B62
B62 -->|call| B140
B62 -->|after return| B63
B63 -->|call| B147
B63 -->|after return| B64
B64 -->|call| B100
B64 -->|after return| B65
B65 -->|call| B122
B65 -->|after return| B66
B66 -->|call| B100
B66 -->|after return| B67
B67 -->|call| B122
B67 -->|after return| B68
B68 -->|call| B100
B68 -->|after return| B69
B69 -->|next| B70
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B140["Continue at B141 in section 15"]
B147["Continue at B148 in section 15"]
B100["Continue at B101 in section 11"]
B122["Continue at B123 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#0C0H
ACALL CMD
```

### B62

```asm
MOV DPTR,#CHO12
ACALL WSTR
```

### B63

```asm
ACALL DELAY
```

### B64

```asm
ACALL CLEAR
```

### B65

```asm
ACALL KEYPAD
```

### B66

```asm
ACALL WCHR
```

### B67

```asm
SUBB A,#30H
MOV B,#10H
MUL AB
MOV R3,A
ACALL KEYPAD
```

### B68

```asm
ACALL WCHR
```

### B69

```asm
SUBB A,#30H
ADD A,R3
MOV R3,A
ACALL KEYPAD
```

### B70

```asm
MOV R4,#8
MOV R7,#0
```

## Section 8

```mermaid
flowchart TD
B70["B71: LOOP - lines 176 to 177"]
B71["B72: instructions - lines 178 to 178"]
B72["B73: instructions - lines 179 to 179"]
B73["B74: COUNTZEROS - lines 182 to 183"]
B74["B75: CONTINUEE - lines 187 to 188"]
B75["B76: instructions - lines 190 to 191"]
B76["B77: instructions - lines 192 to 193"]
B77["B78: instructions - lines 196 to 198"]
B78["B79: instructions - lines 199 to 199"]
B79["B80: instructions - lines 202 to 202"]
B70 -->|condition true| B73
B70 -->|condition false| B71
B71 -->|condition true| B70
B71 -->|condition false| B72
B72 -->|jump| B74
B73 -->|condition true| B70
B73 -->|condition false| B74
B74 -->|call| B127
B74 -->|after return| B75
B75 -->|call| B133
B75 -->|after return| B76
B76 -->|call| B127
B76 -->|after return| B77
B77 -->|call| B122
B77 -->|after return| B78
B78 -->|call| B140
B78 -->|after return| B79
B79 -->|jump| B79
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B122["Continue at B123 in section 13"]
B140["Continue at B141 in section 15"]
```

### B71

```asm
RRC A
JNC COUNTZEROS
```

### B72

```asm
DJNZ R4,LOOP
```

### B73

```asm
SJMP CONTINUEE
```

### B74

```asm
INC R7
DJNZ R4,LOOP
```

### B75

```asm
MOV A,#80H
ACALL CMD
```

### B76

```asm
MOV DPTR,#HEXA
ACALL WSTR
```

### B77

```asm
MOV A,#0C0H
ACALL CMD
```

### B78

```asm
MOV A,R7
add a,#30h
ACALL WCHR
```

### B79

```asm
acall DELAY
```

### B80

```asm
SJMP $
```

## Section 9

```mermaid
flowchart TD
B80["B81: SELECTION3 - lines 205 to 205"]
B81["B82: instructions - lines 207 to 208"]
B82["B83: instructions - lines 209 to 210"]
B83["B84: instructions - lines 211 to 211"]
B84["B85: instructions - lines 213 to 213"]
B85["B86: ERROR - lines 218 to 219"]
B86["B87: LOOP1 - lines 220 to 220"]
B87["B88: instructions - lines 221 to 222"]
B88["B89: instructions - lines 224 to 224"]
B89["B90: instructions - lines 225 to 225"]
B80 -->|condition true| B85
B80 -->|condition false| B81
B81 -->|call| B127
B81 -->|after return| B82
B82 -->|call| B133
B82 -->|after return| B83
B83 -->|call| B140
B83 -->|after return| B84
B84 -->|jump| B84
B85 -->|next| B86
B86 -->|call| B138
B86 -->|after return| B87
B87 -->|condition true| B86
B87 -->|condition false| B88
B88 -->|call| B140
B88 -->|after return| B89
B89 -->|call| B147
B89 -->|after return| B90
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B140["Continue at B141 in section 15"]
B138["Continue at B139 in section 14"]
B147["Continue at B148 in section 15"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CJNE A,#'3',ERROR
```

### B82

```asm
MOV A,#80H
ACALL CMD
```

### B83

```asm
MOV DPTR,#EXIT
ACALL WSTR
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
SJMP $
```

### B86

```asm
CLR P1.0
MOV R7,#3
```

### B87

```asm
ACALL LDELAY
```

### B88

```asm
SETB P1.0
DJNZ R7,LOOP1
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
ACALL CLEAR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 229 to 230"]
B91["B92: instructions - lines 231 to 232"]
B92["B93: instructions - lines 233 to 233"]
B93["B94: instructions - lines 234 to 234"]
B94["B95: instructions - lines 235 to 235"]
B95["B96: INTERRUPT0 - lines 238 to 239"]
B96["B97: instructions - lines 240 to 241"]
B97["B98: instructions - lines 242 to 242"]
B98["B99: instructions - lines 243 to 243"]
B99["B100: instructions - lines 244 to 244"]
B90 -->|call| B127
B90 -->|after return| B91
B91 -->|call| B133
B91 -->|after return| B92
B92 -->|call| B140
B92 -->|after return| B93
B93 -->|call| B140
B93 -->|after return| B94
B94 -->|jump| B11
B95 -->|call| B127
B95 -->|after return| B96
B96 -->|call| B133
B96 -->|after return| B97
B97 -->|call| B100
B97 -->|after return| B98
B98 -->|condition true| B95
B98 -->|condition false| B99
B127["Continue at B128 in section 13"]
B133["Continue at B134 in section 14"]
B140["Continue at B141 in section 15"]
B11["Continue at B12 in section 2"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#80H
ACALL CMD
```

### B92

```asm
MOV DPTR,#ERRORMESSAGE
ACALL WSTR
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
AJMP START
```

### B96

```asm
MOV A,#80H
ACALL CMD
```

### B97

```asm
MOV DPTR,#INTERRUPT
ACALL WSTR
```

### B98

```asm
ACALL KEYPAD
```

### B99

```asm
CJNE A,#'*',INTERRUPT0
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: KEYPAD - lines 248 to 248"]
B101["B102: K1 - lines 249 to 252"]
B102["B103: K2 - lines 254 to 256"]
B103["B104: instructions - lines 257 to 257"]
B104["B105: OVER1 - lines 260 to 263"]
B105["B106: instructions - lines 264 to 267"]
B106["B107: instructions - lines 268 to 271"]
B107["B108: instructions - lines 272 to 275"]
B108["B109: instructions - lines 276 to 276"]
B109["B110: ROW_0 - lines 277 to 278"]
B100 -->|next| B101
B101 -->|condition true| B101
B101 -->|condition false| B102
B102 -->|condition true| B104
B102 -->|condition false| B103
B103 -->|jump| B102
B104 -->|condition true| B109
B104 -->|condition false| B105
B105 -->|condition true| B110
B105 -->|condition false| B106
B106 -->|condition true| B111
B106 -->|condition false| B107
B107 -->|condition true| B112
B107 -->|condition false| B108
B108 -->|jump| B102
B109 -->|jump| B113
B110["Continue at B111 in section 12"]
B111["Continue at B112 in section 12"]
B112["Continue at B113 in section 12"]
B113["Continue at B114 in section 12"]
```

### B101

```asm
MOV P0,#01110000B
```

### B102

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B103

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B104

```asm
SJMP K2
```

### B105

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B106

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B107

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B108

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B109

```asm
LJMP K2
```

### B110

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 12

```mermaid
flowchart TD
B110["B111: ROW_1 - lines 279 to 280"]
B111["B112: ROW_2 - lines 281 to 282"]
B112["B113: ROW_3 - lines 283 to 283"]
B113["B114: FIND - lines 286 to 286"]
B114["B115: FIND1 - lines 288 to 289"]
B115["B116: instructions - lines 290 to 291"]
B116["B117: MATCH - lines 292 to 294"]
B117["B118: INLCD - lines 298 to 306"]
B118["B119: instructions - lines 308 to 317"]
B119["B120: instructions - lines 319 to 334"]
B110 -->|jump| B113
B111 -->|jump| B113
B112 -->|next| B113
B113 -->|next| B114
B114 -->|condition true| B116
B114 -->|condition false| B115
B115 -->|jump| B114
B117 -->|call| B138
B117 -->|after return| B118
B118 -->|call| B138
B118 -->|after return| B119
B119 -->|call| B138
B119 -->|after return| B120
B138["Continue at B139 in section 14"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B112

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B113

```asm
MOV DPTR,#KCODE3
```

### B114

```asm
RLC A
```

### B115

```asm
RLC A
JNC MATCH
```

### B116

```asm
INC DPTR
SJMP FIND1
```

### B117

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B118

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

### B119

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

### B120

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

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 336 to 348"]
B121["B122: instructions - lines 349 to 349"]
B122["B123: WCHR - lines 354 to 358"]
B123["B124: instructions - lines 359 to 359"]
B124["B125: instructions - lines 360 to 362"]
B125["B126: instructions - lines 363 to 363"]
B126["B127: instructions - lines 364 to 366"]
B127["B128: CMD - lines 369 to 371"]
B128["B129: instructions - lines 372 to 372"]
B129["B130: instructions - lines 373 to 375"]
B120 -->|call| B138
B120 -->|after return| B121
B122 -->|call| B132
B122 -->|after return| B123
B123 -->|call| B138
B123 -->|after return| B124
B124 -->|call| B132
B124 -->|after return| B125
B125 -->|call| B138
B125 -->|after return| B126
B127 -->|call| B132
B127 -->|after return| B128
B128 -->|call| B138
B128 -->|after return| B129
B129 -->|call| B132
B129 -->|after return| B130
B138["Continue at B139 in section 14"]
B132["Continue at B133 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

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

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B124

```asm
ACALL LDELAY
```

### B125

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B126

```asm
ACALL LDELAY
```

### B127

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B128

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B129

```asm
ACALL LDELAY
```

### B130

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 376 to 376"]
B131["B132: instructions - lines 377 to 377"]
B132["B133: COMMON - lines 381 to 386"]
B133["B134: WSTR - lines 390 to 390"]
B134["B135: CONT1 - lines 392 to 394"]
B135["B136: PRINT - lines 396 to 396"]
B136["B137: instructions - lines 397 to 398"]
B137["B138: EXIT1 - lines 399 to 400"]
B138["B139: LDELAY - lines 404 to 405"]
B139["B140: instructions - lines 406 to 406"]
B130 -->|call| B138
B130 -->|after return| B131
B133 -->|next| B134
B134 -->|condition true| B137
B134 -->|condition false| B135
B135 -->|call| B122
B135 -->|after return| B136
B136 -->|jump| B134
B138 -->|condition true| B138
B138 -->|condition false| B139
B122["Continue at B123 in section 13"]
```

### B131

```asm
ACALL LDELAY
```

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B134

```asm
PUSH    ACC
```

### B135

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B136

```asm
ACALL    WCHR
```

### B137

```asm
INC DPTR
AJMP    CONT1
```

### B138

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B139

```asm
MOV R0, #50
DJNZ R0, $
```

### B140

Return to the instruction following the active call.

```asm
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: DELAY - lines 408 to 408"]
B141["B142: X3 - lines 409 to 409"]
B142["B143: X2 - lines 410 to 410"]
B143["B144: X1 - lines 411 to 411"]
B144["B145: instructions - lines 412 to 412"]
B145["B146: instructions - lines 413 to 413"]
B146["B147: instructions - lines 414 to 414"]
B147["B148: CLEAR - lines 417 to 418"]
B148["B149: instructions - lines 419 to 419"]
B149["B150: WAIT1 - lines 420 to 420"]
B140 -->|next| B141
B141 -->|next| B142
B142 -->|next| B143
B143 -->|condition true| B143
B143 -->|condition false| B144
B144 -->|condition true| B142
B144 -->|condition false| B145
B145 -->|condition true| B141
B145 -->|condition false| B146
B147 -->|call| B127
B147 -->|after return| B148
B148 -->|next| B149
B149 -->|call| B138
B149 -->|after return| B150
B127["Continue at B128 in section 13"]
B138["Continue at B139 in section 14"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV R5,#2
```

### B142

```asm
MOV R4,#20
```

### B143

```asm
MOV R3,#250
```

### B144

```asm
DJNZ R3,X1
```

### B145

```asm
DJNZ R4,X2
```

### B146

```asm
DJNZ R5,X3
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
B150["B151: instructions - lines 421 to 421"]
B151["B152: instructions - lines 422 to 422"]
B152["B153: STOP - lines 468 to 468"]
B150 -->|condition true| B149
B150 -->|condition false| B151
B152 -->|jump| B152
B149["Continue at B150 in section 15"]
```

### B151

```asm
DJNZ R7,WAIT1
```

### B152

Return to the instruction following the active call.

```asm
RET
```

### B153

```asm
SJMP $
```
