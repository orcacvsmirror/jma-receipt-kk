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
        01  SKT2710.
      *    診療年月
            03  SKT2710-SRYYM           PIC X(16).
      *    請求日付
            03  SKT2710-SEIYMD          PIC X(22).
      *    県名
            03  SKT2710-PREFNAME        PIC X(06).
      *    保険者名
            03  SKT2710-HKNJANAME       PIC X(18).
      *    保険者番号
            03  SKT2710-HKNJANUM        PIC X(12).
      *    医療機関コード
            03  SKT2710-HOSPCDN         PIC X(20).
      *    医療機関所在地
            03  SKT2710-ADRS            PIC X(100).
      *    医療機関名称
            03  SKT2710-HOSPNAME        PIC X(100).
      *    開設者名
            03  SKT2710-KAISETU         PIC X(40).
      *    電話番号
            03  SKT2710-TEL             PIC X(15).
      ***** 05/03/09 yamaguchi DEL
      *    ページ番号
      *      03  SKT2710-NO              PIC X(04).
      *****
      *    請求エリア
            03  SKT2710-SEIKYU-TBL          OCCURS  12 TIMES.
                05  SKT2710-NYUGAI-TBL      OCCURS  2 TIMES.
      *    件数
                    07  SKT2710-KENSU   PIC X(05).
      *    日数
                    07  SKT2710-NISSU   PIC X(05).
      *    点数
                    07  SKT2710-TENSU   PIC X(09).
      *    一部負担金
                    07  SKT2710-ITBFTN  PIC X(09).
      *    食事件数
                05  SKT2710-SKENSU      PIC X(05).
      *    食事日数
                05  SKT2710-SNISSU      PIC X(05).
      *    金額
                05  SKT2710-SKINGK      PIC X(09).
      *    標準負担額
                05  SKT2710-SFTNGK      PIC X(09).
      *    老人＋原爆エリア
            03  SKT2710-GENBK-TBL           OCCURS  2 TIMES.
                05  SKT2710-GENBK-NYUGAI    OCCURS  2 TIMES.
                    07  SKT2710-GENBK-KENSU   PIC X(05).
