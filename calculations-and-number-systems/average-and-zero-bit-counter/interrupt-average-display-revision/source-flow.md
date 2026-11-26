# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 5 to 6"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 10 to 11"]
B4["B5: instructions - lines 12 to 13"]
B5["B6: instructions - lines 14 to 14"]
B6["B7: instructions - lines 15 to 15"]
B7["B8: START - lines 20 to 20"]
B8["B9: instructions - lines 21 to 21"]
B9["B10: instructions - lines 22 to 23"]
B0 -->|call| B106
B0 -->|after return| B1
B1 -->|call| B116
B1 -->|after return| B2
B2 -->|call| B122
B2 -->|after return| B3
B3 -->|call| B116
B3 -->|after return| B4
B4 -->|call| B122
B4 -->|after return| B5
B5 -->|call| B129
B5 -->|after return| B6
B6 -->|call| B129
B6 -->|after return| B7
B7 -->|call| B129
B7 -->|after return| B8
B8 -->|call| B136
B8 -->|after return| B9
B9 -->|call| B116
B9 -->|after return| B10
B106["Continue at B107 in section 11"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B129["Continue at B130 in section 13"]
B136["Continue at B137 in section 14"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A,#80H
ACALL CMD
```

### B3

```asm
MOV DPTR,#NAME
ACALL WSTR
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
MOV DPTR,#ID
ACALL WSTR
```

### B6

```asm
ACALL DELAY
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
ACALL CLEAR
```

### B10

```asm
MOV A,#80H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 24 to 25"]
B11["B12: instructions - lines 27 to 28"]
B12["B13: instructions - lines 29 to 30"]
B13["B14: instructions - lines 31 to 31"]
B14["B15: instructions - lines 32 to 32"]
B15["B16: instructions - lines 36 to 37"]
B16["B17: instructions - lines 38 to 39"]
B17["B18: instructions - lines 41 to 42"]
B18["B19: instructions - lines 43 to 44"]
B19["B20: instructions - lines 45 to 45"]
B10 -->|call| B122
B10 -->|after return| B11
B11 -->|call| B116
B11 -->|after return| B12
B12 -->|call| B122
B12 -->|after return| B13
B13 -->|call| B129
B13 -->|after return| B14
B14 -->|call| B136
B14 -->|after return| B15
B15 -->|call| B116
B15 -->|after return| B16
B16 -->|call| B122
B16 -->|after return| B17
B17 -->|call| B116
B17 -->|after return| B18
B18 -->|call| B122
B18 -->|after return| B19
B19 -->|call| B129
B19 -->|after return| B20
B122["Continue at B123 in section 13"]
B116["Continue at B117 in section 12"]
B129["Continue at B130 in section 13"]
B136["Continue at B137 in section 14"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#MENU1
ACALL WSTR
```

### B12

```asm
MOV A,#0C0H
ACALL CMD
```

### B13

```asm
MOV DPTR,#MENU2
ACALL WSTR
```

### B14

```asm
ACALL DELAY
```

### B15

```asm
ACALL CLEAR
```

### B16

```asm
MOV A,#80H
ACALL CMD
```

### B17

```asm
MOV DPTR,#CHOICE1
ACALL WSTR
```

### B18

```asm
MOV A,#0C0H
ACALL CMD
```

### B19

```asm
MOV DPTR,#CH1
ACALL WSTR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 46 to 46"]
B21["B22: instructions - lines 49 to 50"]
B22["B23: instructions - lines 51 to 52"]
B23["B24: instructions - lines 54 to 55"]
B24["B25: instructions - lines 56 to 57"]
B25["B26: instructions - lines 58 to 58"]
B26["B27: instructions - lines 59 to 59"]
B27["B28: instructions - lines 62 to 63"]
B28["B29: instructions - lines 64 to 65"]
B29["B30: instructions - lines 66 to 66"]
B20 -->|call| B136
B20 -->|after return| B21
B21 -->|call| B116
B21 -->|after return| B22
B22 -->|call| B122
B22 -->|after return| B23
B23 -->|call| B116
B23 -->|after return| B24
B24 -->|call| B122
B24 -->|after return| B25
B25 -->|call| B129
B25 -->|after return| B26
B26 -->|call| B136
B26 -->|after return| B27
B27 -->|call| B116
B27 -->|after return| B28
B28 -->|call| B122
B28 -->|after return| B29
B29 -->|call| B127
B29 -->|after return| B30
B136["Continue at B137 in section 14"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B129["Continue at B130 in section 13"]
B127["Continue at B128 in section 13"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL CLEAR
```

### B22

```asm
MOV A,#80H
ACALL CMD
```

### B23

```asm
MOV DPTR,#CHOICE2
ACALL WSTR
```

### B24

```asm
MOV A,#0C0H
ACALL CMD
```

### B25

```asm
MOV DPTR,#CH2
ACALL WSTR
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
ACALL CLEAR
```

### B28

```asm
MOV A,#80H
ACALL CMD
```

### B29

```asm
MOV DPTR,#CHOICE3
ACALL WSTR
```

### B30

```asm
ACALL LDELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 67 to 67"]
B31["B32: instructions - lines 72 to 73"]
B32["B33: instructions - lines 74 to 74"]
B33["B34: instructions - lines 76 to 76"]
B34["B35: SELECTION1 - lines 79 to 80"]
B35["B36: instructions - lines 81 to 82"]
B36["B37: instructions - lines 84 to 85"]
B37["B38: instructions - lines 86 to 87"]
B38["B39: instructions - lines 88 to 88"]
B39["B40: instructions - lines 89 to 89"]
B30 -->|call| B129
B30 -->|after return| B31
B31 -->|call| B116
B31 -->|after return| B32
B32 -->|call| B89
B32 -->|after return| B33
B33 -->|condition true| B52
B33 -->|condition false| B34
B34 -->|call| B116
B34 -->|after return| B35
B35 -->|call| B122
B35 -->|after return| B36
B36 -->|call| B116
B36 -->|after return| B37
B37 -->|call| B122
B37 -->|after return| B38
B38 -->|call| B129
B38 -->|after return| B39
B39 -->|call| B136
B39 -->|after return| B40
B129["Continue at B130 in section 13"]
B116["Continue at B117 in section 12"]
B89["Continue at B90 in section 9"]
B52["Continue at B53 in section 6"]
B122["Continue at B123 in section 13"]
B136["Continue at B137 in section 14"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL DELAY
```

### B32

```asm
MOV A,#0C0H
ACALL CMD
```

### B33

```asm
ACALL KEYPAD
```

### B34

```asm
CJNE A,#'1',SELECTION2
```

### B35

```asm
MOV A,#80H
ACALL CMD
```

### B36

```asm
MOV DPTR,#CHO1
ACALL WSTR
```

### B37

```asm
MOV A,#0C0H
ACALL CMD
```

### B38

```asm
MOV DPTR,#CHO11
ACALL WSTR
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 91 to 91"]
B41["B42: instructions - lines 92 to 92"]
B42["B43: instructions - lines 93 to 98"]
B43["B44: instructions - lines 99 to 99"]
B44["B45: instructions - lines 100 to 112"]
B45["B46: instructions - lines 114 to 115"]
B46["B47: instructions - lines 116 to 117"]
B47["B48: instructions - lines 118 to 122"]
B48["B49: instructions - lines 123 to 123"]
B49["B50: instructions - lines 124 to 126"]
B40 -->|call| B89
B40 -->|after return| B41
B41 -->|call| B111
B41 -->|after return| B42
B42 -->|call| B89
B42 -->|after return| B43
B43 -->|call| B111
B43 -->|after return| B44
B44 -->|call| B116
B44 -->|after return| B45
B45 -->|call| B122
B45 -->|after return| B46
B46 -->|call| B116
B46 -->|after return| B47
B47 -->|call| B111
B47 -->|after return| B48
B48 -->|call| B127
B48 -->|after return| B49
B49 -->|call| B111
B49 -->|after return| B50
B89["Continue at B90 in section 9"]
B111["Continue at B112 in section 12"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B127["Continue at B128 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL KEYPAD
```

### B42

```asm
ACALL WCHR
```

### B43

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B44

```asm
ACALL WCHR
```

### B45

```asm
SUBB A,#30H
ADD A,R1
MOV R1,A
INC A
MOV R2,A
ADD A,R1
MOV B,#2
DIV AB
MOV R2,A
MOV A,#80H
ACALL CMD
```

### B46

```asm
MOV DPTR,#AVERGAE
ACALL WSTR
```

### B47

```asm
MOV A,#0C0H
ACALL CMD
```

### B48

```asm
MOV A,R2
mov b,#10
div ab
add a,#30h
ACALL WCHR
```

### B49

```asm
acall LDELAY
```

### B50

```asm
mov a,b
add a,#30h
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 127 to 127"]
B51["B52: instructions - lines 128 to 128"]
B52["B53: SELECTION2 - lines 131 to 131"]
B53["B54: instructions - lines 133 to 134"]
B54["B55: instructions - lines 135 to 136"]
B55["B56: instructions - lines 138 to 139"]
B56["B57: instructions - lines 140 to 141"]
B57["B58: instructions - lines 142 to 142"]
B58["B59: instructions - lines 143 to 143"]
B59["B60: instructions - lines 146 to 146"]
B50 -->|call| B129
B50 -->|after return| B51
B51 -->|jump| B51
B52 -->|condition true| B74
B52 -->|condition false| B53
B53 -->|call| B116
B53 -->|after return| B54
B54 -->|call| B122
B54 -->|after return| B55
B55 -->|call| B116
B55 -->|after return| B56
B56 -->|call| B122
B56 -->|after return| B57
B57 -->|call| B129
B57 -->|after return| B58
B58 -->|call| B136
B58 -->|after return| B59
B59 -->|call| B89
B59 -->|after return| B60
B129["Continue at B130 in section 13"]
B74["Continue at B75 in section 8"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B136["Continue at B137 in section 14"]
B89["Continue at B90 in section 9"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
SJMP $
```

### B53

```asm
CJNE A,#'2',SELECTION3
```

### B54

```asm
MOV A,#80H
ACALL CMD
```

### B55

```asm
MOV DPTR,#CHO1
ACALL WSTR
```

### B56

```asm
MOV A,#0C0H
ACALL CMD
```

### B57

```asm
MOV DPTR,#CHO12
ACALL WSTR
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
ACALL CLEAR
```

### B60

```asm
ACALL KEYPAD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 147 to 147"]
B61["B62: instructions - lines 148 to 153"]
B62["B63: instructions - lines 154 to 154"]
B63["B64: instructions - lines 155 to 161"]
B64["B65: LOOP - lines 164 to 165"]
B65["B66: instructions - lines 166 to 166"]
B66["B67: instructions - lines 167 to 167"]
B67["B68: COUNTZEROS - lines 170 to 171"]
B68["B69: CONTINUEE - lines 175 to 176"]
B69["B70: instructions - lines 178 to 179"]
B60 -->|call| B111
B60 -->|after return| B61
B61 -->|call| B89
B61 -->|after return| B62
B62 -->|call| B111
B62 -->|after return| B63
B63 -->|next| B64
B64 -->|condition true| B67
B64 -->|condition false| B65
B65 -->|condition true| B64
B65 -->|condition false| B66
B66 -->|jump| B68
B67 -->|condition true| B64
B67 -->|condition false| B68
B68 -->|call| B116
B68 -->|after return| B69
B69 -->|call| B122
B69 -->|after return| B70
B111["Continue at B112 in section 12"]
B89["Continue at B90 in section 9"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL WCHR
```

### B62

```asm
SUBB A,#30H
MOV B,#10H
MUL AB
MOV R3,A
ACALL KEYPAD
```

### B63

```asm
ACALL WCHR
```

### B64

```asm
SUBB A,#30H
ADD A,R3
MOV R3,A
MOV R4,#8
MOV R7,#0
```

### B65

```asm
RRC A
JNC COUNTZEROS
```

### B66

```asm
DJNZ R4,LOOP
```

### B67

```asm
SJMP CONTINUEE
```

### B68

```asm
INC R7
DJNZ R4,LOOP
```

### B69

```asm
MOV A,#80H
ACALL CMD
```

### B70

```asm
MOV DPTR,#HEXA
ACALL WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 180 to 181"]
B71["B72: instructions - lines 184 to 186"]
B72["B73: instructions - lines 187 to 187"]
B73["B74: instructions - lines 190 to 190"]
B74["B75: SELECTION3 - lines 193 to 193"]
B75["B76: instructions - lines 195 to 196"]
B76["B77: instructions - lines 197 to 198"]
B77["B78: instructions - lines 199 to 199"]
B78["B79: instructions - lines 201 to 201"]
B79["B80: ERROR - lines 206 to 207"]
B70 -->|call| B116
B70 -->|after return| B71
B71 -->|call| B111
B71 -->|after return| B72
B72 -->|call| B129
B72 -->|after return| B73
B73 -->|jump| B73
B74 -->|condition true| B79
B74 -->|condition false| B75
B75 -->|call| B116
B75 -->|after return| B76
B76 -->|call| B122
B76 -->|after return| B77
B77 -->|call| B129
B77 -->|after return| B78
B78 -->|jump| B78
B79 -->|next| B80
B116["Continue at B117 in section 12"]
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B122["Continue at B123 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#0C0H
ACALL CMD
```

### B72

```asm
MOV A,R7
add a,#30h
ACALL WCHR
```

### B73

```asm
acall DELAY
```

### B74

```asm
SJMP $
```

### B75

```asm
CJNE A,#'3',ERROR
```

### B76

```asm
MOV A,#80H
ACALL CMD
```

### B77

```asm
MOV DPTR,#EXIT
ACALL WSTR
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
SJMP $
```

### B80

```asm
CLR P1.0
MOV R7,#3
```

## Section 9

```mermaid
flowchart TD
B80["B81: LOOP1 - lines 208 to 208"]
B81["B82: instructions - lines 209 to 210"]
B82["B83: instructions - lines 212 to 212"]
B83["B84: instructions - lines 213 to 213"]
B84["B85: instructions - lines 217 to 218"]
B85["B86: instructions - lines 219 to 220"]
B86["B87: instructions - lines 221 to 221"]
B87["B88: instructions - lines 222 to 222"]
B88["B89: instructions - lines 223 to 223"]
B89["B90: KEYPAD - lines 228 to 228"]
B80 -->|call| B127
B80 -->|after return| B81
B81 -->|condition true| B80
B81 -->|condition false| B82
B82 -->|call| B129
B82 -->|after return| B83
B83 -->|call| B136
B83 -->|after return| B84
B84 -->|call| B116
B84 -->|after return| B85
B85 -->|call| B122
B85 -->|after return| B86
B86 -->|call| B129
B86 -->|after return| B87
B87 -->|call| B129
B87 -->|after return| B88
B88 -->|jump| B7
B89 -->|next| B90
B127["Continue at B128 in section 13"]
B129["Continue at B130 in section 13"]
B136["Continue at B137 in section 14"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B7["Continue at B8 in section 1"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL LDELAY
```

### B82

```asm
SETB P1.0
DJNZ R7,LOOP1
```

### B83

```asm
ACALL DELAY
```

### B84

```asm
ACALL CLEAR
```

### B85

```asm
MOV A,#80H
ACALL CMD
```

### B86

```asm
MOV DPTR,#ERRORMESSAGE
ACALL WSTR
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
AJMP START
```

### B90

```asm
MOV P0,#01110000B
```

## Section 10

```mermaid
flowchart TD
B90["B91: K1 - lines 229 to 232"]
B91["B92: K2 - lines 234 to 236"]
B92["B93: instructions - lines 237 to 237"]
B93["B94: OVER1 - lines 240 to 243"]
B94["B95: instructions - lines 244 to 247"]
B95["B96: instructions - lines 248 to 251"]
B96["B97: instructions - lines 252 to 255"]
B97["B98: instructions - lines 256 to 256"]
B98["B99: ROW_0 - lines 257 to 258"]
B99["B100: ROW_1 - lines 259 to 260"]
B90 -->|condition true| B90
B90 -->|condition false| B91
B91 -->|condition true| B93
B91 -->|condition false| B92
B92 -->|jump| B91
B93 -->|condition true| B98
B93 -->|condition false| B94
B94 -->|condition true| B99
B94 -->|condition false| B95
B95 -->|condition true| B100
B95 -->|condition false| B96
B96 -->|condition true| B101
B96 -->|condition false| B97
B97 -->|jump| B91
B98 -->|jump| B102
B99 -->|jump| B102
B100["Continue at B101 in section 11"]
B101["Continue at B102 in section 11"]
B102["Continue at B103 in section 11"]
```

### B91

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B92

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B93

```asm
SJMP K2
```

### B94

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B95

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B96

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B97

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B98

```asm
LJMP K2
```

### B99

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B100

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

## Section 11

```mermaid
flowchart TD
B100["B101: ROW_2 - lines 261 to 262"]
B101["B102: ROW_3 - lines 263 to 263"]
B102["B103: FIND - lines 266 to 266"]
B103["B104: FIND1 - lines 268 to 269"]
B104["B105: instructions - lines 270 to 271"]
B105["B106: MATCH - lines 272 to 274"]
B106["B107: INLCD - lines 278 to 286"]
B107["B108: instructions - lines 288 to 297"]
B108["B109: instructions - lines 299 to 314"]
B109["B110: instructions - lines 316 to 328"]
B100 -->|jump| B102
B101 -->|next| B102
B102 -->|next| B103
B103 -->|condition true| B105
B103 -->|condition false| B104
B104 -->|jump| B103
B106 -->|call| B127
B106 -->|after return| B107
B107 -->|call| B127
B107 -->|after return| B108
B108 -->|call| B127
B108 -->|after return| B109
B109 -->|call| B127
B109 -->|after return| B110
B127["Continue at B128 in section 13"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B102

```asm
MOV DPTR,#KCODE3
```

### B103

```asm
RLC A
```

### B104

```asm
RLC A
JNC MATCH
```

### B105

```asm
INC DPTR
SJMP FIND1
```

### B106

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B107

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

### B108

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

### B109

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

### B110

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

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 329 to 329"]
B111["B112: WCHR - lines 334 to 338"]
B112["B113: instructions - lines 339 to 339"]
B113["B114: instructions - lines 340 to 342"]
B114["B115: instructions - lines 343 to 343"]
B115["B116: instructions - lines 344 to 346"]
B116["B117: CMD - lines 349 to 351"]
B117["B118: instructions - lines 352 to 352"]
B118["B119: instructions - lines 353 to 355"]
B119["B120: instructions - lines 356 to 356"]
B111 -->|call| B121
B111 -->|after return| B112
B112 -->|call| B127
B112 -->|after return| B113
B113 -->|call| B121
B113 -->|after return| B114
B114 -->|call| B127
B114 -->|after return| B115
B116 -->|call| B121
B116 -->|after return| B117
B117 -->|call| B127
B117 -->|after return| B118
B118 -->|call| B121
B118 -->|after return| B119
B119 -->|call| B127
B119 -->|after return| B120
B121["Continue at B122 in section 13"]
B127["Continue at B128 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
RET
```

### B112

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B113

```asm
ACALL LDELAY
```

### B114

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B115

```asm
ACALL LDELAY
```

### B116

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B117

```asm
CLR P1.3
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
B120["B121: instructions - lines 357 to 357"]
B121["B122: COMMON - lines 361 to 366"]
B122["B123: WSTR - lines 370 to 370"]
B123["B124: CONT1 - lines 372 to 374"]
B124["B125: PRINT - lines 376 to 376"]
B125["B126: instructions - lines 377 to 378"]
B126["B127: EXIT1 - lines 379 to 380"]
B127["B128: LDELAY - lines 384 to 385"]
B128["B129: instructions - lines 386 to 386"]
B129["B130: DELAY - lines 388 to 388"]
B122 -->|next| B123
B123 -->|condition true| B126
B123 -->|condition false| B124
B124 -->|call| B111
B124 -->|after return| B125
B125 -->|jump| B123
B127 -->|condition true| B127
B127 -->|condition false| B128
B129 -->|next| B130
B111["Continue at B112 in section 12"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
RET
```

### B122

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B123

```asm
PUSH    ACC
```

### B124

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B125

```asm
ACALL    WCHR
```

### B126

```asm
INC DPTR
AJMP    CONT1
```

### B127

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B128

```asm
MOV R0, #50
DJNZ R0, $
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
MOV R5,#2
```

## Section 14

```mermaid
flowchart TD
B130["B131: X3 - lines 389 to 389"]
B131["B132: X2 - lines 390 to 390"]
B132["B133: X1 - lines 391 to 391"]
B133["B134: instructions - lines 392 to 392"]
B134["B135: instructions - lines 393 to 393"]
B135["B136: instructions - lines 394 to 394"]
B136["B137: CLEAR - lines 397 to 398"]
B137["B138: instructions - lines 399 to 399"]
B138["B139: WAIT1 - lines 400 to 400"]
B139["B140: instructions - lines 401 to 401"]
B130 -->|next| B131
B131 -->|next| B132
B132 -->|condition true| B132
B132 -->|condition false| B133
B133 -->|condition true| B131
B133 -->|condition false| B134
B134 -->|condition true| B130
B134 -->|condition false| B135
B136 -->|call| B116
B136 -->|after return| B137
B137 -->|next| B138
B138 -->|call| B127
B138 -->|after return| B139
B139 -->|condition true| B138
B139 -->|condition false| B140
B116["Continue at B117 in section 12"]
B127["Continue at B128 in section 13"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV R4,#20
```

### B132

```asm
MOV R3,#250
```

### B133

```asm
DJNZ R3,X1
```

### B134

```asm
DJNZ R4,X2
```

### B135

```asm
DJNZ R5,X3
```

### B136

Return to the instruction following the active call.

```asm
RET
```

### B137

```asm
MOV A,#01H
ACALL CMD
```

### B138

```asm
MOV R7,#14
```

### B139

```asm
ACALL LDELAY
```

### B140

```asm
DJNZ R7,WAIT1
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 402 to 402"]
B141["B142: STOP - lines 447 to 447"]
B141 -->|jump| B141
```

### B141

Return to the instruction following the active call.

```asm
RET
```

### B142

```asm
SJMP $
```
