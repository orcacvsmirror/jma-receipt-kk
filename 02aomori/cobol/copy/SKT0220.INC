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
       01  SKT0220.
      *    診療年月
           03  SKT0220-SRYYM             PIC  X(16).
      *    保険者名
           03  SKT0220-HKNJANAME         PIC  X(26).
      *    医療機関コード
           03  SKT0220-HOSPCDN           PIC  X(40).
      *    請求年月日
           03  SKT0220-SEIYMD            PIC  X(22).
      *    郵便番号
      *     03  SKT0220-POST              PIC  X(18).
      *    医療機関住所
           03  SKT0220-ADRS              PIC  X(100).
      *    医療機関名
           03  SKT0220-HOSPNAME          PIC  X(100).
      *    開設者名
           03  SKT0220-KAISETUNAME       PIC  X(40).
      *    電話番号
           03  SKT0220-TEL               PIC  X(15).
      ***** 05/02/08 yamaguchi INS
      *    ページ番号
           03  SKT0220-NO                PIC  X(04).
      *****
      *    割合（一般保険者）
           03  SKT0220-KYURATE-TBL  OCCURS  2.
               05  SKT0220-KYURATE       PIC  X(01).
      *    請求テーブル
           03  SKT0220-SEIKYU-TBL     OCCURS  12.
      *    入外テーブル
               05  SKT0220-NYUGAI-TBL     OCCURS  2.
      *    件数
                   07  SKT0220-KENSU     PIC  X(05).
      *    実日数
                   07  SKT0220-NISSU     PIC  X(05).
      *    点数
                   07  SKT0220-TENSU     PIC  X(09).
      *    一部負担金
                   07  SKT0220-ITBFTN    PIC  X(09).
      *    食事療養：件数
               05  SKT0220-S-KENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT0220-S-NISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT0220-S-KINGAKU     PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0220-S-FTNGAKU     PIC  X(09).
