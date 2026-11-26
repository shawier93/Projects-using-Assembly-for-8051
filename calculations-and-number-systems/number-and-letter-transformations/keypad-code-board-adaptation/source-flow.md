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
B2 -->|call| B166
B2 -->|after return| B3
B3 -->|call| B193
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B202
B5 -->|after return| B6
B6 -->|condition true| B5
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|call| B166
B8 -->|after return| B9
B9 -->|call| B193
B9 -->|after return| B10
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
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
B11 -->|call| B202
B11 -->|after return| B12
B12 -->|condition true| B11
B12 -->|condition false| B13
B13 -->|call| B186
B13 -->|after return| B14
B14 -->|call| B186
B14 -->|after return| B15
B15 -->|call| B198
B15 -->|after return| B16
B16 -->|call| B193
B16 -->|after return| B17
B17 -->|next| B18
B18 -->|call| B202
B18 -->|after return| B19
B19 -->|condition true| B18
B19 -->|condition false| B20
B202["Continue at B203 in section 21"]
B186["Continue at B187 in section 19"]
B198["Continue at B199 in section 20"]
B193["Continue at B194 in section 20"]
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
B20 -->|call| B166
B20 -->|after return| B21
B21 -->|call| B193
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|call| B202
B23 -->|after return| B24
B24 -->|condition true| B23
B24 -->|condition false| B25
B25 -->|call| B186
B25 -->|after return| B26
B26 -->|call| B186
B26 -->|after return| B27
B27 -->|call| B198
B27 -->|after return| B28
B28 -->|call| B193
B28 -->|after return| B29
B29 -->|next| B30
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B186["Continue at B187 in section 19"]
B198["Continue at B199 in section 20"]
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
B30 -->|call| B202
B30 -->|after return| B31
B31 -->|condition true| B30
B31 -->|condition false| B32
B32 -->|call| B166
B32 -->|after return| B33
B33 -->|call| B193
B33 -->|after return| B34
B34 -->|next| B35
B35 -->|call| B202
B35 -->|after return| B36
B36 -->|condition true| B35
B36 -->|condition false| B37
B37 -->|call| B166
B37 -->|after return| B38
B38 -->|call| B193
B38 -->|after return| B39
B39 -->|next| B40
B202["Continue at B203 in section 21"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
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
B40 -->|call| B202
B40 -->|after return| B41
B41 -->|condition true| B40
B41 -->|condition false| B42
B42 -->|call| B166
B42 -->|after return| B43
B43 -->|call| B193
B43 -->|after return| B44
B44 -->|next| B45
B45 -->|call| B202
B45 -->|after return| B46
B46 -->|condition true| B45
B46 -->|condition false| B47
B47 -->|call| B212
B47 -->|after return| B48
B48 -->|call| B188
B48 -->|after return| B49
B49 -->|next| B50
B202["Continue at B203 in section 21"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B212["Continue at B213 in section 22"]
B188["Continue at B189 in section 19"]
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
B58["B59: instructions - lines 103 to 107"]
B59["B60: instructions - lines 108 to 109"]
B50 -->|condition true| B83
B50 -->|condition false| B51
B51 -->|call| B166
B51 -->|after return| B52
B52 -->|call| B193
B52 -->|after return| B53
B53 -->|next| B54
B54 -->|call| B202
B54 -->|after return| B55
B55 -->|condition true| B54
B55 -->|condition false| B56
B56 -->|call| B212
B56 -->|after return| B57
B57 -->|call| B188
B57 -->|after return| B58
B58 -->|call| B186
B58 -->|after return| B59
B59 -->|call| B186
B59 -->|after return| B60
B83["Continue at B84 in section 9"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B212["Continue at B213 in section 22"]
B188["Continue at B189 in section 19"]
B186["Continue at B187 in section 19"]
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
mov r7,a
MOV A,#0CH
ACALL CMD
```

### B60

```asm
MOV A,#0H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 110 to 110"]
B61["B62: instructions - lines 111 to 112"]
B62["B63: instructions - lines 113 to 113"]
B63["B64: AGAIN67579 - lines 114 to 114"]
B64["B65: instructions - lines 115 to 115"]
B65["B66: instructions - lines 118 to 118"]
B66["B67: instructions - lines 119 to 119"]
B67["B68: instructions - lines 120 to 126"]
B68["B69: X - lines 128 to 130"]
B69["B70: instructions - lines 131 to 131"]
B60 -->|call| B198
B60 -->|after return| B61
B61 -->|call| B193
B61 -->|after return| B62
B62 -->|next| B63
B63 -->|call| B202
B63 -->|after return| B64
B64 -->|condition true| B63
B64 -->|condition false| B65
B65 -->|call| B212
B65 -->|after return| B66
B66 -->|call| B188
B66 -->|after return| B67
B67 -->|next| B68
B68 -->|condition true| B68
B68 -->|condition false| B69
B69 -->|call| B166
B69 -->|after return| B70
B198["Continue at B199 in section 20"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B212["Continue at B213 in section 22"]
B188["Continue at B189 in section 19"]
B166["Continue at B167 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL LDELAY
```

### B62

```asm
MOV DPTR,#ENTERD
LCALL WSTR
```

### B63

```asm
mov r5,#2
```

### B64

```asm
lcall delay
```

### B65

```asm
djnz r5,again67579
```

### B66

```asm
ACALL KEYPAD
```

### B67

```asm
ACALL WCHR
```

### B68

```asm
SUBB A,#30H
ADD A,#1
MOV 78H,A
mov r1,a
mov r0,#70h
mov a,r7
```

### B69

```asm
mov @r0,a
inc r0
djnz r1,x
```

### B70

```asm
ACALL INLCD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 132 to 133"]
B71["B72: instructions - lines 134 to 134"]
B72["B73: AGAIN67879 - lines 135 to 135"]
B73["B74: instructions - lines 136 to 136"]
B74["B75: instructions - lines 137 to 138"]
B75["B76: instructions - lines 139 to 140"]
B76["B77: instructions - lines 141 to 141"]
B77["B78: CODEX - lines 144 to 145"]
B78["B79: instructions - lines 146 to 146"]
B79["B80: AGAIN8454 - lines 147 to 147"]
B70 -->|call| B193
B70 -->|after return| B71
B71 -->|next| B72
B72 -->|call| B202
B72 -->|after return| B73
B73 -->|condition true| B72
B73 -->|condition false| B74
B74 -->|call| B186
B74 -->|after return| B75
B75 -->|call| B186
B75 -->|after return| B76
B76 -->|call| B198
B76 -->|after return| B77
B77 -->|call| B188
B77 -->|after return| B78
B78 -->|next| B79
B79 -->|call| B202
B79 -->|after return| B80
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B186["Continue at B187 in section 19"]
B198["Continue at B199 in section 20"]
B188["Continue at B189 in section 19"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B72

```asm
mov r5,#2
```

### B73

```asm
lcall delay
```

### B74

```asm
djnz r5,again67879
```

### B75

```asm
MOV A,#0CH
ACALL CMD
```

### B76

```asm
MOV A,#0H
ACALL CMD
```

### B77

```asm
ACALL LDELAY
```

### B78

```asm
MOV A,R7
ACALL WCHR
```

### B79

```asm
mov r5,#2
```

### B80

```asm
lcall delay
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 148 to 148"]
B81["B82: instructions - lines 149 to 149"]
B82["B83: instructions - lines 150 to 150"]
B83["B84: EXIT - lines 155 to 155"]
B84["B85: instructions - lines 156 to 156"]
B85["B86: instructions - lines 157 to 158"]
B86["B87: instructions - lines 159 to 159"]
B87["B88: AGAIN16 - lines 160 to 160"]
B88["B89: instructions - lines 161 to 161"]
B89["B90: S - lines 162 to 162"]
B80 -->|condition true| B79
B80 -->|condition false| B81
B81 -->|condition true| B77
B81 -->|condition false| B82
B82 -->|jump| B131
B83 -->|condition true| B91
B83 -->|condition false| B84
B84 -->|call| B166
B84 -->|after return| B85
B85 -->|call| B193
B85 -->|after return| B86
B86 -->|next| B87
B87 -->|call| B202
B87 -->|after return| B88
B88 -->|condition true| B87
B88 -->|condition false| B89
B89 -->|jump| B89
B79["Continue at B80 in section 8"]
B77["Continue at B78 in section 8"]
B131["Continue at B132 in section 14"]
B91["Continue at B92 in section 10"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
```

### B81

```asm
djnz r5,again8454
```

### B82

```asm
DJNZ 78H,CODEX
```

### B83

```asm
LJMP EXITORMENU
```

### B84

```asm
cjne a,#3,OPTION1
```

### B85

```asm
LCALL INLCD
```

### B86

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

### B87

```asm
mov r5,#2
```

### B88

```asm
lcall delay
```

### B89

```asm
djnz r5,again16
```

### B90

```asm
SJMP S
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 163 to 163"]
B91["B92: OPTION1 - lines 169 to 169"]
B92["B93: instructions - lines 172 to 173"]
B93["B94: instructions - lines 174 to 174"]
B94["B95: AGAIN10 - lines 175 to 175"]
B95["B96: instructions - lines 176 to 176"]
B96["B97: instructions - lines 177 to 178"]
B97["B98: instructions - lines 179 to 180"]
B98["B99: instructions - lines 182 to 182"]
B99["B100: instructions - lines 183 to 183"]
B90 -->|jump| B233
B91 -->|call| B166
B91 -->|after return| B92
B92 -->|call| B193
B92 -->|after return| B93
B93 -->|next| B94
B94 -->|call| B202
B94 -->|after return| B95
B95 -->|condition true| B94
B95 -->|condition false| B96
B96 -->|call| B186
B96 -->|after return| B97
B97 -->|call| B186
B97 -->|after return| B98
B98 -->|call| B212
B98 -->|after return| B99
B99 -->|call| B188
B99 -->|after return| B100
B233["Continue at B234 in section 24"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B186["Continue at B187 in section 19"]
B212["Continue at B213 in section 22"]
B188["Continue at B189 in section 19"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
LJMP endofcode
```

### B92

```asm
LCALL INLCD
```

### B93

```asm
MOV DPTR,#ENTERC
LCALL WSTR
```

### B94

```asm
mov r5,#3
```

### B95

```asm
lcall delay
```

### B96

```asm
djnz r5,again10
```

### B97

```asm
MOV A,#0CH
LCALL CMD
```

### B98

```asm
MOV A,#2H
LCALL CMD
```

### B99

```asm
ACALL KEYPAD
```

### B100

```asm
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 184 to 184"]
B101["B102: M - lines 188 to 191"]
B102["B103: T - lines 194 to 194"]
B103["B104: instructions - lines 195 to 195"]
B104["B105: instructions - lines 196 to 202"]
B105["B106: instructions - lines 203 to 203"]
B106["B107: MORE - lines 205 to 205"]
B107["B108: O - lines 208 to 208"]
B108["B109: instructions - lines 209 to 209"]
B109["B110: instructions - lines 210 to 215"]
B100 -->|next| B101
B101 -->|next| B102
B102 -->|call| B212
B102 -->|after return| B103
B103 -->|call| B188
B103 -->|after return| B104
B104 -->|condition true| B106
B104 -->|condition false| B105
B105 -->|jump| B107
B106 -->|next| B107
B107 -->|call| B212
B107 -->|after return| B108
B108 -->|call| B188
B108 -->|after return| B109
B109 -->|condition true| B111
B109 -->|condition false| B110
B212["Continue at B213 in section 22"]
B188["Continue at B189 in section 19"]
B111["Continue at B112 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
SUBB A,#30H
```

### B102

```asm
mov b,#100
mul ab
mov r5,a
mov r6,b
```

### B103

```asm
ACALL KEYPAD
```

### B104

```asm
ACALL WCHR
```

### B105

```asm
SUBB A,#30H
mov b,#10
mul ab
add a,r5
mov r5,a
jc more
```

### B106

```asm
sjmp O
```

### B107

```asm
inc r6
```

### B108

```asm
ACALL KEYPAD
```

### B109

```asm
ACALL WCHR
```

### B110

```asm
SUBB A,#30H
add a,r5
mov r5,a
jc more2
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 216 to 216"]
B111["B112: MORE2 - lines 220 to 220"]
B112["B113: NEXTSTEP - lines 223 to 223"]
B113["B114: instructions - lines 224 to 224"]
B114["B115: EVENX - lines 226 to 232"]
B115["B116: instructions - lines 233 to 233"]
B116["B117: instructions - lines 234 to 235"]
B117["B118: instructions - lines 236 to 236"]
B118["B119: AGAIN1923 - lines 237 to 237"]
B119["B120: instructions - lines 238 to 238"]
B110 -->|jump| B112
B111 -->|next| B112
B112 -->|call| B165
B112 -->|after return| B113
B113 -->|condition true| B124
B113 -->|condition false| B114
B114 -->|call| B149
B114 -->|after return| B115
B115 -->|call| B166
B115 -->|after return| B116
B116 -->|call| B193
B116 -->|after return| B117
B117 -->|next| B118
B118 -->|call| B202
B118 -->|after return| B119
B119 -->|condition true| B118
B119 -->|condition false| B120
B165["Continue at B166 in section 17"]
B124["Continue at B125 in section 13"]
B149["Continue at B150 in section 15"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
sjmp nextstep
```

### B112

```asm
inc r6
```

### B113

```asm
ACALL ENTERED_NUMER
```

### B114

```asm
jb acc.0,ODDX
```

### B115

```asm
MOV A,R5
subb a,#2
mov r5,a
mov r0,#3
LCALL PRINTOP2
```

### B116

```asm
LCALL INLCD
```

### B117

```asm
MOV DPTR,#EVENN
LCALL WSTR
```

### B118

```asm
mov r4,#3
```

### B119

```asm
lcall delay
```

### B120

```asm
djnz r4,again1923
```

## Section 13

```mermaid
flowchart TD
B120["B121: FLASHING - lines 242 to 243"]
B121["B122: instructions - lines 244 to 245"]
B122["B123: instructions - lines 246 to 246"]
B123["B124: instructions - lines 247 to 247"]
B124["B125: ODDX - lines 250 to 255"]
B125["B126: instructions - lines 256 to 256"]
B126["B127: instructions - lines 257 to 258"]
B127["B128: FLASHING2 - lines 262 to 263"]
B128["B129: instructions - lines 264 to 265"]
B129["B130: instructions - lines 266 to 266"]
B120 -->|call| B202
B120 -->|after return| B121
B121 -->|call| B202
B121 -->|after return| B122
B122 -->|condition true| B120
B122 -->|condition false| B123
B123 -->|call| B131
B123 -->|after return| B124
B124 -->|call| B149
B124 -->|after return| B125
B125 -->|call| B166
B125 -->|after return| B126
B126 -->|call| B193
B126 -->|after return| B127
B127 -->|call| B202
B127 -->|after return| B128
B128 -->|call| B202
B128 -->|after return| B129
B129 -->|condition true| B127
B129 -->|condition false| B130
B202["Continue at B203 in section 21"]
B131["Continue at B132 in section 14"]
B149["Continue at B150 in section 15"]
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
mov p3,#0
acall delay
```

### B122

```asm
mov p3,#0ffh
acall delay
```

### B123

```asm
djnz r0,flashing
```

### B124

```asm
LCALL exitORmenu
```

### B125

```asm
MOV A,R5
add a,#2
mov r5,a
mov r0,#2
LCALL PRINTOP2
```

### B126

```asm
LCALL INLCD
```

### B127

```asm
MOV DPTR,#ODDD
LCALL WSTR
```

### B128

```asm
mov p3,#0
acall delay
```

### B129

```asm
mov p3,#0ffh
acall delay
```

### B130

```asm
djnz r0,flashing2
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 267 to 267"]
B131["B132: EXITORMENU - lines 272 to 272"]
B132["B133: instructions - lines 273 to 274"]
B133["B134: instructions - lines 275 to 275"]
B134["B135: AGAIN17 - lines 276 to 276"]
B135["B136: instructions - lines 277 to 277"]
B136["B137: instructions - lines 278 to 279"]
B137["B138: instructions - lines 280 to 281"]
B138["B139: instructions - lines 282 to 282"]
B139["B140: instructions - lines 283 to 284"]
B130 -->|call| B131
B130 -->|after return| B131
B131 -->|call| B166
B131 -->|after return| B132
B132 -->|call| B193
B132 -->|after return| B133
B133 -->|next| B134
B134 -->|call| B202
B134 -->|after return| B135
B135 -->|condition true| B134
B135 -->|condition false| B136
B136 -->|call| B186
B136 -->|after return| B137
B137 -->|call| B186
B137 -->|after return| B138
B138 -->|call| B198
B138 -->|after return| B139
B139 -->|call| B193
B139 -->|after return| B140
B166["Continue at B167 in section 17"]
B193["Continue at B194 in section 20"]
B202["Continue at B203 in section 21"]
B186["Continue at B187 in section 19"]
B198["Continue at B199 in section 20"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
LCALL exitORmenu
```

### B132

```asm
LCALL INLCD
```

### B133

```asm
MOV DPTR,#EXIT_MEN
LCALL WSTR
```

### B134

```asm
mov r5,#3
```

### B135

```asm
lcall delay
```

### B136

```asm
djnz r5,again17
```

### B137

```asm
MOV A,#0CH
LCALL CMD
```

### B138

```asm
MOV A,#0H
LCALL CMD
```

### B139

```asm
LCALL LDELAY
```

### B140

```asm
MOV DPTR,#EXIT_MENU
LCALL WSTR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 285 to 285"]
B141["B142: AGAIN18 - lines 286 to 286"]
B142["B143: instructions - lines 287 to 287"]
B143["B144: instructions - lines 289 to 289"]
B144["B145: instructions - lines 290 to 290"]
B145["B146: instructions - lines 291 to 293"]
B146["B147: instructions - lines 294 to 294"]
B147["B148: EXITTT - lines 296 to 296"]
B148["B149: instructions - lines 298 to 298"]
B149["B150: PRINTOP2 - lines 304 to 304"]
B140 -->|next| B141
B141 -->|call| B202
B141 -->|after return| B142
B142 -->|condition true| B141
B142 -->|condition false| B143
B143 -->|call| B212
B143 -->|after return| B144
B144 -->|call| B188
B144 -->|after return| B145
B145 -->|condition true| B147
B145 -->|condition false| B146
B146 -->|jump| B8
B147 -->|jump| B83
B149 -->|call| B166
B149 -->|after return| B150
B202["Continue at B203 in section 21"]
B212["Continue at B213 in section 22"]
B188["Continue at B189 in section 19"]
B8["Continue at B9 in section 1"]
B83["Continue at B84 in section 9"]
B166["Continue at B167 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov r5,#3
```

### B142

```asm
lcall delay
```

### B143

```asm
djnz r5,again18
```

### B144

```asm
ACALL KEYPAD
```

### B145

```asm
ACALL WCHR
```

### B146

```asm
SUBB A,#30H
CJNE A,#0,EXITTT
```

### B147

```asm
AJMP MENU
```

### B148

```asm
LJMP EXIT
```

### B149

Return to the instruction following the active call.

```asm
ret
```

### B150

```asm
LCALL INLCD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 305 to 306"]
B151["B152: instructions - lines 308 to 323"]
B152["B153: instructions - lines 324 to 325"]
B153["B154: instructions - lines 326 to 327"]
B154["B155: instructions - lines 328 to 329"]
B155["B156: instructions - lines 330 to 331"]
B156["B157: instructions - lines 332 to 332"]
B157["B158: instructions - lines 333 to 334"]
B158["B159: instructions - lines 335 to 336"]
B159["B160: instructions - lines 337 to 338"]
B150 -->|call| B193
B150 -->|after return| B151
B151 -->|call| B186
B151 -->|after return| B152
B152 -->|call| B186
B152 -->|after return| B153
B153 -->|call| B188
B153 -->|after return| B154
B154 -->|call| B186
B154 -->|after return| B155
B155 -->|call| B186
B155 -->|after return| B156
B156 -->|call| B198
B156 -->|after return| B157
B157 -->|call| B188
B157 -->|after return| B158
B158 -->|call| B186
B158 -->|after return| B159
B159 -->|call| B186
B159 -->|after return| B160
B193["Continue at B194 in section 20"]
B186["Continue at B187 in section 19"]
B188["Continue at B189 in section 19"]
B198["Continue at B199 in section 20"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B152

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

### B153

```asm
MOV A,#1H
LCALL CMD
```

### B154

```asm
MOV A,32H
LCALL WCHR
```

### B155

```asm
MOV A,#0CH
LCALL CMD
```

### B156

```asm
MOV A,#2H
LCALL CMD
```

### B157

```asm
LCALL LDELAY
```

### B158

```asm
MOV A,33H
LCALL WCHR
```

### B159

```asm
MOV A,#0CH
LCALL CMD
```

### B160

```asm
MOV A,#3H
LCALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 339 to 340"]
B161["B162: instructions - lines 341 to 341"]
B162["B163: instructions - lines 342 to 342"]
B163["B164: instructions - lines 343 to 343"]
B164["B165: instructions - lines 346 to 346"]
B165["B166: ENTERED_NUMER - lines 350 to 376"]
B166["B167: INLCD - lines 379 to 380"]
B167["B168: WAIT - lines 382 to 382"]
B168["B169: instructions - lines 383 to 383"]
B169["B170: instructions - lines 384 to 386"]
B160 -->|call| B188
B160 -->|after return| B161
B161 -->|call| B202
B161 -->|after return| B162
B162 -->|call| B202
B162 -->|after return| B163
B163 -->|call| B202
B163 -->|after return| B164
B166 -->|next| B167
B167 -->|call| B198
B167 -->|after return| B168
B168 -->|condition true| B167
B168 -->|condition false| B169
B169 -->|call| B186
B169 -->|after return| B170
B188["Continue at B189 in section 19"]
B202["Continue at B203 in section 21"]
B198["Continue at B199 in section 20"]
B186["Continue at B187 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,34H
LCALL WCHR
```

### B162

```asm
LCALL DELAY
```

### B163

```asm
LCALL DELAY
```

### B164

```asm
LCALL DELAY
```

### B165

Return to the instruction following the active call.

```asm
RET
```

### B166

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

### B167

```asm
PUSH 7
MOV R7,#20
```

### B168

```asm
ACALL LDELAY
```

### B169

```asm
DJNZ R7,WAIT
```

### B170

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 387 to 387"]
B171["B172: instructions - lines 388 to 389"]
B172["B173: instructions - lines 390 to 391"]
B173["B174: instructions - lines 392 to 393"]
B174["B175: instructions - lines 394 to 395"]
B175["B176: instructions - lines 396 to 397"]
B176["B177: instructions - lines 398 to 399"]
B177["B178: instructions - lines 400 to 401"]
B178["B179: instructions - lines 402 to 404"]
B179["B180: instructions - lines 405 to 406"]
B170 -->|call| B198
B170 -->|after return| B171
B171 -->|call| B186
B171 -->|after return| B172
B172 -->|call| B186
B172 -->|after return| B173
B173 -->|call| B186
B173 -->|after return| B174
B174 -->|call| B186
B174 -->|after return| B175
B175 -->|call| B186
B175 -->|after return| B176
B176 -->|call| B186
B176 -->|after return| B177
B177 -->|call| B186
B177 -->|after return| B178
B178 -->|call| B186
B178 -->|after return| B179
B179 -->|call| B186
B179 -->|after return| B180
B198["Continue at B199 in section 20"]
B186["Continue at B187 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL LDELAY
```

### B172

```asm
MOV A,#0011B
ACALL CMD
```

### B173

```asm
MOV A,#0011B
ACALL CMD
```

### B174

```asm
MOV A,#0010B
ACALL CMD
```

### B175

```asm
MOV A,#0010B
ACALL CMD
```

### B176

```asm
MOV A,#1000B
ACALL CMD
```

### B177

```asm
MOV A,#0000B
ACALL CMD
```

### B178

```asm
MOV A,#1000B
ACALL CMD
```

### B179

```asm
MOV A,#0
ACALL CMD
```

### B180

```asm
MOV A,#0001B
ACALL CMD
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 407 to 407"]
B181["B182: instructions - lines 408 to 409"]
B182["B183: instructions - lines 410 to 411"]
B183["B184: instructions - lines 412 to 413"]
B184["B185: instructions - lines 414 to 415"]
B185["B186: instructions - lines 416 to 417"]
B186["B187: CMD - lines 422 to 423"]
B187["B188: instructions - lines 424 to 424"]
B188["B189: WCHR - lines 427 to 432"]
B189["B190: instructions - lines 433 to 434"]
B180 -->|call| B198
B180 -->|after return| B181
B181 -->|call| B186
B181 -->|after return| B182
B182 -->|call| B186
B182 -->|after return| B183
B183 -->|call| B186
B183 -->|after return| B184
B184 -->|call| B186
B184 -->|after return| B185
B186 -->|call| B191
B186 -->|after return| B187
B188 -->|call| B191
B188 -->|after return| B189
B189 -->|call| B191
B189 -->|after return| B190
B198["Continue at B199 in section 20"]
B191["Continue at B192 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL LDELAY
```

### B182

```asm
MOV A,#0000B
ACALL CMD
```

### B183

```asm
MOV A,#0110B
ACALL CMD
```

### B184

```asm
MOV A,#0000B
ACALL CMD
```

### B185

```asm
MOV A,#1111B
ACALL CMD
```

### B186

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B187

```asm
CLR RS
ACALL COMMON
```

### B188

Return to the instruction following the active call.

```asm
RET
```

### B189

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B190

```asm
MOV A,B
ACALL COMMON
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 435 to 437"]
B191["B192: COMMON - lines 440 to 447"]
B192["B193: instructions - lines 449 to 449"]
B193["B194: WSTR - lines 452 to 452"]
B194["B195: CONT1 - lines 454 to 456"]
B195["B196: instructions - lines 457 to 457"]
B196["B197: instructions - lines 458 to 459"]
B197["B198: EXIT1 - lines 461 to 462"]
B198["B199: LDELAY - lines 465 to 467"]
B199["B200: CON4 - lines 469 to 470"]
B191 -->|call| B198
B191 -->|after return| B192
B193 -->|next| B194
B194 -->|condition true| B197
B194 -->|condition false| B195
B195 -->|call| B188
B195 -->|after return| B196
B196 -->|jump| B194
B198 -->|next| B199
B199 -->|condition true| B199
B199 -->|condition false| B200
B188["Continue at B189 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B192

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

### B193

Return to the instruction following the active call.

```asm
RET
```

### B194

```asm
PUSH ACC
```

### B195

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B196

```asm
ACALL WCHR
```

### B197

```asm
INC DPTR
AJMP CONT1
```

### B198

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B199

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B200

```asm
MOV R0,#250
DJNZ R0,$
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 471 to 471"]
B201["B202: instructions - lines 472 to 474"]
B202["B203: DELAY - lines 476 to 479"]
B203["B204: X36 - lines 480 to 480"]
B204["B205: X26 - lines 481 to 481"]
B205["B206: X16 - lines 482 to 482"]
B206["B207: instructions - lines 483 to 483"]
B207["B208: instructions - lines 484 to 484"]
B208["B209: instructions - lines 485 to 488"]
B209["B210: TMSEC - lines 490 to 493"]
B200 -->|condition true| B199
B200 -->|condition false| B201
B202 -->|next| B203
B203 -->|next| B204
B204 -->|next| B205
B205 -->|condition true| B205
B205 -->|condition false| B206
B206 -->|condition true| B204
B206 -->|condition false| B207
B207 -->|condition true| B203
B207 -->|condition false| B208
B209 -->|next| B210
B199["Continue at B200 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
DJNZ R1,CON4
```

### B202

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B203

```asm
PUSH 5
PUSH 4
PUSH 3
MOV R5,#20
```

### B204

```asm
MOV R4,#200
```

### B205

```asm
MOV R3,#250
```

### B206

```asm
DJNZ R3,X16
```

### B207

```asm
DJNZ R4,X26
```

### B208

```asm
DJNZ R5,X36
```

### B209

Return to the instruction following the active call.

```asm
POP 3
POP 4
POP 5
RET
```

### B210

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

## Section 22

```mermaid
flowchart TD
B210["B211: BACK - lines 494 to 494"]
B211["B212: instructions - lines 495 to 497"]
B212["B213: KEYPAD - lines 501 to 501"]
B213["B214: K1 - lines 503 to 506"]
B214["B215: K2 - lines 508 to 508"]
B215["B216: instructions - lines 509 to 511"]
B216["B217: instructions - lines 512 to 512"]
B217["B218: OVER - lines 515 to 515"]
B218["B219: instructions - lines 516 to 518"]
B219["B220: instructions - lines 519 to 519"]
B210 -->|condition true| B210
B210 -->|condition false| B211
B212 -->|next| B213
B213 -->|condition true| B213
B213 -->|condition false| B214
B214 -->|call| B209
B214 -->|after return| B215
B215 -->|condition true| B217
B215 -->|condition false| B216
B216 -->|jump| B214
B217 -->|call| B209
B217 -->|after return| B218
B218 -->|condition true| B220
B218 -->|condition false| B219
B219 -->|jump| B214
B209["Continue at B210 in section 21"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
JNB TF0,BACK
```

### B212

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B213

```asm
MOV P2,#11110000B
```

### B214

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B215

```asm
ACALL TMSEC
```

### B216

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B217

```asm
SJMP K2
```

### B218

```asm
ACALL TMSEC
```

### B219

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B220

```asm
SJMP K2
```

## Section 23

```mermaid
flowchart TD
B220["B221: OVER1 - lines 522 to 525"]
B221["B222: instructions - lines 527 to 530"]
B222["B223: instructions - lines 532 to 535"]
B223["B224: instructions - lines 537 to 540"]
B224["B225: instructions - lines 542 to 542"]
B225["B226: ROW_0 - lines 544 to 545"]
B226["B227: ROW_1 - lines 547 to 548"]
B227["B228: ROW_2 - lines 550 to 551"]
B228["B229: ROW_3 - lines 553 to 553"]
B229["B230: FIND - lines 556 to 556"]
B220 -->|condition true| B225
B220 -->|condition false| B221
B221 -->|condition true| B226
B221 -->|condition false| B222
B222 -->|condition true| B227
B222 -->|condition false| B223
B223 -->|condition true| B228
B223 -->|condition false| B224
B224 -->|jump| B214
B225 -->|jump| B229
B226 -->|jump| B229
B227 -->|jump| B229
B228 -->|next| B229
B229 -->|next| B230
B214["Continue at B215 in section 22"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B222

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B223

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B224

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B225

```asm
LJMP K2
```

### B226

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B227

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B228

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B229

```asm
MOV DPTR,#KCODE3
```

### B230

```asm
SWAP A
```

## Section 24

```mermaid
flowchart TD
B230["B231: FIND1 - lines 559 to 560"]
B231["B232: instructions - lines 561 to 562"]
B232["B233: MATCH - lines 565 to 567"]
B233["B234: ENDOFCODE - lines 599 to 599"]
B230 -->|condition true| B232
B230 -->|condition false| B231
B231 -->|jump| B230
```

### B231

```asm
RRC A
JNC MATCH
```

### B232

```asm
INC DPTR
SJMP FIND1
```

### B233

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B234

Resume the interrupted program.

```asm
RETI
```
