# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: AGAIN - lines 5 to 6"]
B2["B3: instructions - lines 7 to 7"]
B3["B4: MAIN0 - lines 10 to 10"]
B4["B5: instructions - lines 11 to 19"]
B5["B6: HERE - lines 23 to 23"]
B6["B7: instructions - lines 24 to 24"]
B7["B8: REPEAT - lines 27 to 27"]
B8["B9: MAIN - lines 30 to 31"]
B9["B10: instructions - lines 32 to 32"]
B0 -->|jump| B3
B1 -->|condition true| B1
B1 -->|condition false| B2
B3 -->|call| B224
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B97
B5 -->|after return| B6
B6 -->|call| B218
B6 -->|after return| B7
B7 -->|call| B103
B7 -->|after return| B8
B8 -->|condition true| B11
B8 -->|condition false| B9
B9 -->|call| B82
B9 -->|after return| B10
B224["Continue at B225 in section 23"]
B97["Continue at B98 in section 10"]
B218["Continue at B219 in section 22"]
B103["Continue at B104 in section 11"]
B11["Continue at B12 in section 2"]
B82["Continue at B83 in section 9"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
SJMP MAIN0
```

### B2

```asm
MOV A,P2
JB ACC.0,AGAIN
```

### B3

Resume the interrupted program.

```asm
RETI
```

### B4

```asm
ACALL INLCD
```

### B5

```asm
MOV 30H,#3
MOV 31H,#2
MOV 32H,#1
MOV 33H,#2
MOV 34H,#2
MOV 35H,#1
MOV 36H,#0
MOV IE,#81H
SETB IT0
```

### B6

```asm
ACALL WELCOME
```

### B7

```asm
ACALL INT
```

### B8

```asm
ACALL MENU1
```

### B9

```asm
MOV A,30H
CJNE A,#1,BEAND2
```

### B10

```asm
ACALL FLASH1
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 34"]
B11["B12: BEAND2 - lines 37 to 37"]
B12["B13: instructions - lines 38 to 38"]
B13["B14: instructions - lines 39 to 40"]
B14["B15: BEAND3 - lines 43 to 43"]
B15["B16: instructions - lines 44 to 44"]
B16["B17: instructions - lines 45 to 46"]
B17["B18: ERROR - lines 49 to 49"]
B18["B19: instructions - lines 50 to 50"]
B19["B20: WARR - lines 53 to 53"]
B10 -->|jump| B19
B11 -->|condition true| B14
B11 -->|condition false| B12
B12 -->|call| B87
B12 -->|after return| B13
B13 -->|jump| B19
B14 -->|condition true| B17
B14 -->|condition false| B15
B15 -->|call| B92
B15 -->|after return| B16
B16 -->|jump| B19
B17 -->|call| B201
B17 -->|after return| B18
B18 -->|jump| B7
B19 -->|call| B30
B19 -->|after return| B20
B87["Continue at B88 in section 9"]
B92["Continue at B93 in section 10"]
B201["Continue at B202 in section 21"]
B7["Continue at B8 in section 1"]
B30["Continue at B31 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV 36H,#63
AJMP WARR
```

### B12

```asm
CJNE A,#2,BEAND3
```

### B13

```asm
ACALL FLASH2
```

### B14

```asm
MOV 36H,#55
AJMP WARR
```

### B15

```asm
CJNE A,#3,ERROR
```

### B16

```asm
ACALL FLASH3
```

### B17

```asm
MOV 36H,#70
AJMP WARR
```

### B18

```asm
ACALL ERRORR
```

### B19

```asm
SJMP REPEAT
```

### B20

```asm
ACALL WARRENTLY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 54 to 54"]
B21["B22: instructions - lines 55 to 55"]
B22["B23: instructions - lines 58 to 58"]
B23["B24: instructions - lines 59 to 65"]
B24["B25: instructions - lines 67 to 67"]
B25["B26: EEND - lines 71 to 71"]
B26["B27: instructions - lines 72 to 72"]
B27["B28: instructions - lines 73 to 74"]
B28["B29: instructions - lines 75 to 76"]
B29["B30: EEEND - lines 78 to 78"]
B20 -->|call| B46
B20 -->|after return| B21
B21 -->|call| B58
B21 -->|after return| B22
B22 -->|call| B183
B22 -->|after return| B23
B23 -->|call| B70
B23 -->|after return| B24
B24 -->|call| B192
B24 -->|after return| B25
B25 -->|call| B208
B25 -->|after return| B26
B26 -->|call| B262
B26 -->|after return| B27
B27 -->|call| B234
B27 -->|after return| B28
B28 -->|call| B240
B28 -->|after return| B29
B29 -->|jump| B29
B46["Continue at B47 in section 5"]
B58["Continue at B59 in section 6"]
B183["Continue at B184 in section 19"]
B70["Continue at B71 in section 8"]
B192["Continue at B193 in section 20"]
B208["Continue at B209 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
```

### B21

```asm
ACALL MAINTANACE
```

### B22

```asm
ACALL DELIVERY
```

### B23

```asm
ACALL TVNUMB
```

### B24

```asm
MOV B,34H
MOV A,36H
MUL AB
MOV 36H,A
ACALL MEMBERSHIP
```

### B25

```asm
ACALL PAYMENT
```

### B26

```asm
ACALL REPEAT_AGAIN
```

### B27

```asm
ACALL CLEAR
```

### B28

```asm
MOV A, #80H
ACALL CMD
```

### B29

```asm
MOV dptr, #MESG19
ACALL wstr
```

### B30

```asm
SJMP EEEND
```

## Section 4

```mermaid
flowchart TD
B30["B31: WARRENTLY - lines 84 to 84"]
B31["B32: instructions - lines 85 to 86"]
B32["B33: instructions - lines 89 to 90"]
B33["B34: instructions - lines 91 to 94"]
B34["B35: BRAND2 - lines 97 to 97"]
B35["B36: instructions - lines 98 to 101"]
B36["B37: BRAND3 - lines 104 to 107"]
B37["B38: TWOYEAR - lines 111 to 111"]
B38["B39: instructions - lines 112 to 113"]
B39["B40: instructions - lines 114 to 117"]
B30 -->|call| B119
B30 -->|after return| B31
B31 -->|condition true| B37
B31 -->|condition false| B32
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|jump| B45
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|jump| B45
B36 -->|jump| B45
B37 -->|condition true| B43
B37 -->|condition false| B38
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B45
B119["Continue at B120 in section 12"]
B45["Continue at B46 in section 5"]
B43["Continue at B44 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL WARMSG
```

### B32

```asm
MOV A,31H
CJNE A,#1,TWOYEAR
```

### B33

```asm
MOV A,30H
CJNE A,#1,BRAND2
```

### B34

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK
```

### B35

```asm
CJNE A,#2,BRAND3
```

### B36

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK
```

### B37

```asm
MOV A,36H
ADD A,#8
MOV 36H,A
SJMP BACK
```

### B38

```asm
CJNE A,#2,ERR
```

### B39

```asm
MOV A,30H
CJNE A,#1,BRRAND2
```

### B40

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

## Section 5

```mermaid
flowchart TD
B40["B41: BRRAND2 - lines 120 to 120"]
B41["B42: instructions - lines 121 to 124"]
B42["B43: BRRAND3 - lines 127 to 131"]
B43["B44: ERR - lines 134 to 134"]
B44["B45: instructions - lines 135 to 135"]
B45["B46: BACK - lines 137 to 137"]
B46["B47: MAINTANACE - lines 141 to 141"]
B47["B48: instructions - lines 142 to 143"]
B48["B49: instructions - lines 146 to 147"]
B49["B50: instructions - lines 148 to 151"]
B40 -->|condition true| B42
B40 -->|condition false| B41
B41 -->|jump| B45
B42 -->|jump| B45
B43 -->|call| B201
B43 -->|after return| B44
B44 -->|jump| B30
B46 -->|call| B135
B46 -->|after return| B47
B47 -->|condition true| B53
B47 -->|condition false| B48
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|jump| B57
B201["Continue at B202 in section 21"]
B30["Continue at B31 in section 4"]
B135["Continue at B136 in section 14"]
B53["Continue at B54 in section 6"]
B50["Continue at B51 in section 6"]
B57["Continue at B58 in section 6"]
```

### B41

```asm
CJNE A,#2,BRRAND3
```

### B42

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK
```

### B43

```asm
MOV 36H,#77
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B44

```asm
ACALL ERRORR
```

### B45

```asm
SJMP WARRENTLY
```

### B46

Return to the instruction following the active call.

```asm
RET
```

### B47

```asm
ACALL MAIMSG
```

### B48

```asm
MOV A,32H
CJNE A,#1,NO
```

### B49

```asm
MOV A,30H
CJNE A,#1,BRRANDD2
```

### B50

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK1
```

## Section 6

```mermaid
flowchart TD
B50["B51: BRRANDD2 - lines 154 to 154"]
B51["B52: instructions - lines 155 to 158"]
B52["B53: BRRANDD3 - lines 161 to 164"]
B53["B54: NO - lines 166 to 166"]
B54["B55: instructions - lines 167 to 167"]
B55["B56: ERR1 - lines 170 to 170"]
B56["B57: instructions - lines 171 to 171"]
B57["B58: BACK1 - lines 174 to 174"]
B58["B59: DELIVERY - lines 178 to 178"]
B59["B60: instructions - lines 179 to 180"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|jump| B57
B52 -->|jump| B57
B53 -->|condition true| B55
B53 -->|condition false| B54
B54 -->|jump| B57
B55 -->|call| B201
B55 -->|after return| B56
B56 -->|jump| B46
B58 -->|call| B151
B58 -->|after return| B59
B59 -->|condition true| B65
B59 -->|condition false| B60
B201["Continue at B202 in section 21"]
B46["Continue at B47 in section 5"]
B151["Continue at B152 in section 16"]
B65["Continue at B66 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
CJNE A,#2,BRRANDD3
```

### B52

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK1
```

### B53

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK1
```

### B54

```asm
CJNE A,#2,ERR1
```

### B55

```asm
SJMP BACK1
```

### B56

```asm
ACALL ERRORR
```

### B57

```asm
SJMP MAINTANACE
```

### B58

Return to the instruction following the active call.

```asm
RET
```

### B59

```asm
ACALL DELMSG
```

### B60

```asm
MOV A,33H
CJNE A,#1,NO1
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 183 to 184"]
B61["B62: instructions - lines 185 to 188"]
B62["B63: BRRANDDD2 - lines 191 to 191"]
B63["B64: instructions - lines 192 to 195"]
B64["B65: BRRANDDD3 - lines 198 to 201"]
B65["B66: NO1 - lines 204 to 204"]
B66["B67: instructions - lines 205 to 205"]
B67["B68: ERR2 - lines 208 to 208"]
B68["B69: instructions - lines 209 to 209"]
B69["B70: BACK2 - lines 212 to 212"]
B60 -->|condition true| B62
B60 -->|condition false| B61
B61 -->|jump| B69
B62 -->|condition true| B64
B62 -->|condition false| B63
B63 -->|jump| B69
B64 -->|jump| B69
B65 -->|condition true| B67
B65 -->|condition false| B66
B66 -->|jump| B69
B67 -->|call| B201
B67 -->|after return| B68
B68 -->|jump| B58
B201["Continue at B202 in section 21"]
B58["Continue at B59 in section 6"]
```

### B61

```asm
MOV A,30H
CJNE A,#1,BRRANDDD2
```

### B62

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK2
```

### B63

```asm
CJNE A,#2,BRRANDDD3
```

### B64

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B65

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B66

```asm
CJNE A,#2,ERR2
```

### B67

```asm
SJMP BACK2
```

### B68

```asm
ACALL ERRORR
```

### B69

```asm
SJMP DELIVERY
```

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: MEMBERSHIP - lines 216 to 216"]
B71["B72: instructions - lines 217 to 218"]
B72["B73: instructions - lines 221 to 222"]
B73["B74: instructions - lines 223 to 226"]
B74["B75: BRRANDD22 - lines 229 to 229"]
B75["B76: instructions - lines 230 to 233"]
B76["B77: BRRANDD33 - lines 236 to 239"]
B77["B78: NO2 - lines 242 to 242"]
B78["B79: instructions - lines 243 to 243"]
B79["B80: ERR3 - lines 246 to 246"]
B70 -->|call| B167
B70 -->|after return| B71
B71 -->|condition true| B77
B71 -->|condition false| B72
B72 -->|condition true| B74
B72 -->|condition false| B73
B73 -->|jump| B81
B74 -->|condition true| B76
B74 -->|condition false| B75
B75 -->|jump| B81
B76 -->|jump| B81
B77 -->|condition true| B79
B77 -->|condition false| B78
B78 -->|jump| B81
B79 -->|call| B201
B79 -->|after return| B80
B167["Continue at B168 in section 17"]
B81["Continue at B82 in section 9"]
B201["Continue at B202 in section 21"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL MEMMSG
```

### B72

```asm
MOV A,35H
CJNE A,#1,NO2
```

### B73

```asm
MOV A,30H
CJNE A,#1,BRRANDD22
```

### B74

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B75

```asm
CJNE A,#2,BRRANDD33
```

### B76

```asm
MOV A,36H
SUBB A,#17
MOV 36H,A
SJMP BACK3
```

### B77

```asm
MOV A,36H
SUBB A,#22
MOV 36H,A
SJMP BACK3
```

### B78

```asm
CJNE A,#2,ERR3
```

### B79

```asm
SJMP BACK3
```

### B80

```asm
ACALL ERRORR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 247 to 247"]
B81["B82: BACK3 - lines 251 to 251"]
B82["B83: FLASH1 - lines 254 to 254"]
B83["B84: AG - lines 256 to 257"]
B84["B85: instructions - lines 258 to 259"]
B85["B86: instructions - lines 260 to 260"]
B86["B87: instructions - lines 261 to 261"]
B87["B88: FLASH2 - lines 264 to 264"]
B88["B89: AG1 - lines 266 to 267"]
B89["B90: instructions - lines 268 to 269"]
B80 -->|jump| B70
B82 -->|next| B83
B83 -->|call| B206
B83 -->|after return| B84
B84 -->|call| B206
B84 -->|after return| B85
B85 -->|condition true| B83
B85 -->|condition false| B86
B87 -->|next| B88
B88 -->|call| B206
B88 -->|after return| B89
B89 -->|call| B206
B89 -->|after return| B90
B70["Continue at B71 in section 8"]
B206["Continue at B207 in section 21"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
SJMP MEMBERSHIP
```

### B82

Return to the instruction following the active call.

```asm
RET
```

### B83

```asm
MOV R7,#5
```

### B84

```asm
MOV P1,#11101111B
ACALL DELAY
```

### B85

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B86

```asm
DJNZ R7,AG
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

```asm
MOV R7,#5
```

### B89

```asm
MOV P1,#11110111B
ACALL DELAY
```

### B90

```asm
MOV P1,#11111111B
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 270 to 270"]
B91["B92: instructions - lines 271 to 271"]
B92["B93: FLASH3 - lines 274 to 274"]
B93["B94: AG2 - lines 276 to 277"]
B94["B95: instructions - lines 278 to 279"]
B95["B96: instructions - lines 280 to 280"]
B96["B97: instructions - lines 281 to 281"]
B97["B98: WELCOME - lines 289 to 290"]
B98["B99: instructions - lines 291 to 292"]
B99["B100: instructions - lines 293 to 294"]
B90 -->|condition true| B88
B90 -->|condition false| B91
B92 -->|next| B93
B93 -->|call| B206
B93 -->|after return| B94
B94 -->|call| B206
B94 -->|after return| B95
B95 -->|condition true| B93
B95 -->|condition false| B96
B97 -->|call| B234
B97 -->|after return| B98
B98 -->|call| B240
B98 -->|after return| B99
B99 -->|call| B234
B99 -->|after return| B100
B88["Continue at B89 in section 9"]
B206["Continue at B207 in section 21"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
DJNZ R7,AG1
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
MOV R7,#5
```

### B94

```asm
MOV P1,#11111011B
ACALL DELAY
```

### B95

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B96

```asm
DJNZ R7,AG2
```

### B97

Return to the instruction following the active call.

```asm
RET
```

### B98

```asm
mov a, #80H
acall cmd
```

### B99

```asm
mov dptr, #MESG1
acall wstr
```

### B100

```asm
mov a,#0c0h
acall cmd
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 295 to 296"]
B101["B102: instructions - lines 297 to 297"]
B102["B103: instructions - lines 298 to 298"]
B103["B104: MENU1 - lines 301 to 301"]
B104["B105: instructions - lines 302 to 302"]
B105["B106: instructions - lines 303 to 304"]
B106["B107: instructions - lines 305 to 306"]
B107["B108: instructions - lines 307 to 308"]
B108["B109: instructions - lines 309 to 310"]
B109["B110: instructions - lines 311 to 311"]
B100 -->|call| B240
B100 -->|after return| B101
B101 -->|call| B206
B101 -->|after return| B102
B103 -->|call| B206
B103 -->|after return| B104
B104 -->|call| B262
B104 -->|after return| B105
B105 -->|call| B234
B105 -->|after return| B106
B106 -->|call| B240
B106 -->|after return| B107
B107 -->|call| B234
B107 -->|after return| B108
B108 -->|call| B240
B108 -->|after return| B109
B109 -->|call| B206
B109 -->|after return| B110
B240["Continue at B241 in section 25"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov dptr, #MESG2
acall wstr
```

### B102

```asm
ACALL DELAY
```

### B103

Return to the instruction following the active call.

```asm
ret
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
ACALL CLEAR
```

### B106

```asm
mov a, #80H
acall cmd
```

### B107

```asm
mov dptr, #MESG3
acall wstr
```

### B108

```asm
mov a,#0c0h
acall cmd
```

### B109

```asm
mov dptr, #MESG4
acall wstr
```

### B110

```asm
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 312 to 312"]
B111["B112: instructions - lines 313 to 313"]
B112["B113: instructions - lines 315 to 316"]
B113["B114: instructions - lines 317 to 318"]
B114["B115: instructions - lines 320 to 321"]
B115["B116: instructions - lines 322 to 322"]
B116["B117: instructions - lines 323 to 324"]
B117["B118: instructions - lines 325 to 328"]
B118["B119: instructions - lines 329 to 329"]
B119["B120: WARMSG - lines 332 to 332"]
B110 -->|call| B206
B110 -->|after return| B111
B111 -->|call| B262
B111 -->|after return| B112
B112 -->|call| B234
B112 -->|after return| B113
B113 -->|call| B240
B113 -->|after return| B114
B114 -->|call| B234
B114 -->|after return| B115
B115 -->|call| B245
B115 -->|after return| B116
B116 -->|call| B229
B116 -->|after return| B117
B117 -->|call| B206
B117 -->|after return| B118
B119 -->|call| B206
B119 -->|after return| B120
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B245["Continue at B246 in section 25"]
B229["Continue at B230 in section 23"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL DELAY
```

### B112

```asm
ACALL CLEAR
```

### B113

```asm
mov a, #80H
acall cmd
```

### B114

```asm
mov dptr, #MESG5
acall wstr
```

### B115

```asm
mov a, #0C3H
acall cmd
```

### B116

```asm
ACALL KEYPAD
```

### B117

```asm
MOV 30H,A
acall wchr
```

### B118

```asm
MOV A,30H
SUBB A,#30H
MOV 30H,A
ACALL DELAY
```

### B119

Return to the instruction following the active call.

```asm
RET
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 333 to 333"]
B121["B122: instructions - lines 334 to 335"]
B122["B123: instructions - lines 336 to 337"]
B123["B124: instructions - lines 338 to 339"]
B124["B125: instructions - lines 340 to 341"]
B125["B126: instructions - lines 342 to 342"]
B126["B127: instructions - lines 343 to 343"]
B127["B128: instructions - lines 344 to 344"]
B128["B129: instructions - lines 346 to 347"]
B129["B130: instructions - lines 348 to 349"]
B120 -->|call| B262
B120 -->|after return| B121
B121 -->|call| B234
B121 -->|after return| B122
B122 -->|call| B240
B122 -->|after return| B123
B123 -->|call| B234
B123 -->|after return| B124
B124 -->|call| B240
B124 -->|after return| B125
B125 -->|call| B206
B125 -->|after return| B126
B126 -->|call| B206
B126 -->|after return| B127
B127 -->|call| B262
B127 -->|after return| B128
B128 -->|call| B234
B128 -->|after return| B129
B129 -->|call| B240
B129 -->|after return| B130
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B206["Continue at B207 in section 21"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL CLEAR
```

### B122

```asm
mov a, #80H
acall cmd
```

### B123

```asm
mov dptr, #MESG6
acall wstr
```

### B124

```asm
mov a,#0c0h
acall cmd
```

### B125

```asm
mov dptr, #MESG7
acall wstr
```

### B126

```asm
ACALL DELAY
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
ACALL CLEAR
```

### B129

```asm
mov a, #80H
acall cmd
```

### B130

```asm
mov dptr, #MESG8
acall wstr
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 351 to 352"]
B131["B132: instructions - lines 353 to 353"]
B132["B133: instructions - lines 354 to 355"]
B133["B134: instructions - lines 356 to 359"]
B134["B135: instructions - lines 360 to 360"]
B135["B136: MAIMSG - lines 363 to 363"]
B136["B137: instructions - lines 364 to 364"]
B137["B138: instructions - lines 365 to 366"]
B138["B139: instructions - lines 367 to 368"]
B139["B140: instructions - lines 369 to 370"]
B130 -->|call| B234
B130 -->|after return| B131
B131 -->|call| B245
B131 -->|after return| B132
B132 -->|call| B229
B132 -->|after return| B133
B133 -->|call| B206
B133 -->|after return| B134
B135 -->|call| B206
B135 -->|after return| B136
B136 -->|call| B262
B136 -->|after return| B137
B137 -->|call| B234
B137 -->|after return| B138
B138 -->|call| B240
B138 -->|after return| B139
B139 -->|call| B234
B139 -->|after return| B140
B234["Continue at B235 in section 24"]
B245["Continue at B246 in section 25"]
B229["Continue at B230 in section 23"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B240["Continue at B241 in section 25"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov a, #0C3H
acall cmd
```

### B132

```asm
ACALL KEYPAD
```

### B133

```asm
MOV 31H,A
acall wchr
```

### B134

```asm
MOV A,31H
SUBB A,#30H
MOV 31H,A
ACALL DELAY
```

### B135

Return to the instruction following the active call.

```asm
RET
```

### B136

```asm
ACALL DELAY
```

### B137

```asm
ACALL CLEAR
```

### B138

```asm
mov a, #80H
acall cmd
```

### B139

```asm
mov dptr, #MESG9
acall wstr
```

### B140

```asm
mov a,#0c0h
acall cmd
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 371 to 372"]
B141["B142: instructions - lines 373 to 373"]
B142["B143: instructions - lines 374 to 374"]
B143["B144: instructions - lines 375 to 375"]
B144["B145: instructions - lines 377 to 378"]
B145["B146: instructions - lines 379 to 380"]
B146["B147: instructions - lines 382 to 383"]
B147["B148: instructions - lines 384 to 384"]
B148["B149: instructions - lines 385 to 386"]
B149["B150: instructions - lines 387 to 390"]
B140 -->|call| B240
B140 -->|after return| B141
B141 -->|call| B206
B141 -->|after return| B142
B142 -->|call| B206
B142 -->|after return| B143
B143 -->|call| B262
B143 -->|after return| B144
B144 -->|call| B234
B144 -->|after return| B145
B145 -->|call| B240
B145 -->|after return| B146
B146 -->|call| B234
B146 -->|after return| B147
B147 -->|call| B245
B147 -->|after return| B148
B148 -->|call| B229
B148 -->|after return| B149
B149 -->|call| B206
B149 -->|after return| B150
B240["Continue at B241 in section 25"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B245["Continue at B246 in section 25"]
B229["Continue at B230 in section 23"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov dptr, #MESG10
acall wstr
```

### B142

```asm
ACALL DELAY
```

### B143

```asm
ACALL DELAY
```

### B144

```asm
ACALL CLEAR
```

### B145

```asm
mov a, #80H
acall cmd
```

### B146

```asm
mov dptr, #MESG8
acall wstr
```

### B147

```asm
mov a, #0C3H
acall cmd
```

### B148

```asm
ACALL KEYPAD
```

### B149

```asm
MOV 32H,A
acall wchr
```

### B150

```asm
MOV A,32H
SUBB A,#30H
MOV 32H,A
ACALL DELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 392 to 392"]
B151["B152: DELMSG - lines 395 to 395"]
B152["B153: instructions - lines 396 to 396"]
B153["B154: instructions - lines 397 to 398"]
B154["B155: instructions - lines 399 to 400"]
B155["B156: instructions - lines 401 to 402"]
B156["B157: instructions - lines 403 to 404"]
B157["B158: instructions - lines 405 to 405"]
B158["B159: instructions - lines 406 to 406"]
B159["B160: instructions - lines 407 to 407"]
B151 -->|call| B206
B151 -->|after return| B152
B152 -->|call| B262
B152 -->|after return| B153
B153 -->|call| B234
B153 -->|after return| B154
B154 -->|call| B240
B154 -->|after return| B155
B155 -->|call| B234
B155 -->|after return| B156
B156 -->|call| B240
B156 -->|after return| B157
B157 -->|call| B206
B157 -->|after return| B158
B158 -->|call| B206
B158 -->|after return| B159
B159 -->|call| B262
B159 -->|after return| B160
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
RET
```

### B152

```asm
ACALL DELAY
```

### B153

```asm
ACALL CLEAR
```

### B154

```asm
mov a, #80H
acall cmd
```

### B155

```asm
mov dptr, #MESG11
acall wstr
```

### B156

```asm
mov a,#0c0h
acall cmd
```

### B157

```asm
mov dptr, #MESG10
acall wstr
```

### B158

```asm
ACALL DELAY
```

### B159

```asm
ACALL DELAY
```

### B160

```asm
ACALL CLEAR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 409 to 410"]
B161["B162: instructions - lines 411 to 412"]
B162["B163: instructions - lines 413 to 414"]
B163["B164: instructions - lines 415 to 415"]
B164["B165: instructions - lines 416 to 417"]
B165["B166: instructions - lines 418 to 421"]
B166["B167: instructions - lines 422 to 422"]
B167["B168: MEMMSG - lines 425 to 425"]
B168["B169: instructions - lines 426 to 426"]
B169["B170: instructions - lines 427 to 428"]
B160 -->|call| B234
B160 -->|after return| B161
B161 -->|call| B240
B161 -->|after return| B162
B162 -->|call| B234
B162 -->|after return| B163
B163 -->|call| B245
B163 -->|after return| B164
B164 -->|call| B229
B164 -->|after return| B165
B165 -->|call| B206
B165 -->|after return| B166
B167 -->|call| B206
B167 -->|after return| B168
B168 -->|call| B262
B168 -->|after return| B169
B169 -->|call| B234
B169 -->|after return| B170
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B245["Continue at B246 in section 25"]
B229["Continue at B230 in section 23"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
mov a, #80H
acall cmd
```

### B162

```asm
mov dptr, #MESG8
acall wstr
```

### B163

```asm
mov a, #0C3H
acall cmd
```

### B164

```asm
ACALL KEYPAD
```

### B165

```asm
MOV 33H,A
acall wchr
```

### B166

```asm
MOV A,33H
SUBB A,#30H
MOV 33H,A
ACALL DELAY
```

### B167

Return to the instruction following the active call.

```asm
RET
```

### B168

```asm
ACALL DELAY
```

### B169

```asm
ACALL CLEAR
```

### B170

```asm
mov a, #80H
acall cmd
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 429 to 430"]
B171["B172: instructions - lines 431 to 432"]
B172["B173: instructions - lines 433 to 434"]
B173["B174: instructions - lines 435 to 435"]
B174["B175: instructions - lines 436 to 436"]
B175["B176: instructions - lines 437 to 437"]
B176["B177: instructions - lines 439 to 440"]
B177["B178: instructions - lines 441 to 442"]
B178["B179: instructions - lines 443 to 444"]
B179["B180: instructions - lines 445 to 445"]
B170 -->|call| B240
B170 -->|after return| B171
B171 -->|call| B234
B171 -->|after return| B172
B172 -->|call| B240
B172 -->|after return| B173
B173 -->|call| B206
B173 -->|after return| B174
B174 -->|call| B206
B174 -->|after return| B175
B175 -->|call| B262
B175 -->|after return| B176
B176 -->|call| B234
B176 -->|after return| B177
B177 -->|call| B240
B177 -->|after return| B178
B178 -->|call| B234
B178 -->|after return| B179
B179 -->|call| B245
B179 -->|after return| B180
B240["Continue at B241 in section 25"]
B234["Continue at B235 in section 24"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B245["Continue at B246 in section 25"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
mov dptr, #MESG12
acall wstr
```

### B172

```asm
mov a,#0c0h
acall cmd
```

### B173

```asm
mov dptr, #MESG10
acall wstr
```

### B174

```asm
ACALL DELAY
```

### B175

```asm
ACALL DELAY
```

### B176

```asm
ACALL CLEAR
```

### B177

```asm
mov a, #80H
acall cmd
```

### B178

```asm
mov dptr, #MESG8
acall wstr
```

### B179

```asm
mov a, #0C3H
acall cmd
```

### B180

```asm
ACALL KEYPAD
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 446 to 447"]
B181["B182: instructions - lines 448 to 451"]
B182["B183: instructions - lines 452 to 452"]
B183["B184: TVNUMB - lines 455 to 455"]
B184["B185: instructions - lines 456 to 456"]
B185["B186: instructions - lines 457 to 458"]
B186["B187: instructions - lines 459 to 460"]
B187["B188: instructions - lines 462 to 463"]
B188["B189: instructions - lines 464 to 464"]
B189["B190: instructions - lines 465 to 466"]
B180 -->|call| B229
B180 -->|after return| B181
B181 -->|call| B206
B181 -->|after return| B182
B183 -->|call| B206
B183 -->|after return| B184
B184 -->|call| B262
B184 -->|after return| B185
B185 -->|call| B234
B185 -->|after return| B186
B186 -->|call| B240
B186 -->|after return| B187
B187 -->|call| B234
B187 -->|after return| B188
B188 -->|call| B245
B188 -->|after return| B189
B189 -->|call| B229
B189 -->|after return| B190
B229["Continue at B230 in section 23"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B245["Continue at B246 in section 25"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV 35H,A
acall wchr
```

### B182

```asm
MOV A,35H
SUBB A,#30H
MOV 35H,A
ACALL DELAY
```

### B183

Return to the instruction following the active call.

```asm
RET
```

### B184

```asm
ACALL DELAY
```

### B185

```asm
ACALL CLEAR
```

### B186

```asm
mov a, #80H
acall cmd
```

### B187

```asm
mov dptr, #MESG13
acall wstr
```

### B188

```asm
mov a, #0C3H
acall cmd
```

### B189

```asm
ACALL KEYPAD
```

### B190

```asm
MOV 34H,A
acall wchr
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 467 to 470"]
B191["B192: instructions - lines 471 to 471"]
B192["B193: PAYMENT - lines 474 to 474"]
B193["B194: instructions - lines 475 to 475"]
B194["B195: instructions - lines 476 to 477"]
B195["B196: instructions - lines 478 to 479"]
B196["B197: instructions - lines 480 to 481"]
B197["B198: instructions - lines 482 to 489"]
B198["B199: instructions - lines 490 to 492"]
B199["B200: instructions - lines 493 to 495"]
B190 -->|call| B206
B190 -->|after return| B191
B192 -->|call| B206
B192 -->|after return| B193
B193 -->|call| B262
B193 -->|after return| B194
B194 -->|call| B234
B194 -->|after return| B195
B195 -->|call| B240
B195 -->|after return| B196
B196 -->|call| B234
B196 -->|after return| B197
B197 -->|call| B229
B197 -->|after return| B198
B198 -->|call| B229
B198 -->|after return| B199
B199 -->|call| B229
B199 -->|after return| B200
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B229["Continue at B230 in section 23"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV A,34H
SUBB A,#30H
MOV 34H,A
ACALL DELAY
```

### B192

Return to the instruction following the active call.

```asm
RET
```

### B193

```asm
ACALL DELAY
```

### B194

```asm
ACALL CLEAR
```

### B195

```asm
mov a, #80H
acall cmd
```

### B196

```asm
mov dptr, #MESG14
acall wstr
```

### B197

```asm
mov a, #0C3H
acall cmd
```

### B198

```asm
MOV A,36H
MOV B,#10
DIV AB
MOV R3,B
MOV B,#10
DIV AB
ADD A,#30H
acall wchr
```

### B199

```asm
MOV A,B
ADD A,#30H
acall wchr
```

### B200

```asm
MOV A,R3
ADD A,#30H
acall wchr
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 497 to 497"]
B201["B202: ERRORR - lines 500 to 500"]
B202["B203: instructions - lines 501 to 501"]
B203["B204: instructions - lines 502 to 503"]
B204["B205: instructions - lines 504 to 505"]
B205["B206: instructions - lines 506 to 506"]
B206["B207: DELAY - lines 510 to 511"]
B207["B208: instructions - lines 512 to 512"]
B208["B209: REPEAT_AGAIN - lines 516 to 516"]
B209["B210: instructions - lines 517 to 517"]
B201 -->|call| B206
B201 -->|after return| B202
B202 -->|call| B262
B202 -->|after return| B203
B203 -->|call| B234
B203 -->|after return| B204
B204 -->|call| B240
B204 -->|after return| B205
B206 -->|condition true| B206
B206 -->|condition false| B207
B208 -->|call| B206
B208 -->|after return| B209
B209 -->|call| B262
B209 -->|after return| B210
B262["Continue at B263 in section 27"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B210["Continue at B211 in section 22"]
```

### B201

Return to the instruction following the active call.

```asm
RET
```

### B202

```asm
ACALL DELAY
```

### B203

```asm
ACALL CLEAR
```

### B204

```asm
mov a, #80H
acall cmd
```

### B205

```asm
mov dptr, #MESG15
acall wstr
```

### B206

Return to the instruction following the active call.

```asm
RET
```

### B207

```asm
MOV R0, #200
DJNZ R0, $
```

### B208

Return to the instruction following the active call.

```asm
RET
```

### B209

```asm
ACALL DELAY
```

### B210

```asm
ACALL CLEAR
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 518 to 519"]
B211["B212: instructions - lines 520 to 521"]
B212["B213: instructions - lines 522 to 523"]
B213["B214: instructions - lines 524 to 525"]
B214["B215: instructions - lines 526 to 526"]
B215["B216: instructions - lines 527 to 527"]
B216["B217: instructions - lines 528 to 528"]
B217["B218: EXI - lines 530 to 530"]
B218["B219: INT - lines 533 to 533"]
B219["B220: instructions - lines 534 to 534"]
B210 -->|call| B234
B210 -->|after return| B211
B211 -->|call| B240
B211 -->|after return| B212
B212 -->|call| B234
B212 -->|after return| B213
B213 -->|call| B240
B213 -->|after return| B214
B214 -->|call| B245
B214 -->|after return| B215
B215 -->|condition true| B217
B215 -->|condition false| B216
B216 -->|jump| B7
B218 -->|call| B206
B218 -->|after return| B219
B219 -->|call| B262
B219 -->|after return| B220
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B245["Continue at B246 in section 25"]
B7["Continue at B8 in section 1"]
B206["Continue at B207 in section 21"]
B262["Continue at B263 in section 27"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
mov a, #80H
acall cmd
```

### B212

```asm
mov dptr, #MESG17
acall wstr
```

### B213

```asm
mov a, #0C0H
acall cmd
```

### B214

```asm
mov dptr, #MESG18
acall wstr
```

### B215

```asm
ACALL KEYPAD
```

### B216

```asm
CJNE A,#'1',EXI
```

### B217

```asm
LJMP REPEAT
```

### B218

Return to the instruction following the active call.

```asm
RET
```

### B219

```asm
ACALL DELAY
```

### B220

```asm
ACALL CLEAR
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 535 to 535"]
B221["B222: instructions - lines 536 to 537"]
B222["B223: instructions - lines 538 to 539"]
B223["B224: instructions - lines 541 to 544"]
B224["B225: INLCD - lines 548 to 556"]
B225["B226: instructions - lines 558 to 567"]
B226["B227: instructions - lines 569 to 584"]
B227["B228: instructions - lines 586 to 598"]
B228["B229: instructions - lines 599 to 599"]
B229["B230: WCHR - lines 604 to 608"]
B220 -->|call| B206
B220 -->|after return| B221
B221 -->|call| B234
B221 -->|after return| B222
B222 -->|call| B240
B222 -->|after return| B223
B224 -->|call| B206
B224 -->|after return| B225
B225 -->|call| B206
B225 -->|after return| B226
B226 -->|call| B206
B226 -->|after return| B227
B227 -->|call| B206
B227 -->|after return| B228
B229 -->|call| B239
B229 -->|after return| B230
B206["Continue at B207 in section 21"]
B234["Continue at B235 in section 24"]
B240["Continue at B241 in section 25"]
B239["Continue at B240 in section 24"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
ACALL DELAY
```

### B222

```asm
mov a, #80H
acall cmd
```

### B223

```asm
mov dptr, #MESG16
acall wstr
```

### B224

Return to the instruction following the active call.

```asm
CLR P3.6
SETB P3.6
RET
```

### B225

```asm
CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL DELAY
```

### B226

```asm
SETB P1.2
CLR P1.2
SETB P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL DELAY
```

### B227

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
ACALL DELAY
```

### B228

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
ACALL DELAY
```

### B229

Return to the instruction following the active call.

```asm
RET
```

### B230

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 609 to 609"]
B231["B232: instructions - lines 610 to 612"]
B232["B233: instructions - lines 613 to 613"]
B233["B234: instructions - lines 614 to 616"]
B234["B235: CMD - lines 619 to 621"]
B235["B236: instructions - lines 622 to 622"]
B236["B237: instructions - lines 623 to 625"]
B237["B238: instructions - lines 626 to 626"]
B238["B239: instructions - lines 627 to 627"]
B239["B240: COMMON - lines 631 to 636"]
B230 -->|call| B206
B230 -->|after return| B231
B231 -->|call| B239
B231 -->|after return| B232
B232 -->|call| B206
B232 -->|after return| B233
B234 -->|call| B239
B234 -->|after return| B235
B235 -->|call| B206
B235 -->|after return| B236
B236 -->|call| B239
B236 -->|after return| B237
B237 -->|call| B206
B237 -->|after return| B238
B206["Continue at B207 in section 21"]
```

### B231

```asm
ACALL DELAY
```

### B232

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B233

```asm
ACALL DELAY
```

### B234

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B235

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B236

```asm
ACALL DELAY
```

### B237

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B238

```asm
ACALL DELAY
```

### B239

Return to the instruction following the active call.

```asm
RET
```

### B240

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

## Section 25

```mermaid
flowchart TD
B240["B241: WSTR - lines 640 to 640"]
B241["B242: CONT1 - lines 642 to 644"]
B242["B243: PRINT - lines 646 to 646"]
B243["B244: instructions - lines 647 to 648"]
B244["B245: EXIT1 - lines 649 to 650"]
B245["B246: KEYPAD - lines 656 to 656"]
B246["B247: K1 - lines 657 to 660"]
B247["B248: K2 - lines 662 to 664"]
B248["B249: instructions - lines 665 to 665"]
B249["B250: OVER1 - lines 667 to 670"]
B240 -->|next| B241
B241 -->|condition true| B244
B241 -->|condition false| B242
B242 -->|call| B229
B242 -->|after return| B243
B243 -->|jump| B241
B245 -->|next| B246
B246 -->|condition true| B246
B246 -->|condition false| B247
B247 -->|condition true| B249
B247 -->|condition false| B248
B248 -->|jump| B247
B249 -->|condition true| B254
B249 -->|condition false| B250
B229["Continue at B230 in section 23"]
B254["Continue at B255 in section 26"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
PUSH    ACC
```

### B242

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B243

```asm
ACALL    WCHR
```

### B244

```asm
INC DPTR
AJMP    CONT1
```

### B245

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B246

```asm
MOV P0,#01110000B
```

### B247

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B248

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B249

```asm
SJMP K2
```

### B250

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

## Section 26

```mermaid
flowchart TD
B250["B251: instructions - lines 671 to 674"]
B251["B252: instructions - lines 675 to 678"]
B252["B253: instructions - lines 679 to 682"]
B253["B254: instructions - lines 683 to 683"]
B254["B255: ROW_0 - lines 684 to 685"]
B255["B256: ROW_1 - lines 686 to 687"]
B256["B257: ROW_2 - lines 688 to 689"]
B257["B258: ROW_3 - lines 690 to 690"]
B258["B259: FIND - lines 692 to 692"]
B259["B260: FIND1 - lines 694 to 695"]
B250 -->|condition true| B255
B250 -->|condition false| B251
B251 -->|condition true| B256
B251 -->|condition false| B252
B252 -->|condition true| B257
B252 -->|condition false| B253
B253 -->|jump| B247
B254 -->|jump| B258
B255 -->|jump| B258
B256 -->|jump| B258
B257 -->|next| B258
B258 -->|next| B259
B259 -->|condition true| B261
B259 -->|condition false| B260
B247["Continue at B248 in section 25"]
B261["Continue at B262 in section 27"]
B260["Continue at B261 in section 27"]
```

### B251

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B252

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B253

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B254

```asm
LJMP K2
```

### B255

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B256

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B257

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B258

```asm
MOV DPTR,#KCODE3
```

### B259

```asm
RLC A
```

### B260

```asm
RLC A
JNC MATCH
```

## Section 27

```mermaid
flowchart TD
B260["B261: instructions - lines 696 to 697"]
B261["B262: MATCH - lines 698 to 700"]
B262["B263: CLEAR - lines 703 to 704"]
B263["B264: instructions - lines 705 to 705"]
B264["B265: WAIT - lines 706 to 706"]
B265["B266: instructions - lines 707 to 707"]
B266["B267: instructions - lines 708 to 708"]
B260 -->|jump| B259
B262 -->|call| B234
B262 -->|after return| B263
B263 -->|next| B264
B264 -->|call| B206
B264 -->|after return| B265
B265 -->|condition true| B264
B265 -->|condition false| B266
B259["Continue at B260 in section 26"]
B234["Continue at B235 in section 24"]
B206["Continue at B207 in section 21"]
```

### B261

```asm
INC DPTR
SJMP FIND1
```

### B262

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B263

```asm
MOV A,#01H
ACALL CMD
```

### B264

```asm
MOV R7,#14
```

### B265

```asm
ACALL DELAY
```

### B266

```asm
DJNZ R7,WAIT
```

### B267

Return to the instruction following the active call.

```asm
ret
```
