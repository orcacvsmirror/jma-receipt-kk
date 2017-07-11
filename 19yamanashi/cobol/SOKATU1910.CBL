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
       PROGRAM-ID.             SOKATU1910.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 診療報酬請求書
      *  管理者            : 
      *  作成日付    作業者        記述
      *  03/08/11    有村          新規作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01       有村      03/09/04     医療機関コードの修正
      *  01.00.02       有村      04/01/29     保険者番号指定対応
      *                                        優先保険者番号対応
      *                                        公費の分類方法修正
      *                                        在総診対応
      *                                        国保組合判定修正
      *  01.00.03       有村      04/05/25     出力順修正
      *  01.00.04       有村      04/07/09     公費法別番号追加
      *                                        公費分集計方法修正
      *  01.00.05       有村      05/02/22     diaからmonpeに変更 
      *                                        OpenCOBOLバージョン変更対応
      *                                        ページ番号追加
      *                                        公費の印字順修正
      *  01.00.06       有村      05/04/12     返戻分対応
      *  01.00.07       山口      05/04/18     ORCAのバージョンアップ(2.5.0)対応
      *  01.00.08       有村      05/05/06     医療機関情報取得条件修正
      *  01.00.09       内田      07/08/05     日レセver4.0対応
      *                                        システム管理マスタ「1901」の
      *                                        医療機関情報を参照
      *  01.00.10       内田      08/05/03     ４月改正に伴う修正
      *  01.00.11       吉川      08/05/26     帳票様式の変更に伴う修正
      *  01.00.12       吉川      08/06/05     医療機関コード印字修正
      *  01.00.13       吉川      08/06/09     改正前の月遅れ分は旧様式に印字
      *  01.00.14       門間      08/12/11     シス管「2007」公費まとめ対応
      *                                        SPA-AREA初期化
      *  01.00.15       吉川      09/06/30     改正後の返戻分が旧様式で
      *                                        印字される不具合を修正
      *  01.00.16       吉川      09/12/01     シス管「2007」のまとめ公費で
      *                                        6つ目以降がまとまらない不具合を修正
      *  01.00.17       吉川      10/10/01     オンライン返戻対応
      *                                        特別療養費国保対応
      *  01.00.18       吉川      11/03/10     open-cobol1.0対応
      *  01.00.19       吉川      13/01/09     プラグイン対応
      *                                        医療機関情報編集対応
      *  01.00.20       吉川      14/05/19     前期高齢者２割対応
      *                                        プログラムオプション対応
      *  01.00.21       吉川      14/08/06     返戻時、再印刷画面のタイトル修正
      *  01.00.22       吉川      14/10/23     ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.23       門間      16/05/12     医療機関編集情報への開設者名追加対応
      *  01.00.24       門間      16/11/15     公費番号まとめ情報の公費番号の追加
      *  01.00.25       門間      17/07/11     医療機関コード変更時、
      *                                        医療機関コード別の作成処理対応
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT1910TMP-FILE ASSIGN    SKT1910TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1910TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1910.
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
      ******  04/01/30 INS
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      ******
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT1910TMP-FILE.
           COPY    "CPSKT1910TMP.INC".
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
      ****** 04/01/30 INS
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      ******
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1910TP//.
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *---(01.00.09) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT1920.INC".
           COPY    "SKT1930.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT1910         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      ***** 04/01/30 INS
           03  STS-YUSEN           PIC X(02).
      *****
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1910TMP      PIC 9(01).
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
      ***** 05/02/22 INS
           03  IDX-MAX             PIC 9(04).
      *****
      *--- (2008/12/11) line add start monma ---------------------------
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *--- (2008/12/11) line add end   monma ---------------------------
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
           03  IDX                 PIC 9(05).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
           03  IDZ                 PIC 9(04).
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
      *
      *##  パラメタ領域（地方公費仕様）
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.09) LINE ADD END   ------------------------------------
      ***** 04/01/30 INS
           03  WRK-PARA-HKNJANUM   PIC X(08).
      *****
           03  WRK-PARA-PAGE       PIC 9(10).
      ***** 05/04/12 INS
           03  WRK-PARA-SYOKBN     PIC X(01).
      *****
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      **=== プラグイン対応 by Yoshikawa(2013/01/09) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU1910".
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
      ***** 04/01/30 INS
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/01/09) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/01/09) end
      *****
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT             PIC 9(02).
           03  WRK-KOHNUM          PIC X(03).
      *
      *--- (2008/12/11) line add start monma ---------------------------
           03  WRK-KOHNAME         PIC X(20).
      *--- (2008/12/11) line add end   monma ---------------------------
           03  WRK-Z3              PIC ZZZ.
      ***** 05/02/22 INS
           03  WRK-Z4              PIC ZZZZ.
      *****
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z6              PIC ZZ,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z11             PIC ZZZ,ZZZ,ZZZ.
           03  WRK-Z13             PIC Z,ZZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      ***** 05/02/22 INS
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      ***** 05/04/12 INS
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
           03  WRK-PATH2           PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
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
      *---(01.00.09) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) start
           03  WRK-KAISETUNAME     PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) end
      *****
      *
      *--- (2008/12/11) line add start monma ---------------------------
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
      *                             PIC X(03)   OCCURS  10.
                                   PIC X(03)   OCCURS  30.
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
           03  WRK-2007-MAX        PIC 9(03).
      *--- (2008/12/11) line add end   monma ---------------------------
      *
      *    公費ソート用エリア
       01  SORT-AREA.
           03  SORT-TBL.
               05  SORT-KOH-TBL  OCCURS  20.
                   07  SORT-KOHNUM            PIC  X(03).
      *--- (2008/12/11) line add start monma ---------------------------
                   07  SORT-KOHNAME           PIC  X(20).
      *--- (2008/12/11) line add end   monma ---------------------------
                   07  SORT-KKENSU            PIC  9(05).
                   07  SORT-KNISSU            PIC  9(05).
                   07  SORT-KTENSU            PIC  9(11).
                   07  SORT-KYKZFTN           PIC  9(09).
                   07  SORT-KFTNMONEY         PIC  9(07).
                   07  SORT-S-KKENSU          PIC  9(05).
                   07  SORT-S-KNISSU          PIC  9(05).
                   07  SORT-S-KKINGAKU        PIC  9(13).
                   07  SORT-S-KFTNGAKU        PIC  9(09).
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *    公費ソート用エリア(新様式用)
       01  SORT2-AREA.
           03  SORT2-TBL.
               05  SORT-KOH2-TBL  OCCURS  20.
                   07  SORT-KOHNUM2           PIC  X(03).
      *--- (2008/12/11) line add start monma ---------------------------
                   07  SORT-KOHNAME2          PIC  X(20).
      *--- (2008/12/11) line add end   monma ---------------------------
                   07  SORT-KNYUGAI-TBL  OCCURS  2.
                       09  SORT-KKENSU2       PIC  9(05).
                       09  SORT-KNISSU2       PIC  9(05).
                       09  SORT-KTENSU2       PIC  9(11).
                       09  SORT-KFTNMONEY2    PIC  9(07).
                   07  SORT-S-KKENSU2         PIC  9(05).
                   07  SORT-S-KNISSU2         PIC  9(05).
                   07  SORT-S-KKINGAKU2       PIC  9(13).
                   07  SORT-S-KFTNGAKU2       PIC  9(09).
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *****
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
           COPY    "CPSHELLTBL.INC".
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *    収納
       01  SYUNOU-REC.
           COPY    "CPSYUNOU.INC".
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) end
      *
      *--- (2008/12/11) line add start monma ---------------------------
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *--- (2008/12/11) line add end   monma ---------------------------
      *
      *    出力先プリンタ名割り当て情報
           COPY    "CPSK1031.INC".
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
      ***** 05/04/18 yamaguchi DEL
      *     COPY    "CPORCMCP.INC".
      *****
      ***** 04/01/30 INS
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *****
      ***** 05/02/22 INS
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *****
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
      *--- (2008/12/11) line add start monma ---------------------------
           INITIALIZE                  SPA-AREA
      *--- (2008/12/11) line add end   monma ---------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
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
      ***** 05/04/12 DEL
      *                                         WRK-PARA-JOBID
      *                                         WRK-PARA-SHELLID
      *                                         WRK-PARA-HOSPID
      ****** 04/01/30 INS
      *                                         WRK-PARA-HKNJANUM
      *****
      ***** 05/04/12 INS
      *---(01.00.09) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
      *---(01.00.09) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.09) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
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
           MOVE    "SOKATU1910"    TO  JOB-PGID
           MOVE    "国保請求書"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *##（地方公費仕様：LNK-PRTKANRI-TERMID)
      ***** 05/02/22 UPD
      *     MOVE    "SKT1910TP"         TO  SKT1910TP-FILE-ID
           MOVE    "SKT1910"         TO  SKT1910TP-FILE-ID
      *****
           MOVE    LNK-PRTKANRI-TERMID TO  SKT1910TP-TERMID
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT1910TP-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           MOVE  SKT1910TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT1910TP-FULLNAME
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
      *##
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
      ****** 05/04/18 yamaguchi INS
      *     MOVE    "99999999"          TO  SYS-1001-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1001-EDYUKYMD
      *****
      ***** 05/05/06 INS
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
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
      *    医療機関情報−所在地、連絡先
           INITIALIZE                  SYS-1002-REC
           MOVE    "1002"              TO  SYS-1002-KANRICD
           MOVE    "*"                 TO  SYS-1002-KBNCD
      ***** 05/05/06 DEL
      ****** 05/04/18 yamaguchi INS
      *     MOVE    "99999999"          TO  SYS-1002-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1002-EDYUKYMD
      ******
      ***** 05/05/06 INS
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
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
      *--- (2008/12/11) line add start monma ---------------------------
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
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
               MOVE    ZERO               TO  IDZ
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       10
                       OR      SYS-2007-KOHNUM (IDX2)   =   SPACE
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
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
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
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
      *--- (2008/12/11) line add end   monma ---------------------------
      *
      ***** 05/04/18 yamaguchi DEL
      *##（地方公費仕様：出力先プリンタ名割り当て情報編集）
      *     MOVE     SPACE         TO        SYS-1031-REC
      *     INITIALIZE                       SYS-1031-REC
      *     MOVE     "1031"        TO        SYS-1031-KANRICD
      *     MOVE     "*"           TO        SYS-1031-KBNCD
      *     MOVE     SYS-1031-REC  TO        MCPDATA-REC
      *     PERFORM  910-SYSKANRI-INV-SEC
      *     IF       FLG-SYSKANRI        =   ZERO
      *              MOVE    MCPDATA-REC TO  SYS-1031-REC
      *     ELSE    
      *              INITIALIZE              SYS-1031-REC
      *     END-IF
      *****                    
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/10) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/10) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      ****** 04/01/30 INS
      *     PERFORM  110-INI-FILE-SEC
      ******
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
      *
           OPEN    OUTPUT  UPD-FILE
      *  
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
      ****** 05/04/12 INS
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      **---(01.00.09) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.09) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.09) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.09) LINE ADD END   ------------------------------------
      *     END-EVALUATE
      ******
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
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
      *
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理  04/01/30 INS
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
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
           MOVE    "SOKATU1910"              TO  WRK-PRGID
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
           OPEN     OUTPUT  SKT1910TMP-FILE
           CLOSE            SKT1910TMP-FILE
           OPEN     I-O     SKT1910TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1910TMP-FILE
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
           DISPLAY "*** SOKATU1910 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1910 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
      *###（地方公費仕様）
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
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
           INITIALIZE       SKT1910TMP-REC
           INITIALIZE       SKT1910TMP-HKNJANUM
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT1910TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT1910TMP-HKNJANUM(1:6)
           END-IF
      *
      *    国保組合判定
      ***** 04/01/30 UPD
      *     IF  SKT1910TMP-HKNJANUM(3:1) = "3" AND
      *         RECE10-KYURATE  NOT  =  7
      *       MOVE  RECE10-KYURATE  TO SKT1910TMP-KYURATE
      *     END-IF
           IF  RECE10-RJNHKNNUM  =  SPACE
      *---(01.00.10) LINE ADD START ------------------------------------
      *       IF  (RECE10-AGE  >  2)  AND  (RECE10-AGE  <  70)
      *         IF  SKT1910TMP-HKNJANUM(3:1) = "3"
      *           IF  RECE10-KYURATE  NOT =  7
      *               MOVE  RECE10-KYURATE  TO SKT1910TMP-KYURATE
      *           END-IF
      *         END-IF
      *       END-IF
             IF  SKT1910TMP-HKNJANUM(3:1) = "3"
               IF  RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804
                 IF   RECE10-FLG (1)  =  ZERO
                 AND  RECE10-AGE  <  70
                   IF  RECE10-KYURATE  NOT =  7
                       MOVE  RECE10-KYURATE  TO SKT1910TMP-KYURATE
                   END-IF
                 END-IF
               ELSE
                 IF (RECE10-AGE  >  2)  AND  (RECE10-AGE  <  70)
                   IF  RECE10-KYURATE  NOT =  7
                     MOVE  RECE10-KYURATE  TO SKT1910TMP-KYURATE
                   END-IF
                 END-IF
               END-IF
             END-IF
      *---(01.00.10) LINE ADD START ------------------------------------
           END-IF
      ***** 04/01/30 INS
      *    出力順設定
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) start
      *     IF     YUSEN-HKNJANUM    =    SKT1910TMP-HKNJANUM
           IF     WRK-YUSEN    =    SKT1910TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2014/05/19) end
             MOVE        1          TO   SKT1910TMP-SYUTURYOKU
           ELSE
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
            IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
               MOVE      5          TO   SKT1910TMP-SYUTURYOKU
            ELSE
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
      ***** 04/05/25 UPD 県外保険者→県内保険者→県内扱い国保組合に変更
      *       MOVE        2          TO   SKT1910TMP-SYUTURYOKU
             IF     RECE10-PREFKBN   =    "2"
               MOVE      2          TO   SKT1910TMP-SYUTURYOKU
             ELSE
               IF   RECE10-PREFNUM   =    "19"
                 MOVE    3          TO   SKT1910TMP-SYUTURYOKU
               ELSE
                 MOVE    4          TO   SKT1910TMP-SYUTURYOKU
               END-IF
             END-IF
      ***** 04/05/25 UPD END
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
            END-IF
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
           END-IF
      *    在宅
           MOVE   RECE10-ZAITAKU    TO   SKT1910TMP-ZAITAKU
      *****
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *    平成２０年３月以前は旧様式
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
      *         MOVE  RECE10-SRYYM   TO  WRK-SRYYMD(1:6)
      *         MOVE  "01"           TO  WRK-SRYYMD(6:2)
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
                MOVE  RECE10-SRYYM  TO  SKT1910TMP-SRYYM
           ELSE
               MOVE  SPACE          TO  WRK-SRYYMD
           END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      ***** 05/04/18 yamaguchi DEL
      *         MOVE    "SEIKYU-KEY4"       TO  ORC-DBPATH
      ***** 
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
             IF  RECE10-KYURATE  =  9
               MOVE  10   TO   IDX1
             ELSE
               MOVE  11   TO   IDX1
             END-IF
           ELSE
      *    退職者かどうか
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
               IF  RECE10-AGE  >= 70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) start
      *           IF  RECE10-KYURATE  =  9
      *             MOVE    1     TO    IDX1
      *           ELSE
      *             MOVE    2     TO    IDX1
      *           END-IF
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
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) end
               ELSE
      *---(01.00.10) LINE ADD START ------------------------------------
                 IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                   MOVE  4     TO  IDX1
                 ELSE
      *---(01.00.10) LINE ADD END   ------------------------------------
                   IF  RECE10-AGE  >= 3
                     MOVE    3     TO    IDX1
                   ELSE
                     MOVE    4     TO    IDX1
                   END-IF
      *---(01.00.10) LINE ADD START ------------------------------------
                 END-IF
      *---(01.00.10) LINE ADD END   ------------------------------------
               END-IF
      *
             ELSE
               IF  RECE10-AGE  >=  70
                 IF  RECE10-KYURATE  =  9
                   MOVE  6    TO  IDX1
                 ELSE
                   MOVE  7    TO  IDX1
                 END-IF
               ELSE
                 IF  RECE10-HONKZKKBN  =  1
                   MOVE  5    TO   IDX1
                 ELSE
      *---(01.00.10) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                     MOVE  9    TO  IDX1
                   ELSE
      *---(01.00.10) LINE ADD END   ------------------------------------
                     IF  RECE10-AGE  <  3
                       MOVE  9  TO  IDX1
                     ELSE
                       MOVE  8  TO  IDX1
                     END-IF
      *---(01.00.10) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.10) LINE ADD END   ------------------------------------
                 END-IF
               END-IF
             END-IF
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      *    公費負担分
           IF  RECE10-KOHNUM (1)   NOT =   SPACE  OR
               RECE10-KOHNUM (2)   NOT =   SPACE  OR
               RECE10-KOHNUM (3)   NOT =   SPACE  OR
               RECE10-KOHNUM (4)   NOT =   SPACE
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
               IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                  PERFORM 221-KOH-SYUKEI-SEC
               ELSE
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
                  PERFORM 220-KOH-SYUKEI-SEC
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
               END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
           END-IF
      *
           IF  FLG-SKT1910TMP  =  1
               WRITE    SKT1910TMP-REC
           ELSE
               REWRITE  SKT1910TMP-REC
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
           ADD   1                  TO  SKT1910TMP-KENSU (IDX1 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(1)    TO  SKT1910TMP-NISSU(IDX1 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(1)  TO  SKT1910TMP-TENSU(IDX1 IDX2)
      *    療養の給付：薬剤一部負担金
           ADD  RECE10-YKZFTN(1)    TO  SKT1910TMP-YKZFTN(IDX1 IDX2)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1)  TO  SKT1910TMP-FTNMONEY(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  0
      *    食事療養:件数
             ADD   1  TO  SKT1910TMP-S-KENSU(IDX1)
           END-IF
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(1)  TO  SKT1910TMP-S-NISSU(IDX1)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(1) TO SKT1910TMP-S-KINGAKU(IDX1)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(1)    TO  SKT1910TMP-S-FTNGAKU(IDX1)
      *
           MOVE    1               TO  FLG-UPD 
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
      ***** 04/01/30 INS ５１、９１は１つにまとめる
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
             END-IF
      *****
      *
      *--- (2008/12/11) line add start monma ---------------------------
      *      公費番号まとめ情報があるとき
             IF  WRK-2007-MAX  >  ZERO
               MOVE  SPACE     TO  WRK-KOHNAME
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) start
      *                   UNTIL   IDZ2  >       5
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
      *                   UNTIL   IDZ2  >       10
                         UNTIL   IDZ2  >       20
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) start
      *               MOVE  5             TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
      *               MOVE  10            TO  IDZ2
                     MOVE  20            TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *--- (2008/12/11) line add end    monma --------------------------
      *
      *    公費判別
             PERFORM  VARYING  IDX4  FROM  1  BY  1
                      UNTIL    IDX4  >     20
                      OR       SKT1910TMP-KOHNUM (IDX4) = SPACE
               IF  RECE10-KOHNUM (IDX3)  =  SKT1910TMP-KOHNUM (IDX4)
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
             MOVE  RECE10-KOHNUM(IDX3)  TO  SKT1910TMP-KOHNUM(CNT-KOH)
      *--- (2008/12/11) line add start monma ---------------------------
      *    公費名称
             MOVE  WRK-KOHNAME      TO  SKT1910TMP-KOHNAME(CNT-KOH)
      *--- (2008/12/11) line add end   monma ---------------------------
      *    療養の給付：件数
             ADD   1  TO  SKT1910TMP-KKENSU (CNT-KOH)
      *    療養の給付:診療実日数
      ***** 04/07/09 UPD
      *       ADD  RECE10-JNISSU(1)  TO
             ADD  RECE10-JNISSU(IDX3 + 1)  TO
      *****
                               SKT1910TMP-KNISSU(CNT-KOH)
      *    療養の給付：点数
      ***** 04/07/09 UPD
      *       ADD  RECE10-TOTALTEN(1)  TO
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
      *****
                               SKT1910TMP-KTENSU(CNT-KOH)
      *    療養の給付：薬剤一部負担金
      ***** 04/07/09 UPD
      *       ADD  RECE10-YKZFTN(1)  TO
             ADD  RECE10-YKZFTN(IDX3 + 1)  TO
      *****
                               SKT1910TMP-KYKZFTN(CNT-KOH)
      *    療養の給付：一部負担金
             ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                               SKT1910TMP-KFTNMONEY(CNT-KOH)
      *
      ***** 04/07/09 UPD
      *       IF  RECE10-SHOKUJINISSU(1)  >  0
             IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *****
      *    食事療養:件数
               ADD   1  TO  SKT1910TMP-S-KKENSU(CNT-KOH)
             END-IF
      *    食事療養:日数
      ***** 04/07/09 UPD
      *       ADD  RECE10-SHOKUJINISSU(1)  TO
             ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
      *****
                               SKT1910TMP-S-KNISSU(CNT-KOH)
      *    食事療養：金額
      ***** 04/07/09 UPD
      *       ADD  RECE10-SHOKUJIRYOYOHI(1)  TO
             ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
      *****
                               SKT1910TMP-S-KKINGAKU(CNT-KOH)
      *    食事療養：標準負担額
      ***** 04/07/09 UPD
      *       ADD  RECE10-SHOKUJIFTN(1)  TO
             ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
      *****
                               SKT1910TMP-S-KFTNGAKU(CNT-KOH)
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *****************************************************************
      *    公費負担分集計処理
      *****************************************************************
       221-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *      ５１、９１は１つにまとめる
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
      *--- (2008/12/11) line add start monma ---------------------------
      *      公費番号まとめ情報があるとき
             IF  WRK-2007-MAX  >  ZERO
               MOVE  SPACE     TO  WRK-KOHNAME
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) start
      *                   UNTIL   IDZ2  >       5
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
      *                   UNTIL   IDZ2  >       10
                         UNTIL   IDZ2  >       20
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) start
      *               MOVE  5             TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2016/11/15) start
      *               MOVE  10            TO  IDZ2
                     MOVE  20            TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2016/11/15) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/01) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *--- (2008/12/11) line add end    monma --------------------------
      *
      *    公費判別
      *    乳幼児、ひとり親、重障は印字場所固定
             IF    RECE10-KOHNUM(IDX3)  =  "142" OR "144" OR "143"
               PERFORM  222-TKOH-SYUKEI-SEC
             ELSE
               PERFORM  VARYING  IDX4  FROM  1  BY  1
                        UNTIL    IDX4  >     20
                        OR       SKT1910TMP-KOHNUM2 (IDX4) = SPACE
                 IF  RECE10-KOHNUM (IDX3)  =  SKT1910TMP-KOHNUM2 (IDX4)
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
               MOVE  RECE10-KOHNUM(IDX3) TO SKT1910TMP-KOHNUM2(CNT-KOH)
      *--- (2008/12/11) line add start monma ---------------------------
      *    公費名称
             MOVE  WRK-KOHNAME      TO  SKT1910TMP-KOHNAME2(CNT-KOH)
      *--- (2008/12/11) line add end   monma ---------------------------
      *    療養の給付：件数
               ADD   1  TO  SKT1910TMP-KKENSU2 (CNT-KOH IDX2)
      *    療養の給付:診療実日数
               ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT1910TMP-KNISSU2(CNT-KOH IDX2)
      *    療養の給付：点数
               ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                                 SKT1910TMP-KTENSU2(CNT-KOH IDX2)
      *    療養の給付：一部負担金
               ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                                 SKT1910TMP-KFTNMONEY2(CNT-KOH IDX2)
      *
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養:件数
                 ADD   1  TO  SKT1910TMP-S-KKENSU2(CNT-KOH)
               END-IF
      *    食事療養:日数
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                                 SKT1910TMP-S-KNISSU2(CNT-KOH)
      *    食事療養：金額
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                                 SKT1910TMP-S-KKINGAKU2(CNT-KOH)
      *    食事療養：標準負担額
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
                                 SKT1910TMP-S-KFTNGAKU2(CNT-KOH)
             END-IF
           END-PERFORM
      *
           .
       221-KOH-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    地方公費負担分集計処理
      *****************************************************************
       222-TKOH-SYUKEI-SEC        SECTION.
      *
           EVALUATE  RECE10-KOHNUM(IDX3)
             WHEN  "142"
                 MOVE  1  TO  IDX1
             WHEN  "144"
                 MOVE  2  TO  IDX1
             WHEN  "143"
                 MOVE  3  TO  IDX1
           END-EVALUATE
      *
      *    療養の給付：件数
           ADD   1  TO  SKT1910TMP-TKENSU (IDX1 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(IDX3 + 1)    TO
                               SKT1910TMP-TNISSU(IDX1 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT1910TMP-TTENSU(IDX1 IDX2)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                               SKT1910TMP-TFTNMONEY(IDX1 IDX2)
      *
           .
       222-TKOH-SYUKEI-EXT.
           EXIT.
      *
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
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
           OPEN     INPUT       SKT1910TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           MOVE     1           TO       WRK-CNT
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
      ***** 05/02/22 INS
      *    公費ソート処理
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
             IF  WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804
      *       IF  SKT1910TMP-SRYYM  >=  WRK-CONS-SRYYM-200804
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
               PERFORM  KOH2-SORT-SEC
             ELSE
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
               PERFORM  KOH-SORT-SEC
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
             END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *****
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
             IF  WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804
      *       IF  SKT1910TMP-SRYYM  >=  WRK-CONS-SRYYM-200804
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
      *    公費が残っているか
               PERFORM  UNTIL  SKT1910TMP-KOHNUM2 (WRK-CNT) = SPACE
      *    帳票編集<見出し>処理
                 PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
                 PERFORM 320-BODY-HEN-SEC
      *    帳票印刷処理
                 PERFORM 330-PRINT-OUT-SEC
                 MOVE  1  TO  FLG-PASS
               END-PERFORM
               MOVE  ZERO  TO  FLG-PASS
      *    一時ファイル読込
               PERFORM  900-TMP-READ-SEC
               MOVE  1  TO  WRK-CNT
             ELSE
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *    公費が残っているか
               PERFORM  UNTIL  SKT1910TMP-KOHNUM (WRK-CNT) = SPACE
                        AND    FLG-PASS  =  1
      *    帳票編集<見出し>処理
                 PERFORM 311-HEAD-HEN-SEC
      *    帳票編集<明細>処理
                 PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理
                 PERFORM 331-PRINT-OUT-SEC
                 MOVE  1  TO  FLG-PASS
               END-PERFORM
               MOVE  ZERO  TO  FLG-PASS
      *    一時ファイル読込
               PERFORM  900-TMP-READ-SEC
               MOVE  1  TO  WRK-CNT
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
             END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
           END-PERFORM
      *
           CLOSE    SKT1910TMP-FILE
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
           INITIALIZE                    SKT1920
      ***** 05/02/22 INS
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT1920-NO
      *****
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
      *     IF  WRK-SRYYMD  NOT =  SPACE
      *         MOVE  WRK-SRYYMD(1:6)     TO  WRK-SYMD (1:6)
           IF  SKT1910TMP-SRYYM  NOT  =  SPACE
               MOVE  SKT1910TMP-SRYYM    TO  WRK-SYMD
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
           ELSE
               MOVE  LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *    診療年月
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) start
      *     MOVE    WRK-SRYYMWH           TO  SKT1920-SRYYM
      *=== 改正後の返戻分は新様式に印字 by Yoshikawa(2009/06/30) start
      *     IF  WRK-PARA-SYOKBN  =  "2"
           IF  SKT1910TMP-SRYYM  NOT  =  SPACE
      *=== 改正後の返戻分は新様式に印字 by Yoshikawa(2009/06/30) end
               MOVE  SKT1910TMP-SRYYM    TO  WRK-SYMD
               MOVE  "01"                TO  WRK-SYMD (7:2)
               PERFORM 31012-SEIWA-HEN-SEC
               MOVE  WRK-HENYMDG(1:16)   TO  SKT1920-SRYYM 
           ELSE
               MOVE  WRK-SRYYMWH         TO  SKT1920-SRYYM
           END-IF
      *=== 月遅れは旧様式に印字 by Yoshikawa(2008/06/09) end
      *    保険者名
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *     PERFORM  920-HKNJAINF-SET-SEC
           IF  (WRK-SYMD (1:6)  <  WRK-CONS-SRYYM-200804)
             PERFORM  920-HKNJAINF-SET-SEC
           END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT1920-SEIYMD
      *    郵便番号
      ***** 04/01/30 DEL
      *     MOVE    "〒"                  TO  SKT1920-POST (1:)
      *     MOVE    SYS-1002-POST (1:3)   TO  SKT1920-POST (3:)
      *     MOVE    "-"                   TO  SKT1920-POST (6:)
      *     MOVE    SYS-1002-POST (4:)    TO  SKT1920-POST (7:)
      *---(01.00.09) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1920-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1920-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1920-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) start
           INSPECT SKT1920-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1920-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) start
           INSPECT SKT1920-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/09) end
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT1920-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT1920-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) end
      *---(01.00.09) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1920-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1920-TEL
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    保険者番号
      ***** 05/02/22 UPD
      *     MOVE    SKT1910TMP-HKNJANUM   TO  SKT1920-HKNJANUM
           MOVE    SKT1910TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1920-HKNJANUM
      *****
      *    医療機関コード
      ***** 03/09/04 INS
      *     MOVE    SYS-1001-HOSPCDN      TO  SKT1920-HOSPCD
      ***** 05/02/22 UPD
      *     MOVE    SYS-1001-HOSPCD       TO  SKT1920-HOSPCD
      *=== 医療機関コード印字修正 by Yoshikawa(2008/06/05) start
      *     MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
      *     PERFORM 2009-HENKAN-SEC
      *     MOVE    WRK-OUT-INPUT         TO  SKT1920-HOSPCD
           MOVE    SYS-1001-HOSPCDN      TO  SKT1920-HOSPCD
      *=== 医療機関コード印字修正 by Yoshikawa(2008/06/05) end
      *****
      *****
      *    法定外給付割合
           DISPLAY "給付割合=" SKT1910TMP-KYURATE
           EVALUATE  SKT1910TMP-KYURATE
           WHEN 8
             MOVE  "◯"    TO    SKT1920-KYURATE(3)
           WHEN 9
             MOVE  "◯"    TO    SKT1920-KYURATE(2)
           WHEN 10
             MOVE  "◯"    TO    SKT1920-KYURATE(1)
           END-EVALUATE
      *
      ***** 04/01/30 INS
           IF     SKT1910TMP-ZAITAKU  =  "1"
             MOVE  "在"    TO    SKT1920-ZAI1
             MOVE  "◯"    TO    SKT1920-ZAI2
           END-IF
      *****
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"         TO  SKT1920-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
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
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *    公費の為の２枚目以上か
           IF  (WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804)
           AND  WRK-CNT  >  1
             CONTINUE
           ELSE
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *    編集処理
           PERFORM  VARYING  IDX1  FROM    1   BY  1
                    UNTIL    IDX1  >  9
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT1910TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1920-KENSU(IDX1 IDX2)
      *    療養の給付：日数
               MOVE  SKT1910TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1920-NISSU(IDX1 IDX2)
      *    療養の給付：点数
               MOVE  SKT1910TMP-TENSU(IDX1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1920-TENSU(IDX1 IDX2)
      *    療養の給付：薬剤一部負担金
               MOVE  SKT1910TMP-YKZFTN (IDX1 IDX2)  TO  WRK-Z7
               MOVE  WRK-Z7   TO  SKT1920-YKZFTN(IDX1 IDX2)
      *    療養の給付：一部負担金
      ***** 05/02/22 UPD
      *         MOVE  SKT1910TMP-FTNMONEY (IDX1 IDX2)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT1920-ITBFTN(IDX1 IDX2)
               MOVE  SKT1910TMP-FTNMONEY (IDX1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1920-ITBFTN(IDX1 IDX2)
      *****
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT1910TMP-S-KENSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1920-S-KENSU(IDX1)
      *    食事療養：日数
             MOVE  SKT1910TMP-S-NISSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1920-S-NISSU(IDX1)
      *    食事療養：金額
             MOVE  SKT1910TMP-S-KINGAKU(IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1920-S-KINGK(IDX1)
      *    食事療養：標準負担額
      ***** 05/02/22 UPD
      *       MOVE  SKT1910TMP-S-FTNGAKU(IDX1)  TO  WRK-Z7
      *       MOVE  WRK-Z7   TO  SKT1920-S-FTNGK(IDX1)
             MOVE  SKT1910TMP-S-FTNGAKU(IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1920-S-FTNGK(IDX1)
      *****
           END-PERFORM
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *    地方公費編集処理
           IF  WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804
             PERFORM  VARYING  IDX1  FROM    1   BY  1
                      UNTIL    IDX1  >  3
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT1910TMP-TKENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT1920-TKENSU(IDX1 IDX2)
      *    療養の給付：日数
                 MOVE  SKT1910TMP-TNISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT1920-TNISSU(IDX1 IDX2)
      *    療養の給付：点数
                 MOVE  SKT1910TMP-TTENSU(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT1920-TTENSU(IDX1 IDX2)
      *    療養の給付：一部負担金
                 MOVE  SKT1910TMP-TFTNMONEY (IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT1920-TITBFTN(IDX1 IDX2)
               END-PERFORM
             END-PERFORM
           END-IF
      *
           END-IF
      *    公費の印字
           IF  WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804
             PERFORM  VARYING  IDX3  FROM  1  BY  1
                      UNTIL    IDX3  >     3
                      OR  WRK-CNT    >     20
                      OR  SKT1910TMP-KOHNUM2(WRK-CNT) = SPACE
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT1910TMP-KKENSU2 (WRK-CNT IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT1920-KKENSU(IDX3 IDX2)
      *    療養の給付：日数
                 MOVE  SKT1910TMP-KNISSU2 (WRK-CNT IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT1920-KNISSU(IDX3 IDX2)
      *    療養の給付：点数
                 MOVE  SKT1910TMP-KTENSU2 (WRK-CNT IDX2)   TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT1920-KTENSU(IDX3 IDX2)
      *    療養の給付：一部負担金
                 MOVE  SKT1910TMP-KFTNMONEY2 (WRK-CNT IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT1920-KITBFTN(IDX3 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT1910TMP-S-KKENSU2 (WRK-CNT)        TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1920-S-KKENSU(IDX3)
      *    食事療養：日数
               MOVE  SKT1910TMP-S-KNISSU2 (WRK-CNT)        TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1920-S-KNISSU(IDX3)
      *    食事療養：金額
               MOVE  SKT1910TMP-S-KKINGAKU2 (WRK-CNT)      TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1920-S-KKINGK(IDX3)
      *    食事療養：標準負担額
               MOVE  SKT1910TMP-S-KFTNGAKU2 (WRK-CNT)      TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1920-S-KFTNGK(IDX3)
      *    公費名
               MOVE  SKT1910TMP-KOHNUM2 (WRK-CNT)  TO  WRK-KOHNUM
               PERFORM  950-HKNNUM-SET-SEC
               MOVE  HKN-TANSEIDONAME      TO  SKT1920-KOHNAME(IDX3)
               MOVE  HKN-HBTNUM            TO  SKT1920-HBTNUM(IDX3)
      *
      *--- (2008/12/11) line add start monma ---------------------------   
             IF  SKT1910TMP-KOHNAME2 (WRK-CNT)  NOT =  SPACE
               MOVE  SKT1910TMP-KOHNAME2 (WRK-CNT)
                                        TO  SKT1920-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT1920-KOHNAME(IDX3)
             END-IF
      *--- (2008/12/11) line add end   monma ---------------------------
      *
               ADD  1  TO  WRK-CNT
             END-PERFORM
           END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
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
      ***** 05/02/22 UPD
      *     MOVE   "SKT1920"            TO  SPRT-PRTID
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *     MOVE   "SKT1920.red"        TO  SPRT-PRTID
           IF  WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804
               MOVE   "SKT1920.red"    TO  SPRT-PRTID
           ELSE
               MOVE   "SKT1920o.red"   TO  SPRT-PRTID
           END-IF
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
      *****
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/08/13) start
      **=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
      **     MOVE    "国保請求書"  TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書"               TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書 [特別療養費]"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
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
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/08/13) end
           MOVE    SKT1920             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
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
       330-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（老人・公費等）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1930
           INITIALIZE                    IDX4
      ***** 05/02/22 INS
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT1930-NO
      *****
      ***** 04/01/30 INS
           IF     SKT1910TMP-ZAITAKU  =  "1"
             MOVE  "在"    TO    SKT1930-ZAI1
             MOVE  "◯"    TO    SKT1930-ZAI2
           END-IF
      *****
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1930-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
      *
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（公費等）
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    老人編集処理
             PERFORM  VARYING  IDX1  FROM   10   BY  1
                      UNTIL    IDX1  >  11
               ADD  1  TO  IDX4
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT1910TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT1930-KENSU(IDX4 IDX2)
      *    療養の給付：日数
                 MOVE  SKT1910TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT1930-NISSU(IDX4 IDX2)
      *    療養の給付：点数
                 MOVE  SKT1910TMP-TENSU(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT1930-TENSU(IDX4 IDX2)
      *    療養の給付：薬剤一部負担金
                 MOVE  SKT1910TMP-YKZFTN (IDX1 IDX2)  TO  WRK-Z7
                 MOVE  WRK-Z7   TO  SKT1930-YKZFTN(IDX4 IDX2)
      *    療養の給付：一部負担金（入院のみ）
      ***** 05/02/22 UPD
      *           MOVE  SKT1910TMP-FTNMONEY (IDX1 IDX2)  TO  WRK-Z7
      *           MOVE  WRK-Z7  TO  SKT1930-ITBFTN(IDX4 IDX2)
                 MOVE  SKT1910TMP-FTNMONEY (IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9  TO  SKT1930-ITBFTN(IDX4 IDX2)
      *****
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT1910TMP-S-KENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1930-S-KENSU(IDX4)
      *    食事療養：日数
               MOVE  SKT1910TMP-S-NISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1930-S-NISSU(IDX4)
      *    食事療養：金額
               MOVE  SKT1910TMP-S-KINGAKU(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1930-S-KINGK(IDX4)
      *    食事療養：標準負担額
      ***** 05/02/22 UPD
      *         MOVE  SKT1910TMP-S-FTNGAKU(IDX1)  TO  WRK-Z7
      *         MOVE  WRK-Z7   TO  SKT1930-S-FTNGK(IDX4)
               MOVE  SKT1910TMP-S-FTNGAKU(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1930-S-FTNGK(IDX4)
      *****
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     3
                    OR  WRK-CNT    >     20
                    OR  SKT1910TMP-KOHNUM(WRK-CNT) = SPACE
      *    療養の給付：件数
             MOVE  SKT1910TMP-KKENSU (WRK-CNT)   TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1930-KKENSU(IDX3)
      *    療養の給付：日数
             MOVE  SKT1910TMP-KNISSU (WRK-CNT)   TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1930-KNISSU(IDX3)
      *    療養の給付：点数
             MOVE  SKT1910TMP-KTENSU (WRK-CNT)   TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1930-KTENSU(IDX3)
      *    療養の給付：薬剤一部負担金
             MOVE  SKT1910TMP-KYKZFTN (WRK-CNT)  TO  WRK-Z7
             MOVE  WRK-Z7   TO  SKT1930-KYKZFTN(IDX3)
      *    療養の給付：一部負担金
      ***** 05/02/22 UPD
      *       MOVE  SKT1910TMP-KFTNMONEY (WRK-CNT)  TO  WRK-Z7
      *       MOVE  WRK-Z7   TO  SKT1930-KITBFTN(IDX3)
             MOVE  SKT1910TMP-KFTNMONEY (WRK-CNT)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1930-KITBFTN(IDX3)
      *****
      *    食事療養：件数
             MOVE  SKT1910TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1930-S-KKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT1910TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1930-S-KNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT1910TMP-S-KKINGAKU (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1930-S-KKINGK(IDX3)
      *    食事療養：標準負担額
      ***** 05/02/22 UPD
      *       MOVE  SKT1910TMP-S-KFTNGAKU (WRK-CNT)      TO  WRK-Z7
      *       MOVE  WRK-Z7   TO  SKT1930-S-KFTNGK(IDX3)
             MOVE  SKT1910TMP-S-KFTNGAKU (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1930-S-KFTNGK(IDX3)
      *****
      *    公費名
             MOVE  SKT1910TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-TANSEIDONAME   TO  SKT1930-KOHNAME (IDX3)
      ***** 04/07/09 INS
             MOVE  HKN-HBTNUM         TO  SKT1930-HBTNUM(IDX3)
      *****
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start     
             IF  SKT1910TMP-KOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT1910TMP-KOHNAME (WRK-CNT)
                                        TO  SKT1930-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT1930-KOHNAME(IDX3)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
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
      ***** 05/02/22 UPD
      *     MOVE   "SKT1930"            TO  SPRT-PRTID
           MOVE   "SKT1930.red"        TO  SPRT-PRTID
      *****
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/08/13) start
      **=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
      **     MOVE    "国保請求書（他府県用）"  TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書（他府県用）"  TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書（他府県用） [特別療養費]"  
      *                                         TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保請求書（他府県用）"  
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保請求書（他府県用）［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保請求書（他府県用）［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保請求書（他府県用）［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/08/13) end
           MOVE    SKT1930             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
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
       331-PRINT-OUT-EXT.
           EXIT.
057400*
      *****************************************************************
      *    公費ソート処理  05/02/22 INS
      *****************************************************************
       KOH-SORT-SEC          SECTION.
      *
      *
           INITIALIZE  SORT-AREA
      *    公費数を取得
           MOVE    ZERO    TO    IDX-MAX
                                 IDX2 
           MOVE    SPACE   TO    WRK-KOHNUM
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT1910TMP-KOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT1910TMP-KOHNUM(IDX1)  <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT1910TMP-KOHNUM(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT1910TMP-KOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
           END-IF
      
           DISPLAY "一般ソート前１" SKT1910TMP-KOHNUM(1)
           DISPLAY "一般ソート前２" SKT1910TMP-KOHNUM(2)
           DISPLAY "一般ソート前３" SKT1910TMP-KOHNUM(3)
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   "999"   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT1910TMP-KOHNUM(IDX2)  >   SORT-KOHNUM(IDX1 - 1)
                   IF  SKT1910TMP-KOHNUM(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT1910TMP-KOHNUM(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT1910TMP-KOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE   "999"   TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT1910TMP-KOH-AREA
           MOVE  SORT-AREA  TO    SKT1910TMP-KOH-AREA
      *
           DISPLAY "一般ソート後１" SKT1910TMP-KOHNUM(1)
           DISPLAY "一般ソート後２" SKT1910TMP-KOHNUM(2)
           DISPLAY "一般ソート後３" SKT1910TMP-KOHNUM(3)
      *
      *
           .
       KOH-SORT-EXT.
           EXIT.
      *
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) start
      *****************************************************************
      *    公費ソート処理(新様式用)
      *****************************************************************
       KOH2-SORT-SEC          SECTION.
      *
      *
           INITIALIZE  SORT2-AREA
      *    公費数を取得
           MOVE    ZERO    TO    IDX-MAX
                                 IDX2 
           MOVE    SPACE   TO    WRK-KOHNUM
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT1910TMP-KOHNUM2(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT1910TMP-KOHNUM2(IDX1)  <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT1910TMP-KOHNUM2(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT1910TMP-KOH2-TBL(IDX2) TO  SORT-KOH2-TBL(1)
           END-IF
      *
           DISPLAY "一般ソート前１" SKT1910TMP-KOHNUM2(1)
           DISPLAY "一般ソート前２" SKT1910TMP-KOHNUM2(2)
           DISPLAY "一般ソート前３" SKT1910TMP-KOHNUM2(3)
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   "999"   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT1910TMP-KOHNUM2(IDX2)  >  SORT-KOHNUM2(IDX1 - 1)
                   IF  SKT1910TMP-KOHNUM2(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT1910TMP-KOHNUM2(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT1910TMP-KOH2-TBL(IDX3)  TO  SORT-KOH2-TBL(IDX1)
               MOVE   "999"   TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT1910TMP-KOH2-AREA
           MOVE  SORT2-AREA  TO   SKT1910TMP-KOH2-AREA
      *
           DISPLAY "一般ソート後１" SKT1910TMP-KOHNUM2(1)
           DISPLAY "一般ソート後２" SKT1910TMP-KOHNUM2(2)
           DISPLAY "一般ソート後３" SKT1910TMP-KOHNUM2(3)
      *
           .
       KOH2-SORT-EXT.
           EXIT.
      *
      *=== 帳票様式変更 by Yoshikawa(2008/05/26) end
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
      *###（地方公費仕様）
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      ***** 05/04/18 yamaguchi DEL
      *             MOVE    RECE10-REC      TO  MCPDATA-REC
      *             MOVE    "DBUPDATE"      TO  MCP-FUNC
      *             MOVE    "SEIKYU-KEY"    TO  ORC-DBPATH
      *             CALL    "ORCMCPSUB"      USING
      *                                          MCPAREA
      *                                          ORCMCPAREA
      *                                          MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
                   MOVE    RECE10-REC             TO  MCPDATA-REC
                   MOVE    "DBUPDATE"             TO  MCP-FUNC
      *****
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU2710 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU2710 SEIKYU INVALID ***"
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
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     INITIALIZE  HKNJAINF-REC
      *     MOVE  SYS-1001-HOSPID      TO  HKNJA-HOSPID
      *     MOVE  SKT1910TMP-HKNJANUM  TO  HKNJA-HKNJANUM
      *     MOVE  HKNJAINF-REC         TO  MCPDATA-REC
      *     MOVE  "DBSELECT"           TO  MCP-FUNC
      *     MOVE  "HKNJAINF-KEY"       TO  ORC-DBPATH
      *     CALL  "ORCMCPSUB"          USING
      *                                MCPAREA
      *                                ORCMCPAREA
      *                                MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  "HKNJAINF-KEY"  TO  ORC-DBPATH
      *       PERFORM  925-HKNJAINF-READ-SEC
      *       MOVE  HKNJA-HKNJANAME   TO  SKT1920-HKNJANAME
      *     ELSE
      ****** 05/02/22 UPD
      **       DISPLAY  "HKNJAINF SELECT ERR" UPON CONSOLE
      *       DISPLAY  "HKNJAINF SELECT ERR"
      ******
      *     END-IF
      **
      *     INITIALIZE  MCPAREA
      *     MOVE  "DBCLOSE"        TO  MCP-FUNC
      *     MOVE  "HKNJAINF-KEY"   TO  ORC-DBPATH
      *     CALL  "ORCMCPSUB"      USING
      *                            MCPAREA
      *                            ORCMCPAREA
      *                            MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           INITIALIZE  HKNJAINF-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKNJA-HOSPID
           MOVE    SPA-HOSPNUM               TO  HKNJA-HOSPNUM
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE  SKT1910TMP-HKNJANUM         TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.09) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY     TO  MCP-PATH
             MOVE    "tbl_hknjainf"      TO  MCP-TABLE
             MOVE    "key"               TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
             MOVE  HKNJA-HKNJANAME           TO  SKT1920-HKNJANAME
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       920-HKNJAINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
       925-HKNJAINF-READ-SEC  SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE  "DBFETCH"  TO  MCP-FUNC
      *     CALL  "ORCMCPSUB"  USING
      *                        MCPAREA
      *                        ORCMCPAREA
      *                        MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
      *****
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
           ELSE
             INITIALIZE  HKNJAINF-REC
             MOVE  1  TO  FLG-HKNJAINF
           END-IF
      *
           .
       925-HKNJAINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     INITIALIZE  HKNNUM-REC
      *     MOVE  SYS-1001-HOSPID      TO  HKN-HOSPID
      *     MOVE  WRK-KOHNUM           TO  HKN-HKNNUM
      *     MOVE  HKNNUM-REC           TO  MCPDATA-REC
      *     MOVE  "DBSELECT"           TO  MCP-FUNC
      *     MOVE  "HKNNUM-KEY2"        TO  ORC-DBPATH
      *     CALL  "ORCMCPSUB"          USING
      *                                MCPAREA
      *                                ORCMCPAREA
      *                                MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  "HKNNUM-KEY2"      TO  ORC-DBPATH
      *       PERFORM  955-HKNNUM-READ-SEC
      *     ELSE
      ****** 05/02/22 UPD
      **       DISPLAY  "HKNNUM SELECT ERR" UPON CONSOLE
      *       DISPLAY  "HKNNUM SELECT ERR"
      ******
      *     END-IF
      **
      *     INITIALIZE  MCPAREA
      *     MOVE  "DBCLOSE"        TO  MCP-FUNC
      *     MOVE  "HKNNUM-KEY2"    TO  ORC-DBPATH
      *     CALL  "ORCMCPSUB"      USING
      *                            MCPAREA
      *                            ORCMCPAREA
      *                            MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           INITIALIZE  HKNNUM-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID      TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM          TO  HKN-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE  WRK-KOHNUM           TO  HKN-HKNNUM
           MOVE  HKNNUM-REC           TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknnum"       TO  MCP-TABLE
           MOVE    "key2"             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.09) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNNUM-KEY2      TO  MCP-PATH
             MOVE    "tbl_hknnum"     TO  MCP-TABLE
             MOVE    "key2"           TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknnum"       TO  MCP-TABLE
           MOVE    "key2"             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
       955-HKNNUM-READ-SEC  SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE  "DBFETCH"  TO  MCP-FUNC
      *     CALL  "ORCMCPSUB"  USING
      *                        MCPAREA
      *                        ORCMCPAREA
      *                        MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
      *****
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
      ***** 04/01/30 INS
             IF    HKN-HKNNUM  =  "051"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "特定疾患"   TO   HKN-TANSEIDONAME
             END-IF
      *****
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
      *###（地方公費仕様）
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM          TO  RECE10-HOSPNUM
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE   LNK-PRTKANRI-SKYYMD   TO    RECE10-SKYYM.
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      ***** 04/01/30 INS
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
             MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                          RECE10-XXEDHKNJANUM
      ***** 05/04/12 INS
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
      *****
           END-IF
      *****
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) start
           IF  WRK-PARA-TOKUBETU  =  "2"
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *       MOVE  "000000"                TO  RECE10-SRYYM
      *       MOVE  "999999"                TO  RECE10-XXSRYYM
             MOVE  000000                  TO  RECE10-SRYYM
             MOVE  999999                  TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/01) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      ***** 05/04/12 DEL
      *     MOVE   "SEIKYU-KEY4"         TO    ORC-DBPATH.
      *     CALL   "ORCMCPSUB"           USING MCPAREA
      *                                        ORCMCPAREA
      *                                        MCPDATA-REC.
      ***** 05/04/12 INS
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
      *****
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
      ***** 05/04/12 DEL
      *            MOVE     "SEIKYU-KEY4"     TO    ORC-DBPATH
      *****
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
      ***** 05/04/12 DEL
      *     MOVE   "SEIKYU-KEY4" TO      ORC-DBPATH
      *     MOVE   "DBFETCH"     TO      MCP-FUNC
      *     CALL   "ORCMCPSUB"   USING   MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      *****
      ***** 05/04/12 INS
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
      *****
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
      *=== オンライン返戻対応 by Yoshikawa(2010/10/01) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/10/01) end
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
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
      *
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    "DBSELECT"          TO  MCP-FUNC
      *     MOVE    "PTINF-KEY"         TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      *     IF      MCP-RC              =   ZERO
      *         MOVE    "DBFETCH"           TO  MCP-FUNC
      *         MOVE    "PTINF-KEY"         TO  ORC-DBPATH
      *         CALL    "ORCMCPSUB"          USING
      *                                      MCPAREA
      *                                      ORCMCPAREA
      *                                      MCPDATA-REC
      *         IF      MCP-RC              =   ZERO
      *             MOVE    ZERO                TO  FLG-PTINF
      *             MOVE    MCPDATA-REC         TO  PTINF-REC
      *         ELSE
      *             MOVE    1                   TO  FLG-PTINF
      *             INITIALIZE                  PTINF-REC
      *         END-IF
      *     ELSE
      *         MOVE    1                   TO  FLG-PTINF
      *         INITIALIZE                  PTINF-REC
      *     END-IF
      **
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "PTINF-KEY"         TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY       TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT1910TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1910TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1910TMP
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
      *###（標準総括表仕様）
      *### MOVE    WRK-PARA-SYSYMD         TO  ORC-DBYMD
      *
      *###（地方公費仕様）
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    LNK-PRTKANRI-SKYYMD     TO  ORC-DBYMD
      *
      *     MOVE    "DBSELECT"          TO  MCP-FUNC
      *     MOVE    "SYSKANRI-KEY"      TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      *     IF      MCP-RC              =   ZERO
      *         MOVE    "DBFETCH"           TO  MCP-FUNC
      *         MOVE    "SYSKANRI-KEY"      TO  ORC-DBPATH
      *         CALL    "ORCMCPSUB"          USING
      *                                      MCPAREA
      *                                      ORCMCPAREA
      *                                      MCPDATA-REC
      *         IF      MCP-RC              =   ZERO
      *             MOVE    ZERO                TO  FLG-SYSKANRI
      *         ELSE
      *             MOVE    1                   TO  FLG-SYSKANRI
      *         END-IF
      *     ELSE
      *         MOVE    1                   TO  FLG-SYSKANRI
      *     END-IF
      **
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "SYSKANRI-KEY"      TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10    TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10    TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
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
           MOVE    "DBCLOSECURSOR"               TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       910-SYSKANRI-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       910-SEIKYU-INV-SEC         SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    "DBSELECT"          TO  MCP-FUNC
      *     MOVE    "SEIKYU-KEY"        TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      *     IF      MCP-RC              =   ZERO
      *         MOVE    "DBFETCH"           TO  MCP-FUNC
      *         MOVE    "SEIKYU-KEY"        TO  ORC-DBPATH
      *         CALL    "ORCMCPSUB"          USING
      *                                      MCPAREA
      *                                      ORCMCPAREA
      *                                      MCPDATA-REC
      *         IF      MCP-RC              =   ZERO
      *             MOVE    ZERO                TO  FLG-SEIKYU
      *             MOVE    MCPDATA-REC         TO  RECE10-REC
      *         ELSE
      *             MOVE    1                   TO  FLG-SEIKYU
      *         END-IF
      *     ELSE
      *         MOVE    1                   TO  FLG-SEIKYU
      *     END-IF
      **
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "SEIKYU-KEY"        TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険番号マスター読込
      *****************************************************************
       900-HKNNUM-READ-SEC         SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
      *****
      *     IF      MCP-RC              =   ZERO
      *         MOVE    MCPDATA-REC     TO  HKNNUM-REC
      *         MOVE    ZERO            TO  FLG-HKNNUM
      *     ELSE
      *         INITIALIZE                  HKNNUM-REC
      *        MOVE    1               TO  FLG-HKNNUM
      *     END-IF
      *
           .
       900-HKNNUM-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    管理マスター読込（キー）
      *****************************************************************
       900-HKNJAINF-INV-SEC         SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    "DBSELECT"          TO  MCP-FUNC
      *     MOVE    "HKNJAINF-KEY"      TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      *     IF      MCP-RC              =   ZERO
      *         MOVE    "DBFETCH"           TO  MCP-FUNC
      *         MOVE    "HKNJAINF-KEY"      TO  ORC-DBPATH
      *         CALL    "ORCMCPSUB"          USING
      *                                      MCPAREA
      *                                      ORCMCPAREA
      *                                      MCPDATA-REC
      *         IF      MCP-RC              =   ZERO
      *             MOVE    ZERO                TO  FLG-HKNJAINF
      *             MOVE    MCPDATA-REC         TO  HKNJAINF-REC
      *         ELSE
      *             MOVE    1                   TO  FLG-HKNJAINF
      *         END-IF
      *     ELSE
      *         MOVE    1                   TO  FLG-HKNJAINF
      *     END-IF
      *
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "HKNJAINF-KEY"      TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/04/18 yamaguchi INS
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hknjainf"       TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       900-HKNJAINF-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT1910TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    全角変換処理 05/02/22 INS
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
      *--- (2008/12/11) line add start monma ---------------------------
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
      *--- (2008/12/11) line add end   monma --------------------------
      *
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/05/12) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/07/11) end
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
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    "DBOPEN"            TO  MCP-FUNC.
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC.
      **
      *     MOVE    "DBSTART"           TO  MCP-FUNC.
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC.
      ***** 05/04/18 yamaguchi INS
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
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
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      ***** 05/04/18 yamaguchi DEL
      *     MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC.
      **
      *     MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC.
      ***** 05/04/18 yamaguchi INS
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
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
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****
           .                             
       900-DBCLOSE-EXT.
           EXIT.
