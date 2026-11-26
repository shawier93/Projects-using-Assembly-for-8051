# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 15"]
B1["B2: MAIN - lines 18 to 18"]
B2["B3: instructions - lines 19 to 19"]
B3["B4: instructions - lines 20 to 20"]
B4["B5: instructions - lines 21 to 21"]
B5["B6: instructions - lines 24 to 25"]
B6["B7: instructions - lines 26 to 26"]
B7["B8: instructions - lines 27 to 27"]
B8["B9: instructions - lines 30 to 31"]
B9["B10: instructions - lines 32 to 32"]
B0 -->|next| B1
B1 -->|call| B65
B1 -->|after return| B2
B2 -->|call| B72
B2 -->|after return| B3
B3 -->|call| B24
B3 -->|after return| B4
B4 -->|call| B65
B4 -->|after return| B5
B5 -->|call| B27
B5 -->|after return| B6
B6 -->|call| B28
B6 -->|after return| B7
B7 -->|call| B65
B7 -->|after return| B8
B8 -->|call| B27
B8 -->|after return| B9
B9 -->|call| B37
B9 -->|after return| B10
B65["Continue at B66 in section 7"]
B72["Continue at B73 in section 8"]
B24["Continue at B25 in section 3"]
B27["Continue at B28 in section 3"]
B28["Continue at B29 in section 3"]
B37["Continue at B38 in section 4"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV P2,#0FFH
MOV P1,#00H
MOV R7,#0FFH
MOV R5,#0
MOV R4,#0
MOV R3,#0
MOV 40H,#0
MOV 41H,#0
MOV 42H,#0
MOV 43H,#0
MOV 45H,#0
```

### B2

```asm
ACALL LED
```

### B3

```asm
ACALL DELAY
```

### B4

```asm
ACALL SHOW_CASH
```

### B5

```asm
ACALL LED
```

### B6

```asm
MOV R6,#00000011B
ACALL READ
```

### B7

```asm
ACALL TYPE
```

### B8

```asm
ACALL LED
```

### B9

```asm
MOV R6,#00001100B
ACALL READ
```

### B10

```asm
ACALL SIZE
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 33"]
B11["B12: instructions - lines 36 to 37"]
B12["B13: instructions - lines 38 to 38"]
B13["B14: instructions - lines 39 to 39"]
B14["B15: instructions - lines 42 to 43"]
B15["B16: instructions - lines 44 to 44"]
B16["B17: instructions - lines 45 to 45"]
B17["B18: instructions - lines 48 to 48"]
B18["B19: instructions - lines 49 to 49"]
B19["B20: instructions - lines 50 to 50"]
B10 -->|call| B65
B10 -->|after return| B11
B11 -->|call| B27
B11 -->|after return| B12
B12 -->|call| B44
B12 -->|after return| B13
B13 -->|call| B65
B13 -->|after return| B14
B14 -->|call| B27
B14 -->|after return| B15
B15 -->|call| B51
B15 -->|after return| B16
B16 -->|call| B65
B16 -->|after return| B17
B17 -->|call| B60
B17 -->|after return| B18
B18 -->|call| B65
B18 -->|after return| B19
B19 -->|call| B72
B19 -->|after return| B20
B65["Continue at B66 in section 7"]
B27["Continue at B28 in section 3"]
B44["Continue at B45 in section 5"]
B51["Continue at B52 in section 6"]
B60["Continue at B61 in section 7"]
B72["Continue at B73 in section 8"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL LED
```

### B12

```asm
MOV R6,#00110000B
ACALL READ
```

### B13

```asm
ACALL MILK
```

### B14

```asm
ACALL LED
```

### B15

```asm
MOV R6,#11000000B
ACALL READ
```

### B16

```asm
ACALL SUGAR
```

### B17

```asm
ACALL LED
```

### B18

```asm
ACALL COST
```

### B19

```asm
ACALL LED
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 51 to 51"]
B21["B22: instructions - lines 52 to 52"]
B22["B23: instructions - lines 53 to 53"]
B23["B24: instructions - lines 58 to 58"]
B24["B25: SHOW_CASH - lines 65 to 68"]
B25["B26: instructions - lines 69 to 72"]
B26["B27: instructions - lines 73 to 73"]
B27["B28: READ - lines 76 to 78"]
B28["B29: TYPE - lines 81 to 81"]
B29["B30: instructions - lines 82 to 84"]
B20 -->|call| B72
B20 -->|after return| B21
B21 -->|call| B61
B21 -->|after return| B22
B22 -->|call| B68
B22 -->|after return| B23
B23 -->|jump| B23
B24 -->|call| B72
B24 -->|after return| B25
B25 -->|call| B72
B25 -->|after return| B26
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B36
B72["Continue at B73 in section 8"]
B61["Continue at B62 in section 7"]
B68["Continue at B69 in section 7"]
B30["Continue at B31 in section 4"]
B36["Continue at B37 in section 4"]
```

### B21

```asm
ACALL DELAY
```

### B22

```asm
ACALL SHOW_COST
```

### B23

```asm
ACALL FLASH
```

### B24

```asm
SJMP $
```

### B25

```asm
MOV A,#CASHX
CPL A
MOV P1,A
ACALL DELAY
```

### B26

```asm
MOV A,#CASHY
CPL A
MOV P1,A
ACALL DELAY
```

### B27

Return to the instruction following the active call.

```asm
RET
```

### B28

Return to the instruction following the active call.

```asm
MOV A,P2
ANL A,R6
RET
```

### B29

```asm
CJNE A,#00H, NEXT1
```

### B30

```asm
MOV R3,#AMER
MOV 40H,#1
SJMP BACK
```

## Section 4

```mermaid
flowchart TD
B30["B31: NEXT1 - lines 86 to 86"]
B31["B32: instructions - lines 87 to 89"]
B32["B33: NEXT2 - lines 91 to 91"]
B33["B34: instructions - lines 92 to 94"]
B34["B35: NEXT3 - lines 96 to 96"]
B35["B36: instructions - lines 97 to 99"]
B36["B37: ERROR - lines 102 to 102"]
B37["B38: SIZE - lines 107 to 107"]
B38["B39: instructions - lines 108 to 110"]
B39["B40: NEXTT1 - lines 112 to 112"]
B30 -->|condition true| B32
B30 -->|condition false| B31
B31 -->|jump| B36
B32 -->|condition true| B34
B32 -->|condition false| B33
B33 -->|jump| B36
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|jump| B36
B37 -->|condition true| B39
B37 -->|condition false| B38
B38 -->|jump| B43
B39 -->|condition true| B41
B39 -->|condition false| B40
B43["Continue at B44 in section 5"]
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#01H,NEXT2
```

### B32

```asm
MOV R3,#CAP
MOV 40H,#2
SJMP BACK
```

### B33

```asm
CJNE A,#02H,NEXT3
```

### B34

```asm
MOV R3,#LATTE
MOV 40H,#3
SJMP BACK
```

### B35

```asm
CJNE A,#03H,ERROR
```

### B36

```asm
MOV R4,#MOCHA
MOV 40H,#4
SJMP BACK
```

### B37

Return to the instruction following the active call.

```asm
RET
```

### B38

```asm
CJNE A,#0000B, NEXTT1
```

### B39

```asm
MOV R5,#SMALL
MOV 41H,#1
SJMP BACK1
```

### B40

```asm
CJNE A,#0100B,NEXTT2
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 113 to 115"]
B41["B42: NEXTT2 - lines 117 to 117"]
B42["B43: instructions - lines 118 to 120"]
B43["B44: ERROR1 - lines 124 to 124"]
B44["B45: MILK - lines 127 to 127"]
B45["B46: instructions - lines 128 to 129"]
B46["B47: NEXTTT1 - lines 131 to 131"]
B47["B48: instructions - lines 132 to 133"]
B48["B49: NEXTTT2 - lines 135 to 135"]
B49["B50: instructions - lines 136 to 137"]
B40 -->|jump| B43
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B43
B44 -->|condition true| B46
B44 -->|condition false| B45
B45 -->|jump| B50
B46 -->|condition true| B48
B46 -->|condition false| B47
B47 -->|jump| B50
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|jump| B50
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV R5,#MED
MOV 41H,#2
SJMP BACK1
```

### B42

```asm
CJNE A,#1000B,ERROR1
```

### B43

```asm
MOV R5,#LARGE
MOV 41H,#3
SJMP BACK1
```

### B44

Return to the instruction following the active call.

```asm
RET
```

### B45

```asm
CJNE A,#000000B, NEXTTT1
```

### B46

```asm
MOV 42H,#1
SJMP BACK2
```

### B47

```asm
CJNE A,#010000B,NEXTTT2
```

### B48

```asm
MOV 42H,#2
SJMP BACK2
```

### B49

```asm
CJNE A,#100000B,ERROR2
```

### B50

```asm
MOV 42H,#3
SJMP BACK2
```

## Section 6

```mermaid
flowchart TD
B50["B51: ERROR2 - lines 141 to 141"]
B51["B52: SUGAR - lines 144 to 144"]
B52["B53: instructions - lines 145 to 146"]
B53["B54: NEXTTT11 - lines 148 to 148"]
B54["B55: instructions - lines 149 to 150"]
B55["B56: NEXTTT22 - lines 152 to 152"]
B56["B57: instructions - lines 153 to 154"]
B57["B58: NEXTTT33 - lines 156 to 156"]
B58["B59: instructions - lines 157 to 158"]
B59["B60: ERROR3 - lines 162 to 162"]
B51 -->|condition true| B53
B51 -->|condition false| B52
B52 -->|jump| B59
B53 -->|condition true| B55
B53 -->|condition false| B54
B54 -->|jump| B59
B55 -->|condition true| B57
B55 -->|condition false| B56
B56 -->|jump| B59
B57 -->|condition true| B59
B57 -->|condition false| B58
B58 -->|jump| B59
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

```asm
CJNE A,#00000000B, NEXTTT11
```

### B53

```asm
MOV 43H,#1
SJMP BACK3
```

### B54

```asm
CJNE A,#01000000B,NEXTTT22
```

### B55

```asm
MOV 43H,#2
SJMP BACK3
```

### B56

```asm
CJNE A,#10000000B,NEXTTT33
```

### B57

```asm
MOV 43H,#3
SJMP BACK3
```

### B58

```asm
CJNE A,#11000000B,ERROR3
```

### B59

```asm
MOV 43H,#4
SJMP BACK3
```

### B60

Return to the instruction following the active call.

```asm
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: COST - lines 165 to 173"]
B61["B62: SHOW_COST - lines 176 to 179"]
B62["B63: instructions - lines 180 to 183"]
B63["B64: instructions - lines 184 to 184"]
B64["B65: instructions - lines 185 to 185"]
B65["B66: LED - lines 189 to 193"]
B66["B67: instructions - lines 194 to 195"]
B67["B68: instructions - lines 196 to 196"]
B68["B69: FLASH - lines 199 to 200"]
B69["B70: RE - lines 202 to 204"]
B61 -->|call| B72
B61 -->|after return| B62
B62 -->|call| B72
B62 -->|after return| B63
B63 -->|call| B72
B63 -->|after return| B64
B65 -->|call| B72
B65 -->|after return| B66
B66 -->|call| B72
B66 -->|after return| B67
B68 -->|next| B69
B69 -->|call| B72
B69 -->|after return| B70
B72["Continue at B73 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

Return to the instruction following the active call.

```asm
MOV A,R3
ADD A,R5
MOV R3,A
MOV B,#100
DIV AB
MOV R3,B
ADD A,R4
MOV R4,A
RET
```

### B62

```asm
MOV A,R4
CPL A
MOV P1,A
ACALL DELAY
```

### B63

```asm
MOV A,R3
CPL A
MOV P1,A
ACALL DELAY
```

### B64

```asm
ACALL DELAY
```

### B65

Return to the instruction following the active call.

```asm
RET
```

### B66

```asm
MOV A,R7
CLR C
RRC A
MOV R7,A
ACALL DELAY
```

### B67

```asm
MOV P1,R7
ACALL DELAY
```

### B68

Return to the instruction following the active call.

```asm
RET
```

### B69

```asm
MOV R0,#6
MOV A,#0FFH
```

### B70

```asm
CPL A
MOV P1,A
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 205 to 205"]
B71["B72: instructions - lines 207 to 208"]
B72["B73: DELAY - lines 214 to 214"]
B73["B74: HERE - lines 216 to 216"]
B74["B75: HERE1 - lines 217 to 217"]
B75["B76: instructions - lines 218 to 218"]
B76["B77: instructions - lines 219 to 219"]
B70 -->|condition true| B69
B70 -->|condition false| B71
B72 -->|next| B73
B73 -->|next| B74
B74 -->|condition true| B74
B74 -->|condition false| B75
B75 -->|condition true| B73
B75 -->|condition false| B76
B69["Continue at B70 in section 7"]
```

### B71

```asm
DJNZ R0,RE
```

### B72

Return to the instruction following the active call.

```asm
MOV P1,#00
RET
```

### B73

```asm
MOV R1,#49
```

### B74

```asm
MOV R2,#100
```

### B75

```asm
DJNZ R2,HERE1
```

### B76

```asm
DJNZ R1,HERE
```

### B77

Return to the instruction following the active call.

```asm
RET
```
