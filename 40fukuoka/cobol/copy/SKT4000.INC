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
       01  SKT4000.
      *診療年月
           03  SKT4000-SRYM                PIC  X(06).
      *標榜科名
           03  SKT4000-SRYKA               PIC  X(20) OCCURS 3.
      *郵便番号
      *    03  SKT4000-POST                PIC  X(18).
      *医療機関所在地
           03  SKT4000-ADRS                PIC  X(100).
      *電話番号
           03  SKT4000-TEL                 PIC  X(15).
      *医療機関名称
           03  SKT4000-HOSPNAME            PIC  X(100).
      *開設者氏名
           03  SKT4000-KANRINAME           PIC  X(40).
      *医療機関コード
           03  SKT4000-HOSPCD              PIC  X(20).
      *請求一覧
           03  SKT4000-SEIKYU  OCCURS 8.
      *保険者番号
               05  SKT4000-HKNJANUM        PIC  X(12).
      *入院・外来テーブル
               05  SKT4000-NYUGAIKBN   OCCURS  2.
      *国保：件数
                   07  SKT4000-KKH-KENSU   PIC  X(05).
      *国保：点数
                   07  SKT4000-KKH-TENSU   PIC  X(09).
      *退職者家族：件数
                   07  SKT4000-TAK-KENSU   PIC  X(05).
      *退職者家族：点数
                   07  SKT4000-TAK-TENSU   PIC  X(09).
      *老人：件数
                   07  SKT4000-RJN-KENSU   PIC  X(05).
      *老人：点数
                   07  SKT4000-RJN-TENSU   PIC  X(09).
      *食事療養費：件数
                   07  SKT4000-SKJ-KENSU   PIC  X(05).
      *食事療養費：金額
                   07  SKT4000-SKJ-TENSU   PIC  X(10).
      *小計
           03  SKT4000-SSEIKYU  OCCURS 2.
      *国保：件数
               05  SKT4000-KKH-SKENSU      PIC  X(05).
      *国保：点数
               05  SKT4000-KKH-STENSU      PIC  X(09).
      *退職者家族：件数
               05  SKT4000-TAK-SKENSU      PIC  X(05).
      *退職者家族：点数
               05  SKT4000-TAK-STENSU      PIC  X(09).
      *老人：件数
               05  SKT4000-RJN-SKENSU      PIC  X(05).
      *老人：点数
               05  SKT4000-RJN-STENSU      PIC  X(09).
      *食事療養費：件数
               05  SKT4000-SKJ-SKENSU      PIC  X(05).
      *食事療養費：金額
               05  SKT4000-SKJ-STENSU      PIC  X(10).
      *合計
           03  SKT4000-SUM.
      *国保・退職者・老人合計：入院件数
               05  SKT4000-N-GKENSU        PIC  X(05).
      *国保・退職者・老人合計：入院点数
               05  SKT4000-N-GTENSU        PIC  X(09).
      *国保・退職者・老人合計：入院一件当り点数
               05  SKT4000-N-AVG           PIC  X(09).
      *国保・退職者・老人合計：外来件数
               05  SKT4000-G-GKENSU        PIC  X(05).
      *国保・退職者・老人合計：外来点数
               05  SKT4000-G-GTENSU        PIC  X(09).
      *国保・退職者・老人合計：外来一件当り点数
               05  SKT4000-G-AVG           PIC  X(09).
      *諸公費合計：件数
               05  SKT4000-KOH1-GKENSU     PIC  X(05).
      *諸公費合計：点数
               05  SKT4000-KOH1-GTENSU     PIC  X(09).
      *障・乳・母合計国保：件数
               05  SKT4000-KOH2-GKENSU     PIC  X(05).
      *障・乳・母合計国保：点数
               05  SKT4000-KOH2-GTENSU     PIC  X(09).
      *障・乳・母合計医保：件数
               05  SKT4000-KOH3-GKENSU     PIC  X(05).
      *障・乳・母合計医保：点数
               05  SKT4000-KOH3-GTENSU     PIC  X(09).
