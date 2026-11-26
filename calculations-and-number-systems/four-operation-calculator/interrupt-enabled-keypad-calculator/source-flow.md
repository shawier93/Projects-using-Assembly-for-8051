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
B2["B3: MAIN - lines 20 to 31"]
B3["B4: instructions - lines 33 to 33"]
B4["B5: instructions - lines 34 to 34"]
B5["B6: instructions - lines 35 to 36"]
B6["B7: instructions - lines 37 to 38"]
B7["B8: instructions - lines 39 to 39"]
B8["B9: instructions - lines 41 to 42"]
B9["B10: instructions - lines 43 to 43"]
B0 -->|jump| B2
B1 -->|jump| B65
B2 -->|call| B154
B2 -->|after return| B3
B3 -->|call| B221
B3 -->|after return| B4
B4 -->|call| B214
B4 -->|after return| B5
B5 -->|call| B174
B5 -->|after return| B6
B6 -->|call| B174
B6 -->|after return| B7
B7 -->|call| B186
B7 -->|after return| B8
B8 -->|call| B181
B8 -->|after return| B9
B9 -->|call| B221
B9 -->|after return| B10
B65["Continue at B66 in section 7"]
B154["Continue at B155 in section 16"]
B221["Continue at B222 in section 23"]
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
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
MOV IE,#10000001B
SETB IT0
MOV R3,#0
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
B10["B11: instructions - lines 45 to 46"]
B11["B12: instructions - lines 47 to 48"]
B12["B13: instructions - lines 49 to 49"]
B13["B14: instructions - lines 50 to 51"]
B14["B15: instructions - lines 52 to 52"]
B15["B16: OCCUR - lines 57 to 57"]
B16["B17: START - lines 61 to 61"]
B17["B18: instructions - lines 62 to 66"]
B18["B19: instructions - lines 67 to 68"]
B19["B20: instructions - lines 69 to 69"]
B10 -->|call| B174
B10 -->|after return| B11
B11 -->|call| B174
B11 -->|after return| B12
B12 -->|call| B186
B12 -->|after return| B13
B13 -->|call| B181
B13 -->|after return| B14
B14 -->|call| B221
B14 -->|after return| B15
B15 -->|condition true| B15
B15 -->|condition false| B16
B16 -->|call| B66
B16 -->|after return| B17
B17 -->|call| B190
B17 -->|after return| B18
B18 -->|call| B176
B18 -->|after return| B19
B19 -->|call| B221
B19 -->|after return| B20
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B221["Continue at B222 in section 23"]
B66["Continue at B67 in section 7"]
B190["Continue at B191 in section 20"]
B176["Continue at B177 in section 18"]
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
CJNE R3,#1,OCCUR
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
B20["B21: instructions - lines 71 to 71"]
B21["B22: instructions - lines 72 to 73"]
B22["B23: instructions - lines 74 to 75"]
B23["B24: instructions - lines 76 to 79"]
B24["B25: instructions - lines 80 to 81"]
B25["B26: SUBTRACT - lines 85 to 85"]
B26["B27: instructions - lines 86 to 87"]
B27["B28: instructions - lines 88 to 91"]
B28["B29: instructions - lines 92 to 93"]
B29["B30: MULTIPLICATION - lines 96 to 96"]
B20 -->|call| B79
B20 -->|after return| B21
B21 -->|condition true| B25
B21 -->|condition false| B22
B22 -->|call| B103
B22 -->|after return| B23
B23 -->|call| B122
B23 -->|after return| B24
B24 -->|jump| B47
B25 -->|condition true| B29
B25 -->|condition false| B26
B26 -->|call| B103
B26 -->|after return| B27
B27 -->|call| B122
B27 -->|after return| B28
B28 -->|jump| B47
B29 -->|condition true| B33
B29 -->|condition false| B30
B79["Continue at B80 in section 8"]
B103["Continue at B104 in section 11"]
B122["Continue at B123 in section 13"]
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
B30["B31: instructions - lines 97 to 98"]
B31["B32: instructions - lines 99 to 103"]
B32["B33: instructions - lines 104 to 105"]
B33["B34: DIVISION - lines 108 to 108"]
B34["B35: instructions - lines 109 to 110"]
B35["B36: instructions - lines 111 to 116"]
B36["B37: instructions - lines 117 to 117"]
B37["B38: instructions - lines 118 to 119"]
B38["B39: WRONG - lines 122 to 123"]
B39["B40: instructions - lines 124 to 124"]
B30 -->|call| B103
B30 -->|after return| B31
B31 -->|call| B122
B31 -->|after return| B32
B32 -->|jump| B47
B33 -->|condition true| B38
B33 -->|condition false| B34
B34 -->|call| B103
B34 -->|after return| B35
B35 -->|call| B122
B35 -->|after return| B36
B36 -->|call| B133
B36 -->|after return| B37
B37 -->|jump| B47
B38 -->|call| B221
B38 -->|after return| B39
B39 -->|call| B214
B39 -->|after return| B40
B103["Continue at B104 in section 11"]
B122["Continue at B123 in section 13"]
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B221["Continue at B222 in section 23"]
B214["Continue at B215 in section 22"]
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
B40["B41: instructions - lines 125 to 125"]
B41["B42: instructions - lines 126 to 127"]
B42["B43: instructions - lines 128 to 129"]
B43["B44: instructions - lines 130 to 130"]
B44["B45: instructions - lines 132 to 133"]
B45["B46: instructions - lines 134 to 134"]
B46["B47: instructions - lines 135 to 136"]
B47["B48: NEXT - lines 140 to 140"]
B48["B49: instructions - lines 141 to 142"]
B49["B50: instructions - lines 143 to 144"]
B40 -->|call| B221
B40 -->|after return| B41
B41 -->|call| B174
B41 -->|after return| B42
B42 -->|call| B174
B42 -->|after return| B43
B43 -->|call| B186
B43 -->|after return| B44
B44 -->|call| B181
B44 -->|after return| B45
B45 -->|call| B221
B45 -->|after return| B46
B46 -->|jump| B16
B47 -->|call| B141
B47 -->|after return| B48
B48 -->|call| B174
B48 -->|after return| B49
B49 -->|call| B174
B49 -->|after return| B50
B221["Continue at B222 in section 23"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B16["Continue at B17 in section 2"]
B141["Continue at B142 in section 15"]
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
MOV A,#8H
ACALL CMD
```

### B50

```asm
MOV A,#1110B
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 145 to 145"]
B51["B52: instructions - lines 146 to 146"]
B52["B53: instructions - lines 147 to 147"]
B53["B54: instructions - lines 148 to 148"]
B54["B55: instructions - lines 149 to 151"]
B55["B56: instructions - lines 153 to 153"]
B56["B57: instructions - lines 154 to 155"]
B57["B58: instructions - lines 156 to 157"]
B58["B59: instructions - lines 158 to 158"]
B59["B60: instructions - lines 159 to 160"]
B50 -->|call| B186
B50 -->|after return| B51
B51 -->|call| B190
B51 -->|after return| B52
B52 -->|call| B176
B52 -->|after return| B53
B53 -->|call| B221
B53 -->|after return| B54
B54 -->|condition true| B62
B54 -->|condition false| B55
B55 -->|call| B214
B55 -->|after return| B56
B56 -->|call| B174
B56 -->|after return| B57
B57 -->|call| B174
B57 -->|after return| B58
B58 -->|call| B186
B58 -->|after return| B59
B59 -->|call| B181
B59 -->|after return| B60
B186["Continue at B187 in section 19"]
B190["Continue at B191 in section 20"]
B176["Continue at B177 in section 18"]
B221["Continue at B222 in section 23"]
B62["Continue at B63 in section 7"]
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B181["Continue at B182 in section 19"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL LDELAY
```

### B52

```asm
ACALL KEYPAD
```

### B53

```asm
ACALL WCHR
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
SUBB A,#30H
MOV 60H,A
CJNE A,#2,START1
```

### B56

```asm
ACALL CLEAR
```

### B57

```asm
MOV A,#8H
ACALL CMD
```

### B58

```asm
MOV A,#0H
ACALL CMD
```

### B59

```asm
ACALL LDELAY
```

### B60

```asm
MOV DPTR, #STR13
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 161 to 161"]
B61["B62: instructions - lines 163 to 163"]
B62["B63: START1 - lines 164 to 164"]
B63["B64: STOPP - lines 166 to 166"]
B64["B65: instructions - lines 167 to 167"]
B65["B66: EX0ISR - lines 173 to 175"]
B66["B67: MENU - lines 182 to 182"]
B67["B68: instructions - lines 183 to 183"]
B68["B69: instructions - lines 184 to 185"]
B69["B70: instructions - lines 186 to 187"]
B60 -->|call| B221
B60 -->|after return| B61
B61 -->|jump| B63
B62 -->|jump| B16
B63 -->|jump| B63
B66 -->|call| B214
B66 -->|after return| B67
B67 -->|call| B221
B67 -->|after return| B68
B68 -->|call| B174
B68 -->|after return| B69
B69 -->|call| B174
B69 -->|after return| B70
B221["Continue at B222 in section 23"]
B16["Continue at B17 in section 2"]
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

```asm
SJMP STOPP
```

### B63

```asm
AJMP START
```

### B64

```asm
SJMP STOPP
```

### B65

Resume the interrupted program.

```asm
RETI
```

### B66

Resume the interrupted program.

```asm
MOV R3,#1
RETI
```

### B67

```asm
ACALL CLEAR
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
MOV A, #8H
ACALL CMD
```

### B70

```asm
MOV A, #0H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 188 to 188"]
B71["B72: instructions - lines 189 to 190"]
B72["B73: instructions - lines 191 to 191"]
B73["B74: instructions - lines 193 to 194"]
B74["B75: instructions - lines 195 to 196"]
B75["B76: instructions - lines 197 to 197"]
B76["B77: instructions - lines 198 to 199"]
B77["B78: instructions - lines 200 to 200"]
B78["B79: instructions - lines 201 to 201"]
B79["B80: SELECTION - lines 204 to 204"]
B70 -->|call| B186
B70 -->|after return| B71
B71 -->|call| B181
B71 -->|after return| B72
B72 -->|call| B221
B72 -->|after return| B73
B73 -->|call| B174
B73 -->|after return| B74
B74 -->|call| B174
B74 -->|after return| B75
B75 -->|call| B186
B75 -->|after return| B76
B76 -->|call| B181
B76 -->|after return| B77
B77 -->|call| B221
B77 -->|after return| B78
B79 -->|call| B221
B79 -->|after return| B80
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B221["Continue at B222 in section 23"]
B174["Continue at B175 in section 18"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL LDELAY
```

### B72

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
MOV A, #1100B
ACALL CMD
```

### B75

```asm
MOV A, #0H
ACALL CMD
```

### B76

```asm
ACALL LDELAY
```

### B77

```asm
MOV DPTR, #STR4
ACALL WSTR
```

### B78

```asm
ACALL DELAY
```

### B79

Return to the instruction following the active call.

```asm
RET
```

### B80

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 205 to 205"]
B81["B82: instructions - lines 206 to 207"]
B82["B83: instructions - lines 208 to 209"]
B83["B84: instructions - lines 210 to 210"]
B84["B85: instructions - lines 211 to 211"]
B85["B86: instructions - lines 212 to 213"]
B86["B87: instructions - lines 214 to 214"]
B87["B88: instructions - lines 215 to 217"]
B88["B89: instructions - lines 218 to 218"]
B89["B90: instructions - lines 219 to 220"]
B80 -->|call| B214
B80 -->|after return| B81
B81 -->|call| B174
B81 -->|after return| B82
B82 -->|call| B174
B82 -->|after return| B83
B83 -->|call| B186
B83 -->|after return| B84
B84 -->|call| B221
B84 -->|after return| B85
B85 -->|call| B181
B85 -->|after return| B86
B86 -->|call| B186
B86 -->|after return| B87
B87 -->|call| B176
B87 -->|after return| B88
B88 -->|call| B221
B88 -->|after return| B89
B89 -->|call| B174
B89 -->|after return| B90
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B221["Continue at B222 in section 23"]
B181["Continue at B182 in section 19"]
B176["Continue at B177 in section 18"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL CLEAR
```

### B82

```asm
MOV A, #8H
ACALL CMD
```

### B83

```asm
MOV A, #0H
ACALL CMD
```

### B84

```asm
ACALL LDELAY
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B87

```asm
ACALL LDELAY
```

### B88

```asm
MOV A,30H
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
B90["B91: instructions - lines 221 to 222"]
B91["B92: instructions - lines 223 to 223"]
B92["B93: instructions - lines 224 to 225"]
B93["B94: instructions - lines 226 to 227"]
B94["B95: SSUB - lines 229 to 229"]
B95["B96: instructions - lines 230 to 231"]
B96["B97: MMUL - lines 233 to 233"]
B97["B98: instructions - lines 234 to 235"]
B98["B99: DDIV - lines 237 to 237"]
B99["B100: instructions - lines 238 to 239"]
B90 -->|call| B174
B90 -->|after return| B91
B91 -->|call| B186
B91 -->|after return| B92
B92 -->|condition true| B94
B92 -->|condition false| B93
B93 -->|jump| B100
B94 -->|condition true| B96
B94 -->|condition false| B95
B95 -->|jump| B100
B96 -->|condition true| B98
B96 -->|condition false| B97
B97 -->|jump| B100
B98 -->|condition true| B102
B98 -->|condition false| B99
B99 -->|jump| B100
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B100["Continue at B101 in section 11"]
B102["Continue at B103 in section 11"]
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
MOV A,30H
CJNE A,#'1',SSUB
```

### B94

```asm
MOV DPTR, #STR14
SJMP NNEXT
```

### B95

```asm
CJNE A,#'2',MMUL
```

### B96

```asm
MOV DPTR, #STR15
SJMP NNEXT
```

### B97

```asm
CJNE A,#'3',DDIV
```

### B98

```asm
MOV DPTR, #STR16
SJMP NNEXT
```

### B99

```asm
CJNE A,#'4',NNNEXT
```

### B100

```asm
MOV DPTR, #STR17
SJMP NNEXT
```

## Section 11

```mermaid
flowchart TD
B100["B101: NNEXT - lines 241 to 241"]
B101["B102: instructions - lines 242 to 242"]
B102["B103: NNNEXT - lines 244 to 244"]
B103["B104: NUMBERS - lines 247 to 247"]
B104["B105: instructions - lines 248 to 248"]
B105["B106: instructions - lines 249 to 250"]
B106["B107: instructions - lines 251 to 252"]
B107["B108: instructions - lines 253 to 253"]
B108["B109: instructions - lines 254 to 255"]
B109["B110: instructions - lines 256 to 256"]
B100 -->|call| B181
B100 -->|after return| B101
B101 -->|call| B221
B101 -->|after return| B102
B103 -->|call| B221
B103 -->|after return| B104
B104 -->|call| B214
B104 -->|after return| B105
B105 -->|call| B174
B105 -->|after return| B106
B106 -->|call| B174
B106 -->|after return| B107
B107 -->|call| B186
B107 -->|after return| B108
B108 -->|call| B181
B108 -->|after return| B109
B109 -->|call| B221
B109 -->|after return| B110
B181["Continue at B182 in section 19"]
B221["Continue at B222 in section 23"]
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL WSTR
```

### B102

```asm
ACALL DELAY
```

### B103

Return to the instruction following the active call.

```asm
RET
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
ACALL CLEAR
```

### B106

```asm
MOV A, #8H
ACALL CMD
```

### B107

```asm
MOV A, #0H
ACALL CMD
```

### B108

```asm
ACALL LDELAY
```

### B109

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B110

```asm
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 258 to 258"]
B111["B112: instructions - lines 259 to 259"]
B112["B113: instructions - lines 260 to 262"]
B113["B114: instructions - lines 264 to 265"]
B114["B115: instructions - lines 266 to 267"]
B115["B116: instructions - lines 268 to 268"]
B116["B117: instructions - lines 269 to 270"]
B117["B118: instructions - lines 271 to 271"]
B118["B119: instructions - lines 273 to 273"]
B119["B120: instructions - lines 274 to 274"]
B110 -->|call| B190
B110 -->|after return| B111
B111 -->|call| B176
B111 -->|after return| B112
B112 -->|call| B221
B112 -->|after return| B113
B113 -->|call| B174
B113 -->|after return| B114
B114 -->|call| B174
B114 -->|after return| B115
B115 -->|call| B186
B115 -->|after return| B116
B116 -->|call| B181
B116 -->|after return| B117
B117 -->|call| B221
B117 -->|after return| B118
B118 -->|call| B190
B118 -->|after return| B119
B119 -->|call| B176
B119 -->|after return| B120
B190["Continue at B191 in section 20"]
B176["Continue at B177 in section 18"]
B221["Continue at B222 in section 23"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL KEYPAD
```

### B112

```asm
ACALL WCHR
```

### B113

```asm
SUBB A,#30H
MOV 40H,A
ACALL DELAY
```

### B114

```asm
MOV A, #1100B
ACALL CMD
```

### B115

```asm
MOV A, #0H
ACALL CMD
```

### B116

```asm
ACALL LDELAY
```

### B117

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B118

```asm
ACALL DELAY
```

### B119

```asm
ACALL KEYPAD
```

### B120

```asm
ACALL WCHR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 275 to 277"]
B121["B122: instructions - lines 278 to 278"]
B122["B123: RESULTS - lines 281 to 281"]
B123["B124: instructions - lines 282 to 282"]
B124["B125: instructions - lines 283 to 284"]
B125["B126: instructions - lines 285 to 286"]
B126["B127: instructions - lines 287 to 287"]
B127["B128: instructions - lines 288 to 289"]
B128["B129: instructions - lines 290 to 290"]
B129["B130: instructions - lines 291 to 295"]
B120 -->|call| B221
B120 -->|after return| B121
B122 -->|call| B221
B122 -->|after return| B123
B123 -->|call| B214
B123 -->|after return| B124
B124 -->|call| B174
B124 -->|after return| B125
B125 -->|call| B174
B125 -->|after return| B126
B126 -->|call| B186
B126 -->|after return| B127
B127 -->|call| B181
B127 -->|after return| B128
B128 -->|call| B221
B128 -->|after return| B129
B129 -->|call| B176
B129 -->|after return| B130
B221["Continue at B222 in section 23"]
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B176["Continue at B177 in section 18"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
SUBB A,#30H
MOV 41H,A
ACALL DELAY
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

```asm
ACALL DELAY
```

### B124

```asm
ACALL CLEAR
```

### B125

```asm
MOV A, #8H
ACALL CMD
```

### B126

```asm
MOV A, #0H
ACALL CMD
```

### B127

```asm
ACALL LDELAY
```

### B128

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 296 to 298"]
B131["B132: instructions - lines 299 to 299"]
B132["B133: instructions - lines 300 to 300"]
B133["B134: REMINDER - lines 304 to 305"]
B134["B135: instructions - lines 306 to 307"]
B135["B136: instructions - lines 308 to 308"]
B136["B137: instructions - lines 309 to 310"]
B137["B138: instructions - lines 311 to 311"]
B138["B139: instructions - lines 312 to 314"]
B139["B140: instructions - lines 315 to 315"]
B130 -->|call| B176
B130 -->|after return| B131
B131 -->|call| B221
B131 -->|after return| B132
B133 -->|call| B174
B133 -->|after return| B134
B134 -->|call| B174
B134 -->|after return| B135
B135 -->|call| B186
B135 -->|after return| B136
B136 -->|call| B181
B136 -->|after return| B137
B137 -->|call| B221
B137 -->|after return| B138
B138 -->|call| B176
B138 -->|after return| B139
B139 -->|call| B221
B139 -->|after return| B140
B176["Continue at B177 in section 18"]
B221["Continue at B222 in section 23"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B132

```asm
ACALL DELAY
```

### B133

Return to the instruction following the active call.

```asm
RET
```

### B134

```asm
MOV A, #1100B
ACALL CMD
```

### B135

```asm
MOV A, #0H
ACALL CMD
```

### B136

```asm
ACALL LDELAY
```

### B137

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B138

```asm
ACALL DELAY
```

### B139

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B140

```asm
ACALL DELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 316 to 316"]
B141["B142: CONTINUE - lines 319 to 319"]
B142["B143: instructions - lines 320 to 321"]
B143["B144: instructions - lines 322 to 323"]
B144["B145: instructions - lines 324 to 324"]
B145["B146: instructions - lines 325 to 326"]
B146["B147: instructions - lines 327 to 327"]
B147["B148: instructions - lines 329 to 330"]
B148["B149: instructions - lines 331 to 332"]
B149["B150: instructions - lines 333 to 333"]
B141 -->|call| B214
B141 -->|after return| B142
B142 -->|call| B174
B142 -->|after return| B143
B143 -->|call| B174
B143 -->|after return| B144
B144 -->|call| B186
B144 -->|after return| B145
B145 -->|call| B181
B145 -->|after return| B146
B146 -->|call| B221
B146 -->|after return| B147
B147 -->|call| B174
B147 -->|after return| B148
B148 -->|call| B174
B148 -->|after return| B149
B149 -->|call| B186
B149 -->|after return| B150
B214["Continue at B215 in section 22"]
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B181["Continue at B182 in section 19"]
B221["Continue at B222 in section 23"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
RET
```

### B142

```asm
ACALL CLEAR
```

### B143

```asm
MOV A, #8H
ACALL CMD
```

### B144

```asm
MOV A, #0H
ACALL CMD
```

### B145

```asm
ACALL LDELAY
```

### B146

```asm
MOV DPTR, #STR11
ACALL WSTR
```

### B147

```asm
ACALL DELAY
```

### B148

```asm
MOV A, #1100B
ACALL CMD
```

### B149

```asm
MOV A, #0H
ACALL CMD
```

### B150

```asm
ACALL LDELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 334 to 335"]
B151["B152: instructions - lines 336 to 336"]
B152["B153: instructions - lines 338 to 338"]
B153["B154: INIT - lines 342 to 349"]
B154["B155: INLCD - lines 354 to 355"]
B155["B156: WAIT - lines 357 to 357"]
B156["B157: instructions - lines 358 to 358"]
B157["B158: instructions - lines 359 to 361"]
B158["B159: instructions - lines 362 to 362"]
B159["B160: instructions - lines 363 to 364"]
B150 -->|call| B181
B150 -->|after return| B151
B151 -->|call| B221
B151 -->|after return| B152
B154 -->|next| B155
B155 -->|call| B186
B155 -->|after return| B156
B156 -->|condition true| B155
B156 -->|condition false| B157
B157 -->|call| B174
B157 -->|after return| B158
B158 -->|call| B186
B158 -->|after return| B159
B159 -->|call| B174
B159 -->|after return| B160
B181["Continue at B182 in section 19"]
B221["Continue at B222 in section 23"]
B186["Continue at B187 in section 19"]
B174["Continue at B175 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV DPTR, #STR12
ACALL WSTR
```

### B152

```asm
ACALL DELAY
```

### B153

Return to the instruction following the active call.

```asm
RET
```

### B154

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

### B155

```asm
PUSH 7
MOV R7,#20
```

### B156

```asm
ACALL LDELAY
```

### B157

```asm
DJNZ R7,WAIT
```

### B158

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B159

```asm
ACALL LDELAY
```

### B160

```asm
MOV A,#0011B
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 365 to 366"]
B161["B162: instructions - lines 367 to 368"]
B162["B163: instructions - lines 369 to 370"]
B163["B164: instructions - lines 371 to 372"]
B164["B165: instructions - lines 373 to 374"]
B165["B166: instructions - lines 375 to 376"]
B166["B167: instructions - lines 377 to 378"]
B167["B168: instructions - lines 379 to 380"]
B168["B169: instructions - lines 381 to 381"]
B169["B170: instructions - lines 382 to 383"]
B160 -->|call| B174
B160 -->|after return| B161
B161 -->|call| B174
B161 -->|after return| B162
B162 -->|call| B174
B162 -->|after return| B163
B163 -->|call| B174
B163 -->|after return| B164
B164 -->|call| B174
B164 -->|after return| B165
B165 -->|call| B174
B165 -->|after return| B166
B166 -->|call| B174
B166 -->|after return| B167
B167 -->|call| B174
B167 -->|after return| B168
B168 -->|call| B186
B168 -->|after return| B169
B169 -->|call| B174
B169 -->|after return| B170
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#0011B
ACALL CMD
```

### B162

```asm
MOV A,#0010B
ACALL CMD
```

### B163

```asm
MOV A,#0010B
ACALL CMD
```

### B164

```asm
MOV A,#1000B
ACALL CMD
```

### B165

```asm
MOV A,#0000B
ACALL CMD
```

### B166

```asm
MOV A,#1000B
ACALL CMD
```

### B167

```asm
MOV A,#0
ACALL CMD
```

### B168

```asm
MOV A,#0001B
ACALL CMD
```

### B169

```asm
ACALL LDELAY
```

### B170

```asm
MOV A,#0000B
ACALL CMD
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 384 to 385"]
B171["B172: instructions - lines 386 to 387"]
B172["B173: instructions - lines 388 to 389"]
B173["B174: instructions - lines 390 to 391"]
B174["B175: CMD - lines 396 to 397"]
B175["B176: instructions - lines 398 to 398"]
B176["B177: WCHR - lines 403 to 408"]
B177["B178: instructions - lines 409 to 410"]
B178["B179: instructions - lines 411 to 413"]
B179["B180: COMMON - lines 418 to 425"]
B170 -->|call| B174
B170 -->|after return| B171
B171 -->|call| B174
B171 -->|after return| B172
B172 -->|call| B174
B172 -->|after return| B173
B174 -->|call| B179
B174 -->|after return| B175
B176 -->|call| B179
B176 -->|after return| B177
B177 -->|call| B179
B177 -->|after return| B178
B179 -->|call| B186
B179 -->|after return| B180
B186["Continue at B187 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV A,#0110B
ACALL CMD
```

### B172

```asm
MOV A,#0000B
ACALL CMD
```

### B173

```asm
MOV A,#1111B
ACALL CMD
```

### B174

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B175

```asm
CLR RS
ACALL COMMON
```

### B176

Return to the instruction following the active call.

```asm
RET
```

### B177

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B178

```asm
MOV A,B
ACALL COMMON
```

### B179

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B180

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

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 426 to 426"]
B181["B182: WSTR - lines 431 to 431"]
B182["B183: CONT1 - lines 432 to 434"]
B183["B184: instructions - lines 435 to 435"]
B184["B185: instructions - lines 437 to 438"]
B185["B186: EXIT1 - lines 440 to 441"]
B186["B187: LDELAY - lines 446 to 448"]
B187["B188: CON4 - lines 449 to 450"]
B188["B189: instructions - lines 451 to 451"]
B189["B190: instructions - lines 452 to 454"]
B181 -->|next| B182
B182 -->|condition true| B185
B182 -->|condition false| B183
B183 -->|call| B176
B183 -->|after return| B184
B184 -->|jump| B182
B186 -->|next| B187
B187 -->|condition true| B187
B187 -->|condition false| B188
B188 -->|condition true| B187
B188 -->|condition false| B189
B176["Continue at B177 in section 18"]
```

### B181

Return to the instruction following the active call.

```asm
RET
```

### B182

```asm
PUSH ACC
```

### B183

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B184

```asm
ACALL WCHR
```

### B185

```asm
INC DPTR
AJMP CONT1
```

### B186

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B187

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B188

```asm
MOV R0,#250
DJNZ R0,$
```

### B189

```asm
DJNZ R1,CON4
```

### B190

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

## Section 20

```mermaid
flowchart TD
B190["B191: KEYPAD - lines 458 to 458"]
B191["B192: K1 - lines 459 to 462"]
B192["B193: K2 - lines 463 to 463"]
B193["B194: instructions - lines 464 to 466"]
B194["B195: instructions - lines 467 to 467"]
B195["B196: OVER - lines 469 to 469"]
B196["B197: instructions - lines 470 to 472"]
B197["B198: instructions - lines 473 to 473"]
B198["B199: OVER1 - lines 475 to 478"]
B199["B200: instructions - lines 479 to 482"]
B190 -->|next| B191
B191 -->|condition true| B191
B191 -->|condition false| B192
B192 -->|call| B211
B192 -->|after return| B193
B193 -->|condition true| B195
B193 -->|condition false| B194
B194 -->|jump| B192
B195 -->|call| B211
B195 -->|after return| B196
B196 -->|condition true| B198
B196 -->|condition false| B197
B197 -->|jump| B192
B198 -->|condition true| B203
B198 -->|condition false| B199
B199 -->|condition true| B204
B199 -->|condition false| B200
B211["Continue at B212 in section 22"]
B203["Continue at B204 in section 21"]
B204["Continue at B205 in section 21"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV P2,#11110000B
```

### B192

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B193

```asm
ACALL TMSEC
```

### B194

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B195

```asm
SJMP K2
```

### B196

```asm
ACALL TMSEC
```

### B197

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B198

```asm
SJMP K2
```

### B199

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B200

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 483 to 486"]
B201["B202: instructions - lines 487 to 490"]
B202["B203: instructions - lines 491 to 491"]
B203["B204: ROW_0 - lines 492 to 493"]
B204["B205: ROW_1 - lines 494 to 495"]
B205["B206: ROW_2 - lines 496 to 497"]
B206["B207: ROW_3 - lines 498 to 498"]
B207["B208: FIND - lines 500 to 500"]
B208["B209: FIND1 - lines 502 to 503"]
B209["B210: instructions - lines 504 to 505"]
B200 -->|condition true| B205
B200 -->|condition false| B201
B201 -->|condition true| B206
B201 -->|condition false| B202
B202 -->|jump| B192
B203 -->|jump| B207
B204 -->|jump| B207
B205 -->|jump| B207
B206 -->|next| B207
B207 -->|next| B208
B208 -->|condition true| B210
B208 -->|condition false| B209
B209 -->|jump| B208
B192["Continue at B193 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B202

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B203

```asm
LJMP K2
```

### B204

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B205

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B206

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B207

```asm
MOV DPTR,#KCODE3
```

### B208

```asm
SWAP A
```

### B209

```asm
RRC A
JNC MATCH
```

### B210

```asm
INC DPTR
SJMP FIND1
```

## Section 22

```mermaid
flowchart TD
B210["B211: MATCH - lines 507 to 509"]
B211["B212: TMSEC - lines 514 to 517"]
B212["B213: BACK - lines 519 to 519"]
B213["B214: instructions - lines 520 to 522"]
B214["B215: CLEAR - lines 526 to 527"]
B215["B216: instructions - lines 528 to 529"]
B216["B217: instructions - lines 530 to 530"]
B217["B218: instructions - lines 531 to 531"]
B218["B219: WAITT - lines 532 to 532"]
B219["B220: instructions - lines 533 to 533"]
B211 -->|next| B212
B212 -->|condition true| B212
B212 -->|condition false| B213
B214 -->|call| B174
B214 -->|after return| B215
B215 -->|call| B174
B215 -->|after return| B216
B216 -->|call| B186
B216 -->|after return| B217
B217 -->|next| B218
B218 -->|call| B186
B218 -->|after return| B219
B219 -->|condition true| B218
B219 -->|condition false| B220
B174["Continue at B175 in section 18"]
B186["Continue at B187 in section 19"]
B220["Continue at B221 in section 23"]
```

### B211

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B212

```asm
MOV TMOD,#21H
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B213

```asm
JNB TF0,BACK
```

### B214

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B215

```asm
MOV A,#0H
ACALL CMD
```

### B216

```asm
MOV A,#1H
ACALL CMD
```

### B217

```asm
ACALL LDELAY
```

### B218

```asm
MOV R7,#14
```

### B219

```asm
ACALL LDELAY
```

### B220

```asm
DJNZ R7,WAITT
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 534 to 534"]
B221["B222: DELAY - lines 538 to 538"]
B222["B223: HH - lines 540 to 540"]
B223["B224: instructions - lines 541 to 541"]
B224["B225: instructions - lines 542 to 542"]
B221 -->|next| B222
B222 -->|call| B186
B222 -->|after return| B223
B223 -->|condition true| B222
B223 -->|condition false| B224
B186["Continue at B187 in section 19"]
```

### B221

Return to the instruction following the active call.

```asm
RET
```

### B222

```asm
MOV R5,#170
```

### B223

```asm
ACALL LDELAY
```

### B224

```asm
DJNZ R5,HH
```

### B225

Return to the instruction following the active call.

```asm
RET
```
