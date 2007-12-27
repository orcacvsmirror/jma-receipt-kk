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
       01  SKT1310.
      *    診療年月
           03  SKT1310-SRYYM             PIC  X(16).
      *    医療機関住所
           03  SKT1310-ADRS              PIC  X(100).
      *    医療機関名
           03  SKT1310-HOSPNAME          PIC  X(100).
      *    電話番号
           03  SKT1310-TEL               PIC  X(15).
      *    開設者名
           03  SKT1310-KAISETUNAME       PIC  X(40).
      *    請求年月日
           03  SKT1310-SEIYMD            PIC  X(22).
      *    保険者番号
           03  SKT1310-HKNJANUM          PIC  X(12).
      *    医療機関コード
           03  SKT1310-HOSPCD            PIC  X(14).
      *    割合（一般保険者）
           03  SKT1310-KYURATE           PIC  X(02).
      *    在総診
           03  SKT1310-ZAI1              PIC  X(02).
           03  SKT1310-ZAI2              PIC  X(02).
      ***** 05/02/18 yamaguchi INS
      *    ページ番号
           03  SKT1310-NO                PIC  X(04).
      *****
      *    請求テーブル
           03  SKT1310-SEIKYU-TBL     OCCURS  12.
      *    件数
               05  SKT1310-KENSU         PIC  X(05).
      *    実日数
               05  SKT1310-NISSU         PIC  X(05).
      *    点数
               05  SKT1310-TENSU         PIC  X(11).
      *    一部負担金
               05  SKT1310-ITBFTN        PIC  X(09).
      *    公費テーブル
           03  SKT1310-KOH-TBL        OCCURS   2.
      *    公費名
               05  SKT1310-K-KOHNAME     PIC  X(16).
      *    件数
               05  SKT1310-KKENSU       PIC  X(05).
      *    日数
               05  SKT1310-KNISSU       PIC  X(05).
      *    点数
               05  SKT1310-KTENSU       PIC  X(11).
      *    一部負担金
               05  SKT1310-KITBFTN      PIC  X(09).
