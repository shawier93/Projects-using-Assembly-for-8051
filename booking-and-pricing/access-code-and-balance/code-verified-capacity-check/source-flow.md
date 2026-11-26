# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 10"]
B1["B2: MAIN_MENU - lines 14 to 15"]
B2["B3: instructions - lines 18 to 19"]
B3["B4: instructions - lines 21 to 22"]
B4["B5: CONT - lines 25 to 25"]
B5["B6: instructions - lines 28 to 29"]
B6["B7: instructions - lines 31 to 33"]
B7["B8: CHEACK - lines 36 to 38"]
B8["B9: CONTT - lines 41 to 41"]
B9["B10: instructions - lines 43 to 44"]
B0 -->|next| B1
B1 -->|condition true| B10
B1 -->|condition false| B2
B2 -->|condition true| B1
B2 -->|condition false| B3
B3 -->|condition true| B4
B3 -->|condition false| B4
B4 -->|condition true| B10
B4 -->|condition false| B5
B5 -->|condition true| B10
B5 -->|condition false| B6
B6 -->|next| B7
B7 -->|condition true| B8
B7 -->|condition false| B8
B8 -->|condition true| B7
B8 -->|condition false| B9
B9 -->|next| B10
B10["Continue at B11 in section 2"]
```

### B1

```asm
MOV 30H,#12H
MOV 40H,#110
MOV 50H,#12h
MOV 51H,#1
mov 52h,#0
MOV 53H,#50
```

### B2

```asm
MOV A,#1
CJNE A,#1,EXIT
```

### B3

```asm
MOV A,50H
CJNE A,30H,MAIN_MENU
```

### B4

```asm
MOV A,40H
CJNE A,#255,CONT
```

### B5

```asm
JNC EXIT
```

### B6

```asm
MOV A,51H
CJNE A,#1,EXIT
```

### B7

```asm
mov a,#255
subb a,40h
mov 52h,a
```

### B8

```asm
mov a,53h
cjne a,52h,contt
```

### B9

```asm
jnc cheack
```

### B10

```asm
add a,40h
mov 40h,a
```

## Section 2

```mermaid
flowchart TD
B10["B11: EXIT - lines 49 to 49"]
B10 -->|jump| B10
```

### B11

```asm
SJMP $
```
