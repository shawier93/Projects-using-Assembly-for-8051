# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 4"]
B1["B2: instructions - lines 6 to 6"]
B2["B3: instructions - lines 7 to 7"]
B3["B4: instructions - lines 8 to 8"]
B4["B5: instructions - lines 9 to 9"]
B5["B6: instructions - lines 18 to 19"]
B6["B7: MIAN - lines 22 to 22"]
B7["B8: instructions - lines 24 to 24"]
B8["B9: instructions - lines 25 to 30"]
B9["B10: instructions - lines 31 to 31"]
B0 -->|call| B143
B0 -->|after return| B1
B1 -->|call| B150
B1 -->|after return| B2
B2 -->|call| B27
B2 -->|after return| B3
B3 -->|call| B31
B3 -->|after return| B4
B4 -->|call| B60
B4 -->|after return| B5
B5 -->|next| B6
B6 -->|condition true| B10
B6 -->|condition false| B7
B7 -->|call| B68
B7 -->|after return| B8
B8 -->|call| B39
B8 -->|after return| B9
B9 -->|jump| B16
B143["Continue at B144 in section 15"]
B150["Continue at B151 in section 16"]
B27["Continue at B28 in section 3"]
B31["Continue at B32 in section 4"]
B60["Continue at B61 in section 7"]
B10["Continue at B11 in section 2"]
B68["Continue at B69 in section 7"]
B39["Continue at B40 in section 4"]
B16["Continue at B17 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
acall clear
```

### B3

```asm
acall WRITE1
```

### B4

```asm
acall WRITE2
```

### B5

```asm
ACALL READ1
```

### B6

```asm
MOV 50H,#0FH
MOV 51H,#0
```

### B7

```asm
CJNE R1,#1,ZEROOS
```

### B8

```asm
ACALL READ2
```

### B9

```asm
MOV A,40H
ADD A,41H
MOV B,#2
DIV AB
MOV 42H,A
ACALL WRITE3
```

### B10

```asm
SJMP BACK
```

## Section 2

```mermaid
flowchart TD
B10["B11: ZEROOS - lines 34 to 34"]
B11["B12: instructions - lines 35 to 35"]
B12["B13: instructions - lines 36 to 37"]
B13["B14: instructions - lines 38 to 39"]
B14["B15: instructions - lines 41 to 41"]
B15["B16: WRONG - lines 45 to 45"]
B16["B17: BACK - lines 48 to 48"]
B17["B18: COUNT - lines 51 to 52"]
B18["B19: HERE - lines 54 to 57"]
B19["B20: instructions - lines 58 to 58"]
B10 -->|condition true| B15
B10 -->|condition false| B11
B11 -->|call| B88
B11 -->|after return| B12
B12 -->|call| B17
B12 -->|after return| B13
B13 -->|call| B99
B13 -->|after return| B14
B14 -->|jump| B16
B15 -->|call| B15
B15 -->|after return| B16
B16 -->|jump| B16
B17 -->|next| B18
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|next| B20
B88["Continue at B89 in section 9"]
B99["Continue at B100 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE R1,#2, WRONG
```

### B12

```asm
ACALL READ3
```

### B13

```asm
MOV A,50H
ACALL COUNT
```

### B14

```asm
MOV 30H,51H
ACALL WRITE4
```

### B15

```asm
SJMP BACK
```

### B16

```asm
ACALL WRONG
```

### B17

```asm
SJMP BACK
```

### B18

```asm
MOV A,50H
MOV R4,#9
```

### B19

```asm
MOV B,#2
DIV AB
MOV R0,B
CJNE R0,#0,NO
```

### B20

```asm
INC 51H
```

## Section 3

```mermaid
flowchart TD
B20["B21: NO - lines 60 to 60"]
B21["B22: instructions - lines 62 to 62"]
B22["B23: DELAY - lines 65 to 65"]
B23["B24: AGAIN - lines 66 to 66"]
B24["B25: AGAIN2 - lines 67 to 67"]
B25["B26: instructions - lines 68 to 68"]
B26["B27: instructions - lines 69 to 69"]
B27["B28: WRITE1 - lines 72 to 73"]
B28["B29: instructions - lines 74 to 75"]
B29["B30: instructions - lines 76 to 76"]
B20 -->|condition true| B18
B20 -->|condition false| B21
B22 -->|next| B23
B23 -->|next| B24
B24 -->|condition true| B24
B24 -->|condition false| B25
B25 -->|condition true| B23
B25 -->|condition false| B26
B27 -->|call| B137
B27 -->|after return| B28
B28 -->|call| B155
B28 -->|after return| B29
B29 -->|call| B22
B29 -->|after return| B30
B18["Continue at B19 in section 2"]
B137["Continue at B138 in section 14"]
B155["Continue at B156 in section 16"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
DJNZ R4,HERE
```

### B22

Return to the instruction following the active call.

```asm
RET
```

### B23

```asm
MOV R0,#20
```

### B24

```asm
MOV R1,#90
```

### B25

```asm
DJNZ R1,AGAIN2
```

### B26

```asm
DJNZ R0,AGAIN
```

### B27

Return to the instruction following the active call.

```asm
RET
```

### B28

```asm
mov a, #80H
acall cmd
```

### B29

```asm
mov dptr, #STR1
acall WSTR
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 77 to 77"]
B31["B32: WRITE2 - lines 81 to 81"]
B32["B33: instructions - lines 82 to 83"]
B33["B34: instructions - lines 84 to 85"]
B34["B35: instructions - lines 86 to 86"]
B35["B36: instructions - lines 88 to 89"]
B36["B37: instructions - lines 90 to 91"]
B37["B38: instructions - lines 92 to 92"]
B38["B39: instructions - lines 93 to 93"]
B39["B40: WRITE3 - lines 99 to 99"]
B31 -->|call| B150
B31 -->|after return| B32
B32 -->|call| B137
B32 -->|after return| B33
B33 -->|call| B155
B33 -->|after return| B34
B34 -->|call| B22
B34 -->|after return| B35
B35 -->|call| B137
B35 -->|after return| B36
B36 -->|call| B155
B36 -->|after return| B37
B37 -->|call| B22
B37 -->|after return| B38
B39 -->|call| B150
B39 -->|after return| B40
B150["Continue at B151 in section 16"]
B137["Continue at B138 in section 14"]
B155["Continue at B156 in section 16"]
B22["Continue at B23 in section 3"]
B40["Continue at B41 in section 5"]
```

### B31

Return to the instruction following the active call.

```asm
RET
```

### B32

```asm
ACALL CLEAR
```

### B33

```asm
mov a, #80H
acall cmd
```

### B34

```asm
mov dptr, #STR2
acall WSTR
```

### B35

```asm
ACALL DELAY
```

### B36

```asm
mov a, #0C0H
acall cmd
```

### B37

```asm
mov dptr, #STR3
acall WSTR
```

### B38

```asm
ACALL DELAY
```

### B39

Return to the instruction following the active call.

```asm
RET
```

### B40

```asm
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 100 to 101"]
B41["B42: instructions - lines 102 to 103"]
B42["B43: instructions - lines 104 to 104"]
B43["B44: instructions - lines 106 to 107"]
B44["B45: instructions - lines 108 to 112"]
B45["B46: instructions - lines 113 to 115"]
B46["B47: instructions - lines 116 to 116"]
B47["B48: instructions - lines 118 to 119"]
B48["B49: instructions - lines 120 to 124"]
B49["B50: instructions - lines 125 to 127"]
B40 -->|call| B137
B40 -->|after return| B41
B41 -->|call| B155
B41 -->|after return| B42
B42 -->|call| B22
B42 -->|after return| B43
B43 -->|call| B137
B43 -->|after return| B44
B44 -->|call| B132
B44 -->|after return| B45
B45 -->|call| B132
B45 -->|after return| B46
B46 -->|call| B22
B46 -->|after return| B47
B47 -->|call| B137
B47 -->|after return| B48
B48 -->|call| B132
B48 -->|after return| B49
B49 -->|call| B132
B49 -->|after return| B50
B137["Continue at B138 in section 14"]
B155["Continue at B156 in section 16"]
B22["Continue at B23 in section 3"]
B132["Continue at B133 in section 14"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov a, #80H
acall cmd
```

### B42

```asm
mov dptr, #STR4
acall WSTR
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
mov a, #0C0H
acall cmd
```

### B45

```asm
mov a,40H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B46

```asm
mov a,b
add a,#30h
acall wchr
```

### B47

```asm
ACALL DELAY
```

### B48

```asm
mov a, #0C8H
acall cmd
```

### B49

```asm
mov a,41H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B50

```asm
mov a,b
add a,#30h
acall wchr
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 128 to 128"]
B51["B52: instructions - lines 130 to 130"]
B52["B53: instructions - lines 131 to 132"]
B53["B54: instructions - lines 133 to 134"]
B54["B55: instructions - lines 135 to 135"]
B55["B56: instructions - lines 137 to 138"]
B56["B57: instructions - lines 139 to 143"]
B57["B58: instructions - lines 144 to 146"]
B58["B59: instructions - lines 147 to 147"]
B59["B60: instructions - lines 148 to 148"]
B50 -->|call| B22
B50 -->|after return| B51
B51 -->|call| B150
B51 -->|after return| B52
B52 -->|call| B137
B52 -->|after return| B53
B53 -->|call| B155
B53 -->|after return| B54
B54 -->|call| B22
B54 -->|after return| B55
B55 -->|call| B137
B55 -->|after return| B56
B56 -->|call| B132
B56 -->|after return| B57
B57 -->|call| B132
B57 -->|after return| B58
B58 -->|call| B22
B58 -->|after return| B59
B22["Continue at B23 in section 3"]
B150["Continue at B151 in section 16"]
B137["Continue at B138 in section 14"]
B155["Continue at B156 in section 16"]
B132["Continue at B133 in section 14"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
ACALL CLEAR
```

### B53

```asm
mov a, #80H
acall cmd
```

### B54

```asm
mov dptr, #STR6
acall WSTR
```

### B55

```asm
ACALL DELAY
```

### B56

```asm
mov a, #0C0H
acall cmd
```

### B57

```asm
mov a,42H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B58

```asm
mov a,b
add a,#30h
acall wchr
```

### B59

```asm
ACALL DELAY
```

### B60

Return to the instruction following the active call.

```asm
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: READ1 - lines 151 to 151"]
B61["B62: instructions - lines 152 to 153"]
B62["B63: instructions - lines 154 to 155"]
B63["B64: instructions - lines 156 to 156"]
B64["B65: instructions - lines 158 to 159"]
B65["B66: instructions - lines 160 to 160"]
B66["B67: instructions - lines 161 to 161"]
B67["B68: instructions - lines 162 to 164"]
B68["B69: READ2 - lines 167 to 167"]
B69["B70: instructions - lines 168 to 169"]
B60 -->|call| B150
B60 -->|after return| B61
B61 -->|call| B137
B61 -->|after return| B62
B62 -->|call| B155
B62 -->|after return| B63
B63 -->|call| B22
B63 -->|after return| B64
B64 -->|call| B137
B64 -->|after return| B65
B65 -->|call| B115
B65 -->|after return| B66
B66 -->|call| B132
B66 -->|after return| B67
B68 -->|call| B150
B68 -->|after return| B69
B69 -->|call| B137
B69 -->|after return| B70
B150["Continue at B151 in section 16"]
B137["Continue at B138 in section 14"]
B155["Continue at B156 in section 16"]
B22["Continue at B23 in section 3"]
B115["Continue at B116 in section 12"]
B132["Continue at B133 in section 14"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL CLEAR
```

### B62

```asm
mov a, #80H
acall cmd
```

### B63

```asm
mov dptr, #STR7
acall WSTR
```

### B64

```asm
ACALL DELAY
```

### B65

```asm
MOV A, #0C8H
ACALL CMD
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

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV R1,A
RET
```

### B69

```asm
ACALL CLEAR
```

### B70

```asm
mov a, #80H
acall cmd
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 170 to 171"]
B71["B72: instructions - lines 172 to 172"]
B72["B73: instructions - lines 174 to 175"]
B73["B74: instructions - lines 176 to 176"]
B74["B75: instructions - lines 177 to 177"]
B75["B76: instructions - lines 178 to 180"]
B76["B77: instructions - lines 181 to 181"]
B77["B78: instructions - lines 182 to 190"]
B78["B79: instructions - lines 191 to 191"]
B79["B80: instructions - lines 192 to 193"]
B70 -->|call| B155
B70 -->|after return| B71
B71 -->|call| B22
B71 -->|after return| B72
B72 -->|call| B137
B72 -->|after return| B73
B73 -->|call| B115
B73 -->|after return| B74
B74 -->|call| B132
B74 -->|after return| B75
B75 -->|call| B115
B75 -->|after return| B76
B76 -->|call| B132
B76 -->|after return| B77
B77 -->|call| B22
B77 -->|after return| B78
B78 -->|call| B150
B78 -->|after return| B79
B79 -->|call| B137
B79 -->|after return| B80
B155["Continue at B156 in section 16"]
B22["Continue at B23 in section 3"]
B137["Continue at B138 in section 14"]
B115["Continue at B116 in section 12"]
B132["Continue at B133 in section 14"]
B150["Continue at B151 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov dptr, #STR8
acall WSTR
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
MOV A, #0C8H
ACALL CMD
```

### B74

```asm
ACALL KEYPAD
```

### B75

```asm
ACALL WCHR
```

### B76

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B77

```asm
ACALL WCHR
```

### B78

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#10
MOV A,29H
MUL AB
ADD A,2AH
MOV 40H,A
ACALL DELAY
```

### B79

```asm
ACALL CLEAR
```

### B80

```asm
mov a, #80H
acall cmd
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 194 to 195"]
B81["B82: instructions - lines 196 to 196"]
B82["B83: instructions - lines 198 to 199"]
B83["B84: instructions - lines 200 to 200"]
B84["B85: instructions - lines 201 to 201"]
B85["B86: instructions - lines 202 to 204"]
B86["B87: instructions - lines 205 to 205"]
B87["B88: instructions - lines 206 to 215"]
B88["B89: READ3 - lines 218 to 218"]
B89["B90: instructions - lines 219 to 219"]
B80 -->|call| B155
B80 -->|after return| B81
B81 -->|call| B22
B81 -->|after return| B82
B82 -->|call| B137
B82 -->|after return| B83
B83 -->|call| B115
B83 -->|after return| B84
B84 -->|call| B132
B84 -->|after return| B85
B85 -->|call| B115
B85 -->|after return| B86
B86 -->|call| B132
B86 -->|after return| B87
B88 -->|call| B150
B88 -->|after return| B89
B89 -->|call| B22
B89 -->|after return| B90
B155["Continue at B156 in section 16"]
B22["Continue at B23 in section 3"]
B137["Continue at B138 in section 14"]
B115["Continue at B116 in section 12"]
B132["Continue at B133 in section 14"]
B150["Continue at B151 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov dptr, #STR9
acall WSTR
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
MOV A, #0C8H
ACALL CMD
```

### B84

```asm
ACALL KEYPAD
```

### B85

```asm
ACALL WCHR
```

### B86

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B87

```asm
ACALL WCHR
```

### B88

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#10
MOV A,29H
MUL AB
ADD A,2AH
MOV 41H,A
RET
```

### B89

```asm
ACALL CLEAR
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 220 to 221"]
B91["B92: instructions - lines 222 to 223"]
B92["B93: instructions - lines 224 to 224"]
B93["B94: instructions - lines 225 to 226"]
B94["B95: instructions - lines 227 to 227"]
B95["B96: instructions - lines 228 to 228"]
B96["B97: instructions - lines 229 to 231"]
B97["B98: instructions - lines 232 to 232"]
B98["B99: instructions - lines 233 to 240"]
B99["B100: WRITE4 - lines 243 to 243"]
B90 -->|call| B137
B90 -->|after return| B91
B91 -->|call| B22
B91 -->|after return| B92
B92 -->|call| B155
B92 -->|after return| B93
B93 -->|call| B137
B93 -->|after return| B94
B94 -->|call| B115
B94 -->|after return| B95
B95 -->|call| B132
B95 -->|after return| B96
B96 -->|call| B115
B96 -->|after return| B97
B97 -->|call| B132
B97 -->|after return| B98
B99 -->|call| B150
B99 -->|after return| B100
B137["Continue at B138 in section 14"]
B22["Continue at B23 in section 3"]
B155["Continue at B156 in section 16"]
B115["Continue at B116 in section 12"]
B132["Continue at B133 in section 14"]
B150["Continue at B151 in section 16"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov a, #80H
acall cmd
```

### B92

```asm
mov dptr, #STR10
ACALL DELAY
```

### B93

```asm
ACALL WSTR
```

### B94

```asm
MOV A, #0C8H
ACALL CMD
```

### B95

```asm
ACALL KEYPAD
```

### B96

```asm
ACALL WCHR
```

### B97

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B98

```asm
ACALL WCHR
```

### B99

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#10
MOV A,29H
MUL AB
ADD A,2AH
MOV 50H,A
RET
```

### B100

```asm
ACALL CLEAR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 244 to 245"]
B101["B102: instructions - lines 246 to 247"]
B102["B103: instructions - lines 248 to 248"]
B103["B104: instructions - lines 250 to 251"]
B104["B105: instructions - lines 252 to 256"]
B105["B106: instructions - lines 257 to 259"]
B106["B107: instructions - lines 260 to 260"]
B107["B108: instructions - lines 263 to 263"]
B108["B109: instructions - lines 264 to 265"]
B109["B110: instructions - lines 266 to 267"]
B100 -->|call| B137
B100 -->|after return| B101
B101 -->|call| B155
B101 -->|after return| B102
B102 -->|call| B22
B102 -->|after return| B103
B103 -->|call| B137
B103 -->|after return| B104
B104 -->|call| B132
B104 -->|after return| B105
B105 -->|call| B132
B105 -->|after return| B106
B106 -->|call| B22
B106 -->|after return| B107
B107 -->|call| B150
B107 -->|after return| B108
B108 -->|call| B137
B108 -->|after return| B109
B109 -->|call| B155
B109 -->|after return| B110
B137["Continue at B138 in section 14"]
B155["Continue at B156 in section 16"]
B22["Continue at B23 in section 3"]
B132["Continue at B133 in section 14"]
B150["Continue at B151 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov a, #80H
acall cmd
```

### B102

```asm
mov dptr, #STR5
acall WSTR
```

### B103

```asm
ACALL DELAY
```

### B104

```asm
mov a, #0C0H
acall cmd
```

### B105

```asm
mov a,50H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B106

```asm
mov a,b
add a,#30h
acall wchr
```

### B107

```asm
ACALL DELAY
```

### B108

```asm
ACALL CLEAR
```

### B109

```asm
mov a, #80H
acall cmd
```

### B110

```asm
mov dptr, #STR6
acall WSTR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 268 to 268"]
B111["B112: instructions - lines 270 to 271"]
B112["B113: instructions - lines 272 to 274"]
B113["B114: instructions - lines 275 to 275"]
B114["B115: instructions - lines 276 to 276"]
B115["B116: KEYPAD - lines 279 to 279"]
B116["B117: K1 - lines 280 to 283"]
B117["B118: K2 - lines 285 to 287"]
B118["B119: instructions - lines 288 to 288"]
B119["B120: OVER1 - lines 290 to 293"]
B110 -->|call| B22
B110 -->|after return| B111
B111 -->|call| B137
B111 -->|after return| B112
B112 -->|call| B132
B112 -->|after return| B113
B113 -->|call| B22
B113 -->|after return| B114
B115 -->|next| B116
B116 -->|condition true| B116
B116 -->|condition false| B117
B117 -->|condition true| B119
B117 -->|condition false| B118
B118 -->|jump| B117
B119 -->|condition true| B124
B119 -->|condition false| B120
B22["Continue at B23 in section 3"]
B137["Continue at B138 in section 14"]
B132["Continue at B133 in section 14"]
B124["Continue at B125 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL DELAY
```

### B112

```asm
mov a, #0C0H
acall cmd
```

### B113

```asm
mov a,51H
add a,#30h
acall wchr
```

### B114

```asm
ACALL DELAY
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
MOV P0,#01110000B
```

### B117

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B118

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B119

```asm
SJMP K2
```

### B120

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 294 to 297"]
B121["B122: instructions - lines 298 to 301"]
B122["B123: instructions - lines 302 to 305"]
B123["B124: instructions - lines 306 to 306"]
B124["B125: ROW_0 - lines 307 to 308"]
B125["B126: ROW_1 - lines 309 to 310"]
B126["B127: ROW_2 - lines 311 to 312"]
B127["B128: ROW_3 - lines 313 to 313"]
B128["B129: FIND - lines 315 to 315"]
B129["B130: FIND1 - lines 317 to 318"]
B120 -->|condition true| B125
B120 -->|condition false| B121
B121 -->|condition true| B126
B121 -->|condition false| B122
B122 -->|condition true| B127
B122 -->|condition false| B123
B123 -->|jump| B117
B124 -->|jump| B128
B125 -->|jump| B128
B126 -->|jump| B128
B127 -->|next| B128
B128 -->|next| B129
B129 -->|condition true| B131
B129 -->|condition false| B130
B117["Continue at B118 in section 12"]
B131["Continue at B132 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B122

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B123

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B124

```asm
LJMP K2
```

### B125

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B126

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B127

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B128

```asm
MOV DPTR,#KCODE3
```

### B129

```asm
RLC A
```

### B130

```asm
RLC A
JNC MATCH
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 319 to 320"]
B131["B132: MATCH - lines 321 to 323"]
B132["B133: WCHR - lines 326 to 330"]
B133["B134: instructions - lines 331 to 331"]
B134["B135: instructions - lines 332 to 334"]
B135["B136: instructions - lines 335 to 335"]
B136["B137: instructions - lines 336 to 338"]
B137["B138: CMD - lines 341 to 343"]
B138["B139: instructions - lines 344 to 344"]
B139["B140: instructions - lines 345 to 347"]
B130 -->|jump| B129
B132 -->|call| B142
B132 -->|after return| B133
B133 -->|call| B148
B133 -->|after return| B134
B134 -->|call| B142
B134 -->|after return| B135
B135 -->|call| B148
B135 -->|after return| B136
B137 -->|call| B142
B137 -->|after return| B138
B138 -->|call| B148
B138 -->|after return| B139
B139 -->|call| B142
B139 -->|after return| B140
B129["Continue at B130 in section 13"]
B142["Continue at B143 in section 15"]
B148["Continue at B149 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
INC DPTR
SJMP FIND1
```

### B132

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B133

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B134

```asm
ACALL LDELAY
```

### B135

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B136

```asm
ACALL LDELAY
```

### B137

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B138

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B139

```asm
ACALL LDELAY
```

### B140

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 348 to 348"]
B141["B142: instructions - lines 349 to 349"]
B142["B143: COMMON - lines 352 to 357"]
B143["B144: INLCD - lines 360 to 367"]
B144["B145: instructions - lines 368 to 376"]
B145["B146: instructions - lines 377 to 389"]
B146["B147: instructions - lines 390 to 400"]
B147["B148: instructions - lines 401 to 401"]
B148["B149: LDELAY - lines 404 to 405"]
B149["B150: instructions - lines 406 to 406"]
B140 -->|call| B148
B140 -->|after return| B141
B143 -->|call| B148
B143 -->|after return| B144
B144 -->|call| B148
B144 -->|after return| B145
B145 -->|call| B148
B145 -->|after return| B146
B146 -->|call| B148
B146 -->|after return| B147
B148 -->|condition true| B148
B148 -->|condition false| B149
```

### B141

```asm
ACALL LDELAY
```

### B142

Return to the instruction following the active call.

```asm
RET
```

### B143

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B144

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

### B145

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

### B146

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

### B147

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

### B148

Return to the instruction following the active call.

```asm
RET
```

### B149

```asm
MOV R0, #50
DJNZ R0, $
```

### B150

Return to the instruction following the active call.

```asm
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: CLEAR - lines 409 to 410"]
B151["B152: instructions - lines 411 to 411"]
B152["B153: WAIT - lines 412 to 412"]
B153["B154: instructions - lines 413 to 413"]
B154["B155: instructions - lines 414 to 414"]
B155["B156: WSTR - lines 417 to 417"]
B156["B157: CONT1 - lines 419 to 421"]
B157["B158: PRINT - lines 423 to 423"]
B158["B159: instructions - lines 424 to 425"]
B159["B160: EXIT1 - lines 426 to 427"]
B150 -->|call| B137
B150 -->|after return| B151
B151 -->|next| B152
B152 -->|call| B148
B152 -->|after return| B153
B153 -->|condition true| B152
B153 -->|condition false| B154
B155 -->|next| B156
B156 -->|condition true| B159
B156 -->|condition false| B157
B157 -->|call| B132
B157 -->|after return| B158
B158 -->|jump| B156
B137["Continue at B138 in section 14"]
B148["Continue at B149 in section 15"]
B132["Continue at B133 in section 14"]
```

### B151

```asm
MOV A,#01H
ACALL CMD
```

### B152

```asm
MOV R7,#14
```

### B153

```asm
ACALL LDELAY
```

### B154

```asm
DJNZ R7,WAIT
```

### B155

Return to the instruction following the active call.

```asm
ret
```

### B156

```asm
PUSH    ACC
```

### B157

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B158

```asm
ACALL    WCHR
```

### B159

```asm
INC DPTR
AJMP    CONT1
```

### B160

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
