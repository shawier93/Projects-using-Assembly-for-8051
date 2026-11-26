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
B0["B1: START - lines 10 to 10"]
B1["B2: instructions - lines 12 to 15"]
B2["B3: instructions - lines 16 to 17"]
B3["B4: instructions - lines 19 to 20"]
B4["B5: instructions - lines 22 to 23"]
B5["B6: instructions - lines 24 to 24"]
B6["B7: instructions - lines 25 to 26"]
B7["B8: instructions - lines 27 to 28"]
B8["B9: instructions - lines 29 to 29"]
B9["B10: instructions - lines 30 to 31"]
B0 -->|call| B37
B0 -->|after return| B1
B1 -->|call| B57
B1 -->|after return| B2
B2 -->|call| B65
B2 -->|after return| B3
B3 -->|call| B57
B3 -->|after return| B4
B4 -->|call| B15
B4 -->|after return| B5
B5 -->|call| B60
B5 -->|after return| B6
B6 -->|call| B60
B6 -->|after return| B7
B7 -->|call| B15
B7 -->|after return| B8
B8 -->|call| B60
B8 -->|after return| B9
B9 -->|call| B60
B9 -->|after return| B10
B37["Continue at B38 in section 4"]
B57["Continue at B58 in section 6"]
B65["Continue at B66 in section 7"]
B15["Continue at B16 in section 2"]
B60["Continue at B61 in section 7"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV R1,#0FH
MOV R2,#0FH
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
MOV A ,#0C0H
ACALL CMD
```

### B5

```asm
MOV A,R1
ACALL CONVERT
```

### B6

```asm
ACALL WCHR
```

### B7

```asm
MOV A,#'+'
ACALL WCHR
```

### B8

```asm
MOV A,R2
ACALL CONVERT
```

### B9

```asm
ACALL WCHR
```

### B10

```asm
MOV A,#'='
ACALL WCHR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 37"]
B11["B12: instructions - lines 38 to 38"]
B12["B13: instructions - lines 39 to 40"]
B13["B14: instructions - lines 41 to 41"]
B14["B15: STOP - lines 45 to 45"]
B15["B16: CONVERT - lines 48 to 48"]
B16["B17: instructions - lines 49 to 50"]
B17["B18: NEXT1 - lines 52 to 52"]
B18["B19: instructions - lines 53 to 54"]
B19["B20: NEXT2 - lines 56 to 56"]
B10 -->|call| B15
B10 -->|after return| B11
B11 -->|call| B60
B11 -->|after return| B12
B12 -->|call| B15
B12 -->|after return| B13
B13 -->|call| B60
B13 -->|after return| B14
B14 -->|jump| B14
B15 -->|condition true| B17
B15 -->|condition false| B16
B16 -->|jump| B36
B17 -->|condition true| B19
B17 -->|condition false| B18
B18 -->|jump| B36
B19 -->|condition true| B21
B19 -->|condition false| B20
B60["Continue at B61 in section 7"]
B36["Continue at B37 in section 4"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,R1
ADD A,R2
MOV B,#16
DIV AB
ACALL CONVERT
```

### B12

```asm
ACALL WCHR
```

### B13

```asm
MOV A,B
ACALL CONVERT
```

### B14

```asm
ACALL WCHR
```

### B15

```asm
AJMP $
```

### B16

```asm
CJNE A,#0,NEXT1
```

### B17

```asm
ADD A,#30H
AJMP BACK
```

### B18

```asm
CJNE A,#1,NEXT2
```

### B19

```asm
ADD A,#30H
AJMP BACK
```

### B20

```asm
CJNE A,#2,NEXT3
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 57 to 58"]
B21["B22: NEXT3 - lines 60 to 60"]
B22["B23: instructions - lines 61 to 62"]
B23["B24: NEXT4 - lines 64 to 64"]
B24["B25: instructions - lines 65 to 66"]
B25["B26: NEXT5 - lines 68 to 68"]
B26["B27: instructions - lines 69 to 70"]
B27["B28: NEXT6 - lines 72 to 72"]
B28["B29: instructions - lines 73 to 74"]
B29["B30: NEXT7 - lines 76 to 76"]
B20 -->|jump| B36
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B36
B23 -->|condition true| B25
B23 -->|condition false| B24
B24 -->|jump| B36
B25 -->|condition true| B27
B25 -->|condition false| B26
B26 -->|jump| B36
B27 -->|condition true| B29
B27 -->|condition false| B28
B28 -->|jump| B36
B29 -->|condition true| B31
B29 -->|condition false| B30
B36["Continue at B37 in section 4"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ADD A,#30H
AJMP BACK
```

### B22

```asm
CJNE A,#3,NEXT4
```

### B23

```asm
ADD A,#30H
AJMP BACK
```

### B24

```asm
CJNE A,#4,NEXT5
```

### B25

```asm
ADD A,#30H
AJMP BACK
```

### B26

```asm
CJNE A,#5,NEXT6
```

### B27

```asm
ADD A,#30H
AJMP BACK
```

### B28

```asm
CJNE A,#6,NEXT7
```

### B29

```asm
ADD A,#30H
AJMP BACK
```

### B30

```asm
CJNE A,#7,NEXT8
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 77 to 78"]
B31["B32: NEXT8 - lines 80 to 80"]
B32["B33: instructions - lines 81 to 82"]
B33["B34: NEXT9 - lines 84 to 84"]
B34["B35: instructions - lines 85 to 86"]
B35["B36: NEXTCHAR - lines 88 to 88"]
B36["B37: BACK - lines 90 to 90"]
B37["B38: INLCD - lines 93 to 94"]
B38["B39: WAIT - lines 96 to 96"]
B39["B40: instructions - lines 97 to 97"]
B30 -->|jump| B36
B31 -->|condition true| B33
B31 -->|condition false| B32
B32 -->|jump| B36
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|jump| B36
B35 -->|next| B36
B37 -->|next| B38
B38 -->|call| B70
B38 -->|after return| B39
B39 -->|condition true| B38
B39 -->|condition false| B40
B70["Continue at B71 in section 8"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ADD A,#30H
AJMP BACK
```

### B32

```asm
CJNE A,#8,NEXT9
```

### B33

```asm
ADD A,#30H
AJMP BACK
```

### B34

```asm
CJNE A,#9,NEXTCHAR
```

### B35

```asm
ADD A,#30H
AJMP BACK
```

### B36

```asm
ADD A,#37H
```

### B37

Return to the instruction following the active call.

```asm
RET
```

### B38

```asm
PUSH 7
MOV R7,#20
```

### B39

```asm
ACALL LDELAY
```

### B40

```asm
DJNZ R7,WAIT
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 99 to 101"]
B41["B42: instructions - lines 102 to 102"]
B42["B43: instructions - lines 103 to 104"]
B43["B44: instructions - lines 105 to 106"]
B44["B45: instructions - lines 107 to 108"]
B45["B46: instructions - lines 109 to 110"]
B46["B47: instructions - lines 111 to 112"]
B47["B48: instructions - lines 113 to 114"]
B48["B49: instructions - lines 115 to 116"]
B49["B50: instructions - lines 117 to 118"]
B40 -->|call| B57
B40 -->|after return| B41
B41 -->|call| B70
B41 -->|after return| B42
B42 -->|call| B57
B42 -->|after return| B43
B43 -->|call| B57
B43 -->|after return| B44
B44 -->|call| B57
B44 -->|after return| B45
B45 -->|call| B57
B45 -->|after return| B46
B46 -->|call| B57
B46 -->|after return| B47
B47 -->|call| B57
B47 -->|after return| B48
B48 -->|call| B57
B48 -->|after return| B49
B49 -->|call| B57
B49 -->|after return| B50
B57["Continue at B58 in section 6"]
B70["Continue at B71 in section 8"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B42

```asm
ACALL LDELAY
```

### B43

```asm
MOV A,#0011B
ACALL CMD
```

### B44

```asm
MOV A,#0011B
ACALL CMD
```

### B45

```asm
MOV A,#0010B
ACALL CMD
```

### B46

```asm
MOV A,#0010B
ACALL CMD
```

### B47

```asm
MOV A,#1000B
ACALL CMD
```

### B48

```asm
MOV A,#0000B
ACALL CMD
```

### B49

```asm
MOV A,#1000B
ACALL CMD
```

### B50

```asm
MOV A,#0
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 119 to 120"]
B51["B52: instructions - lines 121 to 121"]
B52["B53: instructions - lines 122 to 123"]
B53["B54: instructions - lines 124 to 125"]
B54["B55: instructions - lines 126 to 127"]
B55["B56: instructions - lines 128 to 129"]
B56["B57: instructions - lines 131 to 132"]
B57["B58: CMD - lines 136 to 142"]
B58["B59: instructions - lines 143 to 144"]
B59["B60: instructions - lines 146 to 148"]
B50 -->|call| B57
B50 -->|after return| B51
B51 -->|call| B70
B51 -->|after return| B52
B52 -->|call| B57
B52 -->|after return| B53
B53 -->|call| B57
B53 -->|after return| B54
B54 -->|call| B57
B54 -->|after return| B55
B55 -->|call| B57
B55 -->|after return| B56
B57 -->|call| B63
B57 -->|after return| B58
B58 -->|call| B63
B58 -->|after return| B59
B70["Continue at B71 in section 8"]
B63["Continue at B64 in section 7"]
```

### B51

```asm
MOV A,#0001B
ACALL CMD
```

### B52

```asm
ACALL LDELAY
```

### B53

```asm
MOV A,#0000B
ACALL CMD
```

### B54

```asm
MOV A,#0110B
ACALL CMD
```

### B55

```asm
MOV A,#0000B
ACALL CMD
```

### B56

```asm
MOV A,#1111B
ACALL CMD
```

### B57

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B58

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B59

```asm
MOV A,B
ACALL COMMON
```

### B60

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: WCHR - lines 151 to 157"]
B61["B62: instructions - lines 158 to 159"]
B62["B63: instructions - lines 161 to 163"]
B63["B64: COMMON - lines 166 to 173"]
B64["B65: instructions - lines 174 to 174"]
B65["B66: WSTR - lines 177 to 177"]
B66["B67: CONT1 - lines 179 to 181"]
B67["B68: instructions - lines 182 to 182"]
B68["B69: instructions - lines 183 to 184"]
B69["B70: EXIT1 - lines 186 to 187"]
B60 -->|call| B63
B60 -->|after return| B61
B61 -->|call| B63
B61 -->|after return| B62
B63 -->|call| B70
B63 -->|after return| B64
B65 -->|next| B66
B66 -->|condition true| B69
B66 -->|condition false| B67
B67 -->|call| B60
B67 -->|after return| B68
B68 -->|jump| B66
B70["Continue at B71 in section 8"]
```

### B61

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B62

```asm
MOV A,B
ACALL COMMON
```

### B63

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B64

```asm
CLR RW
SWAP A
ANL A,#11110000B
ANL P0,#00000111B
ORL P0,A
SETB EN
CLR EN
ACALL LDELAY
```

### B65

Return to the instruction following the active call.

```asm
RET
```

### B66

```asm
PUSH ACC
```

### B67

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B68

```asm
ACALL WCHR
```

### B69

```asm
INC DPTR
AJMP CONT1
```

### B70

Return to the instruction following the active call.

```asm
POP ACC
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: LDELAY - lines 190 to 192"]
B71["B72: CON4 - lines 194 to 195"]
B72["B73: instructions - lines 196 to 196"]
B73["B74: instructions - lines 197 to 199"]
B70 -->|next| B71
B71 -->|condition true| B71
B71 -->|condition false| B72
B72 -->|condition true| B71
B72 -->|condition false| B73
```

### B71

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B72

```asm
MOV R0,#250
DJNZ R0,$
```

### B73

```asm
DJNZ R1,CON4
```

### B74

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```
