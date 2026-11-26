# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 000BH` begins at B2.
- `ORG 30H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 6 to 7"]
B2["B3: MAIN - lines 11 to 11"]
B3["B4: instructions - lines 14 to 22"]
B4["B5: instructions - lines 24 to 25"]
B5["B6: instructions - lines 26 to 27"]
B6["B7: instructions - lines 28 to 29"]
B7["B8: instructions - lines 30 to 30"]
B8["B9: instructions - lines 31 to 31"]
B9["B10: instructions - lines 33 to 34"]
B0 -->|jump| B2
B2 -->|call| B168
B2 -->|after return| B3
B3 -->|call| B178
B3 -->|after return| B4
B4 -->|call| B184
B4 -->|after return| B5
B5 -->|call| B178
B5 -->|after return| B6
B6 -->|call| B184
B6 -->|after return| B7
B7 -->|call| B192
B7 -->|after return| B8
B8 -->|call| B192
B8 -->|after return| B9
B9 -->|call| B178
B9 -->|after return| B10
B168["Continue at B169 in section 17"]
B178["Continue at B179 in section 18"]
B184["Continue at B185 in section 19"]
B192["Continue at B193 in section 20"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

Resume the interrupted program.

```asm
CPL P3.1
RETI
```

### B3

```asm
ACALL INLCD
```

### B4

```asm
MOV TMOD,#02H
MOV TH0,#-92
MOV IE,#82H
SETB TR0
MOV A,#80H
ACALL CMD
```

### B5

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B6

```asm
MOV A,#0C0H
ACALL CMD
```

### B7

```asm
MOV DPTR,#STR11
ACALL WSTR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
ACALL DELAY
```

### B10

```asm
MOV A,#01H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 35 to 35"]
B11["B12: instructions - lines 37 to 38"]
B12["B13: instructions - lines 39 to 40"]
B13["B14: instructions - lines 41 to 41"]
B14["B15: instructions - lines 42 to 43"]
B15["B16: instructions - lines 44 to 45"]
B16["B17: instructions - lines 46 to 46"]
B17["B18: instructions - lines 48 to 49"]
B18["B19: instructions - lines 50 to 50"]
B19["B20: instructions - lines 51 to 51"]
B10 -->|call| B192
B10 -->|after return| B11
B11 -->|call| B178
B11 -->|after return| B12
B12 -->|call| B184
B12 -->|after return| B13
B13 -->|call| B192
B13 -->|after return| B14
B14 -->|call| B178
B14 -->|after return| B15
B15 -->|call| B184
B15 -->|after return| B16
B16 -->|call| B192
B16 -->|after return| B17
B17 -->|call| B178
B17 -->|after return| B18
B18 -->|call| B151
B18 -->|after return| B19
B19 -->|call| B173
B19 -->|after return| B20
B192["Continue at B193 in section 20"]
B178["Continue at B179 in section 18"]
B184["Continue at B185 in section 19"]
B151["Continue at B152 in section 16"]
B173["Continue at B174 in section 18"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
MOV A,#80H
ACALL CMD
```

### B13

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B14

```asm
ACALL DELAY
```

### B15

```asm
MOV A,#0C0H
ACALL CMD
```

### B16

```asm
MOV DPTR,#STR22
ACALL WSTR
```

### B17

```asm
ACALL DELAY
```

### B18

```asm
MOV A,#0CEH
ACALL CMD
```

### B19

```asm
ACALL KEYPAD
```

### B20

```asm
ACALL WCHR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 52 to 54"]
B21["B22: instructions - lines 55 to 55"]
B22["B23: instructions - lines 57 to 58"]
B23["B24: instructions - lines 59 to 59"]
B24["B25: instructions - lines 61 to 62"]
B25["B26: instructions - lines 63 to 64"]
B26["B27: instructions - lines 65 to 65"]
B27["B28: instructions - lines 66 to 67"]
B28["B29: instructions - lines 68 to 69"]
B29["B30: instructions - lines 70 to 70"]
B20 -->|call| B192
B20 -->|after return| B21
B21 -->|call| B192
B21 -->|after return| B22
B22 -->|call| B178
B22 -->|after return| B23
B23 -->|call| B192
B23 -->|after return| B24
B24 -->|call| B178
B24 -->|after return| B25
B25 -->|call| B184
B25 -->|after return| B26
B26 -->|call| B192
B26 -->|after return| B27
B27 -->|call| B178
B27 -->|after return| B28
B28 -->|call| B184
B28 -->|after return| B29
B29 -->|call| B192
B29 -->|after return| B30
B192["Continue at B193 in section 20"]
B178["Continue at B179 in section 18"]
B184["Continue at B185 in section 19"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ANL A,#0FH
MOV 30H,A
ACALL DELAY
```

### B22

```asm
ACALL DELAY
```

### B23

```asm
MOV A,#01H
ACALL CMD
```

### B24

```asm
ACALL DELAY
```

### B25

```asm
MOV A,#80H
ACALL CMD
```

### B26

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B27

```asm
ACALL DELAY
```

### B28

```asm
MOV A,#0C0H
ACALL CMD
```

### B29

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 72 to 73"]
B31["B32: instructions - lines 74 to 74"]
B32["B33: instructions - lines 75 to 75"]
B33["B34: instructions - lines 76 to 78"]
B34["B35: instructions - lines 79 to 79"]
B35["B36: instructions - lines 83 to 84"]
B36["B37: instructions - lines 85 to 85"]
B37["B38: instructions - lines 87 to 88"]
B38["B39: instructions - lines 89 to 90"]
B39["B40: instructions - lines 91 to 91"]
B30 -->|call| B178
B30 -->|after return| B31
B31 -->|call| B151
B31 -->|after return| B32
B32 -->|call| B173
B32 -->|after return| B33
B33 -->|call| B192
B33 -->|after return| B34
B34 -->|call| B192
B34 -->|after return| B35
B35 -->|call| B178
B35 -->|after return| B36
B36 -->|call| B192
B36 -->|after return| B37
B37 -->|call| B178
B37 -->|after return| B38
B38 -->|call| B184
B38 -->|after return| B39
B39 -->|call| B192
B39 -->|after return| B40
B178["Continue at B179 in section 18"]
B151["Continue at B152 in section 16"]
B173["Continue at B174 in section 18"]
B192["Continue at B193 in section 20"]
B184["Continue at B185 in section 19"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#0CEH
ACALL CMD
```

### B32

```asm
ACALL KEYPAD
```

### B33

```asm
ACALL WCHR
```

### B34

```asm
ANL A,#0FH
MOV 31H,A
ACALL DELAY
```

### B35

```asm
ACALL DELAY
```

### B36

```asm
MOV A,#01H
ACALL CMD
```

### B37

```asm
ACALL DELAY
```

### B38

```asm
MOV A,#80H
ACALL CMD
```

### B39

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B40

```asm
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 92 to 93"]
B41["B42: instructions - lines 94 to 95"]
B42["B43: instructions - lines 96 to 96"]
B43["B44: instructions - lines 98 to 99"]
B44["B45: instructions - lines 100 to 100"]
B45["B46: instructions - lines 101 to 101"]
B46["B47: instructions - lines 102 to 104"]
B47["B48: instructions - lines 105 to 105"]
B48["B49: instructions - lines 109 to 110"]
B49["B50: instructions - lines 111 to 111"]
B40 -->|call| B178
B40 -->|after return| B41
B41 -->|call| B184
B41 -->|after return| B42
B42 -->|call| B192
B42 -->|after return| B43
B43 -->|call| B178
B43 -->|after return| B44
B44 -->|call| B151
B44 -->|after return| B45
B45 -->|call| B173
B45 -->|after return| B46
B46 -->|call| B192
B46 -->|after return| B47
B47 -->|call| B192
B47 -->|after return| B48
B48 -->|call| B178
B48 -->|after return| B49
B49 -->|call| B192
B49 -->|after return| B50
B178["Continue at B179 in section 18"]
B184["Continue at B185 in section 19"]
B192["Continue at B193 in section 20"]
B151["Continue at B152 in section 16"]
B173["Continue at B174 in section 18"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#0C0H
ACALL CMD
```

### B42

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
MOV A,#0CEH
ACALL CMD
```

### B45

```asm
ACALL KEYPAD
```

### B46

```asm
ACALL WCHR
```

### B47

```asm
ANL A,#0FH
MOV 32H,A
ACALL DELAY
```

### B48

```asm
ACALL DELAY
```

### B49

```asm
MOV A,#01H
ACALL CMD
```

### B50

```asm
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 113 to 114"]
B51["B52: instructions - lines 115 to 116"]
B52["B53: instructions - lines 117 to 117"]
B53["B54: instructions - lines 118 to 119"]
B54["B55: instructions - lines 120 to 120"]
B55["B56: instructions - lines 122 to 123"]
B56["B57: instructions - lines 124 to 124"]
B57["B58: instructions - lines 125 to 125"]
B58["B59: instructions - lines 126 to 128"]
B59["B60: instructions - lines 129 to 129"]
B50 -->|call| B178
B50 -->|after return| B51
B51 -->|call| B184
B51 -->|after return| B52
B52 -->|call| B192
B52 -->|after return| B53
B53 -->|call| B178
B53 -->|after return| B54
B54 -->|call| B192
B54 -->|after return| B55
B55 -->|call| B178
B55 -->|after return| B56
B56 -->|call| B151
B56 -->|after return| B57
B57 -->|call| B173
B57 -->|after return| B58
B58 -->|call| B192
B58 -->|after return| B59
B59 -->|call| B192
B59 -->|after return| B60
B178["Continue at B179 in section 18"]
B184["Continue at B185 in section 19"]
B192["Continue at B193 in section 20"]
B151["Continue at B152 in section 16"]
B173["Continue at B174 in section 18"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#80H
ACALL CMD
```

### B52

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B53

```asm
ACALL DELAY
```

### B54

```asm
MOV A,#0C0H
ACALL CMD
```

### B55

```asm
ACALL DELAY
```

### B56

```asm
MOV A,#0C7H
ACALL CMD
```

### B57

```asm
ACALL KEYPAD
```

### B58

```asm
ACALL WCHR
```

### B59

```asm
ANL A,#0FH
MOV 33H,A
ACALL DELAY
```

### B60

```asm
ACALL DELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 134 to 135"]
B61["B62: instructions - lines 136 to 136"]
B62["B63: instructions - lines 138 to 139"]
B63["B64: instructions - lines 140 to 141"]
B64["B65: instructions - lines 142 to 142"]
B65["B66: instructions - lines 143 to 146"]
B66["B67: instructions - lines 147 to 148"]
B67["B68: instructions - lines 149 to 149"]
B68["B69: instructions - lines 151 to 152"]
B69["B70: instructions - lines 153 to 153"]
B60 -->|call| B178
B60 -->|after return| B61
B61 -->|call| B192
B61 -->|after return| B62
B62 -->|call| B178
B62 -->|after return| B63
B63 -->|call| B184
B63 -->|after return| B64
B64 -->|call| B192
B64 -->|after return| B65
B65 -->|call| B178
B65 -->|after return| B66
B66 -->|call| B184
B66 -->|after return| B67
B67 -->|call| B192
B67 -->|after return| B68
B68 -->|call| B178
B68 -->|after return| B69
B69 -->|call| B151
B69 -->|after return| B70
B178["Continue at B179 in section 18"]
B192["Continue at B193 in section 20"]
B184["Continue at B185 in section 19"]
B151["Continue at B152 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#01H
ACALL CMD
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
MOV DPTR,#STR6
ACALL WSTR
```

### B65

```asm
ACALL DELAY
```

### B66

```asm
MOV A,#0C0H
ACALL CMD
```

### B67

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
MOV A,#0CEH
ACALL CMD
```

### B70

```asm
ACALL KEYPAD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 154 to 154"]
B71["B72: instructions - lines 155 to 157"]
B72["B73: instructions - lines 158 to 158"]
B73["B74: instructions - lines 160 to 161"]
B74["B75: instructions - lines 162 to 162"]
B75["B76: instructions - lines 164 to 165"]
B76["B77: instructions - lines 166 to 166"]
B77["B78: instructions - lines 167 to 167"]
B78["B79: NEXT1 - lines 169 to 169"]
B79["B80: instructions - lines 170 to 170"]
B70 -->|call| B173
B70 -->|after return| B71
B71 -->|call| B192
B71 -->|after return| B72
B72 -->|call| B192
B72 -->|after return| B73
B73 -->|call| B178
B73 -->|after return| B74
B74 -->|call| B192
B74 -->|after return| B75
B75 -->|condition true| B78
B75 -->|condition false| B76
B76 -->|call| B106
B76 -->|after return| B77
B77 -->|jump| B83
B78 -->|condition true| B81
B78 -->|condition false| B79
B79 -->|call| B121
B79 -->|after return| B80
B173["Continue at B174 in section 18"]
B192["Continue at B193 in section 20"]
B178["Continue at B179 in section 18"]
B106["Continue at B107 in section 11"]
B83["Continue at B84 in section 9"]
B81["Continue at B82 in section 9"]
B121["Continue at B122 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL WCHR
```

### B72

```asm
ANL A,#0FH
MOV 34H,A
ACALL DELAY
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
MOV A,#01H
ACALL CMD
```

### B75

```asm
ACALL DELAY
```

### B76

```asm
MOV A,30H
CJNE A,#1,NEXT1
```

### B77

```asm
ACALL CAT1
```

### B78

```asm
AJMP HERE11
```

### B79

```asm
CJNE A,#2,NEXT2
```

### B80

```asm
ACALL CAT2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 171 to 171"]
B81["B82: NEXT2 - lines 173 to 173"]
B82["B83: instructions - lines 174 to 174"]
B83["B84: HERE11 - lines 180 to 180"]
B84["B85: instructions - lines 181 to 181"]
B85["B86: instructions - lines 182 to 183"]
B86["B87: instructions - lines 184 to 184"]
B87["B88: instructions - lines 186 to 187"]
B88["B89: instructions - lines 188 to 188"]
B89["B90: instructions - lines 189 to 190"]
B80 -->|jump| B83
B81 -->|call| B136
B81 -->|after return| B82
B82 -->|jump| B83
B83 -->|call| B192
B83 -->|after return| B84
B84 -->|call| B192
B84 -->|after return| B85
B85 -->|call| B178
B85 -->|after return| B86
B86 -->|call| B192
B86 -->|after return| B87
B87 -->|call| B178
B87 -->|after return| B88
B88 -->|call| B192
B88 -->|after return| B89
B89 -->|call| B184
B89 -->|after return| B90
B136["Continue at B137 in section 14"]
B192["Continue at B193 in section 20"]
B178["Continue at B179 in section 18"]
B184["Continue at B185 in section 19"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
AJMP HERE11
```

### B82

```asm
ACALL CAT3
```

### B83

```asm
AJMP HERE11
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
MOV A,#01H
ACALL CMD
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A,#80H
ACALL CMD
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
MOV DPTR,#STR7
ACALL WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 192 to 192"]
B91["B92: instructions - lines 193 to 194"]
B92["B93: instructions - lines 195 to 209"]
B93["B94: instructions - lines 211 to 213"]
B94["B95: instructions - lines 215 to 217"]
B95["B96: instructions - lines 218 to 218"]
B96["B97: instructions - lines 219 to 219"]
B97["B98: instructions - lines 220 to 220"]
B98["B99: instructions - lines 221 to 221"]
B99["B100: instructions - lines 222 to 222"]
B90 -->|call| B192
B90 -->|after return| B91
B91 -->|call| B178
B91 -->|after return| B92
B92 -->|call| B173
B92 -->|after return| B93
B93 -->|call| B173
B93 -->|after return| B94
B94 -->|call| B173
B94 -->|after return| B95
B95 -->|call| B192
B95 -->|after return| B96
B96 -->|call| B192
B96 -->|after return| B97
B97 -->|call| B192
B97 -->|after return| B98
B98 -->|call| B192
B98 -->|after return| B99
B99 -->|call| B192
B99 -->|after return| B100
B192["Continue at B193 in section 20"]
B178["Continue at B179 in section 18"]
B173["Continue at B174 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL DELAY
```

### B92

```asm
MOV A,#0C4H
ACALL CMD
```

### B93

```asm
MOV A,35H
MOV B,#10
DIV AB
MOV R3,A
MOV A,B
MOV 37H,A
MOV B,#10
MOV A,R3
DIV AB
MOV R3,A
ADD A,#30H
ACALL WCHR
```

### B94

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B95

```asm
MOV A,37H
ADD A,#30H
ACALL WCHR
```

### B96

```asm
ACALL DELAY
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

```asm
ACALL DELAY
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 224 to 225"]
B101["B102: instructions - lines 226 to 226"]
B102["B103: instructions - lines 228 to 229"]
B103["B104: instructions - lines 230 to 231"]
B104["B105: instructions - lines 232 to 232"]
B105["B106: H123 - lines 233 to 233"]
B106["B107: CAT1 - lines 238 to 239"]
B107["B108: instructions - lines 240 to 241"]
B108["B109: instructions - lines 242 to 244"]
B109["B110: instructions - lines 245 to 245"]
B100 -->|call| B178
B100 -->|after return| B101
B101 -->|call| B192
B101 -->|after return| B102
B102 -->|call| B178
B102 -->|after return| B103
B103 -->|call| B184
B103 -->|after return| B104
B104 -->|call| B192
B104 -->|after return| B105
B105 -->|jump| B105
B106 -->|call| B192
B106 -->|after return| B107
B107 -->|call| B192
B107 -->|after return| B108
B108 -->|condition true| B110
B108 -->|condition false| B109
B109 -->|next| B110
B178["Continue at B179 in section 18"]
B192["Continue at B193 in section 20"]
B184["Continue at B185 in section 19"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A,#01H
ACALL CMD
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
MOV A,#80H
ACALL CMD
```

### B104

```asm
MOV DPTR,#STR8
ACALL WSTR
```

### B105

```asm
ACALL DELAY
```

### B106

```asm
SJMP H123
```

### B107

```asm
CLR P1.0
ACALL DELAY
```

### B108

```asm
SETB P1.0
ACALL DELAY
```

### B109

```asm
MOV A,#38
MOV R0,31H
CJNE R0,#1,CONT
```

### B110

```asm
ADD A,#8
```

## Section 12

```mermaid
flowchart TD
B110["B111: CONT - lines 247 to 248"]
B111["B112: instructions - lines 249 to 250"]
B112["B113: instructions - lines 251 to 252"]
B113["B114: instructions - lines 253 to 253"]
B114["B115: CONT2 - lines 255 to 256"]
B115["B116: instructions - lines 257 to 258"]
B116["B117: instructions - lines 260 to 263"]
B117["B118: instructions - lines 264 to 264"]
B118["B119: CONT3 - lines 266 to 268"]
B119["B120: instructions - lines 269 to 270"]
B110 -->|call| B192
B110 -->|after return| B111
B111 -->|call| B192
B111 -->|after return| B112
B112 -->|condition true| B114
B112 -->|condition false| B113
B113 -->|next| B114
B114 -->|call| B192
B114 -->|after return| B115
B115 -->|call| B192
B115 -->|after return| B116
B116 -->|condition true| B118
B116 -->|condition false| B117
B117 -->|next| B118
B118 -->|call| B192
B118 -->|after return| B119
B119 -->|call| B192
B119 -->|after return| B120
B192["Continue at B193 in section 20"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
CLR P1.0
ACALL DELAY
```

### B112

```asm
SETB P1.0
ACALL DELAY
```

### B113

```asm
MOV R0,32H
CJNE R0,#1,CONT2
```

### B114

```asm
ADD A,#10
```

### B115

```asm
CLR P1.0
ACALL DELAY
```

### B116

```asm
SETB P1.0
ACALL DELAY
```

### B117

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONT3
```

### B118

```asm
SUBB A, #5
```

### B119

```asm
MOV 35H,A
CLR P1.0
ACALL DELAY
```

### B120

```asm
SETB P1.0
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 272 to 272"]
B121["B122: CAT2 - lines 274 to 275"]
B122["B123: instructions - lines 276 to 277"]
B123["B124: instructions - lines 278 to 280"]
B124["B125: instructions - lines 281 to 281"]
B125["B126: CONTT - lines 283 to 284"]
B126["B127: instructions - lines 285 to 286"]
B127["B128: instructions - lines 287 to 288"]
B128["B129: instructions - lines 289 to 289"]
B129["B130: CONTT2 - lines 291 to 292"]
B121 -->|call| B192
B121 -->|after return| B122
B122 -->|call| B192
B122 -->|after return| B123
B123 -->|condition true| B125
B123 -->|condition false| B124
B124 -->|next| B125
B125 -->|call| B192
B125 -->|after return| B126
B126 -->|call| B192
B126 -->|after return| B127
B127 -->|condition true| B129
B127 -->|condition false| B128
B128 -->|next| B129
B129 -->|call| B192
B129 -->|after return| B130
B192["Continue at B193 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
RET
```

### B122

```asm
CLR P1.1
ACALL DELAY
```

### B123

```asm
SETB P1.1
ACALL DELAY
```

### B124

```asm
MOV A,#45
MOV R0,31H
CJNE R0,#1,CONTT
```

### B125

```asm
ADD A,#10
```

### B126

```asm
CLR P1.1
ACALL DELAY
```

### B127

```asm
SETB P1.1
ACALL DELAY
```

### B128

```asm
MOV R0,32H
CJNE R0,#1,CONTT2
```

### B129

```asm
ADD A,#15
```

### B130

```asm
CLR P1.1
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 293 to 294"]
B131["B132: instructions - lines 296 to 299"]
B132["B133: instructions - lines 300 to 300"]
B133["B134: CONTT3 - lines 302 to 304"]
B134["B135: instructions - lines 305 to 306"]
B135["B136: instructions - lines 308 to 308"]
B136["B137: CAT3 - lines 310 to 311"]
B137["B138: instructions - lines 312 to 313"]
B138["B139: instructions - lines 314 to 316"]
B139["B140: instructions - lines 317 to 317"]
B130 -->|call| B192
B130 -->|after return| B131
B131 -->|condition true| B133
B131 -->|condition false| B132
B132 -->|next| B133
B133 -->|call| B192
B133 -->|after return| B134
B134 -->|call| B192
B134 -->|after return| B135
B136 -->|call| B192
B136 -->|after return| B137
B137 -->|call| B192
B137 -->|after return| B138
B138 -->|condition true| B140
B138 -->|condition false| B139
B139 -->|next| B140
B192["Continue at B193 in section 20"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
SETB P1.1
ACALL DELAY
```

### B132

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTT3
```

### B133

```asm
SUBB A, #8
```

### B134

```asm
MOV 35H,A
CLR P1.1
ACALL DELAY
```

### B135

```asm
SETB P1.1
ACALL DELAY
```

### B136

Return to the instruction following the active call.

```asm
RET
```

### B137

```asm
CLR P1.2
ACALL DELAY
```

### B138

```asm
SETB P1.2
ACALL DELAY
```

### B139

```asm
MOV A,#66
MOV R0,31H
CJNE R0,#1,CONTTT
```

### B140

```asm
ADD A,#12
```

## Section 15

```mermaid
flowchart TD
B140["B141: CONTTT - lines 319 to 320"]
B141["B142: instructions - lines 321 to 322"]
B142["B143: instructions - lines 323 to 324"]
B143["B144: instructions - lines 325 to 325"]
B144["B145: CONTTT2 - lines 327 to 328"]
B145["B146: instructions - lines 329 to 330"]
B146["B147: instructions - lines 332 to 335"]
B147["B148: instructions - lines 336 to 336"]
B148["B149: CONTTT3 - lines 338 to 340"]
B149["B150: instructions - lines 341 to 342"]
B140 -->|call| B192
B140 -->|after return| B141
B141 -->|call| B192
B141 -->|after return| B142
B142 -->|condition true| B144
B142 -->|condition false| B143
B143 -->|next| B144
B144 -->|call| B192
B144 -->|after return| B145
B145 -->|call| B192
B145 -->|after return| B146
B146 -->|condition true| B148
B146 -->|condition false| B147
B147 -->|next| B148
B148 -->|call| B192
B148 -->|after return| B149
B149 -->|call| B192
B149 -->|after return| B150
B192["Continue at B193 in section 20"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
CLR P1.2
ACALL DELAY
```

### B142

```asm
SETB P1.2
ACALL DELAY
```

### B143

```asm
MOV R0,32H
CJNE R0,#1,CONTTT2
```

### B144

```asm
ADD A,#18
```

### B145

```asm
CLR P1.2
ACALL DELAY
```

### B146

```asm
SETB P1.2
ACALL DELAY
```

### B147

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTTT3
```

### B148

```asm
SUBB A, #15
```

### B149

```asm
MOV 35H,A
CLR P1.2
ACALL DELAY
```

### B150

```asm
SETB P1.2
ACALL DELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 343 to 343"]
B151["B152: KEYPAD - lines 349 to 349"]
B152["B153: K1 - lines 350 to 353"]
B153["B154: K2 - lines 355 to 357"]
B154["B155: instructions - lines 358 to 358"]
B155["B156: OVER1 - lines 361 to 364"]
B156["B157: instructions - lines 365 to 368"]
B157["B158: instructions - lines 369 to 372"]
B158["B159: instructions - lines 373 to 376"]
B159["B160: instructions - lines 377 to 377"]
B151 -->|next| B152
B152 -->|condition true| B152
B152 -->|condition false| B153
B153 -->|condition true| B155
B153 -->|condition false| B154
B154 -->|jump| B153
B155 -->|condition true| B160
B155 -->|condition false| B156
B156 -->|condition true| B161
B156 -->|condition false| B157
B157 -->|condition true| B162
B157 -->|condition false| B158
B158 -->|condition true| B163
B158 -->|condition false| B159
B159 -->|jump| B153
B160["Continue at B161 in section 17"]
B161["Continue at B162 in section 17"]
B162["Continue at B163 in section 17"]
B163["Continue at B164 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
RET
```

### B152

```asm
MOV P0,#01110000B
```

### B153

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B154

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B155

```asm
SJMP K2
```

### B156

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B157

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B158

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B159

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B160

```asm
LJMP K2
```

## Section 17

```mermaid
flowchart TD
B160["B161: ROW_0 - lines 378 to 379"]
B161["B162: ROW_1 - lines 380 to 381"]
B162["B163: ROW_2 - lines 382 to 383"]
B163["B164: ROW_3 - lines 384 to 384"]
B164["B165: FIND - lines 387 to 387"]
B165["B166: FIND1 - lines 389 to 390"]
B166["B167: instructions - lines 391 to 392"]
B167["B168: MATCH - lines 393 to 395"]
B168["B169: INLCD - lines 399 to 407"]
B169["B170: instructions - lines 409 to 418"]
B160 -->|jump| B164
B161 -->|jump| B164
B162 -->|jump| B164
B163 -->|next| B164
B164 -->|next| B165
B165 -->|condition true| B167
B165 -->|condition false| B166
B166 -->|jump| B165
B168 -->|call| B189
B168 -->|after return| B169
B169 -->|call| B189
B169 -->|after return| B170
B189["Continue at B190 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B162

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B163

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B164

```asm
MOV DPTR,#KCODE3
```

### B165

```asm
RLC A
```

### B166

```asm
RLC A
JNC MATCH
```

### B167

```asm
INC DPTR
SJMP FIND1
```

### B168

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B169

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

### B170

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

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 420 to 435"]
B171["B172: instructions - lines 437 to 449"]
B172["B173: instructions - lines 450 to 450"]
B173["B174: WCHR - lines 455 to 459"]
B174["B175: instructions - lines 460 to 460"]
B175["B176: instructions - lines 461 to 463"]
B176["B177: instructions - lines 464 to 464"]
B177["B178: instructions - lines 465 to 467"]
B178["B179: CMD - lines 470 to 472"]
B179["B180: instructions - lines 473 to 473"]
B170 -->|call| B189
B170 -->|after return| B171
B171 -->|call| B189
B171 -->|after return| B172
B173 -->|call| B183
B173 -->|after return| B174
B174 -->|call| B189
B174 -->|after return| B175
B175 -->|call| B183
B175 -->|after return| B176
B176 -->|call| B189
B176 -->|after return| B177
B178 -->|call| B183
B178 -->|after return| B179
B179 -->|call| B189
B179 -->|after return| B180
B189["Continue at B190 in section 19"]
B183["Continue at B184 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

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

### B172

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

### B173

Return to the instruction following the active call.

```asm
RET
```

### B174

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B175

```asm
ACALL LDELAY
```

### B176

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B177

```asm
ACALL LDELAY
```

### B178

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B179

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B180

```asm
ACALL LDELAY
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 474 to 476"]
B181["B182: instructions - lines 477 to 477"]
B182["B183: instructions - lines 478 to 478"]
B183["B184: COMMON - lines 482 to 487"]
B184["B185: WSTR - lines 491 to 491"]
B185["B186: CONT1 - lines 493 to 495"]
B186["B187: PRINT - lines 497 to 497"]
B187["B188: instructions - lines 498 to 499"]
B188["B189: EXIT1 - lines 500 to 501"]
B189["B190: LDELAY - lines 505 to 505"]
B180 -->|call| B183
B180 -->|after return| B181
B181 -->|call| B189
B181 -->|after return| B182
B184 -->|next| B185
B185 -->|condition true| B188
B185 -->|condition false| B186
B186 -->|call| B173
B186 -->|after return| B187
B187 -->|jump| B185
B189 -->|next| B190
B173["Continue at B174 in section 18"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B182

```asm
ACALL LDELAY
```

### B183

Return to the instruction following the active call.

```asm
RET
```

### B184

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B185

```asm
PUSH    ACC
```

### B186

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B187

```asm
ACALL    WCHR
```

### B188

```asm
INC DPTR
AJMP    CONT1
```

### B189

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B190

```asm
MOV R6, #50
```

## Section 20

```mermaid
flowchart TD
B190["B191: HH - lines 506 to 506"]
B191["B192: instructions - lines 507 to 507"]
B192["B193: DELAY - lines 509 to 509"]
B193["B194: HE - lines 510 to 510"]
B194["B195: HE1 - lines 511 to 511"]
B195["B196: instructions - lines 512 to 512"]
B196["B197: instructions - lines 513 to 513"]
B190 -->|condition true| B190
B190 -->|condition false| B191
B192 -->|next| B193
B193 -->|next| B194
B194 -->|condition true| B194
B194 -->|condition false| B195
B195 -->|condition true| B193
B195 -->|condition false| B196
```

### B191

```asm
DJNZ R0,HH
```

### B192

Return to the instruction following the active call.

```asm
RET
```

### B193

```asm
MOV R6, #50
```

### B194

```asm
MOV R7,#10
```

### B195

```asm
DJNZ R7, HE1
```

### B196

```asm
DJNZ R0,HE
```

### B197

Return to the instruction following the active call.

```asm
RET
```
