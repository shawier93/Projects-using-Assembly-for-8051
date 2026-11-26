# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 9"]
B2["B3: HERE - lines 12 to 12"]
B3["B4: instructions - lines 13 to 13"]
B4["B5: MAIN - lines 16 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: instructions - lines 19 to 20"]
B7["B8: BEAND2 - lines 23 to 23"]
B8["B9: instructions - lines 24 to 24"]
B9["B10: instructions - lines 25 to 26"]
B0 -->|call| B185
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B74
B2 -->|after return| B3
B3 -->|call| B80
B3 -->|after return| B4
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B59
B5 -->|after return| B6
B6 -->|jump| B15
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B64
B8 -->|after return| B9
B9 -->|jump| B15
B185["Continue at B186 in section 19"]
B74["Continue at B75 in section 8"]
B80["Continue at B81 in section 9"]
B59["Continue at B60 in section 6"]
B15["Continue at B16 in section 2"]
B10["Continue at B11 in section 2"]
B64["Continue at B65 in section 7"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#3
MOV 31H,#2
MOV 32H,#1
MOV 33H,#2
MOV 34H,#2
MOV 35H,#1
MOV 36H,#0
```

### B3

```asm
ACALL WELCOME
```

### B4

```asm
ACALL MENU1
```

### B5

```asm
MOV A,30H
CJNE A,#1,BEAND2
```

### B6

```asm
ACALL FLASH1
```

### B7

```asm
MOV 36H,#63
AJMP WARR
```

### B8

```asm
CJNE A,#2,BEAND3
```

### B9

```asm
ACALL FLASH2
```

### B10

```asm
MOV 36H,#55
AJMP WARR
```

## Section 2

```mermaid
flowchart TD
B10["B11: BEAND3 - lines 29 to 29"]
B11["B12: instructions - lines 30 to 30"]
B12["B13: instructions - lines 31 to 32"]
B13["B14: ERROR - lines 35 to 35"]
B14["B15: instructions - lines 36 to 36"]
B15["B16: WARR - lines 39 to 39"]
B16["B17: instructions - lines 40 to 40"]
B17["B18: instructions - lines 41 to 41"]
B18["B19: instructions - lines 44 to 44"]
B19["B20: instructions - lines 45 to 51"]
B10 -->|condition true| B13
B10 -->|condition false| B11
B11 -->|call| B69
B11 -->|after return| B12
B12 -->|jump| B15
B13 -->|call| B178
B13 -->|after return| B14
B14 -->|jump| B2
B15 -->|call| B22
B15 -->|after return| B16
B16 -->|call| B35
B16 -->|after return| B17
B17 -->|call| B43
B17 -->|after return| B18
B18 -->|call| B160
B18 -->|after return| B19
B19 -->|call| B51
B19 -->|after return| B20
B69["Continue at B70 in section 7"]
B178["Continue at B179 in section 18"]
B2["Continue at B3 in section 1"]
B22["Continue at B23 in section 3"]
B35["Continue at B36 in section 4"]
B43["Continue at B44 in section 5"]
B160["Continue at B161 in section 17"]
B51["Continue at B52 in section 6"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE A,#3,ERROR
```

### B12

```asm
ACALL FLASH3
```

### B13

```asm
MOV 36H,#70
AJMP WARR
```

### B14

```asm
ACALL ERRORR
```

### B15

```asm
SJMP HERE
```

### B16

```asm
ACALL WARRENTLY
```

### B17

```asm
ACALL MAINTANACE
```

### B18

```asm
ACALL DELIVERY
```

### B19

```asm
ACALL TVNUMB
```

### B20

```asm
MOV B,34H
MOV A,36H
MUL AB
MOV 36H,A
ACALL MEMBERSHIP
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 53 to 53"]
B21["B22: EEND - lines 56 to 56"]
B22["B23: WARRENTLY - lines 62 to 62"]
B23["B24: instructions - lines 63 to 64"]
B24["B25: instructions - lines 67 to 68"]
B25["B26: instructions - lines 69 to 72"]
B26["B27: BRAND2 - lines 75 to 75"]
B27["B28: instructions - lines 76 to 79"]
B28["B29: BRAND3 - lines 82 to 85"]
B29["B30: TWOYEAR - lines 89 to 90"]
B20 -->|call| B169
B20 -->|after return| B21
B21 -->|jump| B21
B22 -->|call| B96
B22 -->|after return| B23
B23 -->|condition true| B29
B23 -->|condition false| B24
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B34
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|jump| B34
B28 -->|jump| B34
B29 -->|condition true| B31
B29 -->|condition false| B30
B169["Continue at B170 in section 17"]
B96["Continue at B97 in section 10"]
B34["Continue at B35 in section 4"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL PAYMENT
```

### B22

```asm
SJMP EEND
```

### B23

```asm
ACALL WARMSG
```

### B24

```asm
MOV A,31H
CJNE A,#1,TWOYEAR
```

### B25

```asm
MOV A,30H
CJNE A,#1,BRAND2
```

### B26

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK
```

### B27

```asm
CJNE A,#2,BRAND3
```

### B28

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK
```

### B29

```asm
MOV A,36H
ADD A,#8
MOV 36H,A
SJMP BACK
```

### B30

```asm
MOV A,30H
CJNE A,#1,BRRAND2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 91 to 94"]
B31["B32: BRRAND2 - lines 97 to 97"]
B32["B33: instructions - lines 98 to 101"]
B33["B34: BRRAND3 - lines 104 to 108"]
B34["B35: BACK - lines 110 to 110"]
B35["B36: MAINTANACE - lines 114 to 114"]
B36["B37: instructions - lines 115 to 116"]
B37["B38: instructions - lines 119 to 120"]
B38["B39: instructions - lines 121 to 124"]
B39["B40: BRRANDD2 - lines 127 to 127"]
B30 -->|jump| B34
B31 -->|condition true| B33
B31 -->|condition false| B32
B32 -->|jump| B34
B33 -->|jump| B34
B35 -->|call| B112
B35 -->|after return| B36
B36 -->|condition true| B42
B36 -->|condition false| B37
B37 -->|condition true| B39
B37 -->|condition false| B38
B38 -->|jump| B42
B39 -->|condition true| B41
B39 -->|condition false| B40
B112["Continue at B113 in section 12"]
B42["Continue at B43 in section 5"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B32

```asm
CJNE A,#2,BRRAND3
```

### B33

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK
```

### B34

```asm
MOV 36H,#77
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B35

Return to the instruction following the active call.

```asm
RET
```

### B36

```asm
ACALL MAIMSG
```

### B37

```asm
MOV A,32H
CJNE A,#1,NO
```

### B38

```asm
MOV A,30H
CJNE A,#1,BRRANDD2
```

### B39

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK1
```

### B40

```asm
CJNE A,#2,BRRANDD3
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 128 to 131"]
B41["B42: BRRANDD3 - lines 134 to 137"]
B42["B43: NO - lines 141 to 141"]
B43["B44: DELIVERY - lines 145 to 145"]
B44["B45: instructions - lines 146 to 147"]
B45["B46: instructions - lines 150 to 151"]
B46["B47: instructions - lines 152 to 155"]
B47["B48: BRRANDDD2 - lines 158 to 158"]
B48["B49: instructions - lines 159 to 162"]
B49["B50: BRRANDDD3 - lines 165 to 168"]
B40 -->|jump| B42
B41 -->|jump| B42
B43 -->|call| B128
B43 -->|after return| B44
B44 -->|condition true| B50
B44 -->|condition false| B45
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|jump| B50
B47 -->|condition true| B49
B47 -->|condition false| B48
B48 -->|jump| B50
B49 -->|jump| B50
B128["Continue at B129 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK1
```

### B42

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK1
```

### B43

Return to the instruction following the active call.

```asm
RET
```

### B44

```asm
ACALL DELMSG
```

### B45

```asm
MOV A,33H
CJNE A,#1,NO1
```

### B46

```asm
MOV A,30H
CJNE A,#1,BRRANDDD2
```

### B47

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK2
```

### B48

```asm
CJNE A,#2,BRRANDDD3
```

### B49

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B50

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

## Section 6

```mermaid
flowchart TD
B50["B51: NO1 - lines 172 to 172"]
B51["B52: MEMBERSHIP - lines 176 to 176"]
B52["B53: instructions - lines 177 to 178"]
B53["B54: instructions - lines 181 to 182"]
B54["B55: instructions - lines 183 to 186"]
B55["B56: BRRANDD22 - lines 189 to 189"]
B56["B57: instructions - lines 190 to 193"]
B57["B58: BRRANDD33 - lines 196 to 199"]
B58["B59: NO2 - lines 204 to 204"]
B59["B60: FLASH1 - lines 207 to 207"]
B51 -->|call| B144
B51 -->|after return| B52
B52 -->|condition true| B58
B52 -->|condition false| B53
B53 -->|condition true| B55
B53 -->|condition false| B54
B54 -->|jump| B58
B55 -->|condition true| B57
B55 -->|condition false| B56
B56 -->|jump| B58
B57 -->|jump| B58
B59 -->|next| B60
B144["Continue at B145 in section 15"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

```asm
ACALL MEMMSG
```

### B53

```asm
MOV A,35H
CJNE A,#1,NO2
```

### B54

```asm
MOV A,30H
CJNE A,#1,BRRANDD22
```

### B55

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B56

```asm
CJNE A,#2,BRRANDD33
```

### B57

```asm
MOV A,36H
SUBB A,#17
MOV 36H,A
SJMP BACK3
```

### B58

```asm
MOV A,36H
SUBB A,#22
MOV 36H,A
SJMP BACK3
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
MOV R7,#5
```

## Section 7

```mermaid
flowchart TD
B60["B61: AG - lines 209 to 210"]
B61["B62: instructions - lines 211 to 212"]
B62["B63: instructions - lines 213 to 213"]
B63["B64: instructions - lines 214 to 214"]
B64["B65: FLASH2 - lines 217 to 217"]
B65["B66: AG1 - lines 219 to 220"]
B66["B67: instructions - lines 221 to 222"]
B67["B68: instructions - lines 223 to 223"]
B68["B69: instructions - lines 224 to 224"]
B69["B70: FLASH3 - lines 227 to 227"]
B60 -->|call| B183
B60 -->|after return| B61
B61 -->|call| B183
B61 -->|after return| B62
B62 -->|condition true| B60
B62 -->|condition false| B63
B64 -->|next| B65
B65 -->|call| B183
B65 -->|after return| B66
B66 -->|call| B183
B66 -->|after return| B67
B67 -->|condition true| B65
B67 -->|condition false| B68
B69 -->|next| B70
B183["Continue at B184 in section 19"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV P1,#11101111B
ACALL DELAY
```

### B62

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B63

```asm
DJNZ R7,AG
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
MOV R7,#5
```

### B66

```asm
MOV P1,#11110111B
ACALL DELAY
```

### B67

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B68

```asm
DJNZ R7,AG1
```

### B69

Return to the instruction following the active call.

```asm
RET
```

### B70

```asm
MOV R7,#5
```

## Section 8

```mermaid
flowchart TD
B70["B71: AG2 - lines 229 to 230"]
B71["B72: instructions - lines 231 to 232"]
B72["B73: instructions - lines 233 to 233"]
B73["B74: instructions - lines 234 to 234"]
B74["B75: WELCOME - lines 242 to 243"]
B75["B76: instructions - lines 244 to 245"]
B76["B77: instructions - lines 246 to 247"]
B77["B78: instructions - lines 248 to 249"]
B78["B79: instructions - lines 250 to 250"]
B79["B80: instructions - lines 251 to 251"]
B70 -->|call| B183
B70 -->|after return| B71
B71 -->|call| B183
B71 -->|after return| B72
B72 -->|condition true| B70
B72 -->|condition false| B73
B74 -->|call| B195
B74 -->|after return| B75
B75 -->|call| B201
B75 -->|after return| B76
B76 -->|call| B195
B76 -->|after return| B77
B77 -->|call| B201
B77 -->|after return| B78
B78 -->|call| B183
B78 -->|after return| B79
B183["Continue at B184 in section 19"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
```

### B71

```asm
MOV P1,#11111011B
ACALL DELAY
```

### B72

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B73

```asm
DJNZ R7,AG2
```

### B74

Return to the instruction following the active call.

```asm
RET
```

### B75

```asm
mov a, #80H
acall cmd
```

### B76

```asm
mov dptr, #MESG1
acall wstr
```

### B77

```asm
mov a,#0c0h
acall cmd
```

### B78

```asm
mov dptr, #MESG2
acall wstr
```

### B79

```asm
ACALL DELAY
```

### B80

Return to the instruction following the active call.

```asm
ret
```

## Section 9

```mermaid
flowchart TD
B80["B81: MENU1 - lines 254 to 254"]
B81["B82: instructions - lines 255 to 255"]
B82["B83: instructions - lines 256 to 257"]
B83["B84: instructions - lines 258 to 259"]
B84["B85: instructions - lines 260 to 261"]
B85["B86: instructions - lines 262 to 263"]
B86["B87: instructions - lines 264 to 264"]
B87["B88: instructions - lines 265 to 265"]
B88["B89: instructions - lines 266 to 266"]
B89["B90: instructions - lines 268 to 269"]
B80 -->|call| B183
B80 -->|after return| B81
B81 -->|call| B223
B81 -->|after return| B82
B82 -->|call| B195
B82 -->|after return| B83
B83 -->|call| B201
B83 -->|after return| B84
B84 -->|call| B195
B84 -->|after return| B85
B85 -->|call| B201
B85 -->|after return| B86
B86 -->|call| B183
B86 -->|after return| B87
B87 -->|call| B183
B87 -->|after return| B88
B88 -->|call| B223
B88 -->|after return| B89
B89 -->|call| B195
B89 -->|after return| B90
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL DELAY
```

### B82

```asm
ACALL CLEAR
```

### B83

```asm
mov a, #80H
acall cmd
```

### B84

```asm
mov dptr, #MESG3
acall wstr
```

### B85

```asm
mov a,#0c0h
acall cmd
```

### B86

```asm
mov dptr, #MESG4
acall wstr
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
ACALL CLEAR
```

### B90

```asm
mov a, #80H
acall cmd
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 270 to 271"]
B91["B92: instructions - lines 273 to 274"]
B92["B93: instructions - lines 275 to 275"]
B93["B94: instructions - lines 276 to 277"]
B94["B95: instructions - lines 278 to 281"]
B95["B96: instructions - lines 282 to 282"]
B96["B97: WARMSG - lines 285 to 285"]
B97["B98: instructions - lines 286 to 286"]
B98["B99: instructions - lines 287 to 288"]
B99["B100: instructions - lines 289 to 290"]
B90 -->|call| B201
B90 -->|after return| B91
B91 -->|call| B195
B91 -->|after return| B92
B92 -->|call| B206
B92 -->|after return| B93
B93 -->|call| B190
B93 -->|after return| B94
B94 -->|call| B183
B94 -->|after return| B95
B96 -->|call| B183
B96 -->|after return| B97
B97 -->|call| B223
B97 -->|after return| B98
B98 -->|call| B195
B98 -->|after return| B99
B99 -->|call| B201
B99 -->|after return| B100
B201["Continue at B202 in section 21"]
B195["Continue at B196 in section 20"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov dptr, #MESG5
acall wstr
```

### B92

```asm
mov a, #0C3H
acall cmd
```

### B93

```asm
ACALL KEYPAD
```

### B94

```asm
MOV 30H,A
acall wchr
```

### B95

```asm
MOV A,30H
SUBB A,#30H
MOV 30H,A
ACALL DELAY
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
ACALL DELAY
```

### B98

```asm
ACALL CLEAR
```

### B99

```asm
mov a, #80H
acall cmd
```

### B100

```asm
mov dptr, #MESG6
acall wstr
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 291 to 292"]
B101["B102: instructions - lines 293 to 294"]
B102["B103: instructions - lines 295 to 295"]
B103["B104: instructions - lines 296 to 296"]
B104["B105: instructions - lines 297 to 297"]
B105["B106: instructions - lines 299 to 300"]
B106["B107: instructions - lines 301 to 302"]
B107["B108: instructions - lines 304 to 305"]
B108["B109: instructions - lines 306 to 306"]
B109["B110: instructions - lines 307 to 308"]
B100 -->|call| B195
B100 -->|after return| B101
B101 -->|call| B201
B101 -->|after return| B102
B102 -->|call| B183
B102 -->|after return| B103
B103 -->|call| B183
B103 -->|after return| B104
B104 -->|call| B223
B104 -->|after return| B105
B105 -->|call| B195
B105 -->|after return| B106
B106 -->|call| B201
B106 -->|after return| B107
B107 -->|call| B195
B107 -->|after return| B108
B108 -->|call| B206
B108 -->|after return| B109
B109 -->|call| B190
B109 -->|after return| B110
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov a,#0c0h
acall cmd
```

### B102

```asm
mov dptr, #MESG7
acall wstr
```

### B103

```asm
ACALL DELAY
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
mov dptr, #MESG8
acall wstr
```

### B108

```asm
mov a, #0C3H
acall cmd
```

### B109

```asm
ACALL KEYPAD
```

### B110

```asm
MOV 31H,A
acall wchr
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 309 to 312"]
B111["B112: instructions - lines 313 to 313"]
B112["B113: MAIMSG - lines 316 to 316"]
B113["B114: instructions - lines 317 to 317"]
B114["B115: instructions - lines 318 to 319"]
B115["B116: instructions - lines 320 to 321"]
B116["B117: instructions - lines 322 to 323"]
B117["B118: instructions - lines 324 to 325"]
B118["B119: instructions - lines 326 to 326"]
B119["B120: instructions - lines 327 to 327"]
B110 -->|call| B183
B110 -->|after return| B111
B112 -->|call| B183
B112 -->|after return| B113
B113 -->|call| B223
B113 -->|after return| B114
B114 -->|call| B195
B114 -->|after return| B115
B115 -->|call| B201
B115 -->|after return| B116
B116 -->|call| B195
B116 -->|after return| B117
B117 -->|call| B201
B117 -->|after return| B118
B118 -->|call| B183
B118 -->|after return| B119
B119 -->|call| B183
B119 -->|after return| B120
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A,31H
SUBB A,#30H
MOV 31H,A
ACALL DELAY
```

### B112

Return to the instruction following the active call.

```asm
RET
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
mov dptr, #MESG9
acall wstr
```

### B117

```asm
mov a,#0c0h
acall cmd
```

### B118

```asm
mov dptr, #MESG10
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
B120["B121: instructions - lines 328 to 328"]
B121["B122: instructions - lines 330 to 331"]
B122["B123: instructions - lines 332 to 333"]
B123["B124: instructions - lines 335 to 336"]
B124["B125: instructions - lines 337 to 337"]
B125["B126: instructions - lines 338 to 339"]
B126["B127: instructions - lines 340 to 343"]
B127["B128: instructions - lines 345 to 345"]
B128["B129: DELMSG - lines 348 to 348"]
B129["B130: instructions - lines 349 to 349"]
B120 -->|call| B223
B120 -->|after return| B121
B121 -->|call| B195
B121 -->|after return| B122
B122 -->|call| B201
B122 -->|after return| B123
B123 -->|call| B195
B123 -->|after return| B124
B124 -->|call| B206
B124 -->|after return| B125
B125 -->|call| B190
B125 -->|after return| B126
B126 -->|call| B183
B126 -->|after return| B127
B128 -->|call| B183
B128 -->|after return| B129
B129 -->|call| B223
B129 -->|after return| B130
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B183["Continue at B184 in section 19"]
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
mov dptr, #MESG8
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
MOV 32H,A
acall wchr
```

### B127

```asm
MOV A,32H
SUBB A,#30H
MOV 32H,A
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
B130["B131: instructions - lines 350 to 351"]
B131["B132: instructions - lines 352 to 353"]
B132["B133: instructions - lines 354 to 355"]
B133["B134: instructions - lines 356 to 357"]
B134["B135: instructions - lines 358 to 358"]
B135["B136: instructions - lines 359 to 359"]
B136["B137: instructions - lines 360 to 360"]
B137["B138: instructions - lines 362 to 363"]
B138["B139: instructions - lines 364 to 365"]
B139["B140: instructions - lines 366 to 367"]
B130 -->|call| B195
B130 -->|after return| B131
B131 -->|call| B201
B131 -->|after return| B132
B132 -->|call| B195
B132 -->|after return| B133
B133 -->|call| B201
B133 -->|after return| B134
B134 -->|call| B183
B134 -->|after return| B135
B135 -->|call| B183
B135 -->|after return| B136
B136 -->|call| B223
B136 -->|after return| B137
B137 -->|call| B195
B137 -->|after return| B138
B138 -->|call| B201
B138 -->|after return| B139
B139 -->|call| B195
B139 -->|after return| B140
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov a, #80H
acall cmd
```

### B132

```asm
mov dptr, #MESG11
acall wstr
```

### B133

```asm
mov a,#0c0h
acall cmd
```

### B134

```asm
mov dptr, #MESG10
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
B140["B141: instructions - lines 368 to 368"]
B141["B142: instructions - lines 369 to 370"]
B142["B143: instructions - lines 371 to 374"]
B143["B144: instructions - lines 375 to 375"]
B144["B145: MEMMSG - lines 378 to 378"]
B145["B146: instructions - lines 379 to 379"]
B146["B147: instructions - lines 380 to 381"]
B147["B148: instructions - lines 382 to 383"]
B148["B149: instructions - lines 384 to 385"]
B149["B150: instructions - lines 386 to 387"]
B140 -->|call| B206
B140 -->|after return| B141
B141 -->|call| B190
B141 -->|after return| B142
B142 -->|call| B183
B142 -->|after return| B143
B144 -->|call| B183
B144 -->|after return| B145
B145 -->|call| B223
B145 -->|after return| B146
B146 -->|call| B195
B146 -->|after return| B147
B147 -->|call| B201
B147 -->|after return| B148
B148 -->|call| B195
B148 -->|after return| B149
B149 -->|call| B201
B149 -->|after return| B150
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL KEYPAD
```

### B142

```asm
MOV 33H,A
acall wchr
```

### B143

```asm
MOV A,33H
SUBB A,#30H
MOV 33H,A
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
mov dptr, #MESG12
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
B150["B151: instructions - lines 388 to 388"]
B151["B152: instructions - lines 389 to 389"]
B152["B153: instructions - lines 390 to 390"]
B153["B154: instructions - lines 392 to 393"]
B154["B155: instructions - lines 394 to 395"]
B155["B156: instructions - lines 396 to 397"]
B156["B157: instructions - lines 398 to 398"]
B157["B158: instructions - lines 399 to 400"]
B158["B159: instructions - lines 401 to 404"]
B159["B160: instructions - lines 405 to 405"]
B150 -->|call| B183
B150 -->|after return| B151
B151 -->|call| B183
B151 -->|after return| B152
B152 -->|call| B223
B152 -->|after return| B153
B153 -->|call| B195
B153 -->|after return| B154
B154 -->|call| B201
B154 -->|after return| B155
B155 -->|call| B195
B155 -->|after return| B156
B156 -->|call| B206
B156 -->|after return| B157
B157 -->|call| B190
B157 -->|after return| B158
B158 -->|call| B183
B158 -->|after return| B159
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
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
MOV 35H,A
acall wchr
```

### B159

```asm
MOV A,35H
SUBB A,#30H
MOV 35H,A
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
B160["B161: TVNUMB - lines 408 to 408"]
B161["B162: instructions - lines 409 to 409"]
B162["B163: instructions - lines 410 to 411"]
B163["B164: instructions - lines 412 to 413"]
B164["B165: instructions - lines 415 to 416"]
B165["B166: instructions - lines 417 to 417"]
B166["B167: instructions - lines 418 to 419"]
B167["B168: instructions - lines 420 to 423"]
B168["B169: instructions - lines 424 to 424"]
B169["B170: PAYMENT - lines 427 to 427"]
B160 -->|call| B183
B160 -->|after return| B161
B161 -->|call| B223
B161 -->|after return| B162
B162 -->|call| B195
B162 -->|after return| B163
B163 -->|call| B201
B163 -->|after return| B164
B164 -->|call| B195
B164 -->|after return| B165
B165 -->|call| B206
B165 -->|after return| B166
B166 -->|call| B190
B166 -->|after return| B167
B167 -->|call| B183
B167 -->|after return| B168
B169 -->|call| B183
B169 -->|after return| B170
B183["Continue at B184 in section 19"]
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B206["Continue at B207 in section 21"]
B190["Continue at B191 in section 20"]
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
mov dptr, #MESG13
acall wstr
```

### B165

```asm
mov a, #0C3H
acall cmd
```

### B166

```asm
ACALL KEYPAD
```

### B167

```asm
MOV 34H,A
acall wchr
```

### B168

```asm
MOV A,34H
SUBB A,#30H
MOV 34H,A
ACALL DELAY
```

### B169

Return to the instruction following the active call.

```asm
RET
```

### B170

```asm
ACALL DELAY
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 428 to 428"]
B171["B172: instructions - lines 429 to 430"]
B172["B173: instructions - lines 431 to 432"]
B173["B174: instructions - lines 433 to 434"]
B174["B175: instructions - lines 435 to 442"]
B175["B176: instructions - lines 443 to 445"]
B176["B177: instructions - lines 446 to 448"]
B177["B178: instructions - lines 450 to 450"]
B178["B179: ERRORR - lines 453 to 453"]
B179["B180: instructions - lines 454 to 454"]
B170 -->|call| B223
B170 -->|after return| B171
B171 -->|call| B195
B171 -->|after return| B172
B172 -->|call| B201
B172 -->|after return| B173
B173 -->|call| B195
B173 -->|after return| B174
B174 -->|call| B190
B174 -->|after return| B175
B175 -->|call| B190
B175 -->|after return| B176
B176 -->|call| B190
B176 -->|after return| B177
B178 -->|call| B183
B178 -->|after return| B179
B179 -->|call| B223
B179 -->|after return| B180
B223["Continue at B224 in section 23"]
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
B190["Continue at B191 in section 20"]
B183["Continue at B184 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL CLEAR
```

### B172

```asm
mov a, #80H
acall cmd
```

### B173

```asm
mov dptr, #MESG14
acall wstr
```

### B174

```asm
mov a, #0C3H
acall cmd
```

### B175

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

### B176

```asm
MOV A,B
ADD A,#30H
acall wchr
```

### B177

```asm
MOV A,R3
ADD A,#30H
acall wchr
```

### B178

Return to the instruction following the active call.

```asm
RET
```

### B179

```asm
ACALL DELAY
```

### B180

```asm
ACALL CLEAR
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 455 to 456"]
B181["B182: instructions - lines 457 to 458"]
B182["B183: instructions - lines 459 to 459"]
B183["B184: DELAY - lines 463 to 464"]
B184["B185: instructions - lines 465 to 465"]
B185["B186: INLCD - lines 469 to 477"]
B186["B187: instructions - lines 479 to 488"]
B187["B188: instructions - lines 490 to 505"]
B188["B189: instructions - lines 507 to 519"]
B189["B190: instructions - lines 520 to 520"]
B180 -->|call| B195
B180 -->|after return| B181
B181 -->|call| B201
B181 -->|after return| B182
B183 -->|condition true| B183
B183 -->|condition false| B184
B185 -->|call| B183
B185 -->|after return| B186
B186 -->|call| B183
B186 -->|after return| B187
B187 -->|call| B183
B187 -->|after return| B188
B188 -->|call| B183
B188 -->|after return| B189
B195["Continue at B196 in section 20"]
B201["Continue at B202 in section 21"]
```

### B181

```asm
mov a, #80H
acall cmd
```

### B182

```asm
mov dptr, #MESG15
acall wstr
```

### B183

Return to the instruction following the active call.

```asm
RET
```

### B184

```asm
MOV R0, #200
DJNZ R0, $
```

### B185

Return to the instruction following the active call.

```asm
RET
```

### B186

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

### B187

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

### B188

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

### B189

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

### B190

Return to the instruction following the active call.

```asm
RET
```

## Section 20

```mermaid
flowchart TD
B190["B191: WCHR - lines 525 to 529"]
B191["B192: instructions - lines 530 to 530"]
B192["B193: instructions - lines 531 to 533"]
B193["B194: instructions - lines 534 to 534"]
B194["B195: instructions - lines 535 to 537"]
B195["B196: CMD - lines 540 to 542"]
B196["B197: instructions - lines 543 to 543"]
B197["B198: instructions - lines 544 to 546"]
B198["B199: instructions - lines 547 to 547"]
B199["B200: instructions - lines 548 to 548"]
B190 -->|call| B200
B190 -->|after return| B191
B191 -->|call| B183
B191 -->|after return| B192
B192 -->|call| B200
B192 -->|after return| B193
B193 -->|call| B183
B193 -->|after return| B194
B195 -->|call| B200
B195 -->|after return| B196
B196 -->|call| B183
B196 -->|after return| B197
B197 -->|call| B200
B197 -->|after return| B198
B198 -->|call| B183
B198 -->|after return| B199
B200["Continue at B201 in section 21"]
B183["Continue at B184 in section 19"]
```

### B191

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B192

```asm
ACALL DELAY
```

### B193

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B194

```asm
ACALL DELAY
```

### B195

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B196

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B197

```asm
ACALL DELAY
```

### B198

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B199

```asm
ACALL DELAY
```

### B200

Return to the instruction following the active call.

```asm
RET
```

## Section 21

```mermaid
flowchart TD
B200["B201: COMMON - lines 552 to 557"]
B201["B202: WSTR - lines 561 to 561"]
B202["B203: CONT1 - lines 563 to 565"]
B203["B204: PRINT - lines 567 to 567"]
B204["B205: instructions - lines 568 to 569"]
B205["B206: EXIT1 - lines 570 to 571"]
B206["B207: KEYPAD - lines 577 to 577"]
B207["B208: K1 - lines 578 to 581"]
B208["B209: K2 - lines 583 to 585"]
B209["B210: instructions - lines 586 to 586"]
B201 -->|next| B202
B202 -->|condition true| B205
B202 -->|condition false| B203
B203 -->|call| B190
B203 -->|after return| B204
B204 -->|jump| B202
B206 -->|next| B207
B207 -->|condition true| B207
B207 -->|condition false| B208
B208 -->|condition true| B210
B208 -->|condition false| B209
B209 -->|jump| B208
B190["Continue at B191 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B202

```asm
PUSH    ACC
```

### B203

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B204

```asm
ACALL    WCHR
```

### B205

```asm
INC DPTR
AJMP    CONT1
```

### B206

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B207

```asm
MOV P0,#01110000B
```

### B208

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B209

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B210

```asm
SJMP K2
```

## Section 22

```mermaid
flowchart TD
B210["B211: OVER1 - lines 588 to 591"]
B211["B212: instructions - lines 592 to 595"]
B212["B213: instructions - lines 596 to 599"]
B213["B214: instructions - lines 600 to 603"]
B214["B215: instructions - lines 604 to 604"]
B215["B216: ROW_0 - lines 605 to 606"]
B216["B217: ROW_1 - lines 607 to 608"]
B217["B218: ROW_2 - lines 609 to 610"]
B218["B219: ROW_3 - lines 611 to 611"]
B219["B220: FIND - lines 613 to 613"]
B210 -->|condition true| B215
B210 -->|condition false| B211
B211 -->|condition true| B216
B211 -->|condition false| B212
B212 -->|condition true| B217
B212 -->|condition false| B213
B213 -->|condition true| B218
B213 -->|condition false| B214
B214 -->|jump| B208
B215 -->|jump| B219
B216 -->|jump| B219
B217 -->|jump| B219
B218 -->|next| B219
B219 -->|next| B220
B208["Continue at B209 in section 21"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B212

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B213

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B214

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B215

```asm
LJMP K2
```

### B216

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B217

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B218

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B219

```asm
MOV DPTR,#KCODE3
```

### B220

```asm
RLC A
```

## Section 23

```mermaid
flowchart TD
B220["B221: FIND1 - lines 615 to 616"]
B221["B222: instructions - lines 617 to 618"]
B222["B223: MATCH - lines 619 to 621"]
B223["B224: CLEAR - lines 624 to 625"]
B224["B225: instructions - lines 626 to 626"]
B225["B226: WAIT - lines 627 to 627"]
B226["B227: instructions - lines 628 to 628"]
B227["B228: instructions - lines 629 to 629"]
B220 -->|condition true| B222
B220 -->|condition false| B221
B221 -->|jump| B220
B223 -->|call| B195
B223 -->|after return| B224
B224 -->|next| B225
B225 -->|call| B183
B225 -->|after return| B226
B226 -->|condition true| B225
B226 -->|condition false| B227
B195["Continue at B196 in section 20"]
B183["Continue at B184 in section 19"]
```

### B221

```asm
RLC A
JNC MATCH
```

### B222

```asm
INC DPTR
SJMP FIND1
```

### B223

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B224

```asm
MOV A,#01H
ACALL CMD
```

### B225

```asm
MOV R7,#14
```

### B226

```asm
ACALL DELAY
```

### B227

```asm
DJNZ R7,WAIT
```

### B228

Return to the instruction following the active call.

```asm
ret
```
