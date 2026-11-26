# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: MENU - lines 4 to 5"]
B1["B2: LOOP1 - lines 7 to 13"]
B2["B3: LOOP2 - lines 16 to 16"]
B3["B4: instructions - lines 17 to 20"]
B4["B5: X8 - lines 22 to 23"]
B5["B6: instructions - lines 24 to 24"]
B6["B7: instructions - lines 25 to 25"]
B7["B8: ZEROS - lines 30 to 31"]
B8["B9: instructions - lines 32 to 32"]
B9["B10: LOOP3 - lines 35 to 35"]
B0 -->|condition true| B2
B0 -->|condition false| B1
B1 -->|jump| B1
B2 -->|condition true| B9
B2 -->|condition false| B3
B3 -->|next| B4
B4 -->|condition true| B7
B4 -->|condition false| B5
B5 -->|condition true| B4
B5 -->|condition false| B6
B6 -->|jump| B6
B7 -->|condition true| B4
B7 -->|condition false| B8
B8 -->|jump| B8
B9 -->|condition true| B0
B9 -->|condition false| B10
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV R7,#2
CJNE R7,#1, LOOP2
```

### B2

```asm
MOV R1,#90
MOV A,R1
ADD A,#1
ADD A,R1
MOV B,#2
DIV AB
SJMP $
```

### B3

```asm
CJNE R7,#2,LOOP3
```

### B4

```asm
MOV R1,#30H
MOV R5,#8
MOV 10H,#0
MOV A,R1
```

### B5

```asm
RRC A
JNC ZEROS
```

### B6

```asm
DJNZ R5,X8
```

### B7

```asm
SJMP $
```

### B8

```asm
INC 10H
DJNZ R5,X8
```

### B9

```asm
SJMP $
```

### B10

```asm
CJNE A,#3,MENU
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 36 to 36"]
B10 -->|jump| B10
```

### B11

```asm
SJMP $
```
