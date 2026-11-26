# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 11"]
B1["B2: START - lines 14 to 15"]
B2["B3: instructions - lines 16 to 19"]
B3["B4: SUBTRACT - lines 23 to 23"]
B4["B5: instructions - lines 24 to 27"]
B5["B6: MULTIPLICATION - lines 30 to 30"]
B6["B7: instructions - lines 31 to 35"]
B7["B8: DIVISION - lines 38 to 38"]
B8["B9: instructions - lines 39 to 44"]
B9["B10: WRONG - lines 47 to 47"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B10
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|jump| B10
B5 -->|condition true| B7
B5 -->|condition false| B6
B6 -->|jump| B10
B7 -->|condition true| B9
B7 -->|condition false| B8
B8 -->|jump| B10
B9 -->|jump| B1
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#4
MOV 40H,#6
MOV 41H,#3
MOV 50H,#00
MOV 51H,#00
```

### B2

```asm
MOV A,30H
CJNE A,#1,SUBTRACT
```

### B3

```asm
MOV A,40H
ADD A,41H
MOV 50H,A
SJMP NEXT
```

### B4

```asm
CJNE A,#2,MULTIPLICATION
```

### B5

```asm
MOV A,40H
SUBB A,41H
MOV 50H,A
SJMP NEXT
```

### B6

```asm
CJNE A,#3,DIVISION
```

### B7

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV 50H,A
SJMP NEXT
```

### B8

```asm
CJNE A,#4,WRONG
```

### B9

```asm
MOV A,40H
MOV B,41H
DIV AB
MOV 50H,A
MOV 51H,B
SJMP NEXT
```

### B10

```asm
SJMP START
```

## Section 2

```mermaid
flowchart TD
B10["B11: NEXT - lines 50 to 50"]
B10 -->|jump| B10
```

### B11

```asm
SJMP NEXT
```
