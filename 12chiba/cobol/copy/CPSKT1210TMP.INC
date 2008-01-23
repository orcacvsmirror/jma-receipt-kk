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
      *    診療報酬請求書     COPY (CPSKT1210TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT1210TMP-REC.
           03  SKT1210TMP-KEY.
               05  SKT1210TMP-SYUTURYOKU           PIC  9(01).
               05  SKT1210TMP-HKNJANUM             PIC  X(06).
               05  SKT1210TMP-NYUGAIKBN            PIC  9(01).
               05  SKT1210TMP-KYURATE              PIC  9(03).
      ***** 08/01/09 ADD
               05  SKT1210TMP-RECEKA               PIC  X(02).
      ***** 08/01/09 ADD
               05  SKT1210TMP-ZAITAKU              PIC  X(01).
           03  SKT1210TMP-SEIKYU-TBL     OCCURS  11.
               05  SKT1210TMP-KENSU                PIC  9(06).
               05  SKT1210TMP-NISSU                PIC  9(06).
               05  SKT1210TMP-TENSU                PIC  9(10).
               05  SKT1210TMP-ITBFTN               PIC  9(10).
               05  SKT1210TMP-SKENSU               PIC  9(06).
               05  SKT1210TMP-SNISSU               PIC  9(06).
               05  SKT1210TMP-SKINGK               PIC  9(10).
               05  SKT1210TMP-SFTNGK               PIC  9(10).
           03  SKT1210TMP-KOH-AREA.
      ***** 05/06/24 DEL
      *         05  SKT1210TMP-KOH-TBL      OCCURS  20. 
      *             07  SKT1210TMP-KOH-KEY.
      *                 09  SKT1210TMP-KOHNUM1           PIC  X(03).
      *                 09  SKT1210TMP-KOHNUM2           PIC  X(03).
      ***** 05/06/24 INS
               05  SKT1210TMP-KOH-TBL      OCCURS  50. 
                   07  SKT1210TMP-KOH-KEY.
                       09  SKT1210TMP-K-KBN             PIC  X(02).
                       09  SKT1210TMP-KOHNUM1           PIC  X(03).
                       09  SKT1210TMP-KOHNUM2           PIC  X(03).
      *****
                   07  SKT1210TMP-K-KENSU               PIC  9(06).
                   07  SKT1210TMP-K-NISSU               PIC  9(06).
                   07  SKT1210TMP-K-TENSU               PIC  9(10).
                   07  SKT1210TMP-K-ITBFTN              PIC  9(10).
                   07  SKT1210TMP-K-KOHTENSU            PIC  9(10).
                   07  SKT1210TMP-K-SKENSU              PIC  9(06).
                   07  SKT1210TMP-K-SNISSU              PIC  9(06).
                   07  SKT1210TMP-K-SKINGK              PIC  9(10).
                   07  SKT1210TMP-K-SFTNGK              PIC  9(10).
           03  SKT1210TMP-RKOH-AREA.
      ***** 05/06/24 DEL
      *         05  SKT1210TMP-RKOH-TBL      OCCURS  20.
      *             07  SKT1210TMP-RKOH-KEY.
      *                 09  SKT1210TMP-RKOHNUM1          PIC  X(03).
      *                 09  SKT1210TMP-RKOHNUM2          PIC  X(03).
      ***** 05/06/24 INS
               05  SKT1210TMP-RKOH-TBL      OCCURS  50.
                   07  SKT1210TMP-RKOH-KEY.
                       09  SKT1210TMP-K-RKBN            PIC  X(02).
                       09  SKT1210TMP-RKOHNUM1          PIC  X(03).
                       09  SKT1210TMP-RKOHNUM2          PIC  X(03).
      *****
                   07  SKT1210TMP-K-RKENSU              PIC  9(06).
                   07  SKT1210TMP-K-RNISSU              PIC  9(06).
                   07  SKT1210TMP-K-RTENSU              PIC  9(10).
                   07  SKT1210TMP-K-RITBFTN             PIC  9(10).
                   07  SKT1210TMP-K-RKOHTENSU           PIC  9(10).
                   07  SKT1210TMP-K-RSKENSU             PIC  9(06).
                   07  SKT1210TMP-K-RSNISSU             PIC  9(06).
                   07  SKT1210TMP-K-RSKINGK             PIC  9(10).
                   07  SKT1210TMP-K-RSFTNGK             PIC  9(10).

