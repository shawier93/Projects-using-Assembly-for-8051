# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 17"]
B2["B3: instructions - lines 18 to 19"]
B3["B4: instructions - lines 23 to 24"]
B4["B5: instructions - lines 26 to 27"]
B5["B6: instructions - lines 28 to 28"]
B6["B7: instructions - lines 30 to 31"]
B7["B8: instructions - lines 32 to 33"]
B8["B9: instructions - lines 34 to 34"]
B9["B10: START - lines 39 to 40"]
B0 -->|call| B96
B0 -->|after return| B1
B1 -->|call| B80
B1 -->|after return| B2
B2 -->|call| B80
B2 -->|after return| B3
B3 -->|call| B65
B3 -->|after return| B4
B4 -->|call| B71
B4 -->|after return| B5
B5 -->|call| B108
B5 -->|after return| B6
B6 -->|call| B65
B6 -->|after return| B7
B7 -->|call| B71
B7 -->|after return| B8
B8 -->|call| B108
B8 -->|after return| B9
B9 -->|call| B65
B9 -->|after return| B10
B96["Continue at B97 in section 10"]
B80["Continue at B81 in section 9"]
B65["Continue at B66 in section 7"]
B71["Continue at B72 in section 8"]
B108["Continue at B109 in section 11"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 40H,#5
MOV 41H,#5
MOV 42H,#30
MOV 43H,#30
MOV 44H,#20
MOV 45H,#20
MOV 30H,#2
MOV R2,#1
MOV 31H,#1
MOV 32H,#0
MOV 33H,#0
MOV P1,#00
ACALL DELAY
```

### B3

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B4

```asm
MOV DPTR,#MESG1
ACALL SHOW
```

### B5

```asm
MOV DPTR,#MESG2
ACALL SHOW2
```

### B6

```asm
ACALL WSTR
```

### B7

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B8

```asm
MOV DPTR,#MESG4
ACALL SHOW2
```

### B9

```asm
ACALL WSTR
```

### B10

```asm
MOV DPTR,#MESG5
ACALL SHOW
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 41 to 41"]
B11["B12: instructions - lines 43 to 43"]
B12["B13: instructions - lines 44 to 46"]
B13["B14: instructions - lines 47 to 47"]
B14["B15: instructions - lines 48 to 48"]
B15["B16: instructions - lines 51 to 52"]
B16["B17: instructions - lines 53 to 53"]
B17["B18: instructions - lines 54 to 54"]
B18["B19: NEXT - lines 56 to 56"]
B19["B20: instructions - lines 57 to 57"]
B10 -->|call| B80
B10 -->|after return| B11
B11 -->|call| B71
B11 -->|after return| B12
B12 -->|call| B85
B12 -->|after return| B13
B13 -->|call| B80
B13 -->|after return| B14
B14 -->|call| B80
B14 -->|after return| B15
B15 -->|condition true| B18
B15 -->|condition false| B16
B16 -->|call| B34
B16 -->|after return| B17
B17 -->|jump| B26
B18 -->|condition true| B21
B18 -->|condition false| B19
B19 -->|call| B44
B19 -->|after return| B20
B80["Continue at B81 in section 9"]
B71["Continue at B72 in section 8"]
B85["Continue at B86 in section 9"]
B34["Continue at B35 in section 4"]
B26["Continue at B27 in section 3"]
B21["Continue at B22 in section 3"]
B44["Continue at B45 in section 5"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
ACALL SHOW2
```

### B13

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B14

```asm
ACALL DELAY
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
MOV A,30H
CJNE A,#1,NEXT
```

### B17

```asm
ACALL VIP
```

### B18

```asm
AJMP DISPCOST
```

### B19

```asm
CJNE A,#2,NEXT1
```

### B20

```asm
ACALL ONLINE
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 58 to 58"]
B21["B22: NEXT1 - lines 60 to 60"]
B22["B23: instructions - lines 61 to 61"]
B23["B24: instructions - lines 62 to 62"]
B24["B25: NEXT2 - lines 65 to 65"]
B25["B26: instructions - lines 66 to 66"]
B26["B27: DISPCOST - lines 69 to 70"]
B27["B28: instructions - lines 71 to 71"]
B28["B29: instructions - lines 73 to 73"]
B29["B30: instructions - lines 75 to 87"]
B20 -->|jump| B26
B21 -->|condition true| B24
B21 -->|condition false| B22
B22 -->|call| B54
B22 -->|after return| B23
B23 -->|jump| B26
B24 -->|call| B64
B24 -->|after return| B25
B25 -->|jump| B26
B26 -->|call| B65
B26 -->|after return| B27
B27 -->|call| B80
B27 -->|after return| B28
B28 -->|call| B71
B28 -->|after return| B29
B29 -->|call| B85
B29 -->|after return| B30
B54["Continue at B55 in section 6"]
B64["Continue at B65 in section 7"]
B65["Continue at B66 in section 7"]
B80["Continue at B81 in section 9"]
B71["Continue at B72 in section 8"]
B85["Continue at B86 in section 9"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
AJMP DISPCOST
```

### B22

```asm
CJNE A,#3,NEXT2
```

### B23

```asm
ACALL REGULAR
```

### B24

```asm
AJMP DISPCOST
```

### B25

```asm
ACALL WRONG
```

### B26

```asm
AJMP DISPCOST
```

### B27

```asm
MOV DPTR,#MESG11
ACALL SHOW
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
ACALL SHOW2
```

### B30

```asm
MOV A,32H
MOV B,#10
DIV AB
ADD A,#30H
MOV 52H,A
MOV A,B
ADD A,#30H
MOV 53H,A
MOV A,52H
ACALL WCHR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 88 to 89"]
B31["B32: instructions - lines 90 to 90"]
B32["B33: instructions - lines 91 to 91"]
B33["B34: SJ - lines 93 to 93"]
B34["B35: VIP - lines 98 to 99"]
B35["B36: instructions - lines 100 to 100"]
B36["B37: instructions - lines 102 to 103"]
B37["B38: instructions - lines 104 to 105"]
B38["B39: instructions - lines 106 to 106"]
B39["B40: instructions - lines 110 to 111"]
B30 -->|call| B85
B30 -->|after return| B31
B31 -->|call| B80
B31 -->|after return| B32
B32 -->|call| B80
B32 -->|after return| B33
B33 -->|jump| B33
B34 -->|call| B65
B34 -->|after return| B35
B35 -->|call| B80
B35 -->|after return| B36
B36 -->|call| B65
B36 -->|after return| B37
B37 -->|call| B71
B37 -->|after return| B38
B38 -->|call| B108
B38 -->|after return| B39
B39 -->|condition true| B41
B39 -->|condition false| B40
B85["Continue at B86 in section 9"]
B80["Continue at B81 in section 9"]
B65["Continue at B66 in section 7"]
B71["Continue at B72 in section 8"]
B108["Continue at B109 in section 11"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,53H
ACALL WCHR
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
SJMP SJ
```

### B35

```asm
MOV DPTR,#MESG6
ACALL SHOW
```

### B36

```asm
acall delay
```

### B37

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B38

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B39

```asm
ACALL WSTR
```

### B40

```asm
MOV A,R2
CJNE A,#1,YEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 112 to 115"]
B41["B42: YEAR - lines 118 to 118"]
B42["B43: instructions - lines 119 to 120"]
B43["B44: EEND - lines 123 to 123"]
B44["B45: ONLINE - lines 126 to 127"]
B45["B46: instructions - lines 128 to 128"]
B46["B47: instructions - lines 130 to 131"]
B47["B48: instructions - lines 132 to 133"]
B48["B49: instructions - lines 134 to 134"]
B49["B50: instructions - lines 138 to 139"]
B40 -->|jump| B43
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|next| B43
B44 -->|call| B65
B44 -->|after return| B45
B45 -->|call| B80
B45 -->|after return| B46
B46 -->|call| B65
B46 -->|after return| B47
B47 -->|call| B71
B47 -->|after return| B48
B48 -->|call| B108
B48 -->|after return| B49
B49 -->|condition true| B51
B49 -->|condition false| B50
B65["Continue at B66 in section 7"]
B80["Continue at B81 in section 9"]
B71["Continue at B72 in section 8"]
B108["Continue at B109 in section 11"]
B51["Continue at B52 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#35
MOV 32H,A
SJMP EEND
```

### B42

```asm
CJNE A,#2, EEND
```

### B43

```asm
MOV A,#99
MOV 32H,A
```

### B44

Return to the instruction following the active call.

```asm
RET
```

### B45

```asm
MOV DPTR,#MESG7
ACALL SHOW
```

### B46

```asm
acall delay
```

### B47

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B48

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B49

```asm
ACALL WSTR
```

### B50

```asm
MOV A,R2
CJNE A,#1,YEAR1
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 140 to 143"]
B51["B52: YEAR1 - lines 146 to 146"]
B52["B53: instructions - lines 147 to 148"]
B53["B54: END1 - lines 152 to 152"]
B54["B55: REGULAR - lines 155 to 156"]
B55["B56: instructions - lines 157 to 157"]
B56["B57: instructions - lines 159 to 160"]
B57["B58: instructions - lines 161 to 162"]
B58["B59: instructions - lines 163 to 163"]
B59["B60: instructions - lines 166 to 167"]
B50 -->|jump| B53
B51 -->|condition true| B53
B51 -->|condition false| B52
B52 -->|next| B53
B54 -->|call| B65
B54 -->|after return| B55
B55 -->|call| B80
B55 -->|after return| B56
B56 -->|call| B65
B56 -->|after return| B57
B57 -->|call| B71
B57 -->|after return| B58
B58 -->|call| B108
B58 -->|after return| B59
B59 -->|condition true| B61
B59 -->|condition false| B60
B65["Continue at B66 in section 7"]
B80["Continue at B81 in section 9"]
B71["Continue at B72 in section 8"]
B108["Continue at B109 in section 11"]
B61["Continue at B62 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#5
MOV 32H,A
SJMP END1
```

### B52

```asm
CJNE A,#2, END1
```

### B53

```asm
MOV A,#30
MOV 32H,A
```

### B54

Return to the instruction following the active call.

```asm
RET
```

### B55

```asm
MOV DPTR,#MESG8
ACALL SHOW
```

### B56

```asm
acall delay
```

### B57

```asm
MOV DPTR,#MESG3
ACALL SHOW
```

### B58

```asm
MOV DPTR,#MESG9
ACALL SHOW2
```

### B59

```asm
ACALL WSTR
```

### B60

```asm
MOV A,R2
CJNE A,#1,YEAR2
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 168 to 170"]
B61["B62: YEAR2 - lines 173 to 173"]
B62["B63: instructions - lines 174 to 176"]
B63["B64: END2 - lines 180 to 180"]
B64["B65: WRONG - lines 183 to 185"]
B65["B66: SHOW - lines 188 to 188"]
B66["B67: instructions - lines 189 to 189"]
B67["B68: instructions - lines 190 to 191"]
B68["B69: instructions - lines 193 to 193"]
B69["B70: instructions - lines 194 to 194"]
B60 -->|jump| B63
B61 -->|condition true| B63
B61 -->|condition false| B62
B62 -->|next| B63
B65 -->|call| B103
B65 -->|after return| B66
B66 -->|call| B80
B66 -->|after return| B67
B67 -->|call| B90
B67 -->|after return| B68
B68 -->|call| B108
B68 -->|after return| B69
B69 -->|call| B80
B69 -->|after return| B70
B103["Continue at B104 in section 11"]
B80["Continue at B81 in section 9"]
B90["Continue at B91 in section 10"]
B108["Continue at B109 in section 11"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#10
MOV 32H,A
SJMP END2
```

### B62

```asm
CJNE A,#2, END2
```

### B63

```asm
MOV A,#70
MOV 32H,A
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

Return to the instruction following the active call.

```asm
MOV 32H,#0
MOV 33H,#0
RET
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
MOV A,#80H
ACALL CMD
```

### B69

```asm
ACALL WSTR
```

### B70

```asm
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 196 to 196"]
B71["B72: SHOW2 - lines 199 to 200"]
B72["B73: instructions - lines 201 to 201"]
B73["B74: instructions - lines 202 to 202"]
B74["B75: instructions - lines 203 to 203"]
B75["B76: instructions - lines 204 to 204"]
B76["B77: SHOW3 - lines 207 to 208"]
B77["B78: instructions - lines 209 to 209"]
B78["B79: instructions - lines 210 to 210"]
B79["B80: instructions - lines 211 to 211"]
B71 -->|call| B90
B71 -->|after return| B72
B72 -->|call| B80
B72 -->|after return| B73
B73 -->|call| B80
B73 -->|after return| B74
B74 -->|call| B80
B74 -->|after return| B75
B76 -->|call| B90
B76 -->|after return| B77
B77 -->|call| B80
B77 -->|after return| B78
B78 -->|call| B80
B78 -->|after return| B79
B90["Continue at B91 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
MOV A,#0C0H
ACALL CMD
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
ACALL DELAY
```

### B75

```asm
ACALL DELAY
```

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
MOV A,#0C5H
ACALL CMD
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
ACALL DELAY
```

### B80

Return to the instruction following the active call.

```asm
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: DELAY - lines 213 to 213"]
B81["B82: H1 - lines 214 to 214"]
B82["B83: HH - lines 215 to 215"]
B83["B84: instructions - lines 216 to 216"]
B84["B85: instructions - lines 217 to 217"]
B85["B86: WCHR - lines 221 to 225"]
B86["B87: instructions - lines 226 to 226"]
B87["B88: instructions - lines 227 to 229"]
B88["B89: instructions - lines 230 to 230"]
B89["B90: instructions - lines 231 to 233"]
B80 -->|next| B81
B81 -->|next| B82
B82 -->|condition true| B82
B82 -->|condition false| B83
B83 -->|condition true| B81
B83 -->|condition false| B84
B85 -->|call| B95
B85 -->|after return| B86
B86 -->|call| B101
B86 -->|after return| B87
B87 -->|call| B95
B87 -->|after return| B88
B88 -->|call| B101
B88 -->|after return| B89
B95["Continue at B96 in section 10"]
B101["Continue at B102 in section 11"]
```

### B81

```asm
MOV R0, #250
```

### B82

```asm
MOV R1,#20
```

### B83

```asm
DJNZ R1, HH
```

### B84

```asm
DJNZ R0,H1
```

### B85

Return to the instruction following the active call.

```asm
RET
```

### B86

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B87

```asm
ACALL LDELAY
```

### B88

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B89

```asm
ACALL LDELAY
```

### B90

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: CMD - lines 236 to 238"]
B91["B92: instructions - lines 239 to 239"]
B92["B93: instructions - lines 240 to 242"]
B93["B94: instructions - lines 243 to 243"]
B94["B95: instructions - lines 244 to 244"]
B95["B96: COMMON - lines 247 to 252"]
B96["B97: INLCD - lines 255 to 262"]
B97["B98: instructions - lines 263 to 271"]
B98["B99: instructions - lines 272 to 284"]
B99["B100: instructions - lines 285 to 295"]
B90 -->|call| B95
B90 -->|after return| B91
B91 -->|call| B101
B91 -->|after return| B92
B92 -->|call| B95
B92 -->|after return| B93
B93 -->|call| B101
B93 -->|after return| B94
B96 -->|call| B101
B96 -->|after return| B97
B97 -->|call| B101
B97 -->|after return| B98
B98 -->|call| B101
B98 -->|after return| B99
B99 -->|call| B101
B99 -->|after return| B100
B101["Continue at B102 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B92

```asm
ACALL LDELAY
```

### B93

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B94

```asm
ACALL LDELAY
```

### B95

Return to the instruction following the active call.

```asm
RET
```

### B96

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B97

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

### B98

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

### B99

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

### B100

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

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 296 to 296"]
B101["B102: LDELAY - lines 299 to 300"]
B102["B103: instructions - lines 301 to 301"]
B103["B104: CLEAR - lines 304 to 305"]
B104["B105: instructions - lines 306 to 306"]
B105["B106: WAIT - lines 307 to 307"]
B106["B107: instructions - lines 308 to 308"]
B107["B108: instructions - lines 309 to 309"]
B108["B109: WSTR - lines 312 to 312"]
B109["B110: CONT1 - lines 314 to 316"]
B101 -->|condition true| B101
B101 -->|condition false| B102
B103 -->|call| B90
B103 -->|after return| B104
B104 -->|next| B105
B105 -->|call| B101
B105 -->|after return| B106
B106 -->|condition true| B105
B106 -->|condition false| B107
B108 -->|next| B109
B109 -->|condition true| B112
B109 -->|condition false| B110
B90["Continue at B91 in section 10"]
B112["Continue at B113 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
MOV R0, #50
DJNZ R0, $
```

### B103

Return to the instruction following the active call.

```asm
RET
```

### B104

```asm
MOV A,#01H
ACALL CMD
```

### B105

```asm
MOV R7,#14
```

### B106

```asm
ACALL LDELAY
```

### B107

```asm
DJNZ R7,WAIT
```

### B108

Return to the instruction following the active call.

```asm
ret
```

### B109

```asm
PUSH    ACC
```

### B110

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 12

```mermaid
flowchart TD
B110["B111: PRINT - lines 318 to 318"]
B111["B112: instructions - lines 319 to 320"]
B112["B113: EXIT1 - lines 321 to 322"]
B110 -->|call| B85
B110 -->|after return| B111
B111 -->|jump| B109
B85["Continue at B86 in section 9"]
B109["Continue at B110 in section 11"]
```

### B111

```asm
ACALL    WCHR
```

### B112

```asm
INC DPTR
AJMP    CONT1
```

### B113

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
