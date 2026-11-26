# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 8"]
B1["B2: instructions - lines 10 to 10"]
B2["B3: instructions - lines 12 to 12"]
B3["B4: instructions - lines 13 to 14"]
B4["B5: instructions - lines 15 to 16"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: instructions - lines 19 to 20"]
B8["B9: instructions - lines 21 to 22"]
B9["B10: instructions - lines 23 to 23"]
B0 -->|call| B24
B0 -->|after return| B1
B1 -->|call| B237
B1 -->|after return| B2
B2 -->|call| B244
B2 -->|after return| B3
B3 -->|call| B231
B3 -->|after return| B4
B4 -->|call| B249
B4 -->|after return| B5
B5 -->|call| B254
B5 -->|after return| B6
B6 -->|call| B254
B6 -->|after return| B7
B7 -->|call| B231
B7 -->|after return| B8
B8 -->|call| B249
B8 -->|after return| B9
B9 -->|call| B254
B9 -->|after return| B10
B24["Continue at B25 in section 3"]
B237["Continue at B238 in section 24"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#2
MOV 31H,#2
MOV 32H,#2
MOV 33H,#1
MOV 35H,#00
ACALL FLASHING
```

### B2

```asm
ACALL INLCD
```

### B3

```asm
ACALL CLEAR
```

### B4

```asm
mov a, #80H
acall cmd
```

### B5

```asm
mov dptr, #STR1
acall WSTR
```

### B6

```asm
ACALL DELAY
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
mov a, #0C0H
acall cmd
```

### B9

```asm
mov dptr, #STR2
acall WSTR
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 24 to 24"]
B11["B12: START - lines 27 to 27"]
B12["B13: instructions - lines 28 to 30"]
B13["B14: instructions - lines 31 to 31"]
B14["B15: instructions - lines 32 to 32"]
B15["B16: instructions - lines 33 to 33"]
B16["B17: COVIDCHEACK - lines 36 to 36"]
B17["B18: instructions - lines 37 to 37"]
B18["B19: instructions - lines 38 to 38"]
B19["B20: instructions - lines 39 to 39"]
B10 -->|call| B254
B10 -->|after return| B11
B11 -->|call| B48
B11 -->|after return| B12
B12 -->|condition true| B16
B12 -->|condition false| B13
B13 -->|call| B57
B13 -->|after return| B14
B14 -->|call| B28
B14 -->|after return| B15
B15 -->|jump| B20
B16 -->|condition true| B23
B16 -->|condition false| B17
B17 -->|call| B57
B17 -->|after return| B18
B18 -->|call| B42
B18 -->|after return| B19
B19 -->|jump| B20
B254["Continue at B255 in section 26"]
B48["Continue at B49 in section 5"]
B57["Continue at B58 in section 6"]
B28["Continue at B29 in section 3"]
B20["Continue at B21 in section 3"]
B23["Continue at B24 in section 3"]
B42["Continue at B43 in section 5"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
ACALL MENU
```

### B13

```asm
MOV A,30H
CJNE A,#1,COVIDCHEACK
```

### B14

```asm
ACALL AGE
```

### B15

```asm
ACALL CECKUP
```

### B16

```asm
SJMP ASK
```

### B17

```asm
CJNE A,#2,EXIT
```

### B18

```asm
ACALL AGE
```

### B19

```asm
ACALL COVID
```

### B20

```asm
SJMP ASK
```

## Section 3

```mermaid
flowchart TD
B20["B21: ASK - lines 42 to 42"]
B21["B22: instructions - lines 43 to 44"]
B22["B23: instructions - lines 45 to 45"]
B23["B24: EXIT - lines 47 to 47"]
B24["B25: FLASHING - lines 51 to 51"]
B25["B26: HERE - lines 53 to 54"]
B26["B27: instructions - lines 55 to 55"]
B27["B28: instructions - lines 58 to 58"]
B28["B29: CECKUP - lines 64 to 72"]
B29["B30: NEXT1 - lines 74 to 74"]
B20 -->|call| B196
B20 -->|after return| B21
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B11
B23 -->|jump| B23
B24 -->|next| B25
B25 -->|call| B254
B25 -->|after return| B26
B26 -->|condition true| B25
B26 -->|condition false| B27
B28 -->|condition true| B29
B28 -->|condition false| B29
B29 -->|condition true| B32
B29 -->|condition false| B30
B196["Continue at B197 in section 20"]
B11["Continue at B12 in section 2"]
B254["Continue at B255 in section 26"]
B32["Continue at B33 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL RETURN
```

### B22

```asm
MOV A,33H
CJNE A,#1,EXIT
```

### B23

```asm
AJMP START
```

### B24

```asm
SJMP EXIT
```

### B25

```asm
MOV R3,#6
```

### B26

```asm
CPL P1.0
ACALL DELAY
```

### B27

```asm
DJNZ R3,HERE
```

### B28

Return to the instruction following the active call.

```asm
RET
```

### B29

```asm
MOV A,31H
MOV B,#10
DIV AB
CJNE A,#2,NEXT1
```

### B30

```asm
JNC LEVEL2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 76 to 77"]
B31["B32: instructions - lines 78 to 78"]
B32["B33: LEVEL2 - lines 81 to 81"]
B33["B34: NEXT2 - lines 83 to 83"]
B34["B35: instructions - lines 85 to 86"]
B35["B36: instructions - lines 87 to 87"]
B36["B37: LEVEL3 - lines 90 to 91"]
B37["B38: instructions - lines 92 to 93"]
B38["B39: instructions - lines 94 to 94"]
B39["B40: FEMALE - lines 97 to 98"]
B30 -->|call| B67
B30 -->|after return| B31
B31 -->|jump| B41
B32 -->|condition true| B33
B32 -->|condition false| B33
B33 -->|condition true| B36
B33 -->|condition false| B34
B34 -->|call| B90
B34 -->|after return| B35
B35 -->|jump| B41
B36 -->|condition true| B39
B36 -->|condition false| B37
B37 -->|call| B117
B37 -->|after return| B38
B38 -->|jump| B41
B39 -->|call| B152
B39 -->|after return| B40
B67["Continue at B68 in section 7"]
B41["Continue at B42 in section 5"]
B90["Continue at B91 in section 10"]
B117["Continue at B118 in section 12"]
B152["Continue at B153 in section 16"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV 35H,#1
ACALL SHOW1
```

### B32

```asm
SJMP EE
```

### B33

```asm
CJNE A,#4,NEXT2
```

### B34

```asm
JNC LEVEL3
```

### B35

```asm
MOV 35H,#2
ACALL SHOW2
```

### B36

```asm
SJMP EE
```

### B37

```asm
MOV A,32H
CJNE A,#1,FEMALE
```

### B38

```asm
MOV 35H,#3
ACALL SHOW3
```

### B39

```asm
SJMP EE
```

### B40

```asm
MOV 35H,#4
ACALL SHOW4
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 99 to 99"]
B41["B42: EE - lines 102 to 102"]
B42["B43: COVID - lines 105 to 107"]
B43["B44: NEXT - lines 109 to 109"]
B44["B45: instructions - lines 111 to 112"]
B45["B46: instructions - lines 113 to 113"]
B46["B47: OKAY - lines 116 to 117"]
B47["B48: EEE - lines 119 to 119"]
B48["B49: MENU - lines 122 to 122"]
B49["B50: instructions - lines 123 to 124"]
B40 -->|jump| B41
B42 -->|condition true| B43
B42 -->|condition false| B43
B43 -->|condition true| B46
B43 -->|condition false| B44
B44 -->|call| B216
B44 -->|after return| B45
B45 -->|jump| B47
B46 -->|call| B206
B46 -->|after return| B47
B48 -->|call| B244
B48 -->|after return| B49
B49 -->|call| B231
B49 -->|after return| B50
B216["Continue at B217 in section 22"]
B206["Continue at B207 in section 21"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SJMP EE
```

### B42

Return to the instruction following the active call.

```asm
RET
```

### B43

```asm
MOV A,31H
CJNE A,#5,NEXT
```

### B44

```asm
JNC OKAY
```

### B45

```asm
MOV 35H,#5
ACALL SHOW6
```

### B46

```asm
SJMP EEE
```

### B47

```asm
MOV 35H,#6
ACALL SHOW5
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
mov a, #80H
acall cmd
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 125 to 126"]
B51["B52: instructions - lines 127 to 127"]
B52["B53: instructions - lines 129 to 130"]
B53["B54: instructions - lines 131 to 132"]
B54["B55: instructions - lines 133 to 133"]
B55["B56: instructions - lines 134 to 134"]
B56["B57: instructions - lines 135 to 135"]
B57["B58: AGE - lines 139 to 139"]
B58["B59: instructions - lines 140 to 141"]
B59["B60: instructions - lines 142 to 143"]
B50 -->|call| B249
B50 -->|after return| B51
B51 -->|call| B254
B51 -->|after return| B52
B52 -->|call| B231
B52 -->|after return| B53
B53 -->|call| B249
B53 -->|after return| B54
B54 -->|call| B254
B54 -->|after return| B55
B55 -->|call| B254
B55 -->|after return| B56
B57 -->|call| B244
B57 -->|after return| B58
B58 -->|call| B231
B58 -->|after return| B59
B59 -->|call| B249
B59 -->|after return| B60
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B244["Continue at B245 in section 25"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
mov dptr, #STR3
acall WSTR
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
mov a, #0c0H
acall cmd
```

### B54

```asm
mov dptr, #STR4
acall WSTR
```

### B55

```asm
ACALL DELAY
```

### B56

```asm
ACALL DELAY
```

### B57

Return to the instruction following the active call.

```asm
RET
```

### B58

```asm
ACALL CLEAR
```

### B59

```asm
mov a, #80H
acall cmd
```

### B60

```asm
mov dptr, #STR5
acall WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 144 to 144"]
B61["B62: instructions - lines 145 to 145"]
B62["B63: instructions - lines 147 to 151"]
B63["B64: instructions - lines 152 to 154"]
B64["B65: instructions - lines 155 to 155"]
B65["B66: instructions - lines 156 to 156"]
B66["B67: instructions - lines 157 to 157"]
B67["B68: SHOW1 - lines 160 to 160"]
B68["B69: instructions - lines 161 to 162"]
B69["B70: instructions - lines 163 to 164"]
B60 -->|call| B254
B60 -->|after return| B61
B61 -->|call| B254
B61 -->|after return| B62
B62 -->|call| B226
B62 -->|after return| B63
B63 -->|call| B226
B63 -->|after return| B64
B64 -->|call| B254
B64 -->|after return| B65
B65 -->|call| B254
B65 -->|after return| B66
B67 -->|call| B244
B67 -->|after return| B68
B68 -->|call| B231
B68 -->|after return| B69
B69 -->|call| B249
B69 -->|after return| B70
B254["Continue at B255 in section 26"]
B226["Continue at B227 in section 23"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
MOV A,31H
MOV B,#10
DIV AB
ADD A,#30H
acall WCHR
```

### B64

```asm
MOV A,B
ADD A,#30H
acall WCHR
```

### B65

```asm
ACALL DELAY
```

### B66

```asm
ACALL DELAY
```

### B67

Return to the instruction following the active call.

```asm
RET
```

### B68

```asm
ACALL CLEAR
```

### B69

```asm
mov a, #80H
acall cmd
```

### B70

```asm
mov dptr, #STR6
acall WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 165 to 165"]
B71["B72: instructions - lines 166 to 166"]
B72["B73: instructions - lines 167 to 167"]
B73["B74: instructions - lines 168 to 169"]
B74["B75: instructions - lines 170 to 170"]
B75["B76: instructions - lines 171 to 172"]
B76["B77: instructions - lines 173 to 173"]
B77["B78: instructions - lines 174 to 175"]
B78["B79: instructions - lines 176 to 177"]
B79["B80: instructions - lines 178 to 178"]
B70 -->|call| B254
B70 -->|after return| B71
B71 -->|call| B254
B71 -->|after return| B72
B72 -->|call| B244
B72 -->|after return| B73
B73 -->|call| B231
B73 -->|after return| B74
B74 -->|call| B244
B74 -->|after return| B75
B75 -->|call| B249
B75 -->|after return| B76
B76 -->|call| B254
B76 -->|after return| B77
B77 -->|call| B231
B77 -->|after return| B78
B78 -->|call| B249
B78 -->|after return| B79
B79 -->|call| B254
B79 -->|after return| B80
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
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
mov a, #80H
acall cmd
```

### B75

```asm
ACALL CLEAR
```

### B76

```asm
mov dptr, #STR7
acall WSTR
```

### B77

```asm
ACALL DELAY
```

### B78

```asm
mov a, #0C0H
acall cmd
```

### B79

```asm
mov dptr, #STR8
acall WSTR
```

### B80

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 179 to 179"]
B81["B82: instructions - lines 181 to 181"]
B82["B83: instructions - lines 182 to 183"]
B83["B84: instructions - lines 184 to 185"]
B84["B85: instructions - lines 186 to 186"]
B85["B86: instructions - lines 187 to 188"]
B86["B87: instructions - lines 189 to 190"]
B87["B88: instructions - lines 191 to 191"]
B88["B89: instructions - lines 192 to 192"]
B89["B90: instructions - lines 194 to 194"]
B80 -->|call| B254
B80 -->|after return| B81
B81 -->|call| B244
B81 -->|after return| B82
B82 -->|call| B231
B82 -->|after return| B83
B83 -->|call| B249
B83 -->|after return| B84
B84 -->|call| B254
B84 -->|after return| B85
B85 -->|call| B231
B85 -->|after return| B86
B86 -->|call| B249
B86 -->|after return| B87
B87 -->|call| B254
B87 -->|after return| B88
B88 -->|call| B254
B88 -->|after return| B89
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
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
mov a, #80H
acall cmd
```

### B84

```asm
mov dptr, #STR9
acall WSTR
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
mov a, #0C0H
acall cmd
```

### B87

```asm
mov dptr, #STR10
acall WSTR
```

### B88

```asm
ACALL DELAY
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
B90["B91: SHOW2 - lines 197 to 197"]
B91["B92: instructions - lines 198 to 199"]
B92["B93: instructions - lines 200 to 201"]
B93["B94: instructions - lines 202 to 202"]
B94["B95: instructions - lines 203 to 203"]
B95["B96: instructions - lines 204 to 204"]
B96["B97: instructions - lines 205 to 206"]
B97["B98: instructions - lines 207 to 207"]
B98["B99: instructions - lines 208 to 209"]
B99["B100: instructions - lines 210 to 210"]
B90 -->|call| B244
B90 -->|after return| B91
B91 -->|call| B231
B91 -->|after return| B92
B92 -->|call| B249
B92 -->|after return| B93
B93 -->|call| B254
B93 -->|after return| B94
B94 -->|call| B254
B94 -->|after return| B95
B95 -->|call| B244
B95 -->|after return| B96
B96 -->|call| B231
B96 -->|after return| B97
B97 -->|call| B244
B97 -->|after return| B98
B98 -->|call| B249
B98 -->|after return| B99
B99 -->|call| B254
B99 -->|after return| B100
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL CLEAR
```

### B92

```asm
mov a, #80H
acall cmd
```

### B93

```asm
mov dptr, #STR6
acall WSTR
```

### B94

```asm
ACALL DELAY
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
mov a, #80H
acall cmd
```

### B98

```asm
ACALL CLEAR
```

### B99

```asm
mov dptr, #STR7
acall WSTR
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 211 to 212"]
B101["B102: instructions - lines 213 to 214"]
B102["B103: instructions - lines 215 to 215"]
B103["B104: instructions - lines 216 to 216"]
B104["B105: instructions - lines 218 to 218"]
B105["B106: instructions - lines 219 to 220"]
B106["B107: instructions - lines 221 to 221"]
B107["B108: instructions - lines 222 to 222"]
B108["B109: instructions - lines 224 to 224"]
B109["B110: instructions - lines 225 to 226"]
B100 -->|call| B231
B100 -->|after return| B101
B101 -->|call| B249
B101 -->|after return| B102
B102 -->|call| B254
B102 -->|after return| B103
B103 -->|call| B254
B103 -->|after return| B104
B104 -->|call| B244
B104 -->|after return| B105
B105 -->|call| B249
B105 -->|after return| B106
B106 -->|call| B254
B106 -->|after return| B107
B107 -->|call| B254
B107 -->|after return| B108
B108 -->|call| B244
B108 -->|after return| B109
B109 -->|call| B231
B109 -->|after return| B110
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov a, #0C0H
acall cmd
```

### B102

```asm
mov dptr, #STR10
acall WSTR
```

### B103

```asm
ACALL DELAY
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
mov dptr, #STR11
acall WSTR
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

```asm
ACALL CLEAR
```

### B110

```asm
mov a, #80H
acall cmd
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 227 to 228"]
B111["B112: instructions - lines 229 to 229"]
B112["B113: instructions - lines 230 to 231"]
B113["B114: instructions - lines 232 to 233"]
B114["B115: instructions - lines 234 to 234"]
B115["B116: instructions - lines 235 to 235"]
B116["B117: instructions - lines 236 to 236"]
B117["B118: SHOW3 - lines 239 to 239"]
B118["B119: instructions - lines 240 to 241"]
B119["B120: instructions - lines 242 to 243"]
B110 -->|call| B249
B110 -->|after return| B111
B111 -->|call| B254
B111 -->|after return| B112
B112 -->|call| B231
B112 -->|after return| B113
B113 -->|call| B249
B113 -->|after return| B114
B114 -->|call| B254
B114 -->|after return| B115
B115 -->|call| B254
B115 -->|after return| B116
B117 -->|call| B244
B117 -->|after return| B118
B118 -->|call| B231
B118 -->|after return| B119
B119 -->|call| B249
B119 -->|after return| B120
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B244["Continue at B245 in section 25"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov dptr, #STR9
acall WSTR
```

### B112

```asm
ACALL DELAY
```

### B113

```asm
mov a, #0C0H
acall cmd
```

### B114

```asm
mov dptr, #STR10
acall WSTR
```

### B115

```asm
ACALL DELAY
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
mov a, #80H
acall cmd
```

### B120

```asm
mov dptr, #STR6
acall WSTR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 244 to 244"]
B121["B122: instructions - lines 245 to 245"]
B122["B123: instructions - lines 247 to 247"]
B123["B124: instructions - lines 248 to 249"]
B124["B125: instructions - lines 250 to 250"]
B125["B126: instructions - lines 251 to 252"]
B126["B127: instructions - lines 253 to 253"]
B127["B128: instructions - lines 254 to 255"]
B128["B129: instructions - lines 256 to 257"]
B129["B130: instructions - lines 258 to 258"]
B120 -->|call| B254
B120 -->|after return| B121
B121 -->|call| B254
B121 -->|after return| B122
B122 -->|call| B244
B122 -->|after return| B123
B123 -->|call| B231
B123 -->|after return| B124
B124 -->|call| B244
B124 -->|after return| B125
B125 -->|call| B249
B125 -->|after return| B126
B126 -->|call| B254
B126 -->|after return| B127
B127 -->|call| B231
B127 -->|after return| B128
B128 -->|call| B249
B128 -->|after return| B129
B129 -->|call| B254
B129 -->|after return| B130
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL DELAY
```

### B122

```asm
ACALL DELAY
```

### B123

```asm
ACALL CLEAR
```

### B124

```asm
mov a, #80H
acall cmd
```

### B125

```asm
ACALL CLEAR
```

### B126

```asm
mov dptr, #STR7
acall WSTR
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
mov a, #0C0H
acall cmd
```

### B129

```asm
mov dptr, #STR10
acall WSTR
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 259 to 259"]
B131["B132: instructions - lines 261 to 261"]
B132["B133: instructions - lines 262 to 263"]
B133["B134: instructions - lines 264 to 264"]
B134["B135: instructions - lines 265 to 265"]
B135["B136: instructions - lines 267 to 267"]
B136["B137: instructions - lines 268 to 269"]
B137["B138: instructions - lines 270 to 271"]
B138["B139: instructions - lines 272 to 272"]
B139["B140: instructions - lines 273 to 274"]
B130 -->|call| B254
B130 -->|after return| B131
B131 -->|call| B244
B131 -->|after return| B132
B132 -->|call| B249
B132 -->|after return| B133
B133 -->|call| B254
B133 -->|after return| B134
B134 -->|call| B254
B134 -->|after return| B135
B135 -->|call| B244
B135 -->|after return| B136
B136 -->|call| B231
B136 -->|after return| B137
B137 -->|call| B249
B137 -->|after return| B138
B138 -->|call| B254
B138 -->|after return| B139
B139 -->|call| B231
B139 -->|after return| B140
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B249["Continue at B250 in section 25"]
B231["Continue at B232 in section 24"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL DELAY
```

### B132

```asm
ACALL CLEAR
```

### B133

```asm
mov dptr, #STR11
acall WSTR
```

### B134

```asm
ACALL DELAY
```

### B135

```asm
ACALL DELAY
```

### B136

```asm
ACALL CLEAR
```

### B137

```asm
mov a, #80H
acall cmd
```

### B138

```asm
mov dptr, #STR9
acall WSTR
```

### B139

```asm
ACALL DELAY
```

### B140

```asm
mov a, #0C0H
acall cmd
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 275 to 276"]
B141["B142: instructions - lines 277 to 277"]
B142["B143: instructions - lines 278 to 278"]
B143["B144: instructions - lines 280 to 280"]
B144["B145: instructions - lines 281 to 282"]
B145["B146: instructions - lines 283 to 284"]
B146["B147: instructions - lines 285 to 285"]
B147["B148: instructions - lines 286 to 287"]
B148["B149: instructions - lines 288 to 289"]
B149["B150: instructions - lines 290 to 290"]
B140 -->|call| B249
B140 -->|after return| B141
B141 -->|call| B254
B141 -->|after return| B142
B142 -->|call| B254
B142 -->|after return| B143
B143 -->|call| B244
B143 -->|after return| B144
B144 -->|call| B231
B144 -->|after return| B145
B145 -->|call| B249
B145 -->|after return| B146
B146 -->|call| B254
B146 -->|after return| B147
B147 -->|call| B231
B147 -->|after return| B148
B148 -->|call| B249
B148 -->|after return| B149
B149 -->|call| B254
B149 -->|after return| B150
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov dptr, #STR10
acall WSTR
```

### B142

```asm
ACALL DELAY
```

### B143

```asm
ACALL DELAY
```

### B144

```asm
ACALL CLEAR
```

### B145

```asm
mov a, #80H
acall cmd
```

### B146

```asm
mov dptr, #STR12
acall WSTR
```

### B147

```asm
ACALL DELAY
```

### B148

```asm
mov a, #0C0H
acall cmd
```

### B149

```asm
mov dptr, #STR8
acall WSTR
```

### B150

```asm
ACALL DELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 291 to 291"]
B151["B152: instructions - lines 292 to 292"]
B152["B153: SHOW4 - lines 295 to 295"]
B153["B154: instructions - lines 296 to 297"]
B154["B155: instructions - lines 298 to 299"]
B155["B156: instructions - lines 300 to 300"]
B156["B157: instructions - lines 301 to 301"]
B157["B158: instructions - lines 303 to 303"]
B158["B159: instructions - lines 304 to 305"]
B159["B160: instructions - lines 306 to 306"]
B150 -->|call| B254
B150 -->|after return| B151
B152 -->|call| B244
B152 -->|after return| B153
B153 -->|call| B231
B153 -->|after return| B154
B154 -->|call| B249
B154 -->|after return| B155
B155 -->|call| B254
B155 -->|after return| B156
B156 -->|call| B254
B156 -->|after return| B157
B157 -->|call| B244
B157 -->|after return| B158
B158 -->|call| B231
B158 -->|after return| B159
B159 -->|call| B244
B159 -->|after return| B160
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL DELAY
```

### B152

Return to the instruction following the active call.

```asm
RET
```

### B153

```asm
ACALL CLEAR
```

### B154

```asm
mov a, #80H
acall cmd
```

### B155

```asm
mov dptr, #STR6
acall WSTR
```

### B156

```asm
ACALL DELAY
```

### B157

```asm
ACALL DELAY
```

### B158

```asm
ACALL CLEAR
```

### B159

```asm
mov a, #80H
acall cmd
```

### B160

```asm
ACALL CLEAR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 307 to 308"]
B161["B162: instructions - lines 309 to 309"]
B162["B163: instructions - lines 310 to 311"]
B163["B164: instructions - lines 312 to 313"]
B164["B165: instructions - lines 314 to 314"]
B165["B166: instructions - lines 315 to 315"]
B166["B167: instructions - lines 317 to 317"]
B167["B168: instructions - lines 318 to 319"]
B168["B169: instructions - lines 320 to 320"]
B169["B170: instructions - lines 321 to 321"]
B160 -->|call| B249
B160 -->|after return| B161
B161 -->|call| B254
B161 -->|after return| B162
B162 -->|call| B231
B162 -->|after return| B163
B163 -->|call| B249
B163 -->|after return| B164
B164 -->|call| B254
B164 -->|after return| B165
B165 -->|call| B254
B165 -->|after return| B166
B166 -->|call| B244
B166 -->|after return| B167
B167 -->|call| B249
B167 -->|after return| B168
B168 -->|call| B254
B168 -->|after return| B169
B169 -->|call| B254
B169 -->|after return| B170
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B244["Continue at B245 in section 25"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
mov dptr, #STR7
acall WSTR
```

### B162

```asm
ACALL DELAY
```

### B163

```asm
mov a, #0C0H
acall cmd
```

### B164

```asm
mov dptr, #STR10
acall WSTR
```

### B165

```asm
ACALL DELAY
```

### B166

```asm
ACALL DELAY
```

### B167

```asm
ACALL CLEAR
```

### B168

```asm
mov dptr, #STR11
acall WSTR
```

### B169

```asm
ACALL DELAY
```

### B170

```asm
ACALL DELAY
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 323 to 323"]
B171["B172: instructions - lines 324 to 325"]
B172["B173: instructions - lines 326 to 327"]
B173["B174: instructions - lines 328 to 328"]
B174["B175: instructions - lines 329 to 330"]
B175["B176: instructions - lines 331 to 332"]
B176["B177: instructions - lines 333 to 333"]
B177["B178: instructions - lines 334 to 334"]
B178["B179: instructions - lines 336 to 336"]
B179["B180: instructions - lines 337 to 338"]
B170 -->|call| B244
B170 -->|after return| B171
B171 -->|call| B231
B171 -->|after return| B172
B172 -->|call| B249
B172 -->|after return| B173
B173 -->|call| B254
B173 -->|after return| B174
B174 -->|call| B231
B174 -->|after return| B175
B175 -->|call| B249
B175 -->|after return| B176
B176 -->|call| B254
B176 -->|after return| B177
B177 -->|call| B254
B177 -->|after return| B178
B178 -->|call| B244
B178 -->|after return| B179
B179 -->|call| B231
B179 -->|after return| B180
B244["Continue at B245 in section 25"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL CLEAR
```

### B172

```asm
mov a, #80H
acall cmd
```

### B173

```asm
mov dptr, #STR9
acall WSTR
```

### B174

```asm
ACALL DELAY
```

### B175

```asm
mov a, #0C0H
acall cmd
```

### B176

```asm
mov dptr, #STR10
acall WSTR
```

### B177

```asm
ACALL DELAY
```

### B178

```asm
ACALL DELAY
```

### B179

```asm
ACALL CLEAR
```

### B180

```asm
mov a, #80H
acall cmd
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 339 to 340"]
B181["B182: instructions - lines 341 to 341"]
B182["B183: instructions - lines 342 to 343"]
B183["B184: instructions - lines 344 to 345"]
B184["B185: instructions - lines 346 to 346"]
B185["B186: instructions - lines 347 to 347"]
B186["B187: instructions - lines 349 to 349"]
B187["B188: instructions - lines 350 to 351"]
B188["B189: instructions - lines 352 to 353"]
B189["B190: instructions - lines 354 to 354"]
B180 -->|call| B249
B180 -->|after return| B181
B181 -->|call| B254
B181 -->|after return| B182
B182 -->|call| B231
B182 -->|after return| B183
B183 -->|call| B249
B183 -->|after return| B184
B184 -->|call| B254
B184 -->|after return| B185
B185 -->|call| B254
B185 -->|after return| B186
B186 -->|call| B244
B186 -->|after return| B187
B187 -->|call| B231
B187 -->|after return| B188
B188 -->|call| B249
B188 -->|after return| B189
B189 -->|call| B254
B189 -->|after return| B190
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B244["Continue at B245 in section 25"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
mov dptr, #STR13
acall WSTR
```

### B182

```asm
ACALL DELAY
```

### B183

```asm
mov a, #0C0H
acall cmd
```

### B184

```asm
mov dptr, #STR8
acall WSTR
```

### B185

```asm
ACALL DELAY
```

### B186

```asm
ACALL DELAY
```

### B187

```asm
ACALL CLEAR
```

### B188

```asm
mov a, #80H
acall cmd
```

### B189

```asm
mov dptr, #STR12
acall WSTR
```

### B190

```asm
ACALL DELAY
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 355 to 356"]
B191["B192: instructions - lines 357 to 358"]
B192["B193: instructions - lines 359 to 359"]
B193["B194: instructions - lines 360 to 360"]
B194["B195: instructions - lines 361 to 361"]
B195["B196: instructions - lines 362 to 362"]
B196["B197: RETURN - lines 365 to 365"]
B197["B198: instructions - lines 366 to 367"]
B198["B199: instructions - lines 368 to 368"]
B199["B200: instructions - lines 369 to 370"]
B190 -->|call| B231
B190 -->|after return| B191
B191 -->|call| B249
B191 -->|after return| B192
B192 -->|call| B254
B192 -->|after return| B193
B193 -->|call| B254
B193 -->|after return| B194
B196 -->|call| B244
B196 -->|after return| B197
B197 -->|call| B231
B197 -->|after return| B198
B198 -->|call| B244
B198 -->|after return| B199
B199 -->|call| B249
B199 -->|after return| B200
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B244["Continue at B245 in section 25"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
mov a, #0C0H
acall cmd
```

### B192

```asm
mov dptr, #STR8
acall WSTR
```

### B193

```asm
ACALL DELAY
```

### B194

```asm
ACALL DELAY
```

### B195

Return to the instruction following the active call.

```asm
RET
```

### B196

Return to the instruction following the active call.

```asm
RET
```

### B197

```asm
ACALL CLEAR
```

### B198

```asm
mov a, #80H
acall cmd
```

### B199

```asm
ACALL CLEAR
```

### B200

```asm
mov dptr, #STR14
acall WSTR
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 371 to 371"]
B201["B202: instructions - lines 372 to 373"]
B202["B203: instructions - lines 374 to 375"]
B203["B204: instructions - lines 376 to 376"]
B204["B205: instructions - lines 377 to 377"]
B205["B206: instructions - lines 378 to 378"]
B206["B207: SHOW5 - lines 383 to 383"]
B207["B208: instructions - lines 384 to 385"]
B208["B209: instructions - lines 386 to 386"]
B209["B210: instructions - lines 387 to 388"]
B200 -->|call| B254
B200 -->|after return| B201
B201 -->|call| B231
B201 -->|after return| B202
B202 -->|call| B249
B202 -->|after return| B203
B203 -->|call| B254
B203 -->|after return| B204
B204 -->|call| B254
B204 -->|after return| B205
B206 -->|call| B244
B206 -->|after return| B207
B207 -->|call| B231
B207 -->|after return| B208
B208 -->|call| B244
B208 -->|after return| B209
B209 -->|call| B249
B209 -->|after return| B210
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B244["Continue at B245 in section 25"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL DELAY
```

### B202

```asm
mov a, #0C0H
acall cmd
```

### B203

```asm
mov dptr, #STR15
acall WSTR
```

### B204

```asm
ACALL DELAY
```

### B205

```asm
ACALL DELAY
```

### B206

Return to the instruction following the active call.

```asm
RET
```

### B207

```asm
ACALL CLEAR
```

### B208

```asm
mov a, #80H
acall cmd
```

### B209

```asm
ACALL CLEAR
```

### B210

```asm
mov dptr, #STR16
acall WSTR
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 389 to 389"]
B211["B212: instructions - lines 390 to 391"]
B212["B213: instructions - lines 392 to 393"]
B213["B214: instructions - lines 394 to 394"]
B214["B215: instructions - lines 395 to 395"]
B215["B216: instructions - lines 396 to 396"]
B216["B217: SHOW6 - lines 401 to 401"]
B217["B218: instructions - lines 402 to 403"]
B218["B219: instructions - lines 404 to 404"]
B219["B220: instructions - lines 405 to 406"]
B210 -->|call| B254
B210 -->|after return| B211
B211 -->|call| B231
B211 -->|after return| B212
B212 -->|call| B249
B212 -->|after return| B213
B213 -->|call| B254
B213 -->|after return| B214
B214 -->|call| B254
B214 -->|after return| B215
B216 -->|call| B244
B216 -->|after return| B217
B217 -->|call| B231
B217 -->|after return| B218
B218 -->|call| B244
B218 -->|after return| B219
B219 -->|call| B249
B219 -->|after return| B220
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B244["Continue at B245 in section 25"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
ACALL DELAY
```

### B212

```asm
mov a, #0C0H
acall cmd
```

### B213

```asm
mov dptr, #STR18
acall WSTR
```

### B214

```asm
ACALL DELAY
```

### B215

```asm
ACALL DELAY
```

### B216

Return to the instruction following the active call.

```asm
RET
```

### B217

```asm
ACALL CLEAR
```

### B218

```asm
mov a, #80H
acall cmd
```

### B219

```asm
ACALL CLEAR
```

### B220

```asm
mov dptr, #STR17
acall WSTR
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 407 to 407"]
B221["B222: instructions - lines 408 to 409"]
B222["B223: instructions - lines 410 to 411"]
B223["B224: instructions - lines 412 to 412"]
B224["B225: instructions - lines 413 to 413"]
B225["B226: instructions - lines 414 to 414"]
B226["B227: WCHR - lines 420 to 424"]
B227["B228: instructions - lines 425 to 425"]
B228["B229: instructions - lines 426 to 428"]
B229["B230: instructions - lines 429 to 429"]
B220 -->|call| B254
B220 -->|after return| B221
B221 -->|call| B231
B221 -->|after return| B222
B222 -->|call| B249
B222 -->|after return| B223
B223 -->|call| B254
B223 -->|after return| B224
B224 -->|call| B254
B224 -->|after return| B225
B226 -->|call| B236
B226 -->|after return| B227
B227 -->|call| B242
B227 -->|after return| B228
B228 -->|call| B236
B228 -->|after return| B229
B229 -->|call| B242
B229 -->|after return| B230
B254["Continue at B255 in section 26"]
B231["Continue at B232 in section 24"]
B249["Continue at B250 in section 25"]
B236["Continue at B237 in section 24"]
B242["Continue at B243 in section 25"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
ACALL DELAY
```

### B222

```asm
mov a, #0C0H
acall cmd
```

### B223

```asm
mov dptr, #STR18
acall WSTR
```

### B224

```asm
ACALL DELAY
```

### B225

```asm
ACALL DELAY
```

### B226

Return to the instruction following the active call.

```asm
RET
```

### B227

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B228

```asm
ACALL LDELAY
```

### B229

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B230

```asm
ACALL LDELAY
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 430 to 432"]
B231["B232: CMD - lines 435 to 437"]
B232["B233: instructions - lines 438 to 438"]
B233["B234: instructions - lines 439 to 441"]
B234["B235: instructions - lines 442 to 442"]
B235["B236: instructions - lines 443 to 443"]
B236["B237: COMMON - lines 446 to 451"]
B237["B238: INLCD - lines 454 to 461"]
B238["B239: instructions - lines 462 to 470"]
B239["B240: instructions - lines 471 to 483"]
B231 -->|call| B236
B231 -->|after return| B232
B232 -->|call| B242
B232 -->|after return| B233
B233 -->|call| B236
B233 -->|after return| B234
B234 -->|call| B242
B234 -->|after return| B235
B237 -->|call| B242
B237 -->|after return| B238
B238 -->|call| B242
B238 -->|after return| B239
B239 -->|call| B242
B239 -->|after return| B240
B242["Continue at B243 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B232

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B233

```asm
ACALL LDELAY
```

### B234

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B235

```asm
ACALL LDELAY
```

### B236

Return to the instruction following the active call.

```asm
RET
```

### B237

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B238

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

### B239

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

### B240

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

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 484 to 494"]
B241["B242: instructions - lines 495 to 495"]
B242["B243: LDELAY - lines 498 to 499"]
B243["B244: instructions - lines 500 to 500"]
B244["B245: CLEAR - lines 503 to 504"]
B245["B246: instructions - lines 505 to 505"]
B246["B247: WAIT - lines 506 to 506"]
B247["B248: instructions - lines 507 to 507"]
B248["B249: instructions - lines 508 to 508"]
B249["B250: WSTR - lines 511 to 511"]
B240 -->|call| B242
B240 -->|after return| B241
B242 -->|condition true| B242
B242 -->|condition false| B243
B244 -->|call| B231
B244 -->|after return| B245
B245 -->|next| B246
B246 -->|call| B242
B246 -->|after return| B247
B247 -->|condition true| B246
B247 -->|condition false| B248
B249 -->|next| B250
B231["Continue at B232 in section 24"]
B250["Continue at B251 in section 26"]
```

### B241

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

### B242

Return to the instruction following the active call.

```asm
RET
```

### B243

```asm
MOV R0, #50
DJNZ R0, $
```

### B244

Return to the instruction following the active call.

```asm
RET
```

### B245

```asm
MOV A,#01H
ACALL CMD
```

### B246

```asm
MOV R7,#14
```

### B247

```asm
ACALL LDELAY
```

### B248

```asm
DJNZ R7,WAIT
```

### B249

Return to the instruction following the active call.

```asm
ret
```

### B250

```asm
PUSH    ACC
```

## Section 26

```mermaid
flowchart TD
B250["B251: CONT1 - lines 513 to 515"]
B251["B252: PRINT - lines 517 to 517"]
B252["B253: instructions - lines 518 to 519"]
B253["B254: EXIT1 - lines 520 to 521"]
B254["B255: DELAY - lines 524 to 524"]
B255["B256: AGAIN - lines 525 to 525"]
B256["B257: AGAIN2 - lines 526 to 526"]
B257["B258: instructions - lines 527 to 527"]
B258["B259: instructions - lines 528 to 528"]
B250 -->|condition true| B253
B250 -->|condition false| B251
B251 -->|call| B226
B251 -->|after return| B252
B252 -->|jump| B250
B254 -->|next| B255
B255 -->|next| B256
B256 -->|condition true| B256
B256 -->|condition false| B257
B257 -->|condition true| B255
B257 -->|condition false| B258
B226["Continue at B227 in section 23"]
```

### B251

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B252

```asm
ACALL    WCHR
```

### B253

```asm
INC DPTR
AJMP    CONT1
```

### B254

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B255

```asm
MOV R0,#20
```

### B256

```asm
MOV R1,#90
```

### B257

```asm
DJNZ R1,AGAIN2
```

### B258

```asm
DJNZ R0,AGAIN
```

### B259

Return to the instruction following the active call.

```asm
RET
```
