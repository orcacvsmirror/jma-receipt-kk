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
      ********************************************************************
      *    後期高齢者請求総括表 （岩手県）     COPY (SKT0305.INC) 
      *
      *  作成日付    作業者        記述
      *  08/04/22    佐藤          新規作成(後期高齢者対応)
      ********************************************************************
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      *  01.00.01    吉川         10/09/22  日数のバイト数増加
      *  01.00.02    吉川         11/04/11  東北地方太平洋沖地震対応
      ********************************************************************
       01  SKT0305.
      *    印刷年月
           03  SKT0305-SRYYM               PIC X(16).
      *    医療機関住所
           03  SKT0305-ADRS                PIC X(100).
      *    医療機関TEL
           03  SKT0305-TEL                 PIC X(15).
      *    医療機関名称
           03  SKT0305-HOSPNAME            PIC X(100).
      *    開設者名
           03  SKT0305-KAISETUNAME         PIC X(40).
      *    医療機関コード
           03  SKT0305-HOSPCD              PIC X(40).
      *    ページ番号
           03  SKT0305-NO                  PIC X(04).
      *    請求テーブル
           03  SKT0305-SEIKYU-TBL   OCCURS 2.
      *    入外テーブル
               05  SKT0305-NYUGAI-TBL   OCCURS 2.
      *    県別テーブル
                   07  SKT0305-PREF-TBL  OCCURS  2 TIMES.
      *    件数
                       09  SKT0305-KENSU   PIC X(05).
      *    日数
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) start
      *                 09  SKT0305-NISSU   PIC X(05).
                       09  SKT0305-NISSU   PIC X(06).
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) end
      *    点数
                       09  SKT0305-TENSU   PIC X(09).
      *    在宅テーブル
           03  SKT0305-ZAI-TBL      OCCURS  2 TIMES.
      *    県別テーブル
               05  SKT0305-ZPREF-TBL    OCCURS  2 TIMES.
      *    件数
                   07  SKT0305-ZKENSU      PIC X(5).
      *    日数
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) start
      *             07  SKT0305-ZNISSU      PIC X(5).
                   07  SKT0305-ZNISSU      PIC X(6).
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) end
      *    点数
                   07  SKT0305-ZTENSU      PIC X(9).
      *    食事療養・生活療養テーブル
           03  SKT0305-SKJ-TBL.
      *    県別テーブル
               05  SKT0305-SPREF-TBL    OCCURS  2 TIMES.
      *    件数
                   07  SKT0305-SKENSU      PIC X(5).
      *    日数
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) start
      *             07  SKT0305-SNISSU      PIC X(5).
                   07  SKT0305-SNISSU      PIC X(6).
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) end
      *    点数
                   07  SKT0305-STENSU      PIC X(9).
      *    合計テーブル
           03  SKT0305-GOKEI-TBL    OCCURS  2 TIMES.
      *    県別テーブル
               05  SKT0305-GPREF-TBL    OCCURS  2 TIMES.
      *    件数
                   07  SKT0305-GKENSU      PIC X(5).
      *    日数
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) start
      *             07  SKT0305-GNISSU      PIC X(5).
                   07  SKT0305-GNISSU      PIC X(7).
      *=== 日数のバイト数増加 by Yoshikawa(2010/09/22) end
      *    点数
                   07  SKT0305-GTENSU      PIC X(9).
      *    請求先テーブル（県内）
      *=== 災害対応 by Yoshikawa(2011/04/11) start
      *     03  SKT0305-NHKNJA-TBL   OCCURS  35 TIMES.
           03  SKT0305-NHKNJA-TBL   OCCURS  36 TIMES.
      *=== 災害対応 by Yoshikawa(2011/04/11) end
      *    保険者
               05  SKT0305-NHKNJA          PIC X(2).
      *    請求先県名テーブル（県外）
           03  SKT0305-KENMEI-TBL   OCCURS  14 TIMES.
      *    県名
               05  SKT0305-KENMEI          PIC X(6).
      *    請求先件数テーブル（指定県）
           03  SKT0305-GHKNJA-TBL   OCCURS  8 TIMES.
      *    件数
               05  SKT0305-GHKNJA          PIC X(2).
      *    請求先件数テーブル
           03  SKT0305-GHKNJA-TBL2   OCCURS  14 TIMES.
      *    件数
               05  SKT0305-GHKNJA2         PIC X(2).
      *    請求先件数合計テーブル
           03  SKT0305-GOKEIHKNJA-TBL    OCCURS  2 TIMES.
      *    件数
               05  SKT0305-GOKEIHKNJA      PIC X(3).
