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
      * this licence along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID.             SOKATU4025.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 福岡・広域連合・診療報酬請求書
      *  管理者            : 
      *  作成日付    作業者        記述
      *  08/04/24    吉川          新規作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者  日付        内容
      *  01.00.01    吉川    2008/04/29  原爆データを記載外公費ではなく
      *                                  通常の公費から取得するよう修正
      *  01.00.02    吉川    2008/12/10  公費番号欄に法別番号ではなく
      *                                  保険番号が印字される不具合を修正
      *  01.00.03    内田    2009/10/16  中国九州北部豪雨対応（対象者別集計）
      *  01.00.04    吉川    2009/11/06  シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *  01.00.05    吉川    2009/11/19  食事が無く生活療養のみの場合でも
      *                                  食事件数が集計される不具合を修正
      *  01.00.06    吉川    2010/01/22  オンライン返戻対応
      *  01.00.07    吉川    2010/05/14  広域連合の保険者番号指定対応
      *  01.00.08    吉川    2010/06/10  公費欄の1行目は常に「19」が
      *                                  印字されているのを修正
      *  01.00.09    吉川    2010/12/16  open-cobol1.0対応
      *  01.00.10    吉川    2012/05/17  在宅はまとめて集計するように修正
      *                                  シス管「1901」で設定した電話番号が
      *                                  印字されるように修正
      *                                  PERFORM→GOTOに修正
      *  01.00.11    吉川    2012/07/04  シス管「2010」の公費再掲欄への
      *                                  地方公費記載設定対応
      *  01.00.12    吉川    2013/01/22  医療機関情報編集対応
      *  01.00.18    吉川    2014/10/27  ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.19    萩野    2015/11/13  医療機関編集情報への開設者名追加対応
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    請求書一時ファイル
           SELECT  SKT4025TMP-FILE ASSIGN    SKT4025TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4025TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4025.
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
      *    請求ＤＢ更新用ファイル
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL 
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
      *    エラーファイル
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
       FD  SKT4025TMP-FILE.
           COPY    "CPSKT4025TMP.INC".
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
      *    請求ＤＢ更新用ファイル
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
      *    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
       WORKING-STORAGE             SECTION.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    請求書一時ファイル 名称領域
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4025TP//.
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
      *    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      *    エラーファイル 名称領域 
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT4025.INC".
      *
      *    スパ領域
       01  STS-AREA.
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           03  STS-SKT4025         PIC X(02).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-ERR             PIC 9(01).
           03  FLG-KOH-END         PIC 9(01).
           03  FLG-UPD             PIC 9(01).
      *     
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01). 
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01). 
           03  FLG-PTINF           PIC 9(01).
      *     
           03  FLG-PRTKBN          PIC 9(01).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           03  FLG-SKT4025TMP      PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
           03  FLG-2010            PIC 9(01).
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX                 PIC 9(04).
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           03  IDX4                PIC 9(04).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           03  IDXX                PIC 9(04).
           03  IDXY                PIC 9(04).
      *
           03  IDY                 PIC 9(04).
           03  IDY2                PIC 9(04).
           03  IDY3                PIC 9(04).
           03  IDY4                PIC 9(04).
      *     
           03  IDZ                 PIC 9(04).
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-HOSPNUM    PIC 9(02).
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
           03  WRK-PARA-SYOKBN1    PIC X(01).
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT             PIC 9(02).
           03  WRK-KOHNUM          PIC X(03).
           03  WRK-HKNJANUM        PIC X(06).
      *
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-KOHNUM9         PIC Z9.
           03  WRK-PAGE            PIC ZZZ9.
      *
           03  WRK-MAE-INPUT       PIC X(200).
           03  WRK-OUT-INPUT       PIC X(200).
      *
           03  WRK-RECEERR         PIC X(200). 
           03  WRK-ERRMSG          PIC X(300). 
      *
           03  WRK-PATH            PIC X(50).
           03  WRK-MCP-TABLE       PIC X(64).
           03  WRK-MCP-PATHNAME    PIC X(64).
      *
           03  WRK-SYOKBN          PIC X(01).
           03  WRK-INDEX           PIC 9(02).
      *
      *    公費名称編集
           03  WRK-KOHKBN.
               05  WRK-KOHNUM        PIC X(03).
               05  WRK-HKNNAME       PIC X(20). 
           03  WRK-MEISYO          PIC X(44).
      *
      *    医療機関情報
           03  WRK-HOSPNAME        PIC X(100).
           03  WRK-HOSPNAME-R      REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1   PIC X(50).
               05  WRK-HOSPNAME2   PIC X(50).
           03  WRK-HOSPADRS        PIC X(100).
           03  WRK-HOSPADRS-R      REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1   PIC X(50).
               05  WRK-HOSPADRS2   PIC X(50).
           03  WRK-HOSPTEL         PIC X(15).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
                                   PIC X(03)   OCCURS  10.
           03  WRK-2007-MAX        PIC 9(03).
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
       01  WRK-2010-AREA.
           03  WRK-2010-TBL          OCCURS  100.
               05  WRK-2010-KOHNUM   PIC X(03).
           03  WRK-2010-MAX          PIC 9(03).
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-KOH             PIC 9(02).
      *
      *    集計領域
       01  SUM-AREA.
           03  SUM-TBL-SRYKA       PIC X(02).
           03  SUM-TABLE.
      *        後期高齢者
               05  SUM-TBL             OCCURS  2.
                   07  SUM-NYUGAI-TBL       OCCURS  2.
                       09  SUM-KENSU           PIC  9(06).
                       09  SUM-NISSU           PIC  9(06).
                       09  SUM-TENSU           PIC  9(10).
                       09  SUM-ITBFTN          PIC  9(10).
                   07  SUM-S-KENSU             PIC  9(06).
                   07  SUM-S-NISSU             PIC  9(06).
                   07  SUM-S-KINGK             PIC  9(10).
                   07  SUM-S-FTNGK             PIC  9(10).
      *
      *        原爆
               05  SUM-GENBK-TBL.
                   07  SUM-GNYUGAI-TBL      OCCURS  2.
                       09  SUM-GKENSU          PIC  9(06).
                       09  SUM-GNISSU          PIC  9(06).
                       09  SUM-GTENSU          PIC  9(10).
                       09  SUM-GITBFTN         PIC  9(10).
                       09  SUM-GPTFTN          PIC  9(10).
                   07  SUM-S-GKENSU            PIC  9(06).
                   07  SUM-S-GNISSU            PIC  9(06).
                   07  SUM-S-GKINGK            PIC  9(10).
                   07  SUM-S-GFTNGK            PIC  9(10).
      *        公費負担 
               05  SUM-KOH-TBL         OCCURS  100.
                   07  SUM-KOHNUM              PIC  X(03).
                   07  SUM-KOH-NYUGAI-TBL   OCCURS  2.
                       09  SUM-KKENSU          PIC  9(06).
                       09  SUM-KNISSU          PIC  9(06).
                       09  SUM-KTENSU          PIC  9(10).
                       09  SUM-KITBFTN         PIC  9(10).
                       09  SUM-KPTFTN          PIC  9(10).
                   07  SUM-S-KKENSU            PIC  9(06).
                   07  SUM-S-KNISSU            PIC  9(06).
                   07  SUM-S-KKINGK            PIC  9(10).
                   07  SUM-S-KFTNGK            PIC  9(10).
                   07  SUM-KOH-MEISYO          PIC  X(44).
      *
      *    キー領域
       01  KEY-AREA                    VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-HKNJANUM      PIC X(08).
           03  KEY-OLD.
               05  KEY-O-HKNJANUM      PIC X(08). 
      *
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *
           COPY    "COMMON-SPA".
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *    診療科目情報
           COPY    "CPSK1005.INC".
      *
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *=== 広域連合の保険者番号指定対応 by Yoshikawa(2010/05/14) start
      *    レセプト・総括印刷情報（広域連合）
           COPY    "CPSK200501.INC".
      *=== 広域連合の保険者番号指定対応 by Yoshikawa(2010/05/14) end
      *
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
      *    地方公費保険番号付加情報
           COPY    "CPSK2010.INC".
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      * 
      ******************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *   ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    印刷ＤＢ更新サブ
           COPY    "CPORCSPRT.INC".
      *
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *
      *    共通パラメタ
           COPY    "MCPAREA".
      *
           COPY    "MCPDATA.INC".
      *
      *   半角チェックサブ
           COPY  "CPORCSKANACHK.INC".
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      ****************************************************************
       LINKAGE                 SECTION.
       01  COMMAND-PARAM.
           02  FILLER      PIC X(256).
      ****************************************************************
       PROCEDURE           DIVISION
               USING
           COMMAND-PARAM.
      *****************************************************************
      *    主　　処理
      *****************************************************************
       000-PROC-SEC                SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           PERFORM 200-MAIN-SEC
                   UNTIL       FLG-END     =   1
      *
           PERFORM 300-END-SEC
      *
           STOP    RUN
           .
      *****************************************************************
      *    初期　処理
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           INITIALIZE                  FLG-AREA
           INITIALIZE                  STS-AREA
           INITIALIZE                  WRK-AREA
           INITIALIZE                  CNT-AREA
           INITIALIZE                  SPA-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
           DISPLAY  "START"
      *
           PERFORM 100-DBOPEN-SEC
      *
           UNSTRING   COMMAND-PARAM    DELIMITED  BY  ","
                                       INTO    LNK-PRTKANRI-RENNUM
                                               LNK-PRTKANRI-TBL-KEY
                                               LNK-PRTKANRI-TBL-GROUP
                                               LNK-PRTKANRI-SHORI-RENNUM
                                               LNK-PRTKANRI-SRYYM
                                               LNK-PRTKANRI-SKYYMD
                                               LNK-PRTKANRI-SHELLID
                                               LNK-PRTKANRI-PRIORITY
                                               LNK-PRTKANRI-TERMID
                                               LNK-PRTKANRI-OPID    
                                               LNK-PRTKANRI-PRTNM    
                                               WRK-PARA-HOSPNUM
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
                                               WRK-PARA-SYOKBN1
                                               RECEERR
           END-UNSTRING
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU4025"    TO  JOB-PGID
           MOVE    "広域連合・診療報酬請求書"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
                                   SPA-AREA
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           MOVE    "SKT4025"           TO  SKT4025TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4025TP-TERMID
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4025TP-HOSPNUM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           MOVE  SKT4025TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT4025TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SRYYMD (1:6)
           MOVE    "01"                TO  WRK-SRYYMD (7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE    "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH 
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY2-AREA
           MOVE    "21"                TO  LNK-DAY2-IRAI
           MOVE    LNK-PRTKANRI-SKYYMD     TO  LNK-DAY2-YMD
           CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                               LNK-DAY2-AREA
           IF      STS-DAY-RC1         =   ZERO 
                   MOVE    LNK-DAY2-EDTYMD3    TO  WRK-SEIYMDWH
           END-IF
      *
      *    医療機関ＩＤ編集
           INITIALIZE                  SYS-1001-REC
           MOVE    "1001"              TO  SYS-1001-KANRICD
           MOVE    "*"                 TO  SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
           MOVE    SYS-1001-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1001-REC
               IF      SYS-1001-HOSPNAME   =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-HOSPNAME
               END-IF    
               IF      SYS-1001-KAISETUNAME    =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-KAISETUNAME
               END-IF    
           ELSE
               MOVE    "医療機関情報が取得できませんでした"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE                  SYS-1002-REC
           MOVE    "1002"              TO  SYS-1002-KANRICD
           MOVE    "*"                 TO  SYS-1002-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
           MOVE    SYS-1002-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC        TO  SYS-1002-REC
               IF      SYS-1002-ADRS       =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1002-ADRS
               END-IF    
           ELSE
               MOVE    "医療機関情報（所在地）が取得できませんでした"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF 
      *
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *
      *    公費番号まとめ情報
           INITIALIZE                      WRK-2007-AREA
      *
           INITIALIZE                      SYS-2007-REC
           MOVE    "2007"              TO  SYS-2007-KANRICD
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-2007-STYUKYMD (1:6)
           MOVE    "01"                TO  SYS-2007-STYUKYMD (7:2)
           MOVE    SYS-2007-STYUKYMD   TO  SYS-2007-EDYUKYMD
           MOVE    WRK-PARA-HOSPNUM    TO  SYS-2007-HOSPNUM
           MOVE    SYS-2007-REC        TO  MCPDATA-REC
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           MOVE    "DBSELECT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC          =   ZERO
               MOVE    "tbl_syskanri"  TO  WRK-MCP-TABLE
               MOVE    "key2"          TO  WRK-MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    ZERO            TO  IDX
           PERFORM         UNTIL   FLG-SYSKANRI   =   1
                           OR      IDX            >=  100
               MOVE    MCPDATA-REC         TO  SYS-2007-REC
      *
               ADD     1                   TO  IDX
               MOVE    SYS-2007-MEISYO(1) TO  WRK-2007-MEISYO(IDX)
               PERFORM VARYING IDY FROM    1   BY  1
                       UNTIL   IDY >       10
                       OR      SYS-2007-KOHNUM (IDY)   =   SPACE
                   MOVE    SYS-2007-KOHNUM (IDY)
                                           TO WRK-2007-KOHNUM(IDX IDY)
               END-PERFORM
      *
               MOVE    "tbl_syskanri"      TO  WRK-MCP-TABLE
               MOVE    "key2"              TO  WRK-MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           END-PERFORM
      *
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           MOVE    IDX                     TO  WRK-2007-MAX
      *
      *=== 広域連合の保険者番号指定対応 by Yoshikawa(2010/05/14) start
      *    レセプト・総括編集情報
      *    区分コード０１のデータ読み込み
           MOVE    SPACE               TO  SYS-200501-REC
           INITIALIZE                      SYS-200501-REC
           MOVE    "2005"              TO  SYS-200501-KANRICD
           MOVE    "01"                TO  SYS-200501-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-200501-STYUKYMD (1:6)
           MOVE    "01"                TO  SYS-200501-STYUKYMD (7:2)
           MOVE    SYS-200501-STYUKYMD TO  SYS-200501-EDYUKYMD
           MOVE    WRK-PARA-HOSPNUM    TO  SYS-200501-HOSPNUM
           MOVE    SYS-200501-REC      TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-200501-REC
           ELSE
               INITIALIZE                      SYS-200501-REC
           END-IF
           IF      SYS-200501-KOUIKIPRTKBN
                                       =   SPACE
               MOVE    "0"                 TO  SYS-200501-KOUIKIPRTKBN
           END-IF
      *
           IF      SYS-200501-KOUIKIPRTKBN
                                       =   "1"
               CONTINUE
           ELSE
               MOVE    "00000000"          TO  WRK-PARA-HKNJANUM
           END-IF
      *
           DISPLAY "SYS-200501-KOUIKIPRTKBN=" SYS-200501-KOUIKIPRTKBN
           DISPLAY "WRK-PARA-HKNJANUM      =" WRK-PARA-HKNJANUM
      *=== 広域連合の保険者番号指定対応 by Yoshikawa(2010/05/14) end
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
      *    請求書公費再掲欄記載情報
           INITIALIZE                      WRK-2010-AREA
      *
           INITIALIZE                      SYS-2010-REC
           MOVE    "2010"              TO  SYS-2010-KANRICD
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-2010-STYUKYMD (1:6)
           MOVE    "01"                TO  SYS-2010-STYUKYMD (7:2)
           MOVE    SYS-2010-STYUKYMD   TO  SYS-2010-EDYUKYMD
           MOVE    WRK-PARA-HOSPNUM    TO  SYS-2010-HOSPNUM
           MOVE    SYS-2010-REC        TO  MCPDATA-REC
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           MOVE    "DBSELECT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC          =   ZERO
               MOVE    "tbl_syskanri"  TO  MCP-TABLE
               MOVE    "key2"          TO  MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    ZERO            TO  IDX
           PERFORM         UNTIL   FLG-SYSKANRI   =   1
                           OR      IDX            >=  100
               MOVE    MCPDATA-REC         TO  SYS-2010-REC
               IF    ( SYS-2010-SAIKEIKBN  =   "1"         )
               AND   ( SYS-2010-SAIKEI-TAIKBN
                                           =   "0" OR  "1" )
                   ADD     1                   TO  IDX
                   MOVE    SYS-2010-KBNCD(1:3) TO WRK-2010-KOHNUM (IDX)
               END-IF
      *
               MOVE    "tbl_syskanri"  TO  MCP-TABLE
               MOVE    "key2"          TO  MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           END-PERFORM
      *
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    IDX                 TO  WRK-2010-MAX
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    処理区分によってキーを分ける(SYOKBN1=2→特別療養費)
           EVALUATE    WRK-PARA-SYOKBN
               WHEN    "1"
                   MOVE    "key66"         TO  WRK-MCP-PATHNAME
               WHEN    "2"
                   MOVE    "key65"         TO  WRK-MCP-PATHNAME
           END-EVALUATE
      *
           MOVE    "tbl_seikyu"        TO  WRK-MCP-TABLE
           PERFORM 900-SEIKYU-SELECT-SEC
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    処理区分(0=全体 1=当月・月遅れ 2=返戻分)で分ける
      *     EVALUATE    WRK-PARA-SYOKBN
      *         WHEN    ZERO
      *         WHEN    "2"
      *             MOVE    "2"         TO  WRK-SYOKBN
      *             PERFORM 2001-SYOKBN-SYUKEI-SEC
      *     END-EVALUATE
      *     EVALUATE    WRK-PARA-SYOKBN
      *         WHEN    ZERO
      *         WHEN    "1"
      *             MOVE    "1"         TO  WRK-SYOKBN
      *             PERFORM 2001-SYOKBN-SYUKEI-SEC
      *     END-EVALUATE
      *
      *     CLOSE   UPD-FILE
      *
           OPEN    OUTPUT  SKT4025TMP-FILE
           CLOSE           SKT4025TMP-FILE
           OPEN    I-O     SKT4025TMP-FILE
           
           MOVE    ZERO                TO  FLG-UPD
      *
           PERFORM 2001-KOUKI-SYUKEI-SEC
                   UNTIL   FLG-END  =  1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT4025TMP-FILE
      *
           IF       FLG-UPD   =       1
                    PERFORM   2002-PRINT-SEC
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *
      *    請求ＤＢ更新
           IF      FLG-UPD        =   1
           AND     FLG-ERR        =   ZERO 
               IF      CNT-UPDFILE    >   ZERO
                   PERFORM 310-SEIKYU-UPD-SEC
               END-IF
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    処理区分集計処理
      *****************************************************************
       2001-SYOKBN-SYUKEI-SEC         SECTION.
      *
      *    入院外（その他のレセ）・入院集計
      *    
           MOVE    LOW-VALUE           TO  KEY-AREA
           MOVE    1                   TO  WRK-INDEX
      *
      *    処理区分によってキーを分ける(SYOKBN1=2→特別療養費)
           EVALUATE    WRK-SYOKBN      ALSO    WRK-PARA-SYOKBN1
               WHEN    "1"             ALSO    "1"
                   MOVE    "key62"         TO  WRK-MCP-PATHNAME
               WHEN    "2"             ALSO    "1"
                   MOVE    "key61"         TO  WRK-MCP-PATHNAME
               WHEN    "1"             ALSO    "2"
                   MOVE    "key66"         TO  WRK-MCP-PATHNAME
               WHEN    "2"             ALSO    "2"
                   MOVE    "key65"         TO  WRK-MCP-PATHNAME
           END-EVALUATE  
           MOVE    "tbl_seikyu"        TO  WRK-MCP-TABLE
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           PERFORM 200-HENSYU-SEC  UNTIL   FLG-RECE10   =   1 
                                   OR      FLG-ERR      =   1
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
      *    入院外集計（在総診または在医総を算定したレセ）
      *    特別療養費の場合は在総診はなし
           IF    ( FLG-ERR             =   ZERO )
           AND   ( WRK-PARA-SYOKBN1    =   "1"  )
               MOVE    LOW-VALUE           TO  KEY-AREA
               MOVE    2                   TO  WRK-INDEX
      *         
               EVALUATE    WRK-SYOKBN
                   WHEN    "1"
                       MOVE    "key64"     TO  WRK-MCP-PATHNAME
                   WHEN    "2"
                       MOVE    "key63"     TO  WRK-MCP-PATHNAME
               END-EVALUATE  
               MOVE    "tbl_seikyu"        TO  WRK-MCP-TABLE
               PERFORM 900-SEIKYU-SELECT-SEC
      *
               PERFORM 200-HENSYU-SEC  UNTIL   FLG-RECE10   =  1
                                       OR      FLG-ERR      =  1
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
           END-IF
      *     
           MOVE    1                   TO  FLG-END
      *
           .
       2001-SYOKBN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計処理
      *****************************************************************
       200-HENSYU-SEC                SECTION.
      *
           INITIALIZE                  SUM-AREA
      *
      *    キー毎に集計
           MOVE    KEY-NEW             TO  KEY-OLD
           PERFORM             UNTIL   FLG-END     =   1
                               OR      KEY-NEW NOT =   KEY-OLD
      *        保険者別集計処理
               PERFORM 2001-KOUKI-SYUKEI-SEC
           END-PERFORM
      *
      *   印刷処理
          IF      FLG-UPD        =   1
          AND     FLG-ERR        =   ZERO
               PERFORM 2002-PRINT-SEC
          END-IF
           .
       200-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者別集計処理
      *****************************************************************
       2001-KOUKI-SYUKEI-SEC                SECTION.
      *
           INITIALIZE                       IDX-AREA
                                            FLG-UPD
                                            WRK-HKNJANUM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
                                            SKT4025TMP-REC
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    保険者番号
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  WRK-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  WRK-HKNJANUM(1:6)
           END-IF
      *    代表番号セット
           PERFORM  200101-HKNJANUM-SET-SEC
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           MOVE  WRK-HKNJANUM            TO  SKT4025TMP-HKNJANUM
      *
      *    在宅
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) start
      *     IF     RECE10-ZAITAKU    =    "1"
      *       MOVE     "1"                TO   SKT4025TMP-ZAITAKU
      *     ELSE
      *       MOVE     "2"                TO   SKT4025TMP-ZAITAKU
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) end
      *
      *    出力順
           IF     RECE10-PREFKBN   =    "1"
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) start
      *       MOVE     "1"                TO   SKT4025TMP-SYUTURYOKU
             MOVE     1                  TO   SKT4025TMP-SYUTURYOKU
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) end
           ELSE
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) start
      *       MOVE     "2"                TO   SKT4025TMP-SYUTURYOKU
             MOVE     2                  TO   SKT4025TMP-SYUTURYOKU
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) end
           END-IF
      *
      *    中国九州北部豪雨の対象者は別帳票
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  RECE10-ETC-YKZFTN (1) TO  SKT4025TMP-GENMEN
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
      *    入外区分
           EVALUATE    RECE10-NYUGAIKBN
               WHEN    "1"
                   MOVE    1                   TO  IDX3
               WHEN    "2"
                   MOVE    2                   TO  IDX3
           END-EVALUATE
      *
      *    給付割合
           EVALUATE    RECE10-KYURATE
               WHEN    9
                   MOVE    1                   TO  IDX1
               WHEN    7
                   MOVE    2                   TO  IDX1
           END-EVALUATE
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           PERFORM  800-SKTTMP-READ-SEC
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
           PERFORM 20011-HKN-SYUKEI-SEC
      *
      *    公費負担分
           IF      RECE10-KOHNUM (1)   NOT =   SPACE  OR
                   RECE10-KOHNUM (2)   NOT =   SPACE  OR
                   RECE10-KOHNUM (3)   NOT =   SPACE  OR
                   RECE10-KOHNUM (4)   NOT =   SPACE
               PERFORM 20012-KOH-SYUKEI-SEC
           END-IF
      *
      *    原爆
      *=== 原爆取得データ修正 by Yoshikawa(2008/04/29) start
      *     IF  RECE10-ETC-KOHNUM (1)  = "019"  OR
      *         RECE10-ETC-KOHNUM (2)  = "019"  OR
      *         RECE10-ETC-KOHNUM (3)  = "019"  OR
      *         RECE10-ETC-KOHNUM (4)  = "019"
      *    既定公費集計
           PERFORM  VARYING  IDXX  FROM  1  BY  1
                    UNTIL    IDXX  >  4
             IF  RECE10-KOHNUM(IDXX)  =  "019"
               PERFORM 20013-GENBK-SYUKEI-SEC
             END-IF
           END-PERFORM
      *=== 原爆取得データ修正 by Yoshikawa(2008/04/29) end
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           IF      FLG-SKT4025TMP  =  1
               WRITE   SKT4025TMP-REC
           ELSE
               REWRITE SKT4025TMP-REC
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 20014-UPD-FILE-HENSYU-SEC
      *
               MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
               MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    SPACE               TO  WRK-RECEERR
               STRING "集計対象外　患者番号＝"     DELIMITED  BY  SIZE
                       RECE10-PTNUM                DELIMITED  BY  SPACE
                       " 診療年月＝"               DELIMITED  BY  SIZE
                       RECE10-SRYYM                DELIMITED  BY  SIZE
                       " レセ種別＝"               DELIMITED  BY  SIZE
                       RECE10-RECESYUBETU          DELIMITED  BY  SIZE
                                           INTO    WRK-RECEERR
               END-STRING
               PERFORM 500-ERR-HENSYU-SEC
               PERFORM 500-COBABORT-SEC
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
               MOVE    1                   TO  FLG-END
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           END-IF 
           .
       2001-KOUKI-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    広域連合・代表番号セット
      *****************************************************************
       200101-HKNJANUM-SET-SEC                SECTION.
      *
           EVALUATE  WRK-HKNJANUM(1:2)
      *      北海道
             WHEN  "01"
                 MOVE  "010004"  TO  WRK-HKNJANUM
      *      青森県
             WHEN  "02"
                 MOVE  "020003"  TO  WRK-HKNJANUM
      *      岩手県
             WHEN  "03"
                 MOVE  "030002"  TO  WRK-HKNJANUM
      *      宮城県
             WHEN  "04"
                 MOVE  "040001"  TO  WRK-HKNJANUM
      *      秋田県
             WHEN  "05"
                 MOVE  "050000"  TO  WRK-HKNJANUM
      *      山形県
             WHEN  "06"
                 MOVE  "060009"  TO  WRK-HKNJANUM
      *      福島県
             WHEN  "07"
                 MOVE  "070008"  TO  WRK-HKNJANUM
      *      茨城県
             WHEN  "08"
                 MOVE  "080007"  TO  WRK-HKNJANUM
      *      栃木県
             WHEN  "09"
                 MOVE  "090006"  TO  WRK-HKNJANUM
      *      群馬県
             WHEN  "10"
                 MOVE  "100003"  TO  WRK-HKNJANUM
      *      埼玉県
             WHEN  "11"
                 MOVE  "110002"  TO  WRK-HKNJANUM
      *      千葉県
             WHEN  "12"
                 MOVE  "120001"  TO  WRK-HKNJANUM
      *      東京都
             WHEN  "13"
                 MOVE  "130000"  TO  WRK-HKNJANUM
      *      神奈川県
             WHEN  "14"
                 MOVE  "140009"  TO  WRK-HKNJANUM
      *      新潟県
             WHEN  "15"
                 MOVE  "150008"  TO  WRK-HKNJANUM
      *      富山県
             WHEN  "16"
                 MOVE  "160007"  TO  WRK-HKNJANUM
      *      石川県
             WHEN  "17"
                 MOVE  "170006"  TO  WRK-HKNJANUM
      *      福井県
             WHEN  "18"
                 MOVE  "180005"  TO  WRK-HKNJANUM
      *      山梨県
             WHEN  "19"
                 MOVE  "190004"  TO  WRK-HKNJANUM
      *      長野県
             WHEN  "20"
                 MOVE  "200001"  TO  WRK-HKNJANUM
      *      岐阜県
             WHEN  "21"
                 MOVE  "210000"  TO  WRK-HKNJANUM
      *      静岡県
             WHEN  "22"
                 MOVE  "220009"  TO  WRK-HKNJANUM
      *      愛知県
             WHEN  "23"
                 MOVE  "230008"  TO  WRK-HKNJANUM
      *      三重県
             WHEN  "24"
                 MOVE  "240007"  TO  WRK-HKNJANUM
      *      滋賀県
             WHEN  "25"
                 MOVE  "250006"  TO  WRK-HKNJANUM
      *      京都府
             WHEN  "26"
                 MOVE  "260005"  TO  WRK-HKNJANUM
      *      大阪府
             WHEN  "27"
                 MOVE  "270004"  TO  WRK-HKNJANUM
      *      兵庫県
             WHEN  "28"
                 MOVE  "280003"  TO  WRK-HKNJANUM
      *      奈良県
             WHEN  "29"
                 MOVE  "290002"  TO  WRK-HKNJANUM
      *      和歌山県
             WHEN  "30"
                 MOVE  "300009"  TO  WRK-HKNJANUM
      *      鳥取県
             WHEN  "31"
                 MOVE  "310008"  TO  WRK-HKNJANUM
      *      島根県
             WHEN  "32"
                 MOVE  "320007"  TO  WRK-HKNJANUM
      *      岡山県
             WHEN  "33"
                 MOVE  "330006"  TO  WRK-HKNJANUM
      *      広島県
             WHEN  "34"
                 MOVE  "340005"  TO  WRK-HKNJANUM
      *      山口県
             WHEN  "35"
                 MOVE  "350004"  TO  WRK-HKNJANUM
      *      徳島県
             WHEN  "36"
                 MOVE  "360003"  TO  WRK-HKNJANUM
      *      香川県
             WHEN  "37"
                 MOVE  "370002"  TO  WRK-HKNJANUM
      *      愛媛県
             WHEN  "38"
                 MOVE  "380001"  TO  WRK-HKNJANUM
      *      高知県
             WHEN  "39"
                 MOVE  "390000"  TO  WRK-HKNJANUM
      *      福岡県
             WHEN  "40"
                 MOVE  "400007"  TO  WRK-HKNJANUM
      *      佐賀県
             WHEN  "41"
                 MOVE  "410006"  TO  WRK-HKNJANUM
      *      長崎県
             WHEN  "42"
                 MOVE  "420005"  TO  WRK-HKNJANUM
      *      熊本県
             WHEN  "43"
                 MOVE  "430004"  TO  WRK-HKNJANUM
      *      大分県
             WHEN  "44"
                 MOVE  "440003"  TO  WRK-HKNJANUM
      *      宮崎県
             WHEN  "45"
                 MOVE  "450002"  TO  WRK-HKNJANUM
      *      鹿児島県
             WHEN  "46"
                 MOVE  "460001"  TO  WRK-HKNJANUM
      *      沖縄県
             WHEN  "47"
                 MOVE  "470000"  TO  WRK-HKNJANUM
           END-EVALUATE
      *
           .
       200101-HKNJANUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計処理
      *****************************************************************
       20011-HKN-SYUKEI-SEC          SECTION.
      *
           IF      IDX1             =   ZERO
           OR      IDX3            =   ZERO 
               PERFORM  20011-HKN-SYUKEI-EXT
           END-IF
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    療養の給付：件数
      *     ADD  1                  TO  SUM-KENSU(IDX1 IDX3)
      *    療養の給付：診療実日数
      *     ADD  RECE10-JNISSU(1)   TO  SUM-NISSU(IDX1 IDX3)
      *    療養の給付：点数
      *     ADD  RECE10-TOTALTEN(1) TO  SUM-TENSU(IDX1 IDX3)
      *    療養の給付：一部負担金
      *     ADD  RECE10-FTNMONEY(1) TO  SUM-ITBFTN(IDX1 IDX3)
      *
      *     IF      IDX3                   =   1 
      *       IF      RECE10-SHOKUJINISSU(1)   >   ZERO
      *    食事療養：件数
      *         ADD     1                   TO  SUM-S-KENSU(IDX1)
      *       END-IF
      *    食事療養：日数
      *       ADD  RECE10-SHOKUJINISSU(1)   TO  SUM-S-NISSU(IDX1)
      *    食事療養：金額
      *       ADD  RECE10-SHOKUJIRYOYOHI(1) TO  SUM-S-KINGK(IDX1)
      *    食事療養：標準負担額
      *       ADD  RECE10-SHOKUJIFTN(1)     TO  SUM-S-FTNGK(IDX1)
      *     END-IF    
      *    療養の給付：件数
           ADD  1                  TO  SKT4025TMP-KENSU(IDX1 IDX3)
      *    療養の給付：診療実日数
           ADD  RECE10-JNISSU(1)   TO  SKT4025TMP-NISSU(IDX1 IDX3)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(1) TO  SKT4025TMP-TENSU(IDX1 IDX3)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1) TO  SKT4025TMP-ITBFTN(IDX1 IDX3)
      *
           IF      IDX3                   =   1 
             IF      RECE10-SHOKUJINISSU(1)   >   ZERO
      *    食事療養：件数
               ADD     1                   TO  SKT4025TMP-S-KENSU(IDX1)
             END-IF
      *    食事療養：日数
             ADD  RECE10-SHOKUJINISSU(1)   TO  SKT4025TMP-S-NISSU(IDX1)
      *    食事療養：金額
             ADD  RECE10-SHOKUJIRYOYOHI(1) TO  SKT4025TMP-S-KINGK(IDX1)
      *    食事療養：標準負担額
             ADD  RECE10-SHOKUJIFTN(1)     TO  SKT4025TMP-S-FTNGK(IDX1)
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
           MOVE    1               TO  FLG-UPD 
           .
       20011-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理
      *****************************************************************
       20012-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDZ     FROM    1   BY  1
                   UNTIL   IDZ     >       4
                   OR  RECE10-KOHNUM (IDZ) =   SPACE
      *
      *      ０５１と０９１は同じ場所に集計する
             IF      RECE10-KOHNUM (IDZ) =   "091"
               MOVE    "051"               TO  RECE10-KOHNUM (IDZ)
             END-IF
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
             MOVE    ZERO                  TO  FLG-2010
      *
      *     請求書公費再掲欄記載情報があるとき
            IF  WRK-2010-MAX  >  ZERO
              PERFORM VARYING IDZ1    FROM    1   BY  1
                      UNTIL   IDZ1    >       WRK-2010-MAX
                IF  RECE10-KOHNUM(IDZ)  =  WRK-2010-KOHNUM(IDZ1)
                  MOVE    1               TO  FLG-2010
                  MOVE    WRK-2010-MAX    TO  IDZ1
                END-IF
              END-PERFORM
            END-IF
      *
            IF  FLG-2010  =  ZERO
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *
      *=== 法別が印字されない不具合修正 by Yoshikawa(2008/12/10) start
             MOVE      SPACE             TO  WRK-MEISYO
      *=== 法別が印字されない不具合修正 by Yoshikawa(2008/12/10) end
      *      公費番号まとめ情報があるとき
             IF        WRK-2007-MAX    >       ZERO
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) start
      *                  UNTIL   IDZ2  >       5
                        UNTIL   IDZ2  >       10
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDZ)  
                                       =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                         TO  RECE10-KOHNUM (IDZ)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                         TO  WRK-MEISYO
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) start
      *               MOVE  5             TO  IDZ2
                     MOVE  10            TO  IDZ2
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *      公費番号格納
      *       PERFORM VARYING   IDX2    FROM    1   BY  1
      *               UNTIL     IDX2 >          100
      *        原爆は表示位置固定の為、対象外
      *         IF  RECE10-KOHNUM(IDZ)  NOT  =  "019"
      *           IF  SUM-KOHNUM (IDX2)   =   SPACE
      *             MOVE  RECE10-KOHNUM(IDZ) TO  SUM-KOHNUM(IDX2)
      *             MOVE  WRK-MEISYO        TO  SUM-KOH-MEISYO(IDX2)
      *           END-IF
      *           IF   RECE10-KOHNUM(IDZ) =  SUM-KOHNUM (IDX2)
      *             PERFORM 200121-KOH-SYUKEI-01-SEC
      *             MOVE    100             TO  IDX2
      *           END-IF
      *         END-IF
      *       END-PERFORM
      *      公費判別
      *      原爆は表示位置固定の為、対象外
             IF  RECE10-KOHNUM(IDZ)  NOT  =  "019"
               PERFORM VARYING  IDX4    FROM    1   BY  1
                     UNTIL    IDX4    >       20
                     OR       SKT4025TMP-KOHNUM(IDX4) = SPACE
                 IF  RECE10-KOHNUM (IDZ)  =  SKT4025TMP-KOHNUM (IDX4)
                   MOVE    IDX4    TO  CNT-KOH
                   MOVE    20      TO  IDX4
                 END-IF
               END-PERFORM
      *
      *        該当公費がなかった場合
               IF  IDX4   <   20
                 MOVE  IDX4        TO  CNT-KOH
      *          公費名称
                 MOVE  WRK-MEISYO  TO  SKT4025TMP-KOHNAME(CNT-KOH)
               END-IF
      *
      *        公費番号
               MOVE  RECE10-KOHNUM (IDZ)
                                 TO  SKT4025TMP-KOHNUM(CNT-KOH)
      *        療養の給付：件数
               ADD  1            TO  SKT4025TMP-KKENSU(CNT-KOH IDX3)
      *        療養の給付:診療実日数
               ADD  RECE10-JNISSU(IDZ + 1)
                                 TO  SKT4025TMP-KNISSU(CNT-KOH IDX3)
      *        療養の給付：点数
               ADD  RECE10-TOTALTEN(IDZ + 1)
                                 TO  SKT4025TMP-KTENSU(CNT-KOH IDX3)
      *        療養の給付：一部負担金
               ADD  RECE10-FTNMONEY(1)
                                 TO  SKT4025TMP-KITBFTN(CNT-KOH IDX3)
      *        療養の給付：患者負担額
               ADD  RECE10-FTNMONEY(IDZ + 1)
                                 TO  SKT4025TMP-KPTFTN(CNT-KOH IDX3)
      *
               IF      IDX3              =   1
      *=== 食事がない場合は件数集計しない by Yoshikawa(2009/11/19) start
                 IF    RECE10-SHOKUJINISSU(IDZ + 1)   >   ZERO
      *=== 食事がない場合は件数集計しない by Yoshikawa(2009/11/19) end
      *            食事療養:件数
                   ADD  1        TO  SKT4025TMP-S-KKENSU(CNT-KOH)
      *=== 食事がない場合は件数集計しない by Yoshikawa(2009/11/19) start
                 END-IF
      *=== 食事がない場合は件数集計しない by Yoshikawa(2009/11/19) end
      *          食事療養:日数
                 ADD  RECE10-SHOKUJINISSU(IDZ + 1)
                                 TO  SKT4025TMP-S-KNISSU(CNT-KOH)
      *          食事療養：金額
                 ADD  RECE10-SHOKUJIRYOYOHI(IDZ + 1)
                                 TO  SKT4025TMP-S-KKINGK(CNT-KOH)
      *          食事療養：標準負担額
                 ADD  RECE10-SHOKUJIFTN(IDZ + 1)  
                                 TO  SKT4025TMP-S-KFTNGK(CNT-KOH)
               END-IF
      *
               MOVE    1           TO  FLG-UPD
             END-IF
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
            ELSE
              MOVE    1                   TO  FLG-UPD
            END-IF     
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           END-PERFORM
           .
       20012-KOH-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費集計処理
      *****************************************************************
       200121-KOH-SYUKEI-01-SEC        SECTION.
      *
           COMPUTE IDY     =   IDZ     +   1
      *    
      *    公費再掲欄：療養の給付：件数
           ADD  1                    TO  SUM-KKENSU(IDX2 IDX3)
      *    公費再掲欄：療養の給付：日数
           ADD  RECE10-JNISSU(IDY)   TO  SUM-KNISSU(IDX2 IDX3)
      *    公費再掲欄：療養の給付：点数
           ADD  RECE10-TOTALTEN(IDY) TO  SUM-KTENSU(IDX2 IDX3)
      *    公費再掲欄：療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1)   TO  SUM-KITBFTN(IDX2 IDX3)
      *    公費再掲欄：療養の給付：患者負担額
           ADD  RECE10-FTNMONEY(IDY) TO  SUM-KPTFTN(IDX2 IDX3)
      *
           IF      IDX3              =   1 
             IF    RECE10-SHOKUJINISSU(IDY)   >   ZERO
      *    公費再掲欄：食事療養：件数
               ADD     1                     TO SUM-S-KKENSU(IDX2)
             END-IF
      *    公費再掲欄：食事療養：日数
             ADD  RECE10-SHOKUJINISSU(IDY)   TO SUM-S-KNISSU(IDX2)
      *    公費再掲欄：食事療養：金額
             ADD  RECE10-SHOKUJIRYOYOHI(IDY) TO SUM-S-KKINGK(IDX2)
      *    公費再掲欄：食事療養：標準負担額
             ADD  RECE10-SHOKUJIFTN(IDY)     TO SUM-S-KFTNGK(IDX2)
           END-IF    
      *
           MOVE    1               TO  FLG-UPD 
           .
       200121-KOH-SYUKEI-01-EXT.
           EXIT.
      *
      *****************************************************************
      *    原爆集計処理
      *****************************************************************
       20013-GENBK-SYUKEI-SEC        SECTION.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      **    原爆：療養の給付：件数
      *     ADD   1                           TO  SUM-GKENSU (IDX3)
      **=== 原爆取得データ修正 by Yoshikawa(2008/04/29) start
      ***    原爆：療養の給付:診療実日数
      **     ADD  RECE10-ETC-JNISSU(1)         TO  SUM-GNISSU(IDX3)
      ***    原爆：療養の給付：点数
      **     ADD  RECE10-ETC-TOTALTEN(1)       TO  SUM-GTENSU(IDX3)
      ***    原爆：療養の給付：一部負担金
      **     ADD  RECE10-FTNMONEY(1)           TO  SUM-GITBFTN(IDX3)
      ***
      **     IF  RECE10-ETC-SHOKUJINISSU(1)  >  0
      ***    原爆：食事療養:件数
      **       ADD  1                          TO  SUM-S-GKENSU
      **     END-IF
      ***    原爆：食事療養:日数
      **     ADD  RECE10-ETC-SHOKUJINISSU(1)   TO  SUM-S-GNISSU
      ***    原爆：食事療養：金額
      **     ADD  RECE10-ETC-SHOKUJIRYOYOHI(1) TO  SUM-S-GKINGK
      ***    原爆：食事療養：標準負担額
      *     ADD  RECE10-ETC-SHOKUJIFTN(1)     TO  SUM-S-GFTNGK
      **    原爆：療養の給付:診療実日数
      *     ADD  RECE10-JNISSU(IDXX + 1)         TO  SUM-GNISSU(IDX3)
      **    原爆：療養の給付：点数
      *     ADD  RECE10-TOTALTEN(IDXX + 1)       TO  SUM-GTENSU(IDX3)
      **    原爆：療養の給付：一部負担金
      *     ADD  RECE10-FTNMONEY(IDXX + 1)       TO  SUM-GITBFTN(IDX3)
      *
      *     IF   RECE10-SHOKUJINISSU(IDXX + 1)  >  0
      **    原爆：食事療養:件数
      *       ADD  1                             TO  SUM-S-GKENSU
      *     END-IF
      **    原爆：食事療養:日数
      *     ADD  RECE10-SHOKUJINISSU(IDXX + 1)   TO  SUM-S-GNISSU
      **    原爆：食事療養：金額
      *     ADD  RECE10-SHOKUJIRYOYOHI(IDXX + 1) TO  SUM-S-GKINGK
      **    原爆：食事療養：標準負担額
      *     ADD  RECE10-SHOKUJIFTN(IDXX + 1)     TO  SUM-S-GFTNGK
      *=== 原爆取得データ修正 by Yoshikawa(2008/04/29) end
      *
      *    原爆：療養の給付：件数
           ADD   1                         TO  SKT4025TMP-GKENSU(IDX3)
      *    原爆：療養の給付:診療実日数
           ADD  RECE10-JNISSU(IDXX + 1)    TO  SKT4025TMP-GNISSU(IDX3)
      *    原爆：療養の給付：点数
           ADD  RECE10-TOTALTEN(IDXX + 1)  TO  SKT4025TMP-GTENSU(IDX3)
      *    原爆：療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(IDXX + 1)  TO  SKT4025TMP-GITBFTN(IDX3)
      *
           IF   RECE10-SHOKUJINISSU(IDXX + 1)  >  0
      *    原爆：食事療養:件数
             ADD  1                        TO  SKT4025TMP-S-GKENSU
           END-IF
      *    原爆：食事療養:日数
           ADD  RECE10-SHOKUJINISSU(IDXX + 1)
                                           TO  SKT4025TMP-S-GNISSU
      *    原爆：食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(IDXX + 1)
                                           TO  SKT4025TMP-S-GKINGK
      *    原爆：食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(IDXX + 1)
                                           TO  SKT4025TMP-S-GFTNGK
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *=== 原爆の法別番号欄修正 by Yoshikawa(2010/06/10) start
      *    原爆：法別番号
           MOVE  "19"                      TO  SKT4025TMP-GKOHNUM
      *=== 原爆の法別番号欄修正 by Yoshikawa(2010/06/10) start
      *
           MOVE    1               TO  FLG-UPD 
         .
       20013-GENBK-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求ＤＢ更新用ファイル出力処理
      *****************************************************************
       20014-UPD-FILE-HENSYU-SEC         SECTION.
      *
           MOVE    RECE10-REC          TO  RECE10X-REC
           INITIALIZE                      RECE10X-UPHKNJANUM
                                           RECE10X-XXPREFNUM
                                           RECE10X-XXSRYYM
                                           RECE10X-XXSTHKNJANUM
                                           RECE10X-XXEDHKNJANUM
                                           RECE10X-XXTEISYUTUSAKI
           WRITE   RECE10X-REC
      *
           IF      STS-RECEUPD         =   "00"
               CONTINUE
           ELSE
               MOVE    SPACE               TO  WRK-RECEERR
               STRING "更新用ファイル 書き込みエラー STS="
                                                   DELIMITED  BY  SIZE
                       STS-RECEUPD                 DELIMITED  BY  SIZE
                                           INTO    WRK-RECEERR
               END-STRING                                
               PERFORM 500-ERR-HENSYU-SEC
               PERFORM 500-COBABORT-SEC
           END-IF 
           ADD     1                   TO  CNT-UPDFILE
           .
       20014-UPD-FILE-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票ファイル出力処理
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           OPEN     INPUT       SKT4025TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
      *    帳票編集<見出し>処理
           PERFORM 20021-HEAD-HEN-SEC
      *    帳票編集<明細>処理
           PERFORM 20023-BODY-HEN-SEC
      *    帳票印刷処理
           PERFORM 20024-PRINT-OUT-SEC
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           END-PERFORM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<見出し>処理
      *****************************************************************
       20021-HEAD-HEN-SEC          SECTION.
      *
           INITIALIZE                      SKT4025
      *    請求年月日
           MOVE    WRK-SEIYMDWH        TO  SKT4025-SEIYMD
      *    診療年月
           MOVE    WRK-SRYYMWH         TO  SKT4025-SRYYM
      *    医療機関住所
           MOVE    WRK-HOSPADRS        TO  SKT4025-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4025-ADRS        REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *    医療機関名
           MOVE    WRK-HOSPNAME        TO  SKT4025-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4025-HOSPNAME    REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *     MOVE    SYS-1001-KAISETUNAME
      *                                 TO  SKT4025-KAISETUNAME
           MOVE    WRK-KAISETUNAME     TO  SKT4025-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL         TO  SKT4025-TEL
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN    TO  SKT4025-HOSPCD
      *    保険者番号
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *     MOVE     WRK-HKNJANUM       TO  WRK-MAE-INPUT
           MOVE    SKT4025TMP-HKNJANUM TO  WRK-MAE-INPUT
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT      TO  SKT4025-HKNJANUM
      *    保険者名(必要あらばコメントを外して下さい)
      *     MOVE    SPACE               TO  HKNJAINF-REC
      *     INITIALIZE                      HKNJAINF-REC
      *     MOVE    SPA-HOSPNUM         TO  HKNJA-HOSPNUM
      *     MOVE    "39"                TO  HKNJA-HKNJANUM(1:2)
      *     MOVE    WRK-HKNJANUM        TO  HKNJA-HKNJANUM(3:6)
      **     MOVE    KEY-O-HKNJANUM      TO  HKNJA-HKNJANUM
      *     MOVE    HKNJAINF-REC        TO  MCPDATA-REC
      *     PERFORM 900-HKNJAINF-INV-SEC
      *     IF      FLG-HKNJAINF        =   ZERO
      *         STRING  HKNJA-HKNJANAME     DELIMITED  BY  SPACE
      *                 "　殿"              DELIMITED  BY  SIZE
      *                                     INTO  SKT4025-HKNJANAME
      *         END-STRING
      *     END-IF
      *    在総診・在医総
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *     IF    WRK-INDEX  =  2
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) start
      *     IF    SKT4025TMP-ZAITAKU  =  "1"
      **=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *       MOVE    "在"              TO  SKT4025-ZAI1
      *       MOVE    "◯"              TO  SKT4025-ZAI2
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) end
      *
           .
       20021-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       20023-BODY-HEN-SEC      SECTION.
      *
           MOVE    ZERO                TO  IDZ
      *
      *    編集処理
           PERFORM VARYING IDX FROM    1   BY  1
                   UNTIL   IDX >       2
             ADD     1                   TO  IDZ    
             PERFORM VARYING IDY FROM    1   BY  1
                     UNTIL   IDY >       2
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      **    療養の給付：件数
      *         MOVE  SUM-KENSU(IDX IDY)  TO  WRK-Z5
      *         MOVE  WRK-Z5              TO  SKT4025-KENSU(IDZ IDY)
      **    療養の給付：診療実日数
      *         MOVE  SUM-NISSU(IDX IDY)  TO  WRK-Z5 
      *         MOVE  WRK-Z5              TO  SKT4025-NISSU(IDZ IDY)
      **    療養の給付：点数
      *         MOVE  SUM-TENSU(IDX IDY)  TO  WRK-Z10
      *         MOVE  WRK-Z10             TO  SKT4025-TENSU(IDZ IDY)
      **    療養の給付：一部負担金
      *         MOVE  SUM-ITBFTN(IDX IDY) TO  WRK-Z10
      *         MOVE  WRK-Z10             TO  SKT4025-ITBFTN(IDZ IDY)
      *       END-PERFORM
      *
      **    食事療養：件数
      *       MOVE  SUM-S-KENSU(IDX)      TO  WRK-Z5
      *       MOVE  WRK-Z5                TO  SKT4025-S-KENSU(IDZ)
      **    食事療養：日数
      *       MOVE  SUM-S-NISSU(IDX)      TO  WRK-Z5
      *       MOVE  WRK-Z5                TO  SKT4025-S-NISSU(IDZ)
      **    食事療養：金額
      *       MOVE  SUM-S-KINGK(IDX)      TO  WRK-Z10
      *       MOVE  WRK-Z10               TO  SKT4025-S-KINGK(IDZ)
      **    食事療養：標準負担額
      *       MOVE  SUM-S-FTNGK(IDX)      TO  WRK-Z10
      *       MOVE  WRK-Z10               TO  SKT4025-S-FTNGK(IDZ)
      *    END-PERFORM
      *
      **    原爆分
      *     PERFORM VARYING IDX FROM    1   BY  1
      *             UNTIL   IDX >       2
      **    原爆：療養の給付：件数
      *       MOVE  SUM-GKENSU(IDX)       TO  WRK-Z5
      *       MOVE  WRK-Z5                TO  SKT4025-GKENSU(IDX)
      **    原爆：療養の給付：日数
      *       MOVE  SUM-GNISSU(IDX)       TO  WRK-Z5
      *       MOVE  WRK-Z5                TO  SKT4025-GNISSU(IDX)
      **    原爆：療養の給付：点数
      *       MOVE  SUM-GTENSU(IDX)       TO  WRK-Z10
      *       MOVE  WRK-Z10               TO  SKT4025-GTENSU(IDX)
      **    原爆：療養の給付：一部負担金
      *       MOVE  SUM-GITBFTN(IDX)      TO  WRK-Z10
      *       MOVE  WRK-Z10               TO  SKT4025-GITBFTN(IDX)
      *     END-PERFORM
      **    原爆：食事療養：件数
      *     MOVE  SUM-S-GKENSU            TO  WRK-Z5
      *     MOVE  WRK-Z5                  TO  SKT4025-S-GKENSU
      **    原爆：食事療養：日数
      *     MOVE  SUM-S-GNISSU            TO  WRK-Z5
      *     MOVE  WRK-Z5                  TO  SKT4025-S-GNISSU
      **    原爆：食事療養：金額
      *     MOVE  SUM-S-GKINGK            TO  WRK-Z10
      *     MOVE  WRK-Z10                 TO  SKT4025-S-GKINGK
      **    原爆：食事療養：標準負担額
      *     MOVE  SUM-S-GFTNGK            TO  WRK-Z10
      *     MOVE  WRK-Z10                 TO  SKT4025-S-GFTNGK
      *
      *    療養の給付：件数
               MOVE  SKT4025TMP-KENSU(IDX IDY)  TO  WRK-Z5
               MOVE  WRK-Z5              TO  SKT4025-KENSU(IDZ IDY)
      *    療養の給付：診療実日数
               MOVE  SKT4025TMP-NISSU(IDX IDY)  TO  WRK-Z5 
               MOVE  WRK-Z5              TO  SKT4025-NISSU(IDZ IDY)
      *    療養の給付：点数
               MOVE  SKT4025TMP-TENSU(IDX IDY)  TO  WRK-Z10
               MOVE  WRK-Z10             TO  SKT4025-TENSU(IDZ IDY)
      *    療養の給付：一部負担金
               MOVE  SKT4025TMP-ITBFTN(IDX IDY) TO  WRK-Z10
               MOVE  WRK-Z10             TO  SKT4025-ITBFTN(IDZ IDY)
             END-PERFORM
      *
      *    食事療養：件数
             MOVE  SKT4025TMP-S-KENSU(IDX)      TO  WRK-Z5
             MOVE  WRK-Z5                TO  SKT4025-S-KENSU(IDZ)
      *    食事療養：日数
             MOVE  SKT4025TMP-S-NISSU(IDX)      TO  WRK-Z5
             MOVE  WRK-Z5                TO  SKT4025-S-NISSU(IDZ)
      *    食事療養：金額
             MOVE  SKT4025TMP-S-KINGK(IDX)      TO  WRK-Z10
             MOVE  WRK-Z10               TO  SKT4025-S-KINGK(IDZ)
      *    食事療養：標準負担額
             MOVE  SKT4025TMP-S-FTNGK(IDX)      TO  WRK-Z10
             MOVE  WRK-Z10               TO  SKT4025-S-FTNGK(IDZ)
           END-PERFORM
      *
      *    原爆分
           PERFORM VARYING IDX FROM    1   BY  1
                   UNTIL   IDX >       2
      *    原爆：療養の給付：件数
             MOVE  SKT4025TMP-GKENSU(IDX)       TO  WRK-Z5
             MOVE  WRK-Z5                TO  SKT4025-GKENSU(IDX)
      *    原爆：療養の給付：日数
             MOVE  SKT4025TMP-GNISSU(IDX)       TO  WRK-Z5
             MOVE  WRK-Z5                TO  SKT4025-GNISSU(IDX)
      *    原爆：療養の給付：点数
             MOVE  SKT4025TMP-GTENSU(IDX)       TO  WRK-Z10
             MOVE  WRK-Z10               TO  SKT4025-GTENSU(IDX)
      *    原爆：療養の給付：一部負担金
             MOVE  SKT4025TMP-GITBFTN(IDX)      TO  WRK-Z10
             MOVE  WRK-Z10               TO  SKT4025-GITBFTN(IDX)
           END-PERFORM
      *    原爆：食事療養：件数
           MOVE  SKT4025TMP-S-GKENSU            TO  WRK-Z5
           MOVE  WRK-Z5                  TO  SKT4025-S-GKENSU
      *    原爆：食事療養：日数
           MOVE  SKT4025TMP-S-GNISSU            TO  WRK-Z5
           MOVE  WRK-Z5                  TO  SKT4025-S-GNISSU
      *    原爆：食事療養：金額
           MOVE  SKT4025TMP-S-GKINGK            TO  WRK-Z10
           MOVE  WRK-Z10                 TO  SKT4025-S-GKINGK
      *    原爆：食事療養：標準負担額
           MOVE  SKT4025TMP-S-GFTNGK            TO  WRK-Z10
           MOVE  WRK-Z10                 TO  SKT4025-S-GFTNGK
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *=== 原爆の法別番号欄修正 by Yoshikawa(2010/06/10) start
      *    原爆：法別番号
           MOVE  SKT4025TMP-GKOHNUM      TO  SKT4025-GHBTNUM
      *=== 原爆の法別番号欄修正 by Yoshikawa(2010/06/10) end
      *
      *    公費負担分編集処理
           MOVE    ZERO                  TO  FLG-KOH-END
           MOVE    1                     TO  IDX2
      * 
           PERFORM 200231-KOH-HENSYU-SEC
                                   UNTIL   FLG-KOH-END   =   1
      *
           .
       20023-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<公費負担分>処理
      *****************************************************************
       200231-KOH-HENSYU-SEC         SECTION.
      *
           PERFORM VARYING IDY     FROM    1   BY  1
                   UNTIL   IDY     >       4
                   OR      FLG-KOH-END     =   1
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *       IF      SUM-KOHNUM (IDX2)   =   SPACE
      *         MOVE    1                     TO  FLG-KOH-END
      *       ELSE    
      *         PERFORM 2002311-HKNNUM-HENSYU-SEC     
      *         PERFORM VARYING IDZ FROM    1   BY  1
      *                 UNTIL   IDZ >       2
      **    公費再掲欄：療養の給付：件数
      *           MOVE  SUM-KKENSU(IDX2 IDZ)  TO WRK-Z5
      *           MOVE  WRK-Z5                TO SKT4025-KKENSU(IDY IDZ)
      **    公費再掲欄：療養の給付：日数
      *           MOVE  SUM-KNISSU(IDX2 IDZ)  TO WRK-Z5
      *           MOVE  WRK-Z5                TO SKT4025-KNISSU(IDY IDZ)
      **    公費再掲欄：療養の給付：点数
      *           MOVE  SUM-KTENSU(IDX2 IDZ)  TO WRK-Z10
      *           MOVE  WRK-Z10               TO SKT4025-KTENSU(IDY IDZ)
      **    公費再掲欄：療養の給付：一部負担金
      *           MOVE  SUM-KITBFTN(IDX2 IDZ) TO WRK-Z10
      *           MOVE  WRK-Z10               TO SKT4025-KITBFTN(IDY IDZ)
      **    公費再掲欄：療養の給付：患者負担額
      *           MOVE  SUM-KPTFTN(IDX2 IDZ)  TO WRK-Z10
      *           MOVE  WRK-Z10               TO SKT4025-KPTFTN(IDY IDZ)
      *         END-PERFORM
      *
      **    公費再掲欄：食事療養：件数
      *         MOVE  SUM-S-KKENSU(IDX2)    TO  WRK-Z5
      *         MOVE  WRK-Z5                TO  SKT4025-S-KKENSU(IDY)
      **    公費再掲欄：食事療養：日数
      *         MOVE  SUM-S-KNISSU(IDX2)    TO  WRK-Z5
      *         MOVE  WRK-Z5                TO  SKT4025-S-KNISSU(IDY)
      **    公費再掲欄：食事療養：金額
      *         MOVE  SUM-S-KKINGK(IDX2)    TO  WRK-Z10
      *         MOVE  WRK-Z10               TO  SKT4025-S-KKINGK(IDY)
      **    公費再掲欄：食事療養：標準負担額
      *         MOVE  SUM-S-KFTNGK(IDX2)    TO  WRK-Z10
      *         MOVE  WRK-Z10               TO  SKT4025-S-KFTNGK(IDY)
      *
      *         ADD     1                   TO  IDX2   
      *       END-IF        
      *
             IF      SKT4025TMP-KOHNUM (IDX2)   =   SPACE
               MOVE    1                     TO  FLG-KOH-END
             ELSE    
               PERFORM 2002311-HKNNUM-HENSYU-SEC     
               PERFORM VARYING IDZ FROM    1   BY  1
                       UNTIL   IDZ >       2
      *    公費再掲欄：療養の給付：件数
                 MOVE  SKT4025TMP-KKENSU(IDX2 IDZ)  TO WRK-Z5
                 MOVE  WRK-Z5                TO SKT4025-KKENSU(IDY IDZ)
      *    公費再掲欄：療養の給付：日数
                 MOVE  SKT4025TMP-KNISSU(IDX2 IDZ)  TO WRK-Z5
                 MOVE  WRK-Z5                TO SKT4025-KNISSU(IDY IDZ)
      *    公費再掲欄：療養の給付：点数
                 MOVE  SKT4025TMP-KTENSU(IDX2 IDZ)  TO WRK-Z10
                 MOVE  WRK-Z10               TO SKT4025-KTENSU(IDY IDZ)
      *    公費再掲欄：療養の給付：一部負担金
                 MOVE  SKT4025TMP-KITBFTN(IDX2 IDZ) TO WRK-Z10
                 MOVE  WRK-Z10               TO SKT4025-KITBFTN(IDY IDZ)
      *    公費再掲欄：療養の給付：患者負担額
                 MOVE  SKT4025TMP-KPTFTN(IDX2 IDZ)  TO WRK-Z10
                 MOVE  WRK-Z10               TO SKT4025-KPTFTN(IDY IDZ)
               END-PERFORM
      *
      *    公費再掲欄：食事療養：件数
               MOVE  SKT4025TMP-S-KKENSU(IDX2)    TO  WRK-Z5
               MOVE  WRK-Z5                TO  SKT4025-S-KKENSU(IDY)
      *    公費再掲欄：食事療養：日数
               MOVE  SKT4025TMP-S-KNISSU(IDX2)    TO  WRK-Z5
               MOVE  WRK-Z5                TO  SKT4025-S-KNISSU(IDY)
      *    公費再掲欄：食事療養：金額
               MOVE  SKT4025TMP-S-KKINGK(IDX2)    TO  WRK-Z10
               MOVE  WRK-Z10               TO  SKT4025-S-KKINGK(IDY)
      *    公費再掲欄：食事療養：標準負担額
               MOVE  SKT4025TMP-S-KFTNGK(IDX2)    TO  WRK-Z10
               MOVE  WRK-Z10               TO  SKT4025-S-KFTNGK(IDY)
      *
               ADD     1                   TO  IDX2   
             END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           END-PERFORM
      *
      *    １頁出力しても公費はまだ残っているか
           IF      SKT4025TMP-KOHNUM (IDX2)  =   SPACE
               MOVE    1                   TO  FLG-KOH-END
           ELSE    
      *        帳票印刷処理（２頁以降）
               PERFORM 20024-PRINT-OUT-SEC
      *        帳票編集<見出し>処理
               PERFORM 20021-HEAD-HEN-SEC
           END-IF     
      *
           .
       200231-KOH-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費保険区分編集処理
      *****************************************************************
       2002311-HKNNUM-HENSYU-SEC         SECTION.
      *
           MOVE    SPACE               TO  WRK-KOHKBN
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *     MOVE    SUM-KOHNUM (IDX2)   TO  WRK-KOHNUM9
           MOVE    SKT4025TMP-KOHNUM (IDX2)   TO  WRK-KOHNUM9
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           MOVE    WRK-KOHNUM9         TO  SKT4025-HBTNUM (IDY)
      *
      *    特定疾患のとき 
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *     IF      SUM-KOHNUM (IDX2)  =   "051"
           IF      SKT4025TMP-KOHNUM (IDX2)  =   "051"
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
               MOVE    "51"            TO   SKT4025-HBTNUM (IDY)
               MOVE    "特定疾患"      TO   WRK-HKNNAME
           ELSE
      *      公費番号まとめ情報からの集計か
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *       IF      SUM-KOH-MEISYO(IDX2)  =   SPACE
             IF      SKT4025TMP-KOHNAME(IDX2)  =   SPACE
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *        保険番号読込み  
               INITIALIZE                     HKNNUM-REC
               MOVE  SPA-HOSPNUM          TO  HKN-HOSPNUM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *         MOVE  SUM-KOHNUM (IDX2)    TO  HKN-HKNNUM
               MOVE  SKT4025TMP-KOHNUM (IDX2)  TO  HKN-HKNNUM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
               MOVE  HKNNUM-REC           TO  MCPDATA-REC
               MOVE  "tbl_hknnum"         TO  MCP-TABLE
               MOVE  "key2"               TO  MCP-PATHNAME
                 PERFORM 900-DBSELECT-SEC
                 IF      MCP-RC              =   ZERO
                   MOVE  "tbl_hknnum"     TO  MCP-TABLE
                   MOVE  "key2"           TO  MCP-PATHNAME
                   PERFORM 900-HKNNUM-READ-SEC
                 ELSE
                   MOVE    1              TO  FLG-HKNNUM
                 END-IF
      *
                 PERFORM UNTIL       FLG-HKNNUM      =   1
                   IF      HKN-TEKSTYMD            <=  WRK-SRYYMD
                   AND     HKN-TEKEDYMD            >=  WRK-SRYYMD
                     MOVE  HKN-TANSEIDONAME   TO  WRK-HKNNAME
                     MOVE  1                  TO  FLG-HKNNUM   
                   END-IF
      *
                   IF      FLG-HKNNUM           =   ZERO
                     MOVE  "tbl_hknnum"       TO  MCP-TABLE
                     MOVE  "key2"             TO  MCP-PATHNAME
                     PERFORM 900-HKNNUM-READ-SEC
                   END-IF
                 END-PERFORM
                 MOVE  "tbl_hknnum"       TO  MCP-TABLE
                 MOVE  "key2"             TO  MCP-PATHNAME
                 PERFORM  900-CLOSE-SEC
      *
      *          法別番号
                 MOVE  HKN-HBTNUM         TO  SKT4025-HBTNUM(IDY)
             END-IF
           END-IF
           . 
       2002311-HKNNUM-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       20024-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
           ADD     1                   TO  CNT-PAGE
           MOVE    CNT-PAGE            TO  WRK-PAGE
      *
           INITIALIZE                  ORCSPRTAREA
           MOVE    "INS"               TO  SPRT-MODE
           MOVE    LNK-PRTKANRI-RENNUM TO  SPRT-RENNUM
           MOVE    LNK-PRTKANRI-TBL-KEY
                                       TO  SPRT-TBL-KEY
           MOVE    LNK-PRTKANRI-TBL-GROUP
                                       TO  SPRT-TBL-GROUP
           MOVE    LNK-PRTKANRI-SRYYM  TO  SPRT-SRYYM
           MOVE    LNK-PRTKANRI-SKYYMD TO  SPRT-SKYYMD
           MOVE    LNK-PRTKANRI-SHELLID 
                                       TO  SPRT-SHELLID
           MOVE    LNK-PRTKANRI-SHORI-RENNUM
                                       TO  SPRT-SHORI-RENNUM
           MOVE    LNK-PRTKANRI-PRIORITY
                                       TO  SPRT-PRIORITY
           MOVE    WRK-PAGE            TO  SKT4025-NO
           MOVE    "SKT4025.red"         TO  SPRT-PRTID
           MOVE    SKT4025               TO  SPRT-PRTDATA
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
           IF  SKT4025TMP-ZAITAKU  =  "1"
               MOVE  2  TO  WRK-INDEX
           ELSE
               MOVE  1  TO  WRK-INDEX
           END-IF
           MOVE  WRK-PARA-SYOKBN       TO  WRK-SYOKBN
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
           EVALUATE    WRK-INDEX    ALSO    WRK-SYOKBN
                                            ALSO    WRK-PARA-SYOKBN1
               WHEN    1            ALSO    "1"     
                                            ALSO   "1"
                   MOVE    "後期高齢者請求書"        TO  SPRT-TITLE
               WHEN    2            ALSO    "1"
                                            ALSO   "1"
                   MOVE    "後期高齢者請求書（在医総等）"
                                               TO  SPRT-TITLE
               WHEN    1            ALSO    "2"
                                            ALSO   "1"
                   MOVE    "後期高齢者請求書［返戻分］" 
                                               TO  SPRT-TITLE
               WHEN    2            ALSO    "2"
                                            ALSO   "1"
                   MOVE    "後期高齢者請求書（在医総等）［返戻分］"
                                               TO  SPRT-TITLE
               WHEN    1            ALSO    "1"     
                                            ALSO   "2"
                   MOVE    "後期高齢者請求書［特別療養費］"
                                               TO  SPRT-TITLE
               WHEN    1            ALSO    "2"
                                            ALSO   "2"
                   MOVE    "後期高齢者請求書［返戻分］［特別療養費］" 
                                               TO  SPRT-TITLE
           END-EVALUATE
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *     MOVE    "1"                 TO  SPRT-SITEKBN
      *     
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
                                       SPA-AREA
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               PERFORM 500-COBABORT-SEC
           END-IF
           .
       20024-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    全角変換処理
      *****************************************************************
       2009-HENKAN-SEC                 SECTION.
      *
           INITIALIZE                  WRK-OUT-INPUT
      *
           INITIALIZE                  ORCSKANACHKAREA
           MOVE    "2"                 TO  KANACHK-SYORI
           MOVE    WRK-MAE-INPUT       TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"       USING
                                       ORCSKANACHKAREA
           IF      KANACHK-RC          =   ZERO
               MOVE    KANACHK-OUT-INPUT
                                           TO  WRK-OUT-INPUT
           ELSE
               MOVE    WRK-MAE-INPUT       TO  WRK-OUT-INPUT
           END-IF
      *
           .
       2009-HENKAN-EXT.
           EXIT.
      * 
      *****************************************************************
      *    エラー出力処理
      *****************************************************************
       500-ERR-HENSYU-SEC                SECTION.
      *
           OPEN    INPUT   RECEERR-FILE
           IF      STS-RECEERR         =   ZERO
               CLOSE   RECEERR-FILE
           ELSE
               OPEN    OUTPUT              RECEERR-FILE
      *
               MOVE    WRK-RECEERR         TO  RECEERR-REC
               WRITE   RECEERR-REC
               CLOSE   RECEERR-FILE
      *         
      *        ジョブ管理開始処理
               MOVE    "JBE"           TO  SJOBKANRI-MODE
               INITIALIZE                  JOBKANRI-REC
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               PERFORM 900-CALL-ORCSJOB-SEC
           END-IF
      *
           MOVE    1                   TO  FLG-END     
                                           FLG-ERR
      *
           .
       500-ERR-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    エラー時終了処理
      *****************************************************************
       500-COBABORT-SEC                SECTION.
      *
           MOVE    SPACE               TO  WRK-ERRMSG
           STRING  "SOKATU4025 "         DELIMITED  BY  SIZE
                   WRK-RECEERR         DELIMITED  BY  SIZE
                   LOW-VALUE           DELIMITED  BY  SIZE
                                       INTO    WRK-ERRMSG
           END-STRING   
           CALL    "cobabort"          USING   WRK-ERRMSG
      *
           .
       500-COBABORT-EXT.
           EXIT.
      *
      *****************************************************************
      *    終了処理
      *****************************************************************
       300-END-SEC                 SECTION.
      *
           DISPLAY "*** SOKATU4025 IN   "  CNT-RECE10 
           DISPLAY "***          UPD  "  CNT-UPDFILE 
           DISPLAY "***          PAGE "  CNT-PAGE 
           DISPLAY "*** SOKATU4025 END ***"
      *     
      *    ステップ管理終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    CNT-PAGE        TO  JOB-UPDCNT
           PERFORM 900-CALL-ORCSJOB-SEC
      *                              
           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *   請求管理ＤＢ更新処理
      *****************************************************************
       310-SEIKYU-UPD-SEC              SECTION.
      *
           OPEN    INPUT    UPD-FILE
      *
           PERFORM 900-UPD-FILE-READ-SEC
           PERFORM             UNTIL   FLG-UPDFILE    =   1
               MOVE    RECE10X-KEY         TO  RECE10-KEY
               MOVE    RECE10-REC          TO  MCPDATA-REC
               PERFORM 910-SEIKYU-INV-SEC
               IF      FLG-SEIKYU          =   ZERO
                   MOVE    "2"             TO  RECE10-SKYKBN
                   MOVE    LNK-PRTKANRI-SRYYM  TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD TO  RECE10-UPDYMD  
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   PERFORM 900-ORCDBMAIN-SEC
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       STRING "請求管理ＤＢ　更新エラー　"
                                               DELIMITED  BY  SIZE
                               RECE10-KEY      DELIMITED  BY  SIZE
                                               INTO    WRK-RECEERR
                       END-STRING                                
                       PERFORM 500-ERR-HENSYU-SEC
                       PERFORM 500-COBABORT-SEC
                   END-IF
               ELSE
                   STRING "請求管理ＤＢ　読込み更新エラー　"
                                               DELIMITED  BY  SIZE
                           RECE10X-KEY         DELIMITED  BY  SIZE
                                               INTO    WRK-RECEERR
                   END-STRING                                
                   PERFORM 500-ERR-HENSYU-SEC
                   PERFORM 500-COBABORT-SEC
               END-IF
           END-PERFORM  
      *
           CLOSE   UPD-FILE
           .
       310-SEIKYU-UPD-EXT.
           EXIT.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       800-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT4025TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4025TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4025TMP
           END-READ
           .
       800-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT4025TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
      *****************************************************************
      *    西暦日本語変換処理
      *****************************************************************
       31012-SEIWA-HEN-SEC        SECTION.
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY2-AREA
           MOVE    "21"                TO  LNK-DAY2-IRAI
           MOVE    WRK-SYMD            TO  LNK-DAY2-YMD
           CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                               LNK-DAY2-AREA
           MOVE    LNK-DAY2-EDTYMD3    TO  WRK-HENYMDG
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "　"
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
           MOVE    ZERO                TO  FLG-RECE10
      *     
      *    請求管理ＤＢ検索
           MOVE    SPACE               TO  RECE10-REC
           INITIALIZE                      RECE10-REC
           MOVE    WRK-PARA-HOSPNUM    TO  RECE10-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE10-SKYYM
           MOVE    WRK-CONS-SRYYM-200804
                                       TO  RECE10-SRYYM
           MOVE    999999              TO  RECE10-XXSRYYM
           IF      WRK-PARA-HKNJANUM   NOT =   ZERO
               MOVE    WRK-PARA-HKNJANUM   TO  RECE10-XXSTHKNJANUM
                                               RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
           IF      WRK-PARA-SYOKBN1    =   "1"
               MOVE    "039"               TO  RECE10-HKNNUM-S
                                               RECE10-HKNNUM
           ELSE 
               MOVE    "040"               TO  RECE10-HKNNUM-S
                                               RECE10-HKNNUM
           END-IF
      *
      *###
           DISPLAY "SYOKBN=" WRK-SYOKBN " SYOKBN1=" WRK-PARA-SYOKBN1
                   " SRYYM=" RECE10-SRYYM "-" RECE10-XXSRYYM 
                   " HKNNUM= " RECE10-HKNNUM
                   " PATHNAME=" WRK-MCP-PATHNAME
                   " HKNJANUM=" RECE10-XXSTHKNJANUM "-" 
                                RECE10-XXEDHKNJANUM
      *###
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
               MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
               MOVE    1                   TO  FLG-END
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
               MOVE    1                   TO  FLG-RECE10
               MOVE    HIGH-VALUE      TO  KEY-NEW
           END-IF
           .
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求マスター読込
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-DBFETCH-SEC
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-RECE10
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/01/22) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/01/22) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
               MOVE    RECE10-HOSPNUM      TO  PTINF-HOSPNUM
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
      *=== PERFORM→GOTO by Yoshikawa(2012/05/17) start
      *             PERFORM  900-SEIKYU-READ-SEC
                   GO  TO  900-SEIKYU-READ-SEC
      *=== PERFORM→GOTO by Yoshikawa(2012/05/17) end
               END-IF   
      *        キーに県番号を格納
               MOVE    RECE10-HKNJANUM(1:4)  TO  KEY-N-HKNJANUM
               ADD     1                     TO  CNT-RECE10   
      *         
               DISPLAY "PTNUM=" RECE10-PTNUM 
      *         
           ELSE
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) start
               MOVE    1               TO  FLG-END
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/16) end
               MOVE    HIGH-VALUE      TO  KEY-NEW
               MOVE    1               TO  FLG-RECE10
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-PTINF
                   MOVE    MCPDATA-REC         TO  PTINF-REC
               ELSE
                   MOVE    1                   TO  FLG-PTINF
                   INITIALIZE                  PTINF-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-PTINF
               INITIALIZE                  PTINF-REC
           END-IF
      *
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理ＤＢ更新用ファイル読込
      *****************************************************************
       900-UPD-FILE-READ-SEC             SECTION.
      *
           READ    UPD-FILE
               AT  END
                   MOVE    1           TO  FLG-UPDFILE
               NOT AT  END
                   MOVE    ZERO        TO  FLG-UPDFILE
           END-READ
           .
       900-UPD-FILE-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療機関編集情報読み込み
      *****************************************************************
       900-1900-READ-SEC           SECTION.
      *
      *    医療機関編集情報読み込み
           MOVE    SPACE           TO  SYS-1900-REC
           INITIALIZE                  SYS-1900-REC
           MOVE    "1900"          TO  SYS-1900-KANRICD
           MOVE    "*"             TO  SYS-1900-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SYS-1900-STYUKYMD (1:6)
           MOVE    "01"            TO  SYS-1900-STYUKYMD (7:2)
           MOVE    SYS-1900-STYUKYMD
                                   TO  SYS-1900-EDYUKYMD
           MOVE    SPA-HOSPNUM     TO  SYS-1900-HOSPNUM
           MOVE    SYS-1900-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1900-REC
      *=== シス管「1901」の電話番号印字 by Yoshikawa(2012/05/17) start
      *         IF      SYS-1900-PRTKBN(8)  NOT =   SPACE
               IF      SYS-1900-PRTKBN(17)  NOT =   SPACE
      *=== シス管「1901」の電話番号印字 by Yoshikawa(2012/05/17) end
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
                END-IF
           ELSE
               INITIALIZE                  SYS-1900-REC
           END-IF
           .
      *
       900-1900-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療機関名称編集情報読み込み
      *****************************************************************
       900-1901-READ-SEC           SECTION.
      *
      *    医療機関名称編集情報読み込み
           MOVE    SPACE           TO  SYS-1901-REC
           INITIALIZE                  SYS-1901-REC
           MOVE    "1901"          TO  SYS-1901-KANRICD
           MOVE    SYS-1900-PRTKBN(17)
                                   TO  SYS-1901-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SYS-1901-STYUKYMD (1:6)
           MOVE    "01"            TO  SYS-1901-STYUKYMD (7:2)
           MOVE    SYS-1901-STYUKYMD
                                   TO  SYS-1901-EDYUKYMD
           MOVE    SPA-HOSPNUM     TO  SYS-1901-HOSPNUM
           MOVE    SYS-1901-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1901-REC
               MOVE    SYS-1901-HOSPNAME1  TO  WRK-HOSPNAME1
               MOVE    SYS-1901-HOSPNAME2  TO  WRK-HOSPNAME2
           ELSE
               INITIALIZE                  SYS-1901-REC
           END-IF
           .
      *
       900-1901-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1902-READ-SEC           SECTION.
      *
      *    医療機関住所編集情報読み込み
           MOVE    SPACE           TO  SYS-1902-REC
           INITIALIZE                  SYS-1902-REC
           MOVE    "1902"          TO  SYS-1902-KANRICD
           MOVE    SYS-1900-PRTKBN(17)
                                   TO  SYS-1902-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SYS-1902-STYUKYMD (1:6)
           MOVE    "01"            TO  SYS-1902-STYUKYMD (7:2)
           MOVE    SYS-1902-STYUKYMD
                                   TO  SYS-1902-EDYUKYMD
           MOVE    SPA-HOSPNUM     TO  SYS-1902-HOSPNUM
           MOVE    SYS-1902-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1902-REC
               MOVE    SYS-1902-ADRS1  TO  WRK-HOSPADRS1
               MOVE    SYS-1902-ADRS2  TO  WRK-HOSPADRS2
      *=== シス管「1901」の電話番号印字 by Yoshikawa(2012/05/17) start
               MOVE    SYS-1902-TEL    TO  WRK-HOSPTEL
      *=== シス管「1901」の電話番号印字 by Yoshikawa(2012/05/17) end
           ELSE
               INITIALIZE                  SYS-1902-REC
           END-IF
           .
      *
       900-1902-READ-EXT.
           EXIT.
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *****************************************************************
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1903-READ-SEC           SECTION.
      *
           MOVE    SPACE               TO  SYS-1903-REC
           INITIALIZE                      SYS-1903-REC
           MOVE    SPA-HOSPNUM         TO  SYS-1903-HOSPNUM
           MOVE    "1903"              TO  SYS-1903-KANRICD
           MOVE    SYS-1900-PRTKBN(17) TO  SYS-1903-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           MOVE    "01"                TO  SYS-1903-STYUKYMD (7:2)
           MOVE    SYS-1903-STYUKYMD   TO  SYS-1903-EDYUKYMD
           MOVE    SYS-1903-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1903-REC
               MOVE    SYS-1903-KAISETUNAME
                                       TO  WRK-KAISETUNAME
           ELSE
               INITIALIZE                  SYS-1903-REC
           END-IF
           .
      *
       900-1903-READ-EXT.
           EXIT.
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       910-SYSKANRI-KEY10-SEC         SECTION.
      *
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key10"             TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC          =   ZERO
               MOVE    "tbl_syskanri"  TO  MCP-TABLE
               MOVE    "key10"         TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF          MCP-RC      =   ZERO
                   MOVE    ZERO            TO  FLG-SYSKANRI
               ELSE
                   MOVE    1               TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key10"             TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       910-SYSKANRI-KEY10-EXT.
           EXIT.
      *
      *****************************************************************
      *    システム管理マスタ読込（ＮＥＸＴ）
      *****************************************************************
       900-SYSKANRI-READ-N-SEC         SECTION.
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-DBFETCH-SEC
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-SYSKANRI
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
           .
       900-SYSKANRI-READ-N-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       910-SEIKYU-INV-SEC         SECTION.
      *
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    "tbl_seikyu"        TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SEIKYU
                   MOVE    MCPDATA-REC         TO  RECE10-REC
               ELSE
                   MOVE    1                   TO  FLG-SEIKYU
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SEIKYU
           END-IF
      *
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険番号マスター読込
      *****************************************************************
       900-HKNNUM-READ-SEC         SECTION.
      *
           PERFORM 900-DBFETCH-SEC
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC     TO  HKNNUM-REC
               MOVE    ZERO            TO  FLG-HKNNUM
           ELSE
               INITIALIZE                  HKNNUM-REC
               MOVE    1               TO  FLG-HKNNUM
           END-IF
      *
           .
       900-HKNNUM-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者マスター読込（キー）
      *****************************************************************
       900-HKNJAINF-INV-SEC         SECTION.
      *
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    "tbl_hknjainf"      TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-HKNJAINF
                   MOVE    MCPDATA-REC         TO  HKNJAINF-REC
               ELSE
                   MOVE    1                   TO  FLG-HKNJAINF
               END-IF
           ELSE
               MOVE    1                   TO  FLG-HKNJAINF
           END-IF
      *
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       900-HKNJAINF-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    ジョブ管理ＤＢ制御処理
      *****************************************************************
       900-CALL-ORCSJOB-SEC            SECTION.
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA 
                                   JOBKANRI-REC
                                   SPA-AREA
           .
       900-CALL-ORCSJOB-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢＳＥＬＥＣＴ処理
      *****************************************************************
       900-DBSELECT-SEC                SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC              =   ZERO
               CONTINUE
           ELSE
               DISPLAY "SELECT ERR table=" MCP-TABLE
                       " pathname="        MCP-PATHNAME
           END-IF
           .
       900-DBSELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢＦＥＴＣＨ処理
      *****************************************************************
       900-DBFETCH-SEC                SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           .
       900-DBFETCH-EXT.
           EXIT.
      *
      *****************************************************************
      *    テーブルクローズ処理
      *****************************************************************
       900-CLOSE-SEC               SECTION.
      *
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           .
       900-CLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    テーブルアクセス処理
      *****************************************************************
       900-ORCDBMAIN-SEC               SECTION.
      *
           CALL    "ORCDBMAIN"         USING   MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
           .
      *
       900-ORCDBMAIN-EXT.
           EXIT.
      *      
      *****************************************************************
      *    ＤＢオープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBOPEN"            TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBSTART"           TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢクローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBCOMMIT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
       900-DBDISCONNECT-EXT.
           EXIT.
