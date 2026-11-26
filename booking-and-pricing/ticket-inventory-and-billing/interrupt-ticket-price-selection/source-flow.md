# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B3.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 4"]
B2["B3: MAIN - lines 9 to 16"]
B3["B4: instructions - lines 17 to 18"]
B4["B5: instructions - lines 19 to 20"]
B5["B6: instructions - lines 21 to 21"]
B6["B7: instructions - lines 22 to 22"]
B7["B8: MAIN1 - lines 25 to 25"]
B8["B9: instructions - lines 26 to 27"]
B9["B10: instructions - lines 28 to 29"]
B0 -->|jump| B2
B1 -->|jump| B42
B2 -->|call| B62
B2 -->|after return| B3
B3 -->|call| B72
B3 -->|after return| B4
B4 -->|call| B78
B4 -->|after return| B5
B5 -->|call| B90
B5 -->|after return| B6
B6 -->|call| B83
B6 -->|after return| B7
B7 -->|call| B62
B7 -->|after return| B8
B8 -->|call| B72
B8 -->|after return| B9
B9 -->|call| B78
B9 -->|after return| B10
B42["Continue at B43 in section 5"]
B62["Continue at B63 in section 7"]
B72["Continue at B73 in section 8"]
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
B83["Continue at B84 in section 9"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
JMP MAIN
```

### B2

```asm
JMP EX0ISR
```

### B3

```asm
MOV 33H,#9
MOV 43H,#5
MOV 34H,#9
MOV 44H,#3
ACALL INLCD
```

### B4

```asm
MOV A,#80H
ACALL CMD
```

### B5

```asm
MOV DPTR,#STR1
ACALL WSTR
```

### B6

```asm
ACALL TMSEC
```

### B7

```asm
ACALL ClearLCD
```

### B8

```asm
ACALL INLCD
```

### B9

```asm
MOV A,#80H
ACALL CMD
```

### B10

```asm
MOV DPTR,#STR2
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 32"]
B11["B12: instructions - lines 33 to 37"]
B12["B13: instructions - lines 38 to 39"]
B13["B14: instructions - lines 40 to 41"]
B14["B15: instructions - lines 42 to 42"]
B15["B16: instructions - lines 43 to 43"]
B16["B17: instructions - lines 44 to 44"]
B17["B18: NEXT1 - lines 48 to 48"]
B18["B19: instructions - lines 49 to 50"]
B19["B20: instructions - lines 51 to 52"]
B10 -->|call| B45
B10 -->|after return| B11
B11 -->|condition true| B17
B11 -->|condition false| B12
B12 -->|call| B72
B12 -->|after return| B13
B13 -->|call| B78
B13 -->|after return| B14
B14 -->|call| B90
B14 -->|after return| B15
B15 -->|call| B83
B15 -->|after return| B16
B16 -->|jump| B41
B17 -->|call| B62
B17 -->|after return| B18
B18 -->|call| B72
B18 -->|after return| B19
B19 -->|call| B78
B19 -->|after return| B20
B45["Continue at B46 in section 5"]
B72["Continue at B73 in section 8"]
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
B83["Continue at B84 in section 9"]
B41["Continue at B42 in section 5"]
B62["Continue at B63 in section 7"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL KEYPAD
```

### B12

```asm
SUBB A,#30H
MOV 30H,A
MOV R5,30H
CJNE R5,#3,NEXT1
```

### B13

```asm
MOV A,#80H
ACALL CMD
```

### B14

```asm
MOV DPTR, #STR7
ACALL WSTR
```

### B15

```asm
ACALL TMSEC
```

### B16

```asm
ACALL ClearLCD
```

### B17

```asm
LJMP STOP
```

### B18

```asm
ACALL INLCD
```

### B19

```asm
MOV A,#80H
ACALL CMD
```

### B20

```asm
MOV DPTR,#STR3
ACALL WSTR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 54 to 54"]
B21["B22: instructions - lines 55 to 62"]
B22["B23: instructions - lines 64 to 66"]
B23["B24: instructions - lines 67 to 73"]
B24["B25: SILVER - lines 76 to 78"]
B25["B26: instructions - lines 79 to 84"]
B26["B27: MAXAMOUNT - lines 87 to 87"]
B27["B28: instructions - lines 88 to 89"]
B28["B29: instructions - lines 90 to 91"]
B29["B30: instructions - lines 92 to 92"]
B20 -->|call| B45
B20 -->|after return| B21
B21 -->|condition true| B24
B21 -->|condition false| B22
B22 -->|condition true| B26
B22 -->|condition false| B23
B23 -->|jump| B32
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B32
B26 -->|call| B62
B26 -->|after return| B27
B27 -->|call| B72
B27 -->|after return| B28
B28 -->|call| B78
B28 -->|after return| B29
B29 -->|call| B90
B29 -->|after return| B30
B45["Continue at B46 in section 5"]
B32["Continue at B33 in section 4"]
B62["Continue at B63 in section 7"]
B72["Continue at B73 in section 8"]
B78["Continue at B79 in section 8"]
B90["Continue at B91 in section 10"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL KEYPAD
```

### B22

```asm
SUBB A,#30H
MOV 40H,A
MOV R7,30H
MOV R6,40H
CJNE R7,#1,SILVER
```

### B23

```asm
MOV A,33H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B24

```asm
MOV 33H,A
MOV A,R6
MOV B,43H
MUL AB
MOV 50H,A
SJMP PRICE
```

### B25

```asm
MOV A,34H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B26

```asm
MOV 34H,A
MOV A,R6
MOV B,44H
MUL AB
MOV 50H,A
SJMP PRICE
```

### B27

```asm
ACALL INLCD
```

### B28

```asm
MOV A,#80H
ACALL CMD
```

### B29

```asm
MOV DPTR,#STR6
ACALL WSTR
```

### B30

```asm
ACALL TMSEC
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 93 to 93"]
B31["B32: instructions - lines 94 to 94"]
B32["B33: PRICE - lines 97 to 98"]
B33["B34: instructions - lines 99 to 100"]
B34["B35: instructions - lines 102 to 105"]
B35["B36: instructions - lines 106 to 107"]
B36["B37: SKIP1 - lines 110 to 112"]
B37["B38: instructions - lines 115 to 116"]
B38["B39: instructions - lines 117 to 117"]
B39["B40: instructions - lines 119 to 119"]
B30 -->|call| B83
B30 -->|after return| B31
B31 -->|jump| B7
B32 -->|call| B72
B32 -->|after return| B33
B33 -->|call| B78
B33 -->|after return| B34
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|call| B67
B35 -->|after return| B36
B36 -->|call| B67
B36 -->|after return| B37
B37 -->|call| B78
B37 -->|after return| B38
B38 -->|call| B90
B38 -->|after return| B39
B39 -->|call| B83
B39 -->|after return| B40
B83["Continue at B84 in section 9"]
B7["Continue at B8 in section 1"]
B72["Continue at B73 in section 8"]
B78["Continue at B79 in section 8"]
B67["Continue at B68 in section 7"]
B90["Continue at B91 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL ClearLCD
```

### B32

```asm
AJMP MAIN1
```

### B33

```asm
MOV A,#0c0H
ACALL CMD
```

### B34

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B35

```asm
MOV A,50H
MOV B,#10
DIV AB
JZ SKIP1
```

### B36

```asm
ADD A,#30H
ACALL WCHR
```

### B37

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B38

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B39

```asm
ACALL TMSEC
```

### B40

```asm
ACALL ClearLCD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 120 to 120"]
B41["B42: STOP - lines 126 to 126"]
B42["B43: EX0ISR - lines 131 to 131"]
B43["B44: instructions - lines 132 to 132"]
B44["B45: instructions - lines 133 to 133"]
B45["B46: KEYPAD - lines 139 to 139"]
B46["B47: K1 - lines 140 to 143"]
B47["B48: K2 - lines 145 to 147"]
B48["B49: instructions - lines 148 to 148"]
B49["B50: OVER1 - lines 150 to 153"]
B40 -->|jump| B7
B41 -->|jump| B41
B42 -->|call| B45
B42 -->|after return| B43
B43 -->|condition true| B42
B43 -->|condition false| B44
B45 -->|next| B46
B46 -->|condition true| B46
B46 -->|condition false| B47
B47 -->|condition true| B49
B47 -->|condition false| B48
B48 -->|jump| B47
B49 -->|condition true| B54
B49 -->|condition false| B50
B7["Continue at B8 in section 1"]
B54["Continue at B55 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
AJMP MAIN1
```

### B42

```asm
SJMP STOP
```

### B43

```asm
ACALL KEYPAD
```

### B44

```asm
CJNE A,#'#',X1
```

### B45

Resume the interrupted program.

```asm
RETI
```

### B46

```asm
MOV P0,#01110000B
```

### B47

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B48

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B49

```asm
SJMP K2
```

### B50

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 154 to 157"]
B51["B52: instructions - lines 158 to 161"]
B52["B53: instructions - lines 162 to 165"]
B53["B54: instructions - lines 166 to 166"]
B54["B55: ROW_0 - lines 167 to 168"]
B55["B56: ROW_1 - lines 169 to 170"]
B56["B57: ROW_2 - lines 171 to 172"]
B57["B58: ROW_3 - lines 173 to 173"]
B58["B59: FIND - lines 176 to 176"]
B59["B60: FIND1 - lines 178 to 179"]
B50 -->|condition true| B55
B50 -->|condition false| B51
B51 -->|condition true| B56
B51 -->|condition false| B52
B52 -->|condition true| B57
B52 -->|condition false| B53
B53 -->|jump| B47
B54 -->|jump| B58
B55 -->|jump| B58
B56 -->|jump| B58
B57 -->|next| B58
B58 -->|next| B59
B59 -->|condition true| B61
B59 -->|condition false| B60
B47["Continue at B48 in section 5"]
B61["Continue at B62 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B52

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B53

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B54

```asm
LJMP K2
```

### B55

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B56

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B57

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B58

```asm
MOV DPTR,#KCODE3
```

### B59

```asm
RLC A
```

### B60

```asm
RLC A
JNC MATCH
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 180 to 181"]
B61["B62: MATCH - lines 182 to 186"]
B62["B63: INLCD - lines 193 to 201"]
B63["B64: instructions - lines 203 to 212"]
B64["B65: instructions - lines 214 to 229"]
B65["B66: instructions - lines 231 to 243"]
B66["B67: instructions - lines 244 to 244"]
B67["B68: WCHR - lines 249 to 253"]
B68["B69: instructions - lines 254 to 254"]
B69["B70: instructions - lines 255 to 257"]
B60 -->|jump| B59
B62 -->|call| B88
B62 -->|after return| B63
B63 -->|call| B88
B63 -->|after return| B64
B64 -->|call| B88
B64 -->|after return| B65
B65 -->|call| B88
B65 -->|after return| B66
B67 -->|call| B77
B67 -->|after return| B68
B68 -->|call| B88
B68 -->|after return| B69
B69 -->|call| B77
B69 -->|after return| B70
B59["Continue at B60 in section 6"]
B88["Continue at B89 in section 9"]
B77["Continue at B78 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
INC DPTR
SJMP FIND1
```

### B62

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B63

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

### B64

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

### B65

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

### B66

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

### B67

Return to the instruction following the active call.

```asm
RET
```

### B68

```asm
PUSH ACC
PUSH B
SETB P1.3
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
B70["B71: instructions - lines 258 to 258"]
B71["B72: instructions - lines 259 to 261"]
B72["B73: CMD - lines 265 to 267"]
B73["B74: instructions - lines 268 to 268"]
B74["B75: instructions - lines 269 to 271"]
B75["B76: instructions - lines 272 to 272"]
B76["B77: instructions - lines 273 to 273"]
B77["B78: COMMON - lines 277 to 282"]
B78["B79: WSTR - lines 286 to 286"]
B79["B80: CONT1 - lines 288 to 290"]
B70 -->|call| B88
B70 -->|after return| B71
B72 -->|call| B77
B72 -->|after return| B73
B73 -->|call| B88
B73 -->|after return| B74
B74 -->|call| B77
B74 -->|after return| B75
B75 -->|call| B88
B75 -->|after return| B76
B78 -->|next| B79
B79 -->|condition true| B82
B79 -->|condition false| B80
B88["Continue at B89 in section 9"]
B82["Continue at B83 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL LDELAY
```

### B72

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B73

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B74

```asm
ACALL LDELAY
```

### B75

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B76

```asm
ACALL LDELAY
```

### B77

Return to the instruction following the active call.

```asm
RET
```

### B78

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B79

```asm
PUSH    ACC
```

### B80

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 9

```mermaid
flowchart TD
B80["B81: PRINT - lines 292 to 292"]
B81["B82: instructions - lines 293 to 294"]
B82["B83: EXIT1 - lines 295 to 296"]
B83["B84: CLEARLCD - lines 299 to 300"]
B84["B85: instructions - lines 301 to 301"]
B85["B86: WAIT11 - lines 302 to 302"]
B86["B87: instructions - lines 303 to 303"]
B87["B88: instructions - lines 304 to 304"]
B88["B89: LDELAY - lines 309 to 310"]
B89["B90: instructions - lines 311 to 311"]
B80 -->|call| B67
B80 -->|after return| B81
B81 -->|jump| B79
B83 -->|call| B72
B83 -->|after return| B84
B84 -->|next| B85
B85 -->|call| B88
B85 -->|after return| B86
B86 -->|condition true| B85
B86 -->|condition false| B87
B88 -->|condition true| B88
B88 -->|condition false| B89
B67["Continue at B68 in section 7"]
B79["Continue at B80 in section 8"]
B72["Continue at B73 in section 8"]
```

### B81

```asm
ACALL    WCHR
```

### B82

```asm
INC DPTR
AJMP    CONT1
```

### B83

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B84

```asm
MOV A,#01H
ACALL CMD
```

### B85

```asm
MOV R7,#14
```

### B86

```asm
ACALL LDELAY
```

### B87

```asm
DJNZ R7,WAIT11
```

### B88

Return to the instruction following the active call.

```asm
RET
```

### B89

```asm
MOV R0, #50
DJNZ R0, $
```

### B90

Return to the instruction following the active call.

```asm
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: TMSEC - lines 315 to 318"]
B91["B92: BACK - lines 320 to 320"]
B92["B93: instructions - lines 321 to 323"]
B90 -->|next| B91
B91 -->|condition true| B91
B91 -->|condition false| B92
```

### B91

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B92

```asm
JNB   TF0,BACK
```

### B93

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```
