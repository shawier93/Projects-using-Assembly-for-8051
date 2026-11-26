# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 4 to 5"]
B2["B3: instructions - lines 6 to 7"]
B3["B4: instructions - lines 8 to 8"]
B4["B5: WAIT0 - lines 10 to 10"]
B5["B6: instructions - lines 11 to 11"]
B6["B7: instructions - lines 13 to 14"]
B7["B8: instructions - lines 15 to 15"]
B8["B9: WAIT1 - lines 17 to 17"]
B9["B10: instructions - lines 18 to 18"]
B0 -->|call| B92
B0 -->|after return| B1
B1 -->|call| B86
B1 -->|after return| B2
B2 -->|call| B81
B2 -->|after return| B3
B3 -->|next| B4
B4 -->|call| B97
B4 -->|after return| B5
B5 -->|condition true| B4
B5 -->|condition false| B6
B6 -->|call| B86
B6 -->|after return| B7
B7 -->|next| B8
B8 -->|call| B97
B8 -->|after return| B9
B9 -->|condition true| B8
B9 -->|condition false| B10
B92["Continue at B93 in section 10"]
B86["Continue at B87 in section 9"]
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
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
MOV DPTR,#S1
ACALL WCHR
```

### B4

```asm
MOV R7,#250
```

### B5

```asm
ACALL LDELAY
```

### B6

```asm
DJNZ R7,WAIT0
```

### B7

```asm
MOV A,#01H
ACALL CMD
```

### B8

```asm
MOV R7,#14
```

### B9

```asm
ACALL LDELAY
```

### B10

```asm
DJNZ R7,WAIT1
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 21 to 22"]
B11["B12: instructions - lines 23 to 25"]
B12["B13: instructions - lines 26 to 26"]
B13["B14: WAIT2 - lines 28 to 28"]
B14["B15: instructions - lines 29 to 29"]
B15["B16: instructions - lines 32 to 33"]
B16["B17: instructions - lines 34 to 34"]
B17["B18: WAIT3 - lines 36 to 36"]
B18["B19: instructions - lines 37 to 37"]
B19["B20: instructions - lines 40 to 41"]
B10 -->|call| B86
B10 -->|after return| B11
B11 -->|call| B81
B11 -->|after return| B12
B12 -->|next| B13
B13 -->|call| B97
B13 -->|after return| B14
B14 -->|condition true| B13
B14 -->|condition false| B15
B15 -->|call| B86
B15 -->|after return| B16
B16 -->|next| B17
B17 -->|call| B97
B17 -->|after return| B18
B18 -->|condition true| B17
B18 -->|condition false| B19
B19 -->|call| B86
B19 -->|after return| B20
B86["Continue at B87 in section 9"]
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#80H
ACALL CMD
```

### B12

```asm
MOV DPTR,#S2
MOV A,#32H
ACALL WCHR
```

### B13

```asm
MOV R7,#250
```

### B14

```asm
ACALL LDELAY
```

### B15

```asm
DJNZ R7,WAIT2
```

### B16

```asm
MOV A,#01H
ACALL CMD
```

### B17

```asm
MOV R7,#14
```

### B18

```asm
ACALL LDELAY
```

### B19

```asm
DJNZ R7,WAIT3
```

### B20

```asm
MOV A,#80H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 42 to 43"]
B21["B22: instructions - lines 44 to 44"]
B22["B23: WAIT4 - lines 46 to 46"]
B23["B24: instructions - lines 47 to 47"]
B24["B25: instructions - lines 49 to 50"]
B25["B26: instructions - lines 51 to 51"]
B26["B27: WAIT5 - lines 53 to 53"]
B27["B28: instructions - lines 54 to 54"]
B28["B29: instructions - lines 55 to 56"]
B29["B30: instructions - lines 57 to 58"]
B20 -->|call| B81
B20 -->|after return| B21
B21 -->|next| B22
B22 -->|call| B97
B22 -->|after return| B23
B23 -->|condition true| B22
B23 -->|condition false| B24
B24 -->|call| B86
B24 -->|after return| B25
B25 -->|next| B26
B26 -->|call| B97
B26 -->|after return| B27
B27 -->|condition true| B26
B27 -->|condition false| B28
B28 -->|call| B86
B28 -->|after return| B29
B29 -->|call| B81
B29 -->|after return| B30
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
B86["Continue at B87 in section 9"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#34H
ACALL WCHR
```

### B22

```asm
MOV R7,#250
```

### B23

```asm
ACALL LDELAY
```

### B24

```asm
DJNZ R7,WAIT4
```

### B25

```asm
MOV A,#01H
ACALL CMD
```

### B26

```asm
MOV R7,#14
```

### B27

```asm
ACALL LDELAY
```

### B28

```asm
DJNZ R7,WAIT5
```

### B29

```asm
MOV A,#0C0H
ACALL CMD
```

### B30

```asm
MOV DPTR,#S3
ACALL WCHR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 60 to 61"]
B31["B32: instructions - lines 62 to 63"]
B32["B33: instructions - lines 64 to 64"]
B33["B34: WAIT8 - lines 66 to 66"]
B34["B35: instructions - lines 67 to 67"]
B35["B36: instructions - lines 70 to 71"]
B36["B37: instructions - lines 72 to 72"]
B37["B38: WAIT9 - lines 74 to 74"]
B38["B39: instructions - lines 75 to 75"]
B39["B40: instructions - lines 79 to 80"]
B30 -->|call| B86
B30 -->|after return| B31
B31 -->|call| B81
B31 -->|after return| B32
B32 -->|next| B33
B33 -->|call| B97
B33 -->|after return| B34
B34 -->|condition true| B33
B34 -->|condition false| B35
B35 -->|call| B86
B35 -->|after return| B36
B36 -->|next| B37
B37 -->|call| B97
B37 -->|after return| B38
B38 -->|condition true| B37
B38 -->|condition false| B39
B39 -->|call| B86
B39 -->|after return| B40
B86["Continue at B87 in section 9"]
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#80H
ACALL CMD
```

### B32

```asm
MOV DPTR,#S4
ACALL WCHR
```

### B33

```asm
MOV R7,#250
```

### B34

```asm
ACALL LDELAY
```

### B35

```asm
DJNZ R7,WAIT8
```

### B36

```asm
MOV A,#01H
ACALL CMD
```

### B37

```asm
MOV R7,#14
```

### B38

```asm
ACALL LDELAY
```

### B39

```asm
DJNZ R7,WAIT9
```

### B40

```asm
MOV A,#80H
ACALL CMD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 81 to 83"]
B41["B42: instructions - lines 84 to 84"]
B42["B43: WAIT7 - lines 86 to 86"]
B43["B44: instructions - lines 87 to 87"]
B44["B45: instructions - lines 90 to 91"]
B45["B46: instructions - lines 92 to 92"]
B46["B47: WAIT77 - lines 94 to 94"]
B47["B48: instructions - lines 95 to 95"]
B48["B49: instructions - lines 98 to 99"]
B49["B50: instructions - lines 100 to 101"]
B40 -->|call| B81
B40 -->|after return| B41
B41 -->|next| B42
B42 -->|call| B97
B42 -->|after return| B43
B43 -->|condition true| B42
B43 -->|condition false| B44
B44 -->|call| B86
B44 -->|after return| B45
B45 -->|next| B46
B46 -->|call| B97
B46 -->|after return| B47
B47 -->|condition true| B46
B47 -->|condition false| B48
B48 -->|call| B86
B48 -->|after return| B49
B49 -->|call| B81
B49 -->|after return| B50
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
B86["Continue at B87 in section 9"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR,#NUM
MOV A,#35H
ACALL WCHR
```

### B42

```asm
MOV R7,#250
```

### B43

```asm
ACALL LDELAY
```

### B44

```asm
DJNZ R7,WAIT7
```

### B45

```asm
MOV A,#01H
ACALL CMD
```

### B46

```asm
MOV R7,#14
```

### B47

```asm
ACALL LDELAY
```

### B48

```asm
DJNZ R7,WAIT77
```

### B49

```asm
MOV A,#0C0H
ACALL CMD
```

### B50

```asm
MOV A,#S5
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 104 to 105"]
B51["B52: instructions - lines 106 to 108"]
B52["B53: instructions - lines 109 to 109"]
B53["B54: WAIT88 - lines 111 to 111"]
B54["B55: instructions - lines 112 to 112"]
B55["B56: instructions - lines 115 to 116"]
B56["B57: instructions - lines 117 to 117"]
B57["B58: WAIT99 - lines 119 to 119"]
B58["B59: instructions - lines 120 to 120"]
B59["B60: instructions - lines 124 to 125"]
B50 -->|call| B86
B50 -->|after return| B51
B51 -->|call| B81
B51 -->|after return| B52
B52 -->|next| B53
B53 -->|call| B97
B53 -->|after return| B54
B54 -->|condition true| B53
B54 -->|condition false| B55
B55 -->|call| B86
B55 -->|after return| B56
B56 -->|next| B57
B57 -->|call| B97
B57 -->|after return| B58
B58 -->|condition true| B57
B58 -->|condition false| B59
B59 -->|call| B86
B59 -->|after return| B60
B86["Continue at B87 in section 9"]
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#80H
ACALL CMD
```

### B52

```asm
MOV DPTR,#S6
ACALL WCHR
```

### B53

```asm
MOV R7,#250
```

### B54

```asm
ACALL LDELAY
```

### B55

```asm
DJNZ R7,WAIT88
```

### B56

```asm
MOV A,#01H
ACALL CMD
```

### B57

```asm
MOV R7,#14
```

### B58

```asm
ACALL LDELAY
```

### B59

```asm
DJNZ R7,WAIT99
```

### B60

```asm
MOV A,#80H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 126 to 128"]
B61["B62: instructions - lines 129 to 129"]
B62["B63: WAIT09 - lines 131 to 131"]
B63["B64: instructions - lines 132 to 132"]
B64["B65: instructions - lines 134 to 135"]
B65["B66: instructions - lines 136 to 136"]
B66["B67: WAIT19 - lines 138 to 138"]
B67["B68: instructions - lines 139 to 139"]
B68["B69: instructions - lines 140 to 141"]
B69["B70: instructions - lines 142 to 143"]
B60 -->|call| B81
B60 -->|after return| B61
B61 -->|next| B62
B62 -->|call| B97
B62 -->|after return| B63
B63 -->|condition true| B62
B63 -->|condition false| B64
B64 -->|call| B86
B64 -->|after return| B65
B65 -->|next| B66
B66 -->|call| B97
B66 -->|after return| B67
B67 -->|condition true| B66
B67 -->|condition false| B68
B68 -->|call| B86
B68 -->|after return| B69
B69 -->|call| B81
B69 -->|after return| B70
B81["Continue at B82 in section 9"]
B97["Continue at B98 in section 10"]
B86["Continue at B87 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV DPTR,#NUM1
MOV A,#38H
ACALL WCHR
```

### B62

```asm
MOV R7,#250
```

### B63

```asm
ACALL LDELAY
```

### B64

```asm
DJNZ R7,WAIT09
```

### B65

```asm
MOV A,#01H
ACALL CMD
```

### B66

```asm
MOV R7,#14
```

### B67

```asm
ACALL LDELAY
```

### B68

```asm
DJNZ R7,WAIT19
```

### B69

```asm
MOV A,#0C0H
ACALL CMD
```

### B70

```asm
MOV A,#S7
ACALL WCHR
```

## Section 8

```mermaid
flowchart TD
B70["B71: FINISH - lines 145 to 145"]
B71["B72: instructions - lines 151 to 174"]
B72["B73: NEXTBOOKING - lines 176 to 177"]
B73["B74: instructions - lines 178 to 181"]
B74["B75: instructions - lines 182 to 184"]
B75["B76: NEXT1 - lines 187 to 187"]
B76["B77: instructions - lines 188 to 191"]
B77["B78: instructions - lines 192 to 194"]
B78["B79: ERROR - lines 196 to 196"]
B79["B80: CALC - lines 198 to 201"]
B70 -->|jump| B70
B71 -->|next| B72
B72 -->|condition true| B75
B72 -->|condition false| B73
B73 -->|condition true| B80
B73 -->|condition false| B74
B74 -->|jump| B79
B75 -->|condition true| B78
B75 -->|condition false| B76
B76 -->|condition true| B80
B76 -->|condition false| B77
B77 -->|jump| B79
B78 -->|jump| B78
B79 -->|jump| B72
B80["Continue at B81 in section 9"]
```

### B71

```asm
SJMP FINISH
```

### B72

```asm
MOV 30H,#2
MOV 40H,#4
MOV 50H,#0
MOV DPTR,#GOLD
CLR A
MOVC A,@A+DPTR
MOV 31H,A
INC DPTR
CLR A
MOVC A,@A+DPTR
MOV 32H,A
MOV DPTR,#SILVER
CLR A
MOVC A,@A+DPTR
MOV 41H,A
INC DPTR
CLR A
MOVC A,@A+DPTR
MOV 42H,A
```

### B73

```asm
MOV A,30H
CJNE A,#1,NEXT1
```

### B74

```asm
MOV A,31H
CLR C
SUBB A,40H
JC NOAVAIL
```

### B75

```asm
MOV 31H,A
MOV B,32H
SJMP CALC
```

### B76

```asm
CJNE A,#2,ERROR
```

### B77

```asm
CLR C
MOV A,41H
SUBB A,40H
JC NOAVAIL
```

### B78

```asm
MOV 41H,A
MOV B,42H
SJMP CALC
```

### B79

```asm
SJMP $
```

### B80

```asm
MOV A,40H
MUL AB
MOV 50H,A
SJMP NEXTBOOKING
```

## Section 9

```mermaid
flowchart TD
B80["B81: NOAVAIL - lines 204 to 204"]
B81["B82: WCHR - lines 212 to 216"]
B82["B83: instructions - lines 217 to 217"]
B83["B84: instructions - lines 218 to 220"]
B84["B85: instructions - lines 221 to 221"]
B85["B86: instructions - lines 222 to 224"]
B86["B87: CMD - lines 229 to 231"]
B87["B88: instructions - lines 232 to 232"]
B88["B89: instructions - lines 233 to 235"]
B89["B90: instructions - lines 236 to 236"]
B80 -->|jump| B80
B81 -->|call| B91
B81 -->|after return| B82
B82 -->|call| B97
B82 -->|after return| B83
B83 -->|call| B91
B83 -->|after return| B84
B84 -->|call| B97
B84 -->|after return| B85
B86 -->|call| B91
B86 -->|after return| B87
B87 -->|call| B97
B87 -->|after return| B88
B88 -->|call| B91
B88 -->|after return| B89
B89 -->|call| B97
B89 -->|after return| B90
B91["Continue at B92 in section 10"]
B97["Continue at B98 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
SJMP $
```

### B82

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B83

```asm
ACALL LDELAY
```

### B84

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B85

```asm
ACALL LDELAY
```

### B86

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B87

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B88

```asm
ACALL LDELAY
```

### B89

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B90

```asm
ACALL LDELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 237 to 237"]
B91["B92: COMMON - lines 242 to 247"]
B92["B93: INLCD - lines 252 to 259"]
B93["B94: instructions - lines 260 to 268"]
B94["B95: instructions - lines 269 to 281"]
B95["B96: instructions - lines 282 to 292"]
B96["B97: instructions - lines 293 to 293"]
B97["B98: LDELAY - lines 297 to 298"]
B98["B99: instructions - lines 299 to 299"]
B92 -->|call| B97
B92 -->|after return| B93
B93 -->|call| B97
B93 -->|after return| B94
B94 -->|call| B97
B94 -->|after return| B95
B95 -->|call| B97
B95 -->|after return| B96
B97 -->|condition true| B97
B97 -->|condition false| B98
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B93

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

### B94

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

### B95

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

### B96

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

### B97

Return to the instruction following the active call.

```asm
RET
```

### B98

```asm
MOV R0, #50
DJNZ R0, $
```

### B99

Return to the instruction following the active call.

```asm
RET
```
