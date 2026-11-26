# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 5"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 9 to 9"]
B4["B5: instructions - lines 10 to 10"]
B5["B6: instructions - lines 12 to 13"]
B6["B7: instructions - lines 14 to 14"]
B7["B8: instructions - lines 16 to 17"]
B8["B9: instructions - lines 18 to 19"]
B9["B10: instructions - lines 20 to 20"]
B0 -->|call| B60
B0 -->|after return| B1
B1 -->|call| B70
B1 -->|after return| B2
B2 -->|call| B76
B2 -->|after return| B3
B3 -->|call| B84
B3 -->|after return| B4
B4 -->|call| B84
B4 -->|after return| B5
B5 -->|call| B70
B5 -->|after return| B6
B6 -->|call| B84
B6 -->|after return| B7
B7 -->|call| B70
B7 -->|after return| B8
B8 -->|call| B76
B8 -->|after return| B9
B9 -->|call| B84
B9 -->|after return| B10
B60["Continue at B61 in section 7"]
B70["Continue at B71 in section 8"]
B76["Continue at B77 in section 8"]
B84["Continue at B85 in section 9"]
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
MOV DPTR,#STR1
ACALL WSTR
```

### B4

```asm
ACALL DELAY
```

### B5

```asm
ACALL DELAY
```

### B6

```asm
MOV A,#01H
ACALL CMD
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
MOV A,#80H
ACALL CMD
```

### B9

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 21 to 22"]
B11["B12: instructions - lines 23 to 24"]
B12["B13: instructions - lines 25 to 25"]
B13["B14: instructions - lines 27 to 28"]
B14["B15: instructions - lines 29 to 29"]
B15["B16: instructions - lines 30 to 30"]
B16["B17: instructions - lines 31 to 33"]
B17["B18: instructions - lines 34 to 34"]
B18["B19: FIRSTCLASS - lines 36 to 37"]
B19["B20: instructions - lines 38 to 38"]
B10 -->|call| B70
B10 -->|after return| B11
B11 -->|call| B76
B11 -->|after return| B12
B12 -->|call| B84
B12 -->|after return| B13
B13 -->|call| B70
B13 -->|after return| B14
B14 -->|call| B43
B14 -->|after return| B15
B15 -->|call| B65
B15 -->|after return| B16
B16 -->|call| B84
B16 -->|after return| B17
B17 -->|call| B84
B17 -->|after return| B18
B18 -->|call| B70
B18 -->|after return| B19
B19 -->|call| B84
B19 -->|after return| B20
B70["Continue at B71 in section 8"]
B76["Continue at B77 in section 8"]
B84["Continue at B85 in section 9"]
B43["Continue at B44 in section 5"]
B65["Continue at B66 in section 7"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR,#STR22
ACALL WSTR
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
MOV A,#0CEH
ACALL CMD
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
ANL A,#0FH
MOV 30H,A
ACALL DELAY
```

### B18

```asm
ACALL DELAY
```

### B19

```asm
MOV A,#01H
ACALL CMD
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 40 to 41"]
B21["B22: instructions - lines 42 to 43"]
B22["B23: instructions - lines 44 to 44"]
B23["B24: instructions - lines 45 to 46"]
B24["B25: instructions - lines 47 to 48"]
B25["B26: instructions - lines 49 to 49"]
B26["B27: instructions - lines 51 to 52"]
B27["B28: instructions - lines 53 to 53"]
B28["B29: instructions - lines 54 to 54"]
B29["B30: instructions - lines 55 to 57"]
B20 -->|call| B70
B20 -->|after return| B21
B21 -->|call| B76
B21 -->|after return| B22
B22 -->|call| B84
B22 -->|after return| B23
B23 -->|call| B70
B23 -->|after return| B24
B24 -->|call| B76
B24 -->|after return| B25
B25 -->|call| B84
B25 -->|after return| B26
B26 -->|call| B70
B26 -->|after return| B27
B27 -->|call| B43
B27 -->|after return| B28
B28 -->|call| B65
B28 -->|after return| B29
B29 -->|condition true| B31
B29 -->|condition false| B30
B70["Continue at B71 in section 8"]
B76["Continue at B77 in section 8"]
B84["Continue at B85 in section 9"]
B43["Continue at B44 in section 5"]
B65["Continue at B66 in section 7"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#80H
ACALL CMD
```

### B22

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B23

```asm
ACALL DELAY
```

### B24

```asm
MOV A,#0C0H
ACALL CMD
```

### B25

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
MOV A,#0CEH
ACALL CMD
```

### B28

```asm
ACALL KEYPAD
```

### B29

```asm
ACALL WCHR
```

### B30

```asm
ANL A,#0FH
CJNE A,#2, NOO
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 58 to 58"]
B31["B32: NOO - lines 59 to 59"]
B32["B33: instructions - lines 60 to 60"]
B33["B34: NOO1 - lines 61 to 61"]
B34["B35: OKK - lines 63 to 64"]
B35["B36: instructions - lines 65 to 65"]
B36["B37: ERR - lines 71 to 72"]
B37["B38: instructions - lines 73 to 73"]
B38["B39: instructions - lines 75 to 76"]
B39["B40: instructions - lines 77 to 78"]
B30 -->|jump| B34
B31 -->|condition true| B33
B31 -->|condition false| B32
B32 -->|jump| B34
B33 -->|call| B36
B33 -->|after return| B34
B34 -->|call| B84
B34 -->|after return| B35
B35 -->|call| B84
B35 -->|after return| B36
B36 -->|call| B70
B36 -->|after return| B37
B37 -->|call| B84
B37 -->|after return| B38
B38 -->|call| B70
B38 -->|after return| B39
B39 -->|call| B76
B39 -->|after return| B40
B84["Continue at B85 in section 9"]
B70["Continue at B71 in section 8"]
B76["Continue at B77 in section 8"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
SJMP OKK
```

### B32

```asm
CJNE A,#1,NOO1
```

### B33

```asm
SJMP OKK
```

### B34

```asm
ACALL ERR
```

### B35

```asm
MOV 31H,A
ACALL DELAY
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
MOV A,#01H
ACALL CMD
```

### B38

```asm
ACALL DELAY
```

### B39

```asm
MOV A,#80H
ACALL CMD
```

### B40

```asm
MOV DPTR,#ERROR
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 79 to 79"]
B41["B42: instructions - lines 80 to 80"]
B42["B43: instructions - lines 82 to 82"]
B43["B44: KEYPAD - lines 85 to 85"]
B44["B45: K1 - lines 86 to 89"]
B45["B46: K2 - lines 91 to 93"]
B46["B47: instructions - lines 94 to 94"]
B47["B48: OVER1 - lines 97 to 100"]
B48["B49: instructions - lines 101 to 104"]
B49["B50: instructions - lines 105 to 108"]
B40 -->|call| B84
B40 -->|after return| B41
B41 -->|call| B84
B41 -->|after return| B42
B43 -->|next| B44
B44 -->|condition true| B44
B44 -->|condition false| B45
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|jump| B45
B47 -->|condition true| B52
B47 -->|condition false| B48
B48 -->|condition true| B53
B48 -->|condition false| B49
B49 -->|condition true| B54
B49 -->|condition false| B50
B84["Continue at B85 in section 9"]
B52["Continue at B53 in section 6"]
B53["Continue at B54 in section 6"]
B54["Continue at B55 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL DELAY
```

### B42

```asm
ACALL DELAY
```

### B43

Return to the instruction following the active call.

```asm
RET
```

### B44

```asm
MOV P0,#01110000B
```

### B45

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B46

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B47

```asm
SJMP K2
```

### B48

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B49

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B50

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 109 to 112"]
B51["B52: instructions - lines 113 to 113"]
B52["B53: ROW_0 - lines 114 to 115"]
B53["B54: ROW_1 - lines 116 to 117"]
B54["B55: ROW_2 - lines 118 to 119"]
B55["B56: ROW_3 - lines 120 to 120"]
B56["B57: FIND - lines 123 to 123"]
B57["B58: FIND1 - lines 125 to 126"]
B58["B59: instructions - lines 127 to 128"]
B59["B60: MATCH - lines 129 to 131"]
B50 -->|condition true| B55
B50 -->|condition false| B51
B51 -->|jump| B45
B52 -->|jump| B56
B53 -->|jump| B56
B54 -->|jump| B56
B55 -->|next| B56
B56 -->|next| B57
B57 -->|condition true| B59
B57 -->|condition false| B58
B58 -->|jump| B57
B45["Continue at B46 in section 5"]
```

### B51

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B52

```asm
LJMP K2
```

### B53

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B54

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B55

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B56

```asm
MOV DPTR,#KCODE3
```

### B57

```asm
RLC A
```

### B58

```asm
RLC A
JNC MATCH
```

### B59

```asm
INC DPTR
SJMP FIND1
```

### B60

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: INLCD - lines 135 to 143"]
B61["B62: instructions - lines 145 to 154"]
B62["B63: instructions - lines 156 to 171"]
B63["B64: instructions - lines 173 to 185"]
B64["B65: instructions - lines 186 to 186"]
B65["B66: WCHR - lines 191 to 195"]
B66["B67: instructions - lines 196 to 196"]
B67["B68: instructions - lines 197 to 199"]
B68["B69: instructions - lines 200 to 200"]
B69["B70: instructions - lines 201 to 203"]
B60 -->|call| B81
B60 -->|after return| B61
B61 -->|call| B81
B61 -->|after return| B62
B62 -->|call| B81
B62 -->|after return| B63
B63 -->|call| B81
B63 -->|after return| B64
B65 -->|call| B75
B65 -->|after return| B66
B66 -->|call| B81
B66 -->|after return| B67
B67 -->|call| B75
B67 -->|after return| B68
B68 -->|call| B81
B68 -->|after return| B69
B81["Continue at B82 in section 9"]
B75["Continue at B76 in section 8"]
```

### B61

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

### B62

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

### B63

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

### B64

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

### B65

Return to the instruction following the active call.

```asm
RET
```

### B66

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B67

```asm
ACALL LDELAY
```

### B68

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B69

```asm
ACALL LDELAY
```

### B70

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: CMD - lines 206 to 208"]
B71["B72: instructions - lines 209 to 209"]
B72["B73: instructions - lines 210 to 212"]
B73["B74: instructions - lines 213 to 213"]
B74["B75: instructions - lines 214 to 214"]
B75["B76: COMMON - lines 218 to 223"]
B76["B77: WSTR - lines 227 to 227"]
B77["B78: CONT1 - lines 229 to 231"]
B78["B79: PRINT - lines 233 to 233"]
B79["B80: instructions - lines 234 to 235"]
B70 -->|call| B75
B70 -->|after return| B71
B71 -->|call| B81
B71 -->|after return| B72
B72 -->|call| B75
B72 -->|after return| B73
B73 -->|call| B81
B73 -->|after return| B74
B76 -->|next| B77
B77 -->|condition true| B80
B77 -->|condition false| B78
B78 -->|call| B65
B78 -->|after return| B79
B79 -->|jump| B77
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
B65["Continue at B66 in section 7"]
```

### B71

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B72

```asm
ACALL LDELAY
```

### B73

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B74

```asm
ACALL LDELAY
```

### B75

Return to the instruction following the active call.

```asm
RET
```

### B76

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B77

```asm
PUSH    ACC
```

### B78

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B79

```asm
ACALL    WCHR
```

### B80

```asm
INC DPTR
AJMP    CONT1
```

## Section 9

```mermaid
flowchart TD
B80["B81: EXIT1 - lines 236 to 237"]
B81["B82: LDELAY - lines 241 to 241"]
B82["B83: HH - lines 242 to 242"]
B83["B84: instructions - lines 243 to 243"]
B84["B85: DELAY - lines 245 to 245"]
B85["B86: HE - lines 246 to 246"]
B86["B87: HE1 - lines 247 to 247"]
B87["B88: instructions - lines 248 to 248"]
B88["B89: instructions - lines 249 to 249"]
B81 -->|next| B82
B82 -->|condition true| B82
B82 -->|condition false| B83
B84 -->|next| B85
B85 -->|next| B86
B86 -->|condition true| B86
B86 -->|condition false| B87
B87 -->|condition true| B85
B87 -->|condition false| B88
```

### B81

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B82

```asm
MOV R0, #50
```

### B83

```asm
DJNZ R0,HH
```

### B84

Return to the instruction following the active call.

```asm
RET
```

### B85

```asm
MOV R0, #50
```

### B86

```asm
MOV R7,#100
```

### B87

```asm
DJNZ R7, HE1
```

### B88

```asm
DJNZ R0,HE
```

### B89

Return to the instruction following the active call.

```asm
RET
```
