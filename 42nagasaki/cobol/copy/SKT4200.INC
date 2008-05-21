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
       01  SKT4200.
      *診療年月
           03  SKT4200-SRYY                PIC  X(04).
           03  SKT4200-SRYM                PIC  X(04).
      *郵便番号
           03  SKT4200-POST                PIC  X(08).
      *医療機関所在地
           03  SKT4200-ADRS                PIC  X(100).
      *医療機関名称
           03  SKT4200-HOSPNAME            PIC  X(100).
      *医療機関開設者名
           03  SKT4200-KAISETU             PIC  X(80).
      *医療機関コード
           03  SKT4200-HOSPCD              PIC  X(07).
      *電話番号
           03  SKT4200-TEL                 PIC  X(15).
      *請求テーブル
           03  SKT4200-SEIKYU  OCCURS 17.
      *療養の給付：件数
               05  SKT4200-KENSU           PIC  X(05).
      *療養の給付：点数
               05  SKT4200-TENSU           PIC  X(09).
      *保険者数
           03  SKT4200-KENNAI              PIC  X(03).
           03  SKT4200-KENGAI              PIC  X(03).
      *高額件数
           03  SKT4200-KOGAKU              PIC  X(03) OCCURS 4.
