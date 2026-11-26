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
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 4 to 10"]
B2["B3: instructions - lines 13 to 13"]
B3["B4: instructions - lines 14 to 14"]
B4["B5: instructions - lines 17 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: MAINMENUE - lines 23 to 24"]
B7["B8: instructions - lines 26 to 29"]
B8["B9: instructions - lines 30 to 30"]
B9["B10: instructions - lines 33 to 34"]
B0 -->|call| B117
B0 -->|after return| B1
B1 -->|call| B32
B1 -->|after return| B2
B2 -->|call| B124
B2 -->|after return| B3
B3 -->|call| B44
B3 -->|after return| B4
B4 -->|call| B124
B4 -->|after return| B5
B5 -->|call| B52
B5 -->|after return| B6
B6 -->|call| B32
B6 -->|after return| B7
B7 -->|call| B124
B7 -->|after return| B8
B8 -->|call| B60
B8 -->|after return| B9
B9 -->|condition true| B14
B9 -->|condition false| B10
B117["Continue at B118 in section 12"]
B32["Continue at B33 in section 4"]
B124["Continue at B125 in section 13"]
B44["Continue at B45 in section 5"]
B52["Continue at B53 in section 6"]
B60["Continue at B61 in section 7"]
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
MOV R3,#20
MOV R4,#19
MOV R5,#0
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
B10["B11: instructions - lines 36 to 37"]
B11["B12: instructions - lines 38 to 38"]
B12["B13: instructions - lines 39 to 39"]
B13["B14: instructions - lines 40 to 41"]
B14["B15: CASE2 - lines 44 to 44"]
B15["B16: CASE3 - lines 46 to 46"]
B16["B17: instructions - lines 48 to 49"]
B17["B18: instructions - lines 50 to 50"]
B18["B19: instructions - lines 51 to 51"]
B19["B20: instructions - lines 52 to 53"]
B10 -->|call| B32
B10 -->|after return| B11
B11 -->|call| B124
B11 -->|after return| B12
B12 -->|call| B68
B12 -->|after return| B13
B13 -->|jump| B29
B14 -->|condition true| B15
B14 -->|condition false| B15
B15 -->|condition true| B20
B15 -->|condition false| B16
B16 -->|call| B32
B16 -->|after return| B17
B17 -->|call| B124
B17 -->|after return| B18
B18 -->|call| B71
B18 -->|after return| B19
B19 -->|jump| B29
B32["Continue at B33 in section 4"]
B124["Continue at B125 in section 13"]
B68["Continue at B69 in section 7"]
B29["Continue at B30 in section 3"]
B20["Continue at B21 in section 3"]
B71["Continue at B72 in section 8"]
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
B20["B21: CASE4 - lines 55 to 55"]
B21["B22: CASE5 - lines 57 to 57"]
B22["B23: instructions - lines 59 to 60"]
B23["B24: instructions - lines 62 to 62"]
B24["B25: instructions - lines 63 to 63"]
B25["B26: instructions - lines 65 to 66"]
B26["B27: CASE6 - lines 69 to 70"]
B27["B28: instructions - lines 71 to 71"]
B28["B29: instructions - lines 72 to 73"]
B29["B30: CALC - lines 77 to 87"]
B20 -->|condition true| B21
B20 -->|condition false| B21
B21 -->|condition true| B26
B21 -->|condition false| B22
B22 -->|call| B32
B22 -->|after return| B23
B23 -->|call| B124
B23 -->|after return| B24
B24 -->|call| B80
B24 -->|after return| B25
B25 -->|jump| B29
B26 -->|call| B124
B26 -->|after return| B27
B27 -->|call| B99
B27 -->|after return| B28
B28 -->|jump| B29
B29 -->|call| B124
B29 -->|after return| B30
B32["Continue at B33 in section 4"]
B124["Continue at B125 in section 13"]
B80["Continue at B81 in section 9"]
B99["Continue at B100 in section 10"]
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
B30["B31: instructions - lines 88 to 88"]
B31["B32: LOOP - lines 90 to 90"]
B32["B33: FLASH - lines 94 to 95"]
B33["B34: instructions - lines 96 to 97"]
B34["B35: instructions - lines 98 to 99"]
B35["B36: instructions - lines 100 to 101"]
B36["B37: instructions - lines 102 to 103"]
B37["B38: instructions - lines 104 to 105"]
B38["B39: instructions - lines 106 to 106"]
B39["B40: DELAY - lines 109 to 109"]
B30 -->|call| B91
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
B91["Continue at B92 in section 10"]
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
B40["B41: L2 - lines 110 to 110"]
B41["B42: L - lines 111 to 111"]
B42["B43: instructions - lines 112 to 112"]
B43["B44: instructions - lines 113 to 113"]
B44["B45: DISPLAY1 - lines 116 to 117"]
B45["B46: instructions - lines 118 to 119"]
B46["B47: instructions - lines 120 to 121"]
B47["B48: instructions - lines 122 to 126"]
B48["B49: instructions - lines 127 to 129"]
B49["B50: instructions - lines 130 to 130"]
B40 -->|next| B41
B41 -->|condition true| B41
B41 -->|condition false| B42
B42 -->|condition true| B40
B42 -->|condition false| B43
B44 -->|call| B111
B44 -->|after return| B45
B45 -->|call| B129
B45 -->|after return| B46
B46 -->|call| B111
B46 -->|after return| B47
B47 -->|call| B106
B47 -->|after return| B48
B48 -->|call| B106
B48 -->|after return| B49
B49 -->|call| B39
B49 -->|after return| B50
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B106["Continue at B107 in section 11"]
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
mov a,R3
mov b,#10
div ab
add a,#30h
acall wchr
```

### B49

```asm
mov a,b
add a,#30h
acall wchr
```

### B50

```asm
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 131"]
B51["B52: instructions - lines 132 to 132"]
B52["B53: DISPLAY2 - lines 135 to 136"]
B53["B54: instructions - lines 137 to 138"]
B54["B55: instructions - lines 139 to 140"]
B55["B56: instructions - lines 141 to 145"]
B56["B57: instructions - lines 146 to 148"]
B57["B58: instructions - lines 149 to 149"]
B58["B59: instructions - lines 150 to 150"]
B59["B60: instructions - lines 151 to 151"]
B50 -->|call| B39
B50 -->|after return| B51
B52 -->|call| B111
B52 -->|after return| B53
B53 -->|call| B129
B53 -->|after return| B54
B54 -->|call| B111
B54 -->|after return| B55
B55 -->|call| B106
B55 -->|after return| B56
B56 -->|call| B106
B56 -->|after return| B57
B57 -->|call| B39
B57 -->|after return| B58
B58 -->|call| B39
B58 -->|after return| B59
B39["Continue at B40 in section 4"]
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B106["Continue at B107 in section 11"]
```

### B51

```asm
ACALL DELAY
```

### B52

Return to the instruction following the active call.

```asm
ret
```

### B53

```asm
mov a, #80H
acall cmd
```

### B54

```asm
mov dptr, #data
acall wstr
```

### B55

```asm
mov a,#0c0h
acall cmd
```

### B56

```asm
mov a,R4
mov b,#10
div ab
add a,#30h
acall wchr
```

### B57

```asm
mov a,b
add a,#30h
acall wchr
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
ACALL DELAY
```

### B60

Return to the instruction following the active call.

```asm
ret
```

## Section 7

```mermaid
flowchart TD
B60["B61: DISPLAY3 - lines 154 to 155"]
B61["B62: instructions - lines 156 to 157"]
B62["B63: instructions - lines 158 to 159"]
B63["B64: instructions - lines 160 to 164"]
B64["B65: instructions - lines 165 to 167"]
B65["B66: instructions - lines 168 to 168"]
B66["B67: instructions - lines 169 to 169"]
B67["B68: instructions - lines 170 to 170"]
B68["B69: DISPLAY4 - lines 174 to 175"]
B69["B70: instructions - lines 176 to 177"]
B60 -->|call| B111
B60 -->|after return| B61
B61 -->|call| B129
B61 -->|after return| B62
B62 -->|call| B111
B62 -->|after return| B63
B63 -->|call| B106
B63 -->|after return| B64
B64 -->|call| B106
B64 -->|after return| B65
B65 -->|call| B39
B65 -->|after return| B66
B66 -->|call| B39
B66 -->|after return| B67
B68 -->|call| B111
B68 -->|after return| B69
B69 -->|call| B129
B69 -->|after return| B70
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B106["Continue at B107 in section 11"]
B39["Continue at B40 in section 4"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov a, #80H
acall cmd
```

### B62

```asm
mov dptr, #days
acall wstr
```

### B63

```asm
mov a,#0c0h
acall cmd
```

### B64

```asm
mov a,R4
mov b,#10
div ab
add a,#30h
acall wchr
```

### B65

```asm
mov a,b
add a,#30h
acall wchr
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
ACALL DELAY
```

### B68

Return to the instruction following the active call.

```asm
ret
```

### B69

```asm
mov a, #80H
acall cmd
```

### B70

```asm
mov dptr,#nolate
acall wstr
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 178 to 178"]
B71["B72: DISPLAY5 - lines 182 to 183"]
B72["B73: instructions - lines 184 to 185"]
B73["B74: instructions - lines 187 to 188"]
B74["B75: instructions - lines 189 to 190"]
B75["B76: instructions - lines 191 to 192"]
B76["B77: instructions - lines 193 to 194"]
B77["B78: instructions - lines 195 to 195"]
B78["B79: instructions - lines 196 to 196"]
B79["B80: instructions - lines 197 to 197"]
B71 -->|call| B111
B71 -->|after return| B72
B72 -->|call| B129
B72 -->|after return| B73
B73 -->|call| B111
B73 -->|after return| B74
B74 -->|call| B106
B74 -->|after return| B75
B75 -->|call| B106
B75 -->|after return| B76
B76 -->|call| B106
B76 -->|after return| B77
B77 -->|call| B39
B77 -->|after return| B78
B78 -->|call| B39
B78 -->|after return| B79
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B106["Continue at B107 in section 11"]
B39["Continue at B40 in section 4"]
```

### B71

Return to the instruction following the active call.

```asm
ret
```

### B72

```asm
mov a, #80H
acall cmd
```

### B73

```asm
mov dptr, #dis
acall wstr
```

### B74

```asm
mov a,#0c0h
acall cmd
```

### B75

```asm
mov a,#'1'
acall wchr
```

### B76

```asm
mov a,#'0'
acall wchr
```

### B77

```asm
mov a,#'%'
acall wchr
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

Return to the instruction following the active call.

```asm
ret
```

## Section 9

```mermaid
flowchart TD
B80["B81: DISPLAY6 - lines 201 to 202"]
B81["B82: instructions - lines 203 to 204"]
B82["B83: instructions - lines 206 to 207"]
B83["B84: instructions - lines 208 to 209"]
B84["B85: instructions - lines 210 to 211"]
B85["B86: instructions - lines 212 to 213"]
B86["B87: instructions - lines 214 to 214"]
B87["B88: instructions - lines 215 to 215"]
B88["B89: instructions - lines 216 to 216"]
B89["B90: instructions - lines 217 to 217"]
B80 -->|call| B111
B80 -->|after return| B81
B81 -->|call| B129
B81 -->|after return| B82
B82 -->|call| B111
B82 -->|after return| B83
B83 -->|call| B106
B83 -->|after return| B84
B84 -->|call| B106
B84 -->|after return| B85
B85 -->|call| B106
B85 -->|after return| B86
B86 -->|call| B39
B86 -->|after return| B87
B87 -->|call| B39
B87 -->|after return| B88
B88 -->|call| B39
B88 -->|after return| B89
B89 -->|call| B39
B89 -->|after return| B90
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B106["Continue at B107 in section 11"]
B39["Continue at B40 in section 4"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov a, #80H
acall cmd
```

### B82

```asm
mov dptr, #dis
acall wstr
```

### B83

```asm
mov a,#0c0h
acall cmd
```

### B84

```asm
mov a,#'2'
acall wchr
```

### B85

```asm
mov a,#'0'
acall wchr
```

### B86

```asm
mov a,#'%'
acall wchr
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
ACALL DELAY
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 218 to 218"]
B91["B92: DISPLAY7 - lines 222 to 223"]
B92["B93: instructions - lines 224 to 225"]
B93["B94: instructions - lines 227 to 228"]
B94["B95: instructions - lines 229 to 233"]
B95["B96: instructions - lines 234 to 236"]
B96["B97: instructions - lines 237 to 237"]
B97["B98: instructions - lines 238 to 238"]
B98["B99: instructions - lines 239 to 239"]
B99["B100: DISPLAY8 - lines 242 to 243"]
B91 -->|call| B111
B91 -->|after return| B92
B92 -->|call| B129
B92 -->|after return| B93
B93 -->|call| B111
B93 -->|after return| B94
B94 -->|call| B106
B94 -->|after return| B95
B95 -->|call| B106
B95 -->|after return| B96
B96 -->|call| B39
B96 -->|after return| B97
B97 -->|call| B39
B97 -->|after return| B98
B99 -->|call| B111
B99 -->|after return| B100
B111["Continue at B112 in section 12"]
B129["Continue at B130 in section 13"]
B106["Continue at B107 in section 11"]
B39["Continue at B40 in section 4"]
B100["Continue at B101 in section 11"]
```

### B91

Return to the instruction following the active call.

```asm
ret
```

### B92

```asm
mov a, #80H
acall cmd
```

### B93

```asm
mov dptr, #pay
acall wstr
```

### B94

```asm
mov a,#0c0h
acall cmd
```

### B95

```asm
mov a,R6
mov b,#10
div ab
add a,#30h
acall wchr
```

### B96

```asm
mov a,b
add a,#30h
acall wchr
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

Return to the instruction following the active call.

```asm
ret
```

### B100

```asm
mov a, #80H
acall cmd
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 244 to 245"]
B101["B102: instructions - lines 246 to 246"]
B102["B103: instructions - lines 247 to 247"]
B103["B104: instructions - lines 248 to 248"]
B104["B105: instructions - lines 249 to 249"]
B105["B106: instructions - lines 250 to 250"]
B106["B107: WCHR - lines 254 to 258"]
B107["B108: instructions - lines 259 to 259"]
B108["B109: instructions - lines 260 to 262"]
B109["B110: instructions - lines 263 to 263"]
B100 -->|call| B129
B100 -->|after return| B101
B101 -->|call| B39
B101 -->|after return| B102
B102 -->|call| B39
B102 -->|after return| B103
B103 -->|call| B39
B103 -->|after return| B104
B104 -->|call| B39
B104 -->|after return| B105
B106 -->|call| B116
B106 -->|after return| B107
B107 -->|call| B122
B107 -->|after return| B108
B108 -->|call| B116
B108 -->|after return| B109
B109 -->|call| B122
B109 -->|after return| B110
B129["Continue at B130 in section 13"]
B39["Continue at B40 in section 4"]
B116["Continue at B117 in section 12"]
B122["Continue at B123 in section 13"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov dptr,#free
acall wstr
```

### B102

```asm
ACALL DELAY
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

Return to the instruction following the active call.

```asm
ret
```

### B107

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B108

```asm
ACALL LDELAY
```

### B109

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B110

```asm
ACALL LDELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 264 to 266"]
B111["B112: CMD - lines 269 to 271"]
B112["B113: instructions - lines 272 to 272"]
B113["B114: instructions - lines 273 to 275"]
B114["B115: instructions - lines 276 to 276"]
B115["B116: instructions - lines 277 to 277"]
B116["B117: COMMON - lines 280 to 285"]
B117["B118: INLCD - lines 288 to 295"]
B118["B119: instructions - lines 296 to 304"]
B119["B120: instructions - lines 305 to 317"]
B111 -->|call| B116
B111 -->|after return| B112
B112 -->|call| B122
B112 -->|after return| B113
B113 -->|call| B116
B113 -->|after return| B114
B114 -->|call| B122
B114 -->|after return| B115
B117 -->|call| B122
B117 -->|after return| B118
B118 -->|call| B122
B118 -->|after return| B119
B119 -->|call| B122
B119 -->|after return| B120
B122["Continue at B123 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B112

```asm
CLR P1.3
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
RET
```

### B117

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
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
B120["B121: instructions - lines 318 to 328"]
B121["B122: instructions - lines 329 to 329"]
B122["B123: LDELAY - lines 332 to 333"]
B123["B124: instructions - lines 334 to 334"]
B124["B125: CLEAR - lines 337 to 338"]
B125["B126: instructions - lines 339 to 339"]
B126["B127: WAIT - lines 340 to 340"]
B127["B128: instructions - lines 341 to 341"]
B128["B129: instructions - lines 342 to 342"]
B129["B130: WSTR - lines 345 to 345"]
B120 -->|call| B122
B120 -->|after return| B121
B122 -->|condition true| B122
B122 -->|condition false| B123
B124 -->|call| B111
B124 -->|after return| B125
B125 -->|next| B126
B126 -->|call| B122
B126 -->|after return| B127
B127 -->|condition true| B126
B127 -->|condition false| B128
B129 -->|next| B130
B111["Continue at B112 in section 12"]
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
MOV R0, #50
DJNZ R0, $
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

```asm
MOV A,#01H
ACALL CMD
```

### B126

```asm
MOV R7,#14
```

### B127

```asm
ACALL LDELAY
```

### B128

```asm
DJNZ R7,WAIT
```

### B129

Return to the instruction following the active call.

```asm
ret
```

### B130

```asm
PUSH    ACC
```

## Section 14

```mermaid
flowchart TD
B130["B131: CONT1 - lines 347 to 349"]
B131["B132: PRINT - lines 351 to 351"]
B132["B133: instructions - lines 352 to 353"]
B133["B134: EXIT1 - lines 354 to 355"]
B130 -->|condition true| B133
B130 -->|condition false| B131
B131 -->|call| B106
B131 -->|after return| B132
B132 -->|jump| B130
B106["Continue at B107 in section 11"]
```

### B131

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B132

```asm
ACALL    WCHR
```

### B133

```asm
INC DPTR
AJMP    CONT1
```

### B134

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
