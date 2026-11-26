# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

Start from the first executable block or the entry selected by the calling application.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6)

## Section 1

```mermaid
flowchart TD
B0["B1: KEYPAD - lines 6 to 6"]
B1["B2: K1 - lines 7 to 10"]
B2["B3: K2 - lines 12 to 14"]
B3["B4: instructions - lines 15 to 15"]
B4["B5: OVER1 - lines 17 to 20"]
B5["B6: instructions - lines 21 to 24"]
B6["B7: instructions - lines 25 to 28"]
B7["B8: instructions - lines 29 to 32"]
B8["B9: instructions - lines 33 to 33"]
B9["B10: ROW_0 - lines 34 to 35"]
B0 -->|next| B1
B1 -->|condition true| B1
B1 -->|condition false| B2
B2 -->|condition true| B4
B2 -->|condition false| B3
B3 -->|jump| B2
B4 -->|condition true| B9
B4 -->|condition false| B5
B5 -->|condition true| B10
B5 -->|condition false| B6
B6 -->|condition true| B11
B6 -->|condition false| B7
B7 -->|condition true| B12
B7 -->|condition false| B8
B8 -->|jump| B2
B9 -->|jump| B13
B10["Continue at B11 in section 2"]
B11["Continue at B12 in section 2"]
B12["Continue at B13 in section 2"]
B13["Continue at B14 in section 2"]
```

### B1

```asm
MOV P0,#01110000B
```

### B2

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B3

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B4

```asm
SJMP K2
```

### B5

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B6

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B7

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B8

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B9

```asm
LJMP K2
```

### B10

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 2

```mermaid
flowchart TD
B10["B11: ROW_1 - lines 36 to 37"]
B11["B12: ROW_2 - lines 38 to 39"]
B12["B13: ROW_3 - lines 40 to 40"]
B13["B14: FIND - lines 43 to 43"]
B14["B15: FIND1 - lines 45 to 46"]
B15["B16: instructions - lines 47 to 48"]
B16["B17: MATCH - lines 49 to 51"]
B17["B18: INLCD - lines 55 to 63"]
B18["B19: instructions - lines 65 to 74"]
B19["B20: instructions - lines 76 to 91"]
B10 -->|jump| B13
B11 -->|jump| B13
B12 -->|next| B13
B13 -->|next| B14
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|jump| B14
B17 -->|call| B38
B17 -->|after return| B18
B18 -->|call| B38
B18 -->|after return| B19
B19 -->|call| B38
B19 -->|after return| B20
B38["Continue at B39 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B12

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B13

```asm
MOV DPTR,#KCODE3
```

### B14

```asm
RLC A
```

### B15

```asm
RLC A
JNC MATCH
```

### B16

```asm
INC DPTR
SJMP FIND1
```

### B17

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B18

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

### B19

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

### B20

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

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 93 to 105"]
B21["B22: instructions - lines 106 to 106"]
B22["B23: WCHR - lines 111 to 115"]
B23["B24: instructions - lines 116 to 116"]
B24["B25: instructions - lines 117 to 119"]
B25["B26: instructions - lines 120 to 120"]
B26["B27: instructions - lines 121 to 123"]
B27["B28: CMD - lines 127 to 129"]
B28["B29: instructions - lines 130 to 130"]
B29["B30: instructions - lines 131 to 133"]
B20 -->|call| B38
B20 -->|after return| B21
B22 -->|call| B32
B22 -->|after return| B23
B23 -->|call| B38
B23 -->|after return| B24
B24 -->|call| B32
B24 -->|after return| B25
B25 -->|call| B38
B25 -->|after return| B26
B27 -->|call| B32
B27 -->|after return| B28
B28 -->|call| B38
B28 -->|after return| B29
B29 -->|call| B32
B29 -->|after return| B30
B38["Continue at B39 in section 4"]
B32["Continue at B33 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

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

### B22

Return to the instruction following the active call.

```asm
RET
```

### B23

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B24

```asm
ACALL LDELAY
```

### B25

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B26

```asm
ACALL LDELAY
```

### B27

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B28

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B29

```asm
ACALL LDELAY
```

### B30

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 134 to 134"]
B31["B32: instructions - lines 135 to 135"]
B32["B33: COMMON - lines 139 to 144"]
B33["B34: WSTR - lines 148 to 148"]
B34["B35: CONT1 - lines 150 to 152"]
B35["B36: PRINT - lines 154 to 154"]
B36["B37: instructions - lines 155 to 156"]
B37["B38: EXIT1 - lines 157 to 158"]
B38["B39: LDELAY - lines 162 to 163"]
B39["B40: instructions - lines 164 to 164"]
B30 -->|call| B38
B30 -->|after return| B31
B33 -->|next| B34
B34 -->|condition true| B37
B34 -->|condition false| B35
B35 -->|call| B22
B35 -->|after return| B36
B36 -->|jump| B34
B38 -->|condition true| B38
B38 -->|condition false| B39
B22["Continue at B23 in section 3"]
```

### B31

```asm
ACALL LDELAY
```

### B32

Return to the instruction following the active call.

```asm
RET
```

### B33

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B34

```asm
PUSH    ACC
```

### B35

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B36

```asm
ACALL    WCHR
```

### B37

```asm
INC DPTR
AJMP    CONT1
```

### B38

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B39

```asm
MOV R0, #50
DJNZ R0, $
```

### B40

Return to the instruction following the active call.

```asm
RET
```

## Section 5

```mermaid
flowchart TD
B40["B41: TMSEC - lines 168 to 171"]
B41["B42: BACK - lines 173 to 173"]
B42["B43: instructions - lines 174 to 176"]
B43["B44: INIT - lines 180 to 187"]
B44["B45: CIN - lines 191 to 191"]
B45["B46: instructions - lines 192 to 194"]
B46["B47: COUT - lines 198 to 199"]
B47["B48: instructions - lines 200 to 201"]
B48["B49: WSTR_OUT - lines 205 to 205"]
B49["B50: CONT2 - lines 207 to 209"]
B40 -->|next| B41
B41 -->|condition true| B41
B41 -->|condition false| B42
B44 -->|condition true| B44
B44 -->|condition false| B45
B46 -->|condition true| B46
B46 -->|condition false| B47
B48 -->|next| B49
B49 -->|condition true| B52
B49 -->|condition false| B50
B52["Continue at B53 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV   TMOD,#21H
MOV   TL0,#0CAH
MOV   TH0,#27H
SETB  TR0
```

### B42

```asm
JNB   TF0,BACK
```

### B43

Return to the instruction following the active call.

```asm
CLR   TR0
CLR   TF0
RET
```

### B44

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

### B45

```asm
JNB RI, CIN
```

### B46

Return to the instruction following the active call.

```asm
CLR RI
MOV A,SBUF
RET
```

### B47

```asm
MOV SBUF,A
JNB TI, $
```

### B48

Return to the instruction following the active call.

```asm
CLR TI
RET
```

### B49

```asm
PUSH    ACC
```

### B50

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit2
```

## Section 6

```mermaid
flowchart TD
B50["B51: PRINT2 - lines 211 to 211"]
B51["B52: instructions - lines 212 to 213"]
B52["B53: EXIT2 - lines 214 to 215"]
B50 -->|call| B46
B50 -->|after return| B51
B51 -->|jump| B49
B46["Continue at B47 in section 5"]
B49["Continue at B50 in section 5"]
```

### B51

```asm
ACALL    COUT
```

### B52

```asm
INC DPTR
AJMP    CONT2
```

### B53

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
