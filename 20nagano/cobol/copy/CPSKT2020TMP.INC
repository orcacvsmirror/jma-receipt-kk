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
      *
      ************************************************************
       01  SKT2020TMP-REC.
           03  SKT2020TMP-KEY.
               05  SKT2020TMP-SYUTURYOKU       PIC  9(01).
               05  SKT2020TMP-HKNJANUM         PIC  X(06).
               05  SKT2020TMP-SRYYM            PIC  9(06).
               05  SKT2020TMP-ZAITAKU          PIC  X(01).
           03  SKT2020TMP-IPAN-TBL    OCCURS  11.
               05  SKT2020TMP-NYUGAI-TBL  OCCURS  2.
                   07  SKT2020TMP-KENSU        PIC  9(06).
                   07  SKT2020TMP-NISSU        PIC  9(06).
                   07  SKT2020TMP-TENSU        PIC  9(10).
                   07  SKT2020TMP-YKZFTN       PIC  9(10).
                   07  SKT2020TMP-ITBFTN       PIC  9(10).
               05  SKT2020TMP-SKENSU           PIC  9(06).
               05  SKT2020TMP-SNISSU           PIC  9(06).
               05  SKT2020TMP-SKINGK           PIC  9(10).
               05  SKT2020TMP-SFTNGK           PIC  9(10).
           03  SKT2020TMP-KOH-AREA.
             05  SKT2020TMP-KOH-TBL    OCCURS  20.
                 07  SKT2020TMP-KOHNUM           PIC  X(03).
                 07  SKT2020TMP-K-NYUGAI-TBL  OCCURS  2.
                   09  SKT2020TMP-K-KENSU      PIC  9(06).
                   09  SKT2020TMP-K-NISSU      PIC  9(06).
                   09  SKT2020TMP-K-TENSU      PIC  9(10).
                   09  SKT2020TMP-K-YKZFTN     PIC  9(10).
                   09  SKT2020TMP-K-ITBFTN     PIC  9(10).
                 07  SKT2020TMP-K-SKENSU       PIC  9(06).
                 07  SKT2020TMP-K-SNISSU       PIC  9(06).
                 07  SKT2020TMP-K-SKINGK       PIC  9(10).
                 07  SKT2020TMP-K-SFTNGK       PIC  9(10).
           03  SKT2020TMP-TYOKI-TBL  OCCURS  3.
               05  SKT2020TMP-T-KENSU          PIC  9(03).
      *
