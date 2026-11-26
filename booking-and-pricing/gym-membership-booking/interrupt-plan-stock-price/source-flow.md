# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 030H` begins at B5.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23)

## Destinations requiring review

`INITIATE_INT`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
200: CALL DELAY
```

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: AGAINN - lines 6 to 6"]
B2["B3: instructions - lines 7 to 7"]
B3["B4: instructions - lines 8 to 8"]
B4["B5: MAIN - lines 12 to 12"]
B5["B6: instructions - lines 13 to 25"]
B6["B7: instructions - lines 26 to 26"]
B7["B8: instructions - lines 27 to 27"]
B8["B9: instructions - lines 28 to 28"]
B9["B10: MENUU - lines 31 to 31"]
B0 -->|jump| B4
B1 -->|call| B208
B1 -->|after return| B2
B2 -->|condition true| B1
B2 -->|condition false| B3
B4 -->|call| B191
B4 -->|after return| B5
B5 -->|call| B198
B5 -->|after return| B6
B6 -->|call| B106
B6 -->|after return| B7
B7 -->|call| B198
B7 -->|after return| B8
B8 -->|call| BX1
B8 -->|after return| B9
B9 -->|call| B198
B9 -->|after return| B10
B208["Continue at B209 in section 21"]
B191["Continue at B192 in section 20"]
B198["Continue at B199 in section 20"]
B106["Continue at B107 in section 11"]
BX1["Unresolved destination: INITIATE_INT"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
SJMP MAIN
```

### B2

```asm
ACALL KEYPAD
```

### B3

```asm
CJNE A,#'#',AGAINn
```

### B4

Resume the interrupted program.

```asm
RETI
```

### B5

```asm
ACALL INLCD
```

### B6

```asm
MOV IE,#81H
SETB IT0
MOV 30H,#2
MOV 31H,#1
MOV 32H,#0
MOV 40H,#5
MOV 41H,#5
MOV 42H,#30
MOV 43H,#30
MOV 44H,#20
MOV 45H,#20
ACALL CLEAR
```

### B7

```asm
ACALL WELCOME
```

### B8

```asm
ACALL CLEAR
```

### B9

```asm
ACALL INITIATE_INT
```

### B10

```asm
ACALL CLEAR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 32"]
B11["B12: instructions - lines 33 to 33"]
B12["B13: instructions - lines 36 to 37"]
B13["B14: VIP - lines 40 to 41"]
B14["B15: FL - lines 43 to 44"]
B15["B16: instructions - lines 45 to 46"]
B16["B17: instructions - lines 47 to 47"]
B17["B18: instructions - lines 48 to 48"]
B18["B19: instructions - lines 50 to 50"]
B19["B20: instructions - lines 51 to 52"]
B10 -->|call| B112
B10 -->|after return| B11
B11 -->|call| B198
B11 -->|after return| B12
B12 -->|condition true| B27
B12 -->|condition false| B13
B13 -->|next| B14
B14 -->|call| B175
B14 -->|after return| B15
B15 -->|call| B175
B15 -->|after return| B16
B16 -->|condition true| B14
B16 -->|condition false| B17
B17 -->|call| B198
B17 -->|after return| B18
B18 -->|call| B125
B18 -->|after return| B19
B19 -->|condition true| B23
B19 -->|condition false| B20
B112["Continue at B113 in section 12"]
B198["Continue at B199 in section 20"]
B27["Continue at B28 in section 3"]
B175["Continue at B176 in section 18"]
B125["Continue at B126 in section 13"]
B23["Continue at B24 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
acall mmenu
```

### B12

```asm
ACALL CLEAR
```

### B13

```asm
MOV A,30H
CJNE A,#1,ONLINE
```

### B14

```asm
mov r5,#3
mov p1,#0ffh
```

### B15

```asm
setb p1.2
acall delay
```

### B16

```asm
clr p1.2
acall delay
```

### B17

```asm
djnz r5,fl
```

### B18

```asm
acall clear
```

### B19

```asm
ACALL vipmesg
```

### B20

```asm
MOV A,31H
CJNE A,#1,YEARLY
```

## Section 3

```mermaid
flowchart TD
B20["B21: MONTHLY - lines 55 to 56"]
B21["B22: instructions - lines 57 to 57"]
B22["B23: NEXT - lines 60 to 65"]
B23["B24: YEARLY - lines 68 to 68"]
B24["B25: instructions - lines 69 to 70"]
B25["B26: instructions - lines 71 to 71"]
B26["B27: NEXT2 - lines 74 to 79"]
B27["B28: ONLINE - lines 85 to 86"]
B28["B29: FL1 - lines 88 to 89"]
B29["B30: instructions - lines 90 to 91"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B59
B22 -->|jump| B62
B23 -->|condition true| B13
B23 -->|condition false| B24
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B59
B26 -->|jump| B62
B27 -->|next| B28
B28 -->|call| B175
B28 -->|after return| B29
B29 -->|call| B175
B29 -->|after return| B30
B59["Continue at B60 in section 6"]
B62["Continue at B63 in section 7"]
B13["Continue at B14 in section 2"]
B175["Continue at B176 in section 18"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV R1,40H
DJNZ R1,NEXT
```

### B22

```asm
AJMP NOTAVAILABLE
```

### B23

```asm
CLR A
DEC 40H
MOV DPTR,#VIPM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B24

```asm
CJNE A,#2,VIP
```

### B25

```asm
MOV R2,41H
DJNZ R2,NEXT2
```

### B26

```asm
AJMP NOTAVAILABLE
```

### B27

```asm
CLR A
DEC 41H
MOV DPTR,#VIPY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B28

```asm
mov r5,#3
mov p1,#0ffh
```

### B29

```asm
setb p1.3
acall delay
```

### B30

```asm
clr p1.3
acall delay
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 92 to 92"]
B31["B32: instructions - lines 93 to 93"]
B32["B33: instructions - lines 94 to 95"]
B33["B34: instructions - lines 96 to 96"]
B34["B35: instructions - lines 97 to 98"]
B35["B36: MONTHLY2 - lines 101 to 102"]
B36["B37: instructions - lines 103 to 103"]
B37["B38: NEXT3 - lines 106 to 111"]
B38["B39: YEARLY2 - lines 114 to 114"]
B39["B40: instructions - lines 115 to 116"]
B30 -->|condition true| B28
B30 -->|condition false| B31
B31 -->|call| B198
B31 -->|after return| B32
B32 -->|condition true| B42
B32 -->|condition false| B33
B33 -->|call| B133
B33 -->|after return| B34
B34 -->|condition true| B38
B34 -->|condition false| B35
B35 -->|condition true| B37
B35 -->|condition false| B36
B36 -->|jump| B59
B37 -->|jump| B62
B38 -->|condition true| B27
B38 -->|condition false| B39
B39 -->|condition true| B41
B39 -->|condition false| B40
B28["Continue at B29 in section 3"]
B198["Continue at B199 in section 20"]
B42["Continue at B43 in section 5"]
B133["Continue at B134 in section 14"]
B59["Continue at B60 in section 6"]
B62["Continue at B63 in section 7"]
B27["Continue at B28 in section 3"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
djnz r5,fl1
```

### B32

```asm
acall clear
```

### B33

```asm
MOV A,30H
CJNE A,#2,REGULAR
```

### B34

```asm
ACALL onlmesg
```

### B35

```asm
MOV A,31H
CJNE A,#1,YEARLY2
```

### B36

```asm
MOV R1,42H
DJNZ R1,NEXT3
```

### B37

```asm
AJMP NOTAVAILABLE
```

### B38

```asm
CLR A
DEC 42H
MOV DPTR,#ONM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B39

```asm
CJNE A,#2,ONLINE
```

### B40

```asm
MOV R2,43H
DJNZ R2,NEXT4
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 117 to 117"]
B41["B42: NEXT4 - lines 120 to 125"]
B42["B43: REGULAR - lines 130 to 131"]
B43["B44: instructions - lines 132 to 133"]
B44["B45: FL2 - lines 135 to 136"]
B45["B46: instructions - lines 137 to 138"]
B46["B47: instructions - lines 139 to 139"]
B47["B48: instructions - lines 140 to 140"]
B48["B49: instructions - lines 141 to 141"]
B49["B50: instructions - lines 142 to 143"]
B40 -->|jump| B57
B41 -->|jump| B62
B42 -->|condition true| B57
B42 -->|condition false| B43
B43 -->|next| B44
B44 -->|call| B175
B44 -->|after return| B45
B45 -->|call| B175
B45 -->|after return| B46
B46 -->|condition true| B44
B46 -->|condition false| B47
B47 -->|call| B198
B47 -->|after return| B48
B48 -->|call| B141
B48 -->|after return| B49
B49 -->|condition true| B53
B49 -->|condition false| B50
B57["Continue at B58 in section 6"]
B62["Continue at B63 in section 7"]
B175["Continue at B176 in section 18"]
B198["Continue at B199 in section 20"]
B141["Continue at B142 in section 15"]
B53["Continue at B54 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
AJMP WRONG
```

### B42

```asm
CLR A
DEC 43H
MOV DPTR,#ONY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B43

```asm
MOV A,30H
CJNE A,#3,WRONG
```

### B44

```asm
mov r5,#3
mov p1,#0ffh
```

### B45

```asm
setb p1.4
acall delay
```

### B46

```asm
clr p1.4
acall delay
```

### B47

```asm
djnz r5,fl2
```

### B48

```asm
acall clear
```

### B49

```asm
ACALL regmesg
```

### B50

```asm
MOV A,31H
CJNE A,#1,YEARLY3
```

## Section 6

```mermaid
flowchart TD
B50["B51: MONTHLY3 - lines 146 to 147"]
B51["B52: instructions - lines 148 to 148"]
B52["B53: NEXT5 - lines 151 to 156"]
B53["B54: YEARLY3 - lines 159 to 159"]
B54["B55: instructions - lines 160 to 161"]
B55["B56: instructions - lines 162 to 162"]
B56["B57: NEXT6 - lines 165 to 170"]
B57["B58: WRONG - lines 173 to 173"]
B58["B59: instructions - lines 174 to 174"]
B59["B60: NOTAVAILABLE - lines 177 to 177"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|jump| B59
B52 -->|jump| B62
B53 -->|condition true| B42
B53 -->|condition false| B54
B54 -->|condition true| B56
B54 -->|condition false| B55
B55 -->|jump| B59
B56 -->|jump| B62
B57 -->|call| B92
B57 -->|after return| B58
B58 -->|jump| B9
B59 -->|call| B98
B59 -->|after return| B60
B62["Continue at B63 in section 7"]
B42["Continue at B43 in section 5"]
B92["Continue at B93 in section 10"]
B9["Continue at B10 in section 1"]
B98["Continue at B99 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV R1,44H
DJNZ R1,NEXT5
```

### B52

```asm
SJMP NOTAVAILABLE
```

### B53

```asm
CLR A
DEC 44H
MOV DPTR,#REGM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B54

```asm
CJNE A,#2,REGULAR
```

### B55

```asm
MOV R2,45H
DJNZ R2,NEXT6
```

### B56

```asm
SJMP NOTAVAILABLE
```

### B57

```asm
CLR A
DEC 45H
MOV DPTR,#REGY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B58

```asm
ACALL WRRONG
```

### B59

```asm
AJMP MENUU
```

### B60

```asm
ACALL NOTAV
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 178 to 178"]
B61["B62: instructions - lines 179 to 179"]
B62["B63: OUT - lines 183 to 183"]
B63["B64: instructions - lines 185 to 185"]
B64["B65: LEAVE - lines 188 to 188"]
B65["B66: instructions - lines 189 to 189"]
B66["B67: instructions - lines 190 to 190"]
B67["B68: instructions - lines 191 to 192"]
B68["B69: instructions - lines 193 to 194"]
B69["B70: AGAIN - lines 195 to 195"]
B60 -->|jump| B9
B61 -->|jump| B61
B62 -->|call| B168
B62 -->|after return| B63
B63 -->|call| B75
B63 -->|after return| B64
B64 -->|call| B175
B64 -->|after return| B65
B65 -->|call| B198
B65 -->|after return| B66
B66 -->|call| B175
B66 -->|after return| B67
B67 -->|call| B185
B67 -->|after return| B68
B68 -->|call| B203
B68 -->|after return| B69
B69 -->|jump| B69
B9["Continue at B10 in section 1"]
B168["Continue at B169 in section 17"]
B75["Continue at B76 in section 8"]
B175["Continue at B176 in section 18"]
B198["Continue at B199 in section 20"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
```

### B61

```asm
AJMP MENUU
```

### B62

```asm
SJMP $
```

### B63

```asm
acall payment
```

### B64

```asm
ACALL REPEAT
```

### B65

```asm
ACALL DELAY
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
mov dptr, #BYE
acall wstr
```

### B70

```asm
sjmp again
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 201 to 201"]
B71["B72: instructions - lines 202 to 202"]
B72["B73: instructions - lines 203 to 204"]
B73["B74: instructions - lines 205 to 206"]
B74["B75: instructions - lines 208 to 210"]
B75["B76: REPEAT - lines 213 to 213"]
B76["B77: instructions - lines 214 to 214"]
B77["B78: instructions - lines 215 to 215"]
B78["B79: instructions - lines 216 to 217"]
B79["B80: instructions - lines 218 to 219"]
B70 -->|call| B198
B70 -->|after return| B71
B71 -->|call| B175
B71 -->|after return| B72
B72 -->|call| B185
B72 -->|after return| B73
B73 -->|call| B203
B73 -->|after return| B74
B75 -->|call| B175
B75 -->|after return| B76
B76 -->|call| B198
B76 -->|after return| B77
B77 -->|call| B175
B77 -->|after return| B78
B78 -->|call| B185
B78 -->|after return| B79
B79 -->|call| B203
B79 -->|after return| B80
B198["Continue at B199 in section 20"]
B175["Continue at B176 in section 18"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL CLEAR
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
mov a, #80H
acall cmd
```

### B74

```asm
mov dptr, #PRESS
acall wstr
```

### B75

Return to the instruction following the active call.

```asm
CLR P3.6
SETB P3.6
RET
```

### B76

```asm
ACALL DELAY
```

### B77

```asm
ACALL CLEAR
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
mov a, #80H
acall cmd
```

### B80

```asm
mov dptr, #op3
acall wstr
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 220 to 221"]
B81["B82: instructions - lines 222 to 223"]
B82["B83: instructions - lines 224 to 224"]
B83["B84: instructions - lines 225 to 225"]
B84["B85: instructions - lines 226 to 226"]
B85["B86: instructions - lines 227 to 227"]
B86["B87: CHE2 - lines 230 to 230"]
B87["B88: instructions - lines 231 to 231"]
B88["B89: instructions - lines 232 to 232"]
B89["B90: CHE3 - lines 234 to 234"]
B80 -->|call| B185
B80 -->|after return| B81
B81 -->|call| B203
B81 -->|after return| B82
B82 -->|call| B175
B82 -->|after return| B83
B83 -->|call| B208
B83 -->|after return| B84
B84 -->|condition true| B86
B84 -->|condition false| B85
B85 -->|jump| B9
B86 -->|condition true| B89
B86 -->|condition false| B87
B87 -->|jump| B64
B88 -->|jump| B91
B89 -->|call| B92
B89 -->|after return| B90
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B175["Continue at B176 in section 18"]
B208["Continue at B209 in section 21"]
B9["Continue at B10 in section 1"]
B64["Continue at B65 in section 7"]
B91["Continue at B92 in section 10"]
B92["Continue at B93 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov a,#0c0h
acall cmd
```

### B82

```asm
mov dptr, #op4
acall wstr
```

### B83

```asm
ACALL DELAY
```

### B84

```asm
ACALL KEYPAD
```

### B85

```asm
CJNE A,#'1,CHE2
```

### B86

```asm
LJMP MENUU
```

### B87

```asm
CJNE A,#'2',CHE3
```

### B88

```asm
LJMP LEAVE
```

### B89

```asm
SJMP BACK
```

### B90

```asm
ACALL WRRONG
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 235 to 235"]
B91["B92: BACK - lines 238 to 238"]
B92["B93: WRRONG - lines 242 to 242"]
B93["B94: instructions - lines 243 to 244"]
B94["B95: instructions - lines 245 to 246"]
B95["B96: instructions - lines 247 to 247"]
B96["B97: instructions - lines 248 to 248"]
B97["B98: instructions - lines 249 to 249"]
B98["B99: NOTAV - lines 252 to 252"]
B99["B100: instructions - lines 253 to 254"]
B90 -->|jump| B75
B92 -->|call| B198
B92 -->|after return| B93
B93 -->|call| B185
B93 -->|after return| B94
B94 -->|call| B203
B94 -->|after return| B95
B95 -->|call| B175
B95 -->|after return| B96
B96 -->|call| B175
B96 -->|after return| B97
B98 -->|call| B198
B98 -->|after return| B99
B99 -->|call| B185
B99 -->|after return| B100
B75["Continue at B76 in section 8"]
B198["Continue at B199 in section 20"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B175["Continue at B176 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
SJMP REPEAT
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
ACALL CLEAR
```

### B94

```asm
mov a, #80H
acall cmd
```

### B95

```asm
mov dptr, #WRONGG
acall wstr
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
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
mov a, #80H
acall cmd
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 255 to 256"]
B101["B102: instructions - lines 257 to 258"]
B102["B103: instructions - lines 259 to 260"]
B103["B104: instructions - lines 261 to 261"]
B104["B105: instructions - lines 262 to 262"]
B105["B106: instructions - lines 263 to 263"]
B106["B107: WELCOME - lines 266 to 267"]
B107["B108: instructions - lines 268 to 269"]
B108["B109: instructions - lines 271 to 272"]
B109["B110: instructions - lines 273 to 274"]
B100 -->|call| B203
B100 -->|after return| B101
B101 -->|call| B185
B101 -->|after return| B102
B102 -->|call| B203
B102 -->|after return| B103
B103 -->|call| B175
B103 -->|after return| B104
B104 -->|call| B175
B104 -->|after return| B105
B106 -->|call| B185
B106 -->|after return| B107
B107 -->|call| B203
B107 -->|after return| B108
B108 -->|call| B185
B108 -->|after return| B109
B109 -->|call| B203
B109 -->|after return| B110
B203["Continue at B204 in section 21"]
B185["Continue at B186 in section 19"]
B175["Continue at B176 in section 18"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov dptr, #NOTA
acall wstr
```

### B102

```asm
mov a, #0C0H
acall cmd
```

### B103

```asm
mov dptr, #NOTA1
acall wstr
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
ACALL DELAY
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

```asm
mov a, #80H
acall cmd
```

### B108

```asm
mov dptr, #wel
acall wstr
```

### B109

```asm
mov a,#0c0h
acall cmd
```

### B110

```asm
mov dptr, #gym
acall wstr
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 275 to 275"]
B111["B112: instructions - lines 276 to 276"]
B112["B113: MMENU - lines 280 to 281"]
B113["B114: instructions - lines 282 to 283"]
B114["B115: instructions - lines 285 to 286"]
B115["B116: instructions - lines 287 to 288"]
B116["B117: instructions - lines 289 to 289"]
B117["B118: instructions - lines 291 to 292"]
B118["B119: instructions - lines 293 to 294"]
B119["B120: instructions - lines 296 to 297"]
B110 -->|call| B175
B110 -->|after return| B111
B112 -->|call| B185
B112 -->|after return| B113
B113 -->|call| B203
B113 -->|after return| B114
B114 -->|call| B185
B114 -->|after return| B115
B115 -->|call| B203
B115 -->|after return| B116
B116 -->|call| B175
B116 -->|after return| B117
B117 -->|call| B185
B117 -->|after return| B118
B118 -->|call| B203
B118 -->|after return| B119
B119 -->|call| B185
B119 -->|after return| B120
B175["Continue at B176 in section 18"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
acall delay
```

### B112

Return to the instruction following the active call.

```asm
ret
```

### B113

```asm
mov a, #80H
acall cmd
```

### B114

```asm
mov dptr, #sel
acall wstr
```

### B115

```asm
mov a,#0c0h
acall cmd
```

### B116

```asm
mov dptr, #op
acall wstr
```

### B117

```asm
acall delay
```

### B118

```asm
mov a, #80H
acall cmd
```

### B119

```asm
mov dptr, #SPACE
acall wstr
```

### B120

```asm
mov a, #80H
acall cmd
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 298 to 298"]
B121["B122: instructions - lines 299 to 300"]
B122["B123: instructions - lines 301 to 301"]
B123["B124: instructions - lines 302 to 302"]
B124["B125: instructions - lines 303 to 306"]
B125["B126: VIPMESG - lines 310 to 311"]
B126["B127: instructions - lines 312 to 313"]
B127["B128: instructions - lines 314 to 314"]
B128["B129: instructions - lines 316 to 316"]
B129["B130: instructions - lines 317 to 317"]
B120 -->|call| B208
B120 -->|after return| B121
B121 -->|call| B180
B121 -->|after return| B122
B122 -->|call| B175
B122 -->|after return| B123
B123 -->|call| B175
B123 -->|after return| B124
B125 -->|call| B185
B125 -->|after return| B126
B126 -->|call| B203
B126 -->|after return| B127
B127 -->|call| B175
B127 -->|after return| B128
B128 -->|call| B198
B128 -->|after return| B129
B129 -->|call| B149
B129 -->|after return| B130
B208["Continue at B209 in section 21"]
B180["Continue at B181 in section 19"]
B175["Continue at B176 in section 18"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B198["Continue at B199 in section 20"]
B149["Continue at B150 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL KEYPAD
```

### B122

```asm
MOV 35H,A
ACALL WCHR
```

### B123

```asm
ACALL DELAY
```

### B124

```asm
ACALL DELAY
```

### B125

Return to the instruction following the active call.

```asm
MOV A,35H
SUBB A,#30H
MOV 30H,A
ret
```

### B126

```asm
mov a, #80H
acall cmd
```

### B127

```asm
mov dptr, #VIPP
acall wstr
```

### B128

```asm
acall delay
```

### B129

```asm
acall clear
```

### B130

```asm
acall menu2
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 319 to 319"]
B131["B132: instructions - lines 320 to 320"]
B132["B133: instructions - lines 322 to 322"]
B133["B134: ONLMESG - lines 325 to 326"]
B134["B135: instructions - lines 327 to 328"]
B135["B136: instructions - lines 329 to 329"]
B136["B137: instructions - lines 330 to 330"]
B137["B138: instructions - lines 331 to 331"]
B138["B139: instructions - lines 333 to 333"]
B139["B140: instructions - lines 334 to 334"]
B130 -->|call| B198
B130 -->|after return| B131
B131 -->|call| B162
B131 -->|after return| B132
B133 -->|call| B185
B133 -->|after return| B134
B134 -->|call| B203
B134 -->|after return| B135
B135 -->|call| B175
B135 -->|after return| B136
B136 -->|call| B198
B136 -->|after return| B137
B137 -->|call| B149
B137 -->|after return| B138
B138 -->|call| B198
B138 -->|after return| B139
B139 -->|call| B162
B139 -->|after return| B140
B198["Continue at B199 in section 20"]
B162["Continue at B163 in section 17"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B175["Continue at B176 in section 18"]
B149["Continue at B150 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
acall clear
```

### B132

```asm
acall dura
```

### B133

Return to the instruction following the active call.

```asm
ret
```

### B134

```asm
mov a, #80H
acall cmd
```

### B135

```asm
mov dptr, #onl
acall wstr
```

### B136

```asm
acall delay
```

### B137

```asm
acall clear
```

### B138

```asm
acall menu2
```

### B139

```asm
acall clear
```

### B140

```asm
acall dura
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 335 to 335"]
B141["B142: REGMESG - lines 338 to 339"]
B142["B143: instructions - lines 340 to 341"]
B143["B144: instructions - lines 342 to 342"]
B144["B145: instructions - lines 343 to 343"]
B145["B146: instructions - lines 344 to 344"]
B146["B147: instructions - lines 346 to 346"]
B147["B148: instructions - lines 347 to 347"]
B148["B149: instructions - lines 348 to 348"]
B149["B150: MENU2 - lines 351 to 352"]
B141 -->|call| B185
B141 -->|after return| B142
B142 -->|call| B203
B142 -->|after return| B143
B143 -->|call| B175
B143 -->|after return| B144
B144 -->|call| B198
B144 -->|after return| B145
B145 -->|call| B149
B145 -->|after return| B146
B146 -->|call| B198
B146 -->|after return| B147
B147 -->|call| B162
B147 -->|after return| B148
B149 -->|call| B185
B149 -->|after return| B150
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B175["Continue at B176 in section 18"]
B198["Continue at B199 in section 20"]
B162["Continue at B163 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
ret
```

### B142

```asm
mov a, #80H
acall cmd
```

### B143

```asm
mov dptr, #reg
acall wstr
```

### B144

```asm
acall delay
```

### B145

```asm
acall clear
```

### B146

```asm
acall menu2
```

### B147

```asm
acall clear
```

### B148

```asm
acall dura
```

### B149

Return to the instruction following the active call.

```asm
ret
```

### B150

```asm
mov a, #80H
acall cmd
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 353 to 354"]
B151["B152: instructions - lines 356 to 357"]
B152["B153: instructions - lines 358 to 359"]
B153["B154: instructions - lines 360 to 360"]
B154["B155: instructions - lines 362 to 363"]
B155["B156: instructions - lines 364 to 365"]
B156["B157: instructions - lines 367 to 368"]
B157["B158: instructions - lines 369 to 369"]
B158["B159: instructions - lines 370 to 371"]
B159["B160: instructions - lines 372 to 372"]
B150 -->|call| B203
B150 -->|after return| B151
B151 -->|call| B185
B151 -->|after return| B152
B152 -->|call| B203
B152 -->|after return| B153
B153 -->|call| B175
B153 -->|after return| B154
B154 -->|call| B185
B154 -->|after return| B155
B155 -->|call| B203
B155 -->|after return| B156
B156 -->|call| B185
B156 -->|after return| B157
B157 -->|call| B208
B157 -->|after return| B158
B158 -->|call| B180
B158 -->|after return| B159
B159 -->|call| B175
B159 -->|after return| B160
B203["Continue at B204 in section 21"]
B185["Continue at B186 in section 19"]
B175["Continue at B176 in section 18"]
B208["Continue at B209 in section 21"]
B180["Continue at B181 in section 19"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
mov dptr, #sel
acall wstr
```

### B152

```asm
mov a,#0c0h
acall cmd
```

### B153

```asm
mov dptr, #op2
acall wstr
```

### B154

```asm
acall delay
```

### B155

```asm
mov a, #80H
acall cmd
```

### B156

```asm
mov dptr, #SPACE
acall wstr
```

### B157

```asm
mov a, #80H
acall cmd
```

### B158

```asm
ACALL KEYPAD
```

### B159

```asm
MOV 35H,A
ACALL WCHR
```

### B160

```asm
ACALL DELAY
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 373 to 373"]
B161["B162: instructions - lines 374 to 379"]
B162["B163: DURA - lines 382 to 383"]
B163["B164: instructions - lines 384 to 385"]
B164["B165: instructions - lines 387 to 388"]
B165["B166: instructions - lines 389 to 391"]
B166["B167: instructions - lines 392 to 392"]
B167["B168: instructions - lines 394 to 394"]
B168["B169: PAYMENT - lines 397 to 398"]
B169["B170: instructions - lines 399 to 400"]
B160 -->|call| B175
B160 -->|after return| B161
B162 -->|call| B185
B162 -->|after return| B163
B163 -->|call| B203
B163 -->|after return| B164
B164 -->|call| B185
B164 -->|after return| B165
B165 -->|call| B180
B165 -->|after return| B166
B166 -->|call| B175
B166 -->|after return| B167
B168 -->|call| B185
B168 -->|after return| B169
B169 -->|call| B203
B169 -->|after return| B170
B175["Continue at B176 in section 18"]
B185["Continue at B186 in section 19"]
B203["Continue at B204 in section 21"]
B180["Continue at B181 in section 19"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL DELAY
```

### B162

Return to the instruction following the active call.

```asm
MOV A,35H
SUBB A,#30H
MOV 31H,A
RET
```

### B163

```asm
mov a, #80H
acall cmd
```

### B164

```asm
mov dptr, #dur
acall wstr
```

### B165

```asm
mov a,#0c0h
acall cmd
```

### B166

```asm
mov a,31h
add a,#30h
acall wchr
```

### B167

```asm
acall delay
```

### B168

Return to the instruction following the active call.

```asm
ret
```

### B169

```asm
mov a, #80H
acall cmd
```

### B170

```asm
mov dptr, #pay
acall wstr
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 402 to 403"]
B171["B172: instructions - lines 404 to 408"]
B172["B173: instructions - lines 409 to 411"]
B173["B174: instructions - lines 412 to 412"]
B174["B175: instructions - lines 414 to 414"]
B175["B176: DELAY - lines 418 to 418"]
B176["B177: HE2 - lines 419 to 419"]
B177["B178: HE - lines 420 to 420"]
B178["B179: instructions - lines 421 to 421"]
B179["B180: instructions - lines 422 to 422"]
B170 -->|call| B185
B170 -->|after return| B171
B171 -->|call| B180
B171 -->|after return| B172
B172 -->|call| B180
B172 -->|after return| B173
B173 -->|call| B175
B173 -->|after return| B174
B175 -->|next| B176
B176 -->|next| B177
B177 -->|condition true| B177
B177 -->|condition false| B178
B178 -->|condition true| B176
B178 -->|condition false| B179
B185["Continue at B186 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
mov a,#0c0h
acall cmd
```

### B172

```asm
mov a,32h
mov b,#0Ah
div ab
add a,#30h
acall wchr
```

### B173

```asm
mov a,b
add a,#30h
acall wchr
```

### B174

```asm
acall delay
```

### B175

Return to the instruction following the active call.

```asm
ret
```

### B176

```asm
MOV R1,#100
```

### B177

```asm
MOV R0,#100
```

### B178

```asm
DJNZ R0,he
```

### B179

```asm
djnz r1,he2
```

### B180

Return to the instruction following the active call.

```asm
RET
```

## Section 19

```mermaid
flowchart TD
B180["B181: WCHR - lines 426 to 430"]
B181["B182: instructions - lines 431 to 431"]
B182["B183: instructions - lines 432 to 434"]
B183["B184: instructions - lines 435 to 435"]
B184["B185: instructions - lines 436 to 438"]
B185["B186: CMD - lines 441 to 443"]
B186["B187: instructions - lines 444 to 444"]
B187["B188: instructions - lines 445 to 447"]
B188["B189: instructions - lines 448 to 448"]
B189["B190: instructions - lines 449 to 449"]
B180 -->|call| B190
B180 -->|after return| B181
B181 -->|call| B196
B181 -->|after return| B182
B182 -->|call| B190
B182 -->|after return| B183
B183 -->|call| B196
B183 -->|after return| B184
B185 -->|call| B190
B185 -->|after return| B186
B186 -->|call| B196
B186 -->|after return| B187
B187 -->|call| B190
B187 -->|after return| B188
B188 -->|call| B196
B188 -->|after return| B189
B190["Continue at B191 in section 20"]
B196["Continue at B197 in section 20"]
```

### B181

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B182

```asm
ACALL LDELAY
```

### B183

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B184

```asm
ACALL LDELAY
```

### B185

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B186

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B187

```asm
ACALL LDELAY
```

### B188

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B189

```asm
ACALL LDELAY
```

### B190

Return to the instruction following the active call.

```asm
RET
```

## Section 20

```mermaid
flowchart TD
B190["B191: COMMON - lines 452 to 457"]
B191["B192: INLCD - lines 460 to 467"]
B192["B193: instructions - lines 468 to 476"]
B193["B194: instructions - lines 477 to 489"]
B194["B195: instructions - lines 490 to 500"]
B195["B196: instructions - lines 501 to 501"]
B196["B197: LDELAY - lines 504 to 505"]
B197["B198: instructions - lines 506 to 506"]
B198["B199: CLEAR - lines 509 to 510"]
B199["B200: instructions - lines 511 to 511"]
B191 -->|call| B196
B191 -->|after return| B192
B192 -->|call| B196
B192 -->|after return| B193
B193 -->|call| B196
B193 -->|after return| B194
B194 -->|call| B196
B194 -->|after return| B195
B196 -->|condition true| B196
B196 -->|condition false| B197
B198 -->|call| B185
B198 -->|after return| B199
B199 -->|next| B200
B185["Continue at B186 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B192

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

### B193

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

### B194

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

### B195

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

### B196

Return to the instruction following the active call.

```asm
RET
```

### B197

```asm
MOV R0, #50
DJNZ R0, $
```

### B198

Return to the instruction following the active call.

```asm
RET
```

### B199

```asm
MOV A,#01H
ACALL CMD
```

### B200

```asm
MOV R7,#14
```

## Section 21

```mermaid
flowchart TD
B200["B201: WAIT - lines 512 to 512"]
B201["B202: instructions - lines 513 to 513"]
B202["B203: instructions - lines 514 to 514"]
B203["B204: WSTR - lines 517 to 517"]
B204["B205: CONT1 - lines 519 to 521"]
B205["B206: PRINT - lines 523 to 523"]
B206["B207: instructions - lines 524 to 525"]
B207["B208: EXIT1 - lines 526 to 527"]
B208["B209: KEYPAD - lines 533 to 533"]
B209["B210: K1 - lines 534 to 537"]
B200 -->|call| B196
B200 -->|after return| B201
B201 -->|condition true| B200
B201 -->|condition false| B202
B203 -->|next| B204
B204 -->|condition true| B207
B204 -->|condition false| B205
B205 -->|call| B180
B205 -->|after return| B206
B206 -->|jump| B204
B208 -->|next| B209
B209 -->|condition true| B209
B209 -->|condition false| B210
B196["Continue at B197 in section 20"]
B180["Continue at B181 in section 19"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
ACALL LDELAY
```

### B202

```asm
DJNZ R7,WAIT
```

### B203

Return to the instruction following the active call.

```asm
ret
```

### B204

```asm
PUSH    ACC
```

### B205

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B206

```asm
ACALL    WCHR
```

### B207

```asm
INC DPTR
AJMP    CONT1
```

### B208

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B209

```asm
MOV P0,#01110000B
```

### B210

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

## Section 22

```mermaid
flowchart TD
B210["B211: K2 - lines 539 to 541"]
B211["B212: instructions - lines 542 to 542"]
B212["B213: OVER1 - lines 544 to 547"]
B213["B214: instructions - lines 548 to 551"]
B214["B215: instructions - lines 552 to 555"]
B215["B216: instructions - lines 556 to 559"]
B216["B217: instructions - lines 560 to 560"]
B217["B218: ROW_0 - lines 561 to 562"]
B218["B219: ROW_1 - lines 563 to 564"]
B219["B220: ROW_2 - lines 565 to 566"]
B210 -->|condition true| B212
B210 -->|condition false| B211
B211 -->|jump| B210
B212 -->|condition true| B217
B212 -->|condition false| B213
B213 -->|condition true| B218
B213 -->|condition false| B214
B214 -->|condition true| B219
B214 -->|condition false| B215
B215 -->|condition true| B220
B215 -->|condition false| B216
B216 -->|jump| B210
B217 -->|jump| B221
B218 -->|jump| B221
B219 -->|jump| B221
B220["Continue at B221 in section 23"]
B221["Continue at B222 in section 23"]
```

### B211

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B212

```asm
SJMP K2
```

### B213

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B214

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B215

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B216

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B217

```asm
LJMP K2
```

### B218

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B219

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B220

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

## Section 23

```mermaid
flowchart TD
B220["B221: ROW_3 - lines 567 to 567"]
B221["B222: FIND - lines 569 to 569"]
B222["B223: FIND1 - lines 571 to 572"]
B223["B224: instructions - lines 573 to 574"]
B224["B225: MATCH - lines 575 to 577"]
B220 -->|next| B221
B221 -->|next| B222
B222 -->|condition true| B224
B222 -->|condition false| B223
B223 -->|jump| B222
```

### B221

```asm
MOV DPTR,#KCODE3
```

### B222

```asm
RLC A
```

### B223

```asm
RLC A
JNC MATCH
```

### B224

```asm
INC DPTR
SJMP FIND1
```

### B225

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
