# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 03H` begins at B2.
- `ORG 30h` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23)

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
B2 -->|call| B157
B2 -->|after return| B3
B3 -->|call| B184
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B193
B5 -->|after return| B6
B6 -->|condition true| B5
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|call| B157
B8 -->|after return| B9
B9 -->|call| B184
B9 -->|after return| B10
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
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
B11 -->|call| B193
B11 -->|after return| B12
B12 -->|condition true| B11
B12 -->|condition false| B13
B13 -->|call| B177
B13 -->|after return| B14
B14 -->|call| B177
B14 -->|after return| B15
B15 -->|call| B189
B15 -->|after return| B16
B16 -->|call| B184
B16 -->|after return| B17
B17 -->|next| B18
B18 -->|call| B193
B18 -->|after return| B19
B19 -->|condition true| B18
B19 -->|condition false| B20
B193["Continue at B194 in section 20"]
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
B184["Continue at B185 in section 19"]
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
mov a,#0ch
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
B20 -->|call| B157
B20 -->|after return| B21
B21 -->|call| B184
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|call| B193
B23 -->|after return| B24
B24 -->|condition true| B23
B24 -->|condition false| B25
B25 -->|call| B177
B25 -->|after return| B26
B26 -->|call| B177
B26 -->|after return| B27
B27 -->|call| B189
B27 -->|after return| B28
B28 -->|call| B184
B28 -->|after return| B29
B29 -->|next| B30
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
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
mov a,#0ch
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
B30 -->|call| B193
B30 -->|after return| B31
B31 -->|condition true| B30
B31 -->|condition false| B32
B32 -->|call| B157
B32 -->|after return| B33
B33 -->|call| B184
B33 -->|after return| B34
B34 -->|next| B35
B35 -->|call| B193
B35 -->|after return| B36
B36 -->|condition true| B35
B36 -->|condition false| B37
B37 -->|call| B157
B37 -->|after return| B38
B38 -->|call| B184
B38 -->|after return| B39
B39 -->|next| B40
B193["Continue at B194 in section 20"]
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
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
B47["B48: instructions - lines 82 to 83"]
B48["B49: instructions - lines 84 to 84"]
B49["B50: instructions - lines 85 to 85"]
B40 -->|call| B193
B40 -->|after return| B41
B41 -->|condition true| B40
B41 -->|condition false| B42
B42 -->|call| B157
B42 -->|after return| B43
B43 -->|call| B184
B43 -->|after return| B44
B44 -->|next| B45
B45 -->|call| B193
B45 -->|after return| B46
B46 -->|condition true| B45
B46 -->|condition false| B47
B47 -->|call| B203
B47 -->|after return| B48
B48 -->|call| B179
B48 -->|after return| B49
B49 -->|next| B50
B193["Continue at B194 in section 20"]
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B203["Continue at B204 in section 21"]
B179["Continue at B180 in section 18"]
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
mov a,#2
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
B50["B51: OPTION2X - lines 93 to 93"]
B51["B52: instructions - lines 94 to 94"]
B52["B53: instructions - lines 95 to 96"]
B53["B54: instructions - lines 97 to 97"]
B54["B55: AGAIN6779 - lines 98 to 98"]
B55["B56: instructions - lines 99 to 99"]
B56["B57: instructions - lines 102 to 109"]
B57["B58: instructions - lines 110 to 111"]
B58["B59: instructions - lines 112 to 112"]
B59["B60: instructions - lines 113 to 114"]
B50 -->|condition true| B79
B50 -->|condition false| B51
B51 -->|call| B157
B51 -->|after return| B52
B52 -->|call| B184
B52 -->|after return| B53
B53 -->|next| B54
B54 -->|call| B193
B54 -->|after return| B55
B55 -->|condition true| B54
B55 -->|condition false| B56
B56 -->|call| B177
B56 -->|after return| B57
B57 -->|call| B177
B57 -->|after return| B58
B58 -->|call| B189
B58 -->|after return| B59
B59 -->|call| B184
B59 -->|after return| B60
B79["Continue at B80 in section 8"]
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
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
mov dptr,#n2
clr a
movc a,@a+dptr
mov r7,a
MOV A,#0CH
ACALL CMD
```

### B58

```asm
MOV A,#0H
ACALL CMD
```

### B59

```asm
ACALL LDELAY
```

### B60

```asm
MOV DPTR,#ENTERD
LCALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 115 to 115"]
B61["B62: AGAIN67579 - lines 116 to 116"]
B62["B63: instructions - lines 117 to 117"]
B63["B64: instructions - lines 120 to 126"]
B64["B65: X - lines 128 to 130"]
B65["B66: instructions - lines 131 to 131"]
B66["B67: instructions - lines 132 to 133"]
B67["B68: instructions - lines 134 to 134"]
B68["B69: AGAIN67879 - lines 135 to 135"]
B69["B70: instructions - lines 136 to 136"]
B60 -->|next| B61
B61 -->|call| B193
B61 -->|after return| B62
B62 -->|condition true| B61
B62 -->|condition false| B63
B63 -->|next| B64
B64 -->|condition true| B64
B64 -->|condition false| B65
B65 -->|call| B157
B65 -->|after return| B66
B66 -->|call| B184
B66 -->|after return| B67
B67 -->|next| B68
B68 -->|call| B193
B68 -->|after return| B69
B69 -->|condition true| B68
B69 -->|condition false| B70
B193["Continue at B194 in section 20"]
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov r5,#2
```

### B62

```asm
lcall delay
```

### B63

```asm
djnz r5,again67579
```

### B64

```asm
inc dptr
clr a
movc a,@a+dptr
inc a
mov r1,a
mov r0,#70h
mov a,r7
```

### B65

```asm
mov @r0,a
inc r0
djnz r1,x
```

### B66

```asm
ACALL INLCD
```

### B67

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B68

```asm
mov r5,#2
```

### B69

```asm
lcall delay
```

### B70

```asm
djnz r5,again67879
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 137 to 138"]
B71["B72: instructions - lines 139 to 140"]
B72["B73: instructions - lines 141 to 141"]
B73["B74: CODEX - lines 144 to 145"]
B74["B75: instructions - lines 146 to 146"]
B75["B76: AGAIN8454 - lines 147 to 147"]
B76["B77: instructions - lines 148 to 148"]
B77["B78: instructions - lines 149 to 149"]
B78["B79: instructions - lines 150 to 150"]
B79["B80: EXIT - lines 155 to 155"]
B70 -->|call| B177
B70 -->|after return| B71
B71 -->|call| B177
B71 -->|after return| B72
B72 -->|call| B189
B72 -->|after return| B73
B73 -->|call| B179
B73 -->|after return| B74
B74 -->|next| B75
B75 -->|call| B193
B75 -->|after return| B76
B76 -->|condition true| B75
B76 -->|condition false| B77
B77 -->|condition true| B73
B77 -->|condition false| B78
B78 -->|jump| B129
B79 -->|condition true| B87
B79 -->|condition false| B80
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
B179["Continue at B180 in section 18"]
B193["Continue at B194 in section 20"]
B129["Continue at B130 in section 13"]
B87["Continue at B88 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#0CH
ACALL CMD
```

### B72

```asm
MOV A,#0H
ACALL CMD
```

### B73

```asm
ACALL LDELAY
```

### B74

```asm
MOV A,70H
ACALL WCHR
```

### B75

```asm
mov r5,#2
```

### B76

```asm
lcall delay
```

### B77

```asm
djnz r5,again8454
```

### B78

```asm
DJNZ 71H,CODEX
```

### B79

```asm
LJMP EXITORMENU
```

### B80

```asm
cjne a,#3,OPTION1
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 156 to 156"]
B81["B82: instructions - lines 157 to 158"]
B82["B83: instructions - lines 159 to 159"]
B83["B84: AGAIN16 - lines 160 to 160"]
B84["B85: instructions - lines 161 to 161"]
B85["B86: S - lines 162 to 162"]
B86["B87: instructions - lines 163 to 163"]
B87["B88: OPTION1 - lines 169 to 169"]
B88["B89: instructions - lines 172 to 173"]
B89["B90: instructions - lines 174 to 174"]
B80 -->|call| B157
B80 -->|after return| B81
B81 -->|call| B184
B81 -->|after return| B82
B82 -->|next| B83
B83 -->|call| B193
B83 -->|after return| B84
B84 -->|condition true| B83
B84 -->|condition false| B85
B85 -->|jump| B85
B86 -->|jump| B224
B87 -->|call| B157
B87 -->|after return| B88
B88 -->|call| B184
B88 -->|after return| B89
B89 -->|next| B90
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
B224["Continue at B225 in section 23"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
LCALL INLCD
```

### B82

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

### B83

```asm
mov r5,#2
```

### B84

```asm
lcall delay
```

### B85

```asm
djnz r5,again16
```

### B86

```asm
SJMP S
```

### B87

```asm
LJMP endofcode
```

### B88

```asm
LCALL INLCD
```

### B89

```asm
MOV DPTR,#ENTERC
LCALL WSTR
```

### B90

```asm
mov r5,#3
```

## Section 10

```mermaid
flowchart TD
B90["B91: AGAIN10 - lines 175 to 175"]
B91["B92: instructions - lines 176 to 176"]
B92["B93: instructions - lines 178 to 179"]
B93["B94: instructions - lines 180 to 181"]
B94["B95: instructions - lines 182 to 182"]
B95["B96: instructions - lines 183 to 183"]
B96["B97: instructions - lines 184 to 184"]
B97["B98: M - lines 188 to 191"]
B98["B99: T - lines 194 to 194"]
B99["B100: instructions - lines 195 to 195"]
B90 -->|call| B193
B90 -->|after return| B91
B91 -->|condition true| B90
B91 -->|condition false| B92
B92 -->|call| B177
B92 -->|after return| B93
B93 -->|call| B177
B93 -->|after return| B94
B94 -->|call| B203
B94 -->|after return| B95
B95 -->|call| B179
B95 -->|after return| B96
B96 -->|next| B97
B97 -->|next| B98
B98 -->|call| B203
B98 -->|after return| B99
B99 -->|call| B179
B99 -->|after return| B100
B193["Continue at B194 in section 20"]
B177["Continue at B178 in section 18"]
B203["Continue at B204 in section 21"]
B179["Continue at B180 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
lcall delay
```

### B92

```asm
djnz r5,again10
```

### B93

```asm
MOV A,#0CH
LCALL CMD
```

### B94

```asm
MOV A,#2H
LCALL CMD
```

### B95

```asm
ACALL KEYPAD
```

### B96

```asm
ACALL WCHR
```

### B97

```asm
SUBB A,#30H
```

### B98

```asm
mov b,#100
mul ab
mov r5,a
mov r6,b
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
B100["B101: instructions - lines 196 to 202"]
B101["B102: instructions - lines 203 to 203"]
B102["B103: MORE - lines 205 to 205"]
B103["B104: O - lines 208 to 208"]
B104["B105: instructions - lines 209 to 209"]
B105["B106: instructions - lines 210 to 214"]
B106["B107: instructions - lines 215 to 215"]
B107["B108: MORE2 - lines 218 to 218"]
B108["B109: NEXTSTEP - lines 221 to 221"]
B109["B110: EVENX - lines 223 to 227"]
B100 -->|condition true| B102
B100 -->|condition false| B101
B101 -->|jump| B103
B102 -->|next| B103
B103 -->|call| B203
B103 -->|after return| B104
B104 -->|call| B179
B104 -->|after return| B105
B105 -->|condition true| B107
B105 -->|condition false| B106
B106 -->|jump| B108
B107 -->|next| B108
B108 -->|condition true| B119
B108 -->|condition false| B109
B109 -->|call| B143
B109 -->|after return| B110
B203["Continue at B204 in section 21"]
B179["Continue at B180 in section 18"]
B119["Continue at B120 in section 12"]
B143["Continue at B144 in section 15"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
SUBB A,#30H
mov b,#10
mul ab
add a,r5
mov r5,a
jc more
```

### B102

```asm
sjmp O
```

### B103

```asm
inc r6
```

### B104

```asm
ACALL KEYPAD
```

### B105

```asm
ACALL WCHR
```

### B106

```asm
SUBB A,#30H
add a,r5
mov r5,a
jc more2
```

### B107

```asm
sjmp nextstep
```

### B108

```asm
inc r6
```

### B109

```asm
jb acc.0,ODDX
```

### B110

```asm
subb a,#2
mov r0,#3
LCALL PRINTOP2
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 228 to 228"]
B111["B112: instructions - lines 229 to 230"]
B112["B113: instructions - lines 231 to 231"]
B113["B114: AGAIN1923 - lines 232 to 232"]
B114["B115: instructions - lines 233 to 233"]
B115["B116: FLASHING - lines 237 to 238"]
B116["B117: instructions - lines 239 to 240"]
B117["B118: instructions - lines 241 to 241"]
B118["B119: instructions - lines 242 to 242"]
B119["B120: ODDX - lines 245 to 247"]
B110 -->|call| B157
B110 -->|after return| B111
B111 -->|call| B184
B111 -->|after return| B112
B112 -->|next| B113
B113 -->|call| B193
B113 -->|after return| B114
B114 -->|condition true| B113
B114 -->|condition false| B115
B115 -->|call| B193
B115 -->|after return| B116
B116 -->|call| B193
B116 -->|after return| B117
B117 -->|condition true| B115
B117 -->|condition false| B118
B118 -->|call| B129
B118 -->|after return| B119
B119 -->|call| B143
B119 -->|after return| B120
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
B129["Continue at B130 in section 13"]
B143["Continue at B144 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
LCALL INLCD
```

### B112

```asm
MOV DPTR,#EVENX
LCALL WSTR
```

### B113

```asm
mov r5,#3
```

### B114

```asm
lcall delay
```

### B115

```asm
djnz r5,again1923
```

### B116

```asm
mov p3,#0
acall delay
```

### B117

```asm
mov p3,#0ffh
acall delay
```

### B118

```asm
djnz r0,flashing
```

### B119

```asm
LCALL exitORmenu
```

### B120

```asm
add a,#2
LCALL PRINTOP2
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 248 to 248"]
B121["B122: instructions - lines 249 to 250"]
B122["B123: instructions - lines 251 to 251"]
B123["B124: AGAIN19213 - lines 252 to 252"]
B124["B125: instructions - lines 253 to 253"]
B125["B126: FLASHING2 - lines 256 to 257"]
B126["B127: instructions - lines 258 to 259"]
B127["B128: instructions - lines 260 to 260"]
B128["B129: instructions - lines 261 to 261"]
B129["B130: EXITORMENU - lines 266 to 266"]
B120 -->|call| B157
B120 -->|after return| B121
B121 -->|call| B184
B121 -->|after return| B122
B122 -->|next| B123
B123 -->|call| B193
B123 -->|after return| B124
B124 -->|condition true| B123
B124 -->|condition false| B125
B125 -->|call| B193
B125 -->|after return| B126
B126 -->|call| B193
B126 -->|after return| B127
B127 -->|condition true| B125
B127 -->|condition false| B128
B128 -->|call| B129
B128 -->|after return| B129
B129 -->|call| B157
B129 -->|after return| B130
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
LCALL INLCD
```

### B122

```asm
MOV DPTR,#ODDX
LCALL WSTR
```

### B123

```asm
mov r5,#3
```

### B124

```asm
lcall delay
```

### B125

```asm
djnz r5,again19213
```

### B126

```asm
mov p3,#0
acall delay
```

### B127

```asm
mov p3,#0ffh
acall delay
```

### B128

```asm
djnz r0,flashing2
```

### B129

```asm
LCALL exitORmenu
```

### B130

```asm
LCALL INLCD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 267 to 268"]
B131["B132: instructions - lines 269 to 269"]
B132["B133: AGAIN17 - lines 270 to 270"]
B133["B134: instructions - lines 271 to 271"]
B134["B135: instructions - lines 272 to 273"]
B135["B136: instructions - lines 274 to 275"]
B136["B137: instructions - lines 276 to 276"]
B137["B138: instructions - lines 277 to 278"]
B138["B139: instructions - lines 279 to 279"]
B139["B140: AGAIN18 - lines 280 to 280"]
B130 -->|call| B184
B130 -->|after return| B131
B131 -->|next| B132
B132 -->|call| B193
B132 -->|after return| B133
B133 -->|condition true| B132
B133 -->|condition false| B134
B134 -->|call| B177
B134 -->|after return| B135
B135 -->|call| B177
B135 -->|after return| B136
B136 -->|call| B189
B136 -->|after return| B137
B137 -->|call| B184
B137 -->|after return| B138
B138 -->|next| B139
B139 -->|call| B193
B139 -->|after return| B140
B184["Continue at B185 in section 19"]
B193["Continue at B194 in section 20"]
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV DPTR,#EXIT_MEN
LCALL WSTR
```

### B132

```asm
mov r5,#3
```

### B133

```asm
lcall delay
```

### B134

```asm
djnz r5,again17
```

### B135

```asm
MOV A,#0CH
LCALL CMD
```

### B136

```asm
MOV A,#0H
LCALL CMD
```

### B137

```asm
LCALL LDELAY
```

### B138

```asm
MOV DPTR,#EXIT_MENU
LCALL WSTR
```

### B139

```asm
mov r5,#3
```

### B140

```asm
lcall delay
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 281 to 281"]
B141["B142: instructions - lines 282 to 282"]
B142["B143: instructions - lines 283 to 283"]
B143["B144: PRINTOP2 - lines 289 to 289"]
B144["B145: instructions - lines 290 to 291"]
B145["B146: instructions - lines 292 to 293"]
B146["B147: instructions - lines 294 to 309"]
B147["B148: instructions - lines 311 to 311"]
B148["B149: instructions - lines 312 to 313"]
B149["B150: instructions - lines 314 to 315"]
B140 -->|condition true| B139
B140 -->|condition false| B141
B141 -->|jump| B8
B143 -->|call| B157
B143 -->|after return| B144
B144 -->|call| B184
B144 -->|after return| B145
B145 -->|call| B177
B145 -->|after return| B146
B146 -->|call| B177
B146 -->|after return| B147
B147 -->|call| B189
B147 -->|after return| B148
B148 -->|call| B179
B148 -->|after return| B149
B149 -->|call| B179
B149 -->|after return| B150
B139["Continue at B140 in section 14"]
B8["Continue at B9 in section 1"]
B157["Continue at B158 in section 16"]
B184["Continue at B185 in section 19"]
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
B179["Continue at B180 in section 18"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
djnz r5,again18
```

### B142

```asm
AJMP MENU
```

### B143

Return to the instruction following the active call.

```asm
ret
```

### B144

```asm
LCALL INLCD
```

### B145

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B146

```asm
MOV A,#80h
ACALL CMD
```

### B147

```asm
MOV 51H,R5
MOV A,51H
MOV B,#100
DIV AB
ADD A,#30H
MOV A,32H
MOV A,B
MOV B,#10
DIV AB
ADD A,#30H
MOV 33H,A
MOV A,B
ADD A,#30H
MOV 34H,A
MOV A,#090H
LCALL CMD
```

### B148

```asm
LCALL LDELAY
```

### B149

```asm
MOV A,32H
LCALL WCHR
```

### B150

```asm
MOV A,33H
LCALL WCHR
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 316 to 317"]
B151["B152: instructions - lines 320 to 320"]
B152["B153: instructions - lines 321 to 321"]
B153["B154: instructions - lines 322 to 322"]
B154["B155: instructions - lines 323 to 323"]
B155["B156: SS - lines 324 to 324"]
B156["B157: instructions - lines 325 to 325"]
B157["B158: INLCD - lines 330 to 331"]
B158["B159: WAIT - lines 333 to 333"]
B159["B160: instructions - lines 334 to 334"]
B150 -->|call| B179
B150 -->|after return| B151
B151 -->|call| B179
B151 -->|after return| B152
B152 -->|call| B193
B152 -->|after return| B153
B153 -->|call| B193
B153 -->|after return| B154
B154 -->|call| B193
B154 -->|after return| B155
B155 -->|jump| B155
B157 -->|next| B158
B158 -->|call| B189
B158 -->|after return| B159
B159 -->|condition true| B158
B159 -->|condition false| B160
B179["Continue at B180 in section 18"]
B193["Continue at B194 in section 20"]
B189["Continue at B190 in section 19"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,34H
LCALL WCHR
```

### B152

```asm
LCALL WCHR
```

### B153

```asm
LCALL DELAY
```

### B154

```asm
LCALL DELAY
```

### B155

```asm
LCALL DELAY
```

### B156

```asm
SJMP SS
```

### B157

Return to the instruction following the active call.

```asm
RET
```

### B158

```asm
PUSH 7
MOV R7,#20
```

### B159

```asm
ACALL LDELAY
```

### B160

```asm
DJNZ R7,WAIT
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 335 to 337"]
B161["B162: instructions - lines 338 to 338"]
B162["B163: instructions - lines 339 to 340"]
B163["B164: instructions - lines 341 to 342"]
B164["B165: instructions - lines 343 to 344"]
B165["B166: instructions - lines 345 to 346"]
B166["B167: instructions - lines 347 to 348"]
B167["B168: instructions - lines 349 to 350"]
B168["B169: instructions - lines 351 to 352"]
B169["B170: instructions - lines 353 to 355"]
B160 -->|call| B177
B160 -->|after return| B161
B161 -->|call| B189
B161 -->|after return| B162
B162 -->|call| B177
B162 -->|after return| B163
B163 -->|call| B177
B163 -->|after return| B164
B164 -->|call| B177
B164 -->|after return| B165
B165 -->|call| B177
B165 -->|after return| B166
B166 -->|call| B177
B166 -->|after return| B167
B167 -->|call| B177
B167 -->|after return| B168
B168 -->|call| B177
B168 -->|after return| B169
B169 -->|call| B177
B169 -->|after return| B170
B177["Continue at B178 in section 18"]
B189["Continue at B190 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B162

```asm
ACALL LDELAY
```

### B163

```asm
MOV A,#0011B
ACALL CMD
```

### B164

```asm
MOV A,#0011B
ACALL CMD
```

### B165

```asm
MOV A,#0010B
ACALL CMD
```

### B166

```asm
MOV A,#0010B
ACALL CMD
```

### B167

```asm
MOV A,#1000B
ACALL CMD
```

### B168

```asm
MOV A,#0000B
ACALL CMD
```

### B169

```asm
MOV A,#1000B
ACALL CMD
```

### B170

```asm
MOV A,#0
ACALL CMD
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 356 to 357"]
B171["B172: instructions - lines 358 to 358"]
B172["B173: instructions - lines 359 to 360"]
B173["B174: instructions - lines 361 to 362"]
B174["B175: instructions - lines 363 to 364"]
B175["B176: instructions - lines 365 to 366"]
B176["B177: instructions - lines 367 to 368"]
B177["B178: CMD - lines 373 to 374"]
B178["B179: instructions - lines 375 to 375"]
B179["B180: WCHR - lines 378 to 383"]
B170 -->|call| B177
B170 -->|after return| B171
B171 -->|call| B189
B171 -->|after return| B172
B172 -->|call| B177
B172 -->|after return| B173
B173 -->|call| B177
B173 -->|after return| B174
B174 -->|call| B177
B174 -->|after return| B175
B175 -->|call| B177
B175 -->|after return| B176
B177 -->|call| B182
B177 -->|after return| B178
B179 -->|call| B182
B179 -->|after return| B180
B189["Continue at B190 in section 19"]
B182["Continue at B183 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV A,#0001B
ACALL CMD
```

### B172

```asm
ACALL LDELAY
```

### B173

```asm
MOV A,#0000B
ACALL CMD
```

### B174

```asm
MOV A,#0110B
ACALL CMD
```

### B175

```asm
MOV A,#0000B
ACALL CMD
```

### B176

```asm
MOV A,#1111B
ACALL CMD
```

### B177

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B178

```asm
CLR RS
ACALL COMMON
```

### B179

Return to the instruction following the active call.

```asm
RET
```

### B180

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 384 to 385"]
B181["B182: instructions - lines 386 to 388"]
B182["B183: COMMON - lines 391 to 398"]
B183["B184: instructions - lines 400 to 400"]
B184["B185: WSTR - lines 403 to 403"]
B185["B186: CONT1 - lines 405 to 407"]
B186["B187: instructions - lines 408 to 408"]
B187["B188: instructions - lines 409 to 410"]
B188["B189: EXIT1 - lines 412 to 413"]
B189["B190: LDELAY - lines 416 to 418"]
B180 -->|call| B182
B180 -->|after return| B181
B182 -->|call| B189
B182 -->|after return| B183
B184 -->|next| B185
B185 -->|condition true| B188
B185 -->|condition false| B186
B186 -->|call| B179
B186 -->|after return| B187
B187 -->|jump| B185
B189 -->|next| B190
B179["Continue at B180 in section 18"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV A,B
ACALL COMMON
```

### B182

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B183

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

### B184

Return to the instruction following the active call.

```asm
RET
```

### B185

```asm
PUSH ACC
```

### B186

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B187

```asm
ACALL WCHR
```

### B188

```asm
INC DPTR
AJMP CONT1
```

### B189

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B190

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

## Section 20

```mermaid
flowchart TD
B190["B191: CON4 - lines 420 to 421"]
B191["B192: instructions - lines 422 to 422"]
B192["B193: instructions - lines 423 to 425"]
B193["B194: DELAY - lines 427 to 430"]
B194["B195: X36 - lines 431 to 431"]
B195["B196: X26 - lines 432 to 432"]
B196["B197: X16 - lines 433 to 433"]
B197["B198: instructions - lines 434 to 434"]
B198["B199: instructions - lines 435 to 435"]
B199["B200: instructions - lines 436 to 439"]
B190 -->|condition true| B190
B190 -->|condition false| B191
B191 -->|condition true| B190
B191 -->|condition false| B192
B193 -->|next| B194
B194 -->|next| B195
B195 -->|next| B196
B196 -->|condition true| B196
B196 -->|condition false| B197
B197 -->|condition true| B195
B197 -->|condition false| B198
B198 -->|condition true| B194
B198 -->|condition false| B199
```

### B191

```asm
MOV R0,#250
DJNZ R0,$
```

### B192

```asm
DJNZ R1,CON4
```

### B193

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B194

```asm
PUSH 5
PUSH 4
PUSH 3
MOV R5,#2
```

### B195

```asm
MOV R4,#2
```

### B196

```asm
MOV R3,#250
```

### B197

```asm
DJNZ R3,X16
```

### B198

```asm
DJNZ R4,X26
```

### B199

```asm
DJNZ R5,X36
```

### B200

Return to the instruction following the active call.

```asm
POP 3
POP 4
POP 5
RET
```

## Section 21

```mermaid
flowchart TD
B200["B201: TMSEC - lines 441 to 444"]
B201["B202: BACK - lines 445 to 445"]
B202["B203: instructions - lines 446 to 448"]
B203["B204: KEYPAD - lines 451 to 451"]
B204["B205: K1 - lines 453 to 456"]
B205["B206: K2 - lines 458 to 458"]
B206["B207: instructions - lines 459 to 461"]
B207["B208: instructions - lines 462 to 462"]
B208["B209: OVER - lines 465 to 465"]
B209["B210: instructions - lines 466 to 468"]
B200 -->|next| B201
B201 -->|condition true| B201
B201 -->|condition false| B202
B203 -->|next| B204
B204 -->|condition true| B204
B204 -->|condition false| B205
B205 -->|call| B200
B205 -->|after return| B206
B206 -->|condition true| B208
B206 -->|condition false| B207
B207 -->|jump| B205
B208 -->|call| B200
B208 -->|after return| B209
B209 -->|condition true| B211
B209 -->|condition false| B210
B211["Continue at B212 in section 22"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B202

```asm
JNB TF0,BACK
```

### B203

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B204

```asm
MOV P2,#11110000B
```

### B205

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B206

```asm
ACALL TMSEC
```

### B207

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B208

```asm
SJMP K2
```

### B209

```asm
ACALL TMSEC
```

### B210

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 469 to 469"]
B211["B212: OVER1 - lines 472 to 475"]
B212["B213: instructions - lines 477 to 480"]
B213["B214: instructions - lines 482 to 485"]
B214["B215: instructions - lines 487 to 490"]
B215["B216: instructions - lines 492 to 492"]
B216["B217: ROW_0 - lines 494 to 495"]
B217["B218: ROW_1 - lines 497 to 498"]
B218["B219: ROW_2 - lines 500 to 501"]
B219["B220: ROW_3 - lines 503 to 503"]
B210 -->|jump| B205
B211 -->|condition true| B216
B211 -->|condition false| B212
B212 -->|condition true| B217
B212 -->|condition false| B213
B213 -->|condition true| B218
B213 -->|condition false| B214
B214 -->|condition true| B219
B214 -->|condition false| B215
B215 -->|jump| B205
B216 -->|jump| B220
B217 -->|jump| B220
B218 -->|jump| B220
B219 -->|next| B220
B205["Continue at B206 in section 21"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
SJMP K2
```

### B212

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B213

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B214

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B215

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B216

```asm
LJMP K2
```

### B217

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B218

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B219

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B220

```asm
MOV DPTR,#KCODE3
```

## Section 23

```mermaid
flowchart TD
B220["B221: FIND - lines 506 to 506"]
B221["B222: FIND1 - lines 509 to 510"]
B222["B223: instructions - lines 511 to 512"]
B223["B224: MATCH - lines 515 to 517"]
B224["B225: ENDOFCODE - lines 547 to 547"]
B220 -->|next| B221
B221 -->|condition true| B223
B221 -->|condition false| B222
B222 -->|jump| B221
```

### B221

```asm
SWAP A
```

### B222

```asm
RRC A
JNC MATCH
```

### B223

```asm
INC DPTR
SJMP FIND1
```

### B224

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B225

Resume the interrupted program.

```asm
RETI
```
