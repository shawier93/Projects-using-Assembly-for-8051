# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 10"]
B1["B2: MAIN - lines 14 to 14"]
B2["B3: instructions - lines 16 to 17"]
B3["B4: instructions - lines 18 to 19"]
B4["B5: CAT2 - lines 22 to 22"]
B5["B6: instructions - lines 23 to 24"]
B6["B7: CAT3 - lines 27 to 27"]
B7["B8: instructions - lines 28 to 29"]
B8["B9: ERROR - lines 32 to 32"]
B9["B10: WARR - lines 35 to 35"]
B0 -->|next| B1
B1 -->|call| B42
B1 -->|after return| B2
B2 -->|condition true| B4
B2 -->|condition false| B3
B3 -->|jump| B9
B4 -->|condition true| B6
B4 -->|condition false| B5
B5 -->|jump| B9
B6 -->|condition true| B8
B6 -->|condition false| B7
B7 -->|jump| B9
B8 -->|jump| B1
B9 -->|call| B15
B9 -->|after return| B10
B42["Continue at B43 in section 5"]
B15["Continue at B16 in section 2"]
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
ACALL FLASH
```

### B3

```asm
MOV A,30H
CJNE A,#1,CAT2
```

### B4

```asm
MOV 36H,#35
AJMP WARR
```

### B5

```asm
CJNE A,#2,CAT3
```

### B6

```asm
MOV 36H,#28
AJMP WARR
```

### B7

```asm
CJNE A,#3,ERROR
```

### B8

```asm
MOV 36H,#44
AJMP WARR
```

### B9

```asm
SJMP MAIN
```

### B10

```asm
ACALL INSURANCE
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 36 to 36"]
B11["B12: instructions - lines 37 to 37"]
B12["B13: instructions - lines 38 to 38"]
B13["B14: instructions - lines 39 to 41"]
B14["B15: instructions - lines 43 to 43"]
B15["B16: INSURANCE - lines 49 to 50"]
B16["B17: instructions - lines 53 to 54"]
B17["B18: instructions - lines 55 to 58"]
B18["B19: CATT2 - lines 61 to 61"]
B19["B20: instructions - lines 62 to 65"]
B10 -->|call| B27
B10 -->|after return| B11
B11 -->|call| B35
B11 -->|after return| B12
B12 -->|call| B34
B12 -->|after return| B13
B13 -->|call| B42
B13 -->|after return| B14
B14 -->|jump| B54
B15 -->|condition true| B21
B15 -->|condition false| B16
B16 -->|condition true| B18
B16 -->|condition false| B17
B17 -->|jump| B26
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B26
B27["Continue at B28 in section 3"]
B35["Continue at B36 in section 4"]
B34["Continue at B35 in section 4"]
B42["Continue at B43 in section 5"]
B54["Continue at B55 in section 6"]
B21["Continue at B22 in section 3"]
B26["Continue at B27 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL ABROADINSURNCE
```

### B12

```asm
ACALL MEMBERSHIP
```

### B13

```asm
ACALL SUBSCRIPTION
```

### B14

```asm
MOV 35H,36H
ACALL FLASH
```

### B15

```asm
AJMP ENDD
```

### B16

```asm
MOV A,31H
CJNE A,#1,TWOYEAR
```

### B17

```asm
MOV A,30H
CJNE A,#1,CATT2
```

### B18

```asm
MOV A,36H
ADD A,#5
MOV 36H,A
SJMP BACK
```

### B19

```asm
CJNE A,#2,CATT3
```

### B20

```asm
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK
```

## Section 3

```mermaid
flowchart TD
B20["B21: CATT3 - lines 68 to 71"]
B21["B22: TWOYEAR - lines 75 to 76"]
B22["B23: instructions - lines 77 to 80"]
B23["B24: CCAT2 - lines 83 to 83"]
B24["B25: instructions - lines 84 to 87"]
B25["B26: CCAT3 - lines 90 to 93"]
B26["B27: BACK - lines 96 to 96"]
B27["B28: ABROADINSURNCE - lines 100 to 101"]
B28["B29: instructions - lines 104 to 105"]
B29["B30: instructions - lines 106 to 109"]
B20 -->|jump| B26
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B26
B23 -->|condition true| B25
B23 -->|condition false| B24
B24 -->|jump| B26
B25 -->|jump| B26
B27 -->|condition true| B33
B27 -->|condition false| B28
B28 -->|condition true| B30
B28 -->|condition false| B29
B29 -->|jump| B33
B33["Continue at B34 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,36H
ADD A,#12
MOV 36H,A
SJMP BACK
```

### B22

```asm
MOV A,30H
CJNE A,#1,CCAT2
```

### B23

```asm
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK
```

### B24

```asm
CJNE A,#2,CCAT3
```

### B25

```asm
MOV A,36H
ADD A,#18
MOV 36H,A
SJMP BACK
```

### B26

```asm
MOV A,36H
ADD A,#20
MOV 36H,A
SJMP BACK
```

### B27

Return to the instruction following the active call.

```asm
RET
```

### B28

```asm
MOV A,32H
CJNE A,#1,NO
```

### B29

```asm
MOV A,30H
CJNE A,#1,CAT22
```

### B30

```asm
MOV A,36H
ADD A,#13
MOV 36H,A
SJMP BACK1
```

## Section 4

```mermaid
flowchart TD
B30["B31: CAT22 - lines 112 to 112"]
B31["B32: instructions - lines 113 to 116"]
B32["B33: CAT33 - lines 119 to 122"]
B33["B34: NO - lines 126 to 126"]
B34["B35: SUBSCRIPTION - lines 130 to 133"]
B35["B36: MEMBERSHIP - lines 137 to 138"]
B36["B37: instructions - lines 141 to 142"]
B37["B38: instructions - lines 143 to 146"]
B38["B39: CATT22 - lines 149 to 149"]
B39["B40: instructions - lines 150 to 153"]
B30 -->|condition true| B32
B30 -->|condition false| B31
B31 -->|jump| B33
B32 -->|jump| B33
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
CJNE A,#2,CAT33
```

### B32

```asm
MOV A,36H
ADD A,#22
MOV 36H,A
SJMP BACK1
```

### B33

```asm
MOV A,36H
ADD A,#25
MOV 36H,A
SJMP BACK1
```

### B34

Return to the instruction following the active call.

```asm
RET
```

### B35

Return to the instruction following the active call.

```asm
MOV A,36H
SUBB A,34H
MOV 36H,A
RET
```

### B36

```asm
MOV A,33H
CJNE A,#1,NO2
```

### B37

```asm
MOV A,30H
CJNE A,#1,CATT22
```

### B38

```asm
MOV A,36H
SUBB A,#8
MOV 36H,A
SJMP BACK3
```

### B39

```asm
CJNE A,#2,CATT33
```

### B40

```asm
MOV A,36H
SUBB A,#10
MOV 36H,A
SJMP BACK3
```

## Section 5

```mermaid
flowchart TD
B40["B41: CATT33 - lines 156 to 159"]
B41["B42: NO2 - lines 164 to 164"]
B42["B43: FLASH - lines 167 to 167"]
B43["B44: HHE - lines 169 to 170"]
B44["B45: instructions - lines 172 to 173"]
B45["B46: instructions - lines 174 to 174"]
B46["B47: instructions - lines 175 to 175"]
B47["B48: DELAY - lines 178 to 178"]
B48["B49: X3 - lines 179 to 179"]
B49["B50: X2 - lines 180 to 180"]
B40 -->|jump| B41
B42 -->|next| B43
B43 -->|call| B47
B43 -->|after return| B44
B44 -->|call| B47
B44 -->|after return| B45
B45 -->|condition true| B43
B45 -->|condition false| B46
B47 -->|next| B48
B48 -->|next| B49
B49 -->|next| B50
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3
```

### B42

Return to the instruction following the active call.

```asm
RET
```

### B43

```asm
MOV R7,#
```

### B44

```asm
MOV P1,#0H
ACALL DELAY
```

### B45

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B46

```asm
DJNZ R7,HHE
```

### B47

Return to the instruction following the active call.

```asm
RET
```

### B48

```asm
MOV	R5,#2
```

### B49

```asm
MOV	R4,#20
```

### B50

```asm
MOV	R3,#250
```

## Section 6

```mermaid
flowchart TD
B50["B51: X1 - lines 181 to 181"]
B51["B52: instructions - lines 182 to 182"]
B52["B53: instructions - lines 183 to 183"]
B53["B54: instructions - lines 184 to 184"]
B54["B55: ENDD - lines 187 to 187"]
B50 -->|condition true| B50
B50 -->|condition false| B51
B51 -->|condition true| B49
B51 -->|condition false| B52
B52 -->|condition true| B48
B52 -->|condition false| B53
B54 -->|jump| B54
B49["Continue at B50 in section 5"]
B48["Continue at B49 in section 5"]
```

### B51

```asm
DJNZ	R3,X1
```

### B52

```asm
DJNZ	R4,X2
```

### B53

```asm
DJNZ	R5,X3
```

### B54

Return to the instruction following the active call.

```asm
RET
```

### B55

```asm
sjmp $
```
