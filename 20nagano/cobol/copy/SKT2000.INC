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
       01  SKT2000.
      *    診療年月
              03  SKT2000-SRYYM            PIC  X(16).
      *    請求テーブル
              03  SKT2000-SEIKYU-TBL       OCCURS  42.
      *    保険者名
                  05  SKT2000-HKNJANAME    PIC  X(20).
      *    件数
                  05  SKT2000-KENSU        PIC  X(05).
      *    小計：件数
              03  SKT2000-SKENSU           PIC  X(06).
      *    合計：件数
              03  SKT2000-GKENSU           PIC  X(06).
      *    特別療養費
              03  SKT2000-TOKUBETU         PIC  X(05).
      *    保険者数
              03  SKT2000-HKNJASU          PIC  X(03).
      *    点数表区分
              03  SKT2000-TENHYO-TBL      OCCURS  3.
                  05  SKT2000-TENHYOKBN    PIC  X(02).
      *    医療機関コード
              03  SKT2000-HOSPCD           PIC  X(14).
      *    標榜科名
              03  SKT2000-SRYKA            PIC  X(20) OCCURS 3.
      *    郵便番号
      *        03  SKT2000-POST            PIC  X(18).
      *    医療機関住所
              03  SKT2000-ADRS             PIC  X(100).
      *    医療機関名
              03  SKT2000-HOSPNAME         PIC  X(100).
      *    開設者名
              03  SKT2000-KAISETUNAME      PIC  X(80).
      *    長期
              03  SKT2000-TYOKI            PIC  X(07) OCCURS 42.
              03  SKT2000-STYOKI           PIC  X(08).
              03  SKT2000-GTYOKI           PIC  X(08).
