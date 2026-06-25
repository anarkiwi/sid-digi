
/* WARNING: Possible PIC construction at 0xc028: Changing call to branch */
/* WARNING: Possible PIC construction at 0xc039: Changing call to branch */
/* WARNING: Possible PIC construction at 0xc0c0: Changing call to branch */
/* WARNING: Removing unreachable block (RAM,0xc02b) */
/* WARNING: Removing unreachable block (RAM,0xc225) */
/* WARNING: Removing unreachable block (RAM,0xc03c) */
/* WARNING: Removing unreachable block (RAM,0xc0dd) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry_C021(void)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  char cVar4;
  byte bVar5;
  bool bVar6;
  
  bVar2 = bRAMc0c6;
  bVar5 = 0;
  DAT_c090 = DAT_c090 + -1;
  if (-1 < DAT_c090) {
SUB_c226:
    DAT_00fc = bRAMc3d9;
    if ((bRAMc141 & 0x40) == 0) {
      _DAT_00fa = CONCAT11(DAT_00fb,*(undefined1 *)(bRAMc3d9 + 0xcb58));
      bRAMc144 = bRAMc141 & 0x40;
      (&SID_V1_SR)[bRAMc0c6] = *(undefined1 *)(bRAMc3d9 + 0xcb59);
      (&SID_V1_AD)[bVar2] = DAT_00fa;
      (&SID_V1_CTRL)[bVar2] = bRAMc084 & 0xfe;
      bRAMc084 = *(byte *)(DAT_00fc + 0xcb5a);
      uRAMc3dc = *(undefined1 *)(DAT_00fc + 0xcb5b);
      uRAMc29e = 0;
      cRAMc296 = '\x14';
      uRAMc0e0 = 0;
      uRAMc0e3 = 0;
      bRAMc14d = *(byte *)(DAT_00fc + 0xcb5d) >> 3;
      bRAMc141 = bRAMc141 | 0x40;
      bRAM00fd = *(byte *)(DAT_00fc + 0xcb5f);
      uRAMc3df = uRAMc3dc;
    }
    else {
      if (cRAMc262 == '\0') {
        cRAMc296 = cRAMc296 + -1;
        uRAMc29e = 0x20;
        SID_FC_HI = 0x20;
      }
      if ((bRAM00fd & 0xf) == 0) {
        bVar2 = bRAMc14d;
        if ((((bRAMc141 & 0x20) == 0) && ((bRAM00fd & 0x10) != 0)) &&
           (bVar2 = bRAMc14d - 1, (char)(bRAMc14d - 1) < '\0')) {
          if (((*(char *)((bRAMc2bd & 3) + 0xc2c3) != '\0') ||
              ((bVar3 = bRAMc0cc - *(byte *)(bRAMc3d9 + 0xcb5e), bVar2 = ~bRAMc0cc, bRAMc0cc = bVar3
               , ((*(byte *)(bRAMc3d9 + 0xcb5e) & (bVar2 | bVar3) | bVar3 & bVar2) & 0x80) == 0 &&
               (cRAMc0cf = cRAMc0cf + -1, cRAMc0cf == '\0')))) &&
             (bVar6 = CARRY1(bRAMc0cc,*(byte *)(bRAMc3d9 + 0xcb5e)),
             bRAMc0cc = bRAMc0cc + *(byte *)(bRAMc3d9 + 0xcb5e), bVar6)) {
            cRAMc0cf = cRAMc0cf + '\x01';
          }
          bRAMc0dd = bRAMc0dd + 1;
          bVar2 = bRAMc14d;
          if ((*(byte *)(bRAMc3d9 + 0xcb5d) & 0xf) == bRAMc0dd) {
            bRAMc0dd = 0;
            bRAMc2bd = bRAMc2bd + 1;
          }
        }
      }
      else {
        func_0xc3e5();
        bVar2 = bRAMc14d;
      }
      bRAMc14d = bVar2;
      DAT_00fc = *(byte *)(DAT_00fc + 0xcb5c);
      if ((*(byte *)(ushort)(byte)(bVar5 - 3) & 0x40) == 0) {
        if ((*(byte *)(ushort)(byte)(bVar5 - 3) & 0x20) != 0) {
          if (*(char *)(bVar5 + 0xc0e3) == '\0') {
            bVar1 = *(byte *)(bVar5 + 0xc3dc) - DAT_00fc;
            bVar2 = ~*(byte *)(bVar5 + 0xc3dc);
            bVar3 = DAT_00fc & (bVar2 | bVar1);
            *(byte *)(bVar5 + 0xc3dc) = bVar1;
            if (((bVar3 | bVar1 & bVar2) & 0x80) == 0) {
              *(char *)(bVar5 + 0xc3df) = *(char *)(bVar5 + 0xc3df) + -1;
            }
          }
          else {
            bVar6 = CARRY1(*(byte *)(bVar5 + 0xc3dc),DAT_00fc);
            *(byte *)(bVar5 + 0xc3dc) = *(byte *)(bVar5 + 0xc3dc) + DAT_00fc;
            if (bVar6) {
              *(char *)(bVar5 + 0xc3df) = *(char *)(bVar5 + 0xc3df) + '\x01';
            }
          }
          *(char *)(bVar5 + 0xc0e0) = *(char *)(bVar5 + 0xc0e0) + '\x01';
          if ((DAT_00fc & 0xf) == *(byte *)(bVar5 + 0xc0e0)) {
            *(undefined1 *)(bVar5 + 0xc0e0) = 0;
            *(byte *)(bVar5 + 0xc0e3) = *(byte *)(bVar5 + 0xc0e3) ^ 1;
          }
        }
      }
      else {
        bVar6 = CARRY1(DAT_00fc,*(byte *)(bVar5 + 0xc3dc));
        *(byte *)(bVar5 + 0xc3dc) = DAT_00fc + *(byte *)(bVar5 + 0xc3dc);
        *(byte *)(bVar5 + 0xc3df) = DAT_00fc + *(char *)(bVar5 + 0xc3df) + bVar6;
      }
    }
    bVar2 = *(byte *)(bVar5 + 0xc0c6);
    (&SID_V1_CTRL)[bVar2] = *(undefined1 *)(bVar5 + 0xc084);
    (&SID_V1_PW_HI)[bVar2] = *(undefined1 *)(bVar5 + 0xc3df);
    (&SID_V1_PW_LO)[bVar2] = *(undefined1 *)(bVar5 + 0xc3dc);
    if (((*(byte *)(bVar5 + 0xc141) & 0x20) != 0) &&
       (((*(byte *)(bVar5 + 0xc147) & 1) == 0 ||
        (bVar3 = *(byte *)(bVar5 + 0xc2b9) ^ 0xff, *(byte *)(bVar5 + 0xc2b9) = bVar3, bVar3 == 0))))
    {
      bVar3 = *(byte *)(bVar5 + 0xc3e2);
      bVar1 = *(byte *)(bVar5 + 0xc147);
      cVar4 = bVar3 + bVar1;
      *(char *)(bVar5 + 0xc3e2) = cVar4;
      (&SID_V1_FREQ_LO)[bVar2] = cVar4;
      cVar4 = *(char *)(bVar5 + 0xc2b6) + *(char *)(bVar5 + 0xc14a) + CARRY1(bVar3,bVar1);
      *(char *)(bVar5 + 0xc2b6) = cVar4;
      (&SID_V1_FREQ_HI)[bVar2] = cVar4;
      return;
    }
    (&SID_V1_FREQ_LO)[bVar2] = *(undefined1 *)(bVar5 + 0xc0cc);
    (&SID_V1_FREQ_HI)[bVar2] = *(undefined1 *)(bVar5 + 0xc0cf);
    return;
  }
  DAT_c090 = '\x03';
  bRAMc08a = bRAMc08a - 1;
  if (-1 < (char)bRAMc08a) goto SUB_c226;
  if (bRAMc08d != 0xfe) {
    _DAT_00fa = CONCAT11(*(undefined1 *)(bRAMc08d + 0xcae2),*(undefined1 *)(bRAMc08d + 0xcb1d));
    bRAMc08a = *(byte *)(_DAT_00fa + (ushort)bRAMc081);
    bVar2 = bRAMc081;
    if ((char)bRAMc08a < '\0') {
      if (0x9f < bRAMc08a) goto LAB_c187;
      bRAMc3d9 = bRAMc08a << 3;
      bRAMc08a = *(byte *)(_DAT_00fa + (ushort)(byte)(bRAMc081 + 1));
      bVar2 = bRAMc081 + 1;
    }
    if (bRAMc08a < 0x60) {
      DAT_00fc = bVar2 + 1;
      bRAMc0c9 = (bRAMc0e6 >> 4) + bRAMc08a;
      bRAMc0cc = *(byte *)(bRAMc0c9 + 0xc437);
      cRAMc0cf = *(char *)(bRAMc0c9 + 0xc1c5);
      bRAMc141 = *(byte *)(_DAT_00fa + (ushort)DAT_00fc);
      if ((char)*(byte *)(_DAT_00fa + (ushort)DAT_00fc) < '\0') {
        cRAMc262 = '\0';
        bRAMc266 = *(byte *)(_DAT_00fa + (ushort)(byte)(bVar2 + 2));
        cRAMc2a0 = (bRAMc266 & 0xf) * '\x02' + -0x10;
        bRAMc081 = bVar2 + 3;
        if (*(char *)(_DAT_00fa + (ushort)bRAMc081) == '\0') {
          SID_RESFILT = 0xf0;
        }
        else {
          SID_RESFILT = uRAMc2b3;
          cRAMc26b = *(char *)(_DAT_00fa + (ushort)bRAMc081);
        }
      }
      else {
        bRAMc081 = DAT_00fc;
        if ((*(byte *)(_DAT_00fa + (ushort)DAT_00fc) & 0x20) != 0) {
          uRAMc147 = *(undefined1 *)(_DAT_00fa + (ushort)(byte)(bVar2 + 2));
          bRAMc081 = bVar2 + 3;
          uRAMc14a = *(undefined1 *)(_DAT_00fa + (ushort)bRAMc081);
        }
      }
      uRAMc031 = 0xff;
      uRAMc2b9 = 0xff;
      bRAMc0dd = 0;
      bRAMc2bd = 0;
      cRAMc2b6 = cRAMc0cf;
      bRAMc3e2 = bRAMc0cc;
      bRAMc08a = bRAMc141;
LAB_c187:
      bRAMc08a = bRAMc08a & 0x1f;
      bRAMc081 = bRAMc081 + 1;
      if (*(char *)(_DAT_00fa + (ushort)bRAMc081) == -1) {
        bRAMc0e9 = bRAMc0e9 - 1;
        if ((char)bRAMc0e9 < '\0') {
          _DAT_00fa = CONCAT11(uRAMc4bc,uRAMc4b9);
          bRAMc087 = bRAMc087 + 2;
          if (*(char *)(_DAT_00fa + (ushort)bRAMc087) == -1) {
            bRAMc087 = 0;
          }
          bRAMc08d = *(byte *)(_DAT_00fa + (ushort)bRAMc087);
          bRAMc0e6 = *(byte *)(_DAT_00fa + (ushort)(byte)(bRAMc087 + 1));
          bRAMc0e9 = bRAMc0e6 & 0xf;
        }
        bRAMc081 = 0;
      }
      return;
    }
    bRAMc08a = bRAMc08a & 0x1f;
    uRAMc031 = 0xfe;
  }
  bRAMc084 = bRAMc084 & 0xfe;
  return;
}



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry_C048(void)

{
  byte bVar1;
  byte bVar2;
  
  SID_MODEVOL = 0x1f;
  SID_RESFILT = 0xf0;
  uRAMc262 = 0;
  bVar2 = 0xf;
  do {
    *(undefined1 *)(bVar2 + 0xc081) = 0;
    bVar2 = bVar2 - 1;
  } while (-1 < (char)bVar2);
  bVar2 = 2;
  do {
    _DAT_00fa = (undefined1 *)
                CONCAT11(*(undefined1 *)(bVar2 + 0xc4bc),*(undefined1 *)(bVar2 + 0xc4b9));
    *(undefined1 *)(bVar2 + 0xc08d) = *_DAT_00fa;
    bVar1 = _DAT_00fa[1];
    *(byte *)(bVar2 + 0xc0e6) = bVar1;
    *(byte *)(bVar2 + 0xc0e9) = bVar1 & 0xf;
    bVar2 = bVar2 - 1;
  } while (-1 < (char)bVar2);
  return;
}


