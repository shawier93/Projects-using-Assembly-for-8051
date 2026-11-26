# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 3 to 10"]
B1["B2: instructions - lines 11 to 12"]
B2["B3: instructions - lines 13 to 14"]
B3["B4: instructions - lines 15 to 15"]
B4["B5: instructions - lines 16 to 16"]
B5["B6: MAIN1 - lines 19 to 19"]
B6["B7: instructions - lines 20 to 21"]
B7["B8: instructions - lines 22 to 23"]
B8["B9: instructions - lines 26 to 26"]
B9["B10: instructions - lines 27 to 31"]
B0 -->|call| B57
B0 -->|after return| B1
B1 -->|call| B67
B1 -->|after return| B2
B2 -->|call| B73
B2 -->|after return| B3
B3 -->|call| B85
B3 -->|after return| B4
B4 -->|call| B78
B4 -->|after return| B5
B5 -->|call| B57
B5 -->|after return| B6
B6 -->|call| B67
B6 -->|after return| B7
B7 -->|call| B73
B7 -->|after return| B8
B8 -->|call| B40
B8 -->|after return| B9
B9 -->|condition true| B15
B9 -->|condition false| B10
B57["Continue at B58 in section 6"]
B67["Continue at B68 in section 7"]
B73["Continue at B74 in section 8"]
B85["Continue at B86 in section 9"]
B78["Continue at B79 in section 8"]
B40["Continue at B41 in section 5"]
B15["Continue at B16 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 33H,#9
MOV 43H,#5
MOV 34H,#9
MOV 44H,#3
ACALL INLCD
```

### B2

```asm
MOV A,#80H
ACALL CMD
```

### B3

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B4

```asm
ACALL TMSEC
```

### B5

```asm
ACALL ClearLCD
```

### B6

```asm
ACALL INLCD
```

### B7

```asm
MOV A,#80H
ACALL CMD
```

### B8

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B9

```asm
ACALL KEYPAD
```

### B10

```asm
SUBB A,#30H
MOV 30H,A
MOV R5,30H
CJNE R5,#3,NEXT1
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 33"]
B11["B12: instructions - lines 34 to 35"]
B12["B13: instructions - lines 36 to 36"]
B13["B14: instructions - lines 37 to 37"]
B14["B15: instructions - lines 38 to 38"]
B15["B16: NEXT1 - lines 42 to 42"]
B16["B17: instructions - lines 43 to 44"]
B17["B18: instructions - lines 45 to 46"]
B18["B19: instructions - lines 48 to 48"]
B19["B20: instructions - lines 49 to 56"]
B10 -->|call| B67
B10 -->|after return| B11
B11 -->|call| B73
B11 -->|after return| B12
B12 -->|call| B85
B12 -->|after return| B13
B13 -->|call| B78
B13 -->|after return| B14
B14 -->|jump| B39
B15 -->|call| B57
B15 -->|after return| B16
B16 -->|call| B67
B16 -->|after return| B17
B17 -->|call| B73
B17 -->|after return| B18
B18 -->|call| B40
B18 -->|after return| B19
B19 -->|condition true| B22
B19 -->|condition false| B20
B67["Continue at B68 in section 7"]
B73["Continue at B74 in section 8"]
B85["Continue at B86 in section 9"]
B78["Continue at B79 in section 8"]
B39["Continue at B40 in section 4"]
B57["Continue at B58 in section 6"]
B40["Continue at B41 in section 5"]
B22["Continue at B23 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#80H
ACALL CMD
```

### B12

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B13

```asm
ACALL TMSEC
```

### B14

```asm
ACALL ClearLCD
```

### B15

```asm
LJMP STOP
```

### B16

```asm
ACALL INLCD
```

### B17

```asm
MOV A,#80H
ACALL CMD
```

### B18

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B19

```asm
ACALL KEYPAD
```

### B20

```asm
SUBB A,#30H
MOV 40H,A
MOV R7,30H
MOV R6,40H
CJNE R7,#1,SILVER
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 58 to 60"]
B21["B22: instructions - lines 61 to 67"]
B22["B23: SILVER - lines 70 to 72"]
B23["B24: instructions - lines 73 to 78"]
B24["B25: MAXAMOUNT - lines 81 to 81"]
B25["B26: instructions - lines 82 to 83"]
B26["B27: instructions - lines 84 to 85"]
B27["B28: instructions - lines 86 to 86"]
B28["B29: instructions - lines 87 to 87"]
B29["B30: instructions - lines 88 to 88"]
B20 -->|condition true| B24
B20 -->|condition false| B21
B21 -->|jump| B30
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B30
B24 -->|call| B57
B24 -->|after return| B25
B25 -->|call| B67
B25 -->|after return| B26
B26 -->|call| B73
B26 -->|after return| B27
B27 -->|call| B85
B27 -->|after return| B28
B28 -->|call| B78
B28 -->|after return| B29
B29 -->|jump| B5
B30["Continue at B31 in section 4"]
B57["Continue at B58 in section 6"]
B67["Continue at B68 in section 7"]
B73["Continue at B74 in section 8"]
B85["Continue at B86 in section 9"]
B78["Continue at B79 in section 8"]
B5["Continue at B6 in section 1"]
```

### B21

```asm
MOV A,33H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B22

```asm
MOV 33H,A
MOV A,R6
MOV B,43H
MUL AB
MOV 50H,A
SJMP PRICE
```

### B23

```asm
MOV A,34H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B24

```asm
MOV 34H,A
MOV A,R6
MOV B,44H
MUL AB
MOV 50H,A
SJMP PRICE
```

### B25

```asm
ACALL INLCD
```

### B26

```asm
MOV A,#80H
ACALL CMD
```

### B27

```asm
MOV DPTR,#STR6
ACALL WSTR
```

### B28

```asm
ACALL TMSEC
```

### B29

```asm
ACALL ClearLCD
```

### B30

```asm
AJMP MAIN1
```

## Section 4

```mermaid
flowchart TD
B30["B31: PRICE - lines 91 to 92"]
B31["B32: instructions - lines 93 to 94"]
B32["B33: instructions - lines 96 to 99"]
B33["B34: instructions - lines 100 to 101"]
B34["B35: SKIP1 - lines 104 to 106"]
B35["B36: instructions - lines 109 to 110"]
B36["B37: instructions - lines 111 to 111"]
B37["B38: instructions - lines 113 to 113"]
B38["B39: instructions - lines 114 to 114"]
B39["B40: STOP - lines 120 to 120"]
B30 -->|call| B67
B30 -->|after return| B31
B31 -->|call| B73
B31 -->|after return| B32
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|call| B62
B33 -->|after return| B34
B34 -->|call| B62
B34 -->|after return| B35
B35 -->|call| B73
B35 -->|after return| B36
B36 -->|call| B85
B36 -->|after return| B37
B37 -->|call| B78
B37 -->|after return| B38
B38 -->|jump| B5
B39 -->|jump| B39
B67["Continue at B68 in section 7"]
B73["Continue at B74 in section 8"]
B62["Continue at B63 in section 7"]
B85["Continue at B86 in section 9"]
B78["Continue at B79 in section 8"]
B5["Continue at B6 in section 1"]
```

### B31

```asm
MOV A,#0c0H
ACALL CMD
```

### B32

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B33

```asm
MOV A,50H
MOV B,#10
DIV AB
JZ SKIP1
```

### B34

```asm
ADD A,#30H
ACALL WCHR
```

### B35

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B36

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B37

```asm
ACALL TMSEC
```

### B38

```asm
ACALL ClearLCD
```

### B39

```asm
AJMP MAIN1
```

### B40

```asm
SJMP STOP
```

## Section 5

```mermaid
flowchart TD
B40["B41: KEYPAD - lines 127 to 127"]
B41["B42: K1 - lines 128 to 131"]
B42["B43: K2 - lines 133 to 135"]
B43["B44: instructions - lines 136 to 136"]
B44["B45: OVER1 - lines 138 to 141"]
B45["B46: instructions - lines 142 to 145"]
B46["B47: instructions - lines 146 to 149"]
B47["B48: instructions - lines 150 to 153"]
B48["B49: instructions - lines 154 to 154"]
B49["B50: ROW_0 - lines 155 to 156"]
B40 -->|next| B41
B41 -->|condition true| B41
B41 -->|condition false| B42
B42 -->|condition true| B44
B42 -->|condition false| B43
B43 -->|jump| B42
B44 -->|condition true| B49
B44 -->|condition false| B45
B45 -->|condition true| B50
B45 -->|condition false| B46
B46 -->|condition true| B51
B46 -->|condition false| B47
B47 -->|condition true| B52
B47 -->|condition false| B48
B48 -->|jump| B42
B49 -->|jump| B53
B50["Continue at B51 in section 6"]
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
B53["Continue at B54 in section 6"]
```

### B41

```asm
MOV P0,#01110000B
```

### B42

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B43

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B44

```asm
SJMP K2
```

### B45

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B46

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B47

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B48

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B49

```asm
LJMP K2
```

### B50

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 6

```mermaid
flowchart TD
B50["B51: ROW_1 - lines 157 to 158"]
B51["B52: ROW_2 - lines 159 to 160"]
B52["B53: ROW_3 - lines 161 to 161"]
B53["B54: FIND - lines 164 to 164"]
B54["B55: FIND1 - lines 166 to 167"]
B55["B56: instructions - lines 168 to 169"]
B56["B57: MATCH - lines 170 to 174"]
B57["B58: INLCD - lines 181 to 189"]
B58["B59: instructions - lines 191 to 200"]
B59["B60: instructions - lines 202 to 217"]
B50 -->|jump| B53
B51 -->|jump| B53
B52 -->|next| B53
B53 -->|next| B54
B54 -->|condition true| B56
B54 -->|condition false| B55
B55 -->|jump| B54
B57 -->|call| B83
B57 -->|after return| B58
B58 -->|call| B83
B58 -->|after return| B59
B59 -->|call| B83
B59 -->|after return| B60
B83["Continue at B84 in section 9"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B52

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B53

```asm
MOV DPTR,#KCODE3
```

### B54

```asm
RLC A
```

### B55

```asm
RLC A
JNC MATCH
```

### B56

```asm
INC DPTR
SJMP FIND1
```

### B57

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B58

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

### B59

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

### B60

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

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 219 to 231"]
B61["B62: instructions - lines 232 to 232"]
B62["B63: WCHR - lines 237 to 241"]
B63["B64: instructions - lines 242 to 242"]
B64["B65: instructions - lines 243 to 245"]
B65["B66: instructions - lines 246 to 246"]
B66["B67: instructions - lines 247 to 249"]
B67["B68: CMD - lines 253 to 255"]
B68["B69: instructions - lines 256 to 256"]
B69["B70: instructions - lines 257 to 259"]
B60 -->|call| B83
B60 -->|after return| B61
B62 -->|call| B72
B62 -->|after return| B63
B63 -->|call| B83
B63 -->|after return| B64
B64 -->|call| B72
B64 -->|after return| B65
B65 -->|call| B83
B65 -->|after return| B66
B67 -->|call| B72
B67 -->|after return| B68
B68 -->|call| B83
B68 -->|after return| B69
B69 -->|call| B72
B69 -->|after return| B70
B83["Continue at B84 in section 9"]
B72["Continue at B73 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

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

### B62

Return to the instruction following the active call.

```asm
RET
```

### B63

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B64

```asm
ACALL LDELAY
```

### B65

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B66

```asm
ACALL LDELAY
```

### B67

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B68

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B69

```asm
ACALL LDELAY
```

### B70

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 260 to 260"]
B71["B72: instructions - lines 261 to 261"]
B72["B73: COMMON - lines 265 to 270"]
B73["B74: WSTR - lines 274 to 274"]
B74["B75: CONT1 - lines 276 to 278"]
B75["B76: PRINT - lines 280 to 280"]
B76["B77: instructions - lines 281 to 282"]
B77["B78: EXIT1 - lines 283 to 284"]
B78["B79: CLEARLCD - lines 287 to 288"]
B79["B80: instructions - lines 289 to 289"]
B70 -->|call| B83
B70 -->|after return| B71
B73 -->|next| B74
B74 -->|condition true| B77
B74 -->|condition false| B75
B75 -->|call| B62
B75 -->|after return| B76
B76 -->|jump| B74
B78 -->|call| B67
B78 -->|after return| B79
B79 -->|next| B80
B83["Continue at B84 in section 9"]
B62["Continue at B63 in section 7"]
B67["Continue at B68 in section 7"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL LDELAY
```

### B72

Return to the instruction following the active call.

```asm
RET
```

### B73

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B74

```asm
PUSH    ACC
```

### B75

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B76

```asm
ACALL    WCHR
```

### B77

```asm
INC DPTR
AJMP    CONT1
```

### B78

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B79

```asm
MOV A,#01H
ACALL CMD
```

### B80

```asm
MOV R7,#14
```

## Section 9

```mermaid
flowchart TD
B80["B81: WAIT11 - lines 290 to 290"]
B81["B82: instructions - lines 291 to 291"]
B82["B83: instructions - lines 292 to 292"]
B83["B84: LDELAY - lines 297 to 298"]
B84["B85: instructions - lines 299 to 299"]
B85["B86: TMSEC - lines 303 to 306"]
B86["B87: BACK - lines 308 to 308"]
B87["B88: instructions - lines 309 to 311"]
B80 -->|call| B83
B80 -->|after return| B81
B81 -->|condition true| B80
B81 -->|condition false| B82
B83 -->|condition true| B83
B83 -->|condition false| B84
B85 -->|next| B86
B86 -->|condition true| B86
B86 -->|condition false| B87
```

### B81

```asm
ACALL LDELAY
```

### B82

```asm
DJNZ R7,WAIT11
```

### B83

Return to the instruction following the active call.

```asm
RET
```

### B84

```asm
MOV R0, #50
DJNZ R0, $
```

### B85

Return to the instruction following the active call.

```asm
RET
```

### B86

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B87

```asm
JNB   TF0,BACK
```

### B88

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```
