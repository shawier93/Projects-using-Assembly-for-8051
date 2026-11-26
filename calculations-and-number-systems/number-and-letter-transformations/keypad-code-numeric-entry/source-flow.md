# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 03H` begins at B2.
- `ORG 30h` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 10 to 10"]
B1["B2: instructions - lines 12 to 12"]
B2["B3: MAIN - lines 17 to 17"]
B3["B4: instructions - lines 18 to 19"]
B4["B5: instructions - lines 20 to 20"]
B5["B6: AGAIN - lines 21 to 21"]
B6["B7: instructions - lines 22 to 22"]
B7["B8: instructions - lines 23 to 24"]
B8["B9: START - lines 30 to 30"]
B9["B10: instructions - lines 31 to 32"]
B0 -->|jump| B2
B1 -->|jump| B8
B2 -->|call| B170
B2 -->|after return| B3
B3 -->|call| B197
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B206
B5 -->|after return| B6
B6 -->|condition true| B5
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|call| B170
B8 -->|after return| B9
B9 -->|call| B197
B9 -->|after return| B10
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B206["Continue at B207 in section 21"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
Ljmp Main
```

### B2

```asm
LJMP START
```

### B3

```asm
LCALL INLCD
```

### B4

```asm
MOV DPTR,#Welcome
LCALL WSTR
```

### B5

```asm
mov r5,#2
```

### B6

```asm
lcall delay
```

### B7

```asm
djnz r5,again
```

### B8

```asm
MOV IE,#10000001B
SETB IT0
```

### B9

```asm
LCALL INLCD
```

### B10

```asm
MOV DPTR,#ONE
LCALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 33"]
B11["B12: AGAIN3 - lines 34 to 34"]
B12["B13: instructions - lines 35 to 35"]
B13["B14: instructions - lines 36 to 37"]
B14["B15: instructions - lines 38 to 39"]
B15["B16: instructions - lines 40 to 40"]
B16["B17: instructions - lines 41 to 42"]
B17["B18: instructions - lines 43 to 43"]
B18["B19: AGAIN4 - lines 44 to 44"]
B19["B20: instructions - lines 45 to 45"]
B10 -->|next| B11
B11 -->|call| B206
B11 -->|after return| B12
B12 -->|condition true| B11
B12 -->|condition false| B13
B13 -->|call| B190
B13 -->|after return| B14
B14 -->|call| B190
B14 -->|after return| B15
B15 -->|call| B202
B15 -->|after return| B16
B16 -->|call| B197
B16 -->|after return| B17
B17 -->|next| B18
B18 -->|call| B206
B18 -->|after return| B19
B19 -->|condition true| B18
B19 -->|condition false| B20
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B202["Continue at B203 in section 21"]
B197["Continue at B198 in section 20"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
mov r5,#2
```

### B12

```asm
lcall delay
```

### B13

```asm
djnz r5,again3
```

### B14

```asm
mov a,#0CH
acall cmd
```

### B15

```asm
mov a,#0h
acall cmd
```

### B16

```asm
acall ldelay
```

### B17

```asm
MOV DPTR,#ONE_
LCALL WSTR
```

### B18

```asm
mov r5,#3
```

### B19

```asm
lcall delay
```

### B20

```asm
djnz r5,again4
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 46 to 46"]
B21["B22: instructions - lines 47 to 48"]
B22["B23: instructions - lines 49 to 49"]
B23["B24: AGAIN5 - lines 50 to 50"]
B24["B25: instructions - lines 51 to 51"]
B25["B26: instructions - lines 52 to 53"]
B26["B27: instructions - lines 54 to 55"]
B27["B28: instructions - lines 56 to 56"]
B28["B29: instructions - lines 57 to 58"]
B29["B30: instructions - lines 59 to 59"]
B20 -->|call| B170
B20 -->|after return| B21
B21 -->|call| B197
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|call| B206
B23 -->|after return| B24
B24 -->|condition true| B23
B24 -->|condition false| B25
B25 -->|call| B190
B25 -->|after return| B26
B26 -->|call| B190
B26 -->|after return| B27
B27 -->|call| B202
B27 -->|after return| B28
B28 -->|call| B197
B28 -->|after return| B29
B29 -->|next| B30
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B202["Continue at B203 in section 21"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
LCALL INLCD
```

### B22

```asm
MOV DPTR,#TWO
LCALL WSTR
```

### B23

```asm
mov r5,#2
```

### B24

```asm
lcall delay
```

### B25

```asm
djnz r5,again5
```

### B26

```asm
mov a,#0CH
acall cmd
```

### B27

```asm
mov a,#0h
acall cmd
```

### B28

```asm
acall ldelay
```

### B29

```asm
MOV DPTR,#TWOL
LCALL WSTR
```

### B30

```asm
mov r5,#3
```

## Section 4

```mermaid
flowchart TD
B30["B31: AGAIN6 - lines 60 to 60"]
B31["B32: instructions - lines 61 to 61"]
B32["B33: instructions - lines 62 to 62"]
B33["B34: instructions - lines 63 to 64"]
B34["B35: instructions - lines 65 to 65"]
B35["B36: AGAIN7 - lines 66 to 66"]
B36["B37: instructions - lines 67 to 67"]
B37["B38: instructions - lines 68 to 68"]
B38["B39: instructions - lines 69 to 70"]
B39["B40: instructions - lines 71 to 71"]
B30 -->|call| B206
B30 -->|after return| B31
B31 -->|condition true| B30
B31 -->|condition false| B32
B32 -->|call| B170
B32 -->|after return| B33
B33 -->|call| B197
B33 -->|after return| B34
B34 -->|next| B35
B35 -->|call| B206
B35 -->|after return| B36
B36 -->|condition true| B35
B36 -->|condition false| B37
B37 -->|call| B170
B37 -->|after return| B38
B38 -->|call| B197
B38 -->|after return| B39
B39 -->|next| B40
B206["Continue at B207 in section 21"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
lcall delay
```

### B32

```asm
djnz r5,again6
```

### B33

```asm
LCALL INLCD
```

### B34

```asm
MOV DPTR,#TWOD
LCALL WSTR
```

### B35

```asm
mov r5,#2
```

### B36

```asm
lcall delay
```

### B37

```asm
djnz r5,again7
```

### B38

```asm
LCALL INLCD
```

### B39

```asm
MOV DPTR,#EXITT
LCALL WSTR
```

### B40

```asm
mov r5,#2
```

## Section 5

```mermaid
flowchart TD
B40["B41: AGAIN8 - lines 72 to 72"]
B41["B42: instructions - lines 73 to 73"]
B42["B43: instructions - lines 74 to 74"]
B43["B44: instructions - lines 75 to 76"]
B44["B45: instructions - lines 77 to 77"]
B45["B46: AGAIN9 - lines 78 to 78"]
B46["B47: instructions - lines 79 to 79"]
B47["B48: instructions - lines 82 to 85"]
B48["B49: instructions - lines 86 to 86"]
B49["B50: instructions - lines 87 to 87"]
B40 -->|call| B206
B40 -->|after return| B41
B41 -->|condition true| B40
B41 -->|condition false| B42
B42 -->|call| B170
B42 -->|after return| B43
B43 -->|call| B197
B43 -->|after return| B44
B44 -->|next| B45
B45 -->|call| B206
B45 -->|after return| B46
B46 -->|condition true| B45
B46 -->|condition false| B47
B47 -->|call| B216
B47 -->|after return| B48
B48 -->|call| B192
B48 -->|after return| B49
B49 -->|next| B50
B206["Continue at B207 in section 21"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B216["Continue at B217 in section 22"]
B192["Continue at B193 in section 20"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
lcall delay
```

### B42

```asm
djnz r5,again8
```

### B43

```asm
LCALL INLCD
```

### B44

```asm
MOV DPTR,#ENTERSEL
LCALL WSTR
```

### B45

```asm
mov r5,#2
```

### B46

```asm
lcall delay
```

### B47

```asm
djnz r5,again9
```

### B48

```asm
mov a,#1
ACALL KEYPAD
```

### B49

```asm
ACALL WCHR
```

### B50

```asm
SUBB A,#30H
```

## Section 6

```mermaid
flowchart TD
B50["B51: OPTION2X - lines 92 to 92"]
B51["B52: instructions - lines 93 to 93"]
B52["B53: instructions - lines 94 to 95"]
B53["B54: instructions - lines 96 to 96"]
B54["B55: AGAIN6779 - lines 97 to 97"]
B55["B56: instructions - lines 98 to 98"]
B56["B57: instructions - lines 101 to 101"]
B57["B58: instructions - lines 102 to 102"]
B58["B59: instructions - lines 103 to 103"]
B59["B60: instructions - lines 104 to 105"]
B50 -->|condition true| B85
B50 -->|condition false| B51
B51 -->|call| B170
B51 -->|after return| B52
B52 -->|call| B197
B52 -->|after return| B53
B53 -->|next| B54
B54 -->|call| B206
B54 -->|after return| B55
B55 -->|condition true| B54
B55 -->|condition false| B56
B56 -->|call| B216
B56 -->|after return| B57
B57 -->|call| B192
B57 -->|after return| B58
B58 -->|condition true| B60
B58 -->|condition false| B59
B59 -->|next| B60
B85["Continue at B86 in section 9"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B206["Continue at B207 in section 21"]
B216["Continue at B217 in section 22"]
B192["Continue at B193 in section 20"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
cjne a,#2,exit
```

### B52

```asm
LCALL INLCD
```

### B53

```asm
MOV DPTR,#ENTERL
LCALL WSTR
```

### B54

```asm
mov r5,#2
```

### B55

```asm
lcall delay
```

### B56

```asm
djnz r5,again6779
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
CJNE A,#'Z',NOO
```

### B60

```asm
MOV A,#'A'
DEC A
```

## Section 7

```mermaid
flowchart TD
B60["B61: NOO - lines 107 to 112"]
B61["B62: instructions - lines 113 to 114"]
B62["B63: instructions - lines 115 to 115"]
B63["B64: instructions - lines 116 to 117"]
B64["B65: instructions - lines 118 to 118"]
B65["B66: AGAIN67579 - lines 119 to 119"]
B66["B67: instructions - lines 120 to 120"]
B67["B68: instructions - lines 123 to 123"]
B68["B69: instructions - lines 124 to 124"]
B69["B70: instructions - lines 125 to 131"]
B60 -->|call| B190
B60 -->|after return| B61
B61 -->|call| B190
B61 -->|after return| B62
B62 -->|call| B202
B62 -->|after return| B63
B63 -->|call| B197
B63 -->|after return| B64
B64 -->|next| B65
B65 -->|call| B206
B65 -->|after return| B66
B66 -->|condition true| B65
B66 -->|condition false| B67
B67 -->|call| B216
B67 -->|after return| B68
B68 -->|call| B192
B68 -->|after return| B69
B69 -->|next| B70
B190["Continue at B191 in section 20"]
B202["Continue at B203 in section 21"]
B197["Continue at B198 in section 20"]
B206["Continue at B207 in section 21"]
B216["Continue at B217 in section 22"]
B192["Continue at B193 in section 20"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
INC a
mov r7,a
MOV A,#0CH
ACALL CMD
```

### B62

```asm
MOV A,#0H
ACALL CMD
```

### B63

```asm
ACALL LDELAY
```

### B64

```asm
MOV DPTR,#ENTERD
LCALL WSTR
```

### B65

```asm
mov r5,#2
```

### B66

```asm
lcall delay
```

### B67

```asm
djnz r5,again67579
```

### B68

```asm
ACALL KEYPAD
```

### B69

```asm
ACALL WCHR
```

### B70

```asm
SUBB A,#30H
ADD A,#1
MOV 78H,A
mov r1,a
mov r0,#70h
mov a,r7
```

## Section 8

```mermaid
flowchart TD
B70["B71: X - lines 133 to 135"]
B71["B72: instructions - lines 136 to 136"]
B72["B73: instructions - lines 137 to 138"]
B73["B74: instructions - lines 139 to 139"]
B74["B75: AGAIN67879 - lines 140 to 140"]
B75["B76: instructions - lines 141 to 141"]
B76["B77: instructions - lines 142 to 143"]
B77["B78: instructions - lines 144 to 145"]
B78["B79: instructions - lines 146 to 146"]
B79["B80: CODEX - lines 149 to 150"]
B70 -->|condition true| B70
B70 -->|condition false| B71
B71 -->|call| B170
B71 -->|after return| B72
B72 -->|call| B197
B72 -->|after return| B73
B73 -->|next| B74
B74 -->|call| B206
B74 -->|after return| B75
B75 -->|condition true| B74
B75 -->|condition false| B76
B76 -->|call| B190
B76 -->|after return| B77
B77 -->|call| B190
B77 -->|after return| B78
B78 -->|call| B202
B78 -->|after return| B79
B79 -->|call| B192
B79 -->|after return| B80
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B202["Continue at B203 in section 21"]
B192["Continue at B193 in section 20"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov @r0,a
inc r0
djnz r1,x
```

### B72

```asm
ACALL INLCD
```

### B73

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B74

```asm
mov r5,#2
```

### B75

```asm
lcall delay
```

### B76

```asm
djnz r5,again67879
```

### B77

```asm
MOV A,#0CH
ACALL CMD
```

### B78

```asm
MOV A,#0H
ACALL CMD
```

### B79

```asm
ACALL LDELAY
```

### B80

```asm
MOV A,R7
ACALL WCHR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 151 to 151"]
B81["B82: AGAIN8454 - lines 152 to 152"]
B82["B83: instructions - lines 153 to 153"]
B83["B84: instructions - lines 154 to 154"]
B84["B85: instructions - lines 155 to 155"]
B85["B86: EXIT - lines 160 to 160"]
B86["B87: instructions - lines 161 to 161"]
B87["B88: instructions - lines 162 to 163"]
B88["B89: instructions - lines 164 to 164"]
B89["B90: AGAIN16 - lines 165 to 165"]
B80 -->|next| B81
B81 -->|call| B206
B81 -->|after return| B82
B82 -->|condition true| B81
B82 -->|condition false| B83
B83 -->|condition true| B79
B83 -->|condition false| B84
B84 -->|jump| B133
B85 -->|condition true| B93
B85 -->|condition false| B86
B86 -->|call| B170
B86 -->|after return| B87
B87 -->|call| B197
B87 -->|after return| B88
B88 -->|next| B89
B89 -->|call| B206
B89 -->|after return| B90
B206["Continue at B207 in section 21"]
B79["Continue at B80 in section 8"]
B133["Continue at B134 in section 14"]
B93["Continue at B94 in section 10"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov r5,#2
```

### B82

```asm
lcall delay
```

### B83

```asm
djnz r5,again8454
```

### B84

```asm
DJNZ 78H,CODEX
```

### B85

```asm
LJMP EXITORMENU
```

### B86

```asm
cjne a,#3,OPTION1
```

### B87

```asm
LCALL INLCD
```

### B88

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

### B89

```asm
mov r5,#2
```

### B90

```asm
lcall delay
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 166 to 166"]
B91["B92: S - lines 167 to 167"]
B92["B93: instructions - lines 168 to 168"]
B93["B94: OPTION1 - lines 174 to 174"]
B94["B95: instructions - lines 177 to 178"]
B95["B96: instructions - lines 179 to 179"]
B96["B97: AGAIN10 - lines 180 to 180"]
B97["B98: instructions - lines 181 to 181"]
B98["B99: instructions - lines 182 to 183"]
B99["B100: instructions - lines 184 to 185"]
B90 -->|condition true| B89
B90 -->|condition false| B91
B91 -->|jump| B91
B92 -->|jump| B237
B93 -->|call| B170
B93 -->|after return| B94
B94 -->|call| B197
B94 -->|after return| B95
B95 -->|next| B96
B96 -->|call| B206
B96 -->|after return| B97
B97 -->|condition true| B96
B97 -->|condition false| B98
B98 -->|call| B190
B98 -->|after return| B99
B99 -->|call| B190
B99 -->|after return| B100
B89["Continue at B90 in section 9"]
B237["Continue at B238 in section 24"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
djnz r5,again16
```

### B92

```asm
SJMP S
```

### B93

```asm
LJMP endofcode
```

### B94

```asm
LCALL INLCD
```

### B95

```asm
MOV DPTR,#ENTERC
LCALL WSTR
```

### B96

```asm
mov r5,#3
```

### B97

```asm
lcall delay
```

### B98

```asm
djnz r5,again10
```

### B99

```asm
MOV A,#0CH
LCALL CMD
```

### B100

```asm
MOV A,#2H
LCALL CMD
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 187 to 187"]
B101["B102: instructions - lines 188 to 188"]
B102["B103: instructions - lines 189 to 189"]
B103["B104: M - lines 193 to 196"]
B104["B105: T - lines 199 to 199"]
B105["B106: instructions - lines 200 to 200"]
B106["B107: instructions - lines 201 to 207"]
B107["B108: instructions - lines 208 to 208"]
B108["B109: MORE - lines 210 to 210"]
B109["B110: O - lines 213 to 213"]
B100 -->|call| B216
B100 -->|after return| B101
B101 -->|call| B192
B101 -->|after return| B102
B102 -->|next| B103
B103 -->|next| B104
B104 -->|call| B216
B104 -->|after return| B105
B105 -->|call| B192
B105 -->|after return| B106
B106 -->|condition true| B108
B106 -->|condition false| B107
B107 -->|jump| B109
B108 -->|next| B109
B109 -->|call| B216
B109 -->|after return| B110
B216["Continue at B217 in section 22"]
B192["Continue at B193 in section 20"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL KEYPAD
```

### B102

```asm
ACALL WCHR
```

### B103

```asm
SUBB A,#30H
```

### B104

```asm
mov b,#100
mul ab
mov r5,a
mov r6,b
```

### B105

```asm
ACALL KEYPAD
```

### B106

```asm
ACALL WCHR
```

### B107

```asm
SUBB A,#30H
mov b,#10
mul ab
add a,r5
mov r5,a
jc more
```

### B108

```asm
sjmp O
```

### B109

```asm
inc r6
```

### B110

```asm
ACALL KEYPAD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 214 to 214"]
B111["B112: instructions - lines 215 to 220"]
B112["B113: instructions - lines 221 to 221"]
B113["B114: MORE2 - lines 225 to 225"]
B114["B115: NEXTSTEP - lines 228 to 228"]
B115["B116: instructions - lines 229 to 229"]
B116["B117: EVENX - lines 231 to 237"]
B117["B118: instructions - lines 238 to 238"]
B118["B119: instructions - lines 239 to 240"]
B119["B120: instructions - lines 241 to 241"]
B110 -->|call| B192
B110 -->|after return| B111
B111 -->|condition true| B113
B111 -->|condition false| B112
B112 -->|jump| B114
B113 -->|next| B114
B114 -->|call| B169
B114 -->|after return| B115
B115 -->|condition true| B126
B115 -->|condition false| B116
B116 -->|call| B153
B116 -->|after return| B117
B117 -->|call| B170
B117 -->|after return| B118
B118 -->|call| B197
B118 -->|after return| B119
B119 -->|next| B120
B192["Continue at B193 in section 20"]
B169["Continue at B170 in section 17"]
B126["Continue at B127 in section 13"]
B153["Continue at B154 in section 16"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL WCHR
```

### B112

```asm
SUBB A,#30H
add a,r5
mov r5,a
jc more2
```

### B113

```asm
sjmp nextstep
```

### B114

```asm
inc r6
```

### B115

```asm
ACALL ENTERED_NUMER
```

### B116

```asm
jb acc.0,ODDX
```

### B117

```asm
MOV A,R5
subb a,#2
mov r5,a
mov r0,#3
LCALL PRINTOP2
```

### B118

```asm
LCALL INLCD
```

### B119

```asm
MOV DPTR,#EVENN
LCALL WSTR
```

### B120

```asm
mov r4,#3
```

## Section 13

```mermaid
flowchart TD
B120["B121: AGAIN1923 - lines 242 to 242"]
B121["B122: instructions - lines 243 to 243"]
B122["B123: FLASHING - lines 247 to 248"]
B123["B124: instructions - lines 249 to 250"]
B124["B125: instructions - lines 251 to 251"]
B125["B126: instructions - lines 252 to 252"]
B126["B127: ODDX - lines 255 to 260"]
B127["B128: instructions - lines 261 to 261"]
B128["B129: instructions - lines 262 to 263"]
B129["B130: FLASHING2 - lines 267 to 268"]
B120 -->|call| B206
B120 -->|after return| B121
B121 -->|condition true| B120
B121 -->|condition false| B122
B122 -->|call| B206
B122 -->|after return| B123
B123 -->|call| B206
B123 -->|after return| B124
B124 -->|condition true| B122
B124 -->|condition false| B125
B125 -->|call| B133
B125 -->|after return| B126
B126 -->|call| B153
B126 -->|after return| B127
B127 -->|call| B170
B127 -->|after return| B128
B128 -->|call| B197
B128 -->|after return| B129
B129 -->|call| B206
B129 -->|after return| B130
B206["Continue at B207 in section 21"]
B133["Continue at B134 in section 14"]
B153["Continue at B154 in section 16"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
lcall delay
```

### B122

```asm
djnz r4,again1923
```

### B123

```asm
mov p3,#0
acall delay
```

### B124

```asm
mov p3,#0ffh
acall delay
```

### B125

```asm
djnz r0,flashing
```

### B126

```asm
ACALL exitORmenu
```

### B127

```asm
MOV A,R5
add a,#2
mov r5,a
mov r0,#2
LCALL PRINTOP2
```

### B128

```asm
LCALL INLCD
```

### B129

```asm
MOV DPTR,#ODDD
LCALL WSTR
```

### B130

```asm
mov p3,#0
acall delay
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 269 to 270"]
B131["B132: instructions - lines 271 to 271"]
B132["B133: instructions - lines 272 to 272"]
B133["B134: EXITORMENU - lines 278 to 278"]
B134["B135: instructions - lines 279 to 280"]
B135["B136: instructions - lines 281 to 281"]
B136["B137: AGAIN17 - lines 282 to 282"]
B137["B138: instructions - lines 283 to 283"]
B138["B139: instructions - lines 284 to 285"]
B139["B140: instructions - lines 286 to 287"]
B130 -->|call| B206
B130 -->|after return| B131
B131 -->|condition true| B129
B131 -->|condition false| B132
B132 -->|call| B133
B132 -->|after return| B133
B133 -->|call| B170
B133 -->|after return| B134
B134 -->|call| B197
B134 -->|after return| B135
B135 -->|next| B136
B136 -->|call| B206
B136 -->|after return| B137
B137 -->|condition true| B136
B137 -->|condition false| B138
B138 -->|call| B190
B138 -->|after return| B139
B139 -->|call| B190
B139 -->|after return| B140
B206["Continue at B207 in section 21"]
B129["Continue at B130 in section 13"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B190["Continue at B191 in section 20"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov p3,#0ffh
acall delay
```

### B132

```asm
djnz r0,flashing2
```

### B133

```asm
ACALL exitORmenu
```

### B134

```asm
LCALL INLCD
```

### B135

```asm
MOV DPTR,#EXIT_MEN
LCALL WSTR
```

### B136

```asm
mov r5,#3
```

### B137

```asm
lcall delay
```

### B138

```asm
djnz r5,again17
```

### B139

```asm
MOV A,#0CH
LCALL CMD
```

### B140

```asm
MOV A,#0H
LCALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 288 to 288"]
B141["B142: instructions - lines 289 to 290"]
B142["B143: instructions - lines 293 to 293"]
B143["B144: instructions - lines 294 to 294"]
B144["B145: instructions - lines 296 to 296"]
B145["B146: instructions - lines 297 to 297"]
B146["B147: EXITTT - lines 300 to 300"]
B147["B148: instructions - lines 301 to 302"]
B148["B149: instructions - lines 303 to 303"]
B149["B150: AGAIN166 - lines 304 to 304"]
B140 -->|call| B202
B140 -->|after return| B141
B141 -->|call| B197
B141 -->|after return| B142
B142 -->|call| B216
B142 -->|after return| B143
B143 -->|call| B192
B143 -->|after return| B144
B144 -->|condition true| B146
B144 -->|condition false| B145
B145 -->|jump| B8
B146 -->|call| B170
B146 -->|after return| B147
B147 -->|call| B197
B147 -->|after return| B148
B148 -->|next| B149
B149 -->|call| B206
B149 -->|after return| B150
B202["Continue at B203 in section 21"]
B197["Continue at B198 in section 20"]
B216["Continue at B217 in section 22"]
B192["Continue at B193 in section 20"]
B8["Continue at B9 in section 1"]
B170["Continue at B171 in section 18"]
B206["Continue at B207 in section 21"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
LCALL LDELAY
```

### B142

```asm
MOV DPTR,#EXIT_MENU
LCALL WSTR
```

### B143

```asm
ACALL KEYPAD
```

### B144

```asm
ACALL WCHR
```

### B145

```asm
CJNE A,#'0',EXITTT
```

### B146

```asm
AJMP MENU
```

### B147

```asm
LCALL INLCD
```

### B148

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

### B149

```asm
mov r5,#2
```

### B150

```asm
lcall delay
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 305 to 305"]
B151["B152: SSS - lines 306 to 306"]
B152["B153: instructions - lines 310 to 310"]
B153["B154: PRINTOP2 - lines 315 to 315"]
B154["B155: instructions - lines 316 to 317"]
B155["B156: instructions - lines 319 to 334"]
B156["B157: instructions - lines 335 to 336"]
B157["B158: instructions - lines 337 to 338"]
B158["B159: instructions - lines 339 to 340"]
B159["B160: instructions - lines 341 to 342"]
B150 -->|condition true| B149
B150 -->|condition false| B151
B151 -->|jump| B151
B153 -->|call| B170
B153 -->|after return| B154
B154 -->|call| B197
B154 -->|after return| B155
B155 -->|call| B190
B155 -->|after return| B156
B156 -->|call| B190
B156 -->|after return| B157
B157 -->|call| B192
B157 -->|after return| B158
B158 -->|call| B190
B158 -->|after return| B159
B159 -->|call| B190
B159 -->|after return| B160
B149["Continue at B150 in section 15"]
B170["Continue at B171 in section 18"]
B197["Continue at B198 in section 20"]
B190["Continue at B191 in section 20"]
B192["Continue at B193 in section 20"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
djnz r5,again166
```

### B152

```asm
SJMP SSS
```

### B153

Return to the instruction following the active call.

```asm
ret
```

### B154

```asm
LCALL INLCD
```

### B155

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B156

```asm
MOV A,r5
MOV B,#100
DIV AB
ADD A,#30H
MOV 32h,A
MOV A,B
MOV B,#10
DIV AB
ADD A,#30H
MOV 33H,A
MOV A,B
ADD A,#30H
MOV 34H,A
MOV A,#0CH
LCALL CMD
```

### B157

```asm
MOV A,#1H
LCALL CMD
```

### B158

```asm
MOV A,32H
LCALL WCHR
```

### B159

```asm
MOV A,#0CH
LCALL CMD
```

### B160

```asm
MOV A,#2H
LCALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 343 to 343"]
B161["B162: instructions - lines 344 to 345"]
B162["B163: instructions - lines 346 to 347"]
B163["B164: instructions - lines 348 to 349"]
B164["B165: instructions - lines 350 to 351"]
B165["B166: instructions - lines 352 to 352"]
B166["B167: instructions - lines 353 to 353"]
B167["B168: instructions - lines 354 to 354"]
B168["B169: instructions - lines 357 to 357"]
B169["B170: ENTERED_NUMER - lines 361 to 387"]
B160 -->|call| B202
B160 -->|after return| B161
B161 -->|call| B192
B161 -->|after return| B162
B162 -->|call| B190
B162 -->|after return| B163
B163 -->|call| B190
B163 -->|after return| B164
B164 -->|call| B192
B164 -->|after return| B165
B165 -->|call| B206
B165 -->|after return| B166
B166 -->|call| B206
B166 -->|after return| B167
B167 -->|call| B206
B167 -->|after return| B168
B202["Continue at B203 in section 21"]
B192["Continue at B193 in section 20"]
B190["Continue at B191 in section 20"]
B206["Continue at B207 in section 21"]
```

### B161

```asm
LCALL LDELAY
```

### B162

```asm
MOV A,33H
LCALL WCHR
```

### B163

```asm
MOV A,#0CH
LCALL CMD
```

### B164

```asm
MOV A,#3H
LCALL CMD
```

### B165

```asm
MOV A,34H
LCALL WCHR
```

### B166

```asm
LCALL DELAY
```

### B167

```asm
LCALL DELAY
```

### B168

```asm
LCALL DELAY
```

### B169

Return to the instruction following the active call.

```asm
RET
```

### B170

Return to the instruction following the active call.

```asm
MOV A,r5
MOV B,#100
DIV AB
MOV 32h,A
MOV A,B
MOV B,#10
DIV AB
MOV 33H,A
MOV A,B
MOV 34H,A
MOV A,34H
MOV B,#100
MUL AB
MOV 77H,A
MOV B,#10
MOV A,33H
MUL AB
ADD A,77H
ADD A,32H
MOV 77H,A
MOV R5,A
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: INLCD - lines 390 to 391"]
B171["B172: WAIT - lines 393 to 393"]
B172["B173: instructions - lines 394 to 394"]
B173["B174: instructions - lines 395 to 397"]
B174["B175: instructions - lines 398 to 398"]
B175["B176: instructions - lines 399 to 400"]
B176["B177: instructions - lines 401 to 402"]
B177["B178: instructions - lines 403 to 404"]
B178["B179: instructions - lines 405 to 406"]
B179["B180: instructions - lines 407 to 408"]
B170 -->|next| B171
B171 -->|call| B202
B171 -->|after return| B172
B172 -->|condition true| B171
B172 -->|condition false| B173
B173 -->|call| B190
B173 -->|after return| B174
B174 -->|call| B202
B174 -->|after return| B175
B175 -->|call| B190
B175 -->|after return| B176
B176 -->|call| B190
B176 -->|after return| B177
B177 -->|call| B190
B177 -->|after return| B178
B178 -->|call| B190
B178 -->|after return| B179
B179 -->|call| B190
B179 -->|after return| B180
B202["Continue at B203 in section 21"]
B190["Continue at B191 in section 20"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
PUSH 7
MOV R7,#20
```

### B172

```asm
ACALL LDELAY
```

### B173

```asm
DJNZ R7,WAIT
```

### B174

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B175

```asm
ACALL LDELAY
```

### B176

```asm
MOV A,#0011B
ACALL CMD
```

### B177

```asm
MOV A,#0011B
ACALL CMD
```

### B178

```asm
MOV A,#0010B
ACALL CMD
```

### B179

```asm
MOV A,#0010B
ACALL CMD
```

### B180

```asm
MOV A,#1000B
ACALL CMD
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 409 to 410"]
B181["B182: instructions - lines 411 to 412"]
B182["B183: instructions - lines 413 to 415"]
B183["B184: instructions - lines 416 to 417"]
B184["B185: instructions - lines 418 to 418"]
B185["B186: instructions - lines 419 to 420"]
B186["B187: instructions - lines 421 to 422"]
B187["B188: instructions - lines 423 to 424"]
B188["B189: instructions - lines 425 to 426"]
B189["B190: instructions - lines 427 to 428"]
B180 -->|call| B190
B180 -->|after return| B181
B181 -->|call| B190
B181 -->|after return| B182
B182 -->|call| B190
B182 -->|after return| B183
B183 -->|call| B190
B183 -->|after return| B184
B184 -->|call| B202
B184 -->|after return| B185
B185 -->|call| B190
B185 -->|after return| B186
B186 -->|call| B190
B186 -->|after return| B187
B187 -->|call| B190
B187 -->|after return| B188
B188 -->|call| B190
B188 -->|after return| B189
B190["Continue at B191 in section 20"]
B202["Continue at B203 in section 21"]
```

### B181

```asm
MOV A,#0000B
ACALL CMD
```

### B182

```asm
MOV A,#1000B
ACALL CMD
```

### B183

```asm
MOV A,#0
ACALL CMD
```

### B184

```asm
MOV A,#0001B
ACALL CMD
```

### B185

```asm
ACALL LDELAY
```

### B186

```asm
MOV A,#0000B
ACALL CMD
```

### B187

```asm
MOV A,#0110B
ACALL CMD
```

### B188

```asm
MOV A,#0000B
ACALL CMD
```

### B189

```asm
MOV A,#1111B
ACALL CMD
```

### B190

Return to the instruction following the active call.

```asm
POP 7
RET
```

## Section 20

```mermaid
flowchart TD
B190["B191: CMD - lines 433 to 434"]
B191["B192: instructions - lines 435 to 435"]
B192["B193: WCHR - lines 438 to 443"]
B193["B194: instructions - lines 444 to 445"]
B194["B195: instructions - lines 446 to 448"]
B195["B196: COMMON - lines 451 to 458"]
B196["B197: instructions - lines 460 to 460"]
B197["B198: WSTR - lines 463 to 463"]
B198["B199: CONT1 - lines 465 to 467"]
B199["B200: instructions - lines 468 to 468"]
B190 -->|call| B195
B190 -->|after return| B191
B192 -->|call| B195
B192 -->|after return| B193
B193 -->|call| B195
B193 -->|after return| B194
B195 -->|call| B202
B195 -->|after return| B196
B197 -->|next| B198
B198 -->|condition true| B201
B198 -->|condition false| B199
B199 -->|call| B192
B199 -->|after return| B200
B202["Continue at B203 in section 21"]
B201["Continue at B202 in section 21"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
CLR RS
ACALL COMMON
```

### B192

Return to the instruction following the active call.

```asm
RET
```

### B193

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B194

```asm
MOV A,B
ACALL COMMON
```

### B195

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B196

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

### B197

Return to the instruction following the active call.

```asm
RET
```

### B198

```asm
PUSH ACC
```

### B199

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B200

```asm
ACALL WCHR
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 469 to 470"]
B201["B202: EXIT1 - lines 472 to 473"]
B202["B203: LDELAY - lines 476 to 478"]
B203["B204: CON4 - lines 480 to 481"]
B204["B205: instructions - lines 482 to 482"]
B205["B206: instructions - lines 483 to 485"]
B206["B207: DELAY - lines 487 to 490"]
B207["B208: X36 - lines 491 to 491"]
B208["B209: X26 - lines 492 to 492"]
B209["B210: X16 - lines 493 to 493"]
B200 -->|jump| B198
B202 -->|next| B203
B203 -->|condition true| B203
B203 -->|condition false| B204
B204 -->|condition true| B203
B204 -->|condition false| B205
B206 -->|next| B207
B207 -->|next| B208
B208 -->|next| B209
B209 -->|condition true| B209
B209 -->|condition false| B210
B198["Continue at B199 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
INC DPTR
AJMP CONT1
```

### B202

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B203

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B204

```asm
MOV R0,#250
DJNZ R0,$
```

### B205

```asm
DJNZ R1,CON4
```

### B206

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B207

```asm
PUSH 5
PUSH 4
PUSH 3
MOV R5,#2
```

### B208

```asm
MOV R4,#10
```

### B209

```asm
MOV R3,#250
```

### B210

```asm
DJNZ R3,X16
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 494 to 494"]
B211["B212: instructions - lines 495 to 495"]
B212["B213: instructions - lines 496 to 499"]
B213["B214: TMSEC - lines 501 to 504"]
B214["B215: BACK - lines 505 to 505"]
B215["B216: instructions - lines 506 to 508"]
B216["B217: KEYPAD - lines 512 to 512"]
B217["B218: K1 - lines 514 to 517"]
B218["B219: K2 - lines 519 to 519"]
B219["B220: instructions - lines 520 to 522"]
B210 -->|condition true| B208
B210 -->|condition false| B211
B211 -->|condition true| B207
B211 -->|condition false| B212
B213 -->|next| B214
B214 -->|condition true| B214
B214 -->|condition false| B215
B216 -->|next| B217
B217 -->|condition true| B217
B217 -->|condition false| B218
B218 -->|call| B213
B218 -->|after return| B219
B219 -->|condition true| B221
B219 -->|condition false| B220
B208["Continue at B209 in section 21"]
B207["Continue at B208 in section 21"]
B221["Continue at B222 in section 23"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
DJNZ R4,X26
```

### B212

```asm
DJNZ R5,X36
```

### B213

Return to the instruction following the active call.

```asm
POP 3
POP 4
POP 5
RET
```

### B214

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B215

```asm
JNB TF0,BACK
```

### B216

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B217

```asm
MOV P2,#11110000B
```

### B218

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B219

```asm
ACALL TMSEC
```

### B220

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 523 to 523"]
B221["B222: OVER - lines 526 to 526"]
B222["B223: instructions - lines 527 to 529"]
B223["B224: instructions - lines 530 to 530"]
B224["B225: OVER1 - lines 533 to 536"]
B225["B226: instructions - lines 538 to 541"]
B226["B227: instructions - lines 543 to 546"]
B227["B228: instructions - lines 548 to 551"]
B228["B229: instructions - lines 553 to 553"]
B229["B230: ROW_0 - lines 555 to 556"]
B220 -->|jump| B218
B221 -->|call| B213
B221 -->|after return| B222
B222 -->|condition true| B224
B222 -->|condition false| B223
B223 -->|jump| B218
B224 -->|condition true| B229
B224 -->|condition false| B225
B225 -->|condition true| B230
B225 -->|condition false| B226
B226 -->|condition true| B231
B226 -->|condition false| B227
B227 -->|condition true| B232
B227 -->|condition false| B228
B228 -->|jump| B218
B229 -->|jump| B233
B218["Continue at B219 in section 22"]
B213["Continue at B214 in section 22"]
B230["Continue at B231 in section 24"]
B231["Continue at B232 in section 24"]
B232["Continue at B233 in section 24"]
B233["Continue at B234 in section 24"]
```

### B221

```asm
SJMP K2
```

### B222

```asm
ACALL TMSEC
```

### B223

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B224

```asm
SJMP K2
```

### B225

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B226

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B227

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B228

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B229

```asm
LJMP K2
```

### B230

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 24

```mermaid
flowchart TD
B230["B231: ROW_1 - lines 558 to 559"]
B231["B232: ROW_2 - lines 561 to 562"]
B232["B233: ROW_3 - lines 564 to 564"]
B233["B234: FIND - lines 567 to 567"]
B234["B235: FIND1 - lines 570 to 571"]
B235["B236: instructions - lines 572 to 573"]
B236["B237: MATCH - lines 576 to 578"]
B237["B238: ENDOFCODE - lines 610 to 610"]
B230 -->|jump| B233
B231 -->|jump| B233
B232 -->|next| B233
B233 -->|next| B234
B234 -->|condition true| B236
B234 -->|condition false| B235
B235 -->|jump| B234
```

### B231

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B232

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B233

```asm
MOV DPTR,#KCODE3
```

### B234

```asm
SWAP A
```

### B235

```asm
RRC A
JNC MATCH
```

### B236

```asm
INC DPTR
SJMP FIND1
```

### B237

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B238

Resume the interrupted program.

```asm
RETI
```
