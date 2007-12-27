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
       01  SKT0230.
      *    医療機関コード
           03  SKT0230-HOSPCDN           PIC  X(40).
      ***** 05/02/08 yamaguchi INS
      *    ページ番号
           03  SKT0230-NO                PIC  X(04).
      *****
      *    請求テーブル
           03  SKT0230-SEIKYU-TBL     OCCURS  2.
      *    入外テーブル
               05  SKT0230-NYUGAI-TBL     OCCURS  2.
      *    件数
                   07  SKT0230-KENSU     PIC  X(05).
      *    実日数
                   07  SKT0230-NISSU     PIC  X(05).
      *    点数
                   07  SKT0230-TENSU     PIC  X(09).
      *    一部負担金
                   07  SKT0230-ITBFTN    PIC  X(11).
      *    食事療養：件数
               05  SKT0230-S-KENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT0230-S-NISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT0230-S-KINGAKU     PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0230-S-FTNGAKU     PIC  X(09).
      *    公費テーブル
           03  SKT0230-KOH-TBL     OCCURS  5.
      *    法別番号
               05  SKT0230-HBTNUM        PIC  X(02).
      *    公費名
               05  SKT0230-KOHNAME       PIC  X(10).
      *    入外テーブル
               05  SKT0230-K-NYUGAI-TBL     OCCURS  2.
      *    件数
                   07  SKT0230-KKENSU    PIC  X(05).
      *    実日数
                   07  SKT0230-KNISSU    PIC  X(05).
      *    点数
                   07  SKT0230-KTENSU    PIC  X(09).
      *    一部負担金
                   07  SKT0230-KITBFTN   PIC  X(09).
      *    食事療養：件数
               05  SKT0230-S-KKENSU      PIC  X(05).
      *    食事療養：日数
               05  SKT0230-S-KNISSU      PIC  X(05).
      *    食事療養：金額
               05  SKT0230-S-KKINGAKU    PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0230-S-KFTNGAKU    PIC  X(09).
