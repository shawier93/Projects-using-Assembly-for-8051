# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 4 to 6"]
B1["B2: LOOP - lines 9 to 14"]
B2["B3: instructions - lines 17 to 19"]
B3["B4: LOOP2 - lines 22 to 27"]
B4["B5: instructions - lines 34 to 84"]
B5["B6: instructions - lines 90 to 91"]
B6["B7: instructions - lines 92 to 93"]
B7["B8: instructions - lines 94 to 95"]
B8["B9: instructions - lines 96 to 97"]
B9["B10: instructions - lines 99 to 99"]
B0 -->|next| B1
B1 -->|condition true| B1
B1 -->|condition false| B2
B2 -->|next| B3
B3 -->|condition true| B3
B3 -->|condition false| B4
B4 -->|call| B132
B4 -->|after return| B5
B5 -->|call| B126
B5 -->|after return| B6
B6 -->|call| B144
B6 -->|after return| B7
B7 -->|call| B126
B7 -->|after return| B8
B8 -->|call| B144
B8 -->|after return| B9
B9 -->|call| B109
B9 -->|after return| B10
B132["Continue at B133 in section 14"]
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B109["Continue at B110 in section 11"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
mov r5,#4h
mov r0,#10h
mov dptr,#list2
```

### B2

```asm
clr a
movc a,@a+dptr
mov @r0,a
inc dptr
inc r0
djnz r5,loop
```

### B3

```asm
mov r5,#5h
mov r1,#14h
mov dptr,#list3
```

### B4

```asm
clr a
movc a,@a+dptr
mov @r1,a
inc dptr
inc r1
djnz r5,loop2
```

### B5

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

### B6

```asm
mov A,#80H
acall CMD
```

### B7

```asm
mov   dptr, #welcome_line1
acall wstr
```

### B8

```asm
mov A,#0C0H
acall CMD
```

### B9

```asm
mov   dptr, #welcome_line2
acall wstr
```

### B10

```asm
acall ShortDelay100m
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 100 to 100"]
B11["B12: Q1 - lines 107 to 107"]
B12["B13: instructions - lines 108 to 109"]
B13["B14: instructions - lines 110 to 111"]
B14["B15: instructions - lines 113 to 114"]
B15["B16: READADDITIONANSWER - lines 120 to 120"]
B16["B17: instructions - lines 121 to 121"]
B17["B18: instructions - lines 122 to 122"]
B18["B19: instructions - lines 125 to 131"]
B19["B20: instructions - lines 135 to 140"]
B10 -->|call| B109
B10 -->|after return| B11
B11 -->|call| B137
B11 -->|after return| B12
B12 -->|call| B126
B12 -->|after return| B13
B13 -->|call| B144
B13 -->|after return| B14
B14 -->|call| B126
B14 -->|after return| B15
B15 -->|call| B149
B15 -->|after return| B16
B16 -->|call| B121
B16 -->|after return| B17
B17 -->|call| B109
B17 -->|after return| B18
B18 -->|condition true| B25
B18 -->|condition false| B19
B19 -->|call| B137
B19 -->|after return| B20
B109["Continue at B110 in section 11"]
B137["Continue at B138 in section 14"]
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B149["Continue at B150 in section 15"]
B121["Continue at B122 in section 13"]
B25["Continue at B26 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
acall ShortDelay100m
```

### B12

```asm
acall ClearLCD
```

### B13

```asm
mov A,#80H
acall CMD
```

### B14

```asm
mov   dptr, #LCDQ1
acall wstr
```

### B15

```asm
mov A,#0C0H
acall CMD
```

### B16

```asm
acall keypad
```

### B17

```asm
acall wchr
```

### B18

```asm
acall ShortDelay100m
```

### B19

```asm
subb a,#30h
mov 30h, a
mov a,30h
cjne a,18h, NotCorrectAddition
```

### B20

```asm
mov a,36h
add a,#1
mov 36h,a
acall ClearLCD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 141 to 142"]
B21["B22: instructions - lines 143 to 144"]
B22["B23: instructions - lines 146 to 148"]
B23["B24: instructions - lines 151 to 151"]
B24["B25: instructions - lines 153 to 153"]
B25["B26: NOTCORRECTADDITION - lines 157 to 158"]
B26["B27: instructions - lines 159 to 160"]
B27["B28: instructions - lines 161 to 162"]
B28["B29: instructions - lines 164 to 165"]
B29["B30: instructions - lines 168 to 168"]
B20 -->|call| B126
B20 -->|after return| B21
B21 -->|call| B144
B21 -->|after return| B22
B22 -->|call| B121
B22 -->|after return| B23
B23 -->|call| B106
B23 -->|after return| B24
B24 -->|jump| B31
B25 -->|call| B137
B25 -->|after return| B26
B26 -->|call| B126
B26 -->|after return| B27
B27 -->|call| B144
B27 -->|after return| B28
B28 -->|call| B126
B28 -->|after return| B29
B29 -->|call| B103
B29 -->|after return| B30
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B121["Continue at B122 in section 13"]
B106["Continue at B107 in section 11"]
B31["Continue at B32 in section 4"]
B137["Continue at B138 in section 14"]
B103["Continue at B104 in section 11"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
mov A,#80H
acall CMD
```

### B22

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B23

```asm
mov a,36h
add a,#30h
acall WCHR
```

### B24

```asm
acall GreenLEDFlash
```

### B25

```asm
sjmp Q2
```

### B26

```asm
inc 35h
acall ClearLCD
```

### B27

```asm
mov A,#80H
acall CMD
```

### B28

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B29

```asm
mov A,#0C0H
acall CMD
```

### B30

```asm
acall RedLEDFlash
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 170 to 170"]
B31["B32: Q2 - lines 176 to 176"]
B32["B33: instructions - lines 177 to 178"]
B33["B34: instructions - lines 179 to 180"]
B34["B35: instructions - lines 182 to 183"]
B35["B36: READSUBTRACTIONANSWER - lines 189 to 189"]
B36["B37: instructions - lines 190 to 190"]
B37["B38: instructions - lines 191 to 191"]
B38["B39: instructions - lines 194 to 199"]
B39["B40: instructions - lines 203 to 208"]
B30 -->|jump| B15
B31 -->|call| B137
B31 -->|after return| B32
B32 -->|call| B126
B32 -->|after return| B33
B33 -->|call| B144
B33 -->|after return| B34
B34 -->|call| B126
B34 -->|after return| B35
B35 -->|call| B149
B35 -->|after return| B36
B36 -->|call| B121
B36 -->|after return| B37
B37 -->|call| B109
B37 -->|after return| B38
B38 -->|condition true| B45
B38 -->|condition false| B39
B39 -->|call| B137
B39 -->|after return| B40
B15["Continue at B16 in section 2"]
B137["Continue at B138 in section 14"]
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B149["Continue at B150 in section 15"]
B121["Continue at B122 in section 13"]
B109["Continue at B110 in section 11"]
B45["Continue at B46 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
jmp ReadAdditionAnswer
```

### B32

```asm
acall ClearLCD
```

### B33

```asm
mov A,#80H
acall CMD
```

### B34

```asm
mov   dptr, #LCDQ2
acall wstr
```

### B35

```asm
mov A,#0C0H
acall CMD
```

### B36

```asm
acall keypad
```

### B37

```asm
acall wchr
```

### B38

```asm
acall ShortDelay100m
```

### B39

```asm
subb a,#30h
mov 31h, a
mov a,31h
cjne a,19h,NotCorrectSubt
```

### B40

```asm
mov a,36h
add a,#2
mov 36h,a
acall ClearLCD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 209 to 210"]
B41["B42: instructions - lines 211 to 212"]
B42["B43: instructions - lines 214 to 216"]
B43["B44: instructions - lines 218 to 218"]
B44["B45: instructions - lines 219 to 219"]
B45["B46: NOTCORRECTSUBT - lines 221 to 222"]
B46["B47: instructions - lines 223 to 224"]
B47["B48: instructions - lines 225 to 226"]
B48["B49: instructions - lines 228 to 229"]
B49["B50: instructions - lines 231 to 231"]
B40 -->|call| B126
B40 -->|after return| B41
B41 -->|call| B144
B41 -->|after return| B42
B42 -->|call| B121
B42 -->|after return| B43
B43 -->|call| B106
B43 -->|after return| B44
B44 -->|jump| B51
B45 -->|call| B137
B45 -->|after return| B46
B46 -->|call| B126
B46 -->|after return| B47
B47 -->|call| B144
B47 -->|after return| B48
B48 -->|call| B126
B48 -->|after return| B49
B49 -->|call| B103
B49 -->|after return| B50
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B121["Continue at B122 in section 13"]
B106["Continue at B107 in section 11"]
B51["Continue at B52 in section 6"]
B137["Continue at B138 in section 14"]
B103["Continue at B104 in section 11"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov A,#80H
acall CMD
```

### B42

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B43

```asm
mov a,36h
add a,#30h
acall WCHR
```

### B44

```asm
acall GreenLEDFlash
```

### B45

```asm
sjmp Q3
```

### B46

```asm
inc 35h
acall ClearLCD
```

### B47

```asm
mov A,#80H
acall CMD
```

### B48

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B49

```asm
mov A,#0C0H
acall CMD
```

### B50

```asm
acall RedLEDFlash
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 232 to 232"]
B51["B52: Q3 - lines 237 to 237"]
B52["B53: instructions - lines 238 to 239"]
B53["B54: instructions - lines 240 to 241"]
B54["B55: instructions - lines 243 to 244"]
B55["B56: READMULTIPLICATIONANSWER - lines 250 to 250"]
B56["B57: instructions - lines 251 to 251"]
B57["B58: instructions - lines 255 to 259"]
B58["B59: instructions - lines 260 to 260"]
B59["B60: instructions - lines 261 to 261"]
B50 -->|jump| B35
B51 -->|call| B137
B51 -->|after return| B52
B52 -->|call| B126
B52 -->|after return| B53
B53 -->|call| B144
B53 -->|after return| B54
B54 -->|call| B126
B54 -->|after return| B55
B55 -->|call| B149
B55 -->|after return| B56
B56 -->|call| B121
B56 -->|after return| B57
B57 -->|call| B149
B57 -->|after return| B58
B58 -->|call| B121
B58 -->|after return| B59
B59 -->|call| B109
B59 -->|after return| B60
B35["Continue at B36 in section 4"]
B137["Continue at B138 in section 14"]
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B149["Continue at B150 in section 15"]
B121["Continue at B122 in section 13"]
B109["Continue at B110 in section 11"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
sjmp ReadSubtractionAnswer
```

### B52

```asm
acall ClearLCD
```

### B53

```asm
mov A,#80H
acall CMD
```

### B54

```asm
mov   dptr, #LCDQ3
acall wstr
```

### B55

```asm
mov A,#0C0H
acall CMD
```

### B56

```asm
acall keypad
```

### B57

```asm
acall wchr
```

### B58

```asm
subb a,#30h
mov r6, a
acall keypad
```

### B59

```asm
acall wchr
```

### B60

```asm
acall ShortDelay100m
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 264 to 279"]
B61["B62: instructions - lines 281 to 286"]
B62["B63: instructions - lines 287 to 288"]
B63["B64: instructions - lines 289 to 290"]
B64["B65: instructions - lines 292 to 294"]
B65["B66: instructions - lines 296 to 296"]
B66["B67: instructions - lines 297 to 297"]
B67["B68: NOTCORRECTMULT - lines 299 to 300"]
B68["B69: instructions - lines 301 to 302"]
B69["B70: instructions - lines 303 to 304"]
B60 -->|condition true| B67
B60 -->|condition false| B61
B61 -->|call| B137
B61 -->|after return| B62
B62 -->|call| B126
B62 -->|after return| B63
B63 -->|call| B144
B63 -->|after return| B64
B64 -->|call| B121
B64 -->|after return| B65
B65 -->|call| B106
B65 -->|after return| B66
B66 -->|jump| B73
B67 -->|call| B137
B67 -->|after return| B68
B68 -->|call| B126
B68 -->|after return| B69
B69 -->|call| B144
B69 -->|after return| B70
B137["Continue at B138 in section 14"]
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B121["Continue at B122 in section 13"]
B106["Continue at B107 in section 11"]
B73["Continue at B74 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
subb a,#30h
mov r7, a
mov a, r6
mov b, #10
mul AB
add A,r7
mov 32h,a
mov a, 32h
cjne a,20h,NotCorrectMult
```

### B62

```asm
mov a,36h
add a,#3
mov 36h,a
acall ClearLCD
```

### B63

```asm
mov A,#80H
acall CMD
```

### B64

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B65

```asm
mov a,36h
add a,#30h
acall WCHR
```

### B66

```asm
acall GreenLEDFlash
```

### B67

```asm
sjmp Q4
```

### B68

```asm
inc 35h
acall ClearLCD
```

### B69

```asm
mov A,#80H
acall CMD
```

### B70

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 306 to 307"]
B71["B72: instructions - lines 308 to 308"]
B72["B73: instructions - lines 309 to 309"]
B73["B74: Q4 - lines 315 to 315"]
B74["B75: instructions - lines 316 to 317"]
B75["B76: instructions - lines 318 to 319"]
B76["B77: instructions - lines 322 to 323"]
B77["B78: READDIVISIONANSWER - lines 329 to 329"]
B78["B79: instructions - lines 330 to 330"]
B79["B80: instructions - lines 331 to 331"]
B70 -->|call| B126
B70 -->|after return| B71
B71 -->|call| B103
B71 -->|after return| B72
B72 -->|jump| B55
B73 -->|call| B137
B73 -->|after return| B74
B74 -->|call| B126
B74 -->|after return| B75
B75 -->|call| B144
B75 -->|after return| B76
B76 -->|call| B126
B76 -->|after return| B77
B77 -->|call| B149
B77 -->|after return| B78
B78 -->|call| B121
B78 -->|after return| B79
B79 -->|call| B109
B79 -->|after return| B80
B126["Continue at B127 in section 13"]
B103["Continue at B104 in section 11"]
B55["Continue at B56 in section 6"]
B137["Continue at B138 in section 14"]
B144["Continue at B145 in section 15"]
B149["Continue at B150 in section 15"]
B121["Continue at B122 in section 13"]
B109["Continue at B110 in section 11"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov A,#0C0H
acall CMD
```

### B72

```asm
acall RedLEDFlash
```

### B73

```asm
sjmp ReadMultiplicationAnswer
```

### B74

```asm
acall ClearLCD
```

### B75

```asm
mov A,#80H
acall CMD
```

### B76

```asm
mov   dptr, #LCDQ4
acall wstr
```

### B77

```asm
mov A,#0C0H
acall CMD
```

### B78

```asm
acall keypad
```

### B79

```asm
acall wchr
```

### B80

```asm
acall ShortDelay100m
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 334 to 341"]
B81["B82: instructions - lines 343 to 348"]
B82["B83: instructions - lines 349 to 350"]
B83["B84: instructions - lines 351 to 352"]
B84["B85: instructions - lines 355 to 359"]
B85["B86: instructions - lines 360 to 362"]
B86["B87: instructions - lines 364 to 364"]
B87["B88: instructions - lines 365 to 365"]
B88["B89: NOTCORRECTDIV - lines 367 to 368"]
B89["B90: instructions - lines 369 to 370"]
B80 -->|condition true| B88
B80 -->|condition false| B81
B81 -->|call| B137
B81 -->|after return| B82
B82 -->|call| B126
B82 -->|after return| B83
B83 -->|call| B144
B83 -->|after return| B84
B84 -->|call| B121
B84 -->|after return| B85
B85 -->|call| B121
B85 -->|after return| B86
B86 -->|call| B106
B86 -->|after return| B87
B87 -->|jump| B94
B88 -->|call| B137
B88 -->|after return| B89
B89 -->|call| B126
B89 -->|after return| B90
B137["Continue at B138 in section 14"]
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B121["Continue at B122 in section 13"]
B106["Continue at B107 in section 11"]
B94["Continue at B95 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
subb a,#30h
mov 33h, a
mov a,33h
cjne a,21h,NotCorrectDiv
```

### B82

```asm
mov a,36h
add a,#4
mov 36h,a
acall ClearLCD
```

### B83

```asm
mov A,#80H
acall CMD
```

### B84

```asm
mov   dptr, #ScoreMSG
acall wstr
```

### B85

```asm
mov a,36h
mov b ,#10
div ab
add a,#30h
acall WCHR
```

### B86

```asm
mov a,b
add a,#30h
acall WCHR
```

### B87

```asm
acall GreenLEDFlash
```

### B88

```asm
sjmp LastPrint
```

### B89

```asm
inc 35h
acall ClearLCD
```

### B90

```asm
mov A,#80H
acall CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 371 to 372"]
B91["B92: instructions - lines 374 to 375"]
B92["B93: instructions - lines 376 to 376"]
B93["B94: instructions - lines 377 to 377"]
B94["B95: LASTPRINT - lines 381 to 381"]
B95["B96: instructions - lines 382 to 383"]
B96["B97: instructions - lines 384 to 385"]
B97["B98: instructions - lines 387 to 391"]
B98["B99: instructions - lines 392 to 396"]
B99["B100: instructions - lines 397 to 399"]
B90 -->|call| B144
B90 -->|after return| B91
B91 -->|call| B126
B91 -->|after return| B92
B92 -->|call| B103
B92 -->|after return| B93
B93 -->|jump| B77
B94 -->|call| B137
B94 -->|after return| B95
B95 -->|call| B126
B95 -->|after return| B96
B96 -->|call| B144
B96 -->|after return| B97
B97 -->|call| B121
B97 -->|after return| B98
B98 -->|call| B121
B98 -->|after return| B99
B99 -->|call| B121
B99 -->|after return| B100
B144["Continue at B145 in section 15"]
B126["Continue at B127 in section 13"]
B103["Continue at B104 in section 11"]
B77["Continue at B78 in section 8"]
B137["Continue at B138 in section 14"]
B121["Continue at B122 in section 13"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov   dptr, #WrongAnswerMSG
acall wstr
```

### B92

```asm
mov A,#0C0H
acall CMD
```

### B93

```asm
acall RedLEDFlash
```

### B94

```asm
sjmp ReadDivisionAnswer
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
mov   dptr, #MistakesMSG
acall wstr
```

### B98

```asm
mov a, 35h
mov b, #100
div ab
add a, #30H
acall WCHR
```

### B99

```asm
mov a, b
mov b, #10
div ab
add a, #30H
acall WCHR
```

### B100

```asm
mov a,b
add a, #30H
acall WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 402 to 403"]
B101["B102: instructions - lines 404 to 405"]
B102["B103: FINISH - lines 407 to 407"]
B103["B104: REDLEDFLASH - lines 412 to 413"]
B104["B105: instructions - lines 414 to 415"]
B105["B106: instructions - lines 416 to 416"]
B106["B107: GREENLEDFLASH - lines 420 to 421"]
B107["B108: instructions - lines 422 to 423"]
B108["B109: instructions - lines 424 to 424"]
B109["B110: SHORTDELAY100M - lines 427 to 427"]
B100 -->|call| B126
B100 -->|after return| B101
B101 -->|call| B144
B101 -->|after return| B102
B102 -->|jump| B102
B103 -->|call| B114
B103 -->|after return| B104
B104 -->|call| B114
B104 -->|after return| B105
B106 -->|call| B114
B106 -->|after return| B107
B107 -->|call| B114
B107 -->|after return| B108
B109 -->|next| B110
B126["Continue at B127 in section 13"]
B144["Continue at B145 in section 15"]
B114["Continue at B115 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov A,#0C0H
acall CMD
```

### B102

```asm
mov   dptr, #GameOverMSG
acall wstr
```

### B103

```asm
sjmp Finish
```

### B104

```asm
clr p1.0
acall DelayOf2Sec
```

### B105

```asm
setb p1.0
acall DelayOf2Sec
```

### B106

Return to the instruction following the active call.

```asm
ret
```

### B107

```asm
clr p1.2
acall DelayOf2Sec
```

### B108

```asm
setb p1.2
acall DelayOf2Sec
```

### B109

Return to the instruction following the active call.

```asm
ret
```

### B110

```asm
mov r4,#200
```

## Section 12

```mermaid
flowchart TD
B110["B111: Y2 - lines 428 to 428"]
B111["B112: Y1 - lines 429 to 429"]
B112["B113: instructions - lines 430 to 430"]
B113["B114: instructions - lines 431 to 431"]
B114["B115: DELAYOF2SEC - lines 434 to 434"]
B115["B116: X3 - lines 435 to 435"]
B116["B117: X2 - lines 436 to 436"]
B117["B118: X1 - lines 437 to 437"]
B118["B119: instructions - lines 438 to 438"]
B119["B120: instructions - lines 439 to 439"]
B110 -->|next| B111
B111 -->|condition true| B111
B111 -->|condition false| B112
B112 -->|condition true| B110
B112 -->|condition false| B113
B114 -->|next| B115
B115 -->|next| B116
B116 -->|next| B117
B117 -->|condition true| B117
B117 -->|condition false| B118
B118 -->|condition true| B116
B118 -->|condition false| B119
B119 -->|condition true| B115
B119 -->|condition false| B120
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov r5,#250
```

### B112

```asm
djnz r5,y1
```

### B113

```asm
djnz r4,y2
```

### B114

Return to the instruction following the active call.

```asm
ret
```

### B115

```asm
mov r3,#20
```

### B116

```asm
mov r4,#200
```

### B117

```asm
mov r5,#250
```

### B118

```asm
djnz r5,x1
```

### B119

```asm
djnz r4,x2
```

### B120

```asm
djnz r3,x3
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 440 to 440"]
B121["B122: WCHR - lines 449 to 454"]
B122["B123: instructions - lines 455 to 455"]
B123["B124: instructions - lines 456 to 458"]
B124["B125: instructions - lines 459 to 459"]
B125["B126: instructions - lines 460 to 462"]
B126["B127: CMD - lines 466 to 468"]
B127["B128: instructions - lines 469 to 469"]
B128["B129: instructions - lines 470 to 472"]
B129["B130: instructions - lines 473 to 473"]
B121 -->|call| B131
B121 -->|after return| B122
B122 -->|call| B142
B122 -->|after return| B123
B123 -->|call| B131
B123 -->|after return| B124
B124 -->|call| B142
B124 -->|after return| B125
B126 -->|call| B131
B126 -->|after return| B127
B127 -->|call| B142
B127 -->|after return| B128
B128 -->|call| B131
B128 -->|after return| B129
B129 -->|call| B142
B129 -->|after return| B130
B131["Continue at B132 in section 14"]
B142["Continue at B143 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
ret
```

### B122

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B123

```asm
ACALL LDELAY
```

### B124

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B125

```asm
ACALL LDELAY
```

### B126

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B127

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B128

```asm
ACALL LDELAY
```

### B129

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B130

```asm
ACALL LDELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 474 to 474"]
B131["B132: COMMON - lines 477 to 482"]
B132["B133: INLCD - lines 485 to 492"]
B133["B134: instructions - lines 493 to 501"]
B134["B135: instructions - lines 502 to 514"]
B135["B136: instructions - lines 515 to 525"]
B136["B137: instructions - lines 526 to 526"]
B137["B138: CLEARLCD - lines 529 to 530"]
B138["B139: instructions - lines 531 to 531"]
B139["B140: WAIT11 - lines 532 to 532"]
B132 -->|call| B142
B132 -->|after return| B133
B133 -->|call| B142
B133 -->|after return| B134
B134 -->|call| B142
B134 -->|after return| B135
B135 -->|call| B142
B135 -->|after return| B136
B137 -->|call| B126
B137 -->|after return| B138
B138 -->|next| B139
B139 -->|call| B142
B139 -->|after return| B140
B142["Continue at B143 in section 15"]
B126["Continue at B127 in section 13"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B133

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

### B134

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

### B135

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

### B136

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

### B137

Return to the instruction following the active call.

```asm
RET
```

### B138

```asm
MOV A,#01H
ACALL CMD
```

### B139

```asm
MOV R7,#14
```

### B140

```asm
ACALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 533 to 533"]
B141["B142: instructions - lines 534 to 534"]
B142["B143: LDELAY - lines 537 to 538"]
B143["B144: instructions - lines 539 to 539"]
B144["B145: WSTR - lines 543 to 543"]
B145["B146: CONT1 - lines 545 to 547"]
B146["B147: PRINT - lines 549 to 549"]
B147["B148: instructions - lines 550 to 551"]
B148["B149: EXIT1 - lines 552 to 553"]
B149["B150: KEYPAD - lines 560 to 560"]
B140 -->|condition true| B139
B140 -->|condition false| B141
B142 -->|condition true| B142
B142 -->|condition false| B143
B144 -->|next| B145
B145 -->|condition true| B148
B145 -->|condition false| B146
B146 -->|call| B121
B146 -->|after return| B147
B147 -->|jump| B145
B149 -->|next| B150
B139["Continue at B140 in section 14"]
B121["Continue at B122 in section 13"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
DJNZ R7,WAIT11
```

### B142

Return to the instruction following the active call.

```asm
RET
```

### B143

```asm
MOV R0, #50
DJNZ R0, $
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
push acc
```

### B146

```asm
clr a
movc a,@a+dptr
JZ exit1
```

### B147

```asm
acall wchr
```

### B148

```asm
inc dptr
ajmp cont1
```

### B149

Return to the instruction following the active call.

```asm
pop acc
ret
```

### B150

```asm
MOV P0,#11110000B
```

## Section 16

```mermaid
flowchart TD
B150["B151: K1 - lines 564 to 576"]
B151["B152: K2 - lines 580 to 580"]
B152["B153: instructions - lines 581 to 590"]
B153["B154: instructions - lines 593 to 593"]
B154["B155: OVER - lines 600 to 600"]
B155["B156: instructions - lines 601 to 610"]
B156["B157: instructions - lines 612 to 612"]
B157["B158: OVER1 - lines 619 to 630"]
B158["B159: instructions - lines 633 to 645"]
B159["B160: instructions - lines 648 to 659"]
B150 -->|condition true| B150
B150 -->|condition false| B151
B151 -->|call| B170
B151 -->|after return| B152
B152 -->|condition true| B154
B152 -->|condition false| B153
B153 -->|jump| B151
B154 -->|call| B170
B154 -->|after return| B155
B155 -->|condition true| B157
B155 -->|condition false| B156
B156 -->|jump| B151
B157 -->|condition true| B162
B157 -->|condition false| B158
B158 -->|condition true| B163
B158 -->|condition false| B159
B159 -->|condition true| B164
B159 -->|condition false| B160
B170["Continue at B171 in section 18"]
B162["Continue at B163 in section 17"]
B163["Continue at B164 in section 17"]
B164["Continue at B165 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV P0,#11110000B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B152

```asm
ACALL DELAY
```

### B153

```asm
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B154

```asm
SJMP K2
```

### B155

```asm
ACALL DELAY
```

### B156

```asm
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B157

```asm
SJMP K2
```

### B158

```asm
MOV P0,#11111110B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

### B159

```asm
MOV P0,#11111101B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B160

```asm
MOV P0,#11111011B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 662 to 672"]
B161["B162: instructions - lines 676 to 676"]
B162["B163: ROW_0 - lines 681 to 685"]
B163["B164: ROW_1 - lines 690 to 694"]
B164["B165: ROW_2 - lines 699 to 703"]
B165["B166: ROW_3 - lines 708 to 708"]
B166["B167: FIND - lines 713 to 713"]
B167["B168: FIND1 - lines 721 to 726"]
B168["B169: instructions - lines 730 to 733"]
B169["B170: MATCH - lines 738 to 744"]
B160 -->|condition true| B165
B160 -->|condition false| B161
B161 -->|jump| B151
B162 -->|jump| B166
B163 -->|jump| B166
B164 -->|jump| B166
B165 -->|next| B166
B166 -->|next| B167
B167 -->|condition true| B169
B167 -->|condition false| B168
B168 -->|jump| B167
B151["Continue at B152 in section 16"]
```

### B161

```asm
MOV P0,#11110111B
MOV A,P0
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B162

```asm
LJMP K2
```

### B163

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B164

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B165

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B166

```asm
MOV DPTR,#KCODE3
```

### B167

```asm
SWAP A
```

### B168

```asm
RRC A
JNC MATCH
```

### B169

```asm
INC DPTR
SJMP FIND1
```

### B170

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: DELAY - lines 750 to 755"]
B171["B172: BACK - lines 758 to 758"]
B172["B173: instructions - lines 759 to 763"]
B170 -->|next| B171
B171 -->|condition true| B171
B171 -->|condition false| B172
```

### B171

```asm
MOV   TMOD,#00000001B
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B172

```asm
JNB    TF0,BACK
```

### B173

Return to the instruction following the active call.

```asm
CLR    TR0
CLR    TF0
RET
```
