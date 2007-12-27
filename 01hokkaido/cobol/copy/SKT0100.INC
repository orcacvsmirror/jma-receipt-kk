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
        01  SKT0100.
            03  SKT0100-SEIYMD          PIC X(22).
            03  SKT0100-HOSPCD          PIC X(07).
            03  SKT0100-ADRS            PIC X(100).
            03  SKT0100-HOSPNAME        PIC X(100).
            03  SKT0100-ZAI1            PIC X(02).
            03  SKT0100-ZAI2            PIC X(02).
            03  SKT0100-HKN-TBL         OCCURS  3 TIMES.
                05  SKT0100-NYUGAI-TBL  OCCURS  2 TIMES.
                    07  SKT0100-KENSU   PIC X(05).
                    07  SKT0100-TENSU   PIC X(14).
                    07  SKT0100-ITBFTN  PIC X(10).
                05  SKT0100-SKENSU      PIC X(05).
                05  SKT0100-SKINGK      PIC X(14).
                05  SKT0100-SFTNGK      PIC X(10).
            03  SKT0100-ETC-TBL         OCCURS  3 TIMES.
                05  SKT0100-ETC-KENSU   PIC X(05).
                05  SKT0100-ETC-TENSU   PIC X(14).
                05  SKT0100-ETC-ITBFTN  PIC X(10).
                05  SKT0100-ETC-SKENSU  PIC X(05).
                05  SKT0100-ETC-SKINGK  PIC X(14).
                05  SKT0100-ETC-SFTNGK  PIC X(10).
            03  SKT0100-KOHI-TBL        OCCURS  10 TIMES.
                05  SKT0100-HBTNUM      PIC X(02).
                05  SKT0100-K-KENSU     PIC X(05).
                05  SKT0100-K-TENSU     PIC X(14).
                05  SKT0100-K-ITBFTN    PIC X(10).
                05  SKT0100-K-SKENSU    PIC X(05).
                05  SKT0100-K-SKINGK    PIC X(14).
                05  SKT0100-K-SFTNGK    PIC X(10).
            03  SKT0100-FUKUSI-TBL      OCCURS  2 TIMES.
                05  SKT0100-F-KENSU     PIC X(05)   OCCURS  3 TIMES.
                05  SKT0100-F-TENSU     PIC X(11)   OCCURS  3 TIMES.
