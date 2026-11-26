# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27) · [Section 28](#section-28)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 9 to 15"]
B1["B2: instructions - lines 17 to 17"]
B2["B3: instructions - lines 19 to 19"]
B3["B4: instructions - lines 20 to 21"]
B4["B5: instructions - lines 22 to 23"]
B5["B6: instructions - lines 24 to 24"]
B6["B7: instructions - lines 25 to 25"]
B7["B8: instructions - lines 26 to 27"]
B8["B9: instructions - lines 28 to 29"]
B9["B10: instructions - lines 30 to 30"]
B0 -->|call| B24
B0 -->|after return| B1
B1 -->|call| B226
B1 -->|after return| B2
B2 -->|call| B266
B2 -->|after return| B3
B3 -->|call| B246
B3 -->|after return| B4
B4 -->|call| B253
B4 -->|after return| B5
B5 -->|call| B262
B5 -->|after return| B6
B6 -->|call| B262
B6 -->|after return| B7
B7 -->|call| B246
B7 -->|after return| B8
B8 -->|call| B253
B8 -->|after return| B9
B9 -->|call| B262
B9 -->|after return| B10
B24["Continue at B25 in section 3"]
B226["Continue at B227 in section 23"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
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
B10["B11: instructions - lines 31 to 31"]
B11["B12: START - lines 34 to 34"]
B12["B13: instructions - lines 35 to 37"]
B13["B14: instructions - lines 38 to 38"]
B14["B15: instructions - lines 39 to 39"]
B15["B16: instructions - lines 40 to 40"]
B16["B17: COVIDCHEACK - lines 43 to 43"]
B17["B18: instructions - lines 44 to 44"]
B18["B19: instructions - lines 45 to 45"]
B19["B20: instructions - lines 46 to 46"]
B10 -->|call| B262
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
B262["Continue at B263 in section 27"]
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
B20["B21: ASK - lines 49 to 49"]
B21["B22: instructions - lines 50 to 51"]
B22["B23: instructions - lines 52 to 52"]
B23["B24: EXIT - lines 54 to 54"]
B24["B25: FLASHING - lines 58 to 58"]
B25["B26: HERE - lines 60 to 61"]
B26["B27: instructions - lines 62 to 62"]
B27["B28: instructions - lines 65 to 65"]
B28["B29: CECKUP - lines 71 to 79"]
B29["B30: NEXT1 - lines 81 to 81"]
B20 -->|call| B196
B20 -->|after return| B21
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B11
B23 -->|jump| B23
B24 -->|next| B25
B25 -->|call| B262
B25 -->|after return| B26
B26 -->|condition true| B25
B26 -->|condition false| B27
B28 -->|condition true| B29
B28 -->|condition false| B29
B29 -->|condition true| B32
B29 -->|condition false| B30
B196["Continue at B197 in section 20"]
B11["Continue at B12 in section 2"]
B262["Continue at B263 in section 27"]
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
B30["B31: instructions - lines 83 to 84"]
B31["B32: instructions - lines 85 to 85"]
B32["B33: LEVEL2 - lines 88 to 88"]
B33["B34: NEXT2 - lines 90 to 90"]
B34["B35: instructions - lines 92 to 93"]
B35["B36: instructions - lines 94 to 94"]
B36["B37: LEVEL3 - lines 97 to 98"]
B37["B38: instructions - lines 99 to 100"]
B38["B39: instructions - lines 101 to 101"]
B39["B40: FEMALE - lines 104 to 105"]
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
B40["B41: instructions - lines 106 to 106"]
B41["B42: EE - lines 109 to 109"]
B42["B43: COVID - lines 112 to 114"]
B43["B44: NEXT - lines 116 to 116"]
B44["B45: instructions - lines 118 to 119"]
B45["B46: instructions - lines 120 to 120"]
B46["B47: OKAY - lines 123 to 124"]
B47["B48: EEE - lines 126 to 126"]
B48["B49: MENU - lines 129 to 129"]
B49["B50: instructions - lines 130 to 131"]
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
B48 -->|call| B266
B48 -->|after return| B49
B49 -->|call| B246
B49 -->|after return| B50
B216["Continue at B217 in section 22"]
B206["Continue at B207 in section 21"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
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
B50["B51: instructions - lines 132 to 133"]
B51["B52: instructions - lines 134 to 134"]
B52["B53: instructions - lines 136 to 137"]
B53["B54: instructions - lines 138 to 139"]
B54["B55: instructions - lines 140 to 140"]
B55["B56: instructions - lines 141 to 141"]
B56["B57: instructions - lines 142 to 142"]
B57["B58: AGE - lines 146 to 146"]
B58["B59: instructions - lines 147 to 148"]
B59["B60: instructions - lines 149 to 150"]
B50 -->|call| B253
B50 -->|after return| B51
B51 -->|call| B262
B51 -->|after return| B52
B52 -->|call| B246
B52 -->|after return| B53
B53 -->|call| B253
B53 -->|after return| B54
B54 -->|call| B262
B54 -->|after return| B55
B55 -->|call| B262
B55 -->|after return| B56
B57 -->|call| B266
B57 -->|after return| B58
B58 -->|call| B246
B58 -->|after return| B59
B59 -->|call| B253
B59 -->|after return| B60
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B266["Continue at B267 in section 27"]
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
B60["B61: instructions - lines 151 to 151"]
B61["B62: instructions - lines 152 to 152"]
B62["B63: instructions - lines 154 to 158"]
B63["B64: instructions - lines 159 to 161"]
B64["B65: instructions - lines 162 to 162"]
B65["B66: instructions - lines 163 to 163"]
B66["B67: instructions - lines 164 to 164"]
B67["B68: SHOW1 - lines 167 to 167"]
B68["B69: instructions - lines 168 to 169"]
B69["B70: instructions - lines 170 to 171"]
B60 -->|call| B262
B60 -->|after return| B61
B61 -->|call| B262
B61 -->|after return| B62
B62 -->|call| B248
B62 -->|after return| B63
B63 -->|call| B248
B63 -->|after return| B64
B64 -->|call| B262
B64 -->|after return| B65
B65 -->|call| B262
B65 -->|after return| B66
B67 -->|call| B266
B67 -->|after return| B68
B68 -->|call| B246
B68 -->|after return| B69
B69 -->|call| B253
B69 -->|after return| B70
B262["Continue at B263 in section 27"]
B248["Continue at B249 in section 25"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
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
B70["B71: instructions - lines 172 to 172"]
B71["B72: instructions - lines 173 to 173"]
B72["B73: instructions - lines 174 to 174"]
B73["B74: instructions - lines 175 to 176"]
B74["B75: instructions - lines 177 to 177"]
B75["B76: instructions - lines 178 to 179"]
B76["B77: instructions - lines 180 to 180"]
B77["B78: instructions - lines 181 to 182"]
B78["B79: instructions - lines 183 to 184"]
B79["B80: instructions - lines 185 to 185"]
B70 -->|call| B262
B70 -->|after return| B71
B71 -->|call| B262
B71 -->|after return| B72
B72 -->|call| B266
B72 -->|after return| B73
B73 -->|call| B246
B73 -->|after return| B74
B74 -->|call| B266
B74 -->|after return| B75
B75 -->|call| B253
B75 -->|after return| B76
B76 -->|call| B262
B76 -->|after return| B77
B77 -->|call| B246
B77 -->|after return| B78
B78 -->|call| B253
B78 -->|after return| B79
B79 -->|call| B262
B79 -->|after return| B80
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
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
B80["B81: instructions - lines 186 to 186"]
B81["B82: instructions - lines 188 to 188"]
B82["B83: instructions - lines 189 to 190"]
B83["B84: instructions - lines 191 to 192"]
B84["B85: instructions - lines 193 to 193"]
B85["B86: instructions - lines 194 to 195"]
B86["B87: instructions - lines 196 to 197"]
B87["B88: instructions - lines 198 to 198"]
B88["B89: instructions - lines 199 to 199"]
B89["B90: instructions - lines 201 to 201"]
B80 -->|call| B262
B80 -->|after return| B81
B81 -->|call| B266
B81 -->|after return| B82
B82 -->|call| B246
B82 -->|after return| B83
B83 -->|call| B253
B83 -->|after return| B84
B84 -->|call| B262
B84 -->|after return| B85
B85 -->|call| B246
B85 -->|after return| B86
B86 -->|call| B253
B86 -->|after return| B87
B87 -->|call| B262
B87 -->|after return| B88
B88 -->|call| B262
B88 -->|after return| B89
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
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
B90["B91: SHOW2 - lines 204 to 204"]
B91["B92: instructions - lines 205 to 206"]
B92["B93: instructions - lines 207 to 208"]
B93["B94: instructions - lines 209 to 209"]
B94["B95: instructions - lines 210 to 210"]
B95["B96: instructions - lines 211 to 211"]
B96["B97: instructions - lines 212 to 213"]
B97["B98: instructions - lines 214 to 214"]
B98["B99: instructions - lines 215 to 216"]
B99["B100: instructions - lines 217 to 217"]
B90 -->|call| B266
B90 -->|after return| B91
B91 -->|call| B246
B91 -->|after return| B92
B92 -->|call| B253
B92 -->|after return| B93
B93 -->|call| B262
B93 -->|after return| B94
B94 -->|call| B262
B94 -->|after return| B95
B95 -->|call| B266
B95 -->|after return| B96
B96 -->|call| B246
B96 -->|after return| B97
B97 -->|call| B266
B97 -->|after return| B98
B98 -->|call| B253
B98 -->|after return| B99
B99 -->|call| B262
B99 -->|after return| B100
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
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
B100["B101: instructions - lines 218 to 219"]
B101["B102: instructions - lines 220 to 221"]
B102["B103: instructions - lines 222 to 222"]
B103["B104: instructions - lines 223 to 223"]
B104["B105: instructions - lines 225 to 225"]
B105["B106: instructions - lines 226 to 227"]
B106["B107: instructions - lines 228 to 228"]
B107["B108: instructions - lines 229 to 229"]
B108["B109: instructions - lines 231 to 231"]
B109["B110: instructions - lines 232 to 233"]
B100 -->|call| B246
B100 -->|after return| B101
B101 -->|call| B253
B101 -->|after return| B102
B102 -->|call| B262
B102 -->|after return| B103
B103 -->|call| B262
B103 -->|after return| B104
B104 -->|call| B266
B104 -->|after return| B105
B105 -->|call| B253
B105 -->|after return| B106
B106 -->|call| B262
B106 -->|after return| B107
B107 -->|call| B262
B107 -->|after return| B108
B108 -->|call| B266
B108 -->|after return| B109
B109 -->|call| B246
B109 -->|after return| B110
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
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
B110["B111: instructions - lines 234 to 235"]
B111["B112: instructions - lines 236 to 236"]
B112["B113: instructions - lines 237 to 238"]
B113["B114: instructions - lines 239 to 240"]
B114["B115: instructions - lines 241 to 241"]
B115["B116: instructions - lines 242 to 242"]
B116["B117: instructions - lines 243 to 243"]
B117["B118: SHOW3 - lines 246 to 246"]
B118["B119: instructions - lines 247 to 248"]
B119["B120: instructions - lines 249 to 250"]
B110 -->|call| B253
B110 -->|after return| B111
B111 -->|call| B262
B111 -->|after return| B112
B112 -->|call| B246
B112 -->|after return| B113
B113 -->|call| B253
B113 -->|after return| B114
B114 -->|call| B262
B114 -->|after return| B115
B115 -->|call| B262
B115 -->|after return| B116
B117 -->|call| B266
B117 -->|after return| B118
B118 -->|call| B246
B118 -->|after return| B119
B119 -->|call| B253
B119 -->|after return| B120
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B266["Continue at B267 in section 27"]
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
B120["B121: instructions - lines 251 to 251"]
B121["B122: instructions - lines 252 to 252"]
B122["B123: instructions - lines 254 to 254"]
B123["B124: instructions - lines 255 to 256"]
B124["B125: instructions - lines 257 to 257"]
B125["B126: instructions - lines 258 to 259"]
B126["B127: instructions - lines 260 to 260"]
B127["B128: instructions - lines 261 to 262"]
B128["B129: instructions - lines 263 to 264"]
B129["B130: instructions - lines 265 to 265"]
B120 -->|call| B262
B120 -->|after return| B121
B121 -->|call| B262
B121 -->|after return| B122
B122 -->|call| B266
B122 -->|after return| B123
B123 -->|call| B246
B123 -->|after return| B124
B124 -->|call| B266
B124 -->|after return| B125
B125 -->|call| B253
B125 -->|after return| B126
B126 -->|call| B262
B126 -->|after return| B127
B127 -->|call| B246
B127 -->|after return| B128
B128 -->|call| B253
B128 -->|after return| B129
B129 -->|call| B262
B129 -->|after return| B130
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
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
B130["B131: instructions - lines 266 to 266"]
B131["B132: instructions - lines 268 to 268"]
B132["B133: instructions - lines 269 to 270"]
B133["B134: instructions - lines 271 to 271"]
B134["B135: instructions - lines 272 to 272"]
B135["B136: instructions - lines 274 to 274"]
B136["B137: instructions - lines 275 to 276"]
B137["B138: instructions - lines 277 to 278"]
B138["B139: instructions - lines 279 to 279"]
B139["B140: instructions - lines 280 to 281"]
B130 -->|call| B262
B130 -->|after return| B131
B131 -->|call| B266
B131 -->|after return| B132
B132 -->|call| B253
B132 -->|after return| B133
B133 -->|call| B262
B133 -->|after return| B134
B134 -->|call| B262
B134 -->|after return| B135
B135 -->|call| B266
B135 -->|after return| B136
B136 -->|call| B246
B136 -->|after return| B137
B137 -->|call| B253
B137 -->|after return| B138
B138 -->|call| B262
B138 -->|after return| B139
B139 -->|call| B246
B139 -->|after return| B140
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
B253["Continue at B254 in section 26"]
B246["Continue at B247 in section 25"]
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
B140["B141: instructions - lines 282 to 283"]
B141["B142: instructions - lines 284 to 284"]
B142["B143: instructions - lines 285 to 285"]
B143["B144: instructions - lines 287 to 287"]
B144["B145: instructions - lines 288 to 289"]
B145["B146: instructions - lines 290 to 291"]
B146["B147: instructions - lines 292 to 292"]
B147["B148: instructions - lines 293 to 294"]
B148["B149: instructions - lines 295 to 296"]
B149["B150: instructions - lines 297 to 297"]
B140 -->|call| B253
B140 -->|after return| B141
B141 -->|call| B262
B141 -->|after return| B142
B142 -->|call| B262
B142 -->|after return| B143
B143 -->|call| B266
B143 -->|after return| B144
B144 -->|call| B246
B144 -->|after return| B145
B145 -->|call| B253
B145 -->|after return| B146
B146 -->|call| B262
B146 -->|after return| B147
B147 -->|call| B246
B147 -->|after return| B148
B148 -->|call| B253
B148 -->|after return| B149
B149 -->|call| B262
B149 -->|after return| B150
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
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
B150["B151: instructions - lines 298 to 298"]
B151["B152: instructions - lines 299 to 299"]
B152["B153: SHOW4 - lines 302 to 302"]
B153["B154: instructions - lines 303 to 304"]
B154["B155: instructions - lines 305 to 306"]
B155["B156: instructions - lines 307 to 307"]
B156["B157: instructions - lines 308 to 308"]
B157["B158: instructions - lines 310 to 310"]
B158["B159: instructions - lines 311 to 312"]
B159["B160: instructions - lines 313 to 313"]
B150 -->|call| B262
B150 -->|after return| B151
B152 -->|call| B266
B152 -->|after return| B153
B153 -->|call| B246
B153 -->|after return| B154
B154 -->|call| B253
B154 -->|after return| B155
B155 -->|call| B262
B155 -->|after return| B156
B156 -->|call| B262
B156 -->|after return| B157
B157 -->|call| B266
B157 -->|after return| B158
B158 -->|call| B246
B158 -->|after return| B159
B159 -->|call| B266
B159 -->|after return| B160
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
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
B160["B161: instructions - lines 314 to 315"]
B161["B162: instructions - lines 316 to 316"]
B162["B163: instructions - lines 317 to 318"]
B163["B164: instructions - lines 319 to 320"]
B164["B165: instructions - lines 321 to 321"]
B165["B166: instructions - lines 322 to 322"]
B166["B167: instructions - lines 324 to 324"]
B167["B168: instructions - lines 325 to 326"]
B168["B169: instructions - lines 327 to 327"]
B169["B170: instructions - lines 328 to 328"]
B160 -->|call| B253
B160 -->|after return| B161
B161 -->|call| B262
B161 -->|after return| B162
B162 -->|call| B246
B162 -->|after return| B163
B163 -->|call| B253
B163 -->|after return| B164
B164 -->|call| B262
B164 -->|after return| B165
B165 -->|call| B262
B165 -->|after return| B166
B166 -->|call| B266
B166 -->|after return| B167
B167 -->|call| B253
B167 -->|after return| B168
B168 -->|call| B262
B168 -->|after return| B169
B169 -->|call| B262
B169 -->|after return| B170
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B266["Continue at B267 in section 27"]
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
B170["B171: instructions - lines 330 to 330"]
B171["B172: instructions - lines 331 to 332"]
B172["B173: instructions - lines 333 to 334"]
B173["B174: instructions - lines 335 to 335"]
B174["B175: instructions - lines 336 to 337"]
B175["B176: instructions - lines 338 to 339"]
B176["B177: instructions - lines 340 to 340"]
B177["B178: instructions - lines 341 to 341"]
B178["B179: instructions - lines 343 to 343"]
B179["B180: instructions - lines 344 to 345"]
B170 -->|call| B266
B170 -->|after return| B171
B171 -->|call| B246
B171 -->|after return| B172
B172 -->|call| B253
B172 -->|after return| B173
B173 -->|call| B262
B173 -->|after return| B174
B174 -->|call| B246
B174 -->|after return| B175
B175 -->|call| B253
B175 -->|after return| B176
B176 -->|call| B262
B176 -->|after return| B177
B177 -->|call| B262
B177 -->|after return| B178
B178 -->|call| B266
B178 -->|after return| B179
B179 -->|call| B246
B179 -->|after return| B180
B266["Continue at B267 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
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
B180["B181: instructions - lines 346 to 347"]
B181["B182: instructions - lines 348 to 348"]
B182["B183: instructions - lines 349 to 350"]
B183["B184: instructions - lines 351 to 352"]
B184["B185: instructions - lines 353 to 353"]
B185["B186: instructions - lines 354 to 354"]
B186["B187: instructions - lines 356 to 356"]
B187["B188: instructions - lines 357 to 358"]
B188["B189: instructions - lines 359 to 360"]
B189["B190: instructions - lines 361 to 361"]
B180 -->|call| B253
B180 -->|after return| B181
B181 -->|call| B262
B181 -->|after return| B182
B182 -->|call| B246
B182 -->|after return| B183
B183 -->|call| B253
B183 -->|after return| B184
B184 -->|call| B262
B184 -->|after return| B185
B185 -->|call| B262
B185 -->|after return| B186
B186 -->|call| B266
B186 -->|after return| B187
B187 -->|call| B246
B187 -->|after return| B188
B188 -->|call| B253
B188 -->|after return| B189
B189 -->|call| B262
B189 -->|after return| B190
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B266["Continue at B267 in section 27"]
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
B190["B191: instructions - lines 362 to 363"]
B191["B192: instructions - lines 364 to 365"]
B192["B193: instructions - lines 366 to 366"]
B193["B194: instructions - lines 367 to 367"]
B194["B195: instructions - lines 368 to 368"]
B195["B196: instructions - lines 369 to 369"]
B196["B197: RETURN - lines 372 to 372"]
B197["B198: instructions - lines 373 to 374"]
B198["B199: instructions - lines 375 to 375"]
B199["B200: instructions - lines 376 to 377"]
B190 -->|call| B246
B190 -->|after return| B191
B191 -->|call| B253
B191 -->|after return| B192
B192 -->|call| B262
B192 -->|after return| B193
B193 -->|call| B262
B193 -->|after return| B194
B196 -->|call| B266
B196 -->|after return| B197
B197 -->|call| B246
B197 -->|after return| B198
B198 -->|call| B266
B198 -->|after return| B199
B199 -->|call| B253
B199 -->|after return| B200
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B262["Continue at B263 in section 27"]
B266["Continue at B267 in section 27"]
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
B200["B201: instructions - lines 378 to 378"]
B201["B202: instructions - lines 379 to 380"]
B202["B203: instructions - lines 381 to 382"]
B203["B204: instructions - lines 383 to 383"]
B204["B205: instructions - lines 384 to 384"]
B205["B206: instructions - lines 385 to 385"]
B206["B207: SHOW5 - lines 390 to 390"]
B207["B208: instructions - lines 391 to 392"]
B208["B209: instructions - lines 393 to 393"]
B209["B210: instructions - lines 394 to 395"]
B200 -->|call| B262
B200 -->|after return| B201
B201 -->|call| B246
B201 -->|after return| B202
B202 -->|call| B253
B202 -->|after return| B203
B203 -->|call| B262
B203 -->|after return| B204
B204 -->|call| B262
B204 -->|after return| B205
B206 -->|call| B266
B206 -->|after return| B207
B207 -->|call| B246
B207 -->|after return| B208
B208 -->|call| B266
B208 -->|after return| B209
B209 -->|call| B253
B209 -->|after return| B210
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B266["Continue at B267 in section 27"]
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
B210["B211: instructions - lines 396 to 396"]
B211["B212: instructions - lines 397 to 398"]
B212["B213: instructions - lines 399 to 400"]
B213["B214: instructions - lines 401 to 401"]
B214["B215: instructions - lines 402 to 402"]
B215["B216: instructions - lines 403 to 403"]
B216["B217: SHOW6 - lines 408 to 408"]
B217["B218: instructions - lines 409 to 410"]
B218["B219: instructions - lines 411 to 411"]
B219["B220: instructions - lines 412 to 413"]
B210 -->|call| B262
B210 -->|after return| B211
B211 -->|call| B246
B211 -->|after return| B212
B212 -->|call| B253
B212 -->|after return| B213
B213 -->|call| B262
B213 -->|after return| B214
B214 -->|call| B262
B214 -->|after return| B215
B216 -->|call| B266
B216 -->|after return| B217
B217 -->|call| B246
B217 -->|after return| B218
B218 -->|call| B266
B218 -->|after return| B219
B219 -->|call| B253
B219 -->|after return| B220
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B266["Continue at B267 in section 27"]
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
B220["B221: instructions - lines 414 to 414"]
B221["B222: instructions - lines 415 to 416"]
B222["B223: instructions - lines 417 to 418"]
B223["B224: instructions - lines 419 to 419"]
B224["B225: instructions - lines 420 to 420"]
B225["B226: instructions - lines 421 to 421"]
B226["B227: INLCD - lines 425 to 426"]
B227["B228: WAIT - lines 428 to 428"]
B228["B229: instructions - lines 429 to 429"]
B229["B230: instructions - lines 430 to 432"]
B220 -->|call| B262
B220 -->|after return| B221
B221 -->|call| B246
B221 -->|after return| B222
B222 -->|call| B253
B222 -->|after return| B223
B223 -->|call| B262
B223 -->|after return| B224
B224 -->|call| B262
B224 -->|after return| B225
B226 -->|next| B227
B227 -->|call| B258
B227 -->|after return| B228
B228 -->|condition true| B227
B228 -->|condition false| B229
B229 -->|call| B246
B229 -->|after return| B230
B262["Continue at B263 in section 27"]
B246["Continue at B247 in section 25"]
B253["Continue at B254 in section 26"]
B258["Continue at B259 in section 26"]
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
PUSH 7
MOV R7,#20
```

### B228

```asm
ACALL LDELAY
```

### B229

```asm
DJNZ R7,WAIT
```

### B230

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 433 to 433"]
B231["B232: instructions - lines 434 to 435"]
B232["B233: instructions - lines 436 to 437"]
B233["B234: instructions - lines 438 to 439"]
B234["B235: instructions - lines 440 to 441"]
B235["B236: instructions - lines 442 to 443"]
B236["B237: instructions - lines 444 to 445"]
B237["B238: instructions - lines 446 to 447"]
B238["B239: instructions - lines 448 to 449"]
B239["B240: instructions - lines 450 to 451"]
B230 -->|call| B258
B230 -->|after return| B231
B231 -->|call| B246
B231 -->|after return| B232
B232 -->|call| B246
B232 -->|after return| B233
B233 -->|call| B246
B233 -->|after return| B234
B234 -->|call| B246
B234 -->|after return| B235
B235 -->|call| B246
B235 -->|after return| B236
B236 -->|call| B246
B236 -->|after return| B237
B237 -->|call| B246
B237 -->|after return| B238
B238 -->|call| B246
B238 -->|after return| B239
B239 -->|call| B246
B239 -->|after return| B240
B258["Continue at B259 in section 26"]
B246["Continue at B247 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
ACALL LDELAY
```

### B232

```asm
MOV A,#0011B
ACALL CMD
```

### B233

```asm
MOV A,#0011B
ACALL CMD
```

### B234

```asm
MOV A,#0010B
ACALL CMD
```

### B235

```asm
MOV A,#0010B
ACALL CMD
```

### B236

```asm
MOV A,#1000B
ACALL CMD
```

### B237

```asm
MOV A,#0000B
ACALL CMD
```

### B238

```asm
MOV A,#1000B
ACALL CMD
```

### B239

```asm
MOV A,#0
ACALL CMD
```

### B240

```asm
MOV A,#0001B
ACALL CMD
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 452 to 452"]
B241["B242: instructions - lines 453 to 454"]
B242["B243: instructions - lines 455 to 456"]
B243["B244: instructions - lines 457 to 458"]
B244["B245: instructions - lines 459 to 460"]
B245["B246: instructions - lines 461 to 462"]
B246["B247: CMD - lines 466 to 467"]
B247["B248: instructions - lines 468 to 468"]
B248["B249: WCHR - lines 471 to 476"]
B249["B250: instructions - lines 477 to 478"]
B240 -->|call| B258
B240 -->|after return| B241
B241 -->|call| B246
B241 -->|after return| B242
B242 -->|call| B246
B242 -->|after return| B243
B243 -->|call| B246
B243 -->|after return| B244
B244 -->|call| B246
B244 -->|after return| B245
B246 -->|call| B251
B246 -->|after return| B247
B248 -->|call| B251
B248 -->|after return| B249
B249 -->|call| B251
B249 -->|after return| B250
B258["Continue at B259 in section 26"]
B251["Continue at B252 in section 26"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
ACALL LDELAY
```

### B242

```asm
MOV A,#0000B
ACALL CMD
```

### B243

```asm
MOV A,#0110B
ACALL CMD
```

### B244

```asm
MOV A,#0000B
ACALL CMD
```

### B245

```asm
MOV A,#1111B
ACALL CMD
```

### B246

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B247

```asm
CLR RS
ACALL COMMON
```

### B248

Return to the instruction following the active call.

```asm
RET
```

### B249

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B250

```asm
MOV A,B
ACALL COMMON
```

## Section 26

```mermaid
flowchart TD
B250["B251: instructions - lines 479 to 481"]
B251["B252: COMMON - lines 484 to 491"]
B252["B253: instructions - lines 492 to 492"]
B253["B254: WSTR - lines 495 to 495"]
B254["B255: CONT1 - lines 497 to 499"]
B255["B256: instructions - lines 500 to 500"]
B256["B257: instructions - lines 501 to 502"]
B257["B258: EXIT1 - lines 504 to 505"]
B258["B259: LDELAY - lines 508 to 510"]
B259["B260: CON4 - lines 512 to 513"]
B251 -->|call| B258
B251 -->|after return| B252
B253 -->|next| B254
B254 -->|condition true| B257
B254 -->|condition false| B255
B255 -->|call| B248
B255 -->|after return| B256
B256 -->|jump| B254
B258 -->|next| B259
B259 -->|condition true| B259
B259 -->|condition false| B260
B248["Continue at B249 in section 25"]
B260["Continue at B261 in section 27"]
```

### B251

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B252

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

### B253

Return to the instruction following the active call.

```asm
RET
```

### B254

```asm
PUSH ACC
```

### B255

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B256

```asm
ACALL WCHR
```

### B257

```asm
INC DPTR
AJMP CONT1
```

### B258

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B259

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B260

```asm
MOV R0,#250
DJNZ R0,$
```

## Section 27

```mermaid
flowchart TD
B260["B261: instructions - lines 514 to 514"]
B261["B262: instructions - lines 515 to 517"]
B262["B263: DELAY - lines 521 to 521"]
B263["B264: HH - lines 523 to 523"]
B264["B265: instructions - lines 524 to 524"]
B265["B266: instructions - lines 525 to 525"]
B266["B267: CLEAR - lines 528 to 529"]
B267["B268: instructions - lines 530 to 530"]
B268["B269: WAITT - lines 531 to 531"]
B269["B270: instructions - lines 532 to 532"]
B260 -->|condition true| B259
B260 -->|condition false| B261
B262 -->|next| B263
B263 -->|call| B258
B263 -->|after return| B264
B264 -->|condition true| B263
B264 -->|condition false| B265
B266 -->|call| B246
B266 -->|after return| B267
B267 -->|next| B268
B268 -->|call| B258
B268 -->|after return| B269
B269 -->|condition true| B268
B269 -->|condition false| B270
B259["Continue at B260 in section 26"]
B258["Continue at B259 in section 26"]
B246["Continue at B247 in section 25"]
B270["Continue at B271 in section 28"]
```

### B261

```asm
DJNZ R1,CON4
```

### B262

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B263

```asm
MOV R5,#20
```

### B264

```asm
ACALL LDELAY
```

### B265

```asm
DJNZ R5,HH
```

### B266

Return to the instruction following the active call.

```asm
RET
```

### B267

```asm
MOV A,#01H
ACALL CMD
```

### B268

```asm
MOV R7,#14
```

### B269

```asm
ACALL LDELAY
```

### B270

```asm
DJNZ R7,WAITT
```

## Section 28

```mermaid
flowchart TD
B270["B271: instructions - lines 533 to 533"]
```

### B271

Return to the instruction following the active call.

```asm
ret
```
