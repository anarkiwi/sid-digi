c000  78           ?? 78h    x
c001  20           ?? 20h     
c002  48           ?? 48h    H
c003  C0           ?? C0h
c004  A9           ?? A9h
c005  18           ?? 18h
c006  A0           ?? A0h
c007  C0           ?? C0h
c008  8D           ?? 8Dh
c009  14           ?? 14h
c00a  03           ?? 03h
c00b  8C           ?? 8Ch
c00c  15           ?? 15h
c00d  03           ?? 03h
c00e  E8           ?? E8h
c00f  8E           ?? 8Eh
c010  0E           ?? 0Eh
c011  DC           ?? DCh
c012  E8           ?? E8h
c013  8E           ?? 8Eh
c014  1A           ?? 1Ah
c015  D0           ?? D0h
c016  58           ?? 58h    X
c017  60           ?? 60h    `
c018  EE           ?? EEh
c019  19           ?? 19h
c01a  D0           ?? D0h
c01b  20           ?? 20h     
c01c  21           ?? 21h    !
c01d  C0           ?? C0h
c01e  4C           ?? 4Ch    L
c01f  31           ?? 31h    1
c020  EA           ?? EAh
entry_C021:
c021  A2 00        LDX #0x0
c023  CE 90 C0     DEC 0xc090
c026  30 0C        BMI 0xc034
c028  20 26 C2     JSR 0xc226
c02b  20 25 C2     JSR 0xc225
c02e  4C 25 C2     JMP 0xc225
c031  FF           ?? FFh
c032  FF           ?? FFh
c033  FF           ?? FFh
LAB_c034:
c034  A9 03        LDA #0x3
c036  8D 90 C0     STA 0xc090
c039  20 40 C0     JSR 0xc040
c03c  20 3F C0     JSR 0xc03f
SUB_c03f:
c03f  E8           INX
SUB_c040:
c040  DE 8A C0     DEC 0xc08a,X
c043  30 4C        BMI 0xc091
c045  4C 26 C2     JMP 0xc226
entry_C048:
c048  A9 1F        LDA #0x1f
c04a  8D 18 D4     STA 0xd418
c04d  A9 F0        LDA #0xf0
c04f  8D 17 D4     STA 0xd417
c052  29 0F        AND #0xf
c054  8D 62 C2     STA 0xc262
c057  A2 0F        LDX #0xf
LAB_c059:
c059  9D 81 C0     STA 0xc081,X
c05c  CA           DEX
c05d  10 FA        BPL 0xc059
c05f  A2 02        LDX #0x2
LAB_c061:
c061  BD B9 C4     LDA 0xc4b9,X
c064  85 FA        STA 0x00fa
c066  BD BC C4     LDA 0xc4bc,X
c069  85 FB        STA 0x00fb
c06b  A0 00        LDY #0x0
c06d  B1 FA        LDA (0xfa),Y
c06f  9D 8D C0     STA 0xc08d,X
c072  C8           INY
c073  B1 FA        LDA (0xfa),Y
c075  9D E6 C0     STA 0xc0e6,X
c078  29 0F        AND #0xf
c07a  9D E9 C0     STA 0xc0e9,X
c07d  CA           DEX
c07e  10 E1        BPL 0xc061
c080  60           RTS
c081  0A           ?? 0Ah
c082  09           ?? 09h
c083  0F           ?? 0Fh
c084  10           ?? 10h
c085  41           ?? 41h    A
c086  41           ?? 41h    A
c087  0E           ?? 0Eh
c088  62           ?? 62h    b
c089  46           ?? 46h    F
c08a  00           ?? 00h
c08b  00           ?? 00h
c08c  00           ?? 00h
c08d  2B           ?? 2Bh    +
c08e  2C           ?? 2Ch    ,
c08f  01           ?? 01h
DAT_c090:
c090  01           ?? 01h
LAB_c091:
c091  BC 8D C0     LDY 0xc08d,X
c094  C0 FE        CPY #0xfe
c096  D0 09        BNE 0xc0a1
SUB_c098:
c098  BD 84 C0     LDA 0xc084,X
c09b  29 FE        AND #0xfe
c09d  9D 84 C0     STA 0xc084,X
c0a0  60           RTS
LAB_c0a1:
c0a1  B9 1D CB     LDA 0xcb1d,Y
c0a4  85 FA        STA 0x00fa
c0a6  B9 E2 CA     LDA 0xcae2,Y
c0a9  85 FB        STA 0x00fb
c0ab  BC 81 C0     LDY 0xc081,X
c0ae  B1 FA        LDA (0xfa),Y
c0b0  30 20        BMI 0xc0d2
c0b2  C9 60        CMP #0x60
c0b4  90 43        BCC 0xc0f9
LAB_c0b6:
c0b6  29 1F        AND #0x1f
c0b8  9D 8A C0     STA 0xc08a,X
c0bb  A9 FE        LDA #0xfe
c0bd  9D 31 C0     STA 0xc031,X
c0c0  20 98 C0     JSR 0xc098
LAB_c0c3:
c0c3  4C 87 C1     JMP 0xc187
c0c6  00           ?? 00h
c0c7  07           ?? 07h
c0c8  0E           ?? 0Eh
c0c9  24           ?? 24h    $
c0ca  27           ?? 27h    '
c0cb  44           ?? 44h    D
c0cc  9C           ?? 9Ch
c0cd  37           ?? 37h    7
c0ce  E2           ?? E2h
c0cf  0B           ?? 0Bh
c0d0  0A           ?? 0Ah
c0d1  36           ?? 36h    6
LAB_c0d2:
c0d2  C9 A0        CMP #0xa0
c0d4  90 16        BCC 0xc0ec
c0d6  29 1F        AND #0x1f
c0d8  9D 8A C0     STA 0xc08a,X
c0db  B0 E6        BCS 0xc0c3
c0dd  00           BRK
c0de  01           ?? 01h
c0df  01           ?? 01h
c0e0  00           ?? 00h
c0e1  01           ?? 01h
c0e2  03           ?? 03h
c0e3  00           ?? 00h
c0e4  01           ?? 01h
c0e5  01           ?? 01h
c0e6  0F           ?? 0Fh
c0e7  71           ?? 71h    q
c0e8  01           ?? 01h
c0e9  0E           ?? 0Eh
c0ea  00           ?? 00h
c0eb  01           ?? 01h
LAB_c0ec:
c0ec  0A           ASL A
c0ed  0A           ASL A
c0ee  0A           ASL A
c0ef  9D D9 C3     STA 0xc3d9,X
c0f2  C8           INY
c0f3  B1 FA        LDA (0xfa),Y
c0f5  C9 60        CMP #0x60
c0f7  B0 BD        BCS 0xc0b6
LAB_c0f9:
c0f9  85 FC        STA 0x00fc
c0fb  C8           INY
c0fc  BD E6 C0     LDA 0xc0e6,X
c0ff  4A           LSR A
c100  4A           LSR A
c101  4A           LSR A
c102  4A           LSR A
c103  18           CLC
c104  65 FC        ADC 0x00fc
c106  9D C9 C0     STA 0xc0c9,X
c109  84 FC        STY 0x00fc
c10b  A8           TAY
c10c  B9 37 C4     LDA 0xc437,Y
c10f  9D CC C0     STA 0xc0cc,X
c112  9D E2 C3     STA 0xc3e2,X
c115  B9 C5 C1     LDA 0xc1c5,Y
c118  9D CF C0     STA 0xc0cf,X
c11b  9D B6 C2     STA 0xc2b6,X
c11e  A4 FC        LDY 0x00fc
c120  B1 FA        LDA (0xfa),Y
c122  9D 41 C1     STA 0xc141,X
c125  29 1F        AND #0x1f
c127  9D 8A C0     STA 0xc08a,X
c12a  B1 FA        LDA (0xfa),Y
c12c  30 22        BMI 0xc150
c12e  29 20        AND #0x20
c130  F0 45        BEQ 0xc177
c132  C8           INY
c133  B1 FA        LDA (0xfa),Y
c135  9D 47 C1     STA 0xc147,X
c138  C8           INY
c139  B1 FA        LDA (0xfa),Y
c13b  9D 4A C1     STA 0xc14a,X
c13e  4C 77 C1     JMP 0xc177
c141  43           ?? 43h    C
c142  43           ?? 43h    C
c143  4B           ?? 4Bh    K
c144  18           ?? 18h
c145  00           ?? 00h
c146  06           ?? 06h
c147  00           ?? 00h
c148  00           ?? 00h
c149  3E           ?? 3Eh    >
c14a  00           ?? 00h
c14b  00           ?? 00h
c14c  00           ?? 00h
c14d  00           ?? 00h
c14e  00           ?? 00h
c14f  00           ?? 00h
LAB_c150:
c150  8E 62 C2     STX 0xc262
c153  C8           INY
c154  B1 FA        LDA (0xfa),Y
c156  8D 66 C2     STA 0xc266
c159  29 0F        AND #0xf
c15b  0A           ASL A
c15c  38           SEC
c15d  E9 10        SBC #0x10
c15f  8D A0 C2     STA 0xc2a0
c162  C8           INY
c163  B1 FA        LDA (0xfa),Y
c165  D0 07        BNE 0xc16e
c167  A9 F0        LDA #0xf0
c169  8D 17 D4     STA 0xd417
c16c  D0 09        BNE 0xc177
LAB_c16e:
c16e  8D 6B C2     STA 0xc26b
c171  BD B3 C2     LDA 0xc2b3,X
c174  8D 17 D4     STA 0xd417
LAB_c177:
c177  A9 FF        LDA #0xff
c179  9D 31 C0     STA 0xc031,X
c17c  9D B9 C2     STA 0xc2b9,X
c17f  A9 00        LDA #0x0
c181  9D DD C0     STA 0xc0dd,X
c184  9D BD C2     STA 0xc2bd,X
LAB_c187:
c187  C8           INY
c188  B1 FA        LDA (0xfa),Y
c18a  C9 FF        CMP #0xff
c18c  D0 32        BNE 0xc1c0
c18e  DE E9 C0     DEC 0xc0e9,X
c191  10 2B        BPL 0xc1be
c193  BD B9 C4     LDA 0xc4b9,X
c196  85 FA        STA 0x00fa
c198  BD BC C4     LDA 0xc4bc,X
c19b  85 FB        STA 0x00fb
c19d  BC 87 C0     LDY 0xc087,X
c1a0  C8           INY
c1a1  C8           INY
c1a2  B1 FA        LDA (0xfa),Y
c1a4  C9 FF        CMP #0xff
c1a6  D0 02        BNE 0xc1aa
c1a8  A0 00        LDY #0x0
LAB_c1aa:
c1aa  98           TYA
c1ab  9D 87 C0     STA 0xc087,X
c1ae  B1 FA        LDA (0xfa),Y
c1b0  9D 8D C0     STA 0xc08d,X
c1b3  C8           INY
c1b4  B1 FA        LDA (0xfa),Y
c1b6  9D E6 C0     STA 0xc0e6,X
c1b9  29 0F        AND #0xf
c1bb  9D E9 C0     STA 0xc0e9,X
LAB_c1be:
c1be  A0 00        LDY #0x0
LAB_c1c0:
c1c0  98           TYA
c1c1  9D 81 C0     STA 0xc081,X
c1c4  60           RTS
c1c5  01           ?? 01h
c1c6  01           ?? 01h
c1c7  01           ?? 01h
c1c8  01           ?? 01h
c1c9  01           ?? 01h
c1ca  01           ?? 01h
c1cb  01           ?? 01h
c1cc  01           ?? 01h
c1cd  01           ?? 01h
c1ce  01           ?? 01h
c1cf  01           ?? 01h
c1d0  02           ?? 02h
c1d1  02           ?? 02h
c1d2  02           ?? 02h
c1d3  02           ?? 02h
c1d4  02           ?? 02h
c1d5  02           ?? 02h
c1d6  02           ?? 02h
c1d7  03           ?? 03h
c1d8  03           ?? 03h
c1d9  03           ?? 03h
c1da  03           ?? 03h
c1db  03           ?? 03h
c1dc  04           ?? 04h
c1dd  04           ?? 04h
c1de  04           ?? 04h
c1df  04           ?? 04h
c1e0  05           ?? 05h
c1e1  05           ?? 05h
c1e2  05           ?? 05h
c1e3  06           ?? 06h
c1e4  06           ?? 06h
c1e5  06           ?? 06h
c1e6  07           ?? 07h
c1e7  07           ?? 07h
c1e8  08           ?? 08h
c1e9  08           ?? 08h
c1ea  09           ?? 09h
c1eb  09           ?? 09h
c1ec  0A           ?? 0Ah
c1ed  0A           ?? 0Ah
c1ee  0B           ?? 0Bh
c1ef  0C           ?? 0Ch
c1f0  0D           ?? 0Dh
c1f1  0D           ?? 0Dh
c1f2  0E           ?? 0Eh
c1f3  0F           ?? 0Fh
c1f4  10           ?? 10h
c1f5  11           ?? 11h
c1f6  12           ?? 12h
c1f7  13           ?? 13h
c1f8  14           ?? 14h
c1f9  15           ?? 15h
c1fa  17           ?? 17h
c1fb  18           ?? 18h
c1fc  1A           ?? 1Ah
c1fd  1B           ?? 1Bh
c1fe  1D           ?? 1Dh
c1ff  1F           ?? 1Fh
c200  20           ?? 20h     
c201  22           ?? 22h    "
c202  24           ?? 24h    $
c203  27           ?? 27h    '
c204  29           ?? 29h    )
c205  2B           ?? 2Bh    +
c206  2E           ?? 2Eh    .
c207  31           ?? 31h    1
c208  34           ?? 34h    4
c209  37           ?? 37h    7
c20a  3A           ?? 3Ah    :
c20b  3E           ?? 3Eh    >
c20c  41           ?? 41h    A
c20d  45           ?? 45h    E
c20e  49           ?? 49h    I
c20f  4E           ?? 4Eh    N
c210  52           ?? 52h    R
c211  57           ?? 57h    W
c212  5C           ?? 5Ch    \
c213  62           ?? 62h    b
c214  68           ?? 68h    h
c215  6E           ?? 6Eh    n
c216  75           ?? 75h    u
c217  7C           ?? 7Ch    |
c218  83           ?? 83h
c219  8B           ?? 8Bh
c21a  93           ?? 93h
c21b  9C           ?? 9Ch
c21c  A5           ?? A5h
c21d  AF           ?? AFh
c21e  B9           ?? B9h
c21f  C4           ?? C4h
c220  D0           ?? D0h
c221  DD           ?? DDh
c222  EA           ?? EAh
c223  F8           ?? F8h
c224  FD           ?? FDh
SUB_c225:
c225  E8           INX
SUB_c226:
c226  BC D9 C3     LDY 0xc3d9,X
c229  84 FC        STY 0x00fc
c22b  BD 41 C1     LDA 0xc141,X
c22e  29 40        AND #0x40
c230  D0 5E        BNE 0xc290
c232  9D 44 C1     STA 0xc144,X
c235  B9 58 CB     LDA 0xcb58,Y
c238  85 FA        STA 0x00fa
c23a  B9 59 CB     LDA 0xcb59,Y
c23d  BC C6 C0     LDY 0xc0c6,X
c240  99 06 D4     STA 0xd406,Y
c243  A5 FA        LDA 0x00fa
c245  99 05 D4     STA 0xd405,Y
c248  BD 84 C0     LDA 0xc084,X
c24b  29 FE        AND #0xfe
c24d  99 04 D4     STA 0xd404,Y
c250  A4 FC        LDY 0x00fc
c252  B9 5A CB     LDA 0xcb5a,Y
c255  9D 84 C0     STA 0xc084,X
c258  B9 5B CB     LDA 0xcb5b,Y
c25b  9D DC C3     STA 0xc3dc,X
c25e  9D DF C3     STA 0xc3df,X
c261  E0 00        CPX #0x0
c263  D0 0A        BNE 0xc26f
c265  A9 00        LDA #0x0
c267  8D 9E C2     STA 0xc29e
c26a  A9 14        LDA #0x14
c26c  8D 96 C2     STA 0xc296
LAB_c26f:
c26f  A9 00        LDA #0x0
c271  9D E0 C0     STA 0xc0e0,X
c274  9D E3 C0     STA 0xc0e3,X
c277  B9 5D CB     LDA 0xcb5d,Y
c27a  4A           LSR A
c27b  4A           LSR A
c27c  4A           LSR A
c27d  9D 4D C1     STA 0xc14d,X
c280  BD 41 C1     LDA 0xc141,X
c283  09 40        ORA #0x40
c285  9D 41 C1     STA 0xc141,X
c288  B9 5F CB     LDA 0xcb5f,Y
c28b  95 FD        STA 0xfd,X
c28d  4C 85 C3     JMP 0xc385
LAB_c290:
c290  EC 62 C2     CPX 0xc262
c293  D0 12        BNE 0xc2a7
c295  A9 07        LDA #0x7
c297  F0 0E        BEQ 0xc2a7
c299  CE 96 C2     DEC 0xc296
c29c  18           CLC
c29d  A9 30        LDA #0x30
c29f  69 F0        ADC #0xf0
c2a1  8D 9E C2     STA 0xc29e
c2a4  8D 16 D4     STA 0xd416
LAB_c2a7:
c2a7  B5 FD        LDA 0xfd,X
c2a9  29 0F        AND #0xf
c2ab  F0 1A        BEQ 0xc2c7
c2ad  20 E5 C3     JSR 0xc3e5
c2b0  4C 22 C3     JMP 0xc322
c2b3  F1           ?? F1h
c2b4  F3           ?? F3h
c2b5  F7           ?? F7h
c2b6  08           ?? 08h
c2b7  0A           ?? 0Ah
c2b8  37           ?? 37h    7
c2b9  FF           ?? FFh
c2ba  FF           ?? FFh
c2bb  FF           ?? FFh
c2bc  00           ?? 00h
c2bd  00           ?? 00h
c2be  00           ?? 00h
c2bf  11           ?? 11h
c2c0  00           ?? 00h
c2c1  00           ?? 00h
c2c2  00           ?? 00h
c2c3  00           ?? 00h
c2c4  01           ?? 01h
c2c5  01           ?? 01h
c2c6  00           ?? 00h
LAB_c2c7:
c2c7  BD 41 C1     LDA 0xc141,X
c2ca  29 20        AND #0x20
c2cc  D0 54        BNE 0xc322
c2ce  B5 FD        LDA 0xfd,X
c2d0  29 10        AND #0x10
c2d2  F0 4E        BEQ 0xc322
c2d4  DE 4D C1     DEC 0xc14d,X
c2d7  10 49        BPL 0xc322
c2d9  FE 4D C1     INC 0xc14d,X
c2dc  BD BD C2     LDA 0xc2bd,X
c2df  29 03        AND #0x3
c2e1  A8           TAY
c2e2  B9 C3 C2     LDA 0xc2c3,Y
c2e5  D0 13        BNE 0xc2fa
c2e7  A4 FC        LDY 0x00fc
c2e9  38           SEC
c2ea  BD CC C0     LDA 0xc0cc,X
c2ed  F9 5E CB     SBC 0xcb5e,Y
c2f0  9D CC C0     STA 0xc0cc,X
c2f3  B0 18        BCS 0xc30d
c2f5  DE CF C0     DEC 0xc0cf,X
c2f8  D0 13        BNE 0xc30d
LAB_c2fa:
c2fa  A4 FC        LDY 0x00fc
c2fc  18           CLC
c2fd  BD CC C0     LDA 0xc0cc,X
c300  79 5E CB     ADC 0xcb5e,Y
c303  9D CC C0     STA 0xc0cc,X
c306  90 05        BCC 0xc30d
c308  FE CF C0     INC 0xc0cf,X
c30b  B0 00        BCS 0xc30d
LAB_c30d:
c30d  FE DD C0     INC 0xc0dd,X
c310  B9 5D CB     LDA 0xcb5d,Y
c313  29 0F        AND #0xf
c315  DD DD C0     CMP 0xc0dd,X
c318  D0 08        BNE 0xc322
c31a  A9 00        LDA #0x0
c31c  9D DD C0     STA 0xc0dd,X
c31f  FE BD C2     INC 0xc2bd,X
LAB_c322:
c322  A4 FC        LDY 0x00fc
c324  B9 5C CB     LDA 0xcb5c,Y
c327  85 FC        STA 0x00fc
c329  B5 FD        LDA 0xfd,X
c32b  29 40        AND #0x40
c32d  F0 14        BEQ 0xc343
c32f  18           CLC
c330  A5 FC        LDA 0x00fc
c332  7D DC C3     ADC 0xc3dc,X
c335  9D DC C3     STA 0xc3dc,X
c338  A5 FC        LDA 0x00fc
c33a  7D DF C3     ADC 0xc3df,X
c33d  9D DF C3     STA 0xc3df,X
c340  4C 85 C3     JMP 0xc385
LAB_c343:
c343  B5 FD        LDA 0xfd,X
c345  29 20        AND #0x20
c347  F0 3C        BEQ 0xc385
c349  BD E3 C0     LDA 0xc0e3,X
c34c  F0 10        BEQ 0xc35e
c34e  18           CLC
c34f  BD DC C3     LDA 0xc3dc,X
c352  65 FC        ADC 0x00fc
c354  9D DC C3     STA 0xc3dc,X
c357  90 13        BCC 0xc36c
c359  FE DF C3     INC 0xc3df,X
c35c  B0 0E        BCS 0xc36c
LAB_c35e:
c35e  38           SEC
c35f  BD DC C3     LDA 0xc3dc,X
c362  E5 FC        SBC 0x00fc
c364  9D DC C3     STA 0xc3dc,X
c367  B0 03        BCS 0xc36c
c369  DE DF C3     DEC 0xc3df,X
LAB_c36c:
c36c  FE E0 C0     INC 0xc0e0,X
c36f  A5 FC        LDA 0x00fc
c371  29 0F        AND #0xf
c373  DD E0 C0     CMP 0xc0e0,X
c376  D0 0D        BNE 0xc385
c378  A9 00        LDA #0x0
c37a  9D E0 C0     STA 0xc0e0,X
c37d  BD E3 C0     LDA 0xc0e3,X
c380  49 01        EOR #0x1
c382  9D E3 C0     STA 0xc0e3,X
LAB_c385:
c385  BC C6 C0     LDY 0xc0c6,X
c388  BD 84 C0     LDA 0xc084,X
c38b  99 04 D4     STA 0xd404,Y
c38e  BD DF C3     LDA 0xc3df,X
c391  99 03 D4     STA 0xd403,Y
c394  BD DC C3     LDA 0xc3dc,X
c397  99 02 D4     STA 0xd402,Y
c39a  BD 41 C1     LDA 0xc141,X
c39d  29 20        AND #0x20
c39f  F0 2B        BEQ 0xc3cc
c3a1  BD 47 C1     LDA 0xc147,X
c3a4  29 01        AND #0x1
c3a6  F0 0A        BEQ 0xc3b2
c3a8  BD B9 C2     LDA 0xc2b9,X
c3ab  49 FF        EOR #0xff
c3ad  9D B9 C2     STA 0xc2b9,X
c3b0  D0 1A        BNE 0xc3cc
LAB_c3b2:
c3b2  18           CLC
c3b3  BD E2 C3     LDA 0xc3e2,X
c3b6  7D 47 C1     ADC 0xc147,X
c3b9  9D E2 C3     STA 0xc3e2,X
c3bc  99 00 D4     STA 0xd400,Y
c3bf  BD B6 C2     LDA 0xc2b6,X
c3c2  7D 4A C1     ADC 0xc14a,X
c3c5  9D B6 C2     STA 0xc2b6,X
c3c8  99 01 D4     STA 0xd401,Y
c3cb  60           RTS
LAB_c3cc:
c3cc  BD CC C0     LDA 0xc0cc,X
c3cf  99 00 D4     STA 0xd400,Y
c3d2  BD CF C0     LDA 0xc0cf,X
c3d5  99 01 D4     STA 0xd401,Y
c3d8  60           RTS
c3d9  30           ?? 30h    0
c3da  48           ?? 48h    H
c3db  00           ?? 00h
c3dc  08           ?? 08h
c3dd  A8           ?? A8h
c3de  54           ?? 54h    T
c3df  08           ?? 08h
c3e0  02           ?? 02h
c3e1  84           ?? 84h
c3e2  B4           ?? B4h
c3e3  57           ?? 57h    W
c3e4  42           ?? 42h    B
SUB_c3e5:
c3e5  A8           TAY
c3e6  B9 98 C4     LDA 0xc498,Y
c3e9  85 FA        STA 0x00fa
c3eb  B9 A8 C4     LDA 0xc4a8,Y
c3ee  85 FB        STA 0x00fb
c3f0  BC 44 C1     LDY 0xc144,X
c3f3  B1 FA        LDA (0xfa),Y
c3f5  3D 31 C0     AND 0xc031,X
c3f8  9D 84 C0     STA 0xc084,X
c3fb  C8           INY
c3fc  B1 FA        LDA (0xfa),Y
c3fe  30 04        BMI 0xc404
c400  18           CLC
c401  7D C9 C0     ADC 0xc0c9,X
LAB_c404:
c404  29 7F        AND #0x7f
c406  8D 29 C4     STA 0xc429
c409  C8           INY
c40a  B1 FA        LDA (0xfa),Y
c40c  F0 03        BEQ 0xc411
c40e  8D 9E C2     STA 0xc29e
LAB_c411:
c411  C8           INY
c412  B1 FA        LDA (0xfa),Y
c414  C9 FE        CMP #0xfe
c416  90 0C        BCC 0xc424
c418  F0 04        BEQ 0xc41e
c41a  A0 00        LDY #0x0
c41c  F0 06        BEQ 0xc424
LAB_c41e:
c41e  B5 FD        LDA 0xfd,X
c420  29 F0        AND #0xf0
c422  95 FD        STA 0xfd,X
LAB_c424:
c424  98           TYA
c425  9D 44 C1     STA 0xc144,X
c428  A0 29        LDY #0x29
c42a  B9 37 C4     LDA 0xc437,Y
c42d  9D CC C0     STA 0xc0cc,X
c430  B9 C5 C1     LDA 0xc1c5,Y
c433  9D CF C0     STA 0xc0cf,X
c436  60           RTS
c437  16           ?? 16h
c438  27           ?? 27h    '
c439  38           ?? 38h    8
c43a  4B           ?? 4Bh    K
c43b  5F           ?? 5Fh    _
c43c  73           ?? 73h    s
c43d  8A           ?? 8Ah
c43e  A1           ?? A1h
c43f  BA           ?? BAh
c440  D4           ?? D4h
c441  F0           ?? F0h
c442  0E           ?? 0Eh
c443  2D           ?? 2Dh    -
c444  4E           ?? 4Eh    N
c445  71           ?? 71h    q
c446  96           ?? 96h
c447  BD           ?? BDh
c448  E7           ?? E7h
c449  13           ?? 13h
c44a  42           ?? 42h    B
c44b  74           ?? 74h    t
c44c  A9           ?? A9h
c44d  E0           ?? E0h
c44e  1B           ?? 1Bh
c44f  5A           ?? 5Ah    Z
c450  9B           ?? 9Bh
c451  E2           ?? E2h
c452  2C           ?? 2Ch    ,
c453  7B           ?? 7Bh    {
c454  CE           ?? CEh
c455  27           ?? 27h    '
c456  85           ?? 85h
c457  E8           ?? E8h
c458  51           ?? 51h    Q
c459  C1           ?? C1h
c45a  37           ?? 37h    7
c45b  B4           ?? B4h
c45c  37           ?? 37h    7
c45d  C4           ?? C4h
c45e  57           ?? 57h    W
c45f  F5           ?? F5h
c460  9C           ?? 9Ch
c461  4E           ?? 4Eh    N
c462  09           ?? 09h
c463  D0           ?? D0h
c464  A3           ?? A3h
c465  82           ?? 82h
c466  6E           ?? 6Eh    n
c467  68           ?? 68h    h
c468  6E           ?? 6Eh    n
c469  88           ?? 88h
c46a  AF           ?? AFh
c46b  EB           ?? EBh
c46c  39           ?? 39h    9
c46d  9C           ?? 9Ch
c46e  13           ?? 13h
c46f  A1           ?? A1h
c470  46           ?? 46h    F
c471  04           ?? 04h
c472  DC           ?? DCh
c473  D0           ?? D0h
c474  DC           ?? DCh
c475  10           ?? 10h
c476  5E           ?? 5Eh    ^
c477  D6           ?? D6h
c478  72           ?? 72h    r
c479  38           ?? 38h    8
c47a  26           ?? 26h    &
c47b  42           ?? 42h    B
c47c  8C           ?? 8Ch
c47d  08           ?? 08h
c47e  B8           ?? B8h
c47f  A0           ?? A0h
c480  B8           ?? B8h
c481  20           ?? 20h     
c482  BC           ?? BCh
c483  AC           ?? ACh
c484  E4           ?? E4h
c485  70           ?? 70h    p
c486  4C           ?? 4Ch    L
c487  84           ?? 84h
c488  18           ?? 18h
c489  10           ?? 10h
c48a  70           ?? 70h    p
c48b  40           ?? 40h    @
c48c  70           ?? 70h    p
c48d  40           ?? 40h    @
c48e  78           ?? 78h    x
c48f  58           ?? 58h    X
c490  C8           ?? C8h
c491  E0           ?? E0h
c492  98           ?? 98h
c493  08           ?? 08h
c494  30           ?? 30h    0
c495  20           ?? 20h     
c496  2E           ?? 2Eh    .
c497  27           ?? 27h    '
c498  69           ?? 69h    i
c499  7B           ?? 7Bh    {
c49a  6B           ?? 6Bh    k
c49b  CB           ?? CBh
c49c  64           ?? 64h    d
c49d  A5           ?? A5h
c49e  9B           ?? 9Bh
c49f  BE           ?? BEh
c4a0  82           ?? 82h
c4a1  D5           ?? D5h
c4a2  20           ?? 20h     
c4a3  40           ?? 40h    @
c4a4  60           ?? 60h    `
c4a5  80           ?? 80h
c4a6  A0           ?? A0h
c4a7  C0           ?? C0h
c4a8  E0           ?? E0h
c4a9  CA           ?? CAh
c4aa  CA           ?? CAh
c4ab  CA           ?? CAh
c4ac  CA           ?? CAh
c4ad  CA           ?? CAh
c4ae  CA           ?? CAh
c4af  CA           ?? CAh
c4b0  CA           ?? CAh
c4b1  CA           ?? CAh
c4b2  A4           ?? A4h
c4b3  A4           ?? A4h
c4b4  A4           ?? A4h
c4b5  A4           ?? A4h
c4b6  A4           ?? A4h
c4b7  A4           ?? A4h
c4b8  A4           ?? A4h
c4b9  4B           ?? 4Bh    K
c4ba  9A           ?? 9Ah
c4bb  27           ?? 27h    '
c4bc  CA           ?? CAh
c4bd  C9           ?? C9h
c4be  C9           ?? C9h
c4bf  41           ?? 41h    A
c4c0  42           ?? 42h    B
c4c1  8F           ?? 8Fh
c4c2  28           ?? 28h    (
c4c3  1F           ?? 1Fh
c4c4  28           ?? 28h    (
c4c5  1F           ?? 1Fh
c4c6  FF           ?? FFh
c4c7  8A           ?? 8Ah
c4c8  35           ?? 35h    5
c4c9  1F           ?? 1Fh
c4ca  38           ?? 38h    8
c4cb  1F           ?? 1Fh
c4cc  35           ?? 35h    5
c4cd  0F           ?? 0Fh
c4ce  31           ?? 31h    1
c4cf  0F           ?? 0Fh
c4d0  34           ?? 34h    4
c4d1  0F           ?? 0Fh
c4d2  31           ?? 31h    1
c4d3  07           ?? 07h
c4d4  34           ?? 34h    4
c4d5  07           ?? 07h
c4d6  FF           ?? FFh
c4d7  8F           ?? 8Fh
c4d8  27           ?? 27h    '
c4d9  17           ?? 17h
c4da  8C           ?? 8Ch
c4db  3F           ?? 3Fh    ?
c4dc  07           ?? 07h
c4dd  8F           ?? 8Fh
c4de  27           ?? 27h    '
c4df  17           ?? 17h
c4e0  8C           ?? 8Ch
c4e1  3F           ?? 3Fh    ?
c4e2  07           ?? 07h
c4e3  42           ?? 42h    B
c4e4  0F           ?? 0Fh
c4e5  8F           ?? 8Fh
c4e6  27           ?? 27h    '
c4e7  07           ?? 07h
c4e8  81           ?? 81h
c4e9  2E           ?? 2Eh    .
c4ea  03           ?? 03h
c4eb  2E           ?? 2Eh    .
c4ec  03           ?? 03h
c4ed  8C           ?? 8Ch
c4ee  44           ?? 44h    D
c4ef  0F           ?? 0Fh
c4f0  8F           ?? 8Fh
c4f1  27           ?? 27h    '
c4f2  07           ?? 07h
c4f3  81           ?? 81h
c4f4  30           ?? 30h    0
c4f5  03           ?? 03h
c4f6  30           ?? 30h    0
c4f7  03           ?? 03h
c4f8  FF           ?? FFh
c4f9  7F           ?? 7Fh    
c4fa  FF           ?? FFh
c4fb  3F           ?? 3Fh    ?
c4fc  1F           ?? 1Fh
c4fd  3F           ?? 3Fh    ?
c4fe  5F           ?? 5Fh    _
c4ff  3F           ?? 3Fh    ?
c500  5F           ?? 5Fh    _
c501  3F           ?? 3Fh    ?
c502  5F           ?? 5Fh    _
c503  FF           ?? FFh
c504  8B           ?? 8Bh
c505  1B           ?? 1Bh
c506  0F           ?? 0Fh
c507  1B           ?? 1Bh
c508  0F           ?? 0Fh
c509  1B           ?? 1Bh
c50a  0F           ?? 0Fh
c50b  1B           ?? 1Bh
c50c  0F           ?? 0Fh
c50d  16           ?? 16h
c50e  0F           ?? 0Fh
c50f  16           ?? 16h
c510  0F           ?? 0Fh
c511  16           ?? 16h
c512  0F           ?? 0Fh
c513  16           ?? 16h
c514  0F           ?? 0Fh
c515  FF           ?? FFh
c516  14           ?? 14h
c517  0F           ?? 0Fh
c518  14           ?? 14h
c519  0F           ?? 0Fh
c51a  14           ?? 14h
c51b  0F           ?? 0Fh
c51c  14           ?? 14h
c51d  0F           ?? 0Fh
c51e  17           ?? 17h
c51f  0F           ?? 0Fh
c520  17           ?? 17h
c521  0F           ?? 0Fh
c522  16           ?? 16h
c523  0F           ?? 0Fh
c524  16           ?? 16h
c525  0F           ?? 0Fh
c526  FF           ?? FFh
c527  19           ?? 19h
c528  03           ?? 03h
c529  25           ?? 25h    %
c52a  03           ?? 03h
c52b  31           ?? 31h    1
c52c  03           ?? 03h
c52d  25           ?? 25h    %
c52e  03           ?? 03h
c52f  19           ?? 19h
c530  03           ?? 03h
c531  25           ?? 25h    %
c532  03           ?? 03h
c533  31           ?? 31h    1
c534  03           ?? 03h
c535  25           ?? 25h    %
c536  03           ?? 03h
c537  19           ?? 19h
c538  03           ?? 03h
c539  23           ?? 23h    #
c53a  03           ?? 03h
c53b  2F           ?? 2Fh    /
c53c  03           ?? 03h
c53d  23           ?? 23h    #
c53e  03           ?? 03h
c53f  19           ?? 19h
c540  03           ?? 03h
c541  23           ?? 23h    #
c542  03           ?? 03h
c543  2F           ?? 2Fh    /
c544  03           ?? 03h
c545  23           ?? 23h    #
c546  03           ?? 03h
c547  19           ?? 19h
c548  03           ?? 03h
c549  22           ?? 22h    "
c54a  03           ?? 03h
c54b  2E           ?? 2Eh    .
c54c  03           ?? 03h
c54d  22           ?? 22h    "
c54e  03           ?? 03h
c54f  19           ?? 19h
c550  03           ?? 03h
c551  22           ?? 22h    "
c552  03           ?? 03h
c553  2E           ?? 2Eh    .
c554  03           ?? 03h
c555  22           ?? 22h    "
c556  03           ?? 03h
c557  19           ?? 19h
c558  03           ?? 03h
c559  21           ?? 21h    !
c55a  03           ?? 03h
c55b  2D           ?? 2Dh    -
c55c  03           ?? 03h
c55d  21           ?? 21h    !
c55e  03           ?? 03h
c55f  19           ?? 19h
c560  03           ?? 03h
c561  21           ?? 21h    !
c562  03           ?? 03h
c563  2D           ?? 2Dh    -
c564  03           ?? 03h
c565  21           ?? 21h    !
c566  03           ?? 03h
c567  FF           ?? FFh
c568  19           ?? 19h
c569  03           ?? 03h
c56a  25           ?? 25h    %
c56b  03           ?? 03h
c56c  31           ?? 31h    1
c56d  03           ?? 03h
c56e  25           ?? 25h    %
c56f  03           ?? 03h
c570  19           ?? 19h
c571  03           ?? 03h
c572  25           ?? 25h    %
c573  03           ?? 03h
c574  31           ?? 31h    1
c575  03           ?? 03h
c576  25           ?? 25h    %
c577  03           ?? 03h
c578  19           ?? 19h
c579  03           ?? 03h
c57a  23           ?? 23h    #
c57b  03           ?? 03h
c57c  2F           ?? 2Fh    /
c57d  03           ?? 03h
c57e  23           ?? 23h    #
c57f  03           ?? 03h
c580  19           ?? 19h
c581  03           ?? 03h
c582  23           ?? 23h    #
c583  03           ?? 03h
c584  2F           ?? 2Fh    /
c585  03           ?? 03h
c586  23           ?? 23h    #
c587  03           ?? 03h
c588  17           ?? 17h
c589  03           ?? 03h
c58a  23           ?? 23h    #
c58b  03           ?? 03h
c58c  2F           ?? 2Fh    /
c58d  03           ?? 03h
c58e  23           ?? 23h    #
c58f  03           ?? 03h
c590  17           ?? 17h
c591  03           ?? 03h
c592  23           ?? 23h    #
c593  03           ?? 03h
c594  2F           ?? 2Fh    /
c595  03           ?? 03h
c596  23           ?? 23h    #
c597  03           ?? 03h
c598  16           ?? 16h
c599  03           ?? 03h
c59a  22           ?? 22h    "
c59b  03           ?? 03h
c59c  2E           ?? 2Eh    .
c59d  03           ?? 03h
c59e  22           ?? 22h    "
c59f  03           ?? 03h
c5a0  16           ?? 16h
c5a1  03           ?? 03h
c5a2  22           ?? 22h    "
c5a3  03           ?? 03h
c5a4  2E           ?? 2Eh    .
c5a5  03           ?? 03h
c5a6  22           ?? 22h    "
c5a7  03           ?? 03h
c5a8  FF           ?? FFh
c5a9  89           ?? 89h
c5aa  14           ?? 14h
c5ab  01           ?? 01h
c5ac  20           ?? 20h     
c5ad  01           ?? 01h
c5ae  14           ?? 14h
c5af  03           ?? 03h
c5b0  20           ?? 20h     
c5b1  03           ?? 03h
c5b2  2C           ?? 2Ch    ,
c5b3  01           ?? 01h
c5b4  20           ?? 20h     
c5b5  01           ?? 01h
c5b6  14           ?? 14h
c5b7  01           ?? 01h
c5b8  20           ?? 20h     
c5b9  01           ?? 01h
c5ba  14           ?? 14h
c5bb  03           ?? 03h
c5bc  20           ?? 20h     
c5bd  03           ?? 03h
c5be  1B           ?? 1Bh
c5bf  01           ?? 01h
c5c0  20           ?? 20h     
c5c1  01           ?? 01h
c5c2  FF           ?? FFh
c5c3  83           ?? 83h
c5c4  1E           ?? 1Eh
c5c5  07           ?? 07h
c5c6  1E           ?? 1Eh
c5c7  07           ?? 07h
c5c8  20           ?? 20h     
c5c9  07           ?? 07h
c5ca  20           ?? 20h     
c5cb  07           ?? 07h
c5cc  23           ?? 23h    #
c5cd  07           ?? 07h
c5ce  23           ?? 23h    #
c5cf  07           ?? 07h
c5d0  22           ?? 22h    "
c5d1  07           ?? 07h
c5d2  22           ?? 22h    "
c5d3  07           ?? 07h
c5d4  FF           ?? FFh
c5d5  83           ?? 83h
c5d6  1D           ?? 1Dh
c5d7  07           ?? 07h
c5d8  1D           ?? 1Dh
c5d9  07           ?? 07h
c5da  20           ?? 20h     
c5db  07           ?? 07h
c5dc  14           ?? 14h
c5dd  07           ?? 07h
c5de  FF           ?? FFh
c5df  18           ?? 18h
c5e0  07           ?? 07h
c5e1  24           ?? 24h    $
c5e2  07           ?? 07h
c5e3  16           ?? 16h
c5e4  07           ?? 07h
c5e5  20           ?? 20h     
c5e6  07           ?? 07h
c5e7  FF           ?? FFh
c5e8  18           ?? 18h
c5e9  07           ?? 07h
c5ea  24           ?? 24h    $
c5eb  07           ?? 07h
c5ec  1D           ?? 1Dh
c5ed  07           ?? 07h
c5ee  1D           ?? 1Dh
c5ef  07           ?? 07h
c5f0  FF           ?? FFh
c5f1  14           ?? 14h
c5f2  03           ?? 03h
c5f3  20           ?? 20h     
c5f4  03           ?? 03h
c5f5  2C           ?? 2Ch    ,
c5f6  03           ?? 03h
c5f7  20           ?? 20h     
c5f8  03           ?? 03h
c5f9  23           ?? 23h    #
c5fa  03           ?? 03h
c5fb  23           ?? 23h    #
c5fc  03           ?? 03h
c5fd  22           ?? 22h    "
c5fe  03           ?? 03h
c5ff  22           ?? 22h    "
c600  03           ?? 03h
c601  FF           ?? FFh
c602  14           ?? 14h
c603  03           ?? 03h
c604  20           ?? 20h     
c605  03           ?? 03h
c606  2C           ?? 2Ch    ,
c607  03           ?? 03h
c608  20           ?? 20h     
c609  03           ?? 03h
c60a  21           ?? 21h    !
c60b  03           ?? 03h
c60c  21           ?? 21h    !
c60d  03           ?? 03h
c60e  20           ?? 20h     
c60f  03           ?? 03h
c610  20           ?? 20h     
c611  03           ?? 03h
c612  FF           ?? FFh
c613  1A           ?? 1Ah
c614  03           ?? 03h
c615  26           ?? 26h    &
c616  03           ?? 03h
c617  32           ?? 32h    2
c618  03           ?? 03h
c619  26           ?? 26h    &
c61a  03           ?? 03h
c61b  24           ?? 24h    $
c61c  03           ?? 03h
c61d  24           ?? 24h    $
c61e  03           ?? 03h
c61f  23           ?? 23h    #
c620  03           ?? 03h
c621  23           ?? 23h    #
c622  03           ?? 03h
c623  FF           ?? FFh
c624  14           ?? 14h
c625  03           ?? 03h
c626  20           ?? 20h     
c627  03           ?? 03h
c628  2C           ?? 2Ch    ,
c629  03           ?? 03h
c62a  20           ?? 20h     
c62b  03           ?? 03h
c62c  26           ?? 26h    &
c62d  03           ?? 03h
c62e  26           ?? 26h    &
c62f  03           ?? 03h
c630  25           ?? 25h    %
c631  03           ?? 03h
c632  25           ?? 25h    %
c633  03           ?? 03h
c634  FF           ?? FFh
c635  7F           ?? 7Fh    
c636  FF           ?? FFh
c637  7F           ?? 7Fh    
c638  FF           ?? FFh
c639  7F           ?? 7Fh    
c63a  FF           ?? FFh
c63b  7F           ?? 7Fh    
c63c  FF           ?? FFh
c63d  7F           ?? 7Fh    
c63e  FF           ?? FFh
c63f  7F           ?? 7Fh    
c640  FF           ?? FFh
c641  7F           ?? 7Fh    
c642  FF           ?? FFh
c643  7F           ?? 7Fh    
c644  FF           ?? FFh
c645  7F           ?? 7Fh    
c646  FF           ?? FFh
c647  7F           ?? 7Fh    
c648  FF           ?? FFh
c649  7F           ?? 7Fh    
c64a  FF           ?? FFh
c64b  82           ?? 82h
c64c  47           ?? 47h    G
c64d  17           ?? 17h
c64e  8D           ?? 8Dh
c64f  3A           ?? 3Ah    :
c650  07           ?? 07h
c651  82           ?? 82h
c652  47           ?? 47h    G
c653  17           ?? 17h
c654  8D           ?? 8Dh
c655  3A           ?? 3Ah    :
c656  07           ?? 07h
c657  38           ?? 38h    8
c658  0F           ?? 0Fh
c659  82           ?? 82h
c65a  48           ?? 48h    H
c65b  0F           ?? 0Fh
c65c  48           ?? 48h    H
c65d  1F           ?? 1Fh
c65e  FF           ?? FFh
c65f  81           ?? 81h
c660  30           ?? 30h    0
c661  83           ?? 83h
c662  00           ?? 00h
c663  00           ?? 00h
c664  30           ?? 30h    0
c665  03           ?? 03h
c666  8F           ?? 8Fh
c667  00           ?? 00h
c668  07           ?? 07h
c669  82           ?? 82h
c66a  47           ?? 47h    G
c66b  87           ?? 87h
c66c  1A           ?? 1Ah
c66d  14           ?? 14h
c66e  8D           ?? 8Dh
c66f  38           ?? 38h    8
c670  07           ?? 07h
c671  81           ?? 81h
c672  30           ?? 30h    0
c673  83           ?? 83h
c674  00           ?? 00h
c675  00           ?? 00h
c676  30           ?? 30h    0
c677  03           ?? 03h
c678  8F           ?? 8Fh
c679  18           ?? 18h
c67a  07           ?? 07h
c67b  82           ?? 82h
c67c  47           ?? 47h    G
c67d  87           ?? 87h
c67e  1A           ?? 1Ah
c67f  14           ?? 14h
c680  8D           ?? 8Dh
c681  38           ?? 38h    8
c682  07           ?? 07h
c683  3D           ?? 3Dh    =
c684  0F           ?? 0Fh
c685  82           ?? 82h
c686  47           ?? 47h    G
c687  0F           ?? 0Fh
c688  8D           ?? 8Dh
c689  3F           ?? 3Fh    ?
c68a  0F           ?? 0Fh
c68b  82           ?? 82h
c68c  47           ?? 47h    G
c68d  0F           ?? 0Fh
c68e  FF           ?? FFh
c68f  81           ?? 81h
c690  30           ?? 30h    0
c691  83           ?? 83h
c692  00           ?? 00h
c693  00           ?? 00h
c694  30           ?? 30h    0
c695  03           ?? 03h
c696  8F           ?? 8Fh
c697  18           ?? 18h
c698  07           ?? 07h
c699  82           ?? 82h
c69a  47           ?? 47h    G
c69b  8F           ?? 8Fh
c69c  1A           ?? 1Ah
c69d  14           ?? 14h
c69e  FF           ?? FFh
c69f  81           ?? 81h
c6a0  30           ?? 30h    0
c6a1  83           ?? 83h
c6a2  00           ?? 00h
c6a3  00           ?? 00h
c6a4  30           ?? 30h    0
c6a5  03           ?? 03h
c6a6  8F           ?? 8Fh
c6a7  18           ?? 18h
c6a8  03           ?? 03h
c6a9  81           ?? 81h
c6aa  2E           ?? 2Eh    .
c6ab  03           ?? 03h
c6ac  82           ?? 82h
c6ad  3F           ?? 3Fh    ?
c6ae  87           ?? 87h
c6af  1A           ?? 1Ah
c6b0  14           ?? 14h
c6b1  81           ?? 81h
c6b2  30           ?? 30h    0
c6b3  83           ?? 83h
c6b4  00           ?? 00h
c6b5  00           ?? 00h
c6b6  8F           ?? 8Fh
c6b7  18           ?? 18h
c6b8  03           ?? 03h
c6b9  81           ?? 81h
c6ba  30           ?? 30h    0
c6bb  03           ?? 03h
c6bc  30           ?? 30h    0
c6bd  03           ?? 03h
c6be  8F           ?? 8Fh
c6bf  18           ?? 18h
c6c0  03           ?? 03h
c6c1  81           ?? 81h
c6c2  2E           ?? 2Eh    .
c6c3  03           ?? 03h
c6c4  82           ?? 82h
c6c5  3F           ?? 3Fh    ?
c6c6  87           ?? 87h
c6c7  1A           ?? 1Ah
c6c8  14           ?? 14h
c6c9  81           ?? 81h
c6ca  30           ?? 30h    0
c6cb  83           ?? 83h
c6cc  00           ?? 00h
c6cd  00           ?? 00h
c6ce  30           ?? 30h    0
c6cf  03           ?? 03h
c6d0  FF           ?? FFh
c6d1  82           ?? 82h
c6d2  56           ?? 56h    V
c6d3  9F           ?? 9Fh
c6d4  1A           ?? 1Ah
c6d5  14           ?? 14h
c6d6  56           ?? 56h    V
c6d7  1F           ?? 1Fh
c6d8  FF           ?? FFh
c6d9  8F           ?? 8Fh
c6da  27           ?? 27h    '
c6db  17           ?? 17h
c6dc  8C           ?? 8Ch
c6dd  3F           ?? 3Fh    ?
c6de  07           ?? 07h
c6df  8F           ?? 8Fh
c6e0  27           ?? 27h    '
c6e1  0F           ?? 0Fh
c6e2  81           ?? 81h
c6e3  2E           ?? 2Eh    .
c6e4  03           ?? 03h
c6e5  2E           ?? 2Eh    .
c6e6  03           ?? 03h
c6e7  8C           ?? 8Ch
c6e8  3F           ?? 3Fh    ?
c6e9  07           ?? 07h
c6ea  3D           ?? 3Dh    =
c6eb  0F           ?? 0Fh
c6ec  8F           ?? 8Fh
c6ed  27           ?? 27h    '
c6ee  07           ?? 07h
c6ef  81           ?? 81h
c6f0  2E           ?? 2Eh    .
c6f1  03           ?? 03h
c6f2  2E           ?? 2Eh    .
c6f3  03           ?? 03h
c6f4  8F           ?? 8Fh
c6f5  27           ?? 27h    '
c6f6  17           ?? 17h
c6f7  81           ?? 81h
c6f8  2E           ?? 2Eh    .
c6f9  03           ?? 03h
c6fa  2E           ?? 2Eh    .
c6fb  03           ?? 03h
c6fc  FF           ?? FFh
c6fd  80           ?? 80h
c6fe  3F           ?? 3Fh    ?
c6ff  0B           ?? 0Bh
c700  41           ?? 41h    A
c701  01           ?? 01h
c702  3F           ?? 3Fh    ?
c703  01           ?? 01h
c704  42           ?? 42h    B
c705  0B           ?? 0Bh
c706  41           ?? 41h    A
c707  01           ?? 01h
c708  42           ?? 42h    B
c709  01           ?? 01h
c70a  44           ?? 44h    D
c70b  0B           ?? 0Bh
c70c  42           ?? 42h    B
c70d  03           ?? 03h
c70e  41           ?? 41h    A
c70f  07           ?? 07h
c710  42           ?? 42h    B
c711  07           ?? 07h
c712  44           ?? 44h    D
c713  0B           ?? 0Bh
c714  42           ?? 42h    B
c715  01           ?? 01h
c716  41           ?? 41h    A
c717  01           ?? 01h
c718  3D           ?? 3Dh    =
c719  17           ?? 17h
c71a  3D           ?? 3Dh    =
c71b  4F           ?? 4Fh    O
c71c  88           ?? 88h
c71d  10           ?? 10h
c71e  03           ?? 03h
c71f  10           ?? 10h
c720  03           ?? 03h
c721  FF           ?? FFh
c722  40           ?? 40h    @
c723  07           ?? 07h
c724  3C           ?? 3Ch    <
c725  07           ?? 07h
c726  3B           ?? 3Bh    ;
c727  07           ?? 07h
c728  38           ?? 38h    8
c729  03           ?? 03h
c72a  38           ?? 38h    8
c72b  63           ?? 63h    c
c72c  40           ?? 40h    @
c72d  00           ?? 00h
c72e  3A           ?? 3Ah    :
c72f  57           ?? 57h    W
c730  3A           ?? 3Ah    :
c731  01           ?? 01h
c732  3F           ?? 3Fh    ?
c733  01           ?? 01h
c734  42           ?? 42h    B
c735  01           ?? 01h
c736  46           ?? 46h    F
c737  01           ?? 01h
c738  48           ?? 48h    H
c739  07           ?? 07h
c73a  43           ?? 43h    C
c73b  07           ?? 07h
c73c  44           ?? 44h    D
c73d  07           ?? 07h
c73e  41           ?? 41h    A
c73f  03           ?? 03h
c740  41           ?? 41h    A
c741  63           ?? 63h    c
c742  3E           ?? 3Eh    >
c743  00           ?? 00h
c744  43           ?? 43h    C
c745  57           ?? 57h    W
c746  3C           ?? 3Ch    <
c747  07           ?? 07h
c748  41           ?? 41h    A
c749  0F           ?? 0Fh
c74a  3D           ?? 3Dh    =
c74b  0F           ?? 0Fh
c74c  40           ?? 40h    @
c74d  0F           ?? 0Fh
c74e  3C           ?? 3Ch    <
c74f  0F           ?? 0Fh
c750  FF           ?? FFh
c751  85           ?? 85h
c752  35           ?? 35h    5
c753  1F           ?? 1Fh
c754  38           ?? 38h    8
c755  1F           ?? 1Fh
c756  35           ?? 35h    5
c757  0F           ?? 0Fh
c758  31           ?? 31h    1
c759  0F           ?? 0Fh
c75a  34           ?? 34h    4
c75b  0F           ?? 0Fh
c75c  31           ?? 31h    1
c75d  07           ?? 07h
c75e  34           ?? 34h    4
c75f  07           ?? 07h
c760  FF           ?? FFh
c761  41           ?? 41h    A
c762  01           ?? 01h
c763  3A           ?? 3Ah    :
c764  01           ?? 01h
c765  3D           ?? 3Dh    =
c766  01           ?? 01h
c767  41           ?? 41h    A
c768  01           ?? 01h
c769  47           ?? 47h    G
c76a  01           ?? 01h
c76b  3A           ?? 3Ah    :
c76c  01           ?? 01h
c76d  46           ?? 46h    F
c76e  01           ?? 01h
c76f  44           ?? 44h    D
c770  03           ?? 03h
c771  3A           ?? 3Ah    :
c772  01           ?? 01h
c773  3D           ?? 3Dh    =
c774  01           ?? 01h
c775  3F           ?? 3Fh    ?
c776  01           ?? 01h
c777  44           ?? 44h    D
c778  01           ?? 01h
c779  3A           ?? 3Ah    :
c77a  01           ?? 01h
c77b  42           ?? 42h    B
c77c  01           ?? 01h
c77d  41           ?? 41h    A
c77e  01           ?? 01h
c77f  FF           ?? FFh
c780  87           ?? 87h
c781  3D           ?? 3Dh    =
c782  01           ?? 01h
c783  36           ?? 36h    6
c784  01           ?? 01h
c785  3D           ?? 3Dh    =
c786  01           ?? 01h
c787  41           ?? 41h    A
c788  01           ?? 01h
c789  44           ?? 44h    D
c78a  01           ?? 01h
c78b  36           ?? 36h    6
c78c  01           ?? 01h
c78d  42           ?? 42h    B
c78e  01           ?? 01h
c78f  41           ?? 41h    A
c790  01           ?? 01h
c791  42           ?? 42h    B
c792  01           ?? 01h
c793  36           ?? 36h    6
c794  01           ?? 01h
c795  3D           ?? 3Dh    =
c796  01           ?? 01h
c797  42           ?? 42h    B
c798  01           ?? 01h
c799  45           ?? 45h    E
c79a  01           ?? 01h
c79b  36           ?? 36h    6
c79c  01           ?? 01h
c79d  44           ?? 44h    D
c79e  01           ?? 01h
c79f  42           ?? 42h    B
c7a0  01           ?? 01h
c7a1  FF           ?? FFh
c7a2  80           ?? 80h
c7a3  3F           ?? 3Fh    ?
c7a4  0B           ?? 0Bh
c7a5  3D           ?? 3Dh    =
c7a6  01           ?? 01h
c7a7  3F           ?? 3Fh    ?
c7a8  01           ?? 01h
c7a9  3D           ?? 3Dh    =
c7aa  0B           ?? 0Bh
c7ab  3C           ?? 3Ch    <
c7ac  01           ?? 01h
c7ad  3D           ?? 3Dh    =
c7ae  01           ?? 01h
c7af  3F           ?? 3Fh    ?
c7b0  07           ?? 07h
c7b1  41           ?? 41h    A
c7b2  07           ?? 07h
c7b3  42           ?? 42h    B
c7b4  07           ?? 07h
c7b5  44           ?? 44h    D
c7b6  07           ?? 07h
c7b7  FF           ?? FFh
c7b8  46           ?? 46h    F
c7b9  03           ?? 03h
c7ba  45           ?? 45h    E
c7bb  07           ?? 07h
c7bc  41           ?? 41h    A
c7bd  07           ?? 07h
c7be  44           ?? 44h    D
c7bf  07           ?? 07h
c7c0  3F           ?? 3Fh    ?
c7c1  03           ?? 03h
c7c2  41           ?? 41h    A
c7c3  03           ?? 03h
c7c4  42           ?? 42h    B
c7c5  0F           ?? 0Fh
c7c6  63           ?? 63h    c
c7c7  36           ?? 36h    6
c7c8  03           ?? 03h
c7c9  3A           ?? 3Ah    :
c7ca  03           ?? 03h
c7cb  3F           ?? 3Fh    ?
c7cc  03           ?? 03h
c7cd  FF           ?? FFh
c7ce  87           ?? 87h
c7cf  3F           ?? 3Fh    ?
c7d0  01           ?? 01h
c7d1  3A           ?? 3Ah    :
c7d2  01           ?? 01h
c7d3  3F           ?? 3Fh    ?
c7d4  01           ?? 01h
c7d5  41           ?? 41h    A
c7d6  01           ?? 01h
c7d7  44           ?? 44h    D
c7d8  01           ?? 01h
c7d9  3A           ?? 3Ah    :
c7da  01           ?? 01h
c7db  42           ?? 42h    B
c7dc  01           ?? 01h
c7dd  41           ?? 41h    A
c7de  03           ?? 03h
c7df  3A           ?? 3Ah    :
c7e0  01           ?? 01h
c7e1  3F           ?? 3Fh    ?
c7e2  01           ?? 01h
c7e3  41           ?? 41h    A
c7e4  01           ?? 01h
c7e5  42           ?? 42h    B
c7e6  01           ?? 01h
c7e7  3A           ?? 3Ah    :
c7e8  01           ?? 01h
c7e9  41           ?? 41h    A
c7ea  01           ?? 01h
c7eb  3F           ?? 3Fh    ?
c7ec  01           ?? 01h
c7ed  FF           ?? FFh
c7ee  35           ?? 35h    5
c7ef  1F           ?? 1Fh
c7f0  38           ?? 38h    8
c7f1  1F           ?? 1Fh
c7f2  36           ?? 36h    6
c7f3  0F           ?? 0Fh
c7f4  33           ?? 33h    3
c7f5  0F           ?? 0Fh
c7f6  38           ?? 38h    8
c7f7  0F           ?? 0Fh
c7f8  3A           ?? 3Ah    :
c7f9  07           ?? 07h
c7fa  3F           ?? 3Fh    ?
c7fb  07           ?? 07h
c7fc  FF           ?? FFh
c7fd  41           ?? 41h    A
c7fe  01           ?? 01h
c7ff  3A           ?? 3Ah    :
c800  01           ?? 01h
c801  3D           ?? 3Dh    =
c802  01           ?? 01h
c803  41           ?? 41h    A
c804  01           ?? 01h
c805  42           ?? 42h    B
c806  01           ?? 01h
c807  3A           ?? 3Ah    :
c808  01           ?? 01h
c809  41           ?? 41h    A
c80a  01           ?? 01h
c80b  3F           ?? 3Fh    ?
c80c  03           ?? 03h
c80d  3A           ?? 3Ah    :
c80e  01           ?? 01h
c80f  3D           ?? 3Dh    =
c810  01           ?? 01h
c811  3F           ?? 3Fh    ?
c812  01           ?? 01h
c813  41           ?? 41h    A
c814  01           ?? 01h
c815  3A           ?? 3Ah    :
c816  01           ?? 01h
c817  3F           ?? 3Fh    ?
c818  01           ?? 01h
c819  3D           ?? 3Dh    =
c81a  01           ?? 01h
c81b  FF           ?? FFh
c81c  85           ?? 85h
c81d  3F           ?? 3Fh    ?
c81e  1F           ?? 1Fh
c81f  FF           ?? FFh
c820  87           ?? 87h
c821  47           ?? 47h    G
c822  01           ?? 01h
c823  3B           ?? 3Bh    ;
c824  01           ?? 01h
c825  40           ?? 40h    @
c826  01           ?? 01h
c827  47           ?? 47h    G
c828  01           ?? 01h
c829  48           ?? 48h    H
c82a  01           ?? 01h
c82b  3B           ?? 3Bh    ;
c82c  01           ?? 01h
c82d  47           ?? 47h    G
c82e  01           ?? 01h
c82f  44           ?? 44h    D
c830  01           ?? 01h
c831  47           ?? 47h    G
c832  01           ?? 01h
c833  3B           ?? 3Bh    ;
c834  01           ?? 01h
c835  40           ?? 40h    @
c836  01           ?? 01h
c837  45           ?? 45h    E
c838  01           ?? 01h
c839  47           ?? 47h    G
c83a  01           ?? 01h
c83b  3B           ?? 3Bh    ;
c83c  01           ?? 01h
c83d  44           ?? 44h    D
c83e  01           ?? 01h
c83f  45           ?? 45h    E
c840  01           ?? 01h
c841  FF           ?? FFh
c842  85           ?? 85h
c843  44           ?? 44h    D
c844  1F           ?? 1Fh
c845  FF           ?? FFh
c846  46           ?? 46h    F
c847  0F           ?? 0Fh
c848  47           ?? 47h    G
c849  0F           ?? 0Fh
c84a  42           ?? 42h    B
c84b  0F           ?? 0Fh
c84c  44           ?? 44h    D
c84d  07           ?? 07h
c84e  44           ?? 44h    D
c84f  67           ?? 67h    g
c850  D0           ?? D0h
c851  FF           ?? FFh
c852  3F           ?? 3Fh    ?
c853  5F           ?? 5Fh    _
c854  7F           ?? 7Fh    
c855  FF           ?? FFh
c856  84           ?? 84h
c857  2E           ?? 2Eh    .
c858  0B           ?? 0Bh
c859  33           ?? 33h    3
c85a  01           ?? 01h
c85b  35           ?? 35h    5
c85c  01           ?? 01h
c85d  36           ?? 36h    6
c85e  03           ?? 03h
c85f  38           ?? 38h    8
c860  03           ?? 03h
c861  3A           ?? 3Ah    :
c862  03           ?? 03h
c863  3B           ?? 3Bh    ;
c864  03           ?? 03h
c865  3A           ?? 3Ah    :
c866  03           ?? 03h
c867  33           ?? 33h    3
c868  03           ?? 03h
c869  3A           ?? 3Ah    :
c86a  03           ?? 03h
c86b  3B           ?? 3Bh    ;
c86c  03           ?? 03h
c86d  3F           ?? 3Fh    ?
c86e  03           ?? 03h
c86f  41           ?? 41h    A
c870  03           ?? 03h
c871  42           ?? 42h    B
c872  03           ?? 03h
c873  FF           ?? FFh
c874  44           ?? 44h    D
c875  03           ?? 03h
c876  41           ?? 41h    A
c877  07           ?? 07h
c878  3C           ?? 3Ch    <
c879  07           ?? 07h
c87a  3F           ?? 3Fh    ?
c87b  07           ?? 07h
c87c  3A           ?? 3Ah    :
c87d  01           ?? 01h
c87e  3A           ?? 3Ah    :
c87f  63           ?? 63h    c
c880  1A           ?? 1Ah
c881  00           ?? 00h
c882  3B           ?? 3Bh    ;
c883  23           ?? 23h    #
c884  E0           ?? E0h
c885  FF           ?? FFh
c886  3A           ?? 3Ah    :
c887  55           ?? 55h    U
c888  88           ?? 88h
c889  0F           ?? 0Fh
c88a  03           ?? 03h
c88b  0F           ?? 0Fh
c88c  03           ?? 03h
c88d  FF           ?? FFh
c88e  7F           ?? 7Fh    
c88f  FF           ?? FFh
c890  81           ?? 81h
c891  24           ?? 24h    $
c892  83           ?? 83h
c893  00           ?? 00h
c894  00           ?? 00h
c895  24           ?? 24h    $
c896  03           ?? 03h
c897  86           ?? 86h
c898  24           ?? 24h    $
c899  03           ?? 03h
c89a  90           ?? 90h
c89b  30           ?? 30h    0
c89c  01           ?? 01h
c89d  30           ?? 30h    0
c89e  01           ?? 01h
c89f  81           ?? 81h
c8a0  30           ?? 30h    0
c8a1  03           ?? 03h
c8a2  86           ?? 86h
c8a3  26           ?? 26h    &
c8a4  01           ?? 01h
c8a5  26           ?? 26h    &
c8a6  01           ?? 01h
c8a7  24           ?? 24h    $
c8a8  01           ?? 01h
c8a9  90           ?? 90h
c8aa  32           ?? 32h    2
c8ab  01           ?? 01h
c8ac  30           ?? 30h    0
c8ad  01           ?? 01h
c8ae  30           ?? 30h    0
c8af  01           ?? 01h
c8b0  FF           ?? FFh
c8b1  83           ?? 83h
c8b2  14           ?? 14h
c8b3  07           ?? 07h
c8b4  20           ?? 20h     
c8b5  07           ?? 07h
c8b6  14           ?? 14h
c8b7  07           ?? 07h
c8b8  20           ?? 20h     
c8b9  07           ?? 07h
c8ba  FF           ?? FFh
c8bb  82           ?? 82h
c8bc  47           ?? 47h    G
c8bd  9F           ?? 9Fh
c8be  1A           ?? 1Ah
c8bf  14           ?? 14h
c8c0  47           ?? 47h    G
c8c1  1F           ?? 1Fh
c8c2  FF           ?? FFh
c8c3  81           ?? 81h
c8c4  30           ?? 30h    0
c8c5  83           ?? 83h
c8c6  00           ?? 00h
c8c7  00           ?? 00h
c8c8  30           ?? 30h    0
c8c9  03           ?? 03h
c8ca  82           ?? 82h
c8cb  20           ?? 20h     
c8cc  87           ?? 87h
c8cd  1A           ?? 1Ah
c8ce  14           ?? 14h
c8cf  90           ?? 90h
c8d0  32           ?? 32h    2
c8d1  81           ?? 81h
c8d2  1A           ?? 1Ah
c8d3  00           ?? 00h
c8d4  32           ?? 32h    2
c8d5  01           ?? 01h
c8d6  30           ?? 30h    0
c8d7  03           ?? 03h
c8d8  81           ?? 81h
c8d9  30           ?? 30h    0
c8da  03           ?? 03h
c8db  30           ?? 30h    0
c8dc  03           ?? 03h
c8dd  81           ?? 81h
c8de  30           ?? 30h    0
c8df  03           ?? 03h
c8e0  30           ?? 30h    0
c8e1  03           ?? 03h
c8e2  82           ?? 82h
c8e3  20           ?? 20h     
c8e4  87           ?? 87h
c8e5  1A           ?? 1Ah
c8e6  14           ?? 14h
c8e7  90           ?? 90h
c8e8  32           ?? 32h    2
c8e9  81           ?? 81h
c8ea  00           ?? 00h
c8eb  00           ?? 00h
c8ec  32           ?? 32h    2
c8ed  01           ?? 01h
c8ee  32           ?? 32h    2
c8ef  03           ?? 03h
c8f0  30           ?? 30h    0
c8f1  03           ?? 03h
c8f2  30           ?? 30h    0
c8f3  03           ?? 03h
c8f4  FF           ?? FFh
c8f5  83           ?? 83h
c8f6  12           ?? 12h
c8f7  03           ?? 03h
c8f8  1E           ?? 1Eh
c8f9  03           ?? 03h
c8fa  2A           ?? 2Ah    *
c8fb  03           ?? 03h
c8fc  1E           ?? 1Eh
c8fd  03           ?? 03h
c8fe  12           ?? 12h
c8ff  03           ?? 03h
c900  1E           ?? 1Eh
c901  03           ?? 03h
c902  2A           ?? 2Ah    *
c903  03           ?? 03h
c904  1E           ?? 1Eh
c905  03           ?? 03h
c906  FF           ?? FFh
c907  87           ?? 87h
c908  3F           ?? 3Fh    ?
c909  01           ?? 01h
c90a  3A           ?? 3Ah    :
c90b  01           ?? 01h
c90c  3F           ?? 3Fh    ?
c90d  01           ?? 01h
c90e  41           ?? 41h    A
c90f  01           ?? 01h
c910  47           ?? 47h    G
c911  01           ?? 01h
c912  3A           ?? 3Ah    :
c913  01           ?? 01h
c914  46           ?? 46h    F
c915  01           ?? 01h
c916  44           ?? 44h    D
c917  03           ?? 03h
c918  3A           ?? 3Ah    :
c919  01           ?? 01h
c91a  3F           ?? 3Fh    ?
c91b  01           ?? 01h
c91c  41           ?? 41h    A
c91d  01           ?? 01h
c91e  46           ?? 46h    F
c91f  01           ?? 01h
c920  3A           ?? 3Ah    :
c921  01           ?? 01h
c922  44           ?? 44h    D
c923  01           ?? 01h
c924  42           ?? 42h    B
c925  01           ?? 01h
c926  FF           ?? FFh
c927  33           ?? 33h    3
c928  03           ?? 03h
c929  35           ?? 35h    5
c92a  01           ?? 01h
c92b  38           ?? 38h    8
c92c  01           ?? 01h
c92d  01           ?? 01h
c92e  01           ?? 01h
c92f  08           ?? 08h
c930  00           ?? 00h
c931  2E           ?? 2Eh    .
c932  00           ?? 00h
c933  0A           ?? 0Ah
c934  00           ?? 00h
c935  0B           ?? 0Bh
c936  00           ?? 00h
c937  01           ?? 01h
c938  00           ?? 00h
c939  08           ?? 08h
c93a  00           ?? 00h
c93b  2E           ?? 2Eh    .
c93c  00           ?? 00h
c93d  0A           ?? 0Ah
c93e  00           ?? 00h
c93f  0B           ?? 0Bh
c940  00           ?? 00h
c941  0A           ?? 0Ah
c942  00           ?? 00h
c943  0C           ?? 0Ch
c944  00           ?? 00h
c945  28           ?? 28h    (
c946  00           ?? 00h
c947  11           ?? 11h
c948  02           ?? 02h
c949  12           ?? 12h
c94a  00           ?? 00h
c94b  15           ?? 15h
c94c  01           ?? 01h
c94d  16           ?? 16h
c94e  00           ?? 00h
c94f  17           ?? 17h
c950  00           ?? 00h
c951  15           ?? 15h
c952  01           ?? 01h
c953  16           ?? 16h
c954  00           ?? 00h
c955  17           ?? 17h
c956  00           ?? 00h
c957  1B           ?? 1Bh
c958  01           ?? 01h
c959  1C           ?? 1Ch
c95a  00           ?? 00h
c95b  17           ?? 17h
c95c  50           ?? 50h    P
c95d  1E           ?? 1Eh
c95e  00           ?? 00h
c95f  17           ?? 17h
c960  50           ?? 50h    P
c961  1E           ?? 1Eh
c962  00           ?? 00h
c963  17           ?? 17h
c964  60           ?? 60h    `
c965  22           ?? 22h    "
c966  00           ?? 00h
c967  17           ?? 17h
c968  60           ?? 60h    `
c969  22           ?? 22h    "
c96a  00           ?? 00h
c96b  17           ?? 17h
c96c  50           ?? 50h    P
c96d  01           ?? 01h
c96e  01           ?? 01h
c96f  08           ?? 08h
c970  00           ?? 00h
c971  2E           ?? 2Eh    .
c972  00           ?? 00h
c973  0A           ?? 0Ah
c974  00           ?? 00h
c975  0B           ?? 0Bh
c976  00           ?? 00h
c977  0A           ?? 0Ah
c978  00           ?? 00h
c979  0C           ?? 0Ch
c97a  00           ?? 00h
c97b  15           ?? 15h
c97c  C1           ?? C1h
c97d  16           ?? 16h
c97e  C0           ?? C0h
c97f  17           ?? 17h
c980  C0           ?? C0h
c981  1B           ?? 1Bh
c982  C1           ?? C1h
c983  1C           ?? 1Ch
c984  C0           ?? C0h
c985  1D           ?? 1Dh
c986  C0           ?? C0h
c987  1E           ?? 1Eh
c988  C1           ?? C1h
c989  22           ?? 22h    "
c98a  C0           ?? C0h
c98b  17           ?? 17h
c98c  C0           ?? C0h
c98d  1E           ?? 1Eh
c98e  C1           ?? C1h
c98f  22           ?? 22h    "
c990  C0           ?? C0h
c991  1D           ?? 1Dh
c992  C0           ?? C0h
c993  2F           ?? 2Fh    /
c994  02           ?? 02h
c995  12           ?? 12h
c996  00           ?? 00h
c997  30           ?? 30h    0
c998  00           ?? 00h
c999  FF           ?? FFh
c99a  32           ?? 32h    2
c99b  03           ?? 03h
c99c  37           ?? 37h    7
c99d  00           ?? 00h
c99e  05           ?? 05h
c99f  01           ?? 01h
c9a0  05           ?? 05h
c9a1  30           ?? 30h    0
c9a2  05           ?? 05h
c9a3  20           ?? 20h     
c9a4  05           ?? 05h
c9a5  71           ?? 71h    q
c9a6  05           ?? 05h
c9a7  21           ?? 21h    !
c9a8  05           ?? 05h
c9a9  71           ?? 71h    q
c9aa  05           ?? 05h
c9ab  21           ?? 21h    !
c9ac  05           ?? 05h
c9ad  00           ?? 00h
c9ae  05           ?? 05h
c9af  30           ?? 30h    0
c9b0  07           ?? 07h
c9b1  00           ?? 00h
c9b2  05           ?? 05h
c9b3  73           ?? 73h    s
c9b4  09           ?? 09h
c9b5  00           ?? 00h
c9b6  05           ?? 05h
c9b7  72           ?? 72h    r
c9b8  05           ?? 05h
c9b9  21           ?? 21h    !
c9ba  05           ?? 05h
c9bb  00           ?? 00h
c9bc  05           ?? 05h
c9bd  30           ?? 30h    0
c9be  07           ?? 07h
c9bf  00           ?? 00h
c9c0  05           ?? 05h
c9c1  73           ?? 73h    s
c9c2  09           ?? 09h
c9c3  00           ?? 00h
c9c4  05           ?? 05h
c9c5  72           ?? 72h    r
c9c6  09           ?? 09h
c9c7  00           ?? 00h
c9c8  05           ?? 05h
c9c9  70           ?? 70h    p
c9ca  0D           ?? 0Dh
c9cb  00           ?? 00h
c9cc  05           ?? 05h
c9cd  70           ?? 70h    p
c9ce  0E           ?? 0Eh
c9cf  00           ?? 00h
c9d0  05           ?? 05h
c9d1  40           ?? 40h    @
c9d2  05           ?? 05h
c9d3  20           ?? 20h     
c9d4  05           ?? 05h
c9d5  40           ?? 40h    @
c9d6  10           ?? 10h
c9d7  02           ?? 02h
c9d8  13           ?? 13h
c9d9  00           ?? 00h
c9da  26           ?? 26h    &
c9db  91           ?? 91h
c9dc  26           ?? 26h    &
c9dd  40           ?? 40h    @
c9de  1A           ?? 1Ah
c9df  00           ?? 00h
c9e0  26           ?? 26h    &
c9e1  91           ?? 91h
c9e2  26           ?? 26h    &
c9e3  40           ?? 40h    @
c9e4  1A           ?? 1Ah
c9e5  00           ?? 00h
c9e6  26           ?? 26h    &
c9e7  91           ?? 91h
c9e8  26           ?? 26h    &
c9e9  40           ?? 40h    @
c9ea  1A           ?? 1Ah
c9eb  00           ?? 00h
c9ec  26           ?? 26h    &
c9ed  00           ?? 00h
c9ee  1F           ?? 1Fh
c9ef  00           ?? 00h
c9f0  26           ?? 26h    &
c9f1  00           ?? 00h
c9f2  1A           ?? 1Ah
c9f3  10           ?? 10h
c9f4  26           ?? 26h    &
c9f5  A0           ?? A0h
c9f6  24           ?? 24h    $
c9f7  00           ?? 00h
c9f8  26           ?? 26h    &
c9f9  A0           ?? A0h
c9fa  25           ?? 25h    %
c9fb  00           ?? 00h
c9fc  2C           ?? 2Ch    ,
c9fd  71           ?? 71h    q
c9fe  2C           ?? 2Ch    ,
c9ff  21           ?? 21h    !
ca00  2C           ?? 2Ch    ,
ca01  71           ?? 71h    q
ca02  2C           ?? 2Ch    ,
ca03  21           ?? 21h    !
ca04  2C           ?? 2Ch    ,
ca05  00           ?? 00h
ca06  2C           ?? 2Ch    ,
ca07  30           ?? 30h    0
ca08  07           ?? 07h
ca09  00           ?? 00h
ca0a  2C           ?? 2Ch    ,
ca0b  73           ?? 73h    s
ca0c  09           ?? 09h
ca0d  00           ?? 00h
ca0e  2C           ?? 2Ch    ,
ca0f  72           ?? 72h    r
ca10  09           ?? 09h
ca11  00           ?? 00h
ca12  2C           ?? 2Ch    ,
ca13  72           ?? 72h    r
ca14  2C           ?? 2Ch    ,
ca15  20           ?? 20h     
ca16  2C           ?? 2Ch    ,
ca17  00           ?? 00h
ca18  2C           ?? 2Ch    ,
ca19  71           ?? 71h    q
ca1a  2C           ?? 2Ch    ,
ca1b  20           ?? 20h     
ca1c  2C           ?? 2Ch    ,
ca1d  00           ?? 00h
ca1e  2C           ?? 2Ch    ,
ca1f  A1           ?? A1h
ca20  2C           ?? 2Ch    ,
ca21  80           ?? 80h
ca22  2C           ?? 2Ch    ,
ca23  00           ?? 00h
ca24  2C           ?? 2Ch    ,
ca25  A1           ?? A1h
ca26  2C           ?? 2Ch    ,
ca27  80           ?? 80h
ca28  2C           ?? 2Ch    ,
ca29  20           ?? 20h     
ca2a  2C           ?? 2Ch    ,
ca2b  50           ?? 50h    P
ca2c  2C           ?? 2Ch    ,
ca2d  30           ?? 30h    0
ca2e  2C           ?? 2Ch    ,
ca2f  20           ?? 20h     
ca30  2C           ?? 2Ch    ,
ca31  10           ?? 10h
ca32  2C           ?? 2Ch    ,
ca33  50           ?? 50h    P
ca34  2C           ?? 2Ch    ,
ca35  30           ?? 30h    0
ca36  2C           ?? 2Ch    ,
ca37  20           ?? 20h     
ca38  2C           ?? 2Ch    ,
ca39  10           ?? 10h
ca3a  2C           ?? 2Ch    ,
ca3b  50           ?? 50h    P
ca3c  2C           ?? 2Ch    ,
ca3d  30           ?? 30h    0
ca3e  2C           ?? 2Ch    ,
ca3f  20           ?? 20h     
ca40  2C           ?? 2Ch    ,
ca41  10           ?? 10h
ca42  2C           ?? 2Ch    ,
ca43  50           ?? 50h    P
ca44  2C           ?? 2Ch    ,
ca45  31           ?? 31h    1
ca46  2C           ?? 2Ch    ,
ca47  20           ?? 20h     
ca48  05           ?? 05h
ca49  73           ?? 73h    s
ca4a  FF           ?? FFh
ca4b  34           ?? 34h    4
ca4c  03           ?? 03h
ca4d  36           ?? 36h    6
ca4e  01           ?? 01h
ca4f  39           ?? 39h    9
ca50  01           ?? 01h
ca51  04           ?? 04h
ca52  0F           ?? 0Fh
ca53  04           ?? 04h
ca54  0B           ?? 0Bh
ca55  14           ?? 14h
ca56  0E           ?? 0Eh
ca57  27           ?? 27h    '
ca58  09           ?? 09h
ca59  2B           ?? 2Bh    +
ca5a  0F           ?? 0Fh
ca5b  2B           ?? 2Bh    +
ca5c  0F           ?? 0Fh
ca5d  2B           ?? 2Bh    +
ca5e  0F           ?? 0Fh
ca5f  2B           ?? 2Bh    +
ca60  05           ?? 05h
ca61  31           ?? 31h    1
ca62  01           ?? 01h
ca63  FF           ?? FFh
ca64  43           ?? 43h    C
ca65  BC           ?? BCh
ca66  00           ?? 00h
ca67  41           ?? 41h    A
ca68  00           ?? 00h
ca69  00           ?? 00h
ca6a  FE           ?? FEh
ca6b  81           ?? 81h
ca6c  DF           ?? DFh
ca6d  00           ?? 00h
ca6e  41           ?? 41h    A
ca6f  9F           ?? 9Fh
ca70  00           ?? 00h
ca71  80           ?? 80h
ca72  C8           ?? C8h
ca73  00           ?? 00h
ca74  40           ?? 40h    @
ca75  9F           ?? 9Fh
ca76  00           ?? 00h
ca77  10           ?? 10h
ca78  9F           ?? 9Fh
ca79  00           ?? 00h
ca7a  FE           ?? FEh
ca7b  81           ?? 81h
ca7c  C3           ?? C3h
ca7d  00           ?? 00h
ca7e  15           ?? 15h
ca7f  00           ?? 00h
ca80  00           ?? 00h
ca81  FF           ?? FFh
ca82  81           ?? 81h
ca83  DF           ?? DFh
ca84  00           ?? 00h
ca85  11           ?? 11h
ca86  00           ?? 00h
ca87  00           ?? 00h
ca88  40           ?? 40h    @
ca89  05           ?? 05h
ca8a  00           ?? 00h
ca8b  80           ?? 80h
ca8c  DF           ?? DFh
ca8d  00           ?? 00h
ca8e  80           ?? 80h
ca8f  B3           ?? B3h
ca90  00           ?? 00h
ca91  80           ?? 80h
ca92  C0           ?? C0h
ca93  00           ?? 00h
ca94  80           ?? 80h
ca95  AE           ?? AEh
ca96  00           ?? 00h
ca97  10           ?? 10h
ca98  05           ?? 05h
ca99  00           ?? 00h
ca9a  FE           ?? FEh
ca9b  41           ?? 41h    A
ca9c  00           ?? 00h
ca9d  00           ?? 00h
ca9e  43           ?? 43h    C
ca9f  00           ?? 00h
caa0  00           ?? 00h
caa1  10           ?? 10h
caa2  00           ?? 00h
caa3  00           ?? 00h
caa4  FE           ?? FEh
caa5  11           ?? 11h
caa6  36           ?? 36h    6
caa7  00           ?? 00h
caa8  81           ?? 81h
caa9  32           ?? 32h    2
caaa  00           ?? 00h
caab  11           ?? 11h
caac  36           ?? 36h    6
caad  00           ?? 00h
caae  40           ?? 40h    @
caaf  34           ?? 34h    4
cab0  00           ?? 00h
cab1  80           ?? 80h
cab2  32           ?? 32h    2
cab3  00           ?? 00h
cab4  80           ?? 80h
cab5  25           ?? 25h    %
cab6  00           ?? 00h
cab7  80           ?? 80h
cab8  2D           ?? 2Dh    -
cab9  00           ?? 00h
caba  40           ?? 40h    @
cabb  34           ?? 34h    4
cabc  00           ?? 00h
cabd  FE           ?? FEh
cabe  11           ?? 11h
cabf  00           ?? 00h
cac0  00           ?? 00h
cac1  11           ?? 11h
cac2  00           ?? 00h
cac3  00           ?? 00h
cac4  11           ?? 11h
cac5  00           ?? 00h
cac6  00           ?? 00h
cac7  21           ?? 21h    !
cac8  00           ?? 00h
cac9  00           ?? 00h
caca  FE           ?? FEh
cacb  11           ?? 11h
cacc  00           ?? 00h
cacd  00           ?? 00h
cace  15           ?? 15h
cacf  A4           ?? A4h
cad0  00           ?? 00h
cad1  11           ?? 11h
cad2  00           ?? 00h
cad3  00           ?? 00h
cad4  FE           ?? FEh
cad5  81           ?? 81h
cad6  DF           ?? DFh
cad7  00           ?? 00h
cad8  41           ?? 41h    A
cad9  00           ?? 00h
cada  00           ?? 00h
cadb  81           ?? 81h
cadc  C8           ?? C8h
cadd  00           ?? 00h
cade  41           ?? 41h    A
cadf  00           ?? 00h
cae0  00           ?? 00h
cae1  FE           ?? FEh
cae2  C4           ?? C4h
cae3  C6           ?? C6h
cae4  C6           ?? C6h
cae5  C6           ?? C6h
cae6  C6           ?? C6h
cae7  C8           ?? C8h
cae8  C6           ?? C6h
cae9  C5           ?? C5h
caea  C7           ?? C7h
caeb  C5           ?? C5h
caec  C8           ?? C8h
caed  C8           ?? C8h
caee  C7           ?? C7h
caef  C5           ?? C5h
caf0  C5           ?? C5h
caf1  C6           ?? C6h
caf2  C5           ?? C5h
caf3  C7           ?? C7h
caf4  C7           ?? C7h
caf5  C5           ?? C5h
caf6  C6           ?? C6h
caf7  C7           ?? C7h
caf8  C7           ?? C7h
caf9  C8           ?? C8h
cafa  C6           ?? C6h
cafb  C6           ?? C6h
cafc  C5           ?? C5h
cafd  C9           ?? C9h
cafe  C7           ?? C7h
caff  C8           ?? C8h
cb00  C7           ?? C7h
cb01  C6           ?? C6h
cb02  C8           ?? C8h
cb03  C6           ?? C6h
cb04  C8           ?? C8h
cb05  C6           ?? C6h
cb06  C6           ?? C6h
cb07  C6           ?? C6h
cb08  C8           ?? C8h
cb09  C8           ?? C8h
cb0a  C7           ?? C7h
cb0b  C6           ?? C6h
cb0c  C6           ?? C6h
cb0d  C8           ?? C8h
cb0e  C5           ?? C5h
cb0f  C6           ?? C6h
cb10  C8           ?? C8h
cb11  C4           ?? C4h
cb12  C4           ?? C4h
cb13  C6           ?? C6h
cb14  C5           ?? C5h
cb15  C4           ?? C4h
cb16  C8           ?? C8h
cb17  C6           ?? C6h
cb18  C6           ?? C6h
cb19  C5           ?? C5h
cb1a  C4           ?? C4h
cb1b  C6           ?? C6h
cb1c  00           ?? 00h
cb1d  F9           ?? F9h
cb1e  FD           ?? FDh
cb1f  41           ?? 41h    A
cb20  3F           ?? 3Fh    ?
cb21  8F           ?? 8Fh
cb22  B1           ?? B1h
cb23  43           ?? 43h    C
cb24  C3           ?? C3h
cb25  A2           ?? A2h
cb26  D5           ?? D5h
cb27  56           ?? 56h    V
cb28  74           ?? 74h    t
cb29  B8           ?? B8h
cb2a  DF           ?? DFh
cb2b  E8           ?? E8h
cb2c  3D           ?? 3Dh    =
cb2d  27           ?? 27h    '
cb2e  51           ?? 51h    Q
cb2f  EE           ?? EEh
cb30  68           ?? 68h    h
cb31  9F           ?? 9Fh
cb32  CE           ?? CEh
cb33  FD           ?? FDh
cb34  1C           ?? 1Ch
cb35  3B           ?? 3Bh    ;
cb36  39           ?? 39h    9
cb37  F1           ?? F1h
cb38  07           ?? 07h
cb39  61           ?? 61h    a
cb3a  42           ?? 42h    B
cb3b  80           ?? 80h
cb3c  02           ?? 02h
cb3d  8E           ?? 8Eh
cb3e  35           ?? 35h    5
cb3f  20           ?? 20h     
cb40  37           ?? 37h    7
cb41  13           ?? 13h
cb42  24           ?? 24h    $
cb43  F5           ?? F5h
cb44  C3           ?? C3h
cb45  22           ?? 22h    "
cb46  49           ?? 49h    I
cb47  47           ?? 47h    G
cb48  90           ?? 90h
cb49  A9           ?? A9h
cb4a  45           ?? 45h    E
cb4b  46           ?? 46h    F
cb4c  C7           ?? C7h
cb4d  FB           ?? FBh
cb4e  D1           ?? D1h
cb4f  04           ?? 04h
cb50  C1           ?? C1h
cb51  BB           ?? BBh
cb52  D9           ?? D9h
cb53  4B           ?? 4Bh    K
cb54  16           ?? 16h
cb55  D7           ?? D7h
cb56  5F           ?? 5Fh    _
cb57  00           ?? 00h
cb58  1A           ?? 1Ah
cb59  B9           ?? B9h
cb5a  41           ?? 41h    A
cb5b  8E           ?? 8Eh
cb5c  EE           ?? EEh
cb5d  42           ?? 42h    B
cb5e  60           ?? 60h    `
cb5f  34           ?? 34h    4
cb60  0C           ?? 0Ch
cb61  C9           ?? C9h
cb62  09           ?? 09h
cb63  08           ?? 08h
cb64  00           ?? 00h
cb65  0F           ?? 0Fh
cb66  A0           ?? A0h
cb67  92           ?? 92h
cb68  0C           ?? 0Ch
cb69  0A           ?? 0Ah
cb6a  15           ?? 15h
cb6b  08           ?? 08h
cb6c  00           ?? 00h
cb6d  00           ?? 00h
cb6e  00           ?? 00h
cb6f  01           ?? 01h
cb70  0C           ?? 0Ch
cb71  0A           ?? 0Ah
cb72  41           ?? 41h    A
cb73  00           ?? 00h
cb74  90           ?? 90h
cb75  00           ?? 00h
cb76  00           ?? 00h
cb77  40           ?? 40h    @
cb78  00           ?? 00h
cb79  CB           ?? CBh
cb7a  41           ?? 41h    A
cb7b  0B           ?? 0Bh
cb7c  FB           ?? FBh
cb7d  32           ?? 32h    2
cb7e  50           ?? 50h    P
cb7f  30           ?? 30h    0
cb80  08           ?? 08h
cb81  9A           ?? 9Ah
cb82  41           ?? 41h    A
cb83  8E           ?? 8Eh
cb84  48           ?? 48h    H
cb85  32           ?? 32h    2
cb86  40           ?? 40h    @
cb87  30           ?? 30h    0
cb88  08           ?? 08h
cb89  F8           ?? F8h
cb8a  09           ?? 09h
cb8b  08           ?? 08h
cb8c  A8           ?? A8h
cb8d  00           ?? 00h
cb8e  00           ?? 00h
cb8f  88           ?? 88h
cb90  0A           ?? 0Ah
cb91  99           ?? 99h
cb92  11           ?? 11h
cb93  80           ?? 80h
cb94  F0           ?? F0h
cb95  22           ?? 22h    "
cb96  20           ?? 20h     
cb97  56           ?? 56h    V
cb98  08           ?? 08h
cb99  F8           ?? F8h
cb9a  40           ?? 40h    @
cb9b  08           ?? 08h
cb9c  00           ?? 00h
cb9d  00           ?? 00h
cb9e  00           ?? 00h
cb9f  85           ?? 85h
cba0  0A           ?? 0Ah
cba1  98           ?? 98h
cba2  41           ?? 41h    A
cba3  04           ?? 04h
cba4  74           ?? 74h    t
cba5  62           ?? 62h    b
cba6  20           ?? 20h     
cba7  30           ?? 30h    0
cba8  09           ?? 09h
cba9  BA           ?? BAh
cbaa  41           ?? 41h    A
cbab  AE           ?? AEh
cbac  F8           ?? F8h
cbad  22           ?? 22h    "
cbae  40           ?? 40h    @
cbaf  37           ?? 37h    7
cbb0  0B           ?? 0Bh
cbb1  09           ?? 09h
cbb2  41           ?? 41h    A
cbb3  B2           ?? B2h
cbb4  80           ?? 80h
cbb5  00           ?? 00h
cbb6  00           ?? 00h
cbb7  40           ?? 40h    @
cbb8  0C           ?? 0Ch
cbb9  5A           ?? 5Ah    Z
cbba  11           ?? 11h
cbbb  81           ?? 81h
cbbc  00           ?? 00h
cbbd  02           ?? 02h
cbbe  70           ?? 70h    p
cbbf  13           ?? 13h
cbc0  0C           ?? 0Ch
cbc1  5A           ?? 5Ah    Z
cbc2  11           ?? 11h
cbc3  28           ?? 28h    (
cbc4  00           ?? 00h
cbc5  22           ?? 22h    "
cbc6  70           ?? 70h    p
cbc7  10           ?? 10h
cbc8  48           ?? 48h    H
cbc9  30           ?? 30h    0
cbca  51           ?? 51h    Q
cbcb  C0           ?? C0h
cbcc  00           ?? 00h
cbcd  00           ?? 00h
cbce  00           ?? 00h
cbcf  00           ?? 00h
cbd0  08           ?? 08h
cbd1  09           ?? 09h
cbd2  01           ?? 01h
cbd3  00           ?? 00h
cbd4  00           ?? 00h
cbd5  00           ?? 00h
cbd6  00           ?? 00h
cbd7  00           ?? 00h
cbd8  08           ?? 08h
cbd9  58           ?? 58h    X
cbda  41           ?? 41h    A
cbdb  08           ?? 08h
cbdc  00           ?? 00h
cbdd  00           ?? 00h
cbde  FF           ?? FFh
cbdf  19           ?? 19h
