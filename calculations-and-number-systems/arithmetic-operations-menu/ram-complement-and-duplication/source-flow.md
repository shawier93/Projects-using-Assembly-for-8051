# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8)

## Destinations requiring review

`OUT`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
30: ///////////OP1
62: ///////////////END OF OP1
64: ///////////////OP2
100: ///////////////
103: ////////////////////////OP3
150: ///////////////////////
152: /////////////////////OP4
176: /////////////////////////
```

## Section 1

```mermaid
flowchart TD
B0["B1: MENU - lines 4 to 6"]
B1["B2: ADDITION - lines 8 to 8"]
B2["B3: instructions - lines 9 to 9"]
B3["B4: BIN - lines 12 to 12"]
B4["B5: instructions - lines 13 to 13"]
B5["B6: instructions - lines 14 to 14"]
B6["B7: COMP - lines 17 to 17"]
B7["B8: instructions - lines 18 to 18"]
B8["B9: instructions - lines 19 to 19"]
B9["B10: DUP - lines 22 to 22"]
B0 -->|condition true| B3
B0 -->|condition false| B1
B1 -->|call| B13
B1 -->|after return| B2
B2 -->|jump| B12
B3 -->|condition true| B6
B3 -->|condition false| B4
B4 -->|call| B29
B4 -->|after return| B5
B5 -->|jump| B12
B6 -->|condition true| B9
B6 -->|condition false| B7
B7 -->|call| B42
B7 -->|after return| B8
B8 -->|jump| B12
B9 -->|condition true| B12
B9 -->|condition false| B10
B13["Continue at B14 in section 2"]
B12["Continue at B13 in section 2"]
B29["Continue at B30 in section 3"]
B42["Continue at B43 in section 5"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV A,#0CH
CJNE A,#0AH,BIN
```

### B2

```asm
ACALL ADDOP
```

### B3

```asm
AJMP EXIT
```

### B4

```asm
CJNE A,#0BH,COMP
```

### B5

```asm
ACALL BINR
```

### B6

```asm
AJMP EXIT
```

### B7

```asm
CJNE A,#0CH,DUP
```

### B8

```asm
ACALL COMPLEMENT
```

### B9

```asm
AJMP EXIT
```

### B10

```asm
CJNE A,#0DH,EXIT
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 23 to 23"]
B11["B12: instructions - lines 24 to 24"]
B12["B13: EXIT - lines 28 to 28"]
B13["B14: ADDOP - lines 32 to 33"]
B14["B15: instructions - lines 34 to 36"]
B15["B16: instructions - lines 37 to 44"]
B16["B17: CHECK - lines 48 to 48"]
B17["B18: instructions - lines 49 to 49"]
B18["B19: C1 - lines 50 to 50"]
B19["B20: instructions - lines 51 to 51"]
B10 -->|call| B56
B10 -->|after return| B11
B11 -->|jump| B12
B12 -->|jump| BX1
B13 -->|call| B16
B13 -->|after return| B14
B14 -->|call| B16
B14 -->|after return| B15
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B13
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B13
B56["Continue at B57 in section 6"]
BX1["Unresolved destination: OUT"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DUPLICATE
```

### B12

```asm
AJMP EXIT
```

### B13

```asm
AJMP OUT
```

### B14

```asm
MOV A,#5
ACALL CHECK
```

### B15

```asm
MOV R1,A
MOV A,#6
ACALL CHECK
```

### B16

Return to the instruction following the active call.

```asm
ADD A,R1
MOV B,#10
DIV AB
MOV P1,A
MOV P2,B
RET
```

### B17

```asm
CJNE A,#'#',C1
```

### B18

```asm
AJMP ADDOP
```

### B19

```asm
CJNE A,#'*',C2
```

### B20

```asm
AJMP ADDOP
```

## Section 3

```mermaid
flowchart TD
B20["B21: C2 - lines 52 to 52"]
B21["B22: instructions - lines 53 to 53"]
B22["B23: C3 - lines 54 to 54"]
B23["B24: instructions - lines 55 to 55"]
B24["B25: C4 - lines 56 to 56"]
B25["B26: instructions - lines 57 to 57"]
B26["B27: C5 - lines 58 to 58"]
B27["B28: instructions - lines 59 to 59"]
B28["B29: C6 - lines 60 to 60"]
B29["B30: BINR - lines 66 to 67"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|jump| B13
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B13
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B13
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|jump| B13
B29 -->|call| B37
B29 -->|after return| B30
B13["Continue at B14 in section 2"]
B37["Continue at B38 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
CJNE A,#0AH,C3
```

### B22

```asm
AJMP ADDOP
```

### B23

```asm
CJNE A,#0BH,C4
```

### B24

```asm
AJMP ADDOP
```

### B25

```asm
CJNE A,#0CH,C5
```

### B26

```asm
AJMP ADDOP
```

### B27

```asm
CJNE A,#0DH,C6
```

### B28

```asm
AJMP ADDOP
```

### B29

Return to the instruction following the active call.

```asm
RET
```

### B30

```asm
MOV A,#5
ACALL CHECKHEX
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 68 to 70"]
B31["B32: instructions - lines 72 to 76"]
B32["B33: LOOP - lines 78 to 79"]
B33["B34: ZEROX - lines 81 to 83"]
B34["B35: ONEX - lines 85 to 86"]
B35["B36: OUTNOWX - lines 88 to 88"]
B36["B37: instructions - lines 89 to 91"]
B37["B38: CHECKHEX - lines 94 to 94"]
B38["B39: instructions - lines 95 to 95"]
B39["B40: M1 - lines 96 to 96"]
B30 -->|call| B37
B30 -->|after return| B31
B31 -->|next| B32
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|jump| B35
B34 -->|next| B35
B35 -->|condition true| B32
B35 -->|condition false| B36
B37 -->|condition true| B39
B37 -->|condition false| B38
B38 -->|jump| B29
B39 -->|condition true| B41
B39 -->|condition false| B40
B29["Continue at B30 in section 3"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV R1,A
MOV A,#0AH
ACALL CHECKHEX
```

### B32

```asm
SWAP A
ADD A,R1
MOV R7,#8
MOV R0,#30H
```

### B33

```asm
RLC A
JC ONEX
```

### B34

```asm
MOV @R0,#0
INC R0
SJMP OUTNOWX
```

### B35

```asm
MOV @R0,#1
INC R0
```

### B36

```asm
DJNZ R7,LOOP
```

### B37

Return to the instruction following the active call.

```asm
INC R0
MOV @R0,#'B'
RET
```

### B38

```asm
CJNE A,#'#',M1
```

### B39

```asm
AJMP BINR
```

### B40

```asm
CJNE A,#'*',M2
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 97 to 97"]
B41["B42: M2 - lines 98 to 98"]
B42["B43: COMPLEMENT - lines 105 to 108"]
B43["B44: instructions - lines 110 to 111"]
B44["B45: instructions - lines 113 to 114"]
B45["B46: instructions - lines 116 to 117"]
B46["B47: instructions - lines 119 to 120"]
B47["B48: instructions - lines 122 to 123"]
B48["B49: instructions - lines 125 to 126"]
B49["B50: instructions - lines 128 to 129"]
B40 -->|jump| B29
B42 -->|call| B71
B42 -->|after return| B43
B43 -->|call| B71
B43 -->|after return| B44
B44 -->|call| B71
B44 -->|after return| B45
B45 -->|call| B71
B45 -->|after return| B46
B46 -->|call| B71
B46 -->|after return| B47
B47 -->|call| B71
B47 -->|after return| B48
B48 -->|call| B71
B48 -->|after return| B49
B49 -->|call| B71
B49 -->|after return| B50
B29["Continue at B30 in section 3"]
B71["Continue at B72 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
AJMP BINR
```

### B42

Return to the instruction following the active call.

```asm
RET
```

### B43

```asm
MOV R1,#0
MOV A,#1
ACALL ROTATE
```

### B44

```asm
MOV A,#1
ACALL ROTATE
```

### B45

```asm
MOV A,#1
ACALL ROTATE
```

### B46

```asm
MOV A,#1
ACALL ROTATE
```

### B47

```asm
MOV A,#0
ACALL ROTATE
```

### B48

```asm
MOV A,#0
ACALL ROTATE
```

### B49

```asm
MOV A,#0
ACALL ROTATE
```

### B50

```asm
MOV A,#0
ACALL ROTATE
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 135"]
B51["B52: LOOPX - lines 137 to 138"]
B52["B53: ZERO - lines 140 to 142"]
B53["B54: ONE - lines 144 to 145"]
B54["B55: OUTNOW - lines 147 to 147"]
B55["B56: instructions - lines 148 to 149"]
B56["B57: DUPLICATE - lines 154 to 155"]
B57["B58: instructions - lines 156 to 159"]
B58["B59: CHECK2 - lines 163 to 163"]
B59["B60: instructions - lines 164 to 164"]
B50 -->|next| B51
B51 -->|condition true| B53
B51 -->|condition false| B52
B52 -->|jump| B54
B53 -->|next| B54
B54 -->|condition true| B51
B54 -->|condition false| B55
B56 -->|call| B58
B56 -->|after return| B57
B58 -->|condition true| B60
B58 -->|condition false| B59
B59 -->|jump| B56
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,R1
CPL A
MOV R7,#8
MOV R0,#30H
```

### B52

```asm
RLC A
JC ONE
```

### B53

```asm
MOV @R0,#0
INC R0
SJMP OUTNOW
```

### B54

```asm
MOV @R0,#1
INC R0
```

### B55

```asm
DJNZ R7,LOOPX
```

### B56

Return to the instruction following the active call.

```asm
MOV @R0,#'B'
RET
```

### B57

```asm
MOV A,#5
ACALL CHECK2
```

### B58

Return to the instruction following the active call.

```asm
MOV B,A
ADD A,B
MOV P3,A
RET
```

### B59

```asm
CJNE A,#'#',F1
```

### B60

```asm
AJMP DUPLICATE
```

## Section 7

```mermaid
flowchart TD
B60["B61: F1 - lines 165 to 165"]
B61["B62: instructions - lines 166 to 166"]
B62["B63: F2 - lines 167 to 167"]
B63["B64: instructions - lines 168 to 168"]
B64["B65: F3 - lines 169 to 169"]
B65["B66: instructions - lines 170 to 170"]
B66["B67: F4 - lines 171 to 171"]
B67["B68: instructions - lines 172 to 172"]
B68["B69: F5 - lines 173 to 173"]
B69["B70: instructions - lines 174 to 174"]
B60 -->|condition true| B62
B60 -->|condition false| B61
B61 -->|jump| B56
B62 -->|condition true| B64
B62 -->|condition false| B63
B63 -->|jump| B56
B64 -->|condition true| B66
B64 -->|condition false| B65
B65 -->|jump| B56
B66 -->|condition true| B68
B66 -->|condition false| B67
B67 -->|jump| B56
B68 -->|condition true| B70
B68 -->|condition false| B69
B69 -->|jump| B56
B56["Continue at B57 in section 6"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
CJNE A,#'*',F2
```

### B62

```asm
AJMP DUPLICATE
```

### B63

```asm
CJNE A,#'A',F3
```

### B64

```asm
AJMP DUPLICATE
```

### B65

```asm
CJNE A,#'B',F4
```

### B66

```asm
AJMP DUPLICATE
```

### B67

```asm
CJNE A,#'C',F5
```

### B68

```asm
AJMP DUPLICATE
```

### B69

```asm
CJNE A,#'D',F6
```

### B70

```asm
AJMP DUPLICATE
```

## Section 8

```mermaid
flowchart TD
B70["B71: F6 - lines 175 to 175"]
B71["B72: ROTATE - lines 179 to 179"]
B72["B73: instructions - lines 180 to 184"]
B73["B74: NEXTCHECK - lines 186 to 186"]
B74["B75: instructions - lines 187 to 190"]
B75["B76: OUTY - lines 192 to 192"]
B71 -->|condition true| B73
B71 -->|condition false| B72
B72 -->|jump| B75
B73 -->|condition true| B42
B73 -->|condition false| B74
B74 -->|next| B75
B42["Continue at B43 in section 5"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
CJNE A,#0,NEXTCHECK
```

### B73

```asm
CLR C
MOV A,R1
RLC A
MOV R1,A
SJMP OUTY
```

### B74

```asm
CJNE A,#1,COMPLEMENT
```

### B75

```asm
SETB C
MOV A,R1
RLC A
MOV R1,A
```

### B76

Return to the instruction following the active call.

```asm
RET
```
