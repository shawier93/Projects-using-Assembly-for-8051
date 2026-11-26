# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 5 to 5"]
B2["B3: X0 - lines 10 to 10"]
B3["B4: instructions - lines 11 to 12"]
B4["B5: BEGINING - lines 16 to 16"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: instructions - lines 19 to 19"]
B7["B8: instructions - lines 20 to 20"]
B8["B9: instructions - lines 21 to 22"]
B9["B10: instructions - lines 23 to 24"]
B0 -->|jump| B2
B1 -->|jump| B59
B2 -->|call| B184
B2 -->|after return| B3
B3 -->|next| B4
B4 -->|call| B191
B4 -->|after return| B5
B5 -->|call| B66
B5 -->|after return| B6
B6 -->|call| B191
B6 -->|after return| B7
B7 -->|call| B61
B7 -->|after return| B8
B8 -->|call| B178
B8 -->|after return| B9
B9 -->|call| B61
B9 -->|after return| B10
B59["Continue at B60 in section 6"]
B184["Continue at B185 in section 19"]
B191["Continue at B192 in section 20"]
B66["Continue at B67 in section 7"]
B61["Continue at B62 in section 7"]
B178["Continue at B179 in section 18"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
AJMP X0
```

### B2

```asm
LJMP EX0ISR
```

### B3

```asm
ACALL INLCD
```

### B4

```asm
MOV IE,#10000001B
SETB IT0
```

### B5

```asm
acall clear
```

### B6

```asm
acall WRITE1
```

### B7

```asm
ACALL CLEAR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
mov a, #80H
acall cmd
```

### B10

```asm
mov dptr, #STR15
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 25 to 25"]
B11["B12: instructions - lines 26 to 29"]
B12["B13: instructions - lines 30 to 30"]
B13["B14: instructions - lines 33 to 34"]
B14["B15: MIAN - lines 37 to 37"]
B15["B16: instructions - lines 39 to 39"]
B16["B17: instructions - lines 40 to 45"]
B17["B18: instructions - lines 46 to 46"]
B18["B19: ZEROOS - lines 49 to 49"]
B19["B20: instructions - lines 50 to 50"]
B10 -->|call| B196
B10 -->|after return| B11
B11 -->|call| B70
B11 -->|after return| B12
B12 -->|call| B108
B12 -->|after return| B13
B13 -->|next| B14
B14 -->|condition true| B18
B14 -->|condition false| B15
B15 -->|call| B116
B15 -->|after return| B16
B16 -->|call| B87
B16 -->|after return| B17
B17 -->|jump| B29
B18 -->|condition true| B48
B18 -->|condition false| B19
B19 -->|call| B129
B19 -->|after return| B20
B196["Continue at B197 in section 20"]
B70["Continue at B71 in section 8"]
B108["Continue at B109 in section 11"]
B116["Continue at B117 in section 12"]
B87["Continue at B88 in section 9"]
B29["Continue at B30 in section 3"]
B48["Continue at B49 in section 5"]
B129["Continue at B130 in section 13"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL WSTR
```

### B12

```asm
CLR P3.6
SETB P3.6
acall WRITE2
```

### B13

```asm
ACALL READ1
```

### B14

```asm
MOV 50H,#0FH
MOV 51H,#0
```

### B15

```asm
CJNE R1,#1,ZEROOS
```

### B16

```asm
ACALL READ2
```

### B17

```asm
MOV A,40H
ADD A,41H
MOV B,#2
DIV AB
MOV 42H,A
ACALL WRITE3
```

### B18

```asm
SJMP CHECK
```

### B19

```asm
CJNE R1,#2, EXITT
```

### B20

```asm
ACALL READ3
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 51 to 52"]
B21["B22: instructions - lines 53 to 54"]
B22["B23: instructions - lines 55 to 55"]
B23["B24: WRONG - lines 59 to 59"]
B24["B25: instructions - lines 60 to 60"]
B25["B26: instructions - lines 61 to 62"]
B26["B27: instructions - lines 63 to 64"]
B27["B28: instructions - lines 65 to 65"]
B28["B29: instructions - lines 66 to 66"]
B29["B30: CHECK - lines 70 to 70"]
B20 -->|call| B54
B20 -->|after return| B21
B21 -->|call| B140
B21 -->|after return| B22
B22 -->|jump| B29
B23 -->|call| B61
B23 -->|after return| B24
B24 -->|call| B191
B24 -->|after return| B25
B25 -->|call| B178
B25 -->|after return| B26
B26 -->|call| B196
B26 -->|after return| B27
B27 -->|call| B61
B27 -->|after return| B28
B28 -->|jump| B4
B29 -->|call| B61
B29 -->|after return| B30
B54["Continue at B55 in section 6"]
B140["Continue at B141 in section 15"]
B61["Continue at B62 in section 7"]
B191["Continue at B192 in section 20"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B4["Continue at B5 in section 1"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,50H
ACALL COUNT
```

### B22

```asm
MOV 30H,51H
ACALL WRITE4
```

### B23

```asm
SJMP CHECK
```

### B24

```asm
ACALL DELAY
```

### B25

```asm
ACALL CLEAR
```

### B26

```asm
mov a, #80H
acall cmd
```

### B27

```asm
mov dptr, #STR11
acall WSTR
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
SJMP BEGINING
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 71 to 71"]
B31["B32: instructions - lines 72 to 73"]
B32["B33: instructions - lines 74 to 75"]
B33["B34: instructions - lines 76 to 76"]
B34["B35: instructions - lines 77 to 78"]
B35["B36: instructions - lines 79 to 80"]
B36["B37: instructions - lines 81 to 81"]
B37["B38: instructions - lines 82 to 82"]
B38["B39: instructions - lines 83 to 84"]
B39["B40: instructions - lines 85 to 85"]
B30 -->|call| B191
B30 -->|after return| B31
B31 -->|call| B178
B31 -->|after return| B32
B32 -->|call| B196
B32 -->|after return| B33
B33 -->|call| B61
B33 -->|after return| B34
B34 -->|call| B178
B34 -->|after return| B35
B35 -->|call| B196
B35 -->|after return| B36
B36 -->|call| B61
B36 -->|after return| B37
B37 -->|call| B156
B37 -->|after return| B38
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B4
B191["Continue at B192 in section 20"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B156["Continue at B157 in section 16"]
B40["Continue at B41 in section 5"]
B4["Continue at B5 in section 1"]
```

### B31

```asm
ACALL CLEAR
```

### B32

```asm
mov a, #80H
acall cmd
```

### B33

```asm
mov dptr, #STR13
acall WSTR
```

### B34

```asm
ACALL DELAY
```

### B35

```asm
mov a, #0C0H
acall cmd
```

### B36

```asm
mov dptr, #STR14
acall WSTR
```

### B37

```asm
ACALL DELAY
```

### B38

```asm
ACALL KEYPAD
```

### B39

```asm
SUBB A,#30H
CJNE A,#1,LE
```

### B40

```asm
LJMP BEGINING
```

## Section 5

```mermaid
flowchart TD
B40["B41: LE - lines 87 to 87"]
B41["B42: instructions - lines 88 to 88"]
B42["B43: EE - lines 90 to 90"]
B43["B44: instructions - lines 91 to 91"]
B44["B45: instructions - lines 92 to 93"]
B45["B46: instructions - lines 94 to 95"]
B46["B47: instructions - lines 96 to 96"]
B47["B48: instructions - lines 97 to 97"]
B48["B49: EXITT - lines 100 to 100"]
B49["B50: instructions - lines 101 to 101"]
B40 -->|condition true| B42
B40 -->|condition false| B41
B41 -->|jump| B48
B42 -->|call| B61
B42 -->|after return| B43
B43 -->|call| B191
B43 -->|after return| B44
B44 -->|call| B178
B44 -->|after return| B45
B45 -->|call| B196
B45 -->|after return| B46
B46 -->|call| B61
B46 -->|after return| B47
B47 -->|jump| B29
B48 -->|call| B61
B48 -->|after return| B49
B49 -->|call| B191
B49 -->|after return| B50
B61["Continue at B62 in section 7"]
B191["Continue at B192 in section 20"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B29["Continue at B30 in section 3"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
CJNE A,#2,EE
```

### B42

```asm
SJMP EXITT
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
ACALL CLEAR
```

### B45

```asm
mov a, #80H
acall cmd
```

### B46

```asm
mov dptr, #STR11
acall WSTR
```

### B47

```asm
ACALL DELAY
```

### B48

```asm
SJMP CHECK
```

### B49

```asm
ACALL DELAY
```

### B50

```asm
ACALL CLEAR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 102 to 103"]
B51["B52: instructions - lines 104 to 105"]
B52["B53: instructions - lines 106 to 106"]
B53["B54: BACK - lines 107 to 107"]
B54["B55: COUNT - lines 110 to 111"]
B55["B56: HERE - lines 113 to 116"]
B56["B57: instructions - lines 117 to 117"]
B57["B58: NO - lines 119 to 119"]
B58["B59: instructions - lines 121 to 121"]
B59["B60: EX0ISR - lines 124 to 126"]
B50 -->|call| B178
B50 -->|after return| B51
B51 -->|call| B196
B51 -->|after return| B52
B52 -->|call| B61
B52 -->|after return| B53
B53 -->|jump| B53
B54 -->|next| B55
B55 -->|condition true| B57
B55 -->|condition false| B56
B56 -->|next| B57
B57 -->|condition true| B55
B57 -->|condition false| B58
B59 -->|condition true| B59
B59 -->|condition false| B60
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
mov a, #80H
acall cmd
```

### B52

```asm
mov dptr, #STR12
acall WSTR
```

### B53

```asm
ACALL DELAY
```

### B54

```asm
SJMP BACK
```

### B55

```asm
MOV A,50H
MOV R4,#9
```

### B56

```asm
MOV B,#2
DIV AB
MOV R0,B
CJNE R0,#0,NO
```

### B57

```asm
INC 51H
```

### B58

```asm
DJNZ R4,HERE
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
MOV A,P2
ANL A,#01000000B
CJNE A,#0,EX0ISR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 127 to 127"]
B61["B62: DELAY - lines 130 to 130"]
B62["B63: AGAIN - lines 131 to 131"]
B63["B64: AGAIN2 - lines 132 to 132"]
B64["B65: instructions - lines 133 to 133"]
B65["B66: instructions - lines 134 to 134"]
B66["B67: WRITE1 - lines 137 to 138"]
B67["B68: instructions - lines 139 to 140"]
B68["B69: instructions - lines 141 to 141"]
B69["B70: instructions - lines 142 to 142"]
B61 -->|next| B62
B62 -->|next| B63
B63 -->|condition true| B63
B63 -->|condition false| B64
B64 -->|condition true| B62
B64 -->|condition false| B65
B66 -->|call| B178
B66 -->|after return| B67
B67 -->|call| B196
B67 -->|after return| B68
B68 -->|call| B61
B68 -->|after return| B69
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
```

### B61

Return to the instruction following the active call.

```asm
RET
```

### B62

```asm
MOV R0,#20
```

### B63

```asm
MOV R1,#90
```

### B64

```asm
DJNZ R1,AGAIN2
```

### B65

```asm
DJNZ R0,AGAIN
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
mov a, #80H
acall cmd
```

### B68

```asm
mov dptr, #STR1
acall WSTR
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
B70["B71: WRITE2 - lines 146 to 146"]
B71["B72: instructions - lines 147 to 148"]
B72["B73: instructions - lines 149 to 150"]
B73["B74: instructions - lines 151 to 151"]
B74["B75: instructions - lines 153 to 154"]
B75["B76: instructions - lines 155 to 156"]
B76["B77: instructions - lines 157 to 157"]
B77["B78: instructions - lines 158 to 158"]
B78["B79: instructions - lines 159 to 159"]
B79["B80: instructions - lines 160 to 160"]
B70 -->|call| B191
B70 -->|after return| B71
B71 -->|call| B178
B71 -->|after return| B72
B72 -->|call| B196
B72 -->|after return| B73
B73 -->|call| B61
B73 -->|after return| B74
B74 -->|call| B178
B74 -->|after return| B75
B75 -->|call| B196
B75 -->|after return| B76
B76 -->|call| B61
B76 -->|after return| B77
B77 -->|call| B61
B77 -->|after return| B78
B78 -->|call| B191
B78 -->|after return| B79
B79 -->|call| B61
B79 -->|after return| B80
B191["Continue at B192 in section 20"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL CLEAR
```

### B72

```asm
mov a, #80H
acall cmd
```

### B73

```asm
mov dptr, #STR2
acall WSTR
```

### B74

```asm
ACALL DELAY
```

### B75

```asm
mov a, #0C0H
acall cmd
```

### B76

```asm
mov dptr, #STR3
acall WSTR
```

### B77

```asm
ACALL DELAY
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
ACALL CLEAR
```

### B80

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 161 to 161"]
B81["B82: instructions - lines 162 to 163"]
B82["B83: instructions - lines 164 to 165"]
B83["B84: instructions - lines 166 to 166"]
B84["B85: instructions - lines 168 to 169"]
B85["B86: instructions - lines 170 to 171"]
B86["B87: instructions - lines 173 to 173"]
B87["B88: WRITE3 - lines 179 to 179"]
B88["B89: instructions - lines 180 to 181"]
B89["B90: instructions - lines 182 to 183"]
B80 -->|call| B61
B80 -->|after return| B81
B81 -->|call| B178
B81 -->|after return| B82
B82 -->|call| B196
B82 -->|after return| B83
B83 -->|call| B61
B83 -->|after return| B84
B84 -->|call| B178
B84 -->|after return| B85
B85 -->|call| B196
B85 -->|after return| B86
B87 -->|call| B191
B87 -->|after return| B88
B88 -->|call| B178
B88 -->|after return| B89
B89 -->|call| B196
B89 -->|after return| B90
B61["Continue at B62 in section 7"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B191["Continue at B192 in section 20"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL DELAY
```

### B82

```asm
Mov a, #80H
acall cmd
```

### B83

```asm
mov dptr, #STR3
acall WSTR
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
mov a, #0C0H
acall cmd
```

### B86

```asm
mov dptr, #STR33
acall WSTR
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
mov a, #80H
acall cmd
```

### B90

```asm
mov dptr, #STR4
acall WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 184 to 184"]
B91["B92: instructions - lines 186 to 187"]
B92["B93: instructions - lines 188 to 192"]
B93["B94: instructions - lines 193 to 195"]
B94["B95: instructions - lines 196 to 196"]
B95["B96: instructions - lines 198 to 199"]
B96["B97: instructions - lines 200 to 204"]
B97["B98: instructions - lines 205 to 207"]
B98["B99: instructions - lines 208 to 208"]
B99["B100: instructions - lines 210 to 210"]
B90 -->|call| B61
B90 -->|after return| B91
B91 -->|call| B178
B91 -->|after return| B92
B92 -->|call| B173
B92 -->|after return| B93
B93 -->|call| B173
B93 -->|after return| B94
B94 -->|call| B61
B94 -->|after return| B95
B95 -->|call| B178
B95 -->|after return| B96
B96 -->|call| B173
B96 -->|after return| B97
B97 -->|call| B173
B97 -->|after return| B98
B98 -->|call| B61
B98 -->|after return| B99
B99 -->|call| B191
B99 -->|after return| B100
B61["Continue at B62 in section 7"]
B178["Continue at B179 in section 18"]
B173["Continue at B174 in section 18"]
B191["Continue at B192 in section 20"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL DELAY
```

### B92

```asm
mov a, #0C0H
acall cmd
```

### B93

```asm
mov a,40H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B94

```asm
mov a,b
add a,#30h
acall wchr
```

### B95

```asm
ACALL DELAY
```

### B96

```asm
mov a, #0C8H
acall cmd
```

### B97

```asm
mov a,41H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B98

```asm
mov a,b
add a,#30h
acall wchr
```

### B99

```asm
ACALL DELAY
```

### B100

```asm
ACALL CLEAR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 211 to 212"]
B101["B102: instructions - lines 213 to 214"]
B102["B103: instructions - lines 215 to 215"]
B103["B104: instructions - lines 217 to 218"]
B104["B105: instructions - lines 219 to 223"]
B105["B106: instructions - lines 224 to 226"]
B106["B107: instructions - lines 227 to 227"]
B107["B108: instructions - lines 228 to 228"]
B108["B109: READ1 - lines 231 to 231"]
B109["B110: instructions - lines 232 to 233"]
B100 -->|call| B178
B100 -->|after return| B101
B101 -->|call| B196
B101 -->|after return| B102
B102 -->|call| B61
B102 -->|after return| B103
B103 -->|call| B178
B103 -->|after return| B104
B104 -->|call| B173
B104 -->|after return| B105
B105 -->|call| B173
B105 -->|after return| B106
B106 -->|call| B61
B106 -->|after return| B107
B108 -->|call| B191
B108 -->|after return| B109
B109 -->|call| B178
B109 -->|after return| B110
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B173["Continue at B174 in section 18"]
B191["Continue at B192 in section 20"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov a, #80H
acall cmd
```

### B102

```asm
mov dptr, #STR6
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
mov a,42H
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

Return to the instruction following the active call.

```asm
RET
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
B112["B113: instructions - lines 238 to 239"]
B113["B114: instructions - lines 240 to 240"]
B114["B115: instructions - lines 241 to 241"]
B115["B116: instructions - lines 242 to 244"]
B116["B117: READ2 - lines 247 to 247"]
B117["B118: instructions - lines 248 to 249"]
B118["B119: instructions - lines 250 to 251"]
B119["B120: instructions - lines 252 to 252"]
B110 -->|call| B196
B110 -->|after return| B111
B111 -->|call| B61
B111 -->|after return| B112
B112 -->|call| B178
B112 -->|after return| B113
B113 -->|call| B156
B113 -->|after return| B114
B114 -->|call| B173
B114 -->|after return| B115
B116 -->|call| B191
B116 -->|after return| B117
B117 -->|call| B178
B117 -->|after return| B118
B118 -->|call| B196
B118 -->|after return| B119
B119 -->|call| B61
B119 -->|after return| B120
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B178["Continue at B179 in section 18"]
B156["Continue at B157 in section 16"]
B173["Continue at B174 in section 18"]
B191["Continue at B192 in section 20"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov dptr, #STR7
acall WSTR
```

### B112

```asm
ACALL DELAY
```

### B113

```asm
MOV A, #0C8H
ACALL CMD
```

### B114

```asm
ACALL KEYPAD
```

### B115

```asm
ACALL WCHR
```

### B116

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV R1,A
RET
```

### B117

```asm
ACALL CLEAR
```

### B118

```asm
mov a, #80H
acall cmd
```

### B119

```asm
mov dptr, #STR8
acall WSTR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 254 to 255"]
B121["B122: instructions - lines 256 to 256"]
B122["B123: instructions - lines 257 to 257"]
B123["B124: instructions - lines 258 to 260"]
B124["B125: instructions - lines 261 to 261"]
B125["B126: instructions - lines 262 to 274"]
B126["B127: instructions - lines 275 to 279"]
B127["B128: instructions - lines 280 to 282"]
B128["B129: instructions - lines 285 to 285"]
B129["B130: READ3 - lines 288 to 288"]
B120 -->|call| B178
B120 -->|after return| B121
B121 -->|call| B156
B121 -->|after return| B122
B122 -->|call| B173
B122 -->|after return| B123
B123 -->|call| B156
B123 -->|after return| B124
B124 -->|call| B173
B124 -->|after return| B125
B125 -->|call| B178
B125 -->|after return| B126
B126 -->|call| B173
B126 -->|after return| B127
B127 -->|call| B173
B127 -->|after return| B128
B129 -->|call| B191
B129 -->|after return| B130
B178["Continue at B179 in section 18"]
B156["Continue at B157 in section 16"]
B173["Continue at B174 in section 18"]
B191["Continue at B192 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A, #0C1H
ACALL CMD
```

### B122

```asm
ACALL KEYPAD
```

### B123

```asm
ACALL WCHR
```

### B124

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B125

```asm
ACALL WCHR
```

### B126

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#10
MOV A,29H
MUL AB
ADD A,2AH
MOV 40H,A
DEC A
MOV 41H,A
MOV A, #0C8H
ACALL CMD
```

### B127

```asm
MOV A,41H
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B128

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
ACALL CLEAR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 289 to 289"]
B131["B132: instructions - lines 290 to 291"]
B132["B133: instructions - lines 292 to 293"]
B133["B134: instructions - lines 294 to 294"]
B134["B135: instructions - lines 295 to 296"]
B135["B136: instructions - lines 297 to 297"]
B136["B137: instructions - lines 298 to 298"]
B137["B138: instructions - lines 299 to 301"]
B138["B139: instructions - lines 302 to 302"]
B139["B140: instructions - lines 303 to 310"]
B130 -->|call| B61
B130 -->|after return| B131
B131 -->|call| B178
B131 -->|after return| B132
B132 -->|call| B61
B132 -->|after return| B133
B133 -->|call| B196
B133 -->|after return| B134
B134 -->|call| B178
B134 -->|after return| B135
B135 -->|call| B156
B135 -->|after return| B136
B136 -->|call| B173
B136 -->|after return| B137
B137 -->|call| B156
B137 -->|after return| B138
B138 -->|call| B173
B138 -->|after return| B139
B61["Continue at B62 in section 7"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B156["Continue at B157 in section 16"]
B173["Continue at B174 in section 18"]
```

### B131

```asm
ACALL DELAY
```

### B132

```asm
mov a, #80H
acall cmd
```

### B133

```asm
mov dptr, #STR10
ACALL DELAY
```

### B134

```asm
ACALL WSTR
```

### B135

```asm
MOV A, #0C8H
ACALL CMD
```

### B136

```asm
ACALL KEYPAD
```

### B137

```asm
ACALL WCHR
```

### B138

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B139

```asm
ACALL WCHR
```

### B140

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#16
MOV A,29H
MUL AB
ADD A,2AH
MOV 50H,A
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: WRITE4 - lines 313 to 313"]
B141["B142: instructions - lines 314 to 315"]
B142["B143: instructions - lines 316 to 317"]
B143["B144: instructions - lines 318 to 318"]
B144["B145: instructions - lines 320 to 321"]
B145["B146: instructions - lines 322 to 326"]
B146["B147: instructions - lines 327 to 329"]
B147["B148: instructions - lines 330 to 330"]
B148["B149: instructions - lines 333 to 333"]
B149["B150: instructions - lines 334 to 335"]
B140 -->|call| B191
B140 -->|after return| B141
B141 -->|call| B178
B141 -->|after return| B142
B142 -->|call| B196
B142 -->|after return| B143
B143 -->|call| B61
B143 -->|after return| B144
B144 -->|call| B178
B144 -->|after return| B145
B145 -->|call| B173
B145 -->|after return| B146
B146 -->|call| B173
B146 -->|after return| B147
B147 -->|call| B61
B147 -->|after return| B148
B148 -->|call| B191
B148 -->|after return| B149
B149 -->|call| B178
B149 -->|after return| B150
B191["Continue at B192 in section 20"]
B178["Continue at B179 in section 18"]
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B173["Continue at B174 in section 18"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL CLEAR
```

### B142

```asm
mov a, #80H
acall cmd
```

### B143

```asm
mov dptr, #STR5
acall WSTR
```

### B144

```asm
ACALL DELAY
```

### B145

```asm
mov a, #0C0H
acall cmd
```

### B146

```asm
mov a,50H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B147

```asm
mov a,b
add a,#30h
acall wchr
```

### B148

```asm
ACALL DELAY
```

### B149

```asm
ACALL CLEAR
```

### B150

```asm
mov a, #80H
acall cmd
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 336 to 337"]
B151["B152: instructions - lines 338 to 338"]
B152["B153: instructions - lines 340 to 341"]
B153["B154: instructions - lines 342 to 344"]
B154["B155: instructions - lines 345 to 345"]
B155["B156: instructions - lines 346 to 346"]
B156["B157: KEYPAD - lines 349 to 349"]
B157["B158: K1 - lines 350 to 353"]
B158["B159: K2 - lines 355 to 357"]
B159["B160: instructions - lines 358 to 358"]
B150 -->|call| B196
B150 -->|after return| B151
B151 -->|call| B61
B151 -->|after return| B152
B152 -->|call| B178
B152 -->|after return| B153
B153 -->|call| B173
B153 -->|after return| B154
B154 -->|call| B61
B154 -->|after return| B155
B156 -->|next| B157
B157 -->|condition true| B157
B157 -->|condition false| B158
B158 -->|condition true| B160
B158 -->|condition false| B159
B159 -->|jump| B158
B196["Continue at B197 in section 20"]
B61["Continue at B62 in section 7"]
B178["Continue at B179 in section 18"]
B173["Continue at B174 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
mov dptr, #STR6
acall WSTR
```

### B152

```asm
ACALL DELAY
```

### B153

```asm
mov a, #0C0H
acall cmd
```

### B154

```asm
mov a,51H
add a,#30h
acall wchr
```

### B155

```asm
ACALL DELAY
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
MOV P0,#01110000B
```

### B158

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B159

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B160

```asm
SJMP K2
```

## Section 17

```mermaid
flowchart TD
B160["B161: OVER1 - lines 360 to 363"]
B161["B162: instructions - lines 364 to 367"]
B162["B163: instructions - lines 368 to 371"]
B163["B164: instructions - lines 372 to 375"]
B164["B165: instructions - lines 376 to 376"]
B165["B166: ROW_0 - lines 377 to 378"]
B166["B167: ROW_1 - lines 379 to 380"]
B167["B168: ROW_2 - lines 381 to 382"]
B168["B169: ROW_3 - lines 383 to 383"]
B169["B170: FIND - lines 385 to 385"]
B160 -->|condition true| B165
B160 -->|condition false| B161
B161 -->|condition true| B166
B161 -->|condition false| B162
B162 -->|condition true| B167
B162 -->|condition false| B163
B163 -->|condition true| B168
B163 -->|condition false| B164
B164 -->|jump| B158
B165 -->|jump| B169
B166 -->|jump| B169
B167 -->|jump| B169
B168 -->|next| B169
B169 -->|next| B170
B158["Continue at B159 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B162

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B163

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B164

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B165

```asm
LJMP K2
```

### B166

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B167

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B168

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B169

```asm
MOV DPTR,#KCODE3
```

### B170

```asm
RLC A
```

## Section 18

```mermaid
flowchart TD
B170["B171: FIND1 - lines 387 to 388"]
B171["B172: instructions - lines 389 to 390"]
B172["B173: MATCH - lines 391 to 393"]
B173["B174: WCHR - lines 396 to 400"]
B174["B175: instructions - lines 401 to 401"]
B175["B176: instructions - lines 402 to 404"]
B176["B177: instructions - lines 405 to 405"]
B177["B178: instructions - lines 406 to 408"]
B178["B179: CMD - lines 411 to 413"]
B179["B180: instructions - lines 414 to 414"]
B170 -->|condition true| B172
B170 -->|condition false| B171
B171 -->|jump| B170
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
B183["Continue at B184 in section 19"]
B189["Continue at B190 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
RLC A
JNC MATCH
```

### B172

```asm
INC DPTR
SJMP FIND1
```

### B173

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
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
B180["B181: instructions - lines 415 to 417"]
B181["B182: instructions - lines 418 to 418"]
B182["B183: instructions - lines 419 to 419"]
B183["B184: COMMON - lines 422 to 427"]
B184["B185: INLCD - lines 430 to 437"]
B185["B186: instructions - lines 438 to 446"]
B186["B187: instructions - lines 447 to 459"]
B187["B188: instructions - lines 460 to 470"]
B188["B189: instructions - lines 471 to 471"]
B189["B190: LDELAY - lines 474 to 475"]
B180 -->|call| B183
B180 -->|after return| B181
B181 -->|call| B189
B181 -->|after return| B182
B184 -->|call| B189
B184 -->|after return| B185
B185 -->|call| B189
B185 -->|after return| B186
B186 -->|call| B189
B186 -->|after return| B187
B187 -->|call| B189
B187 -->|after return| B188
B189 -->|condition true| B189
B189 -->|condition false| B190
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
CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B186

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

### B187

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

### B188

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

### B189

Return to the instruction following the active call.

```asm
RET
```

### B190

```asm
MOV R0, #50
DJNZ R0, $
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 476 to 476"]
B191["B192: CLEAR - lines 479 to 480"]
B192["B193: instructions - lines 481 to 481"]
B193["B194: WAIT - lines 482 to 482"]
B194["B195: instructions - lines 483 to 483"]
B195["B196: instructions - lines 484 to 484"]
B196["B197: WSTR - lines 487 to 487"]
B197["B198: CONT1 - lines 489 to 491"]
B198["B199: PRINT - lines 493 to 493"]
B199["B200: instructions - lines 494 to 495"]
B191 -->|call| B178
B191 -->|after return| B192
B192 -->|next| B193
B193 -->|call| B189
B193 -->|after return| B194
B194 -->|condition true| B193
B194 -->|condition false| B195
B196 -->|next| B197
B197 -->|condition true| B200
B197 -->|condition false| B198
B198 -->|call| B173
B198 -->|after return| B199
B199 -->|jump| B197
B178["Continue at B179 in section 18"]
B189["Continue at B190 in section 19"]
B200["Continue at B201 in section 21"]
B173["Continue at B174 in section 18"]
```

### B191

Return to the instruction following the active call.

```asm
RET
```

### B192

```asm
MOV A,#01H
ACALL CMD
```

### B193

```asm
MOV R7,#14
```

### B194

```asm
ACALL LDELAY
```

### B195

```asm
DJNZ R7,WAIT
```

### B196

Return to the instruction following the active call.

```asm
ret
```

### B197

```asm
PUSH    ACC
```

### B198

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B199

```asm
ACALL    WCHR
```

### B200

```asm
INC DPTR
AJMP    CONT1
```

## Section 21

```mermaid
flowchart TD
B200["B201: EXIT1 - lines 496 to 497"]
```

### B201

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
