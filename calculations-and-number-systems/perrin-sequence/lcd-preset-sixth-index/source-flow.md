# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7)

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
B0 -->|call| B53
B0 -->|after return| B1
B1 -->|call| B47
B1 -->|after return| B2
B2 -->|call| B58
B2 -->|after return| B3
B3 -->|call| B47
B3 -->|after return| B4
B4 -->|call| B58
B4 -->|after return| B5
B5 -->|call| B35
B5 -->|after return| B6
B6 -->|next| B7
B7 -->|call| B63
B7 -->|after return| B8
B8 -->|condition true| B7
B8 -->|condition false| B9
B9 -->|call| B53
B9 -->|after return| B10
B53["Continue at B54 in section 6"]
B47["Continue at B48 in section 5"]
B58["Continue at B59 in section 6"]
B35["Continue at B36 in section 4"]
B63["Continue at B64 in section 7"]
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
B10["B11: instructions - lines 36 to 49"]
B11["B12: instructions - lines 50 to 51"]
B12["B13: instructions - lines 53 to 55"]
B13["B14: instructions - lines 60 to 64"]
B14["B15: XX - lines 66 to 77"]
B15["B16: instructions - lines 80 to 85"]
B16["B17: instructions - lines 86 to 86"]
B17["B18: LOOOP - lines 88 to 90"]
B18["B19: instructions - lines 91 to 92"]
B19["B20: instructions - lines 94 to 95"]
B10 -->|call| B47
B10 -->|after return| B11
B11 -->|call| B58
B11 -->|after return| B12
B12 -->|call| B42
B12 -->|after return| B13
B13 -->|next| B14
B14 -->|condition true| B14
B14 -->|condition false| B15
B15 -->|call| B47
B15 -->|after return| B16
B16 -->|next| B17
B17 -->|call| B42
B17 -->|after return| B18
B18 -->|call| B42
B18 -->|after return| B19
B19 -->|condition true| B17
B19 -->|condition false| B20
B47["Continue at B48 in section 5"]
B58["Continue at B59 in section 6"]
B42["Continue at B43 in section 5"]
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
MOV A,#80H
ACALL CMD
```

### B12

```asm
MOV DPTR,#N
ACALL WSTR
```

### B13

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

### B14

```asm
MOV R7,30H
DEC R7
DEC R7
MOV R0,#43H
MOV R1,#43H
```

### B15

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

### B16

```asm
MOV R2,30H
INC R2
MOV A,#0C0H
ACALL CMD
```

### B17

```asm
MOV R1,#40H
```

### B18

```asm
MOV A,@R1
ADD A,#30H
ACALL WCHR
```

### B19

```asm
MOV A,#','
ACALL WCHR
```

### B20

```asm
INC R1
DJNZ R2,LOOOP
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 100 to 100"]
B21["B22: instructions - lines 101 to 102"]
B22["B23: instructions - lines 103 to 104"]
B23["B24: instructions - lines 105 to 108"]
B24["B25: instructions - lines 110 to 111"]
B25["B26: instructions - lines 112 to 113"]
B26["B27: instructions - lines 114 to 114"]
B27["B28: instructions - lines 115 to 116"]
B28["B29: instructions - lines 117 to 117"]
B29["B30: NOTEQUAL - lines 120 to 120"]
B20 -->|call| B38
B20 -->|after return| B21
B21 -->|call| B47
B21 -->|after return| B22
B22 -->|call| B58
B22 -->|after return| B23
B23 -->|call| B42
B23 -->|after return| B24
B24 -->|call| B47
B24 -->|after return| B25
B25 -->|call| B58
B25 -->|after return| B26
B26 -->|call| B35
B26 -->|after return| B27
B27 -->|condition true| B29
B27 -->|condition false| B28
B28 -->|jump| B6
B29 -->|call| B38
B29 -->|after return| B30
B38["Continue at B39 in section 4"]
B47["Continue at B48 in section 5"]
B58["Continue at B59 in section 6"]
B42["Continue at B43 in section 5"]
B35["Continue at B36 in section 4"]
B6["Continue at B7 in section 1"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL CLEAR
```

### B22

```asm
MOV A,#80H
ACALL CMD
```

### B23

```asm
MOV DPTR,#CONT
ACALL WSTR
```

### B24

```asm
MOV 31H,#1
MOV A,31H
ADD A,#30H
ACALL WCHR
```

### B25

```asm
MOV A,#0C0H
ACALL CMD
```

### B26

```asm
MOV DPTR,#YES
ACALL WSTR
```

### B27

```asm
ACALL DELAY
```

### B28

```asm
MOV A,31H
CJNE A,#1,NOTEQUAL
```

### B29

```asm
AJMP START
```

### B30

```asm
ACALL CLEAR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 121 to 122"]
B31["B32: instructions - lines 123 to 124"]
B32["B33: instructions - lines 125 to 126"]
B33["B34: instructions - lines 127 to 128"]
B34["B35: instructions - lines 129 to 129"]
B35["B36: DELAY - lines 136 to 136"]
B36["B37: WAIT - lines 138 to 138"]
B37["B38: instructions - lines 139 to 139"]
B38["B39: CLEAR - lines 141 to 142"]
B39["B40: instructions - lines 143 to 143"]
B30 -->|call| B47
B30 -->|after return| B31
B31 -->|call| B58
B31 -->|after return| B32
B32 -->|call| B47
B32 -->|after return| B33
B33 -->|call| B58
B33 -->|after return| B34
B34 -->|jump| B34
B35 -->|next| B36
B36 -->|call| B63
B36 -->|after return| B37
B37 -->|condition true| B36
B37 -->|condition false| B38
B38 -->|call| B47
B38 -->|after return| B39
B39 -->|next| B40
B47["Continue at B48 in section 5"]
B58["Continue at B59 in section 6"]
B63["Continue at B64 in section 7"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#80H
ACALL CMD
```

### B32

```asm
MOV DPTR,#THANK
ACALL WSTR
```

### B33

```asm
MOV A,#0C0H
ACALL CMD
```

### B34

```asm
MOV DPTR,#BYE
ACALL WSTR
```

### B35

```asm
SJMP $
```

### B36

```asm
MOV R7,#250
```

### B37

```asm
ACALL LDELAY
```

### B38

```asm
DJNZ R7,WAIT
```

### B39

```asm
MOV A,#01H
ACALL CMD
```

### B40

```asm
MOV R7,#14
```

## Section 5

```mermaid
flowchart TD
B40["B41: WAIT2 - lines 145 to 145"]
B41["B42: instructions - lines 146 to 146"]
B42["B43: WCHR - lines 150 to 154"]
B43["B44: instructions - lines 155 to 155"]
B44["B45: instructions - lines 156 to 158"]
B45["B46: instructions - lines 159 to 159"]
B46["B47: instructions - lines 160 to 162"]
B47["B48: CMD - lines 166 to 168"]
B48["B49: instructions - lines 169 to 169"]
B49["B50: instructions - lines 170 to 172"]
B40 -->|call| B63
B40 -->|after return| B41
B41 -->|condition true| B40
B41 -->|condition false| B42
B42 -->|call| B52
B42 -->|after return| B43
B43 -->|call| B63
B43 -->|after return| B44
B44 -->|call| B52
B44 -->|after return| B45
B45 -->|call| B63
B45 -->|after return| B46
B47 -->|call| B52
B47 -->|after return| B48
B48 -->|call| B63
B48 -->|after return| B49
B49 -->|call| B52
B49 -->|after return| B50
B63["Continue at B64 in section 7"]
B52["Continue at B53 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL LDELAY
```

### B42

```asm
DJNZ R7,WAIT2
```

### B43

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B44

```asm
ACALL LDELAY
```

### B45

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B46

```asm
ACALL LDELAY
```

### B47

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B48

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B49

```asm
ACALL LDELAY
```

### B50

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 173 to 173"]
B51["B52: instructions - lines 174 to 174"]
B52["B53: COMMON - lines 178 to 183"]
B53["B54: INLCD - lines 187 to 195"]
B54["B55: instructions - lines 197 to 206"]
B55["B56: instructions - lines 208 to 224"]
B56["B57: instructions - lines 226 to 238"]
B57["B58: instructions - lines 239 to 239"]
B58["B59: WSTR - lines 244 to 244"]
B59["B60: CONT1 - lines 246 to 248"]
B50 -->|call| B63
B50 -->|after return| B51
B53 -->|call| B63
B53 -->|after return| B54
B54 -->|call| B63
B54 -->|after return| B55
B55 -->|call| B63
B55 -->|after return| B56
B56 -->|call| B63
B56 -->|after return| B57
B58 -->|next| B59
B59 -->|condition true| B62
B59 -->|condition false| B60
B63["Continue at B64 in section 7"]
B62["Continue at B63 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL LDELAY
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B54

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

### B55

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

### B56

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

### B57

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

### B58

Return to the instruction following the active call.

```asm
RET
```

### B59

```asm
PUSH    ACC
```

### B60

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 7

```mermaid
flowchart TD
B60["B61: PRINT - lines 250 to 250"]
B61["B62: instructions - lines 251 to 252"]
B62["B63: EXIT1 - lines 253 to 254"]
B63["B64: LDELAY - lines 258 to 259"]
B64["B65: instructions - lines 260 to 260"]
B60 -->|call| B42
B60 -->|after return| B61
B61 -->|jump| B59
B63 -->|condition true| B63
B63 -->|condition false| B64
B42["Continue at B43 in section 5"]
B59["Continue at B60 in section 6"]
```

### B61

```asm
ACALL    WCHR
```

### B62

```asm
INC DPTR
AJMP    CONT1
```

### B63

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B64

```asm
MOV R0, #50
DJNZ R0, $
```

### B65

Return to the instruction following the active call.

```asm
RET
```
