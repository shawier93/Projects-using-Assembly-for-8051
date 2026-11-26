# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.
- `ORG 003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 11 to 11"]
B1["B2: instructions - lines 13 to 13"]
B2["B3: MAIN - lines 18 to 18"]
B3["B4: instructions - lines 19 to 20"]
B4["B5: instructions - lines 21 to 21"]
B5["B6: AGAIN - lines 22 to 22"]
B6["B7: instructions - lines 23 to 23"]
B7["B8: instructions - lines 24 to 25"]
B8["B9: instructions - lines 26 to 27"]
B9["B10: instructions - lines 28 to 28"]
B0 -->|jump| B2
B1 -->|jump| B13
B2 -->|call| B175
B2 -->|after return| B3
B3 -->|call| B202
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B211
B5 -->|after return| B6
B6 -->|condition true| B5
B6 -->|condition false| B7
B7 -->|call| B195
B7 -->|after return| B8
B8 -->|call| B195
B8 -->|after return| B9
B9 -->|call| B207
B9 -->|after return| B10
B13["Continue at B14 in section 2"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B195["Continue at B196 in section 20"]
B207["Continue at B208 in section 21"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
Ljmp Main
```

### B2

```asm
LJMP MENU
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
mov a,#0CH
acall cmd
```

### B9

```asm
mov a,#0h
acall cmd
```

### B10

```asm
acall ldelay
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 29 to 30"]
B11["B12: instructions - lines 32 to 33"]
B12["B13: START - lines 35 to 35"]
B13["B14: MENU - lines 38 to 38"]
B14["B15: instructions - lines 39 to 40"]
B15["B16: instructions - lines 41 to 41"]
B16["B17: AGAIN3 - lines 42 to 42"]
B17["B18: instructions - lines 43 to 43"]
B18["B19: instructions - lines 44 to 45"]
B19["B20: instructions - lines 46 to 47"]
B10 -->|call| B202
B10 -->|after return| B11
B11 -->|next| B12
B12 -->|jump| B12
B13 -->|call| B175
B13 -->|after return| B14
B14 -->|call| B202
B14 -->|after return| B15
B15 -->|next| B16
B16 -->|call| B211
B16 -->|after return| B17
B17 -->|condition true| B16
B17 -->|condition false| B18
B18 -->|call| B195
B18 -->|after return| B19
B19 -->|call| B195
B19 -->|after return| B20
B202["Continue at B203 in section 21"]
B175["Continue at B176 in section 18"]
B211["Continue at B212 in section 22"]
B195["Continue at B196 in section 20"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#PRESS
ACALL WSTR
```

### B12

```asm
MOV IE,#10000001B
SETB IT0
```

### B13

```asm
SJMP START
```

### B14

```asm
LCALL INLCD
```

### B15

```asm
MOV DPTR,#ONE
LCALL WSTR
```

### B16

```asm
mov r5,#2
```

### B17

```asm
lcall delay
```

### B18

```asm
djnz r5,again3
```

### B19

```asm
mov a,#0CH
acall cmd
```

### B20

```asm
mov a,#0h
acall cmd
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 48 to 48"]
B21["B22: instructions - lines 49 to 50"]
B22["B23: instructions - lines 51 to 51"]
B23["B24: AGAIN4 - lines 52 to 52"]
B24["B25: instructions - lines 53 to 53"]
B25["B26: instructions - lines 54 to 54"]
B26["B27: instructions - lines 55 to 56"]
B27["B28: instructions - lines 57 to 57"]
B28["B29: AGAIN5 - lines 58 to 58"]
B29["B30: instructions - lines 59 to 59"]
B20 -->|call| B207
B20 -->|after return| B21
B21 -->|call| B202
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|call| B211
B23 -->|after return| B24
B24 -->|condition true| B23
B24 -->|condition false| B25
B25 -->|call| B175
B25 -->|after return| B26
B26 -->|call| B202
B26 -->|after return| B27
B27 -->|next| B28
B28 -->|call| B211
B28 -->|after return| B29
B29 -->|condition true| B28
B29 -->|condition false| B30
B207["Continue at B208 in section 21"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B175["Continue at B176 in section 18"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
acall ldelay
```

### B22

```asm
MOV DPTR,#ONE_
LCALL WSTR
```

### B23

```asm
mov r5,#3
```

### B24

```asm
lcall delay
```

### B25

```asm
djnz r5,again4
```

### B26

```asm
LCALL INLCD
```

### B27

```asm
MOV DPTR,#TWO
LCALL WSTR
```

### B28

```asm
mov r5,#2
```

### B29

```asm
lcall delay
```

### B30

```asm
djnz r5,again5
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 60 to 61"]
B31["B32: instructions - lines 62 to 63"]
B32["B33: instructions - lines 64 to 64"]
B33["B34: instructions - lines 65 to 66"]
B34["B35: instructions - lines 67 to 67"]
B35["B36: AGAIN6 - lines 68 to 68"]
B36["B37: instructions - lines 69 to 69"]
B37["B38: instructions - lines 70 to 70"]
B38["B39: instructions - lines 71 to 72"]
B39["B40: instructions - lines 73 to 73"]
B30 -->|call| B195
B30 -->|after return| B31
B31 -->|call| B195
B31 -->|after return| B32
B32 -->|call| B207
B32 -->|after return| B33
B33 -->|call| B202
B33 -->|after return| B34
B34 -->|next| B35
B35 -->|call| B211
B35 -->|after return| B36
B36 -->|condition true| B35
B36 -->|condition false| B37
B37 -->|call| B175
B37 -->|after return| B38
B38 -->|call| B202
B38 -->|after return| B39
B39 -->|next| B40
B195["Continue at B196 in section 20"]
B207["Continue at B208 in section 21"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B175["Continue at B176 in section 18"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
mov a,#0CH
acall cmd
```

### B32

```asm
mov a,#0h
acall cmd
```

### B33

```asm
acall ldelay
```

### B34

```asm
MOV DPTR,#TWOL
LCALL WSTR
```

### B35

```asm
mov r5,#3
```

### B36

```asm
lcall delay
```

### B37

```asm
djnz r5,again6
```

### B38

```asm
LCALL INLCD
```

### B39

```asm
MOV DPTR,#TWOD
LCALL WSTR
```

### B40

```asm
mov r5,#2
```

## Section 5

```mermaid
flowchart TD
B40["B41: AGAIN7 - lines 74 to 74"]
B41["B42: instructions - lines 75 to 75"]
B42["B43: instructions - lines 76 to 76"]
B43["B44: instructions - lines 77 to 78"]
B44["B45: instructions - lines 79 to 79"]
B45["B46: AGAIN8 - lines 80 to 80"]
B46["B47: instructions - lines 81 to 81"]
B47["B48: instructions - lines 82 to 82"]
B48["B49: instructions - lines 83 to 84"]
B49["B50: instructions - lines 85 to 85"]
B40 -->|call| B211
B40 -->|after return| B41
B41 -->|condition true| B40
B41 -->|condition false| B42
B42 -->|call| B175
B42 -->|after return| B43
B43 -->|call| B202
B43 -->|after return| B44
B44 -->|next| B45
B45 -->|call| B211
B45 -->|after return| B46
B46 -->|condition true| B45
B46 -->|condition false| B47
B47 -->|call| B175
B47 -->|after return| B48
B48 -->|call| B202
B48 -->|after return| B49
B49 -->|next| B50
B211["Continue at B212 in section 22"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
lcall delay
```

### B42

```asm
djnz r5,again7
```

### B43

```asm
LCALL INLCD
```

### B44

```asm
MOV DPTR,#EXITT
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
djnz r5,again8
```

### B48

```asm
LCALL INLCD
```

### B49

```asm
MOV DPTR,#ENTERSEL
LCALL WSTR
```

### B50

```asm
mov r5,#2
```

## Section 6

```mermaid
flowchart TD
B50["B51: AGAIN9 - lines 86 to 86"]
B51["B52: instructions - lines 87 to 87"]
B52["B53: instructions - lines 90 to 93"]
B53["B54: instructions - lines 94 to 94"]
B54["B55: instructions - lines 95 to 95"]
B55["B56: OPTION2X - lines 100 to 100"]
B56["B57: instructions - lines 101 to 101"]
B57["B58: instructions - lines 102 to 103"]
B58["B59: instructions - lines 104 to 104"]
B59["B60: AGAIN6779 - lines 105 to 105"]
B50 -->|call| B211
B50 -->|after return| B51
B51 -->|condition true| B50
B51 -->|condition false| B52
B52 -->|call| B221
B52 -->|after return| B53
B53 -->|call| B197
B53 -->|after return| B54
B54 -->|next| B55
B55 -->|condition true| B90
B55 -->|condition false| B56
B56 -->|call| B175
B56 -->|after return| B57
B57 -->|call| B202
B57 -->|after return| B58
B58 -->|next| B59
B59 -->|call| B211
B59 -->|after return| B60
B211["Continue at B212 in section 22"]
B221["Continue at B222 in section 23"]
B197["Continue at B198 in section 20"]
B90["Continue at B91 in section 10"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
lcall delay
```

### B52

```asm
djnz r5,again9
```

### B53

```asm
mov a,#1
ACALL KEYPAD
```

### B54

```asm
ACALL WCHR
```

### B55

```asm
SUBB A,#30H
```

### B56

```asm
cjne a,#2,exit
```

### B57

```asm
LCALL INLCD
```

### B58

```asm
MOV DPTR,#ENTERL
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
B60["B61: instructions - lines 106 to 106"]
B61["B62: instructions - lines 109 to 109"]
B62["B63: instructions - lines 110 to 110"]
B63["B64: instructions - lines 111 to 111"]
B64["B65: instructions - lines 112 to 113"]
B65["B66: NOO - lines 115 to 120"]
B66["B67: instructions - lines 121 to 122"]
B67["B68: instructions - lines 123 to 123"]
B68["B69: instructions - lines 124 to 125"]
B69["B70: instructions - lines 126 to 126"]
B60 -->|condition true| B59
B60 -->|condition false| B61
B61 -->|call| B221
B61 -->|after return| B62
B62 -->|call| B197
B62 -->|after return| B63
B63 -->|condition true| B65
B63 -->|condition false| B64
B64 -->|next| B65
B65 -->|call| B195
B65 -->|after return| B66
B66 -->|call| B195
B66 -->|after return| B67
B67 -->|call| B207
B67 -->|after return| B68
B68 -->|call| B202
B68 -->|after return| B69
B69 -->|next| B70
B59["Continue at B60 in section 6"]
B221["Continue at B222 in section 23"]
B197["Continue at B198 in section 20"]
B195["Continue at B196 in section 20"]
B207["Continue at B208 in section 21"]
B202["Continue at B203 in section 21"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
djnz r5,again6779
```

### B62

```asm
ACALL KEYPAD
```

### B63

```asm
ACALL WCHR
```

### B64

```asm
CJNE A,#'Z',NOO
```

### B65

```asm
MOV A,#'A'
DEC A
```

### B66

```asm
INC a
mov r7,a
MOV A,#0CH
ACALL CMD
```

### B67

```asm
MOV A,#0H
ACALL CMD
```

### B68

```asm
ACALL LDELAY
```

### B69

```asm
MOV DPTR,#ENTERD
LCALL WSTR
```

### B70

```asm
mov r5,#2
```

## Section 8

```mermaid
flowchart TD
B70["B71: AGAIN67579 - lines 127 to 127"]
B71["B72: instructions - lines 128 to 128"]
B72["B73: instructions - lines 131 to 131"]
B73["B74: instructions - lines 132 to 132"]
B74["B75: instructions - lines 133 to 139"]
B75["B76: X - lines 141 to 143"]
B76["B77: instructions - lines 144 to 144"]
B77["B78: instructions - lines 145 to 146"]
B78["B79: instructions - lines 147 to 147"]
B79["B80: AGAIN67879 - lines 148 to 148"]
B70 -->|call| B211
B70 -->|after return| B71
B71 -->|condition true| B70
B71 -->|condition false| B72
B72 -->|call| B221
B72 -->|after return| B73
B73 -->|call| B197
B73 -->|after return| B74
B74 -->|next| B75
B75 -->|condition true| B75
B75 -->|condition false| B76
B76 -->|call| B175
B76 -->|after return| B77
B77 -->|call| B202
B77 -->|after return| B78
B78 -->|next| B79
B79 -->|call| B211
B79 -->|after return| B80
B211["Continue at B212 in section 22"]
B221["Continue at B222 in section 23"]
B197["Continue at B198 in section 20"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
lcall delay
```

### B72

```asm
djnz r5,again67579
```

### B73

```asm
ACALL KEYPAD
```

### B74

```asm
ACALL WCHR
```

### B75

```asm
SUBB A,#30H
ADD A,#1
MOV 78H,A
mov r1,a
mov r0,#70h
mov a,r7
```

### B76

```asm
mov @r0,a
inc r0
djnz r1,x
```

### B77

```asm
ACALL INLCD
```

### B78

```asm
MOV DPTR,#SECRET
LCALL WSTR
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
B80["B81: instructions - lines 149 to 149"]
B81["B82: instructions - lines 150 to 151"]
B82["B83: instructions - lines 152 to 153"]
B83["B84: instructions - lines 154 to 154"]
B84["B85: CODEX - lines 157 to 158"]
B85["B86: instructions - lines 159 to 159"]
B86["B87: AGAIN8454 - lines 160 to 160"]
B87["B88: instructions - lines 161 to 161"]
B88["B89: instructions - lines 162 to 162"]
B89["B90: instructions - lines 163 to 163"]
B80 -->|condition true| B79
B80 -->|condition false| B81
B81 -->|call| B195
B81 -->|after return| B82
B82 -->|call| B195
B82 -->|after return| B83
B83 -->|call| B207
B83 -->|after return| B84
B84 -->|call| B197
B84 -->|after return| B85
B85 -->|next| B86
B86 -->|call| B211
B86 -->|after return| B87
B87 -->|condition true| B86
B87 -->|condition false| B88
B88 -->|condition true| B84
B88 -->|condition false| B89
B89 -->|jump| B138
B79["Continue at B80 in section 8"]
B195["Continue at B196 in section 20"]
B207["Continue at B208 in section 21"]
B197["Continue at B198 in section 20"]
B211["Continue at B212 in section 22"]
B138["Continue at B139 in section 14"]
```

### B81

```asm
djnz r5,again67879
```

### B82

```asm
MOV A,#0CH
ACALL CMD
```

### B83

```asm
MOV A,#0H
ACALL CMD
```

### B84

```asm
ACALL LDELAY
```

### B85

```asm
MOV A,R7
ACALL WCHR
```

### B86

```asm
mov r5,#2
```

### B87

```asm
lcall delay
```

### B88

```asm
djnz r5,again8454
```

### B89

```asm
DJNZ 78H,CODEX
```

### B90

```asm
LJMP EXITORMENU
```

## Section 10

```mermaid
flowchart TD
B90["B91: EXIT - lines 168 to 168"]
B91["B92: instructions - lines 169 to 169"]
B92["B93: instructions - lines 170 to 171"]
B93["B94: instructions - lines 172 to 172"]
B94["B95: AGAIN16 - lines 173 to 173"]
B95["B96: instructions - lines 174 to 174"]
B96["B97: S - lines 175 to 175"]
B97["B98: instructions - lines 176 to 176"]
B98["B99: OPTION1 - lines 182 to 182"]
B99["B100: instructions - lines 185 to 186"]
B90 -->|condition true| B98
B90 -->|condition false| B91
B91 -->|call| B175
B91 -->|after return| B92
B92 -->|call| B202
B92 -->|after return| B93
B93 -->|next| B94
B94 -->|call| B211
B94 -->|after return| B95
B95 -->|condition true| B94
B95 -->|condition false| B96
B96 -->|jump| B96
B97 -->|jump| B242
B98 -->|call| B175
B98 -->|after return| B99
B99 -->|call| B202
B99 -->|after return| B100
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B242["Continue at B243 in section 25"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
cjne a,#3,OPTION1
```

### B92

```asm
LCALL INLCD
```

### B93

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

### B94

```asm
mov r5,#2
```

### B95

```asm
lcall delay
```

### B96

```asm
djnz r5,again16
```

### B97

```asm
SJMP S
```

### B98

```asm
LJMP endofcode
```

### B99

```asm
LCALL INLCD
```

### B100

```asm
MOV DPTR,#ENTERC
LCALL WSTR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 187 to 187"]
B101["B102: AGAIN10 - lines 188 to 188"]
B102["B103: instructions - lines 189 to 189"]
B103["B104: instructions - lines 190 to 191"]
B104["B105: instructions - lines 192 to 193"]
B105["B106: instructions - lines 195 to 195"]
B106["B107: instructions - lines 196 to 196"]
B107["B108: instructions - lines 197 to 197"]
B108["B109: M - lines 201 to 204"]
B109["B110: T - lines 207 to 207"]
B100 -->|next| B101
B101 -->|call| B211
B101 -->|after return| B102
B102 -->|condition true| B101
B102 -->|condition false| B103
B103 -->|call| B195
B103 -->|after return| B104
B104 -->|call| B195
B104 -->|after return| B105
B105 -->|call| B221
B105 -->|after return| B106
B106 -->|call| B197
B106 -->|after return| B107
B107 -->|next| B108
B108 -->|next| B109
B109 -->|call| B221
B109 -->|after return| B110
B211["Continue at B212 in section 22"]
B195["Continue at B196 in section 20"]
B221["Continue at B222 in section 23"]
B197["Continue at B198 in section 20"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov r5,#3
```

### B102

```asm
lcall delay
```

### B103

```asm
djnz r5,again10
```

### B104

```asm
MOV A,#0CH
LCALL CMD
```

### B105

```asm
MOV A,#2H
LCALL CMD
```

### B106

```asm
ACALL KEYPAD
```

### B107

```asm
ACALL WCHR
```

### B108

```asm
SUBB A,#30H
```

### B109

```asm
mov b,#100
mul ab
mov r5,a
mov r6,b
```

### B110

```asm
ACALL KEYPAD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 208 to 208"]
B111["B112: instructions - lines 209 to 215"]
B112["B113: instructions - lines 216 to 216"]
B113["B114: MORE - lines 218 to 218"]
B114["B115: O - lines 221 to 221"]
B115["B116: instructions - lines 222 to 222"]
B116["B117: instructions - lines 223 to 228"]
B117["B118: instructions - lines 229 to 229"]
B118["B119: MORE2 - lines 233 to 233"]
B119["B120: NEXTSTEP - lines 236 to 236"]
B110 -->|call| B197
B110 -->|after return| B111
B111 -->|condition true| B113
B111 -->|condition false| B112
B112 -->|jump| B114
B113 -->|next| B114
B114 -->|call| B221
B114 -->|after return| B115
B115 -->|call| B197
B115 -->|after return| B116
B116 -->|condition true| B118
B116 -->|condition false| B117
B117 -->|jump| B119
B118 -->|next| B119
B119 -->|call| B174
B119 -->|after return| B120
B197["Continue at B198 in section 20"]
B221["Continue at B222 in section 23"]
B174["Continue at B175 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL WCHR
```

### B112

```asm
SUBB A,#30H
mov b,#10
mul ab
add a,r5
mov r5,a
jc more
```

### B113

```asm
sjmp O
```

### B114

```asm
inc r6
```

### B115

```asm
ACALL KEYPAD
```

### B116

```asm
ACALL WCHR
```

### B117

```asm
SUBB A,#30H
add a,r5
mov r5,a
jc more2
```

### B118

```asm
sjmp nextstep
```

### B119

```asm
inc r6
```

### B120

```asm
ACALL ENTERED_NUMER
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 237 to 237"]
B121["B122: EVENX - lines 239 to 245"]
B122["B123: instructions - lines 246 to 246"]
B123["B124: instructions - lines 247 to 248"]
B124["B125: instructions - lines 249 to 249"]
B125["B126: AGAIN1923 - lines 250 to 250"]
B126["B127: instructions - lines 251 to 251"]
B127["B128: FLASHING - lines 255 to 256"]
B128["B129: instructions - lines 257 to 258"]
B129["B130: instructions - lines 259 to 259"]
B120 -->|condition true| B131
B120 -->|condition false| B121
B121 -->|call| B158
B121 -->|after return| B122
B122 -->|call| B175
B122 -->|after return| B123
B123 -->|call| B202
B123 -->|after return| B124
B124 -->|next| B125
B125 -->|call| B211
B125 -->|after return| B126
B126 -->|condition true| B125
B126 -->|condition false| B127
B127 -->|call| B211
B127 -->|after return| B128
B128 -->|call| B211
B128 -->|after return| B129
B129 -->|condition true| B127
B129 -->|condition false| B130
B131["Continue at B132 in section 14"]
B158["Continue at B159 in section 16"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
jb acc.0,ODDX
```

### B122

```asm
MOV A,R5
subb a,#2
mov r5,a
mov r0,#3
LCALL PRINTOP2
```

### B123

```asm
LCALL INLCD
```

### B124

```asm
MOV DPTR,#EVENN
LCALL WSTR
```

### B125

```asm
mov r4,#3
```

### B126

```asm
lcall delay
```

### B127

```asm
djnz r4,again1923
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
djnz r0,flashing
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 260 to 260"]
B131["B132: ODDX - lines 263 to 268"]
B132["B133: instructions - lines 269 to 269"]
B133["B134: instructions - lines 270 to 271"]
B134["B135: FLASHING2 - lines 275 to 276"]
B135["B136: instructions - lines 277 to 278"]
B136["B137: instructions - lines 279 to 279"]
B137["B138: instructions - lines 280 to 280"]
B138["B139: EXITORMENU - lines 286 to 286"]
B139["B140: instructions - lines 287 to 288"]
B130 -->|call| B138
B130 -->|after return| B131
B131 -->|call| B158
B131 -->|after return| B132
B132 -->|call| B175
B132 -->|after return| B133
B133 -->|call| B202
B133 -->|after return| B134
B134 -->|call| B211
B134 -->|after return| B135
B135 -->|call| B211
B135 -->|after return| B136
B136 -->|condition true| B134
B136 -->|condition false| B137
B137 -->|call| B138
B137 -->|after return| B138
B138 -->|call| B175
B138 -->|after return| B139
B139 -->|call| B202
B139 -->|after return| B140
B158["Continue at B159 in section 16"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL exitORmenu
```

### B132

```asm
MOV A,R5
add a,#2
mov r5,a
mov r0,#2
LCALL PRINTOP2
```

### B133

```asm
LCALL INLCD
```

### B134

```asm
MOV DPTR,#ODDD
LCALL WSTR
```

### B135

```asm
mov p3,#0
acall delay
```

### B136

```asm
mov p3,#0ffh
acall delay
```

### B137

```asm
djnz r0,flashing2
```

### B138

```asm
ACALL exitORmenu
```

### B139

```asm
LCALL INLCD
```

### B140

```asm
MOV DPTR,#EXIT_MEN
LCALL WSTR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 289 to 289"]
B141["B142: AGAIN17 - lines 290 to 290"]
B142["B143: instructions - lines 291 to 291"]
B143["B144: instructions - lines 292 to 293"]
B144["B145: instructions - lines 294 to 295"]
B145["B146: instructions - lines 296 to 296"]
B146["B147: instructions - lines 297 to 298"]
B147["B148: instructions - lines 301 to 301"]
B148["B149: instructions - lines 302 to 302"]
B149["B150: instructions - lines 304 to 304"]
B140 -->|next| B141
B141 -->|call| B211
B141 -->|after return| B142
B142 -->|condition true| B141
B142 -->|condition false| B143
B143 -->|call| B195
B143 -->|after return| B144
B144 -->|call| B195
B144 -->|after return| B145
B145 -->|call| B207
B145 -->|after return| B146
B146 -->|call| B202
B146 -->|after return| B147
B147 -->|call| B221
B147 -->|after return| B148
B148 -->|call| B197
B148 -->|after return| B149
B149 -->|condition true| B151
B149 -->|condition false| B150
B211["Continue at B212 in section 22"]
B195["Continue at B196 in section 20"]
B207["Continue at B208 in section 21"]
B202["Continue at B203 in section 21"]
B221["Continue at B222 in section 23"]
B197["Continue at B198 in section 20"]
B151["Continue at B152 in section 16"]
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
djnz r5,again17
```

### B144

```asm
MOV A,#0CH
LCALL CMD
```

### B145

```asm
MOV A,#0H
LCALL CMD
```

### B146

```asm
LCALL LDELAY
```

### B147

```asm
MOV DPTR,#EXIT_MENU
LCALL WSTR
```

### B148

```asm
ACALL KEYPAD
```

### B149

```asm
ACALL WCHR
```

### B150

```asm
CJNE A,#'0',EXITTT
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 305 to 305"]
B151["B152: EXITTT - lines 308 to 308"]
B152["B153: instructions - lines 309 to 310"]
B153["B154: instructions - lines 311 to 311"]
B154["B155: AGAIN166 - lines 312 to 312"]
B155["B156: instructions - lines 313 to 313"]
B156["B157: SSS - lines 314 to 314"]
B157["B158: instructions - lines 318 to 318"]
B158["B159: PRINTOP2 - lines 323 to 323"]
B159["B160: instructions - lines 324 to 325"]
B150 -->|jump| B13
B151 -->|call| B175
B151 -->|after return| B152
B152 -->|call| B202
B152 -->|after return| B153
B153 -->|next| B154
B154 -->|call| B211
B154 -->|after return| B155
B155 -->|condition true| B154
B155 -->|condition false| B156
B156 -->|jump| B156
B158 -->|call| B175
B158 -->|after return| B159
B159 -->|call| B202
B159 -->|after return| B160
B13["Continue at B14 in section 2"]
B175["Continue at B176 in section 18"]
B202["Continue at B203 in section 21"]
B211["Continue at B212 in section 22"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
AJMP MENU
```

### B152

```asm
LCALL INLCD
```

### B153

```asm
MOV DPTR,#THANKYOU
LCALL WSTR
```

### B154

```asm
mov r5,#2
```

### B155

```asm
lcall delay
```

### B156

```asm
djnz r5,again166
```

### B157

```asm
SJMP SSS
```

### B158

Return to the instruction following the active call.

```asm
ret
```

### B159

```asm
LCALL INLCD
```

### B160

```asm
MOV DPTR,#SECRET
LCALL WSTR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 327 to 342"]
B161["B162: instructions - lines 343 to 344"]
B162["B163: instructions - lines 345 to 346"]
B163["B164: instructions - lines 347 to 348"]
B164["B165: instructions - lines 349 to 350"]
B165["B166: instructions - lines 351 to 351"]
B166["B167: instructions - lines 352 to 353"]
B167["B168: instructions - lines 354 to 355"]
B168["B169: instructions - lines 356 to 357"]
B169["B170: instructions - lines 358 to 359"]
B160 -->|call| B195
B160 -->|after return| B161
B161 -->|call| B195
B161 -->|after return| B162
B162 -->|call| B197
B162 -->|after return| B163
B163 -->|call| B195
B163 -->|after return| B164
B164 -->|call| B195
B164 -->|after return| B165
B165 -->|call| B207
B165 -->|after return| B166
B166 -->|call| B197
B166 -->|after return| B167
B167 -->|call| B195
B167 -->|after return| B168
B168 -->|call| B195
B168 -->|after return| B169
B169 -->|call| B197
B169 -->|after return| B170
B195["Continue at B196 in section 20"]
B197["Continue at B198 in section 20"]
B207["Continue at B208 in section 21"]
B170["Continue at B171 in section 18"]
```

### B161

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

### B162

```asm
MOV A,#1H
LCALL CMD
```

### B163

```asm
MOV A,32H
LCALL WCHR
```

### B164

```asm
MOV A,#0CH
LCALL CMD
```

### B165

```asm
MOV A,#2H
LCALL CMD
```

### B166

```asm
LCALL LDELAY
```

### B167

```asm
MOV A,33H
LCALL WCHR
```

### B168

```asm
MOV A,#0CH
LCALL CMD
```

### B169

```asm
MOV A,#3H
LCALL CMD
```

### B170

```asm
MOV A,34H
LCALL WCHR
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 360 to 360"]
B171["B172: instructions - lines 361 to 361"]
B172["B173: instructions - lines 362 to 362"]
B173["B174: instructions - lines 365 to 365"]
B174["B175: ENTERED_NUMER - lines 369 to 395"]
B175["B176: INLCD - lines 398 to 399"]
B176["B177: WAIT - lines 401 to 401"]
B177["B178: instructions - lines 402 to 402"]
B178["B179: instructions - lines 403 to 405"]
B179["B180: instructions - lines 406 to 406"]
B170 -->|call| B211
B170 -->|after return| B171
B171 -->|call| B211
B171 -->|after return| B172
B172 -->|call| B211
B172 -->|after return| B173
B175 -->|next| B176
B176 -->|call| B207
B176 -->|after return| B177
B177 -->|condition true| B176
B177 -->|condition false| B178
B178 -->|call| B195
B178 -->|after return| B179
B179 -->|call| B207
B179 -->|after return| B180
B211["Continue at B212 in section 22"]
B207["Continue at B208 in section 21"]
B195["Continue at B196 in section 20"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
LCALL DELAY
```

### B172

```asm
LCALL DELAY
```

### B173

```asm
LCALL DELAY
```

### B174

Return to the instruction following the active call.

```asm
RET
```

### B175

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

### B176

```asm
PUSH 7
MOV R7,#20
```

### B177

```asm
ACALL LDELAY
```

### B178

```asm
DJNZ R7,WAIT
```

### B179

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B180

```asm
ACALL LDELAY
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 407 to 408"]
B181["B182: instructions - lines 409 to 410"]
B182["B183: instructions - lines 411 to 412"]
B183["B184: instructions - lines 413 to 414"]
B184["B185: instructions - lines 415 to 416"]
B185["B186: instructions - lines 417 to 418"]
B186["B187: instructions - lines 419 to 420"]
B187["B188: instructions - lines 421 to 423"]
B188["B189: instructions - lines 424 to 425"]
B189["B190: instructions - lines 426 to 426"]
B180 -->|call| B195
B180 -->|after return| B181
B181 -->|call| B195
B181 -->|after return| B182
B182 -->|call| B195
B182 -->|after return| B183
B183 -->|call| B195
B183 -->|after return| B184
B184 -->|call| B195
B184 -->|after return| B185
B185 -->|call| B195
B185 -->|after return| B186
B186 -->|call| B195
B186 -->|after return| B187
B187 -->|call| B195
B187 -->|after return| B188
B188 -->|call| B195
B188 -->|after return| B189
B189 -->|call| B207
B189 -->|after return| B190
B195["Continue at B196 in section 20"]
B207["Continue at B208 in section 21"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV A,#0011B
ACALL CMD
```

### B182

```asm
MOV A,#0011B
ACALL CMD
```

### B183

```asm
MOV A,#0010B
ACALL CMD
```

### B184

```asm
MOV A,#0010B
ACALL CMD
```

### B185

```asm
MOV A,#1000B
ACALL CMD
```

### B186

```asm
MOV A,#0000B
ACALL CMD
```

### B187

```asm
MOV A,#1000B
ACALL CMD
```

### B188

```asm
MOV A,#0
ACALL CMD
```

### B189

```asm
MOV A,#0001B
ACALL CMD
```

### B190

```asm
ACALL LDELAY
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 427 to 428"]
B191["B192: instructions - lines 429 to 430"]
B192["B193: instructions - lines 431 to 432"]
B193["B194: instructions - lines 433 to 434"]
B194["B195: instructions - lines 435 to 436"]
B195["B196: CMD - lines 441 to 442"]
B196["B197: instructions - lines 443 to 443"]
B197["B198: WCHR - lines 446 to 451"]
B198["B199: instructions - lines 452 to 453"]
B199["B200: instructions - lines 454 to 456"]
B190 -->|call| B195
B190 -->|after return| B191
B191 -->|call| B195
B191 -->|after return| B192
B192 -->|call| B195
B192 -->|after return| B193
B193 -->|call| B195
B193 -->|after return| B194
B195 -->|call| B200
B195 -->|after return| B196
B197 -->|call| B200
B197 -->|after return| B198
B198 -->|call| B200
B198 -->|after return| B199
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV A,#0000B
ACALL CMD
```

### B192

```asm
MOV A,#0110B
ACALL CMD
```

### B193

```asm
MOV A,#0000B
ACALL CMD
```

### B194

```asm
MOV A,#1111B
ACALL CMD
```

### B195

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B196

```asm
CLR RS
ACALL COMMON
```

### B197

Return to the instruction following the active call.

```asm
RET
```

### B198

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B199

```asm
MOV A,B
ACALL COMMON
```

### B200

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 21

```mermaid
flowchart TD
B200["B201: COMMON - lines 459 to 466"]
B201["B202: instructions - lines 468 to 468"]
B202["B203: WSTR - lines 471 to 471"]
B203["B204: CONT1 - lines 473 to 475"]
B204["B205: instructions - lines 476 to 476"]
B205["B206: instructions - lines 477 to 478"]
B206["B207: EXIT1 - lines 480 to 481"]
B207["B208: LDELAY - lines 484 to 486"]
B208["B209: CON4 - lines 488 to 489"]
B209["B210: instructions - lines 490 to 490"]
B200 -->|call| B207
B200 -->|after return| B201
B202 -->|next| B203
B203 -->|condition true| B206
B203 -->|condition false| B204
B204 -->|call| B197
B204 -->|after return| B205
B205 -->|jump| B203
B207 -->|next| B208
B208 -->|condition true| B208
B208 -->|condition false| B209
B209 -->|condition true| B208
B209 -->|condition false| B210
B197["Continue at B198 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

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

### B202

Return to the instruction following the active call.

```asm
RET
```

### B203

```asm
PUSH ACC
```

### B204

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B205

```asm
ACALL WCHR
```

### B206

```asm
INC DPTR
AJMP CONT1
```

### B207

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B208

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B209

```asm
MOV R0,#250
DJNZ R0,$
```

### B210

```asm
DJNZ R1,CON4
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 491 to 493"]
B211["B212: DELAY - lines 495 to 498"]
B212["B213: X36 - lines 499 to 499"]
B213["B214: X26 - lines 500 to 500"]
B214["B215: X16 - lines 501 to 501"]
B215["B216: instructions - lines 502 to 502"]
B216["B217: instructions - lines 503 to 503"]
B217["B218: instructions - lines 504 to 507"]
B218["B219: TMSEC - lines 509 to 512"]
B219["B220: BACK - lines 513 to 513"]
B211 -->|next| B212
B212 -->|next| B213
B213 -->|next| B214
B214 -->|condition true| B214
B214 -->|condition false| B215
B215 -->|condition true| B213
B215 -->|condition false| B216
B216 -->|condition true| B212
B216 -->|condition false| B217
B218 -->|next| B219
B219 -->|condition true| B219
B219 -->|condition false| B220
B220["Continue at B221 in section 23"]
```

### B211

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B212

```asm
PUSH 5
PUSH 4
PUSH 3
MOV R5,#2
```

### B213

```asm
MOV R4,#10
```

### B214

```asm
MOV R3,#250
```

### B215

```asm
DJNZ R3,X16
```

### B216

```asm
DJNZ R4,X26
```

### B217

```asm
DJNZ R5,X36
```

### B218

Return to the instruction following the active call.

```asm
POP 3
POP 4
POP 5
RET
```

### B219

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B220

```asm
JNB TF0,BACK
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 514 to 516"]
B221["B222: KEYPAD - lines 520 to 520"]
B222["B223: K1 - lines 522 to 525"]
B223["B224: K2 - lines 527 to 527"]
B224["B225: instructions - lines 528 to 530"]
B225["B226: instructions - lines 531 to 531"]
B226["B227: OVER - lines 534 to 534"]
B227["B228: instructions - lines 535 to 537"]
B228["B229: instructions - lines 538 to 538"]
B229["B230: OVER1 - lines 541 to 544"]
B221 -->|next| B222
B222 -->|condition true| B222
B222 -->|condition false| B223
B223 -->|call| B218
B223 -->|after return| B224
B224 -->|condition true| B226
B224 -->|condition false| B225
B225 -->|jump| B223
B226 -->|call| B218
B226 -->|after return| B227
B227 -->|condition true| B229
B227 -->|condition false| B228
B228 -->|jump| B223
B229 -->|condition true| B234
B229 -->|condition false| B230
B218["Continue at B219 in section 22"]
B234["Continue at B235 in section 24"]
B230["Continue at B231 in section 24"]
```

### B221

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B222

```asm
MOV P2,#11110000B
```

### B223

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B224

```asm
ACALL TMSEC
```

### B225

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B226

```asm
SJMP K2
```

### B227

```asm
ACALL TMSEC
```

### B228

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B229

```asm
SJMP K2
```

### B230

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 546 to 549"]
B231["B232: instructions - lines 551 to 554"]
B232["B233: instructions - lines 556 to 559"]
B233["B234: instructions - lines 561 to 561"]
B234["B235: ROW_0 - lines 563 to 564"]
B235["B236: ROW_1 - lines 566 to 567"]
B236["B237: ROW_2 - lines 569 to 570"]
B237["B238: ROW_3 - lines 572 to 572"]
B238["B239: FIND - lines 575 to 575"]
B239["B240: FIND1 - lines 578 to 579"]
B230 -->|condition true| B235
B230 -->|condition false| B231
B231 -->|condition true| B236
B231 -->|condition false| B232
B232 -->|condition true| B237
B232 -->|condition false| B233
B233 -->|jump| B223
B234 -->|jump| B238
B235 -->|jump| B238
B236 -->|jump| B238
B237 -->|next| B238
B238 -->|next| B239
B239 -->|condition true| B241
B239 -->|condition false| B240
B223["Continue at B224 in section 23"]
B241["Continue at B242 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B232

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B233

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B234

```asm
LJMP K2
```

### B235

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B236

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B237

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B238

```asm
MOV DPTR,#KCODE3
```

### B239

```asm
SWAP A
```

### B240

```asm
RRC A
JNC MATCH
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 580 to 581"]
B241["B242: MATCH - lines 584 to 586"]
B242["B243: ENDOFCODE - lines 619 to 619"]
B240 -->|jump| B239
B239["Continue at B240 in section 24"]
```

### B241

```asm
INC DPTR
SJMP FIND1
```

### B242

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B243

Resume the interrupted program.

```asm
RETI
```
