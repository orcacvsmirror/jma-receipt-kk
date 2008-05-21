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
        01  SKT1200.
            03  SKT1200-SEIYM       PIC X(16).
            03  SKT1200-HOSPCD      PIC X(10).
            03  SKT1200-ADRS        PIC X(100).
            03  SKT1200-HOSPNAME    PIC X(100).
            03  SKT1200-TEL         PIC X(15).
            03  SKT1200-KAISETUNAME PIC X(40).
            03  SKT1200-RECEKA      PIC X(20).
            03  SKT1200-SEIKYU-TBL      OCCURS  6 TIMES.
                05  SKT1200-KENSU   PIC X(06).
                05  SKT1200-TENSU   PIC X(10).
                05  SKT1200-SKENSU  PIC X(06).
                05  SKT1200-SKINGK  PIC X(10).
                05  SKT1200-SFTNGK  PIC X(09).
