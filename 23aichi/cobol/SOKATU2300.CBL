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
       PROGRAM-ID.             SOKATU2300.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・診療報酬総括表(愛知)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/04/27    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    高嶋     06/07/12    返戻対応,その他
      *  01.00.02    内田     07/06/05    公費再掲欄は０９１も対象とする
      *  01.00.03    内田     07/08/22    日レセver4.0対応
      *                                   システム管理マスタ「1901」の
      *                                   医療機関情報を参照
      *  01.00.04    安藤   2008/04/29    帳票様式の変更に伴う修正
      *  01.00.05    内田     08/05/03    福祉欄に１８５、１８９該当者追加
      *  01.00.06    内田     08/06/20    公費高齢のみの場合でも印字する
      *  01.00.07    内田     08/08/13    福祉欄に１８８該当者追加
      *  01.00.08    吉川     09/10/07    福祉欄に１９１該当者追加
      *  01.00.09    吉川     09/11/06    １９１は福祉欄ではなく公費欄に集計
      *  01.00.10    吉川     09/11/19    公費欄は全国公費であれば集計
      *  01.00.11    吉川     10/04/05    オンライン返戻対応
      *  01.00.12    吉川     10/11/01    特別療養費国保対応
      *  01.00.13    吉川     10/11/25    open-cobol1.0対応
      *  01.00.14    吉川     13/01/10    プラグイン対応
      *                                   医療機関情報編集対応
      *  01.00.15    吉川     13/07/08    プログラムオプション対応
      *  01.00.16    吉川     14/08/12    返戻時、再印刷画面のタイトル修正
      *  01.00.17    吉川     14/10/23    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.18    門間     15/10/13    医療機関編集情報への開設者名追加対応
      *  01.00.19    吉川     15/11/02    公費欄に２９１を対象とする
      *  01.00.20    萩野     17/01/13    医療機関コード変更時、
      *                                   医療機関コード別の作成処理対応
      *  01.00.21    吉川     17/04/13    医療機関情報の取得の修正
      *  01.00.22    吉川     17/07/14    不要なDISPLAY文削除
      *****************************************************************
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT2300TMP-FILE ASSIGN    SKT2300TMP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT2300TMP-KEY
                                   FILE    STATUS  IS  STS-SKT2300.
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT2300TMP-FILE.
           COPY    "CPSKT2300TMP.INC".
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT2300TMP//.

006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.03) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT2300.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT2300         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT2300TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *---(01.00.04) LINE ADD START ------------------------------------
           03  FLG-KOUKI           PIC 9(01).
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
           03  IDX                 PIC 9(04).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *
      *##  パラメタ領域（地方公費仕様）
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.03) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.03) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      * ===返戻対応 (2006/07/12) Add By Takashima
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      **=== プラグイン対応 by Yoshikawa(2013/01/10) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU2300".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **=== プラグイン対応 by Yoshikawa(2013/01/10) end
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
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
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z11             PIC ZZZ,ZZZ,ZZZ.
           03  WRK-SHOKUJI         PIC 9(10).
      *
           03  WRK-RECEERR         PIC X(200). 
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/01/10) start
      *     03  FILE-NAME           PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/01/10) end
      *     
      *---(01.00.03) LINE ADD START ------------------------------------
      * ===返戻対応 (2006/07/12) Add By Takashima
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *---(01.00.04) LINE ADD START ------------------------------------
           03  WRK-PATH2               PIC X(50).
           03  WRK-HKNNUM              PIC X(03).
           03  WRK-KENNAME             PIC X(50).
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
           03  WRK-YUSEN           PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
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
      *---(01.00.03) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
      *
       01  SUM-AREA.
           03  SUM-KOHKENSU        PIC 9(10).
           03  SUM-FUKUKENSU       PIC 9(10).
           03  SUM-GKOHKENSU       PIC 9(10).
           03  SUM-GFUKUKENSU      PIC 9(10).
           03  SUM-GHKNKBN  OCCURS 4.
             05  SUM-GNYUGAIKBN  OCCURS 2.
               07  SUM-GKENSU  PIC  9(10).
               07  SUM-GNISSU  PIC  9(10).
               07  SUM-GTENSU  PIC  9(10).
               07  SUM-GSKJ    PIC  9(10).
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.03) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.03) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) end
      *
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
       01  PRTKANRI-REC.
           COPY    "CPPRTKANRI.INC".
      *
       01  PRTDATA-REC.
           COPY    "CPPRTDATA.INC".          
      * 
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *             UNTIL       FLG-END     =   1
      *---(01.00.06) LINE ADD END   ------------------------------------
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
           INITIALIZE                  SUM-AREA
      *---(01.00.04) LINE ADD START ------------------------------------
           INITIALIZE                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
           DISPLAY  "START"
      *
           PERFORM 100-DBOPEN-SEC
      *
      *###（地方公費仕様）
      * ===返戻対応 (2006/07/12) Add By Takashima
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
      *---(01.00.03) LINE ADD START ------------------------------------
                                               RECEERR
           END-UNSTRING
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU2300"    TO  JOB-PGID
           MOVE    "国保総括表"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *##（地方公費仕様：LNK-PRTKANRI-TERMID)
           MOVE    "SKT2300"           TO  SKT2300TMP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT2300TMP-TERMID
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT2300TMP-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           MOVE  SKT2300TMP-BASENAME     TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT2300TMP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
      *###（地方公費仕様)
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                                 TO  SYS-1001-STYUKYMD(1:6)
      *                                     SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1001-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) end
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                                 TO  SYS-1002-STYUKYMD(1:6)
      *                                     SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1002-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) end
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      *     PERFORM  110-INI-FILE-SEC
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
      ** ===返戻対応 (2006/07/12) Add By Takashima
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      **---(01.00.03) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.03) LINE ADD END   ------------------------------------
      **---(01.00.04) LINE ADD START ------------------------------------
      *             MOVE    "key65"                  TO  WRK-PATH2
      **---(01.00.04) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.03) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.03) LINE ADD END   ------------------------------------
      **---(01.00.04) LINE ADD START ------------------------------------
      *             MOVE    "key66"                  TO  WRK-PATH2
      **---(01.00.04) LINE ADD END   ------------------------------------
      *     END-EVALUATE
      ** ===返戻対応 (2006/07/12) Add By Takashima
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
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
      *  
           PERFORM 900-SEIKYU-SELECT-SEC 
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理 
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/01/10) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/01/10) end
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
           MOVE    "SOKATU2300"              TO  WRK-PRGID
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT2300TMP-FILE
           CLOSE            SKT2300TMP-FILE
           OPEN     I-O     SKT2300TMP-FILE
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE     ZERO    TO      FLG-END
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           PERFORM  900-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
           IF  WRK-PARA-TOKUBETU  =  "1"
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
             MOVE     ZERO    TO        FLG-END
             MOVE     1       TO        FLG-KOUKI
             MOVE    "039"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOKUHO-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
           ELSE
             MOVE     1       TO        FLG-KOUKI
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
             MOVE     ZERO    TO        FLG-END
             MOVE    "040"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOKUHO-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
           CLOSE   SKT2300TMP-FILE
           CLOSE   UPD-FILE
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
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           IF      CNT-RECE10          =   ZERO 
                   CONTINUE
           ELSE
                   IF      FLG-UPD     =   1
                           PERFORM     310-SEIKYU-UPD-SEC
                   END-IF
           END-IF
      *
           DISPLAY "*** SOKATU2300 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU2300 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *###（地方公費仕様）
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
           INITIALIZE       SKT2300TMP-REC
           INITIALIZE       SKT2300TMP-HKNJANUM
      *
           IF       RECE10-HKNJANUM(7:2)  =     SPACE
                MOVE    RECE10-HKNJANUM(1:6)    TO
                        SKT2300TMP-HKNJANUM(1:6)
           ELSE
                MOVE    RECE10-HKNJANUM(3:6)    TO
                        SKT2300TMP-HKNJANUM(1:6)
           END-IF
      *
      *    市長村合併対応(赤羽町は田原市に統合する。)
           IF  SKT2300TMP-HKNJANUM = '231076'
               MOVE  '231068'  TO  SKT2300TMP-HKNJANUM
           END-IF
      *
      *    名古屋市代表番号セット
           IF       SKT2300TMP-HKNJANUM(1:3)  =      "234"
                    MOVE   "234005"   TO    SKT2300TMP-HKNJANUM
           END-IF
      *
      *    出力順設定
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
      *     IF     YUSEN-HKNJANUM    =    SKT2300TMP-HKNJANUM
           IF      WRK-YUSEN       =   SKT2300TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
             MOVE        9          TO   SKT2300TMP-SYUTURYOKU
           ELSE
             IF     RECE10-PREFKBN  =    "2"
               MOVE      2          TO   SKT2300TMP-SYUTURYOKU
             ELSE
               IF   SKT2300TMP-HKNJANUM(3:1) = "3"
                 MOVE    3          TO   SKT2300TMP-SYUTURYOKU
               ELSE
                 IF    SKT2300TMP-HKNJANUM  =  "234005"
                   MOVE    4          TO   SKT2300TMP-SYUTURYOKU
                 ELSE
                   MOVE    5          TO   SKT2300TMP-SYUTURYOKU
                 END-IF
               END-IF
             END-IF
           END-IF
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           IF       FLG-KOUKI   =   1
               MOVE  RECE10-HKNJANUM-S(1:4)  TO  SKT2300TMP-HKNJANUM
               MOVE  6                       TO  SKT2300TMP-SYUTURYOKU
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
           PERFORM  900-SKYTMP-READ-SEC
      *
      *    公費負担分     
           IF      RECE10-KOHNUM (1)   NOT =   SPACE
             OR    RECE10-KOHNUM (2)   NOT =   SPACE
             OR    RECE10-KOHNUM (3)   NOT =   SPACE
             OR    RECE10-KOHNUM (4)   NOT =   SPACE
      *
             PERFORM  VARYING IDX2 FROM 1 BY 1
                       UNTIL  IDX2 > 4
                       OR     RECE10-KOHNUM (IDX2) = SPACE
      *=== 公費欄は全国公費であれば集計 by Yoshikawa(2009/11/19) start
      *         IF    RECE10-KOHNUM (IDX2)  =  "010"
      *           OR  RECE10-KOHNUM (IDX2)  =  "011"
      *           OR  RECE10-KOHNUM (IDX2)  =  "015"
      *           OR  RECE10-KOHNUM (IDX2)  =  "016"
      *           OR  RECE10-KOHNUM (IDX2)  =  "017"
      *           OR  RECE10-KOHNUM (IDX2)  =  "019"
      *           OR  RECE10-KOHNUM (IDX2)  =  "020"
      *           OR  RECE10-KOHNUM (IDX2)  =  "021"
      *           OR  RECE10-KOHNUM (IDX2)  =  "023"
      *           OR  RECE10-KOHNUM (IDX2)  =  "051"
      *           OR  RECE10-KOHNUM (IDX2)  =  "052"
      *           OR  RECE10-KOHNUM (IDX2)  =  "053"
      **---(01.00.02) LINE ADD START ------------------------------------
      *           OR  RECE10-KOHNUM (IDX2)  =  "091"
      **---(01.00.02) LINE ADD END   ------------------------------------
               IF    RECE10-KOHNUM (IDX2)(1:1)  =  "0"
      *=== 公費欄は全国公費であれば集計 by Yoshikawa(2009/11/19) end
      *=== 191は公費欄に集計 by Yoshikawa(2009/11/06) start
                 OR  RECE10-KOHNUM (IDX2)  =  "191"
      *=== 191は公費欄に集計 by Yoshikawa(2009/11/06) end
      *=== 291は公費欄に集計 by Yoshikawa(2015/11/02) start
                 OR  RECE10-KOHNUM (IDX2)  =  "291"
      *=== 291は公費欄に集計 by Yoshikawa(2015/11/02) end
      *
                 ADD   1  TO  SUM-GKOHKENSU
      *
               ELSE
                 IF    RECE10-KOHNUM (IDX2)  =  "141"
                   OR  RECE10-KOHNUM (IDX2)  =  "241"
                   OR  RECE10-KOHNUM (IDX2)  =  "341"
                   OR  RECE10-KOHNUM (IDX2)  =  "181"
                   OR  RECE10-KOHNUM (IDX2)  =  "281"
                   OR  RECE10-KOHNUM (IDX2)  =  "381"
                   OR  RECE10-KOHNUM (IDX2)  =  "481"
                   OR  RECE10-KOHNUM (IDX2)  =  "182"
                   OR  RECE10-KOHNUM (IDX2)  =  "282"
                   OR  RECE10-KOHNUM (IDX2)  =  "183"
                   OR  RECE10-KOHNUM (IDX2)  =  "283"
                   OR  RECE10-KOHNUM (IDX2)  =  "184"
                   OR  RECE10-KOHNUM (IDX2)  =  "284"
      *---(01.00.05) LINE ADD START ------------------------------------
                   OR  RECE10-KOHNUM (IDX2)  =  "185"
                   OR  RECE10-KOHNUM (IDX2)  =  "189"
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.07) LINE ADD START ------------------------------------
                   OR  RECE10-KOHNUM (IDX2)  =  "188"
      *---(01.00.07) LINE ADD END   ------------------------------------
      *=== 191は公費欄に集計 by Yoshikawa(2009/11/06) start
      **=== 対象公費(191)追加 by Yoshikawa(2009/10/07) start
      *             OR  RECE10-KOHNUM (IDX2)  =  "191"
      **=== 対象公費(191)追加 by Yoshikawa(2009/10/07) end
      *=== 191は公費欄に集計 by Yoshikawa(2009/11/06) end
      *
                   ADD   1  TO  SUM-GFUKUKENSU
      *
                 END-IF
               END-IF
             END-PERFORM
           END-IF
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき                
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *            PERFORM   900-SEIKYU-READ-SEC
               IF  FLG-KOUKI  =  ZERO
                  PERFORM   900-SEIKYU-READ-SEC
               ELSE
                  PERFORM   950-SEIKYU-READ-SEC
               END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
      *     IF  RECE10-HKNNUM  =  "060"
           IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
             MOVE     1      TO     IDX1
           ELSE
             MOVE     2      TO     IDX1
           END-IF
      *
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             MOVE     3      TO     IDX1
           END-IF
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           IF  FLG-KOUKI         NOT  =  ZERO
             MOVE     3      TO     IDX1
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           IF  RECE10-NYUGAIKBN = "1"
             ADD  1     TO  SKT2300TMP-KENSU (IDX1 1)
             ADD  RECE10-JNISSU (1)  
                        TO  SKT2300TMP-NISSU (IDX1 1)
             ADD  RECE10-TOTALTEN (1)  
                        TO  SKT2300TMP-TENSU (IDX1 1)
             ADD  RECE10-SHOKUJIRYOYOHI(1)  TO  SKT2300TMP-SKJ(IDX1 1)
           ELSE
             ADD  1     TO  SKT2300TMP-KENSU (IDX1 2)
             ADD  RECE10-JNISSU (1)  
                        TO  SKT2300TMP-NISSU (IDX1 2)
             ADD  RECE10-TOTALTEN (1)  
                        TO  SKT2300TMP-TENSU (IDX1 2)
             ADD  ZERO  TO  SKT2300TMP-SKJ   (IDX1 2)
           END-IF
      *  合計エリアに加算
           IF    RECE10-NYUGAIKBN  =  "1"
             MOVE    1    TO    IDX2
           ELSE
             MOVE    2    TO    IDX2
           END-IF
      *
           ADD       1                 TO    SUM-GKENSU(IDX1 IDX2)
      *
           ADD  RECE10-JNISSU(1)       TO    SUM-GNISSU(IDX1 IDX2)
      *
           ADD  RECE10-TOTALTEN(1)     TO    SUM-GTENSU(IDX1 IDX2)
      *
           IF    IDX2  =  1
             ADD    RECE10-SHOKUJIRYOYOHI(1) TO  SUM-GSKJ(IDX1 IDX2)
           END-IF
      *
           IF      FLG-SKT2300TMP   =          1
                   WRITE    SKT2300TMP-REC
           ELSE
                   REWRITE  SKT2300TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
      *
           .
      *
       210-HKN-SYUKEI-EXT.
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
           OPEN     INPUT       SKT2300TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           READ  SKT2300TMP-FILE   NEXT
             AT  END
              MOVE  1  TO  FLG-PRINT
           END-READ
      * 
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *    帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *    帳票編集<合計>処理
      *    合計は最初のページにのみ印字する
               IF    CNT-PAGE  =  1
                 PERFORM 330-GOKEI-HEN-SEC
               END-IF
      *    帳票印刷処理
               PERFORM 390-PRINT-OUT-SEC
           END-PERFORM
      *
           CLOSE    SKT2300TMP-FILE
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
           ADD     1                   TO  CNT-PAGE
      *
           INITIALIZE                      SKT2300
      *
           MOVE    WRK-SRYYMWH         TO  SKT2300-SEIYM1
      *
           MOVE    WRK-SRYYMWH         TO  SKT2300-SEIYM2
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN    TO  SKT2300-HOSPCDN
      *---(01.00.03) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS       TO  SKT2300-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME   TO  SKT2300-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS        TO  SKT2300-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SKT2300-ADRS        REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *    医療機関名
           MOVE    WRK-HOSPNAME        TO  SKT2300-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SKT2300-HOSPNAME    REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) start
      *     MOVE    SYS-1001-KAISETUNAME
      *                                 TO  SKT2300-KAISETUNAME
           MOVE    WRK-KAISETUNAME     TO  SKT2300-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) end
      *
           MOVE    WRK-SEIYMDWH        TO  SKT2300-PRTYMD
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"        TO  SKT2300-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
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
                   UNTIL IDX1      >  8
                   OR    FLG-PRINT =  1
      *保険者名
             MOVE    SPACE               TO  HKNJAINF-REC
             INITIALIZE                      HKNJAINF-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE    SYS-1001-HOSPID     TO  HKNJA-HOSPID
             MOVE    SPA-HOSPNUM         TO  HKNJA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
             DISPLAY "SKT2300TMP-HKNJANUM****"SKT2300TMP-HKNJANUM
      *---(01.00.04) LINE ADD START ------------------------------------
             IF  SKT2300TMP-SYUTURYOKU  =  6
               PERFORM  3201-KENNAME-SET-SEC
             ELSE
      *---(01.00.04) LINE ADD END   ------------------------------------
               MOVE    SKT2300TMP-HKNJANUM TO  HKNJA-HKNJANUM
               MOVE    HKNJAINF-REC        TO  MCPDATA-REC
               PERFORM 900-HKNJAINF-INV-SEC
               IF      FLG-HKNJAINF        =   ZERO
                 MOVE    HKNJA-HKNJANAME  TO  SKT2300-HKNJANAME (IDX1)
               ELSE
                 MOVE    SPACE   TO  SKT2300-HKNJANAME (IDX1)
               END-IF
      *---(01.00.04) LINE ADD START ------------------------------------
             END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
             DISPLAY "保険者名" SKT2300-HKNJANAME (IDX1)
      *
             PERFORM VARYING IDX2 FROM 1 BY 1 UNTIL IDX2 > 3
               PERFORM VARYING IDX3 FROM 1 BY 1 UNTIL IDX3 > 2
      *件数
                 MOVE  SKT2300TMP-KENSU (IDX2 IDX3)  
                                 TO  WRK-Z5
                 MOVE  WRK-Z5    TO  SKT2300-KENSU (IDX1 IDX2 IDX3)
      *実日数
                 MOVE  SKT2300TMP-NISSU (IDX2 IDX3)  
                                 TO  WRK-Z5
                 MOVE  WRK-Z5    TO  SKT2300-NISSU (IDX1 IDX2 IDX3)
      *点数
                 MOVE  SKT2300TMP-TENSU (IDX2 IDX3)  
                                 TO  WRK-Z10
                 MOVE  WRK-Z10   TO  SKT2300-TENSU (IDX1 IDX2 IDX3)
               END-PERFORM
             END-PERFORM
      *
             PERFORM VARYING IDX2 FROM 1 BY 1 UNTIL IDX2 > 2
               COMPUTE WRK-SHOKUJI   =  SKT2300TMP-SKJ(1 IDX2)
                                     +  SKT2300TMP-SKJ(2 IDX2)
                                     +  SKT2300TMP-SKJ(3 IDX2)
               MOVE  WRK-SHOKUJI     TO WRK-Z10
               MOVE  WRK-Z10     TO  SKT2300-SKJ (IDX1 IDX2)
             END-PERFORM
      *
      *総括表一時ファイル読込
             READ  SKT2300TMP-FILE   NEXT
               AT  END
                MOVE  1  TO  FLG-PRINT
             END-READ
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    都道府県
      *****************************************************************
       3201-KENNAME-SET-SEC  SECTION.
      *
           EVALUATE  SKT2300TMP-HKNJANUM(3:2)
             WHEN  "01"  MOVE  "北海道"    TO  WRK-KENNAME
             WHEN  "02"  MOVE  "青森県"    TO  WRK-KENNAME
             WHEN  "03"  MOVE  "岩手県"    TO  WRK-KENNAME
             WHEN  "04"  MOVE  "宮城県"    TO  WRK-KENNAME
             WHEN  "05"  MOVE  "秋田県"    TO  WRK-KENNAME
             WHEN  "06"  MOVE  "山形県"    TO  WRK-KENNAME
             WHEN  "07"  MOVE  "福島県"    TO  WRK-KENNAME
             WHEN  "08"  MOVE  "茨城県"    TO  WRK-KENNAME
             WHEN  "09"  MOVE  "栃木県"    TO  WRK-KENNAME
             WHEN  "10"  MOVE  "群馬県"    TO  WRK-KENNAME
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
             WHEN  "23"  MOVE  "愛知県"    TO  WRK-KENNAME
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
           STRING  WRK-KENNAME  DELIMITED  BY  SPACE
                   "広域連合"   DELIMITED  BY  SIZE
                   INTO         SKT2300-HKNJANAME (IDX1)
           END-STRING
           .
      *
       3201-KENNAME-SET-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    帳票編集<合計行>処理
      *****************************************************************
       330-GOKEI-HEN-SEC                SECTION.
      *
           PERFORM VARYING IDX1 FROM 1 BY 1 UNTIL IDX1  >  3
             PERFORM VARYING IDX2 FROM 1 BY 1 UNTIL IDX2  >  2
      *件数
               MOVE  SUM-GKENSU (IDX1 IDX2)  
                              TO  WRK-Z7
               MOVE  WRK-Z7   TO  SKT2300-GKENSU (IDX1 IDX2)
      *実日数
               MOVE  SUM-GNISSU (IDX1 IDX2)  
                              TO  WRK-Z7
               MOVE  WRK-Z7   TO  SKT2300-GNISSU (IDX1 IDX2)
      *点数
               MOVE  SUM-GTENSU (IDX1 IDX2)  
                              TO  WRK-Z10
               MOVE  WRK-Z10  TO  SKT2300-GTENSU (IDX1 IDX2)
      *食事療養
               MOVE  SUM-GSKJ   (IDX1 IDX2)  
                              TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2300-GSKJ   (IDX1 IDX2)
      *--集計--
      *件数
               ADD  SUM-GKENSU (IDX1 IDX2)  TO  SUM-GKENSU (4 IDX2)
      *実日数
               ADD  SUM-GNISSU (IDX1 IDX2)  TO  SUM-GNISSU (4 IDX2)
      *点数
               ADD  SUM-GTENSU (IDX1 IDX2)  TO  SUM-GTENSU (4 IDX2)
      *食事療養
               ADD  SUM-GSKJ   (IDX1 IDX2)  TO  SUM-GSKJ   (4 IDX2)
             END-PERFORM
           END-PERFORM
      *
           PERFORM VARYING IDX1 FROM 1 BY 1 UNTIL IDX1  >  2
      *件数
             MOVE  SUM-GKENSU (4 IDX1)  TO  WRK-Z7
             MOVE  WRK-Z7               TO  SKT2300-GKENSU (4 IDX1)
      *実日数
             MOVE  SUM-GNISSU (4 IDX1)  TO  WRK-Z7 
             MOVE  WRK-Z7               TO  SKT2300-GNISSU (4 IDX1)
      *点数
             MOVE  SUM-GTENSU (4 IDX1)  TO  WRK-Z10
             MOVE  WRK-Z10              TO  SKT2300-GTENSU (4 IDX1)
      *食事療養
             MOVE  SUM-GSKJ   (4 IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9               TO  SKT2300-GSKJ   (4 IDX1)
           END-PERFORM
      *
      *公費件数
           MOVE  SUM-GKOHKENSU   TO  WRK-Z11
           MOVE  WRK-Z11        TO  SKT2300-GKOHKENSU
                                    SKT2300-KOHKENSU
      *福祉件数
           MOVE  SUM-GFUKUKENSU  TO  WRK-Z11
           MOVE  WRK-Z11        TO  SKT2300-GFUKUKENSU
                                    SKT2300-FUKUKENSU
           .
       330-GOKEI-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       390-PRINT-OUT-SEC                SECTION.
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
           MOVE   "SKT2300.red"            TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/08/12) start
      **=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
      **     MOVE    "国保総括表"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保総括表"               TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保総括表 [特別療養費]"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
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
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/08/12) end
           MOVE    SKT2300             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.03) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       390-PRINT-OUT-EXT.
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
      *---(01.00.03) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU2300 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU2300 SEIKYU INVALID ***"
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO  RECE10-HOSPID.
           MOVE   SPA-HOSPNUM           TO  RECE10-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO  RECE10-SKYYM.
           MOVE    SPACE                TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"           TO  RECE10-XXEDHKNJANUM
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) start
           IF  WRK-PARA-TOKUBETU  =  "2"
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/24) start
      *       MOVE  "000000"             TO  RECE10-SRYYM
      *       MOVE  "999999"             TO  RECE10-XXSRYYM
             MOVE  000000               TO  RECE10-SRYYM
             MOVE  999999               TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/24) end
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/11/01) end
      *
      * ===返戻対応に伴う追加 (2006/07/12) Add By Takashima
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
             EVALUATE  WRK-PARA-HKNJANUM(1:3)
             WHEN "234"
               MOVE  "234000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "234999"          TO  RECE10-XXEDHKNJANUM
             WHEN OTHER
               MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                            RECE10-XXEDHKNJANUM
             END-EVALUATE
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *
           MOVE    RECE10-REC                 TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      * ===返戻対応 (2006/07/12) Update By Takashima
      *    MOVE    PATH-TBL-SEIKYU-KEY4       TO  MCP-PATH
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH                   TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      * ===返戻対応 (2006/07/12) Update By Takashima
      *    MOVE    PATH-TBL-SEIKYU-KEY4       TO  MCP-PATH
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH                   TO  MCP-PATH
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
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *****************************************************************
      *    請求管理読込（後期高齢）
      *****************************************************************
       950-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE         RECE10-REC.
           MOVE   SPA-HOSPNUM             TO  RECE10-HOSPNUM
           MOVE   LNK-PRTKANRI-SRYYM      TO  RECE10-SKYYM
           MOVE   WRK-CONS-SRYYM-200804   TO  RECE10-SRYYM
           MOVE   999999                  TO  RECE10-XXSRYYM
           MOVE   WRK-HKNNUM              TO  RECE10-HKNNUM-S
                                              RECE10-HKNNUM
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
               MOVE    WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                              RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE              TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"         TO  RECE10-XXEDHKNJANUM
           END-IF
      *
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH2               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               PERFORM 950-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
               DISPLAY "SELECT ERR"
           END-IF
           .
      *
       950-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求マスター読込（後期高齢）
      *****************************************************************
       950-SEIKYU-READ-SEC           SECTION.
      *
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH2           TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  950-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF   
      *         
               ADD     1                   TO  CNT-RECE10   
           ELSE
               MOVE    1               TO  FLG-END
           END-IF
           .
      *
       950-SEIKYU-READ-EXT.
           EXIT.
      *****************************************************************
      *    請求管理クローズ
      *****************************************************************
       900-SEIKYU-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           .
       900-SEIKYU-CLOSE-EXT.
           EXIT.
      *****************************************************************
      *    請求管理クローズ
      *****************************************************************
       950-SEIKYU-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH2            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           .
       900-SEIKYU-CLOSE-EXT.
           EXIT.
      *---(01.00.04) LINE ADD END   ------------------------------------
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       900-SKYTMP-READ-SEC             SECTION.
      *
           READ    SKT2300TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT2300TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT2300TMP
           END-READ
           .
       900-SKYTMP-READ-EXT.
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
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    管理マスター読込（キー）
      *****************************************************************
       900-HKNJAINF-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hknjainf"         TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hknjainf"          TO  MCP-TABLE
               MOVE    "key"                   TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"             USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hknjainf"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       900-HKNJAINF-INV-EXT.
           EXIT.
      *---(01.00.03) LINE ADD START ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1900-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1900-STYUKYMD(1:6)
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) end
                                               SYS-1900-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
                                               SYS-1900-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) end
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1901-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1901-STYUKYMD(1:6)
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) end
                                               SYS-1901-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
                                           SYS-1901-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1902-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1902-STYUKYMD(1:6)
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) end
                                               SYS-1902-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
                                           SYS-1902-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
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
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) start
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
      *     MOVE    "01"                TO  SYS-1903-STYUKYMD (7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1903-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
      *=== 医療機関情報の取得の修正 by Yoshikawa(2017/04/13) end
           END-IF
           MOVE    "01"                TO  SYS-1903-STYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/01/13) end
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2015/10/13) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/07/08) end
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           .                             
       900-DBCLOSE-EXT.
           EXIT.
