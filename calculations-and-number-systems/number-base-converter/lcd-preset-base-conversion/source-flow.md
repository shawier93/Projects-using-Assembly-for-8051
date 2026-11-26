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
B0["B1: MAIN - lines 3 to 3"]
B1["B2: instructions - lines 5 to 6"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 11 to 12"]
B4["B5: instructions - lines 13 to 14"]
B5["B6: instructions - lines 15 to 15"]
B6["B7: instructions - lines 17 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 22 to 23"]
B9["B10: instructions - lines 24 to 25"]
B0 -->|call| B56
B0 -->|after return| B1
B1 -->|call| B50
B1 -->|after return| B2
B2 -->|call| B61
B2 -->|after return| B3
B3 -->|call| B50
B3 -->|after return| B4
B4 -->|call| B61
B4 -->|after return| B5
B5 -->|call| B71
B5 -->|after return| B6
B6 -->|call| B50
B6 -->|after return| B7
B7 -->|call| B68
B7 -->|after return| B8
B8 -->|call| B50
B8 -->|after return| B9
B9 -->|call| B61
B9 -->|after return| B10
B56["Continue at B57 in section 6"]
B50["Continue at B51 in section 6"]
B61["Continue at B62 in section 7"]
B71["Continue at B72 in section 8"]
B68["Continue at B69 in section 7"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A, #80H
ACALL CMD
```

### B3

```asm
MOV DPTR, #X1
ACALL WSTR
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
MOV DPTR, #X2
ACALL WSTR
```

### B6

```asm
ACALL DELAY_1SEC
```

### B7

```asm
MOV A, #01H
ACALL CMD
```

### B8

```asm
ACALL TMSEC
```

### B9

```asm
MOV A, #80H
ACALL CMD
```

### B10

```asm
MOV DPTR, #X3
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 27 to 28"]
B11["B12: instructions - lines 29 to 30"]
B12["B13: instructions - lines 31 to 31"]
B13["B14: instructions - lines 33 to 34"]
B14["B15: instructions - lines 35 to 35"]
B15["B16: instructions - lines 37 to 38"]
B16["B17: instructions - lines 39 to 40"]
B17["B18: instructions - lines 41 to 42"]
B18["B19: instructions - lines 43 to 44"]
B19["B20: instructions - lines 45 to 48"]
B10 -->|call| B50
B10 -->|after return| B11
B11 -->|call| B61
B11 -->|after return| B12
B12 -->|call| B71
B12 -->|after return| B13
B13 -->|call| B50
B13 -->|after return| B14
B14 -->|call| B68
B14 -->|after return| B15
B15 -->|call| B50
B15 -->|after return| B16
B16 -->|call| B61
B16 -->|after return| B17
B17 -->|call| B50
B17 -->|after return| B18
B18 -->|call| B61
B18 -->|after return| B19
B19 -->|call| B45
B19 -->|after return| B20
B50["Continue at B51 in section 6"]
B61["Continue at B62 in section 7"]
B71["Continue at B72 in section 8"]
B68["Continue at B69 in section 7"]
B45["Continue at B46 in section 5"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR, #X4
ACALL WSTR
```

### B13

```asm
ACALL DELAY_1SEC
```

### B14

```asm
MOV A, #01H
ACALL CMD
```

### B15

```asm
ACALL TMSEC
```

### B16

```asm
MOV A, #80H
ACALL CMD
```

### B17

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B18

```asm
MOV A,#0C0H
ACALL CMD
```

### B19

```asm
MOV DPTR, #CHOICE
ACALL WSTR
```

### B20

```asm
MOV 50H,#'1'
MOV A, 50H
MOV R5, A
ACALL WCHR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 49 to 49"]
B21["B22: instructions - lines 51 to 52"]
B22["B23: instructions - lines 53 to 53"]
B23["B24: Y1 - lines 59 to 60"]
B24["B25: instructions - lines 61 to 62"]
B25["B26: instructions - lines 63 to 64"]
B26["B27: instructions - lines 65 to 65"]
B27["B28: instructions - lines 66 to 66"]
B28["B29: instructions - lines 67 to 67"]
B29["B30: instructions - lines 72 to 72"]
B20 -->|call| B71
B20 -->|after return| B21
B21 -->|call| B50
B21 -->|after return| B22
B22 -->|call| B68
B22 -->|after return| B23
B23 -->|condition true| B30
B23 -->|condition false| B24
B24 -->|call| B61
B24 -->|after return| B25
B25 -->|call| B50
B25 -->|after return| B26
B26 -->|call| B37
B26 -->|after return| B27
B27 -->|call| B44
B27 -->|after return| B28
B28 -->|call| B71
B28 -->|after return| B29
B29 -->|jump| B36
B71["Continue at B72 in section 8"]
B50["Continue at B51 in section 6"]
B68["Continue at B69 in section 7"]
B30["Continue at B31 in section 4"]
B61["Continue at B62 in section 7"]
B37["Continue at B38 in section 4"]
B44["Continue at B45 in section 5"]
B36["Continue at B37 in section 4"]
```

### B21

```asm
ACALL DELAY_1SEC
```

### B22

```asm
MOV A, #01H
ACALL CMD
```

### B23

```asm
ACALL TMSEC
```

### B24

```asm
MOV A,50H
CJNE A,#'1',Y2
```

### B25

```asm
MOV DPTR ,#ENTER_BIN
ACALL WSTR
```

### B26

```asm
MOV A,#0C0H
ACALL CMD
```

### B27

```asm
ACALL BinToDec
```

### B28

```asm
ACALL CONVERT
```

### B29

```asm
ACALL DELAY_1SEC
```

### B30

```asm
SJMP STOP
```

## Section 4

```mermaid
flowchart TD
B30["B31: Y2 - lines 75 to 75"]
B31["B32: instructions - lines 76 to 77"]
B32["B33: instructions - lines 78 to 79"]
B33["B34: instructions - lines 80 to 80"]
B34["B35: instructions - lines 81 to 81"]
B35["B36: instructions - lines 82 to 82"]
B36["B37: STOP - lines 89 to 89"]
B37["B38: BINTODEC - lines 92 to 95"]
B38["B39: LOOP - lines 98 to 100"]
B39["B40: instructions - lines 101 to 112"]
B30 -->|condition true| B23
B30 -->|condition false| B31
B31 -->|call| B61
B31 -->|after return| B32
B32 -->|call| B50
B32 -->|after return| B33
B33 -->|call| B41
B33 -->|after return| B34
B34 -->|call| B44
B34 -->|after return| B35
B35 -->|call| B71
B35 -->|after return| B36
B36 -->|jump| B36
B37 -->|next| B38
B38 -->|call| B45
B38 -->|after return| B39
B39 -->|condition true| B38
B39 -->|condition false| B40
B23["Continue at B24 in section 3"]
B61["Continue at B62 in section 7"]
B50["Continue at B51 in section 6"]
B41["Continue at B42 in section 5"]
B44["Continue at B45 in section 5"]
B71["Continue at B72 in section 8"]
B45["Continue at B46 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#'2',Y1
```

### B32

```asm
MOV DPTR ,#ENTER_HEX
ACALL WSTR
```

### B33

```asm
MOV A,#0C0H
ACALL CMD
```

### B34

```asm
ACALL HexToDec
```

### B35

```asm
ACALL CONVERT
```

### B36

```asm
ACALL DELAY_1SEC
```

### B37

```asm
SJMP $
```

### B38

```asm
MOV R6,#0
MOV DPTR,#BINARY
MOV R0,#8
MOV R7,#128
```

### B39

```asm
CLR A
MOVC A,@A+DPTR
ACALL WCHR
```

### B40

```asm
CLR C
SUBB A,#30H
MOV B ,R7
MUL AB
ADD A ,R6
MOV R6 ,A
MOV A,R7
MOV B,#2
DIV AB
MOV R7,A
INC DPTR
DJNZ R0,LOOP
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 113 to 114"]
B41["B42: HEXTODEC - lines 118 to 122"]
B42["B43: instructions - lines 123 to 131"]
B43["B44: instructions - lines 132 to 137"]
B44["B45: CONVERT - lines 140 to 156"]
B45["B46: WCHR - lines 161 to 165"]
B46["B47: instructions - lines 166 to 166"]
B47["B48: instructions - lines 167 to 169"]
B48["B49: instructions - lines 170 to 170"]
B49["B50: instructions - lines 171 to 173"]
B41 -->|call| B45
B41 -->|after return| B42
B42 -->|call| B45
B42 -->|after return| B43
B45 -->|call| B55
B45 -->|after return| B46
B46 -->|call| B66
B46 -->|after return| B47
B47 -->|call| B55
B47 -->|after return| B48
B48 -->|call| B66
B48 -->|after return| B49
B55["Continue at B56 in section 6"]
B66["Continue at B67 in section 7"]
```

### B41

Return to the instruction following the active call.

```asm
MOV 40H ,R6
RET
```

### B42

```asm
MOV R6,#16
MOV DPTR ,#HEX
CLR A
MOVC A,@A+DPTR
ACALL WCHR
```

### B43

```asm
CLR C
SUBB A,#30H
MOV B,R6
MUL AB
MOV R7,A
INC DPTR
CLR A
MOVC A,@A+DPTR
ACALL WCHR
```

### B44

Return to the instruction following the active call.

```asm
CLR C
SUBB A,#30H
ADD A,R7
MOV 40H,A
RET
```

### B45

Return to the instruction following the active call.

```asm
MOV A,40H
MOV R1,A
MOV B,#100
DIV AB
ADD A,#30H
MOV 40H,A
MOV A,B
MOV B,#10
DIV AB
ADD A,#30H
MOV 41H,A
MOV A,B
ADD A,#30H
MOV 42H,A
RET
```

### B46

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B47

```asm
ACALL LDELAY
```

### B48

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B49

```asm
ACALL LDELAY
```

### B50

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 6

```mermaid
flowchart TD
B50["B51: CMD - lines 176 to 180"]
B51["B52: instructions - lines 181 to 181"]
B52["B53: instructions - lines 182 to 184"]
B53["B54: instructions - lines 185 to 185"]
B54["B55: instructions - lines 186 to 188"]
B55["B56: COMMON - lines 191 to 198"]
B56["B57: INLCD - lines 201 to 208"]
B57["B58: instructions - lines 209 to 217"]
B58["B59: instructions - lines 218 to 230"]
B59["B60: instructions - lines 231 to 241"]
B50 -->|call| B55
B50 -->|after return| B51
B51 -->|call| B66
B51 -->|after return| B52
B52 -->|call| B55
B52 -->|after return| B53
B53 -->|call| B66
B53 -->|after return| B54
B56 -->|call| B66
B56 -->|after return| B57
B57 -->|call| B66
B57 -->|after return| B58
B58 -->|call| B66
B58 -->|after return| B59
B59 -->|call| B66
B59 -->|after return| B60
B66["Continue at B67 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
PUSH ACC
PUSH B
CLR P1.3
MOV B,A
ACALL COMMON
```

### B52

```asm
ACALL LDELAY
```

### B53

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B54

```asm
ACALL LDELAY
```

### B55

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B56

Return to the instruction following the active call.

```asm
PUSH ACC
ANL A,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
POP ACC
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
B60["B61: instructions - lines 242 to 242"]
B61["B62: WSTR - lines 245 to 245"]
B62["B63: CONT1 - lines 246 to 248"]
B63["B64: instructions - lines 249 to 249"]
B64["B65: instructions - lines 250 to 251"]
B65["B66: EXIT1 - lines 253 to 254"]
B66["B67: LDELAY - lines 257 to 259"]
B67["B68: instructions - lines 260 to 261"]
B68["B69: TMSEC - lines 264 to 267"]
B69["B70: BACK - lines 269 to 269"]
B61 -->|next| B62
B62 -->|condition true| B65
B62 -->|condition false| B63
B63 -->|call| B45
B63 -->|after return| B64
B64 -->|jump| B62
B66 -->|condition true| B66
B66 -->|condition false| B67
B68 -->|next| B69
B69 -->|condition true| B69
B69 -->|condition false| B70
B45["Continue at B46 in section 5"]
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
```

### B63

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B64

```asm
ACALL WCHR
```

### B65

```asm
INC DPTR
AJMP CONT1
```

### B66

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B67

```asm
PUSH 0H
MOV R0, #50
DJNZ R0, $
```

### B68

Return to the instruction following the active call.

```asm
POP 0H
RET
```

### B69

```asm
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
SETB TR0
```

### B70

```asm
JNB TF0,BACK
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 270 to 272"]
B71["B72: DELAY_1SEC - lines 276 to 277"]
B72["B73: LOOP1 - lines 279 to 279"]
B73["B74: instructions - lines 280 to 280"]
B74["B75: instructions - lines 281 to 282"]
B71 -->|next| B72
B72 -->|call| B68
B72 -->|after return| B73
B73 -->|condition true| B72
B73 -->|condition false| B74
B68["Continue at B69 in section 7"]
```

### B71

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B72

```asm
PUSH 4H
MOV R4, #20
```

### B73

```asm
ACALL TMSEC
```

### B74

```asm
DJNZ R4, LOOP1
```

### B75

Return to the instruction following the active call.

```asm
POP 4H
RET
```
