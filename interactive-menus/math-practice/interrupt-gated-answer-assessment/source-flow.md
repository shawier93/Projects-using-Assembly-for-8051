# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.
- `ORG 0003H` begins at B2.
- `org 0030h` begins at B6.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 5 to 7"]
B2["B3: instructions - lines 8 to 10"]
B3["B4: ELSE - lines 12 to 12"]
B4["B5: EEND - lines 15 to 16"]
B5["B6: START - lines 21 to 29"]
B6["B7: LOOP - lines 33 to 38"]
B7["B8: instructions - lines 43 to 45"]
B8["B9: LOOP2 - lines 48 to 53"]
B9["B10: instructions - lines 60 to 110"]
B0 -->|jump| B5
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B4
B3 -->|next| B4
B5 -->|next| B6
B6 -->|condition true| B6
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|condition true| B8
B8 -->|condition false| B9
B9 -->|call| B158
B9 -->|after return| B10
B158["Continue at B159 in section 16"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ljmp start
```

### B2

```asm
mov 62h,A
MOV A,61H
CJNE A,#0H, ELSE
```

### B3

```asm
MOV A,#1
MOV 61H,A
SJMP EEND
```

### B4

```asm
MOV 61H,#0
```

### B5

Resume the interrupted program.

```asm
MOV A,62H
retI
```

### B6

```asm
MOV R3,#1
SETB IT0
MOV IE,#10000001B
mov 61h,#0h
mov r5,#4h
mov r0,#10h
mov dptr,#list2
```

### B7

```asm
clr a
movc a,@a+dptr
mov @r0,a
inc dptr
inc r0
djnz r5,loop
```

### B8

```asm
mov r5,#5h
mov r1,#14h
mov dptr,#list3
```

### B9

```asm
clr a
movc a,@a+dptr
mov @r1,a
inc dptr
inc r1
djnz r5,loop2
```

### B10

```asm
mov r0,#10h
mov a,@r0
mov r6,a
mov r1,#14h
mov a,@r1
add a,r6
mov 18h,a
inc r0
inc r1
mov a,@r1
mov r6,a
mov a,@r0
subb a,r6
mov 19h,a
inc r0
inc r1
mov a,@r0
mov r6,a
mov a,@r1
mov b,a
mov a,r6
mul ab
mov 20h,a
inc r0
inc r1
mov a,@r0
mov r6,a
mov a,@r1
mov b,a
mov a,r6
div ab
mov 21h,a
mov 35h,#0h
mov 36h,#0h
ACALL INLCD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 116 to 117"]
B11["B12: instructions - lines 118 to 119"]
B12["B13: instructions - lines 120 to 121"]
B13["B14: instructions - lines 122 to 123"]
B14["B15: instructions - lines 125 to 125"]
B15["B16: LOCK - lines 129 to 130"]
B16["B17: Q1 - lines 138 to 138"]
B17["B18: instructions - lines 139 to 140"]
B18["B19: instructions - lines 141 to 142"]
B19["B20: instructions - lines 144 to 145"]
B10 -->|call| B152
B10 -->|after return| B11
B11 -->|call| B170
B11 -->|after return| B12
B12 -->|call| B152
B12 -->|after return| B13
B13 -->|call| B170
B13 -->|after return| B14
B14 -->|call| B135
B14 -->|after return| B15
B15 -->|condition true| B15
B15 -->|condition false| B16
B16 -->|call| B163
B16 -->|after return| B17
B17 -->|call| B152
B17 -->|after return| B18
B18 -->|call| B170
B18 -->|after return| B19
B19 -->|call| B152
B19 -->|after return| B20
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B135["Continue at B136 in section 14"]
B163["Continue at B164 in section 17"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
mov A,#80H
acall CMD
```

### B12

```asm
mov   dptr, #welcome_line1
acall wstr
```

### B13

```asm
mov A,#0C0H
acall CMD
```

### B14

```asm
mov   dptr, #welcome_line2
acall wstr
```

### B15

```asm
acall ShortDelay100m
```

### B16

```asm
MOV A,61H
CJNE A,#1,LOCK
```

### B17

```asm
acall ClearLCD
```

### B18

```asm
mov A,#80H
acall CMD
```

### B19

```asm
mov   dptr, #LCDQ1
acall wstr
```

### B20

```asm
mov A,#0C0H
acall CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: READADDITIONANSWER - lines 151 to 151"]
B21["B22: instructions - lines 152 to 152"]
B22["B23: instructions - lines 153 to 153"]
B23["B24: instructions - lines 155 to 155"]
B24["B25: instructions - lines 157 to 163"]
B25["B26: instructions - lines 165 to 165"]
B26["B27: instructions - lines 167 to 172"]
B27["B28: instructions - lines 173 to 174"]
B28["B29: instructions - lines 175 to 176"]
B29["B30: instructions - lines 177 to 177"]
B20 -->|call| B175
B20 -->|after return| B21
B21 -->|call| B147
B21 -->|after return| B22
B22 -->|call| B135
B22 -->|after return| B23
B23 -->|call| B206
B23 -->|after return| B24
B24 -->|condition true| B33
B24 -->|condition false| B25
B25 -->|call| B206
B25 -->|after return| B26
B26 -->|call| B163
B26 -->|after return| B27
B27 -->|call| B152
B27 -->|after return| B28
B28 -->|call| B170
B28 -->|after return| B29
B29 -->|call| B206
B29 -->|after return| B30
B175["Continue at B176 in section 18"]
B147["Continue at B148 in section 15"]
B135["Continue at B136 in section 14"]
B206["Continue at B207 in section 21"]
B33["Continue at B34 in section 4"]
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
acall keypad
```

### B22

```asm
acall wchr
```

### B23

```asm
acall ShortDelay100m
```

### B24

```asm
ACALL CHECK_INT
```

### B25

```asm
subb a,#30h
mov 30h, a
mov a,30h
cjne a,18h, NotCorrectAddition
```

### B26

```asm
ACALL CHECK_INT
```

### B27

```asm
mov a,36h
add a,#1
mov 36h,a
acall ClearLCD
```

### B28

```asm
mov A,#80H
acall CMD
```

### B29

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B30

```asm
ACALL CHECK_INT
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 178 to 180"]
B31["B32: instructions - lines 183 to 183"]
B32["B33: instructions - lines 185 to 185"]
B33["B34: NOTCORRECTADDITION - lines 188 to 188"]
B34["B35: instructions - lines 189 to 190"]
B35["B36: instructions - lines 191 to 192"]
B36["B37: instructions - lines 193 to 194"]
B37["B38: instructions - lines 196 to 197"]
B38["B39: instructions - lines 200 to 200"]
B39["B40: instructions - lines 202 to 202"]
B30 -->|call| B147
B30 -->|after return| B31
B31 -->|call| B132
B31 -->|after return| B32
B32 -->|jump| B40
B33 -->|call| B206
B33 -->|after return| B34
B34 -->|call| B163
B34 -->|after return| B35
B35 -->|call| B152
B35 -->|after return| B36
B36 -->|call| B170
B36 -->|after return| B37
B37 -->|call| B152
B37 -->|after return| B38
B38 -->|call| B129
B38 -->|after return| B39
B39 -->|jump| B20
B147["Continue at B148 in section 15"]
B132["Continue at B133 in section 14"]
B40["Continue at B41 in section 5"]
B206["Continue at B207 in section 21"]
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B129["Continue at B130 in section 13"]
B20["Continue at B21 in section 3"]
```

### B31

```asm
mov a,36h
add a,#30h
acall WCHR
```

### B32

```asm
acall GreenLEDFlash
```

### B33

```asm
sjmp Q2
```

### B34

```asm
ACALL CHECK_INT
```

### B35

```asm
inc 35h
acall ClearLCD
```

### B36

```asm
mov A,#80H
acall CMD
```

### B37

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B38

```asm
mov A,#0C0H
acall CMD
```

### B39

```asm
acall RedLEDFlash
```

### B40

```asm
jmp ReadAdditionAnswer
```

## Section 5

```mermaid
flowchart TD
B40["B41: Q2 - lines 208 to 208"]
B41["B42: instructions - lines 209 to 210"]
B42["B43: instructions - lines 211 to 212"]
B43["B44: instructions - lines 214 to 215"]
B44["B45: instructions - lines 217 to 217"]
B45["B46: READSUBTRACTIONANSWER - lines 221 to 221"]
B46["B47: instructions - lines 222 to 222"]
B47["B48: instructions - lines 223 to 223"]
B48["B49: instructions - lines 224 to 224"]
B49["B50: instructions - lines 226 to 231"]
B40 -->|call| B163
B40 -->|after return| B41
B41 -->|call| B152
B41 -->|after return| B42
B42 -->|call| B170
B42 -->|after return| B43
B43 -->|call| B152
B43 -->|after return| B44
B44 -->|call| B206
B44 -->|after return| B45
B45 -->|call| B175
B45 -->|after return| B46
B46 -->|call| B147
B46 -->|after return| B47
B47 -->|call| B135
B47 -->|after return| B48
B48 -->|call| B206
B48 -->|after return| B49
B49 -->|condition true| B59
B49 -->|condition false| B50
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B206["Continue at B207 in section 21"]
B175["Continue at B176 in section 18"]
B147["Continue at B148 in section 15"]
B135["Continue at B136 in section 14"]
B59["Continue at B60 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
acall ClearLCD
```

### B42

```asm
mov A,#80H
acall CMD
```

### B43

```asm
mov   dptr, #LCDQ2
acall wstr
```

### B44

```asm
mov A,#0C0H
acall CMD
```

### B45

```asm
ACALL CHECK_INT
```

### B46

```asm
acall keypad
```

### B47

```asm
acall wchr
```

### B48

```asm
acall ShortDelay100m
```

### B49

```asm
ACALL CHECK_INT
```

### B50

```asm
subb a,#30h
mov 31h, a
mov a,31h
cjne a,19h,NotCorrectSubt
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 233 to 233"]
B51["B52: instructions - lines 235 to 238"]
B52["B53: instructions - lines 240 to 240"]
B53["B54: instructions - lines 241 to 242"]
B54["B55: instructions - lines 243 to 244"]
B55["B56: instructions - lines 246 to 248"]
B56["B57: instructions - lines 249 to 249"]
B57["B58: instructions - lines 250 to 250"]
B58["B59: instructions - lines 251 to 251"]
B59["B60: NOTCORRECTSUBT - lines 253 to 254"]
B50 -->|call| B206
B50 -->|after return| B51
B51 -->|call| B206
B51 -->|after return| B52
B52 -->|call| B163
B52 -->|after return| B53
B53 -->|call| B152
B53 -->|after return| B54
B54 -->|call| B170
B54 -->|after return| B55
B55 -->|call| B147
B55 -->|after return| B56
B56 -->|call| B206
B56 -->|after return| B57
B57 -->|call| B132
B57 -->|after return| B58
B58 -->|jump| B66
B59 -->|call| B163
B59 -->|after return| B60
B206["Continue at B207 in section 21"]
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B147["Continue at B148 in section 15"]
B132["Continue at B133 in section 14"]
B66["Continue at B67 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL CHECK_INT
```

### B52

```asm
mov a,36h
add a,#2
mov 36h,a
ACALL CHECK_INT
```

### B53

```asm
acall ClearLCD
```

### B54

```asm
mov A,#80H
acall CMD
```

### B55

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B56

```asm
mov a,36h
add a,#30h
acall WCHR
```

### B57

```asm
ACALL CHECK_INT
```

### B58

```asm
acall GreenLEDFlash
```

### B59

```asm
sjmp Q3
```

### B60

```asm
inc 35h
acall ClearLCD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 255 to 256"]
B61["B62: instructions - lines 257 to 258"]
B62["B63: instructions - lines 260 to 261"]
B63["B64: instructions - lines 262 to 262"]
B64["B65: instructions - lines 263 to 263"]
B65["B66: instructions - lines 264 to 264"]
B66["B67: Q3 - lines 269 to 269"]
B67["B68: instructions - lines 270 to 271"]
B68["B69: instructions - lines 272 to 273"]
B69["B70: instructions - lines 275 to 276"]
B60 -->|call| B152
B60 -->|after return| B61
B61 -->|call| B170
B61 -->|after return| B62
B62 -->|call| B152
B62 -->|after return| B63
B63 -->|call| B206
B63 -->|after return| B64
B64 -->|call| B129
B64 -->|after return| B65
B65 -->|jump| B45
B66 -->|call| B163
B66 -->|after return| B67
B67 -->|call| B152
B67 -->|after return| B68
B68 -->|call| B170
B68 -->|after return| B69
B69 -->|call| B152
B69 -->|after return| B70
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B206["Continue at B207 in section 21"]
B129["Continue at B130 in section 13"]
B45["Continue at B46 in section 5"]
B163["Continue at B164 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov A,#80H
acall CMD
```

### B62

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B63

```asm
mov A,#0C0H
acall CMD
```

### B64

```asm
ACALL CHECK_INT
```

### B65

```asm
acall RedLEDFlash
```

### B66

```asm
sjmp ReadSubtractionAnswer
```

### B67

```asm
acall ClearLCD
```

### B68

```asm
mov A,#80H
acall CMD
```

### B69

```asm
mov   dptr, #LCDQ3
acall wstr
```

### B70

```asm
mov A,#0C0H
acall CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 277 to 277"]
B71["B72: READMULTIPLICATIONANSWER - lines 282 to 282"]
B72["B73: instructions - lines 283 to 283"]
B73["B74: instructions - lines 286 to 286"]
B74["B75: instructions - lines 287 to 291"]
B75["B76: instructions - lines 292 to 292"]
B76["B77: instructions - lines 293 to 293"]
B77["B78: instructions - lines 296 to 304"]
B78["B79: instructions - lines 306 to 311"]
B79["B80: instructions - lines 313 to 316"]
B70 -->|call| B206
B70 -->|after return| B71
B71 -->|call| B175
B71 -->|after return| B72
B72 -->|call| B147
B72 -->|after return| B73
B73 -->|call| B206
B73 -->|after return| B74
B74 -->|call| B175
B74 -->|after return| B75
B75 -->|call| B147
B75 -->|after return| B76
B76 -->|call| B135
B76 -->|after return| B77
B77 -->|call| B206
B77 -->|after return| B78
B78 -->|condition true| B86
B78 -->|condition false| B79
B79 -->|call| B206
B79 -->|after return| B80
B206["Continue at B207 in section 21"]
B175["Continue at B176 in section 18"]
B147["Continue at B148 in section 15"]
B135["Continue at B136 in section 14"]
B86["Continue at B87 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL CHECK_INT
```

### B72

```asm
acall keypad
```

### B73

```asm
acall wchr
```

### B74

```asm
ACALL CHECK_INT
```

### B75

```asm
subb a,#30h
mov r6, a
acall keypad
```

### B76

```asm
acall wchr
```

### B77

```asm
acall ShortDelay100m
```

### B78

```asm
subb a,#30h
mov r7, a
mov a, r6
mov b, #10
mul AB
add A,r7
ACALL CHECK_INT
```

### B79

```asm
mov 32h,a
mov a, 32h
cjne a,20h,NotCorrectMult
```

### B80

```asm
mov a,36h
add a,#3
mov 36h,a
ACALL CHECK_INT
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 318 to 318"]
B81["B82: instructions - lines 319 to 320"]
B82["B83: instructions - lines 321 to 322"]
B83["B84: instructions - lines 324 to 326"]
B84["B85: instructions - lines 328 to 328"]
B85["B86: instructions - lines 329 to 329"]
B86["B87: NOTCORRECTMULT - lines 331 to 332"]
B87["B88: instructions - lines 333 to 334"]
B88["B89: instructions - lines 335 to 336"]
B89["B90: instructions - lines 338 to 339"]
B80 -->|call| B163
B80 -->|after return| B81
B81 -->|call| B152
B81 -->|after return| B82
B82 -->|call| B170
B82 -->|after return| B83
B83 -->|call| B147
B83 -->|after return| B84
B84 -->|call| B132
B84 -->|after return| B85
B85 -->|jump| B93
B86 -->|call| B163
B86 -->|after return| B87
B87 -->|call| B152
B87 -->|after return| B88
B88 -->|call| B170
B88 -->|after return| B89
B89 -->|call| B152
B89 -->|after return| B90
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B147["Continue at B148 in section 15"]
B132["Continue at B133 in section 14"]
B93["Continue at B94 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
acall ClearLCD
```

### B82

```asm
mov A,#80H
acall CMD
```

### B83

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B84

```asm
mov a,36h
add a,#30h
acall WCHR
```

### B85

```asm
acall GreenLEDFlash
```

### B86

```asm
sjmp Q4
```

### B87

```asm
inc 35h
acall ClearLCD
```

### B88

```asm
mov A,#80H
acall CMD
```

### B89

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B90

```asm
mov A,#0C0H
acall CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 340 to 340"]
B91["B92: instructions - lines 341 to 341"]
B92["B93: instructions - lines 342 to 342"]
B93["B94: Q4 - lines 345 to 345"]
B94["B95: instructions - lines 347 to 347"]
B95["B96: instructions - lines 348 to 349"]
B96["B97: instructions - lines 350 to 351"]
B97["B98: instructions - lines 354 to 355"]
B98["B99: READDIVISIONANSWER - lines 360 to 360"]
B99["B100: instructions - lines 361 to 361"]
B90 -->|call| B129
B90 -->|after return| B91
B91 -->|jump| B71
B92 -->|call| B206
B92 -->|after return| B93
B93 -->|call| B206
B93 -->|after return| B94
B94 -->|call| B163
B94 -->|after return| B95
B95 -->|call| B152
B95 -->|after return| B96
B96 -->|call| B170
B96 -->|after return| B97
B97 -->|call| B152
B97 -->|after return| B98
B98 -->|call| B206
B98 -->|after return| B99
B99 -->|call| B175
B99 -->|after return| B100
B129["Continue at B130 in section 13"]
B71["Continue at B72 in section 8"]
B206["Continue at B207 in section 21"]
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B175["Continue at B176 in section 18"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
acall RedLEDFlash
```

### B92

```asm
sjmp ReadMultiplicationAnswer
```

### B93

```asm
ACALL CHECK_INT
```

### B94

```asm
ACALL CHECK_INT
```

### B95

```asm
acall ClearLCD
```

### B96

```asm
mov A,#80H
acall CMD
```

### B97

```asm
mov   dptr, #LCDQ4
acall wstr
```

### B98

```asm
mov A,#0C0H
acall CMD
```

### B99

```asm
ACALL CHECK_INT
```

### B100

```asm
acall keypad
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 362 to 362"]
B101["B102: instructions - lines 363 to 363"]
B102["B103: instructions - lines 366 to 368"]
B103["B104: instructions - lines 372 to 373"]
B104["B105: instructions - lines 375 to 380"]
B105["B106: instructions - lines 381 to 382"]
B106["B107: instructions - lines 383 to 384"]
B107["B108: instructions - lines 385 to 385"]
B108["B109: instructions - lines 387 to 391"]
B109["B110: instructions - lines 392 to 394"]
B100 -->|call| B147
B100 -->|after return| B101
B101 -->|call| B135
B101 -->|after return| B102
B102 -->|call| B206
B102 -->|after return| B103
B103 -->|condition true| B113
B103 -->|condition false| B104
B104 -->|call| B163
B104 -->|after return| B105
B105 -->|call| B152
B105 -->|after return| B106
B106 -->|call| B170
B106 -->|after return| B107
B107 -->|call| B206
B107 -->|after return| B108
B108 -->|call| B147
B108 -->|after return| B109
B109 -->|call| B147
B109 -->|after return| B110
B147["Continue at B148 in section 15"]
B135["Continue at B136 in section 14"]
B206["Continue at B207 in section 21"]
B113["Continue at B114 in section 12"]
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
acall wchr
```

### B102

```asm
acall ShortDelay100m
```

### B103

```asm
subb a,#30h
mov 33h, a
ACALL CHECK_INT
```

### B104

```asm
mov a,33h
cjne a,21h,NotCorrectDiv
```

### B105

```asm
mov a,36h
add a,#4
mov 36h,a
acall ClearLCD
```

### B106

```asm
mov A,#80H
acall CMD
```

### B107

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B108

```asm
ACALL CHECK_INT
```

### B109

```asm
mov a,36h
mov b ,#10
div ab
add a,#30h
acall WCHR
```

### B110

```asm
mov a,b
add a,#30h
acall WCHR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 395 to 395"]
B111["B112: instructions - lines 396 to 396"]
B112["B113: instructions - lines 397 to 397"]
B113["B114: NOTCORRECTDIV - lines 399 to 400"]
B114["B115: instructions - lines 401 to 402"]
B115["B116: instructions - lines 403 to 404"]
B116["B117: instructions - lines 406 to 407"]
B117["B118: instructions - lines 408 to 408"]
B118["B119: instructions - lines 409 to 409"]
B119["B120: LASTPRINT - lines 413 to 413"]
B110 -->|call| B206
B110 -->|after return| B111
B111 -->|call| B132
B111 -->|after return| B112
B112 -->|jump| B119
B113 -->|call| B163
B113 -->|after return| B114
B114 -->|call| B152
B114 -->|after return| B115
B115 -->|call| B170
B115 -->|after return| B116
B116 -->|call| B152
B116 -->|after return| B117
B117 -->|call| B129
B117 -->|after return| B118
B118 -->|jump| B98
B119 -->|call| B163
B119 -->|after return| B120
B206["Continue at B207 in section 21"]
B132["Continue at B133 in section 14"]
B163["Continue at B164 in section 17"]
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B129["Continue at B130 in section 13"]
B98["Continue at B99 in section 10"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL CHECK_INT
```

### B112

```asm
acall GreenLEDFlash
```

### B113

```asm
sjmp LastPrint
```

### B114

```asm
inc 35h
acall ClearLCD
```

### B115

```asm
mov A,#80H
acall CMD
```

### B116

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B117

```asm
mov A,#0C0H
acall CMD
```

### B118

```asm
acall RedLEDFlash
```

### B119

```asm
sjmp ReadDivisionAnswer
```

### B120

```asm
acall ClearLCD
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 414 to 415"]
B121["B122: instructions - lines 416 to 417"]
B122["B123: instructions - lines 419 to 423"]
B123["B124: instructions - lines 424 to 428"]
B124["B125: instructions - lines 429 to 431"]
B125["B126: instructions - lines 432 to 432"]
B126["B127: instructions - lines 434 to 435"]
B127["B128: instructions - lines 436 to 437"]
B128["B129: FINISH - lines 439 to 439"]
B129["B130: REDLEDFLASH - lines 444 to 445"]
B120 -->|call| B152
B120 -->|after return| B121
B121 -->|call| B170
B121 -->|after return| B122
B122 -->|call| B147
B122 -->|after return| B123
B123 -->|call| B147
B123 -->|after return| B124
B124 -->|call| B147
B124 -->|after return| B125
B125 -->|call| B206
B125 -->|after return| B126
B126 -->|call| B152
B126 -->|after return| B127
B127 -->|call| B170
B127 -->|after return| B128
B128 -->|jump| B128
B129 -->|call| B140
B129 -->|after return| B130
B152["Continue at B153 in section 16"]
B170["Continue at B171 in section 18"]
B147["Continue at B148 in section 15"]
B206["Continue at B207 in section 21"]
B140["Continue at B141 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
mov A,#80H
acall CMD
```

### B122

```asm
mov   dptr, #MistakesMSG
acall wstr
```

### B123

```asm
mov a, 35h
mov b, #100
div ab
add a, #30H
acall WCHR
```

### B124

```asm
mov a, b
mov b, #10
div ab
add a, #30H
acall WCHR
```

### B125

```asm
mov a,b
add a, #30H
acall WCHR
```

### B126

```asm
ACALL CHECK_INT
```

### B127

```asm
mov A,#0C0H
acall CMD
```

### B128

```asm
mov   dptr, #GameOverMSG
acall wstr
```

### B129

```asm
sjmp Finish
```

### B130

```asm
clr p1.0
acall DelayOf2Sec
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 446 to 447"]
B131["B132: instructions - lines 448 to 448"]
B132["B133: GREENLEDFLASH - lines 452 to 453"]
B133["B134: instructions - lines 454 to 455"]
B134["B135: instructions - lines 456 to 456"]
B135["B136: SHORTDELAY100M - lines 459 to 459"]
B136["B137: Y2 - lines 460 to 460"]
B137["B138: Y1 - lines 461 to 461"]
B138["B139: instructions - lines 462 to 462"]
B139["B140: instructions - lines 463 to 463"]
B130 -->|call| B140
B130 -->|after return| B131
B132 -->|call| B140
B132 -->|after return| B133
B133 -->|call| B140
B133 -->|after return| B134
B135 -->|next| B136
B136 -->|next| B137
B137 -->|condition true| B137
B137 -->|condition false| B138
B138 -->|condition true| B136
B138 -->|condition false| B139
B140["Continue at B141 in section 15"]
```

### B131

```asm
setb p1.0
acall DelayOf2Sec
```

### B132

Return to the instruction following the active call.

```asm
ret
```

### B133

```asm
clr p1.2
acall DelayOf2Sec
```

### B134

```asm
setb p1.2
acall DelayOf2Sec
```

### B135

Return to the instruction following the active call.

```asm
ret
```

### B136

```asm
mov r4,#20
```

### B137

```asm
mov r5,#250
```

### B138

```asm
djnz r5,y1
```

### B139

```asm
djnz r4,y2
```

### B140

Return to the instruction following the active call.

```asm
ret
```

## Section 15

```mermaid
flowchart TD
B140["B141: DELAYOF2SEC - lines 466 to 466"]
B141["B142: X3 - lines 467 to 467"]
B142["B143: X2 - lines 468 to 468"]
B143["B144: X1 - lines 469 to 469"]
B144["B145: instructions - lines 470 to 470"]
B145["B146: instructions - lines 471 to 471"]
B146["B147: instructions - lines 472 to 472"]
B147["B148: WCHR - lines 481 to 486"]
B148["B149: instructions - lines 487 to 487"]
B149["B150: instructions - lines 488 to 490"]
B140 -->|next| B141
B141 -->|next| B142
B142 -->|next| B143
B143 -->|condition true| B143
B143 -->|condition false| B144
B144 -->|condition true| B142
B144 -->|condition false| B145
B145 -->|condition true| B141
B145 -->|condition false| B146
B147 -->|call| B157
B147 -->|after return| B148
B148 -->|call| B168
B148 -->|after return| B149
B149 -->|call| B157
B149 -->|after return| B150
B157["Continue at B158 in section 16"]
B168["Continue at B169 in section 17"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov r3,#20
```

### B142

```asm
mov r4,#20
```

### B143

```asm
mov r5,#250
```

### B144

```asm
djnz r5,x1
```

### B145

```asm
djnz r4,x2
```

### B146

```asm
djnz r3,x3
```

### B147

Return to the instruction following the active call.

```asm
ret
```

### B148

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B149

```asm
ACALL LDELAY
```

### B150

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 491 to 491"]
B151["B152: instructions - lines 492 to 494"]
B152["B153: CMD - lines 498 to 500"]
B153["B154: instructions - lines 501 to 501"]
B154["B155: instructions - lines 502 to 504"]
B155["B156: instructions - lines 505 to 505"]
B156["B157: instructions - lines 506 to 506"]
B157["B158: COMMON - lines 509 to 514"]
B158["B159: INLCD - lines 517 to 524"]
B159["B160: instructions - lines 525 to 533"]
B150 -->|call| B168
B150 -->|after return| B151
B152 -->|call| B157
B152 -->|after return| B153
B153 -->|call| B168
B153 -->|after return| B154
B154 -->|call| B157
B154 -->|after return| B155
B155 -->|call| B168
B155 -->|after return| B156
B158 -->|call| B168
B158 -->|after return| B159
B159 -->|call| B168
B159 -->|after return| B160
B168["Continue at B169 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL LDELAY
```

### B152

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B153

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B154

```asm
ACALL LDELAY
```

### B155

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B156

```asm
ACALL LDELAY
```

### B157

Return to the instruction following the active call.

```asm
RET
```

### B158

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B159

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

### B160

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

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 534 to 546"]
B161["B162: instructions - lines 547 to 557"]
B162["B163: instructions - lines 558 to 558"]
B163["B164: CLEARLCD - lines 561 to 562"]
B164["B165: instructions - lines 563 to 563"]
B165["B166: WAIT11 - lines 564 to 564"]
B166["B167: instructions - lines 565 to 565"]
B167["B168: instructions - lines 566 to 566"]
B168["B169: LDELAY - lines 569 to 570"]
B169["B170: instructions - lines 571 to 571"]
B160 -->|call| B168
B160 -->|after return| B161
B161 -->|call| B168
B161 -->|after return| B162
B163 -->|call| B152
B163 -->|after return| B164
B164 -->|next| B165
B165 -->|call| B168
B165 -->|after return| B166
B166 -->|condition true| B165
B166 -->|condition false| B167
B168 -->|condition true| B168
B168 -->|condition false| B169
B152["Continue at B153 in section 16"]
```

### B161

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

### B162

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

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
MOV A,#01H
ACALL CMD
```

### B165

```asm
MOV R7,#14
```

### B166

```asm
ACALL LDELAY
```

### B167

```asm
DJNZ R7,WAIT11
```

### B168

Return to the instruction following the active call.

```asm
RET
```

### B169

```asm
MOV R0, #50
DJNZ R0, $
```

### B170

Return to the instruction following the active call.

```asm
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: WSTR - lines 575 to 575"]
B171["B172: CONT1 - lines 577 to 579"]
B172["B173: PRINT - lines 581 to 581"]
B173["B174: instructions - lines 582 to 583"]
B174["B175: EXIT1 - lines 584 to 585"]
B175["B176: KEYPAD - lines 592 to 594"]
B176["B177: K1 - lines 597 to 609"]
B177["B178: instructions - lines 612 to 612"]
B178["B179: K2 - lines 613 to 613"]
B179["B180: instructions - lines 614 to 623"]
B170 -->|next| B171
B171 -->|condition true| B174
B171 -->|condition false| B172
B172 -->|call| B147
B172 -->|after return| B173
B173 -->|jump| B171
B175 -->|call| B206
B175 -->|after return| B176
B176 -->|condition true| B176
B176 -->|condition false| B177
B177 -->|call| B206
B177 -->|after return| B178
B178 -->|call| B203
B178 -->|after return| B179
B179 -->|condition true| B183
B179 -->|condition false| B180
B147["Continue at B148 in section 15"]
B206["Continue at B207 in section 21"]
B203["Continue at B204 in section 21"]
B183["Continue at B184 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
push acc
```

### B172

```asm
clr a
movc a,@a+dptr
JZ exit1
```

### B173

```asm
acall wchr
```

### B174

```asm
inc dptr
ajmp cont1
```

### B175

Return to the instruction following the active call.

```asm
pop acc
ret
```

### B176

```asm
MOV P0,#11110000B
ACALL CHECK_INT
```

### B177

```asm
MOV P0,#11110000B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B178

```asm
ACALL CHECK_INT
```

### B179

```asm
ACALL DELAY
```

### B180

```asm
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 625 to 625"]
B181["B182: instructions - lines 626 to 626"]
B182["B183: instructions - lines 628 to 628"]
B183["B184: OVER - lines 632 to 632"]
B184["B185: instructions - lines 633 to 642"]
B185["B186: instructions - lines 644 to 644"]
B186["B187: OVER1 - lines 651 to 662"]
B187["B188: instructions - lines 665 to 677"]
B188["B189: instructions - lines 680 to 681"]
B189["B190: instructions - lines 683 to 691"]
B180 -->|call| B206
B180 -->|after return| B181
B181 -->|jump| B178
B182 -->|call| B206
B182 -->|after return| B183
B183 -->|call| B203
B183 -->|after return| B184
B184 -->|condition true| B186
B184 -->|condition false| B185
B185 -->|jump| B178
B186 -->|condition true| B192
B186 -->|condition false| B187
B187 -->|condition true| B193
B187 -->|condition false| B188
B188 -->|call| B206
B188 -->|after return| B189
B189 -->|condition true| B195
B189 -->|condition false| B190
B206["Continue at B207 in section 21"]
B178["Continue at B179 in section 18"]
B203["Continue at B204 in section 21"]
B192["Continue at B193 in section 20"]
B193["Continue at B194 in section 20"]
B195["Continue at B196 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL CHECK_INT
```

### B182

```asm
SJMP K2
```

### B183

```asm
ACALL CHECK_INT
```

### B184

```asm
ACALL DELAY
```

### B185

```asm
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B186

```asm
SJMP K2
```

### B187

```asm
MOV P0,#11111110B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B188

```asm
MOV P0,#11111101B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B189

```asm
MOV P0,#11111011B
ACALL CHECK_INT
```

### B190

```asm
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 694 to 704"]
B191["B192: instructions - lines 708 to 708"]
B192["B193: ROW_0 - lines 713 to 717"]
B193["B194: ROW_1 - lines 722 to 726"]
B194["B195: instructions - lines 727 to 727"]
B195["B196: ROW_2 - lines 731 to 735"]
B196["B197: ROW_3 - lines 740 to 740"]
B197["B198: FIND - lines 745 to 745"]
B198["B199: FIND1 - lines 753 to 758"]
B199["B200: instructions - lines 762 to 765"]
B190 -->|condition true| B196
B190 -->|condition false| B191
B191 -->|jump| B178
B192 -->|jump| B197
B193 -->|jump| B197
B194 -->|call| B206
B194 -->|after return| B195
B195 -->|jump| B197
B196 -->|next| B197
B197 -->|next| B198
B198 -->|condition true| B200
B198 -->|condition false| B199
B199 -->|jump| B198
B178["Continue at B179 in section 18"]
B206["Continue at B207 in section 21"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV P0,#11110111B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B192

```asm
LJMP K2
```

### B193

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B194

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B195

```asm
ACALL CHECK_INT
```

### B196

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B197

```asm
MOV DPTR,#KCODE3
```

### B198

```asm
SWAP A
```

### B199

```asm
RRC A
JNC MATCH
```

### B200

```asm
INC DPTR
SJMP FIND1
```

## Section 21

```mermaid
flowchart TD
B200["B201: MATCH - lines 770 to 770"]
B201["B202: instructions - lines 771 to 776"]
B202["B203: instructions - lines 777 to 777"]
B203["B204: DELAY - lines 783 to 788"]
B204["B205: BACK - lines 791 to 791"]
B205["B206: instructions - lines 792 to 796"]
B206["B207: CHECK_INT - lines 799 to 801"]
B207["B208: instructions - lines 802 to 802"]
B208["B209: E - lines 804 to 805"]
B200 -->|call| B206
B200 -->|after return| B201
B201 -->|call| B206
B201 -->|after return| B202
B203 -->|next| B204
B204 -->|condition true| B204
B204 -->|condition false| B205
B206 -->|condition true| B208
B206 -->|condition false| B207
B207 -->|jump| B5
B5["Continue at B6 in section 1"]
```

### B201

```asm
ACALL CHECK_INT
```

### B202

```asm
CLR A
MOVC A,@A+DPTR
ACALL CHECK_INT
```

### B203

Return to the instruction following the active call.

```asm
RET
```

### B204

```asm
MOV   TMOD,#00000001B
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B205

```asm
JNB    TF0,BACK
```

### B206

Return to the instruction following the active call.

```asm
CLR    TR0
CLR    TF0
RET
```

### B207

```asm
MOV 63H,A
MOV A,61H
CJNE A,#0,E
```

### B208

```asm
LJMP START
```

### B209

Return to the instruction following the active call.

```asm
MOV A,63H
RET
```
