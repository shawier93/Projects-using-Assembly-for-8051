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
B0["B1: instructions - lines 3 to 12"]
B1["B2: MAIN_MENU - lines 17 to 19"]
B2["B3: instructions - lines 21 to 22"]
B3["B4: CONT - lines 25 to 25"]
B4["B5: instructions - lines 27 to 29"]
B5["B6: instructions - lines 31 to 33"]
B6["B7: CHEAK - lines 36 to 38"]
B7["B8: CONTT - lines 41 to 41"]
B8["B9: instructions - lines 43 to 44"]
B9["B10: EXIT - lines 49 to 49"]
B0 -->|next| B1
B1 -->|condition true| B9
B1 -->|condition false| B2
B2 -->|condition true| B3
B2 -->|condition false| B3
B3 -->|condition true| B9
B3 -->|condition false| B4
B4 -->|condition true| B9
B4 -->|condition false| B5
B5 -->|next| B6
B6 -->|condition true| B7
B6 -->|condition false| B7
B7 -->|condition true| B6
B7 -->|condition false| B8
B8 -->|next| B9
B9 -->|jump| B9
```

### B1

```asm
MOV 30H,#12H
MOV 40H,#100
MOV 50H,#0
MOV 51H,#1
mov 52h,#0
MOV 53H,#100
```

### B2

```asm
MOV 50H,#12H
MOV A,50H
CJNE A,30H,EXIT
```

### B3

```asm
MOV A,40H
CJNE A,#255,CONT
```

### B4

```asm
JNC EXIT
```

### B5

```asm
MOV 51H,#1
MOV A,51H
CJNE A,#1,EXIT
```

### B6

```asm
mov a,#255
subb a,40h
mov 52h,a
```

### B7

```asm
mov a,53h
cjne a,53h,contt
```

### B8

```asm
jc cheak
```

### B9

```asm
add a,40h
mov 40h,a
```

### B10

```asm
SJMP $
```
