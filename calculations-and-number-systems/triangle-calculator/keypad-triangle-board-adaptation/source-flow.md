# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22)

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
321: /////////////////////////////////////////////////////////
```

## Section 1

```mermaid
flowchart TD
B0["B1: START1 - lines 12 to 12"]
B1["B2: instructions - lines 14 to 23"]
B2["B3: instructions - lines 24 to 24"]
B3["B4: MENU - lines 27 to 27"]
B4["B5: instructions - lines 28 to 28"]
B5["B6: instructions - lines 30 to 30"]
B6["B7: instructions - lines 31 to 31"]
B7["B8: instructions - lines 32 to 34"]
B8["B9: instructions - lines 36 to 36"]
B9["B10: instructions - lines 37 to 37"]
B0 -->|call| B144
B0 -->|after return| B1
B1 -->|call| B41
B1 -->|after return| B2
B2 -->|call| B190
B2 -->|after return| B3
B3 -->|call| B49
B3 -->|after return| B4
B4 -->|call| B190
B4 -->|after return| B5
B5 -->|call| B197
B5 -->|after return| B6
B6 -->|call| B167
B6 -->|after return| B7
B7 -->|call| B190
B7 -->|after return| B8
B8 -->|call| B57
B8 -->|after return| B9
B9 -->|call| B190
B9 -->|after return| B10
B144["Continue at B145 in section 15"]
B41["Continue at B42 in section 5"]
B190["Continue at B191 in section 20"]
B49["Continue at B50 in section 5"]
B197["Continue at B198 in section 20"]
B167["Continue at B168 in section 17"]
B57["Continue at B58 in section 6"]
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
MOV 60H, #0
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
ACALL KEYPAD
```

### B7

```asm
ACALL WCHR
```

### B8

```asm
SUBB A,#30H
MOV 30H,A
ACALL DELAY
```

### B9

```asm
ACALL SELECTT
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 40 to 41"]
B11["B12: instructions - lines 43 to 43"]
B12["B13: instructions - lines 45 to 45"]
B13["B14: instructions - lines 46 to 46"]
B14["B15: instructions - lines 47 to 47"]
B15["B16: instructions - lines 48 to 48"]
B16["B17: instructions - lines 49 to 49"]
B17["B18: OPERATION2 - lines 52 to 52"]
B18["B19: instructions - lines 54 to 54"]
B19["B20: instructions - lines 56 to 56"]
B10 -->|condition true| B17
B10 -->|condition false| B11
B11 -->|call| B78
B11 -->|after return| B12
B12 -->|call| B63
B12 -->|after return| B13
B13 -->|call| B98
B13 -->|after return| B14
B14 -->|call| B33
B14 -->|after return| B15
B15 -->|call| B118
B15 -->|after return| B16
B16 -->|call| B35
B16 -->|after return| B17
B17 -->|condition true| B24
B17 -->|condition false| B18
B18 -->|call| B78
B18 -->|after return| B19
B19 -->|call| B67
B19 -->|after return| B20
B78["Continue at B79 in section 8"]
B63["Continue at B64 in section 7"]
B98["Continue at B99 in section 10"]
B33["Continue at B34 in section 4"]
B118["Continue at B119 in section 12"]
B35["Continue at B36 in section 4"]
B24["Continue at B25 in section 3"]
B67["Continue at B68 in section 7"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,30H
CJNE A,#1,OPERATION2
```

### B12

```asm
ACALL FLASHING
```

### B13

```asm
ACALL OPTIONN1
```

### B14

```asm
ACALL ENTER_DIM
```

### B15

```asm
ACALL AREAA
```

### B16

```asm
ACALL PRINT1
```

### B17

```asm
ACALL CONTINUE
```

### B18

```asm
CJNE A,#2,WRONG
```

### B19

```asm
ACALL FLASHING
```

### B20

```asm
ACALL OPTIONN2
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 57 to 57"]
B21["B22: instructions - lines 58 to 58"]
B22["B23: instructions - lines 59 to 59"]
B23["B24: instructions - lines 60 to 60"]
B24["B25: WRONG - lines 63 to 63"]
B25["B26: instructions - lines 64 to 64"]
B26["B27: EXIT - lines 68 to 68"]
B27["B28: instructions - lines 69 to 69"]
B28["B29: instructions - lines 70 to 71"]
B29["B30: instructions - lines 72 to 73"]
B20 -->|call| B82
B20 -->|after return| B21
B21 -->|call| B34
B21 -->|after return| B22
B22 -->|call| B131
B22 -->|after return| B23
B23 -->|call| B35
B23 -->|after return| B24
B24 -->|call| B71
B24 -->|after return| B25
B25 -->|jump| B3
B26 -->|call| B184
B26 -->|after return| B27
B27 -->|call| B190
B27 -->|after return| B28
B28 -->|call| B164
B28 -->|after return| B29
B29 -->|call| B172
B29 -->|after return| B30
B82["Continue at B83 in section 9"]
B34["Continue at B35 in section 4"]
B131["Continue at B132 in section 14"]
B35["Continue at B36 in section 4"]
B71["Continue at B72 in section 8"]
B3["Continue at B4 in section 1"]
B184["Continue at B185 in section 19"]
B190["Continue at B191 in section 20"]
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL ENTER_SIDES
```

### B22

```asm
ACALL PERIMETER
```

### B23

```asm
ACALL PRINT2
```

### B24

```asm
ACALL CONTINUE
```

### B25

```asm
ACALL WRONGG
```

### B26

```asm
SJMP MENU
```

### B27

```asm
ACALL CLEAR
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
mov a, #80H
acall cmd
```

### B30

```asm
mov dptr, #THANKS
acall wstr
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 75 to 75"]
B31["B32: instructions - lines 76 to 76"]
B32["B33: EE - lines 78 to 78"]
B33["B34: AREAA - lines 83 to 92"]
B34["B35: PERIMETER - lines 96 to 103"]
B35["B36: CONTINUE - lines 106 to 106"]
B36["B37: instructions - lines 107 to 107"]
B37["B38: instructions - lines 108 to 108"]
B38["B39: instructions - lines 109 to 111"]
B39["B40: instructions - lines 112 to 112"]
B30 -->|call| B78
B30 -->|after return| B31
B31 -->|call| B190
B31 -->|after return| B32
B32 -->|jump| B32
B35 -->|call| B111
B35 -->|after return| B36
B36 -->|call| B197
B36 -->|after return| B37
B37 -->|call| B167
B37 -->|after return| B38
B38 -->|condition true| B26
B38 -->|condition false| B39
B39 -->|jump| B3
B78["Continue at B79 in section 8"]
B190["Continue at B191 in section 20"]
B111["Continue at B112 in section 12"]
B197["Continue at B198 in section 20"]
B167["Continue at B168 in section 17"]
B26["Continue at B27 in section 3"]
B3["Continue at B4 in section 1"]
```

### B31

```asm
ACALL FLASHING
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
SJMP EE
```

### B34

Return to the instruction following the active call.

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV B,#2
DIV AB
MOV 50H,A
MOV 51H,B
RET
```

### B35

Return to the instruction following the active call.

```asm
MOV A,42H
ADD A,43H
ADD A,44H
MOV 50H,A
RET
```

### B36

```asm
ACALL CON
```

### B37

```asm
ACALL KEYPAD
```

### B38

```asm
ACALL WCHR
```

### B39

```asm
SUBB A,#30H
MOV 60H,A
CJNE A,#1,EXIT
```

### B40

```asm
SJMP MENU
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 113 to 113"]
B41["B42: WELCOME - lines 117 to 117"]
B42["B43: instructions - lines 118 to 118"]
B43["B44: instructions - lines 119 to 120"]
B44["B45: instructions - lines 121 to 122"]
B45["B46: instructions - lines 124 to 125"]
B46["B47: instructions - lines 126 to 127"]
B47["B48: instructions - lines 128 to 128"]
B48["B49: instructions - lines 129 to 129"]
B49["B50: MENUU - lines 132 to 132"]
B41 -->|call| B184
B41 -->|after return| B42
B42 -->|call| B190
B42 -->|after return| B43
B43 -->|call| B164
B43 -->|after return| B44
B44 -->|call| B172
B44 -->|after return| B45
B45 -->|call| B164
B45 -->|after return| B46
B46 -->|call| B172
B46 -->|after return| B47
B47 -->|call| B190
B47 -->|after return| B48
B49 -->|call| B184
B49 -->|after return| B50
B184["Continue at B185 in section 19"]
B190["Continue at B191 in section 20"]
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

```asm
ACALL CLEAR
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
mov a, #80H
acall cmd
```

### B45

```asm
mov dptr, #NAMEE
acall wstr
```

### B46

```asm
mov a,#0C0H
acall cmd
```

### B47

```asm
mov dptr, #PROJECT
acall wstr
```

### B48

```asm
acall delay
```

### B49

Return to the instruction following the active call.

```asm
ret
```

### B50

```asm
ACALL CLEAR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 133 to 133"]
B51["B52: instructions - lines 134 to 135"]
B52["B53: instructions - lines 136 to 137"]
B53["B54: instructions - lines 139 to 140"]
B54["B55: instructions - lines 141 to 142"]
B55["B56: instructions - lines 143 to 143"]
B56["B57: instructions - lines 144 to 144"]
B57["B58: SELECTT - lines 147 to 147"]
B58["B59: instructions - lines 148 to 148"]
B59["B60: instructions - lines 149 to 150"]
B50 -->|call| B190
B50 -->|after return| B51
B51 -->|call| B164
B51 -->|after return| B52
B52 -->|call| B172
B52 -->|after return| B53
B53 -->|call| B164
B53 -->|after return| B54
B54 -->|call| B172
B54 -->|after return| B55
B55 -->|call| B190
B55 -->|after return| B56
B57 -->|call| B184
B57 -->|after return| B58
B58 -->|call| B190
B58 -->|after return| B59
B59 -->|call| B164
B59 -->|after return| B60
B190["Continue at B191 in section 20"]
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B184["Continue at B185 in section 19"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
mov a, #80H
acall cmd
```

### B53

```asm
mov dptr, #OP1
acall wstr
```

### B54

```asm
mov a,#0C0H
acall cmd
```

### B55

```asm
mov dptr, #OP2
acall wstr
```

### B56

```asm
acall delay
```

### B57

Return to the instruction following the active call.

```asm
ret
```

### B58

```asm
ACALL CLEAR
```

### B59

```asm
ACALL DELAY
```

### B60

```asm
mov a, #80H
acall cmd
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 151 to 152"]
B61["B62: instructions - lines 154 to 156"]
B62["B63: instructions - lines 157 to 157"]
B63["B64: OPTIONN1 - lines 160 to 161"]
B64["B65: instructions - lines 162 to 163"]
B65["B66: instructions - lines 164 to 164"]
B66["B67: instructions - lines 165 to 165"]
B67["B68: OPTIONN2 - lines 168 to 169"]
B68["B69: instructions - lines 170 to 171"]
B69["B70: instructions - lines 172 to 172"]
B60 -->|call| B172
B60 -->|after return| B61
B61 -->|call| B167
B61 -->|after return| B62
B63 -->|call| B164
B63 -->|after return| B64
B64 -->|call| B172
B64 -->|after return| B65
B65 -->|call| B190
B65 -->|after return| B66
B67 -->|call| B164
B67 -->|after return| B68
B68 -->|call| B172
B68 -->|after return| B69
B69 -->|call| B190
B69 -->|after return| B70
B172["Continue at B173 in section 18"]
B167["Continue at B168 in section 17"]
B164["Continue at B165 in section 17"]
B190["Continue at B191 in section 20"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov dptr, #MSG
acall wstr
```

### B62

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B63

Return to the instruction following the active call.

```asm
RET
```

### B64

```asm
mov a,#0C0H
acall cmd
```

### B65

```asm
mov dptr, #MSG1
acall wstr
```

### B66

```asm
acall delay
```

### B67

Return to the instruction following the active call.

```asm
ret
```

### B68

```asm
mov a,#0C0H
acall cmd
```

### B69

```asm
mov dptr, #MSG2
acall wstr
```

### B70

```asm
acall delay
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 173 to 173"]
B71["B72: WRONGG - lines 176 to 177"]
B72["B73: instructions - lines 178 to 179"]
B73["B74: instructions - lines 180 to 180"]
B74["B75: instructions - lines 182 to 183"]
B75["B76: AG1 - lines 184 to 184"]
B76["B77: instructions - lines 185 to 185"]
B77["B78: instructions - lines 186 to 187"]
B78["B79: FLASHING - lines 190 to 191"]
B79["B80: AG - lines 192 to 192"]
B71 -->|call| B164
B71 -->|after return| B72
B72 -->|call| B172
B72 -->|after return| B73
B73 -->|call| B190
B73 -->|after return| B74
B74 -->|next| B75
B75 -->|call| B190
B75 -->|after return| B76
B76 -->|condition true| B75
B76 -->|condition false| B77
B78 -->|next| B79
B79 -->|call| B194
B79 -->|after return| B80
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B190["Continue at B191 in section 20"]
B194["Continue at B195 in section 20"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
ret
```

### B72

```asm
mov a,#0C0H
acall cmd
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

```asm
MOV R4,#10
CLR R
```

### B76

```asm
ACALL DELAY
```

### B77

```asm
DJNZ R4,AG1
```

### B78

Return to the instruction following the active call.

```asm
SETB R
ret
```

### B79

```asm
MOV R4,#10
CLR G
```

### B80

```asm
ACALL DELAY1
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 193 to 193"]
B81["B82: instructions - lines 194 to 195"]
B82["B83: ENTER_SIDES - lines 198 to 198"]
B83["B84: instructions - lines 199 to 199"]
B84["B85: instructions - lines 200 to 201"]
B85["B86: instructions - lines 202 to 203"]
B86["B87: instructions - lines 205 to 206"]
B87["B88: instructions - lines 207 to 208"]
B88["B89: instructions - lines 209 to 209"]
B89["B90: instructions - lines 210 to 210"]
B80 -->|condition true| B79
B80 -->|condition false| B81
B82 -->|call| B184
B82 -->|after return| B83
B83 -->|call| B190
B83 -->|after return| B84
B84 -->|call| B164
B84 -->|after return| B85
B85 -->|call| B172
B85 -->|after return| B86
B86 -->|call| B164
B86 -->|after return| B87
B87 -->|call| B172
B87 -->|after return| B88
B88 -->|call| B197
B88 -->|after return| B89
B89 -->|call| B167
B89 -->|after return| B90
B79["Continue at B80 in section 8"]
B184["Continue at B185 in section 19"]
B190["Continue at B191 in section 20"]
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B197["Continue at B198 in section 20"]
B167["Continue at B168 in section 17"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
DJNZ R4,AG
```

### B82

Return to the instruction following the active call.

```asm
SETB G
RET
```

### B83

```asm
ACALL CLEAR
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
mov a, #80H
acall cmd
```

### B86

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B87

```asm
mov a, #0C0H
acall cmd
```

### B88

```asm
mov dptr, #SIDEA
acall wstr
```

### B89

```asm
ACALL KEYPAD
```

### B90

```asm
ACALL WCHR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 211 to 215"]
B91["B92: instructions - lines 216 to 216"]
B92["B93: instructions - lines 217 to 217"]
B93["B94: instructions - lines 218 to 222"]
B94["B95: instructions - lines 223 to 223"]
B95["B96: instructions - lines 224 to 224"]
B96["B97: instructions - lines 225 to 227"]
B97["B98: instructions - lines 228 to 228"]
B98["B99: ENTER_DIM - lines 232 to 232"]
B99["B100: instructions - lines 233 to 233"]
B90 -->|call| B172
B90 -->|after return| B91
B91 -->|call| B197
B91 -->|after return| B92
B92 -->|call| B167
B92 -->|after return| B93
B93 -->|call| B172
B93 -->|after return| B94
B94 -->|call| B197
B94 -->|after return| B95
B95 -->|call| B167
B95 -->|after return| B96
B96 -->|call| B190
B96 -->|after return| B97
B98 -->|call| B184
B98 -->|after return| B99
B99 -->|call| B190
B99 -->|after return| B100
B172["Continue at B173 in section 18"]
B197["Continue at B198 in section 20"]
B167["Continue at B168 in section 17"]
B190["Continue at B191 in section 20"]
B184["Continue at B185 in section 19"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
SUBB A,#30H
MOV 42H,A
mov dptr, #SIDEB
acall wstr
```

### B92

```asm
ACALL KEYPAD
```

### B93

```asm
ACALL WCHR
```

### B94

```asm
SUBB A,#30H
MOV 43H,A
mov dptr, #SIDEC
acall wstr
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
MOV 44H,A
ACALL DELAY
```

### B98

Return to the instruction following the active call.

```asm
RET
```

### B99

```asm
ACALL CLEAR
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 234 to 235"]
B101["B102: instructions - lines 236 to 237"]
B102["B103: instructions - lines 238 to 239"]
B103["B104: instructions - lines 240 to 241"]
B104["B105: instructions - lines 243 to 243"]
B105["B106: instructions - lines 244 to 244"]
B106["B107: instructions - lines 245 to 249"]
B107["B108: instructions - lines 251 to 251"]
B108["B109: instructions - lines 252 to 252"]
B109["B110: instructions - lines 253 to 256"]
B100 -->|call| B164
B100 -->|after return| B101
B101 -->|call| B172
B101 -->|after return| B102
B102 -->|call| B164
B102 -->|after return| B103
B103 -->|call| B172
B103 -->|after return| B104
B104 -->|call| B197
B104 -->|after return| B105
B105 -->|call| B167
B105 -->|after return| B106
B106 -->|call| B172
B106 -->|after return| B107
B107 -->|call| B197
B107 -->|after return| B108
B108 -->|call| B167
B108 -->|after return| B109
B109 -->|call| B190
B109 -->|after return| B110
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B197["Continue at B198 in section 20"]
B167["Continue at B168 in section 17"]
B190["Continue at B191 in section 20"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov a, #80H
acall cmd
```

### B102

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B103

```asm
mov a, #0C0H
acall cmd
```

### B104

```asm
mov dptr, #SIDEB
acall wstr
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
MOV 40H,A
mov dptr, #HIGHT
acall wstr
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
MOV 41H,A
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 257 to 257"]
B111["B112: CON - lines 260 to 260"]
B112["B113: instructions - lines 261 to 261"]
B113["B114: instructions - lines 262 to 263"]
B114["B115: instructions - lines 264 to 265"]
B115["B116: instructions - lines 266 to 267"]
B116["B117: instructions - lines 268 to 269"]
B117["B118: instructions - lines 270 to 270"]
B118["B119: PRINT1 - lines 273 to 273"]
B119["B120: instructions - lines 274 to 274"]
B111 -->|call| B184
B111 -->|after return| B112
B112 -->|call| B190
B112 -->|after return| B113
B113 -->|call| B164
B113 -->|after return| B114
B114 -->|call| B172
B114 -->|after return| B115
B115 -->|call| B164
B115 -->|after return| B116
B116 -->|call| B172
B116 -->|after return| B117
B118 -->|call| B184
B118 -->|after return| B119
B119 -->|call| B190
B119 -->|after return| B120
B184["Continue at B185 in section 19"]
B190["Continue at B191 in section 20"]
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
RET
```

### B112

```asm
ACALL CLEAR
```

### B113

```asm
ACALL DELAY
```

### B114

```asm
mov a, #80H
acall cmd
```

### B115

```asm
mov dptr, #CONT11
acall wstr
```

### B116

```asm
mov a, #0C0H
acall cmd
```

### B117

```asm
mov dptr, #CONT22
acall wstr
```

### B118

Return to the instruction following the active call.

```asm
RET
```

### B119

```asm
ACALL CLEAR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 275 to 276"]
B121["B122: instructions - lines 277 to 278"]
B122["B123: instructions - lines 279 to 283"]
B123["B124: instructions - lines 284 to 286"]
B124["B125: instructions - lines 287 to 287"]
B125["B126: instructions - lines 288 to 289"]
B126["B127: instructions - lines 290 to 291"]
B127["B128: instructions - lines 292 to 294"]
B128["B129: instructions - lines 295 to 295"]
B129["B130: instructions - lines 296 to 296"]
B120 -->|call| B164
B120 -->|after return| B121
B121 -->|call| B172
B121 -->|after return| B122
B122 -->|call| B167
B122 -->|after return| B123
B123 -->|call| B167
B123 -->|after return| B124
B124 -->|call| B177
B124 -->|after return| B125
B125 -->|call| B164
B125 -->|after return| B126
B126 -->|call| B172
B126 -->|after return| B127
B127 -->|call| B167
B127 -->|after return| B128
B128 -->|call| B190
B128 -->|after return| B129
B129 -->|call| B190
B129 -->|after return| B130
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B167["Continue at B168 in section 17"]
B177["Continue at B178 in section 18"]
B190["Continue at B191 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
mov a, #80H
acall cmd
```

### B122

```asm
mov dptr, #AAREA
acall wstr
```

### B123

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B124

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B125

```asm
ACALL LDELAY
```

### B126

```asm
mov a, #0C0H
acall cmd
```

### B127

```asm
mov dptr, #REMINDER
acall wstr
```

### B128

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 298 to 298"]
B131["B132: PRINT2 - lines 301 to 301"]
B132["B133: instructions - lines 302 to 302"]
B133["B134: instructions - lines 303 to 304"]
B134["B135: instructions - lines 305 to 306"]
B135["B136: instructions - lines 308 to 312"]
B136["B137: instructions - lines 313 to 315"]
B137["B138: instructions - lines 316 to 316"]
B138["B139: instructions - lines 317 to 317"]
B139["B140: STOP - lines 323 to 323"]
B131 -->|call| B184
B131 -->|after return| B132
B132 -->|call| B190
B132 -->|after return| B133
B133 -->|call| B164
B133 -->|after return| B134
B134 -->|call| B172
B134 -->|after return| B135
B135 -->|call| B167
B135 -->|after return| B136
B136 -->|call| B167
B136 -->|after return| B137
B137 -->|call| B190
B137 -->|after return| B138
B139 -->|jump| B139
B184["Continue at B185 in section 19"]
B190["Continue at B191 in section 20"]
B164["Continue at B165 in section 17"]
B172["Continue at B173 in section 18"]
B167["Continue at B168 in section 17"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

```asm
ACALL CLEAR
```

### B133

```asm
ACALL DELAY
```

### B134

```asm
mov a, #80H
acall cmd
```

### B135

```asm
mov dptr, #PPERIMETER
acall wstr
```

### B136

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B137

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B138

```asm
ACALL DELAY
```

### B139

Return to the instruction following the active call.

```asm
RET
```

### B140

```asm
SJMP STOP
```

## Section 15

```mermaid
flowchart TD
B140["B141: TIME - lines 327 to 327"]
B141["B142: LOOP66 - lines 328 to 328"]
B142["B143: instructions - lines 329 to 329"]
B143["B144: instructions - lines 330 to 330"]
B144["B145: INLCD - lines 333 to 334"]
B145["B146: WAIT - lines 336 to 336"]
B146["B147: instructions - lines 337 to 337"]
B147["B148: instructions - lines 339 to 341"]
B148["B149: instructions - lines 342 to 342"]
B149["B150: instructions - lines 343 to 344"]
B140 -->|next| B141
B141 -->|call| B177
B141 -->|after return| B142
B142 -->|condition true| B141
B142 -->|condition false| B143
B144 -->|next| B145
B145 -->|call| B177
B145 -->|after return| B146
B146 -->|condition true| B145
B146 -->|condition false| B147
B147 -->|call| B164
B147 -->|after return| B148
B148 -->|call| B177
B148 -->|after return| B149
B149 -->|call| B164
B149 -->|after return| B150
B177["Continue at B178 in section 18"]
B164["Continue at B165 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV R3,#50
```

### B142

```asm
ACALL LDELAY
```

### B143

```asm
DJNZ R3,LOOP66
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
PUSH 7
MOV R7,#20
```

### B146

```asm
ACALL LDELAY
```

### B147

```asm
DJNZ R7,WAIT
```

### B148

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B149

```asm
ACALL LDELAY
```

### B150

```asm
MOV A,#0011B
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 345 to 346"]
B151["B152: instructions - lines 347 to 348"]
B152["B153: instructions - lines 349 to 350"]
B153["B154: instructions - lines 351 to 352"]
B154["B155: instructions - lines 353 to 354"]
B155["B156: instructions - lines 355 to 356"]
B156["B157: instructions - lines 357 to 358"]
B157["B158: instructions - lines 359 to 360"]
B158["B159: instructions - lines 361 to 361"]
B159["B160: instructions - lines 362 to 363"]
B150 -->|call| B164
B150 -->|after return| B151
B151 -->|call| B164
B151 -->|after return| B152
B152 -->|call| B164
B152 -->|after return| B153
B153 -->|call| B164
B153 -->|after return| B154
B154 -->|call| B164
B154 -->|after return| B155
B155 -->|call| B164
B155 -->|after return| B156
B156 -->|call| B164
B156 -->|after return| B157
B157 -->|call| B164
B157 -->|after return| B158
B158 -->|call| B177
B158 -->|after return| B159
B159 -->|call| B164
B159 -->|after return| B160
B164["Continue at B165 in section 17"]
B177["Continue at B178 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#0011B
ACALL CMD
```

### B152

```asm
MOV A,#0010B
ACALL CMD
```

### B153

```asm
MOV A,#0010B
ACALL CMD
```

### B154

```asm
MOV A,#1000B
ACALL CMD
```

### B155

```asm
MOV A,#0000B
ACALL CMD
```

### B156

```asm
MOV A,#1000B
ACALL CMD
```

### B157

```asm
MOV A,#0
ACALL CMD
```

### B158

```asm
MOV A,#0001B
ACALL CMD
```

### B159

```asm
ACALL LDELAY
```

### B160

```asm
MOV A,#0000B
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 364 to 365"]
B161["B162: instructions - lines 366 to 367"]
B162["B163: instructions - lines 368 to 369"]
B163["B164: instructions - lines 371 to 372"]
B164["B165: CMD - lines 376 to 382"]
B165["B166: instructions - lines 383 to 384"]
B166["B167: instructions - lines 386 to 388"]
B167["B168: WCHR - lines 391 to 397"]
B168["B169: instructions - lines 398 to 399"]
B169["B170: instructions - lines 401 to 403"]
B160 -->|call| B164
B160 -->|after return| B161
B161 -->|call| B164
B161 -->|after return| B162
B162 -->|call| B164
B162 -->|after return| B163
B164 -->|call| B170
B164 -->|after return| B165
B165 -->|call| B170
B165 -->|after return| B166
B167 -->|call| B170
B167 -->|after return| B168
B168 -->|call| B170
B168 -->|after return| B169
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#0110B
ACALL CMD
```

### B162

```asm
MOV A,#0000B
ACALL CMD
```

### B163

```asm
MOV A,#1111B
ACALL CMD
```

### B164

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B165

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B166

```asm
MOV A,B
ACALL COMMON
```

### B167

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B168

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B169

```asm
MOV A,B
ACALL COMMON
```

### B170

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: COMMON - lines 406 to 413"]
B171["B172: instructions - lines 414 to 414"]
B172["B173: WSTR - lines 417 to 417"]
B173["B174: CONT1 - lines 419 to 421"]
B174["B175: instructions - lines 422 to 422"]
B175["B176: instructions - lines 423 to 424"]
B176["B177: EXIT1 - lines 426 to 427"]
B177["B178: LDELAY - lines 430 to 432"]
B178["B179: CON4 - lines 434 to 435"]
B179["B180: instructions - lines 436 to 436"]
B170 -->|call| B177
B170 -->|after return| B171
B172 -->|next| B173
B173 -->|condition true| B176
B173 -->|condition false| B174
B174 -->|call| B167
B174 -->|after return| B175
B175 -->|jump| B173
B177 -->|next| B178
B178 -->|condition true| B178
B178 -->|condition false| B179
B179 -->|condition true| B178
B179 -->|condition false| B180
B167["Continue at B168 in section 17"]
B180["Continue at B181 in section 19"]
```

### B171

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

### B172

Return to the instruction following the active call.

```asm
RET
```

### B173

```asm
PUSH ACC
```

### B174

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B175

```asm
ACALL WCHR
```

### B176

```asm
INC DPTR
AJMP CONT1
```

### B177

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B178

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B179

```asm
MOV R0,#250
DJNZ R0,$
```

### B180

```asm
DJNZ R1,CON4
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 437 to 439"]
B181["B182: TMSEC - lines 444 to 447"]
B182["B183: BACK - lines 448 to 448"]
B183["B184: instructions - lines 449 to 451"]
B184["B185: CLEAR - lines 454 to 455"]
B185["B186: instructions - lines 456 to 456"]
B186["B187: instructions - lines 457 to 457"]
B187["B188: WAITT - lines 458 to 458"]
B188["B189: instructions - lines 459 to 459"]
B189["B190: instructions - lines 460 to 460"]
B181 -->|next| B182
B182 -->|condition true| B182
B182 -->|condition false| B183
B184 -->|call| B164
B184 -->|after return| B185
B185 -->|call| B177
B185 -->|after return| B186
B186 -->|next| B187
B187 -->|call| B177
B187 -->|after return| B188
B188 -->|condition true| B187
B188 -->|condition false| B189
B164["Continue at B165 in section 17"]
B177["Continue at B178 in section 18"]
```

### B181

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B182

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B183

```asm
JNB TF0,BACK
```

### B184

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B185

```asm
MOV A,#1H
ACALL CMD
```

### B186

```asm
ACALL LDELAY
```

### B187

```asm
MOV R7,#14
```

### B188

```asm
ACALL LDELAY
```

### B189

```asm
DJNZ R7,WAITT
```

### B190

Return to the instruction following the active call.

```asm
RET
```

## Section 20

```mermaid
flowchart TD
B190["B191: DELAY - lines 464 to 464"]
B191["B192: QWE - lines 466 to 466"]
B192["B193: instructions - lines 467 to 467"]
B193["B194: instructions - lines 468 to 468"]
B194["B195: DELAY1 - lines 470 to 470"]
B195["B196: ABC - lines 472 to 472"]
B196["B197: instructions - lines 473 to 473"]
B197["B198: KEYPAD - lines 481 to 481"]
B198["B199: K1 - lines 482 to 485"]
B199["B200: K2 - lines 486 to 486"]
B190 -->|next| B191
B191 -->|call| B177
B191 -->|after return| B192
B192 -->|condition true| B191
B192 -->|condition false| B193
B194 -->|next| B195
B195 -->|condition true| B195
B195 -->|condition false| B196
B197 -->|next| B198
B198 -->|condition true| B198
B198 -->|condition false| B199
B199 -->|call| B181
B199 -->|after return| B200
B177["Continue at B178 in section 18"]
B181["Continue at B182 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV R5,#250
```

### B192

```asm
ACALL LDELAY
```

### B193

```asm
DJNZ R5,qwe
```

### B194

Return to the instruction following the active call.

```asm
RET
```

### B195

```asm
MOV R5,#60
```

### B196

```asm
DJNZ R5,abc
```

### B197

Return to the instruction following the active call.

```asm
RET
```

### B198

```asm
MOV P2,#11110000B
```

### B199

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B200

```asm
ACALL TMSEC
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 487 to 489"]
B201["B202: instructions - lines 490 to 490"]
B202["B203: OVER - lines 492 to 492"]
B203["B204: instructions - lines 493 to 495"]
B204["B205: instructions - lines 496 to 496"]
B205["B206: OVER1 - lines 498 to 501"]
B206["B207: instructions - lines 502 to 505"]
B207["B208: instructions - lines 506 to 509"]
B208["B209: instructions - lines 510 to 513"]
B209["B210: instructions - lines 514 to 514"]
B200 -->|condition true| B202
B200 -->|condition false| B201
B201 -->|jump| B199
B202 -->|call| B181
B202 -->|after return| B203
B203 -->|condition true| B205
B203 -->|condition false| B204
B204 -->|jump| B199
B205 -->|condition true| B210
B205 -->|condition false| B206
B206 -->|condition true| B211
B206 -->|condition false| B207
B207 -->|condition true| B212
B207 -->|condition false| B208
B208 -->|condition true| B213
B208 -->|condition false| B209
B209 -->|jump| B199
B199["Continue at B200 in section 20"]
B181["Continue at B182 in section 19"]
B210["Continue at B211 in section 22"]
B211["Continue at B212 in section 22"]
B212["Continue at B213 in section 22"]
B213["Continue at B214 in section 22"]
```

### B201

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B202

```asm
SJMP K2
```

### B203

```asm
ACALL TMSEC
```

### B204

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B205

```asm
SJMP K2
```

### B206

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B207

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B208

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B209

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B210

```asm
LJMP K2
```

## Section 22

```mermaid
flowchart TD
B210["B211: ROW_0 - lines 515 to 516"]
B211["B212: ROW_1 - lines 517 to 518"]
B212["B213: ROW_2 - lines 519 to 520"]
B213["B214: ROW_3 - lines 521 to 521"]
B214["B215: FIND - lines 523 to 523"]
B215["B216: FIND1 - lines 525 to 526"]
B216["B217: instructions - lines 527 to 528"]
B217["B218: MATCH - lines 530 to 532"]
B210 -->|jump| B214
B211 -->|jump| B214
B212 -->|jump| B214
B213 -->|next| B214
B214 -->|next| B215
B215 -->|condition true| B217
B215 -->|condition false| B216
B216 -->|jump| B215
```

### B211

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B212

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B213

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B214

```asm
MOV DPTR,#KCODE3
```

### B215

```asm
SWAP A
```

### B216

```asm
RRC A
JNC MATCH
```

### B217

```asm
INC DPTR
SJMP FIND1
```

### B218

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
