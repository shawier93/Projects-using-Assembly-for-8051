# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

Start from the first executable block or the entry selected by the calling application.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2)

## Destinations requiring review

`?C_START`, `STARTUP1`. A repeated label is also unresolved because it has more than one candidate target.

## Lines outside the instruction parser

These may be assembler directives, macros, or malformed source; inspect them before building.

```asm
113: NAME    ?C_STARTUP
122: EXTRN CODE (?C_START)
123: PUBLIC  ?C_STARTUP
192: EXTRN CODE (?B_SWITCH0)
193: CALL    ?B_SWITCH0
```

## Section 1

```mermaid
flowchart TD
B0["B1: ?C_STARTUP - lines 126 to 126"]
B1["B2: instructions - lines 133 to 134"]
B2["B3: IDATALOOP - lines 135 to 136"]
B3["B4: instructions - lines 140 to 141"]
B4["B5: instructions - lines 143 to 143"]
B5["B6: instructions - lines 145 to 145"]
B6["B7: instructions - lines 147 to 147"]
B7["B8: XDATALOOP - lines 148 to 150"]
B8["B9: instructions - lines 151 to 151"]
B9["B10: instructions - lines 155 to 155"]
B0 -->|jump| BX1
B1 -->|next| B2
B2 -->|condition true| B2
B6 -->|next| B7
B7 -->|condition true| B7
B7 -->|condition false| B8
B8 -->|condition true| B7
BX1["Unresolved destination: STARTUP1"]
```

### B1

```asm
LJMP    STARTUP1
```

### B2

```asm
MOV     R0,#IDATALEN - 1
CLR     A
```

### B3

```asm
MOV     @R0,A
DJNZ    R0,IDATALOOP
```

### B4

```asm
MOV     DPTR,#XDATASTART
MOV     R7,#LOW (XDATALEN)
```

### B5

```asm
MOV     R6,#(HIGH (XDATALEN)) +1
```

### B6

```asm
MOV     R6,#HIGH (XDATALEN)
```

### B7

```asm
CLR     A
```

### B8

```asm
MOVX    @DPTR,A
INC     DPTR
DJNZ    R7,XDATALOOP
```

### B9

```asm
DJNZ    R6,XDATALOOP
```

### B10

```asm
MOV     PPAGE_SFR,#PPAGE
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 159 to 161"]
B11["B12: PDATALOOP - lines 162 to 164"]
B12["B13: instructions - lines 170 to 170"]
B13["B14: instructions - lines 176 to 177"]
B14["B15: instructions - lines 182 to 182"]
B15["B16: instructions - lines 185 to 185"]
B16["B17: instructions - lines 196 to 196"]
B10 -->|next| B11
B11 -->|condition true| B11
B16 -->|jump| BX2
BX2["Unresolved destination: ?C_START"]
```

### B11

```asm
MOV     R0,#LOW (PDATASTART)
MOV     R7,#LOW (PDATALEN)
CLR     A
```

### B12

```asm
MOVX    @R0,A
INC     R0
DJNZ    R7,PDATALOOP
```

### B13

```asm
MOV     ?C_IBP,#LOW IBPSTACKTOP
```

### B14

```asm
MOV     ?C_XBP,#HIGH XBPSTACKTOP
MOV     ?C_XBP+1,#LOW XBPSTACKTOP
```

### B15

```asm
MOV     ?C_PBP,#LOW PBPSTACKTOP
```

### B16

```asm
MOV     SP,#?STACK-1
```

### B17

```asm
LJMP    ?C_START
```
