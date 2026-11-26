# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 7 to 7"]
B1["B2: instructions - lines 8 to 10"]
B2["B3: instructions - lines 11 to 12"]
B3["B4: LP - lines 17 to 17"]
B4["B5: instructions - lines 18 to 18"]
B5["B6: instructions - lines 19 to 19"]
B6["B7: instructions - lines 20 to 21"]
B7["B8: instructions - lines 22 to 23"]
B8["B9: instructions - lines 24 to 25"]
B9["B10: instructions - lines 26 to 26"]
B0 -->|call| B153
B0 -->|after return| B1
B1 -->|call| B114
B1 -->|after return| B2
B2 -->|call| B120
B2 -->|after return| B3
B3 -->|condition true| B3
B3 -->|condition false| B4
B4 -->|call| B127
B4 -->|after return| B5
B5 -->|condition true| B15
B5 -->|condition false| B6
B6 -->|call| B163
B6 -->|after return| B7
B7 -->|call| B115
B7 -->|after return| B8
B8 -->|call| B115
B8 -->|after return| B9
B9 -->|call| B122
B9 -->|after return| B10
B153["Continue at B154 in section 16"]
B114["Continue at B115 in section 12"]
B120["Continue at B121 in section 13"]
B127["Continue at B128 in section 13"]
B15["Continue at B16 in section 2"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL LCD_INI
```

### B2

```asm
MOV P1,#0FFH
SETB DAV
ACALL SERIAL
```

### B3

```asm
MOV A,#80H
ACALL WRCMD40
```

### B4

```asm
JNB DAV,LP
```

### B5

```asm
ACALL KEY
```

### B6

```asm
CJNE A,#'1',TWO
```

### B7

```asm
MOV A,#1
ACALL WRCMD
```

### B8

```asm
MOV A,#0DH
ACALL COUT
```

### B9

```asm
MOV A,#"O"
ACALL COUT
```

### B10

```asm
ACALL WRDATA
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 27 to 28"]
B11["B12: instructions - lines 29 to 29"]
B12["B13: instructions - lines 30 to 31"]
B13["B14: instructions - lines 32 to 32"]
B14["B15: instructions - lines 33 to 33"]
B15["B16: TWO - lines 36 to 36"]
B16["B17: instructions - lines 37 to 38"]
B17["B18: instructions - lines 39 to 40"]
B18["B19: instructions - lines 41 to 42"]
B19["B20: instructions - lines 43 to 43"]
B10 -->|call| B115
B10 -->|after return| B11
B11 -->|call| B122
B11 -->|after return| B12
B12 -->|call| B115
B12 -->|after return| B13
B13 -->|call| B122
B13 -->|after return| B14
B14 -->|jump| B112
B15 -->|condition true| B25
B15 -->|condition false| B16
B16 -->|call| B163
B16 -->|after return| B17
B17 -->|call| B115
B17 -->|after return| B18
B18 -->|call| B115
B18 -->|after return| B19
B19 -->|call| B122
B19 -->|after return| B20
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B112["Continue at B113 in section 12"]
B25["Continue at B26 in section 3"]
B163["Continue at B164 in section 17"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#"N"
ACALL COUT
```

### B12

```asm
ACALL WRDATA
```

### B13

```asm
MOV A,#"E"
ACALL COUT
```

### B14

```asm
ACALL WRDATA
```

### B15

```asm
LJMP  HERE2
```

### B16

```asm
CJNE A,#'2',THREE
```

### B17

```asm
MOV A,#1
ACALL WRCMD
```

### B18

```asm
MOV A,#0DH
ACALL COUT
```

### B19

```asm
MOV A,#"T"
ACALL COUT
```

### B20

```asm
ACALL WRDATA
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 44 to 45"]
B21["B22: instructions - lines 46 to 46"]
B22["B23: instructions - lines 47 to 48"]
B23["B24: instructions - lines 49 to 49"]
B24["B25: instructions - lines 50 to 50"]
B25["B26: THREE - lines 53 to 53"]
B26["B27: instructions - lines 54 to 55"]
B27["B28: instructions - lines 56 to 57"]
B28["B29: instructions - lines 58 to 59"]
B29["B30: instructions - lines 60 to 60"]
B20 -->|call| B115
B20 -->|after return| B21
B21 -->|call| B122
B21 -->|after return| B22
B22 -->|call| B115
B22 -->|after return| B23
B23 -->|call| B122
B23 -->|after return| B24
B24 -->|jump| B112
B25 -->|condition true| B39
B25 -->|condition false| B26
B26 -->|call| B163
B26 -->|after return| B27
B27 -->|call| B115
B27 -->|after return| B28
B28 -->|call| B115
B28 -->|after return| B29
B29 -->|call| B122
B29 -->|after return| B30
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B112["Continue at B113 in section 12"]
B39["Continue at B40 in section 4"]
B163["Continue at B164 in section 17"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#"W"
ACALL COUT
```

### B22

```asm
ACALL WRDATA
```

### B23

```asm
MOV A,#"O"
ACALL COUT
```

### B24

```asm
ACALL WRDATA
```

### B25

```asm
AJMP  HERE2
```

### B26

```asm
CJNE A,#'3',FOUR
```

### B27

```asm
MOV A,#1
ACALL WRCMD
```

### B28

```asm
MOV A,#0DH
ACALL COUT
```

### B29

```asm
MOV A,#"T"
ACALL COUT
```

### B30

```asm
ACALL WRDATA
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 61 to 62"]
B31["B32: instructions - lines 63 to 63"]
B32["B33: instructions - lines 64 to 65"]
B33["B34: instructions - lines 66 to 66"]
B34["B35: instructions - lines 67 to 68"]
B35["B36: instructions - lines 69 to 69"]
B36["B37: instructions - lines 70 to 71"]
B37["B38: instructions - lines 72 to 72"]
B38["B39: instructions - lines 73 to 73"]
B39["B40: FOUR - lines 76 to 76"]
B30 -->|call| B115
B30 -->|after return| B31
B31 -->|call| B122
B31 -->|after return| B32
B32 -->|call| B115
B32 -->|after return| B33
B33 -->|call| B122
B33 -->|after return| B34
B34 -->|call| B115
B34 -->|after return| B35
B35 -->|call| B122
B35 -->|after return| B36
B36 -->|call| B115
B36 -->|after return| B37
B37 -->|call| B122
B37 -->|after return| B38
B38 -->|jump| B112
B39 -->|condition true| B51
B39 -->|condition false| B40
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B112["Continue at B113 in section 12"]
B51["Continue at B52 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#"H"
ACALL COUT
```

### B32

```asm
ACALL WRDATA
```

### B33

```asm
MOV A,#"R"
ACALL COUT
```

### B34

```asm
ACALL WRDATA
```

### B35

```asm
MOV A,#"E"
ACALL COUT
```

### B36

```asm
ACALL WRDATA
```

### B37

```asm
MOV A,#"E"
ACALL COUT
```

### B38

```asm
ACALL WRDATA
```

### B39

```asm
AJMP  HERE2
```

### B40

```asm
CJNE A,#'4',FIVE
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 77 to 78"]
B41["B42: instructions - lines 79 to 80"]
B42["B43: instructions - lines 81 to 82"]
B43["B44: instructions - lines 83 to 83"]
B44["B45: instructions - lines 84 to 85"]
B45["B46: instructions - lines 86 to 86"]
B46["B47: instructions - lines 87 to 88"]
B47["B48: instructions - lines 89 to 89"]
B48["B49: instructions - lines 90 to 91"]
B49["B50: instructions - lines 92 to 92"]
B40 -->|call| B163
B40 -->|after return| B41
B41 -->|call| B115
B41 -->|after return| B42
B42 -->|call| B115
B42 -->|after return| B43
B43 -->|call| B122
B43 -->|after return| B44
B44 -->|call| B115
B44 -->|after return| B45
B45 -->|call| B122
B45 -->|after return| B46
B46 -->|call| B115
B46 -->|after return| B47
B47 -->|call| B122
B47 -->|after return| B48
B48 -->|call| B115
B48 -->|after return| B49
B49 -->|call| B122
B49 -->|after return| B50
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#1
ACALL WRCMD
```

### B42

```asm
MOV A,#0DH
ACALL COUT
```

### B43

```asm
MOV A,#"F"
ACALL COUT
```

### B44

```asm
ACALL WRDATA
```

### B45

```asm
MOV A,#"O"
ACALL COUT
```

### B46

```asm
ACALL WRDATA
```

### B47

```asm
MOV A,#"U"
ACALL COUT
```

### B48

```asm
ACALL WRDATA
```

### B49

```asm
MOV A,#"R"
ACALL COUT
```

### B50

```asm
ACALL WRDATA
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 93 to 93"]
B51["B52: FIVE - lines 96 to 96"]
B52["B53: instructions - lines 97 to 98"]
B53["B54: instructions - lines 99 to 100"]
B54["B55: instructions - lines 101 to 102"]
B55["B56: instructions - lines 103 to 103"]
B56["B57: instructions - lines 104 to 105"]
B57["B58: instructions - lines 106 to 106"]
B58["B59: instructions - lines 107 to 108"]
B59["B60: instructions - lines 109 to 109"]
B50 -->|jump| B112
B51 -->|condition true| B63
B51 -->|condition false| B52
B52 -->|call| B163
B52 -->|after return| B53
B53 -->|call| B115
B53 -->|after return| B54
B54 -->|call| B115
B54 -->|after return| B55
B55 -->|call| B122
B55 -->|after return| B56
B56 -->|call| B115
B56 -->|after return| B57
B57 -->|call| B122
B57 -->|after return| B58
B58 -->|call| B115
B58 -->|after return| B59
B59 -->|call| B122
B59 -->|after return| B60
B112["Continue at B113 in section 12"]
B63["Continue at B64 in section 7"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
AJMP  HERE2
```

### B52

```asm
CJNE A,#'5',SIX
```

### B53

```asm
MOV A,#1
ACALL WRCMD
```

### B54

```asm
MOV A,#0DH
ACALL COUT
```

### B55

```asm
MOV A,#"F"
ACALL COUT
```

### B56

```asm
ACALL WRDATA
```

### B57

```asm
MOV A,#"I"
ACALL COUT
```

### B58

```asm
ACALL WRDATA
```

### B59

```asm
MOV A,#"V"
ACALL COUT
```

### B60

```asm
ACALL WRDATA
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 110 to 111"]
B61["B62: instructions - lines 112 to 112"]
B62["B63: instructions - lines 113 to 113"]
B63["B64: SIX - lines 116 to 116"]
B64["B65: instructions - lines 117 to 118"]
B65["B66: instructions - lines 119 to 120"]
B66["B67: instructions - lines 121 to 122"]
B67["B68: instructions - lines 123 to 123"]
B68["B69: instructions - lines 124 to 125"]
B69["B70: instructions - lines 126 to 126"]
B60 -->|call| B115
B60 -->|after return| B61
B61 -->|call| B122
B61 -->|after return| B62
B62 -->|jump| B112
B63 -->|condition true| B73
B63 -->|condition false| B64
B64 -->|call| B163
B64 -->|after return| B65
B65 -->|call| B115
B65 -->|after return| B66
B66 -->|call| B115
B66 -->|after return| B67
B67 -->|call| B122
B67 -->|after return| B68
B68 -->|call| B115
B68 -->|after return| B69
B69 -->|call| B122
B69 -->|after return| B70
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B112["Continue at B113 in section 12"]
B73["Continue at B74 in section 8"]
B163["Continue at B164 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#"E"
ACALL COUT
```

### B62

```asm
ACALL WRDATA
```

### B63

```asm
AJMP  HERE2
```

### B64

```asm
CJNE A,#'6',SEVEN
```

### B65

```asm
MOV A,#1
ACALL WRCMD
```

### B66

```asm
MOV A,#0DH
ACALL COUT
```

### B67

```asm
MOV A,#"S"
ACALL COUT
```

### B68

```asm
ACALL WRDATA
```

### B69

```asm
MOV A,#"I"
ACALL COUT
```

### B70

```asm
ACALL WRDATA
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 127 to 128"]
B71["B72: instructions - lines 129 to 129"]
B72["B73: instructions - lines 130 to 130"]
B73["B74: SEVEN - lines 133 to 133"]
B74["B75: instructions - lines 134 to 135"]
B75["B76: instructions - lines 136 to 137"]
B76["B77: instructions - lines 138 to 139"]
B77["B78: instructions - lines 140 to 140"]
B78["B79: instructions - lines 141 to 142"]
B79["B80: instructions - lines 143 to 143"]
B70 -->|call| B115
B70 -->|after return| B71
B71 -->|call| B122
B71 -->|after return| B72
B72 -->|jump| B112
B73 -->|condition true| B87
B73 -->|condition false| B74
B74 -->|call| B163
B74 -->|after return| B75
B75 -->|call| B115
B75 -->|after return| B76
B76 -->|call| B115
B76 -->|after return| B77
B77 -->|call| B122
B77 -->|after return| B78
B78 -->|call| B115
B78 -->|after return| B79
B79 -->|call| B122
B79 -->|after return| B80
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B112["Continue at B113 in section 12"]
B87["Continue at B88 in section 9"]
B163["Continue at B164 in section 17"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#"X"
ACALL COUT
```

### B72

```asm
ACALL WRDATA
```

### B73

```asm
AJMP  HERE2
```

### B74

```asm
CJNE A,#'7',EIGHT
```

### B75

```asm
MOV A,#1
ACALL WRCMD
```

### B76

```asm
MOV A,#0DH
ACALL COUT
```

### B77

```asm
MOV A,#"S"
ACALL COUT
```

### B78

```asm
ACALL WRDATA
```

### B79

```asm
MOV A,#"E"
ACALL COUT
```

### B80

```asm
ACALL WRDATA
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 144 to 145"]
B81["B82: instructions - lines 146 to 146"]
B82["B83: instructions - lines 147 to 148"]
B83["B84: instructions - lines 149 to 149"]
B84["B85: instructions - lines 150 to 151"]
B85["B86: instructions - lines 152 to 152"]
B86["B87: instructions - lines 153 to 153"]
B87["B88: EIGHT - lines 156 to 156"]
B88["B89: instructions - lines 157 to 158"]
B89["B90: instructions - lines 159 to 160"]
B80 -->|call| B115
B80 -->|after return| B81
B81 -->|call| B122
B81 -->|after return| B82
B82 -->|call| B115
B82 -->|after return| B83
B83 -->|call| B122
B83 -->|after return| B84
B84 -->|call| B115
B84 -->|after return| B85
B85 -->|call| B122
B85 -->|after return| B86
B86 -->|jump| B112
B87 -->|condition true| B101
B87 -->|condition false| B88
B88 -->|call| B163
B88 -->|after return| B89
B89 -->|call| B115
B89 -->|after return| B90
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B112["Continue at B113 in section 12"]
B101["Continue at B102 in section 11"]
B163["Continue at B164 in section 17"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,#"V"
ACALL COUT
```

### B82

```asm
ACALL WRDATA
```

### B83

```asm
MOV A,#"E"
ACALL COUT
```

### B84

```asm
ACALL WRDATA
```

### B85

```asm
MOV A,#"N"
ACALL COUT
```

### B86

```asm
ACALL WRDATA
```

### B87

```asm
AJMP  HERE2
```

### B88

```asm
CJNE A,#'8',NINE
```

### B89

```asm
MOV A,#1
ACALL WRCMD
```

### B90

```asm
MOV A,#0DH
ACALL COUT
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 161 to 162"]
B91["B92: instructions - lines 163 to 163"]
B92["B93: instructions - lines 164 to 165"]
B93["B94: instructions - lines 166 to 166"]
B94["B95: instructions - lines 167 to 168"]
B95["B96: instructions - lines 169 to 169"]
B96["B97: instructions - lines 170 to 171"]
B97["B98: instructions - lines 172 to 172"]
B98["B99: instructions - lines 173 to 174"]
B99["B100: instructions - lines 175 to 175"]
B90 -->|call| B115
B90 -->|after return| B91
B91 -->|call| B122
B91 -->|after return| B92
B92 -->|call| B115
B92 -->|after return| B93
B93 -->|call| B122
B93 -->|after return| B94
B94 -->|call| B115
B94 -->|after return| B95
B95 -->|call| B122
B95 -->|after return| B96
B96 -->|call| B115
B96 -->|after return| B97
B97 -->|call| B122
B97 -->|after return| B98
B98 -->|call| B115
B98 -->|after return| B99
B99 -->|call| B122
B99 -->|after return| B100
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#"E"
ACALL COUT
```

### B92

```asm
ACALL WRDATA
```

### B93

```asm
MOV A,#"I"
ACALL COUT
```

### B94

```asm
ACALL WRDATA
```

### B95

```asm
MOV A,#"G"
ACALL COUT
```

### B96

```asm
ACALL WRDATA
```

### B97

```asm
MOV A,#"H"
ACALL COUT
```

### B98

```asm
ACALL WRDATA
```

### B99

```asm
MOV A,#"T"
ACALL COUT
```

### B100

```asm
ACALL WRDATA
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 176 to 176"]
B101["B102: NINE - lines 179 to 179"]
B102["B103: instructions - lines 180 to 181"]
B103["B104: instructions - lines 182 to 183"]
B104["B105: instructions - lines 184 to 185"]
B105["B106: instructions - lines 186 to 186"]
B106["B107: instructions - lines 187 to 188"]
B107["B108: instructions - lines 189 to 189"]
B108["B109: instructions - lines 190 to 191"]
B109["B110: instructions - lines 192 to 192"]
B100 -->|jump| B112
B101 -->|condition true| B112
B101 -->|condition false| B102
B102 -->|call| B163
B102 -->|after return| B103
B103 -->|call| B115
B103 -->|after return| B104
B104 -->|call| B115
B104 -->|after return| B105
B105 -->|call| B122
B105 -->|after return| B106
B106 -->|call| B115
B106 -->|after return| B107
B107 -->|call| B122
B107 -->|after return| B108
B108 -->|call| B115
B108 -->|after return| B109
B109 -->|call| B122
B109 -->|after return| B110
B112["Continue at B113 in section 12"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
AJMP  HERE2
```

### B102

```asm
CJNE A,#'9',HERE2
```

### B103

```asm
MOV A,#1
ACALL WRCMD
```

### B104

```asm
MOV A,#0DH
ACALL COUT
```

### B105

```asm
MOV A,#"N"
ACALL COUT
```

### B106

```asm
ACALL WRDATA
```

### B107

```asm
MOV A,#"I"
ACALL COUT
```

### B108

```asm
ACALL WRDATA
```

### B109

```asm
MOV A,#"N"
ACALL COUT
```

### B110

```asm
ACALL WRDATA
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 193 to 194"]
B111["B112: instructions - lines 195 to 195"]
B112["B113: HERE2 - lines 198 to 198"]
B113["B114: instructions - lines 199 to 199"]
B114["B115: SERIAL - lines 203 to 210"]
B115["B116: COUT - lines 213 to 213"]
B116["B117: WAAIT - lines 214 to 214"]
B117["B118: instructions - lines 215 to 216"]
B118["B119: CIN - lines 219 to 219"]
B119["B120: instructions - lines 220 to 222"]
B110 -->|call| B115
B110 -->|after return| B111
B111 -->|call| B122
B111 -->|after return| B112
B112 -->|condition true| B112
B112 -->|condition false| B113
B113 -->|jump| B3
B115 -->|next| B116
B116 -->|condition true| B116
B116 -->|condition false| B117
B118 -->|condition true| B118
B118 -->|condition false| B119
B122["Continue at B123 in section 13"]
B3["Continue at B4 in section 1"]
```

### B111

```asm
MOV A,#"E"
ACALL COUT
```

### B112

```asm
ACALL WRDATA
```

### B113

```asm
JB DAV,LP2
```

### B114

```asm
AJMP LP
```

### B115

Return to the instruction following the active call.

```asm
MOV A,PCON
SETB ACC.7
MOV PCON,A
MOV TH1,#-3
MOV TMOD,#20H
MOV SCON,#50H
SETB TR1
RET
```

### B116

```asm
MOV SBUF,A
```

### B117

```asm
JNB TI,waait
```

### B118

Return to the instruction following the active call.

```asm
CLR TI
RET
```

### B119

```asm
JNB  RI,CIN
```

### B120

Return to the instruction following the active call.

```asm
CLR TI
MOV SBUF,A
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: WRCMD40 - lines 225 to 229"]
B121["B122: instructions - lines 230 to 230"]
B122["B123: WRDATA - lines 233 to 237"]
B123["B124: instructions - lines 238 to 238"]
B124["B125: WT40 - lines 241 to 241"]
B125["B126: WT - lines 242 to 242"]
B126["B127: instructions - lines 243 to 243"]
B127["B128: KEY - lines 246 to 251"]
B128["B129: instructions - lines 252 to 252"]
B129["B130: CONV - lines 254 to 254"]
B120 -->|call| B124
B120 -->|after return| B121
B122 -->|call| B124
B122 -->|after return| B123
B124 -->|next| B125
B125 -->|condition true| B125
B125 -->|condition false| B126
B127 -->|call| B129
B127 -->|after return| B128
B129 -->|condition true| B131
B129 -->|condition false| B130
B131["Continue at B132 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

```asm
MOV R0,#19
```

### B126

```asm
DJNZ R0,WT
```

### B127

Return to the instruction following the active call.

```asm
RET
```

### B128

```asm
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
cjne A, #0, k1
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 255 to 256"]
B131["B132: K1 - lines 258 to 258"]
B132["B133: instructions - lines 259 to 260"]
B133["B134: K2 - lines 262 to 262"]
B134["B135: instructions - lines 263 to 264"]
B135["B136: K4 - lines 266 to 266"]
B136["B137: instructions - lines 267 to 268"]
B137["B138: K5 - lines 270 to 270"]
B138["B139: instructions - lines 271 to 272"]
B139["B140: K6 - lines 274 to 274"]
B130 -->|jump| B152
B131 -->|condition true| B133
B131 -->|condition false| B132
B132 -->|jump| B152
B133 -->|condition true| B135
B133 -->|condition false| B134
B134 -->|jump| B152
B135 -->|condition true| B137
B135 -->|condition false| B136
B136 -->|jump| B152
B137 -->|condition true| B139
B137 -->|condition false| B138
B138 -->|jump| B152
B139 -->|condition true| B141
B139 -->|condition false| B140
B152["Continue at B153 in section 16"]
B141["Continue at B142 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov A, #'1'
jmp got_it
```

### B132

```asm
cjne A, #1, k2
```

### B133

```asm
mov A, #'2'
jmp got_it
```

### B134

```asm
cjne A, #2, k4
```

### B135

```asm
mov A, #'3'
jmp got_it
```

### B136

```asm
cjne A, #4, k5
```

### B137

```asm
mov A, #'4'
jmp got_it
```

### B138

```asm
cjne A, #5, k6
```

### B139

```asm
mov A, #'5'
jmp got_it
```

### B140

```asm
cjne A, #6, k8
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 275 to 276"]
B141["B142: K8 - lines 278 to 278"]
B142["B143: instructions - lines 279 to 280"]
B143["B144: K9 - lines 282 to 282"]
B144["B145: instructions - lines 283 to 284"]
B145["B146: K10 - lines 286 to 286"]
B146["B147: instructions - lines 287 to 288"]
B147["B148: K12 - lines 290 to 290"]
B148["B149: instructions - lines 291 to 293"]
B149["B150: K13 - lines 295 to 295"]
B140 -->|jump| B152
B141 -->|condition true| B143
B141 -->|condition false| B142
B142 -->|jump| B152
B143 -->|condition true| B145
B143 -->|condition false| B144
B144 -->|jump| B152
B145 -->|condition true| B147
B145 -->|condition false| B146
B146 -->|jump| B152
B147 -->|condition true| B149
B147 -->|condition false| B148
B148 -->|jump| B152
B149 -->|condition true| B151
B149 -->|condition false| B150
B152["Continue at B153 in section 16"]
B151["Continue at B152 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov A, #'6'
jmp got_it
```

### B142

```asm
cjne A, #8, k9
```

### B143

```asm
mov A, #'7'
jmp got_it
```

### B144

```asm
cjne A, #9, k10
```

### B145

```asm
mov A, #'8'
jmp got_it
```

### B146

```asm
cjne A, #10, k12
```

### B147

```asm
mov A, #'9'
jmp got_it
```

### B148

```asm
cjne A, #12, k13
```

### B149

```asm
mov A, #'*'
jmp got_it
```

### B150

```asm
cjne A, #13, k14
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 296 to 297"]
B151["B152: K14 - lines 299 to 299"]
B152["B153: GOT_IT - lines 301 to 301"]
B153["B154: LCD_INI - lines 307 to 307"]
B154["B155: instructions - lines 308 to 309"]
B155["B156: instructions - lines 310 to 311"]
B156["B157: instructions - lines 312 to 313"]
B157["B158: instructions - lines 314 to 315"]
B158["B159: instructions - lines 316 to 317"]
B159["B160: instructions - lines 318 to 319"]
B150 -->|jump| B152
B151 -->|next| B152
B153 -->|call| B165
B153 -->|after return| B154
B154 -->|call| B163
B154 -->|after return| B155
B155 -->|call| B163
B155 -->|after return| B156
B156 -->|call| B163
B156 -->|after return| B157
B157 -->|call| B163
B157 -->|after return| B158
B158 -->|call| B163
B158 -->|after return| B159
B159 -->|call| B163
B159 -->|after return| B160
B165["Continue at B166 in section 17"]
B163["Continue at B164 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
mov A, #'0'
jmp got_it
```

### B152

```asm
mov A, # '#'
```

### B153

Return to the instruction following the active call.

```asm
ret
```

### B154

```asm
ACALL WAIT
```

### B155

```asm
MOV A,#38H
ACALL WRCMD
```

### B156

```asm
MOV A,#038H
ACALL WRCMD
```

### B157

```asm
MOV A,#038H
ACALL WRCMD
```

### B158

```asm
MOV A,#038H
ACALL WRCMD
```

### B159

```asm
MOV A,#8
ACALL WRCMD
```

### B160

```asm
MOV A,#1
ACALL WRCMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 320 to 321"]
B161["B162: instructions - lines 322 to 323"]
B162["B163: instructions - lines 324 to 324"]
B163["B164: WRCMD - lines 327 to 331"]
B164["B165: instructions - lines 332 to 332"]
B165["B166: WAIT - lines 335 to 335"]
B166["B167: WT0 - lines 336 to 336"]
B167["B168: WT1 - lines 337 to 337"]
B168["B169: WT2 - lines 338 to 338"]
B169["B170: instructions - lines 339 to 339"]
B160 -->|call| B163
B160 -->|after return| B161
B161 -->|call| B120
B161 -->|after return| B162
B163 -->|call| B165
B163 -->|after return| B164
B165 -->|next| B166
B166 -->|next| B167
B167 -->|next| B168
B168 -->|condition true| B168
B168 -->|condition false| B169
B169 -->|condition true| B167
B169 -->|condition false| B170
B120["Continue at B121 in section 13"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#6
ACALL WRCMD
```

### B162

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

### B165

Return to the instruction following the active call.

```asm
RET
```

### B166

```asm
MOV R5,#1
```

### B167

```asm
MOV R6,#28
```

### B168

```asm
MOV R7,#255
```

### B169

```asm
DJNZ R7,WT2
```

### B170

```asm
DJNZ R6,WT1
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 340 to 340"]
B171["B172: instructions - lines 341 to 341"]
B170 -->|condition true| B166
B170 -->|condition false| B171
B166["Continue at B167 in section 17"]
```

### B171

```asm
DJNZ R5,WT0
```

### B172

Return to the instruction following the active call.

```asm
RET
```
