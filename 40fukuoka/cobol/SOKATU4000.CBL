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
       PROGRAM-ID.             SOKATU4000.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・請求書集計処理
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/04/19    有村          再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev    修正者	日付		内容
      *  01.00.01    有村    05/05/06    医療機関情報取得条件修正
      *  01.00.02    有村    05/05/27    食事療養費件数を印字するよう修正
      *  01.00.03    内田    06/07/14    sarge対応
      *                                 （不要なDBCLOSECURSORの削除）
      *  01.00.04    内田    06/10/31    公費合計欄の修正
      *  01.00.05    内田    06/11/14    乳障母合計欄へ社保分を印字
      *  01.00.06    内田    07/01/30    印字対象番号の追加（２８１）
      *  01.00.07    内田    07/06/15    熊本水俣１４５を印字対象とする
      *                                  諸公費合計は公費の件数点数を印字
      *  01.00.08    内田    07/08/08    印字対象番号の追加（290）
      *  01.00.09    内田    07/10/23    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *                                  食事療養費を一千万の位まで印字
      *  01.00.10    内田    08/04/25    帳票様式の変更に伴う修正
      *                                  SPA-AREA初期化
      *  01.00.11    内田    08/04/30    返戻対応
      *  01.00.12    内田    08/05/01    後期高齢印刷処理判定修正
      *  01.00.13    内田    08/07/09    後期高齢のみ、乳障母のみの場合
      *                                  でも印刷する
      *  01.00.14    内田    08/08/15    紙レセ時、不要な紙が出るのを修正
      *                                  後期高齢者の保険者番号の全角表示
      *  01.00.15    内田    08/10/04    印字対象番号の追加
      *                                  （280,380,381,390,490）
      *  01.00.16    吉川    08/11/05    公費の助成がない場合は印字しない
      *  01.00.17    吉川    08/12/11    印字対象番号の追加（480,481,590）
      *  01.00.18    吉川    09/08/20    保険者を個別指定して印刷すると
      *                                  後期高齢分が印字されない不具合を修正
      *  01.00.19    内田    09/10/14    中国九州北部豪雨対応（対象者別集計）
      *  01.00.20    吉川    09/10/30    印字対象番号の追加（690,780）
      *  01.00.21    吉川    10/01/22    オンライン返戻対応
      *  01.00.22    吉川    10/06/10    返戻時、乳障母の値が当月分に
      *                                  記載される不具合を修正
      *  01.00.23    吉川    10/06/29    乳障親欄は当月分と返戻分を合算する
      *  01.00.24    吉川    10/12/16    open-cobol1.0対応
      *  01.00.25    吉川    11/02/09    特別療養費国保対応
      *  01.00.26    吉川    11/05/17    特定疾患（091）と乳障親の場合
      *                                  乳障親欄に集計されないように修正
      *  01.00.27    吉川    11/06/07    乳障親分が別に作成されないのを修正
      *  01.00.28    吉川    11/07/07    特療費分が余分に作成されるのを修正
      *  01.00.29    吉川    12/01/13    特別療養費は専用の請求書に集計
      *  01.00.30    吉川    12/03/12    対象公費番号をINIファイルから
      *                                  取得するようにする
      *  01.00.31    吉川    13/01/22    医療機関情報編集対応
      *  01.00.32    吉川    13/02/07    プラグイン対応
      *  01.00.33    吉川    13/06/18    プログラムオプション対応
      *  01.00.34    萩野    14/09/11    返戻時、再印刷画面のタイトル修正
      *  01.00.35    吉川    14/10/27    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.36    吉川    14/11/11    標榜科名欄の文字数と行数追加
      *                                  乳障親分の帳票には「返戻」と
      *                                  表示しないように修正
      *  01.00.37    萩野    15/09/14    総合計欄の点数を１０００万の位まで
      *                                  印字するよう修正。
      *  01.00.38    萩野    15/11/13    点数欄の記載を一千万の位まで印字するよう修正
      *                                  医療機関編集情報への開設者名追加対応
      *  01.00.39    吉川    16/02/08    入院のみの場合でも、外来の
      *                                  「１件当たり点数」欄に値が
      *                                  印字されるのを修正
      *  01.00.40    門間    17/03/14    医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.41    萩野    17/04/04    後期高齢者の患者で返戻がある場合に
      *                                  エラーとなる不具合を修正
      *  01.00.42    吉川    17/10/16    保険者番号の代表番号まとめは
      *                                  紙レセ時にのみするように修正
      *                                  SITEKBN変更
      *****************************************************************
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT4000TMP-FILE ASSIGN    SKT4000TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4000TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4000.
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *    後期高齢者一時ファイル  
           SELECT  SKT4005TMP-FILE ASSIGN    SKT4005TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4005TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4005.
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME3
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      **
      **
      *     SELECT  SRYKA-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-SRYKA.
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      **    印字対象公費番号ファイル
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     SELECT  TAISYOKOHI-FILE ASSIGN FILE-NAME
      *     SELECT  TAISYOKOHI-FILE ASSIGN FILE-NAME2
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *                             ORGANIZATION   IS  LINE SEQUENTIAL
      *                             ACCESS MODE    IS  SEQUENTIAL
      *                             FILE   STATUS  IS  STS-TAISYOKOHI.
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT4000TMP-FILE.
           COPY    "CPSKT4000TMP.INC".
      *---(01.00.10) LINE ADD START ------------------------------------
      *    後期高齢者一時ファイル  
       FD  SKT4005TMP-FILE.
           COPY    "CPSKT4005TMP.INC".
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
006900*    請求ＤＢ更新用ファイル
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      ** 
      **    診療科CDファイル
      * FD  SRYKA-FILE.
      * 01  SRYKA-REC.
      *     03  SRYKA-SRYKANAME           PIC X(20).
      *     03  FILLER                    PIC X(01).
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      **    印字対象公費番号ファイル
      * FD  TAISYOKOHI-FILE.
      * 01  TAISYOKOHI-REC.
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     03  TAISYO-DAT-CHOHYO   PIC X(01).
      **     03  FILLER              PIC X(01).
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *     03  TAISYO-DAT-KOHNUM   PIC X(03). 
      *     03  TAISYO-DAT-KAIGYO   PIC X(01). 
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4000TP//.
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *    後期高齢者一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4005TP//.
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.09) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *---(01.00.09) LINE ADD END   ------------------------------------
      *     
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      *    対象公費番号データ
           COPY  "TAISYO4001.INC".
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT4000.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT4000         PIC X(02).
      *---(01.00.10) LINE ADD START ------------------------------------
           03  STS-SKT4005         PIC X(02).
      *---(01.00.10) LINE ADD END   ------------------------------------
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
           03  STS-SRYKA           PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
           03  STS-TAISYOKOHI      PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT4000TMP      PIC 9(01).
      *---(01.00.10) LINE ADD START ------------------------------------
           03  FLG-SKT4005TMP      PIC 9(01).
           03  FLG-PRINT2          PIC 9(01).
      *---(01.00.10) LINE ADD END   ------------------------------------
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
           03  FLG-ERR             PIC 9(01).
           03  FLG-SYUNOU          PIC 9(01).
           03  FLG-HKNCOMBI        PIC 9(01).
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
           03  FLG-TAISYOKOHI      PIC 9(01).
           03  FLG-TAISYO          PIC 9(01).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
      *
      *    添字領域
       01  IDX-AREA.
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
           03  IDX                 PIC 9(05).
           03  IDXX                PIC 9(04).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
      *
      *##  パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.09) LINE ADD END   ------------------------------------
      *---(01.00.10) LINE ADD START ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
      *---(01.00.10) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      *---(01.00.10) LINE ADD START ------------------------------------
           03  WRK-PARA-SYOKBN     PIC X(01).
      *---(01.00.10) LINE ADD END   ------------------------------------
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU4000".
      *     03  FILLER              PIC X(09)  VALUE "SRYKA.INI".
      * 01  FILE-NAME2.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM2       PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU4000".
      *     03  FILLER              PIC X(14)  VALUE "TAISYOKOHI.INI".
      * 01  FILE-NAME3.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM3       PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU4000".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/02/07) start
      *     03  FILE-NAME           PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) start
      *     03  WRK-SRYKANAME       PIC X(20) OCCURS 3.
           03  WRK-SRYKANAME       PIC X(22) OCCURS 4.
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) end
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-KEI             PIC 9(10).
           03  WRK-AMARI           PIC 9(01).
           03  WRK-NYUGAI          PIC 9(01).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *     03  WRK-SUM  OCCURS 2.
      *         05  WRK-KKH-SKENSU  PIC 9(06).
      *         05  WRK-KKH-STENSU  PIC 9(10).
      *         05  WRK-TAH-SKENSU  PIC 9(06).
      *         05  WRK-TAH-STENSU  PIC 9(10).
      *         05  WRK-TAK-SKENSU  PIC 9(06).
      *         05  WRK-TAK-STENSU  PIC 9(10).
      *         05  WRK-RJN-SKENSU  PIC 9(06).
      *         05  WRK-RJN-STENSU  PIC 9(10).
      *         05  WRK-SKJ-SKENSU  PIC 9(06).
      *         05  WRK-SKJ-STENSU  PIC 9(10).
      **---(01.00.10) LINE ADD START ------------------------------------
      *         05  WRK-KOU-SKENSU  PIC 9(06).
      *         05  WRK-KOU-STENSU  PIC 9(10).
      **---(01.00.10) LINE ADD END   ------------------------------------
      *     03  WRK-G-GKENSU          PIC 9(10).
      *     03  WRK-G-GTENSU          PIC 9(10).
      *     03  WRK-N-GKENSU          PIC 9(10).
      *     03  WRK-N-GTENSU          PIC 9(10).
      **---(01.00.10) LINE ADD START ------------------------------------
      *     03  WRK-G-SGKENSU         PIC 9(10).
      *     03  WRK-G-SGTENSU         PIC 9(10).
      *     03  WRK-N-SGKENSU         PIC 9(10).
      *     03  WRK-N-SGTENSU         PIC 9(10).
      **---(01.00.10) LINE ADD END   ------------------------------------
      *     03  WRK-KOH-SUM OCCURS 3.
      *         05  WRK-KOH-GKENSU  PIC 9(05).
      *         05  WRK-KOH-GTENSU  PIC 9(10).
           03  WRK-SUM-GENMEN-TBL  OCCURS  2.
               05  WRK-SUM  OCCURS 2.
                   07  WRK-KKH-SKENSU  PIC 9(06).
                   07  WRK-KKH-STENSU  PIC 9(10).
                   07  WRK-TAH-SKENSU  PIC 9(06).
                   07  WRK-TAH-STENSU  PIC 9(10).
                   07  WRK-TAK-SKENSU  PIC 9(06).
                   07  WRK-TAK-STENSU  PIC 9(10).
                   07  WRK-RJN-SKENSU  PIC 9(06).
                   07  WRK-RJN-STENSU  PIC 9(10).
                   07  WRK-SKJ-SKENSU  PIC 9(06).
                   07  WRK-SKJ-STENSU  PIC 9(10).
                   07  WRK-KOU-SKENSU  PIC 9(06).
                   07  WRK-KOU-STENSU  PIC 9(10).
               05  WRK-G-GKENSU          PIC 9(10).
               05  WRK-G-GTENSU          PIC 9(10).
               05  WRK-N-GKENSU          PIC 9(10).
               05  WRK-N-GTENSU          PIC 9(10).
               05  WRK-G-SGKENSU         PIC 9(10).
               05  WRK-G-SGTENSU         PIC 9(10).
               05  WRK-N-SGKENSU         PIC 9(10).
               05  WRK-N-SGTENSU         PIC 9(10).
               05  WRK-KOH-SUM OCCURS 3.
                   07  WRK-KOH-GKENSU  PIC 9(05).
                   07  WRK-KOH-GTENSU  PIC 9(10).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *---(01.00.07) LINE ADD START ------------------------------------
           03  WRK-TMP-TENSU         PIC 9(10).
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z6              PIC ZZ,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z11             PIC ZZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
           03  WRK-KEISAN-S        PIC 9(06)V9.
           03  WRK-Z9-S            PIC ZZZ,ZZZ.Z.
      *
      *    文字変換
           03  WRK-MAE-INPUT           PIC X(200).
           03  WRK-OUT-INPUT           PIC X(200).
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *---(01.00.10) LINE ADD START ------------------------------------
           03  WRK-PATH2           PIC X(50).
           03  WRK-HKNNUM          PIC X(03).
      *---(01.00.10) LINE ADD END   ------------------------------------
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
           03  WRK-KOHNUM          PIC X(03).
           03  WRK-KOHID           PIC 9(10).
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
           03  WRK-YUSEN             PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
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
      *---(01.00.09) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
           03  CNT-GPAGE           PIC 9(03).
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.09) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      *    比較用公費番号テーブル領域
       01  TBL-HIKAKU-KOHI.
           03  TBL-HKOHNUM              PIC X(03)  OCCURS  4.
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *    診療科目情報情報
           COPY    "CPSK1005.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.13) LINE ADD START ------------------------------------
      *    レセプト・総括印刷情報
           COPY    "CPSK2005.INC".
      *---(01.00.13) LINE ADD END   ------------------------------------
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
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
      * 
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
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
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
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
      *---(01.00.13) LINE ADD START ------------------------------------
      *             UNTIL       FLG-END     =   1
      *---(01.00.13) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           INITIALIZE                  TAISYO-DAT
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.10) LINE ADD START ------------------------------------
                                               WRK-PARA-HKNJANUM
      *---(01.00.10) LINE ADD END   ------------------------------------
      *---(01.00.11) LINE ADD START ------------------------------------
                                               WRK-PARA-SYOKBN
      *---(01.00.11) LINE ADD END   ------------------------------------
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *                                         WRK-PARA-TOKUBETU
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
                                               RECEERR
      *---(01.00.09) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *    特別療養費は集計しない
           MOVE    "1"             TO  WRK-PARA-TOKUBETU
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU4000"    TO  JOB-PGID
           MOVE    "国保総括表"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
           MOVE    "SKT4000"         TO  SKT4000TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4000TP-TERMID
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4000TP-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    "SKT4005"           TO  SKT4005TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4005TP-TERMID
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4005TP-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           MOVE  SKT4000TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  SKT4005TP-BASENAME      TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (3)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (4)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT4000TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  SKT4005TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (4)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
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
      ***** 05/05/06 DEL
      *     MOVE    "99999999"          TO  SYS-1001-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1001-EDYUKYMD
      ***** 05/05/06 INS
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *****
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE                  SYS-1002-REC
           MOVE    "1002"              TO  SYS-1002-KANRICD
           MOVE    "*"                 TO  SYS-1002-KBNCD
      ***** 05/05/06 DEL
      *     MOVE    "99999999"          TO  SYS-1002-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1002-EDYUKYMD
      ***** 05/05/06 INS
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *****
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.13) LINE ADD START ------------------------------------
      *    レセプト・総括印刷情報
           INITIALIZE                  SYS-2005-REC
           MOVE    "2005"              TO  SYS-2005-KANRICD
           MOVE    "*"                 TO  SYS-2005-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-2005-STYUKYMD(1:6)
                                           SYS-2005-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-2005-STYUKYMD(7:2)
                                           SYS-2005-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-2005-HOSPNUM
           MOVE    SYS-2005-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC        TO  SYS-2005-REC
           ELSE
               MOVE    "レセプト・総括印刷情報が取得できませんでした"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *---(01.00.13) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
      *     PERFORM  110-INI-FILE-SEC
      **
      *     PERFORM  111-INI-FILE-SEC
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      **    INIファイル読み込み
      *     PERFORM  112-INI-FILE-SEC
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
      *
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *---(01.00.11) LINE ADD START ------------------------------------
      **---(01.00.09) LINE ADD START ------------------------------------
      **     MOVE    PATH-TBL-SEIKYU-KEY4    TO  WRK-PATH
      *     MOVE    "key4"                  TO  WRK-PATH
      **---(01.00.09) LINE ADD END   ------------------------------------
      **---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    "key66"                  TO  WRK-PATH2
      **---(01.00.10) LINE ADD END   ------------------------------------
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      *             MOVE    "key37"                  TO  WRK-PATH
      *             MOVE    "key65"                  TO  WRK-PATH2
      *         WHEN    "1"
      *             MOVE    "key38"                  TO  WRK-PATH
      *             MOVE    "key66"                  TO  WRK-PATH2
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
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *---(01.00.11) LINE ADD END   ------------------------------------
      *
           PERFORM 900-SEIKYU-SELECT-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SOKATU4000"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    診療科
           MOVE    "SRYKA"                   TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) start
      *              UNTIL    IDX  >  3
                    UNTIL    IDX  >  4
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) end
             IF  WRK-OPTION(IDX)(1:2)  =  "※"
               MOVE    SPACE                 TO  WRK-SRYKANAME(IDX)
             ELSE
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) start
      *         MOVE    WRK-OPTION(IDX)(1:20) TO  WRK-SRYKANAME(IDX)
               MOVE    WRK-OPTION(IDX)(1:22) TO  WRK-SRYKANAME(IDX)
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) end
             END-IF
           END-PERFORM
           DISPLAY "診療科１="  WRK-SRYKANAME(1)
           DISPLAY "診療科２="  WRK-SRYKANAME(2)
           DISPLAY "診療科３="  WRK-SRYKANAME(3)
           DISPLAY "診療科４="  WRK-SRYKANAME(4)
      *
      *    対象公費番号
           MOVE    "TAISYOKOHI"              TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  100
                    OR       WRK-OPTION(IDX)  =  SPACE
             MOVE    WRK-OPTION(IDX)(1:3)    TO  TAISYO-KOHNUM(IDX)
             DISPLAY "対象公費番号="  TAISYO-KOHNUM(IDX)
           END-PERFORM
      *
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
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      **=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理   
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM3
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      **
      *     DISPLAY "ファイル名3="  FILE-NAME3
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
      **
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理  
      ******************************************************************
      * 111-INI-FILE-SEC                SECTION.
      **
      **    診療科名取得
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/SRYKA.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      **
      *     DISPLAY "ファイル名="  FILE-NAME
      **
      *     INITIALIZE   SRYKA-REC
      **
      *     OPEN  INPUT  SRYKA-FILE
      **
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >     3
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
      *     CLOSE SRYKA-FILE
      **
      *     DISPLAY "診療科１="  WRK-SRYKANAME(1)
      *     DISPLAY "診療科２="  WRK-SRYKANAME(2)
      *     DISPLAY "診療科３="  WRK-SRYKANAME(3)
      **
      *     .
      * 110-INI-FILE-EXT.
      *     EXIT.
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      ******************************************************************
      **    INIファイル読み込み
      ******************************************************************
      * 112-INI-FILE-SEC         SECTION.
      **
      **    印字対象公費番号ファイル読み込み
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/TAISYOKOHI.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM2
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      **
      *     DISPLAY "ファイル名2="  FILE-NAME2
      **
      *     INITIALIZE   TAISYOKOHI-REC
      **
      *     OPEN  INPUT  TAISYOKOHI-FILE
      **
      *     MOVE  ZERO  TO  IDX
      *                     FLG-TAISYOKOHI
      **
      *     PERFORM UNTIL    FLG-TAISYOKOHI = 1
      *       READ TAISYOKOHI-FILE NEXT
      *         AT END
      *           MOVE  1                 TO  FLG-TAISYOKOHI
      *         NOT AT END
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **           IF  TAISYO-DAT-CHOHYO = "*" OR SPACE
      *           IF  TAISYO-DAT-KOHNUM(1:1) = "*" OR SPACE
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *             CONTINUE
      *           ELSE
      **            1=複写式レセ、乳障母医療費請求書、国保総括表（右下）
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **             IF  TAISYO-DAT-CHOHYO  =  "1"
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *               ADD   1               TO  IDX
      *               MOVE  TAISYOKOHI-REC  TO  TAISYO-TBL(IDX)
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **             END-IF
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *             DISPLAY "読み込みレコード=" TAISYOKOHI-REC
      *           END-IF
      *       END-READ
      *     END-PERFORM
      **
      *     CLOSE TAISYOKOHI-FILE
      **
      *     .
      * 112-INI-FILE-EXT.
      *     EXIT.
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT4000TMP-FILE
           CLOSE            SKT4000TMP-FILE
           OPEN     I-O     SKT4000TMP-FILE
      *---(01.00.10) LINE ADD START ------------------------------------
           OPEN     OUTPUT  SKT4005TMP-FILE
           CLOSE            SKT4005TMP-FILE
           OPEN     I-O     SKT4005TMP-FILE
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *---(01.00.13) LINE ADD START ------------------------------------
      *     MOVE     ZERO    TO      FLG-END
      *---(01.00.13) LINE ADD END   ------------------------------------
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *    後期高齢
           PERFORM  900-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *     IF  WRK-PARA-TOKUBETU  =  "1"
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
             MOVE     ZERO    TO        FLG-END
             MOVE    "039"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2002-KOUKI-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *     ELSE
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
             MOVE     ZERO    TO        FLG-END
             MOVE    "040"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2002-KOUKI-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *     END-IF
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *---(01.00.12) LINE ADD START ------------------------------------
      *    返戻分
      *     MOVE    "key65"                  TO  WRK-PATH2
      *     MOVE     ZERO    TO        FLG-END
      *     MOVE    "039"    TO        WRK-HKNNUM
      *     PERFORM  950-SEIKYU-SELECT-SEC
      *     PERFORM  2002-KOUKI-SYUKEI-SEC
      *              UNTIL   FLG-END   =   1
      *     PERFORM  950-SEIKYU-CLOSE-SEC
      *     MOVE     ZERO    TO        FLG-END
      *     MOVE    "040"    TO        WRK-HKNNUM
      *     PERFORM  950-SEIKYU-SELECT-SEC
      *     PERFORM  2002-KOUKI-SYUKEI-SEC
      *              UNTIL   FLG-END   =   1
      *     PERFORM  950-SEIKYU-CLOSE-SEC
      *---(01.00.12) LINE ADD END   ------------------------------------
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *    障害乳幼児母子医療点数集計
      *=== 乳障親＋特疾無は乳障親に集計しない by Yoshikawa(2011/05/17) start
      *     PERFORM  2001-KOHI-SYUKEI-SEC
      *=== 乳障親を別に作成 by Yoshikawa(2011/06/07) start
      *     IF  WRK-PARA-SYOKBN    =  "1"
      *     AND WRK-PARA-TOKUBETU  =  "1"
      *=== 乳障親を別に作成 by Yoshikawa(2011/06/07) end
      *=== 特療費の余分作成を修正 by Yoshikawa(2011/07/07) start
      *       PERFORM  2001-KOHI-SYUKEI-SEC
           IF  WRK-PARA-TOKUBETU  =  "1"
             PERFORM  2001-KOHI-SYUKEI-SEC
           END-IF
      *=== 特療費の余分作成を修正 by Yoshikawa(2011/07/07) end
      *=== 乳障親を別に作成 by Yoshikawa(2011/06/07) start
      *     END-IF
      *=== 乳障親を別に作成 by Yoshikawa(2011/06/07) end
      *=== 乳障親＋特疾無は乳障親に集計しない by Yoshikawa(2011/05/17) end
      *
      *
           CLOSE   UPD-FILE
           CLOSE   SKT4000TMP-FILE
      *---(01.00.10) LINE ADD START ------------------------------------
           CLOSE   SKT4005TMP-FILE
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           IF       FLG-UPD   =       1
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *              PERFORM   2002-PRINT-SEC
               PERFORM  VARYING  IDX5  FROM  1  BY  1
                        UNTIL    IDX5  >     2
                    PERFORM   2002-PRINT-SEC
               END-PERFORM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *
      *---(01.00.13) LINE ADD START ------------------------------------
           ELSE
      *      レセ電で返戻、もしくは紙レセで当月か
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) start
      *       IF  (WRK-PARA-SYOKBN  =  2  AND
      **---(01.00.14) LINE ADD START ------------------------------------
      **            SYS-2005-KKHRECEKBN  NOT = ZERO  OR  SPACE)
      *            SYS-2005-KKHRECEKBN  NOT = ZERO  AND  SPACE)
      **---(01.00.14) LINE ADD END   ------------------------------------
      *       OR  (WRK-PARA-SYOKBN  =  1  AND
      *            SYS-2005-KKHRECEKBN  =  ZERO  OR  SPACE)
             IF  ((WRK-PARA-SYOKBN  =  2)  AND 
                  (SYS-2005-KKHRECEKBN  NOT = ZERO  AND  SPACE))
             OR  ((WRK-PARA-SYOKBN  =  1)  AND
                  (SYS-2005-KKHRECEKBN  =  ZERO  OR  SPACE))
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) end
      *      乳障母のみの場合
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *         IF  WRK-KOH-GKENSU(3)  >  ZERO
      **    帳票編集<見出し>処理
      *           PERFORM 310-HEAD-HEN-SEC
      **    明細
      *           MOVE    WRK-KOH-GKENSU(3)   TO  WRK-Z5
      *           MOVE    WRK-Z5              TO  SKT4000-KOH-GKENSU
      *           MOVE    WRK-KOH-GTENSU(3)   TO  WRK-Z9
      *           MOVE    WRK-Z9              TO  SKT4000-KOH-GTENSU
      **    帳票印刷処理
      *           PERFORM 340-PRINT-OUT-SEC
      *         END-IF
      *
               PERFORM  VARYING  IDX5  FROM  1  BY  1
                        UNTIL    IDX5  >     2
                 IF  WRK-KOH-GKENSU(IDX5 3)  >  ZERO
      *    帳票編集<見出し>処理
                   PERFORM 310-HEAD-HEN-SEC
      *    明細
                   MOVE    WRK-KOH-GKENSU(IDX5 3)   TO  WRK-Z5
                   MOVE    WRK-Z5               TO  SKT4000-KOH-GKENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *             MOVE    WRK-KOH-GTENSU(IDX5 3)   TO  WRK-Z9
      *             MOVE    WRK-Z9               TO  SKT4000-KOH-GTENSU
                   MOVE    WRK-KOH-GTENSU(IDX5 3)   TO  WRK-Z10
                   MOVE    WRK-Z10              TO  SKT4000-KOH-GTENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
      *    帳票印刷処理
                   PERFORM 340-PRINT-OUT-SEC
                 END-IF
               END-PERFORM
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
             END-IF
      *---(01.00.13) LINE ADD END   ------------------------------------
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    地方公費医療点数集計処理
      *****************************************************************
       2001-KOHI-SYUKEI-SEC                SECTION.
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *     MOVE    ZERO        TO    WRK-KOH-GKENSU(2)
      *                               WRK-KOH-GKENSU(3)
      *                               WRK-KOH-GTENSU(2)
      *                               WRK-KOH-GTENSU(3)
           MOVE    2           TO    IDX5
           MOVE    ZERO        TO    WRK-KOH-GKENSU(IDX5 2)
                                     WRK-KOH-GKENSU(IDX5 3)
                                     WRK-KOH-GTENSU(IDX5 2)
                                     WRK-KOH-GTENSU(IDX5 3)
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
                                     FLG-END
      *
           PERFORM 900-KOHSKY-START-SEC
      *
           PERFORM  UNTIL  FLG-END   =   1
      *
             PERFORM VARYING IDX3 FROM    1   BY  1
                     UNTIL   IDX3 >       4
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      **---(01.00.06) LINE ADD START ------------------------------------
      **         IF  RECE02-KOHNUM (IDX3) = "180" OR "181" OR "190"
      *         IF  RECE02-KOHNUM (IDX3) = "180" OR "181" OR "190"
      **---(01.00.08) LINE ADD START ------------------------------------
      **                                 OR "281"
      **---(01.00.15) LINE ADD START ------------------------------------
      **                                 OR "281" OR "290"
      *                        OR "281" OR "290" OR "280" OR "380"
      *                        OR "381" OR "390" OR "490"
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) start
      *                        OR "480" OR "481" OR "590"
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) end
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) start
      *                        OR "690" OR "780"
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) end
      **---(01.00.15) LINE ADD END   ------------------------------------
      **---(01.00.08) LINE ADD END   ------------------------------------
      **---(01.00.06) LINE ADD END   ------------------------------------
               INITIALIZE                            TBL-HIKAKU-KOHI
               MOVE    RECE02-KOHNUM(IDX3)       TO  TBL-HKOHNUM(1)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
                 MOVE    1                       TO  FLG-ERR
      *          公費の助成があるかどうか
                 MOVE    RECE02-KOHNUM (IDX3)    TO  WRK-KOHNUM
                 MOVE    RECE02-KOHID (IDX3)     TO  WRK-KOHID
                 IF      RECE02-NYUGAIKBN    =   "1"
                     MOVE    "key33"             TO  WRK-PATH
                 ELSE
                     MOVE    "key25"             TO  WRK-PATH
                 END-IF
                 PERFORM  920-SYUNOU-SET-SEC
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *
                 IF     RECE02-KOHNUM(IDX3)  = "180"  AND
                        RECE02-RJNHKNNUM NOT = SPACE
                   DISPLAY "老人＋障害:対象外=" RECE02-PTID
                 ELSE
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *             IF    RECE02-HKNNUM    =    "060" OR "067"
      *               ADD        1    TO    WRK-KOH-GKENSU(2)
      *               ADD RECE02-TOTALTEN(IDX3 + 1)
      *                               TO    WRK-KOH-GTENSU(2)
      *             ELSE
      **=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
      *              IF  FLG-ERR           =    ZERO
      **=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *               ADD        1    TO    WRK-KOH-GKENSU(3)
      *               ADD RECE02-TOTALTEN(IDX3 + 1)
      *                               TO    WRK-KOH-GTENSU(3)
      **=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
      *              END-IF
      **=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *             END-IF
      *
                   IF    RECE02-HKNNUM    =    "060" OR "067"
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
                                          OR   "068" OR "069"
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
                     ADD        1    TO    WRK-KOH-GKENSU(IDX5 2)
                     ADD RECE02-TOTALTEN(IDX3 + 1)
                                     TO    WRK-KOH-GTENSU(IDX5 2)
                   ELSE
                     IF  FLG-ERR          =    ZERO
                       ADD        1    TO    WRK-KOH-GKENSU(IDX5 3)
                       ADD RECE02-TOTALTEN(IDX3 + 1)
                                       TO    WRK-KOH-GTENSU(IDX5 3)
                     END-IF
                   END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
                 END-IF
      *
               END-IF
      *
             END-PERFORM
      *
             PERFORM  900-KOHSKY-READ-SEC
           END-PERFORM
      *
           .
       2001-KOHI-SYUKEI-EXT.
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
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *     MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
           ADD   CNT-PAGE   TO  CNT-GPAGE
           MOVE  CNT-GPAGE  TO  WRK-PARA-PAGE
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *
           DISPLAY "*** SOKATU4000 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU4000 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
      *###（地方公費仕様）
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------

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
           INITIALIZE       SKT4000TMP-REC
           INITIALIZE       SKT4000TMP-HKNJANUM
      *
           IF       RECE10-HKNJANUM(7:2)  =     SPACE
                    MOVE    RECE10-HKNJANUM(1:6)    TO
                            SKT4000TMP-HKNJANUM(1:6)
           ELSE
                    MOVE    RECE10-HKNJANUM(3:6)    TO
                            SKT4000TMP-HKNJANUM(1:6)
           END-IF
      *
      *=== 代表番号まとめは紙レセのみ by Yoshikawa(2017/10/16) start
      *    レセ電時、政令指定都市は区毎に請求
           IF   SYS-2005-KKHRECEKBN  =  "0"
           OR   SYS-2005-KKHRECEKBN  =  SPACE
      *=== 代表番号まとめは紙レセのみ by Yoshikawa(2017/10/16) end
      *      福岡市・北九州市は代表番号で括る
             IF    SKT4000TMP-HKNJANUM(1:3)  =  "404"
               MOVE  "404012"    TO    SKT4000TMP-HKNJANUM
             END-IF
      *
             IF    SKT4000TMP-HKNJANUM(1:3)  =  "405"
               MOVE  "405019"    TO    SKT4000TMP-HKNJANUM
             END-IF
      *=== 代表番号まとめは紙レセ時 by Yoshikawa(2017/10/16) start
           END-IF
      *=== 代表番号まとめは紙レセ時 by Yoshikawa(2017/10/16) end
      *
      *    印字順設定
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
      *     IF    YUSEN-HKNJANUM   =  SKT4000TMP-HKNJANUM
           IF    WRK-YUSEN        =  SKT4000TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
             MOVE          1   TO    SKT4000TMP-SYUTURYOKU
           ELSE
             IF    RECE10-PREFKBN    =    "1"
               IF    SKT4000TMP-HKNJANUM(3:1) NOT  =  "3"
                 MOVE      2   TO    SKT4000TMP-SYUTURYOKU
               ELSE
                 IF    SKT4000TMP-HKNJANUM(1:2)  =  "40"
                   MOVE    3   TO    SKT4000TMP-SYUTURYOKU
                 ELSE
                   MOVE    4   TO    SKT4000TMP-SYUTURYOKU
                 END-IF
               END-IF
             ELSE
               MOVE        9   TO    SKT4000TMP-SYUTURYOKU
             END-IF
           END-IF
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *    中国九州北部豪雨の対象者は別帳票
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  RECE10-ETC-YKZFTN (1)    TO  SKT4000TMP-GENMEN
             MOVE  1                        TO  IDX5
           ELSE
             MOVE  2                        TO  IDX5
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
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
      *    退職者かどうか
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *     IF  RECE10-HKNNUM  =  "060"
           IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
               MOVE  1  TO  IDX2
           ELSE
               MOVE  3  TO   IDX2
           END-IF
      *
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
               MOVE  4      TO   IDX2
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
           IF  FLG-SKT4000TMP  =  1
               WRITE    SKT4000TMP-REC
           ELSE
               REWRITE  SKT4000TMP-REC
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
      *    入院・外来
           IF  RECE10-NYUGAIKBN  =  "1"
               MOVE  1  TO  IDX1
           ELSE
               MOVE  2  TO  IDX1
           END-IF
      *    療養の給付：件数
           ADD   1  TO  SKT4000TMP-KENSU (IDX1 IDX2)
      *    療養の給付：点数
           COMPUTE SKT4000TMP-TENSU(IDX1 IDX2)  =
                   SKT4000TMP-TENSU(IDX1 IDX2)  +
                   RECE10-TOTALTEN(1)
      *    諸公費合計
      *---(01.00.07) LINE ADD START ------------------------------------
      *         IF  RECE10-KOHNUM(1)(1:1) = "0" OR
      *---(01.00.06) LINE ADD START ------------------------------------
      **             RECE10-KOHNUM(1)      = "141" OR "241" OR
      *---(01.00.04) LINE ADD START ------------------------------------
      **                            "180" OR "181" OR "190" OR "341"
      *---(01.00.04) LINE ADD END   ------------------------------------
      *             RECE10-KOHNUM(1)      = "141" OR "241" OR "341" OR
      *                            "180" OR "181" OR "190" OR "281" OR
      *---(01.00.06) LINE ADD END   ------------------------------------
      *             RECE10-ETC-KOHNUM(1)  = "019"
      *           ADD    1                     TO
      *                  WRK-KOH-GKENSU(1)
      *           ADD    RECE10-TOTALTEN(1)    TO
      *                  WRK-KOH-GTENSU(1)
      *         END-IF
      *    諸公費合計は公費の件数点数を集計
           INITIALIZE                       WRK-TMP-TENSU
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     4
                    OR       RECE10-KOHNUM(IDX3)  =  SPACE
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      *         IF  RECE10-KOHNUM(IDX3)(1:1) = "0" OR
      *             RECE10-KOHNUM(IDX3)      = "141" OR "241" OR "341" OR
      *                            "180" OR "181" OR "190" OR "281" OR
      **---(01.00.08) LINE ADD START ------------------------------------
      **                            "145"
      **---(01.00.15) LINE ADD START ------------------------------------
      **                            "145" OR "290"
      *                            "145" OR "290" OR "280" OR "380" OR
      *                            "381" OR "390" OR "490"
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) start
      *                         OR "480" OR "481" OR "590"
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) end
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) start
      *                         OR "690" OR "780"
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) end
      **---(01.00.15) LINE ADD END   ------------------------------------
      **---(01.00.08) LINE ADD END   ------------------------------------
               INITIALIZE                            TBL-HIKAKU-KOHI
               MOVE    RECE10-KOHNUM(IDX3)       TO  TBL-HKOHNUM(1)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
               OR  RECE10-KOHNUM(IDX3)(1:1)
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *           ADD  1                      TO  WRK-KOH-GKENSU(1)
                 ADD  1                      TO  WRK-KOH-GKENSU(IDX5 1)
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
                 ADD  RECE10-TOTALTEN(IDX3 + 1)  TO  WRK-TMP-TENSU
               END-IF
           END-PERFORM
           IF  RECE10-ETC-KOHNUM(1)  =  "019"
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *         ADD  1                     TO  WRK-KOH-GKENSU(1)
               ADD  1                     TO  WRK-KOH-GKENSU(IDX5 1)
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
               ADD  RECE10-TOTALTEN(1)    TO  WRK-TMP-TENSU
           END-IF
           IF  RECE10-TOTALTEN(1)  <  WRK-TMP-TENSU
               MOVE  RECE10-TOTALTEN(1)  TO  WRK-TMP-TENSU
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *     ADD  WRK-TMP-TENSU            TO  WRK-KOH-GTENSU(1)
           ADD  WRK-TMP-TENSU            TO  WRK-KOH-GTENSU(IDX5 1)
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    食事療養：金額
           COMPUTE SKT4000TMP-TENSU(IDX1 5) =
                   SKT4000TMP-TENSU(IDX1 5) + RECE10-SHOKUJIRYOYOHI(1)
      ***** 05/05/27 INS
           IF      RECE10-SHOKUJINISSU(1)   > ZERO
               ADD     1       TO  SKT4000TMP-KENSU(IDX1 5)
           END-IF
      *****
      *
           MOVE    1               TO  FLG-UPD
      *    合計加算
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *     IF    RECE10-NYUGAIKBN  =  "1"
      *       ADD    1    TO    WRK-N-GKENSU
      *       ADD    RECE10-TOTALTEN(1)  TO  WRK-N-GTENSU
      *     ELSE
      *       ADD    1    TO    WRK-G-GKENSU
      *       ADD    RECE10-TOTALTEN(1)  TO  WRK-G-GTENSU
      *     END-IF
      *
      *     EVALUATE  IDX2
      *     WHEN 1
      *         ADD  1                   TO  WRK-KKH-SKENSU(IDX1)
      *         ADD  RECE10-TOTALTEN(1)  TO  WRK-KKH-STENSU(IDX1)
      *     WHEN 3
      *         ADD  1                   TO  WRK-TAK-SKENSU(IDX1)
      *         ADD  RECE10-TOTALTEN(1)  TO  WRK-TAK-STENSU(IDX1)
      *     WHEN 4
      *         ADD  1                   TO  WRK-RJN-SKENSU(IDX1)
      *         ADD  RECE10-TOTALTEN(1)  TO  WRK-RJN-STENSU(IDX1)
      *     END-EVALUATE
      *     ADD  RECE10-SHOKUJIRYOYOHI(1)  
      *                                  TO  WRK-SKJ-STENSU(IDX1)
      ***** 05/05/27 INS
      *     IF      RECE10-SHOKUJINISSU(1)   > ZERO
      *         ADD     1       TO  WRK-SKJ-SKENSU(IDX1)
      *     END-IF
      *****
           IF    RECE10-NYUGAIKBN  =  "1"
             ADD    1    TO    WRK-N-GKENSU (IDX5)
             ADD    RECE10-TOTALTEN(1)  TO  WRK-N-GTENSU (IDX5)
           ELSE
             ADD    1    TO    WRK-G-GKENSU (IDX5)
             ADD    RECE10-TOTALTEN(1)  TO  WRK-G-GTENSU (IDX5)
           END-IF
      *
           EVALUATE  IDX2
           WHEN 1
               ADD  1                   TO  WRK-KKH-SKENSU(IDX5 IDX1)
               ADD  RECE10-TOTALTEN(1)  TO  WRK-KKH-STENSU(IDX5 IDX1)
           WHEN 3
               ADD  1                   TO  WRK-TAK-SKENSU(IDX5 IDX1)
               ADD  RECE10-TOTALTEN(1)  TO  WRK-TAK-STENSU(IDX5 IDX1)
           WHEN 4
               ADD  1                   TO  WRK-RJN-SKENSU(IDX5 IDX1)
               ADD  RECE10-TOTALTEN(1)  TO  WRK-RJN-STENSU(IDX5 IDX1)
           END-EVALUATE
           ADD  RECE10-SHOKUJIRYOYOHI(1)  
                                        TO  WRK-SKJ-STENSU(IDX5 IDX1)
      *
           IF      RECE10-SHOKUJINISSU(1)   > ZERO
               ADD     1       TO  WRK-SKJ-SKENSU(IDX5 IDX1)
           END-IF
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *
           .
       2101-SYUKEI-EXT.
           EXIT.
      *---(01.00.10) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢集計処理
      *****************************************************************
       2002-KOUKI-SYUKEI-SEC              SECTION.
      * 
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT4005TMP-REC
      *
           IF  RECE10-HKNJANUM(3:2)  =  "40"
             MOVE  1                   TO  SKT4005TMP-SYUTURYOKU
           ELSE
             MOVE  2                   TO  SKT4005TMP-SYUTURYOKU
           END-IF
           MOVE  RECE10-HKNJANUM(3:2)  TO  SKT4005TMP-PERFNUM
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *    中国九州北部豪雨の対象者は別帳票
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  RECE10-ETC-YKZFTN (1)    TO  SKT4005TMP-GENMEN
             MOVE  1                        TO  IDX5
           ELSE
             MOVE  2                        TO  IDX5
           END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *
           PERFORM  901-SKTTMP-READ-SEC
      *
           PERFORM  211-KOUKI-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
               PERFORM 950-SEIKYU-READ-SEC
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
       2002-KOUKI-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    後期高齢分集計処理
      *****************************************************************
       211-KOUKI-SYUKEI-SEC          SECTION.
      *
      *    入院／外来
           IF  RECE10-NYUGAIKBN  =  "1"
               MOVE  1  TO   IDX1
           ELSE
               MOVE  2  TO   IDX1
           END-IF
      *
      *    件数
           ADD  1                    TO  SKT4005TMP-KENSU (IDX1)
      *    点数
           ADD  RECE10-TOTALTEN (1)  TO  SKT4005TMP-TENSU (IDX1)
      *    小計カウント
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *     ADD  1                   TO  WRK-KOU-SKENSU(IDX1)
      *     ADD  RECE10-TOTALTEN(1)  TO  WRK-KOU-STENSU(IDX1)
           ADD  1                   TO  WRK-KOU-SKENSU(IDX5 IDX1)
           ADD  RECE10-TOTALTEN(1)  TO  WRK-KOU-STENSU(IDX5 IDX1)
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *
           IF  FLG-SKT4005TMP  =  1
               WRITE    SKT4005TMP-REC
           ELSE
               REWRITE  SKT4005TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD
      *
           .
       211-KOUKI-SYUKEI-EXT.
           EXIT.
      *---(01.00.10) LINE ADD END   ------------------------------------
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
           OPEN     INPUT       SKT4000TMP-FILE
      *---(01.00.10) LINE ADD START ------------------------------------
           OPEN     INPUT       SKT4005TMP-FILE
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           MOVE     ZERO        TO       FLG-PRINT
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
           MOVE     ZERO        TO       FLG-PRINT2
           ADD      CNT-PAGE    TO       CNT-GPAGE
           MOVE     ZERO        TO       CNT-PAGE
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *---(01.00.10) LINE ADD START ------------------------------------
           PERFORM  901-TMP-READ-SEC
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *---(01.00.10) LINE ADD START ------------------------------------
                    AND       FLG-PRINT2  =  1
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *    帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *    帳票編集<合計>処理
               PERFORM 330-SUM-HEN-SEC
      *    帳票印刷処理
               PERFORM 340-PRINT-OUT-SEC
           END-PERFORM
      *
           CLOSE    SKT4000TMP-FILE
      *---(01.00.10) LINE ADD START ------------------------------------
           CLOSE    SKT4005TMP-FILE
      *---(01.00.10) LINE ADD END   ------------------------------------
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
           INITIALIZE                    SKT4000
      *    診療年月
           MOVE    WRK-SRYYMWH(11:)      TO  SKT4000-SRYM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN      TO  SKT4000-HOSPCD
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE  SYS-1002-POST           TO  SKT4000-POST
      *---(01.00.10) LINE ADD END   ------------------------------------
      *---(01.00.09) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4000-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4000-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT4000-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4000-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4000-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4000-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT4000-KANRINAME
           MOVE    WRK-KAISETUNAME       TO  SKT4000-KANRINAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4000-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4000-TEL
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    
           MOVE    WRK-SRYKANAME(1)      TO  SKT4000-SRYKA(1)
           MOVE    WRK-SRYKANAME(2)      TO  SKT4000-SRYKA(2)
           MOVE    WRK-SRYKANAME(3)      TO  SKT4000-SRYKA(3)
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) start
           MOVE    WRK-SRYKANAME(4)      TO  SKT4000-SRYKA(4)
      *=== 標榜科名欄の文字数と行数追加 by Yoshikawa(2014/11/11) end
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT4000-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
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
           PERFORM  VARYING  IDX1  FROM   1   BY  1
                    UNTIL    IDX1  >      8
      *---(01.00.12) LINE ADD START ------------------------------------
      **---(01.00.10) LINE ADD START ------------------------------------
      *              OR       FLG-PRINT  =  1
      *              OR   (FLG-PRINT  =  1  AND  FLG-PRINT2)
                    OR   (FLG-PRINT  =  1  AND  FLG-PRINT2  =  1)
      *---(01.00.12) LINE ADD END   ------------------------------------
             IF  FLG-PRINT  NOT =  1
      *---(01.00.10) LINE ADD END   ------------------------------------
      *    保険者番号
               INITIALIZE                       WRK-MAE-INPUT
               MOVE    SKT4000TMP-HKNJANUM TO   WRK-MAE-INPUT
               PERFORM 2009-HENKAN-SEC
               MOVE    WRK-OUT-INPUT     TO   SKT4000-HKNJANUM (IDX1)
      *
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    国保：件数
                 MOVE  SKT4000TMP-KENSU (IDX2 1)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4000-KKH-KENSU(IDX1 IDX2)
      *    国保：点数
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *           MOVE  SKT4000TMP-TENSU (IDX2 1)  TO  WRK-Z9
      *           MOVE  WRK-Z9   TO  SKT4000-KKH-TENSU(IDX1 IDX2)
                 MOVE  SKT4000TMP-TENSU (IDX2 1)  TO  WRK-Z10
                 MOVE  WRK-Z10  TO  SKT4000-KKH-TENSU(IDX1 IDX2)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
      *    退職家族：件数
                 MOVE  SKT4000TMP-KENSU (IDX2 3)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4000-TAK-KENSU(IDX1 IDX2)
      *    退職家族：点数
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *           MOVE  SKT4000TMP-TENSU (IDX2 3)  TO  WRK-Z9
      *           MOVE  WRK-Z9   TO  SKT4000-TAK-TENSU(IDX1 IDX2)
                 MOVE  SKT4000TMP-TENSU (IDX2 3)  TO  WRK-Z10
                 MOVE  WRK-Z10  TO  SKT4000-TAK-TENSU(IDX1 IDX2)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
      *    老人：件数
                 MOVE  SKT4000TMP-KENSU (IDX2 4)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4000-RJN-KENSU(IDX1 IDX2)
      *    老人：点数
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *           MOVE  SKT4000TMP-TENSU (IDX2 4)  TO  WRK-Z9
      *           MOVE  WRK-Z9   TO  SKT4000-RJN-TENSU(IDX1 IDX2)
                 MOVE  SKT4000TMP-TENSU (IDX2 4)  TO  WRK-Z10
                 MOVE  WRK-Z10  TO  SKT4000-RJN-TENSU(IDX1 IDX2)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
      *---(01.00.10) LINE ADD START ------------------------------------
      **    食事：件数
      *           MOVE  SKT4000TMP-KENSU (IDX2 5)  TO  WRK-Z5
      *           MOVE  WRK-Z5   TO  SKT4000-SKJ-KENSU(IDX1 IDX2)
      **    食事：点数
      **---(01.00.09) LINE ADD START ------------------------------------
      **         MOVE  SKT4000TMP-TENSU (IDX2 5)  TO  WRK-Z9
      **         MOVE  WRK-Z9   TO  SKT4000-SKJ-TENSU(IDX1 IDX2)
      *           MOVE  SKT4000TMP-TENSU (IDX2 5)  TO  WRK-Z10
      *           MOVE  WRK-Z10  TO  SKT4000-SKJ-TENSU(IDX1 IDX2)
      **---(01.00.09) LINE ADD END   ------------------------------------
      *---(01.00.10) LINE ADD END   ------------------------------------
               END-PERFORM
      *    一時ファイル読込
               PERFORM  900-TMP-READ-SEC
      *---(01.00.10) LINE ADD START ------------------------------------
             END-IF
      *    後期高齢者
             IF  FLG-PRINT2  NOT =  1
      *---(01.00.14) LINE ADD START ------------------------------------
      *         MOVE  SKT4005TMP-PERFNUM  TO  SKT4000-KO-HKNJANUM(IDX1)
               INITIALIZE                       WRK-MAE-INPUT
               MOVE    SKT4005TMP-PERFNUM  TO   WRK-MAE-INPUT
               PERFORM 2009-HENKAN-SEC
               MOVE    WRK-OUT-INPUT     TO   SKT4000-KO-HKNJANUM(IDX1)
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    国保：件数
                 MOVE  SKT4005TMP-KENSU (IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4000-KO-KENSU(IDX1 IDX2)
      *    国保：点数
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *           MOVE  SKT4005TMP-TENSU (IDX2)  TO  WRK-Z9
      *           MOVE  WRK-Z9   TO  SKT4000-KO-TENSU(IDX1 IDX2)
                 MOVE  SKT4005TMP-TENSU (IDX2)  TO  WRK-Z10
                 MOVE  WRK-Z10  TO  SKT4000-KO-TENSU(IDX1 IDX2)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
               END-PERFORM
      *    一時ファイル読込
               PERFORM  901-TMP-READ-SEC
             END-IF
      *---(01.00.10) LINE ADD END   ------------------------------------
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       330-SUM-HEN-SEC      SECTION.
      *
      *    小計処理
           IF    CNT-PAGE    =    1
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     2
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *         MOVE  WRK-KKH-SKENSU (IDX1)   TO  WRK-Z5
      *         MOVE  WRK-Z5          TO  SKT4000-KKH-SKENSU (IDX1)
      *         MOVE  WRK-KKH-STENSU (IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-KKH-STENSU (IDX1)
      *         MOVE  WRK-TAK-SKENSU (IDX1)   TO  WRK-Z5
      *         MOVE  WRK-Z5          TO  SKT4000-TAK-SKENSU (IDX1)
      *         MOVE  WRK-TAK-STENSU (IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-TAK-STENSU (IDX1)
      *         MOVE  WRK-RJN-SKENSU (IDX1)   TO  WRK-Z5
      *         MOVE  WRK-Z5          TO  SKT4000-RJN-SKENSU (IDX1)
      *         MOVE  WRK-RJN-STENSU (IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-RJN-STENSU (IDX1)
      **---(01.00.10) LINE ADD START ------------------------------------
      **         MOVE  WRK-SKJ-SKENSU (IDX1)   TO  WRK-Z5
      **         MOVE  WRK-Z5          TO  SKT4000-SKJ-SKENSU (IDX1)
      ***---(01.00.09) LINE ADD START ------------------------------------
      ***         MOVE  WRK-SKJ-STENSU (IDX1)   TO  WRK-Z9
      ***         MOVE  WRK-Z9          TO  SKT4000-SKJ-STENSU (IDX1)
      **         MOVE  WRK-SKJ-STENSU (IDX1)   TO  WRK-Z10
      **         MOVE  WRK-Z10         TO  SKT4000-SKJ-STENSU (IDX1)
      **---(01.00.09) LINE ADD END   ------------------------------------
      *         MOVE  WRK-KOU-SKENSU (IDX1)   TO  WRK-Z5
      *         MOVE  WRK-Z5          TO  SKT4000-KO-SKENSU (IDX1)
      *         MOVE  WRK-KOU-STENSU (IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-KO-STENSU (IDX1)
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
               MOVE  WRK-KKH-SKENSU (IDX5 IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5          TO  SKT4000-KKH-SKENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *         MOVE  WRK-KKH-STENSU (IDX5 IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-KKH-STENSU (IDX1)
               MOVE  WRK-KKH-STENSU (IDX5 IDX1)   TO  WRK-Z10
               MOVE  WRK-Z10         TO  SKT4000-KKH-STENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
               MOVE  WRK-TAK-SKENSU (IDX5 IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5          TO  SKT4000-TAK-SKENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *         MOVE  WRK-TAK-STENSU (IDX5 IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-TAK-STENSU (IDX1)
               MOVE  WRK-TAK-STENSU (IDX5 IDX1)   TO  WRK-Z10
               MOVE  WRK-Z10         TO  SKT4000-TAK-STENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
               MOVE  WRK-RJN-SKENSU (IDX5 IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5          TO  SKT4000-RJN-SKENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *         MOVE  WRK-RJN-STENSU (IDX5 IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-RJN-STENSU (IDX1)
               MOVE  WRK-RJN-STENSU (IDX5 IDX1)   TO  WRK-Z10
               MOVE  WRK-Z10         TO  SKT4000-RJN-STENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
               MOVE  WRK-KOU-SKENSU (IDX5 IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5          TO  SKT4000-KO-SKENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *         MOVE  WRK-KOU-STENSU (IDX5 IDX1)   TO  WRK-Z9
      *         MOVE  WRK-Z9          TO  SKT4000-KO-STENSU (IDX1)
               MOVE  WRK-KOU-STENSU (IDX5 IDX1)   TO  WRK-Z10
               MOVE  WRK-Z10         TO  SKT4000-KO-STENSU (IDX1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
             END-PERFORM
           END-IF
      *    １ページ目にだけ印字
           IF    CNT-PAGE    =    1
      *    入院合計
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *       MOVE    WRK-N-GKENSU        TO  WRK-Z5
      *       MOVE    WRK-Z5              TO  SKT4000-N-GKENSU
      *       MOVE    WRK-N-GTENSU        TO  WRK-Z9
      *       MOVE    WRK-Z9              TO  SKT4000-N-GTENSU
      **---(01.00.10) LINE ADD START ------------------------------------
      **       COMPUTE WRK-KEISAN-S ROUNDED  =  WRK-N-GTENSU
      **                                     /  WRK-N-GKENSU
      *       COMPUTE   WRK-N-SGKENSU  =  WRK-N-GKENSU
      *                                +  WRK-KOU-SKENSU (1)
      *       MOVE    WRK-N-SGKENSU       TO  WRK-Z5
      *       MOVE    WRK-Z5              TO  SKT4000-N-SGKENSU
      *       COMPUTE   WRK-N-SGTENSU  =  WRK-N-GTENSU
      *                                +  WRK-KOU-STENSU (1)
      *       MOVE    WRK-N-SGTENSU       TO  WRK-Z9
      *       MOVE    WRK-Z9              TO  SKT4000-N-SGTENSU
      *       COMPUTE WRK-KEISAN-S ROUNDED  =  WRK-N-SGTENSU
      *                                     /  WRK-N-SGKENSU
      **---(01.00.10) LINE ADD END ------------------------------------
      *       MOVE    WRK-KEISAN-S        TO   WRK-Z9-S
      *       MOVE    WRK-Z9-S            TO  SKT4000-N-AVG
      *       DISPLAY "１件あたり合計１=" WRK-KEISAN-S
      **    外来合計
      *       MOVE    WRK-G-GKENSU        TO  WRK-Z5
      *       MOVE    WRK-Z5              TO  SKT4000-G-GKENSU
      *       MOVE    WRK-G-GTENSU        TO  WRK-Z9
      *       MOVE    WRK-Z9              TO  SKT4000-G-GTENSU
      **---(01.00.10) LINE ADD START ------------------------------------
      **       COMPUTE WRK-KEISAN-S ROUNDED  =  WRK-G-GTENSU
      **                                     /  WRK-G-GKENSU
      *       COMPUTE   WRK-G-SGKENSU  =  WRK-G-GKENSU
      *                                +  WRK-KOU-SKENSU (2)
      *       MOVE    WRK-G-SGKENSU       TO  WRK-Z5
      *       MOVE    WRK-Z5              TO  SKT4000-G-SGKENSU
      *       COMPUTE   WRK-G-SGTENSU  =  WRK-G-GTENSU
      *                                +  WRK-KOU-STENSU (2)
      *       MOVE    WRK-G-SGTENSU       TO  WRK-Z9
      *       MOVE    WRK-Z9              TO  SKT4000-G-SGTENSU
      *       COMPUTE WRK-KEISAN-S ROUNDED  =  WRK-G-SGTENSU
      *                                     /  WRK-G-SGKENSU
      **---(01.00.10) LINE ADD END ------------------------------------
      *       MOVE    WRK-KEISAN-S        TO  WRK-Z9-S
      *       MOVE    WRK-Z9-S            TO  SKT4000-G-AVG
      *       DISPLAY "１件あたり合計２=" WRK-KEISAN-S
      **
      **---(01.00.10) LINE ADD START ------------------------------------
      **    諸公費合計
      **       MOVE    WRK-KOH-GKENSU(1)    TO  WRK-Z5
      **       MOVE    WRK-Z5              TO  SKT4000-KOH1-GKENSU
      **       MOVE    WRK-KOH-GTENSU(1)    TO  WRK-Z9
      **       MOVE    WRK-Z9              TO  SKT4000-KOH1-GTENSU
      **    地方公費合計
      **       MOVE    WRK-KOH-GKENSU(2)    TO  WRK-Z5
      **       MOVE    WRK-Z5              TO  SKT4000-KOH2-GKENSU
      **       MOVE    WRK-KOH-GTENSU(2)    TO  WRK-Z9
      **       MOVE    WRK-Z9              TO  SKT4000-KOH2-GTENSU
      **
      **       MOVE    WRK-KOH-GKENSU(3)    TO  WRK-Z5
      **       MOVE    WRK-Z5              TO  SKT4000-KOH3-GKENSU
      **       MOVE    WRK-KOH-GTENSU(3)    TO  WRK-Z9
      **       MOVE    WRK-Z9              TO  SKT4000-KOH3-GTENSU
      *       MOVE    WRK-KOH-GKENSU(3)    TO  WRK-Z5
      *       MOVE    WRK-Z5              TO  SKT4000-KOH-GKENSU
      *       MOVE    WRK-KOH-GTENSU(3)    TO  WRK-Z9
      *       MOVE    WRK-Z9              TO  SKT4000-KOH-GTENSU
      **---(01.00.10) LINE ADD END   ------------------------------------
      *
             MOVE    WRK-N-GKENSU(IDX5)  TO  WRK-Z5
             MOVE    WRK-Z5              TO  SKT4000-N-GKENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *       MOVE    WRK-N-GTENSU(IDX5)  TO  WRK-Z9
      *       MOVE    WRK-Z9              TO  SKT4000-N-GTENSU
             MOVE    WRK-N-GTENSU(IDX5)  TO  WRK-Z10
             MOVE    WRK-Z10             TO  SKT4000-N-GTENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
             COMPUTE   WRK-N-SGKENSU (IDX5)  =  WRK-N-GKENSU (IDX5)
                                             +  WRK-KOU-SKENSU(IDX5 1)
             MOVE    WRK-N-SGKENSU (IDX5)    TO  WRK-Z5
             MOVE    WRK-Z5                  TO  SKT4000-N-SGKENSU
             COMPUTE   WRK-N-SGTENSU (IDX5)  =  WRK-N-GTENSU (IDX5)
                                             +  WRK-KOU-STENSU(IDX5 1)
      *=== 点数欄の印字桁数の修正 by hagino(2015/09/14) start
      *       MOVE    WRK-N-SGTENSU (IDX5)    TO  WRK-Z9
      *       MOVE    WRK-Z9                  TO  SKT4000-N-SGTENSU
             MOVE    WRK-N-SGTENSU (IDX5)    TO  WRK-Z10
             MOVE    WRK-Z10                 TO  SKT4000-N-SGTENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/09/14) end
      *=== １件あたり点数の不具合修正 by Yoshikawa(2016/02/08) start
             INITIALIZE                       WRK-KEISAN-S
      *=== １件あたり点数の不具合修正 by Yoshikawa(2016/02/08) end
             COMPUTE WRK-KEISAN-S ROUNDED  =  WRK-N-SGTENSU (IDX5)
                                           /  WRK-N-SGKENSU (IDX5)
             MOVE    WRK-KEISAN-S        TO   WRK-Z9-S
             MOVE    WRK-Z9-S            TO  SKT4000-N-AVG
             DISPLAY "１件あたり合計１=" WRK-KEISAN-S
      *    外来合計
             MOVE    WRK-G-GKENSU (IDX5)     TO  WRK-Z5
             MOVE    WRK-Z5                  TO  SKT4000-G-GKENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *       MOVE    WRK-G-GTENSU (IDX5)     TO  WRK-Z9
      *       MOVE    WRK-Z9                  TO  SKT4000-G-GTENSU
             MOVE    WRK-G-GTENSU (IDX5)     TO  WRK-Z10
             MOVE    WRK-Z10                 TO  SKT4000-G-GTENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
             COMPUTE   WRK-G-SGKENSU (IDX5)  =  WRK-G-GKENSU (IDX5)
                                             +  WRK-KOU-SKENSU(IDX5 2)
             MOVE    WRK-G-SGKENSU (IDX5)    TO  WRK-Z5
             MOVE    WRK-Z5                  TO  SKT4000-G-SGKENSU
             COMPUTE   WRK-G-SGTENSU (IDX5)  =  WRK-G-GTENSU (IDX5)
                                             +  WRK-KOU-STENSU(IDX5 2)
      *=== 点数欄の印字桁数の修正 by hagino(2015/09/14) start
      *       MOVE    WRK-G-SGTENSU (IDX5)    TO  WRK-Z9
      *       MOVE    WRK-Z9                  TO  SKT4000-G-SGTENSU
             MOVE    WRK-G-SGTENSU (IDX5)    TO  WRK-Z10
             MOVE    WRK-Z10                 TO  SKT4000-G-SGTENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/09/14) end
      *=== １件あたり点数の不具合修正 by Yoshikawa(2016/02/08) start
             INITIALIZE                       WRK-KEISAN-S
      *=== １件あたり点数の不具合修正 by Yoshikawa(2016/02/08) end
             COMPUTE WRK-KEISAN-S ROUNDED  =  WRK-G-SGTENSU (IDX5)
                                           /  WRK-G-SGKENSU (IDX5)
             MOVE    WRK-KEISAN-S        TO  WRK-Z9-S
             MOVE    WRK-Z9-S            TO  SKT4000-G-AVG
             DISPLAY "１件あたり合計２=" WRK-KEISAN-S
      *
      *    諸公費合計
             MOVE    WRK-KOH-GKENSU(IDX5 3)  TO  WRK-Z5
             MOVE    WRK-Z5                  TO  SKT4000-KOH-GKENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) start
      *       MOVE    WRK-KOH-GTENSU(IDX5 3)  TO  WRK-Z9
      *       MOVE    WRK-Z9                  TO  SKT4000-KOH-GTENSU
             MOVE    WRK-KOH-GTENSU(IDX5 3)  TO  WRK-Z10
             MOVE    WRK-Z10                 TO  SKT4000-KOH-GTENSU
      *=== 点数欄の印字桁数の修正 by hagino(2015/11/13) end
      *
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
           END-IF
      *
      *
           .
       330-SUM-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       340-PRINT-OUT-SEC                SECTION.
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
           MOVE   "SKT4000.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      **     MOVE    "国保総括表"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保総括表"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保総括表［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保総括表"                TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保総括表［返戻分］"      TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保総括表［特別療養費］"  TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保総括表［返戻分］［特別療養費］" TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) end
      *=== 乳障親分帳票の再印刷タイトル修正 by Yoshikawa(2014/11/11) start
           IF  WRK-PARA-SYOKBN  =  "2"
           AND FLG-UPD  =  0
               MOVE  "国保総括表"                TO  SPRT-TITLE
           END-IF
      *=== 乳障親分帳票の再印刷タイトル修正 by Yoshikawa(2014/11/11) end
           MOVE    SKT4000             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.09) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       340-PRINT-OUT-EXT.
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
      *---(01.00.09) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU4000 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU4000 SEIKYU INVALID ***"
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
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      *****************************************************************
      *    対象公費番号チェック処理
      *****************************************************************
       800-TAISYOKOHI-CHK-SEC                SECTION.
      *
           INITIALIZE     FLG-TAISYO
      *
           PERFORM  VARYING  IDXX  FROM  1  BY  1
                    UNTIL    IDXX  >  100
                    OR       TAISYO-KOHNUM(IDXX)  =  SPACE
             IF  TAISYO-KOHNUM(IDXX)  =  TBL-HKOHNUM(1)
                                     OR  TBL-HKOHNUM(2)
                                     OR  TBL-HKOHNUM(3)
                                     OR  TBL-HKOHNUM(4)
               MOVE     1                   TO  FLG-TAISYO
               MOVE     100                 TO  IDXX
             END-IF
           END-PERFORM
      *
           .
       800-TAISYOKOHI-CHK-EXT.
           EXIT.
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                  RECE10-REC
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID     TO  RECE10-HOSPID.
           MOVE    SPA-HOSPNUM         TO  RECE10-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE10-SKYYM.
           MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  000000              TO  RECE10-SRYYM
             MOVE  999999              TO  RECE10-XXSRYYM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *=== 個別指定時の後期高齢分印字 by Yoshikawa(2009/08/20) start
      *     IF    WRK-PARA-HKNJANUM  NOT = ZERO
      *         MOVE    WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
      *                                        RECE10-XXEDHKNJANUM
      *     ELSE
      *=== 個別指定時の後期高齢分印字 by Yoshikawa(2009/08/20) end
               MOVE    SPACE              TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"         TO  RECE10-XXEDHKNJANUM
      *=== 個別指定時の後期高齢分印字 by Yoshikawa(2009/08/20) start
      *     END-IF
      *=== 個別指定時の後期高齢分印字 by Yoshikawa(2009/08/20) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
      *=== 返戻がある場合の不具合を修正 by hagino(2017/04/04) start
      *                 GO  TO  900-SEIKYU-READ-SEC
                       GO  TO  950-SEIKYU-READ-SEC
      *=== 返戻がある場合の不具合を修正 by hagino(2017/04/04) end
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/01/22) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/01/22) end
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
       950-SEIKYU-CLOSE-EXT.
           EXIT.
      *---(01.00.10) LINE ADD END   ------------------------------------
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT4000TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4000TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4000TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *---(01.00.10) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢集計ファイル読込
      *****************************************************************
       901-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT4005TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4005TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4005TMP
           END-READ
           .
       901-SKTTMP-READ-EXT.
           EXIT.
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
      *****************************************************************
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           PERFORM  VARYING  IDX4  FROM  1  BY  1
                    UNTIL    IDX4  >     4  OR
                    SYU-KOH-HKNNUM(IDX4)  =  SPACE
      *    計算負担金に差が有る場合、地方公費の助成があったと判定する
             IF   SYU-KOH-HKNNUM(IDX4)     =  WRK-KOHNUM
      *=== 乳障親＋特疾無は乳障親に集計しない by Yoshikawa(2011/05/17) start
      *         IF     IDX3                 =  1
               IF     IDX4                 =  1
      *=== 乳障親＋特疾無は乳障親に集計しない by Yoshikawa(2011/05/17) end
                 IF  SYU-SYUCOMPFTN-ENTANI
                                       > SYU-KOH-COMPFTN-ENTANI(IDX4)
                   MOVE  ZERO          TO  FLG-ERR
                 END-IF
               ELSE
                 IF  SYU-KOH-COMPFTN-ENTANI(IDX4 - 1)
                                      >  SYU-KOH-COMPFTN-ENTANI(IDX4)
                   MOVE  ZERO          TO  FLG-ERR
                 END-IF
               END-IF
             END-IF
           END-PERFORM
           .
       800-SEIKYU-SEC-EXT.
           EXIT.
      *
      *****************************************************************
      *  収納情報セット
      *****************************************************************
       920-SYUNOU-SET-SEC  SECTION.
      *
             INITIALIZE  SYUNOU-REC
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
             MOVE  RECE02-NYUGAIKBN   TO  SYU-NYUGAIKBN
             MOVE  RECE02-PTID        TO  SYU-PTID
             MOVE  RECE02-SRYYM(1:6)  TO  SYU-SRYYMD(1:6)
             MOVE  "__"               TO  SYU-SRYYMD(7:2)
             MOVE  WRK-KOHNUM         TO  SYU-KOH-HKNNUM(1)
                                          SYU-KOH-HKNNUM(2)
                                          SYU-KOH-HKNNUM(3)
                                          SYU-KOH-HKNNUM(4)
             MOVE  SYUNOU-REC         TO  MCPDATA-REC
             MOVE  "DBSELECT"         TO  MCP-FUNC
             MOVE    "tbl_syunou"     TO  MCP-TABLE
             MOVE    WRK-PATH         TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"      USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
             IF  MCP-RC  =  ZERO
               PERFORM  925-SYUNOU-READ-SEC
      *
               PERFORM  UNTIL  FLG-SYUNOU  =  1
                 IF  SYU-DENPJTIKBN   NOT = "3"
                   IF    SYU-HKNCOMBINUM  =  RECE02-HKNCOMBI(1) OR
                                             RECE02-HKNCOMBI(2) OR
                                             RECE02-HKNCOMBI(3) OR
                                             RECE02-HKNCOMBI(4) OR
                                             RECE02-HKNCOMBI(5) OR
                                             RECE02-HKNCOMBI(6) OR
                                             RECE02-HKNCOMBI(7) OR
                                             RECE02-HKNCOMBI(8) OR
                                             RECE02-HKNCOMBI(9) OR
                                             RECE02-HKNCOMBI(10) 
                     PERFORM  910-HKNCOMBI-READ-SEC
                     IF  COMB-KOHID(1)    =  WRK-KOHID   OR
                         COMB-KOHID(2)    =  WRK-KOHID   OR
                         COMB-KOHID(3)    =  WRK-KOHID   OR
                         COMB-KOHID(4)    =  WRK-KOHID
                       PERFORM  800-SEIKYU-SEC
                     END-IF
                   END-IF
                 END-IF
      *
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
             MOVE    "tbl_syunou"       TO  MCP-TABLE
             MOVE    WRK-PATH           TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"        USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *
           .
       920-SYUNOU-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    収納読込
      *****************************************************************
       925-SYUNOU-READ-SEC  SECTION.
      *
           MOVE  "tbl_syunou"   TO  MCP-TABLE
           MOVE  WRK-PATH       TO  MCP-PATHNAME
           MOVE  "DBFETCH"      TO  MCP-FUNC
           CALL  "ORCDBMAIN"    USING
                                MCPAREA
                                MCPDATA-REC
                                SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  SYUNOU-REC
             MOVE  ZERO         TO  FLG-SYUNOU
           ELSE
             INITIALIZE  SYUNOU-REC
             MOVE  1  TO  FLG-SYUNOU
           END-IF
      *
           .
       925-SYUNOU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険組合せマスター読み込み
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                      HKNCOMBI-REC
           MOVE    SPA-HOSPNUM            TO  COMB-HOSPNUM
           MOVE    SYU-PTID               TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM        TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC           TO  MCPDATA-REC
           MOVE    "DBSELECT"             TO  MCP-FUNC
           MOVE    "tbl_hkncombi"         TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"              TO  MCP-FUNC
               MOVE    "tbl_hkncombi"     TO  MCP-TABLE
               MOVE    "key"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"        USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC     TO  HKNCOMBI-REC
                   MOVE    ZERO            TO  FLG-HKNCOMBI
               ELSE
                   INITIALIZE                  HKNCOMBI-REC
                   MOVE    1               TO  FLG-HKNCOMBI
               END-IF
           ELSE
               INITIALIZE                 HKNCOMBI-REC
               MOVE    1              TO  FLG-HKNCOMBI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"    TO  MCP-FUNC
           MOVE    "tbl_hkncombi"     TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    WRK-PARA-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
               PERFORM  900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-START-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求書マスタＲＥＡＤ 03/11/04 INS
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      *---(01.00.15) LINE ADD START ------------------------------------
      **---(01.00.06) LINE ADD START ------------------------------------
      **         IF  RECE02-KOHNUM (1)  =  "180"  OR
      **             RECE02-KOHNUM (2)  =  "180"  OR
      **             RECE02-KOHNUM (3)  =  "180"  OR
      **             RECE02-KOHNUM (4)  =  "180"  OR
      **             RECE02-KOHNUM (1)  =  "181"  OR
      **             RECE02-KOHNUM (2)  =  "181"  OR
      **             RECE02-KOHNUM (3)  =  "181"  OR
      **             RECE02-KOHNUM (4)  =  "181"  OR
      **             RECE02-KOHNUM (1)  =  "190"  OR
      **             RECE02-KOHNUM (2)  =  "190"  OR
      **             RECE02-KOHNUM (3)  =  "190"  OR
      **             RECE02-KOHNUM (4)  =  "190"
      *         IF  RECE02-KOHNUM (1)  =  "180"  OR
      *             RECE02-KOHNUM (2)  =  "180"  OR
      *             RECE02-KOHNUM (3)  =  "180"  OR
      *             RECE02-KOHNUM (4)  =  "180"  OR
      *             RECE02-KOHNUM (1)  =  "181"  OR
      *             RECE02-KOHNUM (2)  =  "181"  OR
      *             RECE02-KOHNUM (3)  =  "181"  OR
      *             RECE02-KOHNUM (4)  =  "181"  OR
      *             RECE02-KOHNUM (1)  =  "190"  OR
      *             RECE02-KOHNUM (2)  =  "190"  OR
      *             RECE02-KOHNUM (3)  =  "190"  OR
      *             RECE02-KOHNUM (4)  =  "190"  OR
      *             RECE02-KOHNUM (1)  =  "281"  OR
      *             RECE02-KOHNUM (2)  =  "281"  OR
      *             RECE02-KOHNUM (3)  =  "281"  OR
      *             RECE02-KOHNUM (4)  =  "281"
      **---(01.00.06) LINE ADD END   ------------------------------------
      **---(01.00.08) LINE ADD START ------------------------------------
      *         OR  RECE02-KOHNUM (1)  =  "290"
      *         OR  RECE02-KOHNUM (2)  =  "290"
      *         OR  RECE02-KOHNUM (3)  =  "290"
      *         OR  RECE02-KOHNUM (4)  =  "290"
      **---(01.00.08) LINE ADD END   ------------------------------------
      *=== 印字対象番号追加 by Yoshikawa(2008/12/11) start
      *         IF  RECE02-KOHNUM(1)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490"
      *         OR  RECE02-KOHNUM(2)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490"
      *         OR  RECE02-KOHNUM(3)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490"
      *         OR  RECE02-KOHNUM(4)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490"
      *=== 印字対象番号追加 by Yoshikawa(2009/10/30) start
      *         IF  RECE02-KOHNUM(1)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590"
      *         OR  RECE02-KOHNUM(2)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590"
      *         OR  RECE02-KOHNUM(3)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590"
      *         OR  RECE02-KOHNUM(4)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590"
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      *         IF  RECE02-KOHNUM(1)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590" OR "690" OR "780"
      *         OR  RECE02-KOHNUM(2)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590" OR "690" OR "780"
      *         OR  RECE02-KOHNUM(3)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590" OR "690" OR "780"
      *         OR  RECE02-KOHNUM(4)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290" OR "280" OR "380" OR "381"
      *                              OR "390" OR "490" OR "480" OR "481"
      *                              OR "590" OR "690" OR "780"
               INITIALIZE                          TBL-HIKAKU-KOHI
               MOVE    RECE02-KOHNUM(1)        TO  TBL-HKOHNUM(1)
               MOVE    RECE02-KOHNUM(2)        TO  TBL-HKOHNUM(2)
               MOVE    RECE02-KOHNUM(3)        TO  TBL-HKOHNUM(3)
               MOVE    RECE02-KOHNUM(4)        TO  TBL-HKOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== 印字対象番号追加 by Yoshikawa(2009/10/30) end
      *=== 印字対象番号追加 by Yoshikawa(2008/12/11) end
      *---(01.00.15) LINE ADD END   ------------------------------------
      *        テスト患者のときは読み飛ばす
                   MOVE    SPACE               TO  PTINF-REC
                   INITIALIZE                      PTINF-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *             MOVE    RECE02-HOSPID       TO  PTINF-HOSPID
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
                   MOVE    RECE02-PTID         TO  PTINF-PTID
                   MOVE    PTINF-REC           TO  MCPDATA-REC
                   PERFORM 800-PTINF-READ-SEC
                   IF      FLG-PTINF           =   ZERO
                   AND     PTINF-TSTPTNUMKBN   =   "1"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
      *        社保かどうか
                   IF  RECE02-TEISYUTUSAKI  =  "2"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 乳障親は当月と返戻を合算 by Yoshikawa(2010/06/29) start
      **=== 返戻時の乳障母欄の不具合対応 by Yoshikawa(2010/06/10) start
      **        返戻の乳障母データがあるかどうか
      *             EVALUATE  WRK-PARA-SYOKBN
      *               WHEN  "1"
      *                 IF  RECE02-HENREIYM  NOT =  ZERO
      *                   GO  TO  900-KOHSKY-READ-SEC
      *                 END-IF
      *               WHEN  "2"
      *                 IF  RECE02-HENREIYM      =  ZERO
      *                   GO  TO  900-KOHSKY-READ-SEC
      *                 END-IF
      *             END-EVALUATE
      **=== 返戻時の乳障母欄の不具合対応 by Yoshikawa(2010/06/10) end
      *=== 乳障親は当月と返戻を合算 by Yoshikawa(2010/06/29) end
               ELSE
                 GO  TO  900-KOHSKY-READ-SEC
               END-IF
           ELSE
               MOVE    1               TO  FLG-END
               PERFORM  900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタCLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC  SECTION.
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       900-KOHSKY-CLOSE-EXT.
           EXIT.
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/06/18) end
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_ptinf"             TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"                USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
               MOVE    "tbl_ptinf"             TO  MCP-TABLE
               MOVE    "key"                   TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"             USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_ptinf"             TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       910-SYSKANRI-INV-SEC         SECTION.
      *
      *
           MOVE    "DBSELECT"                     TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                      TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_syskanri"       TO  MCP-TABLE
               MOVE    "key10"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"                TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC                  =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY          TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
           READ  SKT4000TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *    ２回処理するので該当者以外は印字対象外
               NOT AT END
                   IF  IDX5  =  1
                       IF  SKT4000TMP-GENMEN  NOT =  ZERO
                           GO  TO  900-TMP-READ-SEC
                       END-IF
                   ELSE
                       IF  SKT4000TMP-GENMEN  =  ZERO
                           GO  TO  900-TMP-READ-SEC
                       END-IF
                   END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *---(01.00.10) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢一時ファイル読込
      *****************************************************************
       901-TMP-READ-SEC                SECTION.
      *
           READ  SKT4005TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT2
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) start
      *    ２回処理するので該当者以外は印字対象外
               NOT AT END
                   IF  IDX5  =  1
                       IF  SKT4005TMP-GENMEN  NOT =  ZERO
                           GO  TO  901-TMP-READ-SEC
                       END-IF
                   ELSE
                       IF  SKT4005TMP-GENMEN  =  ZERO
                           GO  TO  901-TMP-READ-SEC
                       END-IF
                   END-IF
      *=== 中国九州北部豪雨対応 by Uchida(2009/10/14) end
           END-READ
           .
       901-TMP-READ-EXT.
           EXIT.
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
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
           MOVE    SPACE               TO  SYS-1901-REC
           INITIALIZE                      SYS-1901-REC
           MOVE    "1901"              TO  SYS-1901-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1901-KBNCD
           MOVE    SPA-HOSPNUM         TO  SYS-1901-HOSPNUM
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
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
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1903-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD (1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE  "DBOPEN"   TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"              USING
      *                                 MCPAREA
      *                                 MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE  "DBSTART"  TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"              USING
      *                                 MCPAREA
      *                                 MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC  SECTION.
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE  "DBCOMMIT"      TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"              USING
      *                                 MCPAREA
      *                                 MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE  "DBDISCONNECT"  TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"              USING
      *                                 MCPAREA
      *                                 MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
