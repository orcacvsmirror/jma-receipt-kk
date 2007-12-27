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
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      *  01.00.01    吉川      2007/10/03   システム管理マスタ「1901」の
      *                                     医療機関情報を参照
      ************************************************************
        01  SKT2220.
            03  SKT2220-PRTYM            PIC X(16).
            03  SKT2220-HKNJANUM         PIC X(12).
            03  SKT2220-HKNJANAME        PIC X(26).
            03  SKT2220-ZAIMARU          PIC X(02).
            03  SKT2220-ZAIMOJI          PIC X(02).
            03  SKT2220-SEIYMD           PIC X(22).
            03  SKT2220-HOSPCD           PIC X(07).
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *      03  SKT2220-ADRS             PIC X(80).
      *      03  SKT2220-HOSPNAME         PIC X(80).
            03  SKT2220-ADRS             PIC X(100).
            03  SKT2220-HOSPNAME         PIC X(100).
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
            03  SKT2220-KAISETUNAME      PIC X(40).
            03  SKT2220-TEL              PIC X(15).
      ***** 05/02/08 yamaguchi INS
            03  SKT2220-NO               PIC X(04).
      *****
            03  SKT2220-DATA1            OCCURS  2 TIMES.
                05  SKT2220-NYUGAI-TBL   OCCURS  2 TIMES.
                    07  SKT2220-KENSU    PIC X(05).
                    07  SKT2220-NISSU    PIC X(05).
                    07  SKT2220-TENSU    PIC X(09).
                    07  SKT2220-ITBFTN   PIC X(09).
                05  SKT2220-SKENSU       PIC X(05).
                05  SKT2220-SNISSU       PIC X(05).
                05  SKT2220-SKINGK       PIC X(09).
                05  SKT2220-SFTNGK       PIC X(09).
            03  SKT2220-DATA2            OCCURS  4 TIMES.
                05  SKT2220-KOHNAME      PIC X(08).
                05  SKT2220-HBTNUM       PIC X(02).
                05  SKT2220-NYUGAIKBN    OCCURS  2 TIMES.
                    07  SKT2220-K-KENSU  PIC X(05).
                    07  SKT2220-K-NISSU  PIC X(05).
                    07  SKT2220-K-TENSU  PIC X(09).
                    07  SKT2220-K-ITBFTN PIC X(09).
                05  SKT2220-K-SKENSU     PIC X(05).
                05  SKT2220-K-SNISSU     PIC X(05).
                05  SKT2220-K-SKINGK     PIC X(09).
                05  SKT2220-K-SFTNGK     PIC X(09).
            03  SKT2220-TYOKI-TBL        OCCURS  2 TIMES.
                05  SKT2220-TYOKI        PIC X(07).
