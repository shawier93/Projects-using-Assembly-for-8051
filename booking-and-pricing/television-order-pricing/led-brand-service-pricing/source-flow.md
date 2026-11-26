# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7)

## Destinations requiring review

`ENDD`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 9"]
B1["B2: MAIN - lines 12 to 13"]
B2["B3: instructions - lines 14 to 14"]
B3["B4: instructions - lines 15 to 16"]
B4["B5: BEAND2 - lines 19 to 19"]
B5["B6: instructions - lines 20 to 20"]
B6["B7: instructions - lines 21 to 22"]
B7["B8: BEAND3 - lines 25 to 25"]
B8["B9: instructions - lines 26 to 26"]
B9["B10: instructions - lines 27 to 28"]
B0 -->|next| B1
B1 -->|condition true| B4
B1 -->|condition false| B2
B2 -->|call| B49
B2 -->|after return| B3
B3 -->|jump| B11
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|call| B54
B5 -->|after return| B6
B6 -->|jump| B11
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B59
B8 -->|after return| B9
B9 -->|jump| B11
B49["Continue at B50 in section 5"]
B11["Continue at B12 in section 2"]
B54["Continue at B55 in section 6"]
B10["Continue at B11 in section 2"]
B59["Continue at B60 in section 6"]
```

### B1

```asm
MOV 30H,#3
MOV 31H,#2
MOV 32H,#1
MOV 33H,#2
MOV 34H,#2
MOV 35H,#1
MOV 36H,#0
```

### B2

```asm
MOV A,30H
CJNE A,#1,BEAND2
```

### B3

```asm
ACALL FLASH1
```

### B4

```asm
MOV 36H,#63
AJMP WARR
```

### B5

```asm
CJNE A,#2,BEAND3
```

### B6

```asm
ACALL FLASH2
```

### B7

```asm
MOV 36H,#55
AJMP WARR
```

### B8

```asm
CJNE A,#3,ERROR
```

### B9

```asm
ACALL FLASH3
```

### B10

```asm
MOV 36H,#70
AJMP WARR
```

## Section 2

```mermaid
flowchart TD
B10["B11: ERROR - lines 31 to 31"]
B11["B12: WARR - lines 34 to 34"]
B12["B13: instructions - lines 35 to 35"]
B13["B14: instructions - lines 36 to 36"]
B14["B15: instructions - lines 39 to 44"]
B15["B16: instructions - lines 46 to 46"]
B16["B17: WARRENTLY - lines 52 to 53"]
B17["B18: instructions - lines 56 to 57"]
B18["B19: instructions - lines 58 to 61"]
B19["B20: BRAND2 - lines 64 to 64"]
B10 -->|jump| B1
B11 -->|call| B16
B11 -->|after return| B12
B12 -->|call| B28
B12 -->|after return| B13
B13 -->|call| B35
B13 -->|after return| B14
B14 -->|call| B42
B14 -->|after return| B15
B15 -->|jump| BX1
B16 -->|condition true| B22
B16 -->|condition false| B17
B17 -->|condition true| B19
B17 -->|condition false| B18
B18 -->|jump| B27
B19 -->|condition true| B21
B19 -->|condition false| B20
B1["Continue at B2 in section 1"]
B28["Continue at B29 in section 3"]
B35["Continue at B36 in section 4"]
B42["Continue at B43 in section 5"]
BX1["Unresolved destination: ENDD"]
B22["Continue at B23 in section 3"]
B27["Continue at B28 in section 3"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
SJMP MAIN
```

### B12

```asm
ACALL WARRENTLY
```

### B13

```asm
ACALL MAINTANACE
```

### B14

```asm
ACALL DELIVERY
```

### B15

```asm
MOV B,34H
MOV A,36H
MUL AB
MOV 36H,A
ACALL MEMBERSHIP
```

### B16

```asm
AJMP ENDD
```

### B17

```asm
MOV A,31H
CJNE A,#1,TWOYEAR
```

### B18

```asm
MOV A,30H
CJNE A,#1,BRAND2
```

### B19

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK
```

### B20

```asm
CJNE A,#2,BRAND3
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 65 to 68"]
B21["B22: BRAND3 - lines 71 to 74"]
B22["B23: TWOYEAR - lines 78 to 79"]
B23["B24: instructions - lines 80 to 83"]
B24["B25: BRRAND2 - lines 86 to 86"]
B25["B26: instructions - lines 87 to 90"]
B26["B27: BRRAND3 - lines 93 to 97"]
B27["B28: BACK - lines 99 to 99"]
B28["B29: MAINTANACE - lines 103 to 104"]
B29["B30: instructions - lines 107 to 108"]
B20 -->|jump| B27
B21 -->|jump| B27
B22 -->|condition true| B24
B22 -->|condition false| B23
B23 -->|jump| B27
B24 -->|condition true| B26
B24 -->|condition false| B25
B25 -->|jump| B27
B26 -->|jump| B27
B28 -->|condition true| B34
B28 -->|condition false| B29
B29 -->|condition true| B31
B29 -->|condition false| B30
B34["Continue at B35 in section 4"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK
```

### B22

```asm
MOV A,36H
ADD A,#8
MOV 36H,A
SJMP BACK
```

### B23

```asm
MOV A,30H
CJNE A,#1,BRRAND2
```

### B24

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B25

```asm
CJNE A,#2,BRRAND3
```

### B26

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK
```

### B27

```asm
MOV 36H,#77
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B28

Return to the instruction following the active call.

```asm
RET
```

### B29

```asm
MOV A,32H
CJNE A,#1,NO
```

### B30

```asm
MOV A,30H
CJNE A,#1,BRRANDD2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 109 to 112"]
B31["B32: BRRANDD2 - lines 115 to 115"]
B32["B33: instructions - lines 116 to 119"]
B33["B34: BRRANDD3 - lines 122 to 125"]
B34["B35: NO - lines 129 to 129"]
B35["B36: DELIVERY - lines 133 to 134"]
B36["B37: instructions - lines 137 to 138"]
B37["B38: instructions - lines 139 to 142"]
B38["B39: BRRANDDD2 - lines 145 to 145"]
B39["B40: instructions - lines 146 to 149"]
B30 -->|jump| B34
B31 -->|condition true| B33
B31 -->|condition false| B32
B32 -->|jump| B34
B33 -->|jump| B34
B35 -->|condition true| B41
B35 -->|condition false| B36
B36 -->|condition true| B38
B36 -->|condition false| B37
B37 -->|jump| B41
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B41
B41["Continue at B42 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK1
```

### B32

```asm
CJNE A,#2,BRRANDD3
```

### B33

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK1
```

### B34

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK1
```

### B35

Return to the instruction following the active call.

```asm
RET
```

### B36

```asm
MOV A,33H
CJNE A,#1,NO1
```

### B37

```asm
MOV A,30H
CJNE A,#1,BRRANDDD2
```

### B38

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK2
```

### B39

```asm
CJNE A,#2,BRRANDDD3
```

### B40

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

## Section 5

```mermaid
flowchart TD
B40["B41: BRRANDDD3 - lines 152 to 155"]
B41["B42: NO1 - lines 159 to 159"]
B42["B43: MEMBERSHIP - lines 163 to 164"]
B43["B44: instructions - lines 167 to 168"]
B44["B45: instructions - lines 169 to 172"]
B45["B46: BRRANDD22 - lines 175 to 175"]
B46["B47: instructions - lines 176 to 179"]
B47["B48: BRRANDD33 - lines 182 to 185"]
B48["B49: NO2 - lines 190 to 190"]
B49["B50: FLASH1 - lines 193 to 193"]
B40 -->|jump| B41
B42 -->|condition true| B48
B42 -->|condition false| B43
B43 -->|condition true| B45
B43 -->|condition false| B44
B44 -->|jump| B48
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|jump| B48
B47 -->|jump| B48
B49 -->|next| B50
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B42

Return to the instruction following the active call.

```asm
RET
```

### B43

```asm
MOV A,35H
CJNE A,#1,NO2
```

### B44

```asm
MOV A,30H
CJNE A,#1,BRRANDD22
```

### B45

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B46

```asm
CJNE A,#2,BRRANDD33
```

### B47

```asm
MOV A,36H
SUBB A,#17
MOV 36H,A
SJMP BACK3
```

### B48

```asm
MOV A,36H
SUBB A,#22
MOV 36H,A
SJMP BACK3
```

### B49

Return to the instruction following the active call.

```asm
RET
```

### B50

```asm
MOV R7,#5
```

## Section 6

```mermaid
flowchart TD
B50["B51: AG - lines 195 to 196"]
B51["B52: instructions - lines 197 to 198"]
B52["B53: instructions - lines 199 to 199"]
B53["B54: instructions - lines 200 to 200"]
B54["B55: FLASH2 - lines 203 to 203"]
B55["B56: AG1 - lines 205 to 206"]
B56["B57: instructions - lines 207 to 208"]
B57["B58: instructions - lines 209 to 209"]
B58["B59: instructions - lines 210 to 210"]
B59["B60: FLASH3 - lines 213 to 213"]
B50 -->|call| B64
B50 -->|after return| B51
B51 -->|call| B64
B51 -->|after return| B52
B52 -->|condition true| B50
B52 -->|condition false| B53
B54 -->|next| B55
B55 -->|call| B64
B55 -->|after return| B56
B56 -->|call| B64
B56 -->|after return| B57
B57 -->|condition true| B55
B57 -->|condition false| B58
B59 -->|next| B60
B64["Continue at B65 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV P1,#11101111B
ACALL DELAY
```

### B52

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B53

```asm
DJNZ R7,AG
```

### B54

Return to the instruction following the active call.

```asm
RET
```

### B55

```asm
MOV R7,#5
```

### B56

```asm
MOV P1,#11110111B
ACALL DELAY
```

### B57

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B58

```asm
DJNZ R7,AG1
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
MOV R7,#5
```

## Section 7

```mermaid
flowchart TD
B60["B61: AG2 - lines 215 to 216"]
B61["B62: instructions - lines 217 to 218"]
B62["B63: instructions - lines 219 to 219"]
B63["B64: instructions - lines 220 to 220"]
B64["B65: DELAY - lines 225 to 226"]
B65["B66: instructions - lines 227 to 227"]
B60 -->|call| B64
B60 -->|after return| B61
B61 -->|call| B64
B61 -->|after return| B62
B62 -->|condition true| B60
B62 -->|condition false| B63
B64 -->|condition true| B64
B64 -->|condition false| B65
```

### B61

```asm
MOV P1,#11111011B
ACALL DELAY
```

### B62

```asm
MOV P1,#11111111B
ACALL DELAY
```

### B63

```asm
DJNZ R7,AG2
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
MOV R0, #200
DJNZ R0, $
```

### B66

Return to the instruction following the active call.

```asm
RET
```
