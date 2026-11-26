# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5)

## Destinations requiring review

`ENDD`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 9"]
B1["B2: MAIN - lines 12 to 13"]
B2["B3: instructions - lines 14 to 15"]
B3["B4: BEAND2 - lines 18 to 18"]
B4["B5: instructions - lines 19 to 20"]
B5["B6: BEAND3 - lines 23 to 23"]
B6["B7: instructions - lines 24 to 25"]
B7["B8: ERROR - lines 28 to 28"]
B8["B9: WARR - lines 31 to 31"]
B9["B10: instructions - lines 32 to 32"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B8
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|jump| B8
B5 -->|condition true| B7
B5 -->|condition false| B6
B6 -->|jump| B8
B7 -->|jump| B1
B8 -->|call| B13
B8 -->|after return| B9
B9 -->|call| B25
B9 -->|after return| B10
B13["Continue at B14 in section 2"]
B25["Continue at B26 in section 3"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#2
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
MOV 36H,#63
AJMP WARR
```

### B4

```asm
CJNE A,#2,BEAND3
```

### B5

```asm
MOV 36H,#55
AJMP WARR
```

### B6

```asm
CJNE A,#3,ERROR
```

### B7

```asm
MOV 36H,#70
AJMP WARR
```

### B8

```asm
SJMP MAIN
```

### B9

```asm
ACALL WARRENTLY
```

### B10

```asm
ACALL MAINTANACE
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 33 to 33"]
B11["B12: instructions - lines 36 to 41"]
B12["B13: instructions - lines 43 to 43"]
B13["B14: WARRENTLY - lines 49 to 50"]
B14["B15: instructions - lines 53 to 54"]
B15["B16: instructions - lines 55 to 58"]
B16["B17: BRAND2 - lines 61 to 61"]
B17["B18: instructions - lines 62 to 65"]
B18["B19: BRAND3 - lines 68 to 71"]
B19["B20: TWOYEAR - lines 75 to 76"]
B10 -->|call| B32
B10 -->|after return| B11
B11 -->|call| B39
B11 -->|after return| B12
B12 -->|jump| BX1
B13 -->|condition true| B19
B13 -->|condition false| B14
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|jump| B24
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B24
B18 -->|jump| B24
B19 -->|condition true| B21
B19 -->|condition false| B20
B32["Continue at B33 in section 4"]
B39["Continue at B40 in section 4"]
BX1["Unresolved destination: ENDD"]
B24["Continue at B25 in section 3"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELIVERY
```

### B12

```asm
MOV B,34H
MOV A,36H
MUL AB
MOV 36H,A
ACALL MEMBERSHIP
```

### B13

```asm
AJMP ENDD
```

### B14

```asm
MOV A,31H
CJNE A,#1,TWOYEAR
```

### B15

```asm
MOV A,30H
CJNE A,#1,BRAND2
```

### B16

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK
```

### B17

```asm
CJNE A,#2,BRAND3
```

### B18

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK
```

### B19

```asm
MOV A,36H
ADD A,#8
MOV 36H,A
SJMP BACK
```

### B20

```asm
MOV A,30H
CJNE A,#1,BRRAND2
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 77 to 80"]
B21["B22: BRRAND2 - lines 83 to 83"]
B22["B23: instructions - lines 84 to 87"]
B23["B24: BRRAND3 - lines 90 to 94"]
B24["B25: BACK - lines 96 to 96"]
B25["B26: MAINTANACE - lines 100 to 101"]
B26["B27: instructions - lines 104 to 105"]
B27["B28: instructions - lines 106 to 109"]
B28["B29: BRRANDD2 - lines 112 to 112"]
B29["B30: instructions - lines 113 to 116"]
B20 -->|jump| B24
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B24
B23 -->|jump| B24
B25 -->|condition true| B31
B25 -->|condition false| B26
B26 -->|condition true| B28
B26 -->|condition false| B27
B27 -->|jump| B31
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B31
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B22

```asm
CJNE A,#2,BRRAND3
```

### B23

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK
```

### B24

```asm
MOV 36H,#77
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B25

Return to the instruction following the active call.

```asm
RET
```

### B26

```asm
MOV A,32H
CJNE A,#1,NO
```

### B27

```asm
MOV A,30H
CJNE A,#1,BRRANDD2
```

### B28

```asm
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK1
```

### B29

```asm
CJNE A,#2,BRRANDD3
```

### B30

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK1
```

## Section 4

```mermaid
flowchart TD
B30["B31: BRRANDD3 - lines 119 to 122"]
B31["B32: NO - lines 126 to 126"]
B32["B33: DELIVERY - lines 130 to 131"]
B33["B34: instructions - lines 134 to 135"]
B34["B35: instructions - lines 136 to 139"]
B35["B36: BRRANDDD2 - lines 142 to 142"]
B36["B37: instructions - lines 143 to 146"]
B37["B38: BRRANDDD3 - lines 149 to 152"]
B38["B39: NO1 - lines 156 to 156"]
B39["B40: MEMBERSHIP - lines 160 to 161"]
B30 -->|jump| B31
B32 -->|condition true| B38
B32 -->|condition false| B33
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|jump| B38
B35 -->|condition true| B37
B35 -->|condition false| B36
B36 -->|jump| B38
B37 -->|jump| B38
B39 -->|condition true| B45
B39 -->|condition false| B40
B45["Continue at B46 in section 5"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK1
```

### B32

Return to the instruction following the active call.

```asm
RET
```

### B33

```asm
MOV A,33H
CJNE A,#1,NO1
```

### B34

```asm
MOV A,30H
CJNE A,#1,BRRANDDD2
```

### B35

```asm
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK2
```

### B36

```asm
CJNE A,#2,BRRANDDD3
```

### B37

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B38

```asm
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
```

### B39

Return to the instruction following the active call.

```asm
RET
```

### B40

```asm
MOV A,35H
CJNE A,#1,NO2
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 164 to 165"]
B41["B42: instructions - lines 166 to 169"]
B42["B43: BRRANDD22 - lines 172 to 172"]
B43["B44: instructions - lines 173 to 176"]
B44["B45: BRRANDD33 - lines 179 to 182"]
B45["B46: NO2 - lines 187 to 187"]
B40 -->|condition true| B42
B40 -->|condition false| B41
B41 -->|jump| B45
B42 -->|condition true| B44
B42 -->|condition false| B43
B43 -->|jump| B45
B44 -->|jump| B45
```

### B41

```asm
MOV A,30H
CJNE A,#1,BRRANDD22
```

### B42

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B43

```asm
CJNE A,#2,BRRANDD33
```

### B44

```asm
MOV A,36H
SUBB A,#17
MOV 36H,A
SJMP BACK3
```

### B45

```asm
MOV A,36H
SUBB A,#22
MOV 36H,A
SJMP BACK3
```

### B46

Return to the instruction following the active call.

```asm
RET
```
