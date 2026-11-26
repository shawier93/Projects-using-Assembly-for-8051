# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 3 to 12"]
B1["B2: instructions - lines 13 to 14"]
B2["B3: instructions - lines 15 to 16"]
B3["B4: instructions - lines 17 to 17"]
B4["B5: instructions - lines 18 to 18"]
B5["B6: MAIN - lines 20 to 20"]
B6["B7: instructions - lines 21 to 22"]
B7["B8: instructions - lines 23 to 24"]
B8["B9: instructions - lines 25 to 27"]
B9["B10: instructions - lines 28 to 28"]
B0 -->|call| B43
B0 -->|after return| B1
B1 -->|call| B53
B1 -->|after return| B2
B2 -->|call| B59
B2 -->|after return| B3
B3 -->|call| B71
B3 -->|after return| B4
B4 -->|call| B64
B4 -->|after return| B5
B5 -->|call| B43
B5 -->|after return| B6
B6 -->|call| B53
B6 -->|after return| B7
B7 -->|call| B59
B7 -->|after return| B8
B8 -->|call| B48
B8 -->|after return| B9
B9 -->|call| B71
B9 -->|after return| B10
B43["Continue at B44 in section 5"]
B53["Continue at B54 in section 6"]
B59["Continue at B60 in section 6"]
B71["Continue at B72 in section 8"]
B64["Continue at B65 in section 7"]
B48["Continue at B49 in section 5"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 33H,#9
MOV 43H,#5
MOV 34H,#9
MOV 44H,#3
MOV 30H,#2
MOV 40H,#4
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
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B10

```asm
ACALL TMSEC
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 29 to 29"]
B11["B12: instructions - lines 32 to 33"]
B12["B13: instructions - lines 34 to 35"]
B13["B14: instructions - lines 36 to 37"]
B14["B15: instructions - lines 38 to 38"]
B15["B16: instructions - lines 39 to 39"]
B16["B17: instructions - lines 40 to 40"]
B17["B18: NEXT - lines 42 to 42"]
B18["B19: instructions - lines 43 to 44"]
B19["B20: instructions - lines 45 to 46"]
B10 -->|call| B64
B10 -->|after return| B11
B11 -->|condition true| B17
B11 -->|condition false| B12
B12 -->|call| B53
B12 -->|after return| B13
B13 -->|call| B59
B13 -->|after return| B14
B14 -->|call| B71
B14 -->|after return| B15
B15 -->|call| B64
B15 -->|after return| B16
B16 -->|jump| B42
B17 -->|call| B43
B17 -->|after return| B18
B18 -->|call| B53
B18 -->|after return| B19
B19 -->|call| B59
B19 -->|after return| B20
B64["Continue at B65 in section 7"]
B53["Continue at B54 in section 6"]
B59["Continue at B60 in section 6"]
B71["Continue at B72 in section 8"]
B42["Continue at B43 in section 5"]
B43["Continue at B44 in section 5"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL ClearLCD
```

### B12

```asm
MOV R5,30H
CJNE R5,#3,NEXT
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
B20["B21: instructions - lines 47 to 49"]
B21["B22: instructions - lines 50 to 50"]
B22["B23: instructions - lines 53 to 55"]
B23["B24: instructions - lines 57 to 59"]
B24["B25: instructions - lines 60 to 66"]
B25["B26: SILVER - lines 69 to 71"]
B26["B27: instructions - lines 72 to 77"]
B27["B28: MAXAMOUNT - lines 80 to 80"]
B28["B29: instructions - lines 81 to 82"]
B29["B30: instructions - lines 83 to 84"]
B20 -->|call| B48
B20 -->|after return| B21
B21 -->|call| B71
B21 -->|after return| B22
B22 -->|condition true| B25
B22 -->|condition false| B23
B23 -->|condition true| B27
B23 -->|condition false| B24
B24 -->|jump| B33
B25 -->|condition true| B27
B25 -->|condition false| B26
B26 -->|jump| B33
B27 -->|call| B43
B27 -->|after return| B28
B28 -->|call| B53
B28 -->|after return| B29
B29 -->|call| B59
B29 -->|after return| B30
B48["Continue at B49 in section 5"]
B71["Continue at B72 in section 8"]
B33["Continue at B34 in section 4"]
B43["Continue at B44 in section 5"]
B53["Continue at B54 in section 6"]
B59["Continue at B60 in section 6"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,40H
ADD A,#30H
ACALL WCHR
```

### B22

```asm
ACALL TMSEC
```

### B23

```asm
MOV R7,30H
MOV R6,40H
CJNE R7,#1,SILVER
```

### B24

```asm
MOV A,33H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B25

```asm
MOV 33H,A
MOV A,R6
MOV B,43H
MUL AB
MOV 50H,A
SJMP PRICE
```

### B26

```asm
MOV A,34H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B27

```asm
MOV 34H,A
MOV A,R6
MOV B,44H
MUL AB
MOV 50H,A
SJMP PRICE
```

### B28

```asm
ACALL INLCD
```

### B29

```asm
MOV A,#80H
ACALL CMD
```

### B30

```asm
MOV DPTR,#STR6
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 85 to 85"]
B31["B32: instructions - lines 86 to 86"]
B32["B33: instructions - lines 87 to 87"]
B33["B34: PRICE - lines 89 to 90"]
B34["B35: instructions - lines 91 to 92"]
B35["B36: instructions - lines 94 to 97"]
B36["B37: instructions - lines 98 to 99"]
B37["B38: SKIP1 - lines 103 to 105"]
B38["B39: instructions - lines 108 to 109"]
B39["B40: instructions - lines 110 to 110"]
B30 -->|call| B71
B30 -->|after return| B31
B31 -->|call| B64
B31 -->|after return| B32
B32 -->|jump| B5
B33 -->|call| B53
B33 -->|after return| B34
B34 -->|call| B59
B34 -->|after return| B35
B35 -->|condition true| B37
B35 -->|condition false| B36
B36 -->|call| B48
B36 -->|after return| B37
B37 -->|call| B48
B37 -->|after return| B38
B38 -->|call| B59
B38 -->|after return| B39
B39 -->|call| B71
B39 -->|after return| B40
B71["Continue at B72 in section 8"]
B64["Continue at B65 in section 7"]
B5["Continue at B6 in section 1"]
B53["Continue at B54 in section 6"]
B59["Continue at B60 in section 6"]
B48["Continue at B49 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL TMSEC
```

### B32

```asm
ACALL ClearLCD
```

### B33

```asm
AJMP MAIN
```

### B34

```asm
MOV A,#0c0H
ACALL CMD
```

### B35

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B36

```asm
MOV A,50H
MOV B,#10
DIV AB
JZ SKIP1
```

### B37

```asm
ADD A,#30H
ACALL WCHR
```

### B38

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B39

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B40

```asm
ACALL TMSEC
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 112 to 112"]
B41["B42: instructions - lines 113 to 113"]
B42["B43: STOP - lines 119 to 119"]
B43["B44: INLCD - lines 129 to 137"]
B44["B45: instructions - lines 139 to 148"]
B45["B46: instructions - lines 150 to 165"]
B46["B47: instructions - lines 167 to 179"]
B47["B48: instructions - lines 180 to 180"]
B48["B49: WCHR - lines 185 to 189"]
B49["B50: instructions - lines 190 to 190"]
B40 -->|call| B64
B40 -->|after return| B41
B41 -->|jump| B5
B42 -->|jump| B42
B43 -->|call| B69
B43 -->|after return| B44
B44 -->|call| B69
B44 -->|after return| B45
B45 -->|call| B69
B45 -->|after return| B46
B46 -->|call| B69
B46 -->|after return| B47
B48 -->|call| B58
B48 -->|after return| B49
B49 -->|call| B69
B49 -->|after return| B50
B64["Continue at B65 in section 7"]
B5["Continue at B6 in section 1"]
B69["Continue at B70 in section 7"]
B58["Continue at B59 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL ClearLCD
```

### B42

```asm
AJMP MAIN
```

### B43

```asm
SJMP STOP
```

### B44

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

### B45

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

### B46

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

### B47

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

### B48

Return to the instruction following the active call.

```asm
RET
```

### B49

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B50

```asm
ACALL LDELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 191 to 193"]
B51["B52: instructions - lines 194 to 194"]
B52["B53: instructions - lines 195 to 197"]
B53["B54: CMD - lines 201 to 203"]
B54["B55: instructions - lines 204 to 204"]
B55["B56: instructions - lines 205 to 207"]
B56["B57: instructions - lines 208 to 208"]
B57["B58: instructions - lines 209 to 209"]
B58["B59: COMMON - lines 213 to 218"]
B59["B60: WSTR - lines 222 to 222"]
B50 -->|call| B58
B50 -->|after return| B51
B51 -->|call| B69
B51 -->|after return| B52
B53 -->|call| B58
B53 -->|after return| B54
B54 -->|call| B69
B54 -->|after return| B55
B55 -->|call| B58
B55 -->|after return| B56
B56 -->|call| B69
B56 -->|after return| B57
B59 -->|next| B60
B69["Continue at B70 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B52

```asm
ACALL LDELAY
```

### B53

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B54

```asm
CLR P1.3
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
RET
```

### B59

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B60

```asm
PUSH    ACC
```

## Section 7

```mermaid
flowchart TD
B60["B61: CONT1 - lines 224 to 226"]
B61["B62: PRINT - lines 228 to 228"]
B62["B63: instructions - lines 229 to 230"]
B63["B64: EXIT1 - lines 231 to 232"]
B64["B65: CLEARLCD - lines 235 to 236"]
B65["B66: instructions - lines 237 to 237"]
B66["B67: WAIT11 - lines 238 to 238"]
B67["B68: instructions - lines 239 to 239"]
B68["B69: instructions - lines 240 to 240"]
B69["B70: LDELAY - lines 245 to 246"]
B60 -->|condition true| B63
B60 -->|condition false| B61
B61 -->|call| B48
B61 -->|after return| B62
B62 -->|jump| B60
B64 -->|call| B53
B64 -->|after return| B65
B65 -->|next| B66
B66 -->|call| B69
B66 -->|after return| B67
B67 -->|condition true| B66
B67 -->|condition false| B68
B69 -->|condition true| B69
B69 -->|condition false| B70
B48["Continue at B49 in section 5"]
B53["Continue at B54 in section 6"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B62

```asm
ACALL    WCHR
```

### B63

```asm
INC DPTR
AJMP    CONT1
```

### B64

Return to the instruction following the active call.

```asm
POP     ACC
RET
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
DJNZ R7,WAIT11
```

### B69

Return to the instruction following the active call.

```asm
RET
```

### B70

```asm
MOV R0, #50
DJNZ R0, $
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 247 to 247"]
B71["B72: TMSEC - lines 251 to 254"]
B72["B73: BACK - lines 256 to 256"]
B73["B74: instructions - lines 257 to 259"]
B71 -->|next| B72
B72 -->|condition true| B72
B72 -->|condition false| B73
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B73

```asm
JNB   TF0,BACK
```

### B74

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```
