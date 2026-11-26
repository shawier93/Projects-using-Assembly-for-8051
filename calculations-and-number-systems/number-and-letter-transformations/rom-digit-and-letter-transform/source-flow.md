# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 03H` begins at B2.
- `ORG 30h` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20)

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
B2 -->|call| B152
B2 -->|after return| B3
B3 -->|call| B179
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B188
B5 -->|after return| B6
B6 -->|condition true| B5
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|call| B152
B8 -->|after return| B9
B9 -->|call| B179
B9 -->|after return| B10
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
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
B11 -->|call| B188
B11 -->|after return| B12
B12 -->|condition true| B11
B12 -->|condition false| B13
B13 -->|call| B172
B13 -->|after return| B14
B14 -->|call| B172
B14 -->|after return| B15
B15 -->|call| B184
B15 -->|after return| B16
B16 -->|call| B179
B16 -->|after return| B17
B17 -->|next| B18
B18 -->|call| B188
B18 -->|after return| B19
B19 -->|condition true| B18
B19 -->|condition false| B20
B188["Continue at B189 in section 19"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B179["Continue at B180 in section 18"]
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
B20 -->|call| B152
B20 -->|after return| B21
B21 -->|call| B179
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|call| B188
B23 -->|after return| B24
B24 -->|condition true| B23
B24 -->|condition false| B25
B25 -->|call| B172
B25 -->|after return| B26
B26 -->|call| B172
B26 -->|after return| B27
B27 -->|call| B184
B27 -->|after return| B28
B28 -->|call| B179
B28 -->|after return| B29
B29 -->|next| B30
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
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
B30 -->|call| B188
B30 -->|after return| B31
B31 -->|condition true| B30
B31 -->|condition false| B32
B32 -->|call| B152
B32 -->|after return| B33
B33 -->|call| B179
B33 -->|after return| B34
B34 -->|next| B35
B35 -->|call| B188
B35 -->|after return| B36
B36 -->|condition true| B35
B36 -->|condition false| B37
B37 -->|call| B152
B37 -->|after return| B38
B38 -->|call| B179
B38 -->|after return| B39
B39 -->|next| B40
B188["Continue at B189 in section 19"]
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
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
B47["B48: instructions - lines 82 to 82"]
B48["B49: OPTION2X - lines 90 to 90"]
B49["B50: instructions - lines 91 to 91"]
B40 -->|call| B188
B40 -->|after return| B41
B41 -->|condition true| B40
B41 -->|condition false| B42
B42 -->|call| B152
B42 -->|after return| B43
B43 -->|call| B179
B43 -->|after return| B44
B44 -->|next| B45
B45 -->|call| B188
B45 -->|after return| B46
B46 -->|condition true| B45
B46 -->|condition false| B47
B47 -->|next| B48
B48 -->|condition true| B77
B48 -->|condition false| B49
B49 -->|call| B152
B49 -->|after return| B50
B188["Continue at B189 in section 19"]
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
B77["Continue at B78 in section 8"]
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
```

### B49

```asm
cjne a,#2,exit
```

### B50

```asm
LCALL INLCD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 92 to 93"]
B51["B52: instructions - lines 94 to 94"]
B52["B53: AGAIN6779 - lines 95 to 95"]
B53["B54: instructions - lines 96 to 96"]
B54["B55: instructions - lines 99 to 106"]
B55["B56: instructions - lines 107 to 108"]
B56["B57: instructions - lines 109 to 109"]
B57["B58: instructions - lines 110 to 111"]
B58["B59: instructions - lines 112 to 112"]
B59["B60: AGAIN67579 - lines 113 to 113"]
B50 -->|call| B179
B50 -->|after return| B51
B51 -->|next| B52
B52 -->|call| B188
B52 -->|after return| B53
B53 -->|condition true| B52
B53 -->|condition false| B54
B54 -->|call| B172
B54 -->|after return| B55
B55 -->|call| B172
B55 -->|after return| B56
B56 -->|call| B184
B56 -->|after return| B57
B57 -->|call| B179
B57 -->|after return| B58
B58 -->|next| B59
B59 -->|call| B188
B59 -->|after return| B60
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV DPTR,#ENTERL
LCALL WSTR
```

### B52

```asm
mov r5,#2
```

### B53

```asm
lcall delay
```

### B54

```asm
djnz r5,again6779
```

### B55

```asm
mov dptr,#n2
clr a
movc a,@a+dptr
mov r7,a
MOV A,#0CH
ACALL CMD
```

### B56

```asm
MOV A,#0H
ACALL CMD
```

### B57

```asm
ACALL LDELAY
```

### B58

```asm
MOV DPTR,#ENTERD
LCALL WSTR
```

### B59

```asm
mov r5,#2
```

### B60

```asm
lcall delay
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 114 to 114"]
B61["B62: instructions - lines 117 to 123"]
B62["B63: X - lines 125 to 127"]
B63["B64: instructions - lines 128 to 128"]
B64["B65: instructions - lines 129 to 130"]
B65["B66: instructions - lines 131 to 131"]
B66["B67: AGAIN67879 - lines 132 to 132"]
B67["B68: instructions - lines 133 to 133"]
B68["B69: instructions - lines 134 to 135"]
B69["B70: instructions - lines 136 to 137"]
B60 -->|condition true| B59
B60 -->|condition false| B61
B61 -->|next| B62
B62 -->|condition true| B62
B62 -->|condition false| B63
B63 -->|call| B152
B63 -->|after return| B64
B64 -->|call| B179
B64 -->|after return| B65
B65 -->|next| B66
B66 -->|call| B188
B66 -->|after return| B67
B67 -->|condition true| B66
B67 -->|condition false| B68
B68 -->|call| B172
B68 -->|after return| B69
B69 -->|call| B172
B69 -->|after return| B70
B59["Continue at B60 in section 6"]
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
B172["Continue at B173 in section 18"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
djnz r5,again67579
```

### B62

```asm
inc dptr
clr a
movc a,@a+dptr
inc a
mov r1,a
mov r0,#70h
mov a,r7
```

### B63

```asm
mov @r0,a
inc r0
djnz r1,x
```

### B64

```asm
ACALL INLCD
```

### B65

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B66

```asm
mov r5,#2
```

### B67

```asm
lcall delay
```

### B68

```asm
djnz r5,again67879
```

### B69

```asm
MOV A,#0CH
ACALL CMD
```

### B70

```asm
MOV A,#0H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 138 to 138"]
B71["B72: CODEX - lines 141 to 142"]
B72["B73: instructions - lines 143 to 143"]
B73["B74: AGAIN8454 - lines 144 to 144"]
B74["B75: instructions - lines 145 to 145"]
B75["B76: instructions - lines 146 to 146"]
B76["B77: instructions - lines 147 to 147"]
B77["B78: EXIT - lines 152 to 152"]
B78["B79: instructions - lines 153 to 153"]
B79["B80: instructions - lines 154 to 155"]
B70 -->|call| B184
B70 -->|after return| B71
B71 -->|call| B174
B71 -->|after return| B72
B72 -->|next| B73
B73 -->|call| B188
B73 -->|after return| B74
B74 -->|condition true| B73
B74 -->|condition false| B75
B75 -->|condition true| B71
B75 -->|condition false| B76
B76 -->|jump| B118
B77 -->|condition true| B84
B77 -->|condition false| B78
B78 -->|call| B152
B78 -->|after return| B79
B79 -->|call| B179
B79 -->|after return| B80
B184["Continue at B185 in section 19"]
B174["Continue at B175 in section 18"]
B188["Continue at B189 in section 19"]
B118["Continue at B119 in section 12"]
B84["Continue at B85 in section 9"]
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL LDELAY
```

### B72

```asm
MOV A,70H
ACALL WCHR
```

### B73

```asm
mov r5,#2
```

### B74

```asm
lcall delay
```

### B75

```asm
djnz r5,again8454
```

### B76

```asm
DJNZ 71H,CODEX
```

### B77

```asm
LJMP EXITORMENU
```

### B78

```asm
cjne a,#3,OPTION1
```

### B79

```asm
LCALL INLCD
```

### B80

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 156 to 156"]
B81["B82: AGAIN16 - lines 157 to 157"]
B82["B83: instructions - lines 158 to 158"]
B83["B84: instructions - lines 159 to 159"]
B84["B85: OPTION1 - lines 165 to 165"]
B85["B86: instructions - lines 168 to 169"]
B86["B87: instructions - lines 170 to 170"]
B87["B88: AGAIN10 - lines 171 to 171"]
B88["B89: instructions - lines 172 to 172"]
B89["B90: H - lines 175 to 177"]
B80 -->|next| B81
B81 -->|call| B188
B81 -->|after return| B82
B82 -->|condition true| B81
B82 -->|condition false| B83
B83 -->|jump| B198
B84 -->|call| B152
B84 -->|after return| B85
B85 -->|call| B179
B85 -->|after return| B86
B86 -->|next| B87
B87 -->|call| B188
B87 -->|after return| B88
B88 -->|condition true| B87
B88 -->|condition false| B89
B89 -->|next| B90
B188["Continue at B189 in section 19"]
B198["Continue at B199 in section 20"]
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
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
djnz r5,again16
```

### B84

```asm
LJMP endofcode
```

### B85

```asm
LCALL INLCD
```

### B86

```asm
MOV DPTR,#ENTERC
LCALL WSTR
```

### B87

```asm
mov r5,#3
```

### B88

```asm
lcall delay
```

### B89

```asm
djnz r5,again10
```

### B90

```asm
mov dptr,#n
clr a
movc a,@a+dptr
```

## Section 10

```mermaid
flowchart TD
B90["B91: M - lines 181 to 184"]
B91["B92: T - lines 187 to 195"]
B92["B93: instructions - lines 196 to 196"]
B93["B94: MORE - lines 198 to 198"]
B94["B95: O - lines 201 to 207"]
B95["B96: instructions - lines 208 to 208"]
B96["B97: MORE2 - lines 211 to 211"]
B97["B98: NEXTSTEP - lines 214 to 214"]
B98["B99: EVENX - lines 216 to 220"]
B99["B100: instructions - lines 221 to 221"]
B90 -->|next| B91
B91 -->|condition true| B93
B91 -->|condition false| B92
B92 -->|jump| B94
B93 -->|next| B94
B94 -->|condition true| B96
B94 -->|condition false| B95
B95 -->|jump| B97
B96 -->|next| B97
B97 -->|condition true| B108
B97 -->|condition false| B98
B98 -->|call| B132
B98 -->|after return| B99
B99 -->|call| B152
B99 -->|after return| B100
B108["Continue at B109 in section 11"]
B132["Continue at B133 in section 14"]
B152["Continue at B153 in section 16"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov b,#100
mul ab
mov r5,a
mov r6,b
```

### B92

```asm
inc dptr
clr a
movc a,@a+dptr
mov b,#10
mul ab
add a,r5
mov r5,a
jc more
```

### B93

```asm
sjmp O
```

### B94

```asm
inc r6
```

### B95

```asm
inc dptr
clr a
movc a,@a+dptr
add a,r5
mov r5,a
jc more2
```

### B96

```asm
sjmp nextstep
```

### B97

```asm
inc r6
```

### B98

```asm
jb acc.0,ODDX
```

### B99

```asm
subb a,#2
mov r0,#3
LCALL PRINTOP2
```

### B100

```asm
LCALL INLCD
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 222 to 223"]
B101["B102: instructions - lines 224 to 224"]
B102["B103: AGAIN1923 - lines 225 to 225"]
B103["B104: instructions - lines 226 to 226"]
B104["B105: FLASHING - lines 230 to 231"]
B105["B106: instructions - lines 232 to 233"]
B106["B107: instructions - lines 234 to 234"]
B107["B108: instructions - lines 235 to 235"]
B108["B109: ODDX - lines 238 to 240"]
B109["B110: instructions - lines 241 to 241"]
B100 -->|call| B179
B100 -->|after return| B101
B101 -->|next| B102
B102 -->|call| B188
B102 -->|after return| B103
B103 -->|condition true| B102
B103 -->|condition false| B104
B104 -->|call| B188
B104 -->|after return| B105
B105 -->|call| B188
B105 -->|after return| B106
B106 -->|condition true| B104
B106 -->|condition false| B107
B107 -->|call| B118
B107 -->|after return| B108
B108 -->|call| B132
B108 -->|after return| B109
B109 -->|call| B152
B109 -->|after return| B110
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
B118["Continue at B119 in section 12"]
B132["Continue at B133 in section 14"]
B152["Continue at B153 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV DPTR,#EVENX
LCALL WSTR
```

### B102

```asm
mov r5,#3
```

### B103

```asm
lcall delay
```

### B104

```asm
djnz r5,again1923
```

### B105

```asm
mov p3,#0
acall delay
```

### B106

```asm
mov p3,#0ffh
acall delay
```

### B107

```asm
djnz r0,flashing
```

### B108

```asm
LCALL exitORmenu
```

### B109

```asm
add a,#2
LCALL PRINTOP2
```

### B110

```asm
LCALL INLCD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 242 to 243"]
B111["B112: instructions - lines 244 to 244"]
B112["B113: AGAIN19213 - lines 245 to 245"]
B113["B114: instructions - lines 246 to 246"]
B114["B115: FLASHING2 - lines 249 to 250"]
B115["B116: instructions - lines 251 to 252"]
B116["B117: instructions - lines 253 to 253"]
B117["B118: instructions - lines 254 to 254"]
B118["B119: EXITORMENU - lines 259 to 259"]
B119["B120: instructions - lines 260 to 261"]
B110 -->|call| B179
B110 -->|after return| B111
B111 -->|next| B112
B112 -->|call| B188
B112 -->|after return| B113
B113 -->|condition true| B112
B113 -->|condition false| B114
B114 -->|call| B188
B114 -->|after return| B115
B115 -->|call| B188
B115 -->|after return| B116
B116 -->|condition true| B114
B116 -->|condition false| B117
B117 -->|call| B118
B117 -->|after return| B118
B118 -->|call| B152
B118 -->|after return| B119
B119 -->|call| B179
B119 -->|after return| B120
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
B152["Continue at B153 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV DPTR,#ODDX
LCALL WSTR
```

### B112

```asm
mov r5,#3
```

### B113

```asm
lcall delay
```

### B114

```asm
djnz r5,again19213
```

### B115

```asm
mov p3,#0
acall delay
```

### B116

```asm
mov p3,#0ffh
acall delay
```

### B117

```asm
djnz r0,flashing2
```

### B118

```asm
LCALL exitORmenu
```

### B119

```asm
LCALL INLCD
```

### B120

```asm
MOV DPTR,#EXIT_MEN
LCALL WSTR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 262 to 262"]
B121["B122: AGAIN17 - lines 263 to 263"]
B122["B123: instructions - lines 264 to 264"]
B123["B124: instructions - lines 265 to 266"]
B124["B125: instructions - lines 267 to 268"]
B125["B126: instructions - lines 269 to 269"]
B126["B127: instructions - lines 270 to 271"]
B127["B128: instructions - lines 272 to 272"]
B128["B129: AGAIN18 - lines 273 to 273"]
B129["B130: instructions - lines 274 to 274"]
B120 -->|next| B121
B121 -->|call| B188
B121 -->|after return| B122
B122 -->|condition true| B121
B122 -->|condition false| B123
B123 -->|call| B172
B123 -->|after return| B124
B124 -->|call| B172
B124 -->|after return| B125
B125 -->|call| B184
B125 -->|after return| B126
B126 -->|call| B179
B126 -->|after return| B127
B127 -->|next| B128
B128 -->|call| B188
B128 -->|after return| B129
B129 -->|condition true| B128
B129 -->|condition false| B130
B188["Continue at B189 in section 19"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B179["Continue at B180 in section 18"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
mov r5,#3
```

### B122

```asm
lcall delay
```

### B123

```asm
djnz r5,again17
```

### B124

```asm
MOV A,#0CH
LCALL CMD
```

### B125

```asm
MOV A,#0H
LCALL CMD
```

### B126

```asm
LCALL LDELAY
```

### B127

```asm
MOV DPTR,#EXIT_MENU
LCALL WSTR
```

### B128

```asm
mov r5,#3
```

### B129

```asm
lcall delay
```

### B130

```asm
djnz r5,again18
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 275 to 275"]
B131["B132: instructions - lines 276 to 276"]
B132["B133: PRINTOP2 - lines 282 to 282"]
B133["B134: instructions - lines 283 to 284"]
B134["B135: instructions - lines 285 to 285"]
B135["B136: AGAIN19 - lines 286 to 286"]
B136["B137: instructions - lines 287 to 287"]
B137["B138: instructions - lines 288 to 302"]
B138["B139: instructions - lines 303 to 304"]
B139["B140: instructions - lines 305 to 305"]
B130 -->|jump| B8
B132 -->|call| B152
B132 -->|after return| B133
B133 -->|call| B179
B133 -->|after return| B134
B134 -->|next| B135
B135 -->|call| B188
B135 -->|after return| B136
B136 -->|condition true| B135
B136 -->|condition false| B137
B137 -->|call| B172
B137 -->|after return| B138
B138 -->|call| B172
B138 -->|after return| B139
B139 -->|call| B184
B139 -->|after return| B140
B8["Continue at B9 in section 1"]
B152["Continue at B153 in section 16"]
B179["Continue at B180 in section 18"]
B188["Continue at B189 in section 19"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
AJMP MENU
```

### B132

Return to the instruction following the active call.

```asm
ret
```

### B133

```asm
LCALL INLCD
```

### B134

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

### B135

```asm
mov r5,#3
```

### B136

```asm
lcall delay
```

### B137

```asm
djnz r5,again19
```

### B138

```asm
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
MOV A,#0CH
LCALL CMD
```

### B139

```asm
MOV A,#0H
LCALL CMD
```

### B140

```asm
LCALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 306 to 307"]
B141["B142: instructions - lines 308 to 309"]
B142["B143: instructions - lines 311 to 312"]
B143["B144: instructions - lines 313 to 313"]
B144["B145: instructions - lines 314 to 315"]
B145["B146: instructions - lines 316 to 317"]
B146["B147: instructions - lines 318 to 319"]
B147["B148: instructions - lines 320 to 321"]
B148["B149: instructions - lines 322 to 322"]
B149["B150: instructions - lines 323 to 323"]
B140 -->|call| B174
B140 -->|after return| B141
B141 -->|call| B172
B141 -->|after return| B142
B142 -->|call| B172
B142 -->|after return| B143
B143 -->|call| B184
B143 -->|after return| B144
B144 -->|call| B174
B144 -->|after return| B145
B145 -->|call| B172
B145 -->|after return| B146
B146 -->|call| B172
B146 -->|after return| B147
B147 -->|call| B174
B147 -->|after return| B148
B148 -->|call| B188
B148 -->|after return| B149
B149 -->|call| B188
B149 -->|after return| B150
B174["Continue at B175 in section 18"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B188["Continue at B189 in section 19"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,32H
LCALL WCHR
```

### B142

```asm
MOV A,#0CH
LCALL CMD
```

### B143

```asm
MOV A,#1H
LCALL CMD
```

### B144

```asm
LCALL LDELAY
```

### B145

```asm
MOV A,33H
LCALL WCHR
```

### B146

```asm
MOV A,#0CH
LCALL CMD
```

### B147

```asm
MOV A,#2H
LCALL CMD
```

### B148

```asm
MOV A,34H
LCALL WCHR
```

### B149

```asm
LCALL DELAY
```

### B150

```asm
LCALL DELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 324 to 324"]
B151["B152: instructions - lines 325 to 325"]
B152["B153: INLCD - lines 330 to 331"]
B153["B154: WAIT - lines 333 to 333"]
B154["B155: instructions - lines 334 to 334"]
B155["B156: instructions - lines 335 to 337"]
B156["B157: instructions - lines 338 to 338"]
B157["B158: instructions - lines 339 to 340"]
B158["B159: instructions - lines 341 to 342"]
B159["B160: instructions - lines 343 to 344"]
B150 -->|call| B188
B150 -->|after return| B151
B152 -->|next| B153
B153 -->|call| B184
B153 -->|after return| B154
B154 -->|condition true| B153
B154 -->|condition false| B155
B155 -->|call| B172
B155 -->|after return| B156
B156 -->|call| B184
B156 -->|after return| B157
B157 -->|call| B172
B157 -->|after return| B158
B158 -->|call| B172
B158 -->|after return| B159
B159 -->|call| B172
B159 -->|after return| B160
B188["Continue at B189 in section 19"]
B184["Continue at B185 in section 19"]
B172["Continue at B173 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
LCALL DELAY
```

### B152

Return to the instruction following the active call.

```asm
RET
```

### B153

```asm
PUSH 7
MOV R7,#20
```

### B154

```asm
ACALL LDELAY
```

### B155

```asm
DJNZ R7,WAIT
```

### B156

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B157

```asm
ACALL LDELAY
```

### B158

```asm
MOV A,#0011B
ACALL CMD
```

### B159

```asm
MOV A,#0011B
ACALL CMD
```

### B160

```asm
MOV A,#0010B
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 345 to 346"]
B161["B162: instructions - lines 347 to 348"]
B162["B163: instructions - lines 349 to 350"]
B163["B164: instructions - lines 351 to 352"]
B164["B165: instructions - lines 353 to 355"]
B165["B166: instructions - lines 356 to 357"]
B166["B167: instructions - lines 358 to 358"]
B167["B168: instructions - lines 359 to 360"]
B168["B169: instructions - lines 361 to 362"]
B169["B170: instructions - lines 363 to 364"]
B160 -->|call| B172
B160 -->|after return| B161
B161 -->|call| B172
B161 -->|after return| B162
B162 -->|call| B172
B162 -->|after return| B163
B163 -->|call| B172
B163 -->|after return| B164
B164 -->|call| B172
B164 -->|after return| B165
B165 -->|call| B172
B165 -->|after return| B166
B166 -->|call| B184
B166 -->|after return| B167
B167 -->|call| B172
B167 -->|after return| B168
B168 -->|call| B172
B168 -->|after return| B169
B169 -->|call| B172
B169 -->|after return| B170
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#0010B
ACALL CMD
```

### B162

```asm
MOV A,#1000B
ACALL CMD
```

### B163

```asm
MOV A,#0000B
ACALL CMD
```

### B164

```asm
MOV A,#1000B
ACALL CMD
```

### B165

```asm
MOV A,#0
ACALL CMD
```

### B166

```asm
MOV A,#0001B
ACALL CMD
```

### B167

```asm
ACALL LDELAY
```

### B168

```asm
MOV A,#0000B
ACALL CMD
```

### B169

```asm
MOV A,#0110B
ACALL CMD
```

### B170

```asm
MOV A,#0000B
ACALL CMD
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 365 to 366"]
B171["B172: instructions - lines 367 to 368"]
B172["B173: CMD - lines 373 to 374"]
B173["B174: instructions - lines 375 to 375"]
B174["B175: WCHR - lines 378 to 383"]
B175["B176: instructions - lines 384 to 385"]
B176["B177: instructions - lines 386 to 388"]
B177["B178: COMMON - lines 391 to 398"]
B178["B179: instructions - lines 400 to 400"]
B179["B180: WSTR - lines 403 to 403"]
B170 -->|call| B172
B170 -->|after return| B171
B172 -->|call| B177
B172 -->|after return| B173
B174 -->|call| B177
B174 -->|after return| B175
B175 -->|call| B177
B175 -->|after return| B176
B177 -->|call| B184
B177 -->|after return| B178
B179 -->|next| B180
B184["Continue at B185 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV A,#1111B
ACALL CMD
```

### B172

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B173

```asm
CLR RS
ACALL COMMON
```

### B174

Return to the instruction following the active call.

```asm
RET
```

### B175

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B176

```asm
MOV A,B
ACALL COMMON
```

### B177

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B178

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

### B179

Return to the instruction following the active call.

```asm
RET
```

### B180

```asm
PUSH ACC
```

## Section 19

```mermaid
flowchart TD
B180["B181: CONT1 - lines 405 to 407"]
B181["B182: instructions - lines 408 to 408"]
B182["B183: instructions - lines 409 to 410"]
B183["B184: EXIT1 - lines 412 to 413"]
B184["B185: LDELAY - lines 416 to 418"]
B185["B186: CON4 - lines 420 to 421"]
B186["B187: instructions - lines 422 to 422"]
B187["B188: instructions - lines 423 to 425"]
B188["B189: DELAY - lines 427 to 430"]
B189["B190: X36 - lines 431 to 431"]
B180 -->|condition true| B183
B180 -->|condition false| B181
B181 -->|call| B174
B181 -->|after return| B182
B182 -->|jump| B180
B184 -->|next| B185
B185 -->|condition true| B185
B185 -->|condition false| B186
B186 -->|condition true| B185
B186 -->|condition false| B187
B188 -->|next| B189
B189 -->|next| B190
B174["Continue at B175 in section 18"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B182

```asm
ACALL WCHR
```

### B183

```asm
INC DPTR
AJMP CONT1
```

### B184

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B185

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B186

```asm
MOV R0,#250
DJNZ R0,$
```

### B187

```asm
DJNZ R1,CON4
```

### B188

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B189

```asm
PUSH 5
PUSH 4
PUSH 3
MOV R5,#20
```

### B190

```asm
MOV R4,#200
```

## Section 20

```mermaid
flowchart TD
B190["B191: X26 - lines 432 to 432"]
B191["B192: X16 - lines 433 to 433"]
B192["B193: instructions - lines 434 to 434"]
B193["B194: instructions - lines 435 to 435"]
B194["B195: instructions - lines 436 to 439"]
B195["B196: TMSEC - lines 441 to 444"]
B196["B197: BACK - lines 445 to 445"]
B197["B198: instructions - lines 446 to 448"]
B198["B199: ENDOFCODE - lines 471 to 471"]
B190 -->|next| B191
B191 -->|condition true| B191
B191 -->|condition false| B192
B192 -->|condition true| B190
B192 -->|condition false| B193
B193 -->|condition true| B189
B193 -->|condition false| B194
B195 -->|next| B196
B196 -->|condition true| B196
B196 -->|condition false| B197
B189["Continue at B190 in section 19"]
```

### B191

```asm
MOV R3,#250
```

### B192

```asm
DJNZ R3,X16
```

### B193

```asm
DJNZ R4,X26
```

### B194

```asm
DJNZ R5,X36
```

### B195

Return to the instruction following the active call.

```asm
POP 3
POP 4
POP 5
RET
```

### B196

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B197

```asm
JNB TF0,BACK
```

### B198

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B199

Resume the interrupted program.

```asm
RETI
```
