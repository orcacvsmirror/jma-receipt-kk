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
      *  国保総括票         COPY (CPSKT1710TMP.INC)              *
      *                                                          *
      *  コピー句修正履歴                                        *
      * Maj/Min/Rev  修正者       日付      内容                 *
      ************************************************************
       01  SKT1700TMP-REC.
           03  SKT1700TMP-KEY.
               05  SKT1700TMP-RECEKA                PIC  X(02).
           03  SKT1700TMP-SEIKYU-TBL      OCCURS 15.
               05  SKT1700TMP-NYUGAIKBN   OCCURS 2.
                   07  SKT1700TMP-KENSU             PIC  9(05).
                   07  SKT1700TMP-NISSU             PIC  9(05).
                   07  SKT1700TMP-TENSU             PIC  9(09).
                   07  SKT1700TMP-YKZFTN            PIC  9(09).
                   07  SKT1700TMP-ITBFTN            PIC  9(09).
               05  SKT1700TMP-SKENSU                PIC  9(05).
               05  SKT1700TMP-SNISSU                PIC  9(05).
               05  SKT1700TMP-SKINGK                PIC  9(09).
               05  SKT1700TMP-SFTNGK                PIC  9(09).
           03  SKT1700TMP-ZAITAKU-TBL     OCCURS 6.
               05  SKT1700TMP-Z-KENSU               PIC  9(05).
               05  SKT1700TMP-Z-NISSU               PIC  9(05).
               05  SKT1700TMP-Z-TENSU               PIC  9(09).
               05  SKT1700TMP-Z-ITBFTN              PIC  9(09).
           03  SKT1700TMP-KOHI-TBL        OCCURS 9.
               05  SKT1700TMP-K-KENSU               PIC  9(05).
               05  SKT1700TMP-K-NISSU               PIC  9(05).
               05  SKT1700TMP-K-TENSU               PIC  9(09).
               05  SKT1700TMP-K-YKZFTN              PIC  9(09).
               05  SKT1700TMP-K-ITBFTN              PIC  9(09).
               05  SKT1700TMP-K-SKENSU              PIC  9(05).
               05  SKT1700TMP-K-SNISSU              PIC  9(05).
               05  SKT1700TMP-K-SKINGK              PIC  9(09).
               05  SKT1700TMP-K-SFTNGK              PIC  9(09).
