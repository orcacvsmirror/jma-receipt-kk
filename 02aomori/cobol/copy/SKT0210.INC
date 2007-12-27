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
       01  SKT0210.
      *    医療機関コード
           03  SKT0210-HOSPCDN           PIC  X(40).
      *    請求テーブル
           03  SKT0210-SEIKYU-TBL     OCCURS  2.
      *    入外テーブル
               05  SKT0210-NYUGAI-TBL     OCCURS  2.
      *    件数
                   07  SKT0210-KENSU     PIC  X(05).
      *    実日数
                   07  SKT0210-NISSU     PIC  X(05).
      *    点数
                   07  SKT0210-TENSU     PIC  X(09).
      *    一部負担金
                   07  SKT0210-ITBFTN    PIC  X(11).
      *    食事療養：件数
               05  SKT0210-S-KENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT0210-S-NISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT0210-S-KINGAKU     PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0210-S-FTNGAKU     PIC  X(09).
      *    公費テーブル
           03  SKT0210-KOH-TBL     OCCURS  5.
      *    公費名
               05  SKT0210-KOHNAME       PIC  X(10).
      *    入外テーブル
               05  SKT0210-K-NYUGAI-TBL     OCCURS  2.
      *    件数
                   07  SKT0210-KKENSU    PIC  X(05).
      *    実日数
                   07  SKT0210-KNISSU    PIC  X(05).
      *    点数
                   07  SKT0210-KTENSU    PIC  X(09).
      *    一部負担金
                   07  SKT0210-KITBFTN   PIC  X(09).
      *    食事療養：件数
               05  SKT0210-S-KKENSU      PIC  X(05).
      *    食事療養：日数
               05  SKT0210-S-KNISSU      PIC  X(05).
      *    食事療養：金額
               05  SKT0210-S-KKINGAKU    PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0210-S-KFTNGAKU    PIC  X(09).
