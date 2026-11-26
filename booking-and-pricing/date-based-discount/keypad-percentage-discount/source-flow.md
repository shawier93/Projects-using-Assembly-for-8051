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
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 4 to 14"]
B2["B3: instructions - lines 17 to 17"]
B3["B4: instructions - lines 18 to 18"]
B4["B5: instructions - lines 21 to 21"]
B5["B6: instructions - lines 22 to 22"]
B6["B7: MAINMENUE - lines 26 to 27"]
B7["B8: instructions - lines 29 to 32"]
B8["B9: instructions - lines 33 to 33"]
B9["B10: instructions - lines 36 to 37"]
B0 -->|call| B121
B0 -->|after return| B1
B1 -->|call| B32
B1 -->|after return| B2
B2 -->|call| B128
B2 -->|after return| B3
B3 -->|call| B44
B3 -->|after return| B4
B4 -->|call| B128
B4 -->|after return| B5
B5 -->|call| B54
B5 -->|after return| B6
B6 -->|call| B32
B6 -->|after return| B7
B7 -->|call| B128
B7 -->|after return| B8
B8 -->|call| B64
B8 -->|after return| B9
B9 -->|condition true| B14
B9 -->|condition false| B10
B121["Continue at B122 in section 13"]
B32["Continue at B33 in section 4"]
B128["Continue at B129 in section 13"]
B44["Continue at B45 in section 5"]
B54["Continue at B55 in section 6"]
B64["Continue at B65 in section 7"]
B14["Continue at B15 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV P1,#00
MOV R3,#21
MOV R4,#19
MOV R5,#0
MOV R0,#0
MOV R1,#0
MOV R2,#0
MOV R7,#0
MOV 20H,#0FBH
LCALL FLASH
```

### B3

```asm
acall clear
```

### B4

```asm
acall display1
```

### B5

```asm
acall clear
```

### B6

```asm
acall display2
```

### B7

```asm
MOV 20H,#07FH
LCALL FLASH
```

### B8

```asm
MOV A,R4
SUBB A,#1
mov R4,A
acall clear
```

### B9

```asm
acall display3
```

### B10

```asm
MOV A,R4
CJNE A,#0H,CASE2
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 39 to 40"]
B11["B12: instructions - lines 41 to 41"]
B12["B13: instructions - lines 42 to 42"]
B13["B14: instructions - lines 43 to 44"]
B14["B15: CASE2 - lines 47 to 47"]
B15["B16: CASE3 - lines 49 to 49"]
B16["B17: instructions - lines 51 to 52"]
B17["B18: instructions - lines 53 to 53"]
B18["B19: instructions - lines 54 to 54"]
B19["B20: instructions - lines 55 to 56"]
B10 -->|call| B32
B10 -->|after return| B11
B11 -->|call| B128
B11 -->|after return| B12
B12 -->|call| B72
B12 -->|after return| B13
B13 -->|jump| B29
B14 -->|condition true| B15
B14 -->|condition false| B15
B15 -->|condition true| B20
B15 -->|condition false| B16
B16 -->|call| B32
B16 -->|after return| B17
B17 -->|call| B128
B17 -->|after return| B18
B18 -->|call| B75
B18 -->|after return| B19
B19 -->|jump| B29
B32["Continue at B33 in section 4"]
B128["Continue at B129 in section 13"]
B72["Continue at B73 in section 8"]
B29["Continue at B30 in section 3"]
B20["Continue at B21 in section 3"]
B75["Continue at B76 in section 8"]
```

### B11

```asm
MOV 20H,#0BFH
LCALL FLASH
```

### B12

```asm
acall clear
```

### B13

```asm
acall display4
```

### B14

```asm
MOV R5,#0H
AJMP CALC
```

### B15

```asm
CJNE A,#10, CASE3
```

### B16

```asm
JNC CASE4
```

### B17

```asm
MOV 20H,#0eFH
LCALL FLASH
```

### B18

```asm
acall clear
```

### B19

```asm
acall display5
```

### B20

```asm
MOV R5,#1
AJMP CALC
```

## Section 3

```mermaid
flowchart TD
B20["B21: CASE4 - lines 58 to 58"]
B21["B22: CASE5 - lines 60 to 60"]
B22["B23: instructions - lines 62 to 63"]
B23["B24: instructions - lines 65 to 65"]
B24["B25: instructions - lines 66 to 66"]
B25["B26: instructions - lines 68 to 69"]
B26["B27: CASE6 - lines 72 to 73"]
B27["B28: instructions - lines 74 to 74"]
B28["B29: instructions - lines 75 to 76"]
B29["B30: CALC - lines 80 to 90"]
B20 -->|condition true| B21
B20 -->|condition false| B21
B21 -->|condition true| B26
B21 -->|condition false| B22
B22 -->|call| B32
B22 -->|after return| B23
B23 -->|call| B128
B23 -->|after return| B24
B24 -->|call| B84
B24 -->|after return| B25
B25 -->|jump| B29
B26 -->|call| B128
B26 -->|after return| B27
B27 -->|call| B103
B27 -->|after return| B28
B28 -->|jump| B29
B29 -->|call| B128
B29 -->|after return| B30
B32["Continue at B33 in section 4"]
B128["Continue at B129 in section 13"]
B84["Continue at B85 in section 9"]
B103["Continue at B104 in section 11"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
CJNE A,#20, CASE5
```

### B22

```asm
JNC CASE6
```

### B23

```asm
MOV 20H,#0f7H
LCALL FLASH
```

### B24

```asm
acall clear
```

### B25

```asm
acall display6
```

### B26

```asm
MOV R5,#2
AJMP CALC
```

### B27

```asm
MOV 20H,#00FH
acall clear
```

### B28

```asm
acall display8
```

### B29

```asm
MOV R5,#10
AJMP CALC
```

### B30

```asm
MOV B,R5
MOV A,R3
MUL AB
mov 50h,a
MOV B,#10
DIV AB
MOV R5,A
MOV A,R3
SUBB A,R5
MOV R6,A
acall clear
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 91 to 91"]
B31["B32: LOOP - lines 93 to 93"]
B32["B33: FLASH - lines 97 to 98"]
B33["B34: instructions - lines 99 to 100"]
B34["B35: instructions - lines 101 to 102"]
B35["B36: instructions - lines 103 to 104"]
B36["B37: instructions - lines 105 to 106"]
B37["B38: instructions - lines 107 to 108"]
B38["B39: instructions - lines 109 to 109"]
B39["B40: DELAY - lines 112 to 112"]
B30 -->|call| B95
B30 -->|after return| B31
B31 -->|jump| B31
B32 -->|call| B39
B32 -->|after return| B33
B33 -->|call| B39
B33 -->|after return| B34
B34 -->|call| B39
B34 -->|after return| B35
B35 -->|call| B39
B35 -->|after return| B36
B36 -->|call| B39
B36 -->|after return| B37
B37 -->|call| B39
B37 -->|after return| B38
B39 -->|next| B40
B95["Continue at B96 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
acall display7
```

### B32

```asm
SJMP LOOP
```

### B33

```asm
MOV P1,20H
ACALL DELAY
```

### B34

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B35

```asm
MOV P1,20H
ACALL DELAY
```

### B36

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B37

```asm
MOV P1,20H
ACALL DELAY
```

### B38

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B39

Return to the instruction following the active call.

```asm
RET
```

### B40

```asm
MOV R0,#250
```

## Section 5

```mermaid
flowchart TD
B40["B41: L2 - lines 113 to 113"]
B41["B42: L - lines 114 to 114"]
B42["B43: instructions - lines 115 to 115"]
B43["B44: instructions - lines 116 to 116"]
B44["B45: DISPLAY1 - lines 119 to 120"]
B45["B46: instructions - lines 121 to 122"]
B46["B47: instructions - lines 123 to 124"]
B47["B48: instructions - lines 125 to 125"]
B48["B49: instructions - lines 126 to 127"]
B49["B50: instructions - lines 128 to 133"]
B40 -->|next| B41
B41 -->|condition true| B41
B41 -->|condition false| B42
B42 -->|condition true| B40
B42 -->|condition false| B43
B44 -->|call| B115
B44 -->|after return| B45
B45 -->|call| B133
B45 -->|after return| B46
B46 -->|call| B115
B46 -->|after return| B47
B47 -->|call| B138
B47 -->|after return| B48
B48 -->|call| B110
B48 -->|after return| B49
B49 -->|call| B39
B49 -->|after return| B50
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B138["Continue at B139 in section 14"]
B110["Continue at B111 in section 12"]
B39["Continue at B40 in section 4"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV R1,#10
```

### B42

```asm
DJNZ R1,L
```

### B43

```asm
DJNZ R0,L2
```

### B44

Return to the instruction following the active call.

```asm
RET
```

### B45

```asm
mov a, #80H
acall cmd
```

### B46

```asm
mov dptr, #amount
acall wstr
```

### B47

```asm
mov a,#0c0h
acall cmd
```

### B48

```asm
ACALL KEYPAD
```

### B49

```asm
MOV R2,A
acall wchr
```

### B50

```asm
MOV B,#10
MOV A,R2
SUBB A,#30H
MUL AB
MOV R2,A
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 135 to 135"]
B51["B52: instructions - lines 136 to 137"]
B52["B53: instructions - lines 138 to 144"]
B53["B54: instructions - lines 146 to 146"]
B54["B55: DISPLAY2 - lines 149 to 150"]
B55["B56: instructions - lines 151 to 152"]
B56["B57: instructions - lines 153 to 154"]
B57["B58: instructions - lines 156 to 156"]
B58["B59: instructions - lines 157 to 158"]
B59["B60: instructions - lines 159 to 164"]
B50 -->|call| B138
B50 -->|after return| B51
B51 -->|call| B110
B51 -->|after return| B52
B52 -->|call| B39
B52 -->|after return| B53
B54 -->|call| B115
B54 -->|after return| B55
B55 -->|call| B133
B55 -->|after return| B56
B56 -->|call| B115
B56 -->|after return| B57
B57 -->|call| B138
B57 -->|after return| B58
B58 -->|call| B110
B58 -->|after return| B59
B59 -->|call| B39
B59 -->|after return| B60
B138["Continue at B139 in section 14"]
B110["Continue at B111 in section 12"]
B39["Continue at B40 in section 4"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL KEYPAD
```

### B52

```asm
MOV R1,A
acall wchr
```

### B53

```asm
MOV A,R1
SUBB A,#30H
MOV R1,A
MOV A,R2
ADD A,R1
MOV R3,A
ACALL DELAY
```

### B54

Return to the instruction following the active call.

```asm
ret
```

### B55

```asm
mov a, #80H
acall cmd
```

### B56

```asm
mov dptr, #data
acall wstr
```

### B57

```asm
mov a,#0c0h
acall cmd
```

### B58

```asm
ACALL KEYPAD
```

### B59

```asm
MOV R2,A
acall wchr
```

### B60

```asm
MOV B,#10
MOV A,R2
SUBB A,#30H
MUL AB
MOV R2,A
ACALL DELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 166 to 166"]
B61["B62: instructions - lines 167 to 168"]
B62["B63: instructions - lines 169 to 175"]
B63["B64: instructions - lines 177 to 177"]
B64["B65: DISPLAY3 - lines 180 to 181"]
B65["B66: instructions - lines 182 to 183"]
B66["B67: instructions - lines 184 to 185"]
B67["B68: instructions - lines 186 to 190"]
B68["B69: instructions - lines 191 to 193"]
B69["B70: instructions - lines 194 to 194"]
B60 -->|call| B138
B60 -->|after return| B61
B61 -->|call| B110
B61 -->|after return| B62
B62 -->|call| B39
B62 -->|after return| B63
B64 -->|call| B115
B64 -->|after return| B65
B65 -->|call| B133
B65 -->|after return| B66
B66 -->|call| B115
B66 -->|after return| B67
B67 -->|call| B110
B67 -->|after return| B68
B68 -->|call| B110
B68 -->|after return| B69
B69 -->|call| B39
B69 -->|after return| B70
B138["Continue at B139 in section 14"]
B110["Continue at B111 in section 12"]
B39["Continue at B40 in section 4"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL KEYPAD
```

### B62

```asm
MOV R1,A
acall wchr
```

### B63

```asm
MOV A,R1
SUBB A,#30H
MOV R1,A
MOV A,R2
ADD A,R1
MOV R4,A
ACALL DELAY
```

### B64

Return to the instruction following the active call.

```asm
ret
```

### B65

```asm
mov a, #80H
acall cmd
```

### B66

```asm
mov dptr, #days
acall wstr
```

### B67

```asm
mov a,#0c0h
acall cmd
```

### B68

```asm
mov a,R4
mov b,#10
div ab
add a,#30h
acall wchr
```

### B69

```asm
mov a,b
add a,#30h
acall wchr
```

### B70

```asm
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 195 to 195"]
B71["B72: instructions - lines 196 to 196"]
B72["B73: DISPLAY4 - lines 200 to 201"]
B73["B74: instructions - lines 202 to 203"]
B74["B75: instructions - lines 204 to 204"]
B75["B76: DISPLAY5 - lines 208 to 209"]
B76["B77: instructions - lines 210 to 211"]
B77["B78: instructions - lines 213 to 214"]
B78["B79: instructions - lines 215 to 216"]
B79["B80: instructions - lines 217 to 218"]
B70 -->|call| B39
B70 -->|after return| B71
B72 -->|call| B115
B72 -->|after return| B73
B73 -->|call| B133
B73 -->|after return| B74
B75 -->|call| B115
B75 -->|after return| B76
B76 -->|call| B133
B76 -->|after return| B77
B77 -->|call| B115
B77 -->|after return| B78
B78 -->|call| B110
B78 -->|after return| B79
B79 -->|call| B110
B79 -->|after return| B80
B39["Continue at B40 in section 4"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B110["Continue at B111 in section 12"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

Return to the instruction following the active call.

```asm
ret
```

### B73

```asm
mov a, #80H
acall cmd
```

### B74

```asm
mov dptr,#nolate
acall wstr
```

### B75

Return to the instruction following the active call.

```asm
ret
```

### B76

```asm
mov a, #80H
acall cmd
```

### B77

```asm
mov dptr, #dis
acall wstr
```

### B78

```asm
mov a,#0c0h
acall cmd
```

### B79

```asm
mov a,#'1'
acall wchr
```

### B80

```asm
mov a,#'0'
acall wchr
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 219 to 220"]
B81["B82: instructions - lines 221 to 221"]
B82["B83: instructions - lines 222 to 222"]
B83["B84: instructions - lines 223 to 223"]
B84["B85: DISPLAY6 - lines 227 to 228"]
B85["B86: instructions - lines 229 to 230"]
B86["B87: instructions - lines 232 to 233"]
B87["B88: instructions - lines 234 to 235"]
B88["B89: instructions - lines 236 to 237"]
B89["B90: instructions - lines 238 to 239"]
B80 -->|call| B110
B80 -->|after return| B81
B81 -->|call| B39
B81 -->|after return| B82
B82 -->|call| B39
B82 -->|after return| B83
B84 -->|call| B115
B84 -->|after return| B85
B85 -->|call| B133
B85 -->|after return| B86
B86 -->|call| B115
B86 -->|after return| B87
B87 -->|call| B110
B87 -->|after return| B88
B88 -->|call| B110
B88 -->|after return| B89
B89 -->|call| B110
B89 -->|after return| B90
B110["Continue at B111 in section 12"]
B39["Continue at B40 in section 4"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov a,#'%'
acall wchr
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
ACALL DELAY
```

### B84

Return to the instruction following the active call.

```asm
ret
```

### B85

```asm
mov a, #80H
acall cmd
```

### B86

```asm
mov dptr, #dis
acall wstr
```

### B87

```asm
mov a,#0c0h
acall cmd
```

### B88

```asm
mov a,#'2'
acall wchr
```

### B89

```asm
mov a,#'0'
acall wchr
```

### B90

```asm
mov a,#'%'
acall wchr
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 240 to 240"]
B91["B92: instructions - lines 241 to 241"]
B92["B93: instructions - lines 242 to 242"]
B93["B94: instructions - lines 243 to 243"]
B94["B95: instructions - lines 244 to 244"]
B95["B96: DISPLAY7 - lines 248 to 249"]
B96["B97: instructions - lines 250 to 251"]
B97["B98: instructions - lines 253 to 254"]
B98["B99: instructions - lines 255 to 259"]
B99["B100: instructions - lines 260 to 262"]
B90 -->|call| B39
B90 -->|after return| B91
B91 -->|call| B39
B91 -->|after return| B92
B92 -->|call| B39
B92 -->|after return| B93
B93 -->|call| B39
B93 -->|after return| B94
B95 -->|call| B115
B95 -->|after return| B96
B96 -->|call| B133
B96 -->|after return| B97
B97 -->|call| B115
B97 -->|after return| B98
B98 -->|call| B110
B98 -->|after return| B99
B99 -->|call| B110
B99 -->|after return| B100
B39["Continue at B40 in section 4"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B110["Continue at B111 in section 12"]
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

```asm
ACALL DELAY
```

### B95

Return to the instruction following the active call.

```asm
ret
```

### B96

```asm
mov a, #80H
acall cmd
```

### B97

```asm
mov dptr, #pay
acall wstr
```

### B98

```asm
mov a,#0c0h
acall cmd
```

### B99

```asm
mov a,R6
mov b,#10
div ab
add a,#30h
acall wchr
```

### B100

```asm
mov a,b
add a,#30h
acall wchr
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 263 to 263"]
B101["B102: instructions - lines 264 to 264"]
B102["B103: instructions - lines 265 to 265"]
B103["B104: DISPLAY8 - lines 268 to 269"]
B104["B105: instructions - lines 270 to 271"]
B105["B106: instructions - lines 272 to 272"]
B106["B107: instructions - lines 273 to 273"]
B107["B108: instructions - lines 274 to 274"]
B108["B109: instructions - lines 275 to 275"]
B109["B110: instructions - lines 276 to 276"]
B100 -->|call| B39
B100 -->|after return| B101
B101 -->|call| B39
B101 -->|after return| B102
B103 -->|call| B115
B103 -->|after return| B104
B104 -->|call| B133
B104 -->|after return| B105
B105 -->|call| B39
B105 -->|after return| B106
B106 -->|call| B39
B106 -->|after return| B107
B107 -->|call| B39
B107 -->|after return| B108
B108 -->|call| B39
B108 -->|after return| B109
B39["Continue at B40 in section 4"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
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

Return to the instruction following the active call.

```asm
ret
```

### B104

```asm
mov a, #80H
acall cmd
```

### B105

```asm
mov dptr,#free
acall wstr
```

### B106

```asm
ACALL DELAY
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

Return to the instruction following the active call.

```asm
ret
```

## Section 12

```mermaid
flowchart TD
B110["B111: WCHR - lines 280 to 284"]
B111["B112: instructions - lines 285 to 285"]
B112["B113: instructions - lines 286 to 288"]
B113["B114: instructions - lines 289 to 289"]
B114["B115: instructions - lines 290 to 292"]
B115["B116: CMD - lines 295 to 297"]
B116["B117: instructions - lines 298 to 298"]
B117["B118: instructions - lines 299 to 301"]
B118["B119: instructions - lines 302 to 302"]
B119["B120: instructions - lines 303 to 303"]
B110 -->|call| B120
B110 -->|after return| B111
B111 -->|call| B126
B111 -->|after return| B112
B112 -->|call| B120
B112 -->|after return| B113
B113 -->|call| B126
B113 -->|after return| B114
B115 -->|call| B120
B115 -->|after return| B116
B116 -->|call| B126
B116 -->|after return| B117
B117 -->|call| B120
B117 -->|after return| B118
B118 -->|call| B126
B118 -->|after return| B119
B120["Continue at B121 in section 13"]
B126["Continue at B127 in section 13"]
```

### B111

```asm
PUSH ACC
PUSH B
SETB P1.3
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
POP B
POP ACC
RET
```

### B116

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B117

```asm
ACALL LDELAY
```

### B118

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B119

```asm
ACALL LDELAY
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: COMMON - lines 306 to 311"]
B121["B122: INLCD - lines 314 to 321"]
B122["B123: instructions - lines 322 to 330"]
B123["B124: instructions - lines 331 to 343"]
B124["B125: instructions - lines 344 to 354"]
B125["B126: instructions - lines 355 to 355"]
B126["B127: LDELAY - lines 358 to 359"]
B127["B128: instructions - lines 360 to 360"]
B128["B129: CLEAR - lines 363 to 364"]
B129["B130: instructions - lines 365 to 365"]
B121 -->|call| B126
B121 -->|after return| B122
B122 -->|call| B126
B122 -->|after return| B123
B123 -->|call| B126
B123 -->|after return| B124
B124 -->|call| B126
B124 -->|after return| B125
B126 -->|condition true| B126
B126 -->|condition false| B127
B128 -->|call| B115
B128 -->|after return| B129
B129 -->|next| B130
B115["Continue at B116 in section 12"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B122

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

### B123

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

### B124

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

### B125

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

### B126

Return to the instruction following the active call.

```asm
RET
```

### B127

```asm
MOV R0, #50
DJNZ R0, $
```

### B128

Return to the instruction following the active call.

```asm
RET
```

### B129

```asm
MOV A,#01H
ACALL CMD
```

### B130

```asm
MOV R7,#14
```

## Section 14

```mermaid
flowchart TD
B130["B131: WAIT - lines 366 to 366"]
B131["B132: instructions - lines 367 to 367"]
B132["B133: instructions - lines 368 to 368"]
B133["B134: WSTR - lines 371 to 371"]
B134["B135: CONT1 - lines 373 to 375"]
B135["B136: PRINT - lines 377 to 377"]
B136["B137: instructions - lines 378 to 379"]
B137["B138: EXIT1 - lines 380 to 381"]
B138["B139: KEYPAD - lines 386 to 386"]
B139["B140: K1 - lines 387 to 390"]
B130 -->|call| B126
B130 -->|after return| B131
B131 -->|condition true| B130
B131 -->|condition false| B132
B133 -->|next| B134
B134 -->|condition true| B137
B134 -->|condition false| B135
B135 -->|call| B110
B135 -->|after return| B136
B136 -->|jump| B134
B138 -->|next| B139
B139 -->|condition true| B139
B139 -->|condition false| B140
B126["Continue at B127 in section 13"]
B110["Continue at B111 in section 12"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL LDELAY
```

### B132

```asm
DJNZ R7,WAIT
```

### B133

Return to the instruction following the active call.

```asm
ret
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
MOV P0,#01110000B
```

### B140

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

## Section 15

```mermaid
flowchart TD
B140["B141: K2 - lines 392 to 394"]
B141["B142: instructions - lines 395 to 395"]
B142["B143: OVER1 - lines 397 to 400"]
B143["B144: instructions - lines 401 to 404"]
B144["B145: instructions - lines 405 to 408"]
B145["B146: instructions - lines 409 to 412"]
B146["B147: instructions - lines 413 to 413"]
B147["B148: ROW_0 - lines 414 to 415"]
B148["B149: ROW_1 - lines 416 to 417"]
B149["B150: ROW_2 - lines 418 to 419"]
B140 -->|condition true| B142
B140 -->|condition false| B141
B141 -->|jump| B140
B142 -->|condition true| B147
B142 -->|condition false| B143
B143 -->|condition true| B148
B143 -->|condition false| B144
B144 -->|condition true| B149
B144 -->|condition false| B145
B145 -->|condition true| B150
B145 -->|condition false| B146
B146 -->|jump| B140
B147 -->|jump| B151
B148 -->|jump| B151
B149 -->|jump| B151
B150["Continue at B151 in section 16"]
B151["Continue at B152 in section 16"]
```

### B141

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B142

```asm
SJMP K2
```

### B143

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B144

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B145

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B146

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B147

```asm
LJMP K2
```

### B148

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B149

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B150

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

## Section 16

```mermaid
flowchart TD
B150["B151: ROW_3 - lines 420 to 420"]
B151["B152: FIND - lines 422 to 422"]
B152["B153: FIND1 - lines 424 to 425"]
B153["B154: instructions - lines 426 to 427"]
B154["B155: MATCH - lines 428 to 430"]
B150 -->|next| B151
B151 -->|next| B152
B152 -->|condition true| B154
B152 -->|condition false| B153
B153 -->|jump| B152
```

### B151

```asm
MOV DPTR,#KCODE3
```

### B152

```asm
RLC A
```

### B153

```asm
RLC A
JNC MATCH
```

### B154

```asm
INC DPTR
SJMP FIND1
```

### B155

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
