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
        01  SC03.
      *表示年月
            03  SC03-PRTYM          PIC X(16).
      *医療機関コード
            03  SC03-HOSPCDN        PIC X(20).
      *請求年月日
            03  SC03-SEIYMD         PIC X(22).
      *診療科
            03  SC03-SRYKA          PIC X(02).
      *住所
            03  SC03-ADRS           PIC X(100).
      *医療機関名
            03  SC03-HOSPNAME       PIC X(100).
      *管理者名
            03  SC03-KAISETUNAME    PIC X(60).
      *電話番号
            03  SC03-TEL            PIC X(26).
      *診療テーブル
            03  SC03-SRYTBL     OCCURS  10 TIMES.
      *受給者番号
                05  SC03-JKYSNUM1   PIC X(06).
                05  SC03-JKYSNUM2   PIC X(22).
      *受診者氏名
                05  SC03-NAME       PIC X(20).
      *入外区分
                05  SC03-NYUGAIKBN  PIC X(02)    OCCURS  2 TIMES.
      *保険区分：社保・国保・退職者
                05  SC03-HKNKBN     PIC X(02)    OCCURS  3 TIMES.
      *前期高齢者
                05  SC03-KOREI      PIC X(01).
      *長期
                05  SC03-TYOKI      PIC X(01).
      *総点数
                05  SC03-TENSU      PIC X(07)    OCCURS  3 TIMES.
      *結予・精神公費対象点数
                05  SC03-KOHTENSU   PIC X(07).
      *薬剤一部負担金
                05  SC03-YKZFTN     PIC X(06).
      *患者負担額
                05  SC03-ITBFTN     PIC X(06).
      *食事療養基準額
                05  SC03-SKINGK     PIC X(06).
      *食事療養標準負担額
                05  SC03-SFTNGK     PIC X(06).
      *月後れ用備考欄
                05  SC03-BIKO       PIC X(16).
      *合計テーブル
            03  SC03-SUM-TBL.
      *件数
                05  SC03-GKENSU     PIC X(02)    OCCURS  3 TIMES.
      *総点数
                05  SC03-GTENSU     PIC X(09)    OCCURS  3 TIMES.
      *結予・精神公費対象点数
                05  SC03-GKOHTENSU  PIC X(07).
      *薬剤一部負担金
                05  SC03-GYKZFTN    PIC X(07).
      *患者負担額
                05  SC03-GITBFTN    PIC X(07).
      *食事療養基準額・件数
                05  SC03-GSKENSU    PIC X(02).
                05  SC03-GSKINGK    PIC X(07).
      *食事療養標準負担額
                05  SC03-GSFTNGK    PIC X(07).
      *公費判定
                05  SC03-KOHKBN     PIC X(02)    OCCURS 3.
