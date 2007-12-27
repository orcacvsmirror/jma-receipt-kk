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
        01  SKT4500.
            03  SKT4500-SRYYM           PIC X(16)   OCCURS  2 TIMES.
            03  SKT4500-SEIYMD          PIC X(22).
            03  SKT4500-HOSPCD          PIC X(14)   OCCURS  2 TIMES.
            03  SKT4500-POST3           PIC X(03).
            03  SKT4500-POST4           PIC X(04).
            03  SKT4500-ADRS            PIC X(100).
            03  SKT4500-HOSPNAME        PIC X(100).
            03  SKT4500-KAISETU         PIC X(80).
            03  SKT4500-TEL1            PIC X(05).
            03  SKT4500-TEL2            PIC X(04).
            03  SKT4500-TEL3            PIC X(06).
            03  SKT4500-KENNAI          PIC X(02)   OCCURS  2 TIMES.
            03  SKT4500-KENGAI          PIC X(02)   OCCURS  2 TIMES.
            03  SKT4500-HYOUBOUKA       PIC X(20)   OCCURS  3 TIMES.
            03  SKT4500-SRYKA           PIC X(28).
            03  SKT4500-SEIKYU-TBL      OCCURS  4 TIMES.
                05  SKT4500-NYUGAI-TBL  OCCURS  2 TIMES.
                    07  SKT4500-KENSU   PIC X(06).
                    07  SKT4500-TENSU   PIC X(10).
            03  SKT4500-GKENSU          PIC X(06).
            03  SKT4500-GTENSU          PIC X(10).
