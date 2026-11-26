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
B0["B1: START - lines 9 to 9"]
B1["B2: instructions - lines 10 to 11"]
B2["B3: instructions - lines 13 to 13"]
B3["B4: instructions - lines 14 to 15"]
B4["B5: instructions - lines 17 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: instructions - lines 20 to 20"]
B7["B8: instructions - lines 21 to 22"]
B8["B9: instructions - lines 24 to 25"]
B9["B10: instructions - lines 26 to 26"]
B0 -->|call| B14
B0 -->|after return| B1
B1 -->|call| B34
B1 -->|after return| B2
B2 -->|call| B51
B2 -->|after return| B3
B3 -->|call| B37
B3 -->|after return| B4
B4 -->|call| B51
B4 -->|after return| B5
B5 -->|call| B37
B5 -->|after return| B6
B6 -->|call| B51
B6 -->|after return| B7
B7 -->|call| B37
B7 -->|after return| B8
B8 -->|call| B34
B8 -->|after return| B9
B9 -->|call| B47
B9 -->|after return| B10
B14["Continue at B15 in section 2"]
B34["Continue at B35 in section 4"]
B51["Continue at B52 in section 6"]
B37["Continue at B38 in section 4"]
B47["Continue at B48 in section 5"]
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
ACALL KEYPAD
```

### B4

```asm
MOV 40H,A
ACALL WCHR
```

### B5

```asm
ACALL KEYPAD
```

### B6

```asm
ACALL WCHR
```

### B7

```asm
ACALL KEYPAD
```

### B8

```asm
MOV 41H,A
ACALL WCHR
```

### B9

```asm
MOV A,#0c0H
ACALL CMD
```

### B10

```asm
ACALL LDELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 27 to 28"]
B11["B12: instructions - lines 30 to 41"]
B12["B13: instructions - lines 42 to 44"]
B13["B14: STOP - lines 45 to 45"]
B14["B15: INLCD - lines 48 to 49"]
B15["B16: WAIT - lines 51 to 51"]
B16["B17: instructions - lines 52 to 52"]
B17["B18: instructions - lines 54 to 56"]
B18["B19: instructions - lines 57 to 57"]
B19["B20: instructions - lines 58 to 59"]
B10 -->|call| B42
B10 -->|after return| B11
B11 -->|call| B37
B11 -->|after return| B12
B12 -->|call| B37
B12 -->|after return| B13
B13 -->|jump| B13
B14 -->|next| B15
B15 -->|call| B47
B15 -->|after return| B16
B16 -->|condition true| B15
B16 -->|condition false| B17
B17 -->|call| B34
B17 -->|after return| B18
B18 -->|call| B47
B18 -->|after return| B19
B19 -->|call| B34
B19 -->|after return| B20
B42["Continue at B43 in section 5"]
B37["Continue at B38 in section 4"]
B47["Continue at B48 in section 5"]
B34["Continue at B35 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#RESULT
ACALL WSTR
```

### B12

```asm
MOV A,40H
SUBB A,#30H
MOV 40H,A
MOV B,A
MOV A,41H
SUBB A,#30H
MOV 41H,A
MUL AB
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B13

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B14

```asm
AJMP $
```

### B15

```asm
PUSH 7
MOV R7,#20
```

### B16

```asm
ACALL LDELAY
```

### B17

```asm
DJNZ R7,WAIT
```

### B18

```asm
MOV P0,#00000111B
MOV A,#0011B
ACALL CMD
```

### B19

```asm
ACALL LDELAY
```

### B20

```asm
MOV A,#0011B
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 60 to 61"]
B21["B22: instructions - lines 62 to 63"]
B22["B23: instructions - lines 64 to 65"]
B23["B24: instructions - lines 66 to 67"]
B24["B25: instructions - lines 68 to 69"]
B25["B26: instructions - lines 70 to 71"]
B26["B27: instructions - lines 72 to 73"]
B27["B28: instructions - lines 74 to 75"]
B28["B29: instructions - lines 76 to 76"]
B29["B30: instructions - lines 77 to 78"]
B20 -->|call| B34
B20 -->|after return| B21
B21 -->|call| B34
B21 -->|after return| B22
B22 -->|call| B34
B22 -->|after return| B23
B23 -->|call| B34
B23 -->|after return| B24
B24 -->|call| B34
B24 -->|after return| B25
B25 -->|call| B34
B25 -->|after return| B26
B26 -->|call| B34
B26 -->|after return| B27
B27 -->|call| B34
B27 -->|after return| B28
B28 -->|call| B47
B28 -->|after return| B29
B29 -->|call| B34
B29 -->|after return| B30
B34["Continue at B35 in section 4"]
B47["Continue at B48 in section 5"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#0011B
ACALL CMD
```

### B22

```asm
MOV A,#0010B
ACALL CMD
```

### B23

```asm
MOV A,#0010B
ACALL CMD
```

### B24

```asm
MOV A,#1000B
ACALL CMD
```

### B25

```asm
MOV A,#0000B
ACALL CMD
```

### B26

```asm
MOV A,#1000B
ACALL CMD
```

### B27

```asm
MOV A,#0
ACALL CMD
```

### B28

```asm
MOV A,#0001B
ACALL CMD
```

### B29

```asm
ACALL LDELAY
```

### B30

```asm
MOV A,#0000B
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 79 to 80"]
B31["B32: instructions - lines 81 to 82"]
B32["B33: instructions - lines 83 to 84"]
B33["B34: instructions - lines 86 to 87"]
B34["B35: CMD - lines 91 to 97"]
B35["B36: instructions - lines 98 to 99"]
B36["B37: instructions - lines 101 to 103"]
B37["B38: WCHR - lines 106 to 112"]
B38["B39: instructions - lines 113 to 114"]
B39["B40: instructions - lines 116 to 118"]
B30 -->|call| B34
B30 -->|after return| B31
B31 -->|call| B34
B31 -->|after return| B32
B32 -->|call| B34
B32 -->|after return| B33
B34 -->|call| B40
B34 -->|after return| B35
B35 -->|call| B40
B35 -->|after return| B36
B37 -->|call| B40
B37 -->|after return| B38
B38 -->|call| B40
B38 -->|after return| B39
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#0110B
ACALL CMD
```

### B32

```asm
MOV A,#0000B
ACALL CMD
```

### B33

```asm
MOV A,#1111B
ACALL CMD
```

### B34

Return to the instruction following the active call.

```asm
POP 7
RET
```

### B35

```asm
PUSH ACC
PUSH B
CLR RS
MOV B,A
SWAP A
ACALL COMMON
```

### B36

```asm
MOV A,B
ACALL COMMON
```

### B37

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B38

```asm
PUSH ACC
PUSH B
SETB RS
MOV B,A
SWAP A
ACALL COMMON
```

### B39

```asm
MOV A,B
ACALL COMMON
```

### B40

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 5

```mermaid
flowchart TD
B40["B41: COMMON - lines 121 to 128"]
B41["B42: instructions - lines 129 to 129"]
B42["B43: WSTR - lines 132 to 132"]
B43["B44: CONT1 - lines 134 to 136"]
B44["B45: instructions - lines 137 to 137"]
B45["B46: instructions - lines 138 to 139"]
B46["B47: EXIT1 - lines 141 to 142"]
B47["B48: LDELAY - lines 145 to 147"]
B48["B49: CON4 - lines 149 to 150"]
B49["B50: instructions - lines 151 to 151"]
B40 -->|call| B47
B40 -->|after return| B41
B42 -->|next| B43
B43 -->|condition true| B46
B43 -->|condition false| B44
B44 -->|call| B37
B44 -->|after return| B45
B45 -->|jump| B43
B47 -->|next| B48
B48 -->|condition true| B48
B48 -->|condition false| B49
B49 -->|condition true| B48
B49 -->|condition false| B50
B37["Continue at B38 in section 4"]
B50["Continue at B51 in section 6"]
```

### B41

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

### B42

Return to the instruction following the active call.

```asm
RET
```

### B43

```asm
PUSH ACC
```

### B44

```asm
CLR A
MOVC A,@A+DPTR
JZ EXIT1
```

### B45

```asm
ACALL WCHR
```

### B46

```asm
INC DPTR
AJMP CONT1
```

### B47

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B48

```asm
PUSH 0
PUSH 1
MOV R1,#20
```

### B49

```asm
MOV R0,#250
DJNZ R0,$
```

### B50

```asm
DJNZ R1,CON4
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 152 to 154"]
B51["B52: KEYPAD - lines 160 to 160"]
B52["B53: K1 - lines 161 to 164"]
B53["B54: K2 - lines 165 to 165"]
B54["B55: instructions - lines 166 to 168"]
B55["B56: instructions - lines 169 to 169"]
B56["B57: OVER - lines 171 to 171"]
B57["B58: instructions - lines 172 to 174"]
B58["B59: instructions - lines 175 to 175"]
B59["B60: OVER1 - lines 177 to 180"]
B51 -->|next| B52
B52 -->|condition true| B52
B52 -->|condition false| B53
B53 -->|call| B72
B53 -->|after return| B54
B54 -->|condition true| B56
B54 -->|condition false| B55
B55 -->|jump| B53
B56 -->|call| B72
B56 -->|after return| B57
B57 -->|condition true| B59
B57 -->|condition false| B58
B58 -->|jump| B53
B59 -->|condition true| B64
B59 -->|condition false| B60
B72["Continue at B73 in section 8"]
B64["Continue at B65 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
POP 1
POP 0
RET
```

### B52

```asm
MOV P2,#11110000B
```

### B53

```asm
MOV P2,#11110000B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,K1
```

### B54

```asm
ACALL TMSEC
```

### B55

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER
```

### B56

```asm
SJMP K2
```

### B57

```asm
ACALL TMSEC
```

### B58

```asm
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,OVER1
```

### B59

```asm
SJMP K2
```

### B60

```asm
MOV P2,#11111110B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_0
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 181 to 184"]
B61["B62: instructions - lines 185 to 188"]
B62["B63: instructions - lines 189 to 192"]
B63["B64: instructions - lines 193 to 193"]
B64["B65: ROW_0 - lines 194 to 195"]
B65["B66: ROW_1 - lines 196 to 197"]
B66["B67: ROW_2 - lines 198 to 199"]
B67["B68: ROW_3 - lines 200 to 200"]
B68["B69: FIND - lines 202 to 202"]
B69["B70: FIND1 - lines 204 to 205"]
B60 -->|condition true| B65
B60 -->|condition false| B61
B61 -->|condition true| B66
B61 -->|condition false| B62
B62 -->|condition true| B67
B62 -->|condition false| B63
B63 -->|jump| B53
B64 -->|jump| B68
B65 -->|jump| B68
B66 -->|jump| B68
B67 -->|next| B68
B68 -->|next| B69
B69 -->|condition true| B71
B69 -->|condition false| B70
B53["Continue at B54 in section 6"]
B71["Continue at B72 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV P2,#11111101B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_1
```

### B62

```asm
MOV P2,#11111011B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_2
```

### B63

```asm
MOV P2,#11110111B
MOV A,P2
ANL A,#11110000B
CJNE A,#11110000B,ROW_3
```

### B64

```asm
LJMP K2
```

### B65

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B66

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B67

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B68

```asm
MOV DPTR,#KCODE3
```

### B69

```asm
SWAP A
```

### B70

```asm
RRC A
JNC MATCH
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 206 to 207"]
B71["B72: MATCH - lines 209 to 211"]
B72["B73: TMSEC - lines 214 to 217"]
B73["B74: BACK - lines 218 to 218"]
B74["B75: instructions - lines 219 to 221"]
B70 -->|jump| B69
B72 -->|next| B73
B73 -->|condition true| B73
B73 -->|condition false| B74
B69["Continue at B70 in section 7"]
```

### B71

```asm
INC DPTR
SJMP FIND1
```

### B72

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B73

```asm
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
```

### B74

```asm
JNB TF0,BACK
```

### B75

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```
