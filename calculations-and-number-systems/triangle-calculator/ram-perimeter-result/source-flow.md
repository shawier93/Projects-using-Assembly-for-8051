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
B0["B1: instructions - lines 2 to 9"]
B1["B2: MENU - lines 13 to 14"]
B2["B3: instructions - lines 17 to 26"]
B3["B4: OPERATION2 - lines 29 to 29"]
B4["B5: instructions - lines 32 to 40"]
B5["B6: WRONG - lines 42 to 42"]
B6["B7: EE - lines 44 to 44"]
B0 -->|next| B1
B1 -->|condition true| B3
B1 -->|condition false| B2
B2 -->|jump| B6
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|jump| B6
B5 -->|jump| B1
B6 -->|jump| B6
```

### B1

```asm
MOV 30H, #2
MOV 40H, #3
MOV 41H, #4
MOV 42H, #2
MOV 43H, #3
MOV 44H, #4
MOV 50H, #0
MOV 51H, #0
```

### B2

```asm
MOV A,30H
CJNE A,#1,OPERATION2
```

### B3

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV B,#2
DIV AB
MOV 50H,A
MOV 51H,B
SJMP EE
```

### B4

```asm
CJNE A,#2,WRONG
```

### B5

```asm
MOV A,42H
ADD A,43H
ADD A,44H
MOV 50H,A
MOV 51H,#0
SJMP EE
```

### B6

```asm
SJMP MENU
```

### B7

```asm
SJMP EE
```
