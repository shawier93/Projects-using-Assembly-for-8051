# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG	0` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 8 to 8"]
B1["B2: instructions - lines 9 to 9"]
B2["B3: instructions - lines 10 to 10"]
B3["B4: instructions - lines 11 to 11"]
B4["B5: PRICE - lines 14 to 17"]
B5["B6: instructions - lines 19 to 20"]
B6["B7: LC2 - lines 22 to 22"]
B7["B8: instructions - lines 24 to 25"]
B8["B9: LC3 - lines 27 to 27"]
B9["B10: instructions - lines 29 to 30"]
B0 -->|call| B67
B0 -->|after return| B1
B1 -->|call| B65
B1 -->|after return| B2
B2 -->|call| B4
B2 -->|after return| B3
B3 -->|jump| B3
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|jump| B11
B6 -->|condition true| B8
B6 -->|condition false| B7
B7 -->|jump| B11
B8 -->|condition true| B10
B8 -->|condition false| B9
B9 -->|jump| B11
B67["Continue at B68 in section 7"]
B65["Continue at B66 in section 7"]
B11["Continue at B12 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL PROGRAM_ROM
```

### B2

```asm
ACALL CASH
```

### B3

```asm
ACALL PRICE
```

### B4

```asm
SJMP $
```

### B5

```asm
MOV	P2,#0FFH
MOV A,P2
ANL	A,#00000011B
CJNE A,#00000000B,LC2
```

### B6

```asm
MOV	33H,#2
SJMP LCR
```

### B7

```asm
CJNE A,#00000001B,LC3
```

### B8

```asm
MOV	33H,#3
SJMP LCR
```

### B9

```asm
CJNE A,#00000010B,LC4
```

### B10

```asm
MOV	33H,#3
SJMP LCR
```

## Section 2

```mermaid
flowchart TD
B10["B11: LC4 - lines 33 to 33"]
B11["B12: LCR - lines 35 to 37"]
B12["B13: instructions - lines 39 to 39"]
B13["B14: LCR2 - lines 41 to 41"]
B14["B15: instructions - lines 43 to 46"]
B15["B16: LCR3 - lines 50 to 53"]
B16["B17: LCR4 - lines 57 to 57"]
B17["B18: LMT - lines 61 to 64"]
B18["B19: instructions - lines 65 to 65"]
B19["B20: LMT2 - lines 69 to 69"]
B10 -->|next| B11
B11 -->|condition true| B13
B11 -->|condition false| B12
B12 -->|jump| B17
B13 -->|condition true| B15
B13 -->|condition false| B14
B14 -->|jump| B17
B15 -->|jump| B16
B17 -->|condition true| B19
B17 -->|condition false| B18
B18 -->|jump| B24
B19 -->|condition true| B21
B19 -->|condition false| B20
B24["Continue at B25 in section 3"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV	33H,#4
```

### B12

```asm
MOV A,P2
ANL	A,#00001100B
CJNE A,#00000000B,LCR2
```

### B13

```asm
SJMP LMT
```

### B14

```asm
CJNE A,#00000100B,LCR3
```

### B15

```asm
MOV	A,33H
ADD	A,#1
MOV	33H,A
SJMP LMT
```

### B16

```asm
MOV	A,33H
ADD	A,#2
MOV	33H,A
SJMP LCR4
```

### B17

Return to the instruction following the active call.

```asm
RET
```

### B18

```asm
MOV	P2,#0FFH
MOV A,P2
ANL	A,#00110000B
CJNE A,#00000000B,LMT2
```

### B19

```asm
Sjmp LSL
```

### B20

```asm
CJNE A,#00010000B,LMT3
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 70 to 70"]
B21["B22: LMT3 - lines 73 to 73"]
B22["B23: instructions - lines 74 to 74"]
B23["B24: LMT4 - lines 77 to 77"]
B24["B25: LSL - lines 80 to 83"]
B25["B26: instructions - lines 84 to 84"]
B26["B27: LSL2 - lines 87 to 87"]
B27["B28: instructions - lines 89 to 89"]
B28["B29: LSL3 - lines 91 to 91"]
B29["B30: instructions - lines 92 to 92"]
B20 -->|jump| B24
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B24
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B33
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|jump| B33
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B33
B33["Continue at B34 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
Sjmp LSL
```

### B22

```asm
CJNE A,#00100000B,LMT4
```

### B23

```asm
Sjmp LSL
```

### B24

Return to the instruction following the active call.

```asm
RET
```

### B25

```asm
MOV	P2,#0FFH
MOV A,P2
ANL	A,#11000000B
CJNE A,#00000000B,LSL2
```

### B26

```asm
sjmp FLASH
```

### B27

```asm
CJNE A,#01000000B,LSL3
```

### B28

```asm
SJMP FLASH
```

### B29

```asm
CJNE A,#10000000B,LSL4
```

### B30

```asm
SJMP FLASH
```

## Section 4

```mermaid
flowchart TD
B30["B31: LSL4 - lines 94 to 94"]
B31["B32: instructions - lines 95 to 95"]
B32["B33: instructions - lines 98 to 98"]
B33["B34: FLASH - lines 100 to 108"]
B34["B35: REPT0 - lines 110 to 111"]
B35["B36: instructions - lines 112 to 112"]
B36["B37: BACK0 - lines 114 to 114"]
B37["B38: instructions - lines 118 to 126"]
B38["B39: REPT1 - lines 128 to 129"]
B39["B40: instructions - lines 130 to 130"]
B30 -->|condition true| B33
B30 -->|condition false| B31
B31 -->|jump| B33
B32 -->|next| B33
B33 -->|call| B68
B33 -->|after return| B34
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|jump| B34
B37 -->|call| B68
B37 -->|after return| B38
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B38
B68["Continue at B69 in section 7"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#11000000B,FLASH
```

### B32

```asm
SJMP FLASH
```

### B33

```asm
mov p2,#0FFH
```

### B34

```asm
CLR P2.0
SETB P2.1
SETB P2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B35

```asm
MOV A,P2
CJNE A,#00000001B,BACK0
```

### B36

```asm
SJMP REPT0
```

### B37

Return to the instruction following the active call.

```asm
RET
```

### B38

```asm
clR p2.0
CLR P2.1
SETB P2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B39

```asm
MOV A,P2
CJNE A,#00000011B,BACK1
```

### B40

```asm
SJMP REPT1
```

## Section 5

```mermaid
flowchart TD
B40["B41: BACK1 - lines 132 to 132"]
B41["B42: instructions - lines 135 to 143"]
B42["B43: REPT2 - lines 147 to 148"]
B43["B44: instructions - lines 149 to 149"]
B44["B45: BACK2 - lines 151 to 151"]
B45["B46: instructions - lines 154 to 162"]
B46["B47: REPT3 - lines 164 to 165"]
B47["B48: instructions - lines 166 to 166"]
B48["B49: BACK3 - lines 168 to 168"]
B49["B50: instructions - lines 171 to 179"]
B41 -->|call| B68
B41 -->|after return| B42
B42 -->|condition true| B44
B42 -->|condition false| B43
B43 -->|jump| B42
B45 -->|call| B68
B45 -->|after return| B46
B46 -->|condition true| B48
B46 -->|condition false| B47
B47 -->|jump| B46
B49 -->|call| B68
B49 -->|after return| B50
B68["Continue at B69 in section 7"]
B50["Continue at B51 in section 6"]
```

### B41

Return to the instruction following the active call.

```asm
RET
```

### B42

```asm
CLR P2.0
clr p2.1
clr p2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B43

```asm
MOV A,P2
CJNE A,#00000111B,BACK2
```

### B44

```asm
SJMP REPT2
```

### B45

Return to the instruction following the active call.

```asm
RET
```

### B46

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B47

```asm
MOV A,P2
CJNE A,#00001111B,BACK3
```

### B48

```asm
SJMP REPT3
```

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: REPT4 - lines 182 to 183"]
B51["B52: instructions - lines 184 to 184"]
B52["B53: BACK4 - lines 186 to 186"]
B53["B54: instructions - lines 189 to 197"]
B54["B55: REPT5 - lines 200 to 201"]
B55["B56: instructions - lines 202 to 202"]
B56["B57: BACK5 - lines 204 to 204"]
B57["B58: instructions - lines 206 to 214"]
B58["B59: REPT6 - lines 217 to 218"]
B59["B60: instructions - lines 219 to 219"]
B50 -->|condition true| B52
B50 -->|condition false| B51
B51 -->|jump| B50
B53 -->|call| B68
B53 -->|after return| B54
B54 -->|condition true| B56
B54 -->|condition false| B55
B55 -->|jump| B54
B57 -->|call| B68
B57 -->|after return| B58
B58 -->|condition true| B60
B58 -->|condition false| B59
B59 -->|jump| B58
B68["Continue at B69 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,P2
CJNE A,#00011111B,BACK4
```

### B52

```asm
SJMP REPT4
```

### B53

Return to the instruction following the active call.

```asm
RET
```

### B54

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
SETB P2.6
SETB P2.7
Acall DELAY
```

### B55

```asm
MOV A,P2
CJNE A,#00111111B,BACK5
```

### B56

```asm
SJMP REPT5
```

### B57

Return to the instruction following the active call.

```asm
RET
```

### B58

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
clr p2.6
SETB P2.7
Acall DELAY
```

### B59

```asm
MOV A,P2
CJNE A,#01111111B,BACK6
```

### B60

```asm
SJMP REPT6
```

## Section 7

```mermaid
flowchart TD
B60["B61: BACK6 - lines 221 to 221"]
B61["B62: instructions - lines 223 to 231"]
B62["B63: REPT7 - lines 234 to 235"]
B63["B64: instructions - lines 236 to 236"]
B64["B65: BACK7 - lines 238 to 238"]
B65["B66: CASH - lines 264 to 267"]
B66["B67: instructions - lines 268 to 271"]
B67["B68: PROGRAM_ROM - lines 274 to 286"]
B68["B69: DELAY - lines 313 to 316"]
B69["B70: L1 - lines 317 to 317"]
B61 -->|call| B68
B61 -->|after return| B62
B62 -->|condition true| B64
B62 -->|condition false| B63
B63 -->|jump| B62
B65 -->|call| B68
B65 -->|after return| B66
B68 -->|next| B69
B69 -->|next| B70
B70["Continue at B71 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
RET
```

### B62

```asm
CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
clr p2.6
clr p2.7
Acall DELAY
```

### B63

```asm
MOV A,P2
CJNE A,#11111111B,BACK7
```

### B64

```asm
SJMP REPT7
```

### B65

Return to the instruction following the active call.

```asm
RET
```

### B66

```asm
MOV	A,30H
CPL	A
MOV	P1,A
ACALL DELAY
```

### B67

Return to the instruction following the active call.

```asm
MOV	A,31H
CPL	A
MOV	P1,A
RET
```

### B68

Return to the instruction following the active call.

```asm
MOV	DPTR,#INX
CLR	A
MOVC A,@A+DPTR
MOV	30H,A
MOV	DPTR,#INY
CLR	A
MOVC A,@A+DPTR
MOV	31H,A
MOV	DPTR,#TIME_DELAY
CLR	A
MOVC A,@A+DPTR
MOV	32H,A
RET
```

### B69

```asm
PUSH 0
PUSH 1
PUSH 2
MOV	R0,#4
```

### B70

```asm
MOV	R1,#250
```

## Section 8

```mermaid
flowchart TD
B70["B71: L2 - lines 318 to 318"]
B71["B72: L3 - lines 319 to 319"]
B72["B73: instructions - lines 320 to 320"]
B73["B74: instructions - lines 321 to 321"]
B74["B75: instructions - lines 322 to 325"]
B70 -->|next| B71
B71 -->|condition true| B71
B71 -->|condition false| B72
B72 -->|condition true| B70
B72 -->|condition false| B73
B73 -->|condition true| B69
B73 -->|condition false| B74
B69["Continue at B70 in section 7"]
```

### B71

```asm
MOV R2,32H
```

### B72

```asm
DJNZ R2,L3
```

### B73

```asm
DJNZ R1,L2
```

### B74

```asm
DJNZ R0,L1
```

### B75

Return to the instruction following the active call.

```asm
POP 2
POP 1
POP 0
RET
```
