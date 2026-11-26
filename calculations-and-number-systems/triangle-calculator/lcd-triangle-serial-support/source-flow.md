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
B0["B1: instructions - lines 10 to 10"]
B1["B2: instructions - lines 12 to 20"]
B2["B3: MENU - lines 24 to 24"]
B3["B4: instructions - lines 25 to 25"]
B4["B5: instructions - lines 26 to 27"]
B5["B6: instructions - lines 29 to 29"]
B6["B7: instructions - lines 30 to 30"]
B7["B8: instructions - lines 31 to 31"]
B8["B9: instructions - lines 32 to 32"]
B9["B10: instructions - lines 33 to 33"]
B0 -->|call| B133
B0 -->|after return| B1
B1 -->|call| B30
B1 -->|after return| B2
B2 -->|call| B40
B2 -->|after return| B3
B3 -->|call| B50
B3 -->|after return| B4
B4 -->|condition true| B10
B4 -->|condition false| B5
B5 -->|call| B57
B5 -->|after return| B6
B6 -->|call| B87
B6 -->|after return| B7
B7 -->|call| B24
B7 -->|after return| B8
B8 -->|call| B109
B8 -->|after return| B9
B9 -->|jump| B26
B133["Continue at B134 in section 14"]
B30["Continue at B31 in section 4"]
B40["Continue at B41 in section 5"]
B50["Continue at B51 in section 6"]
B10["Continue at B11 in section 2"]
B57["Continue at B58 in section 6"]
B87["Continue at B88 in section 9"]
B24["Continue at B25 in section 3"]
B109["Continue at B110 in section 11"]
B26["Continue at B27 in section 3"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H, #1
MOV 40H, #3
MOV 41H, #4
MOV 42H, #2
MOV 43H, #3
MOV 44H, #4
MOV 50H, #0
MOV 51H, #0
ACALL WELCOME
```

### B3

```asm
ACALL Menuu
```

### B4

```asm
ACALL SELECTT
```

### B5

```asm
MOV A,30H
CJNE A,#1,OPERATION2
```

### B6

```asm
ACALL OPTIONN1
```

### B7

```asm
ACALL ENTER_DIM
```

### B8

```asm
ACALL AREAA
```

### B9

```asm
ACALL PRINT1
```

### B10

```asm
SJMP CONTINUE
```

## Section 2

```mermaid
flowchart TD
B10["B11: OPERATION2 - lines 36 to 36"]
B11["B12: instructions - lines 38 to 38"]
B12["B13: instructions - lines 39 to 39"]
B13["B14: instructions - lines 40 to 40"]
B14["B15: instructions - lines 41 to 41"]
B15["B16: instructions - lines 42 to 42"]
B16["B17: WRONG - lines 45 to 45"]
B17["B18: instructions - lines 46 to 46"]
B18["B19: EXIT - lines 49 to 49"]
B19["B20: instructions - lines 50 to 50"]
B10 -->|condition true| B16
B10 -->|condition false| B11
B11 -->|call| B62
B11 -->|after return| B12
B12 -->|call| B72
B12 -->|after return| B13
B13 -->|call| B25
B13 -->|after return| B14
B14 -->|call| B123
B14 -->|after return| B15
B15 -->|jump| B26
B16 -->|call| B67
B16 -->|after return| B17
B17 -->|jump| B2
B18 -->|call| B172
B18 -->|after return| B19
B19 -->|call| B179
B19 -->|after return| B20
B62["Continue at B63 in section 7"]
B72["Continue at B73 in section 8"]
B25["Continue at B26 in section 3"]
B123["Continue at B124 in section 13"]
B26["Continue at B27 in section 3"]
B67["Continue at B68 in section 7"]
B2["Continue at B3 in section 1"]
B172["Continue at B173 in section 18"]
B179["Continue at B180 in section 18"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE A,#2,WRONG
```

### B12

```asm
ACALL OPTIONN2
```

### B13

```asm
ACALL ENTER_SIDES
```

### B14

```asm
ACALL PERIMETER
```

### B15

```asm
ACALL PRINT2
```

### B16

```asm
SJMP CONTINUE
```

### B17

```asm
ACALL WRONGG
```

### B18

```asm
SJMP MENU
```

### B19

```asm
ACALL CLEAR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 51 to 52"]
B21["B22: instructions - lines 53 to 54"]
B22["B23: instructions - lines 55 to 56"]
B23["B24: EE - lines 57 to 57"]
B24["B25: AREAA - lines 62 to 71"]
B25["B26: PERIMETER - lines 75 to 82"]
B26["B27: CONTINUE - lines 85 to 85"]
B27["B28: instructions - lines 86 to 87"]
B28["B29: instructions - lines 88 to 88"]
B29["B30: instructions - lines 89 to 89"]
B20 -->|call| B153
B20 -->|after return| B21
B21 -->|call| B153
B21 -->|after return| B22
B22 -->|call| B160
B22 -->|after return| B23
B23 -->|jump| B23
B26 -->|call| B100
B26 -->|after return| B27
B27 -->|condition true| B18
B27 -->|condition false| B28
B28 -->|jump| B2
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B100["Continue at B101 in section 11"]
B18["Continue at B19 in section 2"]
B2["Continue at B3 in section 1"]
```

### B21

```asm
MOV A, #8H
ACALL CMD
```

### B22

```asm
MOV A, #0H
ACALL CMD
```

### B23

```asm
mov dptr, #THANKS
acall wstr
```

### B24

```asm
SJMP EE
```

### B25

Return to the instruction following the active call.

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV B,#2
DIV AB
MOV 50H,A
MOV 51H,B
RET
```

### B26

Return to the instruction following the active call.

```asm
MOV A,42H
ADD A,43H
ADD A,44H
MOV 50H,A
RET
```

### B27

```asm
ACALL CON
```

### B28

```asm
MOV A,#2
CJNE A,#1,EXIT
```

### B29

```asm
SJMP MENU
```

### B30

Return to the instruction following the active call.

```asm
RET
```

## Section 4

```mermaid
flowchart TD
B30["B31: WELCOME - lines 93 to 93"]
B31["B32: instructions - lines 94 to 94"]
B32["B33: instructions - lines 95 to 96"]
B33["B34: instructions - lines 97 to 98"]
B34["B35: instructions - lines 99 to 100"]
B35["B36: instructions - lines 102 to 103"]
B36["B37: instructions - lines 104 to 105"]
B37["B38: instructions - lines 106 to 107"]
B38["B39: instructions - lines 108 to 108"]
B39["B40: instructions - lines 109 to 109"]
B30 -->|call| B172
B30 -->|after return| B31
B31 -->|call| B179
B31 -->|after return| B32
B32 -->|call| B153
B32 -->|after return| B33
B33 -->|call| B153
B33 -->|after return| B34
B34 -->|call| B160
B34 -->|after return| B35
B35 -->|call| B153
B35 -->|after return| B36
B36 -->|call| B153
B36 -->|after return| B37
B37 -->|call| B160
B37 -->|after return| B38
B38 -->|call| B179
B38 -->|after return| B39
B172["Continue at B173 in section 18"]
B179["Continue at B180 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
```

### B31

```asm
ACALL CLEAR
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
MOV A, #8H
ACALL CMD
```

### B34

```asm
MOV A, #0H
ACALL CMD
```

### B35

```asm
mov dptr, #NAMEE
acall wstr
```

### B36

```asm
MOV A, #1100B
ACALL CMD
```

### B37

```asm
MOV A, #0H
ACALL CMD
```

### B38

```asm
mov dptr, #PROJECT
acall wstr
```

### B39

```asm
acall delay
```

### B40

Return to the instruction following the active call.

```asm
ret
```

## Section 5

```mermaid
flowchart TD
B40["B41: MENUU - lines 112 to 112"]
B41["B42: instructions - lines 113 to 113"]
B42["B43: instructions - lines 114 to 115"]
B43["B44: instructions - lines 116 to 117"]
B44["B45: instructions - lines 118 to 119"]
B45["B46: instructions - lines 121 to 122"]
B46["B47: instructions - lines 123 to 124"]
B47["B48: instructions - lines 125 to 126"]
B48["B49: instructions - lines 127 to 127"]
B49["B50: instructions - lines 128 to 128"]
B40 -->|call| B172
B40 -->|after return| B41
B41 -->|call| B179
B41 -->|after return| B42
B42 -->|call| B153
B42 -->|after return| B43
B43 -->|call| B153
B43 -->|after return| B44
B44 -->|call| B160
B44 -->|after return| B45
B45 -->|call| B153
B45 -->|after return| B46
B46 -->|call| B153
B46 -->|after return| B47
B47 -->|call| B160
B47 -->|after return| B48
B48 -->|call| B179
B48 -->|after return| B49
B172["Continue at B173 in section 18"]
B179["Continue at B180 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
```

### B41

```asm
ACALL CLEAR
```

### B42

```asm
ACALL DELAY
```

### B43

```asm
MOV A, #8H
ACALL CMD
```

### B44

```asm
MOV A, #0H
ACALL CMD
```

### B45

```asm
mov dptr, #OP1
acall wstr
```

### B46

```asm
MOV A, #1100B
ACALL CMD
```

### B47

```asm
MOV A, #0H
ACALL CMD
```

### B48

```asm
mov dptr, #OP2
acall wstr
```

### B49

```asm
acall delay
```

### B50

Return to the instruction following the active call.

```asm
ret
```

## Section 6

```mermaid
flowchart TD
B50["B51: SELECTT - lines 131 to 131"]
B51["B52: instructions - lines 132 to 132"]
B52["B53: instructions - lines 133 to 134"]
B53["B54: instructions - lines 135 to 136"]
B54["B55: instructions - lines 137 to 138"]
B55["B56: instructions - lines 139 to 141"]
B56["B57: instructions - lines 143 to 143"]
B57["B58: OPTIONN1 - lines 146 to 147"]
B58["B59: instructions - lines 148 to 149"]
B59["B60: instructions - lines 150 to 151"]
B50 -->|call| B172
B50 -->|after return| B51
B51 -->|call| B179
B51 -->|after return| B52
B52 -->|call| B153
B52 -->|after return| B53
B53 -->|call| B153
B53 -->|after return| B54
B54 -->|call| B160
B54 -->|after return| B55
B55 -->|call| B155
B55 -->|after return| B56
B57 -->|call| B153
B57 -->|after return| B58
B58 -->|call| B153
B58 -->|after return| B59
B59 -->|call| B160
B59 -->|after return| B60
B172["Continue at B173 in section 18"]
B179["Continue at B180 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B155["Continue at B156 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL CLEAR
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
MOV A, #8H
ACALL CMD
```

### B54

```asm
MOV A, #0H
ACALL CMD
```

### B55

```asm
mov dptr, #MSG
acall wstr
```

### B56

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B57

Return to the instruction following the active call.

```asm
RET
```

### B58

```asm
MOV A, #1100B
ACALL CMD
```

### B59

```asm
MOV A, #0H
ACALL CMD
```

### B60

```asm
mov dptr, #MSG1
acall wstr
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 152 to 152"]
B61["B62: instructions - lines 153 to 153"]
B62["B63: OPTIONN2 - lines 156 to 157"]
B63["B64: instructions - lines 158 to 159"]
B64["B65: instructions - lines 160 to 161"]
B65["B66: instructions - lines 162 to 162"]
B66["B67: instructions - lines 163 to 163"]
B67["B68: WRONGG - lines 166 to 167"]
B68["B69: instructions - lines 168 to 169"]
B69["B70: instructions - lines 170 to 171"]
B60 -->|call| B179
B60 -->|after return| B61
B62 -->|call| B153
B62 -->|after return| B63
B63 -->|call| B153
B63 -->|after return| B64
B64 -->|call| B160
B64 -->|after return| B65
B65 -->|call| B179
B65 -->|after return| B66
B67 -->|call| B153
B67 -->|after return| B68
B68 -->|call| B153
B68 -->|after return| B69
B69 -->|call| B160
B69 -->|after return| B70
B179["Continue at B180 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
acall delay
```

### B62

Return to the instruction following the active call.

```asm
ret
```

### B63

```asm
MOV A, #1100B
ACALL CMD
```

### B64

```asm
MOV A, #0H
ACALL CMD
```

### B65

```asm
mov dptr, #MSG2
acall wstr
```

### B66

```asm
acall delay
```

### B67

Return to the instruction following the active call.

```asm
ret
```

### B68

```asm
MOV A, #1100B
ACALL CMD
```

### B69

```asm
MOV A, #0H
ACALL CMD
```

### B70

```asm
mov dptr, #WRONGGG
acall wstr
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 172 to 172"]
B71["B72: instructions - lines 173 to 173"]
B72["B73: ENTER_SIDES - lines 176 to 176"]
B73["B74: instructions - lines 177 to 177"]
B74["B75: instructions - lines 178 to 179"]
B75["B76: instructions - lines 180 to 181"]
B76["B77: instructions - lines 182 to 183"]
B77["B78: instructions - lines 185 to 186"]
B78["B79: instructions - lines 187 to 188"]
B79["B80: instructions - lines 189 to 190"]
B70 -->|call| B179
B70 -->|after return| B71
B72 -->|call| B172
B72 -->|after return| B73
B73 -->|call| B179
B73 -->|after return| B74
B74 -->|call| B153
B74 -->|after return| B75
B75 -->|call| B153
B75 -->|after return| B76
B76 -->|call| B160
B76 -->|after return| B77
B77 -->|call| B153
B77 -->|after return| B78
B78 -->|call| B153
B78 -->|after return| B79
B79 -->|call| B160
B79 -->|after return| B80
B179["Continue at B180 in section 18"]
B172["Continue at B173 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
acall delay
```

### B72

Return to the instruction following the active call.

```asm
ret
```

### B73

```asm
ACALL CLEAR
```

### B74

```asm
ACALL DELAY
```

### B75

```asm
MOV A, #8H
ACALL CMD
```

### B76

```asm
MOV A, #0H
ACALL CMD
```

### B77

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B78

```asm
MOV A, #1100B
ACALL CMD
```

### B79

```asm
MOV A, #0H
ACALL CMD
```

### B80

```asm
mov dptr, #SIDEA
acall wstr
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 191 to 193"]
B81["B82: instructions - lines 194 to 195"]
B82["B83: instructions - lines 196 to 198"]
B83["B84: instructions - lines 199 to 200"]
B84["B85: instructions - lines 201 to 203"]
B85["B86: instructions - lines 204 to 204"]
B86["B87: instructions - lines 205 to 205"]
B87["B88: ENTER_DIM - lines 209 to 209"]
B88["B89: instructions - lines 210 to 210"]
B89["B90: instructions - lines 211 to 212"]
B80 -->|call| B155
B80 -->|after return| B81
B81 -->|call| B160
B81 -->|after return| B82
B82 -->|call| B155
B82 -->|after return| B83
B83 -->|call| B160
B83 -->|after return| B84
B84 -->|call| B155
B84 -->|after return| B85
B85 -->|call| B179
B85 -->|after return| B86
B87 -->|call| B172
B87 -->|after return| B88
B88 -->|call| B179
B88 -->|after return| B89
B89 -->|call| B153
B89 -->|after return| B90
B155["Continue at B156 in section 16"]
B160["Continue at B161 in section 17"]
B179["Continue at B180 in section 18"]
B172["Continue at B173 in section 18"]
B153["Continue at B154 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,42H
ADD A,#30H
ACALL WCHR
```

### B82

```asm
mov dptr, #SIDEB
acall wstr
```

### B83

```asm
MOV A,43H
ADD A,#30H
ACALL WCHR
```

### B84

```asm
mov dptr, #SIDEC
acall wstr
```

### B85

```asm
MOV A,44H
ADD A,#30H
ACALL WCHR
```

### B86

```asm
ACALL DELAY
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

```asm
ACALL CLEAR
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
MOV A, #8H
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 213 to 214"]
B91["B92: instructions - lines 215 to 216"]
B92["B93: instructions - lines 217 to 218"]
B93["B94: instructions - lines 219 to 220"]
B94["B95: instructions - lines 221 to 222"]
B95["B96: instructions - lines 223 to 225"]
B96["B97: instructions - lines 226 to 227"]
B97["B98: instructions - lines 228 to 230"]
B98["B99: instructions - lines 231 to 231"]
B99["B100: instructions - lines 232 to 232"]
B90 -->|call| B153
B90 -->|after return| B91
B91 -->|call| B160
B91 -->|after return| B92
B92 -->|call| B153
B92 -->|after return| B93
B93 -->|call| B153
B93 -->|after return| B94
B94 -->|call| B160
B94 -->|after return| B95
B95 -->|call| B155
B95 -->|after return| B96
B96 -->|call| B160
B96 -->|after return| B97
B97 -->|call| B155
B97 -->|after return| B98
B98 -->|call| B179
B98 -->|after return| B99
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B155["Continue at B156 in section 16"]
B179["Continue at B180 in section 18"]
```

### B91

```asm
MOV A, #0H
ACALL CMD
```

### B92

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B93

```asm
MOV A, #1100B
ACALL CMD
```

### B94

```asm
MOV A, #0H
ACALL CMD
```

### B95

```asm
mov dptr, #SIDEB
acall wstr
```

### B96

```asm
MOV A,40H
ADD A,#30H
ACALL WCHR
```

### B97

```asm
mov dptr, #HIGHT
acall wstr
```

### B98

```asm
MOV A,41H
ADD A,#30H
ACALL WCHR
```

### B99

```asm
ACALL DELAY
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: CON - lines 235 to 235"]
B101["B102: instructions - lines 236 to 236"]
B102["B103: instructions - lines 237 to 238"]
B103["B104: instructions - lines 239 to 240"]
B104["B105: instructions - lines 241 to 242"]
B105["B106: instructions - lines 243 to 244"]
B106["B107: instructions - lines 245 to 246"]
B107["B108: instructions - lines 247 to 248"]
B108["B109: instructions - lines 249 to 249"]
B109["B110: PRINT1 - lines 252 to 252"]
B100 -->|call| B172
B100 -->|after return| B101
B101 -->|call| B179
B101 -->|after return| B102
B102 -->|call| B153
B102 -->|after return| B103
B103 -->|call| B153
B103 -->|after return| B104
B104 -->|call| B160
B104 -->|after return| B105
B105 -->|call| B153
B105 -->|after return| B106
B106 -->|call| B153
B106 -->|after return| B107
B107 -->|call| B160
B107 -->|after return| B108
B109 -->|call| B172
B109 -->|after return| B110
B172["Continue at B173 in section 18"]
B179["Continue at B180 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
MOV A, #8H
ACALL CMD
```

### B104

```asm
MOV A, #0H
ACALL CMD
```

### B105

```asm
mov dptr, #CONT11
acall wstr
```

### B106

```asm
MOV A, #1100B
ACALL CMD
```

### B107

```asm
MOV A, #0H
ACALL CMD
```

### B108

```asm
mov dptr, #CONT22
acall wstr
```

### B109

Return to the instruction following the active call.

```asm
RET
```

### B110

```asm
ACALL CLEAR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 253 to 253"]
B111["B112: instructions - lines 254 to 255"]
B112["B113: instructions - lines 256 to 257"]
B113["B114: instructions - lines 258 to 259"]
B114["B115: instructions - lines 260 to 264"]
B115["B116: instructions - lines 265 to 267"]
B116["B117: instructions - lines 268 to 268"]
B117["B118: instructions - lines 270 to 271"]
B118["B119: instructions - lines 272 to 273"]
B119["B120: instructions - lines 274 to 275"]
B110 -->|call| B179
B110 -->|after return| B111
B111 -->|call| B153
B111 -->|after return| B112
B112 -->|call| B153
B112 -->|after return| B113
B113 -->|call| B160
B113 -->|after return| B114
B114 -->|call| B155
B114 -->|after return| B115
B115 -->|call| B155
B115 -->|after return| B116
B116 -->|call| B165
B116 -->|after return| B117
B117 -->|call| B153
B117 -->|after return| B118
B118 -->|call| B153
B118 -->|after return| B119
B119 -->|call| B160
B119 -->|after return| B120
B179["Continue at B180 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B155["Continue at B156 in section 16"]
B165["Continue at B166 in section 17"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL DELAY
```

### B112

```asm
MOV A, #8H
ACALL CMD
```

### B113

```asm
MOV A, #0H
ACALL CMD
```

### B114

```asm
mov dptr, #AAREA
acall wstr
```

### B115

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B116

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B117

```asm
ACALL LDELAY
```

### B118

```asm
MOV A, #1100B
ACALL CMD
```

### B119

```asm
MOV A, #0H
ACALL CMD
```

### B120

```asm
mov dptr, #REMINDER
acall wstr
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 276 to 278"]
B121["B122: instructions - lines 280 to 280"]
B122["B123: instructions - lines 282 to 282"]
B123["B124: PRINT2 - lines 285 to 285"]
B124["B125: instructions - lines 286 to 286"]
B125["B126: instructions - lines 287 to 288"]
B126["B127: instructions - lines 289 to 290"]
B127["B128: instructions - lines 291 to 292"]
B128["B129: instructions - lines 294 to 298"]
B129["B130: instructions - lines 299 to 301"]
B120 -->|call| B155
B120 -->|after return| B121
B121 -->|call| B179
B121 -->|after return| B122
B123 -->|call| B172
B123 -->|after return| B124
B124 -->|call| B179
B124 -->|after return| B125
B125 -->|call| B153
B125 -->|after return| B126
B126 -->|call| B153
B126 -->|after return| B127
B127 -->|call| B160
B127 -->|after return| B128
B128 -->|call| B155
B128 -->|after return| B129
B129 -->|call| B155
B129 -->|after return| B130
B155["Continue at B156 in section 16"]
B179["Continue at B180 in section 18"]
B172["Continue at B173 in section 18"]
B153["Continue at B154 in section 16"]
B160["Continue at B161 in section 17"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B122

```asm
ACALL DELAY
```

### B123

Return to the instruction following the active call.

```asm
RET
```

### B124

```asm
ACALL CLEAR
```

### B125

```asm
ACALL DELAY
```

### B126

```asm
MOV A, #8H
ACALL CMD
```

### B127

```asm
MOV A, #0H
ACALL CMD
```

### B128

```asm
mov dptr, #PPERIMETER
acall wstr
```

### B129

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B130

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 302 to 302"]
B131["B132: instructions - lines 303 to 303"]
B132["B133: INIT - lines 309 to 316"]
B133["B134: INLCD - lines 321 to 322"]
B134["B135: WAIT - lines 324 to 324"]
B135["B136: instructions - lines 325 to 325"]
B136["B137: instructions - lines 326 to 328"]
B137["B138: instructions - lines 329 to 329"]
B138["B139: instructions - lines 330 to 331"]
B139["B140: instructions - lines 332 to 333"]
B130 -->|call| B179
B130 -->|after return| B131
B133 -->|next| B134
B134 -->|call| B165
B134 -->|after return| B135
B135 -->|condition true| B134
B135 -->|condition false| B136
B136 -->|call| B153
B136 -->|after return| B137
B137 -->|call| B165
B137 -->|after return| B138
B138 -->|call| B153
B138 -->|after return| B139
B139 -->|call| B153
B139 -->|after return| B140
B179["Continue at B180 in section 18"]
B165["Continue at B166 in section 17"]
B153["Continue at B154 in section 16"]
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

### B134

```asm
PUSH 7
MOV R7,#20
```

### B135

```asm
ACALL LDELAY
```

### B136

```asm
DJNZ R7,WAIT
```

### B137

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B138

```asm
ACALL LDELAY
```

### B139

```asm
MOV A,#0011B
ACALL CMD
```

### B140

```asm
MOV A,#0011B
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 334 to 335"]
B141["B142: instructions - lines 336 to 337"]
B142["B143: instructions - lines 338 to 339"]
B143["B144: instructions - lines 340 to 341"]
B144["B145: instructions - lines 342 to 343"]
B145["B146: instructions - lines 344 to 345"]
B146["B147: instructions - lines 346 to 347"]
B147["B148: instructions - lines 348 to 348"]
B148["B149: instructions - lines 349 to 350"]
B149["B150: instructions - lines 351 to 352"]
B140 -->|call| B153
B140 -->|after return| B141
B141 -->|call| B153
B141 -->|after return| B142
B142 -->|call| B153
B142 -->|after return| B143
B143 -->|call| B153
B143 -->|after return| B144
B144 -->|call| B153
B144 -->|after return| B145
B145 -->|call| B153
B145 -->|after return| B146
B146 -->|call| B153
B146 -->|after return| B147
B147 -->|call| B165
B147 -->|after return| B148
B148 -->|call| B153
B148 -->|after return| B149
B149 -->|call| B153
B149 -->|after return| B150
B153["Continue at B154 in section 16"]
B165["Continue at B166 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,#0010B
ACALL CMD
```

### B142

```asm
MOV A,#0010B
ACALL CMD
```

### B143

```asm
MOV A,#1000B
ACALL CMD
```

### B144

```asm
MOV A,#0000B
ACALL CMD
```

### B145

```asm
MOV A,#1000B
ACALL CMD
```

### B146

```asm
MOV A,#0
ACALL CMD
```

### B147

```asm
MOV A,#0001B
ACALL CMD
```

### B148

```asm
ACALL LDELAY
```

### B149

```asm
MOV A,#0000B
ACALL CMD
```

### B150

```asm
MOV A,#0110B
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 353 to 354"]
B151["B152: instructions - lines 355 to 356"]
B152["B153: instructions - lines 357 to 358"]
B153["B154: CMD - lines 363 to 364"]
B154["B155: instructions - lines 365 to 365"]
B155["B156: WCHR - lines 370 to 375"]
B156["B157: instructions - lines 376 to 377"]
B157["B158: instructions - lines 378 to 380"]
B158["B159: COMMON - lines 385 to 392"]
B159["B160: instructions - lines 393 to 393"]
B150 -->|call| B153
B150 -->|after return| B151
B151 -->|call| B153
B151 -->|after return| B152
B153 -->|call| B158
B153 -->|after return| B154
B155 -->|call| B158
B155 -->|after return| B156
B156 -->|call| B158
B156 -->|after return| B157
B158 -->|call| B165
B158 -->|after return| B159
B165["Continue at B166 in section 17"]
```

### B151

```asm
MOV A,#0000B
ACALL CMD
```

### B152

```asm
MOV A,#1111B
ACALL CMD
```

### B153

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B154

```asm
CLR RS
ACALL COMMON
```

### B155

Return to the instruction following the active call.

```asm
RET
```

### B156

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B157

```asm
MOV A,B
ACALL COMMON
```

### B158

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B159

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

### B160

Return to the instruction following the active call.

```asm
RET
```

## Section 17

```mermaid
flowchart TD
B160["B161: WSTR - lines 398 to 398"]
B161["B162: CONT1 - lines 399 to 401"]
B162["B163: instructions - lines 402 to 402"]
B163["B164: instructions - lines 404 to 405"]
B164["B165: EXIT1 - lines 407 to 408"]
B165["B166: LDELAY - lines 413 to 415"]
B166["B167: CON4 - lines 416 to 417"]
B167["B168: instructions - lines 418 to 418"]
B168["B169: instructions - lines 419 to 421"]
B169["B170: TMSEC - lines 428 to 431"]
B160 -->|next| B161
B161 -->|condition true| B164
B161 -->|condition false| B162
B162 -->|call| B155
B162 -->|after return| B163
B163 -->|jump| B161
B165 -->|next| B166
B166 -->|condition true| B166
B166 -->|condition false| B167
B167 -->|condition true| B166
B167 -->|condition false| B168
B169 -->|next| B170
B155["Continue at B156 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
PUSH ACC
```

### B162

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B163

```asm
ACALL WCHR
```

### B164

```asm
INC DPTR
AJMP CONT1
```

### B165

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B166

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B167

```asm
MOV R0,#250
DJNZ R0,$
```

### B168

```asm
DJNZ R1,CON4
```

### B169

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B170

```asm
MOV TMOD,#21H
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

## Section 18

```mermaid
flowchart TD
B170["B171: BACK - lines 433 to 433"]
B171["B172: instructions - lines 434 to 436"]
B172["B173: CLEAR - lines 440 to 441"]
B173["B174: instructions - lines 442 to 443"]
B174["B175: instructions - lines 444 to 444"]
B175["B176: instructions - lines 445 to 445"]
B176["B177: WAITT - lines 446 to 446"]
B177["B178: instructions - lines 447 to 447"]
B178["B179: instructions - lines 448 to 448"]
B179["B180: DELAY - lines 452 to 452"]
B170 -->|condition true| B170
B170 -->|condition false| B171
B172 -->|call| B153
B172 -->|after return| B173
B173 -->|call| B153
B173 -->|after return| B174
B174 -->|call| B165
B174 -->|after return| B175
B175 -->|next| B176
B176 -->|call| B165
B176 -->|after return| B177
B177 -->|condition true| B176
B177 -->|condition false| B178
B179 -->|next| B180
B153["Continue at B154 in section 16"]
B165["Continue at B166 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
JNB TF0,BACK
```

### B172

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B173

```asm
MOV A,#0H
ACALL CMD
```

### B174

```asm
MOV A,#1H
ACALL CMD
```

### B175

```asm
ACALL LDELAY
```

### B176

```asm
MOV R7,#14
```

### B177

```asm
ACALL LDELAY
```

### B178

```asm
DJNZ R7,WAITT
```

### B179

Return to the instruction following the active call.

```asm
RET
```

### B180

```asm
MOV R5,#70
```

## Section 19

```mermaid
flowchart TD
B180["B181: HH - lines 454 to 454"]
B181["B182: instructions - lines 455 to 455"]
B182["B183: instructions - lines 456 to 456"]
B180 -->|call| B165
B180 -->|after return| B181
B181 -->|condition true| B180
B181 -->|condition false| B182
B165["Continue at B166 in section 17"]
```

### B181

```asm
ACALL LDELAY
```

### B182

```asm
DJNZ R5,HH
```

### B183

Return to the instruction following the active call.

```asm
RET
```
