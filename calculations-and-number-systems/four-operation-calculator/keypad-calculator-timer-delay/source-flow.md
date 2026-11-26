# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 12 to 24"]
B1["B2: instructions - lines 26 to 26"]
B2["B3: instructions - lines 27 to 27"]
B3["B4: instructions - lines 28 to 29"]
B4["B5: instructions - lines 30 to 31"]
B5["B6: instructions - lines 32 to 32"]
B6["B7: instructions - lines 34 to 35"]
B7["B8: instructions - lines 36 to 36"]
B8["B9: instructions - lines 38 to 39"]
B9["B10: instructions - lines 40 to 41"]
B0 -->|call| B147
B0 -->|after return| B1
B1 -->|call| B214
B1 -->|after return| B2
B2 -->|call| B207
B2 -->|after return| B3
B3 -->|call| B167
B3 -->|after return| B4
B4 -->|call| B167
B4 -->|after return| B5
B5 -->|call| B179
B5 -->|after return| B6
B6 -->|call| B174
B6 -->|after return| B7
B7 -->|call| B214
B7 -->|after return| B8
B8 -->|call| B167
B8 -->|after return| B9
B9 -->|call| B167
B9 -->|after return| B10
B147["Continue at B148 in section 15"]
B214["Continue at B215 in section 22"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#0
MOV 40H,#0
MOV 41H,#0
MOV 50H,#00
MOV 51H,#00
MOV 60H,#02
ACALL INLCD
```

### B2

```asm
ACALL DELAY
```

### B3

```asm
ACALL CLEAR
```

### B4

```asm
MOV A, #8H
ACALL CMD
```

### B5

```asm
MOV A, #0H
ACALL CMD
```

### B6

```asm
ACALL LDELAY
```

### B7

```asm
MOV DPTR, #STR1
ACALL WSTR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
MOV A, #1100B
ACALL CMD
```

### B10

```asm
MOV A, #0H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 42 to 42"]
B11["B12: instructions - lines 43 to 44"]
B12["B13: instructions - lines 45 to 45"]
B13["B14: SSTART - lines 49 to 49"]
B14["B15: instructions - lines 50 to 54"]
B15["B16: instructions - lines 55 to 56"]
B16["B17: instructions - lines 57 to 57"]
B17["B18: instructions - lines 59 to 59"]
B18["B19: instructions - lines 60 to 61"]
B19["B20: instructions - lines 62 to 63"]
B10 -->|call| B179
B10 -->|after return| B11
B11 -->|call| B174
B11 -->|after return| B12
B12 -->|call| B214
B12 -->|after return| B13
B13 -->|call| B57
B13 -->|after return| B14
B14 -->|call| B183
B14 -->|after return| B15
B15 -->|call| B169
B15 -->|after return| B16
B16 -->|call| B214
B16 -->|after return| B17
B17 -->|call| B70
B17 -->|after return| B18
B18 -->|condition true| B22
B18 -->|condition false| B19
B19 -->|call| B94
B19 -->|after return| B20
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B214["Continue at B215 in section 22"]
B57["Continue at B58 in section 6"]
B183["Continue at B184 in section 19"]
B169["Continue at B170 in section 17"]
B70["Continue at B71 in section 8"]
B22["Continue at B23 in section 3"]
B94["Continue at B95 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL LDELAY
```

### B12

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
ACALL MENU
```

### B15

```asm
SETB G
SETB Y
SETB R
ACALL KEYPAD
```

### B16

```asm
MOV 30H,A
ACALL WCHR
```

### B17

```asm
ACALL DELAY
```

### B18

```asm
ACALL SELECTION
```

### B19

```asm
MOV A,30H
CJNE A,#'1',SUBTRACT
```

### B20

```asm
CLR G
ACALL NUMBERS
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 64 to 67"]
B21["B22: instructions - lines 68 to 69"]
B22["B23: SUBTRACT - lines 73 to 73"]
B23["B24: instructions - lines 74 to 75"]
B24["B25: instructions - lines 76 to 79"]
B25["B26: instructions - lines 80 to 81"]
B26["B27: MULTIPLICATION - lines 84 to 84"]
B27["B28: instructions - lines 85 to 86"]
B28["B29: instructions - lines 87 to 91"]
B29["B30: instructions - lines 92 to 93"]
B20 -->|call| B113
B20 -->|after return| B21
B21 -->|jump| B44
B22 -->|condition true| B26
B22 -->|condition false| B23
B23 -->|call| B94
B23 -->|after return| B24
B24 -->|call| B113
B24 -->|after return| B25
B25 -->|jump| B44
B26 -->|condition true| B30
B26 -->|condition false| B27
B27 -->|call| B94
B27 -->|after return| B28
B28 -->|call| B113
B28 -->|after return| B29
B29 -->|jump| B44
B113["Continue at B114 in section 12"]
B44["Continue at B45 in section 5"]
B94["Continue at B95 in section 10"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,40H
ADD A,41H
MOV 50H,A
ACALL RESULTS
```

### B22

```asm
SETB G
SJMP NEXT
```

### B23

```asm
CJNE A,#'2',MULTIPLICATION
```

### B24

```asm
CLR G
ACALL NUMBERS
```

### B25

```asm
MOV A,40H
SUBB A,41H
MOV 50H,A
ACALL RESULTS
```

### B26

```asm
SETB G
SJMP NEXT
```

### B27

```asm
CJNE A,#'3',DIVISION
```

### B28

```asm
CLR G
ACALL NUMBERS
```

### B29

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV 50H,A
ACALL RESULTS
```

### B30

```asm
SETB G
SJMP NEXT
```

## Section 4

```mermaid
flowchart TD
B30["B31: DIVISION - lines 96 to 96"]
B31["B32: instructions - lines 97 to 98"]
B32["B33: instructions - lines 99 to 104"]
B33["B34: instructions - lines 105 to 105"]
B34["B35: instructions - lines 106 to 107"]
B35["B36: WRONG - lines 110 to 111"]
B36["B37: instructions - lines 112 to 112"]
B37["B38: instructions - lines 113 to 113"]
B38["B39: instructions - lines 114 to 115"]
B39["B40: instructions - lines 116 to 117"]
B30 -->|condition true| B35
B30 -->|condition false| B31
B31 -->|call| B94
B31 -->|after return| B32
B32 -->|call| B113
B32 -->|after return| B33
B33 -->|call| B124
B33 -->|after return| B34
B34 -->|jump| B44
B35 -->|call| B214
B35 -->|after return| B36
B36 -->|call| B207
B36 -->|after return| B37
B37 -->|call| B214
B37 -->|after return| B38
B38 -->|call| B167
B38 -->|after return| B39
B39 -->|call| B167
B39 -->|after return| B40
B94["Continue at B95 in section 10"]
B113["Continue at B114 in section 12"]
B124["Continue at B125 in section 13"]
B44["Continue at B45 in section 5"]
B214["Continue at B215 in section 22"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#'4',WRONG
```

### B32

```asm
CLR G
ACALL NUMBERS
```

### B33

```asm
MOV A,40H
MOV B,41H
DIV AB
MOV 50H,A
MOV 51H,B
ACALL RESULTS
```

### B34

```asm
ACALL REMINDER
```

### B35

```asm
SETB G
SJMP NEXT
```

### B36

```asm
CLR R
ACALL DELAY
```

### B37

```asm
ACALL CLEAR
```

### B38

```asm
ACALL DELAY
```

### B39

```asm
MOV A, #8H
ACALL CMD
```

### B40

```asm
MOV A, #0H
ACALL CMD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 118 to 118"]
B41["B42: instructions - lines 120 to 121"]
B42["B43: instructions - lines 122 to 122"]
B43["B44: instructions - lines 123 to 124"]
B44["B45: NEXT - lines 128 to 128"]
B45["B46: instructions - lines 129 to 130"]
B46["B47: instructions - lines 131 to 131"]
B47["B48: instructions - lines 132 to 134"]
B48["B49: instructions - lines 136 to 136"]
B49["B50: instructions - lines 137 to 138"]
B40 -->|call| B179
B40 -->|after return| B41
B41 -->|call| B174
B41 -->|after return| B42
B42 -->|call| B214
B42 -->|after return| B43
B43 -->|jump| B55
B44 -->|call| B132
B44 -->|after return| B45
B45 -->|call| B183
B45 -->|after return| B46
B46 -->|call| B169
B46 -->|after return| B47
B47 -->|condition true| B55
B47 -->|condition false| B48
B48 -->|call| B207
B48 -->|after return| B49
B49 -->|call| B167
B49 -->|after return| B50
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B214["Continue at B215 in section 22"]
B55["Continue at B56 in section 6"]
B132["Continue at B133 in section 14"]
B183["Continue at B184 in section 19"]
B169["Continue at B170 in section 17"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL LDELAY
```

### B42

```asm
MOV DPTR, #STR10
ACALL WSTR
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
SETB R
AJMP STARTT
```

### B45

```asm
ACALL CONTINUE
```

### B46

```asm
MOV A,60H
ACALL KEYPAD
```

### B47

```asm
ACALL WCHR
```

### B48

```asm
SUBB A,#30H
MOV 60H,A
CJNE A,#2,STARTT
```

### B49

```asm
ACALL CLEAR
```

### B50

```asm
MOV A, #8H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 139 to 140"]
B51["B52: instructions - lines 141 to 141"]
B52["B53: instructions - lines 142 to 143"]
B53["B54: instructions - lines 144 to 144"]
B54["B55: instructions - lines 145 to 145"]
B55["B56: STARTT - lines 146 to 146"]
B56["B57: STOPP - lines 148 to 148"]
B57["B58: MENU - lines 155 to 155"]
B58["B59: instructions - lines 156 to 156"]
B59["B60: instructions - lines 157 to 158"]
B50 -->|call| B167
B50 -->|after return| B51
B51 -->|call| B179
B51 -->|after return| B52
B52 -->|call| B174
B52 -->|after return| B53
B53 -->|call| B214
B53 -->|after return| B54
B54 -->|jump| B56
B55 -->|jump| B13
B56 -->|jump| B56
B57 -->|call| B207
B57 -->|after return| B58
B58 -->|call| B214
B58 -->|after return| B59
B59 -->|call| B167
B59 -->|after return| B60
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B214["Continue at B215 in section 22"]
B13["Continue at B14 in section 2"]
B207["Continue at B208 in section 21"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A, #0H
ACALL CMD
```

### B52

```asm
ACALL LDELAY
```

### B53

```asm
MOV DPTR, #STR13
ACALL WSTR
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
SJMP STOPP
```

### B56

```asm
AJMP SSTART
```

### B57

```asm
SJMP STOPP
```

### B58

```asm
ACALL CLEAR
```

### B59

```asm
ACALL DELAY
```

### B60

```asm
MOV A, #8H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 159 to 160"]
B61["B62: instructions - lines 161 to 161"]
B62["B63: instructions - lines 162 to 163"]
B63["B64: instructions - lines 164 to 164"]
B64["B65: instructions - lines 166 to 167"]
B65["B66: instructions - lines 168 to 169"]
B66["B67: instructions - lines 170 to 170"]
B67["B68: instructions - lines 171 to 172"]
B68["B69: instructions - lines 173 to 173"]
B69["B70: instructions - lines 174 to 174"]
B60 -->|call| B167
B60 -->|after return| B61
B61 -->|call| B179
B61 -->|after return| B62
B62 -->|call| B174
B62 -->|after return| B63
B63 -->|call| B214
B63 -->|after return| B64
B64 -->|call| B167
B64 -->|after return| B65
B65 -->|call| B167
B65 -->|after return| B66
B66 -->|call| B179
B66 -->|after return| B67
B67 -->|call| B174
B67 -->|after return| B68
B68 -->|call| B214
B68 -->|after return| B69
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B214["Continue at B215 in section 22"]
```

### B61

```asm
MOV A, #0H
ACALL CMD
```

### B62

```asm
ACALL LDELAY
```

### B63

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B64

```asm
ACALL DELAY
```

### B65

```asm
MOV A, #1100B
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
MOV DPTR, #STR4
ACALL WSTR
```

### B69

```asm
ACALL DELAY
```

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: SELECTION - lines 177 to 177"]
B71["B72: instructions - lines 178 to 178"]
B72["B73: instructions - lines 179 to 180"]
B73["B74: instructions - lines 181 to 182"]
B74["B75: instructions - lines 183 to 183"]
B75["B76: instructions - lines 184 to 184"]
B76["B77: instructions - lines 185 to 186"]
B77["B78: instructions - lines 187 to 187"]
B78["B79: instructions - lines 188 to 190"]
B79["B80: instructions - lines 191 to 191"]
B70 -->|call| B214
B70 -->|after return| B71
B71 -->|call| B207
B71 -->|after return| B72
B72 -->|call| B167
B72 -->|after return| B73
B73 -->|call| B167
B73 -->|after return| B74
B74 -->|call| B179
B74 -->|after return| B75
B75 -->|call| B214
B75 -->|after return| B76
B76 -->|call| B174
B76 -->|after return| B77
B77 -->|call| B179
B77 -->|after return| B78
B78 -->|call| B169
B78 -->|after return| B79
B79 -->|call| B214
B79 -->|after return| B80
B214["Continue at B215 in section 22"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B169["Continue at B170 in section 17"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
ACALL CLEAR
```

### B73

```asm
MOV A, #8H
ACALL CMD
```

### B74

```asm
MOV A, #0H
ACALL CMD
```

### B75

```asm
ACALL LDELAY
```

### B76

```asm
ACALL DELAY
```

### B77

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B78

```asm
ACALL LDELAY
```

### B79

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B80

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 192 to 193"]
B81["B82: instructions - lines 194 to 195"]
B82["B83: instructions - lines 196 to 196"]
B83["B84: instructions - lines 197 to 198"]
B84["B85: instructions - lines 199 to 200"]
B85["B86: SSUB - lines 202 to 202"]
B86["B87: instructions - lines 203 to 204"]
B87["B88: MMUL - lines 206 to 206"]
B88["B89: instructions - lines 207 to 208"]
B89["B90: DDIV - lines 210 to 210"]
B80 -->|call| B167
B80 -->|after return| B81
B81 -->|call| B167
B81 -->|after return| B82
B82 -->|call| B179
B82 -->|after return| B83
B83 -->|condition true| B85
B83 -->|condition false| B84
B84 -->|jump| B91
B85 -->|condition true| B87
B85 -->|condition false| B86
B86 -->|jump| B91
B87 -->|condition true| B89
B87 -->|condition false| B88
B88 -->|jump| B91
B89 -->|condition true| B93
B89 -->|condition false| B90
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B91["Continue at B92 in section 10"]
B93["Continue at B94 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A, #1100B
ACALL CMD
```

### B82

```asm
MOV A, #0H
ACALL CMD
```

### B83

```asm
ACALL LDELAY
```

### B84

```asm
MOV A,30H
CJNE A,#'1',SSUB
```

### B85

```asm
MOV DPTR, #STR14
SJMP NNEXT
```

### B86

```asm
CJNE A,#'2',MMUL
```

### B87

```asm
MOV DPTR, #STR15
SJMP NNEXT
```

### B88

```asm
CJNE A,#'3',DDIV
```

### B89

```asm
MOV DPTR, #STR16
SJMP NNEXT
```

### B90

```asm
CJNE A,#'4',NNNEXT
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 211 to 212"]
B91["B92: NNEXT - lines 214 to 214"]
B92["B93: instructions - lines 215 to 215"]
B93["B94: NNNEXT - lines 217 to 217"]
B94["B95: NUMBERS - lines 220 to 220"]
B95["B96: instructions - lines 221 to 221"]
B96["B97: instructions - lines 222 to 223"]
B97["B98: instructions - lines 224 to 225"]
B98["B99: instructions - lines 226 to 226"]
B99["B100: instructions - lines 227 to 228"]
B90 -->|jump| B91
B91 -->|call| B174
B91 -->|after return| B92
B92 -->|call| B214
B92 -->|after return| B93
B94 -->|call| B214
B94 -->|after return| B95
B95 -->|call| B207
B95 -->|after return| B96
B96 -->|call| B167
B96 -->|after return| B97
B97 -->|call| B167
B97 -->|after return| B98
B98 -->|call| B179
B98 -->|after return| B99
B99 -->|call| B174
B99 -->|after return| B100
B174["Continue at B175 in section 18"]
B214["Continue at B215 in section 22"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV DPTR, #STR17
SJMP NNEXT
```

### B92

```asm
ACALL WSTR
```

### B93

```asm
ACALL DELAY
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
ACALL DELAY
```

### B96

```asm
ACALL CLEAR
```

### B97

```asm
MOV A, #8H
ACALL CMD
```

### B98

```asm
MOV A, #0H
ACALL CMD
```

### B99

```asm
ACALL LDELAY
```

### B100

```asm
MOV DPTR, #STR6
ACALL WSTR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 229 to 229"]
B101["B102: instructions - lines 231 to 231"]
B102["B103: instructions - lines 232 to 232"]
B103["B104: instructions - lines 233 to 235"]
B104["B105: instructions - lines 237 to 238"]
B105["B106: instructions - lines 239 to 240"]
B106["B107: instructions - lines 241 to 241"]
B107["B108: instructions - lines 242 to 243"]
B108["B109: instructions - lines 244 to 244"]
B109["B110: instructions - lines 246 to 246"]
B100 -->|call| B214
B100 -->|after return| B101
B101 -->|call| B183
B101 -->|after return| B102
B102 -->|call| B169
B102 -->|after return| B103
B103 -->|call| B214
B103 -->|after return| B104
B104 -->|call| B167
B104 -->|after return| B105
B105 -->|call| B167
B105 -->|after return| B106
B106 -->|call| B179
B106 -->|after return| B107
B107 -->|call| B174
B107 -->|after return| B108
B108 -->|call| B214
B108 -->|after return| B109
B109 -->|call| B183
B109 -->|after return| B110
B214["Continue at B215 in section 22"]
B183["Continue at B184 in section 19"]
B169["Continue at B170 in section 17"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL DELAY
```

### B102

```asm
ACALL KEYPAD
```

### B103

```asm
ACALL WCHR
```

### B104

```asm
SUBB A,#30H
MOV 40H,A
ACALL DELAY
```

### B105

```asm
MOV A, #1100B
ACALL CMD
```

### B106

```asm
MOV A, #0H
ACALL CMD
```

### B107

```asm
ACALL LDELAY
```

### B108

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B109

```asm
ACALL DELAY
```

### B110

```asm
ACALL KEYPAD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 247 to 247"]
B111["B112: instructions - lines 248 to 250"]
B112["B113: instructions - lines 251 to 251"]
B113["B114: RESULTS - lines 254 to 254"]
B114["B115: instructions - lines 255 to 255"]
B115["B116: instructions - lines 256 to 257"]
B116["B117: instructions - lines 258 to 259"]
B117["B118: instructions - lines 260 to 260"]
B118["B119: instructions - lines 261 to 262"]
B119["B120: instructions - lines 263 to 263"]
B110 -->|call| B169
B110 -->|after return| B111
B111 -->|call| B214
B111 -->|after return| B112
B113 -->|call| B214
B113 -->|after return| B114
B114 -->|call| B207
B114 -->|after return| B115
B115 -->|call| B167
B115 -->|after return| B116
B116 -->|call| B167
B116 -->|after return| B117
B117 -->|call| B179
B117 -->|after return| B118
B118 -->|call| B174
B118 -->|after return| B119
B119 -->|call| B214
B119 -->|after return| B120
B169["Continue at B170 in section 17"]
B214["Continue at B215 in section 22"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL WCHR
```

### B112

```asm
SUBB A,#30H
MOV 41H,A
ACALL DELAY
```

### B113

Return to the instruction following the active call.

```asm
RET
```

### B114

```asm
ACALL DELAY
```

### B115

```asm
ACALL CLEAR
```

### B116

```asm
MOV A, #8H
ACALL CMD
```

### B117

```asm
MOV A, #0H
ACALL CMD
```

### B118

```asm
ACALL LDELAY
```

### B119

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 264 to 268"]
B121["B122: instructions - lines 269 to 271"]
B122["B123: instructions - lines 272 to 272"]
B123["B124: instructions - lines 273 to 273"]
B124["B125: REMINDER - lines 277 to 278"]
B125["B126: instructions - lines 279 to 280"]
B126["B127: instructions - lines 281 to 281"]
B127["B128: instructions - lines 282 to 283"]
B128["B129: instructions - lines 284 to 284"]
B129["B130: instructions - lines 285 to 287"]
B120 -->|call| B169
B120 -->|after return| B121
B121 -->|call| B169
B121 -->|after return| B122
B122 -->|call| B214
B122 -->|after return| B123
B124 -->|call| B167
B124 -->|after return| B125
B125 -->|call| B167
B125 -->|after return| B126
B126 -->|call| B179
B126 -->|after return| B127
B127 -->|call| B174
B127 -->|after return| B128
B128 -->|call| B214
B128 -->|after return| B129
B129 -->|call| B169
B129 -->|after return| B130
B169["Continue at B170 in section 17"]
B214["Continue at B215 in section 22"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B122

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B123

```asm
ACALL DELAY
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

```asm
MOV A, #1100B
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
MOV DPTR, #STR9
ACALL WSTR
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 288 to 288"]
B131["B132: instructions - lines 289 to 289"]
B132["B133: CONTINUE - lines 292 to 292"]
B133["B134: instructions - lines 293 to 294"]
B134["B135: instructions - lines 295 to 296"]
B135["B136: instructions - lines 297 to 297"]
B136["B137: instructions - lines 298 to 299"]
B137["B138: instructions - lines 300 to 300"]
B138["B139: instructions - lines 302 to 303"]
B139["B140: instructions - lines 304 to 305"]
B130 -->|call| B214
B130 -->|after return| B131
B132 -->|call| B207
B132 -->|after return| B133
B133 -->|call| B167
B133 -->|after return| B134
B134 -->|call| B167
B134 -->|after return| B135
B135 -->|call| B179
B135 -->|after return| B136
B136 -->|call| B174
B136 -->|after return| B137
B137 -->|call| B214
B137 -->|after return| B138
B138 -->|call| B167
B138 -->|after return| B139
B139 -->|call| B167
B139 -->|after return| B140
B214["Continue at B215 in section 22"]
B207["Continue at B208 in section 21"]
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL DELAY
```

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

```asm
ACALL CLEAR
```

### B134

```asm
MOV A, #8H
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
MOV DPTR, #STR11
ACALL WSTR
```

### B138

```asm
ACALL DELAY
```

### B139

```asm
MOV A, #1100B
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
B140["B141: instructions - lines 306 to 306"]
B141["B142: instructions - lines 307 to 308"]
B142["B143: instructions - lines 309 to 309"]
B143["B144: instructions - lines 311 to 313"]
B144["B145: instructions - lines 314 to 314"]
B145["B146: instructions - lines 319 to 319"]
B146["B147: INIT - lines 323 to 330"]
B147["B148: INLCD - lines 335 to 336"]
B148["B149: WAIT - lines 338 to 338"]
B149["B150: instructions - lines 339 to 339"]
B140 -->|call| B179
B140 -->|after return| B141
B141 -->|call| B174
B141 -->|after return| B142
B142 -->|call| B214
B142 -->|after return| B143
B143 -->|call| B169
B143 -->|after return| B144
B144 -->|call| B214
B144 -->|after return| B145
B147 -->|next| B148
B148 -->|call| B179
B148 -->|after return| B149
B149 -->|condition true| B148
B149 -->|condition false| B150
B179["Continue at B180 in section 18"]
B174["Continue at B175 in section 18"]
B214["Continue at B215 in section 22"]
B169["Continue at B170 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL LDELAY
```

### B142

```asm
MOV DPTR, #STR12
ACALL WSTR
```

### B143

```asm
ACALL DELAY
```

### B144

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B145

```asm
ACALL DELAY
```

### B146

Return to the instruction following the active call.

```asm
RET
```

### B147

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

### B148

```asm
PUSH 7
MOV R7,#20
```

### B149

```asm
ACALL LDELAY
```

### B150

```asm
DJNZ R7,WAIT
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 340 to 342"]
B151["B152: instructions - lines 343 to 343"]
B152["B153: instructions - lines 344 to 345"]
B153["B154: instructions - lines 346 to 347"]
B154["B155: instructions - lines 348 to 349"]
B155["B156: instructions - lines 350 to 351"]
B156["B157: instructions - lines 352 to 353"]
B157["B158: instructions - lines 354 to 355"]
B158["B159: instructions - lines 356 to 357"]
B159["B160: instructions - lines 358 to 359"]
B150 -->|call| B167
B150 -->|after return| B151
B151 -->|call| B179
B151 -->|after return| B152
B152 -->|call| B167
B152 -->|after return| B153
B153 -->|call| B167
B153 -->|after return| B154
B154 -->|call| B167
B154 -->|after return| B155
B155 -->|call| B167
B155 -->|after return| B156
B156 -->|call| B167
B156 -->|after return| B157
B157 -->|call| B167
B157 -->|after return| B158
B158 -->|call| B167
B158 -->|after return| B159
B159 -->|call| B167
B159 -->|after return| B160
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B152

```asm
ACALL LDELAY
```

### B153

```asm
MOV A,#0011B
ACALL CMD
```

### B154

```asm
MOV A,#0011B
ACALL CMD
```

### B155

```asm
MOV A,#0010B
ACALL CMD
```

### B156

```asm
MOV A,#0010B
ACALL CMD
```

### B157

```asm
MOV A,#1000B
ACALL CMD
```

### B158

```asm
MOV A,#0000B
ACALL CMD
```

### B159

```asm
MOV A,#1000B
ACALL CMD
```

### B160

```asm
MOV A,#0
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 360 to 361"]
B161["B162: instructions - lines 362 to 362"]
B162["B163: instructions - lines 363 to 364"]
B163["B164: instructions - lines 365 to 366"]
B164["B165: instructions - lines 367 to 368"]
B165["B166: instructions - lines 369 to 370"]
B166["B167: instructions - lines 371 to 372"]
B167["B168: CMD - lines 377 to 378"]
B168["B169: instructions - lines 379 to 379"]
B169["B170: WCHR - lines 384 to 389"]
B160 -->|call| B167
B160 -->|after return| B161
B161 -->|call| B179
B161 -->|after return| B162
B162 -->|call| B167
B162 -->|after return| B163
B163 -->|call| B167
B163 -->|after return| B164
B164 -->|call| B167
B164 -->|after return| B165
B165 -->|call| B167
B165 -->|after return| B166
B167 -->|call| B172
B167 -->|after return| B168
B169 -->|call| B172
B169 -->|after return| B170
B179["Continue at B180 in section 18"]
B172["Continue at B173 in section 18"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#0001B
ACALL CMD
```

### B162

```asm
ACALL LDELAY
```

### B163

```asm
MOV A,#0000B
ACALL CMD
```

### B164

```asm
MOV A,#0110B
ACALL CMD
```

### B165

```asm
MOV A,#0000B
ACALL CMD
```

### B166

```asm
MOV A,#1111B
ACALL CMD
```

### B167

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B168

```asm
CLR RS
ACALL COMMON
```

### B169

Return to the instruction following the active call.

```asm
RET
```

### B170

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 390 to 391"]
B171["B172: instructions - lines 392 to 394"]
B172["B173: COMMON - lines 399 to 406"]
B173["B174: instructions - lines 407 to 407"]
B174["B175: WSTR - lines 412 to 412"]
B175["B176: CONT1 - lines 413 to 415"]
B176["B177: instructions - lines 416 to 416"]
B177["B178: instructions - lines 418 to 419"]
B178["B179: EXIT1 - lines 421 to 422"]
B179["B180: LDELAY - lines 427 to 429"]
B170 -->|call| B172
B170 -->|after return| B171
B172 -->|call| B179
B172 -->|after return| B173
B174 -->|next| B175
B175 -->|condition true| B178
B175 -->|condition false| B176
B176 -->|call| B169
B176 -->|after return| B177
B177 -->|jump| B175
B179 -->|next| B180
B169["Continue at B170 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV A,B
ACALL COMMON
```

### B172

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B173

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

### B174

Return to the instruction following the active call.

```asm
RET
```

### B175

```asm
PUSH ACC
```

### B176

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B177

```asm
ACALL WCHR
```

### B178

```asm
INC DPTR
AJMP CONT1
```

### B179

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B180

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

## Section 19

```mermaid
flowchart TD
B180["B181: CON4 - lines 430 to 431"]
B181["B182: instructions - lines 432 to 432"]
B182["B183: instructions - lines 433 to 435"]
B183["B184: KEYPAD - lines 439 to 439"]
B184["B185: K1 - lines 440 to 443"]
B185["B186: K2 - lines 444 to 444"]
B186["B187: instructions - lines 445 to 447"]
B187["B188: instructions - lines 448 to 448"]
B188["B189: OVER - lines 450 to 450"]
B189["B190: instructions - lines 451 to 453"]
B180 -->|condition true| B180
B180 -->|condition false| B181
B181 -->|condition true| B180
B181 -->|condition false| B182
B183 -->|next| B184
B184 -->|condition true| B184
B184 -->|condition false| B185
B185 -->|call| B204
B185 -->|after return| B186
B186 -->|condition true| B188
B186 -->|condition false| B187
B187 -->|jump| B185
B188 -->|call| B204
B188 -->|after return| B189
B189 -->|condition true| B191
B189 -->|condition false| B190
B204["Continue at B205 in section 21"]
B191["Continue at B192 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV R0,#250
DJNZ R0,$
```

### B182

```asm
DJNZ R1,CON4
```

### B183

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B184

```asm
MOV P2,#11110000B
```

### B185

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B186

```asm
ACALL TMSEC
```

### B187

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B188

```asm
SJMP K2
```

### B189

```asm
ACALL TMSEC
```

### B190

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 454 to 454"]
B191["B192: OVER1 - lines 456 to 459"]
B192["B193: instructions - lines 460 to 463"]
B193["B194: instructions - lines 464 to 467"]
B194["B195: instructions - lines 468 to 471"]
B195["B196: instructions - lines 472 to 472"]
B196["B197: ROW_0 - lines 473 to 474"]
B197["B198: ROW_1 - lines 475 to 476"]
B198["B199: ROW_2 - lines 477 to 478"]
B199["B200: ROW_3 - lines 479 to 479"]
B190 -->|jump| B185
B191 -->|condition true| B196
B191 -->|condition false| B192
B192 -->|condition true| B197
B192 -->|condition false| B193
B193 -->|condition true| B198
B193 -->|condition false| B194
B194 -->|condition true| B199
B194 -->|condition false| B195
B195 -->|jump| B185
B196 -->|jump| B200
B197 -->|jump| B200
B198 -->|jump| B200
B199 -->|next| B200
B185["Continue at B186 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
SJMP K2
```

### B192

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B193

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B194

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B195

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B196

```asm
LJMP K2
```

### B197

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B198

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B199

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B200

```asm
MOV DPTR,#KCODE3
```

## Section 21

```mermaid
flowchart TD
B200["B201: FIND - lines 481 to 481"]
B201["B202: FIND1 - lines 483 to 484"]
B202["B203: instructions - lines 485 to 486"]
B203["B204: MATCH - lines 488 to 490"]
B204["B205: TMSEC - lines 495 to 498"]
B205["B206: BACK - lines 500 to 500"]
B206["B207: instructions - lines 501 to 503"]
B207["B208: CLEAR - lines 507 to 508"]
B208["B209: instructions - lines 509 to 510"]
B209["B210: instructions - lines 511 to 511"]
B200 -->|next| B201
B201 -->|condition true| B203
B201 -->|condition false| B202
B202 -->|jump| B201
B204 -->|next| B205
B205 -->|condition true| B205
B205 -->|condition false| B206
B207 -->|call| B167
B207 -->|after return| B208
B208 -->|call| B167
B208 -->|after return| B209
B209 -->|call| B179
B209 -->|after return| B210
B167["Continue at B168 in section 17"]
B179["Continue at B180 in section 18"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
SWAP A
```

### B202

```asm
RRC A
JNC MATCH
```

### B203

```asm
INC DPTR
SJMP FIND1
```

### B204

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B205

```asm
MOV TMOD,#21H
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B206

```asm
JNB TF0,BACK
```

### B207

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B208

```asm
MOV A,#0H
ACALL CMD
```

### B209

```asm
MOV A,#1H
ACALL CMD
```

### B210

```asm
ACALL LDELAY
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 512 to 512"]
B211["B212: WAITT - lines 513 to 513"]
B212["B213: instructions - lines 514 to 514"]
B213["B214: instructions - lines 515 to 515"]
B214["B215: DELAY - lines 519 to 519"]
B215["B216: HH - lines 521 to 521"]
B216["B217: instructions - lines 522 to 522"]
B217["B218: instructions - lines 523 to 523"]
B210 -->|next| B211
B211 -->|call| B179
B211 -->|after return| B212
B212 -->|condition true| B211
B212 -->|condition false| B213
B214 -->|next| B215
B215 -->|call| B179
B215 -->|after return| B216
B216 -->|condition true| B215
B216 -->|condition false| B217
B179["Continue at B180 in section 18"]
```

### B211

```asm
MOV R7,#14
```

### B212

```asm
ACALL LDELAY
```

### B213

```asm
DJNZ R7,WAITT
```

### B214

Return to the instruction following the active call.

```asm
RET
```

### B215

```asm
MOV R5,#150
```

### B216

```asm
ACALL LDELAY
```

### B217

```asm
DJNZ R5,HH
```

### B218

Return to the instruction following the active call.

```asm
RET
```
