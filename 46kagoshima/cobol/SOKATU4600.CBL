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
       PROGRAM-ID.             SOKATU4600.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 鹿児島・医科診療報酬総括票
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/07/27    有村          再作成(2.5.0)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    内田    06/11/23    食事がない場合でも生活療養費を印字
      *  01.00.02    内田    06/12/14    帳票様式の変更に伴う修正
      *  01.00.03    内田    07/09/14    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *                                  返戻対応
      *  01.00.04    内田    07/11/07    「第三件数」を印字する
      *  01.00.05    伊藤    08/04/24    帳票様式に伴う修正
      *  01.00.06    内田    08/06/20    国保がない場合でも印字する
      *                                  返戻分は合算する
      *  01.00.07    内田    08/07/18    在総診分を明細書枚数欄に集計する
      *  01.00.08    門間    08/12/16    シス管「2007」公費まとめ対応
      *  01.00.09    吉川    09/02/06    斜線部分の一部負担金は印字しない
      *  01.00.10    吉川    09/04/17    返戻分は分けて印字する
      *  01.00.11    吉川    09/07/01    入院の場合は斜線部分の
      *                                  一部負担金を印字する
      *  01.00.12    吉川    10/01/07    シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *  01.00.13    吉川    10/06/01    オンライン返戻対応
      *  01.00.14    吉川    10/12/07    open-cobol1.0対応
      *  01.00.15    吉川    11/03/04    特別療養費国保対応
      *  01.00.16    吉川    12/01/16    点数欄は一千万の位まで印字する
      *  01.00.17    吉川    12/06/15    在宅はまとめて集計するように修正
      *  01.00.18    吉川    13/02/12    プラグイン対応
      *                                  医療機関情報編集対応
      *  01.00.19    吉川    13/09/02    プログラムオプション対応
      *  01.00.20    吉川    14/10/28    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.21    吉川    15/10/05    返戻時、再印刷画面のタイトル修正
      *                                  医療機関編集情報への開設者名
      *                                  追加対応
      *  01.00.22    門間    16/12/14    公費番号まとめ情報の公費番号の追加
      *                                  医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.23    門間    17/03/08    医療機関情報取得時の修正
      *  01.00.24    門間    17/11/06    SITEKBN変更（動作に変更なし）
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    総括表一時ファイル  
           SELECT  SKT4600TMP-FILE ASSIGN    SKT4600TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4600TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4600.
      *    請求書一時ファイル(請求書枚数計算用)
           SELECT  SKT4610TMP-FILE ASSIGN    SKT4610TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4610TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4610.
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
      *     SELECT  SRYKA-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-SRYKA.
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end  
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    総括表一時ファイル  
       FD  SKT4600TMP-FILE.
           COPY    "CPSKT4600TMP.INC".
      *    請求書一時ファイル  
       FD  SKT4610TMP-FILE.
           COPY    "CPSKT4610TMP.INC".
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
      **    診療科CDファイル
      * FD  SRYKA-FILE.
      * 01  SRYKA-REC.
      *     03  SRYKA-SRYKANAME           PIC X(30).
      *     03  FILLER                    PIC X(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    総括表一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4600TP//.
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4610TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/28) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/28) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.03) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/28) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/28) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT4600.INC".
           COPY    "SKT4601.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT4600         PIC X(02).
           03  STS-SKT4610         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
           03  STS-SRYKA           PIC X(02).
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT4600TMP      PIC 9(01).
           03  FLG-SKT4610TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  FLG-KOUKI           PIC 9(01).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDX-MAX             PIC 9(04).
      *--- (2008/12/16) line add start monma ---------------------------
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *--- (2008/12/16) line add end   monma ---------------------------
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
           03  IDX                 PIC 9(05).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
      *=== 公費番号まとめ追加 by Monma(2016/12/14) start
           03  IDZ                 PIC 9(04).
      *=== 公費番号まとめ追加 by Monma(2016/12/14) end
      *
      *##  パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.03) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *---(01.00.03) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
      **=== プラグイン対応 by Yoshikawa(2013/02/12) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU4600".
      *     03  FILLER              PIC X(09)  VALUE "SRYKA.INI".
      **=== プラグイン対応 by Yoshikawa(2013/02/12) end
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/02/12) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/02/12) end
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  WRK-PATH2               PIC X(50).
           03  WRK-HKNNUM              PIC X(03).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *--- (2008/12/16) line add start monma ---------------------------
           03  WRK-KOHNAME         PIC X(10).
      *--- (2008/12/16) line add end   monma ---------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
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
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) start
           03  WRK-KAISETUNAME     PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) end
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT             PIC 9(02).
           03  WRK-CNT2            PIC 9(02).
           03  WRK-KEISAN          PIC 9(04).
           03  WRK-AMARI           PIC 9(04).
           03  WRK-KOHNUM          PIC X(03).
           03  WRK-HKNJANUM        PIC X(06).
      *
           03  WRK-CHK-HKNJA-TBL  OCCURS 100.
               05  WRK-CHK-HKNJANUM  PIC X(06).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  WRK-CHK-KHKNJA-TBL  OCCURS 50.
               05  WRK-CHK-KHKNJANUM  PIC X(04).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  WRK-SRYKANAME       PIC X(30) OCCURS 4.
      *
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z6              PIC ZZ,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z11             PIC ZZZ,ZZZ,ZZZ.
           03  WRK-Z13             PIC Z,ZZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *--- (2008/12/16) line add start monma ---------------------------
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
      *=== 公費番号まとめ追加 by Monma(2016/12/14) start
      *                             PIC X(03)   OCCURS  10.
                                   PIC X(03)   OCCURS  30.
      *=== 公費番号まとめ追加 by Monma(2016/12/14) end
           03  WRK-2007-MAX        PIC 9(03).
      *--- (2008/12/16) line add end   monma ---------------------------
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
           03  CNT-KOH             PIC 9(03).
           03  CNT-SEIKYU          PIC 9(04) OCCURS 2.
      *---(01.00.05) LINE ADD START ------------------------------------
           03  CNT-SEIKYUK         PIC 9(04) OCCURS 2.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
       01  SORT-AREA.
           03  SORT-KOH-TBL  OCCURS 20.
               05  SORT-KOHNUM                PIC  X(03).
      *--- (2008/12/16) line add start monma ---------------------------
               05  SORT-KOHNAME               PIC  X(10).
      *--- (2008/12/16) line add end   monma ---------------------------
               05  SORT-KOH-NYUGAI-TBL OCCURS 2.
                   07  SORT-K-KENSU           PIC  9(06).
                   07  SORT-K-TENSU           PIC  9(10).
                   07  SORT-K-YKZFTN          PIC  9(10).
                   07  SORT-K-ITBFTN          PIC  9(10).
               05  SORT-K-SKENSU              PIC  9(06).
               05  SORT-K-SKINGK              PIC  9(10).
               05  SORT-K-SFTNGK              PIC  9(10).
       01  SORT-AREA2.
           03  SORT-KOH-TBL2 OCCURS 20.
               05  SORT-ZKOHNUM               PIC  X(03).
               05  SORT-ZK-KENSU              PIC  9(06).
               05  SORT-ZK-ITBFTN             PIC  9(10).
      *     
      *---(01.00.03) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *    診療科名称情報
           COPY    "CPSK1005.INC".
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
      *
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) end
      *
      *--- (2008/12/16) line add start monma ---------------------------
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *--- (2008/12/16) line add end   monma --------------------------
      *
      *    請求管理
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      * 
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
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
      *=== ver4.8対応 by Yoshikawa(2014/10/28) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/28) end
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
           INITIALIZE                  IDX-AREA
      *---(01.00.05) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/28) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/28) end
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
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
      *---(01.00.03) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
      *                                         WRK-PARA-HKNJANUM
                                               WRK-PARA-HOSPNUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
                                               RECEERR
      *---(01.00.03) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU4600"    TO  JOB-PGID
           MOVE    "国保総括票"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/28) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/28) end
           MOVE    "SKT4600"           TO  SKT4600TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4600TP-TERMID
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4600TP-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           MOVE    "SKT4610"           TO  SKT4610TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4610TP-TERMID
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4610TP-HOSPNUM
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
      *=== ver4.8対応 by Yoshikawa(2014/10/28) start
           MOVE  SKT4600TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  SKT4610TP-BASENAME      TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (3)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (4)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT4600TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  SKT4610TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (4)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/28) end
      *
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
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                                 TO  SYS-1001-STYUKYMD(1:6)
      *                                     SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1001-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) end
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                                 TO  SYS-1002-STYUKYMD(1:6)
      *                                     SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1002-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) end
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
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
      *--- (2008/12/16) line add start monma ---------------------------
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
               MOVE    "tbl_syskanri"  TO  MCP-TABLE
               MOVE    "key2"          TO  MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    ZERO            TO  IDX1
           PERFORM         UNTIL   FLG-SYSKANRI   =   1
                           OR      IDX1           >=  100
               MOVE    MCPDATA-REC         TO  SYS-2007-REC
      *
               ADD     1                   TO  IDX1
               MOVE    SYS-2007-MEISYO(1) TO  WRK-2007-MEISYO(IDX1)
      *=== 公費番号まとめ追加 by Monma(2016/12/14) start
               MOVE    ZERO               TO  IDZ
      *=== 公費番号まとめ追加 by Monma(2016/12/14) end
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       10
                       OR      SYS-2007-KOHNUM (IDX2)   =   SPACE
      *=== 公費番号まとめ追加 by Monma(2016/12/14) start
      *             MOVE    SYS-2007-KOHNUM (IDX2)
      *                                     TO WRK-2007-KOHNUM(IDX1 IDX2)
                    ADD     1              TO  IDZ
                    MOVE    SYS-2007-KOHNUM (IDX2)
                                           TO  WRK-2007-KOHNUM(IDX1 IDZ)
               END-PERFORM
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       20
                       OR      SYS-2007-KOHNUM1(IDX2)   =   SPACE
                   ADD     1               TO  IDZ
                   MOVE    SYS-2007-KOHNUM1(IDX2)
                                           TO  WRK-2007-KOHNUM(IDX1 IDZ)
      *=== 公費番号まとめ追加 by Monma(2016/12/14) end
               END-PERFORM
      *
               MOVE    "tbl_syskanri"      TO  MCP-TABLE
               MOVE    "key2"              TO  MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           END-PERFORM
      *
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    IDX1                    TO  WRK-2007-MAX
      *--- (2008/12/16) line add end   monma ---------------------------
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
      *     PERFORM  110-INI-FILE-SEC
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      **---(01.00.03) LINE ADD START ------------------------------------
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    "key65"     TO  WRK-PATH2
      **---(01.00.05) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    "key66"     TO  WRK-PATH2
      **---(01.00.05) LINE ADD END   ------------------------------------
      *     END-EVALUATE
      *---(01.00.03) LINE ADD END   ------------------------------------
      *=== 返戻分は分けて印字する by Yoshikawa(2009/04/17) start
      *      MOVE    "key4"              TO  WRK-PATH
      *      MOVE    "key65"             TO  WRK-PATH2
      **---(01.00.06) LINE ADD END   ------------------------------------
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      *             MOVE    "key37"      TO  WRK-PATH
      *             MOVE    "key65"      TO  WRK-PATH2
      *         WHEN    "1"
      *             MOVE    "key38"      TO  WRK-PATH
      *             MOVE    "key66"      TO  WRK-PATH2
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
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *=== 返戻分は分けて印字する by Yoshikawa(2009/04/17) end
      *
           OPEN    OUTPUT  UPD-FILE
      *
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
      ******************************************************************
      **    INIファイル読み込み処理  
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **    診療科名取得
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/02/12) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/SRYKA.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/02/12) end
      **
      *     DISPLAY "ファイル名="  FILE-NAME
      **
      *     INITIALIZE   SRYKA-REC
      **
      *     OPEN  INPUT  SRYKA-FILE
      **
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >     4
      *       READ SRYKA-FILE
      *         AT END
      *           INITIALIZE        SRYKA-REC
      *       END-READ
      **
      *       DISPLAY "診療科名取得=" SRYKA-SRYKANAME
      *       IF    SRYKA-SRYKANAME(1:2)  =  "※"
      *         MOVE   SPACE             TO  WRK-SRYKANAME(IDX1)
      *       ELSE
      *         MOVE   SRYKA-SRYKANAME   TO  WRK-SRYKANAME(IDX1)
      *       END-IF
      *     END-PERFORM
      **
      **
      *     .
      * 110-INI-FILE-EXT.
      *     EXIT.
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SOKATU4600"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    診療科
           MOVE    "SRYKA"                   TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  4
             IF  WRK-OPTION(IDX)(1:2)  =  "※"
               MOVE    SPACE                 TO  WRK-SRYKANAME(IDX)
             ELSE
               MOVE    WRK-OPTION(IDX)(1:30) TO  WRK-SRYKANAME(IDX)
             END-IF
           END-PERFORM
           DISPLAY "診療科１="  WRK-SRYKANAME(1)
           DISPLAY "診療科２="  WRK-SRYKANAME(2)
           DISPLAY "診療科３="  WRK-SRYKANAME(3)
           DISPLAY "診療科４="  WRK-SRYKANAME(4)
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN    OUTPUT  SKT4600TMP-FILE
           CLOSE           SKT4600TMP-FILE
           OPEN    I-O     SKT4600TMP-FILE
           OPEN    OUTPUT  SKT4610TMP-FILE
           CLOSE           SKT4610TMP-FILE
           OPEN    I-O     SKT4610TMP-FILE
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    ZERO    TO  FLG-END
      *                         FLG-UPD
           MOVE    ZERO    TO  FLG-UPD
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           PERFORM 2001-KOKUHO-SYUKEI-SEC
                   UNTIL   FLG-END     =   1
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           PERFORM  900-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
           IF  WRK-PARA-TOKUBETU  =  "1"
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
             MOVE     ZERO    TO        FLG-END
             MOVE     1       TO        FLG-KOUKI
             MOVE    "039"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOKUHO-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
           ELSE
             MOVE     1       TO        FLG-KOUKI
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
             MOVE     ZERO    TO        FLG-END
             MOVE    "040"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOKUHO-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 返戻分は分けて印字する by Yoshikawa(2009/04/17) start
      **---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    "key66"  TO        WRK-PATH2
      *     MOVE     ZERO    TO        FLG-END
      *     MOVE    "039"    TO        WRK-HKNNUM
      *     PERFORM  950-SEIKYU-SELECT-SEC
      *     PERFORM  2001-KOKUHO-SYUKEI-SEC
      *              UNTIL   FLG-END   =   1
      *     PERFORM  950-SEIKYU-CLOSE-SEC
      *     MOVE     ZERO    TO        FLG-END
      *     MOVE    "040"    TO        WRK-HKNNUM
      *     PERFORM  950-SEIKYU-SELECT-SEC
      *     PERFORM  2001-KOKUHO-SYUKEI-SEC
      *              UNTIL   FLG-END   =   1
      *     PERFORM  950-SEIKYU-CLOSE-SEC
      **---(01.00.06) LINE ADD END   ------------------------------------
      *=== 返戻分は分けて印字する by Yoshikawa(2009/04/17) end
           CLOSE   UPD-FILE
           CLOSE   SKT4600TMP-FILE
           CLOSE   SKT4610TMP-FILE
      *
           IF      FLG-UPD     =   1
               PERFORM 2002-PRINT-SEC
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
           DISPLAY "*** SOKATU4600 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU4600 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
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
           INITIALIZE       SKT4600TMP-REC
      *
           IF      RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO     WRK-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO     WRK-HKNJANUM(1:6)
           END-IF
           MOVE    RECE10-HKNJANUM-S   TO  WRK-HKNJANUM
      *
      *    県内市町村と、県外＋国保組合(県内含む)に分類
           IF      RECE10-PREFKBN          =   "1"
           AND     WRK-HKNJANUM(3:1)   NOT =   "3"
               MOVE    "1"     TO  SKT4600TMP-PREFKBN
           ELSE
               MOVE    "2"     TO  SKT4600TMP-PREFKBN
           END-IF
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     PERFORM  210-HKN-SYUKEI-SEC
           IF  FLG-KOUKI  =  ZERO
               PERFORM  210-HKN-SYUKEI-SEC
           ELSE
               PERFORM  220-KOUKI-SYUKEI-SEC
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    請求書枚数計算用ファイル編集
           PERFORM  211-SEIKYUSYO-HENSYU-SEC
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *         PERFORM 900-SEIKYU-READ-SEC
               IF  FLG-KOUKI  =  ZERO
                  PERFORM   900-SEIKYU-READ-SEC
               ELSE
                  PERFORM   950-SEIKYU-READ-SEC
               END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           IF      RECE10-NYUGAIKBN    =   "1"
               MOVE    1       TO  IDX2
           ELSE
               MOVE    2       TO  IDX2
           END-IF
      *
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
      *---(01.00.05) LINE ADD START ------------------------------------
      *         IF      RECE10-KYURATE  =   9
      *             MOVE    10      TO  IDX1
      *         ELSE
      *             MOVE    11      TO  IDX1
      *         END-IF
               IF      RECE10-KYURATE  =   7
                   MOVE    11      TO  IDX1
               ELSE
                   MOVE    10      TO  IDX1
               END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           ELSE
      *    一般国保か
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
      *         IF      RECE10-HKNNUM   =   "060"
               IF      RECE10-HKNNUM   =   "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
                   IF      RECE10-AGE  >=  70
      *---(01.00.05) LINE ADD START ------------------------------------
      *                 IF      RECE10-KYURATE  =   9
      *                     MOVE    1       TO  IDX1
      *                 ELSE
      *                     MOVE    2       TO  IDX1
      *                 END-IF
                       IF      RECE10-KYURATE  =   7
                           MOVE    2       TO  IDX1
                       ELSE
                           MOVE    1       TO  IDX1
                       END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
                   ELSE
      *---(01.00.05) LINE ADD START ------------------------------------
      *                 IF      RECE10-AGE  >=  3
      *                     MOVE    3       TO  IDX1
      *                 ELSE
      *                     MOVE    4       TO  IDX1
      *                 END-IF
                       IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                       AND  (RECE10-FLG (1)   =  1)
                           MOVE    4       TO  IDX1
                       ELSE
                         IF      RECE10-AGE  >=  3
                             MOVE    3       TO  IDX1
                         ELSE
                             MOVE    4       TO  IDX1
                         END-IF
                       END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
                   END-IF
      *
               ELSE
                   IF      RECE10-AGE  >=  70
      *---(01.00.05) LINE ADD START ------------------------------------
      *                 IF      RECE10-KYURATE  =   9
      *                     MOVE    6       TO  IDX1
      *                 ELSE
      *                     MOVE    7       TO  IDX1
      *                 END-IF
                       IF      RECE10-KYURATE  =   7
                           MOVE    7       TO  IDX1
                       ELSE
                           MOVE    6       TO  IDX1
                       END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
                   ELSE
                       IF      RECE10-HONKZKKBN    =   "1"
                           MOVE    5       TO  IDX1
                       ELSE
      *---(01.00.05) LINE ADD START ------------------------------------
      *                     IF      RECE10-AGE  <   3
      *                         MOVE    9       TO  IDX1
      *                     ELSE
      *                         MOVE    8       TO  IDX1
      *                     END-IF
                       IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                       AND  (RECE10-FLG (1)   =  1)
                           MOVE    9       TO  IDX1
                       ELSE
                           IF      RECE10-AGE  <   3
                               MOVE    9       TO  IDX1
                           ELSE
                               MOVE    8       TO  IDX1
                           END-IF
                       END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
                       END-IF
                   END-IF
               END-IF
           END-IF
      *
      *=== 在宅はまとめて集計 by Yoshikawa(2012/06/15) start
      *     IF      RECE10-ZAITAKU  =   "1"
      *         EVALUATE  IDX1
      *             WHEN 1
      *                 MOVE    1       TO  IDX1
      *             WHEN 2
      *                 MOVE    2       TO  IDX1
      *             WHEN 6
      *                 MOVE    3       TO  IDX1
      *             WHEN 7
      *                 MOVE    4       TO  IDX1
      *             WHEN 10
      *                 MOVE    5       TO  IDX1
      *             WHEN OTHER
      *                 MOVE    6       TO  IDX1
      *         END-EVALUATE
      **
      **        保険分集計(在宅)
      *         PERFORM  2101-ZSYUKEI-SEC
      **
      **        公費負担分(在宅)
      *         IF      RECE10-KOHNUM(1)    NOT =   SPACE
      *             PERFORM 220-ZKOH-SYUKEI-SEC
      *         END-IF
      *     ELSE
      *=== 在宅はまとめて集計 by Yoshikawa(2012/06/15) start
      *
      *        保険分集計
               PERFORM  2101-SYUKEI-SEC
      *
      *        公費負担分
               IF      RECE10-KOHNUM(1)    NOT =   SPACE
                   PERFORM 220-KOH-SYUKEI-SEC
               END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/06/15) start
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/06/15) end
      *
      *    長期判定
           IF      RECE10-ETC-KOHNUM(1)    =   "972"
           OR      RECE10-ETC-KOHNUM(2)    =   "972"
           OR      RECE10-ETC-KOHNUM(3)    =   "972"
           OR      RECE10-ETC-KOHNUM(4)    =   "972"
               ADD     1       TO  SKT4600TMP-TYOKI
           END-IF
      *---(01.00.02) LINE ADD START ------------------------------------
      *    上位長期判定
           IF      RECE10-ETC-KOHNUM(1)    =   "974"
           OR      RECE10-ETC-KOHNUM(2)    =   "974"
           OR      RECE10-ETC-KOHNUM(3)    =   "974"
           OR      RECE10-ETC-KOHNUM(4)    =   "974"
               ADD     1       TO  SKT4600TMP-TYOKI2
           END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    第三件数
           IF  RECE10-TOKKI(1)  =  "10"
           OR  RECE10-TOKKI(2)  =  "10"
           OR  RECE10-TOKKI(3)  =  "10"
           OR  RECE10-TOKKI(4)  =  "10"
               ADD     1       TO  SKT4600TMP-DAISAN
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *    老人＋原爆判定
           IF      RECE10-ETC-KOHNUM(1)    =   "019"
           OR      RECE10-ETC-KOHNUM(2)    =   "019"
           OR      RECE10-ETC-KOHNUM(3)    =   "019"
           OR      RECE10-ETC-KOHNUM(4)    =   "019"
               ADD     1       TO  SKT4600TMP-GENBK
           END-IF
      *
      *    保険者数カウント処理
           PERFORM  2102-HKNJA-CNT-SEC
      *
           IF      FLG-SKT4600TMP  =   1
               WRITE   SKT4600TMP-REC
           ELSE
               REWRITE SKT4600TMP-REC
           END-IF
      *
           MOVE    1       TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢者分集計処理
      *****************************************************************
       220-KOUKI-SYUKEI-SEC               SECTION.
      *
       DISPLAY "220-KOUKI-SYUKEI-SEC"
      *    入院／外来
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1  TO  IDX2
           ELSE
             MOVE  2  TO  IDX2
           END-IF
      *
      *    後期高齢者を印字する行
           MOVE  12  TO  IDX1
      *
           PERFORM  2101-SYUKEI-SEC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    保険者数カウント
           PERFORM  2102-KHKNJA-CNT-SEC
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           IF      FLG-SKT4600TMP  =  1
                   WRITE    SKT4600TMP-REC
           ELSE
                   REWRITE  SKT4600TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
           .
       220-KOUKI-SYUKEI-EXT.
           EXIT.       
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    在宅分集計処理
      *****************************************************************
       2101-ZSYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD     1                   TO  SKT4600TMP-Z-KENSU(IDX1)
                                           SKT4600TMP-Z-KENSU(7)
      *    療養の給付：点数
           ADD     RECE10-TOTALTEN(1)  TO  SKT4600TMP-Z-TENSU(IDX1)
                                           SKT4600TMP-Z-TENSU(7)
      *    療養の給付：一部負担金
           ADD     RECE10-FTNMONEY(1)  TO  SKT4600TMP-Z-ITBFTN(IDX1)
                                           SKT4600TMP-Z-ITBFTN(7)
      *
      *
           MOVE    1       TO  FLG-UPD 
           .
       2101-ZSYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理(在宅分)
      *****************************************************************
       220-ZKOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
      *       ０５１と０９１は同じ場所に集計する
               IF      RECE10-KOHNUM(IDX3) =  "091"
                   MOVE    "051"       TO  RECE10-KOHNUM(IDX3)
               END-IF
      *
      *--- (2008/12/16) line add start monma ---------------------------
      *      公費番号まとめ情報があるとき
             IF  WRK-2007-MAX  >  ZERO
               MOVE  SPACE     TO  WRK-KOHNAME
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *                   UNTIL   IDZ2  >       5
                         UNTIL   IDZ2  >       10
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *               MOVE  5             TO  IDZ2
                     MOVE  10            TO  IDZ2
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *--- (2008/12/16) line add end    monma --------------------------
      *
      *    公費判別
               PERFORM VARYING IDX4    FROM    1   BY  1
                       UNTIL   IDX4    >       20
                       OR      SKT4600TMP-ZKOHNUM(IDX4)    = SPACE
                   IF      RECE10-KOHNUM (IDX3)
                                       =   SKT4600TMP-ZKOHNUM(IDX4)
                       MOVE    IDX4    TO  CNT-KOH
                       MOVE    20      TO  IDX4
                   END-IF
               END-PERFORM
      *
      *       該当公費がなかった場合
               IF      IDX4    <   20
                   MOVE    IDX4    TO  CNT-KOH
               END-IF
      *
      *    公費名
               MOVE    RECE10-KOHNUM(IDX3) 
                               TO  SKT4600TMP-ZKOHNUM(CNT-KOH)
      *--- (2008/12/16) line add start monma ---------------------------
      *    公費名称
               MOVE  WRK-KOHNAME  TO  SKT4600TMP-KOHNAME(CNT-KOH)
      *--- (2008/12/16) line add end   monma ---------------------------
      *
      *    療養の給付：件数
               ADD     1       TO  SKT4600TMP-ZK-KENSU (CNT-KOH)
      *
      *    療養の給付：一部負担金
               ADD     RECE10-FTNMONEY(IDX3 + 1)
                               TO  SKT4600TMP-ZK-ITBFTN(CNT-KOH)
           END-PERFORM
      *
      *
           .
       220-ZKOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    医療保険・一般国保分集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD     1                   TO  SKT4600TMP-KENSU (IDX1 IDX2)
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                     SKT4600TMP-KENSU (12 IDX2)
                                           SKT4600TMP-KENSU (13 IDX2)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    療養の給付：点数
           ADD     RECE10-TOTALTEN(1)  TO  SKT4600TMP-TENSU(IDX1 IDX2)
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                     SKT4600TMP-TENSU(12 IDX2)
                                           SKT4600TMP-TENSU(13 IDX2)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.02) LINE ADD START ------------------------------------
      *
      *    療養の給付：薬剤一部負担金
      *     ADD     RECE10-YKZFTN(1)    TO  SKT4600TMP-YKZFTN(IDX1 IDX2)
      *---(01.00.05) LINE ADD START ------------------------------------
      **                                     SKT4600TMP-YKZFTN(12 IDX2)
      *                                     SKT4600TMP-YKZFTN(13 IDX2)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    療養の給付：一部負担金
      *=== 斜線部分は印字しない by Yoshikawa(2009/02/06) start
      *    ADD     RECE10-FTNMONEY(1)  TO  SKT4600TMP-ITBFTN(IDX1 IDX2)
      **---(01.00.05) LINE ADD START ------------------------------------
      **                                     SKT4600TMP-ITBFTN(12 IDX2)
      *                                     SKT4600TMP-ITBFTN(13 IDX2)
      **---(01.00.05) LINE ADD END   ------------------------------------
           IF  IDX1  =  1  OR  2  OR  6  OR  7  OR  10 OR  11
      *=== 入院は斜線部分も印字する by Yoshikawa(2009/07/01) start
           OR  (IDX2  =  1)
      *=== 入院は斜線部分も印字する by Yoshikawa(2009/07/01) end
             ADD  RECE10-FTNMONEY(1)  TO  SKT4600TMP-ITBFTN(IDX1 IDX2)
                                          SKT4600TMP-ITBFTN(13 IDX2)
           END-IF
      *=== 斜線部分は印字しない by Yoshikawa(2009/02/06) end
      *
           IF      RECE10-SHOKUJINISSU(1)  >   ZERO
      *
      *        食事療養:件数
               ADD     1           TO  SKT4600TMP-SKENSU(IDX1)
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                 SKT4600TMP-SKENSU(12)
                                       SKT4600TMP-SKENSU(13)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.01) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(1)
                                   TO  SKT4600TMP-SKINGK(IDX1)
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                 SKT4600TMP-SKINGK(12)
                                       SKT4600TMP-SKINGK(13)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(1)
                                   TO  SKT4600TMP-SFTNGK(IDX1)
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                 SKT4600TMP-SFTNGK(12)
                                       SKT4600TMP-SFTNGK(13)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.01) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           MOVE    1       TO  FLG-UPD 
           .
       2101-SYUKEI-EXT.
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
      *       ０５１と０９１は同じ場所に集計する
               IF      RECE10-KOHNUM(IDX3) =  "091"
                   MOVE    "051"       TO  RECE10-KOHNUM(IDX3)
               END-IF
      *
      *--- (2008/12/16) line add start monma ---------------------------
      *      公費番号まとめ情報があるとき
             IF  WRK-2007-MAX  >  ZERO
               MOVE  SPACE     TO  WRK-KOHNAME
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *                   UNTIL   IDZ2  >       5
      *=== 公費番号まとめ追加 by Monma(2016/12/14) start
      *                   UNTIL   IDZ2  >       10
                         UNTIL   IDZ2  >       20
      *=== 公費番号まとめ追加 by Monma(2016/12/14) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *               MOVE  5             TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2016/12/14) start
      *               MOVE  10            TO  IDZ2
                     MOVE  20            TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2016/12/14) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *--- (2008/12/16) line add end    monma --------------------------
      *
      *        公費判別
               PERFORM VARYING IDX4    FROM    1   BY  1
                       UNTIL   IDX4    >       20
                       OR      SKT4600TMP-KOHNUM(IDX4) = SPACE
                   IF      RECE10-KOHNUM (IDX3)
                                       =   SKT4600TMP-KOHNUM (IDX4)
                       MOVE    IDX4    TO  CNT-KOH
                       MOVE    20      TO  IDX4
                   END-IF
               END-PERFORM
      *
      *
      *       該当公費がなかった場合
               IF      IDX4    <   20
                   MOVE    IDX4    TO  CNT-KOH
               END-IF
      *
      *        公費名
               MOVE    RECE10-KOHNUM(IDX3)
                               TO  SKT4600TMP-KOHNUM(CNT-KOH)
      *
      *--- (2008/12/16) line add start monma ---------------------------
      *    公費名称
               MOVE  WRK-KOHNAME  TO  SKT4600TMP-KOHNAME(CNT-KOH)
      *--- (2008/12/16) line add end   monma ---------------------------
      *
      *        療養の給付：件数
               ADD     1       TO  SKT4600TMP-K-KENSU(CNT-KOH IDX2)
      *
      *        療養の給付：点数
               ADD     RECE10-TOTALTEN(IDX3 + 1)
                               TO  SKT4600TMP-K-TENSU(CNT-KOH IDX2)
      *
      *        療養の給付：一部負担金
               ADD     RECE10-FTNMONEY(IDX3 + 1)
                               TO  SKT4600TMP-K-ITBFTN(CNT-KOH IDX2)
      *
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *
      *            食事療養:件数
                   ADD     1   TO  SKT4600TMP-K-SKENSU(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
               END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *        食事療養：金額
               ADD     RECE10-SHOKUJIRYOYOHI(IDX3 + 1)
                                TO  SKT4600TMP-K-SKINGK(CNT-KOH)
      *
      *        食事療養：標準負担額
               ADD     RECE10-SHOKUJIFTN(IDX3 + 1)
                               TO  SKT4600TMP-K-SFTNGK(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
      *         END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    保険者数カウント処理
      *****************************************************************
       2102-HKNJA-CNT-SEC         SECTION.
      *
           PERFORM VARYING IDX1    FROM    1   BY  1
                   UNTIL   IDX1    >       100
               IF      WRK-CHK-HKNJANUM(IDX1) = SPACE
                   ADD     1               TO  SKT4600TMP-HKNJA-KENSU
                   MOVE    WRK-HKNJANUM    TO  WRK-CHK-HKNJANUM(IDX1)
                   MOVE    100             TO  IDX1
               ELSE
                   IF      WRK-CHK-HKNJANUM(IDX1)  =   WRK-HKNJANUM
                       MOVE    100     TO  IDX1
                   END-IF
               END-IF
           END-PERFORM
      *
           .
       2102-HKNJA-CNT-EXT.
           EXIT.
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    保険者数カウント処理（後期高齢者）
      *****************************************************************
       2102-KHKNJA-CNT-SEC         SECTION.
      *
           PERFORM VARYING IDX1    FROM    1   BY  1
                   UNTIL   IDX1    >       50
               IF      WRK-CHK-KHKNJANUM(IDX1) = SPACE
                   ADD   1               TO  SKT4600TMP-HKNJA-KENSUK
                   MOVE  RECE10-HKNJANUM (1:4)
                                         TO  WRK-CHK-KHKNJANUM(IDX1)
                   MOVE  50              TO  IDX1
               ELSE
                   IF  WRK-CHK-KHKNJANUM(IDX1)  =  RECE10-HKNJANUM(1:4)
                       MOVE    50        TO  IDX1
                   END-IF
               END-IF
           END-PERFORM
      *
           .
       2102-HKNJA-CNT-EXT.
           EXIT.
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           OPEN     INPUT       SKT4600TMP-FILE
      *
      *    請求書枚数集計処理
           PERFORM  2002-SEIKYUCNT-SYUKEI-SEC
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM 900-TMP-READ-SEC
      *
           PERFORM UNTIL   FLG-PRINT   =   1
      *
               MOVE    1       TO  WRK-CNT
                                   WRK-CNT2
               MOVE    ZERO    TO  FLG-PASS
      *
      *        帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *
      *        帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *
      *        帳票印刷処理
               PERFORM 330-PRINT-OUT-SEC
      *
               PERFORM  KOH-SORT-SEC
      *
               PERFORM  UNTIL  SKT4600TMP-KOHNUM (WRK-CNT)  = SPACE
                        AND    SKT4600TMP-ZKOHNUM(WRK-CNT2) = SPACE
                        AND    FLG-PASS  =  1
      *
      *            帳票編集<見出し>処理
                   PERFORM 311-HEAD-HEN-SEC
      *
      *            帳票編集<明細>処理
                   PERFORM 321-BODY-HEN-SEC
      *
      *            帳票印刷処理
                   PERFORM 331-PRINT-OUT-SEC
                   MOVE  1  TO  FLG-PASS
               END-PERFORM
      *
      *        一時ファイル読込
               PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT4600TMP-FILE
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
           ADD     1       TO  CNT-PAGE
      *
           INITIALIZE  SKT4600
      *
      *    県内・県外
           IF      SKT4600TMP-PREFKBN  =   "1"
               MOVE    "○"        TO  SKT4600-KENNNAI-GAI(1)
           ELSE
               MOVE    "○"        TO  SKT4600-KENNNAI-GAI(2)
           END-IF
      *
      *    標榜科名
           PERFORM VARYING IDX1    FROM    1   BY  1
                   UNTIL   IDX1    >       4
               MOVE    WRK-SRYKANAME(IDX1) TO  SKT4600-SRYKANAME(IDX1)
           END-PERFORM
      *
      *    診療年月
           MOVE    WRK-SRYYMWH             TO  SKT4600-SRYYM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD         TO  SKT4600-HOSPCD
      *
      *    郵便番号
           MOVE    SYS-1002-POST           TO  SKT4600-POST
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS           TO  SKT4600-HOSPADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME       TO  SKT4600-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS            TO  SKT4600-HOSPADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/12) start
           INSPECT SKT4600-HOSPADRS        REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/12) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME            TO  SKT4600-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/12) start
           INSPECT SKT4600-HOSPNAME        REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/12) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) start
      *     MOVE    SYS-1001-KAISETUNAME    TO  SKT4600-KAISETU
           MOVE    WRK-KAISETUNAME         TO  SKT4600-KAISETU
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) end
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL            TO  SKT4600-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL             TO  SKT4600-TEL
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    保険者数
           MOVE    SKT4600TMP-HKNJA-KENSU  TO  WRK-Z5
           MOVE    WRK-Z5                  TO  SKT4600-HKNSUU
      *
      *    請求書枚数
           IF      SKT4600TMP-PREFKBN  =   "1"
               MOVE    CNT-SEIKYU(1)       TO  WRK-Z5
           ELSE
               MOVE    CNT-SEIKYU(2)       TO  WRK-Z5
           END-IF
           MOVE    WRK-Z5      TO  SKT4600-SKYSUU
      *
      *    明細書枚数
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COMPUTE WRK-KEISAN  =   SKT4600TMP-KENSU(12 1)
      *                         +   SKT4600TMP-KENSU(12 2)
      *                         +   SKT4600TMP-Z-KENSU(7)
           COMPUTE WRK-KEISAN  =   SKT4600TMP-KENSU(13 1)
                               +   SKT4600TMP-KENSU(13 2)
                               -   SKT4600TMP-KENSU(12 1)
                               -   SKT4600TMP-KENSU(12 2)
      *---(01.00.07) LINE ADD START ------------------------------------
                               +   SKT4600TMP-Z-KENSU(7)
      *---(01.00.07) LINE ADD END   ------------------------------------
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-KEISAN          TO  WRK-Z5
           MOVE    WRK-Z5              TO  SKT4600-MEISAISUU
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    後期高齢
      *    保険者数
           MOVE    SKT4600TMP-HKNJA-KENSUK  TO  WRK-Z5
           MOVE    WRK-Z5                   TO  SKT4600-HKNSUUK
      *
      *    請求書枚数
           IF      SKT4600TMP-PREFKBN  =   "1"
               MOVE    CNT-SEIKYUK(1)       TO  WRK-Z5
           ELSE
               MOVE    CNT-SEIKYUK(2)       TO  WRK-Z5
           END-IF
           MOVE    WRK-Z5      TO  SKT4600-SKYSUUK
      *
      *    明細書枚数
           COMPUTE WRK-KEISAN  =   SKT4600TMP-KENSU(12 1)
                               +   SKT4600TMP-KENSU(12 2)
           MOVE    WRK-KEISAN          TO  WRK-Z5
           MOVE    WRK-Z5              TO  SKT4600-MEISAISUUK
      *
      *    総合計：保険者数
           COMPUTE  WRK-KEISAN  =  SKT4600TMP-HKNJA-KENSU
                                +  SKT4600TMP-HKNJA-KENSUK
           MOVE     WRK-KEISAN         TO  WRK-Z5
           MOVE     WRK-Z5             TO  SKT4600-HKNSUUG
      *    請求書枚数
           IF  SKT4600TMP-PREFKBN  =   "1"
             COMPUTE  WRK-KEISAN  =  CNT-SEIKYU(1)
                                  +  CNT-SEIKYUK(1)
           ELSE
             COMPUTE  WRK-KEISAN  =  CNT-SEIKYU(2)
                                  +  CNT-SEIKYUK(2)
           END-IF
           MOVE     WRK-KEISAN         TO  WRK-Z5
           MOVE     WRK-Z5             TO  SKT4600-SKYSUUG
      *    明細書枚数
           COMPUTE  WRK-KEISAN  =  SKT4600TMP-KENSU(13 1)
                                +  SKT4600TMP-KENSU(13 2)
      *---(01.00.07) LINE ADD START ------------------------------------
                                +  SKT4600TMP-Z-KENSU(7)
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE     WRK-KEISAN         TO  WRK-Z5
           MOVE     WRK-Z5             TO  SKT4600-MEISAISUUG
      *---(01.00.05) LINE ADD START ------------------------------------
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"        TO  SKT4600-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *
      *    長期
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    SKT4600TMP-TYOKI    TO  WRK-Z5
      *     MOVE    WRK-Z5              TO  SKT4600-TYOKI
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.02) LINE ADD START ------------------------------------
      *
      *    上位長期
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    SKT4600TMP-TYOKI2   TO  WRK-Z5
      *     MOVE    WRK-Z5              TO  SKT4600-TYOKI2
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    原爆
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    SKT4600TMP-GENBK    TO  WRK-Z5
      *     MOVE    WRK-Z5              TO  SKT4600-GENBK
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *
      *    第三件数
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    SKT4600TMP-DAISAN   TO  WRK-Z5
      *     MOVE    WRK-Z5              TO  SKT4600-KOU-SUU
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD END ------------------------------------
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
           PERFORM VARYING IDX1    FROM    1   BY  1
      *---(01.00.05) LINE ADD START ------------------------------------
      *             UNTIL   IDX1    >       12
                   UNTIL   IDX1    >       13
      *---(01.00.05) LINE ADD END   ------------------------------------
               PERFORM VARYING IDX2    FROM    1   BY  1
                       UNTIL   IDX2    >       2
      *
      *            療養の給付：件数
                   MOVE    SKT4600TMP-KENSU(IDX1 IDX2)     TO  WRK-Z5
                   MOVE    WRK-Z5   TO  SKT4600-KENSU(IDX1 IDX2)
      *
      *            療養の給付：点数
      *=== 点数の桁数増加 by Yoshikawa(2012/01/16) start
      *             MOVE    SKT4600TMP-TENSU(IDX1 IDX2)     TO  WRK-Z9
      *             MOVE    WRK-Z9   TO  SKT4600-TENSU(IDX1 IDX2)
                   MOVE    SKT4600TMP-TENSU(IDX1 IDX2)     TO  WRK-Z10
                   MOVE    WRK-Z10  TO  SKT4600-TENSU(IDX1 IDX2)
      *=== 点数の桁数増加 by Yoshikawa(2012/01/16) end
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *            療養の給付：薬剤一部負担金
      *             MOVE    SKT4600TMP-YKZFTN(IDX1 IDX2)    TO  WRK-Z7
      *             MOVE    WRK-Z7   TO  SKT4600-YKZFTN(IDX1 IDX2)
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
                   IF  IDX1    <       12
      *---(01.00.05) LINE ADD END   ------------------------------------
      *            療養の給付：一部負担金
                   MOVE    SKT4600TMP-ITBFTN (IDX1 IDX2)   TO  WRK-Z9
                   MOVE    WRK-Z9   TO  SKT4600-ITBFTN(IDX1 IDX2)
      *---(01.00.05) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
               END-PERFORM
      *
      *---(01.00.05) LINE ADD START ------------------------------------
               IF  IDX1    <       12
      *---(01.00.05) LINE ADD END   ------------------------------------
      *        食事療養：件数
               MOVE    SKT4600TMP-SKENSU(IDX1) TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT4600-SKENSU(IDX1)
      *
      *        食事療養：金額
               MOVE    SKT4600TMP-SKINGK(IDX1) TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT4600-SKINGK(IDX1)
      *
      *        食事療養：標準負担額
               MOVE    SKT4600TMP-SFTNGK(IDX1) TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT4600-SFTNGK(IDX1)
      *---(01.00.05) LINE ADD START ------------------------------------
               END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-PERFORM
      *
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
           MOVE   "SKT4600.red"         TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2015/10/05) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
      **     MOVE    "国保総括票"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保総括票"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保総括票［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保総括票"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保総括票［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保総括票［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保総括票［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2015/10/05) end
           MOVE    SKT4600             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Monma(2017/11/06) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Monma(2017/11/06) end
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
       330-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（在宅・公費等）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1       TO  CNT-PAGE
      *
           INITIALIZE  SKT4601
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD     TO  SKT4601-HOSPCD
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"        TO  SKT4601-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（在宅・公費等）
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF      FLG-PASS    =   ZERO
      *
      *     老人編集処理
               PERFORM VARYING IDX1    FROM    1   BY  1
                       UNTIL   IDX1    >       7
      *
      *            療養の給付：件数
                   MOVE  SKT4600TMP-Z-KENSU(IDX1)  TO  WRK-Z5
                   MOVE  WRK-Z5   TO  SKT4601-Z-KENSU(IDX1)
      *
      *            療養の給付：点数
      *=== 点数の桁数増加 by Yoshikawa(2012/01/16) start
      *             MOVE  SKT4600TMP-Z-TENSU(IDX1)  TO  WRK-Z9
      *             MOVE  WRK-Z9   TO  SKT4601-Z-TENSU(IDX1)
                   MOVE  SKT4600TMP-Z-TENSU(IDX1)  TO  WRK-Z10
                   MOVE  WRK-Z10  TO  SKT4601-Z-TENSU(IDX1)
      *=== 点数の桁数増加 by Yoshikawa(2012/01/16) end
      *
      *            療養の給付：一部負担金
                   MOVE  SKT4600TMP-Z-ITBFTN(IDX1)  TO  WRK-Z9
                   MOVE  WRK-Z9   TO  SKT4601-Z-ITBFTN(IDX1)
               END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM VARYING IDX3    FROM    1   BY  1
                   UNTIL   IDX3    >       10
                   OR      WRK-CNT >       20
                   OR      SKT4600TMP-KOHNUM(WRK-CNT)  =   SPACE
               PERFORM VARYING IDX2    FROM    1   BY  1
                       UNTIL   IDX2    >       2
      *
      *            療養の給付：件数
                   MOVE    SKT4600TMP-K-KENSU(WRK-CNT IDX2)
                                                   TO  WRK-Z5
                   MOVE    WRK-Z5      TO  SKT4601-KENSU(IDX3 IDX2)
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *            療養の給付：薬剤一部負担金
      *             MOVE  SKT4600TMP-K-YKZFTN(WRK-CNT IDX2)
      *                                             TO  WRK-Z9
      *             MOVE    WRK-Z9      TO  SKT4601-YKZFTN(IDX3 IDX2)
      *---(01.00.02) LINE ADD START ------------------------------------
      *
      *            療養の給付：一部負担金
                   MOVE    SKT4600TMP-K-ITBFTN(WRK-CNT IDX2)
                                                   TO  WRK-Z9
                   MOVE    WRK-Z9      TO  SKT4601-ITBFTN(IDX3 IDX2)
               END-PERFORM
      *
      *        食事療養：件数
               MOVE    SKT4600TMP-K-SKENSU(WRK-CNT)    TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT4601-SKENSU(IDX3)
      *
      *        食事療養：金額
               MOVE    SKT4600TMP-K-SKINGK(WRK-CNT)    TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT4601-SKINGK(IDX3)
      *
      *        食事療養：標準負担額
               MOVE    SKT4600TMP-K-SFTNGK(WRK-CNT)    TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT4601-SFTNGK(IDX3)
      *
      *        公費名
               MOVE    SKT4600TMP-KOHNUM(WRK-CNT)  TO  WRK-KOHNUM
               PERFORM 950-HKNNUM-SET-SEC
               MOVE    HKN-HBTNUM          TO  SKT4601-HBTNUM(IDX3)
               MOVE    HKN-TANSEIDONAME    TO  SKT4601-KOHNAME(IDX3)
      *
      *--- (2008/12/16) line add start monma ---------------------------   
             IF  SKT4600TMP-KOHNAME(WRK-CNT)  NOT =  SPACE
               MOVE  SKT4600TMP-KOHNAME(WRK-CNT)
                                        TO  SKT4601-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT4601-KOHNAME(IDX3)
             END-IF
      *--- (2008/12/16) line add end   monma ---------------------------
               ADD  1  TO  WRK-CNT
           END-PERFORM
      *
      *    在宅公費の印字
           PERFORM VARYING IDX3    FROM    1   BY  1
                   UNTIL   IDX3    >       3
                   OR  WRK-CNT2    >       20
                   OR  SKT4600TMP-ZKOHNUM(WRK-CNT2)    =   SPACE
      *
      *        療養の給付：件数
               MOVE    SKT4600TMP-ZK-KENSU(WRK-CNT2)   TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT4601-ZK-KENSU(IDX3)
      *
      *        療養の給付：一部負担金
               MOVE    SKT4600TMP-ZK-ITBFTN(WRK-CNT2)  TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT4601-ZK-ITBFTN(IDX3)
      *
      *        公費名
               MOVE    SKT4600TMP-ZKOHNUM(WRK-CNT2)    TO  WRK-KOHNUM
               PERFORM 950-HKNNUM-SET-SEC
               MOVE    HKN-HBTNUM          TO  SKT4601-Z-HBTNUM(IDX3)
               MOVE    HKN-TANSEIDONAME    TO  SKT4601-Z-KOHNAME(IDX3)
      *
      *--- (2008/12/16) line add start monma ---------------------------   
             IF  SKT4600TMP-ZKOHNAME(WRK-CNT)  NOT =  SPACE
               MOVE  SKT4600TMP-ZKOHNAME(WRK-CNT)
                                        TO  SKT4601-Z-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT4601-Z-KOHNAME(IDX3)
             END-IF
      *--- (2008/12/16) line add end   monma ---------------------------
               ADD     1   TO  WRK-CNT2
           END-PERFORM
      *
           .
       321-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（在宅・公費等）
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
           MOVE   "SKT4601.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2015/10/05) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
      **     MOVE    "国保総括票"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保総括票"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保総括票［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保総括票"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保総括票［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保総括票［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保総括票［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2015/10/05) end
           MOVE    SKT4601             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Monma(2017/11/06) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Monma(2017/11/06) end
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
       331-PRINT-OUT-EXT.
           EXIT.
057400*
      *****************************************************************
      *    公費ソート処理
      *****************************************************************
       KOH-SORT-SEC          SECTION.
      *
      *
           INITIALIZE  SORT-AREA
           INITIALIZE  SORT-AREA2
      *    公費数を取得
           MOVE    ZERO    TO  IDX-MAX
                               IDX2 
           MOVE    SPACE   TO  WRK-KOHNUM
           PERFORM VARYING IDX1    FROM    1   BY  1
                   UNTIL   IDX1    >       20
               IF      SKT4600TMP-KOHNUM(IDX1) =   SPACE
                   MOVE    20      TO  IDX1
               ELSE
                   IF      WRK-KOHNUM      =   SPACE
                   OR      SKT4600TMP-KOHNUM(IDX1) <   WRK-KOHNUM
                       MOVE    IDX1    TO  IDX2
                       MOVE    SKT4600TMP-KOHNUM(IDX1) TO  WRK-KOHNUM
                   END-IF
                   ADD     1       TO  IDX-MAX
               END-IF
           END-PERFORM
           IF      IDX2    >   ZERO
               MOVE    SKT4600TMP-KOH-TBL(IDX2)    TO  SORT-KOH-TBL(1)
           END-IF
      
           DISPLAY "一般ソート前１" SKT4600TMP-KOHNUM(1)
           DISPLAY "一般ソート前２" SKT4600TMP-KOHNUM(2)
           DISPLAY "一般ソート前３" SKT4600TMP-KOHNUM(3)
      *
           IF      IDX-MAX     >   ZERO
               MOVE    2       TO  IDX1
               MOVE    1       TO  IDX2
                                   IDX3
               MOVE    "999"   TO  WRK-KOHNUM
               PERFORM UNTIL   IDX1    >   IDX-MAX
                   PERFORM VARYING IDX2    FROM    1   BY  1
                           UNTIL   IDX2    >       IDX-MAX
                       IF     (SKT4600TMP-KOHNUM(IDX2)
                                           >   SORT-KOHNUM(IDX1 - 1))
                       AND    (SKT4600TMP-KOHNUM(IDX2)
                                           <  WRK-KOHNUM)
                           MOVE    SKT4600TMP-KOHNUM(IDX2)
                                           TO WRK-KOHNUM
                           MOVE    IDX2    TO  IDX3
                       END-IF
                   END-PERFORM
                   MOVE    SKT4600TMP-KOH-TBL(IDX3)
                                           TO  SORT-KOH-TBL(IDX1)
                   MOVE    "999"   TO  WRK-KOHNUM
                   ADD     1       TO  IDX1
               END-PERFORM
           END-IF
      *
           INITIALIZE  SKT4600TMP-KOH-AREA
           MOVE    SORT-AREA   TO  SKT4600TMP-KOH-AREA
      *
           DISPLAY "一般ソート後１" SKT4600TMP-KOHNUM(1)
           DISPLAY "一般ソート後２" SKT4600TMP-KOHNUM(2)
           DISPLAY "一般ソート後３" SKT4600TMP-KOHNUM(3)
      *
      *    在宅公費数を取得
           MOVE    ZERO    TO  IDX-MAX
                               IDX2 
           MOVE    SPACE   TO  WRK-KOHNUM
           PERFORM VARYING IDX1    FROM    1   BY  1
                   UNTIL   IDX1    >       20
               IF      SKT4600TMP-ZKOHNUM(IDX1)    =   SPACE
                   MOVE    20      TO  IDX1
               ELSE
                   IF     (WRK-KOHNUM      =   SPACE)
                   OR     (SKT4600TMP-ZKOHNUM(IDX1)
                                           <   WRK-KOHNUM)
                       MOVE    IDX1        TO  IDX2
                       MOVE    SKT4600TMP-ZKOHNUM(IDX1)
                                           TO  WRK-KOHNUM
                   END-IF
                   ADD     1       TO  IDX-MAX
               END-IF
           END-PERFORM
      *
           IF      IDX2    >   ZERO
               MOVE    SKT4600TMP-ZKOH-TBL(IDX2)
                                   TO  SORT-KOH-TBL2(1)
           END-IF
      
           DISPLAY "在宅ソート前１" SKT4600TMP-ZKOHNUM(1)
           DISPLAY "在宅ソート前２" SKT4600TMP-ZKOHNUM(2)
           DISPLAY "在宅ソート前３" SKT4600TMP-ZKOHNUM(3)
      *
           IF      IDX-MAX     >   ZERO
               MOVE    2       TO  IDX1
               MOVE    1       TO  IDX2
                                   IDX3
               MOVE   "999"    TO  WRK-KOHNUM
               PERFORM UNTIL   IDX1    >   IDX-MAX
                   PERFORM VARYING IDX2    FROM    1   BY  1
                           UNTIL   IDX2    >       IDX-MAX
                       IF     (SKT4600TMP-ZKOHNUM(IDX2)
                                           >   SORT-ZKOHNUM(IDX1 - 1))
                       AND    (SKT4600TMP-ZKOHNUM(IDX2)
                                           <   WRK-KOHNUM)
                           MOVE    SKT4600TMP-ZKOHNUM(IDX2)
                                           TO  WRK-KOHNUM
                           MOVE    IDX2    TO    IDX3
                       END-IF
                   END-PERFORM
                   MOVE    SKT4600TMP-ZKOH-TBL(IDX3)  
                                           TO  SORT-KOH-TBL2(IDX1)
                   MOVE    "999"   TO  WRK-KOHNUM
                   ADD     1       TO  IDX1
               END-PERFORM
           END-IF
      *
           INITIALIZE  SKT4600TMP-ZKOH-AREA
           MOVE    SORT-AREA2  TO  SKT4600TMP-ZKOH-AREA
      *
           DISPLAY "在宅ソート後１" SKT4600TMP-ZKOHNUM(1)
           DISPLAY "在宅ソート後２" SKT4600TMP-ZKOHNUM(2)
           DISPLAY "在宅ソート後３" SKT4600TMP-ZKOHNUM(3)
      *
           .
       KOH-SORT-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求書計算用ファイル編集処理
      *****************************************************************
       211-SEIKYUSYO-HENSYU-SEC          SECTION.
      *
           INITIALIZE  SKT4610TMP-REC
      *
      *    KEY設定
           IF     (RECE10-PREFKBN         =  "1")
           AND    (WRK-HKNJANUM(3:1)  NOT =  "3")
               MOVE    1       TO  SKT4610TMP-SYUTURYOKU
           ELSE
               MOVE    2       TO  SKT4610TMP-SYUTURYOKU
           END-IF
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    WRK-HKNJANUM    TO  SKT4610TMP-HKNJANUM
           MOVE    FLG-KOUKI       TO  SKT4610TMP-KOUKI
           IF  FLG-KOUKI  =  ZERO
               MOVE  WRK-HKNJANUM  TO  SKT4610TMP-HKNJANUM
           ELSE
               MOVE  RECE10-HKNJANUM (1:4)  TO  SKT4610TMP-HKNJANUM
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 在宅はまとめて集計 by Yoshikawa(2012/06/15) start
      *     MOVE    RECE10-ZAITAKU  TO  SKT4610TMP-ZAITAKU
      *=== 在宅はまとめて集計 by Yoshikawa(2012/06/15) end
      *
      *    返戻区分
           IF      RECE10-HENREIYM NOT =   "000000"
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/07) start
      *         MOVE    1       TO  SKT4610TMP-HENREIKBN
               MOVE    "1"         TO  SKT4610TMP-HENREIKBN
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/07) end
           END-IF
      *
           PERFORM 901-SKTTMP-READ-SEC
      *
           IF     RECE10-RJNHKNNUM    NOT =   SPACE
               MOVE    1       TO  SKT4610TMP-PAGE-FLG2
           END-IF
      *
      *    公費集計処理
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
      *    ０５１と０９１は同じ場所に集計する
               IF      RECE10-KOHNUM(IDX3)  =   "091"
                   MOVE    "051"   TO  RECE10-KOHNUM(IDX3)
               END-IF
      *
      *        公費判別
               MOVE    1       TO  SKT4610TMP-PAGE-FLG2
               PERFORM VARYING IDX4    FROM    1   BY  1
                       UNTIL   IDX4    >       20
                   IF      RECE10-KOHNUM (IDX3)
                                       =  SKT4610TMP-KOHNUM(IDX4)
                       MOVE  20    TO  IDX4
                   ELSE
                       IF      SKT4610TMP-KOHNUM(IDX4) =   SPACE
                           ADD     1       TO  SKT4610TMP-KOH-CNT
                           MOVE    RECE10-KOHNUM(IDX3) 
                                           TO  SKT4610TMP-KOHNUM(IDX4)
                           MOVE    20      TO  IDX4
                       END-IF
                  END-IF
               END-PERFORM
           END-PERFORM
      *
           DISPLAY "保険者番号=" WRK-HKNJANUM
                   "公費１=" RECE10-KOHNUM(1)
                   "老人保険=" RECE10-RJNHKNNUM
                   "返戻年月=" RECE10-HENREIYM
           IF      FLG-SKT4610TMP  =   1
               WRITE   SKT4610TMP-REC
               DISPLAY "ライト"
           ELSE
               REWRITE SKT4610TMP-REC
               DISPLAY "リライト"
           END-IF
      *
           .
       211-SEIKYUSYO-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *   請求書枚数集計処理
      *****************************************************************
       2002-SEIKYUCNT-SYUKEI-SEC                SECTION.
      *
           OPEN    INPUT   SKT4610TMP-FILE
           INITIALIZE  SKT4610TMP-REC
           MOVE    ZERO    TO  FLG-PRINT
                               CNT-SEIKYU(1)
                               CNT-SEIKYU(2)
      *---(01.00.05) LINE ADD START ------------------------------------
                               CNT-SEIKYUK(1)
                               CNT-SEIKYUK(2)
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    一時ファイル読込
           PERFORM 901-TMP-READ-SEC
           DISPLAY "初回=" FLG-PRINT
      *
           PERFORM UNTIL   FLG-PRINT   =   1
      *
               MOVE    SKT4610TMP-SYUTURYOKU   TO  IDX1
      *
      *---(01.00.05) LINE ADD START ------------------------------------
               IF  SKT4610TMP-KOUKI  =  ZERO
      *---(01.00.05) LINE ADD END   ------------------------------------
                 ADD     1       TO  CNT-SEIKYU(IDX1)
      *
                 IF      SKT4610TMP-PAGE-FLG2    =   1
                   ADD     1       TO  CNT-SEIKYU(IDX1)
      *
      *            公費による改ページ枚数計算
                   IF      SKT4610TMP-KOH-CNT  >   5
                       MOVE    ZERO    TO  WRK-KEISAN
                                           WRK-AMARI
                       COMPUTE SKT4610TMP-KOH-CNT
                                       =   SKT4610TMP-KOH-CNT
                                       -   5
                       DIVIDE  SKT4610TMP-KOH-CNT  BY  5  
                                       GIVING      WRK-KEISAN
                                       REMAINDER   WRK-AMARI
                       IF      WRK-AMARI   NOT =   ZERO
                           ADD     1       TO  WRK-KEISAN
                       END-IF
                       ADD     WRK-KEISAN  TO  CNT-SEIKYU(IDX1)
                   END-IF
                 END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
               ELSE
      *          後期高齢
                 ADD     1      TO  CNT-SEIKYUK (IDX1)
      *
      *            公費による改ページ枚数計算
                   IF      SKT4610TMP-KOH-CNT  >   4
                       MOVE    ZERO    TO  WRK-KEISAN
                                           WRK-AMARI
                       COMPUTE SKT4610TMP-KOH-CNT
                                       =   SKT4610TMP-KOH-CNT
                                       -   4
                       DIVIDE  SKT4610TMP-KOH-CNT  BY  4
                                       GIVING      WRK-KEISAN
                                       REMAINDER   WRK-AMARI
                       IF      WRK-AMARI   NOT =   ZERO
                           ADD     1       TO  WRK-KEISAN
                       END-IF
                       ADD     WRK-KEISAN  TO  CNT-SEIKYUK(IDX1)
                   END-IF
               END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *      一時ファイル読込
               PERFORM  901-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE   SKT4610TMP-FILE
      *
      *
           .
       2002-SEIKYUCNT-SYUKEI-EXT.
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
      *
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      *
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY
      *                                     TO  MCP-PATH
      *             CALL    "MCPSUB"        USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
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
                       MOVE  "*** SOKATU4600 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU4600 SEIKYU INVALID ***"
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
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID      TO  HKN-HOSPID
           MOVE    SPA-HOSPNUM          TO  HKN-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    WRK-KOHNUM           TO  HKN-HKNNUM
           MOVE    HKNNUM-REC           TO  MCPDATA-REC
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2     TO  MCP-PATH
      *     CALL    "MCPSUB"                 USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
               MOVE    "tbl_hknnum"         TO  MCP-TABLE
               MOVE    "key2"               TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
               PERFORM  955-HKNNUM-READ-SEC
           ELSE
               DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険番号情報読込
      *****************************************************************
       955-HKNNUM-READ-SEC  SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
      *
             IF    HKN-HKNNUM  =  "051"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "特定疾患"   TO   HKN-TANSEIDONAME
             END-IF
      *
           ELSE
             INITIALIZE  HKNNUM-REC
             MOVE  1  TO  FLG-HKNNUM
           END-IF
      *
           .
       955-HKNNUM-READ-EXT.
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
      *     MOVE   SYS-1001-HOSPID      TO  RECE10-HOSPID.
           MOVE    SPA-HOSPNUM         TO  RECE10-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM   TO  RECE10-SKYYM.
      *
           MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) start
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  000000              TO  RECE10-SRYYM
             MOVE  999999              TO  RECE10-XXSRYYM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/03/04) end
      *
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY4    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY4       TO  MCP-PATH
      *     MOVE    "DBFETCH"                  TO  MCP-FUNC
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/06/01) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/06/01) end
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
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"               TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY       TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT4600TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4600TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4600TMP
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
           READ  SKT4600TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       901-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT4610TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4610TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4610TMP
           END-READ
           .
       901-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       901-TMP-READ-SEC                SECTION.
      *
           READ  SKT4610TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       901-TMP-READ-EXT.
           EXIT.
      *
      *--- (2008/12/16) line add start monma ---------------------------
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
      *    システム管理マスタ読込（ＮＥＸＴ）
      *****************************************************************
       900-SYSKANRI-READ-N-SEC         SECTION.
      *
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
      *--- (2008/12/16) line add end   monma --------------------------
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
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
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
      *---(01.00.05) LINE ADD START ------------------------------------
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
      *     IF    WRK-PARA-HKNJANUM  NOT = ZERO
      *         MOVE    WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
      *                                        RECE10-XXEDHKNJANUM
      *     ELSE
               MOVE    SPACE              TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"         TO  RECE10-XXEDHKNJANUM
      *     END-IF
      *
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH2               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           DISPLAY "950-SEIKYU-SELECT-SEC"MCP-RC
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
           DISPLAY "950-SEIKYU-READ-SEC"MCP-RC
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  950-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/06/01) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/06/01) end
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
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1900-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1900-STYUKYMD(1:6)
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) end
                                               SYS-1900-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
                                               SYS-1900-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1901-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1901-STYUKYMD(1:6)
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) end
                                               SYS-1901-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
                                           SYS-1901-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           ELSE
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1902-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1902-STYUKYMD(1:6)
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) end
                                               SYS-1902-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
                                           SYS-1902-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
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
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
      *     MOVE    "01"                TO  SYS-1903-STYUKYMD (7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) start
      *         MOVE    WRK-PARA-STSRYYM    TO  SYS-1903-STYUKYMD(1:6)
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
      *=== 医療機関情報取得時の修正 by Monma(2017/03/08) end
           END-IF
           MOVE    "01"                TO  SYS-1903-STYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2016/12/14) end
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
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/05) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/02) end
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
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
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
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
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
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
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
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
