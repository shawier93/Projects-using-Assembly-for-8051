# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

## Destinations requiring review

`DELAY`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 8 to 8"]
B1["B2: instructions - lines 9 to 19"]
B2["B3: instructions - lines 21 to 21"]
B3["B4: instructions - lines 22 to 23"]
B4["B5: instructions - lines 24 to 25"]
B5["B6: instructions - lines 26 to 26"]
B6["B7: instructions - lines 28 to 29"]
B7["B8: instructions - lines 30 to 31"]
B8["B9: instructions - lines 32 to 32"]
B9["B10: START - lines 36 to 36"]
B0 -->|call| B95
B0 -->|after return| B1
B1 -->|call| B95
B1 -->|after return| B2
B2 -->|call| B102
B2 -->|after return| B3
B3 -->|call| B89
B3 -->|after return| B4
B4 -->|call| B107
B4 -->|after return| B5
B5 -->|call| B100
B5 -->|after return| B6
B6 -->|call| B89
B6 -->|after return| B7
B7 -->|call| B107
B7 -->|after return| B8
B8 -->|call| B100
B8 -->|after return| B9
B9 -->|call| B39
B9 -->|after return| B10
B95["Continue at B96 in section 10"]
B102["Continue at B103 in section 11"]
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B100["Continue at B101 in section 11"]
B39["Continue at B40 in section 4"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#4
MOV 40H,#6
MOV 41H,#3
MOV 50H,#00
MOV 51H,#00
MOV 60H,#01
ACALL INLCD
```

### B3

```asm
ACALL CLEAR
```

### B4

```asm
mov a, #80H
acall cmd
```

### B5

```asm
mov dptr, #STR1
acall WSTR
```

### B6

```asm
ACALL LDELAY
```

### B7

```asm
mov a, #0C0H
acall cmd
```

### B8

```asm
mov dptr, #STR2
acall WSTR
```

### B9

```asm
ACALL LDELAY
```

### B10

```asm
ACALL MENU
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 38 to 38"]
B11["B12: instructions - lines 39 to 40"]
B12["B13: instructions - lines 41 to 41"]
B13["B14: instructions - lines 42 to 45"]
B14["B15: instructions - lines 46 to 46"]
B15["B16: SUBTRACT - lines 50 to 50"]
B16["B17: instructions - lines 51 to 51"]
B17["B18: instructions - lines 52 to 55"]
B18["B19: instructions - lines 56 to 56"]
B19["B20: MULTIPLICATION - lines 59 to 59"]
B10 -->|call| B47
B10 -->|after return| B11
B11 -->|condition true| B15
B11 -->|condition false| B12
B12 -->|call| B53
B12 -->|after return| B13
B13 -->|call| B63
B13 -->|after return| B14
B14 -->|jump| B33
B15 -->|condition true| B19
B15 -->|condition false| B16
B16 -->|call| B53
B16 -->|after return| B17
B17 -->|call| B63
B17 -->|after return| B18
B18 -->|jump| B33
B19 -->|condition true| B23
B19 -->|condition false| B20
B47["Continue at B48 in section 5"]
B53["Continue at B54 in section 6"]
B63["Continue at B64 in section 7"]
B33["Continue at B34 in section 4"]
B23["Continue at B24 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL SELECTION
```

### B12

```asm
MOV A,30H
CJNE A,#1,SUBTRACT
```

### B13

```asm
ACALL NUMBERS
```

### B14

```asm
MOV A,40H
ADD A,41H
MOV 50H,A
ACALL RESULTS
```

### B15

```asm
SJMP NEXT
```

### B16

```asm
CJNE A,#2,MULTIPLICATION
```

### B17

```asm
ACALL NUMBERS
```

### B18

```asm
MOV A,40H
SUBB A,41H
MOV 50H,A
ACALL RESULTS
```

### B19

```asm
SJMP NEXT
```

### B20

```asm
CJNE A,#3,DIVISION
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 60 to 60"]
B21["B22: instructions - lines 61 to 65"]
B22["B23: instructions - lines 67 to 67"]
B23["B24: DIVISION - lines 70 to 70"]
B24["B25: instructions - lines 71 to 71"]
B25["B26: instructions - lines 72 to 77"]
B26["B27: instructions - lines 78 to 78"]
B27["B28: instructions - lines 79 to 79"]
B28["B29: WRONG - lines 82 to 82"]
B29["B30: instructions - lines 83 to 84"]
B20 -->|call| B53
B20 -->|after return| B21
B21 -->|call| B63
B21 -->|after return| B22
B22 -->|jump| B33
B23 -->|condition true| B28
B23 -->|condition false| B24
B24 -->|call| B53
B24 -->|after return| B25
B25 -->|call| B63
B25 -->|after return| B26
B26 -->|call| B70
B26 -->|after return| B27
B27 -->|jump| B33
B28 -->|call| B102
B28 -->|after return| B29
B29 -->|call| B89
B29 -->|after return| B30
B53["Continue at B54 in section 6"]
B63["Continue at B64 in section 7"]
B33["Continue at B34 in section 4"]
B70["Continue at B71 in section 8"]
B102["Continue at B103 in section 11"]
B89["Continue at B90 in section 9"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL NUMBERS
```

### B22

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV 50H,A
ACALL RESULTS
```

### B23

```asm
SJMP NEXT
```

### B24

```asm
CJNE A,#4,WRONG
```

### B25

```asm
ACALL NUMBERS
```

### B26

```asm
MOV A,40H
MOV B,41H
DIV AB
MOV 50H,A
MOV 51H,B
ACALL RESULTS
```

### B27

```asm
ACALL REMINDER
```

### B28

```asm
SJMP NEXT
```

### B29

```asm
ACALL CLEAR
```

### B30

```asm
mov a, #80H
acall cmd
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 85 to 86"]
B31["B32: instructions - lines 87 to 87"]
B32["B33: instructions - lines 88 to 88"]
B33["B34: NEXT - lines 92 to 92"]
B34["B35: STOPP - lines 95 to 95"]
B35["B36: FLASHING - lines 100 to 100"]
B36["B37: HERE - lines 102 to 103"]
B37["B38: instructions - lines 104 to 104"]
B38["B39: instructions - lines 105 to 105"]
B39["B40: MENU - lines 109 to 109"]
B30 -->|call| B107
B30 -->|after return| B31
B31 -->|call| B100
B31 -->|after return| B32
B32 -->|jump| B9
B33 -->|call| B75
B33 -->|after return| B34
B34 -->|jump| B34
B35 -->|next| B36
B36 -->|call| BX1
B36 -->|after return| B37
B37 -->|condition true| B36
B37 -->|condition false| B38
B39 -->|call| B102
B39 -->|after return| B40
B107["Continue at B108 in section 11"]
B100["Continue at B101 in section 11"]
B9["Continue at B10 in section 1"]
B75["Continue at B76 in section 8"]
BX1["Unresolved destination: DELAY"]
B102["Continue at B103 in section 11"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
mov dptr, #STR10
acall WSTR
```

### B32

```asm
ACALL LDELAY
```

### B33

```asm
SJMP START
```

### B34

```asm
ACALL CONTINUE
```

### B35

```asm
SJMP STOPP
```

### B36

```asm
MOV R3,#6
```

### B37

```asm
CPL P1.0
ACALL DELAY
```

### B38

```asm
DJNZ R3,HERE
```

### B39

Return to the instruction following the active call.

```asm
RET
```

### B40

```asm
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 110 to 111"]
B41["B42: instructions - lines 112 to 113"]
B42["B43: instructions - lines 114 to 114"]
B43["B44: instructions - lines 116 to 117"]
B44["B45: instructions - lines 118 to 119"]
B45["B46: instructions - lines 120 to 120"]
B46["B47: instructions - lines 121 to 121"]
B47["B48: SELECTION - lines 124 to 124"]
B48["B49: instructions - lines 125 to 126"]
B49["B50: instructions - lines 127 to 128"]
B40 -->|call| B89
B40 -->|after return| B41
B41 -->|call| B107
B41 -->|after return| B42
B42 -->|call| B100
B42 -->|after return| B43
B43 -->|call| B89
B43 -->|after return| B44
B44 -->|call| B107
B44 -->|after return| B45
B45 -->|call| B100
B45 -->|after return| B46
B47 -->|call| B102
B47 -->|after return| B48
B48 -->|call| B89
B48 -->|after return| B49
B49 -->|call| B107
B49 -->|after return| B50
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B100["Continue at B101 in section 11"]
B102["Continue at B103 in section 11"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov a, #80H
acall cmd
```

### B42

```asm
mov dptr, #STR3
acall WSTR
```

### B43

```asm
ACALL LDELAY
```

### B44

```asm
mov a, #0C0H
acall cmd
```

### B45

```asm
mov dptr, #STR4
acall WSTR
```

### B46

```asm
ACALL LDELAY
```

### B47

Return to the instruction following the active call.

```asm
RET
```

### B48

```asm
ACALL CLEAR
```

### B49

```asm
mov a, #80H
acall cmd
```

### B50

```asm
mov dptr, #STR5
acall WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 129 to 129"]
B51["B52: instructions - lines 130 to 132"]
B52["B53: instructions - lines 133 to 133"]
B53["B54: NUMBERS - lines 136 to 136"]
B54["B55: instructions - lines 137 to 138"]
B55["B56: instructions - lines 139 to 140"]
B56["B57: instructions - lines 141 to 141"]
B57["B58: instructions - lines 142 to 144"]
B58["B59: instructions - lines 146 to 147"]
B59["B60: instructions - lines 148 to 149"]
B50 -->|call| B100
B50 -->|after return| B51
B51 -->|call| B84
B51 -->|after return| B52
B53 -->|call| B102
B53 -->|after return| B54
B54 -->|call| B89
B54 -->|after return| B55
B55 -->|call| B107
B55 -->|after return| B56
B56 -->|call| B100
B56 -->|after return| B57
B57 -->|call| B84
B57 -->|after return| B58
B58 -->|call| B89
B58 -->|after return| B59
B59 -->|call| B107
B59 -->|after return| B60
B100["Continue at B101 in section 11"]
B84["Continue at B85 in section 9"]
B102["Continue at B103 in section 11"]
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL LDELAY
```

### B52

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B53

Return to the instruction following the active call.

```asm
RET
```

### B54

```asm
ACALL CLEAR
```

### B55

```asm
mov a, #80H
acall cmd
```

### B56

```asm
mov dptr, #STR6
acall WSTR
```

### B57

```asm
ACALL LDELAY
```

### B58

```asm
MOV A,40H
ADD A,#30H
ACALL WCHR
```

### B59

```asm
mov a, #0C0H
acall cmd
```

### B60

```asm
mov dptr, #STR7
acall WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 150 to 150"]
B61["B62: instructions - lines 151 to 153"]
B62["B63: instructions - lines 154 to 154"]
B63["B64: RESULTS - lines 157 to 157"]
B64["B65: instructions - lines 158 to 159"]
B65["B66: instructions - lines 160 to 161"]
B66["B67: instructions - lines 162 to 162"]
B67["B68: instructions - lines 163 to 167"]
B68["B69: instructions - lines 168 to 170"]
B69["B70: instructions - lines 171 to 171"]
B60 -->|call| B100
B60 -->|after return| B61
B61 -->|call| B84
B61 -->|after return| B62
B63 -->|call| B102
B63 -->|after return| B64
B64 -->|call| B89
B64 -->|after return| B65
B65 -->|call| B107
B65 -->|after return| B66
B66 -->|call| B100
B66 -->|after return| B67
B67 -->|call| B84
B67 -->|after return| B68
B68 -->|call| B84
B68 -->|after return| B69
B100["Continue at B101 in section 11"]
B84["Continue at B85 in section 9"]
B102["Continue at B103 in section 11"]
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
```

### B61

```asm
ACALL LDELAY
```

### B62

```asm
MOV A,41H
ADD A,#30H
ACALL WCHR
```

### B63

Return to the instruction following the active call.

```asm
RET
```

### B64

```asm
ACALL CLEAR
```

### B65

```asm
mov a, #80H
acall cmd
```

### B66

```asm
mov dptr, #STR8
acall WSTR
```

### B67

```asm
ACALL LDELAY
```

### B68

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B69

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: REMINDER - lines 175 to 176"]
B71["B72: instructions - lines 177 to 178"]
B72["B73: instructions - lines 179 to 179"]
B73["B74: instructions - lines 180 to 182"]
B74["B75: instructions - lines 183 to 183"]
B75["B76: CONTINUE - lines 186 to 186"]
B76["B77: instructions - lines 187 to 188"]
B77["B78: instructions - lines 189 to 190"]
B78["B79: instructions - lines 191 to 191"]
B79["B80: instructions - lines 193 to 194"]
B70 -->|call| B89
B70 -->|after return| B71
B71 -->|call| B107
B71 -->|after return| B72
B72 -->|call| B100
B72 -->|after return| B73
B73 -->|call| B84
B73 -->|after return| B74
B75 -->|call| B102
B75 -->|after return| B76
B76 -->|call| B89
B76 -->|after return| B77
B77 -->|call| B107
B77 -->|after return| B78
B78 -->|call| B100
B78 -->|after return| B79
B79 -->|call| B89
B79 -->|after return| B80
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B100["Continue at B101 in section 11"]
B84["Continue at B85 in section 9"]
B102["Continue at B103 in section 11"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov a, #0C0H
acall cmd
```

### B72

```asm
mov dptr, #STR9
acall WSTR
```

### B73

```asm
ACALL LDELAY
```

### B74

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
```

### B75

Return to the instruction following the active call.

```asm
RET
```

### B76

```asm
ACALL CLEAR
```

### B77

```asm
mov a, #80H
acall cmd
```

### B78

```asm
mov dptr, #STR11
acall WSTR
```

### B79

```asm
ACALL LDELAY
```

### B80

```asm
mov a, #0C0H
acall cmd
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 195 to 196"]
B81["B82: instructions - lines 197 to 197"]
B82["B83: instructions - lines 199 to 201"]
B83["B84: instructions - lines 202 to 202"]
B84["B85: WCHR - lines 205 to 209"]
B85["B86: instructions - lines 210 to 210"]
B86["B87: instructions - lines 211 to 213"]
B87["B88: instructions - lines 214 to 214"]
B88["B89: instructions - lines 215 to 217"]
B89["B90: CMD - lines 220 to 222"]
B80 -->|call| B107
B80 -->|after return| B81
B81 -->|call| B100
B81 -->|after return| B82
B82 -->|call| B84
B82 -->|after return| B83
B84 -->|call| B94
B84 -->|after return| B85
B85 -->|call| B100
B85 -->|after return| B86
B86 -->|call| B94
B86 -->|after return| B87
B87 -->|call| B100
B87 -->|after return| B88
B89 -->|call| B94
B89 -->|after return| B90
B107["Continue at B108 in section 11"]
B100["Continue at B101 in section 11"]
B94["Continue at B95 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov dptr, #STR12
acall WSTR
```

### B82

```asm
ACALL LDELAY
```

### B83

```asm
MOV A,60H
ADD A,#30H
ACALL WCHR
```

### B84

Return to the instruction following the active call.

```asm
RET
```

### B85

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B86

```asm
ACALL LDELAY
```

### B87

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B88

```asm
ACALL LDELAY
```

### B89

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B90

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 223 to 223"]
B91["B92: instructions - lines 224 to 226"]
B92["B93: instructions - lines 227 to 227"]
B93["B94: instructions - lines 228 to 228"]
B94["B95: COMMON - lines 231 to 236"]
B95["B96: INLCD - lines 239 to 246"]
B96["B97: instructions - lines 247 to 255"]
B97["B98: instructions - lines 256 to 268"]
B98["B99: instructions - lines 269 to 279"]
B99["B100: instructions - lines 280 to 280"]
B90 -->|call| B100
B90 -->|after return| B91
B91 -->|call| B94
B91 -->|after return| B92
B92 -->|call| B100
B92 -->|after return| B93
B95 -->|call| B100
B95 -->|after return| B96
B96 -->|call| B100
B96 -->|after return| B97
B97 -->|call| B100
B97 -->|after return| B98
B98 -->|call| B100
B98 -->|after return| B99
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL LDELAY
```

### B92

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B93

```asm
ACALL LDELAY
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B96

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

### B97

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

### B98

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

### B99

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

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: LDELAY - lines 283 to 284"]
B101["B102: instructions - lines 285 to 285"]
B102["B103: CLEAR - lines 288 to 289"]
B103["B104: instructions - lines 290 to 290"]
B104["B105: WAIT - lines 291 to 291"]
B105["B106: instructions - lines 292 to 292"]
B106["B107: instructions - lines 293 to 293"]
B107["B108: WSTR - lines 296 to 296"]
B108["B109: CONT1 - lines 298 to 300"]
B109["B110: PRINT - lines 302 to 302"]
B100 -->|condition true| B100
B100 -->|condition false| B101
B102 -->|call| B89
B102 -->|after return| B103
B103 -->|next| B104
B104 -->|call| B100
B104 -->|after return| B105
B105 -->|condition true| B104
B105 -->|condition false| B106
B107 -->|next| B108
B108 -->|condition true| B111
B108 -->|condition false| B109
B109 -->|call| B84
B109 -->|after return| B110
B89["Continue at B90 in section 9"]
B111["Continue at B112 in section 12"]
B84["Continue at B85 in section 9"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV R0, #50
DJNZ R0, $
```

### B102

Return to the instruction following the active call.

```asm
RET
```

### B103

```asm
MOV A,#01H
ACALL CMD
```

### B104

```asm
MOV R7,#14
```

### B105

```asm
ACALL LDELAY
```

### B106

```asm
DJNZ R7,WAIT
```

### B107

Return to the instruction following the active call.

```asm
ret
```

### B108

```asm
PUSH    ACC
```

### B109

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B110

```asm
ACALL    WCHR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 303 to 304"]
B111["B112: EXIT1 - lines 305 to 306"]
B110 -->|jump| B108
B108["Continue at B109 in section 11"]
```

### B111

```asm
INC DPTR
AJMP    CONT1
```

### B112

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
