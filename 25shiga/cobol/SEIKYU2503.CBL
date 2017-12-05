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
      * this license along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     SEIKYU2503.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 地方公費
      *  コンポーネント名  : 滋賀・福祉医療費請求書(連名簿)
      *                      (142,242,140,141,241,341,143,243,343)
      *                      (144,244,344,145,245,345,146,246,170)
      *                      (441,541,340)
      *                      (対象公費はTAISYOKOHI.INI参照)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/09/07    有村          様式変更による再作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    有村    05/09/20    改頁条件修正
      *  01.00.02    山口    06/02/16    請求年月のバグ修正
      *  01.00.03    内田    07/09/09    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *                                  長期上位（974）は長期と同様の
      *                                  処理をする
      *  01.00.04    内田    08/01/07    印字対象番号の追加（441,541）
      *  01.00.05    内田    08/07/09    前期高齢９割（軽減特例措置）は
      *                                  給付割合を８０と印字
      *  01.00.06    吉川    08/10/20    結核・精神を併用していても
      *                                  公費分患者負担額を計算する
      *                                  SPA-AREA初期化
      *  01.00.07    内田    09/01/20    「公」欄は２７のみの印字で
      *                                  全国公費は印字しない
      *  01.00.08    吉川    09/11/10    特記事項０３を持っている場合は
      *                                  印字対象外とする
      *  01.00.09    吉川    10/04/16    印字対象番号の追加（340）
      *  01.00.10    吉川    11/12/09    長期は上限額を超えた時に記載する
      *  01.00.11    吉川    12/03/05    実日数が２日以上の場合、
      *                                  長期が記載されなくなる不具合を修正
      *  01.00.12    吉川    12/08/17    対象公費番号をINIファイルから
      *                                  取得するようにする
      *                                  記載順をINIファイルで設定する
      *                                  地方公費を２つ所持している場合
      *                                  第二公費欄に印字する
      *  01.00.13    吉川    13/01/10    プラグイン対応
      *                                  医療機関情報編集対応
      *  01.00.14    吉川    13/01/16    テーブルのprimary key変更対応
      *  01.00.15    吉川    13/10/04    プログラムオプション対応
      *  01.00.16    吉川    14/10/23    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.17    門間    16/01/06    医療機関編集情報への開設者名追加対応
      *  01.00.18    吉川    16/03/11    長期上位は「長」欄に16を記載する
      *  01.00.19    門間    17/12/04    全国公費＋長期併用時の不具合対応
      *                                  医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *                                  SITEKBN変更（動作に変更なし）
      *****************************************************************
      *
       ENVIRONMENT   DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT  SECTION.
       FILE-CONTROL.
      *
      *    請求書用ファイル
           SELECT  MF100-FILE   ASSIGN    MF100PARA
                               ORGANIZATION    IS  INDEXED
                               ACCESS  MODE    IS  DYNAMIC
                               RECORD  KEY     IS  MF100-KEY
                               FILE    STATUS  IS  STS-MF100.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      **    印字対象公費番号ファイル
      *     SELECT  TAISYOKOHI-FILE ASSIGN FILE-NAME
      *                             ORGANIZATION   IS  LINE SEQUENTIAL
      *                             ACCESS MODE    IS  SEQUENTIAL
      *                             FILE   STATUS  IS  STS-TAISYOKOHI.
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      **
      **=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) start
      **    記載順設定ファイル
      **=== プラグイン対応 by Yoshikawa(2013/01/10) start
      **     SELECT  SRT-FILE    ASSIGN FILE-NAME
      *     SELECT  SRT-FILE    ASSIGN FILE-NAME2
      **=== プラグイン対応 by Yoshikawa(2013/01/10) end
      *                           ORGANIZATION   IS  LINE SEQUENTIAL
      *                           ACCESS MODE    IS  SEQUENTIAL
      *                           FILE   STATUS  IS  STS-SRT.
      **=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) end
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *
006900*    エラーファイル
           SELECT  RECEERR-FILE ASSIGN  RECEERR
                                FILE    STATUS  IS  STS-RECEERR.
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *
      *    集計ファイル
       FD  MF100-FILE.
       01  MF100-REC.
           COPY  "SEI2503.INC".
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      **    印字対象公費番号ファイル
      * FD  TAISYOKOHI-FILE.
      * 01  TAISYOKOHI-REC.
      *     03  TAISYO-DAT-KOHNUM   PIC X(03). 
      *     03  TAISYO-DAT-KAIGYO   PIC X(01). 
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      **
      **=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) start
      **    記載順設定ファイル
      * FD  SRT-FILE.
      * 01  SRT-SRTKBN   PIC X(01).
      **=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) end
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
       WORKING-STORAGE  SECTION.
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      *    対象公費番号データ
           COPY  "TAISYO2501.INC".
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF100//.
      *
      *    エラーファイル 名称領域
      *---(01.00.03) LINE ADD START ------------------------------------
      *     COPY  "CPCOMMONDAT2.INC"
      *             REPLACING  //RECE01PARA//
      *             BY         //RECEERR//.
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     03      PIC X(04)   VALUE   ".dat".
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY  "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           COPY  "SC2503.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-MF100       PIC X(02).
           03  STS-RECEERR     PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
           03  STS-TAISYOKOHI  PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) start
           03  STS-SRT         PIC X(02).
      *=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) end
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-PTINF       PIC 9(01).
           03  FLG-END         PIC 9(01).
           03  FLG-SYUNOU      PIC 9(01).
           03  FLG-HEIYOU      PIC 9(01).
           03  FLG-MF100       PIC 9(01).
           03  FLG-TYOKI       PIC 9(01).
           03  FLG-PRINT       PIC 9(01).
           03  FLG-SYSKANRI    PIC 9(01).
           03  FLG-HKNCOMBI    PIC 9(01).
           03  FLG-ERR         PIC 9(01).
           03  FLG-BTPARA      PIC 9(01).
           03  FLG-SYORI       PIC 9(01).
           03  FLG-PTKOHINF    PIC 9(01).
           03  FLG-HKNNUM      PIC 9(01).
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) start
           03  FLG-RECE10      PIC 9(01).
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) end
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
           03  FLG-TAISYOKOHI  PIC 9(01).
           03  FLG-TAISYO      PIC 9(01).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
           03  FLG-PRGOPTION   PIC 9(01).
           03  FLG-OK          PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX             PIC 9(04).
           03  IDXX            PIC 9(04).
           03  IDX1            PIC 9(04).
           03  IDX2            PIC 9(04).
           03  IDX3            PIC 9(04).
           03  IDY             PIC 9(04).
           03  IDZ             PIC 9(04).
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.03) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.03) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYORIFLG   PIC X(01).
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
           03  WRK-PARA-STSRYYM      PIC 9(06).
           03  WRK-PARA-EDSRYYM      PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
      **=== プラグイン対応 by Yoshikawa(2013/01/10) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SEIKYU2503".
      *     03  FILLER              PIC X(14)  VALUE "TAISYOKOHI.INI".
      **
      * 01  FILE-NAME2.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM2       PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SEIKYU2503".
      *     03  FILLER              PIC X(08)  VALUE "SORT.INI".
      **=== プラグイン対応 by Yoshikawa(2013/01/10) end
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR         PIC  X(200).
           03  WRK-Z1              PIC Z.
           03  WRK-Z2              PIC ZZ.
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z7              PIC ZZZZZZZ.
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-HENYMDG         PIC X(22).
           03  WRK-HENYMDG1        PIC X(09).
           03  WRK-HENYMDG2        PIC X(09).
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-LASTYMD         PIC 9(08).
           03  WRK-NYMD.
               05  WRK-NYY         PIC 9(04).
               05  WRK-NMM         PIC 9(02).
               05  WRK-NDD         PIC 9(02).
           03  WRK-TYMD.
               05  WRK-TYY         PIC 9(04).
               05  WRK-TMM         PIC 9(02).
               05  WRK-TDD         PIC 9(02).
           03  WRK-HKNJANUM        PIC X(06).
           03  WRK-HKNJANAME       PIC X(20).
           03  WRK-SEIKYU-COMP     PIC S9(09).
           03  WRK-SEIKYU          PIC 9(07).
           03  WRK-JKYSNUM         PIC X(08).
           03  WRK-TANJOYMD        PIC X(07).
           03  WRK-KASAN-TBL.
               05  WRK-KOHNUM      PIC X(03).
               05  WRK-KOHID       PIC 9(10).
               05  WRK-KOHTENSU    PIC 9(08).
               05  WRK-KOHFTNGK-G  PIC 9(08).
               05  WRK-KOHFTNGK    PIC 9(08).
               05  WRK-SYUCOMPFTN  PIC 9(08).
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) start
               05  WRK-TYOKIFTNGK  PIC 9(08).
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) end
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) start
               05  WRK-TYOKIFTNGK-G PIC 9(08).
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) end
      *---(01.00.03) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH              PIC  X(50).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/01/10) start
      *     03  FILE-NAME             PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/01/10) end
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) start
           03  WRK-SRTKBN            PIC X(01).
      *=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
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
      *---(01.00.03) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
           03  WRK-KYURATE         PIC 9(03).
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-RECE02  PIC 9(06).
           03  CNT-MF100   PIC 9(06).
           03  CNT-PAGE    PIC 9(03).
      *
       01  SUM-AREA  VALUE   ZERO.
           03  SUM-SYOKEI.
               05  SUM-KENSU      PIC 9(02).
               05  SUM-TENSU      PIC 9(07).
               05  SUM-SYUCOMPFTN PIC 9(07).
               05  SUM-KOHTENSU   PIC 9(07) OCCURS 2.
               05  SUM-KOHPTFTN   PIC 9(07) OCCURS 2.
      *    キー用エリア
       01  KEY-AREA  VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-NYUGAIKBN     PIC X(06).
           03  KEY-OLD.
               05  KEY-O-NYUGAIKBN     PIC X(06).
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      *    比較用公費番号テーブル領域
       01  TBL-HIKAKU-KOHI.
           03  TBL-HKOHNUM              PIC X(03)  OCCURS  4.
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *    DB参照用
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
      *****************************************************************
      *    ファイルレイアウト　領域
      *****************************************************************
      *
      *    システム管理マスタ
           COPY  "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先
           COPY  "CPSK1002.INC".
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    患者公費情報
       01  PTKOHINF-REC.
           COPY  "CPPTKOHINF.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) star
      *    請求管理
           COPY    "CPRCF010.INC".
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) end
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *
      *****************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *    ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".
      *
      *    共通パラメタ
           COPY  "MCPAREA".
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".      
      *
           COPY  "MCPDATA.INC".
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
      ****************************************************************
       LINKAGE  SECTION.
       01  COMMAND-PARAM.
           02  FILLER  PIC X(256).
      *****************************************************************
      *
       PROCEDURE  DIVISION
               USING COMMAND-PARAM.
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       000-PROC-SEC  SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           PERFORM 200-MAIN-SEC
                   UNTIL  FLG-END = 1
      *
           PERFORM 300-END-SEC
      *
           STOP    RUN
           .
      *****************************************************************
      *    初期　処理
      *****************************************************************
       100-INIT-SEC  SECTION.
      *
           INITIALIZE  FLG-AREA
           INITIALIZE  STS-AREA
           INITIALIZE  WRK-AREA
           INITIALIZE  CNT-AREA
           INITIALIZE  IDX-AREA
           INITIALIZE  SUM-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2008/10/20) start
           INITIALIZE  SPA-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2008/10/20) end
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
           INITIALIZE  TAISYO-DAT
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           INITIALIZE  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
           DISPLAY "START"
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
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
      *---(01.00.03) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
                                               WRK-PARA-SYORIFLG
      *---(01.00.03) LINE ADD START ------------------------------------
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
                                               RECEERR
      *---(01.00.03) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SEIKYU2503"    TO  JOB-PGID
           MOVE    "福祉医療費請求書(連名簿)" 
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    対象年月最終日取得
           INITIALIZE  WRK-SYMD
           MOVE    LNK-PRTKANRI-SRYYM  TO    WRK-SYMD(1:6)
           PERFORM 31012-LASTDAY-GET-SEC
           MOVE    WRK-SYMD         TO    WRK-LASTYMD
      *
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE    "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    LNK-DAY2-EDTYMD1    TO  WRK-HENYMDG1
           MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY2-AREA
           MOVE    "21"                TO  LNK-DAY2-IRAI
           MOVE    LNK-PRTKANRI-SKYYMD     TO  LNK-DAY2-YMD
           CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                               LNK-DAY2-AREA
           IF      STS-DAY-RC1         =   ZERO 
                   MOVE    LNK-DAY2-EDTYMD1    TO  WRK-HENYMDG2
                   MOVE    LNK-DAY2-EDTYMD3    TO  WRK-SEIYMDWH
           END-IF
      *
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     MOVE    "MF100ZZ"           TO  MF100PARA-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID(1:16)
      *                                 TO  MF100PARA-TERMID
      **---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  WRK-PARA-HOSPNUM      TO  MF100PARA-HOSPNUM
      **---(01.00.03) LINE ADD END   ------------------------------------
           INITIALIZE                     SGETTEMP-AREA
      *
           MOVE  WRK-PARA-HOSPNUM     TO  MF100PARA-HOSPNUM
           MOVE  "MF100ZZ"            TO  MF100PARA-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID  TO  MF100PARA-TERMID
      *
           MOVE  MF100PARA-BASENAME   TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEERR              TO  SGETTEMP-BASENAMES (2)
           CALL  "ORCSGETTEMP"        USING
                                      SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  MF100PARA-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID(1:16)
      *                                 TO  RECEERR-TERMID
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE    "1001"      TO  SYS-1001-KANRICD
           MOVE    "*"         TO  SYS-1001-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1001-STYUKYMD(1:6)
      *                             SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
           MOVE    "01"        TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-1001-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU2503 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE    "1002"      TO  SYS-1002-KANRICD
           MOVE    "*"         TO  SYS-1002-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1002-STYUKYMD(1:6)
      *                             SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
           MOVE    "01"        TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-1002-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU2503 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      **    INIファイル読み込み
      *     PERFORM  110-INI-FILE-SEC
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *
      *    パラメタ編集処理
           PERFORM 1001-PARA-HENSYU-SEC
      *
           PERFORM 900-KOHSKY-START-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    パラメタ編集処理
      *****************************************************************
       1001-PARA-HENSYU-SEC        SECTION.
      *
           MOVE    ZERO                    TO  IDXX
                                           FLG-SYORI
           INITIALIZE                      TABLE-AREA
      *
           IF      WRK-PARA-SYORIFLG   =   "1" 
               INITIALIZE                      BTPARA-REC
      *---(01.00.03) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM         TO  BTPARA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-SHELLID    TO  BTPARA-SHELLID
               MOVE    WRK-PARA-JOBID      TO  BTPARA-JOBID
               MOVE    BTPARA-REC          TO  MCPDATA-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
      *         MOVE    "DBSELECT"          TO  MCP-FUNC
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "DBSELECT"          TO  MCP-FUNC
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
      *---(01.00.03) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
                   PERFORM 900-BTPARA-READ-N-SEC
               ELSE
                   INITIALIZE                  BTPARA-REC
                   MOVE    1               TO  FLG-BTPARA
               END-IF
      *
               PERFORM     UNTIL   FLG-BTPARA  =   1
                   ADD     1                   TO  IDXX
                   IF      BTPARA-INFO-KBN     =   "1"
                     MOVE    1                 TO  FLG-SYORI
                     MOVE    BTPARA-INFO-PARA
                                       TO TBL-PARA-HKNJANUM(IDXX)
                   ELSE
                     MOVE    2                 TO  FLG-SYORI
                     MOVE    BTPARA-INFO-PTID
                                       TO TBL-PARA-PTID(IDXX)
                   END-IF
                   DISPLAY "パラメタ区分=" BTPARA-INFO-KBN
                           "パラメタ=" BTPARA-INFO-PARA
                           "保険者番号="   TBL-PARA-HKNJANUM(IDXX)
                           "患者番号="     TBL-PARA-PTID(IDXX)
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
                   PERFORM 900-BTPARA-READ-N-SEC
               END-PERFORM
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
               MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
               IF      IDXX            =   ZERO
                   MOVE    ZERO            TO  WRK-PARA-SYORIFLG
               END-IF
           END-IF 
           .
       1001-PARA-HENSYU-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      ******************************************************************
      **    INIファイル読み込み
      ******************************************************************
      * 110-INI-FILE-SEC         SECTION.
      **
      **    印字対象公費番号ファイル読み込み
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/01/10) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/TAISYOKOHI.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/01/10) end
      **
      *     DISPLAY "ファイル名="  FILE-NAME
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
      *           IF  TAISYO-DAT-KOHNUM(1:1) = "*" OR SPACE
      *             CONTINUE
      *           ELSE
      *             ADD   1               TO  IDX
      *             MOVE  TAISYOKOHI-REC  TO  TAISYO-TBL(IDX)
      *           END-IF
      *       END-READ
      *     END-PERFORM
      **
      *     CLOSE TAISYOKOHI-FILE
      **
      **=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) start
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/01/10) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/SORT.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM2
      **=== プラグイン対応 by Yoshikawa(2013/01/10) end
      **
      *     DISPLAY "ファイル名2="  FILE-NAME2
      **
      *     INITIALIZE   WRK-SRTKBN
      **
      *     OPEN  INPUT  SRT-FILE
      **
      *     READ SRT-FILE
      *       AT END
      *         INITIALIZE        SRT-SRTKBN
      *       DISPLAY "読み込み失敗"
      *     END-READ
      **
      **    不正な値は1を設定
      *     IF  SRT-SRTKBN  =  "1" OR "2" OR "3"
      *         MOVE    SRT-SRTKBN    TO  WRK-SRTKBN
      *     ELSE
      *         MOVE    "1"           TO  WRK-SRTKBN
      *     END-IF
      **
      *     DISPLAY "ソート区分="  WRK-SRTKBN
      **
      *     CLOSE SRT-FILE
      **=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) end
      **
      *     .
      * 110-INI-FILE-EXT.
      *     EXIT.
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SEIKYU2503"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
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
      *    記載順
           MOVE    "SORT"                    TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           MOVE    WRK-OPTION(1)(1:1)        TO  WRK-SRTKBN
           IF  WRK-SRTKBN  NOT =  "1" AND "2" AND "3"
               MOVE    "1"                   TO  WRK-SRTKBN
           END-IF
           DISPLAY "ソート区分="  WRK-SRTKBN
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
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC  SECTION.
      *
           OPEN    OUTPUT  MF100-FILE
           CLOSE           MF100-FILE
           OPEN    I-O     MF100-FILE
      *
           MOVE    ZERO    TO      FLG-END
      *
           PERFORM 2001-SYUKEI-SEC
                   UNTIL   FLG-END     =   1
      *
           CLOSE   MF100-FILE
      *
           IF  CNT-RECE02  >       0
               PERFORM   2002-PRINT-SEC
           END-IF
           MOVE    1   TO  FLG-END
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計処理
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           PERFORM VARYING IDZ FROM    1   BY  1
                   UNTIL   IDZ >       4
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      *         IF  RECE02-KOHNUM (IDZ) = "142" OR "242" OR "140"
      *                                OR "141" OR "241" OR "341"
      *                                OR "143" OR "243" OR "343"
      *                                OR "144" OR "244" OR "344"
      *                                OR "145" OR "245" OR "345"
      *                                OR "146" OR "246" OR "170"
      **---(01.00.04) LINE ADD START ------------------------------------
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) start
      **                                OR "441" OR "541"
      *                                OR "441" OR "541" OR "340"
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) end
      **---(01.00.04) LINE ADD END   ------------------------------------
               INITIALIZE                            TBL-HIKAKU-KOHI
               MOVE    RECE02-KOHNUM(IDZ)        TO  TBL-HKOHNUM(1)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
                   PERFORM 20011-SYUKEI-SEC
               END-IF
           END-PERFORM
      *
           PERFORM  900-KOHSKY-READ-SEC
      *
           .
       2001-SYUKEI-EXT.
           EXIT.
      **
      *****************************************************************
      *    集計処理２
      *****************************************************************
       20011-SYUKEI-SEC  SECTION.
      *
           INITIALIZE      MF100-REC
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID       TO  MF100-HOSPID
           MOVE  SPA-HOSPNUM         TO  MF100-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  RECE02-PTNUM        TO  MF100-PTNUM
           MOVE  RECE02-RECEKA       TO  MF100-SRYKA
           MOVE  RECE02-HKNJANUM-KEY TO  MF100-HKNJANUM-KEY
           MOVE  RECE02-TEKSTYMD     TO  MF100-TEKSTYMD
           MOVE  RECE02-NYUGAIKBN    TO  MF100-NYUGAIKBN
           MOVE  RECE02-RECESYUBETU  TO  MF100-RECESYUBETU
      *
           MOVE  RECE02-PTID         TO  MF100-PTID
           MOVE  RECE02-NAME         TO  MF100-NAME
           MOVE  RECE02-BIRTHDAY     TO  MF100-BIRTHDAY
           MOVE  RECE02-SEX          TO  MF100-SEX
           MOVE  RECE02-HKN          TO  MF100-HKN
           MOVE  RECE02-RJNHKN       TO  MF100-RJNHKN
           MOVE  RECE02-SRYYM        TO  MF100-SRYYM
      *
      *=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) start
      *    SORT.INIによって記載順を変える
      *    (1=患者番号順、2=カナ氏名順、3=漢字氏名順)
           EVALUATE  WRK-SRTKBN
             WHEN  "1"
               MOVE    RECE02-PTNUM        TO   MF100-SORT
             WHEN  "2"
               MOVE    RECE02-KANANAME     TO   MF100-SORT
             WHEN  "3"
               MOVE    RECE02-NAME         TO   MF100-SORT
           END-EVALUATE
      *=== 記載順をINIファイルで設定 by Yoshikawa(2012/08/17) end
      *
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) start
      *    一時ファイル読み込み
           PERFORM  900-SKTTMP-READ-SEC
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) end
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    前期９割（軽減特例措置）は８割
           IF   (RECE02-SRYYM  >=  WRK-CONS-SRYYM-200804)
           AND  (RECE02-FLG(2)  =  1)
             MOVE  20              TO  MF100-KYURATE
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  RECE02-KOHINF      (IDZ)  TO  MF100-KOHINF
           MOVE  RECE02-KOHFTNJANUM (IDZ)  TO  MF100-FTNJANUM
           MOVE  RECE02-KOHJKYSNUM  (IDZ)  TO  MF100-JKYSNUM
           COMPUTE IDY     =       IDZ     +   1
           MOVE  RECE02-JNISSUINF   (IDY)  TO  MF100-JNISSU
           MOVE  RECE02-TOTALTEN    (IDY)  TO  MF100-TOTALTEN
           MOVE  RECE02-FTNMONEY    (IDY)  TO  MF100-FTNMONEY
      *
      *    収納情報より全国公費分集計、主保険負担金集計及び助成判定を行う
           MOVE  1                         TO  FLG-ERR
           INITIALIZE       WRK-KASAN-TBL
           MOVE    MF100-KOHNUM    TO  WRK-KOHNUM
           MOVE    MF100-KOHID     TO  WRK-KOHID
           MOVE    ZERO            TO  FLG-TYOKI
      *
           IF      RECE02-NYUGAIKBN    =   "1"
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"             TO  WRK-PATH
      *---(01.00.03) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"             TO  WRK-PATH
      *---(01.00.03) LINE ADD END   ------------------------------------
           END-IF
           PERFORM 920-SYUNOU-SET-SEC
      *
      *    主保険に限度額が有る場合は集計した金額を編集する
           IF     RECE02-FTNMONEY(1)  >   ZERO     AND
                  RECE02-FTNMONEY(1)  <   WRK-SYUCOMPFTN
             MOVE    RECE02-FTNMONEY(1)   TO  WRK-SYUCOMPFTN
           END-IF
      *
      *    長期
           IF      FLG-TYOKI       =   1
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) start
      *     AND     WRK-KOHFTNGK-G  >   10000
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) start
      *     AND     WRK-TYOKIFTNGK  >=   10000
      *    全国公費＋長期併用時の不具合対応 by Monma(2017/12/04) start
      *     AND     WRK-TYOKIFTNGK-G  >=  10000
           AND     WRK-KOHFTNGK-G  >=  10000
      *    全国公費＋長期併用時の不具合対応 by Monma(2017/12/04) end
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) end
               MOVE    1           TO  MF100-TYOKI
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) end
               MOVE    10000       TO  WRK-KOHFTNGK-G
           END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *    長期上位
           IF      FLG-TYOKI       =   2
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) start
      *     AND     WRK-KOHFTNGK-G  >   20000
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) start
      *     AND     WRK-TYOKIFTNGK  >=   20000
      *    全国公費＋長期併用時の不具合対応 by Monma(2017/12/04) start
      *     AND     WRK-TYOKIFTNGK-G  >=  20000
           AND     WRK-KOHFTNGK-G  >=  20000
      *    全国公費＋長期併用時の不具合対応 by Monma(2017/12/04) end
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) end
      *=== 長期上位対応 by Yoshikawa(2016/03/11) start
      *         MOVE    1           TO  MF100-TYOKI
               MOVE    2           TO  MF100-TYOKI
      *=== 長期上位対応 by Yoshikawa(2016/03/11) end
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) end
               MOVE    20000       TO  WRK-KOHFTNGK-G
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           MOVE    WRK-SYUCOMPFTN  TO  MF100-SYUCOMPFTN
           MOVE    WRK-KOHTENSU    TO  MF100-KOHTENSU
           MOVE    WRK-KOHFTNGK-G  TO  MF100-KOHFTNGK
      *
      *    全国公費を併用していた場合、負担者番号、受給者番号取得
           IF      MF100-TAHONUM   NOT =   SPACE
               PERFORM 930-PTKOHINF-SET-SEC
               MOVE    PTKOH-FTNJANUM      TO  MF100-TAHOFTNJANUM
               MOVE    PTKOH-JKYSNUM       TO  MF100-TAHOJKYSNUM
               DISPLAY  "併用公費番号="    MF100-TAHONUM
                        "公費ID="          MF100-TAHOKOHID
                        "負担者番号="      MF100-TAHOFTNJANUM
                        "受給者番号="      MF100-TAHOJKYSNUM
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) start
           ELSE
      *      地方公費二つの場合でも他法公費へ格納
             IF  IDZ  >  1
               MOVE    RECE02-KOHID(IDZ - 1)      TO  MF100-TAHOKOHID
               MOVE    RECE02-KOHNUM(IDZ - 1)     TO  MF100-TAHONUM
               MOVE    RECE02-KOHFTNJANUM(IDZ - 1)
                                                  TO  MF100-TAHOFTNJANUM
               MOVE    RECE02-KOHJKYSNUM(IDZ - 1) TO  MF100-TAHOJKYSNUM
               MOVE    RECE02-JNISSU(IDY - 1)     TO  MF100-TAHOJNISSU
               MOVE    RECE02-TOTALTEN(IDY - 1)   TO  MF100-KOHTENSU
               MOVE    RECE02-FTNMONEY(IDY - 1)   TO  MF100-KOHFTNGK
             END-IF
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) end
           END-IF
      *
      *
      *    保険者番号チェック処理
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
           IF      FLG-ERR             =   ZERO
      *
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) start
             IF      FLG-MF100  =  1
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) end
               WRITE   MF100-REC
               ADD     1               TO  CNT-MF100
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) start
             ELSE
                 REWRITE  MF100-REC
             END-IF
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) end
      *
           ELSE
               DISPLAY "助成対象外=" MF100-PTNUM
                       "入外区分="   MF100-NYUGAIKBN
                       "公費番号="   MF100-KOHNUM
                       "点数="       MF100-TOTALTEN
                       "負担金="     MF100-FTNMONEY
                       "負担者番号=" MF100-FTNJANUM
           END-IF    
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    個別発行時の保険者番号(市町村番号)チェック処理
      *****************************************************************
       200111-HKNJANUM-CHK-SEC                SECTION.
      *
           INITIALIZE      WRK-HKNJANUM
           MOVE    MF100-FTNJANUM(3:5)   TO  WRK-HKNJANUM(1:5)
      *
           IF  WRK-PARA-SYORIFLG       =   "1"
               AND FLG-SYORI           =    1
               AND FLG-ERR             =   ZERO
      *
               DISPLAY "チェック用保険者番号="  WRK-HKNJANUM
               MOVE    1       TO      FLG-ERR
               PERFORM VARYING IDXX    FROM    1   BY  1
                       UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                       OR      TBL-PARA-HKNJANUM(IDXX)  =   SPACE
                   IF      WRK-HKNJANUM(1:5)
                                   =   TBL-PARA-HKNJANUM(IDXX)(1:5)
                       MOVE    ZERO                TO  FLG-ERR
                       MOVE    WRK-CONS-PARA-MAX   TO  IDXX
                   END-IF
               END-PERFORM 
           END-IF
      *
           .
       200111-HKNJANUM-CHK-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票ファイル出力処理
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
           OPEN     INPUT       MF100-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      *
      *    帳票編集<見出し>処理
             PERFORM 310-HEAD-HEN-SEC
      *
      *    帳票編集<明細>処理
             PERFORM 320-BODY-HEN-SEC
      *
      *    帳票編集<合計>処理
             PERFORM 325-GOKEI-HEN-SEC
      *
      *    帳票印刷処理
             PERFORM 330-PRINT-OUT-SEC
      *
           END-PERFORM
      *
           CLOSE    MF100-FILE
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
           ADD     1           TO      CNT-PAGE
           INITIALIZE                             SC03
      *
      *    ページ数
           MOVE    CNT-PAGE                TO  WRK-Z3
           MOVE    WRK-Z3                  TO  SC03-PAGE
      *    診療年月
           MOVE    WRK-HENYMDG1(2:2)       TO  SC03-PRTYY
           MOVE    WRK-HENYMDG1(5:2)       TO  SC03-PRTMM 
      *
      *    請求日付
           MOVE    WRK-HENYMDG2(2:2)       TO  SC03-SEIYY
           MOVE    WRK-HENYMDG2(5:2)       TO  SC03-SEIMM
           MOVE    WRK-HENYMDG2(8:2)       TO  SC03-SEIDD
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD         TO  SC03-HOSPCD 
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    住所
      *     MOVE    SYS-1002-ADRS           TO  SC03-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME       TO  SC03-HOSPNAME
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL            TO  SC03-HOSPTEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS            TO  SC03-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SC03-ADRS               REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME            TO  SC03-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SC03-HOSPNAME           REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *
      *    電話番号
           MOVE    WRK-HOSPTEL             TO  SC03-HOSPTEL
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) start
      *     MOVE    SYS-1001-KAISETUNAME    TO  SC03-KAISETU
           MOVE    WRK-KAISETUNAME         TO  SC03-KAISETU
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/01/06) end
      *
      *    点数表
           MOVE    SYS-1001-TENHYOKBN      TO  SC03-TENSUHYO
      
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC      SECTION.
      *
           INITIALIZE  SUM-SYOKEI
           MOVE    KEY-NEW     TO     KEY-OLD
           PERFORM VARYING IDX FROM    1   BY  1
      ***** 05/09/20 UPD
      *             UNTIL   IDX >       7
                   UNTIL   IDX >       6
      *****
                   OR      KEY-NEW     NOT =   KEY-OLD
                   OR      FLG-PRINT       =   1
      *
      *        受給者氏名
               MOVE    MF100-NAME          TO  SC03-NAME(IDX)
      *
      *        性別
               MOVE    MF100-SEX           TO  SC03-SEX(IDX)
      *
      *        生年月日
               INITIALIZE  WRK-TANJOYMD
               MOVE    MF100-BIRTHDAY      TO  WRK-SYMD
               PERFORM 31012-SEIWA-HEN-SEC
      ***** 06/02/16 yamaguchi DEL
      *         MOVE    LNK-DAY2-EDTYMD1    TO  WRK-HENYMDG1
      *****
               EVALUATE    LNK-DAY2-EDTYMD1-G
                   WHEN    "M"
                       MOVE    "1"         TO  WRK-TANJOYMD(1:1)
                   WHEN    "T"
                       MOVE    "2"         TO  WRK-TANJOYMD(1:1)
                   WHEN    "S"
                       MOVE    "3"         TO  WRK-TANJOYMD(1:1)
                   WHEN    "H"
                       MOVE    "4"         TO  WRK-TANJOYMD(1:1)
               END-EVALUATE
               MOVE    LNK-DAY2-EDTYMD1-Y  TO  WRK-TANJOYMD(2:2)
               MOVE    LNK-DAY2-EDTYMD1-M  TO  WRK-TANJOYMD(4:2)
               MOVE    LNK-DAY2-EDTYMD1-D  TO  WRK-TANJOYMD(6:2)
               INSPECT WRK-TANJOYMD    REPLACING   ALL " " BY  "0"
               MOVE    WRK-TANJOYMD        TO  SC03-TANJOYMD(IDX)
      *
      *        保険者番号
               EVALUATE    MF100-HKNNUM
                   WHEN    "001"
                       MOVE    "0000"      TO  SC03-HKNJANUM(IDX)(1:4)
                       MOVE    MF100-HKNJANUM(1:4)
                                           TO  SC03-HKNJANUM(IDX)(5:4)
                   WHEN    "060"
                       MOVE    "00"        TO  SC03-HKNJANUM(IDX)(1:2)
                       MOVE    MF100-HKNJANUM(1:6)
                                           TO  SC03-HKNJANUM(IDX)(3:6)
                   WHEN    OTHER
                       MOVE    MF100-HKNJANUM
                                           TO  SC03-HKNJANUM(IDX)
               END-EVALUATE
      *
      *        被保険者証記号
               MOVE    MF100-KIGO              TO  SC03-KIGO(IDX)
      *
      *        被保険者証番号
               MOVE    MF100-NUM               TO  SC03-NUM(IDX)
      *
      *        診療年月
               MOVE    MF100-SRYYM             TO  WRK-SYMD (1:6)
               MOVE    "01"                    TO  WRK-SYMD (7:2)
               PERFORM 31012-SEIWA-HEN-SEC
               MOVE    LNK-DAY2-EDTYMD1(2:2)   TO  SC03-SRYYY(IDX)
               MOVE    LNK-DAY2-EDTYMD1(5:2)   TO  SC03-SRYMM(IDX)
      *
      *        給付割合
               COMPUTE WRK-KYURATE     =   100 -   MF100-KYURATE
               MOVE    WRK-KYURATE             TO  WRK-Z2
               MOVE    WRK-Z2                  TO  SC03-KYURATE(IDX)
      *
      *        本人家族区分
               MOVE    MF100-RECESYUBETU(4:1)  TO  SC03-HONKZKKBN(IDX)
      *
      *        日数
               MOVE    MF100-JNISSU            TO  WRK-Z2
               MOVE    WRK-Z2                  TO  SC03-NISSU(IDX)
      *
      *        点数
               MOVE    MF100-TOTALTEN          TO  WRK-Z7
               MOVE    WRK-Z7                  TO  SC03-TENSU(IDX)
      *
      *        主保険一部負担金
               MOVE    MF100-SYUCOMPFTN        TO  WRK-Z7
               MOVE    WRK-Z7                  TO  SC03-ITBFTN(IDX)
      *
      *        全国公費を併用している場合は２段に分ける
               IF      MF100-TAHONUM       NOT =   SPACE
      *
      *            負担者番号
                   MOVE    MF100-TAHOFTNJANUM  TO  SC03-FTNJANUM(IDX 1)
                   MOVE    MF100-KOHFTNJANUM   TO  SC03-FTNJANUM(IDX 2)
      *
      *            受給者番号
                   PERFORM VARYING IDX1    FROM    1   BY  1
                           UNTIL   IDX1    >       2
                       IF      IDX1        =    1
                           MOVE    MF100-TAHOJKYSNUM   TO  WRK-JKYSNUM
                       ELSE
                           MOVE    MF100-KOHJKYSNUM    TO  WRK-JKYSNUM
                       END-IF
                       MOVE    ZERO    TO      IDX2
                       PERFORM VARYING IDX3    FROM    1   BY  1
                               UNTIL   IDX3    >       7
                               OR      WRK-JKYSNUM(IDX3:1)   =   SPACE
                           ADD     1           TO  IDX2
                       END-PERFORM
                       IF      IDX2    >   ZERO
                           COMPUTE IDX3    =   8   -   IDX2
                           MOVE    WRK-JKYSNUM(1:IDX2)
                                   TO  SC03-JKYSNUM(IDX IDX1)(IDX3:IDX2)
                       END-IF
                       INSPECT SC03-JKYSNUM(IDX IDX1)
                                       REPLACING   ALL " " BY "0"
                   END-PERFORM
      *
      *            公費対象点数
                   MOVE    MF100-KOHTENSU      TO  WRK-Z7
                   MOVE    WRK-Z7              TO  SC03-KOHTENSU(IDX 1)
                   MOVE    MF100-TOTALTEN      TO  WRK-Z7
                   MOVE    WRK-Z7              TO  SC03-KOHTENSU(IDX 2)
      *
      *            公費対象患者負担額
                   MOVE    MF100-KOHFTNGK      TO  WRK-Z7
                   MOVE    WRK-Z7              TO  SC03-KOHPTFTN(IDX 1)
                   MOVE    MF100-FTNMONEY      TO  WRK-Z7
                   MOVE    WRK-Z7              TO  SC03-KOHPTFTN(IDX 2)
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *            他法法別番号
      *             MOVE    MF100-TAHONUM       TO  WRK-KOHNUM
      *             PERFORM 950-HKNNUM-SET-SEC
      *             MOVE    HKN-HBTNUM          TO  SC03-TAHONUM(IDX)
      *---(01.00.07) LINE ADD END   ------------------------------------
               ELSE
      *
      *            負担者番号
                   MOVE    MF100-KOHFTNJANUM   TO  SC03-FTNJANUM(IDX 1)
      *
      *            受給者番号
                   MOVE    MF100-KOHJKYSNUM    TO  WRK-JKYSNUM
                   MOVE    ZERO    TO      IDX2
                   PERFORM VARYING IDX3    FROM    1   BY  1
                           UNTIL   IDX3    >       7
                           OR      WRK-JKYSNUM(IDX3:1)   =   SPACE
                       ADD     1           TO  IDX2
                   END-PERFORM
                   IF      IDX2    >   ZERO
                       COMPUTE IDX3    =   8   -   IDX2
                       MOVE    WRK-JKYSNUM(1:IDX2)
                               TO  SC03-JKYSNUM(IDX 1)(IDX3:IDX2)
                   END-IF
                   INSPECT SC03-JKYSNUM(IDX 1)
                                   REPLACING   ALL " " BY "0"
      *
      *            公費対象点数
                   MOVE    MF100-TOTALTEN      TO  WRK-Z7
                   MOVE    WRK-Z7              TO  SC03-KOHTENSU(IDX 1)
      *
      *            公費対象患者負担額
                   MOVE    MF100-FTNMONEY      TO  WRK-Z7
                   MOVE    WRK-Z7              TO  SC03-KOHPTFTN(IDX 1)
               END-IF
      *
      *        老人保健番号
               IF      MF100-RJNHKNNUM     NOT =   SPACE
                   MOVE    "27"                TO  SC03-RJNKBN(IDX)
               END-IF
      *      
      *        長期  
               IF      MF100-TYOKI     =   1
                   MOVE    "2"        TO SC03-TYOKI(IDX)
               END-IF
      *=== 長期上位対応 by Yoshikawa(2016/03/11) start
      *        長期上位
               IF      MF100-TYOKI     =   2
                   MOVE    "16"       TO SC03-TYOKI(IDX)
               END-IF
      *=== 長期上位対応 by Yoshikawa(2016/03/11) end
      *        
      *        合計加算
               ADD     1                   TO  SUM-KENSU
               ADD     MF100-TOTALTEN      TO  SUM-TENSU
               ADD     MF100-SYUCOMPFTN    TO  SUM-SYUCOMPFTN
               IF      MF100-TAHONUM       =   SPACE
                   ADD     MF100-TOTALTEN      TO  SUM-KOHTENSU(1)
                   ADD     MF100-FTNMONEY      TO  SUM-KOHPTFTN(1)
               ELSE
                   ADD     MF100-KOHTENSU      TO  SUM-KOHTENSU(1)
                   ADD     MF100-TOTALTEN      TO  SUM-KOHTENSU(2)
                   ADD     MF100-KOHFTNGK      TO  SUM-KOHPTFTN(1)
                   ADD     MF100-FTNMONEY      TO  SUM-KOHPTFTN(2)
               END-IF
      *
      *        一時ファイル読込
               PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *              帳票編集<合計>処理
      *****************************************************************
       325-GOKEI-HEN-SEC  SECTION.
      *
      *
      *    件数
           MOVE    SUM-KENSU               TO  WRK-Z1
           MOVE    WRK-Z1                  TO  SC03-GKENSU
      *
      *    点数
           MOVE    SUM-TENSU               TO  WRK-Z7
           MOVE    WRK-Z7                  TO  SC03-GTENSU
      *
      *    一部負担金
           MOVE    SUM-SYUCOMPFTN          TO  WRK-Z7
           MOVE    WRK-Z7                  TO  SC03-GITBFTN
      *
      *    公費対象点数
           MOVE    SUM-KOHTENSU(1)         TO  WRK-Z7
           MOVE    WRK-Z7                  TO  SC03-GKOHTENSU(1)
           MOVE    SUM-KOHTENSU(2)         TO  WRK-Z7
           MOVE    WRK-Z7                  TO  SC03-GKOHTENSU(2)
      *
      *    公費患者負担額
           MOVE    SUM-KOHPTFTN(1)         TO  WRK-Z7
           MOVE    WRK-Z7                  TO  SC03-GKOHPTFTN(1)
           MOVE    SUM-KOHPTFTN(2)         TO  WRK-Z7
           MOVE    WRK-Z7                  TO  SC03-GKOHPTFTN(2)
      *
           .
       325-GOKEI-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                SECTION.
      *
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
           MOVE   "SC2503.red"         TO  SPRT-PRTID
           MOVE   "福祉医療費請求書(連名簿)"
                                       TO  SPRT-TITLE
           MOVE    SC03                TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Monma(2017/12/04) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Monma(2017/12/04) end
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
      *****************************************************************
      *    エラー出力処理
      *****************************************************************
       500-ERR-HENSYU-SEC  SECTION.
      *
           OPEN  INPUT  RECEERR-FILE
           IF  STS-RECEERR  =  ZERO
             CONTINUE
           ELSE
             OPEN  OUTPUT  RECEERR-FILE
      *
             MOVE  WRK-RECEERR  TO  RECEERR-REC
             WRITE RECEERR-REC
           END-IF
      *
           CLOSE  RECEERR-FILE
      *
           .
       500-ERR-HENSYU-EXT.
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
      *    終了　　処理
      *****************************************************************
       300-END-SEC   SECTION.
      *
      *
           CLOSE  MF100-FILE
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU2503 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU2503 OUT "  CNT-MF100
           DISPLAY "*** SEIKYU2503 END ***"
      *
           IF  CNT-MF100  =  0
             DISPLAY "DATA NOT FOUND. PRINT JOB CANCEL!!"
           END-IF
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
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
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) start
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    MF100-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-MF100
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-MF100
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *=== 地方公費３併でも第二公費に記載 by Yoshikawa(2012/08/17) end
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
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
             IF  TBL-HKOHNUM(1)  =  TAISYO-KOHNUM(IDXX)
             OR  TBL-HKOHNUM(2)  =  TAISYO-KOHNUM(IDXX)
             OR  TBL-HKOHNUM(3)  =  TAISYO-KOHNUM(IDXX)
             OR  TBL-HKOHNUM(4)  =  TAISYO-KOHNUM(IDXX)
               MOVE     1                   TO  FLG-TAISYO
               MOVE     100                 TO  IDXX
             END-IF
           END-PERFORM
      *
           .
       800-TAISYOKOHI-CHK-EXT.
           EXIT.
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  MF100-FILE   NEXT
               AT  END
                   MOVE    1       TO  FLG-PRINT
               NOT AT  END
                   MOVE    ZERO    TO  FLG-PRINT
                   MOVE    MF100-NYUGAIKBN   TO  KEY-N-NYUGAIKBN
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    WRK-PARA-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
           END-IF
           .
       900-KOHSKY-START-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求書マスタＲＥＡＤ
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) start
      *         IF  RECE02-KOHNUM(1) = "142" OR "242" OR "140"
      *                             OR "141" OR "241" OR "341"
      *                             OR "143" OR "243" OR "343"
      *                             OR "144" OR "244" OR "344"
      *                             OR "145" OR "245" OR "345"
      *                             OR "146" OR "246" OR "170"
      **---(01.00.04) LINE ADD START ------------------------------------
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) start
      **                             OR "441" OR "541"
      *                             OR "441" OR "541" OR "340"
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) end
      **---(01.00.04) LINE ADD END   ------------------------------------
      *         OR  RECE02-KOHNUM(2) = "142" OR "242" OR "140"
      *                             OR "141" OR "241" OR "341"
      *                             OR "143" OR "243" OR "343"
      *                             OR "144" OR "244" OR "344"
      *                             OR "145" OR "245" OR "345"
      *                             OR "146" OR "246" OR "170"
      **---(01.00.04) LINE ADD START ------------------------------------
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) start
      **                             OR "441" OR "541"
      *                             OR "441" OR "541" OR "340"
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) end
      **---(01.00.04) LINE ADD END   ------------------------------------
      *         OR  RECE02-KOHNUM(3) = "142" OR "242" OR "140"
      *                             OR "141" OR "241" OR "341"
      *                             OR "143" OR "243" OR "343"
      *                             OR "144" OR "244" OR "344"
      *                             OR "145" OR "245" OR "345"
      *                             OR "146" OR "246" OR "170"
      **---(01.00.04) LINE ADD START ------------------------------------
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) start
      **                             OR "441" OR "541"
      *                             OR "441" OR "541" OR "340"
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) end
      **---(01.00.04) LINE ADD END   ------------------------------------
      *         OR  RECE02-KOHNUM(4) = "142" OR "242" OR "140"
      *                             OR "141" OR "241" OR "341"
      *                             OR "143" OR "243" OR "343"
      *                             OR "144" OR "244" OR "344"
      *                             OR "145" OR "245" OR "345"
      *                             OR "146" OR "246" OR "170"
      **---(01.00.04) LINE ADD START ------------------------------------
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) start
      **                             OR "441" OR "541"
      *                             OR "441" OR "541" OR "340"
      **=== 印字対象番号の追加 by Yoshikawa(2010/04/16) end
      **---(01.00.04) LINE ADD END   ------------------------------------
               INITIALIZE                            TBL-HIKAKU-KOHI
               MOVE    RECE02-KOHNUM(1)          TO  TBL-HKOHNUM(1)
               MOVE    RECE02-KOHNUM(2)          TO  TBL-HKOHNUM(2)
               MOVE    RECE02-KOHNUM(3)          TO  TBL-HKOHNUM(3)
               MOVE    RECE02-KOHNUM(4)          TO  TBL-HKOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/08/17) end
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
                   IF      WRK-PARA-STSRYYM    =   "999999"
                       CONTINUE
                   ELSE
                       IF  ( RECE02-SRYYM      <   WRK-PARA-STSRYYM )
                       OR  ( RECE02-SRYYM      >   WRK-PARA-EDSRYYM )
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
      *
      *            テスト患者のときは読み飛ばす
                   MOVE    SPACE               TO  PTINF-REC
                   INITIALIZE                      PTINF-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *             MOVE    RECE02-HOSPID       TO  PTINF-HOSPID
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
                   MOVE    RECE02-PTID         TO  PTINF-PTID
                   MOVE    PTINF-REC           TO  MCPDATA-REC
                   PERFORM 800-PTINF-READ-SEC
                   IF      FLG-PTINF           =   ZERO
                   AND     PTINF-TSTPTNUMKBN   =   "1"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *
      *           個別発行で患者番号指定の場合、対象判定を行う
                   MOVE  ZERO                TO  FLG-ERR
                   IF      WRK-PARA-SYORIFLG   =   "1"
                   AND     FLG-SYORI           =    2
                     MOVE  1                   TO  FLG-ERR
                     PERFORM VARYING IDXX    FROM    1   BY  1
                             UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                             OR      TBL-PARA-PTID(IDXX) =   ZERO
                         IF      RECE02-PTID =   TBL-PARA-PTID(IDXX)
                           MOVE    ZERO        TO  FLG-ERR
                         END-IF
                     END-PERFORM 
                   END-IF
      *
                   IF      FLG-ERR           =   1
                     GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) start
      *            特記事項０３を持っている場合は読み飛ばす
                   PERFORM  900-SEIKYU-SELECT-SEC
      *
                   IF  RECE10-TOKKI(1)  =  "03"
                   OR  RECE10-TOKKI(2)  =  "03"
                   OR  RECE10-TOKKI(3)  =  "03"
                   OR  RECE10-TOKKI(4)  =  "03"
                   OR  RECE10-TOKKI(5)  =  "03"
                     GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) end
      *
                   ADD  1  TO  CNT-RECE02
               ELSE
                   GO  TO  900-KOHSKY-READ-SEC
               END-IF
           ELSE
               MOVE    1               TO  FLG-END
               PERFORM 900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタクローズ
      *****************************************************************
       900-KOHSKY-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"          TO  MCP-TABLE
           MOVE    "key2"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           .
       900-KOHSKY-CLOSE-EXT.
           EXIT.
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) start
      *****************************************************************
      *   請求管理情報読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC  SECTION.
      *
           INITIALIZE  RECE10-REC
      *=== primary key変更対応 by Yoshikawa(2013/01/16) start
      *     MOVE  RECE02-HOSPNUM       TO  RECE10-HOSPNUM
      *     MOVE  RECE02-SRYYM         TO  RECE10-SRYYM
      *     MOVE  RECE02-NYUGAIKBN     TO  RECE10-NYUGAIKBN
      *     MOVE  RECE02-PTID          TO  RECE10-PTID
      *     MOVE  RECE02-RECEKA        TO  RECE10-RECEKA
      *     MOVE  RECE02-TEISYUTUSAKI  TO  RECE10-TEISYUTUSAKI
      *     MOVE  RECE02-RECESYUBETU   TO  RECE10-RECESYUBETU
      *     MOVE  RECE02-HKNJANUM      TO  RECE10-HKNJANUM
      *     MOVE  RECE02-HOJOKBN-KEY   TO  RECE10-HOJOKBN-KEY
      *     MOVE  RECE02-TEKSTYMD      TO  RECE10-TEKSTYMD
           MOVE  RECE02-KEY           TO  RECE10-KEY
      *=== primary key変更対応 by Yoshikawa(2013/01/16) end
           MOVE  RECE10-REC           TO  MCPDATA-REC
           MOVE  "DBSELECT"           TO  MCP-FUNC
           MOVE  "tbl_seikyu"         TO  MCP-TABLE
           MOVE  "key"                TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"          USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
           IF  MCP-RC  =  ZERO
             PERFORM  900-SEIKYU-READ-SEC
           ELSE
             DISPLAY  "SEIKYU SELECT ERR"
           END-IF
      *
           MOVE  "DBCLOSECURSOR"    TO  MCP-FUNC
           MOVE  "tbl_seikyu"       TO  MCP-TABLE
           MOVE  "key"              TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *
           .
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理ＦＥＴＣＨ
      *****************************************************************
       900-SEIKYU-READ-SEC  SECTION.
      *
           MOVE  "tbl_seikyu"   TO  MCP-TABLE
           MOVE  "key"          TO  MCP-PATHNAME
           MOVE  "DBFETCH"      TO  MCP-FUNC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  RECE10-REC
             MOVE  ZERO         TO  FLG-RECE10
           ELSE
             INITIALIZE             RECE10-REC
             MOVE  1            TO  FLG-RECE10
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *=== 特記事項０３は印字対象外 by Yoshikawa(2009/11/10) end
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
               MOVE    "tbl_ptinf"       TO  MCP-TABLE
               MOVE    "key"             TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"       USING
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
           MOVE    "tbl_ptinf"            TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
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
      *    保険組合せマスター読み込み
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                      HKNCOMBI-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    SYU-HOSPID                 TO  COMB-HOSPID
           MOVE    SPA-HOSPNUM                TO  COMB-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    SYU-PTID                   TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM            TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"         TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hkncombi"     TO  MCP-TABLE
               MOVE    "key"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"        USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC     TO  HKNCOMBI-REC
                   MOVE    ZERO            TO  FLG-HKNCOMBI
               ELSE
                   INITIALIZE                  HKNCOMBI-REC
                   MOVE    1               TO  FLG-HKNCOMBI
               END-IF
           ELSE
               INITIALIZE                  HKNCOMBI-REC
               MOVE    1               TO  FLG-HKNCOMBI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"     TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *    請求額集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           MOVE    ZERO    TO      WRK-KOHFTNGK
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) start
                                   WRK-TYOKIFTNGK
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) end
      *
           PERFORM VARYING IDX FROM    1   BY  1
                   UNTIL   IDX >       4   OR
                   SYU-KOH-HKNNUM(IDX) =   SPACE
               IF  SYU-KOH-HKNNUM(IDX)(1:1)    =   "0" AND
                   SYU-KOH-HKNNUM(IDX)     NOT =   "027"
      *
      *            公費番号設定
                   MOVE    SYU-KOH-HKNNUM(IDX) TO  MF100-TAHONUM
                   MOVE    COMB-KOHID(IDX)     TO  MF100-TAHOKOHID
      *            公費分点数集計
                   ADD     SYU-TOTAL-HKNTEN    TO  WRK-KOHTENSU
      *
      *                結核・精神は記載を省略
                   IF      RECE02-FTNMONEY(1)  >   ZERO
                       MOVE    SYU-KOH-COMPFTN(IDX)
                                               TO  WRK-KOHFTNGK
                   ELSE
      *=== 結核・精神も負担額を記載 by Yoshikawa(2008/10/20) start
      *                 IF      SYU-KOH-HKNNUM(IDX)  
      *                                         NOT = "010" AND "011"
      *                                         AND   "020" AND "021"
      *=== 結核・精神も負担額を記載 by Yoshikawa(2008/10/20) end
                           MOVE    SYU-KOH-COMPFTN(IDX)
                                               TO  WRK-KOHFTNGK
      *=== 結核・精神も負担額を記載 by Yoshikawa(2008/10/20) start
      *                 END-IF
      *=== 結核・精神も負担額を記載 by Yoshikawa(2008/10/20) end
                   END-IF
               END-IF
      *
      *        計算負担金に差が有る場合、地方公費の助成があったと判定する
               IF      FLG-ERR                 =   1
               AND     SYU-KOH-HKNNUM(IDX)     =   WRK-KOHNUM
                   IF      IDX                 =   1
                       IF      SYU-SYUCOMPFTN-ENTANI
                                       >   SYU-KOH-COMPFTN-ENTANI(IDX)
                           MOVE    ZERO        TO  FLG-ERR
                       END-IF
                   ELSE
                       IF      SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                       >   SYU-KOH-COMPFTN-ENTANI(IDX)
                           MOVE    ZERO        TO  FLG-ERR
                       END-IF
                   END-IF
               END-IF
      *
      *
               IF      SYU-KOH-HKNNUM(IDX)     =   "972"
                   MOVE    1       TO  FLG-TYOKI
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) start
      *                                 MF100-TYOKI
                   MOVE    SYU-KOH-COMPFTN(IDX)  TO  WRK-TYOKIFTNGK
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) end
               END-IF
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *        長期上位
               IF      SYU-KOH-HKNNUM(IDX)     =   "974"
                   MOVE    2       TO  FLG-TYOKI
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) start
      *             MOVE    1       TO  MF100-TYOKI
                   MOVE    SYU-KOH-COMPFTN(IDX)  TO  WRK-TYOKIFTNGK
      *=== 長期は上限を超えた時に記載 by Yoshikawa(2011/12/09) end
               END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
           END-PERFORM
      *
      *    主保険に限度額が有る場合のみ主保険計算負担金を集計
           IF      RECE02-FTNMONEY(1)          >   ZERO
               IF      RECE02-RJNHKNNUM    NOT =   SPACE
                   ADD     SYU-KOH-COMPFTN(1)  TO  WRK-SYUCOMPFTN
               ELSE
                   ADD     SYU-SYUCOMPFTN      TO  WRK-SYUCOMPFTN
               END-IF
           END-IF   
      *
           ADD     WRK-KOHFTNGK        TO  WRK-KOHFTNGK-G
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) start
           ADD     WRK-TYOKIFTNGK      TO  WRK-TYOKIFTNGK-G
      *=== 実日数2日以上の長期不具合対応 by Yoshikawa(2012/03/05) end
      *
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  RECE02-HOSPID      TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
             MOVE    "tbl_syunou"     TO  MCP-TABLE
             MOVE    WRK-PATH         TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"      USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH         TO  MCP-PATH
               MOVE    "tbl_syunou"   TO  MCP-TABLE
               MOVE    WRK-PATH       TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH         TO  MCP-PATH
                 MOVE    "tbl_syunou"     TO  MCP-TABLE
                 MOVE    WRK-PATH         TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
             MOVE    "tbl_syunou"       TO  MCP-TABLE
             MOVE    WRK-PATH           TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"        USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
           MOVE  "DBFETCH"      TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *       CALL  "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *    公費の負担者番号取得
      *****************************************************************
       930-PTKOHINF-SET-SEC  SECTION.
      *
           INITIALIZE  PTKOHINF-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID      TO  PTKOH-HOSPID
           MOVE  SPA-HOSPNUM        TO  PTKOH-HOSPNUM
      *---(01.00.03) LINE ADD END ------------------------------------
           MOVE  RECE02-PTID        TO  PTKOH-PTID
           MOVE  MF100-TAHOKOHID    TO  PTKOH-KOHID
      *
           MOVE  PTKOHINF-REC            TO  MCPDATA-REC
           MOVE  "DBSELECT"              TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-PTKOHINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"           USING
      *                              MCPAREA
      *                              MCPDATA-REC
           MOVE    "tbl_ptkohinf"     TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                        SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-PTKOHINF-KEY  TO  MCP-PATH
             MOVE    "tbl_ptkohinf"     TO  MCP-TABLE
             MOVE    "key"              TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
             PERFORM  935-PTKOHINF-READ-SEC
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-PTKOHINF-KEY  TO  MCP-PATH
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           MOVE    "tbl_ptkohinf"     TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                        SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       930-PTKOHINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費の負担者番号取得
      *****************************************************************
       935-PTKOHINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  PTKOHINF-REC
             MOVE  ZERO         TO  FLG-PTKOHINF
           ELSE
             INITIALIZE  PTKOHINF-REC
             MOVE  1  TO  FLG-PTKOHINF
           END-IF
      *
           .
       935-PTKOHINF-READ-EXT.
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
      *    保険者情報読込
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
      *    月末日算出処理
      *****************************************************************
       31012-LASTDAY-GET-SEC        SECTION.
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY7-AREA
           MOVE    "71"                   TO  LNK-DAY7-IRAI
           MOVE    WRK-SYMD     TO  LNK-DAY7-YM
           CALL    "ORCSDAY"       USING   STS-AREA-DAY
                                                  LNK-DAY7-AREA
           MOVE LNK-DAY7-KOYOMI  TO  WRK-SYMD
           .
       31012-LASTDAY-GET-EXT.
           EXIT.
      *
      *****************************************************************
      *    管理マスタ読み込み
      *****************************************************************
       800-SYSKANRI-READ-SEC  SECTION.
      *
           MOVE  "DBSELECT"                TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10   TO  MCP-PATH
      *     CALL  "MCPSUB"            USING
      *                               MCPAREA
      *                               MCPDATA-REC
           MOVE    "tbl_syskanri"         TO  MCP-TABLE
           MOVE    "key10"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"                TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *       CALL  "MCPSUB"        USING
      *                             MCPAREA
      *                             MCPDATA-REC
             MOVE  "tbl_syskanri"          TO  MCP-TABLE
             MOVE  "key10"                 TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
               MOVE  ZERO  TO  FLG-SYSKANRI
             ELSE
               MOVE  1  TO  FLG-SYSKANRI
             END-IF
           ELSE
             MOVE  1  TO  FLG-SYSKANRI
           END-IF
      *
           MOVE  "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL  "MCPSUB"        USING
      *                           MCPAREA
      *                           MCPDATA-REC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key10"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       800-SYSKANRI-READ-EXT.
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
           MOVE    SYS-1901-REC        TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
           MOVE    SYS-1902-REC        TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/12/04) end
           MOVE    "01"                TO  SYS-1903-STYUKYMD (7:2)
           MOVE    SYS-1903-STYUKYMD   TO  SYS-1903-EDYUKYMD
           MOVE    SYS-1903-REC        TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
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
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/10/04) end
      *****************************************************************
      *    パラメタ読込
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC         TO  BTPARA-REC
               MOVE    ZERO                TO  FLG-BTPARA
           ELSE
               MOVE    1                   TO  FLG-BTPARA
               INITIALIZE                      BTPARA-REC
           END-IF
      *
           .
       900-BTPARA-READ-N-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  "DBOPEN"   TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBSTART"  TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
       900-DBDISCONNECT-SEC  SECTION.
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  "DBCOMMIT"      TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBDISCONNECT"  TO  MCP-FUNC.
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
