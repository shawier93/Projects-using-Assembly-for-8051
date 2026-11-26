# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 10"]
B1["B2: MAIN_MENU - lines 14 to 16"]
B2["B3: EXIT - lines 21 to 21"]
B0 -->|next| B1
B1 -->|condition true| B2
B1 -->|condition false| B2
B2 -->|jump| B2
```

### B1

```asm
MOV 30H,#12H
MOV 40H,#100
MOV 50H,#0
MOV 51H,#1
MOV 52H,#100
```

### B2

```asm
MOV 50H,#12H
MOV A,50H
CJNE A,50H,EXIT
```

### B3

```asm
SJMP $
```
