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
        01  SKT2210.
            03  SKT2210-PRTYM            PIC X(16).
            03  SKT2210-HKNJANUM         PIC X(12).
            03  SKT2210-HKNJANAME        PIC X(26).
            03  SKT2210-ZAIMARU          PIC X(2).
            03  SKT2210-ZAIMOJI          PIC X(2).
            03  SKT2210-SEIYMD           PIC X(22).
            03  SKT2210-HOSPCD           PIC X(7).
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *      03  SKT2210-ADRS             PIC X(80).
      *      03  SKT2210-HOSPNAME         PIC X(80).
            03  SKT2210-ADRS             PIC X(100).
            03  SKT2210-HOSPNAME         PIC X(100).
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
            03  SKT2210-KAISETUNAME      PIC X(40).
            03  SKT2210-TEL              PIC X(15).
      ***** 05/02/08 yamaguchi INS
            03  SKT2210-NO               PIC X(04).
      *****
            03  SKT2210-DATA1            OCCURS  9 TIMES.
                05  SKT2210-NYUGAI-TBL   OCCURS  2 TIMES.
                    07  SKT2210-KENSU    PIC X(05).
                    07  SKT2210-NISSU    PIC X(05).
                    07  SKT2210-TENSU    PIC X(09).
                    07  SKT2210-ITBFTN   PIC X(09).
                05  SKT2210-SKENSU       PIC X(05).
                05  SKT2210-SNISSU       PIC X(05).
                05  SKT2210-SKINGK       PIC X(09).
                05  SKT2210-SFTNGK       PIC X(09).
            03  SKT2210-DATA2            OCCURS  4 TIMES.
                05  SKT2210-KOHNAME      PIC X(08).
                05  SKT2210-HBTNUM       PIC X(02).
                05  SKT2210-NYUGAIKBN    OCCURS  2 TIMES.
                    07  SKT2210-K-KENSU  PIC X(05).
                    07  SKT2210-K-NISSU  PIC X(05).
                    07  SKT2210-K-TENSU  PIC X(09).
                    07  SKT2210-K-ITBFTN PIC X(09).
                05  SKT2210-K-SKENSU     PIC X(05).
                05  SKT2210-K-SNISSU     PIC X(05).
                05  SKT2210-K-SKINGK     PIC X(09).
                05  SKT2210-K-SFTNGK     PIC X(09).
            03  SKT2210-TYOKI-TBL        OCCURS  2 TIMES.
                05  SKT2210-TYOKI        PIC X(07).
      *      03  SKT2210-GOKEI-TBL        OCCURS  2 TIMES.
      *          05  SKT2210-GKENSU       PIC X(05).
      *          05  SKT2210-GKINGK       PIC X(09).
