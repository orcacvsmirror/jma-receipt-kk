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
       PROGRAM-ID.             SOKATU1000.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・請求書集計処理
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/06/07    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev 	修正者	日付		内容
      * 01.00.01     山口    2005/09/08    乳幼児併用の給付割合を修正
      * 01.00.02     山口    2006/02/20    返戻対応
      * 01.00.03     内田    2006/10/31    帳票様式の変更に伴う修正
      * 01.00.04     内田    2006/11/28    印字順序の修正
      * 01.00.05     内田    2007/09/19    日レセver4.0対応
      *                                    システム管理マスタ「1901」の
      *                                    医療機関情報を参照
      * 01.00.06     内田    2008/02/13    特別療養費国保は別帳票とする
      * 01.00.07     内田    2008/04/30    帳票様式の変更に伴う修正
      * 01.00.08     内田    2008/05/07    給付割合印字修正
      * 01.00.09     内田    2009/01/14    SPA-AREA初期化
      * 01.00.10     吉川    2009/08/25    長期は別帳票とする
      * 01.00.11     吉川    2010/07/15    オンライン返戻対応
      * 01.00.12     吉川    2011/03/10    open-cobol1.0対応
      * 01.00.13     吉川    2011/04/08    東北地方太平洋沖地震対応
      * 01.00.14     吉川    2011/04/25    災害分は県外とする
      * 01.00.15     吉川    2011/10/17    県内災害分は県内とする
      * 01.00.16     吉川    2012/04/27    在宅はまとめて集計するように修正
      * 01.00.17     吉川    2012/12/21    医療機関情報編集対応
      * 01.00.18     吉川    2014/05/21    前期高齢者２割対応
      * 01.00.19     吉川    2014/09/04    返戻時、再印刷画面のタイトル修正
      * 01.00.20     吉川    2014/10/06    ver4.8.0対応（一時ディレクトリ変更）
      * 01.00.21     萩野    2015/10/08    医療機関編集情報への開設者名追加対応
      * 01.00.22     門間    2017/02/06    医療機関コード変更時、
      *                                    医療機関コード別の作成処理対応
      * 01.00.23     吉川    2018/02/09    SITEKBN変更
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル
           SELECT  SKT1000TMP-FILE ASSIGN    SKT1000TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1000TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1000.
      *
006900*    請求ＤＢ更新用ファイル
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL 
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
006900*    エラーファイル
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT1000TMP-FILE.
           COPY    "CPSKT1000TMP.INC".
      *
006900*    請求ＤＢ更新用ファイル
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1000TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *---(01.00.05) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT1000.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT1000         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1000TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-KOH             PIC 9(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           03  FLG-GYOSEI          PIC 9(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           03  IDY1                PIC 9(04).
           03  IDY2                PIC 9(04).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.05) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      ****2006/02/20  yamaguchi INS.
           03  WRK-PARA-SYOKBN     PIC X(01).
      ****
      *---(01.00.06) LINE ADD START ------------------------------------
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *---(01.00.06) LINE ADD END   ------------------------------------
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR         PIC X(200).
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
           03  WRK-RJNKYURATE      PIC 9(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           03  WRK-CHARCNT         PIC 9(02).
           03  WRK-SENTOU          PIC 9(02).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
           03  WRK-Z2              PIC ZZ.
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
      *
      *    合計
           03  WRK-SUM  OCCURS  2.
               05  WRK-GKENSU      PIC  9(06).
               05  WRK-GTENSU      PIC  9(10).
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      ****2006/02/20  yamaguchi INS.
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      ****
           03  WRK-PATH              PIC X(50).
      *    医療機関情報
           03  WRK-HOSPNAME          PIC X(100).
           03  WRK-HOSPNAME-R        REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1     PIC X(50).
               05  WRK-HOSPNAME2     PIC X(50).
           03  WRK-HOSPADRS          PIC X(100).
           03  WRK-HOSPADRS-R        REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1     PIC X(50).
               05  WRK-HOSPADRS2     PIC X(50).
           03  WRK-HOSPTEL           PIC X(15).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
      *
      *    キー用エリア
       01  KEY-AREA  VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-SRYYM      PIC  X(06).
               05  KEY-N-PREFKBN    PIC  9(01).
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) start
               05  KEY-N-TYOKI      PIC  X(01).
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) end
      *=== 災害対応 by Yoshikawa(2011/04/08) start
               05  KEY-N-GENMEN     PIC  X(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
           03  KEY-OLD.
               05  KEY-O-SRYYM      PIC  X(06).
               05  KEY-O-PREFKBN    PIC  9(01).
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) start
               05  KEY-O-TYOKI      PIC  X(01).
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) end
      *=== 災害対応 by Yoshikawa(2011/04/08) start
               05  KEY-O-GENMEN     PIC  X(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.07) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
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
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
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
      *---(01.00.09) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
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
      **** 2006/02/20 yamaguchi INS.
      ****                                         WRK-PARA-JOBID
      ****                                         WRK-PARA-SHELLID
      ****                                         WRK-PARA-HOSPID
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-SYOKBN
      ****
      *---(01.00.06) LINE ADD START ------------------------------------
                                               WRK-PARA-TOKUBETU
      *---(01.00.06) LINE ADD END   ------------------------------------
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *---(01.00.05) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU1000"    TO  JOB-PGID
           MOVE    "国保総括表"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
           MOVE    "SKT1000"           TO  SKT1000TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT1000TP-TERMID
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT1000TP-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
           MOVE  SKT1000TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT1000TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                                 TO  SYS-1001-STYUKYMD(1:6)
      *                                     SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    SYS-1001-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                                 TO  SYS-1002-STYUKYMD(1:6)
      *                                     SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    SYS-1002-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
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
           OPEN    OUTPUT  UPD-FILE
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      **** 2006/02/20 yamaguchi INS.
      *     EVALUATE    WRK-PARA-SYOKBN
      *         WHEN    "2"
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"        TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"        TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
      *     END-EVALUATE
      ****
           EVALUATE    WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
               WHEN   "2"               ALSO  "1"
                   MOVE   "key37"  TO  WRK-PATH
               WHEN   "1"               ALSO  "1"
                   MOVE   "key38"  TO  WRK-PATH
               WHEN   "2"               ALSO  "2"
                   MOVE   "key39"  TO  WRK-PATH
               WHEN   "1"               ALSO  "2"
                   MOVE   "key40"  TO  WRK-PATH
           END-EVALUATE
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           PERFORM 900-SEIKYU-SELECT-SEC
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
           OPEN     OUTPUT  SKT1000TMP-FILE
           CLOSE            SKT1000TMP-FILE
           OPEN     I-O     SKT1000TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1000TMP-FILE
      *
           IF       FLG-UPD   =       1
                    PERFORM   2002-PRINT-SEC
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    終了    処理
      *****************************************************************
       300-END-SEC                     SECTION.
      *
           IF      CNT-RECE10          =   ZERO 
                   CONTINUE
           ELSE
                   IF      FLG-UPD     =   1
                           PERFORM     310-SEIKYU-UPD-SEC
                   END-IF
           END-IF
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SOKATU1000 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1000 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------

           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者番号別集計処理
      *****************************************************************
       2001-KOKUHO-SYUKEI-SEC              SECTION.
      * 
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT1000TMP-REC
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT1000TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT1000TMP-HKNJANUM(1:6)
           END-IF
      *
      *    在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) start
      *     MOVE  RECE10-ZAITAKU  TO  SKT1000TMP-ZAITAKU
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) end
      *
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) start
      *    長期
           IF  RECE10-ETC-KOHNUM(1)  =  "972" OR "974"
           OR  RECE10-ETC-KOHNUM(2)  =  "972" OR "974"
           OR  RECE10-ETC-KOHNUM(3)  =  "972" OR "974"
           OR  RECE10-ETC-KOHNUM(4)  =  "972" OR "974"
             MOVE  "1"           TO  SKT1000TMP-TYOKI
           END-IF
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) end
      *
      *    県内／県外
           MOVE  RECE10-PREFKBN  TO  SKT1000TMP-PREFKBN
      *
      *    県外は市町村、組合の順で印字する
           IF    RECE10-PREFKBN  =   "2"
             IF    SKT1000TMP-HKNJANUM(3:1)  =  "3"
               MOVE    "2"       TO  SKT1000TMP-KUMIAIKBN
             ELSE
               MOVE    "1"       TO  SKT1000TMP-KUMIAIKBN
             END-IF
           END-IF
      *
      *    保険種別
           IF  RECE10-RJNHKNNUM  NOT =  SPACE
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用判定はレセプトと会わせる為
      *    請求管理情報の公費番号で判定する
      *         IF    RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143" 
      *          MOVE   6  TO  SKT1000TMP-SYUBETU
      *        ELSE
      *           MOVE   5  TO  SKT1000TMP-SYUBETU
      *        END-IF
             MOVE   4  TO  SKT1000TMP-SYUBETU
      *
      *     老人の場合は区分に(10 - 給付割合)をセットする
      *       COMPUTE WRK-RJNKYURATE  =   10  -  RECE10-KYURATE
      *       MOVE  WRK-RJNKYURATE   TO     SKT1000TMP-KBN
      *    本家入外区分
             IF  RECE10-KYURATE  =  9
               IF  RECE10-NYUGAIKBN  =  1
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *           MOVE  7  TO  SKT1000TMP-KBN
                 MOVE  "7"  TO  SKT1000TMP-KBN
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
                 MOVE  1  TO  SKT1000TMP-JYUNJO
               ELSE
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *           MOVE  8  TO  SKT1000TMP-KBN
                 MOVE  "8"  TO  SKT1000TMP-KBN
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
                 MOVE  2  TO  SKT1000TMP-JYUNJO
               END-IF
             ELSE
               IF  RECE10-NYUGAIKBN  =  1
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *           MOVE  9  TO  SKT1000TMP-KBN
                 MOVE  "9"  TO  SKT1000TMP-KBN
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
                 MOVE  3  TO  SKT1000TMP-JYUNJO
               ELSE
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *           MOVE  0  TO  SKT1000TMP-KBN
                 MOVE  "0"  TO  SKT1000TMP-KBN
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
                 MOVE  4  TO  SKT1000TMP-JYUNJO
               END-IF
             END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           ELSE
      *    一般／退職
      *---(01.00.03) LINE ADD START ------------------------------------
      *       IF  RECE10-HKNNUM  =  "060"
      *
      *    福祉併用判定はレセプトと会わせる為
      *    請求管理情報の公費番号で判定する
      *         IF    RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143" 
      *           MOVE   2  TO  SKT1000TMP-SYUBETU
      *         ELSE
      *           MOVE   1  TO  SKT1000TMP-SYUBETU
      *         END-IF
      *       ELSE
      *
      *    福祉併用判定はレセプトと会わせる為
      *    請求管理情報の公費番号で判定する
      *         IF    RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143" 
      *           MOVE   4  TO  SKT1000TMP-SYUBETU
      *         ELSE
      *           MOVE   3  TO  SKT1000TMP-SYUBETU
      *         END-IF
      *       END-IF
      *---(01.00.06) LINE ADD START ------------------------------------
      *      IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060"  OR  "068"
      *---(01.00.06) LINE ADD END   ------------------------------------
                MOVE  1  TO  SKT1000TMP-SYUBETU
             ELSE
                MOVE  3  TO  SKT1000TMP-SYUBETU
             END-IF
      *
      *     本家入外区分
             IF    RECE10-AGE    >=  70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) start
      *         IF  RECE10-KYURATE  =  9
      *           IF  RECE10-NYUGAIKBN  =  1
      *             MOVE    "7"           TO  SKT1000TMP-KBN
      *             MOVE    1             TO  SKT1000TMP-JYUNJO
      *           ELSE
      *             MOVE    "8"           TO  SKT1000TMP-KBN
      *             MOVE    2             TO  SKT1000TMP-JYUNJO
      *           END-IF
      *         ELSE
      *           IF  RECE10-NYUGAIKBN  =  1
      *             MOVE    "9"           TO  SKT1000TMP-KBN
      *             MOVE    3             TO  SKT1000TMP-JYUNJO
      *           ELSE
      *             MOVE    "0"           TO  SKT1000TMP-KBN
      *             MOVE    4             TO  SKT1000TMP-JYUNJO
      *           END-IF
      *         END-IF
               EVALUATE  RECE10-KYURATE
                 WHEN  9
                   IF  RECE10-NYUGAIKBN  =  1
                     MOVE    "7"           TO  SKT1000TMP-KBN
                     MOVE    1             TO  SKT1000TMP-JYUNJO
                   ELSE
                     MOVE    "8"           TO  SKT1000TMP-KBN
                     MOVE    2             TO  SKT1000TMP-JYUNJO
                   END-IF
                 WHEN  8
                   IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                     IF  RECE10-NYUGAIKBN  =  1
                       MOVE    "7"         TO  SKT1000TMP-KBN
                       MOVE    1           TO  SKT1000TMP-JYUNJO
                     ELSE
                       MOVE    "8"         TO  SKT1000TMP-KBN
                       MOVE    2           TO  SKT1000TMP-JYUNJO
                     END-IF
                   ELSE
                     IF  RECE10-NYUGAIKBN  =  1
                       MOVE    "9"         TO  SKT1000TMP-KBN
                       MOVE    3           TO  SKT1000TMP-JYUNJO
                     ELSE
                       MOVE    "0"         TO  SKT1000TMP-KBN
                       MOVE    4           TO  SKT1000TMP-JYUNJO
                     END-IF
                   END-IF
                 WHEN  7
                   IF  RECE10-NYUGAIKBN  =  1
                     MOVE    "9"           TO  SKT1000TMP-KBN
                     MOVE    3             TO  SKT1000TMP-JYUNJO
                   ELSE
                     MOVE    "0"           TO  SKT1000TMP-KBN
                     MOVE    4             TO  SKT1000TMP-JYUNJO
                   END-IF
               END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) end
             ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
               IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
               AND  (RECE10-FLG (1)   =  1)
                 IF  RECE10-NYUGAIKBN  =  1
                   MOVE    "3"           TO  SKT1000TMP-KBN
                   MOVE    7             TO  SKT1000TMP-JYUNJO
                 ELSE
                   MOVE    "4"           TO  SKT1000TMP-KBN
                   MOVE    8             TO  SKT1000TMP-JYUNJO
                 END-IF
               ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
               IF    RECE10-AGE    <  3
                 IF  RECE10-NYUGAIKBN  =  1
                   MOVE    "3"           TO  SKT1000TMP-KBN
                   MOVE    7             TO  SKT1000TMP-JYUNJO
                 ELSE
                   MOVE    "4"           TO  SKT1000TMP-KBN
                   MOVE    8             TO  SKT1000TMP-JYUNJO
                 END-IF
               ELSE
                 IF  RECE10-HONKZKKBN   =   "1"
                   IF  RECE10-NYUGAIKBN  =  1
                     MOVE    "1"         TO  SKT1000TMP-KBN
                     MOVE    5           TO  SKT1000TMP-JYUNJO
                   ELSE
                     MOVE    "2"         TO  SKT1000TMP-KBN
                     MOVE    6           TO  SKT1000TMP-JYUNJO
                   END-IF
      *            退職本人は高齢より先に印字する
                   IF  RECE10-HKNNUM  =  "067"
                     MOVE  2             TO  SKT1000TMP-SYUBETU
                   END-IF
                 ELSE
                   IF  RECE10-NYUGAIKBN  =  1
                     MOVE    "5"         TO  SKT1000TMP-KBN
                     MOVE    5           TO  SKT1000TMP-JYUNJO
                   ELSE
                     MOVE    "6"         TO  SKT1000TMP-KBN
                     MOVE    6           TO  SKT1000TMP-JYUNJO
                   END-IF
                 END-IF
      *      保険種別一般７割は区分１，２
      *---(01.00.06) LINE ADD START ------------------------------------
      *           IF  RECE10-HKNNUM  =  "060"  AND
      *               RECE10-KYURATE  =  7
                 IF  (RECE10-HKNNUM  =  "060"  OR  "068")
                 AND  RECE10-KYURATE  =  7
      *---(01.00.06) LINE ADD END   ------------------------------------
                   IF  RECE10-NYUGAIKBN  =  1
                     MOVE    "1"         TO  SKT1000TMP-KBN
                     MOVE    5           TO  SKT1000TMP-JYUNJO
                   ELSE
                     MOVE    "2"         TO  SKT1000TMP-KBN
                     MOVE    6           TO  SKT1000TMP-JYUNJO
                   END-IF
                 END-IF
               END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
               END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
             END-IF
      *    区分
      *       EVALUATE  TRUE
      *         WHEN  RECE10-AGE  >=  70
      *           IF  RECE10-KYURATE   =  9
      *               MOVE   "1"    TO   SKT1000TMP-KBN
      *           ELSE
      *               MOVE   "2"    TO   SKT1000TMP-KBN
      *           END-IF
      *         WHEN  RECE10-AGE  > 2
      *           MOVE  "3"  TO  SKT1000TMP-KBN
      *         WHEN  OTHER
      *           MOVE  "4"  TO  SKT1000TMP-KBN
      *       END-EVALUATE
      *---(01.00.03) LINE ADD END   ------------------------------------
           END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    給付割合（福祉併用なら福祉で助成する割合を記載する）
      *     IF  SKT1000TMP-SYUBETU  =  "2"  OR  "4"  OR  "6"
      *       IF  RECE10-KOHNUM(1)  =  "145" OR
      *           RECE10-KOHNUM(2)  =  "145" OR
      *           RECE10-KOHNUM(3)  =  "145" OR
      *           RECE10-KOHNUM(4)  =  "145"
      ***** 05/09/08 yamaguchi DEL
      *         MOVE   2    TO    SKT1000TMP-KYURATE
      ***** 05/09/08 yamaguchi INS
      *         IF  RECE10-AGE  <  3
      *           MOVE   2    TO    SKT1000TMP-KYURATE
      *         ELSE
      *           MOVE   3    TO    SKT1000TMP-KYURATE
      *         END-IF
      *****
      *       ELSE
      *    老人福祉の時は老人の給付割合を設定
      *         IF  SKT1000TMP-SYUBETU = "6"
      *           COMPUTE WRK-RJNKYURATE  =   10  -  RECE10-KYURATE
      *           MOVE  WRK-RJNKYURATE   TO     SKT1000TMP-KYURATE
      *         ELSE
      *           MOVE   3    TO    SKT1000TMP-KYURATE
      *         END-IF
      *       END-IF
      *
      *    福祉＋３歳未満は２割を設定
      *       IF    RECE10-AGE    <    3
      *         MOVE    2       TO    SKT1000TMP-KYURATE
      *       END-IF
      *     ELSE
      *       MOVE  RECE10-KYURATE    TO  SKT1000TMP-KYURATE
      *     END-IF
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  RECE10-KYURATE    TO  SKT1000TMP-KYURATE
            IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
            AND  (RECE10-FLG (2)   =  1)
                MOVE  8                 TO  SKT1000TMP-KYURATE
            ELSE
                MOVE  RECE10-KYURATE    TO  SKT1000TMP-KYURATE
            END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    入外区分
           MOVE  RECE10-NYUGAIKBN  TO  SKT1000TMP-NYUGAIKBN
      *
      *=== 災害対応 by Yoshikawa(2011/04/08) start
      *    災害対応
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  "1"             TO  SKT1000TMP-GENMEN
      *=== 災害分は県外 by Yoshikawa(2011/04/25) start
      *       MOVE  1               TO  SKT1000TMP-PREFKBN
      *=== 県内災害分は県内 by Yoshikawa(2011/10/17) start
      *       MOVE  2               TO  SKT1000TMP-PREFKBN
      *=== 県内災害分は県内 by Yoshikawa(2011/10/17) end
      *=== 災害分は県外 by Yoshikawa(2011/04/25) end
      *
      *      保険者不明の場合は住所から市町村を取得
             IF  RECE10-HKNJANUM  =  ZERO
               PERFORM  20011-CITYGET-SEC
             END-IF
           END-IF
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
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
               MOVE    1                   TO  FLG-END
           END-IF 
           .
       2001-KOKUHO-SYUKEI-EXT.
           EXIT.
      *
      *=== 災害対応 by Yoshikawa(2011/04/08) start
      *****************************************************************
      *    住所から市町村名取得処理
      *****************************************************************
       20011-CITYGET-SEC          SECTION.
      *
           MOVE    ZERO                    TO  FLG-GYOSEI
                                               WRK-CHARCNT
                                               WRK-SENTOU
      *
           PERFORM  VARYING  IDY1  FROM  1  BY  2
                    UNTIL  IDY1  >  100
      *      市か郡か
             IF  PTINF-HOME-ADRS(IDY1:2)  =  "郡"
      *        「郡」の後に「〜市」という文字が存在するかどうか
               INSPECT  PTINF-HOME-ADRS  TALLYING  
                 WRK-CHARCNT FOR ALL "市" AFTER "郡"
               IF  WRK-CHARCNT  =  ZERO
                 MOVE    2                 TO  FLG-GYOSEI
                 MOVE    IDY1              TO  WRK-SENTOU
                 MOVE    100               TO  IDY1
               ELSE
                 MOVE    100               TO  IDY1
               END-IF
             END-IF
           END-PERFORM
           IF  FLG-GYOSEI  =  ZERO
             MOVE    1                     TO   FLG-GYOSEI
           END-IF
      *
           DISPLAY  "FLG-GYOSEI =" FLG-GYOSEI
           DISPLAY  "PTINF-HOME-ADRS =" PTINF-HOME-ADRS
           MOVE  ZERO  TO  WRK-CHARCNT
      *    「市」の場合
           IF  FLG-GYOSEI  =  1
      *      「市」という文字が他にいくつ存在するか数える
             INSPECT  PTINF-HOME-ADRS  TALLYING  
               WRK-CHARCNT FOR ALL "市" AFTER "市"
      *
             DISPLAY  "WRK-CHARCNT =" WRK-CHARCNT
             PERFORM  VARYING  IDY2  FROM  1  BY  2
                      UNTIL  IDY2  >  100
      *        「市」の文字を先頭から検索
               IF  PTINF-HOME-ADRS(IDY2:2)  =  "市"
      *
      *          WRK-CHARCNTが1以上の場合、その「市」は名前に含まれる市である
      *          （例：四日市市や市川市などが該当する）
                 IF  WRK-CHARCNT  >  ZERO
                   MOVE    ZERO            TO  WRK-CHARCNT
                 ELSE
      *            都道府県名から市までを取得
                   MOVE  PTINF-HOME-ADRS(1:IDY2 + 1)
                                           TO  SKT1000TMP-ADRS
                   MOVE  100               TO  IDY2
                   DISPLAY  "SKT1000TMP-ADRS =" SKT1000TMP-ADRS
                 END-IF
               END-IF
             END-PERFORM
      *
      *    「郡」の場合
           ELSE
             PERFORM  VARYING  IDY2  FROM  WRK-SENTOU  BY  2
                      UNTIL  IDY2  >  100
      *        「町」及び「村」を検索
               IF  PTINF-HOME-ADRS(IDY2:2)  =  "町" OR "村"
      *          他に「町」及び「村」という文字が使われているか検索
                 EVALUATE  PTINF-HOME-ADRS(IDY2:2)
                   WHEN  "町"
                     MOVE    ZERO          TO  WRK-CHARCNT
                   WHEN  "村"
                     INSPECT  PTINF-HOME-ADRS  TALLYING  
                       WRK-CHARCNT FOR ALL "町" AFTER "村"
                 END-EVALUATE
      *
                  DISPLAY  "WRK-CHARCNT =" WRK-CHARCNT
      *          WRK-CHARCNTが1以上の場合、その「村」は名前に含まれる町である
      *          （例：村田町などが該当する）
                 IF  WRK-CHARCNT  >  ZERO
                   MOVE    ZERO            TO  WRK-CHARCNT
                 ELSE
      *            都道府県名から町、村までを取得
                   MOVE    PTINF-HOME-ADRS(1:IDY2 + 1)
                                           TO  SKT1000TMP-ADRS
                   MOVE    100             TO  IDY2
                   DISPLAY  "SKT1000TMP-ADRS =" SKT1000TMP-ADRS
                 END-IF
               END-IF
             END-PERFORM
           END-IF
      *
           .
       20011-CITYGET-EXT.
           EXIT.
      *
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *****************************************************************
      *    医療保険・集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
           PERFORM  2101-SYUKEI-SEC
      *
           IF  FLG-SKT1000TMP  =  1
               WRITE    SKT1000TMP-REC
           ELSE
               REWRITE  SKT1000TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・請求集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                   TO  SKT1000TMP-KENSU
      *    療養の給付：点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1000TMP-TENSU
      *    公費併用か
           IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
               RECE10-KOHNUM (2)(1:1)  =  "0"  OR
               RECE10-KOHNUM (3)(1:1)  =  "0"  OR
               RECE10-KOHNUM (4)(1:1)  =  "0"
             ADD   1           TO  SKT1000TMP-KKENSU
           END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用か
           IF  RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143"
             ADD   1           TO  SKT1000TMP-FKENSU
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           MOVE    1               TO  FLG-UPD
           .
       2101-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
006900*    請求ＤＢ更新用ファイル出力処理
      *****************************************************************
       230-UPD-FILE-HENSYU-SEC         SECTION.
      *
           MOVE    RECE10-REC          TO  RECE10X-REC
           WRITE   RECE10X-REC
           ADD     1                   TO  CNT-UPDFILE
           .
       230-UPD-FILE-HENSYU-EXT.
           EXIT.
057400*
      *****************************************************************
      *    帳票ファイル出力処理
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
           OPEN     INPUT       SKT1000TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           MOVE     1           TO       WRK-CNT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
           MOVE  KEY-NEW  TO  KEY-OLD
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *    帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 330-PRINT-OUT-SEC
           END-PERFORM
      *
           CLOSE    SKT1000TMP-FILE
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       310-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1000
      *    診療年月
            MOVE    WRK-SRYYMWH           TO  SKT1000-SRYYM
      *
      *    点数表区分
           EVALUATE  SYS-1001-TENHYOKBN
             WHEN  1    MOVE  "○"       TO  SKT1000-TENHYOKBN (1)
             WHEN  3    MOVE  "○"       TO  SKT1000-TENHYOKBN (2)
             WHEN  4    MOVE  "○"       TO  SKT1000-TENHYOKBN (3)
             WHEN  6    MOVE  "○"       TO  SKT1000-TENHYOKBN (4)
           END-EVALUATE
      *
      *    県内／県外
           IF  SKT1000TMP-PREFKBN  =  1
             MOVE  "○"                  TO  SKT1000-KENKBN1
           ELSE
             MOVE  "○"                  TO  SKT1000-KENKBN2
           END-IF
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD      TO  SKT1000-HOSPCDN
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1000-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1000-HOSPNAME
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1000-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1000-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1000-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1000-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1000-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1000-TEL
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT1000-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT1000-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1000-TOKUBETU
           END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC      SECTION.
      *
      *    編集処理
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     25
                    OR       KEY-NEW  NOT =  KEY-OLD
                    OR       FLG-PRINT  =  1
      *
      *    保険者名
      *=== 災害対応 by Yoshikawa(2011/04/08) start
             IF  SKT1000TMP-GENMEN  NOT =  SPACE
             AND SKT1000TMP-ADRS  NOT =  SPACE
               MOVE  SKT1000TMP-ADRS    TO  SKT1000-HKNJANAME (IDX1)
             ELSE
      *=== 災害対応 by Yoshikawa(2011/04/08) end
               PERFORM  960-HKNJAINF-SET-SEC
               MOVE  HKNJA-HKNJANAME      TO  SKT1000-HKNJANAME (IDX1)
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           END-IF
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
      *    在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) start
      *       IF  SKT1000TMP-ZAITAKU  =  1
      **---(01.00.03) LINE ADD START ------------------------------------
      **         MOVE  "在"               TO  SKT1000-ZAI1 (IDX1)
      **         MOVE  "○"               TO  SKT1000-ZAI2 (IDX1)
      *         MOVE  "在"               TO  SKT1000-ZAI (IDX1)
      **---(01.00.03) LINE ADD END   ------------------------------------
      *       END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) end
      *
      *    保険者番号
             MOVE    SKT1000TMP-HKNJANUM  TO  WRK-MAE-INPUT
             PERFORM 2009-HENKAN-SEC
             MOVE    WRK-OUT-INPUT        TO  SKT1000-HKNJANUM (IDX1)
      *
      *    保険種別
             EVALUATE  SKT1000TMP-SYUBETU
               WHEN  1
                 MOVE  "○"  TO  SKT1000-SYUBETU (IDX1 1)
               WHEN  2
               WHEN  3
                 MOVE  "○"  TO  SKT1000-SYUBETU (IDX1 2)
               WHEN  4
                 MOVE  "○"  TO  SKT1000-SYUBETU (IDX1 3)
             END-EVALUATE
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    退職者の時、本人家族を記載
      *       EVALUATE  SKT1000TMP-HONKZKKBN
      *       WHEN "1"
      *           MOVE  "ホ"  TO   SKT1000-HONKZKKBN(IDX1)
      *        WHEN "4"
      *        WHEN "5"
      *           MOVE  "カ"  TO   SKT1000-HONKZKKBN(IDX1)
      *       WHEN OTHER
      *           MOVE  SPACE  TO   SKT1000-HONKZKKBN(IDX1)
      *       END-EVALUATE
      *
      *    区分
      *       EVALUATE SKT1000TMP-KBN
      *       WHEN "1"
      *           MOVE  "7"   TO   SKT1000-KBN(IDX1)
      *       WHEN "2"
      *           MOVE  "7"   TO   SKT1000-KBN(IDX1)
      *       WHEN "3"
      *           MOVE  "0"   TO   SKT1000-KBN(IDX1)
      *       WHEN "4"
      *           MOVE  "3"   TO   SKT1000-KBN(IDX1)
      *       END-EVALUATE
      *
      *    老人の区分はスペースを入れる。
      *       IF  SKT1000TMP-SYUBETU  =  "5" OR "6"
      *           MOVE   SPACE    TO    SKT1000-KBN(IDX1)
      *       END-IF
             MOVE  SKT1000TMP-KBN      TO  SKT1000-KBN (IDX1)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    割合
             MOVE  SKT1000TMP-KYURATE  TO  WRK-Z2
             MOVE  WRK-Z2              TO  SKT1000-KYURATE (IDX1)
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    入外区分
      *       MOVE  "○"  TO
      *                SKT1000-NYUGAIKBN (IDX1 SKT1000TMP-NYUGAIKBN)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    療養の給付：件数
             MOVE  SKT1000TMP-KENSU   TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1000-KENSU(IDX1)
      *
      *    療養の給付：件数（公費用）
             MOVE  SKT1000TMP-KKENSU  TO  WRK-Z3
             MOVE  WRK-Z3   TO  SKT1000-KKENSU(IDX1)
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    療養の給付：件数（福祉用）
             MOVE  SKT1000TMP-FKENSU  TO  WRK-Z3
             MOVE  WRK-Z3   TO  SKT1000-FKENSU(IDX1)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    療養の給付：点数
             MOVE  SKT1000TMP-TENSU   TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1000-TENSU(IDX1)
      *
      *    合計集計
             ADD  SKT1000TMP-KENSU  TO  WRK-GKENSU(SKT1000TMP-NYUGAIKBN)
             ADD  SKT1000TMP-TENSU  TO  WRK-GTENSU(SKT1000TMP-NYUGAIKBN)
      *
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
      *    合計
           IF  FLG-PRINT  =  1 OR
               KEY-NEW  NOT =  KEY-OLD
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     2
               MOVE  WRK-GKENSU (IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5             TO  SKT1000-GKENSU (IDX1)
               MOVE  WRK-GTENSU (IDX1)  TO  WRK-Z10
               MOVE  WRK-Z10            TO  SKT1000-GTENSU (IDX1)
             END-PERFORM
      *
             MOVE   ZERO                TO  WRK-SUM(1)
                                            WRK-SUM(2)
           END-IF
           MOVE  KEY-NEW  TO  KEY-OLD
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
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
           MOVE   "SKT1000.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) start
      *     MOVE    "国保総括表"        TO  SPRT-TITLE
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保総括表"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保総括表［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保総括表［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保総括表［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) end
           MOVE    SKT1000             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       330-PRINT-OUT-EXT.
           EXIT.
057400*
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
      *---(01.00.05) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA
                                       JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-IF
      *
           MOVE    1                   TO  FLG-END
      *
           .
       500-ERR-HENSYU-EXT.
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
      *
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      *
                   MOVE    RECE10-REC             TO  MCPDATA-REC
                   MOVE    "DBUPDATE"             TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY    TO  MCP-PATH
      *             CALL    "MCPSUB"         USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU1000 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY
                   MOVE  "*** SOKATU1000 SEIKYU INVALID ***"
                                           TO  WRK-RECEERR
                   MOVE    RECE10-KEY      TO  WRK-RECEERR(33:)
                   PERFORM 500-ERR-HENSYU-SEC
                   MOVE    1               TO  FLG-UPDFILE
               END-IF
           END-PERFORM  
      *
           CLOSE   UPD-FILE
           .
       310-SEIKYU-UPD-EXT.
           EXIT.
      *
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
      *   保険者情報セット
      *****************************************************************
       960-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKNJA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  SKT1000TMP-HKNJANUM         TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY     TO  MCP-PATH
             MOVE    "tbl_hknjainf"          TO  MCP-TABLE
             MOVE    "key"                   TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
             PERFORM  965-HKNJAINF-READ-SEC
      *
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknjainf"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       960-HKNJAINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
       965-HKNJAINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
           ELSE
             INITIALIZE  HKNJAINF-REC
             MOVE  1            TO  FLG-HKNJAINF
           END-IF
      *
           .
       965-HKNJAINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                  RECE10-REC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM          TO  RECE10-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           MOVE    SPACE                TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"           TO  RECE10-XXEDHKNJANUM
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           IF  WRK-PARA-TOKUBETU  =  2
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *       MOVE    "000000"           TO  RECE10-SRYYM
      *       MOVE    "999999"           TO  RECE10-XXSRYYM
             MOVE    000000             TO  RECE10-SRYYM
             MOVE    999999             TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
           END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           MOVE    RECE10-REC                 TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      **** 2006/02/20  yamaguchi INS.
      ****     MOVE    PATH-TBL-SEIKYU-KEY4     TO  MCP-PATH
      *     MOVE    WRK-PATH                   TO  MCP-PATH
      ****
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
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
      *---(01.00.05) LINE ADD START ------------------------------------
      **** 2006/02/20  yamaguchi INS.
      ****     MOVE    PATH-TBL-SEIKYU-KEY4     TO  MCP-PATH
      *     MOVE    WRK-PATH                   TO  MCP-PATH
      ****
      *     MOVE    "DBFETCH"                  TO  MCP-FUNC
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/07/15) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/07/15) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF   
      *         
               ADD     1                   TO  CNT-RECE10   
           ELSE
               MOVE    1                   TO  FLG-END
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
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT1000TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1000TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1000TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
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
      *    システム管理マスタ読込
      *****************************************************************
       910-SYSKANRI-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_syskanri"       TO  MCP-TABLE
               MOVE    "key10"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"              TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       910-SYSKANRI-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       910-SEIKYU-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT1000TMP-FILE   NEXT
             AT  END
               MOVE  1  TO  FLG-PRINT
             NOT  AT  END
               MOVE  SKT1000TMP-PREFKBN  TO  KEY-N-PREFKBN
               MOVE  SKT1000TMP-SRYYM    TO  KEY-N-SRYYM
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) start
               MOVE  SKT1000TMP-TYOKI    TO  KEY-N-TYOKI
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) end
      *=== 災害対応 by Yoshikawa(2011/04/08) start
               MOVE  SKT1000TMP-GENMEN   TO  KEY-N-GENMEN
      *=== 災害対応 by Yoshikawa(2011/04/08) end
           END-READ
           .
       900-TMP-READ-EXT.
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    医療機関編集情報読み込み
      *****************************************************************
       900-1900-READ-SEC           SECTION.
      *
      *    医療機関編集情報読み込み
           MOVE    SPACE                   TO  SYS-1900-REC
           INITIALIZE                          SYS-1900-REC
           MOVE    "1900"                  TO  SYS-1900-KANRICD
           MOVE    "*"                     TO  SYS-1900-KBNCD
           MOVE    SPA-HOSPNUM             TO  SYS-1900-HOSPNUM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
                                               SYS-1900-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
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
           MOVE    SPACE               TO  SYS-1901-REC
           INITIALIZE                      SYS-1901-REC
           MOVE    "1901"              TO  SYS-1901-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1901-KBNCD
           MOVE    SPA-HOSPNUM         TO  SYS-1901-HOSPNUM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
                                           SYS-1901-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    SYS-1901-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1901-REC
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
           MOVE    SPACE               TO  SYS-1902-REC
           INITIALIZE                      SYS-1902-REC
           MOVE    "1902"              TO  SYS-1902-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1902-KBNCD
           MOVE    SPA-HOSPNUM         TO  SYS-1902-HOSPNUM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
                                           SYS-1902-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    SYS-1902-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1902-REC
               MOVE    SYS-1902-ADRS1  TO  WRK-HOSPADRS1
               MOVE    SYS-1902-ADRS2  TO  WRK-HOSPADRS2
               MOVE    SYS-1902-TEL    TO  WRK-HOSPTEL
           ELSE
               INITIALIZE                  SYS-1902-REC
           END-IF
           .
      *
       900-1902-READ-EXT.
           EXIT.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *****************************************************************
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1903-READ-SEC           SECTION.
      *
           MOVE    SPACE               TO  SYS-1903-REC
           INITIALIZE                      SYS-1903-REC
           MOVE    SPA-HOSPNUM         TO  SYS-1903-HOSPNUM
           MOVE    "1903"              TO  SYS-1903-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1903-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    "01"                TO  SYS-1903-STYUKYMD (7:2)
           MOVE    SYS-1903-STYUKYMD   TO  SYS-1903-EDYUKYMD
           MOVE    SYS-1903-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .                             
       900-DBCLOSE-EXT.
           EXIT.
