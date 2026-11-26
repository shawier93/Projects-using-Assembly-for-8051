# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19)

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
297: /////////////////////////////////////////////////////////
```

## Section 1

```mermaid
flowchart TD
B0["B1: START1 - lines 12 to 12"]
B1["B2: instructions - lines 14 to 22"]
B2["B3: instructions - lines 23 to 23"]
B3["B4: MENU - lines 26 to 26"]
B4["B5: instructions - lines 27 to 27"]
B5["B6: instructions - lines 28 to 28"]
B6["B7: instructions - lines 29 to 29"]
B7["B8: instructions - lines 30 to 31"]
B8["B9: instructions - lines 33 to 33"]
B9["B10: instructions - lines 35 to 35"]
B0 -->|call| B134
B0 -->|after return| B1
B1 -->|call| B36
B1 -->|after return| B2
B2 -->|call| B180
B2 -->|after return| B3
B3 -->|call| B44
B3 -->|after return| B4
B4 -->|call| B180
B4 -->|after return| B5
B5 -->|call| B52
B5 -->|after return| B6
B6 -->|call| B180
B6 -->|after return| B7
B7 -->|condition true| B14
B7 -->|condition false| B8
B8 -->|call| B73
B8 -->|after return| B9
B9 -->|call| B58
B9 -->|after return| B10
B134["Continue at B135 in section 14"]
B36["Continue at B37 in section 4"]
B180["Continue at B181 in section 19"]
B44["Continue at B45 in section 5"]
B52["Continue at B53 in section 6"]
B14["Continue at B15 in section 2"]
B73["Continue at B74 in section 8"]
B58["Continue at B59 in section 6"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H, #1
MOV 40H, #3
MOV 41H, #4
MOV 42H, #2
MOV 43H, #3
MOV 44H, #4
MOV 50H, #0
MOV 51H, #0
ACALL WELCOME
```

### B3

```asm
ACALL DELAY
```

### B4

```asm
ACALL Menuu
```

### B5

```asm
ACALL DELAY
```

### B6

```asm
ACALL SELECTT
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
MOV A,30H
CJNE A,#1,OPERATION2
```

### B9

```asm
ACALL FLASHING
```

### B10

```asm
ACALL OPTIONN1
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 36 to 36"]
B11["B12: instructions - lines 37 to 37"]
B12["B13: instructions - lines 38 to 38"]
B13["B14: instructions - lines 39 to 39"]
B14["B15: OPERATION2 - lines 42 to 42"]
B15["B16: instructions - lines 44 to 44"]
B16["B17: instructions - lines 46 to 46"]
B17["B18: instructions - lines 47 to 47"]
B18["B19: instructions - lines 48 to 48"]
B19["B20: instructions - lines 49 to 49"]
B10 -->|call| B90
B10 -->|after return| B11
B11 -->|call| B30
B11 -->|after return| B12
B12 -->|call| B108
B12 -->|after return| B13
B13 -->|call| B32
B13 -->|after return| B14
B14 -->|condition true| B21
B14 -->|condition false| B15
B15 -->|call| B73
B15 -->|after return| B16
B16 -->|call| B62
B16 -->|after return| B17
B17 -->|call| B77
B17 -->|after return| B18
B18 -->|call| B31
B18 -->|after return| B19
B19 -->|call| B121
B19 -->|after return| B20
B90["Continue at B91 in section 10"]
B30["Continue at B31 in section 4"]
B108["Continue at B109 in section 11"]
B32["Continue at B33 in section 4"]
B21["Continue at B22 in section 3"]
B73["Continue at B74 in section 8"]
B62["Continue at B63 in section 7"]
B77["Continue at B78 in section 8"]
B31["Continue at B32 in section 4"]
B121["Continue at B122 in section 13"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL ENTER_DIM
```

### B12

```asm
ACALL AREAA
```

### B13

```asm
ACALL PRINT1
```

### B14

```asm
ACALL CONTINUE
```

### B15

```asm
CJNE A,#2,WRONG
```

### B16

```asm
ACALL FLASHING
```

### B17

```asm
ACALL OPTIONN2
```

### B18

```asm
ACALL ENTER_SIDES
```

### B19

```asm
ACALL PERIMETER
```

### B20

```asm
ACALL PRINT2
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 50 to 50"]
B21["B22: WRONG - lines 53 to 53"]
B22["B23: instructions - lines 54 to 54"]
B23["B24: EXIT - lines 58 to 58"]
B24["B25: instructions - lines 59 to 59"]
B25["B26: instructions - lines 60 to 61"]
B26["B27: instructions - lines 62 to 63"]
B27["B28: instructions - lines 65 to 65"]
B28["B29: instructions - lines 66 to 66"]
B29["B30: EE - lines 68 to 68"]
B20 -->|call| B32
B20 -->|after return| B21
B21 -->|call| B66
B21 -->|after return| B22
B22 -->|jump| B3
B23 -->|call| B174
B23 -->|after return| B24
B24 -->|call| B180
B24 -->|after return| B25
B25 -->|call| B154
B25 -->|after return| B26
B26 -->|call| B162
B26 -->|after return| B27
B27 -->|call| B73
B27 -->|after return| B28
B28 -->|call| B180
B28 -->|after return| B29
B29 -->|jump| B29
B32["Continue at B33 in section 4"]
B66["Continue at B67 in section 7"]
B3["Continue at B4 in section 1"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B73["Continue at B74 in section 8"]
```

### B21

```asm
ACALL CONTINUE
```

### B22

```asm
ACALL WRONGG
```

### B23

```asm
SJMP MENU
```

### B24

```asm
ACALL CLEAR
```

### B25

```asm
ACALL DELAY
```

### B26

```asm
mov a, #80H
acall cmd
```

### B27

```asm
mov dptr, #THANKS
acall wstr
```

### B28

```asm
ACALL FLASHING
```

### B29

```asm
ACALL DELAY
```

### B30

```asm
SJMP EE
```

## Section 4

```mermaid
flowchart TD
B30["B31: AREAA - lines 73 to 82"]
B31["B32: PERIMETER - lines 86 to 93"]
B32["B33: CONTINUE - lines 96 to 96"]
B33["B34: instructions - lines 97 to 98"]
B34["B35: instructions - lines 99 to 99"]
B35["B36: instructions - lines 100 to 100"]
B36["B37: WELCOME - lines 104 to 104"]
B37["B38: instructions - lines 105 to 105"]
B38["B39: instructions - lines 106 to 107"]
B39["B40: instructions - lines 108 to 109"]
B32 -->|call| B101
B32 -->|after return| B33
B33 -->|condition true| B23
B33 -->|condition false| B34
B34 -->|jump| B3
B36 -->|call| B174
B36 -->|after return| B37
B37 -->|call| B180
B37 -->|after return| B38
B38 -->|call| B154
B38 -->|after return| B39
B39 -->|call| B162
B39 -->|after return| B40
B101["Continue at B102 in section 11"]
B23["Continue at B24 in section 3"]
B3["Continue at B4 in section 1"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B40["Continue at B41 in section 5"]
```

### B31

Return to the instruction following the active call.

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV B,#10
DIV AB
MOV 50H,A
MOV 51H,B
RET
```

### B32

Return to the instruction following the active call.

```asm
MOV A,42H
ADD A,43H
ADD A,44H
MOV 50H,A
RET
```

### B33

```asm
ACALL CON
```

### B34

```asm
MOV A,#2
CJNE A,#1,EXIT
```

### B35

```asm
SJMP MENU
```

### B36

Return to the instruction following the active call.

```asm
RET
```

### B37

```asm
ACALL CLEAR
```

### B38

```asm
ACALL DELAY
```

### B39

```asm
mov a, #80H
acall cmd
```

### B40

```asm
mov dptr, #NAMEE
acall wstr
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 111 to 112"]
B41["B42: instructions - lines 113 to 114"]
B42["B43: instructions - lines 115 to 115"]
B43["B44: instructions - lines 116 to 116"]
B44["B45: MENUU - lines 119 to 119"]
B45["B46: instructions - lines 120 to 120"]
B46["B47: instructions - lines 121 to 122"]
B47["B48: instructions - lines 123 to 124"]
B48["B49: instructions - lines 126 to 127"]
B49["B50: instructions - lines 128 to 129"]
B40 -->|call| B154
B40 -->|after return| B41
B41 -->|call| B162
B41 -->|after return| B42
B42 -->|call| B180
B42 -->|after return| B43
B44 -->|call| B174
B44 -->|after return| B45
B45 -->|call| B180
B45 -->|after return| B46
B46 -->|call| B154
B46 -->|after return| B47
B47 -->|call| B162
B47 -->|after return| B48
B48 -->|call| B154
B48 -->|after return| B49
B49 -->|call| B162
B49 -->|after return| B50
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B180["Continue at B181 in section 19"]
B174["Continue at B175 in section 18"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov a,#90H
acall cmd
```

### B42

```asm
mov dptr, #PROJECT
acall wstr
```

### B43

```asm
acall delay
```

### B44

Return to the instruction following the active call.

```asm
ret
```

### B45

```asm
ACALL CLEAR
```

### B46

```asm
ACALL DELAY
```

### B47

```asm
mov a, #80H
acall cmd
```

### B48

```asm
mov dptr, #OP1
acall wstr
```

### B49

```asm
mov a,#90H
acall cmd
```

### B50

```asm
mov dptr, #OP2
acall wstr
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 130 to 130"]
B51["B52: instructions - lines 131 to 131"]
B52["B53: SELECTT - lines 134 to 134"]
B53["B54: instructions - lines 135 to 135"]
B54["B55: instructions - lines 136 to 137"]
B55["B56: instructions - lines 138 to 139"]
B56["B57: instructions - lines 141 to 143"]
B57["B58: instructions - lines 144 to 144"]
B58["B59: OPTIONN1 - lines 147 to 148"]
B59["B60: instructions - lines 149 to 150"]
B50 -->|call| B180
B50 -->|after return| B51
B52 -->|call| B174
B52 -->|after return| B53
B53 -->|call| B180
B53 -->|after return| B54
B54 -->|call| B154
B54 -->|after return| B55
B55 -->|call| B162
B55 -->|after return| B56
B56 -->|call| B157
B56 -->|after return| B57
B58 -->|call| B154
B58 -->|after return| B59
B59 -->|call| B162
B59 -->|after return| B60
B180["Continue at B181 in section 19"]
B174["Continue at B175 in section 18"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B157["Continue at B158 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
acall delay
```

### B52

Return to the instruction following the active call.

```asm
ret
```

### B53

```asm
ACALL CLEAR
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
mov a, #80H
acall cmd
```

### B56

```asm
mov dptr, #MSG
acall wstr
```

### B57

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B58

Return to the instruction following the active call.

```asm
RET
```

### B59

```asm
mov a,#90H
acall cmd
```

### B60

```asm
mov dptr, #MSG1
acall wstr
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 151 to 151"]
B61["B62: instructions - lines 152 to 152"]
B62["B63: OPTIONN2 - lines 155 to 156"]
B63["B64: instructions - lines 157 to 158"]
B64["B65: instructions - lines 159 to 159"]
B65["B66: instructions - lines 160 to 160"]
B66["B67: WRONGG - lines 163 to 164"]
B67["B68: instructions - lines 165 to 166"]
B68["B69: instructions - lines 167 to 167"]
B69["B70: instructions - lines 169 to 170"]
B60 -->|call| B180
B60 -->|after return| B61
B62 -->|call| B154
B62 -->|after return| B63
B63 -->|call| B162
B63 -->|after return| B64
B64 -->|call| B180
B64 -->|after return| B65
B66 -->|call| B154
B66 -->|after return| B67
B67 -->|call| B162
B67 -->|after return| B68
B68 -->|call| B180
B68 -->|after return| B69
B69 -->|next| B70
B180["Continue at B181 in section 19"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
acall delay
```

### B62

Return to the instruction following the active call.

```asm
ret
```

### B63

```asm
mov a,#90H
acall cmd
```

### B64

```asm
mov dptr, #MSG2
acall wstr
```

### B65

```asm
acall delay
```

### B66

Return to the instruction following the active call.

```asm
ret
```

### B67

```asm
mov a,#90H
acall cmd
```

### B68

```asm
mov dptr, #WRONGGG
acall wstr
```

### B69

```asm
acall delay
```

### B70

```asm
MOV R4,#10
CLR R
```

## Section 8

```mermaid
flowchart TD
B70["B71: AG1 - lines 171 to 171"]
B71["B72: instructions - lines 172 to 172"]
B72["B73: instructions - lines 173 to 174"]
B73["B74: FLASHING - lines 177 to 178"]
B74["B75: AG - lines 179 to 179"]
B75["B76: instructions - lines 180 to 180"]
B76["B77: instructions - lines 181 to 182"]
B77["B78: ENTER_SIDES - lines 185 to 185"]
B78["B79: instructions - lines 186 to 186"]
B79["B80: instructions - lines 187 to 188"]
B70 -->|call| B180
B70 -->|after return| B71
B71 -->|condition true| B70
B71 -->|condition false| B72
B73 -->|next| B74
B74 -->|call| B184
B74 -->|after return| B75
B75 -->|condition true| B74
B75 -->|condition false| B76
B77 -->|call| B174
B77 -->|after return| B78
B78 -->|call| B180
B78 -->|after return| B79
B79 -->|call| B154
B79 -->|after return| B80
B180["Continue at B181 in section 19"]
B184["Continue at B185 in section 19"]
B174["Continue at B175 in section 18"]
B154["Continue at B155 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
DJNZ R4,AG1
```

### B73

Return to the instruction following the active call.

```asm
SETB R
ret
```

### B74

```asm
MOV R4,#10
CLR G
```

### B75

```asm
ACALL DELAY1
```

### B76

```asm
DJNZ R4,AG
```

### B77

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B78

```asm
ACALL CLEAR
```

### B79

```asm
ACALL DELAY
```

### B80

```asm
mov a, #80H
acall cmd
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 189 to 190"]
B81["B82: instructions - lines 192 to 193"]
B82["B83: instructions - lines 194 to 195"]
B83["B84: instructions - lines 196 to 198"]
B84["B85: instructions - lines 199 to 200"]
B85["B86: instructions - lines 201 to 203"]
B86["B87: instructions - lines 204 to 205"]
B87["B88: instructions - lines 206 to 208"]
B88["B89: instructions - lines 209 to 209"]
B89["B90: instructions - lines 210 to 210"]
B80 -->|call| B162
B80 -->|after return| B81
B81 -->|call| B154
B81 -->|after return| B82
B82 -->|call| B162
B82 -->|after return| B83
B83 -->|call| B157
B83 -->|after return| B84
B84 -->|call| B162
B84 -->|after return| B85
B85 -->|call| B157
B85 -->|after return| B86
B86 -->|call| B162
B86 -->|after return| B87
B87 -->|call| B157
B87 -->|after return| B88
B88 -->|call| B180
B88 -->|after return| B89
B162["Continue at B163 in section 17"]
B154["Continue at B155 in section 16"]
B157["Continue at B158 in section 16"]
B180["Continue at B181 in section 19"]
```

### B81

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B82

```asm
mov a, #90H
acall cmd
```

### B83

```asm
mov dptr, #SIDEA
acall wstr
```

### B84

```asm
MOV A,42H
ADD A,#30H
ACALL WCHR
```

### B85

```asm
mov dptr, #SIDEB
acall wstr
```

### B86

```asm
MOV A,43H
ADD A,#30H
ACALL WCHR
```

### B87

```asm
mov dptr, #SIDEC
acall wstr
```

### B88

```asm
MOV A,44H
ADD A,#30H
ACALL WCHR
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
B90["B91: ENTER_DIM - lines 214 to 214"]
B91["B92: instructions - lines 215 to 215"]
B92["B93: instructions - lines 216 to 217"]
B93["B94: instructions - lines 218 to 219"]
B94["B95: instructions - lines 220 to 221"]
B95["B96: instructions - lines 222 to 223"]
B96["B97: instructions - lines 224 to 226"]
B97["B98: instructions - lines 227 to 228"]
B98["B99: instructions - lines 229 to 231"]
B99["B100: instructions - lines 232 to 232"]
B90 -->|call| B174
B90 -->|after return| B91
B91 -->|call| B180
B91 -->|after return| B92
B92 -->|call| B154
B92 -->|after return| B93
B93 -->|call| B162
B93 -->|after return| B94
B94 -->|call| B154
B94 -->|after return| B95
B95 -->|call| B162
B95 -->|after return| B96
B96 -->|call| B157
B96 -->|after return| B97
B97 -->|call| B162
B97 -->|after return| B98
B98 -->|call| B157
B98 -->|after return| B99
B99 -->|call| B180
B99 -->|after return| B100
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B157["Continue at B158 in section 16"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL CLEAR
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
mov a, #80H
acall cmd
```

### B94

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B95

```asm
mov a, #90H
acall cmd
```

### B96

```asm
mov dptr, #SIDEB
acall wstr
```

### B97

```asm
MOV A,40H
ADD A,#30H
ACALL WCHR
```

### B98

```asm
mov dptr, #HIGHT
acall wstr
```

### B99

```asm
MOV A,41H
ADD A,#30H
ACALL WCHR
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 233 to 233"]
B101["B102: CON - lines 236 to 236"]
B102["B103: instructions - lines 237 to 237"]
B103["B104: instructions - lines 238 to 239"]
B104["B105: instructions - lines 240 to 241"]
B105["B106: instructions - lines 242 to 243"]
B106["B107: instructions - lines 244 to 245"]
B107["B108: instructions - lines 246 to 246"]
B108["B109: PRINT1 - lines 249 to 249"]
B109["B110: instructions - lines 250 to 250"]
B101 -->|call| B174
B101 -->|after return| B102
B102 -->|call| B180
B102 -->|after return| B103
B103 -->|call| B154
B103 -->|after return| B104
B104 -->|call| B162
B104 -->|after return| B105
B105 -->|call| B154
B105 -->|after return| B106
B106 -->|call| B162
B106 -->|after return| B107
B108 -->|call| B174
B108 -->|after return| B109
B109 -->|call| B180
B109 -->|after return| B110
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
ACALL CLEAR
```

### B103

```asm
ACALL DELAY
```

### B104

```asm
mov a, #80H
acall cmd
```

### B105

```asm
mov dptr, #CONT11
acall wstr
```

### B106

```asm
mov a, #90H
acall cmd
```

### B107

```asm
mov dptr, #CONT22
acall wstr
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
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 251 to 252"]
B111["B112: instructions - lines 253 to 254"]
B112["B113: instructions - lines 255 to 259"]
B113["B114: instructions - lines 260 to 262"]
B114["B115: instructions - lines 263 to 263"]
B115["B116: instructions - lines 264 to 265"]
B116["B117: instructions - lines 266 to 267"]
B117["B118: instructions - lines 268 to 270"]
B118["B119: instructions - lines 271 to 271"]
B119["B120: instructions - lines 272 to 272"]
B110 -->|call| B154
B110 -->|after return| B111
B111 -->|call| B162
B111 -->|after return| B112
B112 -->|call| B157
B112 -->|after return| B113
B113 -->|call| B157
B113 -->|after return| B114
B114 -->|call| B167
B114 -->|after return| B115
B115 -->|call| B154
B115 -->|after return| B116
B116 -->|call| B162
B116 -->|after return| B117
B117 -->|call| B157
B117 -->|after return| B118
B118 -->|call| B180
B118 -->|after return| B119
B119 -->|call| B180
B119 -->|after return| B120
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B157["Continue at B158 in section 16"]
B167["Continue at B168 in section 17"]
B180["Continue at B181 in section 19"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov a, #80H
acall cmd
```

### B112

```asm
mov dptr, #AAREA
acall wstr
```

### B113

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B114

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B115

```asm
ACALL LDELAY
```

### B116

```asm
mov a, #90H
acall cmd
```

### B117

```asm
mov dptr, #REMINDER
acall wstr
```

### B118

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B119

```asm
ACALL DELAY
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 274 to 274"]
B121["B122: PRINT2 - lines 277 to 277"]
B122["B123: instructions - lines 278 to 278"]
B123["B124: instructions - lines 279 to 280"]
B124["B125: instructions - lines 281 to 282"]
B125["B126: instructions - lines 284 to 288"]
B126["B127: instructions - lines 289 to 291"]
B127["B128: instructions - lines 292 to 292"]
B128["B129: instructions - lines 293 to 293"]
B129["B130: STOP - lines 299 to 299"]
B121 -->|call| B174
B121 -->|after return| B122
B122 -->|call| B180
B122 -->|after return| B123
B123 -->|call| B154
B123 -->|after return| B124
B124 -->|call| B162
B124 -->|after return| B125
B125 -->|call| B157
B125 -->|after return| B126
B126 -->|call| B157
B126 -->|after return| B127
B127 -->|call| B180
B127 -->|after return| B128
B129 -->|jump| B129
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B154["Continue at B155 in section 16"]
B162["Continue at B163 in section 17"]
B157["Continue at B158 in section 16"]
```

### B121

Return to the instruction following the active call.

```asm
RET
```

### B122

```asm
ACALL CLEAR
```

### B123

```asm
ACALL DELAY
```

### B124

```asm
mov a, #80H
acall cmd
```

### B125

```asm
mov dptr, #PPERIMETER
acall wstr
```

### B126

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B127

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B128

```asm
ACALL DELAY
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
SJMP STOP
```

## Section 14

```mermaid
flowchart TD
B130["B131: TIME - lines 303 to 303"]
B131["B132: LOOP66 - lines 304 to 304"]
B132["B133: instructions - lines 305 to 305"]
B133["B134: instructions - lines 306 to 306"]
B134["B135: INLCD - lines 309 to 310"]
B135["B136: WAIT - lines 312 to 312"]
B136["B137: instructions - lines 313 to 313"]
B137["B138: instructions - lines 315 to 317"]
B138["B139: instructions - lines 318 to 318"]
B139["B140: instructions - lines 319 to 320"]
B130 -->|next| B131
B131 -->|call| B167
B131 -->|after return| B132
B132 -->|condition true| B131
B132 -->|condition false| B133
B134 -->|next| B135
B135 -->|call| B167
B135 -->|after return| B136
B136 -->|condition true| B135
B136 -->|condition false| B137
B137 -->|call| B154
B137 -->|after return| B138
B138 -->|call| B167
B138 -->|after return| B139
B139 -->|call| B154
B139 -->|after return| B140
B167["Continue at B168 in section 17"]
B154["Continue at B155 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV R3,#50
```

### B132

```asm
ACALL LDELAY
```

### B133

```asm
DJNZ R3,LOOP66
```

### B134

Return to the instruction following the active call.

```asm
RET
```

### B135

```asm
PUSH 7
MOV R7,#20
```

### B136

```asm
ACALL LDELAY
```

### B137

```asm
DJNZ R7,WAIT
```

### B138

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B139

```asm
ACALL LDELAY
```

### B140

```asm
MOV A,#0011B
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 321 to 322"]
B141["B142: instructions - lines 323 to 324"]
B142["B143: instructions - lines 325 to 326"]
B143["B144: instructions - lines 327 to 328"]
B144["B145: instructions - lines 329 to 330"]
B145["B146: instructions - lines 331 to 332"]
B146["B147: instructions - lines 333 to 334"]
B147["B148: instructions - lines 335 to 336"]
B148["B149: instructions - lines 337 to 337"]
B149["B150: instructions - lines 338 to 339"]
B140 -->|call| B154
B140 -->|after return| B141
B141 -->|call| B154
B141 -->|after return| B142
B142 -->|call| B154
B142 -->|after return| B143
B143 -->|call| B154
B143 -->|after return| B144
B144 -->|call| B154
B144 -->|after return| B145
B145 -->|call| B154
B145 -->|after return| B146
B146 -->|call| B154
B146 -->|after return| B147
B147 -->|call| B154
B147 -->|after return| B148
B148 -->|call| B167
B148 -->|after return| B149
B149 -->|call| B154
B149 -->|after return| B150
B154["Continue at B155 in section 16"]
B167["Continue at B168 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,#0011B
ACALL CMD
```

### B142

```asm
MOV A,#0010B
ACALL CMD
```

### B143

```asm
MOV A,#0010B
ACALL CMD
```

### B144

```asm
MOV A,#1000B
ACALL CMD
```

### B145

```asm
MOV A,#0000B
ACALL CMD
```

### B146

```asm
MOV A,#1000B
ACALL CMD
```

### B147

```asm
MOV A,#0
ACALL CMD
```

### B148

```asm
MOV A,#0001B
ACALL CMD
```

### B149

```asm
ACALL LDELAY
```

### B150

```asm
MOV A,#0000B
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 340 to 341"]
B151["B152: instructions - lines 342 to 343"]
B152["B153: instructions - lines 344 to 345"]
B153["B154: instructions - lines 347 to 348"]
B154["B155: CMD - lines 352 to 358"]
B155["B156: instructions - lines 359 to 360"]
B156["B157: instructions - lines 362 to 364"]
B157["B158: WCHR - lines 367 to 373"]
B158["B159: instructions - lines 374 to 375"]
B159["B160: instructions - lines 377 to 379"]
B150 -->|call| B154
B150 -->|after return| B151
B151 -->|call| B154
B151 -->|after return| B152
B152 -->|call| B154
B152 -->|after return| B153
B154 -->|call| B160
B154 -->|after return| B155
B155 -->|call| B160
B155 -->|after return| B156
B157 -->|call| B160
B157 -->|after return| B158
B158 -->|call| B160
B158 -->|after return| B159
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#0110B
ACALL CMD
```

### B152

```asm
MOV A,#0000B
ACALL CMD
```

### B153

```asm
MOV A,#1111B
ACALL CMD
```

### B154

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B155

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B156

```asm
MOV A,B
ACALL COMMON
```

### B157

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B158

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B159

```asm
MOV A,B
ACALL COMMON
```

### B160

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 17

```mermaid
flowchart TD
B160["B161: COMMON - lines 382 to 389"]
B161["B162: instructions - lines 390 to 390"]
B162["B163: WSTR - lines 393 to 393"]
B163["B164: CONT1 - lines 395 to 397"]
B164["B165: instructions - lines 398 to 398"]
B165["B166: instructions - lines 399 to 400"]
B166["B167: EXIT1 - lines 402 to 403"]
B167["B168: LDELAY - lines 406 to 408"]
B168["B169: CON4 - lines 410 to 411"]
B169["B170: instructions - lines 412 to 412"]
B160 -->|call| B167
B160 -->|after return| B161
B162 -->|next| B163
B163 -->|condition true| B166
B163 -->|condition false| B164
B164 -->|call| B157
B164 -->|after return| B165
B165 -->|jump| B163
B167 -->|next| B168
B168 -->|condition true| B168
B168 -->|condition false| B169
B169 -->|condition true| B168
B169 -->|condition false| B170
B157["Continue at B158 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
CLR RW
SWAP A
ANL A,#11110000B
ANL P0,#00001111B
ORL P0,A
SETB EN
CLR EN
ACALL LDELAY
```

### B162

Return to the instruction following the active call.

```asm
RET
```

### B163

```asm
PUSH ACC
```

### B164

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B165

```asm
ACALL WCHR
```

### B166

```asm
INC DPTR
AJMP CONT1
```

### B167

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B168

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B169

```asm
MOV R0,#250
DJNZ R0,$
```

### B170

```asm
DJNZ R1,CON4
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 413 to 415"]
B171["B172: TMSEC - lines 420 to 423"]
B172["B173: BACK - lines 424 to 424"]
B173["B174: instructions - lines 425 to 427"]
B174["B175: CLEAR - lines 430 to 431"]
B175["B176: instructions - lines 432 to 432"]
B176["B177: instructions - lines 433 to 433"]
B177["B178: WAITT - lines 434 to 434"]
B178["B179: instructions - lines 435 to 435"]
B179["B180: instructions - lines 436 to 436"]
B171 -->|next| B172
B172 -->|condition true| B172
B172 -->|condition false| B173
B174 -->|call| B154
B174 -->|after return| B175
B175 -->|call| B167
B175 -->|after return| B176
B176 -->|next| B177
B177 -->|call| B167
B177 -->|after return| B178
B178 -->|condition true| B177
B178 -->|condition false| B179
B154["Continue at B155 in section 16"]
B167["Continue at B168 in section 17"]
```

### B171

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B172

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B173

```asm
JNB TF0,BACK
```

### B174

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B175

```asm
MOV A,#1H
ACALL CMD
```

### B176

```asm
ACALL LDELAY
```

### B177

```asm
MOV R7,#14
```

### B178

```asm
ACALL LDELAY
```

### B179

```asm
DJNZ R7,WAITT
```

### B180

Return to the instruction following the active call.

```asm
RET
```

## Section 19

```mermaid
flowchart TD
B180["B181: DELAY - lines 440 to 440"]
B181["B182: QWE - lines 442 to 442"]
B182["B183: instructions - lines 443 to 443"]
B183["B184: instructions - lines 444 to 444"]
B184["B185: DELAY1 - lines 446 to 446"]
B185["B186: ABC - lines 448 to 448"]
B186["B187: instructions - lines 449 to 449"]
B180 -->|next| B181
B181 -->|call| B167
B181 -->|after return| B182
B182 -->|condition true| B181
B182 -->|condition false| B183
B184 -->|next| B185
B185 -->|condition true| B185
B185 -->|condition false| B186
B167["Continue at B168 in section 17"]
```

### B181

```asm
MOV R5,#250
```

### B182

```asm
ACALL LDELAY
```

### B183

```asm
DJNZ R5,qwe
```

### B184

Return to the instruction following the active call.

```asm
RET
```

### B185

```asm
MOV R5,#60
```

### B186

```asm
DJNZ R5,abc
```

### B187

Return to the instruction following the active call.

```asm
RET
```
