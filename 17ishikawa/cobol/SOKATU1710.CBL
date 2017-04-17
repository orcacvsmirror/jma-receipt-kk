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
       PROGRAM-ID.             SOKATU1710.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 石川・診療報酬請求書(国保請求書)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/11/08    山口          再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01      内田     06/11/28    食事がない場合でも生活療養費を印字
      *  01.00.02      内田     07/07/27    日レセver4.0対応
      *                                     システム管理マスタ「1901」の
      *                                     医療機関情報を参照
      *                                     長期上位も長期と同じ箇所に集計
      *  01.00.03      長屋     08/04/24    帳票様式に伴う修正
      *  01.00.04      内田     08/06/27    斜線部分の一部負担金は印字しない
      *                                     SPA-AREA初期化
      *  01.00.05      吉川     09/04/01    県外用の帳票追加
      *  01.00.06      吉川     10/08/19    オンライン返戻対応
      *                                     特別療養費国保対応
      *  01.00.07      吉川     11/02/17    open-cobol1.0対応
      *                                     特別療養費印刷時の再印刷画面の
      *                                     帳票タイトル変更
      *  01.00.08      吉川     12/05/23    帳票様式の変更に伴う修正
      *  01.00.09      吉川     13/01/09    プラグイン対応
      *                                     医療機関情報編集対応
      *  01.00.10      吉川     14/05/19    前期高齢者２割対応
      *                                     プログラムオプション対応
      *  01.00.11      吉川     14/10/09    返戻時、再印刷画面のタイトル修正
      *  01.00.12      吉川     14/10/23    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.13      萩野     16/11/16    医療機関編集情報への開設者名追加対応
      *  01.00.14      萩野     17/04/17    医療機関コード変更時、
      *                                     医療機関コード別の作成処理対応
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
      *
      *    請求書一時ファイル  
           SELECT  SKT1710TMP-FILE ASSIGN    SKT1710TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1710TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1710.
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
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      **    優先保険者番号ファイル
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT1710TMP-FILE.
           COPY    "CPSKT1710TMP.INC".
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
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1710TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.02) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT1710.INC".
      *=== 県外用帳票追加 by Yoshikawa(2009/04/01) start
           COPY    "SKT1720.INC".
      *=== 県外用帳票追加 by Yoshikawa(2009/04/01) end
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT1710         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1710TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
           03  IDX                 PIC 9(05).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
      *##  パラメタ領域（地方公費仕様）
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.02) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.02) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      **=== プラグイン対応 by Yoshikawa(2013/01/09) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU1710".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **=== プラグイン対応 by Yoshikawa(2013/01/09) end
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
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
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/01/09) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/01/09) end
      *
      *    文字変換
           03  WRK-MAE-INPUT           PIC X(200).
           03  WRK-OUT-INPUT           PIC X(200).
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
           03  WRK-PATH2           PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
           03  WRK-YUSEN           PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) start
           03  WRK-KAISETUNAME     PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) end
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
      *
           COPY    "CPSHELLTBL.INC".
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.02) LINE ADD END   ------------------------------------
      *---(01.00.03) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) end
      *
      *    請求管理情報
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
      * 
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
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
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
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
           INITIALIZE                  IDX-AREA
      *---(01.00.04) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
           DISPLAY  "START"
      *
           PERFORM 100-DBOPEN-SEC
      *
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
      *---(01.00.02) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.02) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"               TO  SJOBKANRI-MODE
           INITIALIZE                      JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID      TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID    TO  JOB-SHELLID
           MOVE    "SOKATU1710"        TO  JOB-PGID
           MOVE    "国保請求書"        TO  JOB-SHELLMSG
           CALL    "ORCSJOB"           USING
                                       ORCSJOBKANRIAREA
                                       JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *=== open-cobol1.0対応 by Yoshikawa(2011/02/17) start
      *     MOVE    "SKT1710TP"         TO  SKT1710TP-FILE-ID
           MOVE    "SKT1710"           TO  SKT1710TP-FILE-ID
      *=== open-cobol1.0対応 by Yoshikawa(2011/02/17) end
           MOVE    LNK-PRTKANRI-TERMID TO  SKT1710TP-TERMID
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT1710TP-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           MOVE  SKT1710TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT1710TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE    "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH 
      *
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) end
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      *     PERFORM  110-INI-FILE-SEC
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
      *     EVALUATE    WRK-PARA-SYOKBN
      *         WHEN    "2"
      **---(01.00.02) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.02) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.02) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.02) LINE ADD END   ------------------------------------
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
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *  
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/01/09) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/01/09) end
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
           MOVE    "SOKATU1710"              TO  WRK-PRGID
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
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT1710TMP-FILE
           CLOSE            SKT1710TMP-FILE
           OPEN     I-O     SKT1710TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1710TMP-FILE
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
           DISPLAY "*** SOKATU1710 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1710 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
      *###（地方公費仕様）
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
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
           INITIALIZE       SKT1710TMP-REC
           INITIALIZE       SKT1710TMP-HKNJANUM
      *
      *    保険者番号
           MOVE  RECE10-HKNJANUM-S       TO  SKT1710TMP-HKNJANUM
      *
      *    出力順設定
      *    県外保険者→県内市町村→県内国保組合→県内扱い国保組合→
      *    →YUSEN.INIに登録されている保険者(医療機関所在地保険者)
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      *     IF  YUSEN-HKNJANUM       =    SKT1710TMP-HKNJANUM
           IF  WRK-YUSEN       =    SKT1710TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
             MOVE  9                     TO  SKT1710TMP-SYUTURYOKU
           ELSE
             IF  RECE10-PREFKBN     =    "2"
               MOVE  1                   TO  SKT1710TMP-SYUTURYOKU
             ELSE
               IF  RECE10-PREFNUM   =    "17"
                 IF  SKT1710TMP-HKNJANUM(3:1)  =  "3"
                   MOVE    3             TO  SKT1710TMP-SYUTURYOKU
                 ELSE
                   MOVE    2             TO  SKT1710TMP-SYUTURYOKU
                 END-IF
               ELSE
                 MOVE      4             TO  SKT1710TMP-SYUTURYOKU
               END-IF
             END-IF
           END-IF
      *
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
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    入外区分
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1      TO   IDX2
           ELSE
             MOVE  2      TO   IDX2
           END-IF
      *
      *    老人かどうか
           IF  RECE10-RJNHKNNUM  NOT =  SPACE
             IF  RECE10-KYURATE = 9
               MOVE  12      TO  IDX1
               MOVE   5      TO  IDX3
             ELSE
               MOVE  13      TO  IDX1
               MOVE   6      TO  IDX3
             END-IF
           ELSE
      *    一般か退職者か
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *    年齢チェック
               IF  RECE10-AGE  >=  70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) start
      *           IF  RECE10-KYURATE  =  9
      *              MOVE   1    TO    IDX1
      *                                IDX3
      *           ELSE
      *              MOVE   2    TO    IDX1
      *                                IDX3
      *           END-IF
                 EVALUATE  RECE10-KYURATE
                   WHEN  9
                     MOVE    1   TO   IDX1
                                      IDX3
                   WHEN  8
                     IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                         MOVE    1    TO    IDX1
                                            IDX3
                     ELSE
                         MOVE    2    TO    IDX1
                                            IDX3
                     END-IF
                   WHEN  7
                     MOVE    2   TO   IDX1
                                      IDX3
                 END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) end
               ELSE
      *---(01.00.03) LINE ADD START ------------------------------------
                IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                AND  (RECE10-FLG (1)   =  1)
                    MOVE  6     TO  IDX1
                ELSE
      *---(01.00.03) LINE ADD END   ------------------------------------
                 IF  RECE10-AGE  <  3
                   MOVE    6    TO    IDX1
                 ELSE
                   EVALUATE  RECE10-KYURATE
                   WHEN    7
                     MOVE    5    TO    IDX1
                   WHEN    8
                     MOVE    4    TO    IDX1
                   WHEN    OTHER
                     MOVE    3    TO    IDX1
                   END-EVALUATE
                 END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
                END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
               END-IF
             ELSE
               IF  RECE10-AGE  >=  70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) start
      *           IF  RECE10-KYURATE  =  9
      *             MOVE  7        TO  IDX1
      *             MOVE  3        TO  IDX3
      *           ELSE
      *             MOVE  8        TO  IDX1
      *             MOVE  4        TO  IDX3
      *           END-IF
                 EVALUATE  RECE10-KYURATE
                   WHEN  9
                     MOVE    7   TO   IDX1
                     MOVE    3   TO   IDX3
                   WHEN  8
                     IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                         MOVE    7    TO    IDX1
                         MOVE    3    TO    IDX3
                     ELSE
                         MOVE    8    TO    IDX1
                         MOVE    4    TO    IDX3
                     END-IF
                   WHEN  7
                     MOVE    8   TO   IDX1
                     MOVE    4   TO   IDX3
                 END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) end
               ELSE
                 IF  RECE10-HONKZKKBN  =  "1"
                   MOVE   9    TO  IDX1
                 ELSE
      *---(01.00.03) LINE ADD START ------------------------------------
                  IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                  AND  (RECE10-FLG (1)   =  1)
                      MOVE  11     TO  IDX1
                  ELSE
      *---(01.00.03) LINE ADD END   ------------------------------------
                   IF  RECE10-AGE    <    3
                       MOVE   11    TO    IDX1
                   ELSE
                       MOVE   10    TO    IDX1
                   END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
                  END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
                 END-IF
               END-IF
             END-IF
           END-IF
      *
      *    保険分集計
      *=== 帳票様式の変更 by Yoshikawa(2012/05/23) start
      *     IF  RECE10-ZAITAKU     =    SPACE
      *=== 帳票様式の変更 by Yoshikawa(2012/05/23) end
             PERFORM  2101-SYUKEI-SEC
      *=== 帳票様式の変更 by Yoshikawa(2012/05/23) start
      *     ELSE
      *       PERFORM  2101-Z-SYUKEI-SEC
      *     END-IF
      *=== 帳票様式の変更 by Yoshikawa(2012/05/23) end
      *
      *    公費分集計
           IF  RECE10-KOHNUM(1)  NOT  =  SPACE
             PERFORM  220-KOH-SYUKEI-SEC
           END-IF
      *
           IF  FLG-SKT1710TMP  =  1
               WRITE    SKT1710TMP-REC
           ELSE
               REWRITE  SKT1710TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・一般国保分集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *療養の給付
      *    件数
           ADD   1                   TO  SKT1710TMP-KENSU(IDX1 IDX2)
      *    日数
           ADD   RECE10-JNISSU(1)    TO  SKT1710TMP-NISSU(IDX1 IDX2)
      *    点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1710TMP-TENSU(IDX1 IDX2)
      *    薬剤一部負担金
           ADD   RECE10-YKZFTN(1)    TO  SKT1710TMP-YKZFTN(IDX1 IDX2)
      *    一部負担金
      *---(01.00.04) LINE ADD START ------------------------------------
      *     ADD   RECE10-FTNMONEY(1)  TO  SKT1710TMP-ITBFTN(IDX1 IDX2)
           IF  IDX1  =  12  OR  13
             ADD   RECE10-FTNMONEY(1)  TO  SKT1710TMP-ITBFTN(IDX1 IDX2)
           ELSE
             IF  (IDX2  =  1)  AND  (IDX1 = 1 OR 2 OR 7 OR 8)
               ADD  RECE10-FTNMONEY(1) TO  SKT1710TMP-ITBFTN(IDX1 IDX2)
             END-IF
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    長期
      *---(01.00.02) LINE ADD START ------------------------------------
      *     IF    RECE10-ETC-KOHNUM(1) =  "972"
      *       OR  RECE10-ETC-KOHNUM(2) =  "972"
      *       OR  RECE10-ETC-KOHNUM(3) =  "972"
      *       OR  RECE10-ETC-KOHNUM(4) =  "972"
           IF    RECE10-ETC-KOHNUM(1) =  "972" OR "974"
             OR  RECE10-ETC-KOHNUM(2) =  "972" OR "974"
             OR  RECE10-ETC-KOHNUM(3) =  "972" OR "974"
             OR  RECE10-ETC-KOHNUM(4) =  "972" OR "974"
      *---(01.00.02) LINE ADD END   ------------------------------------
             ADD     1               TO  SKT1710TMP-TYOKI(IDX1 IDX2)
           END-IF
      *食事療養
      *    件数
           IF  RECE10-SHOKUJINISSU(1)  >  0
             ADD  1                  TO  SKT1710TMP-SKENSU(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    日数
           ADD  RECE10-SHOKUJINISSU(1)
                                     TO  SKT1710TMP-SNISSU(IDX1)
      *    金額
           ADD  RECE10-SHOKUJIRYOYOHI(1)
                                     TO  SKT1710TMP-SKINGK(IDX1)
      *    標準負担額
           ADD  RECE10-SHOKUJIFTN(1)
                                     TO  SKT1710TMP-SFTNGK(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・在宅分集計処理
      *****************************************************************
       2101-Z-SYUKEI-SEC         SECTION.
      *
      *療養の給付
      *    件数
           ADD   1                   TO  SKT1710TMP-Z-KENSU(IDX3)
      *    日数
           ADD   RECE10-JNISSU(1)    TO  SKT1710TMP-Z-NISSU(IDX3)
      *    点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1710TMP-Z-TENSU(IDX3)
      *    一部負担金
           ADD   RECE10-FTNMONEY(1)  TO  SKT1710TMP-Z-ITBFTN(IDX3)
      *
      *    長期
           IF    RECE10-ETC-KOHNUM(1) =  "972"
             OR  RECE10-ETC-KOHNUM(2) =  "972"
             OR  RECE10-ETC-KOHNUM(3) =  "972"
             OR  RECE10-ETC-KOHNUM(4) =  "972"
             ADD     1               TO  SKT1710TMP-Z-TYOKI(IDX3)
           END-IF
      *
           .
       2101-Z-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理
      *****************************************************************
       220-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
      *    ０５１と０９１は同じ場所に集計する
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"    TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
      *    集計場所設定
             EVALUATE  RECE10-KOHNUM(IDX3)
             WHEN "010"
               IF  RECE10-NYUGAIKBN    =    "1"
                 MOVE    1            TO    IDX1
               ELSE
                 MOVE    2            TO    IDX1
               END-IF
             WHEN "011"
               MOVE      3            TO    IDX1
             WHEN "020"
               MOVE      4            TO    IDX1
             WHEN "021"
               MOVE      5            TO    IDX1
             WHEN "100"
               IF  RECE10-NYUGAIKBN    =    "1"
                 MOVE    6            TO    IDX1
               ELSE
                 MOVE    7            TO    IDX1
               END-IF
             WHEN OTHER
               IF  RECE10-NYUGAIKBN    =    "1"
                 MOVE    8            TO    IDX1
               ELSE
                 MOVE    9            TO    IDX1
               END-IF
             END-EVALUATE
      *
      *    療養の給付：件数
             ADD   1  TO  SKT1710TMP-K-KENSU(IDX1)
      *    療養の給付:診療実日数
             ADD  RECE10-JNISSU(IDX3 + 1)    TO
                               SKT1710TMP-K-NISSU(IDX1)
      *    療養の給付：点数
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT1710TMP-K-TENSU(IDX1)
      *
      *    療養の給付：一部負担金
             ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                               SKT1710TMP-K-ITBFTN(IDX1)
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *       IF  (RECE10-SHOKUJINISSU(IDX3 + 1)  >  0 ) AND
      *           (IDX1                 =  3 OR 4 OR 8 )     
      *    食事療養:件数
      *           ADD   1  TO  SKT1710TMP-K-SKENSU(IDX1)
             IF  IDX1  =  3 OR 4 OR 8
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養:件数
                 ADD   1  TO  SKT1710TMP-K-SKENSU(IDX1)
               END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養:日数
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                               SKT1710TMP-K-SNISSU(IDX1)
      *    食事療養：金額
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT1710TMP-K-SKINGK(IDX1)
      *    食事療養：標準負担額
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                               SKT1710TMP-K-SFTNGK(IDX1)
             END-IF
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
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
           OPEN     INPUT       SKT1710TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *    帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 330-PRINT-OUT-SEC
      *=== 県外用帳票追加 by Yoshikawa(2009/04/01) start
      *        県外かどうか
               IF  SKT1710TMP-SYUTURYOKU  =  1
      *    帳票編集<見出し>処理
                 PERFORM 311-HEAD-HEN-SEC
      *    帳票印刷処理
                 PERFORM 331-PRINT-OUT-SEC
               END-IF
      *=== 県外用帳票追加 by Yoshikawa(2009/04/01) end
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT1710TMP-FILE
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
           INITIALIZE                    SKT1710
      *
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1710-SRYYM
      *
      *    請求日付
           MOVE    WRK-SEIYMDWH          TO  SKT1710-SEIYMD
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1710-HOSPCD
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1710-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1710-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1710-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) start
           INSPECT SKT1710-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1710-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) start
           INSPECT SKT1710-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) end
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT1710-KAISETU
           MOVE    WRK-KAISETUNAME       TO  SKT1710-KAISETU
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) end
      *
      *    保険者番号
           MOVE    SKT1710TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1710-HKNJANUM
      *
      *    ページ番号を設定
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT1710-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1710-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
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
                    UNTIL    IDX1  >    13
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                       UNTIL   IDX2  >     2
      *    件数
               MOVE     SKT1710TMP-KENSU (IDX1 IDX2)  TO   WRK-Z5
               MOVE     WRK-Z5       TO   SKT1710-KENSU (IDX1 IDX2)
      *    日数
               MOVE     SKT1710TMP-NISSU (IDX1 IDX2)  TO   WRK-Z5
               MOVE     WRK-Z5       TO   SKT1710-NISSU (IDX1 IDX2)
      *    点数
               MOVE     SKT1710TMP-TENSU (IDX1 IDX2)  TO   WRK-Z9
               MOVE     WRK-Z9       TO   SKT1710-TENSU (IDX1 IDX2)
      *    薬剤一部負担金
               MOVE     SKT1710TMP-YKZFTN (IDX1 IDX2) TO   WRK-Z7
               MOVE     WRK-Z7       TO   SKT1710-YKZFTN(IDX1 IDX2)
      *    一部負担金
               MOVE     SKT1710TMP-ITBFTN (IDX1 IDX2)  TO   WRK-Z9
               MOVE     WRK-Z9       TO   SKT1710-ITBFTN (IDX1 IDX2)
      *    長期
               MOVE     SKT1710TMP-TYOKI  (IDX1 IDX2)  TO   WRK-Z3
               MOVE     WRK-Z3       TO   SKT1710-TYOKI (IDX1 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE     SKT1710TMP-SKENSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1710-SKENSU (IDX1)
      *    食事療養：日数
             MOVE     SKT1710TMP-SNISSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1710-SNISSU (IDX1)
      *    食事療養：金額
             MOVE     SKT1710TMP-SKINGK (IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1710-SKINGK (IDX1)
      *    食事療養：標準負担額
             MOVE     SKT1710TMP-SFTNGK (IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1710-SFTNGK (IDX1)
           END-PERFORM
      *
      *    在宅分
      *=== 帳票様式の変更 by Yoshikawa(2012/05/23) start
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >     6
      **    件数
      *       MOVE     SKT1710TMP-Z-KENSU (IDX1)  TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1710-Z-KENSU (IDX1)
      **    日数
      *       MOVE     SKT1710TMP-Z-NISSU (IDX1)  TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1710-Z-NISSU (IDX1)
      **    点数
      *       MOVE     SKT1710TMP-Z-TENSU (IDX1)  TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1710-Z-TENSU (IDX1)
      **    一部負担金
      *       MOVE     SKT1710TMP-Z-ITBFTN (IDX1)  TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1710-Z-ITBFTN (IDX1)
      **    長期
      *       MOVE     SKT1710TMP-Z-TYOKI  (IDX1)  TO   WRK-Z3
      *       MOVE     WRK-Z3       TO   SKT1710-Z-TYOKI (IDX1)
      *     END-PERFORM
      *=== 帳票様式の変更 by Yoshikawa(2012/05/23) end
      *
      *    公費分
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     9
      *    件数
             MOVE     SKT1710TMP-K-KENSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1710-K-KENSU (IDX1)
      *    日数
             MOVE     SKT1710TMP-K-NISSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1710-K-NISSU (IDX1)
      *    点数
             MOVE     SKT1710TMP-K-TENSU (IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1710-K-TENSU (IDX1)
      *    薬剤一部負担金
             MOVE     SKT1710TMP-K-YKZFTN(IDX1)     TO   WRK-Z7
             MOVE     WRK-Z7       TO   SKT1710-K-YKZFTN (IDX1)
      *    一部負担金
             MOVE     SKT1710TMP-K-ITBFTN(IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1710-K-ITBFTN (IDX1)
      *    食事療養：件数
             MOVE     SKT1710TMP-K-SKENSU(IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1710-K-SKENSU (IDX1)
      *    食事療養：日数
             MOVE     SKT1710TMP-K-SNISSU(IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1710-K-SNISSU (IDX1)
      *    食事療養：金額
             MOVE     SKT1710TMP-K-SKINGK(IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1710-K-SKINGK (IDX1)
      *    食事療養：標準負担額
             MOVE     SKT1710TMP-K-SFTNGK(IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1710-K-SFTNGK (IDX1)
           END-PERFORM
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
           MOVE   "SKT1710.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/10/09) start
      **=== 特別療養費の印刷タイトル変更 by Yoshikawa(2011/02/17) start
      **     MOVE    "国保請求書"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費の印刷タイトル変更 by Yoshikawa(2011/02/17) end
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
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/10/09) end
           MOVE    SKT1710             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.02) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *=== 県外用帳票追加 by Yoshikawa(2009/04/01) start
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（県外用二枚目）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1720
      *
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1720-SRYYM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1720-HOSPCD
      *
      *    ページ番号を設定
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT1720-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1720-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（県外用二枚目）
      *****************************************************************
       331-PRINT-OUT-SEC                SECTION.
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
           MOVE   "SKT1720.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/10/09) start
      **=== 特別療養費の印刷タイトル変更 by Yoshikawa(2011/02/17) start
      **     MOVE    "国保請求書"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費の印刷タイトル変更 by Yoshikawa(2011/02/17) end
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
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/10/09) end
           MOVE    SKT1720             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
                                       SPA-AREA
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
      *=== 県外用帳票追加 by Yoshikawa(2009/04/01) end
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
      *---(01.00.02) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA
                                       JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      *
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *             CALL    "MCPSUB"             USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU1710 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU1710 SEIKYU INVALID ***"
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
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                  RECE10-REC
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM         TO  RECE10-HOSPNUM
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
               MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                            RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE            TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"       TO  RECE10-XXEDHKNJANUM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) start
           IF  WRK-PARA-TOKUBETU  =  "2"
      *=== open-cobol1.0対応 by Yoshikawa(2011/02/17) start
      *       MOVE  "000000"             TO  RECE10-SRYYM
      *       MOVE  "999999"             TO  RECE10-XXSRYYM
             MOVE    000000             TO  RECE10-SRYYM
             MOVE    999999             TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2011/02/17) end
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/19) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
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
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/08/19) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/08/19) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           READ    SKT1710TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1710TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1710TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT1710TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
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
           MOVE    "DBSELECT"               TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_syskanri"       TO  MCP-TABLE
               MOVE    "key10"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"            TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
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
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) end
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
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
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/04/17) end
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2016/11/16) end
      *
      *---(01.00.02) LINE ADD END   ------------------------------------
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
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
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
