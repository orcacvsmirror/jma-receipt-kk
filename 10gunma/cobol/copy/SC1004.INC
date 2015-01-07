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
       01  SC04.
      *    医療機関点数表区分
           03  SC04-TENSUHYO            PIC  X(02) OCCURS 4.
      *    医療機関コード
           03  SC04-HOSPCDN             PIC  X(40).
      *    印刷日付
           03  SC04-PRTYM               PIC  X(16).
      *    市町村名
           03  SC04-CITYNAME            PIC  X(30).
      *    請求日付
           03  SC04-SEIYMD              PIC  X(22).
      *    所在地
           03  SC04-ADRS                PIC  X(100).
      *    医療機関名称
           03  SC04-HOSPNAME            PIC  X(100).
      *    電話番号
           03  SC04-TEL                 PIC  X(15).
      *    給付割合
           03  SC04-KYURATE-TBL        OCCURS  8.
               05  SC04-KYURATE         PIC  X(02).
      *    その他公費番号
           03  SC04-ETCKOHNUM           PIC  X(04).
      *    受給者資格証記号
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) start
      *     03  SC04-JKYSKIGO            PIC  X(02).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) end
      *
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) start
      *     03  SC04-MEISAI-TBL         OCCURS  12.
           03  SC04-MEISAI-TBL         OCCURS  10.
      *    負担者番号
               05  SC04-FTNJANUM        PIC  X(16).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) end
      *    受給者番号
               05  SC04-JKYSNUM         PIC  X(14).
      *    保険種別
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) start
      *         05  SC04-HKNKBN-TBL     OCCURS  5.
      *             07  SC04-HKNKBN      PIC  X(02).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) end
      *    氏名
               05  SC04-NAME            PIC  X(30).
      *    性別
               05  SC04-SEX-TBL        OCCURS  2.
                   07  SC04-SEX         PIC  X(02).
      *    生年月日
               05  SC04-BIRTHDAY-TBL.
                   07  SC04-NENGO-TBL  OCCURS  4.
                       09  SC04-NENGO   PIC  X(02).
                   07  SC04-BIRTHDAY    PIC  X(14).
      *    点数
               05  SC04-TENSU-TBL      OCCURS 2.
                   07  SC04-TENSU       PIC  X(07).
      *    食事標準負担額
               05  SC04-SFTNGK          PIC  X(06).
      *    福祉医療費請求額
               05  SC04-SEIKYUGK        PIC  X(07).
      *    食事日数
               05  SC04-SNISSU          PIC  X(02).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) start
      *    保険者番号
               05  SC04-HKNJANUM        PIC  X(16).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/16) end
      *    備考
               05  SC04-BIKO            PIC  X(06).
      *    備考２
               05  SC04-BIKO2           PIC  X(10).
      *    備考３
               05  SC04-BIKO3           PIC  X(06).
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) start
      *    備考４
               05  SC04-BIKO4           PIC  X(14).
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) end
      *    備考（税、多）
               05  SC04-TEI-TBL        OCCURS 2.
                   07  SC04-TEI         PIC  X(02).
                   07  SC04-MARU        PIC  X(02).
      *    合計
           03  SC04-GOKEI-TBL.
      *    合計−点数
               05  SC04-GTENSU-TBL     OCCURS 2.
                   07  SC04-GTENSU      PIC  X(09).
      *    合計−薬剤一部負担金
               05  SC04-GSFTNGK         PIC  X(07).
      *    合計−福祉医療費請求額
               05  SC04-GSEIKYUGK       PIC  X(09).
      *    合計−食事日数
               05  SC04-GSNISSU         PIC  X(03).
