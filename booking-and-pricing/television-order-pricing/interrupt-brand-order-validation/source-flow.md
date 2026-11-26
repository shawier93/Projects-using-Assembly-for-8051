# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0013H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25) · [Section 26](#section-26) · [Section 27](#section-27) · [Section 28](#section-28)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 4"]
B2["B3: instructions - lines 5 to 5"]
B3["B4: instructions - lines 6 to 6"]
B4["B5: NNO - lines 8 to 8"]
B5["B6: MAIN0 - lines 15 to 15"]
B6["B7: instructions - lines 17 to 25"]
B7["B8: HERE - lines 30 to 30"]
B8["B9: REPEAT - lines 34 to 34"]
B9["B10: MAIN - lines 37 to 38"]
B0 -->|jump| B5
B1 -->|call| B254
B1 -->|after return| B2
B2 -->|condition true| B4
B2 -->|condition false| B3
B3 -->|jump| B7
B5 -->|call| B233
B5 -->|after return| B6
B6 -->|next| B7
B7 -->|call| B106
B7 -->|after return| B8
B8 -->|call| B112
B8 -->|after return| B9
B9 -->|condition true| B12
B9 -->|condition false| B10
B254["Continue at B255 in section 26"]
B233["Continue at B234 in section 24"]
B106["Continue at B107 in section 11"]
B112["Continue at B113 in section 12"]
B12["Continue at B13 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
SJMP MAIN0
```

### B2

```asm
ACALL KEYPAD
```

### B3

```asm
CJNE A,#'#',NNO
```

### B4

```asm
LJMP HERE
```

### B5

Resume the interrupted program.

```asm
RETI
```

### B6

```asm
ACALL INLCD
```

### B7

```asm
MOV IE,#10000100B
SETB IT1
MOV 30H,#3
MOV 31H,#2
MOV 32H,#1
MOV 33H,#2
MOV 34H,#2
MOV 35H,#1
MOV 36H,#0
```

### B8

```asm
ACALL WELCOME
```

### B9

```asm
ACALL MENU1
```

### B10

```asm
MOV A,30H
CJNE A,#1,BEAND2
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 39 to 39"]
B11["B12: instructions - lines 40 to 41"]
B12["B13: BEAND2 - lines 44 to 44"]
B13["B14: instructions - lines 45 to 45"]
B14["B15: instructions - lines 46 to 47"]
B15["B16: BEAND3 - lines 50 to 50"]
B16["B17: instructions - lines 51 to 51"]
B17["B18: instructions - lines 52 to 53"]
B18["B19: ERROR - lines 56 to 56"]
B19["B20: instructions - lines 57 to 57"]
B10 -->|call| B91
B10 -->|after return| B11
B11 -->|jump| B20
B12 -->|condition true| B15
B12 -->|condition false| B13
B13 -->|call| B96
B13 -->|after return| B14
B14 -->|jump| B20
B15 -->|condition true| B18
B15 -->|condition false| B16
B16 -->|call| B101
B16 -->|after return| B17
B17 -->|jump| B20
B18 -->|call| B210
B18 -->|after return| B19
B19 -->|jump| B8
B91["Continue at B92 in section 10"]
B20["Continue at B21 in section 3"]
B96["Continue at B97 in section 10"]
B101["Continue at B102 in section 11"]
B210["Continue at B211 in section 22"]
B8["Continue at B9 in section 1"]
```

### B11

```asm
ACALL FLASH1
```

### B12

```asm
MOV 36H,#63
AJMP WARR
```

### B13

```asm
CJNE A,#2,BEAND3
```

### B14

```asm
ACALL FLASH2
```

### B15

```asm
MOV 36H,#55
AJMP WARR
```

### B16

```asm
CJNE A,#3,ERROR
```

### B17

```asm
ACALL FLASH3
```

### B18

```asm
MOV 36H,#70
AJMP WARR
```

### B19

```asm
ACALL ERRORR
```

### B20

```asm
SJMP REPEAT
```

## Section 3

```mermaid
flowchart TD
B20["B21: WARR - lines 60 to 60"]
B21["B22: instructions - lines 61 to 61"]
B22["B23: instructions - lines 62 to 62"]
B23["B24: instructions - lines 65 to 65"]
B24["B25: instructions - lines 66 to 72"]
B25["B26: instructions - lines 74 to 74"]
B26["B27: EEND - lines 78 to 78"]
B27["B28: instructions - lines 79 to 79"]
B28["B29: instructions - lines 80 to 81"]
B29["B30: instructions - lines 82 to 83"]
B20 -->|call| B31
B20 -->|after return| B21
B21 -->|call| B47
B21 -->|after return| B22
B22 -->|call| B59
B22 -->|after return| B23
B23 -->|call| B192
B23 -->|after return| B24
B24 -->|call| B71
B24 -->|after return| B25
B25 -->|call| B201
B25 -->|after return| B26
B26 -->|call| B217
B26 -->|after return| B27
B27 -->|call| B271
B27 -->|after return| B28
B28 -->|call| B243
B28 -->|after return| B29
B29 -->|call| B249
B29 -->|after return| B30
B31["Continue at B32 in section 4"]
B47["Continue at B48 in section 5"]
B59["Continue at B60 in section 6"]
B192["Continue at B193 in section 20"]
B71["Continue at B72 in section 8"]
B201["Continue at B202 in section 21"]
B217["Continue at B218 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL WARRENTLY
```

### B22

```asm
ACALL MAINTANACE
```

### B23

```asm
ACALL DELIVERY
```

### B24

```asm
ACALL TVNUMB
```

### B25

```asm
MOV B,34H
MOV A,36H
MUL AB
MOV 36H,A
ACALL MEMBERSHIP
```

### B26

```asm
ACALL PAYMENT
```

### B27

```asm
ACALL REPEAT_AGAIN
```

### B28

```asm
ACALL CLEAR
```

### B29

```asm
MOV A, #80H
ACALL CMD
```

### B30

```asm
MOV dptr, #MESG19
ACALL wstr
```

## Section 4

```mermaid
flowchart TD
B30["B31: EEEND - lines 85 to 85"]
B31["B32: WARRENTLY - lines 91 to 91"]
B32["B33: instructions - lines 92 to 93"]
B33["B34: instructions - lines 96 to 97"]
B34["B35: instructions - lines 98 to 101"]
B35["B36: BRAND2 - lines 104 to 104"]
B36["B37: instructions - lines 105 to 108"]
B37["B38: BRAND3 - lines 111 to 114"]
B38["B39: TWOYEAR - lines 118 to 118"]
B39["B40: instructions - lines 119 to 120"]
B30 -->|jump| B30
B31 -->|call| B128
B31 -->|after return| B32
B32 -->|condition true| B38
B32 -->|condition false| B33
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|jump| B46
B35 -->|condition true| B37
B35 -->|condition false| B36
B36 -->|jump| B46
B37 -->|jump| B46
B38 -->|condition true| B44
B38 -->|condition false| B39
B39 -->|condition true| B41
B39 -->|condition false| B40
B128["Continue at B129 in section 13"]
B46["Continue at B47 in section 5"]
B44["Continue at B45 in section 5"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
SJMP EEEND
```

### B32

```asm
ACALL WARMSG
```

### B33

```asm
MOV A,31H
CJNE A,#1,TWOYEAR
```

### B34

```asm
MOV A,30H
CJNE A,#1,BRAND2
```

### B35

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK
```

### B36

```asm
CJNE A,#2,BRAND3
```

### B37

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK
```

### B38

```asm
MOV A,36H
ADD A,#8
MOV 36H,A
SJMP BACK
```

### B39

```asm
CJNE A,#2,ERR
```

### B40

```asm
MOV A,30H
CJNE A,#1,BRRAND2
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 121 to 124"]
B41["B42: BRRAND2 - lines 127 to 127"]
B42["B43: instructions - lines 128 to 131"]
B43["B44: BRRAND3 - lines 134 to 138"]
B44["B45: ERR - lines 141 to 141"]
B45["B46: instructions - lines 142 to 142"]
B46["B47: BACK - lines 144 to 144"]
B47["B48: MAINTANACE - lines 148 to 148"]
B48["B49: instructions - lines 149 to 150"]
B49["B50: instructions - lines 153 to 154"]
B40 -->|jump| B46
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B46
B43 -->|jump| B46
B44 -->|call| B210
B44 -->|after return| B45
B45 -->|jump| B31
B47 -->|call| B144
B47 -->|after return| B48
B48 -->|condition true| B54
B48 -->|condition false| B49
B49 -->|condition true| B51
B49 -->|condition false| B50
B210["Continue at B211 in section 22"]
B31["Continue at B32 in section 4"]
B144["Continue at B145 in section 15"]
B54["Continue at B55 in section 6"]
B51["Continue at B52 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B42

```asm
CJNE A,#2,BRRAND3
```

### B43

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK
```

### B44

```asm
MOV 36H,#77
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B45

```asm
ACALL ERRORR
```

### B46

```asm
SJMP WARRENTLY
```

### B47

Return to the instruction following the active call.

```asm
RET
```

### B48

```asm
ACALL MAIMSG
```

### B49

```asm
MOV A,32H
CJNE A,#1,NO
```

### B50

```asm
MOV A,30H
CJNE A,#1,BRRANDD2
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 155 to 158"]
B51["B52: BRRANDD2 - lines 161 to 161"]
B52["B53: instructions - lines 162 to 165"]
B53["B54: BRRANDD3 - lines 168 to 171"]
B54["B55: NO - lines 173 to 173"]
B55["B56: instructions - lines 174 to 174"]
B56["B57: ERR1 - lines 177 to 177"]
B57["B58: instructions - lines 178 to 178"]
B58["B59: BACK1 - lines 181 to 181"]
B59["B60: DELIVERY - lines 185 to 185"]
B50 -->|jump| B58
B51 -->|condition true| B53
B51 -->|condition false| B52
B52 -->|jump| B58
B53 -->|jump| B58
B54 -->|condition true| B56
B54 -->|condition false| B55
B55 -->|jump| B58
B56 -->|call| B210
B56 -->|after return| B57
B57 -->|jump| B47
B59 -->|call| B160
B59 -->|after return| B60
B210["Continue at B211 in section 22"]
B47["Continue at B48 in section 5"]
B160["Continue at B161 in section 17"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK1
```

### B52

```asm
CJNE A,#2,BRRANDD3
```

### B53

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK1
```

### B54

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK1
```

### B55

```asm
CJNE A,#2,ERR1
```

### B56

```asm
SJMP BACK1
```

### B57

```asm
ACALL ERRORR
```

### B58

```asm
SJMP MAINTANACE
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
ACALL DELMSG
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 186 to 187"]
B61["B62: instructions - lines 190 to 191"]
B62["B63: instructions - lines 192 to 195"]
B63["B64: BRRANDDD2 - lines 198 to 198"]
B64["B65: instructions - lines 199 to 202"]
B65["B66: BRRANDDD3 - lines 205 to 208"]
B66["B67: NO1 - lines 211 to 211"]
B67["B68: instructions - lines 212 to 212"]
B68["B69: ERR2 - lines 215 to 215"]
B69["B70: instructions - lines 216 to 216"]
B60 -->|condition true| B66
B60 -->|condition false| B61
B61 -->|condition true| B63
B61 -->|condition false| B62
B62 -->|jump| B70
B63 -->|condition true| B65
B63 -->|condition false| B64
B64 -->|jump| B70
B65 -->|jump| B70
B66 -->|condition true| B68
B66 -->|condition false| B67
B67 -->|jump| B70
B68 -->|call| B210
B68 -->|after return| B69
B69 -->|jump| B59
B70["Continue at B71 in section 8"]
B210["Continue at B211 in section 22"]
B59["Continue at B60 in section 6"]
```

### B61

```asm
MOV A,33H
CJNE A,#1,NO1
```

### B62

```asm
MOV A,30H
CJNE A,#1,BRRANDDD2
```

### B63

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK2
```

### B64

```asm
CJNE A,#2,BRRANDDD3
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
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B67

```asm
CJNE A,#2,ERR2
```

### B68

```asm
SJMP BACK2
```

### B69

```asm
ACALL ERRORR
```

### B70

```asm
SJMP DELIVERY
```

## Section 8

```mermaid
flowchart TD
B70["B71: BACK2 - lines 219 to 219"]
B71["B72: MEMBERSHIP - lines 223 to 223"]
B72["B73: instructions - lines 224 to 225"]
B73["B74: instructions - lines 228 to 229"]
B74["B75: instructions - lines 230 to 233"]
B75["B76: BRRANDD22 - lines 236 to 236"]
B76["B77: instructions - lines 237 to 240"]
B77["B78: BRRANDD33 - lines 243 to 246"]
B78["B79: EX0ISR - lines 252 to 252"]
B79["B80: instructions - lines 255 to 255"]
B71 -->|call| B176
B71 -->|after return| B72
B72 -->|condition true| B86
B72 -->|condition false| B73
B73 -->|condition true| B75
B73 -->|condition false| B74
B74 -->|jump| B90
B75 -->|condition true| B77
B75 -->|condition false| B76
B76 -->|jump| B90
B77 -->|jump| B90
B78 -->|call| B254
B78 -->|after return| B79
B79 -->|condition true| B78
B79 -->|condition false| B80
B176["Continue at B177 in section 18"]
B86["Continue at B87 in section 9"]
B90["Continue at B91 in section 10"]
B254["Continue at B255 in section 26"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
ACALL MEMMSG
```

### B73

```asm
MOV A,35H
CJNE A,#1,NO2
```

### B74

```asm
MOV A,30H
CJNE A,#1,BRRANDD22
```

### B75

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B76

```asm
CJNE A,#2,BRRANDD33
```

### B77

```asm
MOV A,36H
SUBB A,#17
MOV 36H,A
SJMP BACK3
```

### B78

```asm
MOV A,36H
SUBB A,#22
MOV 36H,A
SJMP BACK3
```

### B79

```asm
ACALL KEYPAD
```

### B80

```asm
cjne A,#'#',again
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 256 to 256"]
B81["B82: instructions - lines 259 to 261"]
B82["B83: T1SR - lines 264 to 264"]
B83["B84: instructions - lines 265 to 271"]
B84["B85: NEXT - lines 273 to 275"]
B85["B86: EXIT - lines 277 to 277"]
B86["B87: NO2 - lines 284 to 284"]
B87["B88: instructions - lines 285 to 285"]
B88["B89: ERR3 - lines 288 to 288"]
B89["B90: instructions - lines 289 to 289"]
B80 -->|jump| B5
B82 -->|condition true| B84
B82 -->|condition false| B83
B83 -->|jump| B85
B84 -->|next| B85
B86 -->|condition true| B88
B86 -->|condition false| B87
B87 -->|jump| B90
B88 -->|call| B210
B88 -->|after return| B89
B89 -->|jump| B71
B5["Continue at B6 in section 1"]
B90["Continue at B91 in section 10"]
B210["Continue at B211 in section 22"]
B71["Continue at B72 in section 8"]
```

### B81

```asm
ljmp main0
```

### B82

Resume the interrupted program.

```asm
CLR P3.6
SETB P3.6
RETI
```

### B83

```asm
DJNZ R7,NEXT
```

### B84

```asm
CLR TR1
CLR ET1
SETB P1.3
CLR P3.6
SETB P3.6
SJMP EXIT
```

### B85

```asm
MOV TL1,#0CAH
MOV TH1,#27H
SETB TR1
```

### B86

Resume the interrupted program.

```asm
RETI
```

### B87

```asm
CJNE A,#2,ERR3
```

### B88

```asm
SJMP BACK3
```

### B89

```asm
ACALL ERRORR
```

### B90

```asm
SJMP MEMBERSHIP
```

## Section 10

```mermaid
flowchart TD
B90["B91: BACK3 - lines 293 to 293"]
B91["B92: FLASH1 - lines 296 to 296"]
B92["B93: AG - lines 298 to 299"]
B93["B94: instructions - lines 300 to 301"]
B94["B95: instructions - lines 302 to 302"]
B95["B96: instructions - lines 303 to 303"]
B96["B97: FLASH2 - lines 306 to 306"]
B97["B98: AG1 - lines 308 to 309"]
B98["B99: instructions - lines 310 to 311"]
B99["B100: instructions - lines 312 to 312"]
B91 -->|next| B92
B92 -->|call| B215
B92 -->|after return| B93
B93 -->|call| B215
B93 -->|after return| B94
B94 -->|condition true| B92
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|call| B215
B97 -->|after return| B98
B98 -->|call| B215
B98 -->|after return| B99
B99 -->|condition true| B97
B99 -->|condition false| B100
B215["Continue at B216 in section 22"]
B100["Continue at B101 in section 11"]
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

```asm
MOV R7,#5
```

### B93

```asm
MOV P1,#11101111B
ACALL DELAY
```

### B94

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B95

```asm
DJNZ R7,AG
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
MOV R7,#5
```

### B98

```asm
MOV P1,#11110111B
ACALL DELAY
```

### B99

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B100

```asm
DJNZ R7,AG1
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 313 to 313"]
B101["B102: FLASH3 - lines 316 to 316"]
B102["B103: AG2 - lines 318 to 319"]
B103["B104: instructions - lines 320 to 321"]
B104["B105: instructions - lines 322 to 322"]
B105["B106: instructions - lines 323 to 323"]
B106["B107: WELCOME - lines 331 to 332"]
B107["B108: instructions - lines 333 to 334"]
B108["B109: instructions - lines 335 to 336"]
B109["B110: instructions - lines 337 to 338"]
B101 -->|next| B102
B102 -->|call| B215
B102 -->|after return| B103
B103 -->|call| B215
B103 -->|after return| B104
B104 -->|condition true| B102
B104 -->|condition false| B105
B106 -->|call| B243
B106 -->|after return| B107
B107 -->|call| B249
B107 -->|after return| B108
B108 -->|call| B243
B108 -->|after return| B109
B109 -->|call| B249
B109 -->|after return| B110
B215["Continue at B216 in section 22"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
MOV R7,#5
```

### B103

```asm
MOV P1,#11111011B
ACALL DELAY
```

### B104

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B105

```asm
DJNZ R7,AG2
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
mov dptr, #MESG1
acall wstr
```

### B109

```asm
mov a,#0c0h
acall cmd
```

### B110

```asm
mov dptr, #MESG2
acall wstr
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 339 to 339"]
B111["B112: instructions - lines 340 to 340"]
B112["B113: MENU1 - lines 343 to 343"]
B113["B114: instructions - lines 344 to 344"]
B114["B115: instructions - lines 345 to 346"]
B115["B116: instructions - lines 347 to 348"]
B116["B117: instructions - lines 349 to 350"]
B117["B118: instructions - lines 351 to 352"]
B118["B119: instructions - lines 353 to 353"]
B119["B120: instructions - lines 354 to 354"]
B110 -->|call| B215
B110 -->|after return| B111
B112 -->|call| B215
B112 -->|after return| B113
B113 -->|call| B271
B113 -->|after return| B114
B114 -->|call| B243
B114 -->|after return| B115
B115 -->|call| B249
B115 -->|after return| B116
B116 -->|call| B243
B116 -->|after return| B117
B117 -->|call| B249
B117 -->|after return| B118
B118 -->|call| B215
B118 -->|after return| B119
B119 -->|call| B215
B119 -->|after return| B120
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL DELAY
```

### B112

Return to the instruction following the active call.

```asm
ret
```

### B113

```asm
ACALL DELAY
```

### B114

```asm
ACALL CLEAR
```

### B115

```asm
mov a, #80H
acall cmd
```

### B116

```asm
mov dptr, #MESG3
acall wstr
```

### B117

```asm
mov a,#0c0h
acall cmd
```

### B118

```asm
mov dptr, #MESG4
acall wstr
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
B120["B121: instructions - lines 355 to 355"]
B121["B122: instructions - lines 357 to 358"]
B122["B123: instructions - lines 359 to 360"]
B123["B124: instructions - lines 362 to 363"]
B124["B125: instructions - lines 364 to 364"]
B125["B126: instructions - lines 365 to 366"]
B126["B127: instructions - lines 367 to 370"]
B127["B128: instructions - lines 371 to 371"]
B128["B129: WARMSG - lines 374 to 374"]
B129["B130: instructions - lines 375 to 375"]
B120 -->|call| B271
B120 -->|after return| B121
B121 -->|call| B243
B121 -->|after return| B122
B122 -->|call| B249
B122 -->|after return| B123
B123 -->|call| B243
B123 -->|after return| B124
B124 -->|call| B254
B124 -->|after return| B125
B125 -->|call| B238
B125 -->|after return| B126
B126 -->|call| B215
B126 -->|after return| B127
B128 -->|call| B215
B128 -->|after return| B129
B129 -->|call| B271
B129 -->|after return| B130
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B238["Continue at B239 in section 24"]
B215["Continue at B216 in section 22"]
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
mov dptr, #MESG5
acall wstr
```

### B124

```asm
mov a, #0C3H
acall cmd
```

### B125

```asm
ACALL KEYPAD
```

### B126

```asm
MOV 30H,A
acall wchr
```

### B127

```asm
MOV A,30H
SUBB A,#30H
MOV 30H,A
ACALL DELAY
```

### B128

Return to the instruction following the active call.

```asm
RET
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
ACALL CLEAR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 376 to 377"]
B131["B132: instructions - lines 378 to 379"]
B132["B133: instructions - lines 380 to 381"]
B133["B134: instructions - lines 382 to 383"]
B134["B135: instructions - lines 384 to 384"]
B135["B136: instructions - lines 385 to 385"]
B136["B137: instructions - lines 386 to 386"]
B137["B138: instructions - lines 388 to 389"]
B138["B139: instructions - lines 390 to 391"]
B139["B140: instructions - lines 393 to 394"]
B130 -->|call| B243
B130 -->|after return| B131
B131 -->|call| B249
B131 -->|after return| B132
B132 -->|call| B243
B132 -->|after return| B133
B133 -->|call| B249
B133 -->|after return| B134
B134 -->|call| B215
B134 -->|after return| B135
B135 -->|call| B215
B135 -->|after return| B136
B136 -->|call| B271
B136 -->|after return| B137
B137 -->|call| B243
B137 -->|after return| B138
B138 -->|call| B249
B138 -->|after return| B139
B139 -->|call| B243
B139 -->|after return| B140
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov a, #80H
acall cmd
```

### B132

```asm
mov dptr, #MESG6
acall wstr
```

### B133

```asm
mov a,#0c0h
acall cmd
```

### B134

```asm
mov dptr, #MESG7
acall wstr
```

### B135

```asm
ACALL DELAY
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
mov dptr, #MESG8
acall wstr
```

### B140

```asm
mov a, #0C3H
acall cmd
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 395 to 395"]
B141["B142: instructions - lines 396 to 397"]
B142["B143: instructions - lines 398 to 401"]
B143["B144: instructions - lines 402 to 402"]
B144["B145: MAIMSG - lines 405 to 405"]
B145["B146: instructions - lines 406 to 406"]
B146["B147: instructions - lines 407 to 408"]
B147["B148: instructions - lines 409 to 410"]
B148["B149: instructions - lines 411 to 412"]
B149["B150: instructions - lines 413 to 414"]
B140 -->|call| B254
B140 -->|after return| B141
B141 -->|call| B238
B141 -->|after return| B142
B142 -->|call| B215
B142 -->|after return| B143
B144 -->|call| B215
B144 -->|after return| B145
B145 -->|call| B271
B145 -->|after return| B146
B146 -->|call| B243
B146 -->|after return| B147
B147 -->|call| B249
B147 -->|after return| B148
B148 -->|call| B243
B148 -->|after return| B149
B149 -->|call| B249
B149 -->|after return| B150
B254["Continue at B255 in section 26"]
B238["Continue at B239 in section 24"]
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL KEYPAD
```

### B142

```asm
MOV 31H,A
acall wchr
```

### B143

```asm
MOV A,31H
SUBB A,#30H
MOV 31H,A
ACALL DELAY
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
ACALL DELAY
```

### B146

```asm
ACALL CLEAR
```

### B147

```asm
mov a, #80H
acall cmd
```

### B148

```asm
mov dptr, #MESG9
acall wstr
```

### B149

```asm
mov a,#0c0h
acall cmd
```

### B150

```asm
mov dptr, #MESG10
acall wstr
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 415 to 415"]
B151["B152: instructions - lines 416 to 416"]
B152["B153: instructions - lines 417 to 417"]
B153["B154: instructions - lines 419 to 420"]
B154["B155: instructions - lines 421 to 422"]
B155["B156: instructions - lines 424 to 425"]
B156["B157: instructions - lines 426 to 426"]
B157["B158: instructions - lines 427 to 428"]
B158["B159: instructions - lines 429 to 432"]
B159["B160: instructions - lines 434 to 434"]
B150 -->|call| B215
B150 -->|after return| B151
B151 -->|call| B215
B151 -->|after return| B152
B152 -->|call| B271
B152 -->|after return| B153
B153 -->|call| B243
B153 -->|after return| B154
B154 -->|call| B249
B154 -->|after return| B155
B155 -->|call| B243
B155 -->|after return| B156
B156 -->|call| B254
B156 -->|after return| B157
B157 -->|call| B238
B157 -->|after return| B158
B158 -->|call| B215
B158 -->|after return| B159
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B238["Continue at B239 in section 24"]
```

### B151

```asm
ACALL DELAY
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
mov dptr, #MESG8
acall wstr
```

### B156

```asm
mov a, #0C3H
acall cmd
```

### B157

```asm
ACALL KEYPAD
```

### B158

```asm
MOV 32H,A
acall wchr
```

### B159

```asm
MOV A,32H
SUBB A,#30H
MOV 32H,A
ACALL DELAY
```

### B160

Return to the instruction following the active call.

```asm
RET
```

## Section 17

```mermaid
flowchart TD
B160["B161: DELMSG - lines 437 to 437"]
B161["B162: instructions - lines 438 to 438"]
B162["B163: instructions - lines 439 to 440"]
B163["B164: instructions - lines 441 to 442"]
B164["B165: instructions - lines 443 to 444"]
B165["B166: instructions - lines 445 to 446"]
B166["B167: instructions - lines 447 to 447"]
B167["B168: instructions - lines 448 to 448"]
B168["B169: instructions - lines 449 to 449"]
B169["B170: instructions - lines 451 to 452"]
B160 -->|call| B215
B160 -->|after return| B161
B161 -->|call| B271
B161 -->|after return| B162
B162 -->|call| B243
B162 -->|after return| B163
B163 -->|call| B249
B163 -->|after return| B164
B164 -->|call| B243
B164 -->|after return| B165
B165 -->|call| B249
B165 -->|after return| B166
B166 -->|call| B215
B166 -->|after return| B167
B167 -->|call| B215
B167 -->|after return| B168
B168 -->|call| B271
B168 -->|after return| B169
B169 -->|call| B243
B169 -->|after return| B170
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL DELAY
```

### B162

```asm
ACALL CLEAR
```

### B163

```asm
mov a, #80H
acall cmd
```

### B164

```asm
mov dptr, #MESG11
acall wstr
```

### B165

```asm
mov a,#0c0h
acall cmd
```

### B166

```asm
mov dptr, #MESG10
acall wstr
```

### B167

```asm
ACALL DELAY
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
B170["B171: instructions - lines 453 to 454"]
B171["B172: instructions - lines 455 to 456"]
B172["B173: instructions - lines 457 to 457"]
B173["B174: instructions - lines 458 to 459"]
B174["B175: instructions - lines 460 to 463"]
B175["B176: instructions - lines 464 to 464"]
B176["B177: MEMMSG - lines 467 to 467"]
B177["B178: instructions - lines 468 to 468"]
B178["B179: instructions - lines 469 to 470"]
B179["B180: instructions - lines 471 to 472"]
B170 -->|call| B249
B170 -->|after return| B171
B171 -->|call| B243
B171 -->|after return| B172
B172 -->|call| B254
B172 -->|after return| B173
B173 -->|call| B238
B173 -->|after return| B174
B174 -->|call| B215
B174 -->|after return| B175
B176 -->|call| B215
B176 -->|after return| B177
B177 -->|call| B271
B177 -->|after return| B178
B178 -->|call| B243
B178 -->|after return| B179
B179 -->|call| B249
B179 -->|after return| B180
B249["Continue at B250 in section 25"]
B243["Continue at B244 in section 25"]
B254["Continue at B255 in section 26"]
B238["Continue at B239 in section 24"]
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
mov dptr, #MESG8
acall wstr
```

### B172

```asm
mov a, #0C3H
acall cmd
```

### B173

```asm
ACALL KEYPAD
```

### B174

```asm
MOV 33H,A
acall wchr
```

### B175

```asm
MOV A,33H
SUBB A,#30H
MOV 33H,A
ACALL DELAY
```

### B176

Return to the instruction following the active call.

```asm
RET
```

### B177

```asm
ACALL DELAY
```

### B178

```asm
ACALL CLEAR
```

### B179

```asm
mov a, #80H
acall cmd
```

### B180

```asm
mov dptr, #MESG12
acall wstr
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 473 to 474"]
B181["B182: instructions - lines 475 to 476"]
B182["B183: instructions - lines 477 to 477"]
B183["B184: instructions - lines 478 to 478"]
B184["B185: instructions - lines 479 to 479"]
B185["B186: instructions - lines 481 to 482"]
B186["B187: instructions - lines 483 to 484"]
B187["B188: instructions - lines 485 to 486"]
B188["B189: instructions - lines 487 to 487"]
B189["B190: instructions - lines 488 to 489"]
B180 -->|call| B243
B180 -->|after return| B181
B181 -->|call| B249
B181 -->|after return| B182
B182 -->|call| B215
B182 -->|after return| B183
B183 -->|call| B215
B183 -->|after return| B184
B184 -->|call| B271
B184 -->|after return| B185
B185 -->|call| B243
B185 -->|after return| B186
B186 -->|call| B249
B186 -->|after return| B187
B187 -->|call| B243
B187 -->|after return| B188
B188 -->|call| B254
B188 -->|after return| B189
B189 -->|call| B238
B189 -->|after return| B190
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B254["Continue at B255 in section 26"]
B238["Continue at B239 in section 24"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
mov a,#0c0h
acall cmd
```

### B182

```asm
mov dptr, #MESG10
acall wstr
```

### B183

```asm
ACALL DELAY
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
mov dptr, #MESG8
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
MOV 35H,A
acall wchr
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 490 to 493"]
B191["B192: instructions - lines 494 to 494"]
B192["B193: TVNUMB - lines 497 to 497"]
B193["B194: instructions - lines 498 to 498"]
B194["B195: instructions - lines 499 to 500"]
B195["B196: instructions - lines 501 to 502"]
B196["B197: instructions - lines 504 to 505"]
B197["B198: instructions - lines 506 to 506"]
B198["B199: instructions - lines 507 to 508"]
B199["B200: instructions - lines 509 to 512"]
B190 -->|call| B215
B190 -->|after return| B191
B192 -->|call| B215
B192 -->|after return| B193
B193 -->|call| B271
B193 -->|after return| B194
B194 -->|call| B243
B194 -->|after return| B195
B195 -->|call| B249
B195 -->|after return| B196
B196 -->|call| B243
B196 -->|after return| B197
B197 -->|call| B254
B197 -->|after return| B198
B198 -->|call| B238
B198 -->|after return| B199
B199 -->|call| B215
B199 -->|after return| B200
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B254["Continue at B255 in section 26"]
B238["Continue at B239 in section 24"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV A,35H
SUBB A,#30H
MOV 35H,A
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
mov dptr, #MESG13
acall wstr
```

### B197

```asm
mov a, #0C3H
acall cmd
```

### B198

```asm
ACALL KEYPAD
```

### B199

```asm
MOV 34H,A
acall wchr
```

### B200

```asm
MOV A,34H
SUBB A,#30H
MOV 34H,A
ACALL DELAY
```

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 513 to 513"]
B201["B202: PAYMENT - lines 516 to 516"]
B202["B203: instructions - lines 517 to 517"]
B203["B204: instructions - lines 518 to 519"]
B204["B205: instructions - lines 520 to 521"]
B205["B206: instructions - lines 522 to 523"]
B206["B207: instructions - lines 524 to 531"]
B207["B208: instructions - lines 532 to 534"]
B208["B209: instructions - lines 535 to 537"]
B209["B210: instructions - lines 539 to 539"]
B201 -->|call| B215
B201 -->|after return| B202
B202 -->|call| B271
B202 -->|after return| B203
B203 -->|call| B243
B203 -->|after return| B204
B204 -->|call| B249
B204 -->|after return| B205
B205 -->|call| B243
B205 -->|after return| B206
B206 -->|call| B238
B206 -->|after return| B207
B207 -->|call| B238
B207 -->|after return| B208
B208 -->|call| B238
B208 -->|after return| B209
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B238["Continue at B239 in section 24"]
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
mov dptr, #MESG14
acall wstr
```

### B206

```asm
mov a, #0C3H
acall cmd
```

### B207

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

### B208

```asm
MOV A,B
ADD A,#30H
acall wchr
```

### B209

```asm
MOV A,R3
ADD A,#30H
acall wchr
```

### B210

Return to the instruction following the active call.

```asm
RET
```

## Section 22

```mermaid
flowchart TD
B210["B211: ERRORR - lines 542 to 542"]
B211["B212: instructions - lines 543 to 543"]
B212["B213: instructions - lines 544 to 545"]
B213["B214: instructions - lines 546 to 547"]
B214["B215: instructions - lines 548 to 548"]
B215["B216: DELAY - lines 552 to 553"]
B216["B217: instructions - lines 554 to 554"]
B217["B218: REPEAT_AGAIN - lines 558 to 558"]
B218["B219: instructions - lines 559 to 559"]
B219["B220: instructions - lines 560 to 561"]
B210 -->|call| B215
B210 -->|after return| B211
B211 -->|call| B271
B211 -->|after return| B212
B212 -->|call| B243
B212 -->|after return| B213
B213 -->|call| B249
B213 -->|after return| B214
B215 -->|condition true| B215
B215 -->|condition false| B216
B217 -->|call| B215
B217 -->|after return| B218
B218 -->|call| B271
B218 -->|after return| B219
B219 -->|call| B243
B219 -->|after return| B220
B271["Continue at B272 in section 28"]
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
ACALL DELAY
```

### B212

```asm
ACALL CLEAR
```

### B213

```asm
mov a, #80H
acall cmd
```

### B214

```asm
mov dptr, #MESG15
acall wstr
```

### B215

Return to the instruction following the active call.

```asm
RET
```

### B216

```asm
MOV R0, #200
DJNZ R0, $
```

### B217

Return to the instruction following the active call.

```asm
RET
```

### B218

```asm
ACALL DELAY
```

### B219

```asm
ACALL CLEAR
```

### B220

```asm
mov a, #80H
acall cmd
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 562 to 563"]
B221["B222: instructions - lines 564 to 565"]
B222["B223: instructions - lines 566 to 567"]
B223["B224: instructions - lines 568 to 568"]
B224["B225: instructions - lines 569 to 569"]
B225["B226: instructions - lines 570 to 570"]
B226["B227: EXI - lines 572 to 572"]
B227["B228: INT - lines 575 to 575"]
B228["B229: instructions - lines 576 to 576"]
B229["B230: instructions - lines 577 to 577"]
B220 -->|call| B249
B220 -->|after return| B221
B221 -->|call| B243
B221 -->|after return| B222
B222 -->|call| B249
B222 -->|after return| B223
B223 -->|call| B254
B223 -->|after return| B224
B224 -->|condition true| B226
B224 -->|condition false| B225
B225 -->|jump| B8
B227 -->|call| B215
B227 -->|after return| B228
B228 -->|call| B271
B228 -->|after return| B229
B229 -->|call| B215
B229 -->|after return| B230
B249["Continue at B250 in section 25"]
B243["Continue at B244 in section 25"]
B254["Continue at B255 in section 26"]
B8["Continue at B9 in section 1"]
B215["Continue at B216 in section 22"]
B271["Continue at B272 in section 28"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
mov dptr, #MESG17
acall wstr
```

### B222

```asm
mov a, #0C0H
acall cmd
```

### B223

```asm
mov dptr, #MESG18
acall wstr
```

### B224

```asm
ACALL KEYPAD
```

### B225

```asm
CJNE A,#'1',EXI
```

### B226

```asm
LJMP REPEAT
```

### B227

Return to the instruction following the active call.

```asm
RET
```

### B228

```asm
ACALL DELAY
```

### B229

```asm
ACALL CLEAR
```

### B230

```asm
ACALL DELAY
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 578 to 579"]
B231["B232: instructions - lines 580 to 581"]
B232["B233: instructions - lines 583 to 586"]
B233["B234: INLCD - lines 590 to 598"]
B234["B235: instructions - lines 600 to 609"]
B235["B236: instructions - lines 611 to 626"]
B236["B237: instructions - lines 628 to 640"]
B237["B238: instructions - lines 641 to 641"]
B238["B239: WCHR - lines 646 to 650"]
B239["B240: instructions - lines 651 to 651"]
B230 -->|call| B243
B230 -->|after return| B231
B231 -->|call| B249
B231 -->|after return| B232
B233 -->|call| B215
B233 -->|after return| B234
B234 -->|call| B215
B234 -->|after return| B235
B235 -->|call| B215
B235 -->|after return| B236
B236 -->|call| B215
B236 -->|after return| B237
B238 -->|call| B248
B238 -->|after return| B239
B239 -->|call| B215
B239 -->|after return| B240
B243["Continue at B244 in section 25"]
B249["Continue at B250 in section 25"]
B215["Continue at B216 in section 22"]
B248["Continue at B249 in section 25"]
B240["Continue at B241 in section 25"]
```

### B231

```asm
mov a, #80H
acall cmd
```

### B232

```asm
mov dptr, #MESG16
acall wstr
```

### B233

Return to the instruction following the active call.

```asm
CLR P3.6
SETB P3.6
RET
```

### B234

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

### B235

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

### B236

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

### B237

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

### B238

Return to the instruction following the active call.

```asm
RET
```

### B239

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B240

```asm
ACALL DELAY
```

## Section 25

```mermaid
flowchart TD
B240["B241: instructions - lines 652 to 654"]
B241["B242: instructions - lines 655 to 655"]
B242["B243: instructions - lines 656 to 658"]
B243["B244: CMD - lines 661 to 663"]
B244["B245: instructions - lines 664 to 664"]
B245["B246: instructions - lines 665 to 667"]
B246["B247: instructions - lines 668 to 668"]
B247["B248: instructions - lines 669 to 669"]
B248["B249: COMMON - lines 673 to 678"]
B249["B250: WSTR - lines 682 to 682"]
B240 -->|call| B248
B240 -->|after return| B241
B241 -->|call| B215
B241 -->|after return| B242
B243 -->|call| B248
B243 -->|after return| B244
B244 -->|call| B215
B244 -->|after return| B245
B245 -->|call| B248
B245 -->|after return| B246
B246 -->|call| B215
B246 -->|after return| B247
B249 -->|next| B250
B215["Continue at B216 in section 22"]
B250["Continue at B251 in section 26"]
```

### B241

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B242

```asm
ACALL DELAY
```

### B243

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B244

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B245

```asm
ACALL DELAY
```

### B246

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B247

```asm
ACALL DELAY
```

### B248

Return to the instruction following the active call.

```asm
RET
```

### B249

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B250

```asm
PUSH    ACC
```

## Section 26

```mermaid
flowchart TD
B250["B251: CONT1 - lines 684 to 686"]
B251["B252: PRINT - lines 688 to 688"]
B252["B253: instructions - lines 689 to 690"]
B253["B254: EXIT1 - lines 691 to 692"]
B254["B255: KEYPAD - lines 698 to 698"]
B255["B256: K1 - lines 699 to 702"]
B256["B257: K2 - lines 704 to 706"]
B257["B258: instructions - lines 707 to 707"]
B258["B259: OVER1 - lines 709 to 712"]
B259["B260: instructions - lines 713 to 716"]
B250 -->|condition true| B253
B250 -->|condition false| B251
B251 -->|call| B238
B251 -->|after return| B252
B252 -->|jump| B250
B254 -->|next| B255
B255 -->|condition true| B255
B255 -->|condition false| B256
B256 -->|condition true| B258
B256 -->|condition false| B257
B257 -->|jump| B256
B258 -->|condition true| B263
B258 -->|condition false| B259
B259 -->|condition true| B264
B259 -->|condition false| B260
B238["Continue at B239 in section 24"]
B263["Continue at B264 in section 27"]
B264["Continue at B265 in section 27"]
B260["Continue at B261 in section 27"]
```

### B251

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B252

```asm
ACALL    WCHR
```

### B253

```asm
INC DPTR
AJMP    CONT1
```

### B254

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B255

```asm
MOV P0,#01110000B
```

### B256

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B257

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B258

```asm
SJMP K2
```

### B259

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B260

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

## Section 27

```mermaid
flowchart TD
B260["B261: instructions - lines 717 to 720"]
B261["B262: instructions - lines 721 to 724"]
B262["B263: instructions - lines 725 to 725"]
B263["B264: ROW_0 - lines 726 to 727"]
B264["B265: ROW_1 - lines 728 to 729"]
B265["B266: ROW_2 - lines 730 to 731"]
B266["B267: ROW_3 - lines 732 to 732"]
B267["B268: FIND - lines 734 to 734"]
B268["B269: FIND1 - lines 736 to 737"]
B269["B270: instructions - lines 738 to 739"]
B260 -->|condition true| B265
B260 -->|condition false| B261
B261 -->|condition true| B266
B261 -->|condition false| B262
B262 -->|jump| B256
B263 -->|jump| B267
B264 -->|jump| B267
B265 -->|jump| B267
B266 -->|next| B267
B267 -->|next| B268
B268 -->|condition true| B270
B268 -->|condition false| B269
B269 -->|jump| B268
B256["Continue at B257 in section 26"]
B270["Continue at B271 in section 28"]
```

### B261

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B262

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B263

```asm
LJMP K2
```

### B264

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B265

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B266

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B267

```asm
MOV DPTR,#KCODE3
```

### B268

```asm
RLC A
```

### B269

```asm
RLC A
JNC MATCH
```

### B270

```asm
INC DPTR
SJMP FIND1
```

## Section 28

```mermaid
flowchart TD
B270["B271: MATCH - lines 740 to 742"]
B271["B272: CLEAR - lines 745 to 746"]
B272["B273: instructions - lines 747 to 747"]
B273["B274: WAIT - lines 748 to 748"]
B274["B275: instructions - lines 749 to 749"]
B275["B276: instructions - lines 750 to 750"]
B271 -->|call| B243
B271 -->|after return| B272
B272 -->|next| B273
B273 -->|call| B215
B273 -->|after return| B274
B274 -->|condition true| B273
B274 -->|condition false| B275
B243["Continue at B244 in section 25"]
B215["Continue at B216 in section 22"]
```

### B271

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B272

```asm
MOV A,#01H
ACALL CMD
```

### B273

```asm
MOV R7,#14
```

### B274

```asm
ACALL DELAY
```

### B275

```asm
DJNZ R7,WAIT
```

### B276

Return to the instruction following the active call.

```asm
ret
```
