# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25)

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
83: ////////////////////////////////////////////////////////////////////////////////////////////////////////////
117: ///////////OP1
201: ///////////////END OF OP1
203: ///////////////OP2
285: ////////////////////////OP3
363: ///////////////////////
365: /////////////////////OP4
424: /////////////////////////
```

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 10 to 10"]
B1["B2: instructions - lines 12 to 13"]
B2["B3: instructions - lines 14 to 14"]
B3["B4: instructions - lines 16 to 17"]
B4["B5: instructions - lines 18 to 18"]
B5["B6: instructions - lines 20 to 21"]
B6["B7: instructions - lines 22 to 22"]
B7["B8: MENU - lines 27 to 28"]
B8["B9: instructions - lines 29 to 29"]
B9["B10: instructions - lines 31 to 32"]
B0 -->|call| B207
B0 -->|after return| B1
B1 -->|call| B235
B1 -->|after return| B2
B2 -->|call| B193
B2 -->|after return| B3
B3 -->|call| B227
B3 -->|after return| B4
B4 -->|call| B193
B4 -->|after return| B5
B5 -->|call| B235
B5 -->|after return| B6
B6 -->|call| B193
B6 -->|after return| B7
B7 -->|call| B227
B7 -->|after return| B8
B8 -->|call| B193
B8 -->|after return| B9
B9 -->|call| B235
B9 -->|after return| B10
B207["Continue at B208 in section 21"]
B235["Continue at B236 in section 24"]
B193["Continue at B194 in section 20"]
B227["Continue at B228 in section 23"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV DPTR,#A1
ACALL WSTR
```

### B3

```asm
ACALL TIME
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
ACALL TIME
```

### B6

```asm
MOV DPTR,#A2
ACALL WSTR
```

### B7

```asm
ACALL TIME
```

### B8

```asm
MOV A,#1
ACALL CMD
```

### B9

```asm
ACALL TIME
```

### B10

```asm
MOV DPTR,#A3
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 33"]
B11["B12: instructions - lines 35 to 36"]
B12["B13: instructions - lines 37 to 37"]
B13["B14: instructions - lines 39 to 40"]
B14["B15: instructions - lines 41 to 41"]
B15["B16: instructions - lines 43 to 44"]
B16["B17: instructions - lines 45 to 45"]
B17["B18: instructions - lines 47 to 48"]
B18["B19: instructions - lines 49 to 49"]
B19["B20: instructions - lines 51 to 52"]
B10 -->|call| B193
B10 -->|after return| B11
B11 -->|call| B227
B11 -->|after return| B12
B12 -->|call| B193
B12 -->|after return| B13
B13 -->|call| B235
B13 -->|after return| B14
B14 -->|call| B193
B14 -->|after return| B15
B15 -->|call| B227
B15 -->|after return| B16
B16 -->|call| B193
B16 -->|after return| B17
B17 -->|call| B235
B17 -->|after return| B18
B18 -->|call| B193
B18 -->|after return| B19
B19 -->|call| B227
B19 -->|after return| B20
B193["Continue at B194 in section 20"]
B227["Continue at B228 in section 23"]
B235["Continue at B236 in section 24"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL TIME
```

### B12

```asm
MOV A,#0C0H
ACALL CMD
```

### B13

```asm
ACALL TIME
```

### B14

```asm
MOV DPTR,#A4
ACALL WSTR
```

### B15

```asm
ACALL TIME
```

### B16

```asm
MOV A,#1
ACALL CMD
```

### B17

```asm
ACALL TIME
```

### B18

```asm
MOV DPTR,#A5
ACALL WSTR
```

### B19

```asm
ACALL TIME
```

### B20

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 53 to 53"]
B21["B22: instructions - lines 55 to 56"]
B22["B23: instructions - lines 57 to 57"]
B23["B24: instructions - lines 59 to 60"]
B24["B25: instructions - lines 61 to 61"]
B25["B26: instructions - lines 63 to 64"]
B26["B27: instructions - lines 65 to 65"]
B27["B28: instructions - lines 67 to 68"]
B28["B29: instructions - lines 69 to 69"]
B29["B30: instructions - lines 71 to 72"]
B20 -->|call| B193
B20 -->|after return| B21
B21 -->|call| B235
B21 -->|after return| B22
B22 -->|call| B193
B22 -->|after return| B23
B23 -->|call| B227
B23 -->|after return| B24
B24 -->|call| B193
B24 -->|after return| B25
B25 -->|call| B235
B25 -->|after return| B26
B26 -->|call| B193
B26 -->|after return| B27
B27 -->|call| B227
B27 -->|after return| B28
B28 -->|call| B193
B28 -->|after return| B29
B29 -->|call| B235
B29 -->|after return| B30
B193["Continue at B194 in section 20"]
B235["Continue at B236 in section 24"]
B227["Continue at B228 in section 23"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL TIME
```

### B22

```asm
MOV DPTR,#A6
ACALL WSTR
```

### B23

```asm
ACALL TIME
```

### B24

```asm
MOV A,#1
ACALL CMD
```

### B25

```asm
ACALL TIME
```

### B26

```asm
MOV DPTR,#A7
ACALL WSTR
```

### B27

```asm
ACALL TIME
```

### B28

```asm
MOV A,#0C0H
ACALL CMD
```

### B29

```asm
ACALL TIME
```

### B30

```asm
MOV DPTR,#A8
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 73 to 73"]
B31["B32: instructions - lines 75 to 76"]
B32["B33: instructions - lines 77 to 77"]
B33["B34: instructions - lines 79 to 80"]
B34["B35: instructions - lines 81 to 81"]
B35["B36: instructions - lines 84 to 85"]
B36["B37: instructions - lines 87 to 87"]
B37["B38: ADDITION - lines 89 to 89"]
B38["B39: instructions - lines 90 to 90"]
B39["B40: BIN - lines 93 to 93"]
B30 -->|call| B193
B30 -->|after return| B31
B31 -->|call| B227
B31 -->|after return| B32
B32 -->|call| B193
B32 -->|after return| B33
B33 -->|call| B235
B33 -->|after return| B34
B34 -->|call| B193
B35 -->|call| B230
B35 -->|after return| B36
B36 -->|condition true| B39
B36 -->|condition false| B37
B37 -->|call| B53
B37 -->|after return| B38
B38 -->|jump| B48
B39 -->|condition true| B42
B39 -->|condition false| B40
B193["Continue at B194 in section 20"]
B227["Continue at B228 in section 23"]
B235["Continue at B236 in section 24"]
B230["Continue at B231 in section 24"]
B53["Continue at B54 in section 6"]
B48["Continue at B49 in section 5"]
B42["Continue at B43 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL TIME
```

### B32

```asm
MOV A,#1
ACALL CMD
```

### B33

```asm
ACALL TIME
```

### B34

```asm
MOV DPTR,#A9
ACALL WSTR
```

### B35

```asm
ACALL TIME
```

### B36

```asm
MOV A,#'A'
ACALL WCHR
```

### B37

```asm
CJNE A,#'A',BIN
```

### B38

```asm
ACALL ADDOP
```

### B39

```asm
AJMP EXIT
```

### B40

```asm
CJNE A,#'B',COMP
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 94 to 94"]
B41["B42: instructions - lines 95 to 95"]
B42["B43: COMP - lines 98 to 98"]
B43["B44: instructions - lines 99 to 99"]
B44["B45: instructions - lines 100 to 100"]
B45["B46: DUP - lines 103 to 103"]
B46["B47: instructions - lines 104 to 104"]
B47["B48: instructions - lines 105 to 105"]
B48["B49: EXIT - lines 108 to 109"]
B49["B50: instructions - lines 110 to 110"]
B40 -->|call| B92
B40 -->|after return| B41
B41 -->|jump| B48
B42 -->|condition true| B45
B42 -->|condition false| B43
B43 -->|call| B122
B43 -->|after return| B44
B44 -->|jump| B48
B45 -->|condition true| B48
B45 -->|condition false| B46
B46 -->|call| B156
B46 -->|after return| B47
B47 -->|jump| B48
B48 -->|call| B227
B48 -->|after return| B49
B49 -->|call| B193
B49 -->|after return| B50
B92["Continue at B93 in section 10"]
B122["Continue at B123 in section 13"]
B156["Continue at B157 in section 16"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL BINR
```

### B42

```asm
AJMP EXIT
```

### B43

```asm
CJNE A,#'C',DUP
```

### B44

```asm
ACALL COMPLEMENT
```

### B45

```asm
AJMP EXIT
```

### B46

```asm
CJNE A,#'D',EXIT
```

### B47

```asm
ACALL DUPLICATE
```

### B48

```asm
AJMP EXIT
```

### B49

```asm
MOV A,#1
ACALL CMD
```

### B50

```asm
ACALL TIME
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 112 to 113"]
B51["B52: instructions - lines 114 to 114"]
B52["B53: instructions - lines 115 to 115"]
B53["B54: ADDOP - lines 119 to 120"]
B54["B55: instructions - lines 121 to 121"]
B55["B56: instructions - lines 123 to 124"]
B56["B57: instructions - lines 125 to 125"]
B57["B58: instructions - lines 128 to 129"]
B58["B59: instructions - lines 130 to 134"]
B59["B60: instructions - lines 135 to 135"]
B50 -->|call| B235
B50 -->|after return| B51
B51 -->|call| B193
B51 -->|after return| B52
B52 -->|jump| B244
B53 -->|call| B227
B53 -->|after return| B54
B54 -->|call| B193
B54 -->|after return| B55
B55 -->|call| B235
B55 -->|after return| B56
B56 -->|call| B193
B56 -->|after return| B57
B57 -->|call| B77
B57 -->|after return| B58
B58 -->|call| B230
B58 -->|after return| B59
B59 -->|call| B240
B59 -->|after return| B60
B235["Continue at B236 in section 24"]
B193["Continue at B194 in section 20"]
B244["Continue at B245 in section 25"]
B227["Continue at B228 in section 23"]
B77["Continue at B78 in section 8"]
B230["Continue at B231 in section 24"]
B240["Continue at B241 in section 25"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV DPTR,#A11
ACALL WSTR
```

### B52

```asm
ACALL TIME
```

### B53

```asm
AJMP OUT
```

### B54

```asm
MOV A,#1
ACALL CMD
```

### B55

```asm
ACALL TIME
```

### B56

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B57

```asm
ACALL TIME
```

### B58

```asm
MOV A,#5
ACALL CHECK
```

### B59

```asm
MOV R1,A
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B60

```asm
ACALL LDELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 136 to 138"]
B61["B62: instructions - lines 139 to 139"]
B62["B63: instructions - lines 141 to 142"]
B63["B64: instructions - lines 145 to 146"]
B64["B65: instructions - lines 147 to 151"]
B65["B66: instructions - lines 152 to 152"]
B66["B67: instructions - lines 153 to 155"]
B67["B68: instructions - lines 156 to 156"]
B68["B69: instructions - lines 158 to 159"]
B69["B70: instructions - lines 160 to 160"]
B60 -->|call| B230
B60 -->|after return| B61
B61 -->|call| B240
B61 -->|after return| B62
B62 -->|call| B230
B62 -->|after return| B63
B63 -->|call| B77
B63 -->|after return| B64
B64 -->|call| B230
B64 -->|after return| B65
B65 -->|call| B240
B65 -->|after return| B66
B66 -->|call| B230
B66 -->|after return| B67
B67 -->|call| B240
B67 -->|after return| B68
B68 -->|call| B227
B68 -->|after return| B69
B69 -->|call| B193
B69 -->|after return| B70
B230["Continue at B231 in section 24"]
B240["Continue at B241 in section 25"]
B77["Continue at B78 in section 8"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B62

```asm
ACALL LDELAY
```

### B63

```asm
MOV A,#' '
ACALL WCHR
```

### B64

```asm
MOV A,#6
ACALL CHECK
```

### B65

```asm
MOV R2,A
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B66

```asm
ACALL LDELAY
```

### B67

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B68

```asm
ACALL LDELAY
```

### B69

```asm
MOV A,#0C0H
ACALL CMD
```

### B70

```asm
ACALL TIME
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 162 to 163"]
B71["B72: instructions - lines 164 to 164"]
B72["B73: instructions - lines 166 to 172"]
B73["B74: instructions - lines 173 to 173"]
B74["B75: instructions - lines 174 to 176"]
B75["B76: instructions - lines 177 to 177"]
B76["B77: instructions - lines 179 to 179"]
B77["B78: CHECK - lines 183 to 183"]
B78["B79: instructions - lines 184 to 184"]
B79["B80: C1 - lines 185 to 185"]
B70 -->|call| B235
B70 -->|after return| B71
B71 -->|call| B193
B71 -->|after return| B72
B72 -->|call| B230
B72 -->|after return| B73
B73 -->|call| B240
B73 -->|after return| B74
B74 -->|call| B230
B74 -->|after return| B75
B75 -->|call| B240
B75 -->|after return| B76
B77 -->|condition true| B79
B77 -->|condition false| B78
B78 -->|jump| B90
B79 -->|condition true| B81
B79 -->|condition false| B80
B235["Continue at B236 in section 24"]
B193["Continue at B194 in section 20"]
B230["Continue at B231 in section 24"]
B240["Continue at B241 in section 25"]
B90["Continue at B91 in section 10"]
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV DPTR,#A12
ACALL WSTR
```

### B72

```asm
ACALL TIME
```

### B73

```asm
MOV A,R2
ADD A,R1
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B74

```asm
ACALL LDELAY
```

### B75

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B76

```asm
ACALL LDELAY
```

### B77

Return to the instruction following the active call.

```asm
RET
```

### B78

```asm
CJNE A,#'#',C1
```

### B79

```asm
AJMP ERRORA
```

### B80

```asm
CJNE A,#'*',C2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 186 to 186"]
B81["B82: C2 - lines 187 to 187"]
B82["B83: instructions - lines 188 to 188"]
B83["B84: C3 - lines 189 to 189"]
B84["B85: instructions - lines 190 to 190"]
B85["B86: C4 - lines 191 to 191"]
B86["B87: instructions - lines 192 to 192"]
B87["B88: C5 - lines 193 to 193"]
B88["B89: instructions - lines 194 to 194"]
B89["B90: C6 - lines 195 to 195"]
B80 -->|jump| B90
B81 -->|condition true| B83
B81 -->|condition false| B82
B82 -->|jump| B90
B83 -->|condition true| B85
B83 -->|condition false| B84
B84 -->|jump| B90
B85 -->|condition true| B87
B85 -->|condition false| B86
B86 -->|jump| B90
B87 -->|condition true| B89
B87 -->|condition false| B88
B88 -->|jump| B90
B90["Continue at B91 in section 10"]
```

### B81

```asm
AJMP ERRORA
```

### B82

```asm
CJNE A,#0AH,C3
```

### B83

```asm
AJMP ERRORA
```

### B84

```asm
CJNE A,#0BH,C4
```

### B85

```asm
AJMP ERRORA
```

### B86

```asm
CJNE A,#0CH,C5
```

### B87

```asm
AJMP ERRORA
```

### B88

```asm
CJNE A,#0DH,C6
```

### B89

```asm
AJMP ERRORA
```

### B90

Return to the instruction following the active call.

```asm
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: ERRORA - lines 198 to 198"]
B91["B92: instructions - lines 199 to 199"]
B92["B93: BINR - lines 205 to 206"]
B93["B94: instructions - lines 207 to 207"]
B94["B95: instructions - lines 209 to 210"]
B95["B96: instructions - lines 211 to 211"]
B96["B97: instructions - lines 213 to 215"]
B97["B98: instructions - lines 217 to 231"]
B98["B99: instructions - lines 232 to 232"]
B99["B100: instructions - lines 233 to 235"]
B90 -->|call| B198
B90 -->|after return| B91
B91 -->|jump| B53
B92 -->|call| B227
B92 -->|after return| B93
B93 -->|call| B193
B93 -->|after return| B94
B94 -->|call| B235
B94 -->|after return| B95
B95 -->|call| B193
B95 -->|after return| B96
B96 -->|call| B115
B96 -->|after return| B97
B97 -->|call| B230
B97 -->|after return| B98
B98 -->|call| B240
B98 -->|after return| B99
B99 -->|call| B230
B99 -->|after return| B100
B198["Continue at B199 in section 20"]
B53["Continue at B54 in section 6"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B235["Continue at B236 in section 24"]
B115["Continue at B116 in section 12"]
B230["Continue at B231 in section 24"]
B240["Continue at B241 in section 25"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL RLED
```

### B92

```asm
AJMP ADDOP
```

### B93

```asm
MOV A,#1
ACALL CMD
```

### B94

```asm
ACALL TIME
```

### B95

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B96

```asm
ACALL TIME
```

### B97

```asm
MOV A,#55H
MOV R1,A
ACALL BINCHECK
```

### B98

```asm
ANL A,#0FH
MOV A,R2
MOV A,R1
SWAP A
ANL A,#0FH
MOV B,#10
MUL AB
ADD A,R2
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B99

```asm
ACALL LDELAY
```

### B100

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 236 to 236"]
B101["B102: instructions - lines 239 to 240"]
B102["B103: instructions - lines 241 to 241"]
B103["B104: instructions - lines 243 to 244"]
B104["B105: instructions - lines 245 to 245"]
B105["B106: instructions - lines 248 to 250"]
B106["B107: LOOP - lines 253 to 256"]
B107["B108: ZEROX - lines 258 to 259"]
B108["B109: instructions - lines 260 to 260"]
B109["B110: ONEX - lines 262 to 263"]
B100 -->|call| B240
B100 -->|after return| B101
B101 -->|call| B227
B101 -->|after return| B102
B102 -->|call| B193
B102 -->|after return| B103
B103 -->|call| B235
B103 -->|after return| B104
B104 -->|call| B193
B104 -->|after return| B105
B105 -->|next| B106
B106 -->|condition true| B109
B106 -->|condition false| B107
B107 -->|call| B230
B107 -->|after return| B108
B108 -->|jump| B110
B109 -->|call| B230
B109 -->|after return| B110
B240["Continue at B241 in section 25"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B235["Continue at B236 in section 24"]
B230["Continue at B231 in section 24"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL LDELAY
```

### B102

```asm
MOV A,#0C0H
ACALL CMD
```

### B103

```asm
ACALL TIME
```

### B104

```asm
MOV DPTR,#A13
ACALL WSTR
```

### B105

```asm
ACALL TIME
```

### B106

```asm
MOV A,R1
MOV R7,#8
```

### B107

```asm
MOV A,R1
RLC A
MOV R1,A
JC ONEX
```

### B108

```asm
MOV A,#'0'
ACALL WCHR
```

### B109

```asm
SJMP OUTNOWX
```

### B110

```asm
MOV A,#'1'
ACALL WCHR
```

## Section 12

```mermaid
flowchart TD
B110["B111: OUTNOWX - lines 265 to 265"]
B111["B112: instructions - lines 266 to 267"]
B112["B113: instructions - lines 268 to 268"]
B113["B114: instructions - lines 269 to 269"]
B114["B115: instructions - lines 270 to 270"]
B115["B116: BINCHECK - lines 275 to 275"]
B116["B117: instructions - lines 276 to 276"]
B117["B118: M1 - lines 277 to 277"]
B118["B119: instructions - lines 278 to 278"]
B119["B120: M2 - lines 279 to 279"]
B110 -->|condition true| B106
B110 -->|condition false| B111
B111 -->|call| B230
B111 -->|after return| B112
B112 -->|call| B193
B112 -->|after return| B113
B113 -->|call| B193
B113 -->|after return| B114
B115 -->|condition true| B117
B115 -->|condition false| B116
B116 -->|jump| B120
B117 -->|condition true| B119
B117 -->|condition false| B118
B118 -->|jump| B120
B106["Continue at B107 in section 11"]
B230["Continue at B231 in section 24"]
B193["Continue at B194 in section 20"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
DJNZ R7,LOOP
```

### B112

```asm
MOV A,#'B'
ACALL WCHR
```

### B113

```asm
ACALL TIME
```

### B114

```asm
ACALL TIME
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
CJNE A,#'#',M1
```

### B117

```asm
AJMP ERRORB
```

### B118

```asm
CJNE A,#'*',M2
```

### B119

```asm
AJMP ERRORB
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: ERRORB - lines 282 to 282"]
B121["B122: instructions - lines 283 to 283"]
B122["B123: COMPLEMENT - lines 287 to 288"]
B123["B124: instructions - lines 289 to 289"]
B124["B125: instructions - lines 291 to 292"]
B125["B126: instructions - lines 293 to 293"]
B126["B127: instructions - lines 295 to 298"]
B127["B128: instructions - lines 299 to 299"]
B128["B129: instructions - lines 301 to 302"]
B129["B130: instructions - lines 303 to 303"]
B120 -->|call| B198
B120 -->|after return| B121
B121 -->|jump| B92
B122 -->|call| B227
B122 -->|after return| B123
B123 -->|call| B193
B123 -->|after return| B124
B124 -->|call| B235
B124 -->|after return| B125
B125 -->|call| B193
B125 -->|after return| B126
B126 -->|call| B230
B126 -->|after return| B127
B127 -->|call| B186
B127 -->|after return| B128
B128 -->|call| B230
B128 -->|after return| B129
B129 -->|call| B186
B129 -->|after return| B130
B198["Continue at B199 in section 20"]
B92["Continue at B93 in section 10"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B235["Continue at B236 in section 24"]
B230["Continue at B231 in section 24"]
B186["Continue at B187 in section 19"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL RLED
```

### B122

```asm
AJMP BINR
```

### B123

```asm
MOV A,#1
ACALL CMD
```

### B124

```asm
ACALL TIME
```

### B125

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B126

```asm
ACALL TIME
```

### B127

```asm
MOV R1,#0
MOV A,#'1'
ACALL WCHR
```

### B128

```asm
ACALL ROTATE
```

### B129

```asm
MOV A,#'1'
ACALL WCHR
```

### B130

```asm
ACALL ROTATE
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 305 to 306"]
B131["B132: instructions - lines 307 to 307"]
B132["B133: instructions - lines 309 to 310"]
B133["B134: instructions - lines 311 to 311"]
B134["B135: instructions - lines 313 to 314"]
B135["B136: instructions - lines 315 to 315"]
B136["B137: instructions - lines 317 to 318"]
B137["B138: instructions - lines 319 to 319"]
B138["B139: instructions - lines 321 to 322"]
B139["B140: instructions - lines 323 to 323"]
B130 -->|call| B230
B130 -->|after return| B131
B131 -->|call| B186
B131 -->|after return| B132
B132 -->|call| B230
B132 -->|after return| B133
B133 -->|call| B186
B133 -->|after return| B134
B134 -->|call| B230
B134 -->|after return| B135
B135 -->|call| B186
B135 -->|after return| B136
B136 -->|call| B230
B136 -->|after return| B137
B137 -->|call| B186
B137 -->|after return| B138
B138 -->|call| B230
B138 -->|after return| B139
B139 -->|call| B186
B139 -->|after return| B140
B230["Continue at B231 in section 24"]
B186["Continue at B187 in section 19"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,#'1'
ACALL WCHR
```

### B132

```asm
ACALL ROTATE
```

### B133

```asm
MOV A,#'1'
ACALL WCHR
```

### B134

```asm
ACALL ROTATE
```

### B135

```asm
MOV A,#'0'
ACALL WCHR
```

### B136

```asm
ACALL ROTATE
```

### B137

```asm
MOV A,#'0'
ACALL WCHR
```

### B138

```asm
ACALL ROTATE
```

### B139

```asm
MOV A,#'0'
ACALL WCHR
```

### B140

```asm
ACALL ROTATE
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 325 to 326"]
B141["B142: instructions - lines 327 to 327"]
B142["B143: instructions - lines 329 to 334"]
B143["B144: instructions - lines 335 to 335"]
B144["B145: instructions - lines 337 to 338"]
B145["B146: instructions - lines 339 to 339"]
B146["B147: instructions - lines 341 to 341"]
B147["B148: LOOPX - lines 344 to 348"]
B148["B149: ZERO - lines 350 to 351"]
B149["B150: instructions - lines 352 to 352"]
B140 -->|call| B230
B140 -->|after return| B141
B141 -->|call| B186
B141 -->|after return| B142
B142 -->|call| B227
B142 -->|after return| B143
B143 -->|call| B193
B143 -->|after return| B144
B144 -->|call| B235
B144 -->|after return| B145
B145 -->|call| B193
B145 -->|after return| B146
B146 -->|next| B147
B147 -->|condition true| B150
B147 -->|condition false| B148
B148 -->|call| B230
B148 -->|after return| B149
B149 -->|jump| B151
B230["Continue at B231 in section 24"]
B186["Continue at B187 in section 19"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B235["Continue at B236 in section 24"]
B150["Continue at B151 in section 16"]
B151["Continue at B152 in section 16"]
```

### B141

```asm
MOV A,#'0'
ACALL WCHR
```

### B142

```asm
ACALL ROTATE
```

### B143

```asm
MOV A,R1
CPL A
MOV R1,A
MOV A,#0C0H
ACALL CMD
```

### B144

```asm
ACALL TIME
```

### B145

```asm
MOV DPTR,#A14
ACALL WSTR
```

### B146

```asm
ACALL TIME
```

### B147

```asm
MOV R7,#8
```

### B148

```asm
MOV A,R1
RLC A
MOV R1,A
RLC A
JC ONE
```

### B149

```asm
MOV A,#'0'
ACALL WCHR
```

### B150

```asm
SJMP OUTNOW
```

## Section 16

```mermaid
flowchart TD
B150["B151: ONE - lines 354 to 355"]
B151["B152: OUTNOW - lines 357 to 357"]
B152["B153: instructions - lines 358 to 359"]
B153["B154: instructions - lines 360 to 360"]
B154["B155: instructions - lines 361 to 361"]
B155["B156: instructions - lines 362 to 362"]
B156["B157: DUPLICATE - lines 367 to 368"]
B157["B158: instructions - lines 369 to 369"]
B158["B159: instructions - lines 371 to 372"]
B159["B160: instructions - lines 373 to 373"]
B150 -->|call| B230
B150 -->|after return| B151
B151 -->|condition true| B147
B151 -->|condition false| B152
B152 -->|call| B230
B152 -->|after return| B153
B153 -->|call| B193
B153 -->|after return| B154
B154 -->|call| B193
B154 -->|after return| B155
B156 -->|call| B227
B156 -->|after return| B157
B157 -->|call| B193
B157 -->|after return| B158
B158 -->|call| B235
B158 -->|after return| B159
B159 -->|call| B193
B159 -->|after return| B160
B230["Continue at B231 in section 24"]
B147["Continue at B148 in section 15"]
B193["Continue at B194 in section 20"]
B227["Continue at B228 in section 23"]
B235["Continue at B236 in section 24"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#'1'
ACALL WCHR
```

### B152

```asm
DJNZ R7,LOOPX
```

### B153

```asm
MOV A,#'1'
ACALL WCHR
```

### B154

```asm
ACALL TIME
```

### B155

```asm
ACALL TIME
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
MOV A,#1
ACALL CMD
```

### B158

```asm
ACALL TIME
```

### B159

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B160

```asm
ACALL TIME
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 375 to 377"]
B161["B162: instructions - lines 378 to 379"]
B162["B163: instructions - lines 382 to 383"]
B163["B164: instructions - lines 384 to 384"]
B164["B165: instructions - lines 386 to 387"]
B165["B166: instructions - lines 388 to 388"]
B166["B167: instructions - lines 390 to 397"]
B167["B168: instructions - lines 398 to 398"]
B168["B169: instructions - lines 399 to 401"]
B169["B170: instructions - lines 402 to 402"]
B160 -->|call| B171
B160 -->|after return| B161
B161 -->|call| B230
B161 -->|after return| B162
B162 -->|call| B227
B162 -->|after return| B163
B163 -->|call| B193
B163 -->|after return| B164
B164 -->|call| B235
B164 -->|after return| B165
B165 -->|call| B193
B165 -->|after return| B166
B166 -->|call| B230
B166 -->|after return| B167
B167 -->|call| B240
B167 -->|after return| B168
B168 -->|call| B230
B168 -->|after return| B169
B169 -->|call| B240
B169 -->|after return| B170
B171["Continue at B172 in section 18"]
B230["Continue at B231 in section 24"]
B227["Continue at B228 in section 23"]
B193["Continue at B194 in section 20"]
B235["Continue at B236 in section 24"]
B240["Continue at B241 in section 25"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#5
MOV R1,A
ACALL CHECK2
```

### B162

```asm
ADD A,#30H
ACALL WCHR
```

### B163

```asm
MOV A,#0C0H
ACALL CMD
```

### B164

```asm
ACALL TIME
```

### B165

```asm
MOV DPTR,#A15
ACALL WSTR
```

### B166

```asm
ACALL TIME
```

### B167

```asm
MOV A,R1
MOV B,A
ADD A,B
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B168

```asm
ACALL LDELAY
```

### B169

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B170

```asm
ACALL LDELAY
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 403 to 403"]
B171["B172: CHECK2 - lines 407 to 407"]
B172["B173: instructions - lines 408 to 408"]
B173["B174: F1 - lines 409 to 409"]
B174["B175: instructions - lines 410 to 410"]
B175["B176: F2 - lines 411 to 411"]
B176["B177: instructions - lines 412 to 412"]
B177["B178: F3 - lines 413 to 413"]
B178["B179: instructions - lines 414 to 414"]
B179["B180: F4 - lines 415 to 415"]
B171 -->|condition true| B173
B171 -->|condition false| B172
B172 -->|jump| B184
B173 -->|condition true| B175
B173 -->|condition false| B174
B174 -->|jump| B184
B175 -->|condition true| B177
B175 -->|condition false| B176
B176 -->|jump| B184
B177 -->|condition true| B179
B177 -->|condition false| B178
B178 -->|jump| B184
B179 -->|condition true| B181
B179 -->|condition false| B180
B184["Continue at B185 in section 19"]
B181["Continue at B182 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

Return to the instruction following the active call.

```asm
RET
```

### B172

```asm
CJNE A,#'#',F1
```

### B173

```asm
AJMP ERRORD
```

### B174

```asm
CJNE A,#'*',F2
```

### B175

```asm
AJMP ERRORD
```

### B176

```asm
CJNE A,#'A',F3
```

### B177

```asm
AJMP ERRORD
```

### B178

```asm
CJNE A,#'B',F4
```

### B179

```asm
AJMP ERRORD
```

### B180

```asm
CJNE A,#'C',F5
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 416 to 416"]
B181["B182: F5 - lines 417 to 417"]
B182["B183: instructions - lines 418 to 418"]
B183["B184: F6 - lines 419 to 419"]
B184["B185: ERRORD - lines 422 to 422"]
B185["B186: instructions - lines 423 to 423"]
B186["B187: ROTATE - lines 427 to 427"]
B187["B188: instructions - lines 428 to 432"]
B188["B189: NEXTCHECK - lines 434 to 434"]
B189["B190: instructions - lines 435 to 438"]
B180 -->|jump| B184
B181 -->|condition true| B183
B181 -->|condition false| B182
B182 -->|jump| B184
B184 -->|call| B198
B184 -->|after return| B185
B185 -->|jump| B156
B186 -->|condition true| B188
B186 -->|condition false| B187
B187 -->|jump| B190
B188 -->|condition true| B191
B188 -->|condition false| B189
B189 -->|next| B190
B198["Continue at B199 in section 20"]
B156["Continue at B157 in section 16"]
B190["Continue at B191 in section 20"]
B191["Continue at B192 in section 20"]
```

### B181

```asm
AJMP ERRORD
```

### B182

```asm
CJNE A,#'D',F6
```

### B183

```asm
AJMP ERRORD
```

### B184

Return to the instruction following the active call.

```asm
RET
```

### B185

```asm
ACALL RLED
```

### B186

```asm
AJMP DUPLICATE
```

### B187

```asm
CJNE A,#'0',NEXTCHECK
```

### B188

```asm
CLR C
MOV A,R1
RLC A
MOV R1,A
SJMP OUTY
```

### B189

```asm
CJNE A,#'1',ERRORX
```

### B190

```asm
SETB C
MOV A,R1
RLC A
MOV R1,A
```

## Section 20

```mermaid
flowchart TD
B190["B191: OUTY - lines 440 to 440"]
B191["B192: ERRORX - lines 443 to 443"]
B192["B193: instructions - lines 444 to 444"]
B193["B194: TIME - lines 449 to 449"]
B194["B195: T - lines 451 to 454"]
B195["B196: BACK - lines 456 to 456"]
B196["B197: instructions - lines 457 to 459"]
B197["B198: instructions - lines 460 to 460"]
B198["B199: RLED - lines 463 to 463"]
B199["B200: RLOOP - lines 465 to 466"]
B191 -->|call| B198
B191 -->|after return| B192
B192 -->|jump| B122
B193 -->|next| B194
B194 -->|next| B195
B195 -->|condition true| B195
B195 -->|condition false| B196
B196 -->|condition true| B194
B196 -->|condition false| B197
B198 -->|next| B199
B199 -->|call| B193
B199 -->|after return| B200
B122["Continue at B123 in section 13"]
B200["Continue at B201 in section 21"]
```

### B191

Return to the instruction following the active call.

```asm
RET
```

### B192

```asm
ACALL RLED
```

### B193

```asm
AJMP COMPLEMENT
```

### B194

```asm
MOV R6,#100
```

### B195

```asm
MOV TMOD,#21H
MOV TL0,#0EEH
MOV TH0,#0B7H
SETB TR0
```

### B196

```asm
JNB TF0,BACK
```

### B197

```asm
CLR TR0
CLR TF0
DJNZ R6,T
```

### B198

Return to the instruction following the active call.

```asm
RET
```

### B199

```asm
MOV R7,#3
```

### B200

```asm
CLR R
ACALL TIME
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 467 to 468"]
B201["B202: instructions - lines 469 to 469"]
B202["B203: instructions - lines 470 to 470"]
B203["B204: instructions - lines 473 to 480"]
B204["B205: instructions - lines 481 to 481"]
B205["B206: instructions - lines 482 to 484"]
B206["B207: instructions - lines 485 to 485"]
B207["B208: INLCD - lines 491 to 492"]
B208["B209: WAIT - lines 494 to 494"]
B209["B210: instructions - lines 495 to 495"]
B200 -->|call| B193
B200 -->|after return| B201
B201 -->|condition true| B199
B201 -->|condition false| B202
B203 -->|call| B230
B203 -->|after return| B204
B204 -->|call| B240
B204 -->|after return| B205
B205 -->|call| B230
B205 -->|after return| B206
B206 -->|call| B240
B206 -->|after return| B207
B207 -->|next| B208
B208 -->|call| B240
B208 -->|after return| B209
B209 -->|condition true| B208
B209 -->|condition false| B210
B193["Continue at B194 in section 20"]
B199["Continue at B200 in section 20"]
B230["Continue at B231 in section 24"]
B240["Continue at B241 in section 25"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
SETB R
ACALL TIME
```

### B202

```asm
DJNZ R7,RLOOP
```

### B203

Return to the instruction following the active call.

```asm
RET
```

### B204

```asm
MOV B,#100
DIV AB
ADD A,#30H
MOV A,B
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B205

```asm
ACALL LDELAY
```

### B206

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B207

```asm
ACALL LDELAY
```

### B208

```asm
PUSH 7
MOV R7,#20
```

### B209

```asm
ACALL LDELAY
```

### B210

```asm
DJNZ R7,WAIT
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 497 to 499"]
B211["B212: instructions - lines 500 to 500"]
B212["B213: instructions - lines 501 to 502"]
B213["B214: instructions - lines 503 to 504"]
B214["B215: instructions - lines 505 to 506"]
B215["B216: instructions - lines 507 to 508"]
B216["B217: instructions - lines 509 to 510"]
B217["B218: instructions - lines 511 to 512"]
B218["B219: instructions - lines 513 to 514"]
B219["B220: instructions - lines 515 to 516"]
B210 -->|call| B227
B210 -->|after return| B211
B211 -->|call| B240
B211 -->|after return| B212
B212 -->|call| B227
B212 -->|after return| B213
B213 -->|call| B227
B213 -->|after return| B214
B214 -->|call| B227
B214 -->|after return| B215
B215 -->|call| B227
B215 -->|after return| B216
B216 -->|call| B227
B216 -->|after return| B217
B217 -->|call| B227
B217 -->|after return| B218
B218 -->|call| B227
B218 -->|after return| B219
B219 -->|call| B227
B219 -->|after return| B220
B227["Continue at B228 in section 23"]
B240["Continue at B241 in section 25"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B212

```asm
ACALL LDELAY
```

### B213

```asm
MOV A,#0011B
ACALL CMD
```

### B214

```asm
MOV A,#0011B
ACALL CMD
```

### B215

```asm
MOV A,#0010B
ACALL CMD
```

### B216

```asm
MOV A,#0010B
ACALL CMD
```

### B217

```asm
MOV A,#1000B
ACALL CMD
```

### B218

```asm
MOV A,#0000B
ACALL CMD
```

### B219

```asm
MOV A,#1000B
ACALL CMD
```

### B220

```asm
MOV A,#0
ACALL CMD
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 517 to 518"]
B221["B222: instructions - lines 519 to 519"]
B222["B223: instructions - lines 520 to 521"]
B223["B224: instructions - lines 522 to 523"]
B224["B225: instructions - lines 524 to 525"]
B225["B226: instructions - lines 526 to 527"]
B226["B227: instructions - lines 529 to 530"]
B227["B228: CMD - lines 534 to 540"]
B228["B229: instructions - lines 541 to 542"]
B229["B230: instructions - lines 544 to 546"]
B220 -->|call| B227
B220 -->|after return| B221
B221 -->|call| B240
B221 -->|after return| B222
B222 -->|call| B227
B222 -->|after return| B223
B223 -->|call| B227
B223 -->|after return| B224
B224 -->|call| B227
B224 -->|after return| B225
B225 -->|call| B227
B225 -->|after return| B226
B227 -->|call| B233
B227 -->|after return| B228
B228 -->|call| B233
B228 -->|after return| B229
B240["Continue at B241 in section 25"]
B233["Continue at B234 in section 24"]
```

### B221

```asm
MOV A,#0001B
ACALL CMD
```

### B222

```asm
ACALL LDELAY
```

### B223

```asm
MOV A,#0000B
ACALL CMD
```

### B224

```asm
MOV A,#0110B
ACALL CMD
```

### B225

```asm
MOV A,#0000B
ACALL CMD
```

### B226

```asm
MOV A,#1111B
ACALL CMD
```

### B227

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B228

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B229

```asm
MOV A,B
ACALL COMMON
```

### B230

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 24

```mermaid
flowchart TD
B230["B231: WCHR - lines 549 to 555"]
B231["B232: instructions - lines 556 to 557"]
B232["B233: instructions - lines 559 to 561"]
B233["B234: COMMON - lines 564 to 571"]
B234["B235: instructions - lines 572 to 572"]
B235["B236: WSTR - lines 575 to 575"]
B236["B237: CONT1 - lines 577 to 579"]
B237["B238: instructions - lines 580 to 580"]
B238["B239: instructions - lines 581 to 582"]
B239["B240: EXIT1 - lines 584 to 585"]
B230 -->|call| B233
B230 -->|after return| B231
B231 -->|call| B233
B231 -->|after return| B232
B233 -->|call| B240
B233 -->|after return| B234
B235 -->|next| B236
B236 -->|condition true| B239
B236 -->|condition false| B237
B237 -->|call| B230
B237 -->|after return| B238
B238 -->|jump| B236
B240["Continue at B241 in section 25"]
```

### B231

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B232

```asm
MOV A,B
ACALL COMMON
```

### B233

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B234

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

### B235

Return to the instruction following the active call.

```asm
RET
```

### B236

```asm
PUSH ACC
```

### B237

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B238

```asm
ACALL WCHR
```

### B239

```asm
INC DPTR
AJMP CONT1
```

### B240

Return to the instruction following the active call.

```asm
POP ACC
RET
```

## Section 25

```mermaid
flowchart TD
B240["B241: LDELAY - lines 588 to 590"]
B241["B242: CON4 - lines 592 to 593"]
B242["B243: instructions - lines 594 to 594"]
B243["B244: instructions - lines 595 to 597"]
B244["B245: OUT - lines 616 to 616"]
B240 -->|next| B241
B241 -->|condition true| B241
B241 -->|condition false| B242
B242 -->|condition true| B241
B242 -->|condition false| B243
B244 -->|jump| B244
```

### B241

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B242

```asm
MOV R0,#250
DJNZ R0,$
```

### B243

```asm
DJNZ R1,CON4
```

### B244

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B245

```asm
SJMP OUT
```
