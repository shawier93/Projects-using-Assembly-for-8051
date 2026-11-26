# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13)

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 4 to 4"]
B1["B2: instructions - lines 5 to 8"]
B2["B3: WELCOME - lines 11 to 12"]
B3["B4: instructions - lines 13 to 13"]
B4["B5: instructions - lines 14 to 15"]
B5["B6: instructions - lines 16 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: MAIN_MENUE - lines 21 to 22"]
B8["B9: instructions - lines 23 to 23"]
B9["B10: instructions - lines 24 to 25"]
B0 -->|call| B85
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B79
B2 -->|after return| B3
B3 -->|call| B92
B3 -->|after return| B4
B4 -->|call| B79
B4 -->|after return| B5
B5 -->|call| B69
B5 -->|after return| B6
B6 -->|call| B116
B6 -->|after return| B7
B7 -->|call| B79
B7 -->|after return| B8
B8 -->|call| B92
B8 -->|after return| B9
B9 -->|call| B79
B9 -->|after return| B10
B85["Continue at B86 in section 9"]
B79["Continue at B80 in section 8"]
B92["Continue at B93 in section 10"]
B69["Continue at B70 in section 7"]
B116["Continue at B117 in section 12"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#00H
MOV 33H,#09H
MOV 34H,#09H
MOV 40H,#00H
```

### B3

```asm
MOV A, #1H
ACALL CMD
```

### B4

```asm
ACALL CLR_DELAY
```

### B5

```asm
MOV A,#80H
ACALL CMD
```

### B6

```asm
MOV DPTR, #WELCOME_MSG
ACALL WSTR
```

### B7

```asm
ACALL DELAY_2SEC
```

### B8

```asm
MOV A, #1H
ACALL CMD
```

### B9

```asm
ACALL CLR_DELAY
```

### B10

```asm
MOV A,#80H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 26 to 27"]
B11["B12: instructions - lines 28 to 28"]
B12["B13: instructions - lines 29 to 33"]
B13["B14: instructions - lines 34 to 34"]
B14["B15: GOLD_TICKETS - lines 38 to 38"]
B15["B16: instructions - lines 39 to 40"]
B16["B17: instructions - lines 41 to 41"]
B17["B18: instructions - lines 42 to 43"]
B18["B19: instructions - lines 44 to 45"]
B19["B20: instructions - lines 46 to 46"]
B10 -->|call| B69
B10 -->|after return| B11
B11 -->|call| B96
B11 -->|after return| B12
B12 -->|call| B74
B12 -->|after return| B13
B13 -->|call| B116
B13 -->|after return| B14
B14 -->|condition true| B34
B14 -->|condition false| B15
B15 -->|call| B79
B15 -->|after return| B16
B16 -->|call| B92
B16 -->|after return| B17
B17 -->|call| B79
B17 -->|after return| B18
B18 -->|call| B69
B18 -->|after return| B19
B19 -->|call| B96
B19 -->|after return| B20
B69["Continue at B70 in section 7"]
B96["Continue at B97 in section 10"]
B74["Continue at B75 in section 8"]
B116["Continue at B117 in section 12"]
B34["Continue at B35 in section 4"]
B79["Continue at B80 in section 8"]
B92["Continue at B93 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR, #MENUE_MSG
ACALL WSTR
```

### B12

```asm
ACALL KEYPAD
```

### B13

```asm
SUBB A,#30H
MOV 30H,A
MOV R2, A
ADD A, #30H
ACALL WCHR
```

### B14

```asm
ACALL DELAY_2SEC
```

### B15

```asm
CJNE R2, #1, SILVER_TICKETS
```

### B16

```asm
MOV A, #1H
ACALL CMD
```

### B17

```asm
ACALL CLR_DELAY
```

### B18

```asm
MOV A,#80H
ACALL CMD
```

### B19

```asm
MOV DPTR, #TICKETS_MSG
ACALL WSTR
```

### B20

```asm
ACALL KEYPAD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 47 to 51"]
B21["B22: instructions - lines 58 to 62"]
B22["B23: instructions - lines 63 to 63"]
B23["B24: OTHERWISE - lines 65 to 65"]
B24["B25: instructions - lines 67 to 68"]
B25["B26: instructions - lines 69 to 70"]
B26["B27: instructions - lines 71 to 71"]
B27["B28: instructions - lines 72 to 72"]
B28["B29: LESS_EQUAL - lines 75 to 89"]
B29["B30: instructions - lines 90 to 91"]
B20 -->|call| B74
B20 -->|after return| B21
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B28
B23 -->|condition true| B28
B23 -->|condition false| B24
B24 -->|call| B79
B24 -->|after return| B25
B25 -->|call| B69
B25 -->|after return| B26
B26 -->|call| B116
B26 -->|after return| B27
B27 -->|jump| B7
B28 -->|call| B79
B28 -->|after return| B29
B29 -->|call| B69
B29 -->|after return| B30
B74["Continue at B75 in section 8"]
B79["Continue at B80 in section 8"]
B69["Continue at B70 in section 7"]
B116["Continue at B117 in section 12"]
B7["Continue at B8 in section 1"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
SUBB A,#30H
MOV 40H,A
MOV  R1,A
ADD A,#30H
ACALL WCHR
```

### B22

```asm
MOV A,33H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B, OTHERWISE
```

### B23

```asm
SJMP LESS_EQUAL
```

### B24

```asm
JC LESS_EQUAL
```

### B25

```asm
MOV A,#0C0H
ACALL CMD
```

### B26

```asm
MOV DPTR, #Sorry_MSG
ACALL WSTR
```

### B27

```asm
ACALL DELAY_2SEC
```

### B28

```asm
LJMP MAIN_MENUE
```

### B29

```asm
MOV A, R3
CLR C
SUBB A,R1
MOV 33H,A
MOV A,R1
MOV B, A
CLR A
MOV DPTR, #GOLD_Price
MOVC A, @A+DPTR
MUL AB
MOV 50H,A
MOV R4, A
MOV A,#0C0H
ACALL CMD
```

### B30

```asm
MOV DPTR, #TICKETS_MSG2
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 92 to 93"]
B31["B32: instructions - lines 94 to 95"]
B32["B33: instructions - lines 96 to 96"]
B33["B34: instructions - lines 97 to 97"]
B34["B35: SILVER_TICKETS - lines 101 to 101"]
B35["B36: instructions - lines 103 to 104"]
B36["B37: instructions - lines 105 to 105"]
B37["B38: instructions - lines 106 to 107"]
B38["B39: instructions - lines 108 to 109"]
B39["B40: instructions - lines 110 to 110"]
B30 -->|call| B66
B30 -->|after return| B31
B31 -->|call| B69
B31 -->|after return| B32
B32 -->|call| B116
B32 -->|after return| B33
B33 -->|jump| B7
B34 -->|condition true| B54
B34 -->|condition false| B35
B35 -->|call| B79
B35 -->|after return| B36
B36 -->|call| B92
B36 -->|after return| B37
B37 -->|call| B79
B37 -->|after return| B38
B38 -->|call| B69
B38 -->|after return| B39
B39 -->|call| B96
B39 -->|after return| B40
B66["Continue at B67 in section 7"]
B69["Continue at B70 in section 7"]
B116["Continue at B117 in section 12"]
B7["Continue at B8 in section 1"]
B54["Continue at B55 in section 6"]
B79["Continue at B80 in section 8"]
B92["Continue at B93 in section 10"]
B96["Continue at B97 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A, R4
ACALL DISP_VALUE
```

### B32

```asm
MOV DPTR, #TICKETS_MSG3
ACALL WSTR
```

### B33

```asm
ACALL DELAY_2SEC
```

### B34

```asm
LJMP MAIN_MENUE
```

### B35

```asm
CJNE R2, #2, EXIT
```

### B36

```asm
MOV A, #1H
ACALL CMD
```

### B37

```asm
ACALL CLR_DELAY
```

### B38

```asm
MOV A,#80H
ACALL CMD
```

### B39

```asm
MOV DPTR, #TICKETS_MSG
ACALL WSTR
```

### B40

```asm
ACALL KEYPAD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 111 to 115"]
B41["B42: instructions - lines 118 to 123"]
B42["B43: instructions - lines 124 to 124"]
B43["B44: OTHERWISE0 - lines 126 to 126"]
B44["B45: instructions - lines 127 to 128"]
B45["B46: instructions - lines 129 to 130"]
B46["B47: instructions - lines 131 to 131"]
B47["B48: instructions - lines 132 to 132"]
B48["B49: LESS_EQUAL0 - lines 134 to 148"]
B49["B50: instructions - lines 149 to 150"]
B40 -->|call| B74
B40 -->|after return| B41
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B48
B43 -->|condition true| B48
B43 -->|condition false| B44
B44 -->|call| B79
B44 -->|after return| B45
B45 -->|call| B69
B45 -->|after return| B46
B46 -->|call| B116
B46 -->|after return| B47
B47 -->|jump| B7
B48 -->|call| B79
B48 -->|after return| B49
B49 -->|call| B69
B49 -->|after return| B50
B74["Continue at B75 in section 8"]
B79["Continue at B80 in section 8"]
B69["Continue at B70 in section 7"]
B116["Continue at B117 in section 12"]
B7["Continue at B8 in section 1"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SUBB A,#30H
MOV 40H,A
MOV R1,A
ADD A,#30H
ACALL WCHR
```

### B42

```asm
MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B,OTHERWISE0
```

### B43

```asm
SJMP LESS_EQUAL0
```

### B44

```asm
JC LESS_EQUAL0
```

### B45

```asm
MOV A,#0C0H
ACALL CMD
```

### B46

```asm
MOV DPTR, #Sorry_MSG
ACALL WSTR
```

### B47

```asm
ACALL DELAY_2SEC
```

### B48

```asm
LJMP MAIN_MENUE
```

### B49

```asm
MOV A, R3
CLR C
SUBB A,R1
MOV 34H,A
MOV A,R1
MOV B, A
CLR A
MOV DPTR, #SILVER_Price
MOVC A, @A+DPTR
MUL AB
MOV 50H,A
MOV R4, A
MOV A,#0C0H
ACALL CMD
```

### B50

```asm
MOV DPTR, #TICKETS_MSG2
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 151 to 152"]
B51["B52: instructions - lines 153 to 154"]
B52["B53: instructions - lines 155 to 155"]
B53["B54: instructions - lines 156 to 156"]
B54["B55: EXIT - lines 159 to 160"]
B55["B56: instructions - lines 161 to 161"]
B56["B57: instructions - lines 162 to 163"]
B57["B58: instructions - lines 164 to 165"]
B58["B59: instructions - lines 166 to 166"]
B59["B60: instructions - lines 167 to 167"]
B50 -->|call| B66
B50 -->|after return| B51
B51 -->|call| B69
B51 -->|after return| B52
B52 -->|call| B116
B52 -->|after return| B53
B53 -->|jump| B7
B54 -->|call| B79
B54 -->|after return| B55
B55 -->|call| B92
B55 -->|after return| B56
B56 -->|call| B79
B56 -->|after return| B57
B57 -->|call| B69
B57 -->|after return| B58
B58 -->|call| B116
B58 -->|after return| B59
B59 -->|jump| B120
B66["Continue at B67 in section 7"]
B69["Continue at B70 in section 7"]
B116["Continue at B117 in section 12"]
B7["Continue at B8 in section 1"]
B79["Continue at B80 in section 8"]
B92["Continue at B93 in section 10"]
B120["Continue at B121 in section 13"]
```

### B51

```asm
MOV A, R4
ACALL DISP_VALUE
```

### B52

```asm
MOV DPTR, #TICKETS_MSG3
ACALL WSTR
```

### B53

```asm
ACALL DELAY_2SEC
```

### B54

```asm
LJMP MAIN_MENUE
```

### B55

```asm
MOV A, #1H
ACALL CMD
```

### B56

```asm
ACALL CLR_DELAY
```

### B57

```asm
MOV A,#80H
ACALL CMD
```

### B58

```asm
MOV DPTR, #Thanks_MSG
ACALL WSTR
```

### B59

```asm
ACALL DELAY_2SEC
```

### B60

```asm
LJMP END_PROGRAM
```

## Section 7

```mermaid
flowchart TD
B60["B61: WRONG_CHOICE - lines 170 to 171"]
B61["B62: instructions - lines 172 to 172"]
B62["B63: instructions - lines 173 to 174"]
B63["B64: instructions - lines 175 to 176"]
B64["B65: instructions - lines 177 to 177"]
B65["B66: instructions - lines 178 to 178"]
B66["B67: DISP_VALUE - lines 181 to 184"]
B67["B68: instructions - lines 185 to 187"]
B68["B69: instructions - lines 188 to 188"]
B69["B70: WSTR - lines 194 to 194"]
B60 -->|call| B79
B60 -->|after return| B61
B61 -->|call| B92
B61 -->|after return| B62
B62 -->|call| B79
B62 -->|after return| B63
B63 -->|call| B69
B63 -->|after return| B64
B64 -->|call| B116
B64 -->|after return| B65
B65 -->|jump| B7
B66 -->|call| B74
B66 -->|after return| B67
B67 -->|call| B74
B67 -->|after return| B68
B69 -->|next| B70
B79["Continue at B80 in section 8"]
B92["Continue at B93 in section 10"]
B116["Continue at B117 in section 12"]
B7["Continue at B8 in section 1"]
B74["Continue at B75 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A, #1H
ACALL CMD
```

### B62

```asm
ACALL CLR_DELAY
```

### B63

```asm
MOV A,#80H
ACALL CMD
```

### B64

```asm
MOV DPTR, #WRONG_MSG
ACALL WSTR
```

### B65

```asm
ACALL DELAY_2SEC
```

### B66

```asm
LJMP MAIN_MENUE
```

### B67

```asm
mov b, #10
Div ab
Add a , #30H
Acall WCHR
```

### B68

```asm
Mov a, b
Add a , #30H
Acall WCHR
```

### B69

Return to the instruction following the active call.

```asm
RET
```

### B70

```asm
PUSH ACC
```

## Section 8

```mermaid
flowchart TD
B70["B71: CONT1 - lines 196 to 198"]
B71["B72: PRINT - lines 200 to 200"]
B72["B73: instructions - lines 201 to 202"]
B73["B74: EXIT1 - lines 203 to 204"]
B74["B75: WCHR - lines 208 to 212"]
B75["B76: instructions - lines 213 to 213"]
B76["B77: instructions - lines 214 to 216"]
B77["B78: instructions - lines 217 to 217"]
B78["B79: instructions - lines 218 to 220"]
B79["B80: CMD - lines 223 to 225"]
B70 -->|condition true| B73
B70 -->|condition false| B71
B71 -->|call| B74
B71 -->|after return| B72
B72 -->|jump| B70
B74 -->|call| B84
B74 -->|after return| B75
B75 -->|call| B90
B75 -->|after return| B76
B76 -->|call| B84
B76 -->|after return| B77
B77 -->|call| B90
B77 -->|after return| B78
B79 -->|call| B84
B79 -->|after return| B80
B84["Continue at B85 in section 9"]
B90["Continue at B91 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B72

```asm
ACALL WCHR
```

### B73

```asm
INC DPTR
AJMP CONT1
```

### B74

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B75

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B76

```asm
ACALL LDELAY
```

### B77

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B78

```asm
ACALL LDELAY
```

### B79

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B80

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 226 to 226"]
B81["B82: instructions - lines 227 to 229"]
B82["B83: instructions - lines 230 to 230"]
B83["B84: instructions - lines 231 to 231"]
B84["B85: COMMON - lines 234 to 239"]
B85["B86: INLCD - lines 242 to 249"]
B86["B87: instructions - lines 250 to 258"]
B87["B88: instructions - lines 259 to 271"]
B88["B89: instructions - lines 272 to 282"]
B89["B90: instructions - lines 283 to 283"]
B80 -->|call| B90
B80 -->|after return| B81
B81 -->|call| B84
B81 -->|after return| B82
B82 -->|call| B90
B82 -->|after return| B83
B85 -->|call| B90
B85 -->|after return| B86
B86 -->|call| B90
B86 -->|after return| B87
B87 -->|call| B90
B87 -->|after return| B88
B88 -->|call| B90
B88 -->|after return| B89
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL LDELAY
```

### B82

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B83

```asm
ACALL LDELAY
```

### B84

Return to the instruction following the active call.

```asm
RET
```

### B85

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B86

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

### B87

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

### B88

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

### B89

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

### B90

Return to the instruction following the active call.

```asm
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: LDELAY - lines 286 to 287"]
B91["B92: instructions - lines 288 to 288"]
B92["B93: CLR_DELAY - lines 290 to 290"]
B93["B94: LP2 - lines 291 to 291"]
B94["B95: instructions - lines 292 to 292"]
B95["B96: instructions - lines 293 to 293"]
B96["B97: KEYPAD - lines 297 to 297"]
B97["B98: K1 - lines 298 to 301"]
B98["B99: K2 - lines 303 to 305"]
B99["B100: instructions - lines 306 to 306"]
B90 -->|condition true| B90
B90 -->|condition false| B91
B92 -->|next| B93
B93 -->|call| B90
B93 -->|after return| B94
B94 -->|condition true| B93
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|condition true| B97
B97 -->|condition false| B98
B98 -->|condition true| B100
B98 -->|condition false| B99
B99 -->|jump| B98
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV R0, #50
DJNZ R0, $
```

### B92

Return to the instruction following the active call.

```asm
RET
```

### B93

```asm
MOV R7, #14
```

### B94

```asm
ACALL LDELAY
```

### B95

```asm
DJNZ R7, LP2
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
MOV P0,#01110000B
```

### B98

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B99

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B100

```asm
SJMP K2
```

## Section 11

```mermaid
flowchart TD
B100["B101: OVER1 - lines 308 to 311"]
B101["B102: instructions - lines 312 to 315"]
B102["B103: instructions - lines 316 to 319"]
B103["B104: instructions - lines 320 to 323"]
B104["B105: instructions - lines 324 to 324"]
B105["B106: ROW_0 - lines 325 to 326"]
B106["B107: ROW_1 - lines 327 to 328"]
B107["B108: ROW_2 - lines 329 to 330"]
B108["B109: ROW_3 - lines 331 to 331"]
B109["B110: FIND - lines 333 to 333"]
B100 -->|condition true| B105
B100 -->|condition false| B101
B101 -->|condition true| B106
B101 -->|condition false| B102
B102 -->|condition true| B107
B102 -->|condition false| B103
B103 -->|condition true| B108
B103 -->|condition false| B104
B104 -->|jump| B98
B105 -->|jump| B109
B106 -->|jump| B109
B107 -->|jump| B109
B108 -->|next| B109
B109 -->|next| B110
B98["Continue at B99 in section 10"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B102

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B103

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B104

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B105

```asm
LJMP K2
```

### B106

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B107

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B108

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B109

```asm
MOV DPTR,#KCODE3
```

### B110

```asm
RLC A
```

## Section 12

```mermaid
flowchart TD
B110["B111: FIND1 - lines 335 to 336"]
B111["B112: instructions - lines 337 to 338"]
B112["B113: MATCH - lines 339 to 341"]
B113["B114: TMSEC - lines 351 to 354"]
B114["B115: BACK - lines 356 to 356"]
B115["B116: instructions - lines 357 to 359"]
B116["B117: DELAY_2SEC - lines 363 to 363"]
B117["B118: LP1 - lines 365 to 365"]
B118["B119: instructions - lines 366 to 366"]
B119["B120: instructions - lines 367 to 367"]
B110 -->|condition true| B112
B110 -->|condition false| B111
B111 -->|jump| B110
B113 -->|next| B114
B114 -->|condition true| B114
B114 -->|condition false| B115
B116 -->|next| B117
B117 -->|call| B113
B117 -->|after return| B118
B118 -->|condition true| B117
B118 -->|condition false| B119
```

### B111

```asm
RLC A
JNC MATCH
```

### B112

```asm
INC DPTR
SJMP FIND1
```

### B113

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B114

```asm
MOV TMOD,#01H
MOV TL0,#0DCH
MOV TH0,#6FH
SETB TR0
```

### B115

```asm
JNB TF0,BACK
```

### B116

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B117

```asm
MOV R0, #4
```

### B118

```asm
ACALL TMSEC
```

### B119

```asm
DJNZ R0, LP1
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: END_PROGRAM - lines 391 to 391"]
B120 -->|jump| B120
```

### B121

```asm
SJMP END_PROGRAM
```
