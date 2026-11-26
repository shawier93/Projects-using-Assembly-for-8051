# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 11 to 11"]
B1["B2: instructions - lines 12 to 22"]
B2["B3: instructions - lines 24 to 24"]
B3["B4: instructions - lines 26 to 26"]
B4["B5: instructions - lines 27 to 27"]
B5["B6: instructions - lines 28 to 29"]
B6["B7: instructions - lines 30 to 31"]
B7["B8: instructions - lines 32 to 32"]
B8["B9: instructions - lines 34 to 35"]
B9["B10: instructions - lines 36 to 36"]
B0 -->|call| B131
B0 -->|after return| B1
B1 -->|call| B51
B1 -->|after return| B2
B2 -->|call| B131
B2 -->|after return| B3
B3 -->|call| B177
B3 -->|after return| B4
B4 -->|call| B170
B4 -->|after return| B5
B5 -->|call| B151
B5 -->|after return| B6
B6 -->|call| B151
B6 -->|after return| B7
B7 -->|call| B163
B7 -->|after return| B8
B8 -->|call| B158
B8 -->|after return| B9
B9 -->|call| B177
B9 -->|after return| B10
B131["Continue at B132 in section 14"]
B51["Continue at B52 in section 6"]
B177["Continue at B178 in section 18"]
B170["Continue at B171 in section 18"]
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#2
MOV 40H,#6
MOV 41H,#3
MOV 50H,#00
MOV 51H,#00
MOV 60H,#02
ACALL FLASHING
```

### B3

```asm
ACALL INLCD
```

### B4

```asm
ACALL DELAY
```

### B5

```asm
ACALL CLEAR
```

### B6

```asm
MOV A, #8H
ACALL CMD
```

### B7

```asm
MOV A, #0H
ACALL CMD
```

### B8

```asm
ACALL LDELAY
```

### B9

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 38 to 39"]
B11["B12: instructions - lines 40 to 41"]
B12["B13: instructions - lines 42 to 42"]
B13["B14: instructions - lines 43 to 44"]
B14["B15: instructions - lines 45 to 45"]
B15["B16: START - lines 49 to 49"]
B16["B17: instructions - lines 50 to 54"]
B17["B18: instructions - lines 55 to 56"]
B18["B19: instructions - lines 57 to 58"]
B19["B20: instructions - lines 59 to 62"]
B10 -->|call| B151
B10 -->|after return| B11
B11 -->|call| B151
B11 -->|after return| B12
B12 -->|call| B163
B12 -->|after return| B13
B13 -->|call| B158
B13 -->|after return| B14
B14 -->|call| B177
B14 -->|after return| B15
B15 -->|call| B56
B15 -->|after return| B16
B16 -->|call| B69
B16 -->|after return| B17
B17 -->|condition true| B21
B17 -->|condition false| B18
B18 -->|call| B80
B18 -->|after return| B19
B19 -->|call| B97
B19 -->|after return| B20
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B177["Continue at B178 in section 18"]
B56["Continue at B57 in section 6"]
B69["Continue at B70 in section 7"]
B21["Continue at B22 in section 3"]
B80["Continue at B81 in section 9"]
B97["Continue at B98 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A, #1100B
ACALL CMD
```

### B12

```asm
MOV A, #0H
ACALL CMD
```

### B13

```asm
ACALL LDELAY
```

### B14

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
ACALL MENU
```

### B17

```asm
SETB G
SETB Y
SETB R
ACALL SELECTION
```

### B18

```asm
MOV A,30H
CJNE A,#1,SUBTRACT
```

### B19

```asm
CLR G
ACALL NUMBERS
```

### B20

```asm
MOV A,40H
ADD A,41H
MOV 50H,A
ACALL RESULTS
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 63 to 63"]
B21["B22: SUBTRACT - lines 67 to 67"]
B22["B23: instructions - lines 68 to 69"]
B23["B24: instructions - lines 70 to 73"]
B24["B25: instructions - lines 74 to 74"]
B25["B26: MULTIPLICATION - lines 77 to 77"]
B26["B27: instructions - lines 78 to 79"]
B27["B28: instructions - lines 80 to 84"]
B28["B29: instructions - lines 86 to 86"]
B29["B30: DIVISION - lines 89 to 89"]
B20 -->|jump| B42
B21 -->|condition true| B25
B21 -->|condition false| B22
B22 -->|call| B80
B22 -->|after return| B23
B23 -->|call| B97
B23 -->|after return| B24
B24 -->|jump| B42
B25 -->|condition true| B29
B25 -->|condition false| B26
B26 -->|call| B80
B26 -->|after return| B27
B27 -->|call| B97
B27 -->|after return| B28
B28 -->|jump| B42
B29 -->|condition true| B34
B29 -->|condition false| B30
B42["Continue at B43 in section 5"]
B80["Continue at B81 in section 9"]
B97["Continue at B98 in section 10"]
B34["Continue at B35 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
SJMP NEXT
```

### B22

```asm
CJNE A,#2,MULTIPLICATION
```

### B23

```asm
CLR Y
ACALL NUMBERS
```

### B24

```asm
MOV A,40H
SUBB A,41H
MOV 50H,A
ACALL RESULTS
```

### B25

```asm
SJMP NEXT
```

### B26

```asm
CJNE A,#3,DIVISION
```

### B27

```asm
CLR R
ACALL NUMBERS
```

### B28

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV 50H,A
ACALL RESULTS
```

### B29

```asm
SJMP NEXT
```

### B30

```asm
CJNE A,#4,WRONG
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 90 to 92"]
B31["B32: instructions - lines 93 to 98"]
B32["B33: instructions - lines 99 to 99"]
B33["B34: instructions - lines 100 to 100"]
B34["B35: WRONG - lines 103 to 103"]
B35["B36: instructions - lines 104 to 104"]
B36["B37: instructions - lines 105 to 106"]
B37["B38: instructions - lines 107 to 108"]
B38["B39: instructions - lines 109 to 109"]
B39["B40: instructions - lines 111 to 112"]
B30 -->|call| B80
B30 -->|after return| B31
B31 -->|call| B97
B31 -->|after return| B32
B32 -->|call| B108
B32 -->|after return| B33
B33 -->|jump| B42
B34 -->|call| B170
B34 -->|after return| B35
B35 -->|call| B177
B35 -->|after return| B36
B36 -->|call| B151
B36 -->|after return| B37
B37 -->|call| B151
B37 -->|after return| B38
B38 -->|call| B163
B38 -->|after return| B39
B39 -->|call| B158
B39 -->|after return| B40
B80["Continue at B81 in section 9"]
B97["Continue at B98 in section 10"]
B108["Continue at B109 in section 11"]
B42["Continue at B43 in section 5"]
B170["Continue at B171 in section 18"]
B177["Continue at B178 in section 18"]
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CLR G
CLR Y
ACALL NUMBERS
```

### B32

```asm
MOV A,40H
MOV B,41H
DIV AB
MOV 50H,A
MOV 51H,B
ACALL RESULTS
```

### B33

```asm
ACALL REMINDER
```

### B34

```asm
SJMP NEXT
```

### B35

```asm
ACALL CLEAR
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
MOV A, #8H
ACALL CMD
```

### B38

```asm
MOV A, #0H
ACALL CMD
```

### B39

```asm
ACALL LDELAY
```

### B40

```asm
MOV DPTR, #STR10
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 113 to 113"]
B41["B42: instructions - lines 114 to 114"]
B42["B43: NEXT - lines 118 to 118"]
B43["B44: instructions - lines 119 to 120"]
B44["B45: instructions - lines 122 to 122"]
B45["B46: instructions - lines 123 to 124"]
B46["B47: instructions - lines 125 to 126"]
B47["B48: instructions - lines 127 to 127"]
B48["B49: instructions - lines 128 to 129"]
B49["B50: instructions - lines 130 to 130"]
B40 -->|call| B177
B40 -->|after return| B41
B41 -->|jump| B15
B42 -->|call| B116
B42 -->|after return| B43
B43 -->|condition true| B15
B43 -->|condition false| B44
B44 -->|call| B170
B44 -->|after return| B45
B45 -->|call| B151
B45 -->|after return| B46
B46 -->|call| B151
B46 -->|after return| B47
B47 -->|call| B163
B47 -->|after return| B48
B48 -->|call| B158
B48 -->|after return| B49
B49 -->|call| B177
B49 -->|after return| B50
B177["Continue at B178 in section 18"]
B15["Continue at B16 in section 2"]
B116["Continue at B117 in section 12"]
B170["Continue at B171 in section 18"]
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL DELAY
```

### B42

```asm
SJMP START
```

### B43

```asm
ACALL CONTINUE
```

### B44

```asm
MOV A,60H
CJNE A,#2,START
```

### B45

```asm
ACALL CLEAR
```

### B46

```asm
MOV A, #8H
ACALL CMD
```

### B47

```asm
MOV A, #0H
ACALL CMD
```

### B48

```asm
ACALL LDELAY
```

### B49

```asm
MOV DPTR, #STR13
ACALL WSTR
```

### B50

```asm
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: STOPP - lines 133 to 133"]
B51["B52: FLASHING - lines 138 to 138"]
B52["B53: HERE - lines 140 to 141"]
B53["B54: instructions - lines 142 to 143"]
B54["B55: instructions - lines 144 to 144"]
B55["B56: instructions - lines 145 to 145"]
B56["B57: MENU - lines 149 to 149"]
B57["B58: instructions - lines 150 to 150"]
B58["B59: instructions - lines 151 to 152"]
B59["B60: instructions - lines 153 to 154"]
B50 -->|jump| B50
B51 -->|next| B52
B52 -->|call| B177
B52 -->|after return| B53
B53 -->|call| B177
B53 -->|after return| B54
B54 -->|condition true| B52
B54 -->|condition false| B55
B56 -->|call| B170
B56 -->|after return| B57
B57 -->|call| B177
B57 -->|after return| B58
B58 -->|call| B151
B58 -->|after return| B59
B59 -->|call| B151
B59 -->|after return| B60
B177["Continue at B178 in section 18"]
B170["Continue at B171 in section 18"]
B151["Continue at B152 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
SJMP STOPP
```

### B52

```asm
MOV R3,#3
```

### B53

```asm
CLR G
ACALL DELAY
```

### B54

```asm
SETB G
ACALL DELAY
```

### B55

```asm
DJNZ R3,HERE
```

### B56

Return to the instruction following the active call.

```asm
RET
```

### B57

```asm
ACALL CLEAR
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
MOV A, #8H
ACALL CMD
```

### B60

```asm
MOV A, #0H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 155 to 155"]
B61["B62: instructions - lines 156 to 157"]
B62["B63: instructions - lines 158 to 158"]
B63["B64: instructions - lines 160 to 161"]
B64["B65: instructions - lines 162 to 163"]
B65["B66: instructions - lines 164 to 164"]
B66["B67: instructions - lines 165 to 166"]
B67["B68: instructions - lines 167 to 167"]
B68["B69: instructions - lines 168 to 168"]
B69["B70: SELECTION - lines 171 to 171"]
B60 -->|call| B163
B60 -->|after return| B61
B61 -->|call| B158
B61 -->|after return| B62
B62 -->|call| B177
B62 -->|after return| B63
B63 -->|call| B151
B63 -->|after return| B64
B64 -->|call| B151
B64 -->|after return| B65
B65 -->|call| B163
B65 -->|after return| B66
B66 -->|call| B158
B66 -->|after return| B67
B67 -->|call| B177
B67 -->|after return| B68
B69 -->|call| B177
B69 -->|after return| B70
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B177["Continue at B178 in section 18"]
B151["Continue at B152 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL LDELAY
```

### B62

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B63

```asm
ACALL DELAY
```

### B64

```asm
MOV A, #1100B
ACALL CMD
```

### B65

```asm
MOV A, #0H
ACALL CMD
```

### B66

```asm
ACALL LDELAY
```

### B67

```asm
MOV DPTR, #STR4
ACALL WSTR
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
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 172 to 172"]
B71["B72: instructions - lines 173 to 174"]
B72["B73: instructions - lines 175 to 176"]
B73["B74: instructions - lines 177 to 177"]
B74["B75: instructions - lines 178 to 178"]
B75["B76: instructions - lines 179 to 180"]
B76["B77: instructions - lines 181 to 181"]
B77["B78: instructions - lines 182 to 184"]
B78["B79: instructions - lines 185 to 185"]
B79["B80: instructions - lines 186 to 186"]
B70 -->|call| B170
B70 -->|after return| B71
B71 -->|call| B151
B71 -->|after return| B72
B72 -->|call| B151
B72 -->|after return| B73
B73 -->|call| B163
B73 -->|after return| B74
B74 -->|call| B177
B74 -->|after return| B75
B75 -->|call| B158
B75 -->|after return| B76
B76 -->|call| B163
B76 -->|after return| B77
B77 -->|call| B153
B77 -->|after return| B78
B78 -->|call| B177
B78 -->|after return| B79
B170["Continue at B171 in section 18"]
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B177["Continue at B178 in section 18"]
B158["Continue at B159 in section 16"]
B153["Continue at B154 in section 16"]
```

### B71

```asm
ACALL CLEAR
```

### B72

```asm
MOV A, #8H
ACALL CMD
```

### B73

```asm
MOV A, #0H
ACALL CMD
```

### B74

```asm
ACALL LDELAY
```

### B75

```asm
ACALL DELAY
```

### B76

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B77

```asm
ACALL LDELAY
```

### B78

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B79

```asm
ACALL DELAY
```

### B80

Return to the instruction following the active call.

```asm
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: NUMBERS - lines 189 to 189"]
B81["B82: instructions - lines 190 to 190"]
B82["B83: instructions - lines 191 to 192"]
B83["B84: instructions - lines 193 to 194"]
B84["B85: instructions - lines 195 to 195"]
B85["B86: instructions - lines 196 to 197"]
B86["B87: instructions - lines 198 to 198"]
B87["B88: instructions - lines 199 to 201"]
B88["B89: instructions - lines 202 to 202"]
B89["B90: instructions - lines 204 to 205"]
B80 -->|call| B177
B80 -->|after return| B81
B81 -->|call| B170
B81 -->|after return| B82
B82 -->|call| B151
B82 -->|after return| B83
B83 -->|call| B151
B83 -->|after return| B84
B84 -->|call| B163
B84 -->|after return| B85
B85 -->|call| B158
B85 -->|after return| B86
B86 -->|call| B177
B86 -->|after return| B87
B87 -->|call| B153
B87 -->|after return| B88
B88 -->|call| B177
B88 -->|after return| B89
B89 -->|call| B151
B89 -->|after return| B90
B177["Continue at B178 in section 18"]
B170["Continue at B171 in section 18"]
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B153["Continue at B154 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL DELAY
```

### B82

```asm
ACALL CLEAR
```

### B83

```asm
MOV A, #8H
ACALL CMD
```

### B84

```asm
MOV A, #0H
ACALL CMD
```

### B85

```asm
ACALL LDELAY
```

### B86

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A,40H
ADD A,#30H
ACALL WCHR
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
MOV A, #1100B
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 206 to 207"]
B91["B92: instructions - lines 208 to 208"]
B92["B93: instructions - lines 209 to 210"]
B93["B94: instructions - lines 211 to 211"]
B94["B95: instructions - lines 212 to 214"]
B95["B96: instructions - lines 215 to 215"]
B96["B97: instructions - lines 216 to 216"]
B97["B98: RESULTS - lines 219 to 219"]
B98["B99: instructions - lines 220 to 220"]
B99["B100: instructions - lines 221 to 222"]
B90 -->|call| B151
B90 -->|after return| B91
B91 -->|call| B163
B91 -->|after return| B92
B92 -->|call| B158
B92 -->|after return| B93
B93 -->|call| B177
B93 -->|after return| B94
B94 -->|call| B153
B94 -->|after return| B95
B95 -->|call| B177
B95 -->|after return| B96
B97 -->|call| B177
B97 -->|after return| B98
B98 -->|call| B170
B98 -->|after return| B99
B99 -->|call| B151
B99 -->|after return| B100
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B177["Continue at B178 in section 18"]
B153["Continue at B154 in section 16"]
B170["Continue at B171 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A, #0H
ACALL CMD
```

### B92

```asm
ACALL LDELAY
```

### B93

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B94

```asm
ACALL DELAY
```

### B95

```asm
MOV A,41H
ADD A,#30H
ACALL WCHR
```

### B96

```asm
ACALL DELAY
```

### B97

Return to the instruction following the active call.

```asm
RET
```

### B98

```asm
ACALL DELAY
```

### B99

```asm
ACALL CLEAR
```

### B100

```asm
MOV A, #8H
ACALL CMD
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 223 to 224"]
B101["B102: instructions - lines 225 to 225"]
B102["B103: instructions - lines 226 to 227"]
B103["B104: instructions - lines 228 to 228"]
B104["B105: instructions - lines 229 to 233"]
B105["B106: instructions - lines 234 to 236"]
B106["B107: instructions - lines 237 to 237"]
B107["B108: instructions - lines 238 to 238"]
B108["B109: REMINDER - lines 242 to 243"]
B109["B110: instructions - lines 244 to 245"]
B100 -->|call| B151
B100 -->|after return| B101
B101 -->|call| B163
B101 -->|after return| B102
B102 -->|call| B158
B102 -->|after return| B103
B103 -->|call| B177
B103 -->|after return| B104
B104 -->|call| B153
B104 -->|after return| B105
B105 -->|call| B153
B105 -->|after return| B106
B106 -->|call| B177
B106 -->|after return| B107
B108 -->|call| B151
B108 -->|after return| B109
B109 -->|call| B151
B109 -->|after return| B110
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B177["Continue at B178 in section 18"]
B153["Continue at B154 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A, #0H
ACALL CMD
```

### B102

```asm
ACALL LDELAY
```

### B103

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B106

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B107

```asm
ACALL DELAY
```

### B108

Return to the instruction following the active call.

```asm
RET
```

### B109

```asm
MOV A, #1100B
ACALL CMD
```

### B110

```asm
MOV A, #0H
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 246 to 246"]
B111["B112: instructions - lines 247 to 248"]
B112["B113: instructions - lines 249 to 249"]
B113["B114: instructions - lines 250 to 252"]
B114["B115: instructions - lines 253 to 253"]
B115["B116: instructions - lines 254 to 254"]
B116["B117: CONTINUE - lines 257 to 257"]
B117["B118: instructions - lines 258 to 259"]
B118["B119: instructions - lines 260 to 261"]
B119["B120: instructions - lines 262 to 262"]
B110 -->|call| B163
B110 -->|after return| B111
B111 -->|call| B158
B111 -->|after return| B112
B112 -->|call| B177
B112 -->|after return| B113
B113 -->|call| B153
B113 -->|after return| B114
B114 -->|call| B177
B114 -->|after return| B115
B116 -->|call| B170
B116 -->|after return| B117
B117 -->|call| B151
B117 -->|after return| B118
B118 -->|call| B151
B118 -->|after return| B119
B119 -->|call| B163
B119 -->|after return| B120
B163["Continue at B164 in section 17"]
B158["Continue at B159 in section 16"]
B177["Continue at B178 in section 18"]
B153["Continue at B154 in section 16"]
B170["Continue at B171 in section 18"]
B151["Continue at B152 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL LDELAY
```

### B112

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B113

```asm
ACALL DELAY
```

### B114

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B115

```asm
ACALL DELAY
```

### B116

Return to the instruction following the active call.

```asm
RET
```

### B117

```asm
ACALL CLEAR
```

### B118

```asm
MOV A, #8H
ACALL CMD
```

### B119

```asm
MOV A, #0H
ACALL CMD
```

### B120

```asm
ACALL LDELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 263 to 264"]
B121["B122: instructions - lines 265 to 265"]
B122["B123: instructions - lines 267 to 268"]
B123["B124: instructions - lines 269 to 270"]
B124["B125: instructions - lines 271 to 271"]
B125["B126: instructions - lines 272 to 273"]
B126["B127: instructions - lines 274 to 274"]
B127["B128: instructions - lines 276 to 278"]
B128["B129: instructions - lines 279 to 279"]
B129["B130: instructions - lines 284 to 284"]
B120 -->|call| B158
B120 -->|after return| B121
B121 -->|call| B177
B121 -->|after return| B122
B122 -->|call| B151
B122 -->|after return| B123
B123 -->|call| B151
B123 -->|after return| B124
B124 -->|call| B163
B124 -->|after return| B125
B125 -->|call| B158
B125 -->|after return| B126
B126 -->|call| B177
B126 -->|after return| B127
B127 -->|call| B153
B127 -->|after return| B128
B128 -->|call| B177
B128 -->|after return| B129
B158["Continue at B159 in section 16"]
B177["Continue at B178 in section 18"]
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B153["Continue at B154 in section 16"]
```

### B121

```asm
MOV DPTR, #STR11
ACALL WSTR
```

### B122

```asm
ACALL DELAY
```

### B123

```asm
MOV A, #1100B
ACALL CMD
```

### B124

```asm
MOV A, #0H
ACALL CMD
```

### B125

```asm
ACALL LDELAY
```

### B126

```asm
MOV DPTR, #STR12
ACALL WSTR
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B129

```asm
ACALL DELAY
```

### B130

Return to the instruction following the active call.

```asm
RET
```

## Section 14

```mermaid
flowchart TD
B130["B131: INIT - lines 288 to 295"]
B131["B132: INLCD - lines 300 to 301"]
B132["B133: WAIT - lines 303 to 303"]
B133["B134: instructions - lines 304 to 304"]
B134["B135: instructions - lines 305 to 307"]
B135["B136: instructions - lines 308 to 308"]
B136["B137: instructions - lines 309 to 310"]
B137["B138: instructions - lines 311 to 312"]
B138["B139: instructions - lines 313 to 314"]
B139["B140: instructions - lines 315 to 316"]
B131 -->|next| B132
B132 -->|call| B163
B132 -->|after return| B133
B133 -->|condition true| B132
B133 -->|condition false| B134
B134 -->|call| B151
B134 -->|after return| B135
B135 -->|call| B163
B135 -->|after return| B136
B136 -->|call| B151
B136 -->|after return| B137
B137 -->|call| B151
B137 -->|after return| B138
B138 -->|call| B151
B138 -->|after return| B139
B139 -->|call| B151
B139 -->|after return| B140
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
MOV A,PCON
CLR ACC.7
MOV PCON,A
MOV SCON,#50H
MOV TMOD,#21H
MOV TH1,#-3
SETB TR1
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
B140["B141: instructions - lines 317 to 318"]
B141["B142: instructions - lines 319 to 320"]
B142["B143: instructions - lines 321 to 322"]
B143["B144: instructions - lines 323 to 324"]
B144["B145: instructions - lines 325 to 326"]
B145["B146: instructions - lines 327 to 327"]
B146["B147: instructions - lines 328 to 329"]
B147["B148: instructions - lines 330 to 331"]
B148["B149: instructions - lines 332 to 333"]
B149["B150: instructions - lines 334 to 335"]
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
B145 -->|call| B163
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
B163["Continue at B164 in section 17"]
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
B150["B151: instructions - lines 336 to 337"]
B151["B152: CMD - lines 342 to 343"]
B152["B153: instructions - lines 344 to 344"]
B153["B154: WCHR - lines 349 to 354"]
B154["B155: instructions - lines 355 to 356"]
B155["B156: instructions - lines 357 to 359"]
B156["B157: COMMON - lines 364 to 371"]
B157["B158: instructions - lines 372 to 372"]
B158["B159: WSTR - lines 377 to 377"]
B159["B160: CONT1 - lines 378 to 380"]
B151 -->|call| B156
B151 -->|after return| B152
B153 -->|call| B156
B153 -->|after return| B154
B154 -->|call| B156
B154 -->|after return| B155
B156 -->|call| B163
B156 -->|after return| B157
B158 -->|next| B159
B159 -->|condition true| B162
B159 -->|condition false| B160
B163["Continue at B164 in section 17"]
B162["Continue at B163 in section 17"]
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
CLR RS
ACALL COMMON
```

### B153

Return to the instruction following the active call.

```asm
RET
```

### B154

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B155

```asm
MOV A,B
ACALL COMMON
```

### B156

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B157

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

### B158

Return to the instruction following the active call.

```asm
RET
```

### B159

```asm
PUSH ACC
```

### B160

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 381 to 381"]
B161["B162: instructions - lines 383 to 384"]
B162["B163: EXIT1 - lines 386 to 387"]
B163["B164: LDELAY - lines 392 to 394"]
B164["B165: CON4 - lines 395 to 396"]
B165["B166: instructions - lines 397 to 397"]
B166["B167: instructions - lines 398 to 400"]
B167["B168: TMSEC - lines 407 to 410"]
B168["B169: BACK - lines 412 to 412"]
B169["B170: instructions - lines 413 to 415"]
B160 -->|call| B153
B160 -->|after return| B161
B161 -->|jump| B159
B163 -->|next| B164
B164 -->|condition true| B164
B164 -->|condition false| B165
B165 -->|condition true| B164
B165 -->|condition false| B166
B167 -->|next| B168
B168 -->|condition true| B168
B168 -->|condition false| B169
B153["Continue at B154 in section 16"]
B159["Continue at B160 in section 16"]
```

### B161

```asm
ACALL WCHR
```

### B162

```asm
INC DPTR
AJMP CONT1
```

### B163

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B164

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B165

```asm
MOV R0,#250
DJNZ R0,$
```

### B166

```asm
DJNZ R1,CON4
```

### B167

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B168

```asm
MOV TMOD,#21H
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B169

```asm
JNB TF0,BACK
```

### B170

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: CLEAR - lines 419 to 420"]
B171["B172: instructions - lines 421 to 422"]
B172["B173: instructions - lines 423 to 423"]
B173["B174: instructions - lines 424 to 424"]
B174["B175: WAITT - lines 425 to 425"]
B175["B176: instructions - lines 426 to 426"]
B176["B177: instructions - lines 427 to 427"]
B177["B178: DELAY - lines 431 to 431"]
B178["B179: HH - lines 433 to 433"]
B179["B180: instructions - lines 434 to 434"]
B170 -->|call| B151
B170 -->|after return| B171
B171 -->|call| B151
B171 -->|after return| B172
B172 -->|call| B163
B172 -->|after return| B173
B173 -->|next| B174
B174 -->|call| B163
B174 -->|after return| B175
B175 -->|condition true| B174
B175 -->|condition false| B176
B177 -->|next| B178
B178 -->|call| B163
B178 -->|after return| B179
B179 -->|condition true| B178
B179 -->|condition false| B180
B151["Continue at B152 in section 16"]
B163["Continue at B164 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV A,#0H
ACALL CMD
```

### B172

```asm
MOV A,#1H
ACALL CMD
```

### B173

```asm
ACALL LDELAY
```

### B174

```asm
MOV R7,#14
```

### B175

```asm
ACALL LDELAY
```

### B176

```asm
DJNZ R7,WAITT
```

### B177

Return to the instruction following the active call.

```asm
RET
```

### B178

```asm
MOV R5,#60
```

### B179

```asm
ACALL LDELAY
```

### B180

```asm
DJNZ R5,HH
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 435 to 435"]
```

### B181

Return to the instruction following the active call.

```asm
RET
```
