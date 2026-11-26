# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23)

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
341: /////////////////////////////////////////////////////////
```

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 11 to 11"]
B1["B2: instructions - lines 13 to 14"]
B2["B3: START1 - lines 19 to 19"]
B3["B4: instructions - lines 21 to 31"]
B4["B5: instructions - lines 32 to 32"]
B5["B6: instructions - lines 34 to 34"]
B6["B7: instructions - lines 35 to 35"]
B7["B8: instructions - lines 36 to 37"]
B8["B9: instructions - lines 38 to 39"]
B9["B10: WAITHERE - lines 42 to 43"]
B0 -->|jump| B2
B2 -->|call| B152
B2 -->|after return| B3
B3 -->|call| B49
B3 -->|after return| B4
B4 -->|call| B198
B4 -->|after return| B5
B5 -->|call| B192
B5 -->|after return| B6
B6 -->|call| B198
B6 -->|after return| B7
B7 -->|call| B172
B7 -->|after return| B8
B8 -->|call| B180
B8 -->|after return| B9
B9 -->|condition true| B9
B9 -->|condition false| B10
B152["Continue at B153 in section 16"]
B49["Continue at B50 in section 5"]
B198["Continue at B199 in section 20"]
B192["Continue at B193 in section 20"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP START1
```

### B2

Resume the interrupted program.

```asm
MOV 3AH,#1
RETI
```

### B3

```asm
ACALL INLCD
```

### B4

```asm
MOV IE,#10000001B
SETB IT0
MOV 30H, #8
MOV 40H, #3
MOV 41H, #4
MOV 42H, #2
MOV 43H, #3
MOV 44H, #4
MOV 50H, #0
MOV 51H, #0
ACALL WELCOME
```

### B5

```asm
ACALL DELAY
```

### B6

```asm
ACALL CLEAR
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
mov a, #80H
acall cmd
```

### B9

```asm
mov dptr, #ISR
acall wstr
```

### B10

```asm
MOV A,3AH
CJNE A,#1,WAIThere
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 44 to 44"]
B11["B12: MENU - lines 48 to 48"]
B12["B13: instructions - lines 49 to 49"]
B13["B14: instructions - lines 51 to 51"]
B14["B15: instructions - lines 52 to 52"]
B15["B16: instructions - lines 53 to 55"]
B16["B17: instructions - lines 57 to 57"]
B17["B18: instructions - lines 58 to 58"]
B18["B19: instructions - lines 61 to 62"]
B19["B20: instructions - lines 64 to 64"]
B10 -->|next| B11
B11 -->|call| B57
B11 -->|after return| B12
B12 -->|call| B198
B12 -->|after return| B13
B13 -->|call| B205
B13 -->|after return| B14
B14 -->|call| B175
B14 -->|after return| B15
B15 -->|call| B198
B15 -->|after return| B16
B16 -->|call| B65
B16 -->|after return| B17
B17 -->|call| B198
B17 -->|after return| B18
B18 -->|condition true| B25
B18 -->|condition false| B19
B19 -->|call| B86
B19 -->|after return| B20
B57["Continue at B58 in section 6"]
B198["Continue at B199 in section 20"]
B205["Continue at B206 in section 21"]
B175["Continue at B176 in section 18"]
B65["Continue at B66 in section 7"]
B25["Continue at B26 in section 3"]
B86["Continue at B87 in section 9"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV 3AH,#0
```

### B12

```asm
ACALL Menuu
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
ACALL KEYPAD
```

### B15

```asm
ACALL WCHR
```

### B16

```asm
SUBB A,#30H
MOV 30H,A
ACALL DELAY
```

### B17

```asm
ACALL SELECTT
```

### B18

```asm
ACALL DELAY
```

### B19

```asm
MOV A,30H
CJNE A,#1,OPERATION2
```

### B20

```asm
ACALL FLASHING
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 66 to 66"]
B21["B22: instructions - lines 67 to 67"]
B22["B23: instructions - lines 68 to 68"]
B23["B24: instructions - lines 69 to 69"]
B24["B25: instructions - lines 70 to 70"]
B25["B26: OPERATION2 - lines 73 to 73"]
B26["B27: instructions - lines 75 to 75"]
B27["B28: instructions - lines 77 to 77"]
B28["B29: instructions - lines 78 to 78"]
B29["B30: instructions - lines 79 to 79"]
B20 -->|call| B71
B20 -->|after return| B21
B21 -->|call| B106
B21 -->|after return| B22
B22 -->|call| B41
B22 -->|after return| B23
B23 -->|call| B126
B23 -->|after return| B24
B24 -->|call| B43
B24 -->|after return| B25
B25 -->|condition true| B32
B25 -->|condition false| B26
B26 -->|call| B86
B26 -->|after return| B27
B27 -->|call| B75
B27 -->|after return| B28
B28 -->|call| B90
B28 -->|after return| B29
B29 -->|call| B42
B29 -->|after return| B30
B71["Continue at B72 in section 8"]
B106["Continue at B107 in section 11"]
B41["Continue at B42 in section 5"]
B126["Continue at B127 in section 13"]
B43["Continue at B44 in section 5"]
B32["Continue at B33 in section 4"]
B86["Continue at B87 in section 9"]
B75["Continue at B76 in section 8"]
B90["Continue at B91 in section 10"]
B42["Continue at B43 in section 5"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL OPTIONN1
```

### B22

```asm
ACALL ENTER_DIM
```

### B23

```asm
ACALL AREAA
```

### B24

```asm
ACALL PRINT1
```

### B25

```asm
ACALL CONTINUE
```

### B26

```asm
CJNE A,#2,WRONG
```

### B27

```asm
ACALL FLASHING
```

### B28

```asm
ACALL OPTIONN2
```

### B29

```asm
ACALL ENTER_SIDES
```

### B30

```asm
ACALL PERIMETER
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 80 to 80"]
B31["B32: instructions - lines 81 to 81"]
B32["B33: WRONG - lines 84 to 84"]
B33["B34: instructions - lines 85 to 85"]
B34["B35: EXIT - lines 89 to 89"]
B35["B36: instructions - lines 90 to 90"]
B36["B37: instructions - lines 91 to 92"]
B37["B38: instructions - lines 93 to 94"]
B38["B39: instructions - lines 96 to 96"]
B39["B40: instructions - lines 97 to 97"]
B30 -->|call| B139
B30 -->|after return| B31
B31 -->|call| B43
B31 -->|after return| B32
B32 -->|call| B79
B32 -->|after return| B33
B33 -->|jump| B11
B34 -->|call| B192
B34 -->|after return| B35
B35 -->|call| B198
B35 -->|after return| B36
B36 -->|call| B172
B36 -->|after return| B37
B37 -->|call| B180
B37 -->|after return| B38
B38 -->|call| B86
B38 -->|after return| B39
B39 -->|call| B198
B39 -->|after return| B40
B139["Continue at B140 in section 14"]
B43["Continue at B44 in section 5"]
B79["Continue at B80 in section 8"]
B11["Continue at B12 in section 2"]
B192["Continue at B193 in section 20"]
B198["Continue at B199 in section 20"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B86["Continue at B87 in section 9"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL PRINT2
```

### B32

```asm
ACALL CONTINUE
```

### B33

```asm
ACALL WRONGG
```

### B34

```asm
SJMP MENU
```

### B35

```asm
ACALL CLEAR
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
mov a, #80H
acall cmd
```

### B38

```asm
mov dptr, #THANKS
acall wstr
```

### B39

```asm
ACALL FLASHING
```

### B40

```asm
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: EE - lines 99 to 99"]
B41["B42: AREAA - lines 104 to 113"]
B42["B43: PERIMETER - lines 117 to 124"]
B43["B44: CONTINUE - lines 127 to 127"]
B44["B45: instructions - lines 128 to 128"]
B45["B46: instructions - lines 129 to 129"]
B46["B47: instructions - lines 130 to 131"]
B47["B48: instructions - lines 132 to 132"]
B48["B49: instructions - lines 133 to 133"]
B49["B50: WELCOME - lines 137 to 137"]
B40 -->|jump| B40
B43 -->|call| B119
B43 -->|after return| B44
B44 -->|call| B205
B44 -->|after return| B45
B45 -->|call| B175
B45 -->|after return| B46
B46 -->|condition true| B34
B46 -->|condition false| B47
B47 -->|jump| B11
B49 -->|call| B192
B49 -->|after return| B50
B119["Continue at B120 in section 12"]
B205["Continue at B206 in section 21"]
B175["Continue at B176 in section 18"]
B34["Continue at B35 in section 4"]
B11["Continue at B12 in section 2"]
B192["Continue at B193 in section 20"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SJMP EE
```

### B42

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

### B43

Return to the instruction following the active call.

```asm
MOV A,42H
ADD A,43H
ADD A,44H
MOV 50H,A
RET
```

### B44

```asm
ACALL CON
```

### B45

```asm
ACALL KEYPAD
```

### B46

```asm
ACALL WCHR
```

### B47

```asm
SUBB A,#30H
CJNE A,#1,EXIT
```

### B48

```asm
SJMP MENU
```

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
ACALL CLEAR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 138 to 138"]
B51["B52: instructions - lines 139 to 140"]
B52["B53: instructions - lines 141 to 142"]
B53["B54: instructions - lines 144 to 145"]
B54["B55: instructions - lines 146 to 147"]
B55["B56: instructions - lines 148 to 148"]
B56["B57: instructions - lines 149 to 149"]
B57["B58: MENUU - lines 152 to 152"]
B58["B59: instructions - lines 153 to 153"]
B59["B60: instructions - lines 154 to 155"]
B50 -->|call| B198
B50 -->|after return| B51
B51 -->|call| B172
B51 -->|after return| B52
B52 -->|call| B180
B52 -->|after return| B53
B53 -->|call| B172
B53 -->|after return| B54
B54 -->|call| B180
B54 -->|after return| B55
B55 -->|call| B198
B55 -->|after return| B56
B57 -->|call| B192
B57 -->|after return| B58
B58 -->|call| B198
B58 -->|after return| B59
B59 -->|call| B172
B59 -->|after return| B60
B198["Continue at B199 in section 20"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B192["Continue at B193 in section 20"]
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
mov dptr, #NAMEE
acall wstr
```

### B54

```asm
mov a,#0C0H
acall cmd
```

### B55

```asm
mov dptr, #PROJECT
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
B60["B61: instructions - lines 156 to 157"]
B61["B62: instructions - lines 159 to 160"]
B62["B63: instructions - lines 161 to 162"]
B63["B64: instructions - lines 163 to 163"]
B64["B65: instructions - lines 164 to 164"]
B65["B66: SELECTT - lines 167 to 167"]
B66["B67: instructions - lines 168 to 168"]
B67["B68: instructions - lines 169 to 170"]
B68["B69: instructions - lines 171 to 172"]
B69["B70: instructions - lines 174 to 176"]
B60 -->|call| B180
B60 -->|after return| B61
B61 -->|call| B172
B61 -->|after return| B62
B62 -->|call| B180
B62 -->|after return| B63
B63 -->|call| B198
B63 -->|after return| B64
B65 -->|call| B192
B65 -->|after return| B66
B66 -->|call| B198
B66 -->|after return| B67
B67 -->|call| B172
B67 -->|after return| B68
B68 -->|call| B180
B68 -->|after return| B69
B69 -->|call| B175
B69 -->|after return| B70
B180["Continue at B181 in section 19"]
B172["Continue at B173 in section 18"]
B198["Continue at B199 in section 20"]
B192["Continue at B193 in section 20"]
B175["Continue at B176 in section 18"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov dptr, #OP1
acall wstr
```

### B62

```asm
mov a,#0C0H
acall cmd
```

### B63

```asm
mov dptr, #OP2
acall wstr
```

### B64

```asm
acall delay
```

### B65

Return to the instruction following the active call.

```asm
ret
```

### B66

```asm
ACALL CLEAR
```

### B67

```asm
ACALL DELAY
```

### B68

```asm
mov a, #80H
acall cmd
```

### B69

```asm
mov dptr, #MSG
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
B70["B71: instructions - lines 177 to 177"]
B71["B72: OPTIONN1 - lines 180 to 181"]
B72["B73: instructions - lines 182 to 183"]
B73["B74: instructions - lines 184 to 184"]
B74["B75: instructions - lines 185 to 185"]
B75["B76: OPTIONN2 - lines 188 to 189"]
B76["B77: instructions - lines 190 to 191"]
B77["B78: instructions - lines 192 to 192"]
B78["B79: instructions - lines 193 to 193"]
B79["B80: WRONGG - lines 196 to 197"]
B71 -->|call| B172
B71 -->|after return| B72
B72 -->|call| B180
B72 -->|after return| B73
B73 -->|call| B198
B73 -->|after return| B74
B75 -->|call| B172
B75 -->|after return| B76
B76 -->|call| B180
B76 -->|after return| B77
B77 -->|call| B198
B77 -->|after return| B78
B79 -->|call| B172
B79 -->|after return| B80
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B198["Continue at B199 in section 20"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
mov a,#0C0H
acall cmd
```

### B73

```asm
mov dptr, #MSG1
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
mov a,#0C0H
acall cmd
```

### B77

```asm
mov dptr, #MSG2
acall wstr
```

### B78

```asm
acall delay
```

### B79

Return to the instruction following the active call.

```asm
ret
```

### B80

```asm
mov a,#0C0H
acall cmd
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 198 to 199"]
B81["B82: instructions - lines 200 to 200"]
B82["B83: instructions - lines 202 to 203"]
B83["B84: AG1 - lines 204 to 204"]
B84["B85: instructions - lines 205 to 205"]
B85["B86: instructions - lines 206 to 207"]
B86["B87: FLASHING - lines 210 to 211"]
B87["B88: AG - lines 212 to 212"]
B88["B89: instructions - lines 213 to 213"]
B89["B90: instructions - lines 214 to 215"]
B80 -->|call| B180
B80 -->|after return| B81
B81 -->|call| B198
B81 -->|after return| B82
B82 -->|next| B83
B83 -->|call| B198
B83 -->|after return| B84
B84 -->|condition true| B83
B84 -->|condition false| B85
B86 -->|next| B87
B87 -->|call| B202
B87 -->|after return| B88
B88 -->|condition true| B87
B88 -->|condition false| B89
B180["Continue at B181 in section 19"]
B198["Continue at B199 in section 20"]
B202["Continue at B203 in section 21"]
```

### B81

```asm
mov dptr, #WRONGGG
acall wstr
```

### B82

```asm
acall delay
```

### B83

```asm
MOV R4,#10
CLR R
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
DJNZ R4,AG1
```

### B86

Return to the instruction following the active call.

```asm
SETB R
ret
```

### B87

```asm
MOV R4,#10
CLR G
```

### B88

```asm
ACALL DELAY1
```

### B89

```asm
DJNZ R4,AG
```

### B90

Return to the instruction following the active call.

```asm
SETB G
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: ENTER_SIDES - lines 218 to 218"]
B91["B92: instructions - lines 219 to 219"]
B92["B93: instructions - lines 220 to 221"]
B93["B94: instructions - lines 222 to 223"]
B94["B95: instructions - lines 225 to 226"]
B95["B96: instructions - lines 227 to 228"]
B96["B97: instructions - lines 229 to 229"]
B97["B98: instructions - lines 230 to 230"]
B98["B99: instructions - lines 231 to 235"]
B99["B100: instructions - lines 236 to 236"]
B90 -->|call| B192
B90 -->|after return| B91
B91 -->|call| B198
B91 -->|after return| B92
B92 -->|call| B172
B92 -->|after return| B93
B93 -->|call| B180
B93 -->|after return| B94
B94 -->|call| B172
B94 -->|after return| B95
B95 -->|call| B180
B95 -->|after return| B96
B96 -->|call| B205
B96 -->|after return| B97
B97 -->|call| B175
B97 -->|after return| B98
B98 -->|call| B180
B98 -->|after return| B99
B99 -->|call| B205
B99 -->|after return| B100
B192["Continue at B193 in section 20"]
B198["Continue at B199 in section 20"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B205["Continue at B206 in section 21"]
B175["Continue at B176 in section 18"]
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
mov a, #0C0H
acall cmd
```

### B96

```asm
mov dptr, #SIDEA
acall wstr
```

### B97

```asm
ACALL KEYPAD
```

### B98

```asm
ACALL WCHR
```

### B99

```asm
SUBB A,#30H
MOV 42H,A
mov dptr, #SIDEB
acall wstr
```

### B100

```asm
ACALL KEYPAD
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 237 to 237"]
B101["B102: instructions - lines 238 to 242"]
B102["B103: instructions - lines 243 to 243"]
B103["B104: instructions - lines 244 to 244"]
B104["B105: instructions - lines 245 to 247"]
B105["B106: instructions - lines 248 to 248"]
B106["B107: ENTER_DIM - lines 252 to 252"]
B107["B108: instructions - lines 253 to 253"]
B108["B109: instructions - lines 254 to 255"]
B109["B110: instructions - lines 256 to 257"]
B100 -->|call| B175
B100 -->|after return| B101
B101 -->|call| B180
B101 -->|after return| B102
B102 -->|call| B205
B102 -->|after return| B103
B103 -->|call| B175
B103 -->|after return| B104
B104 -->|call| B198
B104 -->|after return| B105
B106 -->|call| B192
B106 -->|after return| B107
B107 -->|call| B198
B107 -->|after return| B108
B108 -->|call| B172
B108 -->|after return| B109
B109 -->|call| B180
B109 -->|after return| B110
B175["Continue at B176 in section 18"]
B180["Continue at B181 in section 19"]
B205["Continue at B206 in section 21"]
B198["Continue at B199 in section 20"]
B192["Continue at B193 in section 20"]
B172["Continue at B173 in section 18"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL WCHR
```

### B102

```asm
SUBB A,#30H
MOV 43H,A
mov dptr, #SIDEC
acall wstr
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
MOV 44H,A
ACALL DELAY
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

```asm
ACALL CLEAR
```

### B108

```asm
ACALL DELAY
```

### B109

```asm
mov a, #80H
acall cmd
```

### B110

```asm
mov dptr, #ENTERSIDES
acall wstr
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 258 to 259"]
B111["B112: instructions - lines 260 to 261"]
B112["B113: instructions - lines 263 to 263"]
B113["B114: instructions - lines 264 to 264"]
B114["B115: instructions - lines 265 to 269"]
B115["B116: instructions - lines 271 to 271"]
B116["B117: instructions - lines 272 to 272"]
B117["B118: instructions - lines 273 to 276"]
B118["B119: instructions - lines 277 to 277"]
B119["B120: CON - lines 280 to 280"]
B110 -->|call| B172
B110 -->|after return| B111
B111 -->|call| B180
B111 -->|after return| B112
B112 -->|call| B205
B112 -->|after return| B113
B113 -->|call| B175
B113 -->|after return| B114
B114 -->|call| B180
B114 -->|after return| B115
B115 -->|call| B205
B115 -->|after return| B116
B116 -->|call| B175
B116 -->|after return| B117
B117 -->|call| B198
B117 -->|after return| B118
B119 -->|call| B192
B119 -->|after return| B120
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B205["Continue at B206 in section 21"]
B175["Continue at B176 in section 18"]
B198["Continue at B199 in section 20"]
B192["Continue at B193 in section 20"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov a, #0C0H
acall cmd
```

### B112

```asm
mov dptr, #SIDEB
acall wstr
```

### B113

```asm
ACALL KEYPAD
```

### B114

```asm
ACALL WCHR
```

### B115

```asm
SUBB A,#30H
MOV 40H,A
mov dptr, #HIGHT
acall wstr
```

### B116

```asm
ACALL KEYPAD
```

### B117

```asm
ACALL WCHR
```

### B118

```asm
SUBB A,#30H
MOV 41H,A
ACALL DELAY
```

### B119

Return to the instruction following the active call.

```asm
RET
```

### B120

```asm
ACALL CLEAR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 281 to 281"]
B121["B122: instructions - lines 282 to 283"]
B122["B123: instructions - lines 284 to 285"]
B123["B124: instructions - lines 286 to 287"]
B124["B125: instructions - lines 288 to 289"]
B125["B126: instructions - lines 290 to 290"]
B126["B127: PRINT1 - lines 293 to 293"]
B127["B128: instructions - lines 294 to 294"]
B128["B129: instructions - lines 295 to 296"]
B129["B130: instructions - lines 297 to 298"]
B120 -->|call| B198
B120 -->|after return| B121
B121 -->|call| B172
B121 -->|after return| B122
B122 -->|call| B180
B122 -->|after return| B123
B123 -->|call| B172
B123 -->|after return| B124
B124 -->|call| B180
B124 -->|after return| B125
B126 -->|call| B192
B126 -->|after return| B127
B127 -->|call| B198
B127 -->|after return| B128
B128 -->|call| B172
B128 -->|after return| B129
B129 -->|call| B180
B129 -->|after return| B130
B198["Continue at B199 in section 20"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B192["Continue at B193 in section 20"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL DELAY
```

### B122

```asm
mov a, #80H
acall cmd
```

### B123

```asm
mov dptr, #CONT11
acall wstr
```

### B124

```asm
mov a, #0C0H
acall cmd
```

### B125

```asm
mov dptr, #CONT22
acall wstr
```

### B126

Return to the instruction following the active call.

```asm
RET
```

### B127

```asm
ACALL CLEAR
```

### B128

```asm
ACALL DELAY
```

### B129

```asm
mov a, #80H
acall cmd
```

### B130

```asm
mov dptr, #AAREA
acall wstr
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 299 to 303"]
B131["B132: instructions - lines 304 to 306"]
B132["B133: instructions - lines 307 to 307"]
B133["B134: instructions - lines 308 to 309"]
B134["B135: instructions - lines 310 to 311"]
B135["B136: instructions - lines 312 to 314"]
B136["B137: instructions - lines 315 to 315"]
B137["B138: instructions - lines 316 to 316"]
B138["B139: instructions - lines 318 to 318"]
B139["B140: PRINT2 - lines 321 to 321"]
B130 -->|call| B175
B130 -->|after return| B131
B131 -->|call| B175
B131 -->|after return| B132
B132 -->|call| B185
B132 -->|after return| B133
B133 -->|call| B172
B133 -->|after return| B134
B134 -->|call| B180
B134 -->|after return| B135
B135 -->|call| B175
B135 -->|after return| B136
B136 -->|call| B198
B136 -->|after return| B137
B137 -->|call| B198
B137 -->|after return| B138
B139 -->|call| B192
B139 -->|after return| B140
B175["Continue at B176 in section 18"]
B185["Continue at B186 in section 19"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B198["Continue at B199 in section 20"]
B192["Continue at B193 in section 20"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B132

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B133

```asm
ACALL LDELAY
```

### B134

```asm
mov a, #0C0H
acall cmd
```

### B135

```asm
mov dptr, #REMINDER
acall wstr
```

### B136

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B137

```asm
ACALL DELAY
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
ACALL CLEAR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 322 to 322"]
B141["B142: instructions - lines 323 to 324"]
B142["B143: instructions - lines 325 to 326"]
B143["B144: instructions - lines 328 to 332"]
B144["B145: instructions - lines 333 to 335"]
B145["B146: instructions - lines 336 to 336"]
B146["B147: instructions - lines 337 to 337"]
B147["B148: STOP - lines 343 to 343"]
B148["B149: TIME - lines 347 to 347"]
B149["B150: LOOP66 - lines 348 to 348"]
B140 -->|call| B198
B140 -->|after return| B141
B141 -->|call| B172
B141 -->|after return| B142
B142 -->|call| B180
B142 -->|after return| B143
B143 -->|call| B175
B143 -->|after return| B144
B144 -->|call| B175
B144 -->|after return| B145
B145 -->|call| B198
B145 -->|after return| B146
B147 -->|jump| B147
B148 -->|next| B149
B149 -->|call| B185
B149 -->|after return| B150
B198["Continue at B199 in section 20"]
B172["Continue at B173 in section 18"]
B180["Continue at B181 in section 19"]
B175["Continue at B176 in section 18"]
B185["Continue at B186 in section 19"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL DELAY
```

### B142

```asm
mov a, #80H
acall cmd
```

### B143

```asm
mov dptr, #PPERIMETER
acall wstr
```

### B144

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B145

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B146

```asm
ACALL DELAY
```

### B147

Return to the instruction following the active call.

```asm
RET
```

### B148

```asm
SJMP STOP
```

### B149

```asm
MOV R3,#50
```

### B150

```asm
ACALL LDELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 349 to 349"]
B151["B152: instructions - lines 350 to 350"]
B152["B153: INLCD - lines 353 to 354"]
B153["B154: WAIT - lines 356 to 356"]
B154["B155: instructions - lines 357 to 357"]
B155["B156: instructions - lines 359 to 361"]
B156["B157: instructions - lines 362 to 362"]
B157["B158: instructions - lines 363 to 364"]
B158["B159: instructions - lines 365 to 366"]
B159["B160: instructions - lines 367 to 368"]
B150 -->|condition true| B149
B150 -->|condition false| B151
B152 -->|next| B153
B153 -->|call| B185
B153 -->|after return| B154
B154 -->|condition true| B153
B154 -->|condition false| B155
B155 -->|call| B172
B155 -->|after return| B156
B156 -->|call| B185
B156 -->|after return| B157
B157 -->|call| B172
B157 -->|after return| B158
B158 -->|call| B172
B158 -->|after return| B159
B159 -->|call| B172
B159 -->|after return| B160
B149["Continue at B150 in section 15"]
B185["Continue at B186 in section 19"]
B172["Continue at B173 in section 18"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
DJNZ R3,LOOP66
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
B160["B161: instructions - lines 369 to 370"]
B161["B162: instructions - lines 371 to 372"]
B162["B163: instructions - lines 373 to 374"]
B163["B164: instructions - lines 375 to 376"]
B164["B165: instructions - lines 377 to 378"]
B165["B166: instructions - lines 379 to 380"]
B166["B167: instructions - lines 381 to 381"]
B167["B168: instructions - lines 382 to 383"]
B168["B169: instructions - lines 384 to 385"]
B169["B170: instructions - lines 386 to 387"]
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
B166 -->|call| B185
B166 -->|after return| B167
B167 -->|call| B172
B167 -->|after return| B168
B168 -->|call| B172
B168 -->|after return| B169
B169 -->|call| B172
B169 -->|after return| B170
B172["Continue at B173 in section 18"]
B185["Continue at B186 in section 19"]
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
B170["B171: instructions - lines 388 to 389"]
B171["B172: instructions - lines 391 to 392"]
B172["B173: CMD - lines 396 to 402"]
B173["B174: instructions - lines 403 to 404"]
B174["B175: instructions - lines 406 to 408"]
B175["B176: WCHR - lines 411 to 417"]
B176["B177: instructions - lines 418 to 419"]
B177["B178: instructions - lines 421 to 423"]
B178["B179: COMMON - lines 426 to 433"]
B179["B180: instructions - lines 434 to 434"]
B170 -->|call| B172
B170 -->|after return| B171
B172 -->|call| B178
B172 -->|after return| B173
B173 -->|call| B178
B173 -->|after return| B174
B175 -->|call| B178
B175 -->|after return| B176
B176 -->|call| B178
B176 -->|after return| B177
B178 -->|call| B185
B178 -->|after return| B179
B185["Continue at B186 in section 19"]
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
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B174

```asm
MOV A,B
ACALL COMMON
```

### B175

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B176

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B177

```asm
MOV A,B
ACALL COMMON
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
CLR RW
SWAP A
ANL A,#11110000B
ANL P0,#00001111B
ORL P0,A
SETB EN
CLR EN
ACALL LDELAY
```

### B180

Return to the instruction following the active call.

```asm
RET
```

## Section 19

```mermaid
flowchart TD
B180["B181: WSTR - lines 437 to 437"]
B181["B182: CONT1 - lines 439 to 441"]
B182["B183: instructions - lines 442 to 442"]
B183["B184: instructions - lines 443 to 444"]
B184["B185: EXIT1 - lines 446 to 447"]
B185["B186: LDELAY - lines 450 to 452"]
B186["B187: CON4 - lines 454 to 455"]
B187["B188: instructions - lines 456 to 456"]
B188["B189: instructions - lines 457 to 459"]
B189["B190: TMSEC - lines 464 to 467"]
B180 -->|next| B181
B181 -->|condition true| B184
B181 -->|condition false| B182
B182 -->|call| B175
B182 -->|after return| B183
B183 -->|jump| B181
B185 -->|next| B186
B186 -->|condition true| B186
B186 -->|condition false| B187
B187 -->|condition true| B186
B187 -->|condition false| B188
B189 -->|next| B190
B175["Continue at B176 in section 18"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
PUSH ACC
```

### B182

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B183

```asm
ACALL WCHR
```

### B184

```asm
INC DPTR
AJMP CONT1
```

### B185

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B186

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B187

```asm
MOV R0,#250
DJNZ R0,$
```

### B188

```asm
DJNZ R1,CON4
```

### B189

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B190

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

## Section 20

```mermaid
flowchart TD
B190["B191: BACK - lines 468 to 468"]
B191["B192: instructions - lines 469 to 471"]
B192["B193: CLEAR - lines 474 to 475"]
B193["B194: instructions - lines 476 to 476"]
B194["B195: instructions - lines 477 to 477"]
B195["B196: WAITT - lines 478 to 478"]
B196["B197: instructions - lines 479 to 479"]
B197["B198: instructions - lines 480 to 480"]
B198["B199: DELAY - lines 484 to 484"]
B199["B200: QWE - lines 486 to 486"]
B190 -->|condition true| B190
B190 -->|condition false| B191
B192 -->|call| B172
B192 -->|after return| B193
B193 -->|call| B185
B193 -->|after return| B194
B194 -->|next| B195
B195 -->|call| B185
B195 -->|after return| B196
B196 -->|condition true| B195
B196 -->|condition false| B197
B198 -->|next| B199
B199 -->|call| B185
B199 -->|after return| B200
B172["Continue at B173 in section 18"]
B185["Continue at B186 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
JNB TF0,BACK
```

### B192

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B193

```asm
MOV A,#1H
ACALL CMD
```

### B194

```asm
ACALL LDELAY
```

### B195

```asm
MOV R7,#14
```

### B196

```asm
ACALL LDELAY
```

### B197

```asm
DJNZ R7,WAITT
```

### B198

Return to the instruction following the active call.

```asm
RET
```

### B199

```asm
MOV R5,#50
```

### B200

```asm
ACALL LDELAY
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 487 to 487"]
B201["B202: instructions - lines 488 to 488"]
B202["B203: DELAY1 - lines 490 to 490"]
B203["B204: ABC - lines 492 to 492"]
B204["B205: instructions - lines 493 to 493"]
B205["B206: KEYPAD - lines 501 to 501"]
B206["B207: K1 - lines 502 to 505"]
B207["B208: K2 - lines 506 to 506"]
B208["B209: instructions - lines 507 to 509"]
B209["B210: instructions - lines 510 to 510"]
B200 -->|condition true| B199
B200 -->|condition false| B201
B202 -->|next| B203
B203 -->|condition true| B203
B203 -->|condition false| B204
B205 -->|next| B206
B206 -->|condition true| B206
B206 -->|condition false| B207
B207 -->|call| B189
B207 -->|after return| B208
B208 -->|condition true| B210
B208 -->|condition false| B209
B209 -->|jump| B207
B199["Continue at B200 in section 20"]
B189["Continue at B190 in section 19"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
DJNZ R5,qwe
```

### B202

Return to the instruction following the active call.

```asm
RET
```

### B203

```asm
MOV R5,#60
```

### B204

```asm
DJNZ R5,abc
```

### B205

Return to the instruction following the active call.

```asm
RET
```

### B206

```asm
MOV P2,#11110000B
```

### B207

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B208

```asm
ACALL TMSEC
```

### B209

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B210

```asm
SJMP K2
```

## Section 22

```mermaid
flowchart TD
B210["B211: OVER - lines 512 to 512"]
B211["B212: instructions - lines 513 to 515"]
B212["B213: instructions - lines 516 to 516"]
B213["B214: OVER1 - lines 518 to 521"]
B214["B215: instructions - lines 522 to 525"]
B215["B216: instructions - lines 526 to 529"]
B216["B217: instructions - lines 530 to 533"]
B217["B218: instructions - lines 534 to 534"]
B218["B219: ROW_0 - lines 535 to 536"]
B219["B220: ROW_1 - lines 537 to 538"]
B210 -->|call| B189
B210 -->|after return| B211
B211 -->|condition true| B213
B211 -->|condition false| B212
B212 -->|jump| B207
B213 -->|condition true| B218
B213 -->|condition false| B214
B214 -->|condition true| B219
B214 -->|condition false| B215
B215 -->|condition true| B220
B215 -->|condition false| B216
B216 -->|condition true| B221
B216 -->|condition false| B217
B217 -->|jump| B207
B218 -->|jump| B222
B219 -->|jump| B222
B189["Continue at B190 in section 19"]
B207["Continue at B208 in section 21"]
B220["Continue at B221 in section 23"]
B221["Continue at B222 in section 23"]
B222["Continue at B223 in section 23"]
```

### B211

```asm
ACALL TMSEC
```

### B212

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B213

```asm
SJMP K2
```

### B214

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B215

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B216

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B217

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B218

```asm
LJMP K2
```

### B219

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B220

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

## Section 23

```mermaid
flowchart TD
B220["B221: ROW_2 - lines 539 to 540"]
B221["B222: ROW_3 - lines 541 to 541"]
B222["B223: FIND - lines 543 to 543"]
B223["B224: FIND1 - lines 545 to 546"]
B224["B225: instructions - lines 547 to 548"]
B225["B226: MATCH - lines 550 to 552"]
B220 -->|jump| B222
B221 -->|next| B222
B222 -->|next| B223
B223 -->|condition true| B225
B223 -->|condition false| B224
B224 -->|jump| B223
```

### B221

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B222

```asm
MOV DPTR,#KCODE3
```

### B223

```asm
SWAP A
```

### B224

```asm
RRC A
JNC MATCH
```

### B225

```asm
INC DPTR
SJMP FIND1
```

### B226

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
