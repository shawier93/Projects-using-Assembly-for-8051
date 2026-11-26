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
B0 -->|call| B65
B0 -->|after return| B1
B1 -->|call| B59
B1 -->|after return| B2
B2 -->|call| B70
B2 -->|after return| B3
B3 -->|call| B59
B3 -->|after return| B4
B4 -->|call| B70
B4 -->|after return| B5
B5 -->|call| B45
B5 -->|after return| B6
B6 -->|next| B7
B7 -->|call| B75
B7 -->|after return| B8
B8 -->|condition true| B7
B8 -->|condition false| B9
B9 -->|call| B65
B9 -->|after return| B10
B65["Continue at B66 in section 7"]
B59["Continue at B60 in section 6"]
B70["Continue at B71 in section 8"]
B45["Continue at B46 in section 5"]
B75["Continue at B76 in section 8"]
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
B10["B11: instructions - lines 32 to 41"]
B11["B12: instructions - lines 42 to 42"]
B12["B13: instructions - lines 44 to 45"]
B13["B14: instructions - lines 46 to 47"]
B14["B15: instructions - lines 48 to 50"]
B15["B16: instructions - lines 52 to 52"]
B16["B17: instructions - lines 53 to 53"]
B17["B18: instructions - lines 54 to 62"]
B18["B19: XX - lines 64 to 75"]
B19["B20: instructions - lines 78 to 83"]
B10 -->|call| B45
B10 -->|after return| B11
B11 -->|call| B49
B11 -->|after return| B12
B12 -->|call| B59
B12 -->|after return| B13
B13 -->|call| B70
B13 -->|after return| B14
B14 -->|call| B54
B14 -->|after return| B15
B15 -->|call| B77
B15 -->|after return| B16
B16 -->|call| B54
B16 -->|after return| B17
B17 -->|next| B18
B18 -->|condition true| B18
B18 -->|condition false| B19
B19 -->|call| B59
B19 -->|after return| B20
B45["Continue at B46 in section 5"]
B49["Continue at B50 in section 5"]
B59["Continue at B60 in section 6"]
B70["Continue at B71 in section 8"]
B54["Continue at B55 in section 6"]
B77["Continue at B78 in section 8"]
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
MOV R0,#6
MOV 30H,R0
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
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B16

```asm
ACALL KEYPAD
```

### B17

```asm
ACALL WCHR
```

### B18

```asm
SUBB A,#30H
MOV 30H,A
MOV R7,30H
DEC R7
DEC R7
MOV R0,#43H
MOV R1,#43H
```

### B19

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

### B20

```asm
MOV R2,30H
INC R2
MOV A,#0C0H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 84 to 84"]
B21["B22: LOOOP - lines 86 to 88"]
B22["B23: instructions - lines 89 to 90"]
B23["B24: instructions - lines 91 to 92"]
B24["B25: instructions - lines 93 to 93"]
B25["B26: instructions - lines 95 to 95"]
B26["B27: instructions - lines 100 to 101"]
B27["B28: instructions - lines 102 to 103"]
B28["B29: instructions - lines 104 to 105"]
B29["B30: instructions - lines 106 to 109"]
B20 -->|next| B21
B21 -->|call| B54
B21 -->|after return| B22
B22 -->|call| B54
B22 -->|after return| B23
B23 -->|call| B75
B23 -->|after return| B24
B24 -->|condition true| B21
B24 -->|condition false| B25
B25 -->|call| B45
B25 -->|after return| B26
B26 -->|call| B49
B26 -->|after return| B27
B27 -->|call| B59
B27 -->|after return| B28
B28 -->|call| B70
B28 -->|after return| B29
B29 -->|call| B54
B29 -->|after return| B30
B54["Continue at B55 in section 6"]
B75["Continue at B76 in section 8"]
B45["Continue at B46 in section 5"]
B49["Continue at B50 in section 5"]
B59["Continue at B60 in section 6"]
B70["Continue at B71 in section 8"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV R1,#40H
```

### B22

```asm
MOV A,@R1
ADD A,#30H
ACALL WCHR
```

### B23

```asm
MOV A,#','
ACALL WCHR
```

### B24

```asm
INC R1
ACALL LDELAY
```

### B25

```asm
DJNZ R2,LOOOP
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
MOV 31H,#1
MOV A,31H
ADD A,#30H
ACALL WCHR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 112 to 113"]
B31["B32: instructions - lines 114 to 115"]
B32["B33: instructions - lines 116 to 116"]
B33["B34: instructions - lines 117 to 118"]
B34["B35: instructions - lines 119 to 119"]
B35["B36: instructions - lines 120 to 120"]
B36["B37: instructions - lines 121 to 121"]
B37["B38: instructions - lines 123 to 124"]
B38["B39: instructions - lines 125 to 125"]
B39["B40: NOTEQUAL - lines 128 to 128"]
B30 -->|call| B59
B30 -->|after return| B31
B31 -->|call| B70
B31 -->|after return| B32
B32 -->|call| B45
B32 -->|after return| B33
B33 -->|call| B59
B33 -->|after return| B34
B34 -->|call| B77
B34 -->|after return| B35
B35 -->|call| B54
B35 -->|after return| B36
B36 -->|call| B45
B36 -->|after return| B37
B37 -->|condition true| B39
B37 -->|condition false| B38
B38 -->|jump| B6
B39 -->|call| B49
B39 -->|after return| B40
B59["Continue at B60 in section 6"]
B70["Continue at B71 in section 8"]
B45["Continue at B46 in section 5"]
B77["Continue at B78 in section 8"]
B54["Continue at B55 in section 6"]
B6["Continue at B7 in section 1"]
B49["Continue at B50 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#0C0H
ACALL CMD
```

### B32

```asm
MOV DPTR,#YES
ACALL WSTR
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
MOV A,#0CDH
ACALL CMD
```

### B35

```asm
ACALL KEYPAD
```

### B36

```asm
ACALL WCHR
```

### B37

```asm
ACALL DELAY
```

### B38

```asm
SUBB A,#30H
CJNE A,#1,NOTEQUAL
```

### B39

```asm
AJMP START
```

### B40

```asm
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 129 to 130"]
B41["B42: instructions - lines 131 to 132"]
B42["B43: instructions - lines 133 to 134"]
B43["B44: instructions - lines 135 to 136"]
B44["B45: instructions - lines 137 to 137"]
B45["B46: DELAY - lines 144 to 144"]
B46["B47: WAIT - lines 146 to 146"]
B47["B48: instructions - lines 147 to 147"]
B48["B49: instructions - lines 148 to 148"]
B49["B50: CLEAR - lines 151 to 152"]
B40 -->|call| B59
B40 -->|after return| B41
B41 -->|call| B70
B41 -->|after return| B42
B42 -->|call| B59
B42 -->|after return| B43
B43 -->|call| B70
B43 -->|after return| B44
B44 -->|jump| B44
B45 -->|next| B46
B46 -->|call| B75
B46 -->|after return| B47
B47 -->|condition true| B46
B47 -->|condition false| B48
B49 -->|call| B59
B49 -->|after return| B50
B59["Continue at B60 in section 6"]
B70["Continue at B71 in section 8"]
B75["Continue at B76 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#80H
ACALL CMD
```

### B42

```asm
MOV DPTR,#THANK
ACALL WSTR
```

### B43

```asm
MOV A,#0C0H
ACALL CMD
```

### B44

```asm
MOV DPTR,#BYE
ACALL WSTR
```

### B45

```asm
SJMP $
```

### B46

```asm
MOV R7,#250
```

### B47

```asm
ACALL LDELAY
```

### B48

```asm
DJNZ R7,WAIT
```

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
MOV A, #01H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 153 to 153"]
B51["B52: WAIT2 - lines 155 to 155"]
B52["B53: instructions - lines 156 to 156"]
B53["B54: instructions - lines 157 to 157"]
B54["B55: WCHR - lines 160 to 164"]
B55["B56: instructions - lines 165 to 165"]
B56["B57: instructions - lines 166 to 168"]
B57["B58: instructions - lines 169 to 169"]
B58["B59: instructions - lines 170 to 172"]
B59["B60: CMD - lines 176 to 178"]
B50 -->|next| B51
B51 -->|call| B75
B51 -->|after return| B52
B52 -->|condition true| B51
B52 -->|condition false| B53
B54 -->|call| B64
B54 -->|after return| B55
B55 -->|call| B75
B55 -->|after return| B56
B56 -->|call| B64
B56 -->|after return| B57
B57 -->|call| B75
B57 -->|after return| B58
B59 -->|call| B64
B59 -->|after return| B60
B75["Continue at B76 in section 8"]
B64["Continue at B65 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV R7, #14
```

### B52

```asm
ACALL LDELAY
```

### B53

```asm
DJNZ R7, Wait2
```

### B54

Return to the instruction following the active call.

```asm
RET
```

### B55

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B56

```asm
ACALL LDELAY
```

### B57

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B58

```asm
ACALL LDELAY
```

### B59

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B60

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 179 to 179"]
B61["B62: instructions - lines 180 to 182"]
B62["B63: instructions - lines 183 to 183"]
B63["B64: instructions - lines 184 to 184"]
B64["B65: COMMON - lines 188 to 193"]
B65["B66: INLCD - lines 197 to 205"]
B66["B67: instructions - lines 207 to 216"]
B67["B68: instructions - lines 218 to 234"]
B68["B69: instructions - lines 236 to 248"]
B69["B70: instructions - lines 249 to 249"]
B60 -->|call| B75
B60 -->|after return| B61
B61 -->|call| B64
B61 -->|after return| B62
B62 -->|call| B75
B62 -->|after return| B63
B65 -->|call| B75
B65 -->|after return| B66
B66 -->|call| B75
B66 -->|after return| B67
B67 -->|call| B75
B67 -->|after return| B68
B68 -->|call| B75
B68 -->|after return| B69
B75["Continue at B76 in section 8"]
```

### B61

```asm
ACALL LDELAY
```

### B62

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B63

```asm
ACALL LDELAY
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B66

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

### B67

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

### B68

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

### B69

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

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: WSTR - lines 254 to 254"]
B71["B72: CONT1 - lines 256 to 258"]
B72["B73: PRINT - lines 260 to 260"]
B73["B74: instructions - lines 261 to 262"]
B74["B75: EXIT1 - lines 263 to 264"]
B75["B76: LDELAY - lines 268 to 269"]
B76["B77: instructions - lines 270 to 270"]
B77["B78: KEYPAD - lines 275 to 275"]
B78["B79: K1 - lines 276 to 279"]
B79["B80: K2 - lines 281 to 283"]
B70 -->|next| B71
B71 -->|condition true| B74
B71 -->|condition false| B72
B72 -->|call| B54
B72 -->|after return| B73
B73 -->|jump| B71
B75 -->|condition true| B75
B75 -->|condition false| B76
B77 -->|next| B78
B78 -->|condition true| B78
B78 -->|condition false| B79
B79 -->|condition true| B81
B79 -->|condition false| B80
B54["Continue at B55 in section 6"]
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
PUSH    ACC
```

### B72

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B73

```asm
ACALL    WCHR
```

### B74

```asm
INC DPTR
AJMP    CONT1
```

### B75

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B76

```asm
MOV R0, #50
DJNZ R0, $
```

### B77

Return to the instruction following the active call.

```asm
RET
```

### B78

```asm
mov p0,#01110000b
```

### B79

```asm
mov p0,#01110000b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,k1
```

### B80

```asm
mov a,p0
anl a,#01110000b
cjne a,#01110000b,over1
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 284 to 284"]
B81["B82: OVER1 - lines 286 to 289"]
B82["B83: instructions - lines 290 to 293"]
B83["B84: instructions - lines 294 to 297"]
B84["B85: instructions - lines 298 to 301"]
B85["B86: instructions - lines 302 to 302"]
B86["B87: ROW_0 - lines 303 to 304"]
B87["B88: ROW_1 - lines 305 to 306"]
B88["B89: ROW_2 - lines 307 to 308"]
B89["B90: ROW_3 - lines 309 to 309"]
B80 -->|jump| B79
B81 -->|condition true| B86
B81 -->|condition false| B82
B82 -->|condition true| B87
B82 -->|condition false| B83
B83 -->|condition true| B88
B83 -->|condition false| B84
B84 -->|condition true| B89
B84 -->|condition false| B85
B85 -->|jump| B79
B86 -->|jump| B90
B87 -->|jump| B90
B88 -->|jump| B90
B89 -->|next| B90
B79["Continue at B80 in section 8"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
sjmp k2
```

### B82

```asm
mov p0,#01111110b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_0
```

### B83

```asm
mov p0,#01111101b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_1
```

### B84

```asm
mov p0,#01111011b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_2
```

### B85

```asm
mov p0,#01110111b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_3
```

### B86

```asm
ljmp k2
```

### B87

```asm
mov dptr,#kcode0
sjmp find
```

### B88

```asm
mov dptr,#kcode1
sjmp find
```

### B89

```asm
mov dptr,#kcode2
sjmp find
```

### B90

```asm
mov dptr,#kcode3
```

## Section 10

```mermaid
flowchart TD
B90["B91: FIND - lines 311 to 311"]
B91["B92: FIND1 - lines 313 to 314"]
B92["B93: instructions - lines 315 to 316"]
B93["B94: MATCH - lines 317 to 319"]
B90 -->|next| B91
B91 -->|condition true| B93
B91 -->|condition false| B92
B92 -->|jump| B91
```

### B91

```asm
rlc a
```

### B92

```asm
rlc a
jnc match
```

### B93

```asm
inc dptr
sjmp find1
```

### B94

Return to the instruction following the active call.

```asm
clr a
movc a,@a+dptr
ret
```
