# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 6 to 6"]
B1["B2: instructions - lines 7 to 8"]
B2["B3: instructions - lines 9 to 10"]
B3["B4: instructions - lines 12 to 13"]
B4["B5: instructions - lines 14 to 15"]
B5["B6: instructions - lines 16 to 16"]
B6["B7: START - lines 19 to 20"]
B7["B8: X7 - lines 22 to 23"]
B8["B9: instructions - lines 24 to 24"]
B9["B10: instructions - lines 25 to 25"]
B0 -->|call| B64
B0 -->|after return| B1
B1 -->|call| B58
B1 -->|after return| B2
B2 -->|call| B69
B2 -->|after return| B3
B3 -->|call| B58
B3 -->|after return| B4
B4 -->|call| B69
B4 -->|after return| B5
B5 -->|call| B44
B5 -->|after return| B6
B6 -->|next| B7
B7 -->|call| B74
B7 -->|after return| B8
B8 -->|condition true| B7
B8 -->|condition false| B9
B9 -->|call| B64
B9 -->|after return| B10
B64["Continue at B65 in section 7"]
B58["Continue at B59 in section 6"]
B69["Continue at B70 in section 7"]
B44["Continue at B45 in section 5"]
B74["Continue at B75 in section 8"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A,#80H
ACALL CMD
```

### B3

```asm
MOV DPTR,#NAME
ACALL WSTR
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
MOV DPTR,#NAME1
ACALL WSTR
```

### B6

```asm
ACALL DELAY
```

### B7

```asm
MOV R2,#3
MOV P1,#0FFH
```

### B8

```asm
MOV P1,#00000000B
ACALL LDELAY
```

### B9

```asm
DJNZ R2,X7
```

### B10

```asm
ACALL INLCD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 40"]
B11["B12: instructions - lines 41 to 41"]
B12["B13: instructions - lines 43 to 44"]
B13["B14: instructions - lines 45 to 46"]
B14["B15: instructions - lines 47 to 47"]
B15["B16: instructions - lines 48 to 48"]
B16["B17: instructions - lines 49 to 57"]
B17["B18: XX - lines 59 to 70"]
B18["B19: instructions - lines 73 to 78"]
B19["B20: instructions - lines 79 to 79"]
B10 -->|call| B44
B10 -->|after return| B11
B11 -->|call| B48
B11 -->|after return| B12
B12 -->|call| B58
B12 -->|after return| B13
B13 -->|call| B69
B13 -->|after return| B14
B14 -->|call| B76
B14 -->|after return| B15
B15 -->|call| B53
B15 -->|after return| B16
B16 -->|next| B17
B17 -->|condition true| B17
B17 -->|condition false| B18
B18 -->|call| B58
B18 -->|after return| B19
B19 -->|next| B20
B44["Continue at B45 in section 5"]
B48["Continue at B49 in section 5"]
B58["Continue at B59 in section 6"]
B69["Continue at B70 in section 7"]
B76["Continue at B77 in section 8"]
B53["Continue at B54 in section 6"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV R1,#3
MOV 40H,R1
MOV R1,#0
MOV 41H,R1
MOV R1,#2
MOV 42H,R1
ACALL DELAY
```

### B12

```asm
ACALL CLEAR
```

### B13

```asm
MOV A,#80H
ACALL CMD
```

### B14

```asm
MOV DPTR,#N
ACALL WSTR
```

### B15

```asm
ACALL KEYPAD
```

### B16

```asm
ACALL WCHR
```

### B17

```asm
SUBB A,#30H
MOV 30H,A
MOV R7,30H
DEC R7
DEC R7
MOV R0,#43H
MOV R1,#43H
```

### B18

```asm
DEC R1
DEC R1
MOV A,@R1
MOV R2,A
DEC R1
MOV A,@R1
ADD A,R2
MOV @R0,A
INC R0
MOV B,R0
MOV R1,B
DJNZ R7,XX
```

### B19

```asm
MOV R2,30H
INC R2
MOV A,#0C0H
ACALL CMD
```

### B20

```asm
MOV R1,#40H
```

## Section 3

```mermaid
flowchart TD
B20["B21: LOOOP - lines 81 to 83"]
B21["B22: instructions - lines 84 to 85"]
B22["B23: instructions - lines 86 to 87"]
B23["B24: instructions - lines 88 to 88"]
B24["B25: instructions - lines 90 to 90"]
B25["B26: instructions - lines 91 to 91"]
B26["B27: instructions - lines 95 to 96"]
B27["B28: instructions - lines 97 to 98"]
B28["B29: instructions - lines 99 to 100"]
B29["B30: instructions - lines 103 to 104"]
B20 -->|call| B53
B20 -->|after return| B21
B21 -->|call| B53
B21 -->|after return| B22
B22 -->|call| B74
B22 -->|after return| B23
B23 -->|condition true| B20
B23 -->|condition false| B24
B24 -->|call| B44
B24 -->|after return| B25
B25 -->|call| B44
B25 -->|after return| B26
B26 -->|call| B48
B26 -->|after return| B27
B27 -->|call| B58
B27 -->|after return| B28
B28 -->|call| B69
B28 -->|after return| B29
B29 -->|call| B58
B29 -->|after return| B30
B53["Continue at B54 in section 6"]
B74["Continue at B75 in section 8"]
B44["Continue at B45 in section 5"]
B48["Continue at B49 in section 5"]
B58["Continue at B59 in section 6"]
B69["Continue at B70 in section 7"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,@R1
ADD A,#30H
ACALL WCHR
```

### B22

```asm
MOV A,#','
ACALL WCHR
```

### B23

```asm
INC R1
ACALL LDELAY
```

### B24

```asm
DJNZ R2,LOOOP
```

### B25

```asm
ACALL DELAY
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
MOV 31H,#0
ACALL CLEAR
```

### B28

```asm
MOV A,#80H
ACALL CMD
```

### B29

```asm
MOV DPTR,#CONT
ACALL WSTR
```

### B30

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 105 to 106"]
B31["B32: instructions - lines 107 to 107"]
B32["B33: instructions - lines 108 to 109"]
B33["B34: instructions - lines 110 to 110"]
B34["B35: instructions - lines 111 to 111"]
B35["B36: instructions - lines 112 to 112"]
B36["B37: instructions - lines 114 to 114"]
B37["B38: instructions - lines 115 to 115"]
B38["B39: NOTEQUAL - lines 118 to 118"]
B39["B40: instructions - lines 119 to 120"]
B30 -->|call| B69
B30 -->|after return| B31
B31 -->|call| B44
B31 -->|after return| B32
B32 -->|call| B58
B32 -->|after return| B33
B33 -->|call| B76
B33 -->|after return| B34
B34 -->|call| B53
B34 -->|after return| B35
B35 -->|call| B44
B35 -->|after return| B36
B36 -->|condition true| B38
B36 -->|condition false| B37
B37 -->|jump| B6
B38 -->|call| B48
B38 -->|after return| B39
B39 -->|call| B58
B39 -->|after return| B40
B69["Continue at B70 in section 7"]
B44["Continue at B45 in section 5"]
B58["Continue at B59 in section 6"]
B76["Continue at B77 in section 8"]
B53["Continue at B54 in section 6"]
B6["Continue at B7 in section 1"]
B48["Continue at B49 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV DPTR,#YES
ACALL WSTR
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
MOV A,#0CDH
ACALL CMD
```

### B34

```asm
ACALL KEYPAD
```

### B35

```asm
ACALL WCHR
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
CJNE A,#'1',NOTEQUAL
```

### B38

```asm
AJMP START
```

### B39

```asm
ACALL CLEAR
```

### B40

```asm
MOV A,#80H
ACALL CMD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 121 to 122"]
B41["B42: instructions - lines 123 to 124"]
B42["B43: instructions - lines 125 to 126"]
B43["B44: instructions - lines 127 to 127"]
B44["B45: DELAY - lines 134 to 134"]
B45["B46: WAIT - lines 136 to 136"]
B46["B47: instructions - lines 137 to 137"]
B47["B48: instructions - lines 138 to 138"]
B48["B49: CLEAR - lines 141 to 142"]
B49["B50: instructions - lines 143 to 143"]
B40 -->|call| B69
B40 -->|after return| B41
B41 -->|call| B58
B41 -->|after return| B42
B42 -->|call| B69
B42 -->|after return| B43
B43 -->|jump| B43
B44 -->|next| B45
B45 -->|call| B74
B45 -->|after return| B46
B46 -->|condition true| B45
B46 -->|condition false| B47
B48 -->|call| B58
B48 -->|after return| B49
B49 -->|next| B50
B69["Continue at B70 in section 7"]
B58["Continue at B59 in section 6"]
B74["Continue at B75 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR,#THANK
ACALL WSTR
```

### B42

```asm
MOV A,#0C0H
ACALL CMD
```

### B43

```asm
MOV DPTR,#BYE
ACALL WSTR
```

### B44

```asm
SJMP $
```

### B45

```asm
MOV R7,#250
```

### B46

```asm
ACALL LDELAY
```

### B47

```asm
DJNZ R7,WAIT
```

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
MOV A, #01H
ACALL CMD
```

### B50

```asm
MOV R7, #14
```

## Section 6

```mermaid
flowchart TD
B50["B51: WAITT - lines 145 to 145"]
B51["B52: instructions - lines 146 to 146"]
B52["B53: instructions - lines 147 to 147"]
B53["B54: WCHR - lines 150 to 154"]
B54["B55: instructions - lines 155 to 155"]
B55["B56: instructions - lines 156 to 158"]
B56["B57: instructions - lines 159 to 159"]
B57["B58: instructions - lines 160 to 162"]
B58["B59: CMD - lines 166 to 168"]
B59["B60: instructions - lines 169 to 169"]
B50 -->|call| B74
B50 -->|after return| B51
B51 -->|condition true| B50
B51 -->|condition false| B52
B53 -->|call| B63
B53 -->|after return| B54
B54 -->|call| B74
B54 -->|after return| B55
B55 -->|call| B63
B55 -->|after return| B56
B56 -->|call| B74
B56 -->|after return| B57
B58 -->|call| B63
B58 -->|after return| B59
B59 -->|call| B74
B59 -->|after return| B60
B74["Continue at B75 in section 8"]
B63["Continue at B64 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL LDELAY
```

### B52

```asm
DJNZ R7, WaitT
```

### B53

Return to the instruction following the active call.

```asm
RET
```

### B54

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B55

```asm
ACALL LDELAY
```

### B56

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B57

```asm
ACALL LDELAY
```

### B58

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B59

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B60

```asm
ACALL LDELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 170 to 172"]
B61["B62: instructions - lines 173 to 173"]
B62["B63: instructions - lines 174 to 174"]
B63["B64: COMMON - lines 178 to 183"]
B64["B65: INLCD - lines 187 to 195"]
B65["B66: instructions - lines 197 to 206"]
B66["B67: instructions - lines 208 to 224"]
B67["B68: instructions - lines 226 to 238"]
B68["B69: instructions - lines 239 to 239"]
B69["B70: WSTR - lines 244 to 244"]
B60 -->|call| B63
B60 -->|after return| B61
B61 -->|call| B74
B61 -->|after return| B62
B64 -->|call| B74
B64 -->|after return| B65
B65 -->|call| B74
B65 -->|after return| B66
B66 -->|call| B74
B66 -->|after return| B67
B67 -->|call| B74
B67 -->|after return| B68
B69 -->|next| B70
B74["Continue at B75 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B62

```asm
ACALL LDELAY
```

### B63

Return to the instruction following the active call.

```asm
RET
```

### B64

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B65

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

### B66

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

### B67

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

### B68

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

### B69

Return to the instruction following the active call.

```asm
RET
```

### B70

```asm
PUSH    ACC
```

## Section 8

```mermaid
flowchart TD
B70["B71: CONT1 - lines 246 to 248"]
B71["B72: PRINT - lines 250 to 250"]
B72["B73: instructions - lines 251 to 252"]
B73["B74: EXIT1 - lines 253 to 254"]
B74["B75: LDELAY - lines 258 to 259"]
B75["B76: instructions - lines 260 to 260"]
B76["B77: KEYPAD - lines 265 to 265"]
B77["B78: K1 - lines 266 to 269"]
B78["B79: K2 - lines 271 to 273"]
B79["B80: instructions - lines 274 to 274"]
B70 -->|condition true| B73
B70 -->|condition false| B71
B71 -->|call| B53
B71 -->|after return| B72
B72 -->|jump| B70
B74 -->|condition true| B74
B74 -->|condition false| B75
B76 -->|next| B77
B77 -->|condition true| B77
B77 -->|condition false| B78
B78 -->|condition true| B80
B78 -->|condition false| B79
B79 -->|jump| B78
B53["Continue at B54 in section 6"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B72

```asm
ACALL    WCHR
```

### B73

```asm
INC DPTR
AJMP    CONT1
```

### B74

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B75

```asm
MOV R0, #50
DJNZ R0, $
```

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
mov p0,#01110000b
```

### B78

```asm
mov p0,#01110000b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,k1
```

### B79

```asm
mov a,p0
anl a,#01110000b
cjne a,#01110000b,over1
```

### B80

```asm
sjmp k2
```

## Section 9

```mermaid
flowchart TD
B80["B81: OVER1 - lines 276 to 279"]
B81["B82: instructions - lines 280 to 283"]
B82["B83: instructions - lines 284 to 287"]
B83["B84: instructions - lines 288 to 291"]
B84["B85: instructions - lines 292 to 292"]
B85["B86: ROW_0 - lines 293 to 294"]
B86["B87: ROW_1 - lines 295 to 296"]
B87["B88: ROW_2 - lines 297 to 298"]
B88["B89: ROW_3 - lines 299 to 299"]
B89["B90: FIND - lines 301 to 301"]
B80 -->|condition true| B85
B80 -->|condition false| B81
B81 -->|condition true| B86
B81 -->|condition false| B82
B82 -->|condition true| B87
B82 -->|condition false| B83
B83 -->|condition true| B88
B83 -->|condition false| B84
B84 -->|jump| B78
B85 -->|jump| B89
B86 -->|jump| B89
B87 -->|jump| B89
B88 -->|next| B89
B89 -->|next| B90
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov p0,#01111110b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_0
```

### B82

```asm
mov p0,#01111101b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_1
```

### B83

```asm
mov p0,#01111011b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_2
```

### B84

```asm
mov p0,#01110111b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_3
```

### B85

```asm
ljmp k2
```

### B86

```asm
mov dptr,#kcode0
sjmp find
```

### B87

```asm
mov dptr,#kcode1
sjmp find
```

### B88

```asm
mov dptr,#kcode2
sjmp find
```

### B89

```asm
mov dptr,#kcode3
```

### B90

```asm
rlc a
```

## Section 10

```mermaid
flowchart TD
B90["B91: FIND1 - lines 303 to 304"]
B91["B92: instructions - lines 305 to 306"]
B92["B93: MATCH - lines 307 to 309"]
B90 -->|condition true| B92
B90 -->|condition false| B91
B91 -->|jump| B90
```

### B91

```asm
rlc a
jnc match
```

### B92

```asm
inc dptr
sjmp find1
```

### B93

Return to the instruction following the active call.

```asm
clr a
movc a,@a+dptr
ret
```
