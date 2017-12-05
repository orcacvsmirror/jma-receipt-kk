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
       PROGRAM-ID.             SOKATU0710.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・請求書集計処理
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/06/17    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            返戻対応含む
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev 	修正者	日付		内容
      *  01.00.01    内田    06/11/23    帳票様式の変更に伴う修正
      *                                  食事がない場合でも生活療養費を印字
      *  01.00.02    内田    07/08/26    Ver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.03    内田    08/02/08    退職で保険番号100所持者は
      *                                  退職法定外欄へ印字
      *  01.00.04    長屋    08/04/27    帳票様式に伴う修正
      *  01.00.05    内田    08/05/30    １０割の印字修正
      *  01.00.06    内田    08/07/18    国組・県外国保の未就学児は１０割
      *                                  ではなく、該当の箇所へ印字
      *  01.00.07    吉川    08/10/09    シス管「2007」公費まとめ対応
      *                                  SPA-AREA初期化
      *  01.00.08    内田    09/09/15    在総診は別帳票ではなく、まとめて印字
      *  01.00.09    吉川    09/11/17    シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *  01.00.10    吉川    10/05/17    札幌市の代表保険者番号変更
      *  01.00.11    吉川    10/07/02    代表保険者番号追加
      *                                  オンライン返戻対応
      *  01.00.12    吉川    11/02/09    特別療養費国保対応
      *                                  open-cobol1.0対応
      *  01.00.13    吉川    11/03/15    東北地方太平洋沖地震対応（対象者別集計）
      *  01.00.14    吉川    11/04/14    東北地方太平洋沖地震対応（仕様変更）
      *  01.00.15    吉川    11/04/22    オンライン請求の場合
      *                                  災害分のみ印字するように修正
      *  01.00.16    吉川    11/05/13    保険番号345は10割に印字する
      *  01.00.17    吉川    12/05/17    災害該当で免除の場合は、
      *                                  年齢問わず各給付割合欄に印字する
      *  01.00.18    萩野    12/07/11    災害該当で免除の場合は、
      *                                  70歳未満であれば各給付割合欄に印字する
      *  01.00.19    吉川    12/12/21    プラグイン対応
      *                                  医療機関情報編集対応
      *  01.00.20    吉川    13/12/12    プログラムオプション対応
      *  01.00.21    吉川    14/05/21    前期高齢者２割対応
      *  01.00.22    吉川    14/09/04    返戻時、再印刷画面のタイトル修正
      *  01.00.23    吉川    14/10/06    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.24    門間    16/01/06    医療機関編集情報への開設者名追加対応
      *  01.00.25    門間    17/12/01    医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *                                  公費番号まとめ情報の公費番号の追加
      *                                  SITEKBN変更（動作に変更なし）
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT0710TMP-FILE ASSIGN    SKT0710TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT0710TMP-KEY
                                   FILE    STATUS  IS  STS-SKT0710.
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
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
      *     SELECT  YUSEN-FILE    ASSIGN FILE-NAME
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-YUSEN.
      **
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **     SELECT  CITYNUM-FILE  ASSIGN FILE-NAME
      *     SELECT  CITYNUM-FILE  ASSIGN FILE-NAME2
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-CITYNUM.
      **
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
      **    オンライン請求設定ファイル
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **     SELECT  ONLINE-FILE   ASSIGN FILE-NAME
      *     SELECT  ONLINE-FILE   ASSIGN FILE-NAME3
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-ONLINE.
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT0710TMP-FILE.
           COPY    "CPSKT0710TMP.INC".
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
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
      **    優先保険者番号ファイル
      * FD  YUSEN-FILE.
      * 01  YUSEN-HKNJANUM             PIC X(06). 
      **
      **    政令指定都市代表番号ファイル
      * FD  CITYNUM-FILE.
      * 01  CITYNUM-REC.
      *     03  CITYNUM-NUM3        PIC  X(03).
      *     03  FILLER              PIC  X(01).
      *     03  CITYNUM-HENKANNUM   PIC  X(06).
      *     03  FILLER              PIC  X(01).
      *     03  CITYNUM-HENKAN-FLG  PIC  X(01).
      *     03  FILLER              PIC  X(01).
      **
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
      * FD  ONLINE-FILE.
      * 01  ONLINE-REC.
      *     03  ONLINE-ONLINEKBN    PIC X(01).
      *     03  FILLER              PIC X(01).
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT0710TP//.
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *---(01.00.02) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT0710.INC".
           COPY    "SKT0720.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT0710         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
           03  STS-CITYNUM         PIC X(02).
      *=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
           03  STS-ONLINE          PIC X(02).
      *=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT0710TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-RECE02          PIC 9(01).
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) start
           03  FLG-PTKOHINF        PIC 9(01).
           03  FLG-MENJO           PIC 9(01).
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) end
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDX6                PIC 9(01).
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
           03  IDX                 PIC 9(05).
           03  IDY                 PIC 9(04).
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *=== 公費番号まとめ追加 by Monma(2017/12/01) start
           03  IDZ                 PIC 9(04).
      *=== 公費番号まとめ追加 by Monma(2017/12/01) end
      *
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
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU0710".
      *     03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      **
      * 01  FILE-NAME2.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM2       PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU0710".
      *     03  FILLER              PIC X(11)  VALUE "CITYNUM.INI".
      **
      * 01  FILE-NAME3.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM3       PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SOKATU0710".
      *     03  FILLER              PIC X(10)  VALUE "ONLINE.INI".
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2012/12/21) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
           03  WRK-ONLINEKBN    PIC X(01).
      *=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT             PIC 9(02).
           03  WRK-KOHNUM          PIC X(03).
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
           03  WRK-KOHNAME         PIC X(10).
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *    政令指定都市代表番号退避エリア
           03  WRK-CITYNUM-TBL  OCCURS 20.
               05  WRK-CITYNUM-NUM3        PIC  X(03).
               05  FILLER                  PIC  X(01).
               05  WRK-CITYNUM-HENKANNUM   PIC  X(06).
               05  FILLER                  PIC  X(01).
               05  WRK-CITYNUM-HENKAN-FLG  PIC  X(01).
               05  FILLER                  PIC  X(01).
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH                PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           03  WRK-PATH2             PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
           03  WRK-YUSEN           PIC X(06).
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *
      *    医療機関情報
           03  WRK-HOSPNAME            PIC X(100).
           03  WRK-HOSPNAME-R          REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1       PIC X(50).
               05  WRK-HOSPNAME2       PIC X(50).
           03  WRK-HOSPADRS            PIC X(100).
           03  WRK-HOSPADRS-R          REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1       PIC X(50).
               05  WRK-HOSPADRS2       PIC X(50).
           03  WRK-HOSPTEL             PIC X(15).
      *---(01.00.02) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
      *
      *=== デバッグ↓ =================================================
           03  WRK-MSG                 PIC  X(90).
      *=== デバッグ↑ =================================================
      *
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
      *=== 公費番号まとめ追加 by Monma(2017/12/01) start
      *                             PIC X(03)   OCCURS  10.
                                   PIC X(03)   OCCURS  30.
      *=== 公費番号まとめ追加 by Monma(2017/12/01) end
           03  WRK-2007-MAX        PIC 9(03).
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-KOH             PIC 9(02).
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.02) LINE ADD END   ------------------------------------
      *---(01.00.07) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           COPY    "CPRCF010.INC".
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    公費請求テーブル
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) start
      *    患者公費情報
       01  PTKOHINF-REC.
           COPY    "CPPTKOHINF.INC".
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) end
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      * 
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *    公費請求書
      *     COPY    "CPKOHSKY.INC"
      *             REPLACING  //KOHSKY//
      *             BY         //RECE02//.
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *=== SPA-AREA初期化 by Yoshikawa(2008/10/09) start
           INITIALIZE                  SPA-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2008/10/09) end
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
      *---(01.00.02) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.02) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU0710"    TO  JOB-PGID
           MOVE    "国保請求書"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *=== open-cobol1.0対応 by Yoshikawa(2011/02/09) start
      *     MOVE    "SKT0710TP"         TO  SKT0710TP-FILE-ID
           MOVE    "SKT0710"           TO  SKT0710TP-FILE-ID
      *=== open-cobol1.0対応 by Yoshikawa(2011/02/09) end
           MOVE    LNK-PRTKANRI-TERMID TO  SKT0710TP-TERMID
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT0710TP-HOSPNUM
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
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
           MOVE  SKT0710TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT0710TP-FULLNAME
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
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
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
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
      *=== 公費番号まとめ追加 by Monma(2017/12/01) start
               MOVE    ZERO                TO  IDZ
      *=== 公費番号まとめ追加 by Monma(2017/12/01) end
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       10
                       OR      SYS-2007-KOHNUM (IDX2)   =   SPACE
      *=== 公費番号まとめ追加 by Monma(2017/12/01) start
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
      *=== 公費番号まとめ追加 by Monma(2017/12/01) end
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
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
      *     PERFORM  110-INI-FILE-SEC
      **
      *     PERFORM  111-INI-FILE-SEC
      **
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
      *     PERFORM  112-INI-FILE-SEC
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
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
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
           OPEN    OUTPUT  UPD-FILE
      *  
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
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
      **
      ******************************************************************
      **    政令指定都市代表番号INIファイル読み込み処理
      ******************************************************************
      * 111-INI-FILE-SEC                SECTION.
      **
      **
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/CITYNUM.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM2
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      **
      *     DISPLAY "ファイル名2="  FILE-NAME2
      **
      *     INITIALIZE   CITYNUM-REC
      **
      *     OPEN  INPUT  CITYNUM-FILE
      **
      **
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >    20
      *       READ CITYNUM-FILE  NEXT
      *         AT END
      *           MOVE    20    TO    IDX1
      *         NOT  AT  END
      *           MOVE  CITYNUM-REC    TO    WRK-CITYNUM-TBL(IDX1)
      *           DISPLAY "読み込みレコード=" CITYNUM-REC
      *       END-READ
      *     END-PERFORM
      **
      *     CLOSE CITYNUM-FILE
      **
      *     .
      * 111-INI-FILE-EXT.
      *     EXIT.
      **
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
      ******************************************************************
      **    オンライン請求設定INIファイル読み込み処理  
      ******************************************************************
      * 112-INI-FILE-SEC                SECTION.
      **
      **    オンライン請求設定取得
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2012/12/21) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/ONLINE.INI"    TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM3
      **=== プラグイン対応 by Yoshikawa(2012/12/21) end
      **
      *     DISPLAY "ファイル名3="  FILE-NAME3
      **
      *     INITIALIZE   ONLINE-REC
      **
      *     OPEN  INPUT  ONLINE-FILE
      **
      *     READ ONLINE-FILE
      *       AT END
      *         INITIALIZE        ONLINE-REC
      *     END-READ
      **
      *     CLOSE ONLINE-FILE
      **
      *     DISPLAY "オンライン請求設定取得=" ONLINE-ONLINEKBN
      *     IF    ONLINE-ONLINEKBN  =  "0" OR "1"
      *       MOVE   ONLINE-ONLINEKBN  TO  WRK-ONLINEKBN
      *     ELSE
      *       MOVE   "0"               TO  WRK-ONLINEKBN
      *     END-IF
      **
      *     DISPLAY "オンライン請求設定 =" WRK-ONLINEKBN
      **
      *     .
      * 112-INI-FILE-EXT.
      *     EXIT.
      **
      **=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SOKATU0710"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    政令指定都市代表番号
           MOVE    "CITYNUM"                 TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  20
             MOVE    WRK-OPTION(IDX)(1:3) 
                                      TO  WRK-CITYNUM-NUM3(IDX)
             MOVE    WRK-OPTION(IDX)(5:6) 
                                      TO  WRK-CITYNUM-HENKANNUM(IDX)
             MOVE    WRK-OPTION(IDX)(12:1)
                                      TO  WRK-CITYNUM-HENKAN-FLG(IDX)
             DISPLAY "政令指定都市代表番号="  WRK-OPTION(IDX)(1:13)
           END-PERFORM
      *
      *    オンライン請求設定
           MOVE    "ONLINE"                  TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           MOVE    WRK-OPTION(1)(1:1)        TO  WRK-ONLINEKBN
           DISPLAY "オンライン請求設定 =" WRK-ONLINEKBN
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
           MOVE    ZERO                      TO  IDY
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
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT0710TMP-FILE
           CLOSE            SKT0710TMP-FILE
           OPEN     I-O     SKT0710TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT0710TMP-FILE
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
           DISPLAY "*** SOKATU0710 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU0710 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------

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
           INITIALIZE       SKT0710TMP-REC
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT0710TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT0710TMP-HKNJANUM(1:6)
           END-IF
      *
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >    20
             IF  WRK-CITYNUM-NUM3(IDX1)  =  SKT0710TMP-HKNJANUM(1:3)
               AND  WRK-CITYNUM-HENKAN-FLG(IDX1)  NOT  =  "0"
               MOVE  WRK-CITYNUM-HENKANNUM(IDX1)
                                        TO  SKT0710TMP-HKNJANUM
               DISPLAY "変換前=" RECE10-HKNJANUM-S
                       "変換後=" SKT0710TMP-HKNJANUM
             END-IF
           END-PERFORM
      *
      *    出力順設定
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
      *     IF     YUSEN-HKNJANUM    =    SKT0710TMP-HKNJANUM
           IF     WRK-YUSEN    =    SKT0710TMP-HKNJANUM
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
             MOVE        1          TO   SKT0710TMP-SYUTURYOKU
           ELSE
             MOVE        2          TO   SKT0710TMP-SYUTURYOKU
           END-IF
      *=== 在総診はまとめて印字 by Uchida(2009/09/15) start
      *    在宅
      *     MOVE   RECE10-ZAITAKU    TO   SKT0710TMP-ZAITAKU
      *=== 在総診はまとめて印字 by Uchida(2009/09/15) end
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *       IF  (RECE10-HKNNUM  =  "060"  AND  RECE10-AGE  >=  70
      *            AND  RECE10-KYURATE  =  9)
             IF  ((RECE10-HKNNUM  =  "060" OR "068")
                  AND (RECE10-AGE  >=  70)
                  AND (RECE10-KYURATE  =  9))
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
             AND  ( RECE10-RJNHKNNUM  =  SPACE )
                      MOVE  RECE10-SRYYM TO SKT0710TMP-SRYYM
             END-IF
           END-IF  
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== 災害対応 by Yoshikawa(2011/03/15) start
      *    災害対象者は別集計
      *=== 災害対応 by Yoshikawa(2011/04/14) start
      *     IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
      *       MOVE  RECE10-ETC-YKZFTN (1)  TO  SKT0710TMP-GENMEN
      *     END-IF
           EVALUATE  RECE10-ETC-YKZFTN (1)
             WHEN  ZERO
             WHEN  1
             WHEN  3
               CONTINUE
             WHEN  2
             WHEN  4
               MOVE    "00001"            TO  SKT0710TMP-GENMEN
             WHEN  OTHER
               IF  RECE10-HKNJANUM  NOT =  ZERO
                 MOVE    "00001"          TO  SKT0710TMP-GENMEN
               END-IF
           END-EVALUATE
      *=== 災害対応 by Yoshikawa(2011/04/14) end
      *=== 災害対応 by Yoshikawa(2011/03/15) end
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
           DISPLAY "ptid" RECE10-PTID
           IF  RECE10-NYUGAIKBN  =  1
             MOVE  1  TO  IDX2
           ELSE
             MOVE  2  TO  IDX2
           END-IF
      *
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             IF    RECE10-KYURATE    =   9
               MOVE   12     TO    IDX1
             ELSE
      *---(01.00.01) LINE ADD START ------------------------------------
      *         MOVE   13     TO    IDX1
               IF  RECE10-KYURATE  =  7
                 MOVE   13     TO    IDX1
               ELSE
                 MOVE   14     TO    IDX1
               END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
             END-IF
           ELSE
      *
             PERFORM  900-KOHSKY-READ-SEC
             IF    RECE02-KOHNUM(1)  =  "144" OR "145"
               OR  RECE02-KOHNUM(2)  =  "144" OR "145"
               OR  RECE02-KOHNUM(3)  =  "144" OR "145"
               OR  RECE02-KOHNUM(4)  =  "144" OR "145"
               MOVE    10            TO RECE10-KYURATE
               DISPLAY "１０割変換対象者=" RECE10-PTNUM
                       "公費１="  RECE02-KOHNUM(1)
                       "公費２="  RECE02-KOHNUM(2)
             END-IF
      *
      *    一般／退職者
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *    年齢チェック
               IF  RECE10-AGE  >=  70
                 EVALUATE  RECE10-KYURATE
                   WHEN  9       MOVE  1  TO  IDX1
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) start
                   WHEN  8
                     IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                         MOVE    1    TO    IDX1
                     ELSE
                         MOVE    2    TO    IDX1
                     END-IF
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) end
                   WHEN  OTHER   MOVE  2  TO  IDX1
                 END-EVALUATE
               ELSE
      *---(01.00.04) LINE ADD START ------------------------------------
      *---(01.00.06) LINE ADD START ------------------------------------
      *           IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
      *           AND  (RECE10-FLG (1)   =  1)
      *    県内の市町村国保で未就学児は１０割
                 IF   (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                 AND  (RECE10-PREFKBN  =  1)
                 AND  (RECE10-HKNJANUM(3:1)  NOT =  "3")
      *---(01.00.06) LINE ADD END   ------------------------------------
                     MOVE  6     TO  IDX1
                 ELSE
      *---(01.00.06) LINE ADD START ------------------------------------
      *             IF  RECE10-AGE  >= 3
      *    県内の市町村国保で３歳未満は１０割
                   IF  (RECE10-AGE  >= 3)
                   OR  (RECE10-PREFKBN  =  2)
                   OR  (RECE10-HKNJANUM(3:1)  =  "3")
      *---(01.00.06) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD END   ------------------------------------
      *    割合チェック
                     EVALUATE  RECE10-KYURATE
                       WHEN  7       MOVE  3  TO  IDX1
                       WHEN  8       MOVE  4  TO  IDX1
      *---(01.00.05) LINE ADD START ------------------------------------
      **---(01.00.04) LINE ADD START ------------------------------------
      **                 WHEN  9       MOVE  5  TO  IDX1
      **                 WHEN  OTHER   MOVE  6  TO  IDX1
      *                 WHEN  OTHER   MOVE  5  TO  IDX1
      *---(01.00.04) LINE ADD END   ------------------------------------
                       WHEN  9       MOVE  5  TO  IDX1
                       WHEN  OTHER   MOVE  6  TO  IDX1
      *---(01.00.05) LINE ADD START ------------------------------------
                     END-EVALUATE
      *---(01.00.04) LINE ADD START ------------------------------------
                   ELSE
                       MOVE  6   TO IDX1
                   END-IF
                 END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 保険番号345は10割 by Yoshikawa(2011/05/13) start
                 IF  RECE02-KOHNUM (1)  =  "345"
                 OR  RECE02-KOHNUM (2)  =  "345"
                 OR  RECE02-KOHNUM (3)  =  "345"
                 OR  RECE02-KOHNUM (4)  =  "345"
                     MOVE  6    TO  IDX1
                 END-IF
      *=== 保険番号345は10割 by Yoshikawa(2011/05/13) end
               END-IF
      *
      *=== 災害で免除は一般の場合に適応する by hagino (2012/07/11) start
               IF  RECE10-AGE  <  70
      *=== 災害で免除は一般の場合に適応する by hagino (2012/07/11) end
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) start
                 IF  SKT0710TMP-GENMEN  NOT =  SPACE
                   PERFORM  940-PTKOHINF-SELECT-SEC
      *            災害で免除の場合、各給付割合へ
                   IF  FLG-MENJO  =  1
                     EVALUATE  RECE10-KYURATE
                       WHEN  7       MOVE  3  TO  IDX1
                       WHEN  8       MOVE  4  TO  IDX1
                       WHEN  9       MOVE  5  TO  IDX1
                       WHEN  OTHER   MOVE  6  TO  IDX1
                     END-EVALUATE
                   END-IF
                 END-IF
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) end
      *=== 災害で免除は一般の場合に適応する by hagino (2012/07/11) start
               END-IF
      *=== 災害で免除は一般の場合に適応する by hagino (2012/07/11) end
      *
             ELSE
      *    年齢チェック
               IF  RECE10-AGE  >=  70
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) start
      *           IF  RECE10-KYURATE  =  9
      *             MOVE  8   TO  IDX1
      *           ELSE
      *             MOVE  9   TO  IDX1
      *           END-IF
                 EVALUATE  RECE10-KYURATE
                   WHEN  9
                     MOVE    8     TO    IDX1
                   WHEN  8
                     IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                         MOVE    8    TO    IDX1
                     ELSE
                         MOVE    9    TO    IDX1
                     END-IF
                   WHEN  7
                     MOVE    9     TO    IDX1
                 END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/21) end
               ELSE
                 IF  RECE10-HONKZKKBN  =  "1"
                   MOVE   7    TO  IDX1
                 ELSE
                   MOVE   10   TO  IDX1
                 END-IF
               END-IF
      *
      *        給付割合が１０割なら法定外に印字する。
               IF  RECE10-KYURATE  =  10
                   MOVE  11    TO  IDX1
               END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *        保険番号１００所持者は法定外に印字する
               IF  RECE02-KOHNUM (1)  =  "100"
               OR  RECE02-KOHNUM (2)  =  "100"
               OR  RECE02-KOHNUM (3)  =  "100"
               OR  RECE02-KOHNUM (4)  =  "100"
                   MOVE  11    TO  IDX1
               END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
             END-IF
           END-IF
           DISPLAY "IDX1 = " IDX1
           DISPLAY "IDX2 = " IDX2
      *
           PERFORM  2102-SYUKEI-SEC
      *
      *    公費併用
           IF  RECE10-KOHNUM(1)  NOT =  SPACE
             PERFORM  220-KOH-SYUKEI-SEC
           END-IF
      *
           IF  FLG-SKT0710TMP  =  1
               WRITE    SKT0710TMP-REC
           ELSE
               REWRITE  SKT0710TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・集計処理
      *****************************************************************
       2102-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                   TO  SKT0710TMP-KENSU (IDX1 IDX2)
      *    療養の給付：診療実日数
           ADD   RECE10-JNISSU (1)   TO  SKT0710TMP-NISSU (IDX1 IDX2)
      *    療養の給付：点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT0710TMP-TENSU (IDX1 IDX2)
      *---(01.00.01) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *     ADD   RECE10-YKZFTN (1)   TO  SKT0710TMP-YKZFTN(IDX1 IDX2)
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    療養の給付：一部負担金
           ADD   RECE10-FTNMONEY(1)  TO  SKT0710TMP-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  0
      *
      *    食事療養：件数
             ADD   1                 TO  SKT0710TMP-S-KENSU (IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養：日数
           ADD   RECE10-SHOKUJINISSU (1)   
                                     TO  SKT0710TMP-S-NISSU (IDX1)
      *    食事療養：金額
           ADD   RECE10-SHOKUJIRYOYOHI (1)
                                     TO  SKT0710TMP-S-KINGAKU(IDX1)
      *    食事療養：標準負担額
           ADD   RECE10-SHOKUJIFTN (1)
                                     TO  SKT0710TMP-S-FTNGAKU(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           MOVE    1               TO  FLG-UPD
           .
       2102-SYUKEI-EXT.
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
      *    ５１、９１は１つにまとめる
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
      *      公費番号まとめ情報があるとき
             MOVE  SPACE     TO  WRK-KOHNAME
             IF  WRK-2007-MAX  >  ZERO
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/17) start
      *                   UNTIL   IDZ2  >       5
      *=== 公費番号まとめ追加 by Monma(2017/12/01) start
      *                   UNTIL   IDZ2  >       10
                         UNTIL   IDZ2  >       20
      *=== 公費番号まとめ追加 by Monma(2017/12/01) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/17) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/17) start
      *               MOVE  5             TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2017/12/01) start
      *               MOVE  10            TO  IDZ2
                     MOVE  20            TO  IDZ2
      *=== 公費番号まとめ追加 by Monma(2017/12/01) end
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/17) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
      *    全国公費のみ
             IF  RECE10-KOHNUM (IDX3)(1:1) = "0" OR "9"
      *    公費判別
               PERFORM  VARYING  IDX4  FROM  1  BY  1
                        UNTIL    IDX4  >     20
                        OR       SKT0710TMP-KOHNUM (IDX4) = SPACE
                 IF  RECE10-KOHNUM(IDX3) = SKT0710TMP-KOHNUM(IDX4)
                   MOVE  IDX4  TO  CNT-KOH
                   MOVE  20    TO  IDX4
                END-IF
               END-PERFORM
      *
      *    該当公費がなかった場合
               IF  IDX4  < 20
                 MOVE  IDX4  TO  CNT-KOH
               END-IF
      *    公費名
               MOVE  RECE10-KOHNUM(IDX3)
                                     TO  SKT0710TMP-KOHNUM(CNT-KOH)
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
      *    公費名称
               MOVE  WRK-KOHNAME     TO  SKT0710TMP-KOHNAME(CNT-KOH)
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
      *    療養の給付：件数
               ADD  1                TO SKT0710TMP-KKENSU(CNT-KOH IDX2)
      *
      *    療養の給付:診療実日数
               ADD  RECE10-JNISSU(IDX3 + 1)
                                      TO SKT0710TMP-KNISSU(CNT-KOH IDX2)
      *
      *    療養の給付：点数
               ADD  RECE10-TOTALTEN(IDX3 + 1)
                                     TO SKT0710TMP-KTENSU(CNT-KOH IDX2)
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         ADD  RECE10-YKZFTN(IDX3 + 1)
      *                             TO SKT0710TMP-KYKZFTN(CNT-KOH IDX2)
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *    療養の給付：一部負担金
               ADD  RECE10-FTNMONEY (IDX3 + 1)
                                   TO SKT0710TMP-KITBFTN(CNT-KOH IDX2)
      *
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養：件数
                 ADD   1             TO  SKT0710TMP-S-KKENSU (CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
               END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *    食事療養：日数
               ADD   RECE10-SHOKUJINISSU (IDX3 + 1)
                                     TO  SKT0710TMP-S-KNISSU (CNT-KOH)
      *
      *    食事療養：金額
               ADD   RECE10-SHOKUJIRYOYOHI (IDX3 + 1)
                                     TO  SKT0710TMP-S-KKINGAKU(CNT-KOH)
      *
      *    食事療養：標準負担額
               ADD   RECE10-SHOKUJIFTN (IDX3 + 1)
                                     TO  SKT0710TMP-S-KFTNGAKU(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
      *         END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
             END-IF
           END-PERFORM
      *
           .
       220-KOH-SYUKEI-EXT.
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
           OPEN     INPUT       SKT0710TMP-FILE
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
             PERFORM 311-HEAD-HEN-SEC
      *    帳票編集<明細>処理
             PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理
             PERFORM 331-PRINT-OUT-SEC
      *    公費が残っているか
             PERFORM  UNTIL  SKT0710TMP-KOHNUM (WRK-CNT) = SPACE
      *    帳票編集<見出し>処理
               PERFORM 313-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 323-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 333-PRINT-OUT-SEC
             END-PERFORM
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
             MOVE  1  TO  WRK-CNT
           END-PERFORM
      *
           CLOSE    SKT0710TMP-FILE
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
           INITIALIZE                    SKT0710
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT0710-SRYYM
      *
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT0710-SEIYMD
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT0710-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT0710-HOSPNAME
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT0710-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT0710-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT0710-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT0710-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT0710-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT0710-TEL
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
      *     MOVE    SYS-1001-KAISETUNAME  TO  SKT0710-KAISETUNAME
           MOVE    WRK-KAISETUNAME       TO  SKT0710-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT0710-HOSPCD
      *
      *    保険者番号
      *=== 災害対応 by Yoshikawa(2011/04/14) start
      *     MOVE  SKT0710TMP-HKNJANUM     TO  SKT0710-HKNJANUM
      *=== 災害対応 by Yoshikawa(2011/04/14) end
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT0710-HOSPCD
      *
      *    保険者番号
      *=== 災害対応 by Yoshikawa(2011/04/14) start
           IF  SKT0710TMP-HKNJANUM  NOT =  ZERO
      *=== 災害対応 by Yoshikawa(2011/04/14) end
             MOVE    SKT0710TMP-HKNJANUM TO  WRK-MAE-INPUT
             PERFORM 2009-HENKAN-SEC
             MOVE    WRK-OUT-INPUT       TO  SKT0710-HKNJANUM
      *
      *    保険者名
             IF    SKT0710TMP-HKNJANAME  =  SPACE
               PERFORM  920-HKNJAINF-SET-SEC
               MOVE  HKNJA-HKNJANAME       TO  SKT0710-HKNJANAME
             ELSE
               MOVE  SKT0710TMP-HKNJANAME  TO  SKT0710-HKNJANAME
             END-IF
      *=== 災害対応 by Yoshikawa(2011/04/14) start
           END-IF
      *=== 災害対応 by Yoshikawa(2011/04/14) end
      *
      *    在総診
           IF      SKT0710TMP-ZAITAKU     =    "1"
             MOVE  "在"                   TO   SKT0710-ZAI1
             MOVE  "◯"                   TO   SKT0710-ZAI2
           END-IF
      *
      *    ページ番号
           MOVE    CNT-PAGE               TO   WRK-Z4
           MOVE    WRK-Z4                 TO   SKT0710-NO
      *---(01.00.04) LINE ADD START ------------------------------------
           IF  SKT0710TMP-SRYYM  NOT =  ZERO
               MOVE   "○"                TO   SKT0710-KYUHANTEI
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"           TO   SKT0710-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
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
                    UNTIL    IDX1  >     14
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *
      *    療養の給付：件数
               MOVE  SKT0710TMP-KENSU (IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT0710-KENSU(IDX1 IDX2)
      *
      *    療養の給付：日数
               MOVE  SKT0710TMP-NISSU (IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT0710-NISSU(IDX1 IDX2)
      *
      *    療養の給付：点数
               MOVE  SKT0710TMP-TENSU (IDX1 IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT0710-TENSU(IDX1 IDX2)
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         MOVE  SKT0710TMP-YKZFTN (IDX1 IDX2)  TO  WRK-Z9
      *         MOVE  WRK-Z9   TO  SKT0710-YKZFTN(IDX1 IDX2)
      *---(01.00.01) LINE ADD START ------------------------------------
      *
      *    療養の給付：一部負担金
               MOVE  SKT0710TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT0710-ITBFTN(IDX1 IDX2)
             END-PERFORM
      *
      *    食事療養：件数
             MOVE  SKT0710TMP-S-KENSU (IDX1)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT0710-S-KENSU(IDX1)
      *
      *    食事療養：日数
             MOVE  SKT0710TMP-S-NISSU (IDX1)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT0710-S-NISSU(IDX1)
      *
      *    食事療養：金額
             MOVE  SKT0710TMP-S-KINGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT0710-S-KINGAKU(IDX1)
      *
      *    食事療養：標準負担額
             MOVE  SKT0710TMP-S-FTNGAKU (IDX1)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT0710-S-FTNGAKU(IDX1)
           END-PERFORM
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
      *---(01.00.01) LINE ADD START ------------------------------------
      *              UNTIL    IDX3  >     3
                    UNTIL    IDX3  >     5
      *---(01.00.01) LINE ADD END   ------------------------------------
                    OR  WRK-CNT    >     20
                    OR  SKT0710TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT0710TMP-KKENSU (WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT0710-KKENSU(IDX3 IDX2)
      *
      *    療養の給付：日数
               MOVE  SKT0710TMP-KNISSU (WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT0710-KNISSU(IDX3 IDX2)
      *
      *    療養の給付：点数
               MOVE  SKT0710TMP-KTENSU (WRK-CNT IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT0710-KTENSU(IDX3 IDX2)
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         MOVE  SKT0710TMP-KYKZFTN (WRK-CNT IDX2)  TO  WRK-Z9
      *         MOVE  WRK-Z9   TO  SKT0710-KYKZFTN(IDX3 IDX2)
      *---(01.00.01) LINE ADD START ------------------------------------
      *
      *    療養の給付：一部負担金
               MOVE  SKT0710TMP-KITBFTN (WRK-CNT IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT0710-KITBFTN(IDX3 IDX2)
             END-PERFORM
      *
      *    食事療養：件数
             MOVE  SKT0710TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT0710-S-KKENSU(IDX3)
      *
      *    食事療養：日数
             MOVE  SKT0710TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT0710-S-KNISSU(IDX3)
      *
      *    食事療養：金額
             MOVE  SKT0710TMP-S-KKINGAKU (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT0710-S-KKINGAKU(IDX3)
      *
      *    食事療養：標準負担額
             MOVE  SKT0710TMP-S-KFTNGAKU (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT0710-S-KFTNGAKU(IDX3)
      *
      *    公費名
             MOVE  SKT0710TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
      *       MOVE  HKN-TANSEIDONAME   TO  SKT0710-KOHNAME (IDX3)
             IF  SKT0710TMP-KOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT0710TMP-KOHNAME (WRK-CNT)
                                        TO  SKT0710-KOHNAME (IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT0710-KOHNAME (IDX3)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
             ADD  1  TO  WRK-CNT
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
           MOVE    "SKT0710.red"       TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      **     MOVE    "国保請求書"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
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
           MOVE    SKT0710             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Monma(2017/12/01) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Monma(2017/12/01) end
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
       331-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（公費）
      *****************************************************************
       313-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT0720
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    診療年月
      *     MOVE    WRK-SRYYMWH           TO  SKT0720-SRYYM
      *---(01.00.01) LINE ADD START ------------------------------------
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT0720-HOSPCD
      *
      *    保険者番号
           MOVE    SKT0710TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT0720-HKNJANUM
      *
      *    在総診
           IF      SKT0710TMP-ZAITAKU     =    "1"
             MOVE  "在"                   TO   SKT0720-ZAI1
             MOVE  "◯"                   TO   SKT0720-ZAI2
           END-IF
      *
      *    ページ番号
           MOVE    CNT-PAGE               TO   WRK-Z4
           MOVE    WRK-Z4                 TO   SKT0720-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"           TO   SKT0720-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
           .
           
       313-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（公費）
      *****************************************************************
       323-BODY-HEN-SEC      SECTION.
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
      *---(01.00.01) LINE ADD START ------------------------------------
      *              UNTIL    IDX3  >     16
                    UNTIL    IDX3  >     14
      *---(01.00.01) LINE ADD END   ------------------------------------
                    OR  WRK-CNT    >     20
                    OR  SKT0710TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT0710TMP-KKENSU (WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT0720-KENSU(IDX3 IDX2)
      *
      *    療養の給付：日数
               MOVE  SKT0710TMP-KNISSU (WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT0720-NISSU(IDX3 IDX2)
      *
      *    療養の給付：点数
               MOVE  SKT0710TMP-KTENSU (WRK-CNT IDX2)   TO  WRK-Z10
               MOVE  WRK-Z10   TO  SKT0720-TENSU(IDX3 IDX2)
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    療養の給付：薬剤一部負担金
      *         MOVE  SKT0710TMP-KYKZFTN (WRK-CNT IDX2)  TO  WRK-Z9
      *         MOVE  WRK-Z9   TO  SKT0720-YKZFTN(IDX3 IDX2)
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *    療養の給付：一部負担金
               MOVE  SKT0710TMP-KITBFTN (WRK-CNT IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT0720-ITBFTN(IDX3 IDX2)
             END-PERFORM
      *
      *    食事療養：件数
             MOVE  SKT0710TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT0720-S-KENSU(IDX3)
      *
      *    食事療養：日数
             MOVE  SKT0710TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT0720-S-NISSU(IDX3)
      *
      *    食事療養：金額
             MOVE  SKT0710TMP-S-KKINGAKU (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT0720-S-KINGAKU(IDX3)
      *
      *    食事療養：標準負担額
             MOVE  SKT0710TMP-S-KFTNGAKU (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT0720-S-FTNGAKU(IDX3)
      *
      *    公費名
             MOVE  SKT0710TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
      *       MOVE  HKN-TANSEIDONAME   TO  SKT0720-KOHNAME (IDX3)
             IF  SKT0710TMP-KOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT0710TMP-KOHNAME (WRK-CNT)
                                        TO  SKT0720-KOHNAME (IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT0720-KOHNAME (IDX3)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
       323-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（公費）
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
           MOVE    "SKT0720.red"       TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/09/04) start
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      **     MOVE    "国保請求書"        TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保請求書"      TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保請求書［特別療養費］"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
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
           MOVE    SKT0720             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Monma(2017/12/01) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Monma(2017/12/01) end
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
       333-PRINT-OUT-EXT.
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
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      *
                   MOVE    RECE10-REC             TO  MCPDATA-REC
                   MOVE    "DBUPDATE"             TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU0710 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU0710 SEIKYU INVALID ***"
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID           TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM               TO  HKNJA-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE  SKT0710TMP-HKNJANUM       TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC              TO  MCPDATA-REC
           MOVE  "DBSELECT"                TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY     TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.02) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
             MOVE    "tbl_hknjainf"   TO  MCP-TABLE
             MOVE    "key"            TO  MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) start
      *****************************************************************
      *    患者公費情報SELECT
      *****************************************************************
       940-PTKOHINF-SELECT-SEC         SECTION.
      *
           INITIALIZE                             PTKOHINF-REC
                                                  FLG-MENJO
      *
           MOVE    SPA-HOSPNUM                TO  PTKOH-HOSPNUM
           MOVE    RECE10-PTID                TO  PTKOH-PTID
           MOVE    PTKOHINF-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"             TO  MCP-TABLE
           MOVE    "key2"                     TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
           IF      MCP-RC           =   ZERO
                   PERFORM 940-PTKOHINF-FETCH-SEC
      *
                   PERFORM  UNTIL  FLG-PTKOHINF  =  1
      *    災害免除の公費があるか
                     IF   PTKOH-KOHNUM  =  "962"
                     AND  PTKOH-TEKSTYMD(1:6)  <=  RECE10-SRYYM
                     AND  PTKOH-TEKEDYMD(1:6)  >=  RECE10-SRYYM
                     AND  PTKOH-SAKJOKBN  NOT =  "1"
                       MOVE    1          TO  FLG-MENJO
                       MOVE    1          TO  FLG-PTKOHINF
                     ELSE
                       PERFORM  940-PTKOHINF-FETCH-SEC
                     END-IF
                   END-PERFORM
           ELSE
                   MOVE   1               TO  FLG-PTKOHINF
           END-IF
      *
           PERFORM  940-PTKOHINF-CLOSE-SEC
      *
           .
       940-PTKOHINF-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    患者公費情報ＦＥＴＣＨ
      *****************************************************************
       940-PTKOHINF-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                 USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
           IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC     TO  PTKOHINF-REC
                   MOVE    ZERO            TO  FLG-PTKOHINF
           ELSE
                   MOVE    1               TO  FLG-PTKOHINF
           END-IF
      *
           .
       940-PTKOHINF-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    患者公費情報クローズ
      *****************************************************************
       940-PTKOHINF-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                 USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
      *
           .
       940-PTKOHINF-CLOSE-EXT.
           EXIT.
      *=== 災害で免除は各給付割合欄に集計 by Yoshikawa(2012/05/17) end
      *
      *****************************************************************
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID           TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM               TO  HKN-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE  WRK-KOHNUM                TO  HKN-HKNNUM
           MOVE  HKNNUM-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2      TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE  "tbl_hknnum"              TO  MCP-TABLE
           MOVE  "key2"                    TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"               USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.02) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNNUM-KEY2     TO  MCP-PATH
             MOVE  "tbl_hknnum"            TO  MCP-TABLE
             MOVE  "key2"                  TO  MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknnum"              TO  MCP-TABLE
           MOVE  "key2"                    TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"               USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険情報読込
      *****************************************************************
       955-HKNNUM-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"               USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
             EVALUATE  WRK-PARA-HKNJANUM(1:6)
      *=== 札幌市代表保険者番号変更 by Yoshikawa(2010/05/17) start
      *       WHEN    "014001"
             WHEN    "010017"
      *=== 札幌市代表保険者番号変更 by Yoshikawa(2010/05/17) end
               MOVE  "014000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "014999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "044008"
               MOVE  "044000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "044999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "114009"
               MOVE  "114000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "114999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "124008"
               MOVE  "124000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "124999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "144006"
               MOVE  "144000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "144999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "145003"
               MOVE  "145000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "145999"          TO  RECE10-XXEDHKNJANUM
      *=== 代表保険者番号追加 by Yoshikawa(2010/07/02) start
             WHEN    "146001"
               MOVE  "146000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "146999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "154005"
               MOVE  "154000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "154999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "224006"
               MOVE  "224000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "224999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "225003"
               MOVE  "225000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "225999"          TO  RECE10-XXEDHKNJANUM
      *=== 代表保険者番号追加 by Yoshikawa(2010/07/02) end
             WHEN    "234005"
               MOVE  "234000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "234999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "264002"
               MOVE  "264000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "264999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "274001"
               MOVE  "274000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "274999"          TO  RECE10-XXEDHKNJANUM
      *=== 代表保険者番号追加 by Yoshikawa(2010/07/02) start
             WHEN    "275008"
               MOVE  "275000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "275999"          TO  RECE10-XXEDHKNJANUM
      *=== 代表保険者番号追加 by Yoshikawa(2010/07/02) end
             WHEN    "284000"
               MOVE  "284000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "284999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "344002"
               MOVE  "344000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "344999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "404004"
               MOVE  "404000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "404999"          TO  RECE10-XXEDHKNJANUM
             WHEN    "405001"
               MOVE  "405000"          TO  RECE10-XXSTHKNJANUM
               MOVE  "405999"          TO  RECE10-XXEDHKNJANUM
             WHEN OTHER
               MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                            RECE10-XXEDHKNJANUM
             END-EVALUATE
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
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/07/02) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/07/02) end
      *
      *=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) start
      *        オンライン請求の場合、災害該当者以外は読み飛ばす
               IF  WRK-ONLINEKBN  =  "1"
                 IF  (RECE10-ETC-YKZFTN(1)  =  2 OR 4 OR 5)
                 OR  (RECE10-ETC-YKZFTN(1)  NOT =  ZERO
                 AND  RECE10-HKNJANUM  =  ZERO)
                   CONTINUE
                 ELSE
                   GO  TO  900-SEIKYU-READ-SEC
                 END-IF
               END-IF
      *=== オンライン時、災害分のみ記載 by Yoshikawa(2011/04/22) end
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
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
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"              TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY     TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"       TO  MCP-TABLE
               MOVE    "key"             TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"       USING
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
           READ    SKT0710TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT0710TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT0710TMP
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
           MOVE    "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"            TO  MCP-TABLE
           MOVE    "key10"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"               USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY     TO  MCP-PATH
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
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY     TO  MCP-PATH
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求情報読み込み
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           INITIALIZE                  RECE02-REC
           MOVE    RECE10-KEY            TO  RECE02-KEY
           MOVE    RECE02-REC             TO  MCPDATA-REC
           MOVE    "DBSELECT"             TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY    TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-KOHSKY-KEY     TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_kohsky"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-RECE02
                   MOVE    MCPDATA-REC         TO  RECE02-REC
               ELSE
                   MOVE    1                   TO  FLG-RECE02
                   INITIALIZE                  RECE02-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-RECE02
               INITIALIZE                  RECE02-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"             TO  MCP-TABLE
           MOVE    "key"                    TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT0710TMP-FILE   NEXT
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
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) start
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
      *=== シス管「2007」対応 by Yoshikawa(2008/10/09) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1900-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1900-STYUKYMD(1:6)
           END-IF
           MOVE    "01"                    TO  SYS-1900-STYUKYMD (7:2)
           MOVE    SYS-1900-STYUKYMD       TO  SYS-1900-EDYUKYMD
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
           MOVE    SYS-1900-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1901-STYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1901-STYUKYMD (7:2)
           MOVE    SYS-1901-STYUKYMD   TO  SYS-1901-EDYUKYMD
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1902-STYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1902-STYUKYMD (7:2)
           MOVE    SYS-1902-STYUKYMD   TO  SYS-1902-EDYUKYMD
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
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
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/01) end
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/12/12) end
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
       900-DBCLOSE-EXT.
           EXIT.
