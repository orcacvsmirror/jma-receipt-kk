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
       PROGRAM-ID.             SOKATU4020.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 診療報酬請求書(組合用)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/04/19    有村          再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    有村    05/05/06    医療機関情報取得条件修正
      *  01.00.02    有村    05/07/12    公費一部負担金、公費患者負担額
      *                                  の集計方法修正
      *                                  本人と家族が同一給付割合の
      *                                  場合は家族欄に集計するよう修正
      *  01.00.03    高嶋    05/10/31    ７割追加対応
      *                                  薬剤一部負担金削除対応
      *  01.00.04    内田    05/11/14    公費用帳票様式の変更
      *  01.00.05    内田    07/01/30    印字対象番号の追加（２８１）
      *  01.00.06    内田    07/06/15    熊本水俣１４５を印字対象とする
      *  01.00.07    内田    07/08/08    印字対象番号の追加（290）
      *  01.00.08    内田    07/10/10    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.09    内田    07/11/28    「43被爆」の一部負担金欄は
      *                                  保険の一部負担金を印字
      *  01.00.10    内田    08/04/25    帳票様式の変更に伴う修正
      *                                  SPA-AREA初期化
      *  01.00.11    門間    08/10/29    シス管「2007」公費まとめ対応
      *  01.00.12    吉川    08/10/31    一部の公費番号がシス管「2007」の
      *                                  まとめ対象にならないのを修正
      *  01.00.13    吉川    08/11/26    印字対象番号の追加
      *                                  （280,380,381,390,490）
      *  01.00.14    吉川    08/12/11    印字対象番号の追加（480,481,590）
      *  01.00.15    内田    09/10/14    中国九州北部豪雨対応（対象者別集計）
      *  01.00.16    吉川    09/10/30    印字対象番号の追加（690,780）
      *  01.00.17    吉川    09/11/06    シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *  01.00.18    吉川    10/01/22    オンライン返戻対応
      *  01.00.19    吉川    11/02/09    特別療養費国保対応
      *  01.00.20    吉川    11/03/11    シス管2007のまとめ公費の法別番号が
      *                                  印字されない場合があるのを修正
      *  01.00.21    吉川    11/12/07    まとめ公費を281で登録した場合
      *                                  まとめた公費が印字されないのを修正
      *  01.00.22    吉川    12/01/13    特別療養費は専用の請求書に集計
      *  01.00.23    吉川    12/05/17    在宅はまとめて集計するように修正
      *  01.00.24    吉川    12/07/04    シス管「2010」の公費再掲欄への
      *                                  地方公費記載設定対応
      *  01.00.25    吉川    13/01/22    医療機関情報編集対応
      *  01.00.26    吉川    13/02/07    プラグイン対応
      *  01.00.27    吉川    13/09/04    プログラムオプション対応
      *  01.00.28    萩野    14/09/11    返戻時、再印刷画面のタイトル修正
      *  01.00.29    吉川    14/10/27    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.30    萩野    15/11/13    医療機関編集情報への開設者名追加対応
      *  01.00.31    吉川    16/10/03    公費番号まとめ情報の公費番号の追加
      *  01.00.32    門間    17/03/14    医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.33    吉川    17/10/16    SITEKBN変更
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT4020TMP-FILE ASSIGN    SKT4020TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4020TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4020.
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT4020TMP-FILE.
           COPY    "CPSKT4020TMP.INC".
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4020TP//.
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *---(01.00.08) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT4030.INC".
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *     COPY    "SKT4020.INC".
           COPY    "SKT4050.INC".
      *=== ７割追加対応 By Takashima(2006/10/31) end
           COPY    "SKT4040.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT4020         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT4020TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-SYUNOU          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
           03  FLG-2010            PIC 9(01).
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    添字領域
       01  IDX-AREA.
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
           03  IDX                 PIC 9(05).
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
      *---(01.00.11) LINE ADD START MONMA ------------------------------
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *---(01.00.11) LINE ADD END   MONMA ------------------------------
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) start
           03  IDZ                 PIC 9(04).
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) end
      *
      *##  パラメタ領域（地方公費仕様）
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.08) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.08) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU4020".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/02/07) start
      *     03  FILE-NAME           PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *
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
           03  WRK-HKNJANAME       PIC X(20).
           03  WRK-ITBFTN-G        PIC 9(09).
           03  WRK-ITBFTN          PIC 9(08).
      *---(01.00.11) LINE ADD START MONMA ------------------------------
           03  WRK-KOHNAME         PIC X(10).
      *---(01.00.11) LINE ADD END   MONMA ------------------------------
      *
           03  WRK-Z2              PIC ZZ.
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z4              PIC ZZZZ.
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
      *    文字変換
           03  WRK-MAE-INPUT           PIC X(200).
           03  WRK-OUT-INPUT           PIC X(200).
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           03  WRK-PATH2             PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
           03  WRK-YUSEN           PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
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
      *---(01.00.08) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
           03  CNT-KOH             PIC 9(02).
           03  CNT-PRINTKOH        PIC 9(02).
           03  CNT-GENBAKU         PIC 9(01).
      *
      *---(01.00.11) LINE ADD START MONMA ------------------------------
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) start
      *                             PIC X(03)   OCCURS  10.
                                   PIC X(03)   OCCURS  30.
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) end
           03  WRK-2007-MAX        PIC 9(03).
      *---(01.00.11) LINE ADD END MONMA --------------------------------
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
       01  WRK-2010-AREA.
           03  WRK-2010-TBL          OCCURS  100.
               05  WRK-2010-KOHNUM   PIC X(03).
           03  WRK-2010-MAX          PIC 9(03).
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.08) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *---(01.00.11) LINE ADD START MONMA ------------------------------
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *---(01.00.11) LINE ADD END   MONMA ------------------------------
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
       01  PRTKANRI-REC.
           COPY    "CPPRTKANRI.INC".
      *
       01  PRTDATA-REC.
           COPY    "CPPRTDATA.INC".
      *
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
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
           INITIALIZE                  IDX-AREA
      *---(01.00.10) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
           DISPLAY  "START"
      *
           PERFORM 100-DBOPEN-SEC
      *
      *###（地方公費仕様）
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *                                         WRK-PARA-TOKUBETU
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *---(01.00.08) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.08) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) start
      *    特別療養費は集計しない
           MOVE    "1"             TO  WRK-PARA-TOKUBETU
      *=== 特療費は専用の請求書へ by Yoshikawa(2012/01/13) end
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU4020"    TO  JOB-PGID
           MOVE    "国保請求書(組合用)"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
           MOVE    "SKT4020"           TO  SKT4020TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4020TP-TERMID
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4020TP-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           MOVE  SKT4020TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT4020TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
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
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.11) LINE ADD START MONMA ------------------------------
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
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) start
               MOVE    ZERO                TO  IDZ
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) end
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       10
                       OR      SYS-2007-KOHNUM (IDX2)   =   SPACE
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) start
      *             MOVE    SYS-2007-KOHNUM (IDX2)
      *                                     TO WRK-2007-KOHNUM(IDX1 IDX2)
                   ADD     1               TO  IDZ
                   MOVE    SYS-2007-KOHNUM (IDX2)
                                           TO  WRK-2007-KOHNUM(IDX1 IDZ)
               END-PERFORM
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       20
                       OR      SYS-2007-KOHNUM1(IDX2)   =   SPACE
                   ADD     1               TO  IDZ
                   MOVE    SYS-2007-KOHNUM1(IDX2)
                                           TO  WRK-2007-KOHNUM(IDX1 IDZ)
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) end
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
      *---(01.00.11) LINE ADD END   MONMA ------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *     PERFORM  110-INI-FILE-SEC
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      **---(01.00.08) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.08) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.08) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.08) LINE ADD END   ------------------------------------
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
      *  
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
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
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
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
           MOVE    "SOKATU4020"              TO  WRK-PRGID
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT4020TMP-FILE
           CLOSE            SKT4020TMP-FILE
           OPEN     I-O     SKT4020TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT4020TMP-FILE
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
           DISPLAY "*** SOKATU4020 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU4020 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------

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
           INITIALIZE       SKT4020TMP-REC
           INITIALIZE       SKT4020TMP-HKNJANUM
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT4020TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT4020TMP-HKNJANUM(1:6)
           END-IF
      *
      *    在宅・在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) start
      *     MOVE    RECE10-ZAITAKU        TO  SKT4020TMP-ZAITAKU
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) end
      *
      *    印字順設定
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *     IF    YUSEN-HKNJANUM   =  SKT4020TMP-HKNJANUM
           IF    WRK-YUSEN        =  SKT4020TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
             MOVE          1   TO    SKT4020TMP-SYUTURYOKU
           ELSE
             IF    RECE10-PREFKBN    =    "1"
               IF    SKT4020TMP-HKNJANUM(3:1) NOT  =  "3"
                 MOVE      2   TO    SKT4020TMP-SYUTURYOKU
               ELSE
                 IF    SKT4020TMP-HKNJANUM(1:2)  =  "40"
                   MOVE    3   TO    SKT4020TMP-SYUTURYOKU
                 ELSE
                   MOVE    4   TO    SKT4020TMP-SYUTURYOKU
                 END-IF
               END-IF
             ELSE
               MOVE        9   TO    SKT4020TMP-SYUTURYOKU
             END-IF
           END-IF
      *
      *=== 中国九州北部豪雨対応 Uchida(2009/10/14) start
      *    中国九州北部豪雨の対象者は別帳票
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  RECE10-ETC-YKZFTN (1)    TO  SKT4020TMP-GENMEN
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
      *    入外区分
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1      TO   IDX2
           ELSE
             MOVE  2      TO   IDX2
           END-IF
      *
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *       IF  RECE10-KYURATE  =  9
      *         MOVE  7   TO   IDX1
      *       ELSE
      *         MOVE  8   TO   IDX1
      *       END-IF
      *------------------------------------------------------
             IF  RECE10-KYURATE  =  9
      *        老人９割
               MOVE  8   TO   IDX1
             ELSE
               IF  RECE10-KYURATE  =  8
      *          老人８割
                 MOVE  9   TO   IDX1
               ELSE
      *          老人７割
                 MOVE  10   TO   IDX1
               END-IF
             END-IF
      *=== ７割追加対応 By Takashima(2006/10/31) end
             MOVE    1    TO    SKT4020TMP-PAGE2-FLG
           ELSE
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *         IF  RECE10-AGE  >= 70
      *           IF  RECE10-KYURATE  =  9
      *             MOVE    1     TO    IDX1
      *           ELSE
      *             MOVE    2     TO    IDX1
      *           END-IF
      *         ELSE
      *           IF  RECE10-AGE  >= 3
      **    その他の分類は無し
      *             IF    RECE10-HONKZKKBN  =  "1"
      *               MOVE  3     TO    IDX1
      *               MOVE    RECE10-KYURATE  TO
      *                           SKT4020TMP-KYURATE(1 IDX2)
      *             ELSE
      *               MOVE  4     TO    IDX1
      *               MOVE    RECE10-KYURATE  TO
      *                           SKT4020TMP-KYURATE(2 IDX2)
      *             END-IF
      *           ELSE
      *             MOVE    6     TO    IDX1
      *           END-IF
      *         END-IF
      *------------------------------------------------------
               IF  RECE10-AGE  >= 70
      *          国保９割
                 IF  RECE10-KYURATE  =  9
                   MOVE    1     TO    IDX1
                 ELSE
      *            国保８割
                   IF  RECE10-KYURATE  =  8
                     MOVE    2     TO    IDX1
      *            国保７割
                   ELSE
                     MOVE    3     TO    IDX1
                   END-IF
                 END-IF
               ELSE
      *---(01.00.10) LINE ADD START ------------------------------------
                 IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                     MOVE  7     TO  IDX1
                 ELSE
      *---(01.00.10) LINE ADD END   ------------------------------------
                   IF  RECE10-AGE  >= 3
      *    給付割合で分ける
                     EVALUATE  RECE10-KYURATE
                       WHEN  8
                         MOVE  4  TO  IDX1
                       WHEN  7
                         MOVE  5  TO  IDX1
                       WHEN  OTHER
                         MOVE  6  TO  IDX1
                         MOVE  RECE10-KYURATE  TO
                               SKT4020TMP-KYURATE(IDX2)
                     END-EVALUATE
                   ELSE
                     MOVE    7     TO    IDX1
                   END-IF
      *---(01.00.10) LINE ADD START ------------------------------------
                 END-IF
      *---(01.00.10) LINE ADD END   ------------------------------------
               END-IF
      *=== ７割追加対応 By Takashima(2006/10/31) end
             MOVE    1    TO    SKT4020TMP-PAGE1-FLG
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      **    公費負担分
           IF  RECE10-KOHNUM (1)   NOT =   SPACE  OR
               RECE10-KOHNUM (2)   NOT =   SPACE  OR
               RECE10-KOHNUM (3)   NOT =   SPACE  OR
               RECE10-KOHNUM (4)   NOT =   SPACE
                 PERFORM  220-KOH-SYUKEI-SEC
           END-IF
           IF  RECE10-ETC-KOHNUM (1)  = "019"  OR
               RECE10-ETC-KOHNUM (2)  = "019"  OR
               RECE10-ETC-KOHNUM (3)  = "019"  OR
               RECE10-ETC-KOHNUM (4)  = "019"
               PERFORM 221-GENBK-SYUKEI-SEC
           END-IF
      *
           IF  FLG-SKT4020TMP  =  1
               WRITE    SKT4020TMP-REC
           ELSE
               REWRITE  SKT4020TMP-REC
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
      *    療養の給付：件数
           ADD   1                  TO  SKT4020TMP-KENSU (IDX1 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(1)    TO  SKT4020TMP-NISSU(IDX1 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(1)  TO  SKT4020TMP-TENSU(IDX1 IDX2)
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *    療養の給付：薬剤一部負担金
      *     ADD  RECE10-YKZFTN(1)    TO  SKT4020TMP-YKZFTN(IDX1 IDX2)
      *=== ７割追加対応 By Takashima(2006/10/31) end
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1)  TO  SKT4020TMP-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  0
      *    食事療養:件数
             ADD   1  TO  SKT4020TMP-S-KENSU(IDX1)
           END-IF
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(1)  TO  SKT4020TMP-S-NISSU(IDX1)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(1) TO SKT4020TMP-S-KINGK(IDX1)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(1)    TO  SKT4020TMP-S-FTNGK(IDX1)
      *
           MOVE    1               TO  FLG-UPD 
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理(老人併用)
      *****************************************************************
       220-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *    ５１、９１と４１老人は１つにまとめる
            IF    RECE10-KOHNUM(IDX3)  =  "091"
              MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
            END-IF
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
            MOVE    ZERO                  TO  FLG-2010
      *
      *     請求書公費再掲欄記載情報があるとき
            IF  WRK-2010-MAX  >  ZERO
              PERFORM VARYING IDZ1    FROM    1   BY  1
                      UNTIL   IDZ1    >       WRK-2010-MAX
                IF  RECE10-KOHNUM(IDX3)  =  WRK-2010-KOHNUM(IDZ1)
                  MOVE    1               TO  FLG-2010
                  MOVE    WRK-2010-MAX    TO  IDZ1
                END-IF
              END-PERFORM
            END-IF
      *
            IF  FLG-2010  =  ZERO
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
      *=== シス管「2007」判定の修正 by Yoshikawa(2008/10/31) start
      *      公費番号まとめ情報があるとき
            MOVE  SPACE     TO  WRK-KOHNAME
            IF  WRK-2007-MAX  >  ZERO
              PERFORM VARYING IDZ1    FROM    1   BY  1
                      UNTIL   IDZ1    >       WRK-2007-MAX
                PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) start
      *                  UNTIL   IDZ2  >       5
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) start
      *                  UNTIL   IDZ2  >       10
                        UNTIL   IDZ2  >       20
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) end
                        OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                  IF  RECE10-KOHNUM(IDX3)  
                                =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                    MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                TO  RECE10-KOHNUM (IDX3)
                    MOVE  WRK-2007-MEISYO (IDZ1)
                                TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) start
      *              MOVE  5             TO  IDZ2
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) start
      *              MOVE  10            TO  IDZ2
                    MOVE  20            TO  IDZ2
      *=== 公費番号まとめ追加 by Yoshikawa(2016/10/03) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/06) end
                    MOVE  WRK-2007-MAX  TO  IDZ1
                  END-IF
                END-PERFORM
              END-PERFORM
            END-IF
      *=== シス管「2007」判定の修正 by Yoshikawa(2008/10/31) end
      *
      *=== まとめ公費の法別印字不具合対応 by Yoshikawa(2011/03/11) start
      *      IF    RECE10-KOHNUM(IDX3)  =  "241" OR "341"
      *        MOVE    "141"       TO    RECE10-KOHNUM(IDX3)
      *      END-IF
      **---(01.00.05) LINE ADD START ------------------------------------
      **    ８１乳幼児は１つにまとめる
      *      IF    RECE10-KOHNUM(IDX3)  =  "281"
      *        MOVE    "181"       TO    RECE10-KOHNUM(IDX3)
      *      END-IF
      **---(01.00.05) LINE ADD END   ------------------------------------
      **---(01.00.07) LINE ADD START ------------------------------------
      **    ９０母子は１つにまとめる
      *      IF    RECE10-KOHNUM(IDX3)  =  "290"
      *        MOVE    "190"       TO    RECE10-KOHNUM(IDX3)
      *      END-IF
      **---(01.00.07) LINE ADD END   ------------------------------------
      *=== まとめ公費の法別印字不具合対応 by Yoshikawa(2011/03/11) end
      *
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
      **    全国共通公費と４１老人、乳障母を対象にする
      *      IF  RECE10-KOHNUM (IDX3)(1:1) = "0"
      *          OR  RECE10-KOHNUM(IDX3)  =  "141" OR "241"
      **---(01.00.03) LINE ADD START ------------------------------------
      *                          OR "180" OR "181" OR "190" OR "341"
      **---(01.00.03) LINE ADD END   ------------------------------------
      **---(01.00.07) LINE ADD START ------------------------------------
      **---(01.00.06) LINE ADD START ------------------------------------
      **                          OR "145"
      **---(01.00.06) LINE ADD END   ------------------------------------
      *                          OR "145" OR "290"
      **---(01.00.07) LINE ADD END   ------------------------------------
      **=== 印字対象番号追加 by Yoshikawa(2008/11/26) start
      *                          OR "280" OR "380" OR "381" 
      *                          OR "390" OR "490"
      **=== 印字対象番号追加 by Yoshikawa(2008/11/26) end
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) start
      *                          OR "480" OR "481" OR "590" 
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) end
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) start
      *                          OR "690" OR "780"
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) end
      **=== 印字対象番号追加 by Yoshikawa(2011/12/07) start
      *                          OR "281"
      **=== 印字対象番号追加 by Yoshikawa(2011/12/07) end
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
             MOVE    1    TO    SKT4020TMP-PAGE2-FLG
      *
      *=== シス管「2007」判定の修正 by Yoshikawa(2008/10/31) start
      **---(01.00.11) LINE ADD START MONMA ------------------------------
      *      公費番号まとめ情報があるとき
      *       IF  WRK-2007-MAX  >  ZERO
      *         MOVE  SPACE     TO  WRK-KOHNAME
      *         PERFORM VARYING IDZ1    FROM    1   BY  1
      *                 UNTIL   IDZ1    >       WRK-2007-MAX
      *           PERFORM VARYING IDZ2  FROM    1   BY  1
      *                   UNTIL   IDZ2  >       5
      *                   OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
      *             IF  RECE10-KOHNUM(IDX3)  
      *                           =   WRK-2007-KOHNUM(IDZ1 IDZ2)
      *               MOVE  WRK-2007-KOHNUM(IDZ1 1)
      *                           TO  RECE10-KOHNUM (IDX3)
      *               MOVE  WRK-2007-MEISYO (IDZ1)
      *                           TO  WRK-KOHNAME
      *               MOVE  5             TO  IDZ2
      *               MOVE  WRK-2007-MAX  TO  IDZ1
      *             END-IF
      *           END-PERFORM
      *         END-PERFORM
      *       END-IF
      **---(01.00.11) LINE ADD END    MONMA ------------------------------
      *=== シス管「2007」判定の修正 by Yoshikawa(2008/10/31) end
      *
      *    公費判別
             PERFORM  VARYING  IDX4  FROM  1  BY  1
                      UNTIL    IDX4  >     20
                      OR       SKT4020TMP-KOHNUM (IDX4) = SPACE
               IF  RECE10-KOHNUM (IDX3)  =  SKT4020TMP-KOHNUM (IDX4)
                   MOVE  IDX4  TO  CNT-KOH
                   MOVE  20    TO  IDX4
               END-IF
             END-PERFORM
      *
      *    該当公費がなかった場合
             IF  IDX4  < 20
               MOVE  IDX4  TO  CNT-KOH
             END-IF
      *
      *    公費名
             MOVE  RECE10-KOHNUM(IDX3)  TO  SKT4020TMP-KOHNUM(CNT-KOH)
      *---(01.00.11) LINE ADD START MONMA ------------------------------
      *    公費名称
             MOVE  WRK-KOHNAME      TO  SKT4020TMP-KOHNAME(CNT-KOH)
      *---(01.00.11) LINE ADD END   MONMA ------------------------------
      *    療養の給付：件数
             ADD   1  TO  SKT4020TMP-KKENSU (CNT-KOH IDX2)
      *    療養の給付:診療実日数
             ADD  RECE10-JNISSU(IDX3 + 1)  TO
                               SKT4020TMP-KNISSU(CNT-KOH IDX2)
      *    療養の給付：点数
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT4020TMP-KTENSU(CNT-KOH IDX2)
      *---(01.00.04) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *       ADD  RECE10-YKZFTN(IDX3 + 1)  TO
      *                         SKT4020TMP-KYKZFTN(CNT-KOH IDX2)
      *---(01.00.04) LINE ADD END   ------------------------------------
      ***** 05/07/12 DEL
      **    療養の給付：一部負担金
      *         ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
      *                         SKT4020TMP-KITBFTN(CNT-KOH IDX2)
      ***** 05/07/12 INS
             ADD     RECE10-FTNMONEY(1)
                             TO  SKT4020TMP-KITBFTN(CNT-KOH IDX2)
             ADD     RECE10-FTNMONEY(IDX3 + 1)
                             TO  SKT4020TMP-KPTFTN(CNT-KOH IDX2)
      *****
             IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養:件数
               ADD   1  TO  SKT4020TMP-S-KKENSU(CNT-KOH)
             END-IF
      *    食事療養:日数
             ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                               SKT4020TMP-S-KNISSU(CNT-KOH)
      *    食事療養：金額
             ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT4020TMP-S-KKINGK(CNT-KOH)
      *    食事療養：標準負担額
             ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
                               SKT4020TMP-S-KFTNGK(CNT-KOH)
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) start
      *      END-IF
            ELSE
                MOVE    1                   TO  FLG-UPD
            END-IF     
      *=== シス管「2010」地方公費記載対応 by Yoshikawa(2012/07/04) end
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    医療保険・一般国保分集計処理
      *****************************************************************
       221-GENBK-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                  TO  SKT4020TMP-GKENSU (IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-ETC-JNISSU(1)    TO  SKT4020TMP-GNISSU(IDX2)
      *    療養の給付：点数
           ADD  RECE10-ETC-TOTALTEN(1)  TO  SKT4020TMP-GTENSU(IDX2)
      *    療養の給付：一部負担金
      *---(01.00.09) LINE ADD START ------------------------------------
      *     IF      RECE10-FTNMONEY(1)  >   ZERO
      *         ADD RECE10-ETC-FTNMONEY(1)  
      *                                  TO  SKT4020TMP-GITBFTN(IDX2)
      *     END-IF
           ADD  RECE10-FTNMONEY(1)      TO  SKT4020TMP-GITBFTN(IDX2)
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           IF  RECE10-ETC-SHOKUJINISSU(1)  >  0
      *    食事療養:件数
             ADD   1  TO  SKT4020TMP-S-GKENSU
           END-IF
      *    食事療養:日数
           ADD  RECE10-ETC-SHOKUJINISSU(1)  TO  SKT4020TMP-S-GNISSU
      *    食事療養：金額
           ADD  RECE10-ETC-SHOKUJIRYOYOHI(1) TO SKT4020TMP-S-GKINGK
      *    食事療養：標準負担額
           ADD  RECE10-ETC-SHOKUJIFTN(1)    TO  SKT4020TMP-S-GFTNGK
      *
           .
       221-GENBK-SYUKEI-EXT.
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
           OPEN     INPUT       SKT4020TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *    １枚目にデータが有る時だけ印刷する
             IF    SKT4020TMP-PAGE1-FLG  =  1
      *        帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *        帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *        帳票印刷処理
               PERFORM 330-PRINT-OUT-SEC
             END-IF
      *    老人の併用公費分
      *    ２枚目に印刷するデータが有る時だけ印刷する
             IF    SKT4020TMP-PAGE2-FLG  =  1
               MOVE    1    TO    WRK-CNT
               MOVE    ZERO TO    FLG-PASS
      *          帳票編集<見出し>処理
                 PERFORM 311-HEAD-HEN-SEC
      *          帳票編集<明細>処理
                 PERFORM 321-BODY-HEN-SEC
      *          帳票印刷処理
                 PERFORM 331-PRINT-OUT-SEC
                 MOVE    1    TO    FLG-PASS
                 PERFORM  UNTIL  
                        SKT4020TMP-KOHNUM(WRK-CNT) = SPACE
      *            帳票編集<見出し>処理
                   PERFORM 312-HEAD-HEN-SEC
      *            帳票編集<明細>処理
                   PERFORM 322-BODY-HEN-SEC
      *            帳票印刷処理
                   PERFORM 332-PRINT-OUT-SEC
                 END-PERFORM
             END-IF
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT4020TMP-FILE
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
           INITIALIZE                    SKT4030
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT4030-SRYYM
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT4030-SEIYMD
      *---(01.00.08) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4030-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4030-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT4030-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4030-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4030-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4030-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT4030-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT4030-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *---(01.00.08) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4030-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4030-TEL
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    保険者番号
           INITIALIZE                        WRK-MAE-INPUT
           MOVE    SKT4020TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT4030-HKNJANUM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN      TO  SKT4030-HOSPCD
      *    在総診・在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) start
      *     IF    SKT4020TMP-ZAITAKU  =  "1"
      *       MOVE    "在"                TO  SKT4030-ZAISOU1
      *       MOVE    "◯"                TO  SKT4030-ZAISOU2
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) end
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    給付割合設定
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >  3
      *       PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                UNTIL    IDX2  >  2
      *         MOVE    SKT4020TMP-KYURATE(IDX1 IDX2)  TO WRK-Z2
      *         MOVE    WRK-Z2   TO  SKT4030-KYURATE(IDX1 IDX2)
      *       END-PERFORM
      *     END-PERFORM
           PERFORM  VARYING  IDX2  FROM  1  BY  1
                    UNTIL    IDX2  >     2
             MOVE    SKT4020TMP-KYURATE(IDX2)  TO WRK-Z2
             MOVE    WRK-Z2   TO  SKT4030-KYURATE(IDX2)
           END-PERFORM
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT4030-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT4030-TOKUBETU
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
      *---(01.00.03) LINE ADD START ------------------------------------
      ***** 05/07/12 INS
      *    組合員と家族の給付割合が同じ場合、家族に集計する
      *     PERFORM VARYING IDX2    FROM    1   BY  1
      *             UNTIL   IDX2    >       2
      *         IF      SKT4020TMP-KYURATE(1 IDX2)
      *                             =   SKT4020TMP-KYURATE(2 IDX2)
      *            療養の給付加算
      *             ADD     SKT4020TMP-KENSU(3 IDX2)
      *                             TO  SKT4020TMP-KENSU(4 IDX2)
      *             ADD     SKT4020TMP-NISSU(3 IDX2)
      *                             TO  SKT4020TMP-NISSU(4 IDX2)
      *             ADD     SKT4020TMP-TENSU(3 IDX2)
      *                             TO  SKT4020TMP-TENSU(4 IDX2)
      *             ADD     SKT4020TMP-YKZFTN(3 IDX2)
      *                            TO  SKT4020TMP-YKZFTN(4 IDX2)
      *             ADD     SKT4020TMP-ITBFTN(3 IDX2)
      *                             TO  SKT4020TMP-ITBFTN(4 IDX2)
      *             MOVE    ZERO    TO  SKT4020TMP-NYUGAI-TBL(3 IDX2)
      *            MOVE    SPACE   TO  SKT4030-KYURATE(1 IDX2)
      *            食事療養費加算
      *             IF      IDX2    =   1
      *                 ADD     SKT4020TMP-S-KENSU(3)
      *                                 TO  SKT4020TMP-S-KENSU(4)
      *                 ADD     SKT4020TMP-S-NISSU(3)
      *                                 TO  SKT4020TMP-S-NISSU(4)
      *                 ADD     SKT4020TMP-S-KINGK(3)
      *                                 TO  SKT4020TMP-S-KINGK(4)
      *                 ADD     SKT4020TMP-S-FTNGK(3)
      *                                 TO  SKT4020TMP-S-FTNGK(4)
      *                 MOVE    ZERO    TO  SKT4020TMP-S-KENSU(3)
      *                                     SKT4020TMP-S-NISSU(3)
      *                                     SKT4020TMP-S-KINGK(3)
      *                                     SKT4020TMP-S-FTNGK(3)
      *             END-IF
      *         END-IF
      *     END-PERFORM
      *---(01.00.03) LINE ADD START ------------------------------------
      *****
      *    編集処理
           PERFORM  VARYING  IDX1  FROM    1   BY  1
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *              UNTIL    IDX1  >  6
                    UNTIL    IDX1  >  7
      *=== ７割追加対応 By Takashima(2006/10/31) end
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4020TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4030-KENSU(IDX1 IDX2)
      *    療養の給付：日数
               MOVE  SKT4020TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4030-NISSU(IDX1 IDX2)
      *    療養の給付：点数
               MOVE  SKT4020TMP-TENSU(IDX1 IDX2)  TO  WRK-Z10
               MOVE  WRK-Z10  TO  SKT4030-TENSU(IDX1 IDX2)
      *=== 薬剤一部負担金削除対応 By Takashima(2006/10/31) start
      **    療養の給付：薬剤一部負担金
      *         MOVE  SKT4020TMP-YKZFTN (IDX1 IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT4030-YKZFTN(IDX1 IDX2)
      *=== 薬剤一部負担金削除対応 By Takashima(2006/10/31) end
      *    療養の給付：一部負担金
               MOVE  SKT4020TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4030-ITBFTN(IDX1 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4020TMP-S-KENSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4030-S-KENSU(IDX1)
      *    食事療養：日数
             MOVE  SKT4020TMP-S-NISSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4030-S-NISSU(IDX1)
      *    食事療養：金額
             MOVE  SKT4020TMP-S-KINGK(IDX1)  TO  WRK-Z10
             MOVE  WRK-Z10  TO  SKT4030-S-KINGK(IDX1)
      *    食事療養：標準負担額
             MOVE  SKT4020TMP-S-FTNGK(IDX1)  TO  WRK-Z10
             MOVE  WRK-Z10   TO  SKT4030-S-FTNGK(IDX1)
           END-PERFORM
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
           MOVE   "SKT4030.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      **     MOVE    "国保請求書(組合用１)"  TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書(組合用)"
      *                                 TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書(組合用)［特別療養費］"
      *                                 TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書(組合用)"              TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書(組合用)［返戻分］"    TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書(組合用)［特別療養費］"
                                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書(組合用)［返戻分］［特別療養費］"
                                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) end
           MOVE    SKT4030             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.08) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *    帳票編集<ヘッダー部>処理（老人・公費等）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *=== ７割追加対応 By Takashima(2006/10/31) start
      **
      *     ADD     1                     TO  CNT-PAGE
      **
      *     INITIALIZE                    SKT4020
      **    診療年月
      *     MOVE    WRK-SRYYMWH           TO  SKT4020-SRYYM
      **    保険者番号
      *      INITIALIZE                       WRK-MAE-INPUT
      *      MOVE    SKT4020TMP-HKNJANUM TO   WRK-MAE-INPUT
      *      PERFORM 2009-HENKAN-SEC
      *      MOVE    WRK-OUT-INPUT       TO   SKT4020-HKNJANUM
      **    医療機関コード
      *     MOVE    SYS-1001-HOSPCDN       TO  SKT4020-HOSPCD
      **    請求年月日
      *     MOVE    WRK-SEIYMDWH          TO  SKT4020-SEIYMD
      **    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4020-ADRS
      **    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4020-HOSPNAME
      **    開設者名
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT4020-KAISETUNAME
      **    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4020-TEL
      **    在総診・在医総
      *     IF    SKT4020TMP-ZAITAKU  =  "1"
      *       MOVE    "在"                TO  SKT4020-ZAISOU1
      *       MOVE    "◯"                TO  SKT4020-ZAISOU2
      *     END-IF
      *     INITIALIZE                    IDX4
      **
      **    ページ番号
      *     MOVE      CNT-PAGE            TO  WRK-Z4
      *     MOVE      WRK-Z4              TO  SKT4020-NO
      *     .
      *-------------------------------------------------------------
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT4050
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT4050-SRYYM
      *    保険者番号
           INITIALIZE                        WRK-MAE-INPUT
           MOVE    SKT4020TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT4050-HKNJANUM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN      TO  SKT4050-HOSPCD
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT4050-SEIYMD
      *---(01.00.08) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4050-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4050-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT4050-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4050-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4050-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4050-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT4050-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT4050-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4050-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4050-TEL
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    在総診・在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) start
      *     IF    SKT4020TMP-ZAITAKU  =  "1"
      *       MOVE    "在"                TO  SKT4050-ZAISOU1
      *       MOVE    "◯"                TO  SKT4050-ZAISOU2
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) end
           INITIALIZE                    IDX4
      *
      *    ページ番号
           MOVE      CNT-PAGE            TO  WRK-Z4
           MOVE      WRK-Z4              TO  SKT4050-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT4050-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
           .
      *=== ７割追加対応 By Takashima(2006/10/31) end
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（公費等）
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *=== ７割追加対応 By Takashima(2006/10/31) start
      **
      **    公費の為の２枚目以上か
      *     IF  WRK-CNT  =  1
      **    老人編集処理
      *       PERFORM  VARYING  IDX1  FROM   7   BY  1
      *                UNTIL    IDX1  >  8
      *         ADD  1  TO  IDX4
      *         PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                  UNTIL    IDX2  >     2
      **    療養の給付：件数
      *           MOVE  SKT4020TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
      *           MOVE  WRK-Z5   TO  SKT4020-KENSU(IDX4 IDX2)
      **    療養の給付：日数
      *           MOVE  SKT4020TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
      *           MOVE  WRK-Z5   TO  SKT4020-NISSU(IDX4 IDX2)
      **    療養の給付：点数
      *           MOVE  SKT4020TMP-TENSU(IDX1 IDX2)  TO  WRK-Z10
      *           MOVE  WRK-Z10   TO  SKT4020-TENSU(IDX4 IDX2)
      **    療養の給付：一部負担金
      *           MOVE  SKT4020TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z10
      *           MOVE  WRK-Z10  TO  SKT4020-ITBFTN(IDX4 IDX2)
      *         END-PERFORM
      **    食事療養：件数
      *         MOVE  SKT4020TMP-S-KENSU(IDX1)  TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT4020-S-KENSU(IDX4)
      **    食事療養：日数
      *         MOVE  SKT4020TMP-S-NISSU(IDX1)  TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT4020-S-NISSU(IDX4)
      **    食事療養：金額
      *         MOVE  SKT4020TMP-S-KINGK(IDX1)  TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-S-KINGK(IDX4)
      **    食事療養：標準負担額
      *         MOVE  SKT4020TMP-S-FTNGK(IDX1)  TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-S-FTNGK(IDX4)
      *       END-PERFORM
      **    老人＋原爆
      *       PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                UNTIL    IDX2  >     2
      **    療養の給付：件数
      *         MOVE  SKT4020TMP-GKENSU(IDX2)   TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT4020-GKENSU(IDX2)
      **    療養の給付：日数
      *         MOVE  SKT4020TMP-GNISSU(IDX2)   TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT4020-GNISSU(IDX2)
      **    療養の給付：点数
      *         MOVE  SKT4020TMP-GTENSU(IDX2)   TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-GTENSU(IDX2)
      **    療養の給付：薬剤一部負担金
      *         MOVE  SKT4020TMP-GYKZFTN(IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT4020-GYKZFTN(IDX2)
      **    療養の給付：一部負担金
      *         MOVE  SKT4020TMP-GITBFTN(IDX2)  TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-GITBFTN(IDX2)
      **    患者負担額(地方公費用)
      *         MOVE  SKT4020TMP-GPTFTN(IDX2)   TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-GPTFTN(IDX2)
      *       END-PERFORM
      **    食事療養：件数
      *       MOVE  SKT4020TMP-S-GKENSU         TO  WRK-Z5
      *       MOVE  WRK-Z5   TO  SKT4020-S-GKENSU
      **    食事療養：日数
      *       MOVE  SKT4020TMP-S-GNISSU         TO  WRK-Z5
      *       MOVE  WRK-Z5   TO  SKT4020-S-GNISSU
      **    食事療養：金額
      *       MOVE  SKT4020TMP-S-GKINGK         TO  WRK-Z10
      *       MOVE  WRK-Z10   TO  SKT4020-S-GKINGK
      **    食事療養：標準負担額
      *       MOVE  SKT4020TMP-S-GFTNGK         TO  WRK-Z10
      *       MOVE  WRK-Z10   TO  SKT4020-S-GFTNGK
      *     END-IF
      **
      **    公費の印字
      *     PERFORM  VARYING  IDX3  FROM  1  BY  1
      *              UNTIL    IDX3  >     4
      *              OR  WRK-CNT    >     20
      *              OR  SKT4020TMP-KOHNUM(WRK-CNT) = SPACE
      *       PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                UNTIL    IDX2  >     2
      **    療養の給付：件数
      *         MOVE  SKT4020TMP-KKENSU(WRK-CNT IDX2)   TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT4020-KKENSU(IDX3 IDX2)
      **    療養の給付：日数
      *         MOVE  SKT4020TMP-KNISSU(WRK-CNT IDX2)   TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT4020-KNISSU(IDX3 IDX2)
      **    療養の給付：点数
      *         MOVE  SKT4020TMP-KTENSU(WRK-CNT IDX2)   TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-KTENSU(IDX3 IDX2)
      **    療養の給付：薬剤一部負担金
      *         MOVE  SKT4020TMP-KYKZFTN(WRK-CNT IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT4020-KYKZFTN(IDX3 IDX2)
      **    療養の給付：一部負担金
      *         MOVE  SKT4020TMP-KITBFTN(WRK-CNT IDX2)  TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-KITBFTN(IDX3 IDX2)
      **    患者負担額(地方公費用)
      *         MOVE  SKT4020TMP-KPTFTN(WRK-CNT IDX2)   TO  WRK-Z10
      *         MOVE  WRK-Z10   TO  SKT4020-KPTFTN(IDX3 IDX2)
      *       END-PERFORM
      **    食事療養：件数
      *       MOVE  SKT4020TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
      *       MOVE  WRK-Z5   TO  SKT4020-S-KKENSU(IDX3)
      **    食事療養：日数
      *       MOVE  SKT4020TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
      *       MOVE  WRK-Z5   TO  SKT4020-S-KNISSU(IDX3)
      **    食事療養：金額
      *       MOVE  SKT4020TMP-S-KKINGK (WRK-CNT)      TO  WRK-Z10
      *       MOVE  WRK-Z10   TO  SKT4020-S-KKINGK(IDX3)
      **    食事療養：標準負担額
      *       MOVE  SKT4020TMP-S-KFTNGK (WRK-CNT)      TO  WRK-Z10
      *       MOVE  WRK-Z10  TO  SKT4020-S-KFTNGK(IDX3)
      **    公費名
      *       MOVE  SKT4020TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
      *       PERFORM  950-HKNNUM-SET-SEC
      *       MOVE  HKN-HBTNUM         TO  SKT4020-HBTNUM(IDX3)
      *       MOVE  HKN-TANSEIDONAME   TO  SKT4020-KOHNAME(IDX3)
      **
      *       ADD  1  TO  WRK-CNT
      *     END-PERFORM
      **
      *     .
      *----------------------------------------------------------------
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    老人編集処理
             PERFORM  VARYING  IDX1  FROM   8   BY  1
                      UNTIL    IDX1  >  10
               ADD  1  TO  IDX4
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT4020TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4050-KENSU(IDX4 IDX2)
      *    療養の給付：日数
                 MOVE  SKT4020TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4050-NISSU(IDX4 IDX2)
      *    療養の給付：点数
                 MOVE  SKT4020TMP-TENSU(IDX1 IDX2)  TO  WRK-Z10
                 MOVE  WRK-Z10   TO  SKT4050-TENSU(IDX4 IDX2)
      *    療養の給付：一部負担金
                 MOVE  SKT4020TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z10
                 MOVE  WRK-Z10  TO  SKT4050-ITBFTN(IDX4 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT4020TMP-S-KENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4050-S-KENSU(IDX4)
      *    食事療養：日数
               MOVE  SKT4020TMP-S-NISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4050-S-NISSU(IDX4)
      *    食事療養：金額
               MOVE  SKT4020TMP-S-KINGK(IDX1)  TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-S-KINGK(IDX4)
      *    食事療養：標準負担額
               MOVE  SKT4020TMP-S-FTNGK(IDX1)  TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-S-FTNGK(IDX4)
             END-PERFORM
      *    老人＋原爆
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4020TMP-GKENSU(IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4050-GKENSU(IDX2)
      *    療養の給付：日数
               MOVE  SKT4020TMP-GNISSU(IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4050-GNISSU(IDX2)
      *    療養の給付：点数
               MOVE  SKT4020TMP-GTENSU(IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-GTENSU(IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         MOVE  SKT4020TMP-GYKZFTN(IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT4050-GYKZFTN(IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *    療養の給付：一部負担金
               MOVE  SKT4020TMP-GITBFTN(IDX2)  TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-GITBFTN(IDX2)
      *    患者負担額(地方公費用)
               MOVE  SKT4020TMP-GPTFTN(IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-GPTFTN(IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4020TMP-S-GKENSU         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4050-S-GKENSU
      *    食事療養：日数
             MOVE  SKT4020TMP-S-GNISSU         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4050-S-GNISSU
      *    食事療養：金額
             MOVE  SKT4020TMP-S-GKINGK         TO  WRK-Z10
             MOVE  WRK-Z10   TO  SKT4050-S-GKINGK
      *    食事療養：標準負担額
             MOVE  SKT4020TMP-S-GFTNGK         TO  WRK-Z10
             MOVE  WRK-Z10   TO  SKT4050-S-GFTNGK
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     3
                    OR  WRK-CNT    >     20
                    OR  SKT4020TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4020TMP-KKENSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4050-KKENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT4020TMP-KNISSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4050-KNISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT4020TMP-KTENSU(WRK-CNT IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-KTENSU(IDX3 IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         MOVE  SKT4020TMP-KYKZFTN(WRK-CNT IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT4050-KYKZFTN(IDX3 IDX2)
      *---(01.00.03) LINE ADD START ------------------------------------
      *    療養の給付：一部負担金
               MOVE  SKT4020TMP-KITBFTN(WRK-CNT IDX2)  TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-KITBFTN(IDX3 IDX2)
      *    患者負担額(地方公費用)
               MOVE  SKT4020TMP-KPTFTN(WRK-CNT IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4050-KPTFTN(IDX3 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4020TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4050-S-KKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT4020TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4050-S-KNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT4020TMP-S-KKINGK (WRK-CNT)      TO  WRK-Z10
             MOVE  WRK-Z10   TO  SKT4050-S-KKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT4020TMP-S-KFTNGK (WRK-CNT)      TO  WRK-Z10
             MOVE  WRK-Z10  TO  SKT4050-S-KFTNGK(IDX3)
      *    公費名
             MOVE  SKT4020TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT4050-HBTNUM(IDX3)
             MOVE  HKN-TANSEIDONAME   TO  SKT4050-KOHNAME(IDX3)
      *
      *---(01.00.11) LINE ADD START MONMA ------------------------------
      *       MOVE  HKN-TANSEIDONAME   TO  SKT2210-KOHNAME(IDX3)      
             IF  SKT4020TMP-KOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT4020TMP-KOHNAME (WRK-CNT)
                                        TO  SKT4050-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT4050-KOHNAME(IDX3)
             END-IF
      *---(01.00.11) LINE ADD END   MONMA ------------------------------
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
      *=== ７割追加対応 By Takashima(2006/10/31) end
       321-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（老人・公費等）
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
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *     MOVE   "SKT4020.red"        TO  SPRT-PRTID
           MOVE   "SKT4050.red"        TO  SPRT-PRTID
      *=== ７割追加対応 By Takashima(2006/10/31) end
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      **     MOVE    "国保請求書(組合用２)"  TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書(組合用)"
      *                                 TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書(組合用)［特別療養費］"
      *                                 TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書(組合用)"              TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書(組合用)［返戻分］"    TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書(組合用)［特別療養費］"
                                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書(組合用)［返戻分］［特別療養費］"
                                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) end
      *=== ７割追加対応 By Takashima(2006/10/31) start
      *     MOVE    SKT4020             TO  SPRT-PRTDATA
           MOVE    SKT4050             TO  SPRT-PRTDATA
      *=== ７割追加対応 By Takashima(2006/10/31) end
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.08) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *    帳票編集<ヘッダー部>処理（一般患者の併用公費）
      *****************************************************************
       312-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT4040
      *
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT4040-SRYYM
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT4040-SEIYMD
      *---(01.00.08) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4040-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4040-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT4040-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4040-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4040-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT SKT4040-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT4040-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT4040-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/11/13) end
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4040-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4040-TEL
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    保険者番号
            INITIALIZE                       WRK-MAE-INPUT
            MOVE    SKT4020TMP-HKNJANUM TO   WRK-MAE-INPUT
            PERFORM 2009-HENKAN-SEC
            MOVE    WRK-OUT-INPUT       TO   SKT4040-HKNJANUM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN      TO  SKT4040-HOSPCD
      *    在総診・在医総
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) start
      *     IF    SKT4020TMP-ZAITAKU  =  "1"
      *       MOVE    "在"                TO  SKT4040-ZAISOU1
      *       MOVE    "◯"                TO  SKT4040-ZAISOU2
      *     END-IF
      *=== 在宅はまとめて集計 by Yoshikawa(2012/05/17) end
      *
      *    ページ番号
           MOVE      CNT-PAGE            TO  WRK-Z4
           MOVE      WRK-Z4              TO  SKT4040-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT4040-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
           .
       312-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（一般患者の併用公費）
      *****************************************************************
       322-BODY-HEN-SEC      SECTION.
      *
      *    公費の残りを印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
      *---(01.00.04) LINE ADD START ------------------------------------
      *              UNTIL    IDX3  >     8
                    UNTIL    IDX3  >     7
      *---(01.00.04) LINE ADD END   ------------------------------------
                    OR  WRK-CNT    >     20
                    OR  SKT4020TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4020TMP-KKENSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4040-KKENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT4020TMP-KNISSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4040-KNISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT4020TMP-KTENSU(WRK-CNT IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10  TO  SKT4040-KTENSU(IDX3 IDX2)
      *---(01.00.04) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         MOVE  SKT4020TMP-KYKZFTN(WRK-CNT IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT4040-KYKZFTN(IDX3 IDX2)
      *---(01.00.04) LINE ADD END   ------------------------------------
      *    療養の給付：一部負担金
               MOVE  SKT4020TMP-KITBFTN(WRK-CNT IDX2)  TO  WRK-Z10
               MOVE  WRK-Z10  TO  SKT4040-KITBFTN(IDX3 IDX2)
      *    患者負担額(地方公費用)
               MOVE  SKT4020TMP-KPTFTN(WRK-CNT IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT4040-KPTFTN(IDX3 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4020TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5  TO  SKT4040-S-KKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT4020TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4040-S-KNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT4020TMP-S-KKINGK (WRK-CNT)      TO  WRK-Z10
             MOVE  WRK-Z10   TO  SKT4040-S-KKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT4020TMP-S-KFTNGK (WRK-CNT)      TO  WRK-Z10
             MOVE  WRK-Z10   TO  SKT4040-S-KFTNGK(IDX3)
      *    公費名
             MOVE  SKT4020TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT4040-HBTNUM(IDX3)
             MOVE  HKN-TANSEIDONAME   TO  SKT4040-KOHNAME(IDX3)
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
           .
       322-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（一般患者の併用公費）
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
           MOVE   "SKT4040.red"            TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      **     MOVE    "国保請求書(組合用３)"  TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書(組合用)"
      *                                 TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書(組合用)［特別療養費］"
      *                                 TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書(組合用)"              TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書(組合用)［返戻分］"    TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書(組合用)［特別療養費］"
                                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書(組合用)［返戻分］［特別療養費］"
                                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/09/11) end
           MOVE    SKT4040             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Yoshikawa(2017/10/16) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.08) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU4020 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU4020 SEIKYU INVALID ***"
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *****************************************************************
      *   保険者情報セット
      *****************************************************************
      * 920-HKNJAINF-SET-SEC  SECTION.
      *
      *     INITIALIZE  HKNJAINF-REC
      *     MOVE    SYS-1001-HOSPID         TO  HKNJA-HOSPID
      *     MOVE    WRK-HKNJANUM            TO  HKNJA-HKNJANUM
      *     MOVE    HKNJAINF-REC            TO  MCPDATA-REC
      *     MOVE    "DBSELECT"              TO  MCP-FUNC
      *     MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *         MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
      *         PERFORM  925-HKNJAINF-READ-SEC
      *         MOVE  HKNJA-HKNJANAME   TO  WRK-HKNJANAME
      *     ELSE
      *         DISPLAY  "HKNJAINF SELECT ERR"
      *     END-IF
      *
      *     INITIALIZE  MCPAREA
      *     MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *     MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *
      *     .
      * 920-HKNJAINF-SET-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
      * 925-HKNJAINF-READ-SEC  SECTION.
      *
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
      *     IF      MCP-RC  =   ZERO
      *         MOVE    MCPDATA-REC  TO  HKNJAINF-REC
      *         MOVE    ZERO         TO  FLG-HKNJAINF
      *     ELSE
      *         INITIALIZE  HKNJAINF-REC
      *         MOVE    1            TO  FLG-HKNJAINF
      *     END-IF
      *
      *     .
      * 925-HKNJAINF-READ-EXT.
      *     EXIT.
      *
      *****************************************************************
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID             TO  HKN-HOSPID
           MOVE    SPA-HOSPNUM                 TO  HKN-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    WRK-KOHNUM                  TO  HKN-HKNNUM
           MOVE    HKNNUM-REC                  TO  MCPDATA-REC
           MOVE    "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE    "tbl_hknnum"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE    PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
             MOVE    "tbl_hknnum"        TO  MCP-TABLE
             MOVE    "key2"              TO  MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE    "tbl_hknnum"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
       955-HKNNUM-READ-SEC  SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
             IF    HKN-HKNNUM  =  "051"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "特定疾患"   TO   HKN-TANSEIDONAME
             END-IF
             IF    HKN-HKNNUM  =  "141"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "老人"   TO   HKN-TANSEIDONAME
             END-IF
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM          TO  RECE10-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
               MOVE    WRK-PARA-HKNJANUM   TO  RECE10-XXSTHKNJANUM
                                               RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  000000               TO  RECE10-SRYYM
             MOVE  999999               TO  RECE10-XXSRYYM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF   
      *    国保組合以外は読み飛ばす
               IF  RECE10-HKNJANUM(7:2)  =  SPACE
                 IF    RECE10-HKNJANUM(3:1) NOT = "3"
                   GO   TO    900-SEIKYU-READ-SEC
                 END-IF
               ELSE
                 IF    RECE10-HKNJANUM(5:1) NOT = "3"
                   GO   TO    900-SEIKYU-READ-SEC
                 END-IF
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
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY           TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY           TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
           READ    SKT4020TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4020TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4020TMP
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
      *
           MOVE    "DBSELECT"                     TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                      TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC                  =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
           READ  SKT4020TMP-FILE   NEXT
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
      *---(01.00.11) LINE ADD START MONMA -----------------------------
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
      *---(01.00.11) LINE ADD START MONMA -----------------------------
      *
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
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
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
