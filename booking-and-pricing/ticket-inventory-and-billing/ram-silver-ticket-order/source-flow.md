# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 3 to 14"]
B1["B2: instructions - lines 16 to 18"]
B2["B3: instructions - lines 19 to 24"]
B3["B4: SILVER - lines 28 to 30"]
B4["B5: instructions - lines 31 to 36"]
B5["B6: MAXAMOUNT - lines 41 to 41"]
B0 -->|condition true| B3
B0 -->|condition false| B1
B1 -->|condition true| B5
B1 -->|condition false| B2
B2 -->|jump| B5
B3 -->|condition true| B5
B3 -->|condition false| B4
B4 -->|jump| B5
B5 -->|jump| B5
```

### B1

```asm
MOV 33H,#9
MOV 43H,#5
MOV 34H,#9
MOV 44H,#3
MOV 30H,#2
MOV 40H,#4
MOV R7,30H
MOV R6,40H
CJNE R7,#1,SILVER
```

### B2

```asm
MOV A,33H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B3

```asm
MOV 33H,A
MOV A,R6
MOV B,43H
MUL AB
MOV 50H,A
SJMP STOP
```

### B4

```asm
MOV A,34H
SUBB A,R6
JB  ACC.7,MAXAMOUNT
```

### B5

```asm
MOV 34H,A
MOV A,R6
MOV B,44H
MUL AB
MOV 50H,A
SJMP STOP
```

### B6

```asm
SJMP STOP
```
