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
      ************************************************************
      *    総括表一時ファイル                                    *
      *                                                          *
      ************************************************************
       01  SKT0100TMP-REC.
           03  SKT0100TMP-KEY.
               05   SKT0100TMP-SRYYM       PIC  X(06).
               05   SKT0100TMP-ZAITAKU     PIC  X(01).
           03  SKT0100TMP-HKN-TBL         OCCURS  3 TIMES.
               05  SKT0100TMP-NYUGAI-TBL  OCCURS  2 TIMES.
                   07  SKT0100TMP-KENSU   PIC 9(05).
                   07  SKT0100TMP-TENSU   PIC 9(14).
                   07  SKT0100TMP-ITBFTN  PIC 9(10).
               05  SKT0100TMP-SKENSU      PIC 9(05).
               05  SKT0100TMP-SKINGK      PIC 9(14).
               05  SKT0100TMP-SFTNGK      PIC 9(10).
           03  SKT0100TMP-ETC-TBL         OCCURS  3 TIMES.
               05  SKT0100TMP-ETC-KENSU   PIC 9(05).
               05  SKT0100TMP-ETC-TENSU   PIC 9(14).
               05  SKT0100TMP-ETC-ITBFTN  PIC 9(10).
               05  SKT0100TMP-ETC-SKENSU  PIC 9(05).
               05  SKT0100TMP-ETC-SKINGK  PIC 9(14).
               05  SKT0100TMP-ETC-SFTNGK  PIC 9(10).
           03  SKT0100TMP-KOHI-AREA.
               05  SKT0100TMP-KOH-TBL        OCCURS  20 TIMES.
                   07  SKT0100TMP-KOHNUM      PIC X(03).
                   07  SKT0100TMP-K-KENSU     PIC 9(05).
                   07  SKT0100TMP-K-TENSU     PIC 9(14).
                   07  SKT0100TMP-K-ITBFTN    PIC 9(10).
                   07  SKT0100TMP-K-SKENSU    PIC 9(05).
                   07  SKT0100TMP-K-SKINGK    PIC 9(14).
                   07  SKT0100TMP-K-SFTNGK    PIC 9(10).
           03  SKT0100TMP-HENREIYM-TBL      OCCURS  2 TIMES.
               05  SKT0100TMP-FUKUSI-TBL      OCCURS  2 TIMES.
                   07  SKT0100TMP-F-KENSU     PIC 9(05) OCCURS  3.
                   07  SKT0100TMP-F-TENSU     PIC 9(11) OCCURS  3.
      *
