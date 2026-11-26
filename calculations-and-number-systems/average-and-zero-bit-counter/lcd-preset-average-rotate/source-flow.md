# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 5"]
B2["B3: FF - lines 7 to 7"]
B3["B4: instructions - lines 8 to 8"]
B4["B5: instructions - lines 9 to 9"]
B5["B6: instructions - lines 10 to 10"]
B6["B7: START - lines 13 to 13"]
B7["B8: instructions - lines 14 to 14"]
B8["B9: instructions - lines 15 to 16"]
B9["B10: instructions - lines 17 to 19"]
B0 -->|call| B107
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B89
B2 -->|after return| B3
B3 -->|call| B93
B3 -->|after return| B4
B4 -->|condition true| B2
B4 -->|condition false| B5
B5 -->|call| B107
B5 -->|after return| B6
B6 -->|call| B114
B6 -->|after return| B7
B7 -->|call| B93
B7 -->|after return| B8
B8 -->|call| B101
B8 -->|after return| B9
B9 -->|call| B119
B9 -->|after return| B10
B107["Continue at B108 in section 11"]
B89["Continue at B90 in section 9"]
B93["Continue at B94 in section 10"]
B114["Continue at B115 in section 12"]
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
CLR A
MOV P1,#0FFH
MOV R7,#5
```

### B3

```asm
ACALL FLASH
```

### B4

```asm
ACALL DELAY
```

### B5

```asm
DJNZ R7,FF
```

### B6

```asm
ACALL INLCD
```

### B7

```asm
ACALL CLEAR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
MOV A,#80H
ACALL CMD
```

### B10

```asm
CLR A
MOV DPTR,#STR1
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 20 to 21"]
B11["B12: instructions - lines 22 to 23"]
B12["B13: instructions - lines 24 to 24"]
B13["B14: instructions - lines 26 to 26"]
B14["B15: instructions - lines 27 to 27"]
B15["B16: instructions - lines 28 to 29"]
B16["B17: instructions - lines 30 to 32"]
B17["B18: instructions - lines 33 to 34"]
B18["B19: instructions - lines 35 to 36"]
B19["B20: instructions - lines 37 to 37"]
B10 -->|call| B101
B10 -->|after return| B11
B11 -->|call| B119
B11 -->|after return| B12
B12 -->|call| B93
B12 -->|after return| B13
B13 -->|call| B114
B13 -->|after return| B14
B14 -->|call| B93
B14 -->|after return| B15
B15 -->|call| B101
B15 -->|after return| B16
B16 -->|call| B119
B16 -->|after return| B17
B17 -->|call| B101
B17 -->|after return| B18
B18 -->|call| B119
B18 -->|after return| B19
B19 -->|call| B93
B19 -->|after return| B20
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B93["Continue at B94 in section 10"]
B114["Continue at B115 in section 12"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
ACALL CLEAR
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
MOV A,#80H
ACALL CMD
```

### B17

```asm
CLR A
MOV DPTR,#STR3
ACALL WSTR
```

### B18

```asm
MOV A,#0C0H
ACALL CMD
```

### B19

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: X0 - lines 42 to 44"]
B21["B22: X1 - lines 48 to 48"]
B22["B23: instructions - lines 49 to 49"]
B23["B24: instructions - lines 50 to 51"]
B24["B25: instructions - lines 52 to 54"]
B25["B26: instructions - lines 55 to 56"]
B26["B27: instructions - lines 57 to 59"]
B27["B28: instructions - lines 60 to 60"]
B28["B29: instructions - lines 62 to 73"]
B29["B30: instructions - lines 75 to 75"]
B20 -->|condition true| B30
B20 -->|condition false| B21
B21 -->|call| B114
B21 -->|after return| B22
B22 -->|call| B93
B22 -->|after return| B23
B23 -->|call| B101
B23 -->|after return| B24
B24 -->|call| B119
B24 -->|after return| B25
B25 -->|call| B101
B25 -->|after return| B26
B26 -->|call| B96
B26 -->|after return| B27
B27 -->|call| B93
B27 -->|after return| B28
B28 -->|call| B47
B28 -->|after return| B29
B29 -->|jump| B29
B30["Continue at B31 in section 4"]
B114["Continue at B115 in section 12"]
B93["Continue at B94 in section 10"]
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B96["Continue at B97 in section 10"]
B47["Continue at B48 in section 5"]
```

### B21

```asm
MOV R3,#2
CJNE R3,#1,X2
```

### B22

```asm
ACALL CLEAR
```

### B23

```asm
ACALL DELAY
```

### B24

```asm
MOV A,#80H
ACALL CMD
```

### B25

```asm
CLR A
MOV DPTR,#STR5
ACALL WSTR
```

### B26

```asm
MOV A,#0C0H
ACALL CMD
```

### B27

```asm
MOV A,R3
ADD A,#30H
ACALL WCHR
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
MOV R0,#39
MOV A,R0
SUBB A,#1
MOV R1,A
ADD A,R0
MOV B,#2
DIV AB
MOV R6,A
MOV 21H,R0
MOV 22H,R1
ACALL PRINT1
```

### B30

```asm
SJMP $
```

## Section 4

```mermaid
flowchart TD
B30["B31: X2 - lines 78 to 78"]
B31["B32: instructions - lines 79 to 79"]
B32["B33: instructions - lines 80 to 80"]
B33["B34: instructions - lines 81 to 82"]
B34["B35: instructions - lines 83 to 85"]
B35["B36: instructions - lines 86 to 87"]
B36["B37: instructions - lines 88 to 90"]
B37["B38: instructions - lines 91 to 91"]
B38["B39: instructions - lines 93 to 97"]
B39["B40: X - lines 100 to 101"]
B30 -->|condition true| B45
B30 -->|condition false| B31
B31 -->|call| B114
B31 -->|after return| B32
B32 -->|call| B93
B32 -->|after return| B33
B33 -->|call| B101
B33 -->|after return| B34
B34 -->|call| B119
B34 -->|after return| B35
B35 -->|call| B101
B35 -->|after return| B36
B36 -->|call| B96
B36 -->|after return| B37
B37 -->|call| B93
B37 -->|after return| B38
B38 -->|next| B39
B39 -->|condition true| B42
B39 -->|condition false| B40
B45["Continue at B46 in section 5"]
B114["Continue at B115 in section 12"]
B93["Continue at B94 in section 10"]
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B96["Continue at B97 in section 10"]
B42["Continue at B43 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE R3,#2,X3
```

### B32

```asm
ACALL CLEAR
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
MOV A,#80H
ACALL CMD
```

### B35

```asm
CLR A
MOV DPTR,#STR5
ACALL WSTR
```

### B36

```asm
MOV A,#0C0H
ACALL CMD
```

### B37

```asm
MOV A,R3
ADD A,#30H
ACALL WCHR
```

### B38

```asm
ACALL DELAY
```

### B39

```asm
MOV R5,#40H
MOV R4,#8
MOV 20H,#0
MOV A,R5
MOV 40H,A
```

### B40

```asm
RRC A
JNC ZEROS
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 102 to 102"]
B41["B42: instructions - lines 103 to 103"]
B42["B43: ZEROS - lines 106 to 107"]
B43["B44: instructions - lines 108 to 108"]
B44["B45: instructions - lines 109 to 109"]
B45["B46: X3 - lines 112 to 112"]
B46["B47: instructions - lines 113 to 113"]
B47["B48: PRINT1 - lines 119 to 119"]
B48["B49: instructions - lines 120 to 120"]
B49["B50: instructions - lines 121 to 122"]
B40 -->|condition true| B39
B40 -->|condition false| B41
B41 -->|jump| B41
B42 -->|condition true| B39
B42 -->|condition false| B43
B43 -->|call| B69
B43 -->|after return| B44
B44 -->|jump| B44
B45 -->|condition true| B20
B45 -->|condition false| B46
B46 -->|jump| B46
B47 -->|call| B114
B47 -->|after return| B48
B48 -->|call| B93
B48 -->|after return| B49
B49 -->|call| B101
B49 -->|after return| B50
B39["Continue at B40 in section 4"]
B69["Continue at B70 in section 7"]
B20["Continue at B21 in section 3"]
B114["Continue at B115 in section 12"]
B93["Continue at B94 in section 10"]
B101["Continue at B102 in section 11"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
DJNZ R4,X
```

### B42

```asm
SJMP $
```

### B43

```asm
INC 20H
DJNZ R4,X
```

### B44

```asm
ACALL PRINT2
```

### B45

```asm
SJMP $
```

### B46

```asm
CJNE A,#3, X0
```

### B47

```asm
SJMP $
```

### B48

```asm
ACALL CLEAR
```

### B49

```asm
ACALL DELAY
```

### B50

```asm
MOV A,#80H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 123 to 125"]
B51["B52: instructions - lines 126 to 127"]
B52["B53: instructions - lines 128 to 132"]
B53["B54: instructions - lines 133 to 135"]
B54["B55: instructions - lines 136 to 136"]
B55["B56: instructions - lines 137 to 138"]
B56["B57: instructions - lines 139 to 143"]
B57["B58: instructions - lines 144 to 146"]
B58["B59: instructions - lines 147 to 147"]
B59["B60: instructions - lines 148 to 148"]
B50 -->|call| B119
B50 -->|after return| B51
B51 -->|call| B101
B51 -->|after return| B52
B52 -->|call| B96
B52 -->|after return| B53
B53 -->|call| B96
B53 -->|after return| B54
B54 -->|call| B93
B54 -->|after return| B55
B55 -->|call| B101
B55 -->|after return| B56
B56 -->|call| B96
B56 -->|after return| B57
B57 -->|call| B96
B57 -->|after return| B58
B58 -->|call| B93
B58 -->|after return| B59
B59 -->|call| B93
B59 -->|after return| B60
B119["Continue at B120 in section 12"]
B101["Continue at B102 in section 11"]
B96["Continue at B97 in section 10"]
B93["Continue at B94 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B52

```asm
MOV A,#0C0H
ACALL CMD
```

### B53

```asm
MOV A,21H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B54

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B55

```asm
ACALL DELAY
```

### B56

```asm
MOV A,#0C5H
ACALL CMD
```

### B57

```asm
MOV A,22H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B58

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B59

```asm
ACALL DELAY
```

### B60

```asm
ACALL DELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 150 to 150"]
B61["B62: instructions - lines 151 to 151"]
B62["B63: instructions - lines 152 to 153"]
B63["B64: instructions - lines 154 to 156"]
B64["B65: instructions - lines 157 to 158"]
B65["B66: instructions - lines 159 to 163"]
B66["B67: instructions - lines 164 to 166"]
B67["B68: instructions - lines 167 to 167"]
B68["B69: instructions - lines 168 to 168"]
B69["B70: PRINT2 - lines 171 to 171"]
B60 -->|call| B114
B60 -->|after return| B61
B61 -->|call| B93
B61 -->|after return| B62
B62 -->|call| B101
B62 -->|after return| B63
B63 -->|call| B119
B63 -->|after return| B64
B64 -->|call| B101
B64 -->|after return| B65
B65 -->|call| B96
B65 -->|after return| B66
B66 -->|call| B96
B66 -->|after return| B67
B67 -->|call| B93
B67 -->|after return| B68
B69 -->|call| B114
B69 -->|after return| B70
B114["Continue at B115 in section 12"]
B93["Continue at B94 in section 10"]
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B96["Continue at B97 in section 10"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL CLEAR
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
MOV A,#80H
ACALL CMD
```

### B64

```asm
CLR A
MOV DPTR,#STR7
ACALL WSTR
```

### B65

```asm
MOV A,#0C0H
ACALL CMD
```

### B66

```asm
MOV A,R6
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B67

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B68

```asm
ACALL DELAY
```

### B69

Return to the instruction following the active call.

```asm
RET
```

### B70

```asm
ACALL CLEAR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 172 to 172"]
B71["B72: instructions - lines 173 to 174"]
B72["B73: instructions - lines 175 to 177"]
B73["B74: instructions - lines 178 to 179"]
B74["B75: instructions - lines 180 to 184"]
B75["B76: instructions - lines 185 to 187"]
B76["B77: instructions - lines 188 to 188"]
B77["B78: instructions - lines 189 to 189"]
B78["B79: instructions - lines 190 to 190"]
B79["B80: instructions - lines 191 to 191"]
B70 -->|call| B93
B70 -->|after return| B71
B71 -->|call| B101
B71 -->|after return| B72
B72 -->|call| B119
B72 -->|after return| B73
B73 -->|call| B101
B73 -->|after return| B74
B74 -->|call| B96
B74 -->|after return| B75
B75 -->|call| B96
B75 -->|after return| B76
B76 -->|call| B93
B76 -->|after return| B77
B77 -->|call| B93
B77 -->|after return| B78
B78 -->|call| B93
B78 -->|after return| B79
B79 -->|call| B93
B79 -->|after return| B80
B93["Continue at B94 in section 10"]
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B96["Continue at B97 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
MOV A,#80H
ACALL CMD
```

### B73

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B74

```asm
MOV A,#0C0H
ACALL CMD
```

### B75

```asm
MOV A,40H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B76

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B77

```asm
ACALL DELAY
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

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 194 to 194"]
B81["B82: instructions - lines 195 to 195"]
B82["B83: instructions - lines 196 to 197"]
B83["B84: instructions - lines 198 to 200"]
B84["B85: instructions - lines 201 to 202"]
B85["B86: instructions - lines 203 to 205"]
B86["B87: instructions - lines 206 to 206"]
B87["B88: instructions - lines 207 to 207"]
B88["B89: instructions - lines 208 to 208"]
B89["B90: FLASH - lines 211 to 212"]
B80 -->|call| B114
B80 -->|after return| B81
B81 -->|call| B93
B81 -->|after return| B82
B82 -->|call| B101
B82 -->|after return| B83
B83 -->|call| B119
B83 -->|after return| B84
B84 -->|call| B101
B84 -->|after return| B85
B85 -->|call| B96
B85 -->|after return| B86
B86 -->|call| B93
B86 -->|after return| B87
B87 -->|call| B93
B87 -->|after return| B88
B89 -->|call| B93
B89 -->|after return| B90
B114["Continue at B115 in section 12"]
B93["Continue at B94 in section 10"]
B101["Continue at B102 in section 11"]
B119["Continue at B120 in section 12"]
B96["Continue at B97 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL CLEAR
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
MOV A,#80H
ACALL CMD
```

### B84

```asm
CLR A
MOV DPTR,#STR8
ACALL WSTR
```

### B85

```asm
MOV A,#0C0H
ACALL CMD
```

### B86

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
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

Return to the instruction following the active call.

```asm
RET
```

### B90

```asm
CLR P1.2
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 213 to 214"]
B91["B92: instructions - lines 215 to 215"]
B92["B93: CONV - lines 218 to 238"]
B93["B94: DELAY - lines 241 to 241"]
B94["B95: HH - lines 242 to 242"]
B95["B96: instructions - lines 243 to 243"]
B96["B97: WCHR - lines 247 to 251"]
B97["B98: instructions - lines 252 to 252"]
B98["B99: instructions - lines 253 to 255"]
B99["B100: instructions - lines 256 to 256"]
B90 -->|call| B93
B90 -->|after return| B91
B93 -->|next| B94
B94 -->|condition true| B94
B94 -->|condition false| B95
B96 -->|call| B106
B96 -->|after return| B97
B97 -->|call| B112
B97 -->|after return| B98
B98 -->|call| B106
B98 -->|after return| B99
B99 -->|call| B112
B99 -->|after return| B100
B106["Continue at B107 in section 11"]
B112["Continue at B113 in section 12"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
SETB P1.2
ACALL DELAY
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

Return to the instruction following the active call.

```asm
MOV B,#10
MOV A,R4
DIV AB
MOV 50H,A
MOV A,B
MOV B,#10
DIV AB
MOV 51H,A
MOV 52H,B
MOV A,50H
ADD A,#30H
MOV 60H,A
MOV A,51H
ADD A,#30H
MOV 61H,A
MOV A,52H
ADD A,#30H
MOV 62H,A
RET
```

### B94

```asm
MOV R0, #250
```

### B95

```asm
DJNZ R0, HH
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B98

```asm
ACALL LDELAY
```

### B99

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B100

```asm
ACALL LDELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 257 to 259"]
B101["B102: CMD - lines 262 to 264"]
B102["B103: instructions - lines 265 to 265"]
B103["B104: instructions - lines 266 to 268"]
B104["B105: instructions - lines 269 to 269"]
B105["B106: instructions - lines 270 to 270"]
B106["B107: COMMON - lines 273 to 278"]
B107["B108: INLCD - lines 281 to 288"]
B108["B109: instructions - lines 289 to 297"]
B109["B110: instructions - lines 298 to 310"]
B101 -->|call| B106
B101 -->|after return| B102
B102 -->|call| B112
B102 -->|after return| B103
B103 -->|call| B106
B103 -->|after return| B104
B104 -->|call| B112
B104 -->|after return| B105
B107 -->|call| B112
B107 -->|after return| B108
B108 -->|call| B112
B108 -->|after return| B109
B109 -->|call| B112
B109 -->|after return| B110
B112["Continue at B113 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B102

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B103

```asm
ACALL LDELAY
```

### B104

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B105

```asm
ACALL LDELAY
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B108

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

### B109

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

### B110

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

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 311 to 321"]
B111["B112: instructions - lines 322 to 322"]
B112["B113: LDELAY - lines 325 to 326"]
B113["B114: instructions - lines 327 to 327"]
B114["B115: CLEAR - lines 330 to 331"]
B115["B116: instructions - lines 332 to 332"]
B116["B117: WAIT - lines 333 to 333"]
B117["B118: instructions - lines 334 to 334"]
B118["B119: instructions - lines 335 to 335"]
B119["B120: WSTR - lines 338 to 338"]
B110 -->|call| B112
B110 -->|after return| B111
B112 -->|condition true| B112
B112 -->|condition false| B113
B114 -->|call| B101
B114 -->|after return| B115
B115 -->|next| B116
B116 -->|call| B112
B116 -->|after return| B117
B117 -->|condition true| B116
B117 -->|condition false| B118
B119 -->|next| B120
B101["Continue at B102 in section 11"]
B120["Continue at B121 in section 13"]
```

### B111

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

### B112

Return to the instruction following the active call.

```asm
RET
```

### B113

```asm
MOV R0, #50
DJNZ R0, $
```

### B114

Return to the instruction following the active call.

```asm
RET
```

### B115

```asm
MOV A,#01H
ACALL CMD
```

### B116

```asm
MOV R7,#14
```

### B117

```asm
ACALL LDELAY
```

### B118

```asm
DJNZ R7,WAIT
```

### B119

Return to the instruction following the active call.

```asm
ret
```

### B120

```asm
PUSH    ACC
```

## Section 13

```mermaid
flowchart TD
B120["B121: CONT1 - lines 340 to 342"]
B121["B122: PRINT - lines 344 to 344"]
B122["B123: instructions - lines 345 to 346"]
B123["B124: EXIT1 - lines 347 to 348"]
B120 -->|condition true| B123
B120 -->|condition false| B121
B121 -->|call| B96
B121 -->|after return| B122
B122 -->|jump| B120
B96["Continue at B97 in section 10"]
```

### B121

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B122

```asm
ACALL    WCHR
```

### B123

```asm
INC DPTR
AJMP    CONT1
```

### B124

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
