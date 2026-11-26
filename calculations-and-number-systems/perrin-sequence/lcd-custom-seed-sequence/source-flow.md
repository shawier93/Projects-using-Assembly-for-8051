# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 10"]
B2["B3: START - lines 14 to 14"]
B3["B4: instructions - lines 15 to 16"]
B4["B5: instructions - lines 17 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: instructions - lines 19 to 20"]
B7["B8: instructions - lines 21 to 21"]
B8["B9: instructions - lines 22 to 22"]
B9["B10: OPTION2 - lines 25 to 25"]
B0 -->|call| B108
B0 -->|after return| B1
B1 -->|call| B25
B1 -->|after return| B2
B2 -->|call| B37
B2 -->|after return| B3
B3 -->|condition true| B9
B3 -->|condition false| B4
B4 -->|call| B43
B4 -->|after return| B5
B5 -->|call| B55
B5 -->|after return| B6
B6 -->|call| B20
B6 -->|after return| B7
B7 -->|call| B71
B7 -->|after return| B8
B8 -->|jump| B2
B9 -->|condition true| B15
B9 -->|condition false| B10
B108["Continue at B109 in section 11"]
B25["Continue at B26 in section 3"]
B37["Continue at B38 in section 4"]
B43["Continue at B44 in section 5"]
B55["Continue at B56 in section 6"]
B20["Continue at B21 in section 3"]
B71["Continue at B72 in section 8"]
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
B10["B11: instructions - lines 26 to 26"]
B11["B12: instructions - lines 27 to 27"]
B12["B13: instructions - lines 28 to 28"]
B13["B14: instructions - lines 29 to 29"]
B14["B15: instructions - lines 30 to 30"]
B15["B16: OPTION3 - lines 33 to 33"]
B16["B17: instructions - lines 34 to 34"]
B17["B18: WRONG - lines 37 to 37"]
B18["B19: instructions - lines 38 to 38"]
B19["B20: EXIT - lines 41 to 41"]
B10 -->|call| B47
B10 -->|after return| B11
B11 -->|call| B55
B11 -->|after return| B12
B12 -->|call| B23
B12 -->|after return| B13
B13 -->|call| B86
B13 -->|after return| B14
B14 -->|jump| B2
B15 -->|condition true| B17
B15 -->|condition false| B16
B16 -->|jump| B19
B17 -->|call| B51
B17 -->|after return| B18
B18 -->|jump| B2
B19 -->|jump| B19
B47["Continue at B48 in section 5"]
B55["Continue at B56 in section 6"]
B23["Continue at B24 in section 3"]
B86["Continue at B87 in section 9"]
B2["Continue at B3 in section 1"]
B51["Continue at B52 in section 6"]
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
B20["B21: PERRINSEQ - lines 45 to 46"]
B21["B22: ST - lines 48 to 61"]
B22["B23: instructions - lines 62 to 62"]
B23["B24: NTHNUMBER - lines 65 to 67"]
B24["B25: instructions - lines 68 to 69"]
B25["B26: WELCOME - lines 73 to 74"]
B26["B27: instructions - lines 75 to 76"]
B27["B28: instructions - lines 78 to 79"]
B28["B29: instructions - lines 80 to 81"]
B29["B30: instructions - lines 82 to 82"]
B20 -->|next| B21
B21 -->|condition true| B21
B21 -->|condition false| B22
B23 -->|call| B20
B23 -->|after return| B24
B25 -->|call| B102
B25 -->|after return| B26
B26 -->|call| B120
B26 -->|after return| B27
B27 -->|call| B102
B27 -->|after return| B28
B28 -->|call| B120
B28 -->|after return| B29
B29 -->|call| B92
B29 -->|after return| B30
B102["Continue at B103 in section 11"]
B120["Continue at B121 in section 13"]
B92["Continue at B93 in section 10"]
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
mov a, #80H
acall cmd
```

### B27

```asm
mov dptr, #NAME1
acall wstr
```

### B28

```asm
mov a,#0c0h
acall cmd
```

### B29

```asm
mov dptr, #NAME2
acall wstr
```

### B30

```asm
acall delay
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 83 to 83"]
B31["B32: MMENU - lines 86 to 87"]
B32["B33: instructions - lines 88 to 89"]
B33["B34: instructions - lines 91 to 92"]
B34["B35: instructions - lines 93 to 94"]
B35["B36: instructions - lines 95 to 95"]
B36["B37: instructions - lines 96 to 96"]
B37["B38: SELECTT - lines 99 to 99"]
B38["B39: instructions - lines 100 to 100"]
B39["B40: instructions - lines 101 to 102"]
B31 -->|call| B102
B31 -->|after return| B32
B32 -->|call| B120
B32 -->|after return| B33
B33 -->|call| B102
B33 -->|after return| B34
B34 -->|call| B120
B34 -->|after return| B35
B35 -->|call| B92
B35 -->|after return| B36
B37 -->|call| B115
B37 -->|after return| B38
B38 -->|call| B92
B38 -->|after return| B39
B39 -->|call| B102
B39 -->|after return| B40
B102["Continue at B103 in section 11"]
B120["Continue at B121 in section 13"]
B92["Continue at B93 in section 10"]
B115["Continue at B116 in section 12"]
B40["Continue at B41 in section 5"]
```

### B31

Return to the instruction following the active call.

```asm
ret
```

### B32

```asm
mov a, #80H
acall cmd
```

### B33

```asm
mov dptr, #OP1
acall wstr
```

### B34

```asm
mov a,#0c0h
acall cmd
```

### B35

```asm
mov dptr, #OP2
acall wstr
```

### B36

```asm
acall delay
```

### B37

Return to the instruction following the active call.

```asm
ret
```

### B38

```asm
ACALL CLEAR
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
mov a, #80H
acall cmd
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 103 to 104"]
B41["B42: instructions - lines 105 to 107"]
B42["B43: instructions - lines 109 to 109"]
B43["B44: OPTIONN1 - lines 112 to 113"]
B44["B45: instructions - lines 114 to 115"]
B45["B46: instructions - lines 116 to 116"]
B46["B47: instructions - lines 117 to 117"]
B47["B48: OPTIONN2 - lines 120 to 121"]
B48["B49: instructions - lines 122 to 123"]
B49["B50: instructions - lines 124 to 124"]
B40 -->|call| B120
B40 -->|after return| B41
B41 -->|call| B97
B41 -->|after return| B42
B43 -->|call| B102
B43 -->|after return| B44
B44 -->|call| B120
B44 -->|after return| B45
B45 -->|call| B92
B45 -->|after return| B46
B47 -->|call| B102
B47 -->|after return| B48
B48 -->|call| B120
B48 -->|after return| B49
B49 -->|call| B92
B49 -->|after return| B50
B120["Continue at B121 in section 13"]
B97["Continue at B98 in section 10"]
B102["Continue at B103 in section 11"]
B92["Continue at B93 in section 10"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov dptr, #MSG
acall wstr
```

### B42

```asm
MOV A,70H
ADD A,#30H
ACALL WCHR
```

### B43

Return to the instruction following the active call.

```asm
RET
```

### B44

```asm
mov a,#0c0h
acall cmd
```

### B45

```asm
mov dptr, #MSG1
acall wstr
```

### B46

```asm
acall delay
```

### B47

Return to the instruction following the active call.

```asm
ret
```

### B48

```asm
mov a,#0c0h
acall cmd
```

### B49

```asm
mov dptr, #MSG2
acall wstr
```

### B50

```asm
acall delay
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 125 to 125"]
B51["B52: WRONGG - lines 128 to 129"]
B52["B53: instructions - lines 130 to 131"]
B53["B54: instructions - lines 132 to 132"]
B54["B55: instructions - lines 133 to 133"]
B55["B56: ENTER3NUMBER - lines 136 to 136"]
B56["B57: instructions - lines 137 to 137"]
B57["B58: instructions - lines 138 to 139"]
B58["B59: instructions - lines 140 to 141"]
B59["B60: instructions - lines 142 to 144"]
B51 -->|call| B102
B51 -->|after return| B52
B52 -->|call| B120
B52 -->|after return| B53
B53 -->|call| B92
B53 -->|after return| B54
B55 -->|call| B115
B55 -->|after return| B56
B56 -->|call| B92
B56 -->|after return| B57
B57 -->|call| B102
B57 -->|after return| B58
B58 -->|call| B120
B58 -->|after return| B59
B59 -->|call| B97
B59 -->|after return| B60
B102["Continue at B103 in section 11"]
B120["Continue at B121 in section 13"]
B92["Continue at B93 in section 10"]
B115["Continue at B116 in section 12"]
B97["Continue at B98 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
ret
```

### B52

```asm
mov a,#0C0h
acall cmd
```

### B53

```asm
mov dptr, #WRONGGG
acall wstr
```

### B54

```asm
acall delay
```

### B55

Return to the instruction following the active call.

```asm
ret
```

### B56

```asm
ACALL CLEAR
```

### B57

```asm
ACALL DELAY
```

### B58

```asm
mov a, #80H
acall cmd
```

### B59

```asm
mov dptr, #ENTER
acall wstr
```

### B60

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 145 to 146"]
B61["B62: instructions - lines 147 to 149"]
B62["B63: instructions - lines 150 to 151"]
B63["B64: instructions - lines 152 to 154"]
B64["B65: instructions - lines 155 to 156"]
B65["B66: instructions - lines 157 to 157"]
B66["B67: instructions - lines 158 to 158"]
B67["B68: N_NUMBER - lines 161 to 162"]
B68["B69: instructions - lines 163 to 164"]
B69["B70: instructions - lines 165 to 167"]
B60 -->|call| B97
B60 -->|after return| B61
B61 -->|call| B97
B61 -->|after return| B62
B62 -->|call| B97
B62 -->|after return| B63
B63 -->|call| B97
B63 -->|after return| B64
B64 -->|call| B97
B64 -->|after return| B65
B65 -->|call| B92
B65 -->|after return| B66
B67 -->|call| B102
B67 -->|after return| B68
B68 -->|call| B120
B68 -->|after return| B69
B69 -->|call| B97
B69 -->|after return| B70
B97["Continue at B98 in section 10"]
B92["Continue at B93 in section 10"]
B102["Continue at B103 in section 11"]
B120["Continue at B121 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#'-'
ACALL WCHR
```

### B62

```asm
MOV A,21H
ADD A,#30H
ACALL WCHR
```

### B63

```asm
ADD A,#'-'
ACALL WCHR
```

### B64

```asm
MOV A,22H
ADD A,#30H
ACALL WCHR
```

### B65

```asm
ADD A,#'-'
ACALL WCHR
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
mov a, #0CH
acall cmd
```

### B69

```asm
mov dptr, #ENTERNTH
acall wstr
```

### B70

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 168 to 168"]
B71["B72: PRINT1 - lines 171 to 171"]
B72["B73: instructions - lines 172 to 172"]
B73["B74: instructions - lines 173 to 174"]
B74["B75: instructions - lines 176 to 177"]
B75["B76: HH - lines 179 to 183"]
B76["B77: instructions - lines 184 to 186"]
B77["B78: instructions - lines 187 to 188"]
B78["B79: instructions - lines 189 to 190"]
B79["B80: instructions - lines 192 to 193"]
B71 -->|call| B115
B71 -->|after return| B72
B72 -->|call| B92
B72 -->|after return| B73
B73 -->|call| B102
B73 -->|after return| B74
B74 -->|next| B75
B75 -->|call| B97
B75 -->|after return| B76
B76 -->|call| B97
B76 -->|after return| B77
B77 -->|call| B97
B77 -->|after return| B78
B78 -->|condition true| B75
B78 -->|condition false| B79
B79 -->|call| B102
B79 -->|after return| B80
B115["Continue at B116 in section 12"]
B92["Continue at B93 in section 10"]
B102["Continue at B103 in section 11"]
B97["Continue at B98 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
ACALL CLEAR
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
mov a, #80H
acall cmd
```

### B75

```asm
MOV R4,#4
MOV R1,#20h
```

### B76

```asm
MOV A,@R1
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B77

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B78

```asm
MOV A,#'-'
ACALL WCHR
```

### B79

```asm
INC R1
DJNZ R4,HH
```

### B80

```asm
mov a, #0C0H
acall cmd
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 194 to 194"]
B81["B82: HHH - lines 196 to 200"]
B82["B83: instructions - lines 201 to 203"]
B83["B84: instructions - lines 204 to 205"]
B84["B85: instructions - lines 206 to 207"]
B85["B86: instructions - lines 208 to 208"]
B86["B87: PRINT2 - lines 211 to 211"]
B87["B88: instructions - lines 212 to 212"]
B88["B89: instructions - lines 213 to 214"]
B89["B90: instructions - lines 215 to 216"]
B80 -->|next| B81
B81 -->|call| B97
B81 -->|after return| B82
B82 -->|call| B97
B82 -->|after return| B83
B83 -->|call| B97
B83 -->|after return| B84
B84 -->|condition true| B81
B84 -->|condition false| B85
B86 -->|call| B115
B86 -->|after return| B87
B87 -->|call| B92
B87 -->|after return| B88
B88 -->|call| B102
B88 -->|after return| B89
B89 -->|call| B120
B89 -->|after return| B90
B97["Continue at B98 in section 10"]
B115["Continue at B116 in section 12"]
B92["Continue at B93 in section 10"]
B102["Continue at B103 in section 11"]
B120["Continue at B121 in section 13"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV R4,#4
```

### B82

```asm
MOV A,@R1
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B83

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B84

```asm
MOV A,#'-'
ACALL WCHR
```

### B85

```asm
INC R1
DJNZ R4,HHH
```

### B86

Return to the instruction following the active call.

```asm
RET
```

### B87

```asm
ACALL CLEAR
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
mov a, #80H
acall cmd
```

### B90

```asm
mov dptr, #ENTERNTH
acall wstr
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 217 to 219"]
B91["B92: instructions - lines 220 to 220"]
B92["B93: DELAY - lines 226 to 226"]
B93["B94: HE2 - lines 227 to 227"]
B94["B95: HE - lines 228 to 228"]
B95["B96: instructions - lines 229 to 229"]
B96["B97: instructions - lines 230 to 230"]
B97["B98: WCHR - lines 234 to 238"]
B98["B99: instructions - lines 239 to 239"]
B99["B100: instructions - lines 240 to 242"]
B90 -->|call| B97
B90 -->|after return| B91
B92 -->|next| B93
B93 -->|next| B94
B94 -->|condition true| B94
B94 -->|condition false| B95
B95 -->|condition true| B93
B95 -->|condition false| B96
B97 -->|call| B107
B97 -->|after return| B98
B98 -->|call| B113
B98 -->|after return| B99
B99 -->|call| B107
B99 -->|after return| B100
B107["Continue at B108 in section 11"]
B113["Continue at B114 in section 12"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
MOV R1,#100
```

### B94

```asm
MOV R0,#10
```

### B95

```asm
DJNZ R0,he
```

### B96

```asm
djnz r1,he2
```

### B97

Return to the instruction following the active call.

```asm
RET
```

### B98

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B99

```asm
ACALL LDELAY
```

### B100

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 243 to 243"]
B101["B102: instructions - lines 244 to 246"]
B102["B103: CMD - lines 249 to 251"]
B103["B104: instructions - lines 252 to 252"]
B104["B105: instructions - lines 253 to 255"]
B105["B106: instructions - lines 256 to 256"]
B106["B107: instructions - lines 257 to 257"]
B107["B108: COMMON - lines 260 to 265"]
B108["B109: INLCD - lines 268 to 275"]
B109["B110: instructions - lines 276 to 284"]
B100 -->|call| B113
B100 -->|after return| B101
B102 -->|call| B107
B102 -->|after return| B103
B103 -->|call| B113
B103 -->|after return| B104
B104 -->|call| B107
B104 -->|after return| B105
B105 -->|call| B113
B105 -->|after return| B106
B108 -->|call| B113
B108 -->|after return| B109
B109 -->|call| B113
B109 -->|after return| B110
B113["Continue at B114 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL LDELAY
```

### B102

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B103

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B104

```asm
ACALL LDELAY
```

### B105

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B106

```asm
ACALL LDELAY
```

### B107

Return to the instruction following the active call.

```asm
RET
```

### B108

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B109

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

### B110

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

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 285 to 297"]
B111["B112: instructions - lines 298 to 308"]
B112["B113: instructions - lines 309 to 309"]
B113["B114: LDELAY - lines 312 to 313"]
B114["B115: instructions - lines 314 to 314"]
B115["B116: CLEAR - lines 317 to 318"]
B116["B117: instructions - lines 319 to 319"]
B117["B118: WAIT - lines 320 to 320"]
B118["B119: instructions - lines 321 to 321"]
B119["B120: instructions - lines 322 to 322"]
B110 -->|call| B113
B110 -->|after return| B111
B111 -->|call| B113
B111 -->|after return| B112
B113 -->|condition true| B113
B113 -->|condition false| B114
B115 -->|call| B102
B115 -->|after return| B116
B116 -->|next| B117
B117 -->|call| B113
B117 -->|after return| B118
B118 -->|condition true| B117
B118 -->|condition false| B119
B102["Continue at B103 in section 11"]
```

### B111

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

### B112

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

### B113

Return to the instruction following the active call.

```asm
RET
```

### B114

```asm
MOV R0, #50
DJNZ R0, $
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
MOV A,#01H
ACALL CMD
```

### B117

```asm
MOV R7,#14
```

### B118

```asm
ACALL LDELAY
```

### B119

```asm
DJNZ R7,WAIT
```

### B120

Return to the instruction following the active call.

```asm
ret
```

## Section 13

```mermaid
flowchart TD
B120["B121: WSTR - lines 325 to 325"]
B121["B122: CONT1 - lines 327 to 329"]
B122["B123: PRINT - lines 331 to 331"]
B123["B124: instructions - lines 332 to 333"]
B124["B125: EXIT1 - lines 334 to 335"]
B120 -->|next| B121
B121 -->|condition true| B124
B121 -->|condition false| B122
B122 -->|call| B97
B122 -->|after return| B123
B123 -->|jump| B121
B97["Continue at B98 in section 10"]
```

### B121

```asm
PUSH    ACC
```

### B122

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B123

```asm
ACALL    WCHR
```

### B124

```asm
INC DPTR
AJMP    CONT1
```

### B125

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
