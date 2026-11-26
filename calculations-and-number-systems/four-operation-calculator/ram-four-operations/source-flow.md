# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 8"]
B1["B2: START - lines 11 to 12"]
B2["B3: instructions - lines 13 to 16"]
B3["B4: SUBTRACT - lines 20 to 20"]
B4["B5: instructions - lines 21 to 24"]
B5["B6: MULTIPLICATION - lines 27 to 27"]
B6["B7: instructions - lines 28 to 32"]
B7["B8: DIVISION - lines 35 to 35"]
B8["B9: instructions - lines 36 to 41"]
B9["B10: NEXT - lines 46 to 46"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B9
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|jump| B9
B5 -->|condition true| B7
B5 -->|condition false| B6
B6 -->|jump| B9
B7 -->|condition true| B9
B7 -->|condition false| B8
B8 -->|jump| B9
B9 -->|jump| B9
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
CJNE A,#4,NEXT
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
SJMP NEXT
```
