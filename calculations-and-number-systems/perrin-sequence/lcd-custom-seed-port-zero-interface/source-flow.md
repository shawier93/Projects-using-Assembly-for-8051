# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Destinations requiring review

`HH`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 10 to 10"]
B1["B2: instructions - lines 12 to 18"]
B2["B3: START - lines 22 to 22"]
B3["B4: instructions - lines 23 to 24"]
B4["B5: instructions - lines 25 to 25"]
B5["B6: instructions - lines 26 to 26"]
B6["B7: instructions - lines 27 to 28"]
B7["B8: instructions - lines 29 to 29"]
B8["B9: instructions - lines 30 to 30"]
B9["B10: OPTION2 - lines 33 to 33"]
B0 -->|call| B123
B0 -->|after return| B1
B1 -->|call| B25
B1 -->|after return| B2
B2 -->|call| B51
B2 -->|after return| B3
B3 -->|condition true| B9
B3 -->|condition false| B4
B4 -->|call| B57
B4 -->|after return| B5
B5 -->|call| B75
B5 -->|after return| B6
B6 -->|call| B20
B6 -->|after return| B7
B7 -->|call| B95
B7 -->|after return| B8
B8 -->|jump| B2
B9 -->|condition true| B15
B9 -->|condition false| B10
B123["Continue at B124 in section 13"]
B25["Continue at B26 in section 3"]
B51["Continue at B52 in section 6"]
B57["Continue at B58 in section 6"]
B75["Continue at B76 in section 8"]
B20["Continue at B21 in section 3"]
B95["Continue at B96 in section 10"]
B15["Continue at B16 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 70H,#1
MOV R1,#23H
MOV 20H,#4
MOV 21H,#2
MOV 22H,#3
MOV 30H,#6
ACALL WELCOME
```

### B3

```asm
ACALL SELECTT
```

### B4

```asm
MOV A,70H
CJNE A,#1,OPTION2
```

### B5

```asm
ACALL OPTIONN1
```

### B6

```asm
ACALL ENTER3NUMBER
```

### B7

```asm
MOV A,#6
ACALL PERRINSEQ
```

### B8

```asm
ACALL PRINT1
```

### B9

```asm
SJMP START
```

### B10

```asm
CJNE A,#2,OPTION3
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 34 to 34"]
B11["B12: instructions - lines 35 to 35"]
B12["B13: instructions - lines 36 to 36"]
B13["B14: instructions - lines 37 to 37"]
B14["B15: instructions - lines 38 to 38"]
B15["B16: OPTION3 - lines 41 to 41"]
B16["B17: instructions - lines 42 to 42"]
B17["B18: WRONG - lines 45 to 45"]
B18["B19: instructions - lines 46 to 46"]
B19["B20: EXIT - lines 49 to 49"]
B10 -->|call| B63
B10 -->|after return| B11
B11 -->|call| B75
B11 -->|after return| B12
B12 -->|call| B23
B12 -->|after return| B13
B13 -->|call| B114
B13 -->|after return| B14
B14 -->|jump| B2
B15 -->|condition true| B17
B15 -->|condition false| B16
B16 -->|jump| B19
B17 -->|call| B69
B17 -->|after return| B18
B18 -->|jump| B2
B19 -->|jump| B19
B63["Continue at B64 in section 7"]
B75["Continue at B76 in section 8"]
B23["Continue at B24 in section 3"]
B114["Continue at B115 in section 12"]
B2["Continue at B3 in section 1"]
B69["Continue at B70 in section 7"]
```

### B11

```asm
ACALL OPTIONN2
```

### B12

```asm
ACALL ENTER3NUMBER
```

### B13

```asm
ACALL NthNumber
```

### B14

```asm
ACALL PRINT2
```

### B15

```asm
SJMP START
```

### B16

```asm
CJNE A,#2,WRONG
```

### B17

```asm
SJMP EXIT
```

### B18

```asm
ACALL WRONGG
```

### B19

```asm
SJMP START
```

### B20

```asm
SJMP $
```

## Section 3

```mermaid
flowchart TD
B20["B21: PERRINSEQ - lines 53 to 54"]
B21["B22: ST - lines 56 to 69"]
B22["B23: instructions - lines 70 to 70"]
B23["B24: NTHNUMBER - lines 73 to 75"]
B24["B25: instructions - lines 76 to 77"]
B25["B26: WELCOME - lines 82 to 82"]
B26["B27: instructions - lines 83 to 83"]
B27["B28: instructions - lines 84 to 85"]
B28["B29: instructions - lines 86 to 87"]
B29["B30: instructions - lines 88 to 88"]
B20 -->|next| B21
B21 -->|condition true| B21
B21 -->|condition false| B22
B23 -->|call| B20
B23 -->|after return| B24
B25 -->|call| B169
B25 -->|after return| B26
B26 -->|call| B162
B26 -->|after return| B27
B27 -->|call| B143
B27 -->|after return| B28
B28 -->|call| B143
B28 -->|after return| B29
B29 -->|call| B155
B29 -->|after return| B30
B169["Continue at B170 in section 17"]
B162["Continue at B163 in section 17"]
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV R7,A
MOV R0,#22H
```

### B22

```asm
INC R0
MOV A,R0
DEC R0
DEC R0
MOV A,@R0
DEC R0
ADD A,@R0
MOV R3,A
MOV A,R0
ADD A,#3
MOV R0,A
MOV A,R3
MOV @R0,A
DJNZ R7,ST
```

### B23

Return to the instruction following the active call.

```asm
RET
```

### B24

```asm
MOV A,30H
SUBB A,#3
ACALL PERRINSEQ
```

### B25

Return to the instruction following the active call.

```asm
MOV 31H,R3
RET
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
ACALL CLEAR
```

### B28

```asm
MOV A, #8H
ACALL CMD
```

### B29

```asm
MOV A, #0H
ACALL CMD
```

### B30

```asm
ACALL LDELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 89 to 90"]
B31["B32: instructions - lines 91 to 91"]
B32["B33: instructions - lines 92 to 93"]
B33["B34: instructions - lines 94 to 95"]
B34["B35: instructions - lines 96 to 96"]
B35["B36: instructions - lines 97 to 98"]
B36["B37: instructions - lines 99 to 99"]
B37["B38: instructions - lines 100 to 100"]
B38["B39: MMENU - lines 103 to 103"]
B39["B40: instructions - lines 104 to 104"]
B30 -->|call| B150
B30 -->|after return| B31
B31 -->|call| B169
B31 -->|after return| B32
B32 -->|call| B143
B32 -->|after return| B33
B33 -->|call| B143
B33 -->|after return| B34
B34 -->|call| B155
B34 -->|after return| B35
B35 -->|call| B150
B35 -->|after return| B36
B36 -->|call| B169
B36 -->|after return| B37
B38 -->|call| B169
B38 -->|after return| B39
B39 -->|call| B162
B39 -->|after return| B40
B150["Continue at B151 in section 16"]
B169["Continue at B170 in section 17"]
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B162["Continue at B163 in section 17"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
mov dptr, #NAME1
acall wstr
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
MOV A, #1100B
ACALL CMD
```

### B34

```asm
MOV A, #0H
ACALL CMD
```

### B35

```asm
ACALL LDELAY
```

### B36

```asm
mov dptr, #NAME2
acall wstr
```

### B37

```asm
acall delay
```

### B38

Return to the instruction following the active call.

```asm
ret
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 105 to 106"]
B41["B42: instructions - lines 107 to 108"]
B42["B43: instructions - lines 109 to 109"]
B43["B44: instructions - lines 110 to 111"]
B44["B45: instructions - lines 112 to 112"]
B45["B46: instructions - lines 114 to 115"]
B46["B47: instructions - lines 116 to 117"]
B47["B48: instructions - lines 118 to 118"]
B48["B49: instructions - lines 119 to 120"]
B49["B50: instructions - lines 121 to 121"]
B40 -->|call| B143
B40 -->|after return| B41
B41 -->|call| B143
B41 -->|after return| B42
B42 -->|call| B155
B42 -->|after return| B43
B43 -->|call| B150
B43 -->|after return| B44
B44 -->|call| B169
B44 -->|after return| B45
B45 -->|call| B143
B45 -->|after return| B46
B46 -->|call| B143
B46 -->|after return| B47
B47 -->|call| B155
B47 -->|after return| B48
B48 -->|call| B150
B48 -->|after return| B49
B49 -->|call| B169
B49 -->|after return| B50
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B150["Continue at B151 in section 16"]
B169["Continue at B170 in section 17"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A, #8H
ACALL CMD
```

### B42

```asm
MOV A, #0H
ACALL CMD
```

### B43

```asm
ACALL LDELAY
```

### B44

```asm
mov dptr, #OP1
acall wstr
```

### B45

```asm
ACALL DELAY
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
ACALL LDELAY
```

### B49

```asm
mov dptr, #OP2
acall wstr
```

### B50

```asm
acall delay
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 122 to 122"]
B51["B52: SELECTT - lines 125 to 126"]
B52["B53: instructions - lines 127 to 128"]
B53["B54: instructions - lines 129 to 129"]
B54["B55: instructions - lines 130 to 131"]
B55["B56: instructions - lines 132 to 134"]
B56["B57: instructions - lines 136 to 136"]
B57["B58: OPTIONN1 - lines 139 to 140"]
B58["B59: instructions - lines 141 to 142"]
B59["B60: instructions - lines 143 to 143"]
B51 -->|call| B143
B51 -->|after return| B52
B52 -->|call| B143
B52 -->|after return| B53
B53 -->|call| B155
B53 -->|after return| B54
B54 -->|call| B150
B54 -->|after return| B55
B55 -->|call| B145
B55 -->|after return| B56
B57 -->|call| B143
B57 -->|after return| B58
B58 -->|call| B143
B58 -->|after return| B59
B59 -->|call| B155
B59 -->|after return| B60
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
ret
```

### B52

```asm
MOV A, #8H
ACALL CMD
```

### B53

```asm
MOV A, #0H
ACALL CMD
```

### B54

```asm
ACALL LDELAY
```

### B55

```asm
mov dptr, #MSG
acall wstr
```

### B56

```asm
MOV A,70H
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
ACALL LDELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 144 to 145"]
B61["B62: instructions - lines 146 to 146"]
B62["B63: instructions - lines 147 to 147"]
B63["B64: OPTIONN2 - lines 150 to 151"]
B64["B65: instructions - lines 152 to 153"]
B65["B66: instructions - lines 154 to 154"]
B66["B67: instructions - lines 155 to 156"]
B67["B68: instructions - lines 157 to 157"]
B68["B69: instructions - lines 158 to 158"]
B69["B70: WRONGG - lines 161 to 162"]
B60 -->|call| B150
B60 -->|after return| B61
B61 -->|call| B169
B61 -->|after return| B62
B63 -->|call| B143
B63 -->|after return| B64
B64 -->|call| B143
B64 -->|after return| B65
B65 -->|call| B155
B65 -->|after return| B66
B66 -->|call| B150
B66 -->|after return| B67
B67 -->|call| B169
B67 -->|after return| B68
B69 -->|call| B143
B69 -->|after return| B70
B150["Continue at B151 in section 16"]
B169["Continue at B170 in section 17"]
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov dptr, #MSG1
acall wstr
```

### B62

```asm
acall delay
```

### B63

Return to the instruction following the active call.

```asm
ret
```

### B64

```asm
MOV A, #1100B
ACALL CMD
```

### B65

```asm
MOV A, #0H
ACALL CMD
```

### B66

```asm
ACALL LDELAY
```

### B67

```asm
mov dptr, #MSG2
acall wstr
```

### B68

```asm
acall delay
```

### B69

Return to the instruction following the active call.

```asm
ret
```

### B70

```asm
MOV A, #1100B
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 163 to 164"]
B71["B72: instructions - lines 165 to 165"]
B72["B73: instructions - lines 166 to 167"]
B73["B74: instructions - lines 168 to 168"]
B74["B75: instructions - lines 169 to 169"]
B75["B76: ENTER3NUMBER - lines 172 to 172"]
B76["B77: instructions - lines 173 to 173"]
B77["B78: instructions - lines 174 to 175"]
B78["B79: instructions - lines 176 to 177"]
B79["B80: instructions - lines 178 to 178"]
B70 -->|call| B143
B70 -->|after return| B71
B71 -->|call| B155
B71 -->|after return| B72
B72 -->|call| B150
B72 -->|after return| B73
B73 -->|call| B169
B73 -->|after return| B74
B75 -->|call| B169
B75 -->|after return| B76
B76 -->|call| B162
B76 -->|after return| B77
B77 -->|call| B143
B77 -->|after return| B78
B78 -->|call| B143
B78 -->|after return| B79
B79 -->|call| B155
B79 -->|after return| B80
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B150["Continue at B151 in section 16"]
B169["Continue at B170 in section 17"]
B162["Continue at B163 in section 17"]
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
mov dptr, #WRONGGG
acall wstr
```

### B74

```asm
acall delay
```

### B75

Return to the instruction following the active call.

```asm
ret
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
B80["B81: instructions - lines 180 to 181"]
B81["B82: instructions - lines 182 to 184"]
B82["B83: instructions - lines 185 to 186"]
B83["B84: instructions - lines 187 to 189"]
B84["B85: instructions - lines 190 to 191"]
B85["B86: instructions - lines 192 to 194"]
B86["B87: instructions - lines 195 to 196"]
B87["B88: instructions - lines 197 to 197"]
B88["B89: instructions - lines 198 to 198"]
B89["B90: N_NUMBER - lines 201 to 202"]
B80 -->|call| B150
B80 -->|after return| B81
B81 -->|call| B145
B81 -->|after return| B82
B82 -->|call| B145
B82 -->|after return| B83
B83 -->|call| B145
B83 -->|after return| B84
B84 -->|call| B145
B84 -->|after return| B85
B85 -->|call| B145
B85 -->|after return| B86
B86 -->|call| B145
B86 -->|after return| B87
B87 -->|call| B169
B87 -->|after return| B88
B89 -->|call| B143
B89 -->|after return| B90
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B169["Continue at B170 in section 17"]
B143["Continue at B144 in section 15"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov dptr, #ENTER
acall wstr
```

### B82

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
```

### B83

```asm
MOV A,#'-'
ACALL WCHR
```

### B84

```asm
MOV A,21H
ADD A,#30H
ACALL WCHR
```

### B85

```asm
MOV A,#'-'
ACALL WCHR
```

### B86

```asm
MOV A,22H
ADD A,#30H
ACALL WCHR
```

### B87

```asm
MOV A,#'-'
ACALL WCHR
```

### B88

```asm
ACALL DELAY
```

### B89

Return to the instruction following the active call.

```asm
RET
```

### B90

```asm
MOV A, #1100B
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 203 to 204"]
B91["B92: instructions - lines 205 to 205"]
B92["B93: instructions - lines 206 to 207"]
B93["B94: instructions - lines 208 to 210"]
B94["B95: instructions - lines 211 to 211"]
B95["B96: PRINT1 - lines 214 to 214"]
B96["B97: instructions - lines 215 to 215"]
B97["B98: instructions - lines 216 to 217"]
B98["B99: instructions - lines 218 to 219"]
B99["B100: instructions - lines 220 to 220"]
B90 -->|call| B143
B90 -->|after return| B91
B91 -->|call| B155
B91 -->|after return| B92
B92 -->|call| B150
B92 -->|after return| B93
B93 -->|call| B145
B93 -->|after return| B94
B95 -->|call| B169
B95 -->|after return| B96
B96 -->|call| B162
B96 -->|after return| B97
B97 -->|call| B143
B97 -->|after return| B98
B98 -->|call| B143
B98 -->|after return| B99
B99 -->|call| B155
B99 -->|after return| B100
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B150["Continue at B151 in section 16"]
B145["Continue at B146 in section 15"]
B169["Continue at B170 in section 17"]
B162["Continue at B163 in section 17"]
B100["Continue at B101 in section 11"]
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
mov dptr, #ENTERNTH
acall wstr
```

### B94

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B95

Return to the instruction following the active call.

```asm
RET
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
ACALL CLEAR
```

### B98

```asm
MOV A, #8H
ACALL CMD
```

### B99

```asm
MOV A, #0H
ACALL CMD
```

### B100

```asm
ACALL LDELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 221 to 222"]
B101["B102: HH - lines 224 to 228"]
B102["B103: instructions - lines 229 to 231"]
B103["B104: instructions - lines 232 to 233"]
B104["B105: instructions - lines 234 to 235"]
B105["B106: instructions - lines 237 to 238"]
B106["B107: instructions - lines 239 to 240"]
B107["B108: instructions - lines 241 to 241"]
B108["B109: instructions - lines 242 to 242"]
B109["B110: HHH - lines 244 to 248"]
B100 -->|next| B101
B101 -->|call| B145
B101 -->|after return| B102
B102 -->|call| B145
B102 -->|after return| B103
B103 -->|call| B145
B103 -->|after return| B104
B104 -->|condition true| BX1
B104 -->|condition false| B105
B105 -->|call| B143
B105 -->|after return| B106
B106 -->|call| B143
B106 -->|after return| B107
B107 -->|call| B155
B107 -->|after return| B108
B108 -->|next| B109
B109 -->|call| B145
B109 -->|after return| B110
B145["Continue at B146 in section 15"]
BX1["Unresolved destination: HH"]
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV R4,#4
MOV R1,#20h
```

### B102

```asm
MOV A,@R1
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B103

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B104

```asm
MOV A,#'-'
ACALL WCHR
```

### B105

```asm
INC R1
DJNZ R4,HH
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
ACALL LDELAY
```

### B109

```asm
MOV R4,#4
```

### B110

```asm
MOV A,@R1
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 249 to 251"]
B111["B112: instructions - lines 252 to 253"]
B112["B113: instructions - lines 254 to 255"]
B113["B114: instructions - lines 256 to 256"]
B114["B115: PRINT2 - lines 259 to 259"]
B115["B116: instructions - lines 260 to 260"]
B116["B117: instructions - lines 261 to 262"]
B117["B118: instructions - lines 263 to 264"]
B118["B119: instructions - lines 265 to 265"]
B119["B120: instructions - lines 266 to 267"]
B110 -->|call| B145
B110 -->|after return| B111
B111 -->|call| B145
B111 -->|after return| B112
B112 -->|condition true| B109
B112 -->|condition false| B113
B114 -->|call| B169
B114 -->|after return| B115
B115 -->|call| B162
B115 -->|after return| B116
B116 -->|call| B143
B116 -->|after return| B117
B117 -->|call| B143
B117 -->|after return| B118
B118 -->|call| B155
B118 -->|after return| B119
B119 -->|call| B150
B119 -->|after return| B120
B145["Continue at B146 in section 15"]
B109["Continue at B110 in section 11"]
B169["Continue at B170 in section 17"]
B162["Continue at B163 in section 17"]
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B150["Continue at B151 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B112

```asm
MOV A,#'-'
ACALL WCHR
```

### B113

```asm
INC R1
DJNZ R4,HHH
```

### B114

Return to the instruction following the active call.

```asm
RET
```

### B115

```asm
ACALL DELAY
```

### B116

```asm
ACALL CLEAR
```

### B117

```asm
MOV A, #8H
ACALL CMD
```

### B118

```asm
MOV A, #0H
ACALL CMD
```

### B119

```asm
ACALL LDELAY
```

### B120

```asm
mov dptr, #ENTERNTH
acall wstr
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 268 to 270"]
B121["B122: instructions - lines 271 to 271"]
B122["B123: INIT - lines 278 to 285"]
B123["B124: INLCD - lines 290 to 291"]
B124["B125: WAIT - lines 293 to 293"]
B125["B126: instructions - lines 294 to 294"]
B126["B127: instructions - lines 295 to 297"]
B127["B128: instructions - lines 298 to 298"]
B128["B129: instructions - lines 299 to 300"]
B129["B130: instructions - lines 301 to 302"]
B120 -->|call| B145
B120 -->|after return| B121
B123 -->|next| B124
B124 -->|call| B155
B124 -->|after return| B125
B125 -->|condition true| B124
B125 -->|condition false| B126
B126 -->|call| B143
B126 -->|after return| B127
B127 -->|call| B155
B127 -->|after return| B128
B128 -->|call| B143
B128 -->|after return| B129
B129 -->|call| B143
B129 -->|after return| B130
B145["Continue at B146 in section 15"]
B155["Continue at B156 in section 16"]
B143["Continue at B144 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

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

### B124

```asm
PUSH 7
MOV R7,#20
```

### B125

```asm
ACALL LDELAY
```

### B126

```asm
DJNZ R7,WAIT
```

### B127

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B128

```asm
ACALL LDELAY
```

### B129

```asm
MOV A,#0011B
ACALL CMD
```

### B130

```asm
MOV A,#0011B
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 303 to 304"]
B131["B132: instructions - lines 305 to 306"]
B132["B133: instructions - lines 307 to 308"]
B133["B134: instructions - lines 309 to 310"]
B134["B135: instructions - lines 311 to 312"]
B135["B136: instructions - lines 313 to 314"]
B136["B137: instructions - lines 315 to 316"]
B137["B138: instructions - lines 317 to 317"]
B138["B139: instructions - lines 318 to 319"]
B139["B140: instructions - lines 320 to 321"]
B130 -->|call| B143
B130 -->|after return| B131
B131 -->|call| B143
B131 -->|after return| B132
B132 -->|call| B143
B132 -->|after return| B133
B133 -->|call| B143
B133 -->|after return| B134
B134 -->|call| B143
B134 -->|after return| B135
B135 -->|call| B143
B135 -->|after return| B136
B136 -->|call| B143
B136 -->|after return| B137
B137 -->|call| B155
B137 -->|after return| B138
B138 -->|call| B143
B138 -->|after return| B139
B139 -->|call| B143
B139 -->|after return| B140
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,#0010B
ACALL CMD
```

### B132

```asm
MOV A,#0010B
ACALL CMD
```

### B133

```asm
MOV A,#1000B
ACALL CMD
```

### B134

```asm
MOV A,#0000B
ACALL CMD
```

### B135

```asm
MOV A,#1000B
ACALL CMD
```

### B136

```asm
MOV A,#0
ACALL CMD
```

### B137

```asm
MOV A,#0001B
ACALL CMD
```

### B138

```asm
ACALL LDELAY
```

### B139

```asm
MOV A,#0000B
ACALL CMD
```

### B140

```asm
MOV A,#0110B
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 322 to 323"]
B141["B142: instructions - lines 324 to 325"]
B142["B143: instructions - lines 326 to 327"]
B143["B144: CMD - lines 332 to 333"]
B144["B145: instructions - lines 334 to 334"]
B145["B146: WCHR - lines 339 to 344"]
B146["B147: instructions - lines 345 to 346"]
B147["B148: instructions - lines 347 to 349"]
B148["B149: COMMON - lines 354 to 361"]
B149["B150: instructions - lines 362 to 362"]
B140 -->|call| B143
B140 -->|after return| B141
B141 -->|call| B143
B141 -->|after return| B142
B143 -->|call| B148
B143 -->|after return| B144
B145 -->|call| B148
B145 -->|after return| B146
B146 -->|call| B148
B146 -->|after return| B147
B148 -->|call| B155
B148 -->|after return| B149
B155["Continue at B156 in section 16"]
```

### B141

```asm
MOV A,#0000B
ACALL CMD
```

### B142

```asm
MOV A,#1111B
ACALL CMD
```

### B143

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B144

```asm
CLR RS
ACALL COMMON
```

### B145

Return to the instruction following the active call.

```asm
RET
```

### B146

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B147

```asm
MOV A,B
ACALL COMMON
```

### B148

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B149

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

### B150

Return to the instruction following the active call.

```asm
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: WSTR - lines 367 to 367"]
B151["B152: CONT1 - lines 368 to 370"]
B152["B153: instructions - lines 371 to 371"]
B153["B154: instructions - lines 373 to 374"]
B154["B155: EXIT1 - lines 376 to 377"]
B155["B156: LDELAY - lines 382 to 384"]
B156["B157: CON4 - lines 385 to 386"]
B157["B158: instructions - lines 387 to 387"]
B158["B159: instructions - lines 388 to 390"]
B159["B160: TMSEC - lines 397 to 400"]
B150 -->|next| B151
B151 -->|condition true| B154
B151 -->|condition false| B152
B152 -->|call| B145
B152 -->|after return| B153
B153 -->|jump| B151
B155 -->|next| B156
B156 -->|condition true| B156
B156 -->|condition false| B157
B157 -->|condition true| B156
B157 -->|condition false| B158
B159 -->|next| B160
B145["Continue at B146 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
PUSH ACC
```

### B152

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B153

```asm
ACALL WCHR
```

### B154

```asm
INC DPTR
AJMP CONT1
```

### B155

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B156

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B157

```asm
MOV R0,#250
DJNZ R0,$
```

### B158

```asm
DJNZ R1,CON4
```

### B159

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B160

```asm
MOV TMOD,#21H
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

## Section 17

```mermaid
flowchart TD
B160["B161: BACK - lines 402 to 402"]
B161["B162: instructions - lines 403 to 405"]
B162["B163: CLEAR - lines 409 to 410"]
B163["B164: instructions - lines 411 to 412"]
B164["B165: instructions - lines 413 to 413"]
B165["B166: instructions - lines 414 to 414"]
B166["B167: WAITT - lines 415 to 415"]
B167["B168: instructions - lines 416 to 416"]
B168["B169: instructions - lines 417 to 417"]
B169["B170: DELAY - lines 421 to 421"]
B160 -->|condition true| B160
B160 -->|condition false| B161
B162 -->|call| B143
B162 -->|after return| B163
B163 -->|call| B143
B163 -->|after return| B164
B164 -->|call| B155
B164 -->|after return| B165
B165 -->|next| B166
B166 -->|call| B155
B166 -->|after return| B167
B167 -->|condition true| B166
B167 -->|condition false| B168
B169 -->|next| B170
B143["Continue at B144 in section 15"]
B155["Continue at B156 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
JNB TF0,BACK
```

### B162

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B163

```asm
MOV A,#0H
ACALL CMD
```

### B164

```asm
MOV A,#1H
ACALL CMD
```

### B165

```asm
ACALL LDELAY
```

### B166

```asm
MOV R7,#14
```

### B167

```asm
ACALL LDELAY
```

### B168

```asm
DJNZ R7,WAITT
```

### B169

Return to the instruction following the active call.

```asm
RET
```

### B170

```asm
MOV R5,#60
```

## Section 18

```mermaid
flowchart TD
B170["B171: HH - lines 423 to 423"]
B171["B172: instructions - lines 424 to 424"]
B172["B173: instructions - lines 425 to 425"]
B170 -->|call| B155
B170 -->|after return| B171
B171 -->|condition true| BX2
B171 -->|condition false| B172
B155["Continue at B156 in section 16"]
BX2["Unresolved destination: HH"]
```

### B171

```asm
ACALL LDELAY
```

### B172

```asm
DJNZ R5,HH
```

### B173

Return to the instruction following the active call.

```asm
RET
```
