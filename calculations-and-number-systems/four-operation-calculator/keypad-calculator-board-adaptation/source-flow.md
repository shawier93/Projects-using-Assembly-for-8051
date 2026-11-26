# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 12 to 12"]
B1["B2: instructions - lines 15 to 15"]
B2["B3: MAIN - lines 20 to 27"]
B3["B4: instructions - lines 29 to 29"]
B4["B5: instructions - lines 30 to 30"]
B5["B6: instructions - lines 31 to 32"]
B6["B7: instructions - lines 33 to 34"]
B7["B8: instructions - lines 35 to 35"]
B8["B9: instructions - lines 37 to 38"]
B9["B10: instructions - lines 39 to 39"]
B0 -->|jump| B2
B1 -->|jump| B16
B2 -->|call| B150
B2 -->|after return| B3
B3 -->|call| B217
B3 -->|after return| B4
B4 -->|call| B210
B4 -->|after return| B5
B5 -->|call| B170
B5 -->|after return| B6
B6 -->|call| B170
B6 -->|after return| B7
B7 -->|call| B182
B7 -->|after return| B8
B8 -->|call| B177
B8 -->|after return| B9
B9 -->|call| B217
B9 -->|after return| B10
B16["Continue at B17 in section 2"]
B150["Continue at B151 in section 16"]
B217["Continue at B218 in section 22"]
B210["Continue at B211 in section 22"]
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
LJMP EX0ISR
```

### B3

```asm
MOV 30H,#0
MOV 40H,#0
MOV 41H,#0
MOV 50H,#00
MOV 51H,#00
MOV 60H,#00
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
B10["B11: instructions - lines 41 to 42"]
B11["B12: instructions - lines 43 to 44"]
B12["B13: instructions - lines 45 to 45"]
B13["B14: instructions - lines 46 to 47"]
B14["B15: instructions - lines 48 to 48"]
B15["B16: instructions - lines 50 to 52"]
B16["B17: EX0ISR - lines 55 to 55"]
B17["B18: instructions - lines 56 to 60"]
B18["B19: instructions - lines 61 to 62"]
B19["B20: instructions - lines 63 to 63"]
B10 -->|call| B170
B10 -->|after return| B11
B11 -->|call| B170
B11 -->|after return| B12
B12 -->|call| B182
B12 -->|after return| B13
B13 -->|call| B177
B13 -->|after return| B14
B14 -->|call| B217
B14 -->|after return| B15
B15 -->|jump| B15
B16 -->|call| B62
B16 -->|after return| B17
B17 -->|call| B186
B17 -->|after return| B18
B18 -->|call| B172
B18 -->|after return| B19
B19 -->|call| B217
B19 -->|after return| B20
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B62["Continue at B63 in section 7"]
B186["Continue at B187 in section 19"]
B172["Continue at B173 in section 18"]
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
MOV IE,#10000001B
SETB IT0
SJMP $
```

### B17

```asm
ACALL MENU
```

### B18

```asm
SETB G
SETB Y
SETB R
ACALL KEYPAD
```

### B19

```asm
MOV 30H,A
ACALL WCHR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 65 to 65"]
B21["B22: instructions - lines 66 to 67"]
B22["B23: instructions - lines 68 to 69"]
B23["B24: instructions - lines 70 to 73"]
B24["B25: instructions - lines 74 to 75"]
B25["B26: SUBTRACT - lines 79 to 79"]
B26["B27: instructions - lines 80 to 81"]
B27["B28: instructions - lines 82 to 85"]
B28["B29: instructions - lines 86 to 87"]
B29["B30: MULTIPLICATION - lines 90 to 90"]
B20 -->|call| B75
B20 -->|after return| B21
B21 -->|condition true| B25
B21 -->|condition false| B22
B22 -->|call| B99
B22 -->|after return| B23
B23 -->|call| B118
B23 -->|after return| B24
B24 -->|jump| B47
B25 -->|condition true| B29
B25 -->|condition false| B26
B26 -->|call| B99
B26 -->|after return| B27
B27 -->|call| B118
B27 -->|after return| B28
B28 -->|jump| B47
B29 -->|condition true| B33
B29 -->|condition false| B30
B75["Continue at B76 in section 8"]
B99["Continue at B100 in section 10"]
B118["Continue at B119 in section 12"]
B47["Continue at B48 in section 5"]
B33["Continue at B34 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL SELECTION
```

### B22

```asm
MOV A,30H
CJNE A,#'1',SUBTRACT
```

### B23

```asm
CLR G
ACALL NUMBERS
```

### B24

```asm
MOV A,40H
ADD A,41H
MOV 50H,A
ACALL RESULTS
```

### B25

```asm
SETB G
SJMP NEXT
```

### B26

```asm
CJNE A,#'2',MULTIPLICATION
```

### B27

```asm
CLR G
ACALL NUMBERS
```

### B28

```asm
MOV A,40H
SUBB A,41H
MOV 50H,A
ACALL RESULTS
```

### B29

```asm
SETB G
SJMP NEXT
```

### B30

```asm
CJNE A,#'3',DIVISION
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 91 to 92"]
B31["B32: instructions - lines 93 to 97"]
B32["B33: instructions - lines 98 to 99"]
B33["B34: DIVISION - lines 102 to 102"]
B34["B35: instructions - lines 103 to 104"]
B35["B36: instructions - lines 105 to 110"]
B36["B37: instructions - lines 111 to 111"]
B37["B38: instructions - lines 112 to 113"]
B38["B39: WRONG - lines 116 to 117"]
B39["B40: instructions - lines 118 to 118"]
B30 -->|call| B99
B30 -->|after return| B31
B31 -->|call| B118
B31 -->|after return| B32
B32 -->|jump| B47
B33 -->|condition true| B38
B33 -->|condition false| B34
B34 -->|call| B99
B34 -->|after return| B35
B35 -->|call| B118
B35 -->|after return| B36
B36 -->|call| B129
B36 -->|after return| B37
B37 -->|jump| B47
B38 -->|call| B217
B38 -->|after return| B39
B39 -->|call| B210
B39 -->|after return| B40
B99["Continue at B100 in section 10"]
B118["Continue at B119 in section 12"]
B47["Continue at B48 in section 5"]
B129["Continue at B130 in section 13"]
B217["Continue at B218 in section 22"]
B210["Continue at B211 in section 22"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CLR G
ACALL NUMBERS
```

### B32

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV 50H,A
ACALL RESULTS
```

### B33

```asm
SETB G
SJMP NEXT
```

### B34

```asm
CJNE A,#'4',WRONG
```

### B35

```asm
CLR G
ACALL NUMBERS
```

### B36

```asm
MOV A,40H
MOV B,41H
DIV AB
MOV 50H,A
MOV 51H,B
ACALL RESULTS
```

### B37

```asm
ACALL REMINDER
```

### B38

```asm
SETB G
SJMP NEXT
```

### B39

```asm
CLR R
ACALL DELAY
```

### B40

```asm
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 119 to 119"]
B41["B42: instructions - lines 120 to 121"]
B42["B43: instructions - lines 122 to 123"]
B43["B44: instructions - lines 124 to 124"]
B44["B45: instructions - lines 126 to 127"]
B45["B46: instructions - lines 128 to 128"]
B46["B47: instructions - lines 129 to 130"]
B47["B48: NEXT - lines 134 to 134"]
B48["B49: instructions - lines 135 to 136"]
B49["B50: instructions - lines 137 to 137"]
B40 -->|call| B217
B40 -->|after return| B41
B41 -->|call| B170
B41 -->|after return| B42
B42 -->|call| B170
B42 -->|after return| B43
B43 -->|call| B182
B43 -->|after return| B44
B44 -->|call| B177
B44 -->|after return| B45
B45 -->|call| B217
B45 -->|after return| B46
B46 -->|jump| B16
B47 -->|call| B137
B47 -->|after return| B48
B48 -->|call| B186
B48 -->|after return| B49
B49 -->|call| B172
B49 -->|after return| B50
B217["Continue at B218 in section 22"]
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B16["Continue at B17 in section 2"]
B137["Continue at B138 in section 14"]
B186["Continue at B187 in section 19"]
B172["Continue at B173 in section 18"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL DELAY
```

### B42

```asm
MOV A,#8H
ACALL CMD
```

### B43

```asm
MOV A,#0H
ACALL CMD
```

### B44

```asm
ACALL LDELAY
```

### B45

```asm
MOV DPTR, #STR10
ACALL WSTR
```

### B46

```asm
ACALL DELAY
```

### B47

```asm
SETB R
AJMP START
```

### B48

```asm
ACALL CONTINUE
```

### B49

```asm
MOV A,60H
ACALL KEYPAD
```

### B50

```asm
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 138 to 138"]
B51["B52: instructions - lines 139 to 141"]
B52["B53: instructions - lines 143 to 143"]
B53["B54: instructions - lines 144 to 145"]
B54["B55: instructions - lines 146 to 147"]
B55["B56: instructions - lines 148 to 148"]
B56["B57: instructions - lines 149 to 150"]
B57["B58: instructions - lines 151 to 151"]
B58["B59: instructions - lines 153 to 153"]
B59["B60: START1 - lines 154 to 154"]
B50 -->|call| B217
B50 -->|after return| B51
B51 -->|condition true| B59
B51 -->|condition false| B52
B52 -->|call| B210
B52 -->|after return| B53
B53 -->|call| B170
B53 -->|after return| B54
B54 -->|call| B170
B54 -->|after return| B55
B55 -->|call| B182
B55 -->|after return| B56
B56 -->|call| B177
B56 -->|after return| B57
B57 -->|call| B217
B57 -->|after return| B58
B58 -->|jump| B60
B59 -->|jump| B16
B217["Continue at B218 in section 22"]
B210["Continue at B211 in section 22"]
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B60["Continue at B61 in section 7"]
B16["Continue at B17 in section 2"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
SUBB A,#30H
MOV 60H,A
CJNE A,#2,START1
```

### B53

```asm
ACALL CLEAR
```

### B54

```asm
MOV A,#8H
ACALL CMD
```

### B55

```asm
MOV A,#0H
ACALL CMD
```

### B56

```asm
ACALL LDELAY
```

### B57

```asm
MOV DPTR, #STR13
ACALL WSTR
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
SJMP STOPP
```

### B60

```asm
AJMP START
```

## Section 7

```mermaid
flowchart TD
B60["B61: STOPP - lines 156 to 156"]
B61["B62: instructions - lines 157 to 157"]
B62["B63: MENU - lines 165 to 165"]
B63["B64: instructions - lines 166 to 166"]
B64["B65: instructions - lines 167 to 168"]
B65["B66: instructions - lines 169 to 170"]
B66["B67: instructions - lines 171 to 171"]
B67["B68: instructions - lines 172 to 173"]
B68["B69: instructions - lines 174 to 174"]
B69["B70: instructions - lines 176 to 177"]
B60 -->|jump| B60
B62 -->|call| B210
B62 -->|after return| B63
B63 -->|call| B217
B63 -->|after return| B64
B64 -->|call| B170
B64 -->|after return| B65
B65 -->|call| B170
B65 -->|after return| B66
B66 -->|call| B182
B66 -->|after return| B67
B67 -->|call| B177
B67 -->|after return| B68
B68 -->|call| B217
B68 -->|after return| B69
B69 -->|call| B170
B69 -->|after return| B70
B210["Continue at B211 in section 22"]
B217["Continue at B218 in section 22"]
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SJMP STOPP
```

### B62

Resume the interrupted program.

```asm
RETI
```

### B63

```asm
ACALL CLEAR
```

### B64

```asm
ACALL DELAY
```

### B65

```asm
MOV A, #8H
ACALL CMD
```

### B66

```asm
MOV A, #0H
ACALL CMD
```

### B67

```asm
ACALL LDELAY
```

### B68

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
MOV A, #1100B
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 178 to 179"]
B71["B72: instructions - lines 180 to 180"]
B72["B73: instructions - lines 181 to 182"]
B73["B74: instructions - lines 183 to 183"]
B74["B75: instructions - lines 184 to 184"]
B75["B76: SELECTION - lines 187 to 187"]
B76["B77: instructions - lines 188 to 188"]
B77["B78: instructions - lines 189 to 190"]
B78["B79: instructions - lines 191 to 192"]
B79["B80: instructions - lines 193 to 193"]
B70 -->|call| B170
B70 -->|after return| B71
B71 -->|call| B182
B71 -->|after return| B72
B72 -->|call| B177
B72 -->|after return| B73
B73 -->|call| B217
B73 -->|after return| B74
B75 -->|call| B217
B75 -->|after return| B76
B76 -->|call| B210
B76 -->|after return| B77
B77 -->|call| B170
B77 -->|after return| B78
B78 -->|call| B170
B78 -->|after return| B79
B79 -->|call| B182
B79 -->|after return| B80
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B210["Continue at B211 in section 22"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A, #0H
ACALL CMD
```

### B72

```asm
ACALL LDELAY
```

### B73

```asm
MOV DPTR, #STR4
ACALL WSTR
```

### B74

```asm
ACALL DELAY
```

### B75

Return to the instruction following the active call.

```asm
RET
```

### B76

```asm
ACALL DELAY
```

### B77

```asm
ACALL CLEAR
```

### B78

```asm
MOV A, #8H
ACALL CMD
```

### B79

```asm
MOV A, #0H
ACALL CMD
```

### B80

```asm
ACALL LDELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 194 to 194"]
B81["B82: instructions - lines 195 to 196"]
B82["B83: instructions - lines 197 to 197"]
B83["B84: instructions - lines 198 to 200"]
B84["B85: instructions - lines 201 to 201"]
B85["B86: instructions - lines 202 to 203"]
B86["B87: instructions - lines 204 to 205"]
B87["B88: instructions - lines 206 to 206"]
B88["B89: instructions - lines 207 to 208"]
B89["B90: instructions - lines 209 to 210"]
B80 -->|call| B217
B80 -->|after return| B81
B81 -->|call| B177
B81 -->|after return| B82
B82 -->|call| B182
B82 -->|after return| B83
B83 -->|call| B172
B83 -->|after return| B84
B84 -->|call| B217
B84 -->|after return| B85
B85 -->|call| B170
B85 -->|after return| B86
B86 -->|call| B170
B86 -->|after return| B87
B87 -->|call| B182
B87 -->|after return| B88
B88 -->|condition true| B90
B88 -->|condition false| B89
B89 -->|jump| B96
B217["Continue at B218 in section 22"]
B177["Continue at B178 in section 18"]
B182["Continue at B183 in section 19"]
B172["Continue at B173 in section 18"]
B170["Continue at B171 in section 18"]
B90["Continue at B91 in section 10"]
B96["Continue at B97 in section 10"]
```

### B81

```asm
ACALL DELAY
```

### B82

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B83

```asm
ACALL LDELAY
```

### B84

```asm
MOV A,30H
ACALL WCHR
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
MOV A, #1100B
ACALL CMD
```

### B87

```asm
MOV A, #0H
ACALL CMD
```

### B88

```asm
ACALL LDELAY
```

### B89

```asm
MOV A,30H
CJNE A,#'1',SSUB
```

### B90

```asm
MOV DPTR, #STR14
SJMP NNEXT
```

## Section 10

```mermaid
flowchart TD
B90["B91: SSUB - lines 212 to 212"]
B91["B92: instructions - lines 213 to 214"]
B92["B93: MMUL - lines 216 to 216"]
B93["B94: instructions - lines 217 to 218"]
B94["B95: DDIV - lines 220 to 220"]
B95["B96: instructions - lines 221 to 222"]
B96["B97: NNEXT - lines 224 to 224"]
B97["B98: instructions - lines 225 to 225"]
B98["B99: NNNEXT - lines 227 to 227"]
B99["B100: NUMBERS - lines 230 to 230"]
B90 -->|condition true| B92
B90 -->|condition false| B91
B91 -->|jump| B96
B92 -->|condition true| B94
B92 -->|condition false| B93
B93 -->|jump| B96
B94 -->|condition true| B98
B94 -->|condition false| B95
B95 -->|jump| B96
B96 -->|call| B177
B96 -->|after return| B97
B97 -->|call| B217
B97 -->|after return| B98
B99 -->|call| B217
B99 -->|after return| B100
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
CJNE A,#'2',MMUL
```

### B92

```asm
MOV DPTR, #STR15
SJMP NNEXT
```

### B93

```asm
CJNE A,#'3',DDIV
```

### B94

```asm
MOV DPTR, #STR16
SJMP NNEXT
```

### B95

```asm
CJNE A,#'4',NNNEXT
```

### B96

```asm
MOV DPTR, #STR17
SJMP NNEXT
```

### B97

```asm
ACALL WSTR
```

### B98

```asm
ACALL DELAY
```

### B99

Return to the instruction following the active call.

```asm
RET
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 231 to 231"]
B101["B102: instructions - lines 232 to 233"]
B102["B103: instructions - lines 234 to 235"]
B103["B104: instructions - lines 236 to 236"]
B104["B105: instructions - lines 237 to 238"]
B105["B106: instructions - lines 239 to 239"]
B106["B107: instructions - lines 241 to 241"]
B107["B108: instructions - lines 242 to 242"]
B108["B109: instructions - lines 243 to 245"]
B109["B110: instructions - lines 247 to 248"]
B100 -->|call| B210
B100 -->|after return| B101
B101 -->|call| B170
B101 -->|after return| B102
B102 -->|call| B170
B102 -->|after return| B103
B103 -->|call| B182
B103 -->|after return| B104
B104 -->|call| B177
B104 -->|after return| B105
B105 -->|call| B217
B105 -->|after return| B106
B106 -->|call| B186
B106 -->|after return| B107
B107 -->|call| B172
B107 -->|after return| B108
B108 -->|call| B217
B108 -->|after return| B109
B109 -->|call| B170
B109 -->|after return| B110
B210["Continue at B211 in section 22"]
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B186["Continue at B187 in section 19"]
B172["Continue at B173 in section 18"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
MOV A, #8H
ACALL CMD
```

### B103

```asm
MOV A, #0H
ACALL CMD
```

### B104

```asm
ACALL LDELAY
```

### B105

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B106

```asm
ACALL DELAY
```

### B107

```asm
ACALL KEYPAD
```

### B108

```asm
ACALL WCHR
```

### B109

```asm
SUBB A,#30H
MOV 40H,A
ACALL DELAY
```

### B110

```asm
MOV A, #1100B
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 249 to 250"]
B111["B112: instructions - lines 251 to 251"]
B112["B113: instructions - lines 252 to 253"]
B113["B114: instructions - lines 254 to 254"]
B114["B115: instructions - lines 256 to 256"]
B115["B116: instructions - lines 257 to 257"]
B116["B117: instructions - lines 258 to 260"]
B117["B118: instructions - lines 261 to 261"]
B118["B119: RESULTS - lines 264 to 264"]
B119["B120: instructions - lines 265 to 265"]
B110 -->|call| B170
B110 -->|after return| B111
B111 -->|call| B182
B111 -->|after return| B112
B112 -->|call| B177
B112 -->|after return| B113
B113 -->|call| B217
B113 -->|after return| B114
B114 -->|call| B186
B114 -->|after return| B115
B115 -->|call| B172
B115 -->|after return| B116
B116 -->|call| B217
B116 -->|after return| B117
B118 -->|call| B217
B118 -->|after return| B119
B119 -->|call| B210
B119 -->|after return| B120
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B186["Continue at B187 in section 19"]
B172["Continue at B173 in section 18"]
B210["Continue at B211 in section 22"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A, #0H
ACALL CMD
```

### B112

```asm
ACALL LDELAY
```

### B113

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B114

```asm
ACALL DELAY
```

### B115

```asm
ACALL KEYPAD
```

### B116

```asm
ACALL WCHR
```

### B117

```asm
SUBB A,#30H
MOV 41H,A
ACALL DELAY
```

### B118

Return to the instruction following the active call.

```asm
RET
```

### B119

```asm
ACALL DELAY
```

### B120

```asm
ACALL CLEAR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 266 to 267"]
B121["B122: instructions - lines 268 to 269"]
B122["B123: instructions - lines 270 to 270"]
B123["B124: instructions - lines 271 to 272"]
B124["B125: instructions - lines 273 to 273"]
B125["B126: instructions - lines 274 to 278"]
B126["B127: instructions - lines 279 to 281"]
B127["B128: instructions - lines 282 to 282"]
B128["B129: instructions - lines 283 to 283"]
B129["B130: REMINDER - lines 287 to 288"]
B120 -->|call| B170
B120 -->|after return| B121
B121 -->|call| B170
B121 -->|after return| B122
B122 -->|call| B182
B122 -->|after return| B123
B123 -->|call| B177
B123 -->|after return| B124
B124 -->|call| B217
B124 -->|after return| B125
B125 -->|call| B172
B125 -->|after return| B126
B126 -->|call| B172
B126 -->|after return| B127
B127 -->|call| B217
B127 -->|after return| B128
B129 -->|call| B170
B129 -->|after return| B130
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B172["Continue at B173 in section 18"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A, #8H
ACALL CMD
```

### B122

```asm
MOV A, #0H
ACALL CMD
```

### B123

```asm
ACALL LDELAY
```

### B124

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B125

```asm
ACALL DELAY
```

### B126

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B127

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B128

```asm
ACALL DELAY
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
MOV A, #1100B
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 289 to 290"]
B131["B132: instructions - lines 291 to 291"]
B132["B133: instructions - lines 292 to 293"]
B133["B134: instructions - lines 294 to 294"]
B134["B135: instructions - lines 295 to 297"]
B135["B136: instructions - lines 298 to 298"]
B136["B137: instructions - lines 299 to 299"]
B137["B138: CONTINUE - lines 302 to 302"]
B138["B139: instructions - lines 303 to 304"]
B139["B140: instructions - lines 305 to 306"]
B130 -->|call| B170
B130 -->|after return| B131
B131 -->|call| B182
B131 -->|after return| B132
B132 -->|call| B177
B132 -->|after return| B133
B133 -->|call| B217
B133 -->|after return| B134
B134 -->|call| B172
B134 -->|after return| B135
B135 -->|call| B217
B135 -->|after return| B136
B137 -->|call| B210
B137 -->|after return| B138
B138 -->|call| B170
B138 -->|after return| B139
B139 -->|call| B170
B139 -->|after return| B140
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B172["Continue at B173 in section 18"]
B210["Continue at B211 in section 22"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A, #0H
ACALL CMD
```

### B132

```asm
ACALL LDELAY
```

### B133

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B134

```asm
ACALL DELAY
```

### B135

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B136

```asm
ACALL DELAY
```

### B137

Return to the instruction following the active call.

```asm
RET
```

### B138

```asm
ACALL CLEAR
```

### B139

```asm
MOV A, #8H
ACALL CMD
```

### B140

```asm
MOV A, #0H
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 307 to 307"]
B141["B142: instructions - lines 308 to 309"]
B142["B143: instructions - lines 310 to 310"]
B143["B144: instructions - lines 312 to 313"]
B144["B145: instructions - lines 314 to 315"]
B145["B146: instructions - lines 316 to 316"]
B146["B147: instructions - lines 317 to 318"]
B147["B148: instructions - lines 319 to 319"]
B148["B149: instructions - lines 326 to 326"]
B149["B150: INIT - lines 330 to 337"]
B140 -->|call| B182
B140 -->|after return| B141
B141 -->|call| B177
B141 -->|after return| B142
B142 -->|call| B217
B142 -->|after return| B143
B143 -->|call| B170
B143 -->|after return| B144
B144 -->|call| B170
B144 -->|after return| B145
B145 -->|call| B182
B145 -->|after return| B146
B146 -->|call| B177
B146 -->|after return| B147
B147 -->|call| B217
B147 -->|after return| B148
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B217["Continue at B218 in section 22"]
B170["Continue at B171 in section 18"]
```

### B141

```asm
ACALL LDELAY
```

### B142

```asm
MOV DPTR, #STR11
ACALL WSTR
```

### B143

```asm
ACALL DELAY
```

### B144

```asm
MOV A, #1100B
ACALL CMD
```

### B145

```asm
MOV A, #0H
ACALL CMD
```

### B146

```asm
ACALL LDELAY
```

### B147

```asm
MOV DPTR, #STR12
ACALL WSTR
```

### B148

```asm
ACALL DELAY
```

### B149

Return to the instruction following the active call.

```asm
RET
```

### B150

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

## Section 16

```mermaid
flowchart TD
B150["B151: INLCD - lines 342 to 343"]
B151["B152: WAIT - lines 345 to 345"]
B152["B153: instructions - lines 346 to 346"]
B153["B154: instructions - lines 347 to 349"]
B154["B155: instructions - lines 350 to 350"]
B155["B156: instructions - lines 351 to 352"]
B156["B157: instructions - lines 353 to 354"]
B157["B158: instructions - lines 355 to 356"]
B158["B159: instructions - lines 357 to 358"]
B159["B160: instructions - lines 359 to 360"]
B150 -->|next| B151
B151 -->|call| B182
B151 -->|after return| B152
B152 -->|condition true| B151
B152 -->|condition false| B153
B153 -->|call| B170
B153 -->|after return| B154
B154 -->|call| B182
B154 -->|after return| B155
B155 -->|call| B170
B155 -->|after return| B156
B156 -->|call| B170
B156 -->|after return| B157
B157 -->|call| B170
B157 -->|after return| B158
B158 -->|call| B170
B158 -->|after return| B159
B159 -->|call| B170
B159 -->|after return| B160
B182["Continue at B183 in section 19"]
B170["Continue at B171 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
PUSH 7
MOV R7,#20
```

### B152

```asm
ACALL LDELAY
```

### B153

```asm
DJNZ R7,WAIT
```

### B154

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B155

```asm
ACALL LDELAY
```

### B156

```asm
MOV A,#0011B
ACALL CMD
```

### B157

```asm
MOV A,#0011B
ACALL CMD
```

### B158

```asm
MOV A,#0010B
ACALL CMD
```

### B159

```asm
MOV A,#0010B
ACALL CMD
```

### B160

```asm
MOV A,#1000B
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 361 to 362"]
B161["B162: instructions - lines 363 to 364"]
B162["B163: instructions - lines 365 to 366"]
B163["B164: instructions - lines 367 to 368"]
B164["B165: instructions - lines 369 to 369"]
B165["B166: instructions - lines 370 to 371"]
B166["B167: instructions - lines 372 to 373"]
B167["B168: instructions - lines 374 to 375"]
B168["B169: instructions - lines 376 to 377"]
B169["B170: instructions - lines 378 to 379"]
B160 -->|call| B170
B160 -->|after return| B161
B161 -->|call| B170
B161 -->|after return| B162
B162 -->|call| B170
B162 -->|after return| B163
B163 -->|call| B170
B163 -->|after return| B164
B164 -->|call| B182
B164 -->|after return| B165
B165 -->|call| B170
B165 -->|after return| B166
B166 -->|call| B170
B166 -->|after return| B167
B167 -->|call| B170
B167 -->|after return| B168
B168 -->|call| B170
B168 -->|after return| B169
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
```

### B161

```asm
MOV A,#0000B
ACALL CMD
```

### B162

```asm
MOV A,#1000B
ACALL CMD
```

### B163

```asm
MOV A,#0
ACALL CMD
```

### B164

```asm
MOV A,#0001B
ACALL CMD
```

### B165

```asm
ACALL LDELAY
```

### B166

```asm
MOV A,#0000B
ACALL CMD
```

### B167

```asm
MOV A,#0110B
ACALL CMD
```

### B168

```asm
MOV A,#0000B
ACALL CMD
```

### B169

```asm
MOV A,#1111B
ACALL CMD
```

### B170

Return to the instruction following the active call.

```asm
POP 7
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: CMD - lines 384 to 385"]
B171["B172: instructions - lines 386 to 386"]
B172["B173: WCHR - lines 391 to 396"]
B173["B174: instructions - lines 397 to 398"]
B174["B175: instructions - lines 399 to 401"]
B175["B176: COMMON - lines 406 to 413"]
B176["B177: instructions - lines 414 to 414"]
B177["B178: WSTR - lines 419 to 419"]
B178["B179: CONT1 - lines 420 to 422"]
B179["B180: instructions - lines 423 to 423"]
B170 -->|call| B175
B170 -->|after return| B171
B172 -->|call| B175
B172 -->|after return| B173
B173 -->|call| B175
B173 -->|after return| B174
B175 -->|call| B182
B175 -->|after return| B176
B177 -->|next| B178
B178 -->|condition true| B181
B178 -->|condition false| B179
B179 -->|call| B172
B179 -->|after return| B180
B182["Continue at B183 in section 19"]
B181["Continue at B182 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
CLR RS
ACALL COMMON
```

### B172

Return to the instruction following the active call.

```asm
RET
```

### B173

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B174

```asm
MOV A,B
ACALL COMMON
```

### B175

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B176

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

### B177

Return to the instruction following the active call.

```asm
RET
```

### B178

```asm
PUSH ACC
```

### B179

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B180

```asm
ACALL WCHR
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 425 to 426"]
B181["B182: EXIT1 - lines 428 to 429"]
B182["B183: LDELAY - lines 434 to 436"]
B183["B184: CON4 - lines 437 to 438"]
B184["B185: instructions - lines 439 to 439"]
B185["B186: instructions - lines 440 to 442"]
B186["B187: KEYPAD - lines 446 to 446"]
B187["B188: K1 - lines 447 to 450"]
B188["B189: K2 - lines 451 to 451"]
B189["B190: instructions - lines 452 to 454"]
B180 -->|jump| B178
B182 -->|next| B183
B183 -->|condition true| B183
B183 -->|condition false| B184
B184 -->|condition true| B183
B184 -->|condition false| B185
B186 -->|next| B187
B187 -->|condition true| B187
B187 -->|condition false| B188
B188 -->|call| B207
B188 -->|after return| B189
B189 -->|condition true| B191
B189 -->|condition false| B190
B178["Continue at B179 in section 18"]
B207["Continue at B208 in section 21"]
B191["Continue at B192 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
INC DPTR
AJMP CONT1
```

### B182

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B183

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B184

```asm
MOV R0,#250
DJNZ R0,$
```

### B185

```asm
DJNZ R1,CON4
```

### B186

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B187

```asm
MOV P2,#11110000B
```

### B188

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B189

```asm
ACALL TMSEC
```

### B190

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 455 to 455"]
B191["B192: OVER - lines 457 to 457"]
B192["B193: instructions - lines 458 to 460"]
B193["B194: instructions - lines 461 to 461"]
B194["B195: OVER1 - lines 463 to 466"]
B195["B196: instructions - lines 467 to 470"]
B196["B197: instructions - lines 471 to 474"]
B197["B198: instructions - lines 475 to 478"]
B198["B199: instructions - lines 479 to 479"]
B199["B200: ROW_0 - lines 480 to 481"]
B190 -->|jump| B188
B191 -->|call| B207
B191 -->|after return| B192
B192 -->|condition true| B194
B192 -->|condition false| B193
B193 -->|jump| B188
B194 -->|condition true| B199
B194 -->|condition false| B195
B195 -->|condition true| B200
B195 -->|condition false| B196
B196 -->|condition true| B201
B196 -->|condition false| B197
B197 -->|condition true| B202
B197 -->|condition false| B198
B198 -->|jump| B188
B199 -->|jump| B203
B188["Continue at B189 in section 19"]
B207["Continue at B208 in section 21"]
B200["Continue at B201 in section 21"]
B201["Continue at B202 in section 21"]
B202["Continue at B203 in section 21"]
B203["Continue at B204 in section 21"]
```

### B191

```asm
SJMP K2
```

### B192

```asm
ACALL TMSEC
```

### B193

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B194

```asm
SJMP K2
```

### B195

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B196

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B197

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B198

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B199

```asm
LJMP K2
```

### B200

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 21

```mermaid
flowchart TD
B200["B201: ROW_1 - lines 482 to 483"]
B201["B202: ROW_2 - lines 484 to 485"]
B202["B203: ROW_3 - lines 486 to 486"]
B203["B204: FIND - lines 488 to 488"]
B204["B205: FIND1 - lines 490 to 491"]
B205["B206: instructions - lines 492 to 493"]
B206["B207: MATCH - lines 495 to 497"]
B207["B208: TMSEC - lines 502 to 505"]
B208["B209: BACK - lines 507 to 507"]
B209["B210: instructions - lines 508 to 510"]
B200 -->|jump| B203
B201 -->|jump| B203
B202 -->|next| B203
B203 -->|next| B204
B204 -->|condition true| B206
B204 -->|condition false| B205
B205 -->|jump| B204
B207 -->|next| B208
B208 -->|condition true| B208
B208 -->|condition false| B209
```

### B201

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B202

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B203

```asm
MOV DPTR,#KCODE3
```

### B204

```asm
SWAP A
```

### B205

```asm
RRC A
JNC MATCH
```

### B206

```asm
INC DPTR
SJMP FIND1
```

### B207

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B208

```asm
MOV TMOD,#21H
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B209

```asm
JNB TF0,BACK
```

### B210

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

## Section 22

```mermaid
flowchart TD
B210["B211: CLEAR - lines 514 to 515"]
B211["B212: instructions - lines 516 to 517"]
B212["B213: instructions - lines 518 to 518"]
B213["B214: instructions - lines 519 to 519"]
B214["B215: WAITT - lines 520 to 520"]
B215["B216: instructions - lines 521 to 521"]
B216["B217: instructions - lines 522 to 522"]
B217["B218: DELAY - lines 526 to 526"]
B218["B219: HH - lines 528 to 528"]
B219["B220: instructions - lines 529 to 529"]
B210 -->|call| B170
B210 -->|after return| B211
B211 -->|call| B170
B211 -->|after return| B212
B212 -->|call| B182
B212 -->|after return| B213
B213 -->|next| B214
B214 -->|call| B182
B214 -->|after return| B215
B215 -->|condition true| B214
B215 -->|condition false| B216
B217 -->|next| B218
B218 -->|call| B182
B218 -->|after return| B219
B219 -->|condition true| B218
B219 -->|condition false| B220
B170["Continue at B171 in section 18"]
B182["Continue at B183 in section 19"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
MOV A,#0H
ACALL CMD
```

### B212

```asm
MOV A,#1H
ACALL CMD
```

### B213

```asm
ACALL LDELAY
```

### B214

```asm
MOV R7,#14
```

### B215

```asm
ACALL LDELAY
```

### B216

```asm
DJNZ R7,WAITT
```

### B217

Return to the instruction following the active call.

```asm
RET
```

### B218

```asm
MOV R5,#170
```

### B219

```asm
ACALL LDELAY
```

### B220

```asm
DJNZ R5,HH
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 530 to 530"]
```

### B221

Return to the instruction following the active call.

```asm
RET
```
