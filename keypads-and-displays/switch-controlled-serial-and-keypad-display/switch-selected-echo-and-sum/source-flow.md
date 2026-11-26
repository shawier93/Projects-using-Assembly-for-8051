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
B0["B1: instructions - lines 2 to 3"]
B1["B2: instructions - lines 4 to 4"]
B2["B3: instructions - lines 5 to 6"]
B3["B4: LOOP1 - lines 10 to 12"]
B4["B5: instructions - lines 13 to 13"]
B5["B6: instructions - lines 14 to 14"]
B6["B7: LOOP2 - lines 18 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 20 to 20"]
B9["B10: OFFON - lines 23 to 24"]
B0 -->|call| B56
B0 -->|after return| B1
B1 -->|call| B82
B1 -->|after return| B2
B2 -->|call| B66
B2 -->|after return| B3
B3 -->|condition true| B6
B3 -->|condition false| B4
B4 -->|call| B9
B4 -->|after return| B5
B5 -->|jump| B3
B6 -->|condition true| B3
B6 -->|condition false| B7
B7 -->|call| B19
B7 -->|after return| B8
B8 -->|jump| B3
B9 -->|call| B87
B9 -->|after return| B10
B56["Continue at B57 in section 6"]
B82["Continue at B83 in section 9"]
B66["Continue at B67 in section 7"]
B19["Continue at B20 in section 2"]
B87["Continue at B88 in section 9"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV P2,#0FFH
ACALL INLCD
```

### B2

```asm
ACALL INIT
```

### B3

```asm
MOV A,#80H
ACALL CMD
```

### B4

```asm
MOV A,P2
ANL A,#00011000B
CJNE A,#00010000B,LOOP2
```

### B5

```asm
ACALL OFFON
```

### B6

```asm
SJMP LOOP1
```

### B7

```asm
CJNE A,#00000000B,LOOP1
```

### B8

```asm
ACALL ONON
```

### B9

```asm
SJMP LOOP1
```

### B10

```asm
MOV DPTR, #STR1
ACALL WSTR_OUT
```

## Section 2

```mermaid
flowchart TD
B10["B11: REPEAT - lines 26 to 26"]
B11["B12: instructions - lines 27 to 27"]
B12["B13: instructions - lines 28 to 28"]
B13["B14: STORE - lines 30 to 31"]
B14["B15: instructions - lines 32 to 33"]
B15["B16: instructions - lines 34 to 35"]
B16["B17: CHECK0 - lines 37 to 39"]
B17["B18: instructions - lines 40 to 40"]
B18["B19: BACK0 - lines 42 to 42"]
B19["B20: ONON - lines 45 to 45"]
B10 -->|call| B83
B10 -->|after return| B11
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|jump| B10
B13 -->|call| B61
B13 -->|after return| B14
B14 -->|call| B85
B14 -->|after return| B15
B15 -->|call| B85
B15 -->|after return| B16
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B16
B19 -->|call| B39
B19 -->|after return| B20
B83["Continue at B84 in section 9"]
B61["Continue at B62 in section 7"]
B85["Continue at B86 in section 9"]
B39["Continue at B40 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL CIN
```

### B12

```asm
CJNE A,#0DH, STORE
```

### B13

```asm
SJMP REPEAT
```

### B14

```asm
MOV R5,A
ACALL WCHR
```

### B15

```asm
MOV A,R5
ACALL COUT
```

### B16

```asm
MOV A,#' '
ACALL COUT
```

### B17

```asm
MOV A,P2
ANL A,00011000B
CJNE A,#0010000B,BACK0
```

### B18

```asm
SJMP CHECK0
```

### B19

Return to the instruction following the active call.

```asm
RET
```

### B20

```asm
ACALL KEYPAD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 46 to 48"]
B21["B22: instructions - lines 49 to 51"]
B22["B23: instructions - lines 52 to 54"]
B23["B24: instructions - lines 55 to 55"]
B24["B25: NEXT - lines 57 to 58"]
B25["B26: instructions - lines 59 to 61"]
B26["B27: NEXT1 - lines 63 to 64"]
B27["B28: instructions - lines 65 to 67"]
B28["B29: NEXT2 - lines 70 to 70"]
B29["B30: instructions - lines 72 to 73"]
B20 -->|call| B39
B20 -->|after return| B21
B21 -->|call| B39
B21 -->|after return| B22
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|next| B24
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|next| B26
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|next| B28
B28 -->|condition true| B32
B28 -->|condition false| B29
B29 -->|call| B66
B29 -->|after return| B30
B39["Continue at B40 in section 4"]
B32["Continue at B33 in section 4"]
B66["Continue at B67 in section 7"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ANL A, #0FH
MOV R2,A
ACALL KEYPAD
```

### B22

```asm
ANL A, #0FH
MOV R3,A
ACALL KEYPAD
```

### B23

```asm
ANL A, #0FH
MOV R4,A
JNB ACC.0, NEXT
```

### B24

```asm
MOV 30H,A
```

### B25

```asm
MOV A,R3
JNB ACC.0, NEXT1
```

### B26

```asm
MOV A,30h
ADD A,R3
MOV 30H,A
```

### B27

```asm
MOV A,R2
JNB ACC.0, NEXT2
```

### B28

```asm
MOV A,30h
ADD A,R2
MOV 30H,A
```

### B29

```asm
JNB ACC.0,ODD
```

### B30

```asm
MOV A,#80H
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 74 to 75"]
B31["B32: instructions - lines 76 to 77"]
B32["B33: ODD - lines 80 to 82"]
B33["B34: instructions - lines 83 to 85"]
B34["B35: instructions - lines 87 to 89"]
B35["B36: instructions - lines 90 to 92"]
B36["B37: instructions - lines 94 to 96"]
B37["B38: instructions - lines 97 to 99"]
B38["B39: instructions - lines 101 to 101"]
B39["B40: KEYPAD - lines 104 to 104"]
B30 -->|call| B72
B30 -->|after return| B31
B31 -->|call| B61
B31 -->|after return| B32
B32 -->|call| B77
B32 -->|after return| B33
B33 -->|call| B77
B33 -->|after return| B34
B34 -->|call| B77
B34 -->|after return| B35
B35 -->|call| B77
B35 -->|after return| B36
B36 -->|call| B77
B36 -->|after return| B37
B37 -->|call| B77
B37 -->|after return| B38
B39 -->|next| B40
B72["Continue at B73 in section 8"]
B61["Continue at B62 in section 7"]
B77["Continue at B78 in section 8"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B32

```asm
MOV A,30H
ACALL WCHR
```

### B33

```asm
MOV A,#01010101B
MOV P1,A
ACALL LDELAY
```

### B34

```asm
MOV A,#10101010B
MOV P1,A
ACALL LDELAY
```

### B35

```asm
MOV A,#01010101B
MOV P1,A
ACALL LDELAY
```

### B36

```asm
MOV A,#10101010B
MOV P1,A
ACALL LDELAY
```

### B37

```asm
MOV A,#01010101B
MOV P1,A
ACALL LDELAY
```

### B38

```asm
MOV A,#10101010B
MOV P1,A
ACALL LDELAY
```

### B39

Return to the instruction following the active call.

```asm
RET
```

### B40

```asm
MOV P0,#01110000B
```

## Section 5

```mermaid
flowchart TD
B40["B41: K1 - lines 105 to 108"]
B41["B42: K2 - lines 110 to 112"]
B42["B43: instructions - lines 113 to 113"]
B43["B44: OVER1 - lines 115 to 118"]
B44["B45: instructions - lines 119 to 122"]
B45["B46: instructions - lines 123 to 126"]
B46["B47: instructions - lines 127 to 130"]
B47["B48: instructions - lines 131 to 131"]
B48["B49: ROW_0 - lines 132 to 133"]
B49["B50: ROW_1 - lines 134 to 135"]
B40 -->|condition true| B40
B40 -->|condition false| B41
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B41
B43 -->|condition true| B48
B43 -->|condition false| B44
B44 -->|condition true| B49
B44 -->|condition false| B45
B45 -->|condition true| B50
B45 -->|condition false| B46
B46 -->|condition true| B51
B46 -->|condition false| B47
B47 -->|jump| B41
B48 -->|jump| B52
B49 -->|jump| B52
B50["Continue at B51 in section 6"]
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
```

### B41

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B42

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B43

```asm
SJMP K2
```

### B44

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B45

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B46

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B47

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B48

```asm
LJMP K2
```

### B49

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B50

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

## Section 6

```mermaid
flowchart TD
B50["B51: ROW_2 - lines 136 to 137"]
B51["B52: ROW_3 - lines 138 to 138"]
B52["B53: FIND - lines 141 to 141"]
B53["B54: FIND1 - lines 143 to 144"]
B54["B55: instructions - lines 145 to 146"]
B55["B56: MATCH - lines 147 to 149"]
B56["B57: INLCD - lines 153 to 161"]
B57["B58: instructions - lines 163 to 172"]
B58["B59: instructions - lines 174 to 189"]
B59["B60: instructions - lines 191 to 203"]
B50 -->|jump| B52
B51 -->|next| B52
B52 -->|next| B53
B53 -->|condition true| B55
B53 -->|condition false| B54
B54 -->|jump| B53
B56 -->|call| B77
B56 -->|after return| B57
B57 -->|call| B77
B57 -->|after return| B58
B58 -->|call| B77
B58 -->|after return| B59
B59 -->|call| B77
B59 -->|after return| B60
B77["Continue at B78 in section 8"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B52

```asm
MOV DPTR,#KCODE3
```

### B53

```asm
RLC A
```

### B54

```asm
RLC A
JNC MATCH
```

### B55

```asm
INC DPTR
SJMP FIND1
```

### B56

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B57

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

### B58

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

### B59

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

### B60

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

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 204 to 204"]
B61["B62: WCHR - lines 209 to 213"]
B62["B63: instructions - lines 214 to 214"]
B63["B64: instructions - lines 215 to 217"]
B64["B65: instructions - lines 218 to 218"]
B65["B66: instructions - lines 219 to 221"]
B66["B67: CMD - lines 225 to 227"]
B67["B68: instructions - lines 228 to 228"]
B68["B69: instructions - lines 229 to 231"]
B69["B70: instructions - lines 232 to 232"]
B61 -->|call| B71
B61 -->|after return| B62
B62 -->|call| B77
B62 -->|after return| B63
B63 -->|call| B71
B63 -->|after return| B64
B64 -->|call| B77
B64 -->|after return| B65
B66 -->|call| B71
B66 -->|after return| B67
B67 -->|call| B77
B67 -->|after return| B68
B68 -->|call| B71
B68 -->|after return| B69
B69 -->|call| B77
B69 -->|after return| B70
B71["Continue at B72 in section 8"]
B77["Continue at B78 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
RET
```

### B62

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B63

```asm
ACALL LDELAY
```

### B64

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B65

```asm
ACALL LDELAY
```

### B66

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B67

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B68

```asm
ACALL LDELAY
```

### B69

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B70

```asm
ACALL LDELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 233 to 233"]
B71["B72: COMMON - lines 237 to 242"]
B72["B73: WSTR - lines 246 to 246"]
B73["B74: CONT1 - lines 248 to 250"]
B74["B75: PRINT - lines 252 to 252"]
B75["B76: instructions - lines 253 to 254"]
B76["B77: EXIT1 - lines 255 to 256"]
B77["B78: LDELAY - lines 260 to 261"]
B78["B79: instructions - lines 262 to 262"]
B79["B80: TMSEC - lines 266 to 269"]
B72 -->|next| B73
B73 -->|condition true| B76
B73 -->|condition false| B74
B74 -->|call| B61
B74 -->|after return| B75
B75 -->|jump| B73
B77 -->|condition true| B77
B77 -->|condition false| B78
B79 -->|next| B80
B61["Continue at B62 in section 7"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B73

```asm
PUSH    ACC
```

### B74

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B75

```asm
ACALL    WCHR
```

### B76

```asm
INC DPTR
AJMP    CONT1
```

### B77

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B78

```asm
MOV R0, #50
DJNZ R0, $
```

### B79

Return to the instruction following the active call.

```asm
RET
```

### B80

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

## Section 9

```mermaid
flowchart TD
B80["B81: BACK - lines 271 to 271"]
B81["B82: instructions - lines 272 to 274"]
B82["B83: INIT - lines 278 to 285"]
B83["B84: CIN - lines 289 to 289"]
B84["B85: instructions - lines 290 to 292"]
B85["B86: COUT - lines 296 to 297"]
B86["B87: instructions - lines 298 to 299"]
B87["B88: WSTR_OUT - lines 303 to 303"]
B88["B89: CONT2 - lines 305 to 307"]
B89["B90: PRINT2 - lines 309 to 309"]
B80 -->|condition true| B80
B80 -->|condition false| B81
B83 -->|condition true| B83
B83 -->|condition false| B84
B85 -->|condition true| B85
B85 -->|condition false| B86
B87 -->|next| B88
B88 -->|condition true| B91
B88 -->|condition false| B89
B89 -->|call| B85
B89 -->|after return| B90
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
JNB   TF0,BACK
```

### B82

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```

### B83

Return to the instruction following the active call.

```asm
CLR SM0
SETB SM1
SETB REN
MOV TMOD, #21H
MOV TH1, #0FAH
MOV TL1, #0FAH
SETB TR1
RET
```

### B84

```asm
JNB RI, CIN
```

### B85

Return to the instruction following the active call.

```asm
CLR RI
MOV A,SBUF
RET
```

### B86

```asm
MOV SBUF,A
JNB TI, $
```

### B87

Return to the instruction following the active call.

```asm
CLR TI
RET
```

### B88

```asm
PUSH    ACC
```

### B89

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit2
```

### B90

```asm
ACALL    COUT
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 310 to 311"]
B91["B92: EXIT2 - lines 312 to 313"]
B90 -->|jump| B88
B88["Continue at B89 in section 9"]
```

### B91

```asm
INC DPTR
AJMP    CONT2
```

### B92

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
