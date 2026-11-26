# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0000H` begins at B1.
- `ORG  0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27) · [Section 28](#section-28) · [Section 29](#section-29) · [Section 30](#section-30) · [Section 31](#section-31) · [Section 32](#section-32) · [Section 33](#section-33)

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
102: ////////////////////////////////////////////////////////////////////////////////////////////////////////////
140: ///////////OP1
248: ///////////////END OF OP1
250: ///////////////OP2
354: ////////////////////////OP3
441: ///////////////////////
464: /////////////////////OP4
529: /////////////////////////
```

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 11 to 11"]
B1["B2: instructions - lines 14 to 14"]
B2["B3: MAIN - lines 19 to 22"]
B3["B4: instructions - lines 23 to 24"]
B4["B5: instructions - lines 25 to 25"]
B5["B6: instructions - lines 26 to 26"]
B6["B7: EX0ISR - lines 29 to 29"]
B7["B8: instructions - lines 31 to 32"]
B8["B9: instructions - lines 33 to 33"]
B9["B10: instructions - lines 35 to 36"]
B0 -->|jump| B2
B1 -->|jump| B6
B2 -->|call| B259
B2 -->|after return| B3
B3 -->|call| B287
B3 -->|after return| B4
B4 -->|call| B249
B4 -->|after return| B5
B5 -->|jump| B5
B6 -->|call| B259
B6 -->|after return| B7
B7 -->|call| B287
B7 -->|after return| B8
B8 -->|call| B249
B8 -->|after return| B9
B9 -->|call| B279
B9 -->|after return| B10
B259["Continue at B260 in section 26"]
B287["Continue at B288 in section 29"]
B249["Continue at B250 in section 25"]
B279["Continue at B280 in section 28"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP  MAIN
```

### B2

```asm
LJMP  EX0ISR
```

### B3

```asm
MOV 	TMOD,#00010001B
MOV  	IE,#10000001B
SETB   IT0
ACALL INLCD
```

### B4

```asm
MOV DPTR,#A16
ACALL WSTR
```

### B5

```asm
ACALL TIME
```

### B6

```asm
SJMP	$
```

### B7

```asm
ACALL INLCD
```

### B8

```asm
MOV DPTR,#A1
ACALL WSTR
```

### B9

```asm
ACALL TIME
```

### B10

```asm
MOV A,#0c0H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 37 to 37"]
B11["B12: instructions - lines 39 to 40"]
B12["B13: instructions - lines 41 to 41"]
B13["B14: MENU - lines 46 to 47"]
B14["B15: instructions - lines 48 to 48"]
B15["B16: instructions - lines 50 to 51"]
B16["B17: instructions - lines 52 to 52"]
B17["B18: instructions - lines 54 to 55"]
B18["B19: instructions - lines 56 to 56"]
B19["B20: instructions - lines 58 to 59"]
B10 -->|call| B249
B10 -->|after return| B11
B11 -->|call| B287
B11 -->|after return| B12
B12 -->|call| B249
B12 -->|after return| B13
B13 -->|call| B279
B13 -->|after return| B14
B14 -->|call| B249
B14 -->|after return| B15
B15 -->|call| B287
B15 -->|after return| B16
B16 -->|call| B249
B16 -->|after return| B17
B17 -->|call| B279
B17 -->|after return| B18
B18 -->|call| B249
B18 -->|after return| B19
B19 -->|call| B287
B19 -->|after return| B20
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B279["Continue at B280 in section 28"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL TIME
```

### B12

```asm
MOV DPTR,#A2
ACALL WSTR
```

### B13

```asm
ACALL TIME
```

### B14

```asm
MOV A,#1
ACALL CMD
```

### B15

```asm
ACALL TIME
```

### B16

```asm
MOV DPTR,#A3
ACALL WSTR
```

### B17

```asm
ACALL TIME
```

### B18

```asm
MOV A,#0c0H
ACALL CMD
```

### B19

```asm
ACALL TIME
```

### B20

```asm
MOV DPTR,#A4
ACALL WSTR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 60 to 60"]
B21["B22: instructions - lines 62 to 63"]
B22["B23: instructions - lines 64 to 64"]
B23["B24: instructions - lines 66 to 67"]
B24["B25: instructions - lines 68 to 68"]
B25["B26: instructions - lines 70 to 71"]
B26["B27: instructions - lines 72 to 72"]
B27["B28: instructions - lines 74 to 75"]
B28["B29: instructions - lines 76 to 76"]
B29["B30: instructions - lines 78 to 79"]
B20 -->|call| B249
B20 -->|after return| B21
B21 -->|call| B279
B21 -->|after return| B22
B22 -->|call| B249
B22 -->|after return| B23
B23 -->|call| B287
B23 -->|after return| B24
B24 -->|call| B249
B24 -->|after return| B25
B25 -->|call| B279
B25 -->|after return| B26
B26 -->|call| B249
B26 -->|after return| B27
B27 -->|call| B287
B27 -->|after return| B28
B28 -->|call| B249
B28 -->|after return| B29
B29 -->|call| B279
B29 -->|after return| B30
B249["Continue at B250 in section 25"]
B279["Continue at B280 in section 28"]
B287["Continue at B288 in section 29"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL TIME
```

### B22

```asm
MOV A,#1
ACALL CMD
```

### B23

```asm
ACALL TIME
```

### B24

```asm
MOV DPTR,#A5
ACALL WSTR
```

### B25

```asm
ACALL TIME
```

### B26

```asm
MOV A,#0c0H
ACALL CMD
```

### B27

```asm
ACALL TIME
```

### B28

```asm
MOV DPTR,#A6
ACALL WSTR
```

### B29

```asm
ACALL TIME
```

### B30

```asm
MOV A,#1
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 80 to 80"]
B31["B32: instructions - lines 82 to 83"]
B32["B33: instructions - lines 84 to 84"]
B33["B34: instructions - lines 86 to 87"]
B34["B35: instructions - lines 88 to 88"]
B35["B36: instructions - lines 90 to 91"]
B36["B37: instructions - lines 92 to 92"]
B37["B38: instructions - lines 94 to 95"]
B38["B39: instructions - lines 96 to 96"]
B39["B40: instructions - lines 98 to 99"]
B30 -->|call| B249
B30 -->|after return| B31
B31 -->|call| B287
B31 -->|after return| B32
B32 -->|call| B249
B32 -->|after return| B33
B33 -->|call| B279
B33 -->|after return| B34
B34 -->|call| B249
B34 -->|after return| B35
B35 -->|call| B287
B35 -->|after return| B36
B36 -->|call| B249
B36 -->|after return| B37
B37 -->|call| B279
B37 -->|after return| B38
B38 -->|call| B249
B38 -->|after return| B39
B39 -->|call| B287
B39 -->|after return| B40
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B279["Continue at B280 in section 28"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL TIME
```

### B32

```asm
MOV DPTR,#A7
ACALL WSTR
```

### B33

```asm
ACALL TIME
```

### B34

```asm
MOV A,#0c0H
ACALL CMD
```

### B35

```asm
ACALL TIME
```

### B36

```asm
MOV DPTR,#A8
ACALL WSTR
```

### B37

```asm
ACALL TIME
```

### B38

```asm
MOV A,#1
ACALL CMD
```

### B39

```asm
ACALL TIME
```

### B40

```asm
MOV DPTR,#A9
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 100 to 100"]
B41["B42: instructions - lines 103 to 103"]
B42["B43: instructions - lines 104 to 104"]
B43["B44: instructions - lines 105 to 105"]
B44["B45: ADDITION - lines 111 to 111"]
B45["B46: instructions - lines 112 to 112"]
B46["B47: instructions - lines 113 to 113"]
B47["B48: BIN - lines 116 to 116"]
B48["B49: instructions - lines 117 to 117"]
B49["B50: instructions - lines 118 to 118"]
B40 -->|call| B249
B41 -->|call| B297
B41 -->|after return| B42
B42 -->|call| B282
B42 -->|after return| B43
B43 -->|call| B249
B43 -->|after return| B44
B44 -->|condition true| B47
B44 -->|condition false| B45
B45 -->|call| B61
B45 -->|after return| B46
B46 -->|jump| B56
B47 -->|condition true| B50
B47 -->|condition false| B48
B48 -->|call| B112
B48 -->|after return| B49
B49 -->|jump| B56
B249["Continue at B250 in section 25"]
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B61["Continue at B62 in section 7"]
B56["Continue at B57 in section 6"]
B50["Continue at B51 in section 6"]
B112["Continue at B113 in section 12"]
```

### B41

```asm
ACALL TIME
```

### B42

```asm
ACALL KEYPAD
```

### B43

```asm
ACALL WCHR
```

### B44

```asm
ACALL TIME
```

### B45

```asm
CJNE A,#'A',BIN
```

### B46

```asm
ACALL ADDOP
```

### B47

```asm
AJMP EXIT
```

### B48

```asm
CJNE A,#'B',COMP
```

### B49

```asm
ACALL BINR
```

### B50

```asm
AJMP EXIT
```

## Section 6

```mermaid
flowchart TD
B50["B51: COMP - lines 121 to 121"]
B51["B52: instructions - lines 122 to 122"]
B52["B53: instructions - lines 123 to 123"]
B53["B54: DUP - lines 126 to 126"]
B54["B55: instructions - lines 127 to 127"]
B55["B56: instructions - lines 128 to 128"]
B56["B57: EXIT - lines 131 to 132"]
B57["B58: instructions - lines 133 to 133"]
B58["B59: instructions - lines 135 to 136"]
B59["B60: instructions - lines 137 to 137"]
B50 -->|condition true| B53
B50 -->|condition false| B51
B51 -->|call| B157
B51 -->|after return| B52
B52 -->|jump| B56
B53 -->|condition true| B56
B53 -->|condition false| B54
B54 -->|call| B216
B54 -->|after return| B55
B55 -->|jump| B56
B56 -->|call| B279
B56 -->|after return| B57
B57 -->|call| B249
B57 -->|after return| B58
B58 -->|call| B287
B58 -->|after return| B59
B59 -->|call| B249
B59 -->|after return| B60
B157["Continue at B158 in section 16"]
B216["Continue at B217 in section 22"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
CJNE A,#'C',DUP
```

### B52

```asm
ACALL COMPLEMENT
```

### B53

```asm
AJMP EXIT
```

### B54

```asm
CJNE A,#'D',EXIT
```

### B55

```asm
ACALL DUPLICATE
```

### B56

```asm
AJMP EXIT
```

### B57

```asm
MOV A,#1
ACALL CMD
```

### B58

```asm
ACALL TIME
```

### B59

```asm
MOV DPTR,#A11
ACALL WSTR
```

### B60

```asm
ACALL TIME
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 138 to 138"]
B61["B62: ADDOP - lines 142 to 143"]
B62["B63: instructions - lines 144 to 144"]
B63["B64: instructions - lines 146 to 147"]
B64["B65: instructions - lines 148 to 148"]
B65["B66: instructions - lines 151 to 151"]
B66["B67: instructions - lines 152 to 152"]
B67["B68: instructions - lines 153 to 153"]
B68["B69: instructions - lines 154 to 154"]
B69["B70: instructions - lines 155 to 161"]
B60 -->|jump| B296
B61 -->|call| B279
B61 -->|after return| B62
B62 -->|call| B249
B62 -->|after return| B63
B63 -->|call| B287
B63 -->|after return| B64
B64 -->|call| B249
B64 -->|after return| B65
B65 -->|call| B297
B65 -->|after return| B66
B66 -->|call| B282
B66 -->|after return| B67
B67 -->|call| B292
B67 -->|after return| B68
B68 -->|call| B97
B68 -->|after return| B69
B69 -->|call| B297
B69 -->|after return| B70
B296["Continue at B297 in section 30"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B97["Continue at B98 in section 10"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
AJMP OUT
```

### B62

```asm
MOV A,#1
ACALL CMD
```

### B63

```asm
ACALL TIME
```

### B64

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B65

```asm
ACALL TIME
```

### B66

```asm
ACALL KEYPAD
```

### B67

```asm
ACALL WCHR
```

### B68

```asm
ACALL LDELAY
```

### B69

```asm
ACALL CHECK
```

### B70

```asm
CLR C
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 162 to 162"]
B71["B72: instructions - lines 163 to 163"]
B72["B73: instructions - lines 164 to 164"]
B73["B74: instructions - lines 165 to 172"]
B74["B75: instructions - lines 175 to 175"]
B75["B76: instructions - lines 176 to 176"]
B76["B77: instructions - lines 177 to 177"]
B77["B78: instructions - lines 178 to 178"]
B78["B79: instructions - lines 179 to 185"]
B79["B80: instructions - lines 186 to 186"]
B70 -->|call| B282
B70 -->|after return| B71
B71 -->|call| B292
B71 -->|after return| B72
B72 -->|call| B97
B72 -->|after return| B73
B73 -->|call| B282
B73 -->|after return| B74
B74 -->|call| B297
B74 -->|after return| B75
B75 -->|call| B282
B75 -->|after return| B76
B76 -->|call| B292
B76 -->|after return| B77
B77 -->|call| B97
B77 -->|after return| B78
B78 -->|call| B297
B78 -->|after return| B79
B79 -->|call| B282
B79 -->|after return| B80
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B97["Continue at B98 in section 10"]
B297["Continue at B298 in section 30"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL WCHR
```

### B72

```asm
ACALL LDELAY
```

### B73

```asm
ACALL CHECK
```

### B74

```asm
CLR C
SUBB A,#30H
ADD A,R1
MOV R2,A
MOV A,#' '
ACALL WCHR
```

### B75

```asm
ACALL KEYPAD
```

### B76

```asm
ACALL WCHR
```

### B77

```asm
ACALL LDELAY
```

### B78

```asm
ACALL CHECK
```

### B79

```asm
CLR C
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B80

```asm
ACALL WCHR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 187 to 187"]
B81["B82: instructions - lines 188 to 188"]
B82["B83: instructions - lines 189 to 196"]
B83["B84: instructions - lines 197 to 197"]
B84["B85: instructions - lines 198 to 199"]
B85["B86: instructions - lines 200 to 200"]
B86["B87: instructions - lines 202 to 203"]
B87["B88: instructions - lines 204 to 204"]
B88["B89: instructions - lines 206 to 207"]
B89["B90: instructions - lines 208 to 208"]
B80 -->|call| B292
B80 -->|after return| B81
B81 -->|call| B97
B81 -->|after return| B82
B82 -->|call| B279
B82 -->|after return| B83
B83 -->|call| B249
B83 -->|after return| B84
B84 -->|call| B279
B84 -->|after return| B85
B85 -->|call| B249
B85 -->|after return| B86
B86 -->|call| B287
B86 -->|after return| B87
B87 -->|call| B249
B87 -->|after return| B88
B88 -->|call| B279
B88 -->|after return| B89
B89 -->|call| B249
B89 -->|after return| B90
B292["Continue at B293 in section 30"]
B97["Continue at B98 in section 10"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL LDELAY
```

### B82

```asm
ACALL CHECK
```

### B83

```asm
CLR C
SUBB A,#30H
ADD A,R1
MOV R3,A
MOV A,#1
ACALL CMD
```

### B84

```asm
ACALL TIME
```

### B85

```asm
MOV A,#80H
ACALL CMD
```

### B86

```asm
ACALL TIME
```

### B87

```asm
MOV DPTR,#A12
ACALL WSTR
```

### B88

```asm
ACALL TIME
```

### B89

```asm
MOV A,#0c0H
ACALL CMD
```

### B90

```asm
ACALL TIME
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 210 to 217"]
B91["B92: instructions - lines 218 to 218"]
B92["B93: instructions - lines 219 to 221"]
B93["B94: instructions - lines 222 to 222"]
B94["B95: instructions - lines 223 to 223"]
B95["B96: instructions - lines 224 to 224"]
B96["B97: instructions - lines 226 to 226"]
B97["B98: CHECK - lines 230 to 230"]
B98["B99: instructions - lines 231 to 231"]
B99["B100: C1 - lines 232 to 232"]
B90 -->|call| B282
B90 -->|after return| B91
B91 -->|call| B292
B91 -->|after return| B92
B92 -->|call| B282
B92 -->|after return| B93
B93 -->|call| B292
B93 -->|after return| B94
B94 -->|call| B249
B94 -->|after return| B95
B95 -->|call| B249
B95 -->|after return| B96
B97 -->|condition true| B99
B97 -->|condition false| B98
B98 -->|jump| B110
B99 -->|condition true| B101
B99 -->|condition false| B100
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B249["Continue at B250 in section 25"]
B110["Continue at B111 in section 12"]
B101["Continue at B102 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,R2
ADD A,R3
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B92

```asm
ACALL LDELAY
```

### B93

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B94

```asm
ACALL LDELAY
```

### B95

```asm
ACALL TIME
```

### B96

```asm
ACALL TIME
```

### B97

Resume the interrupted program.

```asm
RETI
```

### B98

```asm
CJNE A,#'#',C1
```

### B99

```asm
AJMP ERRORA
```

### B100

```asm
CJNE A,#'*',C2
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 233 to 233"]
B101["B102: C2 - lines 234 to 234"]
B102["B103: instructions - lines 235 to 235"]
B103["B104: C3 - lines 236 to 236"]
B104["B105: instructions - lines 237 to 237"]
B105["B106: C4 - lines 238 to 238"]
B106["B107: instructions - lines 239 to 239"]
B107["B108: C5 - lines 240 to 240"]
B108["B109: instructions - lines 241 to 241"]
B109["B110: C6 - lines 242 to 242"]
B100 -->|jump| B110
B101 -->|condition true| B103
B101 -->|condition false| B102
B102 -->|jump| B110
B103 -->|condition true| B105
B103 -->|condition false| B104
B104 -->|jump| B110
B105 -->|condition true| B107
B105 -->|condition false| B106
B106 -->|jump| B110
B107 -->|condition true| B109
B107 -->|condition false| B108
B108 -->|jump| B110
B110["Continue at B111 in section 12"]
```

### B101

```asm
AJMP ERRORA
```

### B102

```asm
CJNE A,#'A',C3
```

### B103

```asm
AJMP ERRORA
```

### B104

```asm
CJNE A,#'B',C4
```

### B105

```asm
AJMP ERRORA
```

### B106

```asm
CJNE A,#'C',C5
```

### B107

```asm
AJMP ERRORA
```

### B108

```asm
CJNE A,#'D',C6
```

### B109

```asm
AJMP ERRORA
```

### B110

Return to the instruction following the active call.

```asm
RET
```

## Section 12

```mermaid
flowchart TD
B110["B111: ERRORA - lines 245 to 245"]
B111["B112: instructions - lines 246 to 246"]
B112["B113: BINR - lines 252 to 253"]
B113["B114: instructions - lines 254 to 254"]
B114["B115: instructions - lines 256 to 257"]
B115["B116: instructions - lines 258 to 258"]
B116["B117: instructions - lines 263 to 263"]
B117["B118: instructions - lines 264 to 264"]
B118["B119: instructions - lines 265 to 265"]
B119["B120: instructions - lines 266 to 266"]
B110 -->|call| B254
B110 -->|after return| B111
B111 -->|jump| B61
B112 -->|call| B279
B112 -->|after return| B113
B113 -->|call| B249
B113 -->|after return| B114
B114 -->|call| B287
B114 -->|after return| B115
B115 -->|call| B249
B115 -->|after return| B116
B116 -->|call| B297
B116 -->|after return| B117
B117 -->|call| B282
B117 -->|after return| B118
B118 -->|call| B249
B118 -->|after return| B119
B119 -->|call| B142
B119 -->|after return| B120
B254["Continue at B255 in section 26"]
B61["Continue at B62 in section 7"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B142["Continue at B143 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL RLED
```

### B112

```asm
AJMP ADDOP
```

### B113

```asm
MOV A,#1
ACALL CMD
```

### B114

```asm
ACALL TIME
```

### B115

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B116

```asm
ACALL TIME
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
ACALL TIME
```

### B120

```asm
ACALL BINCHECK
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 267 to 272"]
B121["B122: instructions - lines 273 to 273"]
B122["B123: instructions - lines 274 to 274"]
B123["B124: instructions - lines 275 to 275"]
B124["B125: instructions - lines 276 to 284"]
B125["B126: instructions - lines 285 to 285"]
B126["B127: instructions - lines 288 to 289"]
B127["B128: instructions - lines 290 to 290"]
B128["B129: instructions - lines 292 to 293"]
B129["B130: instructions - lines 294 to 294"]
B120 -->|call| B297
B120 -->|after return| B121
B121 -->|call| B282
B121 -->|after return| B122
B122 -->|call| B249
B122 -->|after return| B123
B123 -->|call| B142
B123 -->|after return| B124
B124 -->|call| B282
B124 -->|after return| B125
B125 -->|call| B249
B125 -->|after return| B126
B126 -->|call| B279
B126 -->|after return| B127
B127 -->|call| B249
B127 -->|after return| B128
B128 -->|call| B287
B128 -->|after return| B129
B129 -->|call| B249
B129 -->|after return| B130
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B249["Continue at B250 in section 25"]
B142["Continue at B143 in section 15"]
B279["Continue at B280 in section 28"]
B287["Continue at B288 in section 29"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
CLR C
SUBB A,#30H
SWAP A
MOV R1,A
ACALL KEYPAD
```

### B122

```asm
ACALL WCHR
```

### B123

```asm
ACALL TIME
```

### B124

```asm
ACALL BINCHECK
```

### B125

```asm
CLR C
SUBB A,#30H
ADD A,R1
MOV R1,A
MOV 70H,R1
MOV A,#'H'
ACALL WCHR
```

### B126

```asm
ACALL TIME
```

### B127

```asm
MOV A,#0c0H
ACALL CMD
```

### B128

```asm
ACALL TIME
```

### B129

```asm
MOV DPTR,#A13
ACALL WSTR
```

### B130

```asm
ACALL TIME
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 297 to 300"]
B131["B132: LOOP - lines 303 to 306"]
B132["B133: ZEROX - lines 308 to 309"]
B133["B134: instructions - lines 310 to 310"]
B134["B135: instructions - lines 311 to 311"]
B135["B136: ONEX - lines 313 to 314"]
B136["B137: instructions - lines 315 to 315"]
B137["B138: OUTNOWX - lines 317 to 317"]
B138["B139: instructions - lines 318 to 319"]
B139["B140: instructions - lines 320 to 320"]
B130 -->|next| B131
B131 -->|condition true| B135
B131 -->|condition false| B132
B132 -->|call| B282
B132 -->|after return| B133
B133 -->|call| B249
B133 -->|after return| B134
B134 -->|jump| B137
B135 -->|call| B282
B135 -->|after return| B136
B136 -->|call| B249
B136 -->|after return| B137
B137 -->|condition true| B131
B137 -->|condition false| B138
B138 -->|call| B282
B138 -->|after return| B139
B139 -->|call| B249
B139 -->|after return| B140
B282["Continue at B283 in section 29"]
B249["Continue at B250 in section 25"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,70H
MOV R1,70H
MOV R7,#8
```

### B132

```asm
MOV A,R1
RLC A
MOV R1,A
JC ONEX
```

### B133

```asm
MOV A,#'0'
ACALL WCHR
```

### B134

```asm
ACALL TIME
```

### B135

```asm
SJMP OUTNOWX
```

### B136

```asm
MOV A,#'1'
ACALL WCHR
```

### B137

```asm
ACALL TIME
```

### B138

```asm
DJNZ R7,LOOP
```

### B139

```asm
MOV A,#'B'
ACALL WCHR
```

### B140

```asm
ACALL TIME
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 321 to 321"]
B141["B142: instructions - lines 322 to 322"]
B142["B143: BINCHECK - lines 327 to 327"]
B143["B144: instructions - lines 328 to 328"]
B144["B145: M1 - lines 329 to 329"]
B145["B146: instructions - lines 330 to 330"]
B146["B147: M2 - lines 331 to 331"]
B147["B148: instructions - lines 332 to 334"]
B148["B149: M3 - lines 335 to 335"]
B149["B150: instructions - lines 336 to 338"]
B140 -->|call| B249
B140 -->|after return| B141
B142 -->|condition true| B144
B142 -->|condition false| B143
B143 -->|jump| B155
B144 -->|condition true| B146
B144 -->|condition false| B145
B145 -->|jump| B155
B146 -->|condition true| B148
B146 -->|condition false| B147
B148 -->|condition true| B150
B148 -->|condition false| B149
B249["Continue at B250 in section 25"]
B155["Continue at B156 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL TIME
```

### B142

Resume the interrupted program.

```asm
RETI
```

### B143

```asm
CJNE A,#'#',M1
```

### B144

```asm
AJMP ERRORB
```

### B145

```asm
CJNE A,#'*',M2
```

### B146

```asm
AJMP ERRORB
```

### B147

```asm
CJNE A,#'A',M3
```

### B148

Return to the instruction following the active call.

```asm
MOV A,#0AH
ADD A,#30H
RET
```

### B149

```asm
CJNE A,#'B',M4
```

### B150

Return to the instruction following the active call.

```asm
MOV A,#0BH
ADD A,#30H
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: M4 - lines 339 to 339"]
B151["B152: instructions - lines 340 to 342"]
B152["B153: M5 - lines 343 to 343"]
B153["B154: instructions - lines 344 to 346"]
B154["B155: M6 - lines 348 to 348"]
B155["B156: ERRORB - lines 351 to 351"]
B156["B157: instructions - lines 352 to 352"]
B157["B158: COMPLEMENT - lines 356 to 357"]
B158["B159: instructions - lines 358 to 358"]
B159["B160: instructions - lines 360 to 361"]
B150 -->|condition true| B152
B150 -->|condition false| B151
B152 -->|condition true| B154
B152 -->|condition false| B153
B155 -->|call| B254
B155 -->|after return| B156
B156 -->|jump| B112
B157 -->|call| B279
B157 -->|after return| B158
B158 -->|call| B249
B158 -->|after return| B159
B159 -->|call| B287
B159 -->|after return| B160
B254["Continue at B255 in section 26"]
B112["Continue at B113 in section 12"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
CJNE A,#'C',M5
```

### B152

Return to the instruction following the active call.

```asm
MOV A,#0CH
ADD A,#30H
RET
```

### B153

```asm
CJNE A,#'D',M6
```

### B154

Return to the instruction following the active call.

```asm
MOV A,#0DH
ADD A,#30H
RET
```

### B155

Return to the instruction following the active call.

```asm
RET
```

### B156

```asm
ACALL RLED
```

### B157

```asm
AJMP BINR
```

### B158

```asm
MOV A,#1
ACALL CMD
```

### B159

```asm
ACALL TIME
```

### B160

```asm
MOV DPTR,#A10
ACALL WSTR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 362 to 362"]
B161["B162: instructions - lines 364 to 366"]
B162["B163: instructions - lines 367 to 367"]
B163["B164: instructions - lines 368 to 368"]
B164["B165: instructions - lines 369 to 369"]
B165["B166: instructions - lines 371 to 371"]
B166["B167: instructions - lines 372 to 372"]
B167["B168: instructions - lines 373 to 373"]
B168["B169: instructions - lines 374 to 374"]
B169["B170: instructions - lines 376 to 376"]
B160 -->|call| B249
B160 -->|after return| B161
B161 -->|call| B297
B161 -->|after return| B162
B162 -->|call| B282
B162 -->|after return| B163
B163 -->|call| B292
B163 -->|after return| B164
B164 -->|call| B209
B164 -->|after return| B165
B165 -->|call| B297
B165 -->|after return| B166
B166 -->|call| B282
B166 -->|after return| B167
B167 -->|call| B292
B167 -->|after return| B168
B168 -->|call| B209
B168 -->|after return| B169
B169 -->|call| B297
B169 -->|after return| B170
B249["Continue at B250 in section 25"]
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B209["Continue at B210 in section 21"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL TIME
```

### B162

```asm
MOV R1,#0
ACALL KEYPAD
```

### B163

```asm
ACALL WCHR
```

### B164

```asm
ACALL LDELAY
```

### B165

```asm
ACALL ROTATE
```

### B166

```asm
ACALL KEYPAD
```

### B167

```asm
ACALL WCHR
```

### B168

```asm
ACALL LDELAY
```

### B169

```asm
ACALL ROTATE
```

### B170

```asm
ACALL KEYPAD
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 377 to 377"]
B171["B172: instructions - lines 378 to 378"]
B172["B173: instructions - lines 379 to 379"]
B173["B174: instructions - lines 381 to 381"]
B174["B175: instructions - lines 382 to 382"]
B175["B176: instructions - lines 383 to 383"]
B176["B177: instructions - lines 384 to 384"]
B177["B178: instructions - lines 386 to 386"]
B178["B179: instructions - lines 387 to 387"]
B179["B180: instructions - lines 388 to 388"]
B170 -->|call| B282
B170 -->|after return| B171
B171 -->|call| B292
B171 -->|after return| B172
B172 -->|call| B209
B172 -->|after return| B173
B173 -->|call| B297
B173 -->|after return| B174
B174 -->|call| B282
B174 -->|after return| B175
B175 -->|call| B292
B175 -->|after return| B176
B176 -->|call| B209
B176 -->|after return| B177
B177 -->|call| B297
B177 -->|after return| B178
B178 -->|call| B282
B178 -->|after return| B179
B179 -->|call| B292
B179 -->|after return| B180
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B209["Continue at B210 in section 21"]
B297["Continue at B298 in section 30"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL WCHR
```

### B172

```asm
ACALL LDELAY
```

### B173

```asm
ACALL ROTATE
```

### B174

```asm
ACALL KEYPAD
```

### B175

```asm
ACALL WCHR
```

### B176

```asm
ACALL LDELAY
```

### B177

```asm
ACALL ROTATE
```

### B178

```asm
ACALL KEYPAD
```

### B179

```asm
ACALL WCHR
```

### B180

```asm
ACALL LDELAY
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 389 to 389"]
B181["B182: instructions - lines 391 to 391"]
B182["B183: instructions - lines 392 to 392"]
B183["B184: instructions - lines 393 to 393"]
B184["B185: instructions - lines 394 to 394"]
B185["B186: instructions - lines 396 to 396"]
B186["B187: instructions - lines 397 to 397"]
B187["B188: instructions - lines 398 to 398"]
B188["B189: instructions - lines 399 to 399"]
B189["B190: instructions - lines 401 to 401"]
B180 -->|call| B209
B180 -->|after return| B181
B181 -->|call| B297
B181 -->|after return| B182
B182 -->|call| B282
B182 -->|after return| B183
B183 -->|call| B292
B183 -->|after return| B184
B184 -->|call| B209
B184 -->|after return| B185
B185 -->|call| B297
B185 -->|after return| B186
B186 -->|call| B282
B186 -->|after return| B187
B187 -->|call| B292
B187 -->|after return| B188
B188 -->|call| B209
B188 -->|after return| B189
B189 -->|call| B297
B189 -->|after return| B190
B209["Continue at B210 in section 21"]
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL ROTATE
```

### B182

```asm
ACALL KEYPAD
```

### B183

```asm
ACALL WCHR
```

### B184

```asm
ACALL LDELAY
```

### B185

```asm
ACALL ROTATE
```

### B186

```asm
ACALL KEYPAD
```

### B187

```asm
ACALL WCHR
```

### B188

```asm
ACALL LDELAY
```

### B189

```asm
ACALL ROTATE
```

### B190

```asm
ACALL KEYPAD
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 402 to 402"]
B191["B192: instructions - lines 403 to 403"]
B192["B193: instructions - lines 404 to 404"]
B193["B194: instructions - lines 406 to 411"]
B194["B195: instructions - lines 412 to 412"]
B195["B196: instructions - lines 414 to 415"]
B196["B197: instructions - lines 416 to 416"]
B197["B198: instructions - lines 418 to 418"]
B198["B199: LOOPX - lines 421 to 424"]
B199["B200: ZERO - lines 426 to 427"]
B190 -->|call| B282
B190 -->|after return| B191
B191 -->|call| B292
B191 -->|after return| B192
B192 -->|call| B209
B192 -->|after return| B193
B193 -->|call| B279
B193 -->|after return| B194
B194 -->|call| B249
B194 -->|after return| B195
B195 -->|call| B287
B195 -->|after return| B196
B196 -->|call| B249
B196 -->|after return| B197
B197 -->|next| B198
B198 -->|condition true| B202
B198 -->|condition false| B199
B199 -->|call| B282
B199 -->|after return| B200
B282["Continue at B283 in section 29"]
B292["Continue at B293 in section 30"]
B209["Continue at B210 in section 21"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B202["Continue at B203 in section 21"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
ACALL WCHR
```

### B192

```asm
ACALL LDELAY
```

### B193

```asm
ACALL ROTATE
```

### B194

```asm
MOV A,R1
CPL A
MOV R1,A
MOV A,#0c0H
ACALL CMD
```

### B195

```asm
ACALL TIME
```

### B196

```asm
MOV DPTR,#A14
ACALL WSTR
```

### B197

```asm
ACALL TIME
```

### B198

```asm
MOV R7,#8
```

### B199

```asm
MOV A,R1
RLC A
MOV R1,A
JC ONE
```

### B200

```asm
MOV A,#'0'
ACALL WCHR
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 428 to 428"]
B201["B202: instructions - lines 429 to 429"]
B202["B203: ONE - lines 431 to 432"]
B203["B204: instructions - lines 433 to 433"]
B204["B205: OUTNOW - lines 435 to 435"]
B205["B206: instructions - lines 436 to 437"]
B206["B207: instructions - lines 438 to 438"]
B207["B208: instructions - lines 439 to 439"]
B208["B209: instructions - lines 440 to 440"]
B209["B210: ROTATE - lines 444 to 444"]
B200 -->|call| B249
B200 -->|after return| B201
B201 -->|jump| B204
B202 -->|call| B282
B202 -->|after return| B203
B203 -->|call| B249
B203 -->|after return| B204
B204 -->|condition true| B198
B204 -->|condition false| B205
B205 -->|call| B282
B205 -->|after return| B206
B206 -->|call| B249
B206 -->|after return| B207
B207 -->|call| B249
B207 -->|after return| B208
B209 -->|condition true| B211
B209 -->|condition false| B210
B249["Continue at B250 in section 25"]
B282["Continue at B283 in section 29"]
B198["Continue at B199 in section 20"]
B211["Continue at B212 in section 22"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL TIME
```

### B202

```asm
SJMP OUTNOW
```

### B203

```asm
MOV A,#'1'
ACALL WCHR
```

### B204

```asm
ACALL TIME
```

### B205

```asm
DJNZ R7,LOOPX
```

### B206

```asm
MOV A,#'B'
ACALL WCHR
```

### B207

```asm
ACALL TIME
```

### B208

```asm
ACALL TIME
```

### B209

Resume the interrupted program.

```asm
RETI
```

### B210

```asm
CJNE A,#'0',NEXTCHECK
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 445 to 449"]
B211["B212: NEXTCHECK - lines 451 to 451"]
B212["B213: instructions - lines 452 to 455"]
B213["B214: OUTY - lines 457 to 457"]
B214["B215: ERRORX - lines 460 to 460"]
B215["B216: instructions - lines 461 to 461"]
B216["B217: DUPLICATE - lines 466 to 467"]
B217["B218: instructions - lines 468 to 468"]
B218["B219: instructions - lines 470 to 471"]
B219["B220: instructions - lines 472 to 472"]
B210 -->|jump| B213
B211 -->|condition true| B214
B211 -->|condition false| B212
B212 -->|next| B213
B214 -->|call| B254
B214 -->|after return| B215
B215 -->|jump| B157
B216 -->|call| B279
B216 -->|after return| B217
B217 -->|call| B249
B217 -->|after return| B218
B218 -->|call| B287
B218 -->|after return| B219
B219 -->|call| B249
B219 -->|after return| B220
B254["Continue at B255 in section 26"]
B157["Continue at B158 in section 16"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
CLR C
MOV A,R1
RLC A
MOV R1,A
SJMP OUTY
```

### B212

```asm
CJNE A,#'1',ERRORX
```

### B213

```asm
SETB C
MOV A,R1
RLC A
MOV R1,A
```

### B214

Return to the instruction following the active call.

```asm
RET
```

### B215

```asm
ACALL RLED
```

### B216

```asm
AJMP COMPLEMENT
```

### B217

```asm
MOV A,#1
ACALL CMD
```

### B218

```asm
ACALL TIME
```

### B219

```asm
MOV DPTR,#A10
ACALL WSTR
```

### B220

```asm
ACALL TIME
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 477 to 477"]
B221["B222: instructions - lines 478 to 478"]
B222["B223: instructions - lines 479 to 479"]
B223["B224: instructions - lines 480 to 486"]
B224["B225: instructions - lines 487 to 487"]
B225["B226: instructions - lines 489 to 490"]
B226["B227: instructions - lines 491 to 491"]
B227["B228: instructions - lines 493 to 500"]
B228["B229: instructions - lines 501 to 501"]
B229["B230: instructions - lines 502 to 504"]
B220 -->|call| B297
B220 -->|after return| B221
B221 -->|call| B282
B221 -->|after return| B222
B222 -->|call| B234
B222 -->|after return| B223
B223 -->|call| B279
B223 -->|after return| B224
B224 -->|call| B249
B224 -->|after return| B225
B225 -->|call| B287
B225 -->|after return| B226
B226 -->|call| B249
B226 -->|after return| B227
B227 -->|call| B282
B227 -->|after return| B228
B228 -->|call| B292
B228 -->|after return| B229
B229 -->|call| B282
B229 -->|after return| B230
B297["Continue at B298 in section 30"]
B282["Continue at B283 in section 29"]
B234["Continue at B235 in section 24"]
B279["Continue at B280 in section 28"]
B249["Continue at B250 in section 25"]
B287["Continue at B288 in section 29"]
B292["Continue at B293 in section 30"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
ACALL KEYPAD
```

### B222

```asm
ACALL WCHR
```

### B223

```asm
ACALL CHECK2
```

### B224

```asm
CLR C
SUBB A,#30H
MOV R1,A
MOV A,#0c0H
ACALL CMD
```

### B225

```asm
ACALL TIME
```

### B226

```asm
MOV DPTR,#A15
ACALL WSTR
```

### B227

```asm
ACALL TIME
```

### B228

```asm
MOV A,R1
MOV B,A
ADD A,B
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B229

```asm
ACALL LDELAY
```

### B230

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 505 to 505"]
B231["B232: instructions - lines 506 to 506"]
B232["B233: instructions - lines 507 to 507"]
B233["B234: instructions - lines 508 to 508"]
B234["B235: CHECK2 - lines 512 to 512"]
B235["B236: instructions - lines 513 to 513"]
B236["B237: F1 - lines 514 to 514"]
B237["B238: instructions - lines 515 to 515"]
B238["B239: F2 - lines 516 to 516"]
B239["B240: instructions - lines 517 to 517"]
B230 -->|call| B292
B230 -->|after return| B231
B231 -->|call| B249
B231 -->|after return| B232
B232 -->|call| B249
B232 -->|after return| B233
B234 -->|condition true| B236
B234 -->|condition false| B235
B235 -->|jump| B247
B236 -->|condition true| B238
B236 -->|condition false| B237
B237 -->|jump| B247
B238 -->|condition true| B240
B238 -->|condition false| B239
B239 -->|jump| B247
B292["Continue at B293 in section 30"]
B249["Continue at B250 in section 25"]
B247["Continue at B248 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
ACALL LDELAY
```

### B232

```asm
ACALL TIME
```

### B233

```asm
ACALL TIME
```

### B234

Resume the interrupted program.

```asm
RETI
```

### B235

```asm
CJNE A,#'#',F1
```

### B236

```asm
AJMP ERRORD
```

### B237

```asm
CJNE A,#'*',F2
```

### B238

```asm
AJMP ERRORD
```

### B239

```asm
CJNE A,#'A',F3
```

### B240

```asm
AJMP ERRORD
```

## Section 25

```mermaid
flowchart TD
B240["B241: F3 - lines 518 to 518"]
B241["B242: instructions - lines 519 to 519"]
B242["B243: F4 - lines 520 to 520"]
B243["B244: instructions - lines 521 to 521"]
B244["B245: F5 - lines 522 to 522"]
B245["B246: instructions - lines 523 to 523"]
B246["B247: F6 - lines 524 to 524"]
B247["B248: ERRORD - lines 527 to 527"]
B248["B249: instructions - lines 528 to 528"]
B249["B250: TIME - lines 536 to 536"]
B240 -->|condition true| B242
B240 -->|condition false| B241
B241 -->|jump| B247
B242 -->|condition true| B244
B242 -->|condition false| B243
B243 -->|jump| B247
B244 -->|condition true| B246
B244 -->|condition false| B245
B245 -->|jump| B247
B247 -->|call| B254
B247 -->|after return| B248
B248 -->|jump| B216
B249 -->|next| B250
B254["Continue at B255 in section 26"]
B216["Continue at B217 in section 22"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
CJNE A,#'B',F4
```

### B242

```asm
AJMP ERRORD
```

### B243

```asm
CJNE A,#'C',F5
```

### B244

```asm
AJMP ERRORD
```

### B245

```asm
CJNE A,#'D',F6
```

### B246

```asm
AJMP ERRORD
```

### B247

Return to the instruction following the active call.

```asm
RET
```

### B248

```asm
ACALL RLED
```

### B249

```asm
AJMP DUPLICATE
```

### B250

```asm
MOV R6,#130
```

## Section 26

```mermaid
flowchart TD
B250["B251: T - lines 538 to 541"]
B251["B252: BACK - lines 543 to 543"]
B252["B253: instructions - lines 544 to 546"]
B253["B254: instructions - lines 547 to 547"]
B254["B255: RLED - lines 550 to 550"]
B255["B256: RLOOP - lines 552 to 553"]
B256["B257: instructions - lines 554 to 555"]
B257["B258: instructions - lines 556 to 556"]
B258["B259: instructions - lines 557 to 557"]
B259["B260: INLCD - lines 563 to 564"]
B250 -->|next| B251
B251 -->|condition true| B251
B251 -->|condition false| B252
B252 -->|condition true| B250
B252 -->|condition false| B253
B254 -->|next| B255
B255 -->|call| B249
B255 -->|after return| B256
B256 -->|call| B249
B256 -->|after return| B257
B257 -->|condition true| B255
B257 -->|condition false| B258
B259 -->|next| B260
B249["Continue at B250 in section 25"]
B260["Continue at B261 in section 27"]
```

### B251

```asm
MOV TMOD,#21H
MOV TL0,#0EEH
MOV TH0,#0B7H
SETB TR0
```

### B252

```asm
JNB TF0,BACK
```

### B253

```asm
CLR TR0
CLR TF0
DJNZ R6,T
```

### B254

Return to the instruction following the active call.

```asm
RET
```

### B255

```asm
MOV R7,#3
```

### B256

```asm
CLR R
ACALL TIME
```

### B257

```asm
SETB R
ACALL TIME
```

### B258

```asm
DJNZ R7,RLOOP
```

### B259

Return to the instruction following the active call.

```asm
RET
```

### B260

```asm
PUSH 7
MOV R7,#20
```

## Section 27

```mermaid
flowchart TD
B260["B261: WAIT - lines 566 to 566"]
B261["B262: instructions - lines 567 to 567"]
B262["B263: instructions - lines 569 to 571"]
B263["B264: instructions - lines 572 to 572"]
B264["B265: instructions - lines 573 to 574"]
B265["B266: instructions - lines 575 to 576"]
B266["B267: instructions - lines 577 to 578"]
B267["B268: instructions - lines 579 to 580"]
B268["B269: instructions - lines 581 to 582"]
B269["B270: instructions - lines 583 to 584"]
B260 -->|call| B292
B260 -->|after return| B261
B261 -->|condition true| B260
B261 -->|condition false| B262
B262 -->|call| B279
B262 -->|after return| B263
B263 -->|call| B292
B263 -->|after return| B264
B264 -->|call| B279
B264 -->|after return| B265
B265 -->|call| B279
B265 -->|after return| B266
B266 -->|call| B279
B266 -->|after return| B267
B267 -->|call| B279
B267 -->|after return| B268
B268 -->|call| B279
B268 -->|after return| B269
B269 -->|call| B279
B269 -->|after return| B270
B292["Continue at B293 in section 30"]
B279["Continue at B280 in section 28"]
B270["Continue at B271 in section 28"]
```

### B261

```asm
ACALL LDELAY
```

### B262

```asm
DJNZ R7,WAIT
```

### B263

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B264

```asm
ACALL LDELAY
```

### B265

```asm
MOV A,#0011B
ACALL CMD
```

### B266

```asm
MOV A,#0011B
ACALL CMD
```

### B267

```asm
MOV A,#0010B
ACALL CMD
```

### B268

```asm
MOV A,#0010B
ACALL CMD
```

### B269

```asm
MOV A,#1000B
ACALL CMD
```

### B270

```asm
MOV A,#0000B
ACALL CMD
```

## Section 28

```mermaid
flowchart TD
B270["B271: instructions - lines 585 to 586"]
B271["B272: instructions - lines 587 to 588"]
B272["B273: instructions - lines 589 to 590"]
B273["B274: instructions - lines 591 to 591"]
B274["B275: instructions - lines 592 to 593"]
B275["B276: instructions - lines 594 to 595"]
B276["B277: instructions - lines 596 to 597"]
B277["B278: instructions - lines 598 to 599"]
B278["B279: instructions - lines 601 to 602"]
B279["B280: CMD - lines 606 to 612"]
B270 -->|call| B279
B270 -->|after return| B271
B271 -->|call| B279
B271 -->|after return| B272
B272 -->|call| B279
B272 -->|after return| B273
B273 -->|call| B292
B273 -->|after return| B274
B274 -->|call| B279
B274 -->|after return| B275
B275 -->|call| B279
B275 -->|after return| B276
B276 -->|call| B279
B276 -->|after return| B277
B277 -->|call| B279
B277 -->|after return| B278
B279 -->|call| B285
B279 -->|after return| B280
B292["Continue at B293 in section 30"]
B285["Continue at B286 in section 29"]
B280["Continue at B281 in section 29"]
```

### B271

```asm
MOV A,#1000B
ACALL CMD
```

### B272

```asm
MOV A,#0
ACALL CMD
```

### B273

```asm
MOV A,#0001B
ACALL CMD
```

### B274

```asm
ACALL LDELAY
```

### B275

```asm
MOV A,#0000B
ACALL CMD
```

### B276

```asm
MOV A,#0110B
ACALL CMD
```

### B277

```asm
MOV A,#0000B
ACALL CMD
```

### B278

```asm
MOV A,#1111B
ACALL CMD
```

### B279

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B280

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

## Section 29

```mermaid
flowchart TD
B280["B281: instructions - lines 613 to 614"]
B281["B282: instructions - lines 616 to 618"]
B282["B283: WCHR - lines 621 to 627"]
B283["B284: instructions - lines 628 to 629"]
B284["B285: instructions - lines 631 to 633"]
B285["B286: COMMON - lines 636 to 643"]
B286["B287: instructions - lines 644 to 644"]
B287["B288: WSTR - lines 647 to 647"]
B288["B289: CONT1 - lines 649 to 651"]
B289["B290: instructions - lines 652 to 652"]
B280 -->|call| B285
B280 -->|after return| B281
B282 -->|call| B285
B282 -->|after return| B283
B283 -->|call| B285
B283 -->|after return| B284
B285 -->|call| B292
B285 -->|after return| B286
B287 -->|next| B288
B288 -->|condition true| B291
B288 -->|condition false| B289
B289 -->|call| B282
B289 -->|after return| B290
B292["Continue at B293 in section 30"]
B291["Continue at B292 in section 30"]
B290["Continue at B291 in section 30"]
```

### B281

```asm
MOV A,B
ACALL COMMON
```

### B282

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B283

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B284

```asm
MOV A,B
ACALL COMMON
```

### B285

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B286

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

### B287

Return to the instruction following the active call.

```asm
RET
```

### B288

```asm
PUSH ACC
```

### B289

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B290

```asm
ACALL WCHR
```

## Section 30

```mermaid
flowchart TD
B290["B291: instructions - lines 653 to 654"]
B291["B292: EXIT1 - lines 656 to 657"]
B292["B293: LDELAY - lines 660 to 662"]
B293["B294: CON4 - lines 664 to 665"]
B294["B295: instructions - lines 666 to 666"]
B295["B296: instructions - lines 667 to 669"]
B296["B297: OUT - lines 675 to 675"]
B297["B298: KEYPAD - lines 678 to 678"]
B298["B299: K1 - lines 680 to 683"]
B299["B300: K2 - lines 685 to 685"]
B290 -->|jump| B288
B292 -->|next| B293
B293 -->|condition true| B293
B293 -->|condition false| B294
B294 -->|condition true| B293
B294 -->|condition false| B295
B296 -->|jump| B296
B297 -->|next| B298
B298 -->|condition true| B298
B298 -->|condition false| B299
B299 -->|call| B318
B299 -->|after return| B300
B288["Continue at B289 in section 29"]
B318["Continue at B319 in section 32"]
B300["Continue at B301 in section 31"]
```

### B291

```asm
INC DPTR
AJMP CONT1
```

### B292

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B293

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B294

```asm
MOV R0,#250
DJNZ R0,$
```

### B295

```asm
DJNZ R1,CON4
```

### B296

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B297

```asm
SJMP OUT
```

### B298

```asm
MOV P2,#11110000B
```

### B299

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B300

```asm
ACALL TMSEC
```

## Section 31

```mermaid
flowchart TD
B300["B301: instructions - lines 686 to 688"]
B301["B302: instructions - lines 689 to 689"]
B302["B303: OVER - lines 692 to 692"]
B303["B304: instructions - lines 693 to 695"]
B304["B305: instructions - lines 696 to 696"]
B305["B306: OVER1 - lines 699 to 702"]
B306["B307: instructions - lines 704 to 707"]
B307["B308: instructions - lines 709 to 712"]
B308["B309: instructions - lines 714 to 717"]
B309["B310: instructions - lines 719 to 719"]
B300 -->|condition true| B302
B300 -->|condition false| B301
B301 -->|jump| B299
B302 -->|call| B318
B302 -->|after return| B303
B303 -->|condition true| B305
B303 -->|condition false| B304
B304 -->|jump| B299
B305 -->|condition true| B310
B305 -->|condition false| B306
B306 -->|condition true| B311
B306 -->|condition false| B307
B307 -->|condition true| B312
B307 -->|condition false| B308
B308 -->|condition true| B313
B308 -->|condition false| B309
B309 -->|jump| B299
B299["Continue at B300 in section 30"]
B318["Continue at B319 in section 32"]
B310["Continue at B311 in section 32"]
B311["Continue at B312 in section 32"]
B312["Continue at B313 in section 32"]
B313["Continue at B314 in section 32"]
```

### B301

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B302

```asm
SJMP K2
```

### B303

```asm
ACALL TMSEC
```

### B304

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B305

```asm
SJMP K2
```

### B306

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B307

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B308

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B309

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B310

```asm
LJMP K2
```

## Section 32

```mermaid
flowchart TD
B310["B311: ROW_0 - lines 721 to 722"]
B311["B312: ROW_1 - lines 724 to 725"]
B312["B313: ROW_2 - lines 727 to 728"]
B313["B314: ROW_3 - lines 730 to 730"]
B314["B315: FIND - lines 733 to 733"]
B315["B316: FIND1 - lines 736 to 737"]
B316["B317: instructions - lines 738 to 739"]
B317["B318: MATCH - lines 742 to 744"]
B318["B319: TMSEC - lines 748 to 751"]
B319["B320: BACK32 - lines 753 to 753"]
B310 -->|jump| B314
B311 -->|jump| B314
B312 -->|jump| B314
B313 -->|next| B314
B314 -->|next| B315
B315 -->|condition true| B317
B315 -->|condition false| B316
B316 -->|jump| B315
B318 -->|next| B319
B319 -->|condition true| B319
B319 -->|condition false| B320
B320["Continue at B321 in section 33"]
```

### B311

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B312

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B313

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B314

```asm
MOV DPTR,#KCODE3
```

### B315

```asm
SWAP A
```

### B316

```asm
RRC A
JNC MATCH
```

### B317

```asm
INC DPTR
SJMP FIND1
```

### B318

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B319

```asm
MOV   TMOD,#00000001B
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B320

```asm
JNB   	TF0,BACK32
```

## Section 33

```mermaid
flowchart TD
B320["B321: instructions - lines 754 to 756"]
B321["B322: instructions - lines 759 to 759"]
```

### B321

Return to the instruction following the active call.

```asm
CLR   	TR0
CLR   	TF0
RET
```

### B322

Resume the interrupted program.

```asm
RETI
```
