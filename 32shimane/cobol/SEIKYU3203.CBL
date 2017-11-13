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
       PROGRAM-ID.     SEIKYU3203.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 地方公費
      *  コンポーネント名  : 島根乳幼児医療費請求書
      *                      (対象公費はTAISYOKOHI.INI参照)
      *                      (デフォルト値：190,290,390)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/12/27    山口       再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * ORCA:ver    修正者     日付            内容
      * 2.5.0.ver02  劉丹    06/01/17    公費併用の場合は３段記載
      *                                  桁数のバイト数に変更
      *                                  控除額の計算方法を修正
      * 2.6.0.ver01  劉丹    06/03/17    仕様変更
      *                                  （縦版は横版に変更）
      * 2.6.0.ver02  劉丹    06/04/10    診療年月の修正
      *  01.00.04    内田    07/08/15    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *                                  長期上位（974）は長期と同様の
      *                                  処理をする
      *  01.00.05    門間    08/12/16    SPA-AREA初期化
      *  01.00.06    吉川    12/09/19    対象公費番号をINIファイルから
      *                                  取得するようにする
      *  01.00.07    吉川    13/01/11    プラグイン対応
      *                                  医療機関情報編集対応
      *  01.00.08    吉川    14/05/14    プログラムオプション対応
      *  01.00.09    吉川    14/10/24    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.10    吉川    15/07/06    公費の助成がない場合は印字しない
      *                                  医療機関コードはHOSPCDNではなく
      *                                  HOSPCDを使用するように修正
      *  01.00.11    吉川    15/07/13    診療年月はパラメタではなく
      *                                  テーブルの診療年月を参照
      *  01.00.12    門間    16/04/09    医療機関編集情報への開設者名追加対応
      *  01.00.13    門間    17/11/01    医療機関コード変更時、
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
006900*    エラーファイル
           SELECT  RECEERR-FILE ASSIGN  RECEERR
                                FILE    STATUS  IS  STS-RECEERR.
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      **    印字対象公費番号ファイル
      *     SELECT  TAISYOKOHI-FILE ASSIGN FILE-NAME
      *                             ORGANIZATION   IS  LINE SEQUENTIAL
      *                             ACCESS MODE    IS  SEQUENTIAL
      *                             FILE   STATUS  IS  STS-TAISYOKOHI.
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *    集計ファイル
       FD  MF100-FILE.
       01  MF100-REC.
           COPY  "SEI3203.INC".
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      **    印字対象公費番号ファイル
      * FD  TAISYOKOHI-FILE.
      * 01  TAISYOKOHI-REC.
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) start
      **     03  TAISYO-DAT-KBN      PIC X(01).
      **     03  FILLER              PIC X(01).
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) end
      *     03  TAISYO-DAT-KOHNUM   PIC X(03). 
      *     03  TAISYO-DAT-KAIGYO   PIC X(01). 
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *
       WORKING-STORAGE  SECTION.
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF100//.
      *
      *    エラーファイル 名称領域
      *---(01.00.04) LINE ADD START ------------------------------------
      *     COPY  "CPCOMMONDAT2.INC"
      *             REPLACING  //RECE01PARA//
      *             BY         //RECEERR//.
      *     03      PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      *    対象公費番号データ
           COPY  "TAISYO3201.INC".
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *
      *    印刷用データ 名称領域
           COPY  "CPCOMMONPRT.INC".
      *
      *    シェル用領域
           COPY  "CPCOMMONSHELL.INC".
      *
      *    印刷用データ
           COPY  "SC3203.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-MF100        PIC X(02).
           03  STS-RECE02       PIC X(02).
           03  STS-PARA         PIC X(02).
           03  STS-RECEERR      PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
           03  STS-TAISYOKOHI   PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-SYUNOU     PIC 9(01).
           03  FLG-END        PIC 9(01).
           03  FLG-PTINF      PIC 9(01).
           03  FLG-SYSKANRI   PIC 9(01).
           03  FLG-HKNJAINF   PIC 9(01).
           03  FLG-HKNCOMBI   PIC 9(01).
           03  FLG-PRINT      PIC 9(01).
           03  FLG-ERR        PIC 9(01).
           03  FLG-BTPARA     PIC 9(01).
           03  FLG-SYORI      PIC 9(01).
      ****2006/01/17  @@@@-BRAND  START
           03  FLG-PTKOHINF   PIC 9(01).
           03  FLG-KOHNUM   PIC 9(01).
      ****2006/01/17  @@@@-BRAND  END
      ****2006/03/17  @@@@-BRAND  START
           03  FLG-IDX4       PIC 9(01).
      ****2006/03/17  @@@@-BRAND  END
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
           03  FLG-TAISYOKOHI PIC 9(01).
           03  FLG-TAISYO     PIC 9(01).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *
      *    添字領域
       01  IDX-AREA.
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      *     03  IDX            PIC 9(04).
           03  IDX            PIC 9(05).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
           03  IDXX           PIC 9(04).
           03  IDX1           PIC 9(04).
           03  IDX2           PIC 9(04).
           03  IDX3           PIC 9(04).
      ****2006/03/17  @@@@-BRAND  START
           03  IDX4           PIC 9(04).
           03  IDX5           PIC 9(04).
           03  IDX6           PIC 9(04).
           03  IDX7           PIC 9(04).
           03  IDX8           PIC 9(04).
           03  IDX9           PIC 9(04).
           03  IDX10          PIC 9(04).
      ****2006/03/17  @@@@-BRAND  END
           03  IDY            PIC 9(04).
           03  IDZ            PIC 9(04).
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.04) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.04) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYORIFLG   PIC X(01).
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
           03  WRK-PARA-STSRYYM      PIC 9(06).
           03  WRK-PARA-EDSRYYM      PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      **=== プラグイン対応 by Yoshikawa(2013/01/11) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SEIKYU3203".
      *     03  FILLER              PIC X(14)  VALUE "TAISYOKOHI.INI".
      **=== プラグイン対応 by Yoshikawa(2013/01/11) end
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR         PIC X(200). 
           03  WRK-KOUJO           PIC 9(05).
           03  WRK-GKOUJO          PIC 9(06).
      *
      ****2006/01/17  @@@@-BRAND  START
           03  WRK-SASITENSU       PIC 9(07).
           03  WRK-TAHOFTN         PIC 9(07).
           03  WRK-KEISAN          PIC 9(08).
           03  WRK-AMARI           PIC 9(02).
           03  WRK-TAHOKOHNUM      PIC X(03).
           03  WRK-ETC-FTNJANUM    PIC X(20).
      ****2006/03/17 @@@@-BRAND START
           03  WRK-ETC-JKYJANUM    PIC X(20).
      ****2006/03/17 @@@@-BRAND END
      ****2006/01/17  @@@@-BRAND  END
      *
           03  WRK-DENPPRTYMWH  PIC X(16).
           03  WRK-SYSYMDWH     PIC X(22).
           03  WRK-SEIYMDWH     PIC X(22).
           03  WRK-SRYYM        PIC X(09).
           03  WRK-HOSPCD       PIC 9(01).
           03  WRK-KENSYO       PIC 9(02).
           03  WRK-GKENSYO      PIC 9(02).
      *
           03  WRK-KOHNUM       PIC X(03).
           03  WRK-KOHID        PIC 9(10).
      *
           03  WRK-SYMD.
               05  WRK-SYY   PIC 9(04).
               05  WRK-SMM   PIC 9(02).
               05  WRK-SDD   PIC 9(02).
           03  WRK-LASTYMD   PIC 9(08).
           03  WRK-HENYMDG   PIC X(22).
           03  WRK-HENYMDG1  PIC X(09).
           03  WRK-HKNJANUM  PIC X(05).
      *
      *    編集用エリア
      ****2006/01/17  @@@@-BRAND START
      *     03  WRK-NISSUX      PIC Z9.
      *     03  WRK-TENSUX      PIC ZZ,ZZ9.
      *     03  WRK-KOUJOX      PIC ZZZ,ZZ9.
      ****2006/04/06 @@@@-BRAND START
      *    03  WRK-ZERO5       PIC Z,ZZ9.
      *    03  WRK-ZERO9       PIC Z,ZZZ,ZZ9.
           03  WRK-ZERO5       PIC Z,ZZZ.
           03  WRK-ZERO9       PIC Z,ZZZ,ZZZ.
      ****2006/04/06 @@@@-BRAND END
           03  WRK-Z2          PIC ZZ.
           03  WRK-Z7          PIC ZZZ,ZZZ.
      ****2006/03/17 @@@@-BRAND START
           03  WRK-Z4          PIC Z,ZZZ.
           03  WRK-Z9          PIC Z,ZZZ,ZZZ.
      ****2006/03/17 @@@@-BRAND END
      *
      *    編集用エリア（小計)
      *     03  WRK-SKENSUX      PIC ZZ9.
      *     03  WRK-SNISSUX      PIC ZZ9.
      *     03  WRK-STENSUX      PIC ZZZ,ZZ9.
      *     03  WRK-SKENSUX      PIC Z,ZZ9.
      *     03  WRK-SNISSUX      PIC Z,ZZ9.
      *     03  WRK-STENSUX      PIC Z,ZZZ,ZZ9.
      *     03  WRK-SKOUJOX      PIC Z,ZZZ,ZZ9.
      *
      *    編集用エリア（合計）
      *     03  WRK-GKENSUX      PIC ZZ,ZZ9.
      ****2006/01/17  @@@@-BRAND END
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER            PIC S9(09)  BINARY.
      *         05  FILLER            PIC S9(09)  BINARY.
      *         05  FILLER            PIC S9(09)  BINARY.
           03  WRK-PATH              PIC  X(50).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/01/11) start
      *     03  FILE-NAME             PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/01/11) end
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION      PIC X(100)  OCCURS 100.
           03  WRK-PRGID           PIC X(25).
           03  WRK-KBNCD           PIC X(16).
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) end
      *
      *    集計用エリア
       01  SUM-AREA  VALUE   ZERO.
           03  SUM-SYOKEI.
               05  SUM-SKENSU      PIC 9(04).
           03  SUM-TABLE        OCCURS  4.
      ****2006/01/17  @@@@-BRAND START
      *         05  SUM-KENSU    PIC  9(03).
      *         05  SUM-NISSU    PIC  9(03).
               05  SUM-KENSU    PIC  9(04).
               05  SUM-NISSU    PIC  9(05).
      ****2006/01/17  @@@@-BRAND END
               05  SUM-TENSU    PIC  9(07).
      ****2006/03/17  @@@@-BRAND START
               05  SUM-TYO      PIC  9(02).
      ****2006/03/17  @@@@-BRAND END
               05  SUM-KOUJO    PIC  9(09).
      *
      ****2006/03/17  @@@@-BRAND START
       01  SUM-AREA2             VALUE  ZERO.
           03  SUM-TABLE1        OCCURS  2.
             05  SUM-TABLE2      OCCURS  100.
               07  SUM-GKENSU    PIC  9(04).
               07  SUM-GNISSU    PIC  9(05).
               07  SUM-GTENSU    PIC  9(07).
               07  SUM-GTYO      PIC  9(02).
      *
      * 公費再掲
       01  SUM-AREA3             VALUE  ZERO.
           03  SUM-KOHTABLE1        OCCURS  100.
             05  SUM-KOHTABLE2      OCCURS  100.
               07  SUM-KOHNUM    PIC  X(02).
               07  SUM-KKENSU    PIC  9(04).
               07  SUM-KTENSU    PIC  9(07).
               07  SUM-KFTNKG    PIC  9(09).
      *
       01  SUM-AREA4             VALUE  ZERO.
           03  SUM-GKOHTABLE1       OCCURS  100.
             05  SUM-GKOHNUM     PIC  X(02).
             05  SUM-GKKENSU     PIC  9(04).
             05  SUM-GKTENSU     PIC  9(07).
             05  SUM-GKFTNKG     PIC  9(09).
      *
      ****2006/03/17  @@@@-BRAND END
      *    キー用エリア
       01  KEY-AREA  VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-FTNJANUM   PIC X(03).
           03  KEY-OLD.
               05  KEY-O-FTNJANUM   PIC X(03).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-RECE02  PIC 9(06).
           03  CNT-LINE    PIC 9(02).
           03  CNT-PAGE    PIC 9(03).
           03  CNT-MF100   PIC 9(06).
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      *    比較用公費番号テーブル領域
       01  TBL-HIKAKU-KOHI.
           03  TBL-HKOHNUM              PIC X(03)  OCCURS  4.
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     COPY  "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
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
      *
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) end
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      ****2006/01/17  @@@@-BRAND  START
      *    患者公費情報マスタ
       01  PTKOHINF-REC.
           COPY  "CPPTKOHINF.INC".
      ****2006/01/17  @@@@-BRAND  END
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *
      *****************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *   日付変換サブ
           COPY  "CPORCSDAY.INC".
           COPY  "CPORCSLNK.INC".
      *
      *    ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    共通パラメタ
           COPY  "MCPAREA".
      *
           COPY  "MCPDATA.INC".
      *
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
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
      ****2006/03/17 @@@@-BRAND START
           INITIALIZE  SUM-AREA2
           INITIALIZE  SUM-AREA3
           INITIALIZE  SUM-AREA4
      ****2006/03/17 @@@@-BRAND END
      *
      *--- (2008/12/16) line add start monma ---------------------------
           INITIALIZE  SPA-AREA
      *--- (2008/12/16) line add end   monma ---------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
           INITIALIZE  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
                                               WRK-PARA-SYORIFLG
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
      *---(01.00.04) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SEIKYU3203"    TO  JOB-PGID
           MOVE    "乳幼児医療費請求書" 
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    対象年月最終日取得
           INITIALIZE  WRK-SYMD
           MOVE    LNK-PRTKANRI-SRYYM  TO    WRK-SYMD(1:6)
           PERFORM 31012-LASTDAY-GET-SEC
           MOVE    WRK-SYMD         TO    WRK-LASTYMD
      *
           MOVE  LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE  "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE  WRK-HENYMDG(1:16)  TO  WRK-DENPPRTYMWH
           MOVE  WRK-HENYMDG1       TO  WRK-SRYYM
      *
      *    システム日付セット
           MOVE  LNK-PRTKANRI-SKYYMD  TO  WRK-SYMD
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE  WRK-HENYMDG  TO  WRK-SYSYMDWH
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
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/24) start
      *     MOVE  "MF100ZZ"        TO  MF100PARA-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)  TO  MF100PARA-TERMID
      **---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  WRK-PARA-HOSPNUM           TO  MF100PARA-HOSPNUM
      **---(01.00.04) LINE ADD END   ------------------------------------
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
      *=== ver4.8対応 by Yoshikawa(2014/10/24) end
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  "RECEERR"        TO  RECEERR-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)
      *                            TO  RECEERR-TERMID
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
      *     MOVE  LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1001-STYUKYMD(1:6)
      *                             SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
           MOVE  "01"          TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-1001-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU3203 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
      *     MOVE  LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1002-STYUKYMD(1:6)
      *                             SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
           MOVE  "01"          TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  SYS-1002-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU3203 SYS 1002 ERR ***" 
             MOVE  1            TO  FLG-END
           END-IF
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    パラメタ編集処理
           PERFORM 1001-PARA-HENSYU-SEC
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      *     PERFORM  110-INI-FILE-SEC
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
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
      *---(01.00.04) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM         TO  BTPARA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-SHELLID    TO  BTPARA-SHELLID
               MOVE    WRK-PARA-JOBID      TO  BTPARA-JOBID
               MOVE    BTPARA-REC          TO  MCPDATA-REC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
      *---(01.00.04) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
      *             MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
                   PERFORM 900-BTPARA-READ-N-SEC
               END-PERFORM
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
               MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
               IF      IDXX            =   ZERO
                   MOVE    ZERO            TO  WRK-PARA-SYORIFLG
               END-IF
           END-IF 
           .
       1001-PARA-HENSYU-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      ******************************************************************
      **    優先保険者番号INIファイル読み込み処理 
      ******************************************************************
      * 110-INI-FILE-SEC                SECTION.
      **
      **    印字対象公費番号ファイル読み込み
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/01/11) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/TAISYOKOHI.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/01/11) end
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
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) start
      **           IF  TAISYO-DAT-KBN = "*" OR SPACE
      *           IF  TAISYO-DAT-KOHNUM(1:1) = "*" OR SPACE
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) end
      *             CONTINUE
      *           ELSE
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) start
      **             IF  TAISYO-DAT-KBN = "1"
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) end
      *               ADD   1               TO  IDX
      *               MOVE  TAISYOKOHI-REC  TO  TAISYO-TBL(IDX)
      *               DISPLAY "読み込み対象公費 = " TAISYOKOHI-REC
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) start
      **             END-IF
      **=== INIの帳票区分廃止 by Yoshikawa(2013/01/11) end
      *           END-IF
      *       END-READ
      *     END-PERFORM
      **
      *     CLOSE TAISYOKOHI-FILE
      **
      *     .
      * 110-INI-FILE-EXT.
      *     EXIT.
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SEIKYU3203"              TO  WRK-PRGID
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
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC  SECTION.
      *
           OPEN     OUTPUT  MF100-FILE
           CLOSE            MF100-FILE
           OPEN     I-O     MF100-FILE
      *
           MOVE     ZERO    TO      FLG-END
      *
           PERFORM  2001-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   MF100-FILE
      *
           IF       CNT-RECE02   >       0
                    PERFORM   2002-PRINT-SEC
           END-IF
            MOVE   1   TO   FLG-END
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計処理１
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           PERFORM VARYING IDZ FROM    1   BY  1
                   UNTIL   IDZ >       4
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      ****2006/01/17  @@@@-BRAND START
      *       IF  RECE02-KOHNUM (IDZ) =   "190" OR "290"
      *       IF  RECE02-KOHNUM (IDZ) =   "190" OR "290" OR "390"
      ****2006/01/17  @@@@-BRAND END
             INITIALIZE                            TBL-HIKAKU-KOHI
             MOVE    RECE02-KOHNUM(IDZ)        TO  TBL-HKOHNUM(1)
      *      対象公費番号チェック処理
             PERFORM  800-TAISYOKOHI-CHK-SEC
             IF  FLG-TAISYO  =  1
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
               PERFORM  20011-SYUKEI-SEC
             END-IF
           END-PERFORM
      *
           PERFORM 900-KOHSKY-READ-SEC
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
           INITIALIZE  MF100-REC
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID       TO  MF100-HOSPID
           MOVE  SPA-HOSPNUM         TO  MF100-HOSPNUM
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE  RECE02-PTNUM        TO  MF100-PTNUM
           MOVE  RECE02-RECEKA       TO  MF100-SRYKA
           MOVE  RECE02-HKNJANUM-KEY TO  MF100-HKNJANUM-KEY
           MOVE  RECE02-TEKSTYMD     TO  MF100-TEKSTYMD
           MOVE  RECE02-NYUGAIKBN    TO  MF100-NYUGAIKBN
      *
      ****2006/01/17  @@@@-BRAND START
           MOVE  RECE02-RECESYUBETU  TO  MF100-RECESYUBETU
           MOVE  RECE02-SRYYM        TO  MF100-SRYYM
      ****2006/01/17  @@@@-BRAND END
           MOVE  RECE02-PTID         TO  MF100-PTID
           MOVE  RECE02-NAME         TO  MF100-NAME
           MOVE  RECE02-BIRTHDAY     TO  MF100-BIRTHDAY
           MOVE  RECE02-HKN          TO  MF100-HKN
           MOVE  RECE02-RJNHKN       TO  MF100-RJNHKN
      *
           MOVE  RECE02-KOHFTNJANUM (IDZ)  TO  MF100-FTNJANUM
           MOVE  RECE02-KOHJKYSNUM  (IDZ)  TO  MF100-KOHJKYSNUM
           MOVE  RECE02-KOHINF      (IDZ)  TO  MF100-KOHINF
           COMPUTE IDY     =       IDZ     +   1
           MOVE  RECE02-JNISSUINF   (IDY)  TO  MF100-JNISSUINF
           MOVE  RECE02-TOTALTEN    (IDY)  TO  MF100-TOTALTEN
           MOVE  RECE02-FTNMONEY    (IDY)  TO  MF100-FTNMONEY
           MOVE  RECE02-YKZFTNINF   (IDY)  TO  MF100-YKZFTNINF
           MOVE  RECE02-SHOKUJIINF  (IDY)  TO  MF100-SHOKUJIINF
      *
      *=== 公費の助成なしは印字しない by Yoshikawa(21015/07/06) start
           MOVE     1                      TO   FLG-ERR
      *=== 公費の助成なしは印字しない by Yoshikawa(21015/07/06) end
           MOVE     MF100-KOHNUM           TO  WRK-KOHNUM
           MOVE     MF100-KOHID            TO  WRK-KOHID
           IF      RECE02-NYUGAIKBN    =   "1"
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"             TO  WRK-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"             TO  WRK-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-IF
           PERFORM  920-SYUNOU-SET-SEC
      ****2006/01/17 @@@@-BRAND  START
           IF    MF100-TYOKI  =  1
           AND   MF100-FTNMONEY  >=  10000
                 MOVE  10000           TO  MF100-FTNMONEY
           END-IF
      *
           IF    MF100-TYOKI  =  1
           AND   MF100-TAHOFTN  >=  10000
                 MOVE  10000           TO  MF100-TAHOFTN
           END-IF
      ****2006/01/17 @@@@-BRAND  END
      *---(01.00.04) LINE ADD START ------------------------------------
      *    長期上位
           IF    MF100-TYOKI  =  2
           AND   MF100-FTNMONEY  >=  20000
                 MOVE  20000           TO  MF100-FTNMONEY
           END-IF
      *
           IF    MF100-TYOKI  =  2
           AND   MF100-TAHOFTN  >=  20000
                 MOVE  20000           TO  MF100-TAHOFTN
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    保険者番号チェック処理
      *=== 公費の助成なしは印字しない by Yoshikawa(21015/07/06) start
      *     MOVE    ZERO               TO   FLG-ERR
      *=== 公費の助成なしは印字しない by Yoshikawa(21015/07/06) end
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
           IF  FLG-ERR    =    ZERO
      ****2006/01/17  @@@@-BRAND  START
      *       IF    MF100-KOHNUM   =   "290"
      *         IF    MF100-NYUGAIKBN  = "1"
      *           WRITE  MF100-REC
      *           ADD  1  TO  CNT-MF100
      *         END-IF
      *       ELSE
      *         WRITE  MF100-REC
      *         ADD  1  TO  CNT-MF100
      *       END-IF
             WRITE  MF100-REC
             ADD  1  TO  CNT-MF100
      ****2006/01/17  @@@@-BRAND  START
           ELSE
             DISPLAY "対象外患者番号="  RECE02-PTNUM
           END-IF
      *
           INITIALIZE  WRK-GKOUJO
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      **
      *****************************************************************
      *    個別発行時の保険者番号(市町村番号)チェック処理
      *****************************************************************
       200111-HKNJANUM-CHK-SEC                SECTION.
      *
           INITIALIZE      WRK-HKNJANUM
           MOVE    "32"                     TO  WRK-HKNJANUM(1:2)
           MOVE    MF100-KOHFTNJANUM(5:3)   TO  WRK-HKNJANUM(3:3)
      *
           IF  WRK-PARA-SYORIFLG       =   "1"
               AND FLG-SYORI           =    1
               AND FLG-ERR             =   ZERO
      *
               DISPLAY "患者番号 = "  MF100-PTNUM
               DISPLAY "チェック用保険者番号="  WRK-HKNJANUM
               MOVE    1       TO      FLG-ERR
               PERFORM VARYING IDXX    FROM    1   BY  1
                       UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                       OR      TBL-PARA-HKNJANUM(IDXX)  =   SPACE
      *
                   DISPLAY  "TBL-PARA-HKNJANUM = " 
                                               TBL-PARA-HKNJANUM(IDXX)
      *
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
      ****2006/03/17 @@@@-BRAND START
      *
      *    帳票編集<ヘッダー部>処理前集計
      *
           OPEN     INPUT       MF100-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
             MOVE 1                       TO  IDX6
      *
           PERFORM  UNTIL      FLG-PRINT    =  1
             MOVE  KEY-NEW                TO  KEY-OLD
             MOVE 0                       TO  IDX7
      *      ADD  1                       TO  IDX6
      *
               PERFORM   UNTIL   FLG-PRINT       =   1
                         OR      KEY-NEW     NOT =   KEY-OLD
      *    入外院集計
      *
                IF  MF100-RECESYUBETU(4:1) = "3" OR "5" 
                  MOVE  1  TO  IDX           
                END-IF                          
                IF  MF100-RECESYUBETU(4:1) = "4" OR "6"
                  MOVE  2  TO  IDX
                END-IF
      *    件数集計
                ADD  1  TO  SUM-KENSU (IDX)
      *      
      *    日数集計
                ADD  MF100-JNISSU    TO  SUM-NISSU (IDX)
      *
      *    点数集計
                ADD  MF100-TOTALTEN  TO  SUM-TENSU (IDX)
      *
      *    ０２長件数
      *---(01.00.04) LINE ADD START ------------------------------------
      *          IF  MF100-TYOKI = 1
                IF  MF100-TYOKI = 1 OR 2
      *---(01.00.04) LINE ADD END   ------------------------------------
                  ADD 1              TO  SUM-TYO(IDX)
                END-IF
      *
      *    90集計
      *
                MOVE  "90"           TO    SUM-GKOHNUM(IDX6)
                ADD 1                TO    SUM-GKKENSU(IDX6)
      *
                COMPUTE  SUM-GKFTNKG(IDX6) = SUM-GKFTNKG(IDX6)
                                           + MF100-FTNMONEY
                IF MF100-TAHO  =    1 
                   COMPUTE  SUM-GKTENSU(IDX6)  = SUM-GKTENSU(IDX6) +
                            ( MF100-TOTALTEN - MF100-TAHOTEN )
      *           
                ELSE
                   COMPUTE  SUM-GKTENSU(IDX6)  = SUM-GKTENSU(IDX6)
                                               + MF100-TOTALTEN
      *
                END-IF
      *
      *    公費再掲集計
                IF MF100-TAHO  =    1  
      *
                  COMPUTE IDX9 = IDX7 + 1
                  PERFORM  VARYING IDX8 FROM 1 BY 1
                           UNTIL  IDX8 >  IDX9
                    IF  MF100-TAHOFTNJANUM(1:2)  =
                                              SUM-KOHNUM(IDX6 IDX8)
                      MOVE 1                 TO FLG-KOHNUM
                      MOVE IDX8              TO IDX7
                      MOVE IDX9              TO IDX8
                    ELSE
                      MOVE 0                 TO FLG-KOHNUM
                    END-IF
      *
                  END-PERFORM
      *
                  IF FLG-KOHNUM = 1 
                     MOVE  MF100-TAHOFTNJANUM(1:2)
                                             TO SUM-KOHNUM(IDX6 IDX7)
                     ADD 1                   TO SUM-KKENSU(IDX6 IDX7)
                     ADD   MF100-TAHOTEN
                                             TO SUM-KTENSU(IDX6 IDX7)
      *              IF  MF100-KESEFLG  NOT = 1
                       ADD MF100-TAHOFTN     
                                             TO SUM-KFTNKG(IDX6 IDX7)
      *              END-IF
                  ELSE
                     ADD 1                   TO IDX7
                     MOVE  MF100-TAHOFTNJANUM(1:2)
                                             TO SUM-KOHNUM(IDX6 IDX7)
                     MOVE  1                 TO SUM-KKENSU(IDX6 IDX7)
                     MOVE  MF100-TAHOTEN
                                             TO SUM-KTENSU(IDX6 IDX7)
      *              IF  MF100-KESEFLG  NOT = 1
                       MOVE MF100-TAHOFTN
                                             TO SUM-KFTNKG(IDX6 IDX7)
      *              END-IF
                  END-IF
                END-IF

      *    一時ファイル読込
      *
                 PERFORM  900-TMP-READ-SEC
      *
               END-PERFORM
      *
             ADD  1                       TO  IDX6
      *
               IF    FLG-PRINT             =  1
               OR    KEY-N-FTNJANUM  NOT  =  KEY-O-FTNJANUM
                  ADD     1    TO    IDX5                 
                  MOVE    SUM-KENSU(1)   TO  SUM-GKENSU(1 IDX5)
                  MOVE    SUM-NISSU(1)   TO  SUM-GNISSU(1 IDX5)
                  MOVE    SUM-TENSU(1)   TO  SUM-GTENSU(1 IDX5)
                  MOVE    SUM-TYO  (1)   TO  SUM-GTYO  (1 IDX5)
                  MOVE    SUM-KENSU(2)   TO  SUM-GKENSU(2 IDX5)
                  MOVE    SUM-NISSU(2)   TO  SUM-GNISSU(2 IDX5)
                  MOVE    SUM-TENSU(2)   TO  SUM-GTENSU(2 IDX5)
                  MOVE    SUM-TYO  (2)   TO  SUM-GTYO  (2 IDX5)
      *
                  INITIALIZE  SUM-AREA 
      *
               END-IF
      *
           END-PERFORM
      *
           CLOSE    MF100-FILE
      ****2006/03/17 @@@@-BRAND END
      *


           OPEN     INPUT       MF100-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      ****2006/03/17 @@@@-BRAND START
      *    MOVE  KEY-NEW    TO  KEY-OLD
           IF IDX4 = 0        OR
              KEY-NEW         NOT  =  KEY-OLD
              ADD  1             TO  IDX4
              MOVE 1             TO  FLG-IDX4
           ELSE
              MOVE 0             TO  FLG-IDX4
           END-IF
      ****2006/03/17 @@@@-BRAND END
      *
      *    帳票編集<見出し>処理
             PERFORM 310-HEAD-HEN-SEC
      *
      *    帳票編集<明細>処理
             PERFORM 320-BODY-HEN-SEC
      *
      *    帳票編集<小計>処理
      ****2006/03/17 @@@@-BRAND START
             IF FLG-IDX4 = 1 
               ADD 1            TO   IDX10
               PERFORM 325-SYOKEI-HEN-SEC
             END-IF
      ****2006/03/17 @@@@-BRAND END
      *
      *    帳票印刷処理
             PERFORM 330-PRINT-OUT-SEC
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
       310-HEAD-HEN-SEC  SECTION.
      *
           ADD   1     TO  CNT-PAGE
      *
           INITIALIZE  SC03
      *
      *    印刷日付
           MOVE  WRK-DENPPRTYMWH(1:16)  TO  SC03-PRTYM
      *
      *    公費負担者番号
           MOVE  MF100-FTNJANUM (5:)    TO  WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE  WRK-OUT-INPUT          TO  SC03-KOHFTNJANUM
      *
      *    市町村名・市町村番号
           DISPLAY "負担者番号=" MF100-FTNJANUM
           MOVE  MF100-FTNJANUM (3:5) TO      WRK-HKNJANUM
           PERFORM  920-HKNJAINF-SET-SEC
           IF       FLG-HKNJAINF        =   ZERO
                    MOVE    HKNJA-HKNJANAME
                                        TO  SC03-TOWNNAME
                    DISPLAY "保険者名取得成功"
           ELSE
                    MOVE    "該当無し"  TO  SC03-TOWNNAME
           END-IF
           MOVE    HKNJA-HKNJANUM(3:4)     TO  WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT           TO  SC03-TOWNNUM
      *
      *    請求日付
           MOVE  WRK-SYSYMDWH  TO  SC03-SEIYMD
      *
      *    医療機関コード
      *=== 医療機関コードはHOSPCDを使用 by Yoshikawa(2015/07/06) start
      *     MOVE  SYS-1001-HOSPCDN   TO  SC03-HOSPCD
           MOVE    SYS-1001-HOSPCD         TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT           TO  SC03-HOSPCD
      *=== 医療機関コードはHOSPCDを使用 by Yoshikawa(2015/07/06) end
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    住所
      *     MOVE  SYS-1002-ADRS  TO  SC03-ADRS
      *
      *    医療機関名
      *     MOVE  SYS-1001-HOSPNAME  TO  SC03-HOSPNAME
      *    住所
           MOVE  WRK-HOSPADRS          TO  SC03-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) start
           INSPECT SC03-ADRS           REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) end
      *
      *    医療機関名
           MOVE  WRK-HOSPNAME          TO  SC03-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) start
           INSPECT SC03-HOSPNAME       REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/11) end
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    管理者名
      *    MOVE  SYS-1001-KANRINAME    TO  SC03-KANRINAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) start
      *     MOVE  SYS-1001-KAISETUNAME  TO  SC03-KANRINAME
           MOVE    WRK-KAISETUNAME     TO  SC03-KANRINAME
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) end
      ****2006/03/17 @@@@-BRAND START
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  SYS-1002-TEL          TO  WRK-MAE-INPUT 
           MOVE  WRK-HOSPTEL           TO  WRK-MAE-INPUT 
      *---(01.00.04) LINE ADD END   ------------------------------------
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT       TO  SC03-TEL
      ****2006/03/17 @@@@-BRAND END
      *
      *    点数表
           MOVE  "  "  TO  SC03-TENHYOKBN1
           MOVE  "  "  TO  SC03-TENHYOKBN2
           MOVE  "  "  TO  SC03-TENHYOKBN3
           EVALUATE TRUE
             WHEN SYS-1001-TENHYOKBN = "1"
               MOVE  "○"  TO  SC03-TENHYOKBN1
             WHEN SYS-1001-TENHYOKBN = "3"
               MOVE  "○"  TO  SC03-TENHYOKBN2
             WHEN SYS-1001-TENHYOKBN = "4"
               MOVE  "○"  TO  SC03-TENHYOKBN3
           END-EVALUATE
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC  SECTION.
      *
           INITIALIZE  SUM-SYOKEI
      ****2006/03/17  @@@@-BRAND  START
           INITIALIZE  SUM-AREA
           MOVE    KEY-NEW     TO  KEY-OLD
      *
           PERFORM VARYING IDX1 FROM    1   BY  1
      *            UNTIL   IDX1 >       20
                   UNTIL   IDX1 >       14
                   OR      KEY-NEW     NOT =   KEY-OLD
                   OR      FLG-PRINT       =   1
      *
      ****2006/01/17  @@@@-BRAND  START
             IF  MF100-TAHO     =   1    AND
      *          IDX1           >=  19
                 IDX1           >   14
               DISPLAY "公費併用による改ページ"
               DISPLAY  "IDX1 = "  IDX1
               DISPLAY  "MF100-PTNUM = "  MF100-PTNUM
             ELSE
      ****2006/01/17  @@@@-BRAND  END
      ****2006/03/17  @@@@-BRAND  END
      *
      *    受給資格証記号番号（受給者番号）
               MOVE  MF100-KOHJKYSNUM  TO  SC03-JKYSNUM (IDX1)
      *
      *    氏名
               MOVE  MF100-NAME        TO  SC03-NAME (IDX1)
      *
      *    保険者番号
               MOVE  MF100-HKNJANUM    TO  SC03-HKNJANUM (IDX1)
      *
      *    被保険者証記号番号
               STRING  MF100-KIGO  DELIMITED  BY  SPACE
                       MF100-NUM   DELIMITED  BY  SPACE
                       INTO       SC03-KIGONUM (IDX1)
               END-STRING
      *
      *    生年月日
               MOVE    MF100-BIRTHDAY  TO  WRK-SYMD
               PERFORM 31012-SEIWA-HEN-SEC
      *
               MOVE  WRK-HENYMDG1       TO  SC03-BIRTHDAY(IDX1)
      *
      *    診療年月
      *=== 診療年月の変更 by Yoshikawa(2015/07/13) start
      *****2006/01/17  @@@@-BRAND START
      *         MOVE  WRK-SRYYM (2:2)   TO  SC03-SRYYM (IDX1)(1:2)
      *         MOVE  WRK-SRYYM (5:2)   TO  SC03-SRYYM (IDX1)(3:2)
      *****2006/04/10 @@@@-BRAND START
      *          IF  WRK-SRYYM(5:1)  =  SPACE
      **          MOVE "0" TO  SC03-SRYYM (IDX1) (3:)
      *           MOVE "0" TO  SC03-SRYYM (IDX1) (3:1)
      *          END-IF
      *****2006/04/10 @@@@-BRAND END
      *          MOVE  WRK-SRYYM(6:1)  TO  SC03-SRYYM (IDX1)(4:)
               MOVE    MF100-SRYYM       TO  WRK-SYMD(1:6)
               MOVE    "01"              TO  WRK-SYMD(7:2)
               PERFORM 31012-SEIWA-HEN-SEC
               MOVE    WRK-HENYMDG1(2:2) TO  SC03-SRYYM (IDX1)(1:2)
               MOVE    WRK-HENYMDG1(5:2) TO  SC03-SRYYM (IDX1)(3:2)
               IF  WRK-HENYMDG1(2:1)  =  SPACE
                   MOVE    "0"           TO  SC03-SRYYM (IDX1)(1:1)
               END-IF
               IF  WRK-HENYMDG1(5:1)  =  SPACE
                   MOVE    "0"           TO  SC03-SRYYM (IDX1)(3:1)
               END-IF
      *=== 診療年月の変更 by Yoshikawa(2015/07/13) end
      *
      *    入外区分
      *       MOVE  MF100-NYUGAIKBN  TO  SC03-NYUGAIKBN (IDX1)
               MOVE    MF100-RECESYUBETU (4:1)
                                         TO  SC03-NYUGAIKBN (IDX1)
      ****2006/03/17 @@@@-BRAND  START
      *    長期療養 
      *---(01.00.04) LINE ADD START ------------------------------------
      *         IF  MF100-TYOKI = 1
               IF  MF100-TYOKI = 1 OR 2
      *---(01.00.04) LINE ADD END   ------------------------------------
                 MOVE  "02"  TO  SC03-TYOKI (IDX1)
               ELSE
                 MOVE  "  "  TO  SC03-TYOKI (IDX1)
               END-IF
      ****2006/03/17  @@@@-BRAND END
      ****2006/01/17  @@@@-BRAND END
      *
      *    給付割合
               EVALUATE  MF100-KYURATE(2:1)
                 WHEN  1
      ****2006/01/17  @@@@-BRAND START
      *             MOVE  9  TO  SC03-KYUFURATE (IDX1)
                   MOVE "9" TO  SC03-KYUFURATE (IDX1)
                 WHEN  2
      *             MOVE  8  TO  SC03-KYUFURATE (IDX1)
                   MOVE "8" TO  SC03-KYUFURATE (IDX1)
                 WHEN  3
      *             MOVE  7  TO  SC03-KYUFURATE (IDX1)
                   MOVE "7" TO  SC03-KYUFURATE (IDX1)
      ****2006/01/17  @@@@-BRAND END
               END-EVALUATE
      *
      ****2006/01/17  @@@@-BRAND START
      *    日数
      *         MOVE  MF100-JNISSU   TO  WRK-NISSUX
      *         MOVE  WRK-NISSUX  TO  SC03-NISSU (IDX1)
               MOVE  MF100-JNISSU   TO  WRK-Z2
               MOVE  WRK-Z2     TO  SC03-NISSU (IDX1)
      *
      ****2006/01/17  @@@@-BRAND START
      *    点数
      *        MOVE  MF100-TOTALTEN  TO  WRK-TENSUX
      *        MOVE  WRK-TENSUX      TO  SC03-TENSU  (IDX1)
      *
      *    控除額
      *        MOVE  MF100-KOUJO     TO  WRK-KOUJOX
      *        MOVE  WRK-KOUJOX      TO  SC03-KOUJO (IDX1)
      *
               IF  MF100-TAHO     NOT =    1  
      *    点数
                 MOVE  MF100-TOTALTEN  TO  WRK-Z7
                 MOVE  WRK-Z7          TO  SC03-TENSU  (IDX1)
      *    控除額
                 MOVE  MF100-FTNMONEY  TO  WRK-Z7
                 MOVE  WRK-Z7          TO  SC03-KOUJO (IDX1)
               ELSE
      *１段目
                 MOVE  MF100-TOTALTEN  TO  WRK-Z7
                 MOVE  WRK-Z7          TO  SC03-TENSU  (IDX1)
      *２段目
      ****2006/03/17 @@@@-BRAND START
      *          ADD   1                   TO  IDX1
      *          MOVE  MF100-TAHOFTNJANUM  TO  SC03-HKNJANUM (IDX1)
                 MOVE  MF100-TAHOFTNJANUM  TO  SC03-KOH1FTNJANUM(IDX1)
                 MOVE  MF100-TAHOJKYJANUM  TO  SC03-KOH1JKYJANUM(IDX1)
      ****2006/03/17 @@@@-BRAND END
                 MOVE  MF100-TAHOTEN   TO  WRK-Z7
      ****2006/03/17 @@@@-BRAND START
      *          MOVE  WRK-Z7          TO  SC03-TENSU  (IDX1)
                 MOVE  WRK-Z7          TO  SC03-KOH1TEN  (IDX1)
      ****2006/03/17 @@@@-BRAND END
      ****2006/04/06 @@@@-BRAND START
      *           IF  MF100-KESEFLG  NOT = 1
      ****2006/04/06 @@@@-BRAND END
                   MOVE  MF100-TAHOFTN    TO  WRK-Z7
      ****2006/03/17 @@@@-BRAND START
      *            MOVE  WRK-Z7           TO  SC03-KOUJO (IDX1)
                   MOVE  WRK-Z7           TO  SC03-KOH1FTNKG (IDX1)
      ****2006/03/17 @@@@-BRAND END
      ****2006/04/06 @@@@-BRAND START
      *           END-IF
      ****2006/04/06 @@@@-BRAND END
      *３段目
      ****2006/03/17 @@@@-BRAND START
      *          ADD   1               TO  IDX1
      ****2006/03/17 @@@@-BRAND END
                 COMPUTE  WRK-SASITENSU =
                          MF100-TOTALTEN - MF100-TAHOTEN
                 MOVE  WRK-SASITENSU   TO  WRK-Z7
      ****2006/03/17 @@@@-BRAND START
      *          MOVE  WRK-Z7          TO  SC03-TENSU  (IDX1)
                 MOVE  WRK-Z7          TO  SC03-NYUYOJITEN  (IDX1) 
      ****2006/03/17 @@@@-BRAND END
                 MOVE  MF100-FTNMONEY  TO  WRK-Z7
                 MOVE  WRK-Z7          TO  SC03-KOUJO (IDX1)
      *
               END-IF
      *
      ****2006/03/17 @@@@-BRAND START
      ****2006/01/17  @@@@-BRAND END
      *
      *    合計小計
      *    件数
      *         IF  MF100-NYUGAIKBN = 1
      *             IF  MF100-KYURATE(2:1) = 2
      *                 MOVE  1  TO  IDX
      *             ELSE
      *                 MOVE  2  TO  IDX
      *             END-IF
      *         ELSE
      *             IF  MF100-KYURATE(2:1) = 2
      *                 MOVE  3  TO  IDX
      *             ELSE
      *                 MOVE  4  TO  IDX
      *             END-IF
      *         END-IF
      *         ADD  1  TO  SUM-KENSU (IDX)
      *         ADD  MF100-JNISSU    TO  SUM-NISSU (IDX)
      *         ADD  MF100-TOTALTEN  TO  SUM-TENSU (IDX)
      *         ADD  MF100-FTNMONEY  TO  SUM-KOUJO (IDX)
      ****2006/01/17  @@@@-BRAND  START
      *         IF  MF100-TAHO  =  1
      *           ADD  MF100-TAHOTEN    TO  SUM-TENSU (IDX)
      *           ADD  WRK-SASITENSU    TO  SUM-TENSU (IDX)
      *           IF  MF100-KESEFLG  NOT = 1
      *             ADD  MF100-TAHOFTN    TO  SUM-KOUJO (IDX)
      *           END-IF
      *         END-IF
      ****2006/01/17  @@@@-BRAND  END  
      ****2006/03/17  @@@@-BRAND  END
      *
      *    一時ファイル読込
                 PERFORM  900-TMP-READ-SEC
      ****2006/01/17  @@@@-BRAND  START
             END-IF
      ****2006/01/17  @@@@-BRAND  END  
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *              帳票編集<小計>処理
      *****************************************************************
       325-SYOKEI-HEN-SEC  SECTION.
      *
      *    件数・日数・点数・控除額
      ****2006/03/17  @@@@-BRAND  START
           PERFORM VARYING IDX FROM    1   BY  1
      *            UNTIL   IDX > 4
                   UNTIL   IDX > 2
      ****2006/01/17  @@@@-BRAND  START
      *         MOVE  SUM-KENSU (IDX)  TO  WRK-SKENSUX
      *         MOVE  WRK-SKENSUX      TO  SC03-KENSU (IDX)
      *         MOVE  SUM-NISSU (IDX)  TO  WRK-SNISSUX
      *         MOVE  WRK-SNISSUX      TO  SC03-GNISSU (IDX)
      *         MOVE  SUM-TENSU (IDX)  TO  WRK-STENSUX
      *         MOVE  WRK-STENSUX      TO  SC03-GTENSU (IDX)
      *         MOVE  SUM-KOUJO (IDX)  TO  WRK-SKOUJOX
      *         MOVE  WRK-SKOUJOX      TO  SC03-GKOUJO (IDX)
      *         ADD   SUM-KENSU (IDX)  TO  SUM-SKENSU
      *        MOVE  SUM-KENSU (IDX)  TO  WRK-ZERO5
      *        MOVE  WRK-ZERO5        TO  SC03-KENSU (IDX)
      *        MOVE  SUM-NISSU (IDX)  TO  WRK-ZERO5
      *        MOVE  WRK-ZERO5        TO  SC03-GNISSU (IDX)
      *        MOVE  SUM-TENSU (IDX)  TO  WRK-ZERO9
      *        MOVE  WRK-ZERO9        TO  SC03-GTENSU (IDX)
      *        MOVE  SUM-KOUJO (IDX)  TO  WRK-ZERO9
      *        MOVE  WRK-ZERO9      TO  SC03-GKOUJO (IDX)
      *        ADD   SUM-KENSU (IDX)  TO  SUM-SKENSU
      *                                
               MOVE  SUM-GKENSU (IDX IDX4)  TO  WRK-ZERO5
               MOVE  WRK-ZERO5        TO  SC03-KENSU (IDX)
               MOVE  SUM-GNISSU (IDX IDX4)  TO  WRK-ZERO5
               MOVE  WRK-ZERO5        TO  SC03-GNISSU (IDX)
               MOVE  SUM-GTENSU (IDX IDX4)  TO  WRK-ZERO9
               MOVE  WRK-ZERO9        TO  SC03-GTENSU (IDX)
               MOVE  SUM-GTYO   (IDX IDX4)  TO  WRK-Z2
               MOVE  WRK-Z2        TO  SC03-GTYO   (IDX)
      *         MOVE  SUM-KOUJO (IDX IDX4)  TO  WRK-ZERO9
      *         MOVE  WRK-ZERO9      TO  SC03-GKOUJO (IDX)
           END-PERFORM
      *
      *     MOVE  SUM-SKENSU  TO  WRK-GKENSUX
      *     MOVE  WRK-GKENSUX TO  SC03-GKENSU
      *    MOVE  SUM-SKENSU  TO  WRK-ZERO5
      *    MOVE  WRK-ZERO5   TO  SC03-GKENSU
      *    "90" 集計
           MOVE  SUM-GKOHNUM(IDX10)          TO  SC03-GKOHNUM
           MOVE  SUM-GKKENSU(IDX10)          TO  WRK-Z4
           MOVE  WRK-Z4                      TO  SC03-GKKENSU
           MOVE  SUM-GKTENSU(IDX10)          TO  WRK-Z9
           MOVE  WRK-Z9                      TO  SC03-GKTENSU
           MOVE  SUM-GKFTNKG(IDX10)          TO  WRK-Z9
           MOVE  WRK-Z9                      TO  SC03-GKFTNKG
      *
      *    公費再掲
           PERFORM VARYING IDX FROM    1   BY  1
                   UNTIL   IDX > 3
               MOVE  SUM-KOHNUM(IDX10 IDX)   TO  SC03-KOHNUM(IDX)
               MOVE  SUM-KKENSU(IDX10 IDX)   TO  WRK-Z4
               MOVE  WRK-Z4                  TO  SC03-KKENSU(IDX)
               MOVE  SUM-KTENSU(IDX10 IDX)   TO  WRK-Z9
               MOVE  WRK-Z9                  TO  SC03-KTENSU(IDX)
               MOVE  SUM-KFTNKG(IDX10 IDX)   TO  WRK-Z9
               MOVE  WRK-Z9                  TO  SC03-KFTNKG(IDX)
           END-PERFORM
      ****2006/01/17  @@@@-BRAND END
      ****2006/03/17  @@@@-BRAND END
      *
           .
       325-SYOKEI-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC  SECTION.
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
           MOVE   "SC3203.red"             TO  SPRT-PRTID
           MOVE    "乳幼児医療費請求書"
                                       TO  SPRT-TITLE
           MOVE    SC03                TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by Monma(2017/11/01) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by Monma(2017/11/01) end
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.04) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "帳票ＤＢに更新できませんでした"
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
           MOVE  LNK-DAY2-EDTYMD3  TO  WRK-HENYMDG
           MOVE  LNK-DAY2-EDTYMD1  TO  WRK-HENYMDG1
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "　"
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
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
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      *****************************************************************
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
      ****2006/01/17  @@@@-BRAND  START
      *    EVALUATE TRUE
      *      WHEN  SYU-KOH1HKNNUM = "190" OR "290"
      *        MOVE  SYU-KOH1COMPFTN  TO  WRK-KOUJO
      *      WHEN  SYU-KOH2HKNNUM = "190" OR "290"
      *        MOVE  SYU-KOH2COMPFTN  TO  WRK-KOUJO
      *      WHEN  SYU-KOH3HKNNUM = "190" OR "290"
      *        MOVE  SYU-KOH3COMPFTN  TO  WRK-KOUJO
      *      WHEN  SYU-KOH4HKNNUM = "190" OR "290"
      *        MOVE  SYU-KOH4COMPFTN  TO  WRK-KOUJO
      *    END-EVALUATE
      *
           MOVE  ZERO            TO  WRK-TAHOFTN
      *
           PERFORM VARYING IDX FROM    1   BY  1
                   UNTIL   IDX >       4   OR
                   SYU-KOH-HKNNUM(IDX) =   SPACE
               IF  SYU-KOH-HKNNUM(IDX)(1:1)    =   "0" AND
                   SYU-KOH-HKNNUM(IDX)     NOT =   "027"
                   MOVE    1       TO      MF100-TAHO
      *
                   MOVE     SYU-KOH-HKNNUM(IDX)  TO  WRK-TAHOKOHNUM
                   PERFORM  930-PTKOHINF-SET-SEC
                   MOVE     WRK-ETC-FTNJANUM     TO  MF100-TAHOFTNJANUM
      *
      ****2006/03/17 @@@@-BRAND START
                   MOVE     WRK-ETC-JKYJANUM     TO  MF100-TAHOJKYJANUM
      ****2006/03/17 @@@@-BRAND END
      *
                   ADD    SYU-TOTAL-HKNTEN   TO  MF100-TAHOTEN
                   MOVE   SYU-KOH-COMPFTN(IDX)
                                           TO  WRK-TAHOFTN
      *
                   DIVIDE   WRK-TAHOFTN   BY  10
                            GIVING             WRK-KEISAN
                            REMAINDER          WRK-AMARI
                   COMPUTE  WRK-TAHOFTN    =  WRK-TAHOFTN
                                       -  WRK-AMARI
                   IF  WRK-AMARI     >=     5
                     ADD    10             TO  WRK-TAHOFTN
                   END-IF
      *
                   IF    SYU-KOH-HKNNUM(IDX)  =  "010" OR "021"
                       MOVE  1           TO  MF100-KESEFLG
                   END-IF
               END-IF
      *
               IF  SYU-KOH-HKNNUM(IDX)         =   "972"
                   MOVE    1       TO      MF100-TYOKI
               END-IF
      *---(01.00.04) LINE ADD START ------------------------------------
      *        長期上位
               IF  SYU-KOH-HKNNUM(IDX)         =   "974"
                   MOVE    2       TO      MF100-TYOKI
               END-IF
      *---(01.00.04) LINE ADD START ------------------------------------
      *
      *=== 公費の助成なしは印字しない by Yoshikawa(21015/07/06) start
      *    計算負担金に差がある場合、地方公費の助成があったと判断する
               IF  FLG-ERR                  =  1    AND
                   SYU-KOH-HKNNUM(IDX)      =  WRK-KOHNUM
                 IF     IDX                 =  1
                   IF  SYU-SYUCOMPFTN-ENTANI
                                        >  SYU-KOH-COMPFTN-ENTANI(IDX)
                     MOVE     ZERO         TO  FLG-ERR
                   END-IF
                 ELSE
                   IF  SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                        >  SYU-KOH-COMPFTN-ENTANI(IDX)
                     MOVE     ZERO         TO  FLG-ERR
                   END-IF
                 END-IF
               END-IF
      *=== 公費の助成なしは印字しない by Yoshikawa(21015/07/06) end
      *
           END-PERFORM
      *
           ADD     WRK-TAHOFTN        TO  MF100-TAHOFTN
      *
      ****2006/01/17  @@@@-BRAND  END
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE  RECE02-HOSPID      TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"           USING
      *                                MCPAREA
      *                                MCPDATA-REC
             MOVE    "tbl_syunou"     TO  MCP-TABLE
             MOVE    WRK-PATH         TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"      USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH         TO  MCP-PATH
               MOVE    "tbl_syunou"   TO  MCP-TABLE
               MOVE    WRK-PATH       TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH        TO  MCP-PATH
                 MOVE    "tbl_syunou"   TO  MCP-TABLE
                 MOVE    WRK-PATH       TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"     USING
      *                          MCPAREA
      *                          MCPDATA-REC
             MOVE    "tbl_syunou"       TO  MCP-TABLE
             MOVE    WRK-PATH           TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"        USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"    USING
                                MCPAREA
                                MCPDATA-REC
                                SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *    終了　　処理
      *****************************************************************
       300-END-SEC   SECTION.
      *
      *
           CLOSE  MF100-FILE
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU3203 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU3203 OUT "  CNT-MF100
           DISPLAY "*** SEIKYU3203 END ***"
      *
           IF  CNT-MF100  =  0
             DISPLAY "DATA NOT FOUND. PRINT JOB CANCEL!!"
           END-IF
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC  SECTION.
      *
           READ  MF100-FILE  NEXT
             AT  END
               MOVE  HIGH-VALUE  TO  KEY-NEW
               MOVE  1  TO  FLG-PRINT
             NOT AT  END
               ADD   1                     TO  CNT-MF100
               MOVE  MF100-FTNJANUM (5:3)  TO  KEY-N-FTNJANUM
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    WRK-PARA-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"            TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
               PERFORM 900-KOHSKY-CLOSE-SEC
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
           MOVE    "DBFETCH"             TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      ****2006/01/17  @@@@-BRAND  START
      *         IF  RECE02-KOHNUM(1) = "190" OR "290"
      *          OR RECE02-KOHNUM(2) = "190" OR "290"
      *          OR RECE02-KOHNUM(3) = "190" OR "290"
      *          OR RECE02-KOHNUM(4) = "190" OR "290"
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) start
      *         IF  RECE02-KOHNUM(1) = "190" OR "290" OR "390"
      *          OR RECE02-KOHNUM(2) = "190" OR "290" OR "390"
      *          OR RECE02-KOHNUM(3) = "190" OR "290" OR "390"
      *          OR RECE02-KOHNUM(4) = "190" OR "290" OR "390"
               INITIALIZE                          TBL-HIKAKU-KOHI
               MOVE    RECE02-KOHNUM(1)        TO  TBL-HKOHNUM(1)
               MOVE    RECE02-KOHNUM(2)        TO  TBL-HKOHNUM(2)
               MOVE    RECE02-KOHNUM(3)        TO  TBL-HKOHNUM(3)
               MOVE    RECE02-KOHNUM(4)        TO  TBL-HKOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
                   IF      WRK-PARA-STSRYYM    =   "999999"
                       CONTINUE
                   ELSE
                       IF  ( RECE02-SRYYM      <   WRK-PARA-STSRYYM )
                       OR  ( RECE02-SRYYM      >   WRK-PARA-EDSRYYM )
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/09/19) end
      ****2006/01/17  @@@@-BRAND  END
      *    テスト患者のときは読み飛ばす
                   MOVE    SPACE               TO  PTINF-REC
                   INITIALIZE                      PTINF-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *             MOVE    RECE02-HOSPID       TO  PTINF-HOSPID
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
                   MOVE    RECE02-PTID         TO  PTINF-PTID
                   MOVE    PTINF-REC           TO  MCPDATA-REC
                   PERFORM 800-PTINF-READ-SEC
                   IF      FLG-PTINF           =   ZERO
                   AND     PTINF-TSTPTNUMKBN   =   "1"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF   
      * 
      *        個別発行で患者番号指定の場合、対象判定を行う
                   MOVE  ZERO                TO  FLG-ERR
                   IF      WRK-PARA-SYORIFLG   =   "1"
                   AND     FLG-SYORI           =    2
                     MOVE  1                   TO  FLG-ERR
                     PERFORM VARYING IDXX    FROM    1   BY  1
                             UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                             OR      TBL-PARA-PTID(IDXX) =   ZERO
                         IF      RECE02-PTID =   TBL-PARA-PTID(IDXX)
                           MOVE    ZERO                TO  FLG-ERR
                           MOVE    WRK-CONS-PARA-MAX   TO  IDXX
                         END-IF
                     END-PERFORM 
                   END-IF
      *
                   IF      FLG-ERR           =   1
                     GO  TO  900-KOHSKY-READ-SEC
                   END-IF
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
      *    公費請求書マスタCLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC        SECTION.
      *
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
       900-KOHSKY-CLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
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
           MOVE    "DBCLOSECURSOR"       TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY    TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"            TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
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
      *    公費の負担者番号取得   2006/01/17  INS
      *****************************************************************
       930-PTKOHINF-SET-SEC  SECTION.
      *
           INITIALIZE  PTKOHINF-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID      TO  PTKOH-HOSPID
           MOVE  SPA-HOSPNUM        TO  PTKOH-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  RECE02-PTID        TO  PTKOH-PTID
           MOVE  WRK-TAHOKOHNUM     TO  PTKOH-KOHNUM
      *
           MOVE  PTKOHINF-REC              TO  MCPDATA-REC
           MOVE  "DBSELECT"                TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-PTKOHINF-KEY4    TO  MCP-PATH
      *     CALL  "MCPSUB"           USING
      *                              MCPAREA
      *                              MCPDATA-REC
           MOVE  "tbl_ptkohinf"     TO  MCP-TABLE
           MOVE  "key4"             TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-PTKOHINF-KEY4  TO  MCP-PATH
             MOVE  "tbl_ptkohinf"   TO  MCP-TABLE
             MOVE  "key4"           TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
             PERFORM  935-PTKOHINF-READ-SEC
             PERFORM  UNTIL  FLG-PTKOHINF = 1
               IF  PTKOH-SAKJOKBN  NOT = "1"
                 IF  PTKOH-TEKSTYMD(1:6) <= RECE02-SRYYM(1:6)  AND 
                     PTKOH-TEKEDYMD(1:6) >= RECE02-SRYYM(1:6)
                     MOVE  PTKOH-FTNJANUM  TO  WRK-ETC-FTNJANUM
      ****2006/03/17 @@@@-BRAND START
                     MOVE  PTKOH-JKYSNUM   TO  WRK-ETC-JKYJANUM
      ****2006/03/17 @@@@-BRAND END

                 END-IF
               END-IF
      *---(01.00.04) LINE ADD START ------------------------------------
                 MOVE  "tbl_ptkohinf"   TO  MCP-TABLE
                 MOVE  "key4"           TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
                 PERFORM  935-PTKOHINF-READ-SEC
             END-PERFORM
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-PTKOHINF-KEY4  TO  MCP-PATH
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           MOVE  "tbl_ptkohinf"     TO  MCP-TABLE
           MOVE  "key4"             TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
       930-PTKOHINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費の負担者番号取得   2006/01/17  INS
      *****************************************************************
       935-PTKOHINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *    保険組合せマスター読み込み
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                      HKNCOMBI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    SYU-HOSPID             TO  COMB-HOSPID
           MOVE    SPA-HOSPNUM            TO  COMB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    SYU-PTID               TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM        TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC           TO  MCPDATA-REC
           MOVE    "DBSELECT"             TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"         TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"              TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNCOMBI-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hkncombi"     TO  MCP-TABLE
               MOVE    "key"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"        USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
            MOVE    "tbl_hkncombi"     TO  MCP-TABLE
            MOVE    "key"              TO  MCP-PATHNAME
            CALL    "ORCDBMAIN"        USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID          TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM              TO  HKNJA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM             TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC             TO  MCPDATA-REC
           MOVE  "DBSELECT"               TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2   TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"         TO  MCP-TABLE
           MOVE    "key2"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY2   TO  MCP-PATH
             MOVE    "tbl_hknjainf"       TO  MCP-TABLE
             MOVE    "key2"               TO  MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknjainf"         TO  MCP-TABLE
           MOVE    "key2"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
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
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
      *
      *    国保でない時は、読み直す
             IF    HKNJA-HKNNUM  NOT  =  "060" AND "067"
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE  PATH-TBL-HKNJAINF-KEY2   TO  MCP-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
               GO               TO    925-HKNJAINF-READ-SEC
             END-IF
      *
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
           MOVE  "DBSELECT"               TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_syskanri"         TO  MCP-TABLE
           MOVE    "key10"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"                TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/11/01) end
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
      *=== 医療機関編集情報へ開設者名追加 by Monma (2016/04/09) end
      *
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) start
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
      *=== プログラムオプション対応 by Yoshikawa(2014/05/14) end
      *****************************************************************
      *    パラメタ読込
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  "DBOPEN"   TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBSTART"  TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
       900-DBDISCONNECT-SEC  SECTION.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  "DBCOMMIT"      TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBDISCONNECT"  TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
