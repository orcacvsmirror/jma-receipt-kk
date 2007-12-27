      *******************************************************************
      * Project code name "ORCA"
      * 日医標準レセプトソフト（JMA standard receipt software）
      * Copyright(C) 2002 JMA (Japan Medical Association)
      *
      * This program is part of "JMA standard receipt software".
      *
      *     This program is distributed in the hope that it will be useful
      * for further advancement in medical care, according to JMA Open
      * Source License, but WITHOUT ANY WARRANTY.
      *     Everyone is granted permission to use, copy, modify and
      * redistribute this program, but only under the conditions described
      * in the JMA Open Source License. You should have received a copy of
      * this license along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
        01  SKT1700.
            03  SKT1700-SRYYM           PIC X(16).
            03  SKT1700-SEIYMD          PIC X(22).
            03  SKT1700-HOSPCD          PIC X(14).
            03  SKT1700-RECEKA          PIC X(10).
            03  SKT1700-ADRS            PIC X(100).
            03  SKT1700-HOSPNAME        PIC X(100).
            03  SKT1700-SEIKYU-TBL      OCCURS  15 TIMES.
                05  SKT1700-NYUGAI-TBL      OCCURS  2 TIMES.
                    07  SKT1700-KENSU   PIC X(05).
                    07  SKT1700-NISSU   PIC X(05).
                    07  SKT1700-TENSU   PIC X(09).
                    07  SKT1700-ITBFTN  PIC X(09).
                05  SKT1700-SKENSU      PIC X(05).
                05  SKT1700-SNISSU      PIC X(05).
                05  SKT1700-SKINGK      PIC X(09).
                05  SKT1700-SFTNGK      PIC X(09).
            03  SKT1700-ZAITAKU-TBL     OCCURS  6 TIMES.
                05  SKT1700-Z-KENSU     PIC X(05).
                05  SKT1700-Z-NISSU     PIC X(05).
                05  SKT1700-Z-TENSU     PIC X(09).
                05  SKT1700-Z-ITBFTN    PIC X(09).
            03  SKT1700-KOH-TBL     OCCURS  9 TIMES.
                05  SKT1700-KKENSU      PIC X(05).
                05  SKT1700-KNISSU      PIC X(05).
                05  SKT1700-KTENSU      PIC X(09).
                05  SKT1700-KITBFTN     PIC X(09).
                05  SKT1700-KSKENSU     PIC X(05).
                05  SKT1700-KSNISSU     PIC X(05).
                05  SKT1700-KSKINGK     PIC X(09).
                05  SKT1700-KSFTNGK     PIC X(09).

