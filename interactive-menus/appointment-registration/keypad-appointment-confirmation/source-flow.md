# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Destinations requiring review

`CONFIRM`, `ERRORR`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 15"]
B2["B3: START - lines 18 to 18"]
B3["B4: instructions - lines 19 to 19"]
B4["B5: instructions - lines 20 to 22"]
B5["B6: instructions - lines 23 to 23"]
B6["B7: instructions - lines 24 to 24"]
B7["B8: POSITIVE - lines 27 to 27"]
B8["B9: instructions - lines 28 to 28"]
B9["B10: instructions - lines 29 to 29"]
B0 -->|call| B122
B0 -->|after return| B1
B1 -->|call| B48
B1 -->|after return| B2
B2 -->|call| B52
B2 -->|after return| B3
B3 -->|call| B157
B3 -->|after return| B4
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B13
B5 -->|after return| B6
B6 -->|jump| B12
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B28
B8 -->|after return| B9
B9 -->|jump| B12
B122["Continue at B123 in section 13"]
B48["Continue at B49 in section 5"]
B52["Continue at B53 in section 6"]
B157["Continue at B158 in section 16"]
B13["Continue at B14 in section 2"]
B12["Continue at B13 in section 2"]
B10["Continue at B11 in section 2"]
B28["Continue at B29 in section 3"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#0
MOV 31H,#4
MOV 32H,#0
MOV 36H,#11
MOV 33H,#1
MOV 34H,#100
MOV 35H,#0
ACALL WELCOME
```

### B3

```asm
ACALL MENU
```

### B4

```asm
ACALL KEYPAD
```

### B5

```asm
SUBB A,#30H
CJNE A,#0,POSITIVE
```

### B6

```asm
ACALL NEG
```

### B7

```asm
SJMP BACK
```

### B8

```asm
CJNE A,#1,ERROR
```

### B9

```asm
ACALL POS
```

### B10

```asm
SJMP BACK
```

## Section 2

```mermaid
flowchart TD
B10["B11: ERROR - lines 32 to 32"]
B11["B12: instructions - lines 33 to 33"]
B12["B13: BACK - lines 36 to 36"]
B13["B14: NEG - lines 43 to 43"]
B14["B15: instructions - lines 44 to 45"]
B15["B16: instructions - lines 46 to 47"]
B16["B17: instructions - lines 48 to 48"]
B17["B18: instructions - lines 49 to 49"]
B18["B19: instructions - lines 50 to 50"]
B19["B20: SECONDDOZEE - lines 55 to 55"]
B10 -->|call| BX1
B10 -->|after return| B11
B11 -->|jump| B12
B12 -->|jump| B2
B13 -->|call| B92
B13 -->|after return| B14
B14 -->|condition true| B19
B14 -->|condition false| B15
B15 -->|call| B79
B15 -->|after return| B16
B16 -->|call| B105
B16 -->|after return| B17
B17 -->|call| B117
B17 -->|after return| B18
B18 -->|jump| B26
B19 -->|condition true| B25
B19 -->|condition false| B20
BX1["Unresolved destination: ERRORR"]
B2["Continue at B3 in section 1"]
B92["Continue at B93 in section 10"]
B79["Continue at B80 in section 8"]
B105["Continue at B106 in section 11"]
B117["Continue at B118 in section 12"]
B26["Continue at B27 in section 3"]
B25["Continue at B26 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL ERRORR
```

### B12

```asm
SJMP BACK
```

### B13

```asm
SJMP START
```

### B14

```asm
ACALL SHOWNEG
```

### B15

```asm
MOV A,32H
CJNE A,#0,SecondDozee
```

### B16

```asm
MOV 34H,#0
ACALL APPOINTMENT
```

### B17

```asm
ACALL PRONEG2
```

### B18

```asm
ACALL CONFIRMM
```

### B19

```asm
SJMP BACK3
```

### B20

```asm
CJNE A,#1,ERROR3
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 56 to 56"]
B21["B22: instructions - lines 57 to 60"]
B22["B23: instructions - lines 61 to 63"]
B23["B24: instructions - lines 64 to 64"]
B24["B25: instructions - lines 65 to 65"]
B25["B26: ERROR3 - lines 68 to 68"]
B26["B27: BACK3 - lines 70 to 70"]
B27["B28: instructions - lines 71 to 71"]
B28["B29: POS - lines 75 to 75"]
B29["B30: instructions - lines 76 to 79"]
B20 -->|call| B100
B20 -->|after return| B21
B21 -->|call| B41
B21 -->|after return| B22
B22 -->|call| B79
B22 -->|after return| B23
B23 -->|call| B117
B23 -->|after return| B24
B24 -->|jump| B26
B25 -->|jump| B26
B26 -->|call| BX2
B26 -->|after return| B27
B28 -->|call| B65
B28 -->|after return| B29
B29 -->|condition true| B34
B29 -->|condition false| B30
B100["Continue at B101 in section 11"]
B41["Continue at B42 in section 5"]
B79["Continue at B80 in section 8"]
B117["Continue at B118 in section 12"]
BX2["Unresolved destination: CONFIRM"]
B65["Continue at B66 in section 7"]
B34["Continue at B35 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL PRONEG1
```

### B22

```asm
MOV R7,36H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

### B23

```asm
MOV 33H,A
MOV 34H,#4
ACALL APPOINTMENT
```

### B24

```asm
ACALL CONFIRMM
```

### B25

```asm
SJMP BACK3
```

### B26

```asm
SJMP BACK3
```

### B27

```asm
ACALL CONFIRM
```

### B28

Return to the instruction following the active call.

```asm
RET
```

### B29

```asm
ACALL SHOWPOS
```

### B30

```asm
MOV R7,31H
MOV A,32H
CJNE A,#0,SecondDoze
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 81 to 81"]
B31["B32: instructions - lines 82 to 84"]
B32["B33: instructions - lines 85 to 87"]
B33["B34: instructions - lines 88 to 88"]
B34["B35: SECONDDOZE - lines 91 to 91"]
B35["B36: instructions - lines 93 to 93"]
B36["B37: instructions - lines 94 to 96"]
B37["B38: instructions - lines 97 to 99"]
B38["B39: instructions - lines 100 to 100"]
B39["B40: ERROR1 - lines 105 to 105"]
B30 -->|call| B79
B30 -->|after return| B31
B31 -->|call| B41
B31 -->|after return| B32
B32 -->|call| B117
B32 -->|after return| B33
B33 -->|jump| B39
B34 -->|condition true| B39
B34 -->|condition false| B35
B35 -->|call| B79
B35 -->|after return| B36
B36 -->|call| B41
B36 -->|after return| B37
B37 -->|call| B117
B37 -->|after return| B38
B38 -->|jump| B39
B39 -->|call| BX3
B39 -->|after return| B40
B79["Continue at B80 in section 8"]
B41["Continue at B42 in section 5"]
B117["Continue at B118 in section 12"]
BX3["Unresolved destination: CONFIRM"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL APPOINTMENT
```

### B32

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B33

```asm
MOV 33H,A
MOV 34H,#1
ACALL CONFIRMM
```

### B34

```asm
SJMP BACK1
```

### B35

```asm
CJNE A,#1,ERROR1
```

### B36

```asm
ACALL APPOINTMENT
```

### B37

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B38

```asm
MOV 33H,A
MOV 34H,#2
ACALL CONFIRMM
```

### B39

```asm
SJMP BACK1
```

### B40

```asm
ACALL CONFIRM
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 107 to 107"]
B41["B42: CHEACK - lines 111 to 111"]
B42["B43: instructions - lines 112 to 112"]
B43["B44: CONTINUE - lines 114 to 114"]
B44["B45: instructions - lines 115 to 115"]
B45["B46: BACK2 - lines 118 to 118"]
B46["B47: CONFIRM - lines 122 to 123"]
B47["B48: instructions - lines 124 to 124"]
B48["B49: WELCOME - lines 127 to 128"]
B49["B50: instructions - lines 129 to 130"]
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B45
B43 -->|condition true| B45
B43 -->|condition false| B44
B44 -->|next| B45
B46 -->|condition true| BX4
B46 -->|condition false| B47
B48 -->|call| B132
B48 -->|after return| B49
B49 -->|call| B138
B49 -->|after return| B50
BX4["Unresolved destination: CONFIRM"]
B132["Continue at B133 in section 14"]
B138["Continue at B139 in section 14"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

```asm
CJNE A,#12,CONTINUE
```

### B43

```asm
SJMP BACK2
```

### B44

```asm
JC BACK2
```

### B45

```asm
SUBB A,#12
```

### B46

Return to the instruction following the active call.

```asm
RET
```

### B47

```asm
MOV A,35H
CJNE A,#1,CONFIRM
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
MOV A, #80H
ACALL CMD
```

### B50

```asm
MOV DPTR, #STR1
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 131"]
B51["B52: instructions - lines 133 to 133"]
B52["B53: MENU - lines 136 to 136"]
B53["B54: instructions - lines 137 to 138"]
B54["B55: instructions - lines 139 to 140"]
B55["B56: instructions - lines 141 to 141"]
B56["B57: instructions - lines 142 to 143"]
B57["B58: instructions - lines 144 to 145"]
B58["B59: instructions - lines 146 to 146"]
B59["B60: instructions - lines 148 to 149"]
B50 -->|call| B150
B50 -->|after return| B51
B52 -->|call| B145
B52 -->|after return| B53
B53 -->|call| B132
B53 -->|after return| B54
B54 -->|call| B138
B54 -->|after return| B55
B55 -->|call| B150
B55 -->|after return| B56
B56 -->|call| B132
B56 -->|after return| B57
B57 -->|call| B138
B57 -->|after return| B58
B58 -->|call| B150
B58 -->|after return| B59
B59 -->|call| B132
B59 -->|after return| B60
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B132["Continue at B133 in section 14"]
B138["Continue at B139 in section 14"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

```asm
ACALL CLEAR
```

### B54

```asm
MOV A, #80H
ACALL CMD
```

### B55

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
MOV A, #0C0H
ACALL CMD
```

### B58

```asm
MOV DPTR, #STR3
ACALL WSTR
```

### B59

```asm
ACALL DELAY
```

### B60

```asm
MOV A, #80H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 150 to 151"]
B61["B62: instructions - lines 152 to 153"]
B62["B63: instructions - lines 154 to 155"]
B63["B64: instructions - lines 156 to 156"]
B64["B65: instructions - lines 157 to 157"]
B65["B66: SHOWPOS - lines 161 to 161"]
B66["B67: instructions - lines 162 to 163"]
B67["B68: instructions - lines 164 to 165"]
B68["B69: instructions - lines 166 to 166"]
B69["B70: instructions - lines 167 to 168"]
B60 -->|call| B138
B60 -->|after return| B61
B61 -->|call| B132
B61 -->|after return| B62
B62 -->|call| B138
B62 -->|after return| B63
B63 -->|call| B150
B63 -->|after return| B64
B65 -->|call| B145
B65 -->|after return| B66
B66 -->|call| B132
B66 -->|after return| B67
B67 -->|call| B138
B67 -->|after return| B68
B68 -->|call| B150
B68 -->|after return| B69
B69 -->|call| B132
B69 -->|after return| B70
B138["Continue at B139 in section 14"]
B132["Continue at B133 in section 14"]
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV DPTR, #STR4
ACALL WSTR
```

### B62

```asm
MOV A, #0C0H
ACALL CMD
```

### B63

```asm
MOV DPTR, #OPTION
ACALL WSTR
```

### B64

```asm
ACALL DELAY
```

### B65

Return to the instruction following the active call.

```asm
RET
```

### B66

```asm
ACALL CLEAR
```

### B67

```asm
MOV A, #80H
ACALL CMD
```

### B68

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
MOV A, #0C0H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 169 to 170"]
B71["B72: instructions - lines 171 to 171"]
B72["B73: instructions - lines 172 to 172"]
B73["B74: instructions - lines 173 to 174"]
B74["B75: instructions - lines 175 to 176"]
B75["B76: instructions - lines 177 to 178"]
B76["B77: instructions - lines 179 to 180"]
B77["B78: instructions - lines 181 to 181"]
B78["B79: instructions - lines 182 to 182"]
B79["B80: APPOINTMENT - lines 186 to 186"]
B70 -->|call| B138
B70 -->|after return| B71
B71 -->|call| B150
B71 -->|after return| B72
B72 -->|call| B145
B72 -->|after return| B73
B73 -->|call| B132
B73 -->|after return| B74
B74 -->|call| B138
B74 -->|after return| B75
B75 -->|call| B132
B75 -->|after return| B76
B76 -->|call| B138
B76 -->|after return| B77
B77 -->|call| B150
B77 -->|after return| B78
B79 -->|call| B145
B79 -->|after return| B80
B138["Continue at B139 in section 14"]
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B132["Continue at B133 in section 14"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
ACALL CLEAR
```

### B74

```asm
MOV A, #80H
ACALL CMD
```

### B75

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B76

```asm
MOV A, #0C0H
ACALL CMD
```

### B77

```asm
MOV DPTR, #OPTION
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
ACALL CLEAR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 187 to 188"]
B81["B82: instructions - lines 189 to 190"]
B82["B83: instructions - lines 191 to 191"]
B83["B84: instructions - lines 192 to 193"]
B84["B85: instructions - lines 194 to 195"]
B85["B86: instructions - lines 196 to 196"]
B86["B87: instructions - lines 197 to 197"]
B87["B88: instructions - lines 199 to 200"]
B88["B89: instructions - lines 201 to 202"]
B89["B90: instructions - lines 203 to 204"]
B80 -->|call| B132
B80 -->|after return| B81
B81 -->|call| B138
B81 -->|after return| B82
B82 -->|call| B150
B82 -->|after return| B83
B83 -->|call| B132
B83 -->|after return| B84
B84 -->|call| B138
B84 -->|after return| B85
B85 -->|call| B150
B85 -->|after return| B86
B86 -->|call| B145
B86 -->|after return| B87
B87 -->|call| B127
B87 -->|after return| B88
B88 -->|call| B127
B88 -->|after return| B89
B89 -->|call| B127
B89 -->|after return| B90
B132["Continue at B133 in section 14"]
B138["Continue at B139 in section 14"]
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B127["Continue at B128 in section 13"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A, #80H
ACALL CMD
```

### B82

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B83

```asm
ACALL DELAY
```

### B84

```asm
MOV A, #0C0H
ACALL CMD
```

### B85

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B86

```asm
ACALL DELAY
```

### B87

```asm
ACALL CLEAR
```

### B88

```asm
MOV A,33H
ACALL WCHR
```

### B89

```asm
MOV A,' '
ACALL WCHR
```

### B90

```asm
MOV A,34H
ACALL WCHR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 205 to 205"]
B91["B92: instructions - lines 206 to 206"]
B92["B93: SHOWNEG - lines 210 to 210"]
B93["B94: instructions - lines 211 to 212"]
B94["B95: instructions - lines 213 to 214"]
B95["B96: instructions - lines 215 to 215"]
B96["B97: instructions - lines 216 to 217"]
B97["B98: instructions - lines 218 to 219"]
B98["B99: instructions - lines 220 to 220"]
B99["B100: instructions - lines 221 to 221"]
B90 -->|call| B150
B90 -->|after return| B91
B92 -->|call| B145
B92 -->|after return| B93
B93 -->|call| B132
B93 -->|after return| B94
B94 -->|call| B138
B94 -->|after return| B95
B95 -->|call| B150
B95 -->|after return| B96
B96 -->|call| B132
B96 -->|after return| B97
B97 -->|call| B138
B97 -->|after return| B98
B98 -->|call| B150
B98 -->|after return| B99
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B132["Continue at B133 in section 14"]
B138["Continue at B139 in section 14"]
```

### B91

```asm
ACALL DELAY
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
ACALL CLEAR
```

### B94

```asm
MOV A, #80H
ACALL CMD
```

### B95

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
MOV A, #0C0H
ACALL CMD
```

### B98

```asm
MOV DPTR, #OPTION
ACALL WSTR
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
B100["B101: PRONEG1 - lines 224 to 224"]
B101["B102: instructions - lines 225 to 226"]
B102["B103: instructions - lines 227 to 228"]
B103["B104: instructions - lines 229 to 229"]
B104["B105: instructions - lines 230 to 230"]
B105["B106: PRONEG2 - lines 233 to 234"]
B106["B107: instructions - lines 235 to 236"]
B107["B108: instructions - lines 237 to 237"]
B108["B109: instructions - lines 238 to 238"]
B109["B110: CONFIRM - lines 242 to 242"]
B100 -->|call| B145
B100 -->|after return| B101
B101 -->|call| B132
B101 -->|after return| B102
B102 -->|call| B138
B102 -->|after return| B103
B103 -->|call| B150
B103 -->|after return| B104
B105 -->|call| B132
B105 -->|after return| B106
B106 -->|call| B138
B106 -->|after return| B107
B107 -->|call| B150
B107 -->|after return| B108
B109 -->|call| B145
B109 -->|after return| B110
B145["Continue at B146 in section 15"]
B132["Continue at B133 in section 14"]
B138["Continue at B139 in section 14"]
B150["Continue at B151 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
MOV A, #80H
ACALL CMD
```

### B103

```asm
MOV DPTR, #STR10
ACALL WSTR
```

### B104

```asm
ACALL DELAY
```

### B105

Return to the instruction following the active call.

```asm
RET
```

### B106

```asm
MOV A, #0C0H
ACALL CMD
```

### B107

```asm
MOV DPTR, #TOMORROW
ACALL WSTR
```

### B108

```asm
ACALL DELAY
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
B110["B111: instructions - lines 243 to 244"]
B111["B112: instructions - lines 245 to 246"]
B112["B113: instructions - lines 247 to 247"]
B113["B114: instructions - lines 248 to 249"]
B114["B115: instructions - lines 250 to 251"]
B115["B116: instructions - lines 252 to 252"]
B116["B117: instructions - lines 253 to 253"]
B117["B118: CONFIRMM - lines 256 to 256"]
B118["B119: instructions - lines 257 to 258"]
B119["B120: instructions - lines 259 to 260"]
B110 -->|call| B132
B110 -->|after return| B111
B111 -->|call| B138
B111 -->|after return| B112
B112 -->|call| B150
B112 -->|after return| B113
B113 -->|call| B132
B113 -->|after return| B114
B114 -->|call| B138
B114 -->|after return| B115
B115 -->|call| B150
B115 -->|after return| B116
B117 -->|call| B145
B117 -->|after return| B118
B118 -->|call| B132
B118 -->|after return| B119
B119 -->|call| B138
B119 -->|after return| B120
B132["Continue at B133 in section 14"]
B138["Continue at B139 in section 14"]
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A, #80H
ACALL CMD
```

### B112

```asm
MOV DPTR, #CONF
ACALL WSTR
```

### B113

```asm
ACALL DELAY
```

### B114

```asm
MOV A, #0C0H
ACALL CMD
```

### B115

```asm
MOV DPTR, #OPTION
ACALL WSTR
```

### B116

```asm
ACALL DELAY
```

### B117

Return to the instruction following the active call.

```asm
RET
```

### B118

```asm
ACALL CLEAR
```

### B119

```asm
MOV A, #80H
ACALL CMD
```

### B120

```asm
MOV DPTR, #STR11
ACALL WSTR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 261 to 261"]
B121["B122: instructions - lines 262 to 262"]
B122["B123: INLCD - lines 269 to 277"]
B123["B124: instructions - lines 279 to 288"]
B124["B125: instructions - lines 290 to 305"]
B125["B126: instructions - lines 307 to 319"]
B126["B127: instructions - lines 320 to 320"]
B127["B128: WCHR - lines 325 to 329"]
B128["B129: instructions - lines 330 to 330"]
B129["B130: instructions - lines 331 to 333"]
B120 -->|call| B150
B120 -->|after return| B121
B122 -->|call| B143
B122 -->|after return| B123
B123 -->|call| B143
B123 -->|after return| B124
B124 -->|call| B143
B124 -->|after return| B125
B125 -->|call| B143
B125 -->|after return| B126
B127 -->|call| B137
B127 -->|after return| B128
B128 -->|call| B143
B128 -->|after return| B129
B129 -->|call| B137
B129 -->|after return| B130
B150["Continue at B151 in section 16"]
B143["Continue at B144 in section 15"]
B137["Continue at B138 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL DELAY
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

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

### B124

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

### B125

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

### B126

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

### B127

Return to the instruction following the active call.

```asm
RET
```

### B128

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B129

```asm
ACALL LDELAY
```

### B130

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 334 to 334"]
B131["B132: instructions - lines 335 to 337"]
B132["B133: CMD - lines 340 to 342"]
B133["B134: instructions - lines 343 to 343"]
B134["B135: instructions - lines 344 to 346"]
B135["B136: instructions - lines 347 to 347"]
B136["B137: instructions - lines 348 to 348"]
B137["B138: COMMON - lines 352 to 357"]
B138["B139: WSTR - lines 361 to 361"]
B139["B140: CONT1 - lines 363 to 365"]
B130 -->|call| B143
B130 -->|after return| B131
B132 -->|call| B137
B132 -->|after return| B133
B133 -->|call| B143
B133 -->|after return| B134
B134 -->|call| B137
B134 -->|after return| B135
B135 -->|call| B143
B135 -->|after return| B136
B138 -->|next| B139
B139 -->|condition true| B142
B139 -->|condition false| B140
B143["Continue at B144 in section 15"]
B142["Continue at B143 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL LDELAY
```

### B132

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B133

```asm
CLR P1.3
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
RET
```

### B138

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B139

```asm
PUSH    ACC
```

### B140

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 15

```mermaid
flowchart TD
B140["B141: PRINT - lines 367 to 367"]
B141["B142: instructions - lines 368 to 369"]
B142["B143: EXIT1 - lines 370 to 371"]
B143["B144: LDELAY - lines 375 to 376"]
B144["B145: instructions - lines 377 to 377"]
B145["B146: CLEAR - lines 380 to 381"]
B146["B147: instructions - lines 382 to 382"]
B147["B148: WAIT - lines 383 to 383"]
B148["B149: instructions - lines 384 to 384"]
B149["B150: instructions - lines 385 to 385"]
B140 -->|call| B127
B140 -->|after return| B141
B141 -->|jump| B139
B143 -->|condition true| B143
B143 -->|condition false| B144
B145 -->|call| B132
B145 -->|after return| B146
B146 -->|next| B147
B147 -->|call| B143
B147 -->|after return| B148
B148 -->|condition true| B147
B148 -->|condition false| B149
B127["Continue at B128 in section 13"]
B139["Continue at B140 in section 14"]
B132["Continue at B133 in section 14"]
```

### B141

```asm
ACALL    WCHR
```

### B142

```asm
INC DPTR
AJMP    CONT1
```

### B143

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B144

```asm
MOV R0, #50
DJNZ R0, $
```

### B145

Return to the instruction following the active call.

```asm
RET
```

### B146

```asm
MOV A,#01H
ACALL CMD
```

### B147

```asm
MOV R7,#14
```

### B148

```asm
ACALL LDELAY
```

### B149

```asm
DJNZ R7,WAIT
```

### B150

Return to the instruction following the active call.

```asm
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: DELAY - lines 388 to 388"]
B151["B152: X3 - lines 389 to 389"]
B152["B153: X2 - lines 390 to 390"]
B153["B154: X1 - lines 391 to 391"]
B154["B155: instructions - lines 392 to 392"]
B155["B156: instructions - lines 393 to 393"]
B156["B157: instructions - lines 394 to 394"]
B157["B158: KEYPAD - lines 398 to 398"]
B158["B159: K1 - lines 399 to 402"]
B159["B160: K2 - lines 404 to 406"]
B150 -->|next| B151
B151 -->|next| B152
B152 -->|next| B153
B153 -->|condition true| B153
B153 -->|condition false| B154
B154 -->|condition true| B152
B154 -->|condition false| B155
B155 -->|condition true| B151
B155 -->|condition false| B156
B157 -->|next| B158
B158 -->|condition true| B158
B158 -->|condition false| B159
B159 -->|condition true| B161
B159 -->|condition false| B160
B161["Continue at B162 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV	R5,#2
```

### B152

```asm
MOV	R4,#20
```

### B153

```asm
MOV	R3,#250
```

### B154

```asm
DJNZ	R3,X1
```

### B155

```asm
DJNZ	R4,X2
```

### B156

```asm
DJNZ	R5,X3
```

### B157

Return to the instruction following the active call.

```asm
RET
```

### B158

```asm
MOV P0,#01110000B
```

### B159

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B160

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 407 to 407"]
B161["B162: OVER1 - lines 409 to 412"]
B162["B163: instructions - lines 413 to 416"]
B163["B164: instructions - lines 417 to 420"]
B164["B165: instructions - lines 421 to 424"]
B165["B166: instructions - lines 425 to 425"]
B166["B167: ROW_0 - lines 426 to 427"]
B167["B168: ROW_1 - lines 428 to 429"]
B168["B169: ROW_2 - lines 430 to 431"]
B169["B170: ROW_3 - lines 432 to 432"]
B160 -->|jump| B159
B161 -->|condition true| B166
B161 -->|condition false| B162
B162 -->|condition true| B167
B162 -->|condition false| B163
B163 -->|condition true| B168
B163 -->|condition false| B164
B164 -->|condition true| B169
B164 -->|condition false| B165
B165 -->|jump| B159
B166 -->|jump| B170
B167 -->|jump| B170
B168 -->|jump| B170
B169 -->|next| B170
B159["Continue at B160 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
SJMP K2
```

### B162

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B163

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B164

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B165

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B166

```asm
LJMP K2
```

### B167

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B168

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B169

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B170

```asm
MOV DPTR,#KCODE3
```

## Section 18

```mermaid
flowchart TD
B170["B171: FIND - lines 435 to 435"]
B171["B172: FIND1 - lines 437 to 438"]
B172["B173: instructions - lines 439 to 440"]
B173["B174: MATCH - lines 441 to 443"]
B170 -->|next| B171
B171 -->|condition true| B173
B171 -->|condition false| B172
B172 -->|jump| B171
```

### B171

```asm
RLC A
```

### B172

```asm
RLC A
JNC MATCH
```

### B173

```asm
INC DPTR
SJMP FIND1
```

### B174

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
