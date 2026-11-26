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
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 6"]
B2["B3: START - lines 9 to 9"]
B3["B4: instructions - lines 10 to 10"]
B4["B5: instructions - lines 11 to 13"]
B5["B6: instructions - lines 14 to 14"]
B6["B7: instructions - lines 15 to 15"]
B7["B8: POSITIVE - lines 18 to 18"]
B8["B9: instructions - lines 19 to 19"]
B9["B10: instructions - lines 20 to 20"]
B0 -->|call| B131
B0 -->|after return| B1
B1 -->|call| B58
B1 -->|after return| B2
B2 -->|call| B62
B2 -->|after return| B3
B3 -->|call| B166
B3 -->|after return| B4
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B13
B5 -->|after return| B6
B6 -->|jump| B12
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B29
B8 -->|after return| B9
B9 -->|jump| B12
B131["Continue at B132 in section 14"]
B58["Continue at B59 in section 6"]
B62["Continue at B63 in section 7"]
B166["Continue at B167 in section 17"]
B13["Continue at B14 in section 2"]
B12["Continue at B13 in section 2"]
B10["Continue at B11 in section 2"]
B29["Continue at B30 in section 3"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 33H,#0
MOV 34H,#0
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
CJNE A,#2,POSITIVE
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
B10["B11: ERROR - lines 23 to 23"]
B11["B12: instructions - lines 24 to 24"]
B12["B13: BACK - lines 27 to 27"]
B13["B14: NEG - lines 34 to 34"]
B14["B15: instructions - lines 35 to 35"]
B15["B16: instructions - lines 36 to 38"]
B16["B17: instructions - lines 39 to 40"]
B17["B18: instructions - lines 41 to 41"]
B18["B19: instructions - lines 42 to 42"]
B19["B20: SECONDDOZEE - lines 47 to 47"]
B10 -->|call| B126
B10 -->|after return| B11
B11 -->|jump| B12
B12 -->|jump| B2
B13 -->|call| B109
B13 -->|after return| B14
B14 -->|call| B166
B14 -->|after return| B15
B15 -->|condition true| B19
B15 -->|condition false| B16
B16 -->|call| B90
B16 -->|after return| B17
B17 -->|call| B122
B17 -->|after return| B18
B18 -->|jump| B27
B19 -->|condition true| B26
B19 -->|condition false| B20
B126["Continue at B127 in section 13"]
B2["Continue at B3 in section 1"]
B109["Continue at B110 in section 11"]
B166["Continue at B167 in section 17"]
B90["Continue at B91 in section 10"]
B122["Continue at B123 in section 13"]
B27["Continue at B28 in section 3"]
B26["Continue at B27 in section 3"]
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
ACALL KEYPAD
```

### B16

```asm
SUBB A,#30H
CJNE A,#2,SecondDozee
```

### B17

```asm
MOV 34H,#0
ACALL APPOINTMENT
```

### B18

```asm
ACALL PRONEG2
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
B20["B21: instructions - lines 48 to 48"]
B21["B22: instructions - lines 49 to 49"]
B22["B23: instructions - lines 50 to 53"]
B23["B24: instructions - lines 54 to 56"]
B24["B25: instructions - lines 57 to 57"]
B25["B26: instructions - lines 58 to 58"]
B26["B27: ERROR3 - lines 61 to 61"]
B27["B28: BACK3 - lines 63 to 63"]
B28["B29: instructions - lines 64 to 64"]
B29["B30: POS - lines 68 to 68"]
B20 -->|call| B117
B20 -->|after return| B21
B21 -->|call| B166
B21 -->|after return| B22
B22 -->|call| B43
B22 -->|after return| B23
B23 -->|call| B90
B23 -->|after return| B24
B24 -->|call| B99
B24 -->|after return| B25
B25 -->|jump| B27
B26 -->|jump| B27
B27 -->|call| B48
B27 -->|after return| B28
B29 -->|call| B75
B29 -->|after return| B30
B117["Continue at B118 in section 12"]
B166["Continue at B167 in section 17"]
B43["Continue at B44 in section 5"]
B90["Continue at B91 in section 10"]
B99["Continue at B100 in section 10"]
B48["Continue at B49 in section 5"]
B75["Continue at B76 in section 8"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL PRONEG1
```

### B22

```asm
ACALL KEYPAD
```

### B23

```asm
SUBB A,#30H
ADD A,#2
ACALL CHEACK
```

### B24

```asm
MOV 33H,A
MOV 34H,#4
ACALL APPOINTMENT
```

### B25

```asm
ACALL PRINTAPPOINTMENT
```

### B26

```asm
SJMP BACK3
```

### B27

```asm
SJMP BACK3
```

### B28

```asm
ACALL CONFIRM
```

### B29

Return to the instruction following the active call.

```asm
RET
```

### B30

```asm
ACALL SHOWPOS
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 69 to 69"]
B31["B32: instructions - lines 70 to 74"]
B32["B33: instructions - lines 76 to 76"]
B33["B34: instructions - lines 77 to 79"]
B34["B35: instructions - lines 80 to 82"]
B35["B36: instructions - lines 83 to 83"]
B36["B37: SECONDDOZE - lines 86 to 86"]
B37["B38: instructions - lines 88 to 88"]
B38["B39: instructions - lines 89 to 91"]
B39["B40: instructions - lines 92 to 94"]
B30 -->|call| B166
B30 -->|after return| B31
B31 -->|condition true| B36
B31 -->|condition false| B32
B32 -->|call| B90
B32 -->|after return| B33
B33 -->|call| B43
B33 -->|after return| B34
B34 -->|call| B99
B34 -->|after return| B35
B35 -->|jump| B41
B36 -->|condition true| B41
B36 -->|condition false| B37
B37 -->|call| B90
B37 -->|after return| B38
B38 -->|call| B43
B38 -->|after return| B39
B39 -->|call| B99
B39 -->|after return| B40
B166["Continue at B167 in section 17"]
B90["Continue at B91 in section 10"]
B43["Continue at B44 in section 5"]
B99["Continue at B100 in section 10"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL KEYPAD
```

### B32

```asm
SUBB A,#30H
CJNE A,#2,SecondDoze
```

### B33

```asm
ACALL APPOINTMENT
```

### B34

```asm
MOV A,30H
ADD A,#3
ACALL CHEACK
```

### B35

```asm
MOV 33H,A
MOV 34H,#1
ACALL PRINTAPPOINTMENT
```

### B36

```asm
SJMP BACK1
```

### B37

```asm
CJNE A,#1,ERROR1
```

### B38

```asm
ACALL APPOINTMENT
```

### B39

```asm
MOV A,30H
ADD A,#4
ACALL CHEACK
```

### B40

```asm
MOV 33H,A
MOV 34H,#2
ACALL PRINTAPPOINTMENT
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 95 to 95"]
B41["B42: ERROR1 - lines 100 to 100"]
B42["B43: instructions - lines 102 to 102"]
B43["B44: CHEACK - lines 106 to 106"]
B44["B45: instructions - lines 107 to 107"]
B45["B46: CONTINUE - lines 109 to 109"]
B46["B47: instructions - lines 110 to 110"]
B47["B48: BACK2 - lines 113 to 113"]
B48["B49: CONFIRM - lines 117 to 117"]
B49["B50: instructions - lines 118 to 119"]
B40 -->|jump| B41
B41 -->|call| B48
B41 -->|after return| B42
B43 -->|condition true| B45
B43 -->|condition false| B44
B44 -->|jump| B47
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|next| B47
B48 -->|call| B154
B48 -->|after return| B49
B49 -->|call| B141
B49 -->|after return| B50
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SJMP BACK1
```

### B42

```asm
ACALL CONFIRM
```

### B43

Return to the instruction following the active call.

```asm
RET
```

### B44

```asm
CJNE A,#12,CONTINUE
```

### B45

```asm
SJMP BACK2
```

### B46

```asm
JC BACK2
```

### B47

```asm
SUBB A,#12
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
ACALL CLEAR
```

### B50

```asm
MOV A, #80H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 120 to 121"]
B51["B52: instructions - lines 122 to 122"]
B52["B53: instructions - lines 123 to 124"]
B53["B54: instructions - lines 125 to 126"]
B54["B55: instructions - lines 127 to 127"]
B55["B56: instructions - lines 128 to 128"]
B56["B57: instructions - lines 129 to 130"]
B57["B58: instructions - lines 131 to 131"]
B58["B59: WELCOME - lines 134 to 135"]
B59["B60: instructions - lines 136 to 137"]
B50 -->|call| B147
B50 -->|after return| B51
B51 -->|call| B159
B51 -->|after return| B52
B52 -->|call| B141
B52 -->|after return| B53
B53 -->|call| B147
B53 -->|after return| B54
B54 -->|call| B159
B54 -->|after return| B55
B55 -->|call| B166
B55 -->|after return| B56
B56 -->|condition true| B48
B56 -->|condition false| B57
B58 -->|call| B141
B58 -->|after return| B59
B59 -->|call| B147
B59 -->|after return| B60
B147["Continue at B148 in section 15"]
B159["Continue at B160 in section 16"]
B141["Continue at B142 in section 15"]
B166["Continue at B167 in section 17"]
B48["Continue at B49 in section 5"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV DPTR, #CONF
ACALL WSTR
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
MOV A, #0C0H
ACALL CMD
```

### B54

```asm
MOV DPTR, #OPTION
ACALL WSTR
```

### B55

```asm
ACALL DELAY
```

### B56

```asm
ACALL KEYPAD
```

### B57

```asm
SUBB A,#30H
CJNE A,#1,CONFIRM
```

### B58

Return to the instruction following the active call.

```asm
RET
```

### B59

```asm
MOV A, #80H
ACALL CMD
```

### B60

```asm
MOV DPTR, #STR1
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 138 to 138"]
B61["B62: instructions - lines 140 to 140"]
B62["B63: MENU - lines 143 to 143"]
B63["B64: instructions - lines 144 to 145"]
B64["B65: instructions - lines 146 to 147"]
B65["B66: instructions - lines 148 to 148"]
B66["B67: instructions - lines 149 to 150"]
B67["B68: instructions - lines 151 to 152"]
B68["B69: instructions - lines 153 to 153"]
B69["B70: instructions - lines 155 to 156"]
B60 -->|call| B159
B60 -->|after return| B61
B62 -->|call| B154
B62 -->|after return| B63
B63 -->|call| B141
B63 -->|after return| B64
B64 -->|call| B147
B64 -->|after return| B65
B65 -->|call| B159
B65 -->|after return| B66
B66 -->|call| B141
B66 -->|after return| B67
B67 -->|call| B147
B67 -->|after return| B68
B68 -->|call| B159
B68 -->|after return| B69
B69 -->|call| B141
B69 -->|after return| B70
B159["Continue at B160 in section 16"]
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B147["Continue at B148 in section 15"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

Return to the instruction following the active call.

```asm
RET
```

### B63

```asm
ACALL CLEAR
```

### B64

```asm
MOV A, #80H
ACALL CMD
```

### B65

```asm
MOV DPTR, #STR2
ACALL WSTR
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
MOV A, #0C0H
ACALL CMD
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
MOV A, #80H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 157 to 158"]
B71["B72: instructions - lines 159 to 160"]
B72["B73: instructions - lines 161 to 162"]
B73["B74: instructions - lines 163 to 163"]
B74["B75: instructions - lines 164 to 164"]
B75["B76: SHOWPOS - lines 168 to 168"]
B76["B77: instructions - lines 169 to 170"]
B77["B78: instructions - lines 171 to 172"]
B78["B79: instructions - lines 173 to 173"]
B79["B80: instructions - lines 174 to 175"]
B70 -->|call| B147
B70 -->|after return| B71
B71 -->|call| B141
B71 -->|after return| B72
B72 -->|call| B147
B72 -->|after return| B73
B73 -->|call| B159
B73 -->|after return| B74
B75 -->|call| B154
B75 -->|after return| B76
B76 -->|call| B141
B76 -->|after return| B77
B77 -->|call| B147
B77 -->|after return| B78
B78 -->|call| B159
B78 -->|after return| B79
B79 -->|call| B141
B79 -->|after return| B80
B147["Continue at B148 in section 15"]
B141["Continue at B142 in section 15"]
B159["Continue at B160 in section 16"]
B154["Continue at B155 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV DPTR, #STR4
ACALL WSTR
```

### B72

```asm
MOV A, #0C0H
ACALL CMD
```

### B73

```asm
MOV DPTR, #OPTION
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
ACALL CLEAR
```

### B77

```asm
MOV A, #80H
ACALL CMD
```

### B78

```asm
MOV DPTR, #STR5
ACALL WSTR
```

### B79

```asm
ACALL DELAY
```

### B80

```asm
MOV A, #0C0H
ACALL CMD
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 176 to 177"]
B81["B82: instructions - lines 178 to 178"]
B82["B83: instructions - lines 179 to 179"]
B83["B84: instructions - lines 180 to 183"]
B84["B85: instructions - lines 184 to 185"]
B85["B86: instructions - lines 186 to 187"]
B86["B87: instructions - lines 188 to 189"]
B87["B88: instructions - lines 190 to 191"]
B88["B89: instructions - lines 192 to 192"]
B89["B90: instructions - lines 193 to 193"]
B80 -->|call| B147
B80 -->|after return| B81
B81 -->|call| B159
B81 -->|after return| B82
B82 -->|call| B166
B82 -->|after return| B83
B83 -->|call| B154
B83 -->|after return| B84
B84 -->|call| B141
B84 -->|after return| B85
B85 -->|call| B147
B85 -->|after return| B86
B86 -->|call| B141
B86 -->|after return| B87
B87 -->|call| B147
B87 -->|after return| B88
B88 -->|call| B159
B88 -->|after return| B89
B147["Continue at B148 in section 15"]
B159["Continue at B160 in section 16"]
B166["Continue at B167 in section 17"]
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
```

### B81

```asm
MOV DPTR, #STR6
ACALL WSTR
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
ACALL KEYPAD
```

### B84

```asm
SUBB A,#30H
MOV R7,A
MOV 30H,A
ACALL CLEAR
```

### B85

```asm
MOV A, #80H
ACALL CMD
```

### B86

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B87

```asm
MOV A, #0C0H
ACALL CMD
```

### B88

```asm
MOV DPTR, #OPTION
ACALL WSTR
```

### B89

```asm
ACALL DELAY
```

### B90

Return to the instruction following the active call.

```asm
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: APPOINTMENT - lines 197 to 197"]
B91["B92: instructions - lines 198 to 199"]
B92["B93: instructions - lines 200 to 201"]
B93["B94: instructions - lines 202 to 202"]
B94["B95: instructions - lines 203 to 204"]
B95["B96: instructions - lines 205 to 206"]
B96["B97: instructions - lines 207 to 207"]
B97["B98: instructions - lines 208 to 208"]
B98["B99: instructions - lines 210 to 210"]
B99["B100: PRINTAPPOINTMENT - lines 213 to 213"]
B90 -->|call| B154
B90 -->|after return| B91
B91 -->|call| B141
B91 -->|after return| B92
B92 -->|call| B147
B92 -->|after return| B93
B93 -->|call| B159
B93 -->|after return| B94
B94 -->|call| B141
B94 -->|after return| B95
B95 -->|call| B147
B95 -->|after return| B96
B96 -->|call| B159
B96 -->|after return| B97
B97 -->|call| B154
B97 -->|after return| B98
B99 -->|call| B154
B99 -->|after return| B100
B154["Continue at B155 in section 16"]
B141["Continue at B142 in section 15"]
B147["Continue at B148 in section 15"]
B159["Continue at B160 in section 16"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL CLEAR
```

### B92

```asm
MOV A, #80H
ACALL CMD
```

### B93

```asm
MOV DPTR, #STR8
ACALL WSTR
```

### B94

```asm
ACALL DELAY
```

### B95

```asm
MOV A, #0C0H
ACALL CMD
```

### B96

```asm
MOV DPTR, #STR9
ACALL WSTR
```

### B97

```asm
ACALL DELAY
```

### B98

```asm
ACALL CLEAR
```

### B99

Return to the instruction following the active call.

```asm
RET
```

### B100

```asm
ACALL CLEAR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 214 to 215"]
B101["B102: instructions - lines 216 to 218"]
B102["B103: instructions - lines 219 to 220"]
B103["B104: instructions - lines 221 to 225"]
B104["B105: instructions - lines 226 to 228"]
B105["B106: instructions - lines 229 to 230"]
B106["B107: instructions - lines 231 to 231"]
B107["B108: instructions - lines 232 to 232"]
B108["B109: instructions - lines 233 to 233"]
B109["B110: SHOWNEG - lines 238 to 238"]
B100 -->|call| B141
B100 -->|after return| B101
B101 -->|call| B136
B101 -->|after return| B102
B102 -->|call| B136
B102 -->|after return| B103
B103 -->|call| B136
B103 -->|after return| B104
B104 -->|call| B136
B104 -->|after return| B105
B105 -->|call| B147
B105 -->|after return| B106
B106 -->|call| B159
B106 -->|after return| B107
B107 -->|call| B159
B107 -->|after return| B108
B109 -->|call| B154
B109 -->|after return| B110
B141["Continue at B142 in section 15"]
B136["Continue at B137 in section 14"]
B147["Continue at B148 in section 15"]
B159["Continue at B160 in section 16"]
B154["Continue at B155 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A,#80H
ACALL CMD
```

### B102

```asm
MOV A,34H
ADD A,#30H
ACALL WCHR
```

### B103

```asm
MOV A,#'-'
ACALL WCHR
```

### B104

```asm
MOV A,33H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B105

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B106

```asm
MOV DPTR, #STR12
ACALL WSTR
```

### B107

```asm
ACALL DELAY
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
B110["B111: instructions - lines 239 to 240"]
B111["B112: instructions - lines 241 to 242"]
B112["B113: instructions - lines 243 to 243"]
B113["B114: instructions - lines 244 to 245"]
B114["B115: instructions - lines 246 to 247"]
B115["B116: instructions - lines 248 to 248"]
B116["B117: instructions - lines 249 to 249"]
B117["B118: PRONEG1 - lines 252 to 252"]
B118["B119: instructions - lines 253 to 254"]
B119["B120: instructions - lines 255 to 256"]
B110 -->|call| B141
B110 -->|after return| B111
B111 -->|call| B147
B111 -->|after return| B112
B112 -->|call| B159
B112 -->|after return| B113
B113 -->|call| B141
B113 -->|after return| B114
B114 -->|call| B147
B114 -->|after return| B115
B115 -->|call| B159
B115 -->|after return| B116
B117 -->|call| B154
B117 -->|after return| B118
B118 -->|call| B141
B118 -->|after return| B119
B119 -->|call| B147
B119 -->|after return| B120
B141["Continue at B142 in section 15"]
B147["Continue at B148 in section 15"]
B159["Continue at B160 in section 16"]
B154["Continue at B155 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A, #80H
ACALL CMD
```

### B112

```asm
MOV DPTR, #STR7
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
MOV DPTR, #STR10
ACALL WSTR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 257 to 257"]
B121["B122: instructions - lines 258 to 258"]
B122["B123: PRONEG2 - lines 261 to 262"]
B123["B124: instructions - lines 263 to 264"]
B124["B125: instructions - lines 265 to 265"]
B125["B126: instructions - lines 266 to 266"]
B126["B127: ERRORR - lines 272 to 272"]
B127["B128: instructions - lines 273 to 274"]
B128["B129: instructions - lines 275 to 276"]
B129["B130: instructions - lines 277 to 277"]
B120 -->|call| B159
B120 -->|after return| B121
B122 -->|call| B141
B122 -->|after return| B123
B123 -->|call| B147
B123 -->|after return| B124
B124 -->|call| B159
B124 -->|after return| B125
B126 -->|call| B154
B126 -->|after return| B127
B127 -->|call| B141
B127 -->|after return| B128
B128 -->|call| B147
B128 -->|after return| B129
B129 -->|call| B159
B129 -->|after return| B130
B159["Continue at B160 in section 16"]
B141["Continue at B142 in section 15"]
B147["Continue at B148 in section 15"]
B154["Continue at B155 in section 16"]
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
MOV A, #0C0H
ACALL CMD
```

### B124

```asm
MOV DPTR, #TOMORROW
ACALL WSTR
```

### B125

```asm
ACALL DELAY
```

### B126

Return to the instruction following the active call.

```asm
RET
```

### B127

```asm
ACALL CLEAR
```

### B128

```asm
MOV A, #80H
ACALL CMD
```

### B129

```asm
MOV DPTR, #STR11
ACALL WSTR
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 278 to 278"]
B131["B132: INLCD - lines 285 to 293"]
B132["B133: instructions - lines 295 to 304"]
B133["B134: instructions - lines 306 to 321"]
B134["B135: instructions - lines 323 to 335"]
B135["B136: instructions - lines 336 to 336"]
B136["B137: WCHR - lines 341 to 345"]
B137["B138: instructions - lines 346 to 346"]
B138["B139: instructions - lines 347 to 349"]
B139["B140: instructions - lines 350 to 350"]
B131 -->|call| B152
B131 -->|after return| B132
B132 -->|call| B152
B132 -->|after return| B133
B133 -->|call| B152
B133 -->|after return| B134
B134 -->|call| B152
B134 -->|after return| B135
B136 -->|call| B146
B136 -->|after return| B137
B137 -->|call| B152
B137 -->|after return| B138
B138 -->|call| B146
B138 -->|after return| B139
B139 -->|call| B152
B139 -->|after return| B140
B152["Continue at B153 in section 16"]
B146["Continue at B147 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

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

### B133

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

### B134

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

### B135

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

### B136

Return to the instruction following the active call.

```asm
RET
```

### B137

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B138

```asm
ACALL LDELAY
```

### B139

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B140

```asm
ACALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 351 to 353"]
B141["B142: CMD - lines 356 to 358"]
B142["B143: instructions - lines 359 to 359"]
B143["B144: instructions - lines 360 to 362"]
B144["B145: instructions - lines 363 to 363"]
B145["B146: instructions - lines 364 to 364"]
B146["B147: COMMON - lines 368 to 373"]
B147["B148: WSTR - lines 377 to 377"]
B148["B149: CONT1 - lines 379 to 381"]
B149["B150: PRINT - lines 383 to 383"]
B141 -->|call| B146
B141 -->|after return| B142
B142 -->|call| B152
B142 -->|after return| B143
B143 -->|call| B146
B143 -->|after return| B144
B144 -->|call| B152
B144 -->|after return| B145
B147 -->|next| B148
B148 -->|condition true| B151
B148 -->|condition false| B149
B149 -->|call| B136
B149 -->|after return| B150
B152["Continue at B153 in section 16"]
B151["Continue at B152 in section 16"]
B136["Continue at B137 in section 14"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B142

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B143

```asm
ACALL LDELAY
```

### B144

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B145

```asm
ACALL LDELAY
```

### B146

Return to the instruction following the active call.

```asm
RET
```

### B147

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B148

```asm
PUSH    ACC
```

### B149

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B150

```asm
ACALL    WCHR
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 384 to 385"]
B151["B152: EXIT1 - lines 386 to 387"]
B152["B153: LDELAY - lines 391 to 392"]
B153["B154: instructions - lines 393 to 393"]
B154["B155: CLEAR - lines 396 to 397"]
B155["B156: instructions - lines 398 to 398"]
B156["B157: WAIT - lines 399 to 399"]
B157["B158: instructions - lines 400 to 400"]
B158["B159: instructions - lines 401 to 401"]
B159["B160: DELAY - lines 404 to 404"]
B150 -->|jump| B148
B152 -->|condition true| B152
B152 -->|condition false| B153
B154 -->|call| B141
B154 -->|after return| B155
B155 -->|next| B156
B156 -->|call| B152
B156 -->|after return| B157
B157 -->|condition true| B156
B157 -->|condition false| B158
B159 -->|next| B160
B148["Continue at B149 in section 15"]
B141["Continue at B142 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
INC DPTR
AJMP    CONT1
```

### B152

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B153

```asm
MOV R0, #50
DJNZ R0, $
```

### B154

Return to the instruction following the active call.

```asm
RET
```

### B155

```asm
MOV A,#01H
ACALL CMD
```

### B156

```asm
MOV R7,#14
```

### B157

```asm
ACALL LDELAY
```

### B158

```asm
DJNZ R7,WAIT
```

### B159

Return to the instruction following the active call.

```asm
RET
```

### B160

```asm
MOV	R5,#2
```

## Section 17

```mermaid
flowchart TD
B160["B161: X3 - lines 405 to 405"]
B161["B162: X2 - lines 406 to 406"]
B162["B163: X1 - lines 407 to 407"]
B163["B164: instructions - lines 408 to 408"]
B164["B165: instructions - lines 409 to 409"]
B165["B166: instructions - lines 410 to 410"]
B166["B167: KEYPAD - lines 414 to 414"]
B167["B168: K1 - lines 415 to 418"]
B168["B169: K2 - lines 420 to 422"]
B169["B170: instructions - lines 423 to 423"]
B160 -->|next| B161
B161 -->|next| B162
B162 -->|condition true| B162
B162 -->|condition false| B163
B163 -->|condition true| B161
B163 -->|condition false| B164
B164 -->|condition true| B160
B164 -->|condition false| B165
B166 -->|next| B167
B167 -->|condition true| B167
B167 -->|condition false| B168
B168 -->|condition true| B170
B168 -->|condition false| B169
B169 -->|jump| B168
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV	R4,#20
```

### B162

```asm
MOV	R3,#250
```

### B163

```asm
DJNZ	R3,X1
```

### B164

```asm
DJNZ	R4,X2
```

### B165

```asm
DJNZ	R5,X3
```

### B166

Return to the instruction following the active call.

```asm
RET
```

### B167

```asm
MOV P0,#01110000B
```

### B168

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B169

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B170

```asm
SJMP K2
```

## Section 18

```mermaid
flowchart TD
B170["B171: OVER1 - lines 425 to 428"]
B171["B172: instructions - lines 429 to 432"]
B172["B173: instructions - lines 433 to 436"]
B173["B174: instructions - lines 437 to 440"]
B174["B175: instructions - lines 441 to 441"]
B175["B176: ROW_0 - lines 442 to 443"]
B176["B177: ROW_1 - lines 444 to 445"]
B177["B178: ROW_2 - lines 446 to 447"]
B178["B179: ROW_3 - lines 448 to 448"]
B179["B180: FIND - lines 451 to 451"]
B170 -->|condition true| B175
B170 -->|condition false| B171
B171 -->|condition true| B176
B171 -->|condition false| B172
B172 -->|condition true| B177
B172 -->|condition false| B173
B173 -->|condition true| B178
B173 -->|condition false| B174
B174 -->|jump| B168
B175 -->|jump| B179
B176 -->|jump| B179
B177 -->|jump| B179
B178 -->|next| B179
B179 -->|next| B180
B168["Continue at B169 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B172

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B173

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B174

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B175

```asm
LJMP K2
```

### B176

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B177

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B178

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B179

```asm
MOV DPTR,#KCODE3
```

### B180

```asm
RLC A
```

## Section 19

```mermaid
flowchart TD
B180["B181: FIND1 - lines 453 to 454"]
B181["B182: instructions - lines 455 to 456"]
B182["B183: MATCH - lines 457 to 459"]
B180 -->|condition true| B182
B180 -->|condition false| B181
B181 -->|jump| B180
```

### B181

```asm
RLC A
JNC MATCH
```

### B182

```asm
INC DPTR
SJMP FIND1
```

### B183

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
