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
      *    診療報酬請求書     COPY (CPSKT2710TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      *  01.00.01    吉川         08/05/26  帳票様式の変更に伴う修正
      *  01.00.02    吉川         08/06/09  改正前の月遅れ分は旧様式に印字
      *  01.00.03    門間         08/12/11  公費名称の追加
      ************************************************************
       01  SKT1910TMP-REC.
           03  SKT1910TMP-KEY.
               05  SKT1910TMP-SYUTURYOKU            PIC  9(01).
               05  SKT1910TMP-HKNJANUM              PIC  X(06).
               05  SKT1910TMP-KYURATE               PIC  9(03).
               05  SKT1910TMP-ZAITAKU               PIC  X(01).
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
           03  SKT1910TMP-SRYYM                     PIC  X(06).
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
           03  SKT1910TMP-HKN-AREA  OCCURS  11.
               05  SKT1910TMP-NYUGAI-TBL  OCCURS  2.
                   07  SKT1910TMP-KENSU             PIC  9(05).
                   07  SKT1910TMP-NISSU             PIC  9(05).
                   07  SKT1910TMP-TENSU             PIC  9(11).
                   07  SKT1910TMP-YKZFTN            PIC  9(09).
                   07  SKT1910TMP-FTNMONEY          PIC  9(07).
               05  SKT1910TMP-S-KENSU               PIC  9(05).
               05  SKT1910TMP-S-NISSU               PIC  9(05).
               05  SKT1910TMP-S-KINGAKU             PIC  9(13).
               05  SKT1910TMP-S-FTNGAKU             PIC  9(09).
           03  SKT1910TMP-KOH-AREA.
               05  SKT1910TMP-KOH-TBL  OCCURS  20.
                   07  SKT1910TMP-KOHNUM            PIC  X(03).
      *--- (2008/12/11) line add start monma ---------------------------
                   07  SKT1910TMP-KOHNAME           PIC  X(20).
      *--- (2008/12/11) line add end   monma ---------------------------
                   07  SKT1910TMP-KKENSU            PIC  9(05).
                   07  SKT1910TMP-KNISSU            PIC  9(05).
                   07  SKT1910TMP-KTENSU            PIC  9(11).
                   07  SKT1910TMP-KYKZFTN           PIC  9(09).
                   07  SKT1910TMP-KFTNMONEY         PIC  9(07).
                   07  SKT1910TMP-S-KKENSU          PIC  9(05).
                   07  SKT1910TMP-S-KNISSU          PIC  9(05).
                   07  SKT1910TMP-S-KKINGAKU        PIC  9(13).
                   07  SKT1910TMP-S-KFTNGAKU        PIC  9(09).
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
           03  SKT1910TMP-TKOH-AREA.
               05  SKT1910TMP-TKOH-TBL  OCCURS  3.
                   07  SKT1910TMP-TNYUGAI-TBL  OCCURS  2.
                       09  SKT1910TMP-TKENSU        PIC  9(05).
                       09  SKT1910TMP-TNISSU        PIC  9(05).
                       09  SKT1910TMP-TTENSU        PIC  9(09).
                       09  SKT1910TMP-TFTNMONEY     PIC  9(09).
           03  SKT1910TMP-KOH2-AREA.
               05  SKT1910TMP-KOH2-TBL  OCCURS  20.
                   07  SKT1910TMP-KOHNUM2           PIC  X(03).
      *--- (2008/12/11) line add start monma --------------------------
                   07  SKT1910TMP-KOHNAME2          PIC  X(20).
      *--- (2008/12/11) line add end   monma --------------------------
                   07  SKT1910TMP-KNYUGAI-TBL  OCCURS  2.
                       09  SKT1910TMP-KKENSU2       PIC  9(05).
                       09  SKT1910TMP-KNISSU2       PIC  9(05).
                       09  SKT1910TMP-KTENSU2       PIC  9(11).
                       09  SKT1910TMP-KFTNMONEY2    PIC  9(07).
                   07  SKT1910TMP-S-KKENSU2         PIC  9(05).
                   07  SKT1910TMP-S-KNISSU2         PIC  9(05).
                   07  SKT1910TMP-S-KKINGAKU2       PIC  9(13).
                   07  SKT1910TMP-S-KFTNGAKU2       PIC  9(09).
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
