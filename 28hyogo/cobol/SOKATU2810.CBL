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
       PROGRAM-ID.             SOKATU2810.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・診療報酬集計書
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/17    山口        ORCAのバージョンアップ(2.5.0)による再作成
      *                          (返戻対応、dia→Monpe、
      *                           Open cobolのバージョンアップ対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    有村    05/08/16    一部負担金集計方法修正
      *  01.00.02    内田    06/10/31    老人・前期高齢の割合判定の修正
      *  01.00.03    内田    06/11/17    食事がない場合でも生活療養費を印字
      *  01.00.04    内田    07/09/02    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.05    内田    08/04/22    帳票様式の変更に伴う修正
      *                                  SPA-AREA初期化
      *  01.00.06    内田    09/09/29    平成21年台風第9号対応（対象者別集計）
      *  01.00.07    吉川    10/04/06    オンライン返戻対応
      *  01.00.08    吉川    10/07/06    返戻分は1枚にまとめる
      *  01.00.09    吉川    10/11/02    特別療養費国保対応
      *  01.00.10    吉川    10/11/24    open-cobol1.0対応
      *  01.00.11    吉川    13/01/11    プラグイン対応
      *                                  医療機関情報編集対応
      *  01.00.12    吉川    13/06/17    プログラムオプション対応
      *  01.00.13    吉川    13/09/03    優先保険者番号を設定した場合
      *                                  最初に印字するように修正
      *  01.00.14    吉川    14/10/24    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.15    吉川    14/11/12    返戻時、再印刷画面のタイトル修正
      *  01.00.16    門間    17/04/13    医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.17    萩野    18/03/01    医療機関編集情報への開設者名追加対応
      *                                  SITEKBN変更（動作に変更なし）
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル
           SELECT  SKT2810TMP-FILE ASSIGN    SKT2810TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT2810TMP-KEY
                                   FILE    STATUS  IS  STS-SKT2810.
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
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル
       FD  SKT2810TMP-FILE.
           COPY    "CPSKT2810TMP.INC".
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
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT2810TP//.
      *
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.04) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *---(01.00.04) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT2810.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT2810         PIC X(02).
           03  STS-SKT0111         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT2810TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-HKNCOMBI        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
           03  IDX                 PIC 9(05).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.04) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.04) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      **=== プラグイン対応 by Yoshikawa(2013/01/11) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU2810".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **=== プラグイン対応 by Yoshikawa(2013/01/11) end
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/01/11) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/01/11) end
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT               PIC  9(02).
           03  WRK-PAYKBN            PIC  9(03).
           03  WRK-RATE              PIC  9(03).
           03  WRK-HKNJANUM          PIC  X(06).
           03  WRK-POST-TBL.
               05  WRK-POSTG         PIC  X(02).
               05  WRK-POST1         PIC  X(03).
               05  WRK-POST2         PIC  X(01).
               05  WRK-POST3         PIC  X(04).
      *
           03  WRK-Z1              PIC Z.
           03  WRK-Z2              PIC ZZ.
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
      *
           03  WRK-MAE-INPUT       PIC X(200).
           03  WRK-OUT-INPUT       PIC X(200).
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
           03  WRK-PATH2           PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
           03  WRK-YUSEN           PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) end
      *     
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
           03  CNT-KOH             PIC 9(02).
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.04) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *　　保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *　　保険組合せ情報
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) end
      *
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
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
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
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
      *---(01.00.05) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
      *---(01.00.04) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU2810"    TO  JOB-PGID
           MOVE    "兵庫国保請求書"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
           MOVE    "SKT2810"         TO  SKT2810TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT2810TP-TERMID
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT2810TP-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
           MOVE  SKT2810TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT2810TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
      *     PERFORM  110-INI-FILE-SEC
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      **---(01.00.04) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.04) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.04) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.04) LINE ADD END   ------------------------------------
      *     END-EVALUATE
           EVALUATE    WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
               WHEN   "2"               ALSO  "1"
                   MOVE    "key37"        TO  WRK-PATH
                   MOVE    "key65"        TO  WRK-PATH2
               WHEN   "1"               ALSO  "1"
                   MOVE    "key38"        TO  WRK-PATH
                   MOVE    "key66"        TO  WRK-PATH2
               WHEN   "2"               ALSO  "2"
                   MOVE    "key39"        TO  WRK-PATH
                   MOVE    "key65"        TO  WRK-PATH2
               WHEN   "1"               ALSO  "2"
                   MOVE    "key40"        TO  WRK-PATH
                   MOVE    "key66"        TO  WRK-PATH2
           END-EVALUATE
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
      *
           OPEN    OUTPUT  UPD-FILE
      *
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/01/11) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/01/11) end
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
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SOKATU2810"              TO  WRK-PRGID
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
                         OR   (IDX1  >  100)
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
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           DISPLAY  "200-MAIN-SEC START"
      *
           OPEN     OUTPUT  SKT2810TMP-FILE
           CLOSE            SKT2810TMP-FILE
           OPEN     I-O     SKT2810TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT2810TMP-FILE
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
           DISPLAY "*** SOKATU2810 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU2810 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------

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
           INITIALIZE       SKT2810TMP-REC
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  WRK-HKNJANUM
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  WRK-HKNJANUM
           END-IF
      *
      *    神戸市の場合、代表番号セット
           IF  WRK-HKNJANUM (1:3) = "284"
             MOVE  "284000"  TO  WRK-HKNJANUM
           END-IF
      *
           MOVE  WRK-HKNJANUM  TO  SKT2810TMP-HKNJANUM
      *
      *    診療年月別(KEY設定)
      *    返戻分は実際の診療年月を設定
      *=== 返戻分は1枚にまとめる by Yoshikawa(2010/07/06) start
      *      IF  WRK-PARA-SYOKBN  =  "2"
      *        MOVE    RECE10-SRYYM          TO   SKT2810TMP-SRYYM
      *        DISPLAY  "返戻分・診療年月  "  SKT2810TMP-SRYYM
      *    当月分・月遅れ分は画面入力された診療年月を設定
      *      ELSE
              MOVE    LNK-PRTKANRI-SRYYM    TO   SKT2810TMP-SRYYM
      *        DISPLAY  "当月、月後れ分・診療年月  "  SKT2810TMP-SRYYM
      *      END-IF
      *=== 返戻分は1枚にまとめる by Yoshikawa(2010/07/06) end
      *
      *    在宅(同じ保険者の場合、在宅の方が最初に印刷される様変更)
            IF     RECE10-ZAITAKU    =    "1"
              MOVE     "1"           TO   SKT2810TMP-ZAITAKU
            ELSE
              MOVE     "2"           TO   SKT2810TMP-ZAITAKU
            END-IF
      *
      *    出力順
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
      *     IF  YUSEN-HKNJANUM        =    SKT2810TMP-HKNJANUM
           IF  WRK-YUSEN             =    SKT2810TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
      *=== 優先保険者番号の設定修正 by Yoshikawa(2013/09/03) start
      *       MOVE       "9"            TO   SKT2810TMP-SYUTURYOKU
             MOVE       "1"            TO   SKT2810TMP-SYUTURYOKU
      *=== 優先保険者番号の設定修正 by Yoshikawa(2013/09/03) end
           ELSE
             IF     RECE10-PREFKBN   =    "1"
      *=== 優先保険者番号の設定修正 by Yoshikawa(2013/09/03) start
      *         MOVE     "1"            TO   SKT2810TMP-SYUTURYOKU
               MOVE     "2"            TO   SKT2810TMP-SYUTURYOKU
      *=== 優先保険者番号の設定修正 by Yoshikawa(2013/09/03) end
             ELSE
      *=== 優先保険者番号の設定修正 by Yoshikawa(2013/09/03) start
      *         MOVE     "2"            TO   SKT2810TMP-SYUTURYOKU
               MOVE     "3"            TO   SKT2810TMP-SYUTURYOKU
      *=== 優先保険者番号の設定修正 by Yoshikawa(2013/09/03) end
             END-IF
           END-IF
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    平成21年台風第9号の対象者は別帳票
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  RECE10-ETC-YKZFTN (1)    TO  SKT2810TMP-GENMEN
           END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           PERFORM  800-SKTTMP-READ-SEC
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
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    入院／外来
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1  TO  IDX2
           ELSE
             MOVE  2  TO  IDX2
           END-IF
      *
      *    老人かどうか
           IF  RECE10-RJNHKNNUM  NOT =  SPACE
      *---(01.00.02) LINE ADD START ------------------------------------
      *          IF  RECE10-KYURATE  =  8
      *              MOVE  11  TO  IDX1
      *           ELSE
      *              MOVE  10  TO  IDX1
      *          END-IF
                IF  RECE10-KYURATE  =  9
                    MOVE  10  TO  IDX1
                 ELSE
                    MOVE  11  TO  IDX1
                END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
      *     公費  ０１９ ０５１ ０９１のチェック
                PERFORM   2201-HENSYU-SEC 
                          VARYING   IDX3   FROM   1  BY  1
                          UNTIL     IDX3   >   4
           ELSE
      *    一般か退職者か
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
      *    年齢チェック
      *---(01.00.05) LINE ADD START ------------------------------------
      *         EVALUATE  TRUE
      *           WHEN  RECE10-AGE  >=  70
      **---(01.00.02) LINE ADD START ------------------------------------
      **             IF  RECE10-KYURATE  =  8
      **               MOVE  2  TO  IDX1
      **             ELSE
      **               MOVE  1  TO  IDX1
      **            END-IF
      *             IF  RECE10-KYURATE  =  9
      *               MOVE  1  TO  IDX1
      *             ELSE
      *               MOVE  2  TO  IDX1
      *             END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
      *           WHEN  RECE10-AGE  >  2
      *             MOVE  3    TO  IDX1
      *           WHEN  OTHER
      *             MOVE  4    TO  IDX1
      *         END-EVALUATE
               IF  RECE10-AGE  >=  70
                   IF  RECE10-KYURATE  =  7
                       MOVE  2  TO  IDX1
                   ELSE
                       MOVE  1  TO  IDX1
                   END-IF
               ELSE
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                       MOVE  4     TO  IDX1
                   ELSE
                       IF  RECE10-AGE  >=  3
                           MOVE  3     TO  IDX1
                       ELSE
                           MOVE  4     TO  IDX1
                       END-IF
                   END-IF
               END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
             ELSE
      *    家族区分チェック
               IF  RECE10-HONKZKKBN  =  "1"
      *    年齢チェック
                 IF  RECE10-AGE  >= 70
      *---(01.00.02) LINE ADD START ------------------------------------
      *             IF  RECE10-KYURATE  =  8
      *               MOVE  7  TO  IDX1
      *             ELSE
      *               MOVE  6  TO  IDX1
      *             END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
      *             IF  RECE10-KYURATE  =  9
      *               MOVE  6  TO  IDX1
      *             ELSE
      *               MOVE  7  TO  IDX1
      *             END-IF
                   IF  RECE10-KYURATE  =  7
                       MOVE  7  TO  IDX1
                   ELSE
                       MOVE  6  TO  IDX1
                   END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.02) LINE ADD END   ------------------------------------
                 ELSE
                   MOVE  5    TO  IDX1
                 END-IF
               ELSE
      *---(01.00.05) LINE ADD START ------------------------------------
      *           IF  RECE10-AGE  >  2
      *             IF    RECE10-AGE  >=  70
      **---(01.00.02) LINE ADD START ------------------------------------
      **               IF  RECE10-KYURATE  =  8
      **                 MOVE  7  TO  IDX1
      **               ELSE
      **                 MOVE  6  TO  IDX1
      **               END-IF
      *               IF  RECE10-KYURATE  =  9
      *                 MOVE  6  TO  IDX1
      *               ELSE
      *                 MOVE  7  TO  IDX1
      *               END-IF
      **---(01.00.02) LINE ADD END   ------------------------------------
      *             ELSE
      *               MOVE  8    TO  IDX1
      *             END-IF
      *           ELSE
      *             MOVE  9   TO  IDX1
      *           END-IF
                 IF  RECE10-AGE  >=  70
                     IF  RECE10-KYURATE  =  7
                         MOVE  7   TO  IDX1
                     ELSE
                         MOVE  6   TO  IDX1
                     END-IF
                 ELSE
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                       MOVE  9     TO  IDX1
                   ELSE
                       IF  RECE10-AGE  >=  3
                           MOVE  8     TO  IDX1
                       ELSE
                           MOVE  9     TO  IDX1
                       END-IF
                   END-IF
                 END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
               END-IF
             END-IF
           END-IF
      *    集計
           PERFORM   2101-SYUKEI-SEC
      *
           IF      FLG-SKT2810TMP  =  1
                   WRITE    SKT2810TMP-REC
           ELSE
                   REWRITE  SKT2810TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *療養の給付
      *    件数
           ADD   1                   TO  SKT2810TMP-KENSU(IDX1 IDX2)
                                         SKT2810TMP-KENSU(12 IDX2)
      *    日数
           ADD   RECE10-JNISSU(1)    TO  SKT2810TMP-NISSU(IDX1 IDX2)
                                         SKT2810TMP-NISSU(12 IDX2)
      *    点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT2810TMP-TENSU(IDX1 IDX2)
                                         SKT2810TMP-TENSU(12 IDX2)
      *    一部負担金
      ***** 05/08/16 DEL
      *     EVALUATE  TRUE
      *     WHEN RECE10-KOHNUM(4)  NOT  =  SPACE
      *       ADD  RECE10-FTNMONEY(5)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
      *                                    SKT2810TMP-ITBFTN(12 IDX2)
      *     WHEN RECE10-KOHNUM(3)  NOT  =  SPACE
      *       ADD  RECE10-FTNMONEY(4)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
      *                                    SKT2810TMP-ITBFTN(12 IDX2)
      *     WHEN RECE10-KOHNUM(2)  NOT  =  SPACE
      *       ADD  RECE10-FTNMONEY(3)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
      *                                    SKT2810TMP-ITBFTN(12 IDX2)
      *     WHEN RECE10-KOHNUM(1)  NOT  =  SPACE
      *       ADD  RECE10-FTNMONEY(2)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
      *                                    SKT2810TMP-ITBFTN(12 IDX2)
      *     WHEN OTHER
      *       ADD  RECE10-FTNMONEY(1)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
      *                                    SKT2810TMP-ITBFTN(12 IDX2)
      *     END-EVALUATE
      ***** 05/08/16 INS
      *    一部負担金は合算する
           ADD     RECE10-FTNMONEY(1)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
                                           SKT2810TMP-ITBFTN(12 IDX2)
           ADD     RECE10-FTNMONEY(2)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
                                           SKT2810TMP-ITBFTN(12 IDX2)
           ADD     RECE10-FTNMONEY(3)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
                                           SKT2810TMP-ITBFTN(12 IDX2)
           ADD     RECE10-FTNMONEY(4)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
                                           SKT2810TMP-ITBFTN(12 IDX2)
           ADD     RECE10-FTNMONEY(5)  TO  SKT2810TMP-ITBFTN(IDX1 IDX2)
                                           SKT2810TMP-ITBFTN(12 IDX2)
      *****
      *
      *食事療養
      *    件数
           IF  RECE10-SHOKUJINISSU(1)  >  0
             ADD  1  TO  SKT2810TMP-SKENSU(IDX1)
                         SKT2810TMP-SKENSU(12)
      *---(01.00.03) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    日数
           ADD  RECE10-SHOKUJINISSU(1)  TO  SKT2810TMP-SNISSU(IDX1)
                                            SKT2810TMP-SNISSU(12)
      *    金額
           ADD  RECE10-SHOKUJIRYOYOHI(1)  TO
                                    SKT2810TMP-SKINGK(IDX1)
                                    SKT2810TMP-SKINGK(12)
      *    標準負担額
           ADD  RECE10-SHOKUJIFTN(1)  TO  SKT2810TMP-SFTNGK(IDX1)
                                          SKT2810TMP-SFTNGK(12)
      *---(01.00.03) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           MOVE    1               TO  FLG-UPD 
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    老人保健編集処理
      *****************************************************************
       2201-HENSYU-SEC              SECTION.
      *
           IF  RECE10-ETC-KOHNUM(IDX3)   =   "019"
      *    金額は省略し、件数のみ表示する
               ADD    1     TO    SKT2810TMP-KOHKENSU(1)
           END-IF
      *
           DISPLAY "RECE10-KOHNUM(IDX3)" RECE10-KOHNUM(IDX3)
           IF    RECE10-KOHNUM(IDX3)    =  "051"  OR  "091"
      *    金額は省略し、件数のみ表示する
                ADD    1    TO    SKT2810TMP-KOHKENSU(2)
                DISPLAY "特疾OK"
           END-IF
      *
           .
       2201-HENSYU-EXT.
           EXIT.
      *
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
           OPEN     INPUT       SKT2810TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           MOVE     1           TO       WRK-CNT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      *
      *    帳票編集<見出し>処理
             PERFORM  310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
             PERFORM  320-BODY-HEN-SEC
      *    帳票印刷処理
             PERFORM  330-PRINT-OUT-SEC
             MOVE  ZERO  TO  FLG-PASS
      *
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
             MOVE  1     TO  WRK-CNT
           END-PERFORM
      *
           CLOSE    SKT2810TMP-FILE
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
           ADD      1                   TO        CNT-PAGE
      *
           INITIALIZE                             SKT2810
      *
      *    診療年月
           MOVE    SKT2810TMP-SRYYM    TO  WRK-SYMD (1:6)
           MOVE    "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)   TO  SKT2810-SRYYM
      *
      *    請求年月日
           MOVE     WRK-SEIYMDWH             TO   SKT2810-SEIYMD
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE     SYS-1002-ADRS            TO   SKT2810-ADRS
      *
      *    医療機関名
      *     MOVE     SYS-1001-HOSPNAME        TO   SKT2810-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS              TO   SKT2810-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) start
           INSPECT SKT2810-ADRS              REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME              TO   SKT2810-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) start
           INSPECT SKT2810-HOSPNAME          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) end
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) start
      *     MOVE     SYS-1001-KAISETUNAME     TO   SKT2810-KAISETUNAME
           MOVE     WRK-KAISETUNAME          TO   SKT2810-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) end
      *
      *    医療機関コード
           MOVE     SYS-1001-HOSPCD          TO   WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT            TO   SKT2810-HOSPCD
      *
      *    保険者番号
             MOVE     SKT2810TMP-HKNJANUM    TO   WRK-MAE-INPUT
             PERFORM  2009-HENKAN-SEC
             MOVE     WRK-OUT-INPUT          TO   SKT2810-HKNJANUM
      *
      *    保険者名
           MOVE  SKT2810TMP-HKNJANUM  TO  WRK-HKNJANUM
           PERFORM  920-HKNJAINF-SET-SEC
           IF      HKNJA-HKNJANAME    NOT  =  SPACE
             STRING  HKNJA-HKNJANAME       DELIMITED BY SPACE
                     "  "                  DELIMITED BY SIZE
                     "様"                  DELIMITED BY SIZE
                     INTO                  SKT2810-HKNJANAME
             END-STRING
           ELSE
             MOVE  "様"           TO  SKT2810-HKNJANAME(23:2)
           END-IF
      *
      *    在総診
           IF     SKT2810TMP-ZAITAKU   =   "1"
             MOVE    "在"              TO  SKT2810-ZAI1
             MOVE    "◯"              TO  SKT2810-ZAI2
           END-IF
      *
      *    ページ番号
           MOVE      CNT-PAGE          TO  WRK-Z4
           MOVE      WRK-Z4            TO  SKT2810-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"        TO  SKT2810-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
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
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >    12
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                       UNTIL   IDX2  >     2
      *    件数
               MOVE     SKT2810TMP-KENSU (IDX1 IDX2)  TO   WRK-Z5
               MOVE     WRK-Z5       TO   SKT2810-KENSU (IDX1 IDX2)
      *    日数
               MOVE     SKT2810TMP-NISSU (IDX1 IDX2)  TO   WRK-Z5
               MOVE     WRK-Z5       TO   SKT2810-NISSU (IDX1 IDX2)
      *    点数
               MOVE     SKT2810TMP-TENSU (IDX1 IDX2)  TO   WRK-Z9
               MOVE     WRK-Z9       TO   SKT2810-TENSU (IDX1 IDX2)
      *    一部負担金
               MOVE     SKT2810TMP-ITBFTN (IDX1 IDX2)  TO   WRK-Z9
               MOVE     WRK-Z9      TO   SKT2810-ITBFTN (IDX1 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE     SKT2810TMP-SKENSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT2810-SKENSU (IDX1)
      *    食事療養：日数
             MOVE     SKT2810TMP-SNISSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT2810-SNISSU (IDX1)
      *    食事療養：金額
             MOVE     SKT2810TMP-SKINGK (IDX1)   TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT2810-SKINGK (IDX1)
      *    食事療養：標準負担額
             MOVE     SKT2810TMP-SFTNGK (IDX1)   TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT2810-SFTNGK (IDX1)
           END-PERFORM
      *
           MOVE    SKT2810TMP-KOHKENSU(1) TO  WRK-Z5
           MOVE    WRK-Z5                 TO  SKT2810-KOHKENSU(1)
           MOVE    SKT2810TMP-KOHITBFTN(1)   TO  WRK-Z9
           MOVE    WRK-Z9                    TO  SKT2810-KOHITBFTN(1)
           MOVE    SKT2810TMP-KOHKENSU(2) TO  WRK-Z5
           MOVE    WRK-Z5                 TO  SKT2810-KOHKENSU(2)
           MOVE    SKT2810TMP-KOHITBFTN(2)   TO  WRK-Z9
           MOVE    WRK-Z9                    TO  SKT2810-KOHITBFTN(2)
      *  老人＋原爆、又は特定疾患の場合に文字を追記
           IF      SKT2810TMP-KOHKENSU(1)  >  ZERO
             MOVE  "原"                   TO  SKT2810-TOKUBETU1(1)
             MOVE  "○"                   TO  SKT2810-TOKUBETU1(2)
           END-IF
      *
           IF      SKT2810TMP-KOHKENSU(2)  >  ZERO
             DISPLAY "特定疾患"
             MOVE  "特"                   TO  SKT2810-TOKUBETU2(1)
             MOVE  "○"                   TO  SKT2810-TOKUBETU2(2)
           END-IF
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
           MOVE   "SKT2810.red"            TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/11/12) start
      **=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
      **     MOVE    "国保請求書"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書"               TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書 [特別療養費]"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
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
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/11/12) end
           MOVE    SKT2810             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by hagino(2018/03/01) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by hagino(2018/03/01) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.04) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY    TO  MCP-PATH
      *             CALL    "MCPSUB"             USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
                   MOVE    "tbl_seikyu"     TO  MCP-TABLE
                   MOVE    "key"            TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"      USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU0110 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU0110 SEIKYU INVALID ***"
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
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKNJA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM                TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY     TO  MCP-PATH
             MOVE    "tbl_hknjainf"   TO  MCP-TABLE
             MOVE    "key"            TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknjainf"         TO  MCP-TABLE
           MOVE  "key"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
       920-HKNJAINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
       925-HKNJAINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"    TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *****************************************************************
      *   保険組合せ情報セット
      *****************************************************************
      * 930-HKNCOMBI-SET-SEC  SECTION.
      *
      *     INITIALIZE  HKNCOMBI-REC
      *     MOVE  RECE10-HOSPID               TO  COMB-HOSPID
      *     MOVE  RECE10-PTID                 TO  COMB-PTID
      *     MOVE  HKNCOMBI-REC                TO  MCPDATA-REC
      *     MOVE  "DBSELECT"                  TO  MCP-FUNC
      *     MOVE  PATH-TBL-HKNCOMBI-KEY2      TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  PATH-TBL-HKNCOMBI-KEY2    TO  MCP-PATH
      *       PERFORM  935-HKNCOMBI-READ-SEC
      *
      *    老人の支払区分
      *       PERFORM  UNTIL  FLG-HKNCOMBI = 1
      *         IF  COMB-KOH1HKNNUM  =  "027"
      *           MOVE  COMB-KOH1PAYKBN   TO  WRK-PAYKBN
      *           MOVE  1                 TO  FLG-HKNCOMBI
      *         END-IF
      *         IF  COMB-KOH2HKNNUM  =  "027"
      *           MOVE  COMB-KOH2PAYKBN   TO  WRK-PAYKBN
      *           MOVE  1                 TO  FLG-HKNCOMBI
      *         END-IF
      *         IF  COMB-KOH3HKNNUM  =  "027"
      *           MOVE  COMB-KOH3PAYKBN   TO  WRK-PAYKBN
      *           MOVE  1                 TO  FLG-HKNCOMBI
      *         END-IF
      *         IF  COMB-KOH4HKNNUM  =  "027"
      *           MOVE  COMB-KOH4PAYKBN   TO  WRK-PAYKBN
      *           MOVE  1                 TO  FLG-HKNCOMBI
      *         END-IF
      *
      *         PERFORM  935-HKNCOMBI-READ-SEC
      *       END-PERFORM
      *     ELSE
      *       DISPLAY  "HKNCOBMI SELECT ERR"
      *     END-IF
      *
      *     INITIALIZE  MCPAREA
      *     MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *     MOVE  PATH-TBL-HKNJAINF-KEY2  TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
      *
      *     .
      * 930-HKNCOMBI-SET-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    保険組合せ情報読込
      *****************************************************************
      * 935-HKNCOMBI-READ-SEC  SECTION.
      *
      *     MOVE  "DBFETCH"    TO  MCP-FUNC
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  MCPDATA-REC  TO  HKNCOMBI-REC
      *       MOVE  ZERO         TO  FLG-HKNCOMBI
      *     ELSE
      *       INITIALIZE  HKNCOMBI-REC
      *       MOVE  1            TO  FLG-HKNCOMBI
      *     END-IF
      *
      *     .
      * 935-HKNCOMBI-READ-EXT.
      *     EXIT.
      *
      *****************************************************************
      *   保険情報セット(老人の割合チェック)
      *****************************************************************
      * 940-HKNNUM-SET-SEC  SECTION.
      *
      *     INITIALIZE  HKNNUM-REC
      *     MOVE  RECE10-HOSPID               TO  HKN-HOSPID
      *     MOVE  RECE10-RJNHKNNUM            TO  HKN-HKNNUM
      *     MOVE  HKNNUM-REC                  TO  MCPDATA-REC
      *     MOVE  "DBSELECT"                  TO  MCP-FUNC
      *     MOVE  PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  PATH-TBL-HKNNUM-KEY2      TO  MCP-PATH
      *       PERFORM  945-HKNNUM-READ-SEC
      *
      *       PERFORM  UNTIL  FLG-HKNNUM = 1
      *         IF  WRK-PAYKBN (2:)  =  HKN-PAYKBN
      *           MOVE  HKN-HON-GAIKFTNRATE  TO  WRK-RATE
      *         END-IF
      *
      *         PERFORM  945-HKNNUM-READ-SEC
      *       END-PERFORM
      *     ELSE
      *       DISPLAY  "HKNNUM SELECT ERR"
      *     END-IF
      *
      *     INITIALIZE  MCPAREA
      *     MOVE  "DBCLOSECURSOR"                TO  MCP-FUNC
      *     MOVE  PATH-TBL-HKNNUM-KEY2           TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
      *
      *     .
      * 940-HKNNUM-SET-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    保険組合せ情報読込
      *****************************************************************
      * 945-HKNNUM-READ-SEC  SECTION.
      *
      *     MOVE  "DBFETCH"          TO  MCP-FUNC
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  MCPDATA-REC  TO  HKNNUM-REC
      *       MOVE  ZERO         TO  FLG-HKNNUM
      *     ELSE
      *       INITIALIZE  HKNNUM-REC
      *       MOVE  1            TO  FLG-HKNNUM
      *     END-IF
      *
      *     .
      * 945-HKNNUM-READ-EXT.
      *     EXIT.
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                  RECE10-REC
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM          TO    RECE10-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
             EVALUATE  WRK-PARA-HKNJANUM(1:3)
             WHEN "284"
               MOVE  "284000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "284999"          TO  RECE10-XXEDHKNJANUM
             WHEN OTHER
               MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                            RECE10-XXEDHKNJANUM
             END-EVALUATE
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) start
           IF  WRK-PARA-TOKUBETU  =  "2"
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/24) start
      *       MOVE  "000000"             TO  RECE10-SRYYM
      *       MOVE  "999999"             TO  RECE10-XXSRYYM
             MOVE  000000              TO  RECE10-SRYYM
             MOVE  999999              TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/24) end
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/02) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/04/06) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/04/06) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
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
               MOVE    1               TO  FLG-END
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/06/17) end
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"       TO  MCP-TABLE
               MOVE    "key"             TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"       USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"          TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       800-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT2810TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT2810TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT2810TMP
           END-READ
           .
       800-SKTTMP-READ-EXT.
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"            TO  MCP-TABLE
           MOVE    "key10"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"               USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
           READ  SKT2810TMP-FILE   NEXT
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
      * 
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
           MOVE    SYS-1900-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/04/13) end
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) start
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
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2018/03/01) end
      *
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           .                             
       900-DBCLOSE-EXT.
           EXIT.
