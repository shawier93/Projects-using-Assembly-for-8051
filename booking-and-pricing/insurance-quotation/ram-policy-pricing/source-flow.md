# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4)

## Destinations requiring review

`ENDD`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 10"]
B1["B2: MAIN - lines 14 to 15"]
B2["B3: instructions - lines 16 to 17"]
B3["B4: CAT2 - lines 20 to 20"]
B4["B5: instructions - lines 21 to 22"]
B5["B6: CAT3 - lines 25 to 25"]
B6["B7: instructions - lines 26 to 27"]
B7["B8: ERROR - lines 30 to 30"]
B8["B9: WARR - lines 33 to 33"]
B9["B10: instructions - lines 34 to 34"]
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
MOV 33H,#1
MOV 34H,#4
MOV 35H,#0
MOV 36H,#0
```

### B2

```asm
MOV A,30H
CJNE A,#1,CAT2
```

### B3

```asm
MOV 36H,#35
AJMP WARR
```

### B4

```asm
CJNE A,#2,CAT3
```

### B5

```asm
MOV 36H,#28
AJMP WARR
```

### B6

```asm
CJNE A,#3,ERROR
```

### B7

```asm
MOV 36H,#44
AJMP WARR
```

### B8

```asm
SJMP MAIN
```

### B9

```asm
ACALL INSURANCE
```

### B10

```asm
ACALL ABROADINSURNCE
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 35 to 35"]
B11["B12: instructions - lines 36 to 36"]
B12["B13: instructions - lines 37 to 39"]
B13["B14: INSURANCE - lines 45 to 46"]
B14["B15: instructions - lines 49 to 50"]
B15["B16: instructions - lines 51 to 54"]
B16["B17: CATT2 - lines 57 to 57"]
B17["B18: instructions - lines 58 to 61"]
B18["B19: CATT3 - lines 64 to 67"]
B19["B20: TWOYEAR - lines 71 to 72"]
B10 -->|call| B33
B10 -->|after return| B11
B11 -->|call| B32
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
B33["Continue at B34 in section 4"]
B32["Continue at B33 in section 4"]
BX1["Unresolved destination: ENDD"]
B24["Continue at B25 in section 3"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL MEMBERSHIP
```

### B12

```asm
ACALL SUBSCRIPTION
```

### B13

```asm
MOV 35H,36H
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
CJNE A,#1,CATT2
```

### B16

```asm
MOV A,36H
ADD A,#5
MOV 36H,A
SJMP BACK
```

### B17

```asm
CJNE A,#2,CATT3
```

### B18

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

### B19

```asm
MOV A,36H
ADD A,#12
MOV 36H,A
SJMP BACK
```

### B20

```asm
MOV A,30H
CJNE A,#1,CCAT2
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 73 to 76"]
B21["B22: CCAT2 - lines 79 to 79"]
B22["B23: instructions - lines 80 to 83"]
B23["B24: CCAT3 - lines 86 to 89"]
B24["B25: BACK - lines 92 to 92"]
B25["B26: ABROADINSURNCE - lines 96 to 97"]
B26["B27: instructions - lines 100 to 101"]
B27["B28: instructions - lines 102 to 105"]
B28["B29: CAT22 - lines 108 to 108"]
B29["B30: instructions - lines 109 to 112"]
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
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B22

```asm
CJNE A,#2,CCAT3
```

### B23

```asm
MOV A,36H
ADD A,#18
MOV 36H,A
SJMP BACK
```

### B24

```asm
MOV A,36H
ADD A,#20
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
CJNE A,#1,CAT22
```

### B28

```asm
MOV A,36H
ADD A,#13
MOV 36H,A
SJMP BACK1
```

### B29

```asm
CJNE A,#2,CAT33
```

### B30

```asm
MOV A,36H
ADD A,#22
MOV 36H,A
SJMP BACK1
```

## Section 4

```mermaid
flowchart TD
B30["B31: CAT33 - lines 115 to 118"]
B31["B32: NO - lines 122 to 122"]
B32["B33: SUBSCRIPTION - lines 126 to 129"]
B33["B34: MEMBERSHIP - lines 133 to 134"]
B34["B35: instructions - lines 137 to 138"]
B35["B36: instructions - lines 139 to 142"]
B36["B37: CATT22 - lines 145 to 145"]
B37["B38: instructions - lines 146 to 149"]
B38["B39: CATT33 - lines 152 to 155"]
B39["B40: NO2 - lines 160 to 160"]
B30 -->|jump| B31
B33 -->|condition true| B39
B33 -->|condition false| B34
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|jump| B39
B36 -->|condition true| B38
B36 -->|condition false| B37
B37 -->|jump| B39
B38 -->|jump| B39
```

### B31

```asm
MOV A,36H
ADD A,#25
MOV 36H,A
SJMP BACK1
```

### B32

Return to the instruction following the active call.

```asm
RET
```

### B33

Return to the instruction following the active call.

```asm
MOV A,36H
SUBB A,34H
MOV 36H,A
RET
```

### B34

```asm
MOV A,33H
CJNE A,#1,NO2
```

### B35

```asm
MOV A,30H
CJNE A,#1,CATT22
```

### B36

```asm
MOV A,36H
SUBB A,#8
MOV 36H,A
SJMP BACK3
```

### B37

```asm
CJNE A,#2,CATT33
```

### B38

```asm
MOV A,36H
SUBB A,#10
MOV 36H,A
SJMP BACK3
```

### B39

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B40

Return to the instruction following the active call.

```asm
RET
```
