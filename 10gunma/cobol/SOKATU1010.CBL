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
       PROGRAM-ID.             SOKATU1010.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・請求書集計処理
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/07    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            (返戻対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev   修正者	日付		内容
      *  01.00.01    有村    08/08/16    老人の点数、一部負担金、
      *                                  金額、標準負担額の桁数を変更
      *  01.00.02    有村    05/08/31    テスト用に固定値を加算していたのを修正
      *  01.00.03    内田    06/10/13    帳票様式の変更にともなう修正
      *  01.00.04    内田    06/11/28    食事がない場合でも生活療養費を印字
      *  01.00.05    内田    07/06/23    一部負担金が印字されないのを修正
      *                                  老人の一部負担金欄に公費の
      *                                  一部負担金は含めない
      *  01.00.06    内田    07/09/19    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.07    内田    08/02/13    特別療養費国保は別帳票とする
      *  01.00.08    内田    08/04/30    帳票様式の変更に伴う修正
      *  01.00.09    内田    08/05/02    診療年月判定修正
      *  01.00.10    内田    09/01/14    SPA-AREA初期化
      *  01.00.11    吉川    09/08/25    長期は別帳票とする
      *  01.00.12    吉川    10/07/15    オンライン返戻対応
      *  01.00.13    吉川    11/03/10    open-cobol1.0対応
      *  01.00.14    吉川    11/03/24    東北地方太平洋沖地震対応（対象者別集計）
      *  01.00.15    吉川    11/04/08    東北地方太平洋沖地震対応（仕様変更）
      *  01.00.16    吉川    11/04/25    災害分は県外とする
      *  01.00.17    吉川    11/10/17    県内災害分は県内とする
      *  01.00.18    吉川    12/04/27    在宅はまとめて集計するように修正
      *  01.00.19    吉川    12/12/21    プラグイン対応
      *                                  医療機関情報編集対応
      *  01.00.20    吉川    13/07/09    プログラムオプション対応
      *  01.00.21    吉川    14/05/21    前期高齢者２割対応
      *  01.00.22    吉川    14/09/04    返戻時、再印刷画面のタイトル修正
      *  01.00.23    吉川    14/10/06    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.24    萩野    15/10/08    医療機関編集情報への開設者名追加対応
      *  01.00.25    門間    17/02/06    一部負担金欄は保険の一部負担金を記載するよう修正
      *                                  医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.26    吉川    18/02/09    SITEKBN変更
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT1010TMP-FILE ASSIGN    SKT1010TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1010TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1010.
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT1010TMP-FILE.
           COPY    "CPSKT1010TMP.INC".
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1010TP//.
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           COPY    "SKT1010.INC".
           COPY    "SKT1020.INC".
           COPY    "SKT1030.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT1010         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1010TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           03  FLG-GYOSEI          PIC 9(01).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
           03  IDX                 PIC 9(04).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.06) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.06) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *---(01.00.07) LINE ADD START ------------------------------------
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *---(01.00.07) LINE ADD END   ------------------------------------
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU1010".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR         PIC X(200).
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2012/12/21) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-HKNJANAME       PIC X(30).
           03  WRK-KENNAME         PIC X(10).
           03  WRK-PAYKBN          PIC 9(02).
           03  WRK-RATE            PIC 9(03).
           03  WRK-CNT             PIC 9(02).
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           03  WRK-CHARCNT         PIC 9(02).
           03  WRK-SENTOU          PIC 9(02).
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
           03  WRK-Z2              PIC ZZ.
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH              PIC X(50).
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
           03  WRK-YUSEN           PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
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
      *---(01.00.06) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
      *     
      *---(01.00.06) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
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
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
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
      *---(01.00.10) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *---(01.00.07) LINE ADD START ------------------------------------
                                               WRK-PARA-TOKUBETU
      *---(01.00.07) LINE ADD END   ------------------------------------
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *---(01.00.06) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.06) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU1010"    TO  JOB-PGID
           MOVE    "国保請求書"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
           MOVE    "SKT1010"           TO  SKT1010TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT1010TP-TERMID
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT1010TP-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
           MOVE  SKT1010TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT1010TP-FULLNAME
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
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      *     PERFORM  110-INI-FILE-SEC
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      *---(01.00.06) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"        TO  WRK-PATH
      *---(01.00.06) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      *---(01.00.06) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"        TO  WRK-PATH
      *---(01.00.06) LINE ADD END   ------------------------------------
      *     END-EVALUATE
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
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           OPEN    OUTPUT  UPD-FILE
      *  
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理 
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      **
      *     DISPLAY "ファイル名="  FILE-NAME
      **
      *     INITIALIZE   YUSEN-HKNJANUM
      **
      *     OPEN  INPUT  YUSEN-FILE
      **
      *     READ YUSEN-FILE
      *       AT END
      *         INITIALIZE        YUSEN-HKNJANUM
      *       DISPLAY "読み込み失敗"  
      *     END-READ
      **
      *     DISPLAY "優先保険者番号="  YUSEN-HKNJANUM
      **
      *     CLOSE YUSEN-FILE
      **
      *     .
      * 110-INI-FILE-EXT.
      *     EXIT.
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SOKATU1010"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    優先保険者番号
           MOVE    "YUSEN"                   TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           MOVE    WRK-OPTION(1)(1:6)        TO  WRK-YUSEN
           DISPLAY "優先保険者番号="  WRK-YUSEN
      *
           .
       100-OPTION-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    プログラムオプションパラメタセット処理
      *****************************************************************
       1001-OPTION-SET-SEC              SECTION.
      *
           INITIALIZE                            WRK-OPTION-TBL
                                                 FLG-OK
      *    プログラムオプション情報読込
           PERFORM  900-PRGOPTION-READ-SEC
      *
      *    オプション数の初期設定
           MOVE    1                         TO  IDX1
           IF  FLG-PRGOPTION  =  ZERO
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL   (IDX     >   44000 )
                         OR   (IDX1    >  100)
                         OR   (FLG-OK  NOT =   ZERO)
      *
      *        オプションの1桁目が空白であれば処理終了
               IF   PRGOPTION-OPTION(IDX:1)  =  SPACE
               AND  IDY                      =  ZERO
                   MOVE    1                 TO  FLG-OK
               END-IF
      *
               IF  FLG-OK  =  ZERO
      *          改行地点か
                 IF  PRGOPTION-OPTION(IDX:1)  =   X"0A"
                 OR  IDY  >=  100
                   ADD    1                  TO  IDX1
                   MOVE    ZERO              TO  IDY
                 ELSE
                   ADD    1                  TO  IDY
      *            PGオプション内容を１文字ずつセット
                   MOVE    PRGOPTION-OPTION(IDX:1)
                                         TO  WRK-OPTION(IDX1)(IDY:1)
                 END-IF
               END-IF
             END-PERFORM
           END-IF
      *
           .
       1001-OPTION-SET-EXT.
           EXIT.
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT1010TMP-FILE
           CLOSE            SKT1010TMP-FILE
           OPEN     I-O     SKT1010TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1010TMP-FILE
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
           DISPLAY "*** SOKATU1010 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1010 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------

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
           INITIALIZE       SKT1010TMP-REC
      *
           IF       RECE10-HKNJANUM(7:2)  =     SPACE
                    MOVE    RECE10-HKNJANUM(1:6)    TO
                            SKT1010TMP-HKNJANUM(1:6)
           ELSE
                    MOVE    RECE10-HKNJANUM(3:6)    TO
                            SKT1010TMP-HKNJANUM(1:6)
           END-IF
      *
      *    印刷順設定
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      *     IF    YUSEN-HKNJANUM   =  SKT1010TMP-HKNJANUM
           IF    WRK-YUSEN        =  SKT1010TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
             MOVE          1   TO    SKT1010TMP-SYUTURYOKU
           ELSE
             MOVE          2   TO    SKT1010TMP-SYUTURYOKU
           END-IF
      *
      *    在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) start
      *     MOVE  RECE10-ZAITAKU  TO  SKT1010TMP-ZAITAKU
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) end
      *
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) start
      *    長期
           IF  RECE10-ETC-KOHNUM(1)  =  "972" OR "974"
           OR  RECE10-ETC-KOHNUM(2)  =  "972" OR "974"
           OR  RECE10-ETC-KOHNUM(3)  =  "972" OR "974"
           OR  RECE10-ETC-KOHNUM(4)  =  "972" OR "974"
             MOVE  "1"           TO  SKT1010TMP-TYOKI
           END-IF
      *=== 長期は別帳票とする by Yoshikawa(2009/08/25) end
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    平成１８年９月以前の高齢、老人８割か
           IF  (RECE10-SRYYM  <=  200609)  AND
               (RECE10-KYURATE  =  8)     AND
               (RECE10-AGE  >=  70  OR  RECE10-RJNHKNNUM NOT = SPACE)
             MOVE  RECE10-SRYYM  TO  SKT1010TMP-SRYYM
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.08) LINE ADD START ------------------------------------
      *    平成２０年３月以前の一般国保７０歳以上９割は別帳票
      *---(01.00.09) LINE ADD START ------------------------------------
      *     IF   (RECE10-SRYYM  <=   WRK-CONS-SRYYM-200804)
           IF   (RECE10-SRYYM  <   WRK-CONS-SRYYM-200804)
      *---(01.00.09) LINE ADD END   ------------------------------------
           AND  (RECE10-RJNHKNNUM  =  SPACE)
           AND  (RECE10-HKNNUM  =  "060")
           AND  (RECE10-KYURATE  =  9)
             MOVE  RECE10-SRYYM  TO  SKT1010TMP-SRYYM
           END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    県内・県外区分
           MOVE     RECE10-PREFKBN   TO  SKT1010TMP-PREFKBN
      *
      *=== 災害対応 by Yoshikawa(2011/03/24) start
      *    災害対象者は別帳票
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
      *=== 災害対応 by Yoshikawa(2011/04/08) start
      *       MOVE  RECE10-ETC-YKZFTN (1)  TO  SKT1010TMP-GENMEN
             MOVE  "00001"           TO  SKT1010TMP-GENMEN
      *=== 災害分は県外 by Yoshikawa(2011/04/25) start
      *       MOVE  "1"               TO  SKT1010TMP-PREFKBN
      *=== 県内災害分は県内 by Yoshikawa(2011/10/17) start
      *       MOVE  "2"               TO  SKT1010TMP-PREFKBN
      *=== 県内災害分は県内 by Yoshikawa(2011/10/17) end
      *=== 災害分は県外 by Yoshikawa(2011/04/25) end
      *
      *      保険者不明の場合は住所から市町村を取得
             IF  RECE10-HKNJANUM  =  ZERO
               PERFORM  20011-CITYGET-SEC
             END-IF
      *=== 災害対応 by Yoshikawa(2011/04/08) end
           END-IF
      *=== 災害対応 by Yoshikawa(2011/03/24) end
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
      *      市か郡か(FLG-GYOSEI: 1=「市」 2=「郡」)
             IF  PTINF-HOME-ADRS(IDY1:2)  =  "郡"
      *        「郡」の後ろに「〜市」という文字が存在するかどうか
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
                                           TO  SKT1010TMP-ADRS
                   MOVE  100               TO  IDY2
                   DISPLAY  "SKT1000TMP-ADRS =" SKT1010TMP-ADRS
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
                                           TO  SKT1010TMP-ADRS
                   MOVE    100             TO  IDY2
                   DISPLAY  "SKT1010TMP-ADRS =" SKT1010TMP-ADRS
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
      *    医療保険・老人保健分集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    入外区分
           IF  RECE10-NYUGAIKBN  =  1
             MOVE  1  TO  IDX2
           ELSE
             MOVE  2  TO  IDX2
           END-IF
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             IF  RECE10-KYURATE  =  9
               MOVE  1    TO    IDX1
             ELSE
               MOVE  2    TO    IDX1
             END-IF
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用判定はレセプトと会わせる為
      *    請求管理情報の公費番号で判定する
      *       IF    RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
      *             RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
      *             RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
      *             RECE10-KOHNUM(4)  =  "145" OR "146" OR "143" 
      *          ADD   3  TO  IDX1
      *       END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
             PERFORM  2101-RJN-SYUKEI-SEC
           ELSE
      *    一般／退職者
      *---(01.00.07) LINE ADD START ------------------------------------
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060"  OR  "068"
      *---(01.00.07) LINE ADD END   ------------------------------------
      *    年齢チェック
               EVALUATE  TRUE
                 WHEN  RECE10-AGE  >=  70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) start
      *             IF  RECE10-KYURATE  =  9
      *               MOVE  1  TO  IDX1
      *             ELSE
      *               MOVE  2  TO  IDX1
      *             END-IF
                   EVALUATE  RECE10-KYURATE
                     WHEN  9
                       MOVE    1     TO    IDX1
                     WHEN  8
                       IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                           MOVE    1    TO    IDX1
                       ELSE
                           MOVE    2    TO    IDX1
                       END-IF
                     WHEN  7
                       MOVE    2     TO    IDX1
                   END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) end
                 WHEN  RECE10-AGE  >  2
      *---(01.00.08) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                     MOVE  5  TO  IDX1
                   ELSE
      *---(01.00.08) LINE ADD END   ------------------------------------
                     IF  RECE10-KYURATE  =  7
                       MOVE  3  TO  IDX1
                     ELSE
                       MOVE  4  TO  IDX1
                       MOVE  RECE10-KYURATE  TO  SKT1010TMP-KYURATE
                     END-IF
      *---(01.00.08) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
                 WHEN OTHER
                   MOVE  5  TO  IDX1
               END-EVALUATE
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用判定はレセプトと会わせる為
      *    請求管理情報の公費番号で判定する
      *         IF    RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143" 
      *           EVALUATE  IDX1
      *             WHEN  5       ADD   4  TO  IDX1
      *             WHEN  OTHER   ADD   5  TO  IDX1
      *           END-EVALUATE
      *         END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
               PERFORM  2102-IPA-SYUKEI-SEC
             ELSE
               IF  RECE10-HONKZKKBN  =  "1"
      *    年齢チェック
                 IF  RECE10-AGE  >=  70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) start
      *             IF  RECE10-KYURATE  =  9
      *               MOVE  2   TO  IDX1
      *             ELSE
      *               MOVE  3   TO  IDX1
      *             END-IF
                   EVALUATE  RECE10-KYURATE
                     WHEN  9
                       MOVE    2     TO    IDX1
                     WHEN  8
                       IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                           MOVE    2    TO    IDX1
                       ELSE
                           MOVE    3    TO    IDX1
                       END-IF
                     WHEN  7
                       MOVE    3     TO    IDX1
                   END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) end
                 ELSE
                   MOVE   1    TO  IDX1
                 END-IF
               ELSE
                 IF  RECE10-AGE >= 70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) start
      *             IF  RECE10-KYURATE  =  9
      *               MOVE  2   TO  IDX1
      *             ELSE
      *               MOVE  3   TO  IDX1
      *             END-IF
                   EVALUATE  RECE10-KYURATE
                     WHEN  9
                       MOVE    2     TO    IDX1
                     WHEN  8
                       IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                           MOVE    2    TO    IDX1
                       ELSE
                           MOVE    3    TO    IDX1
                       END-IF
                     WHEN  7
                       MOVE    3     TO    IDX1
                   END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) end
                 ELSE
      *---(01.00.08) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                     MOVE  5  TO  IDX1
                   ELSE
      *---(01.00.08) LINE ADD END   ------------------------------------
                     IF  RECE10-AGE  >  2
                       MOVE   4    TO  IDX1
                     ELSE
                       MOVE   5    TO  IDX1
                     END-IF
      *---(01.00.08) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
                 END-IF
               END-IF
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用判定はレセプトと会わせる為
      *    請求管理情報の公費番号で判定する
      *         IF    RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
      *               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143" 
      *           ADD   5  TO  IDX1
      *         END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
               PERFORM  2103-TAI-SYUKEI-SEC
             END-IF
           END-IF
      *
           IF  FLG-SKT1010TMP  =  1
               WRITE    SKT1010TMP-REC
           ELSE
               REWRITE  SKT1010TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・老人分集計処理
      *****************************************************************
       2101-RJN-SYUKEI-SEC         SECTION.
      *
      *    総件数
           ADD   1                   TO  SKT1010TMP-GRKENSU
      *
      *    療養の給付：件数
           ADD   1                   TO  SKT1010TMP-RKENSU (IDX1 IDX2)
      *
      *    療養の給付：診療実日数
           ADD   RECE10-JNISSU (1)   TO  SKT1010TMP-RNISSU (IDX1 IDX2)
      *
      *    療養の給付：点数
      ***** 05/08/31 DEL
      *     ADD   1000000 TO  SKT1010TMP-RTENSU (IDX1 IDX2)
      *****
           ADD   RECE10-TOTALTEN(1)  TO  SKT1010TMP-RTENSU (IDX1 IDX2)
      *
      *    療養の給付：一部負担金
      ***** 05/08/31 DEL
      *     ADD   1000000 TO  SKT1010TMP-RITBFTN(IDX1 IDX2)
      *****
           ADD   RECE10-FTNMONEY(1)  TO  SKT1010TMP-RITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU (1)  >  0
      *    食事療養：件数
             ADD   1                 TO  SKT1010TMP-S-RKENSU (IDX1)
      *---(01.00.04) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    食事療養：日数
           ADD   RECE10-SHOKUJINISSU (1)
                                     TO  SKT1010TMP-S-RNISSU (IDX1)
      *    食事療養：金額
           ADD   RECE10-SHOKUJIRYOYOHI (1)
                                     TO  SKT1010TMP-S-RKINGAKU(IDX1)
      ***** 05/08/31 DEL
      *     ADD   1000000 TO  SKT1010TMP-S-RKINGAKU(IDX1)
      *****
      *    食事療養：標準負担額
           ADD   RECE10-SHOKUJIFTN (1)
                                     TO  SKT1010TMP-S-RFTNGAKU(IDX1)
      ***** 05/08/31 DEL
      *     ADD   1000000 TO  SKT1010TMP-S-RFTNGAKU(IDX1)
      *****
      *---(01.00.03) LINE ADD START ------------------------------------
      *    公費併用か
      *       IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (2)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (3)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (4)(1:1)  =  "0"
      *         ADD   1             TO  SKT1010TMP-S-RKKENSU (IDX1)
      *       END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    公費併用か
           IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
               RECE10-KOHNUM (2)(1:1)  =  "0"  OR
               RECE10-KOHNUM (3)(1:1)  =  "0"  OR
               RECE10-KOHNUM (4)(1:1)  =  "0"
             ADD   1             TO  SKT1010TMP-RKKENSU (IDX1 IDX2)
           END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用か
           IF  RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143"
             ADD   1             TO  SKT1010TMP-RFKENSU (IDX1 IDX2)
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    療養の給付：一部負担金
      *     IF  RECE10-KOHNUM (1)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(2)  TO  SKT1010TMP-RITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (2)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(3)  TO  SKT1010TMP-RITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (3)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(4)  TO  SKT1010TMP-RITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (4)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(5)  TO  SKT1010TMP-RITBFTN(IDX1 IDX2)
      *     END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    1               TO  FLG-UPD
           .
       2101-RJN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・一般国保分集計処理
      *****************************************************************
       2102-IPA-SYUKEI-SEC         SECTION.
      *
      *    総件数
           ADD   1                   TO  SKT1010TMP-GKENSU
      *
      *    療養の給付：件数
           ADD   1                   TO  SKT1010TMP-KENSU (IDX1 IDX2)
      *
      *    療養の給付：診療実日数
           ADD   RECE10-JNISSU (1)   TO  SKT1010TMP-NISSU (IDX1 IDX2)
      *
      *    療養の給付：点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1010TMP-TENSU (IDX1 IDX2)
      *
      *    療養の給付：薬剤一部負担金
           ADD   RECE10-YKZFTN (1)   TO  SKT1010TMP-YKZFTN(IDX1 IDX2)
      *
      *    療養の給付：一部負担金
           ADD   RECE10-FTNMONEY(1)  TO  SKT1010TMP-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU (1)  >  0
      *    食事療養：件数
             ADD   1                 TO  SKT1010TMP-S-KENSU (IDX1)
      *---(01.00.04) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    食事療養：日数
           ADD   RECE10-SHOKUJINISSU (1)   
                                     TO  SKT1010TMP-S-NISSU (IDX1)
      *    食事療養：金額
           ADD   RECE10-SHOKUJIRYOYOHI (1)
                                     TO  SKT1010TMP-S-KINGAKU(IDX1)
      *    食事療養：標準負担額
           ADD   RECE10-SHOKUJIFTN (1)
                                     TO  SKT1010TMP-S-FTNGAKU(IDX1)
      *---(01.00.03) LINE ADD START ------------------------------------
      *    公費併用か
      *       IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (2)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (3)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (4)(1:1)  =  "0"
      *         ADD   1             TO  SKT1010TMP-S-KKENSU (IDX1)
      *       END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    公費併用か
           IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
               RECE10-KOHNUM (2)(1:1)  =  "0"  OR
               RECE10-KOHNUM (3)(1:1)  =  "0"  OR
               RECE10-KOHNUM (4)(1:1)  =  "0"
             ADD   1             TO  SKT1010TMP-KKENSU (IDX1 IDX2)
           END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用か
           IF  RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143"
             ADD   1             TO  SKT1010TMP-FKENSU (IDX1 IDX2)
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 一部負担金欄は保険の一部負担金を記載するよう修正 by Monma(2017/02/06) start
      **    療養の給付：一部負担金
      *     IF  RECE10-KOHNUM (1)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(2)  TO  SKT1010TMP-ITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (2)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(3)  TO  SKT1010TMP-ITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (3)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(4)  TO  SKT1010TMP-ITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (4)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(5)  TO  SKT1010TMP-ITBFTN(IDX1 IDX2)
      *     END-IF
      *=== 一部負担金欄は保険の一部負担金を記載するよう修正 by Monma(2017/02/06) end
      *
           MOVE    1               TO  FLG-UPD
           .
       2102-IPA-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・退職国保分集計処理
      *****************************************************************
       2103-TAI-SYUKEI-SEC         SECTION.
      *
      *    総件数
           ADD   1                   TO  SKT1010TMP-GTKENSU
      *
      *    療養の給付：件数
           ADD   1                   TO  SKT1010TMP-TKENSU (IDX1 IDX2)
      *
      *    療養の給付：診療実日数
           ADD   RECE10-JNISSU (1)   TO  SKT1010TMP-TNISSU (IDX1 IDX2)
      *
      *    療養の給付：点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1010TMP-TTENSU (IDX1 IDX2)
      *
      *    療養の給付：薬剤一部負担金
           ADD   RECE10-YKZFTN (1)   TO  SKT1010TMP-TYKZFTN(IDX1 IDX2)
      *
      *    療養の給付：一部負担金
           ADD   RECE10-FTNMONEY(1)  TO  SKT1010TMP-TITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU (1)  >  0
      *    食事療養：件数
             ADD   1                 TO  SKT1010TMP-S-TKENSU (IDX1)
      *---(01.00.04) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    食事療養：日数
           ADD   RECE10-SHOKUJINISSU (1)   
                                     TO  SKT1010TMP-S-TNISSU (IDX1)
      *    食事療養：金額
           ADD   RECE10-SHOKUJIRYOYOHI (1)
                                     TO  SKT1010TMP-S-TKINGAKU(IDX1)
      *    食事療養：標準負担額
           ADD   RECE10-SHOKUJIFTN (1)
                                     TO  SKT1010TMP-S-TFTNGAKU(IDX1)
      *---(01.00.03) LINE ADD START ------------------------------------
      *    公費併用か
      *       IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (2)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (3)(1:1)  =  "0"  OR
      *           RECE10-KOHNUM (4)(1:1)  =  "0"
      *         ADD   1             TO  SKT1010TMP-S-TKKENSU (IDX1)
      *       END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    公費併用か
           IF  RECE10-KOHNUM (1)(1:1)  =  "0"  OR
               RECE10-KOHNUM (2)(1:1)  =  "0"  OR
               RECE10-KOHNUM (3)(1:1)  =  "0"  OR
               RECE10-KOHNUM (4)(1:1)  =  "0"
             ADD   1             TO  SKT1010TMP-TKKENSU (IDX1 IDX2)
           END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *    福祉併用か
           IF  RECE10-KOHNUM(1)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(2)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(3)  =  "145" OR "146" OR "143" OR
               RECE10-KOHNUM(4)  =  "145" OR "146" OR "143"
             ADD   1             TO  SKT1010TMP-TFKENSU (IDX1 IDX2)
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 一部負担金欄は保険の一部負担金を記載するよう修正 by Monma(2017/02/06) start
      **    療養の給付：一部負担金
      *     IF  RECE10-KOHNUM (1)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(2)  TO  SKT1010TMP-TITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (2)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(3)  TO  SKT1010TMP-TITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (3)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(4)  TO  SKT1010TMP-TITBFTN(IDX1 IDX2)
      *     END-IF
      *     IF  RECE10-KOHNUM (4)  NOT =  SPACE
      *       ADD  RECE10-FTNMONEY(5)  TO  SKT1010TMP-TITBFTN(IDX1 IDX2)
      *     END-IF
      *=== 一部負担金欄は保険の一部負担金を記載するよう修正 by Monma(2017/02/06) end
      *
           MOVE    1               TO  FLG-UPD
      *
           .
       2103-TAI-SYUKEI-EXT.
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
           OPEN     INPUT       SKT1010TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           MOVE     1           TO       WRK-CNT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *    一般
             IF  SKT1010TMP-GKENSU  >  0
      *    帳票編集<見出し>処理
               PERFORM 311-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 331-PRINT-OUT-SEC
             END-IF
      *
      *    退職者
             IF  SKT1010TMP-GTKENSU  >  0
      *    帳票編集<見出し>処理
               PERFORM 312-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 322-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 332-PRINT-OUT-SEC
             END-IF
      *
      *    老人
             IF  SKT1010TMP-GRKENSU  >  0
      *    帳票編集<見出し>処理
               PERFORM 313-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 323-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 333-PRINT-OUT-SEC
             END-IF
      *
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT1010TMP-FILE
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（一般）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1010
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1010-SRYYM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1010-HOSPCD
      *
      *    保険者名
      *=== 災害対応 by Yoshikawa(2011/04/08) start
             IF  SKT1010TMP-GENMEN  NOT =  SPACE
             AND SKT1010TMP-ADRS  NOT =  SPACE
               MOVE    SKT1010TMP-ADRS   TO  SKT1010-HKNJANAME
             ELSE
      *=== 災害対応 by Yoshikawa(2011/04/08) end
               PERFORM  920-HKNJAINF-SET-SEC
               INITIALIZE    WRK-HKNJANAME
               IF     SKT1010TMP-PREFKBN     =   "2"
                 PERFORM  400-KENNAME-SEC
               ELSE 
                 STRING   HKNJA-HKNJANAME     DELIMITED BY SPACE
                          "  様"              DELIMITED BY SIZE
                          INTO                WRK-HKNJANAME
                 END-STRING
               END-IF
               MOVE    WRK-HKNJANAME        TO  SKT1010-HKNJANAME
      *=== 災害対応 by Yoshikawa(2011/04/08) start
             END-IF
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
      *    保険者番号
           MOVE    SKT1010TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1010-HKNJANUM
      *
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT1010-SEIYMD
      *
      *    在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) start
      *     IF  SKT1010TMP-ZAITAKU  =  1
      **---(01.00.03) LINE ADD START ------------------------------------
      **       MOVE  "在"                  TO  SKT1010-ZAI1
      **       MOVE  "○"                  TO  SKT1010-ZAI2
      *       MOVE  "在"                  TO  SKT1010-ZAI
      **---(01.00.03) LINE ADD END   ------------------------------------
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) end
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1010-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1010-HOSPNAME
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1010-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1010-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1010-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1010-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1010-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1010-TEL
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT1010-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT1010-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    給付割合
           IF  SKT1010TMP-KYURATE  NOT =  ZERO
             EVALUATE SKT1010TMP-KYURATE
             WHEN 7
                 MOVE  "七"                TO  SKT1010-KYURATE
             WHEN 8
                 MOVE  "八"                TO  SKT1010-KYURATE
             WHEN 9
                 MOVE  "九"                TO  SKT1010-KYURATE
             WHEN OTHER
                 MOVE  SKT1010TMP-KYURATE  TO  WRK-Z2
                 MOVE  WRK-Z2              TO  SKT1010-KYURATE
             END-EVALUATE
           END-IF
      *
      *    ページ番号
           MOVE    CNT-PAGE                TO  WRK-Z4
           MOVE    WRK-Z4                  TO  SKT1010-NO
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"            TO  SKT1010-TOKUBETU
           END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（一般）
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *
      *    編集処理
           PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.03) LINE ADD START ------------------------------------
      *              UNTIL    IDX1  >     9
                    UNTIL    IDX1  >     5
      *---(01.00.03) LINE ADD END   ------------------------------------
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT1010TMP-KENSU (IDX1 IDX2)   TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1010-KENSU(IDX1 IDX2)
      *
      *    療養の給付：公費件数
               MOVE  SKT1010TMP-KKENSU (IDX1 IDX2)  TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1010-KKENSU(IDX1 IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    療養の給付：福祉件数
               MOVE  SKT1010TMP-FKENSU (IDX1 IDX2)  TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1010-FKENSU(IDX1 IDX2)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    療養の給付：日数
               MOVE  SKT1010TMP-NISSU (IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1010-NISSU(IDX1 IDX2)
      *
      *    療養の給付：点数
               MOVE  SKT1010TMP-TENSU (IDX1 IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1010-TENSU(IDX1 IDX2)
      *
      *    療養の給付：一部負担金
      *---(01.00.05) LINE ADD START ------------------------------------
      *          IF  IDX1 = 1 OR 2 OR 6 OR 7
      *---(01.00.05) LINE ADD END   ------------------------------------
                   MOVE  SKT1010TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z9
                   MOVE  WRK-Z9   TO  SKT1010-ITBFTN(IDX1 IDX2)
      *---(01.00.05) LINE ADD START ------------------------------------
      *          END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
             END-PERFORM
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    食事療養：件数（公費用）
      *       MOVE  SKT1010TMP-S-KKENSU (IDX1)       TO  WRK-Z3
      *       MOVE  WRK-Z3   TO  SKT1010-S-KKENSU(IDX1)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    食事療養：件数
             MOVE  SKT1010TMP-S-KENSU (IDX1)        TO  WRK-Z3
             MOVE  WRK-Z3   TO  SKT1010-S-KENSU(IDX1)
      *
      *    食事療養：日数
             MOVE  SKT1010TMP-S-NISSU (IDX1)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1010-S-NISSU(IDX1)
      *
      *    食事療養：金額
             MOVE  SKT1010TMP-S-KINGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1010-S-KINGAKU(IDX1)
      *
      *    食事療養：標準負担額
             MOVE  SKT1010TMP-S-FTNGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1010-S-FTNGAKU(IDX1)
           END-PERFORM
      *
           .
       321-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（一般）
      *****************************************************************
       331-PRINT-OUT-SEC                SECTION.
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
           MOVE    "SKT1010.red"       TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) start
      *     MOVE    "国保請求書"        TO  SPRT-TITLE
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) end
           MOVE    SKT1010             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       331-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（退職）
      *****************************************************************
       312-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1020
      *
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1020-SRYYM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1020-HOSPCD
      *
      *    保険者名
      *=== 災害対応 by Yoshikawa(2011/04/08) start
             IF  SKT1010TMP-GENMEN  NOT =  SPACE
             AND SKT1010TMP-ADRS  NOT =  SPACE
               MOVE    SKT1010TMP-ADRS   TO  SKT1020-HKNJANAME
             ELSE
      *=== 災害対応 by Yoshikawa(2011/04/08) end
             PERFORM  920-HKNJAINF-SET-SEC
             INITIALIZE    WRK-HKNJANAME
             IF     SKT1010TMP-PREFKBN     =   "2"
               PERFORM  400-KENNAME-SEC
             ELSE
               STRING   HKNJA-HKNJANAME     DELIMITED BY SPACE
                        "  様"              DELIMITED BY SIZE
                        INTO                WRK-HKNJANAME
               END-STRING
             END-IF
             MOVE    WRK-HKNJANAME        TO  SKT1020-HKNJANAME
      *=== 災害対応 by Yoshikawa(2011/04/08) start
           END-IF
      *=== 災害対応 by Yoshikawa(2011/04/08) end
      *
      *    保険者番号
           MOVE    SKT1010TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO SKT1020-HKNJANUM
      *
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT1020-SEIYMD
      *
      *    在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) start
      *     IF  SKT1010TMP-ZAITAKU  =  1
      **---(01.00.03) LINE ADD START ------------------------------------
      **       MOVE  "在"                  TO  SKT1020-ZAI1
      **       MOVE  "○"                  TO  SKT1020-ZAI2
      *       MOVE  "在"                  TO  SKT1020-ZAI
      **---(01.00.03) LINE ADD END   ------------------------------------
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) end
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1020-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1020-HOSPNAME
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1020-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1020-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1020-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1020-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1020-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1020-TEL
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT1020-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT1020-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    ページ番号
           MOVE    CNT-PAGE                TO  WRK-Z4
           MOVE    WRK-Z4                  TO  SKT1020-NO
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1020-TOKUBETU
           END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       312-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（退職）
      *****************************************************************
       322-BODY-HEN-SEC      SECTION.
      *
      *    編集処理
           PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.03) LINE ADD START ------------------------------------
      *              UNTIL    IDX1  >     10
                    UNTIL    IDX1  >     5
      *---(01.00.03) LINE ADD END   ------------------------------------
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *
      *    療養の給付：件数
               MOVE  SKT1010TMP-TKENSU (IDX1 IDX2)   TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1020-KENSU(IDX1 IDX2)
      *
      *    療養の給付：公費件数
               MOVE  SKT1010TMP-TKKENSU (IDX1 IDX2)  TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1020-KKENSU(IDX1 IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    療養の給付：福祉件数
               MOVE  SKT1010TMP-TFKENSU (IDX1 IDX2)  TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1020-FKENSU(IDX1 IDX2)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    療養の給付：日数
               MOVE  SKT1010TMP-TNISSU (IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1020-NISSU(IDX1 IDX2)
      *
      *    療養の給付：点数
               MOVE  SKT1010TMP-TTENSU (IDX1 IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1020-TENSU(IDX1 IDX2)
      *
      *    療養の給付：一部負担金
      *---(01.00.05) LINE ADD START ------------------------------------
      *         IF  IDX1  =  2  OR  3  OR  7  OR  8
      *---(01.00.05) LINE ADD END   ------------------------------------
                 MOVE  SKT1010TMP-TITBFTN (IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT1020-ITBFTN(IDX1 IDX2)
      *---(01.00.05) LINE ADD START ------------------------------------
      *         END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
             END-PERFORM
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    食事療養：件数（公費用）
      *       MOVE  SKT1010TMP-S-TKKENSU (IDX1)       TO  WRK-Z3
      *       MOVE  WRK-Z3   TO  SKT1020-S-KKENSU(IDX1)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    食事療養：件数
             MOVE  SKT1010TMP-S-TKENSU (IDX1)        TO  WRK-Z3
             MOVE  WRK-Z3   TO  SKT1020-S-KENSU(IDX1)
      *
      *    食事療養：日数
             MOVE  SKT1010TMP-S-TNISSU (IDX1)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1020-S-NISSU(IDX1)
      *
      *    食事療養：金額
             MOVE  SKT1010TMP-S-TKINGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1020-S-KINGAKU(IDX1)
      *
      *    食事療養：標準負担額
             MOVE  SKT1010TMP-S-TFTNGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1020-S-FTNGAKU(IDX1)
           END-PERFORM
      *
           .
       322-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（退職）
      *****************************************************************
       332-PRINT-OUT-SEC                SECTION.
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
           MOVE    "SKT1020.red"       TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) start
      *     MOVE    "国保請求書"        TO  SPRT-TITLE
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) end
           MOVE    SKT1020             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       332-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（老人）
      *****************************************************************
       313-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1030
      *
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1030-SRYYM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1030-HOSPCD
      *
      *    保険者名
           PERFORM  920-HKNJAINF-SET-SEC
           INITIALIZE    WRK-HKNJANAME
           IF     SKT1010TMP-PREFKBN     =   "2"
             PERFORM  400-KENNAME-SEC
           ELSE
             STRING   HKNJA-HKNJANAME     DELIMITED BY SPACE
                      "  様"              DELIMITED BY SIZE
                      INTO                WRK-HKNJANAME
             END-STRING
           END-IF
           MOVE    WRK-HKNJANAME        TO  SKT1030-HKNJANAME
      *
      *    保険者番号
           MOVE    SKT1010TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1030-HKNJANUM
      *
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT1030-SEIYMD
      *
      *    在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) start
      *     IF  SKT1010TMP-ZAITAKU  =  1
      **---(01.00.03) LINE ADD START ------------------------------------
      **       MOVE  "在"                  TO  SKT1030-ZAI1
      **       MOVE  "○"                  TO  SKT1030-ZAI2
      *       MOVE  "在"                  TO  SKT1030-ZAI
      **---(01.00.03) LINE ADD END   ------------------------------------
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/04/27) end
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1030-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1030-HOSPNAME
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1030-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1030-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1030-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1030-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1030-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1030-TEL
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT1030-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT1030-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    ページ番号
           MOVE    CNT-PAGE                TO  WRK-Z4
           MOVE    WRK-Z4                  TO  SKT1030-NO
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1030-TOKUBETU
           END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       313-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（老人）
      *****************************************************************
       323-BODY-HEN-SEC      SECTION.
      *
      ***** 05/08/16 DEL
      **    編集処理
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >     6
      *       PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                UNTIL    IDX2  >     2
      **
      **    療養の給付：件数（公費用）
      *         MOVE  SKT1010TMP-RKKENSU (IDX1 IDX2)  TO  WRK-Z3
      *         MOVE  WRK-Z3   TO  SKT1030-KKENSU(IDX1 IDX2)
      **
      **    療養の給付：件数
      *         MOVE  SKT1010TMP-RKENSU (IDX1 IDX2)   TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT1030-KENSU(IDX1 IDX2)
      **
      **    療養の給付：日数
      *         MOVE  SKT1010TMP-RNISSU (IDX1 IDX2)   TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT1030-NISSU(IDX1 IDX2)
      **
      **    療養の給付：点数
      *         MOVE  SKT1010TMP-RTENSU (IDX1 IDX2)   TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT1030-TENSU(IDX1 IDX2)
      **
      **    療養の給付：一部負担金
      *         MOVE  SKT1010TMP-RITBFTN (IDX1 IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT1030-ITBFTN(IDX1 IDX2)
      *       END-PERFORM
      **
      **    食事療養：件数（公費用）
      *       MOVE  SKT1010TMP-S-RKKENSU (IDX1)       TO  WRK-Z3
      *       MOVE  WRK-Z3   TO  SKT1030-S-KKENSU(IDX1)
      **
      **    食事療養：件数
      *       MOVE  SKT1010TMP-S-RKENSU (IDX1)        TO  WRK-Z5
      *       MOVE  WRK-Z5   TO  SKT1030-S-KENSU(IDX1)
      **
      **    食事療養：日数
      *       MOVE  SKT1010TMP-S-RNISSU (IDX1)        TO  WRK-Z5
      *       MOVE  WRK-Z5   TO  SKT1030-S-NISSU(IDX1)
      **
      **    食事療養：金額
      *       MOVE  SKT1010TMP-S-RKINGAKU (IDX1)      TO  WRK-Z7
      *       MOVE  WRK-Z7   TO  SKT1030-S-KINGAKU(IDX1)
      **
      **    食事療養：標準負担額
      *       MOVE  SKT1010TMP-S-RFTNGAKU (IDX1)      TO  WRK-Z7
      *       MOVE  WRK-Z7   TO  SKT1030-S-FTNGAKU(IDX1)
      *     END-PERFORM
      ***** 05/08/16 INS
      *    編集処理
           PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.03) LINE ADD START ------------------------------------
      *              UNTIL    IDX1  >     6
                    UNTIL    IDX1  >     3
      *---(01.00.03) LINE ADD END   ------------------------------------
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *
      *    療養の給付：件数
               MOVE  SKT1010TMP-RKENSU (IDX1 IDX2)   TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1030-KENSU(IDX1 IDX2)
      *
      *    療養の給付：公費件数
               MOVE  SKT1010TMP-RKKENSU (IDX1 IDX2)  TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1030-KKENSU(IDX1 IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    療養の給付：福祉件数
               MOVE  SKT1010TMP-RFKENSU (IDX1 IDX2)  TO  WRK-Z3
               MOVE  WRK-Z3   TO  SKT1030-FKENSU(IDX1 IDX2)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    療養の給付：日数
               MOVE  SKT1010TMP-RNISSU (IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1030-NISSU(IDX1 IDX2)
      *
      *    療養の給付：点数
               MOVE  SKT1010TMP-RTENSU (IDX1 IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1030-TENSU(IDX1 IDX2)
      *
      *    療養の給付：一部負担金
               MOVE  SKT1010TMP-RITBFTN (IDX1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1030-ITBFTN(IDX1 IDX2)
             END-PERFORM
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    食事療養：件数（公費用）
      *       MOVE  SKT1010TMP-S-RKKENSU (IDX1)       TO  WRK-Z3
      *       MOVE  WRK-Z3   TO  SKT1030-S-KKENSU(IDX1)
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    食事療養：件数
             MOVE  SKT1010TMP-S-RKENSU (IDX1)        TO  WRK-Z3
             MOVE  WRK-Z3   TO  SKT1030-S-KENSU(IDX1)
      *
      *    食事療養：日数
             MOVE  SKT1010TMP-S-RNISSU (IDX1)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1030-S-NISSU(IDX1)
      *
      *    食事療養：金額
             MOVE  SKT1010TMP-S-RKINGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1030-S-KINGAKU(IDX1)
      *
      *    食事療養：標準負担額
             MOVE  SKT1010TMP-S-RFTNGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1030-S-FTNGAKU(IDX1)
           END-PERFORM
      *
           .
       323-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（老人）
      *****************************************************************
       333-PRINT-OUT-SEC                SECTION.
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
           MOVE    "SKT1030.red"       TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) start
      *     MOVE    "国保請求書"        TO  SPRT-TITLE
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) end
           MOVE    SKT1030             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2018/02/08) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       333-PRINT-OUT-EXT.
           EXIT.
057400*
      *****************************************************************
      *    県名設定処理
      *****************************************************************
       400-KENNAME-SEC                SECTION.
      *
           MOVE     SPACE         TO    WRK-HKNJANAME
                                        WRK-KENNAME
           EVALUATE  SKT1010TMP-HKNJANUM(1:2)
           WHEN  "01"  MOVE  "北海道"    TO  WRK-KENNAME
           WHEN  "02"  MOVE  "青森県"    TO  WRK-KENNAME
           WHEN  "03"  MOVE  "岩手県"    TO  WRK-KENNAME
           WHEN  "04"  MOVE  "宮城県"    TO  WRK-KENNAME
           WHEN  "05"  MOVE  "秋田県"    TO  WRK-KENNAME
           WHEN  "06"  MOVE  "山形県"    TO  WRK-KENNAME
           WHEN  "07"  MOVE  "福島県"    TO  WRK-KENNAME
           WHEN  "08"  MOVE  "茨城県"    TO  WRK-KENNAME
           WHEN  "09"  MOVE  "栃木県"    TO  WRK-KENNAME
           WHEN  "11"  MOVE  "埼玉県"    TO  WRK-KENNAME
           WHEN  "12"  MOVE  "千葉県"    TO  WRK-KENNAME
           WHEN  "13"  MOVE  "東京都"    TO  WRK-KENNAME
           WHEN  "14"  MOVE  "神奈川県"  TO  WRK-KENNAME
           WHEN  "15"  MOVE  "新潟県"    TO  WRK-KENNAME
           WHEN  "16"  MOVE  "富山県"    TO  WRK-KENNAME
           WHEN  "17"  MOVE  "石川県"    TO  WRK-KENNAME
           WHEN  "18"  MOVE  "福井県"    TO  WRK-KENNAME
           WHEN  "19"  MOVE  "山梨県"    TO  WRK-KENNAME
           WHEN  "20"  MOVE  "長野県"    TO  WRK-KENNAME
           WHEN  "21"  MOVE  "岐阜県"    TO  WRK-KENNAME
           WHEN  "22"  MOVE  "静岡県"    TO  WRK-KENNAME
           WHEN  "24"  MOVE  "三重県"    TO  WRK-KENNAME
           WHEN  "25"  MOVE  "滋賀県"    TO  WRK-KENNAME
           WHEN  "26"  MOVE  "京都府"    TO  WRK-KENNAME
           WHEN  "27"  MOVE  "大阪府"    TO  WRK-KENNAME
           WHEN  "28"  MOVE  "兵庫県"    TO  WRK-KENNAME
           WHEN  "29"  MOVE  "奈良県"    TO  WRK-KENNAME
           WHEN  "30"  MOVE  "和歌山県"  TO  WRK-KENNAME
           WHEN  "31"  MOVE  "鳥取県"    TO  WRK-KENNAME
           WHEN  "32"  MOVE  "島根県"    TO  WRK-KENNAME
           WHEN  "33"  MOVE  "岡山県"    TO  WRK-KENNAME
           WHEN  "34"  MOVE  "広島県"    TO  WRK-KENNAME
           WHEN  "35"  MOVE  "山口県"    TO  WRK-KENNAME
           WHEN  "36"  MOVE  "徳島県"    TO  WRK-KENNAME
           WHEN  "37"  MOVE  "香川県"    TO  WRK-KENNAME
           WHEN  "38"  MOVE  "愛媛県"    TO  WRK-KENNAME
           WHEN  "39"  MOVE  "高知県"    TO  WRK-KENNAME
           WHEN  "40"  MOVE  "福岡県"    TO  WRK-KENNAME
           WHEN  "41"  MOVE  "佐賀県"    TO  WRK-KENNAME
           WHEN  "42"  MOVE  "長崎県"    TO  WRK-KENNAME
           WHEN  "43"  MOVE  "熊本県"    TO  WRK-KENNAME
           WHEN  "44"  MOVE  "大分県"    TO  WRK-KENNAME
           WHEN  "45"  MOVE  "宮崎県"    TO  WRK-KENNAME
           WHEN  "46"  MOVE  "鹿児島県"  TO  WRK-KENNAME
           WHEN  "47"  MOVE  "沖縄県"    TO  WRK-KENNAME
           END-EVALUATE
      *
      *    国保組合は県名を印字しない
           IF     SKT1010TMP-HKNJANUM(3:1)  =  "3"
             MOVE  SPACE                 TO  WRK-KENNAME
           END-IF
      *
           STRING  WRK-KENNAME       DELIMITED BY SPACE
                   HKNJA-HKNJANAME   DELIMITED BY SPACE
                   "  様"            DELIMITED BY SIZE
                   INTO              WRK-HKNJANAME
           END-STRING
      *
           .
       400-KENNAME-EXT.
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
      *---(01.00.06) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY    TO  MCP-PATH
      *             CALL    "MCPSUB"             USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU1010 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU1010 SEIKYU INVALID ***"
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
      *   保険組合せ情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE  RECE10-HOSPID               TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKNJA-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE  SKT1010TMP-HKNJANUM         TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.06) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
             MOVE    "tbl_hknjainf"     TO  MCP-TABLE
             MOVE    "key"              TO  MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
           ELSE
             DISPLAY  "HKNCOBMI SELECT ERR" 
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       920-HKNJAINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険組合せ情報読込
      *****************************************************************
       925-HKNJAINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
           ELSE
             INITIALIZE  HKNJAINF-REC
             MOVE  1            TO  FLG-HKNJAINF
           END-IF
      *
           .
       925-HKNJAINF-READ-EXT.
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM          TO  RECE10-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
             MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                          RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
           IF  WRK-PARA-TOKUBETU  =  2
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *       MOVE    "000000"          TO  RECE10-SRYYM
      *       MOVE    "999999"          TO  RECE10-XXSRYYM
             MOVE    000000            TO  RECE10-SRYYM
             MOVE    999999            TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
           END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
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
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
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
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
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
      *---(01.00.06) LINE ADD END   ------------------------------------
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
           READ    SKT1010TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1010TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1010TMP
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
      *---(01.00.06) LINE ADD START ------------------------------------
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
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
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
      *---(01.00.06) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY          TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
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
      *---(01.00.06) LINE ADD END   ------------------------------------
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
           READ  SKT1010TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
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
      *---(01.00.06) LINE ADD START ------------------------------------
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
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) start
      *****************************************************************
      *    プログラムオプション情報読込
      *****************************************************************
       900-PRGOPTION-READ-SEC  SECTION.
      *
           INITIALIZE                      PRGOPTION-REC
           MOVE    SPA-HOSPNUM         TO  PRGOPTION-HOSPNUM
           MOVE    WRK-PRGID           TO  PRGOPTION-PRGID
           MOVE    WRK-KBNCD           TO  PRGOPTION-KBNCD
           MOVE    PRGOPTION-REC       TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_prgoption"     TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
               MOVE    "tbl_prgoption"     TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC         TO  PRGOPTION-REC
                   MOVE    ZERO                TO  FLG-PRGOPTION
               ELSE
                   INITIALIZE                      PRGOPTION-REC
                   MOVE    1                   TO  FLG-PRGOPTION
               END-IF
           ELSE
               MOVE    1                   TO  FLG-PRGOPTION
           END-IF
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
           MOVE    "tbl_prgoption"     TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *
           .
       900-PRGOPTION-READ-EXT.
           EXIT.
      *=== プログラムオプション対応 by Yoshikawa(2013/07/09) end
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           .                             
       900-DBCLOSE-EXT.
           EXIT.
