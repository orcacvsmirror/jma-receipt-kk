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
       PROGRAM-ID.     SEIKYU1005.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 地方公費
      *  コンポーネント名  : 群馬福祉医療費連記式請求総括表
      *                      (145,245,146,246,143,243)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/25    山口       ORCAのバージョンアップによる(2.5.0)再作成
      *                         (個別発行対応、月途中公費切替え対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    内田    06/10/31    印字順序の変更
      *  01.00.02    内田    06/12/01    印字順序を福祉請求書と同一とする
      *  01.00.03    内田    07/09/19    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.04    内田    07/12/18    社保の上位所得者の場合、高額療養費
      *                                  ４回目以降の請求額は一般の３回目まで
      *                                  の限度額計算をする
      *  01.00.05    内田    08/02/13    社保の上位所得者の場合、高額療養費
      *                                  ４回目以降の請求額の計算は
      *                                  小数点以下四捨五入をする
      *  01.00.06    内田    08/04/30    帳票様式の変更に伴う修正
      *  01.00.07    内田    08/05/07    年齢判定修正
      *  01.00.08    内田    08/06/25    前期高齢者９割（特例措置）は８割で集計
      *  01.00.09    内田    08/08/19    ２割の６歳は７０歳以上の次に印字
      *  01.00.10    内田    09/01/14    SPA-AREA初期化
      *  01.00.11    吉川    09/07/24    帳票様式の変更に伴う修正
      *  01.00.12    吉川    09/08/25    旧負担者番号と新負担者番号が混在すると
      *                                  市町村番号順にならない不具合を修正
      *  01.00.13    吉川    09/08/28    平成20年3月以前の老人保健及び
      *                                  70歳以上1割は旧様式に印字
      *                                  長期上位は長期と同様の処理をする
      *  01.00.14    吉川    10/07/26    特疾負無（091）は「51」と記載
      *                                  点数欄は総点数を印字する
      *                                  「特」欄は限度額に達してない場合は
      *                                  記載しないようにする
      *  01.00.15    吉川    10/08/25    「特」欄の該当公費の上限額に
      *                                  達していない場合でも「特」とする
      *  01.00.16    吉川    10/10/04    請求額の計算方法変更
      *  01.00.17    吉川    11/03/10    open-cobol1.0対応
      *  01.00.18    吉川    11/08/16    点数欄は福祉点数を印字する
      *  01.00.19    吉川    12/03/19    限度額認定証の有無に関わらず
      *                                  高額療養費対象は「特」欄に記載
      *  01.00.20    吉川    12/08/10    高額限度額に達しない場合でも
      *                                  「特」欄に記載される不具合を修正
      *  01.00.21    吉川    12/10/18    特定疾患と957等を持っている場合
      *                                  「特」欄に記載されないのを修正
      *                                  社保前期高齢者１割＋146障害で
      *                                  在宅の場合は、「特」とせずに
      *                                  70歳2割に含めるように修正
      *  01.00.22    吉川    12/12/21    医療機関情報編集対応
      *  01.00.23    吉川    13/01/16    テーブルのprimary key変更対応
      *  01.00.24    吉川    13/04/08    「特」欄対象に024,038,079追加
      *  01.00.25    吉川    13/07/09    全国公費と高額療養費の場合
      *                                  全国公費を「特」とするように修正
      *  01.00.26    吉川    14/10/06    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.27    吉川    15/01/06    平成２７年１月改正対応
      *  01.00.28    萩野    15/10/08    医療機関編集情報への開設者名追加対応
      *  01.00.29    吉川    16/03/10    限度額認定証なしで低所得の場合
      *                                  請求額を35400円で止めるように修正
      *  01.00.30    萩野    16/06/08    対象公費はPGオプションから取得する
      *  01.00.31    吉川    16/07/13    低所得の設定が地方公費のみ対象の場合
      *                                  低所の限度額とならないのを修正
      *  01.00.32    吉川    16/08/12    福祉医療費請求額の端数処理修正
      *  01.00.33    吉川    16/09/05    福祉医療費請求額の修正
      *  01.00.34    萩野    16/09/09    公費の助成がない場合は印字対象外とする
      *  01.00.35    吉川    16/09/21    分点時の福祉医療費請求額修正
      *                                  WRK-SEIKYUGK2の初期化漏れ
      *  01.00.36    吉川    16/10/13    保険＋全国公費＋福祉と保険＋福祉の
      *                                  場合10円単位で記載されるのを修正
      *  01.00.37    吉川    16/10/28    点数欄はレセ総点数を印字する
      *                                  法別11は公費点数欄に印字しない
      *  01.00.38    門間    17/02/06    医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.39    吉川    17/03/10    高額４回目で月途中の市町村変更の場合
      *                                  福祉医療費請求額はそれぞれの市町村で
      *                                  案分計算をするように修正
      *****************************************************************
      *
       ENVIRONMENT    DIVISION.
       CONFIGURATION  SECTION.
       INPUT-OUTPUT   SECTION.
       FILE-CONTROL.
      *
      *    請求書用ファイル
           SELECT  MF100-FILE     ASSIGN    MF100PARA
                                 ORGANIZATION    IS  INDEXED
                                 ACCESS  MODE    IS  DYNAMIC
                                 RECORD  KEY     IS  MF100-KEY
                                 FILE    STATUS  IS  STS-MF100.
      *
      *    群馬保険番号データ
           SELECT  TOWN-FILE     ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-TOWN.
      *
      *    エラーファイル
           SELECT  RECEERR-FILE  ASSIGN  RECEERR
                                 FILE    STATUS  IS  STS-RECEERR.
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *    集計ファイル
       FD  MF100-FILE.
       01  MF100-REC. 
           COPY  "SEI1005.INC".
      *
      *    群馬保険番号データ
       FD  TOWN-FILE.
           COPY  "TOWN1002.INC".
      *
      *    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).

       WORKING-STORAGE  SECTION.
      *
      *    群馬保険番号データ
           COPY  "TOWN1001.INC".
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
      *     03      PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY  "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           COPY  "SC1005.INC".
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
           COPY  "SC1005o.INC".
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-PARA     PIC X(02).
           03  STS-MF100    PIC X(02).
           03  STS-RECE02   PIC X(02).
           03  STS-RECEERR  PIC X(02).
           03  STS-TOWN     PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END       PIC 9(01).
           03  FLG-PRINT     PIC 9(01).
           03  FLG-SYSKANRI  PIC 9(01).
           03  FLG-HKNCOMBI  PIC 9(01).
           03  FLG-SYUNOU    PIC 9(01).
           03  FLG-HEIYOU    PIC 9(01).
           03  FLG-TYOKI     PIC 9(01).
           03  FLG-PTINF     PIC 9(01).
           03  FLG-GOKEI     PIC 9(01).
           03  FLG-TOWN      PIC 9(01).
           03  FLG-COMBI     PIC 9(01).
           03  FLG-HKNJAINF  PIC 9(01).
           03  FLG-ERR       PIC 9(01).
           03  FLG-BTPARA    PIC 9(01).
           03  FLG-SYORI     PIC 9(01).
      *---(01.00.04) LINE ADD START ------------------------------------
           03  FLG-RECE10    PIC 9(01).
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) start
           03  FLG-PTKOHFTN  PIC 9(01).
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) end
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
           03  FLG-KOGAKU    PIC 9(01).
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) start
           03  FLG-TSYRRK    PIC 9(01).
           03  FLG-TNKRRK    PIC 9(01).
           03  FLG-TEISYO    PIC 9(01).
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) end
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
           03  FLG-PRGOPTION  PIC 9(01).
           03  FLG-OK         PIC 9(01).
           03  FLG-TAISYO     PIC 9(01).
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
           03  FLG-KOGAKU4    PIC 9(01).
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
           03  FLG-ZENKOHI    PIC 9(01).
           03  FLG-SYUNOU2    PIC 9(01).
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX            PIC 9(04).
           03  IDXX           PIC 9(04).
           03  IDX1           PIC 9(04).
           03  IDX2           PIC 9(04).
           03  IDX3           PIC 9(04).
           03  IDY            PIC 9(04).
           03  IDZ            PIC 9(04).
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR            PIC X(200).
           03  WRK-Z3                 PIC  ZZZ.
           03  WRK-Z6                 PIC  ZZ,ZZ9.
           03  WRK-Z7                 PIC  ZZZ,ZZ9.
           03  WRK-Z9                 PIC  Z,ZZZ,ZZ9.
           03  WRK-Z10                PIC  ZZ,ZZZ,ZZ9.
           03  WRK-SRYYMWH            PIC X(16).
           03  WRK-SEIYMDWH           PIC X(22).
           03  WRK-SYMD.
               05  WRK-SYY            PIC 9(04).
               05  WRK-SMM            PIC 9(02).
               05  WRK-SDD            PIC 9(02).
           03  WRK-LASTYMD            PIC 9(08).
           03  WRK-HENYMDG            PIC X(22).
           03  WRK-KOHNUM             PIC X(03).
           03  WRK-KOHID              PIC 9(10).
           03  WRK-SEIKYUGK-G         PIC 9(08)V9(01).
           03  WRK-SEIKYUGK-G2        PIC 9(08).
           03  WRK-SEIKYUGK           PIC 9(08)V9(01).
           03  WRK-HKNJANUM           PIC X(06).
           03  WRK-HKNJANAME          PIC X(20).
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) start
           03  WRK-KOHINF  OCCURS 4.
               05  WRK-H-KOHNUM       PIC X(03).
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) end
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) start
           03  WRK-JGNGAK             PIC 9(08).
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) end
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
           03  WRK-SEIKYUGK2-G        PIC 9(08)V9(01).
           03  WRK-SEIKYUGK2-G2       PIC 9(08).
           03  WRK-SEIKYUGK2          PIC 9(08)V9(01).
           03  WRK-KOHFTNMONEY        PIC 9(08).
           03  WRK-GAIJGNGAK          PIC 9(08).
           03  WRK-NYUJGNGAK          PIC 9(08).
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *    パラメータファイル名
           03  FILE-NAME        PIC X(512).
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER            PIC S9(09)  BINARY.
      *         05  FILLER            PIC S9(09)  BINARY.
      *         05  FILLER            PIC S9(09)  BINARY.
           03  WRK-PATH              PIC  X(50).
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
           03  WRK-PATH2             PIC  X(50).
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
           03  WRK-CHK-KOHNUM-TBL.
               05  WRK-CHK-KOHNUM    PIC X(03)  OCCURS 4.
      *    対象公費
           03  WRK-TAISYO-KOHNUM     PIC X(03)  OCCURS 100.
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
      *    ファイル名
       01  DATA-FILE.
           03  FILLER       PIC X(05)  VALUE  "data/".
           03  FILLER       PIC X(12)  VALUE  "TOWN1001.TXT".
      *
      *    集計用エリア
       01  SUM-AREA  VALUE   ZERO.
      *    合計
           03  SUM-GOKEI-TBL.
             05  SUM-GKENSU         PIC  9(10).
             05  SUM-GTENSU         PIC  9(10).
             05  SUM-GFKSGAKU       PIC  9(10).
      *
      *    キー用エリア
       01  KEY-AREA  VALUE   LOW-VALUE.
           03  KEY-NEW.
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
               05  KEY-N-YOUSIKI    PIC  9(01).
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *         05  KEY-N-CITYNUM    PIC  X(02).
               05  KEY-N-CITYNUM    PIC  X(03).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
               05  KEY-N-KBN        PIC  9(01).
               05  KEY-N-WARIAI     PIC  9(01).
               05  KEY-N-COMBIKBN   PIC  X(02).
               05  KEY-N-NYUGAIKBN  PIC  9(01).
           03  KEY-OLD.
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
               05  KEY-O-YOUSIKI    PIC  9(01).
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *         05  KEY-O-CITYNUM    PIC  X(02).
               05  KEY-O-CITYNUM    PIC  X(03).
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
               05  KEY-O-KBN        PIC  9(01).
               05  KEY-O-WARIAI     PIC  9(01).
               05  KEY-O-COMBIKBN   PIC  X(02).
               05  KEY-O-NYUGAIKBN  PIC  9(01).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-RECE02  PIC 9(06).
           03  CNT-MF100   PIC 9(06).
           03  CNT-PAGE    PIC 9(03).
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *    DB参照用
      *---(01.00.03) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.06) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ファイルレイアウト　領域
      *****************************************************************
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    医療機関情報情報
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
      *
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    保険組み合わせ
       01  HKNCOMBI-REC.
           COPY  "CPHKNCOMBI.INC".
      *
      *    収納
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
      *    収納情報
       01  SYUNOU2-REC.
           COPY  "CPSYUNOU.INC"
                 REPLACING  //SYU//
                 BY         //SYU2//.
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    請求管理
           COPY    "CPRCF010.INC".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) start
      *    患者公費負担
       01  PTKOHFTN-REC.
           COPY    "CPPTKOHFTN.INC".
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) end
      *
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) start
      *    低所得情報
       01  TSYRRK-REC.
           COPY    "CPTSYRRK.INC".
      *
      *    低年金情報
       01  TNKRRK-REC.
           COPY    "CPTNKRRK.INC".
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) end
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
      *****************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *   ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".
      *
      *    共通パラメタ
           COPY  "MCPAREA".
      *
      *    日付変換サブ
           COPY  "CPORCSDAY.INC".
           COPY  "CPORCSLNK.INC".
      *
           COPY  "MCPDATA.INC".
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
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
                   UNTIL  FLG-END  =  1
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
      *---(01.00.10) LINE ADD START ------------------------------------
           INITIALIZE  SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
           INITIALIZE  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *---(01.00.03) LINE ADD START ------------------------------------
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
           MOVE    "SEIKYU1005"    TO  JOB-PGID
           MOVE    "福祉医療総括表" 
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
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/06) start
      *     MOVE  "MF100ZZ"        TO  MF100PARA-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)
      *                            TO  MF100PARA-TERMID
      **---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  WRK-PARA-HOSPNUM           TO  MF100PARA-HOSPNUM
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
      *=== ver4.8対応 by Yoshikawa(2014/10/06) end
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  "RECEERR"        TO  RECEERR-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)
      *                            TO  RECEERR-TERMID
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE  LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1001-STYUKYMD(1:6)
      *                             SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-STSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE  "01"          TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-1001-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU1005 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE  LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1002-STYUKYMD(1:6)
      *                             SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-STSRYYM    TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE  "01"          TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-1002-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU1005 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
      *    市町村情報
           PERFORM 110-TOWNINF-GET-SEC
      *
      *    パラメタ編集処理
           PERFORM 1001-PARA-HENSYU-SEC
      *
           PERFORM 900-KOHSKY-START-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SEIKYU1005"              TO  WRK-PRGID
      *
      *    対象公費番号
           MOVE    "TAISYOKOHI"              TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  100
                    OR       WRK-OPTION(IDX)  =  SPACE
             MOVE    WRK-OPTION(IDX)(1:3)    TO  WRK-TAISYO-KOHNUM(IDX)
             DISPLAY "対象公費番号="  WRK-TAISYO-KOHNUM(IDX)
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
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
      *****************************************************************
      *    公費保険番号データ読込
      *****************************************************************
       110-TOWNINF-GET-SEC  SECTION.
      *
      *    ファイルディレクトリ位置指定
           INITIALIZE           ORCSMKPASSAREA
           MOVE  DATA-FILE     TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           OPEN  INPUT  TOWN-FILE
      *
           MOVE  ZERO   TO  FLG-TOWN
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL FLG-TOWN = 1
             READ TOWN-FILE NEXT
               AT END
                 MOVE  1         TO  FLG-TOWN
               NOT AT END
                 MOVE  TOWN-REC  TO  TOWN-TBL(IDX)
             END-READ
           END-PERFORM
      *
           CLOSE TOWN-FILE
           .
       110-TOWNINF-GET-EXT.
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
      *    集計処理
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           PERFORM VARYING IDZ FROM 1 BY 1
                   UNTIL IDZ  >  4
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
      *       IF  RECE02-KOHNUM (IDZ)  =  "145"  OR  "245"  OR
      *                                   "146"  OR  "246"  OR
      *                                   "143"  OR  "243"
             INITIALIZE                            WRK-CHK-KOHNUM-TBL
             MOVE    RECE02-KOHNUM(IDZ)        TO  WRK-CHK-KOHNUM(1)
      *      対象公費番号チェック処理
             PERFORM  800-TAISYOKOHI-CHK-SEC
             IF  FLG-TAISYO  =  1
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
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
      *    TMP-FILE キーセット
      *
           INITIALIZE       MF100-REC
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID        TO  MF100-HOSPID
           MOVE  SPA-HOSPNUM          TO  MF100-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  RECE02-PTNUM         TO  MF100-PTNUM
           MOVE  RECE02-RECEKA        TO  MF100-SRYKA
           MOVE  RECE02-HKNJANUM-KEY  TO  MF100-HKNJANUM-KEY
           MOVE  RECE02-TEKSTYMD      TO  MF100-TEKSTYMD
           MOVE  RECE02-NYUGAIKBN     TO  MF100-NYUGAIKBN
           MOVE  RECE02-KYURATE       TO  MF100-KYURATE-KEY
           MOVE  RECE02-SRYYM         TO  MF100-SRYYM
      *
           MOVE  RECE02-PTID          TO  MF100-PTID
           MOVE  RECE02-NAME          TO  MF100-NAME
           MOVE  RECE02-BIRTHDAY      TO  MF100-BIRTHDAY
           MOVE  RECE02-SEX           TO  MF100-SEX
           MOVE  RECE02-HKN           TO  MF100-HKN
           MOVE  RECE02-RJNHKN        TO  MF100-RJNHKN
      *
           MOVE  RECE02-KOHFTNJANUM (IDZ)  TO  MF100-FTNJANUM
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *                                         MF100-CITYNUM
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
           MOVE  RECE02-KOHJKYSNUM  (IDZ)  TO  MF100-JKYSNUM
           MOVE  RECE02-KOHINF      (IDZ)  TO  MF100-KOHINF
      *
           COMPUTE IDY  =  IDZ  +  1
           MOVE  RECE02-JNISSUINF   (IDY)  TO  MF100-JNISSUINF
           MOVE  RECE02-TOTALTENINF (IDY)  TO  MF100-TOTALTENINF
           MOVE  RECE02-YKZFTNINF   (IDY)  TO  MF100-YKZFTNINF
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) start
      *    請求管理より、保険使用時情報取得
           PERFORM  900-SEIKYU-SELECT-SEC
           MOVE  RECE10-TOTALTEN(1)        TO  MF100-H-TOTALTEN
      *=== 点数欄記載の変更 by Yoshikawa(2016/10/28) start
      *    全国公費点数
           IF  RECE10-KOHNUM(1)  NOT =  SPACE
               MOVE    RECE10-TOTALTEN(2)  TO  MF100-TOTALTEN2
           ELSE
               MOVE    ZERO                TO  MF100-TOTALTEN2
           END-IF
      *=== 点数欄記載の変更 by Yoshikawa(2016/10/28) end
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) start
      *     MOVE  RECE10-KOHINF             TO  WRK-KOHINF
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  4
             MOVE  RECE10-KOHINF(IDX)      TO  WRK-KOHINF(IDX)
           END-PERFORM
      *=== open-cobol1.0対応 by Yoshikawa(2011/03/10) end
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) end
      *
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
      *    １＝旧様式、２＝新様式
           IF  RECE02-RJNHKNNUM  NOT =  SPACE
           OR  (RECE02-SRYYM  <  WRK-CONS-SRYYM-200804  AND
                RECE02-AGE  >=  70  AND
                RECE02-KYURATE  =  "010")
              MOVE  1                     TO  MF100-YOUSIKI
           ELSE
              MOVE  2                     TO  MF100-YOUSIKI
           END-IF
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *
           IF  RECE02-ZAITAKU  =  1
      *=== 前期1割＋146の場合は在としない by Yoshikawa(2012/10/18) start
      *       MOVE  "99"                   TO  MF100-COMBIKBN
      *      前期高齢者1割で障害146の場合は在宅としない
             IF  (MF100-KOHNUM  =  "146")
             AND (RECE02-AGE  >=  70)
             AND (RECE02-KYURATE  NOT =  30)
               CONTINUE
             ELSE
               MOVE  "99"                 TO  MF100-COMBIKBN
             END-IF
      *=== 前期1割＋146の場合は在としない by Yoshikawa(2012/10/18) end
           END-IF
      *
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
           INITIALIZE                         FLG-KOGAKU4
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *
      *=== 高額と全国公費は公費優先 by Yoshikawa(2013/07/09) start
      **=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
      *     IF  RECE02-ZAITAKU  =  "2"  OR  "3"  OR  "4"
      *       MOVE  "98"                    TO  MF100-COMBIKBN
      *     END-IF
      **=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *    特疾＋957等も高額認定されてしまうので、FLG4を判断して回避
           IF  RECE02-FLG(4)  =  ZERO
             IF  RECE02-ZAITAKU  =  "2"  OR  "3"  OR "4"
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) start
                                OR  "5"  OR  "6"
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) end
               MOVE  "98"                TO  MF100-COMBIKBN
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
               IF  RECE02-FTNMONEY (1)  =  24600
               OR  RECE02-FTNMONEY (1)  =  44400
               OR  RECE02-FTNMONEY (1)  =  93000
               OR  RECE02-FTNMONEY (1)  =  140100
                 MOVE    1               TO  FLG-KOGAKU4
               END-IF
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
               EVALUATE  RECE02-ZAITAKU
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) start
      *           WHEN  "2"
      *             IF  RECE02-FTNMONEY(1)  <  83400
      *               MOVE  SPACE         TO  MF100-COMBIKBN
      *             END-IF
      *           WHEN  "3"
      *             IF  RECE02-FTNMONEY(1)  <  44400
      *               MOVE  SPACE         TO  MF100-COMBIKBN
      *             END-IF
      *           WHEN  "4"
      *             IF  RECE02-FTNMONEY(1)  <  24600
      *               MOVE  SPACE         TO  MF100-COMBIKBN
      *             END-IF
                   WHEN  "2"
                     IF  RECE02-FTNMONEY(1)  <  140100
                       MOVE  SPACE       TO  MF100-COMBIKBN
                     END-IF
                   WHEN  "3"
                     IF  RECE02-FTNMONEY(1)  <  93000
                       MOVE  SPACE       TO  MF100-COMBIKBN
                     END-IF
                   WHEN  "4"
                   WHEN  "5"
                     IF  RECE02-FTNMONEY(1)  <  44400
                       MOVE  SPACE       TO  MF100-COMBIKBN
                     END-IF
                   WHEN  "6"
                     IF  RECE02-FTNMONEY(1)  <  24600
                       MOVE  SPACE       TO  MF100-COMBIKBN
                     END-IF
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) end
               END-EVALUATE
             END-IF
           END-IF
      *=== 高額と全国公費は公費優先 by Yoshikawa(2013/07/09) end
      *
           MOVE    MF100-KOHNUM       TO    WRK-KOHNUM
           MOVE    MF100-KOHID        TO    WRK-KOHID
           MOVE    ZERO               TO    WRK-SEIKYUGK-G
                                            FLG-TYOKI
                                            MF100-FUKUSHIGAITEN
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
                                            FLG-KOGAKU
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
                                            FLG-ZENKOHI
                                            WRK-JGNGAK
                                            WRK-SEIKYUGK2-G
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
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
      *=== 公費の助成なしは印字対象外 by hagino(2016/09/09) start
           MOVE    1                  TO  FLG-ERR
      *=== 公費の助成なしは印字対象外 by hagino(2016/09/09) end
           PERFORM  920-SYUNOU-SET-SEC
      *
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) start
      *    収納で取得できなかった全国公費を請求管理から取得
           IF    MF100-COMBIKBN       =     SPACE
              PERFORM  VARYING  IDX1  FROM  1  BY  1
                       UNTIL    IDX1  >     4
                IF  WRK-H-KOHNUM(IDX1)  =  "010" OR "011" OR "020" OR
                                           "021" OR "015" OR "016" OR
                                           "051" OR "091" OR "052"
      *=== 「特」欄の対象公費追加 by Yoshikawa(2013/04/08) start
                                        OR "024" OR "038" OR "079"
      *=== 「特」欄の対象公費追加 by Yoshikawa(2013/04/08) end
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) start
                                        OR "054"
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) end
      *
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
                  MOVE  1                        TO  FLG-ZENKOHI
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
                  MOVE  WRK-H-KOHNUM(IDX1)(2:2)  TO  MF100-COMBIKBN
      *
                  IF  WRK-H-KOHNUM(IDX1)  =  "091"
                    MOVE  "51"                   TO  MF100-COMBIKBN
                  END-IF
      *
                END-IF
              END-PERFORM
           END-IF
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) end
      *=== 請求額の計算方法変更 by Yoshikawa(2010/10/04) start
      *    総点数と公費点数が同じ場合は公費点数は印字しない
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) start
      *     IF  MF100-H-TOTALTEN       =     MF100-TOTALTEN2
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) start
      *     IF  MF100-TOTALTEN         =     MF100-TOTALTEN2
           IF  MF100-H-TOTALTEN       =     MF100-TOTALTEN2
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) end
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) end
           OR  MF100-TOTALTEN2        =     ZERO
             MOVE    ZERO             TO    MF100-TOTALTEN2
           ELSE
      *
      *=== 法別11は公費点数記載対象外 by Yoshikawa(2016/10/28) start
      *       IF  MF100-COMBIKBN  NOT =  "10" AND "11" AND "21"
             IF  MF100-COMBIKBN  NOT =  "10" AND "21"
      *=== 法別11は公費点数記載対象外 by Yoshikawa(2016/10/28) end
               IF  MF100-TOTALTEN  =  MF100-TOTALTEN2
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) start
      *            COMPUTE  WRK-SEIKYUGK-G  =  WRK-SEIKYUGK-G  +
      *                     ( (MF100-H-TOTALTEN  - MF100-TOTALTEN2) *
      *                        MF100-KYURATE  /  10)
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) start
      *            COMPUTE  WRK-SEIKYUGK-G  =  WRK-SEIKYUGK-G  +
      *                     ( (MF100-TOTALTEN  -  MF100-TOTALTEN2) *
      *                        MF100-KYURATE  /  10)
                  COMPUTE  WRK-SEIKYUGK-G  =  WRK-SEIKYUGK-G  +
                           ( (MF100-H-TOTALTEN  -  MF100-TOTALTEN2) *
                              MF100-KYURATE  /  10)
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) end
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) end
               END-IF
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) start
      *         COMPUTE  MF100-TOTALTEN2  =
      *                  MF100-H-TOTALTEN  -  MF100-TOTALTEN2
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) start
      *         COMPUTE  MF100-TOTALTEN2  =
      *                  MF100-TOTALTEN   -  MF100-TOTALTEN2
               COMPUTE  MF100-TOTALTEN2   =
                        MF100-H-TOTALTEN  -  MF100-TOTALTEN2
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) end
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) end
             END-IF
           END-IF
      *=== 請求額の計算方法変更 by Yoshikawa(2010/10/04) end
      *
      *=== 公費は限度額未満でも「特」対象 by Yoshikawa(2010/08/25) start
      **=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) start
      **    公費上限額取得
      *     IF  MF100-COMBIKBN  =  "11" OR "15" OR "16" OR "21" OR "24"
      *                         OR "38" OR "51" OR "52" OR "79"
      *       PERFORM  930-PTKOHFTN-READ-SEC
      *       DISPLAY "入院上限額 ="  PTKOHFTN-NYUJGNGAK
      *       DISPLAY "外来上限額 ="  PTKOHFTN-GAIJGNGAK
      *       IF  MF100-COMBIKBN  =  "11" OR "51" OR "52"
      *         IF  MF100-NYUGAIKBN  =  "1"
      *           MOVE  PTKOHFTN-NYUJGNGAK    TO  WRK-JGNGAK
      *         ELSE
      *           MOVE  PTKOHFTN-GAIJGNGAK    TO  WRK-JGNGAK
      *         END-IF
      *       ELSE
      *           MOVE  PTKOHFTN-GAIJGNGAK    TO  WRK-JGNGAK
      *       END-IF
      **
      **      上限額に満たない場合は「特」としない
      *       IF  WRK-JGNGAK  >  ZERO
      *       AND WRK-JGNGAK  >  WRK-SEIKYUGK-G
      *         MOVE  SPACE                   TO  MF100-COMBIKBN
      *       END-IF
      *     END-IF
      **=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) end
      *=== 公費は限度額未満でも「特」対象 by Yoshikawa(2010/08/25) end
      *
      *    老人＋在宅等で保険に限度額が有る場合の対応
           IF     RECE02-FTNMONEY(1)  >   ZERO     AND
                  RECE02-FTNMONEY(1)  <   WRK-SEIKYUGK-G
             MOVE    RECE02-FTNMONEY(1)   TO  WRK-SEIKYUGK-G
           END-IF
      *
      *    長期
           IF    FLG-TYOKI    =    1  AND
                 WRK-SEIKYUGK-G    >  10000
               MOVE    10000          TO    WRK-SEIKYUGK-G
               MOVE    1              TO    MF100-TYOKI
           END-IF
      *=== 長期上位対応 by Yoshikawa(2009/08/28) start
      *    長期上位
           IF    FLG-TYOKI    =    2  AND
                 WRK-SEIKYUGK-G    >  20000
               MOVE    20000          TO    WRK-SEIKYUGK-G
               MOVE    2              TO    MF100-TYOKI
           END-IF
      *=== 長期上位対応 by Yoshikawa(2009/08/28) end
      *
      *    四捨五入
             DISPLAY "四捨五入前="  WRK-SEIKYUGK-G
             COMPUTE  WRK-SEIKYUGK-G2 ROUNDED  =  WRK-SEIKYUGK-G
             MOVE     WRK-SEIKYUGK-G2    TO    MF100-SEIKYUGK
             DISPLAY "四捨五入後="  MF100-SEIKYUGK
      *---(01.00.04) LINE ADD START ------------------------------------
      *    社保上位所得者、４回目以降の負担金額計算
           IF  RECE02-TEISYUTUSAKI  =  1
           AND RECE02-ZAITAKU  =  2
               IF  MF100-SEIKYUGK  =  83400
      *            総点数取得
                   PERFORM  900-SEIKYU-SELECT-SEC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *             COMPUTE  MF100-SEIKYUGK  =  80100 +
      *                      ( RECE10-TOTALTEN(1) * 10 - 267000 ) / 100
                   COMPUTE  MF100-SEIKYUGK  ROUNDED =  80100 +
                            ( RECE10-TOTALTEN(1) * 10 - 267000 ) / 100
      *---(01.00.05) LINE ADD END   ------------------------------------
               END-IF
           END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           IF    MF100-TOTALTEN   =   MF100-FUKUSHIGAITEN
             MOVE             ZERO    TO    MF100-FUKUSHIGAITEN
           END-IF
      *
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
      *    全国公費を持っている場合、
      *    請求額が上限額を超えているかどうかの確認
           IF  FLG-ZENKOHI  =  1
      *        上限額の取得
               PERFORM  930-PTKOHFTN-READ-SEC
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >  4
                        OR       WRK-KOHINF(IDX2)  =  SPACE
                   EVALUATE  WRK-KOHINF(IDX2)
                     WHEN  "015"
                     WHEN  "016"
                     WHEN  "021"
                     WHEN  "038"
                     WHEN  "052"
                     WHEN  "054"
                       COMPUTE  WRK-JGNGAK  =  WRK-GAIJGNGAK
                                            -  WRK-NYUJGNGAK
                     WHEN  "024"
                     WHEN  "051"
                     WHEN  "079"
                       MOVE    WRK-GAIJGNGAK   TO  WRK-JGNGAK
                     WHEN  OTHER
                       MOVE    ZERO            TO  WRK-JGNGAK
                   END-EVALUATE
               END-PERFORM
      *
      *        収納から全国公費の負担金額を取得
               IF  RECE02-NYUGAIKBN  =  "1"
                   MOVE    "key17"             TO  WRK-PATH2
               ELSE
                   MOVE    "key14"             TO  WRK-PATH2
               END-IF
               PERFORM  940-SYUNOU2-READ-SEC
      *
      *        公費負担金額が全国公費の上限額を超えたら１０円単位
               DISPLAY "WRK-JGNGAK  =" WRK-JGNGAK
               DISPLAY "WRK-KOHFTNMONEY  =" WRK-KOHFTNMONEY
               IF  (WRK-KOHFTNMONEY  >=  WRK-JGNGAK)
               AND (WRK-JGNGAK  NOT =  ZERO)
                   MOVE    WRK-SEIKYUGK2-G     TO  MF100-SEIKYUGK
               END-IF
           END-IF
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *    市町村番号セット処理
           IF  MF100-FTNJANUM(3:1)  NOT =  SPACE
      *      負担者番号が8桁の場合（新）
      *=== 市町村番号順にならない不具合修正 by Yoshikawa(2009/08/25) start
             MOVE  MF100-FTNJANUM(6:2)    TO  MF100-CITYNUM
      *=== 市町村番号順にならない不具合修正 by Yoshikawa(2009/08/25) end
             MOVE  MF100-FTNJANUM(3:5)    TO  MF100-CITYNUM2
           ELSE
      *      負担者番号が2桁の場合（旧）
             MOVE  MF100-FTNJANUM         TO  MF100-CITYNUM
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL    IDX   >    100
               IF  MF100-CITYNUM   =  TOWN-NUM(IDX)
                 MOVE  TOWN-CITYNUM(IDX)(1:5)  TO  MF100-CITYNUM2
                 MOVE  100                TO  IDX
               END-IF
             END-PERFORM
           END-IF
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
      *
      *=== 高額と全国公費は公費優先 by Yoshikawa(2013/07/09) start
      **=== 特疾＋957等の印字修正 by Yoshikawa(2012/10/18) start
      **    特疾＋957等も高額認定されてしまうので、FLG4を判断して回避
      *     IF  RECE02-FLG(4)  =  ZERO
      **=== 特疾＋957等の印字修正 by Yoshikawa(2012/10/18) end
      **=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) start
      *       EVALUATE  RECE02-ZAITAKU
      *         WHEN  "2"
      *           IF  RECE02-FTNMONEY(1)  <  83400
      *             MOVE  SPACE       TO  MF100-COMBIKBN
      *           END-IF
      *         WHEN  "3"
      *           IF  RECE02-FTNMONEY(1)  <  44400
      *             MOVE  SPACE       TO  MF100-COMBIKBN
      *           END-IF
      *         WHEN  "4"
      *           IF  RECE02-FTNMONEY(1)  <  24600
      *             MOVE  SPACE       TO  MF100-COMBIKBN
      *           END-IF
      *       END-EVALUATE
      **=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) end
      **=== 特疾＋957等の印字修正 by Yoshikawa(2012/10/18) start
      *     END-IF
      **=== 特疾＋957等の印字修正 by Yoshikawa(2012/10/18) end
      *=== 高額と全国公費は公費優先 by Yoshikawa(2013/07/09) end
      *
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
      *=== 高額限度額未満の不具合修正 by Yoshikawa(2012/08/10) start
      *     IF  RECE02-ZAITAKU  =  "2"  OR  "3"  OR  "4"
      *       MOVE  "98"                    TO  MF100-COMBIKBN
      *     END-IF
      *=== 高額限度額未満の不具合修正 by Yoshikawa(2012/08/10) end
      *
      *=== 低所の限度額修正 by Yoshikawa(2016/07/13) start
      *    低所得・低年金チェック
           MOVE    ZERO                    TO  FLG-TEISYO
           PERFORM 900-TSYRRK-READ-SEC
           PERFORM 900-TNKRRK-READ-SEC
      *=== 低所の限度額修正 by Yoshikawa(2016/07/13) end
      *
      *    高額該当者で限度額認定証無しの請求額計算
           IF  FLG-KOGAKU  =  1
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) start
      *       IF  MF100-SEIKYUGK  =  83400
      *       OR  MF100-SEIKYUGK  =  44400
      *       OR  MF100-SEIKYUGK  =  24600
             IF  MF100-SEIKYUGK  =  140100
             OR  MF100-SEIKYUGK  =  93000
             OR  MF100-SEIKYUGK  =  44400
             OR  MF100-SEIKYUGK  =  24600
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) end
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
      *         CONTINUE
                 MOVE    1                 TO  FLG-KOGAKU4
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
             ELSE
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) start
      *         IF   RECE02-NYUGAIKBN  =  "2"
      *         AND  MF100-SEIKYUGK  NOT =  35400
      *             PERFORM  900-SEIKYU-SELECT-SEC
      *             COMPUTE  MF100-SEIKYUGK  ROUNDED =  80100 +
      *                      ( RECE10-TOTALTEN(1) * 10 - 267000 ) / 100
      *         END-IF
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) start
      *         IF  MF100-SEIKYUGK  >  57600
      *             MOVE    57600       TO  MF100-SEIKYUGK
      *         END-IF
      *=== 低所の限度額修正 by Yoshikawa(2016/07/13) start
      **        低所得・低年金チェック
      *         MOVE    ZERO                TO FLG-TEISYO
      *         PERFORM 900-TSYRRK-READ-SEC
      *         PERFORM 900-TNKRRK-READ-SEC
      *=== 低所の限度額修正 by Yoshikawa(2016/07/13) end
               IF  FLG-TEISYO  =  ZERO
                   IF  MF100-SEIKYUGK  >  57600
                       MOVE    57600       TO  MF100-SEIKYUGK
                   END-IF
               ELSE
                   IF  MF100-SEIKYUGK  >  35400
                       MOVE    35400       TO  MF100-SEIKYUGK
                   END-IF
               END-IF
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) end
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/06) end
             END-IF
           END-IF
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *
      *=== 低所の限度額修正 by Yoshikawa(2016/07/13) start
      *    低所の設定が「地方公費のみ」になっている場合
      *    収納の計算は普段通りになっているので限度額を低所にする
           IF  (RECE02-ZAITAKU = "2" OR "3" OR "4" OR "5" OR "6")
           AND (FLG-TEISYO  NOT =  ZERO)
               IF  FLG-KOGAKU4  NOT =  ZERO
                   IF  MF100-SEIKYUGK  >  24600
                       MOVE    24600         TO  MF100-SEIKYUGK
                   END-IF
               ELSE
                   IF  MF100-SEIKYUGK  >  35400
                       MOVE    35400         TO  MF100-SEIKYUGK
                   END-IF
               END-IF
           END-IF
      *=== 低所の限度額修正 by Yoshikawa(2016/07/13) end
      *
      *=== 多数で市町村変更時の計算変更 by Yoshikawa(2017/03/10) start
      *    高額4回目で月途中に市町村を変更した場合は案分計算
      *    （本体で自動で案分計算されるようになったらコメントアウトする）
           IF  (RECE02-KOHNUM(1)           =  RECE02-KOHNUM(2))
           AND (RECE02-KOHFTNJANUM(1)  NOT =  RECE02-KOHFTNJANUM(2))
           AND (MF100-COMBIKBN             =  "98")
      *        44400円で入っているところは、
      *        FTNMONEY(1)から他市町村分を割り出してそれと差し引く
               IF  MF100-SEIKYUGK  =  44400
                   IF  RECE02-FTNMONEY(1)  NOT =  88800
                       COMPUTE  MF100-SEIKYUGK  =
                                 44400 - (RECE02-FTNMONEY(1) - 44400)
                   ELSE
                       IF  IDZ  =  1
                           MOVE    ZERO     TO  MF100-SEIKYUGK
                       END-IF
                   END-IF
               END-IF
           END-IF
      *=== 多数で市町村変更時の計算変更 by Yoshikawa(2017/03/10) end
      *
      *    ソートするためキーをセット
           PERFORM  960-SORTKEY-SEC
      *
      *    保険者番号チェック処理
      *=== 公費の助成なしは印字対象外 by hagino(2016/09/09) start
      *     MOVE    ZERO               TO   FLG-ERR
      *=== 公費の助成なしは印字対象外 by hagino(2016/09/09) end
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
           IF  FLG-ERR    =    ZERO
               WRITE  MF100-REC
               ADD  1  TO  CNT-MF100
           ELSE
               DISPLAY "助成対象外患者番号="  RECE02-PTNUM
           END-IF
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      **
      *****************************************************************
      *    ソートのためのキー処理
      *****************************************************************
       960-SORTKEY-SEC  SECTION.
      *
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      **    区分
      *     IF     RECE02-RJNHKNNUM  NOT  =  SPACE
      *       MOVE      6    TO   MF100-KBN
      **---(01.00.02) LINE ADD START ------------------------------------
      **---(01.00.01) LINE ADD START ------------------------------------
      **       MOVE      4    TO   MF100-JYUNJO
      **---(01.00.01) LINE ADD END   ------------------------------------
      **---(01.00.02) LINE ADD END   ------------------------------------
      *     ELSE
      *       IF     RECE02-AGE   >=  70
      *         MOVE    7    TO   MF100-KBN
      **---(01.00.02) LINE ADD START ------------------------------------
      **---(01.00.01) LINE ADD START ------------------------------------
      **         MOVE    2    TO   MF100-JYUNJO
      **---(01.00.01) LINE ADD END   ------------------------------------
      **---(01.00.02) LINE ADD END   ------------------------------------
      *       ELSE
      **---(01.00.07) LINE ADD START ------------------------------------
      **---(01.00.06) LINE ADD START ------------------------------------
      **         IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
      **         AND  (RECE10-FLG (1)   =  1)
      **             MOVE  3     TO  MF100-KBN
      **         ELSE
      **---(01.00.06) LINE ADD END   ------------------------------------
      *         IF  (RECE02-SRYYM  >=  WRK-CONS-SRYYM-200804)
      *         AND  (RECE02-FLG (1)   =  1)
      *             MOVE  3     TO  MF100-KBN
      *         ELSE
      **---(01.00.07) LINE ADD END   ------------------------------------
      *           IF  RECE02-AGE    <   3
      *             MOVE  3    TO   MF100-KBN
      **---(01.00.02) LINE ADD START ------------------------------------
      **---(01.00.01) LINE ADD START ------------------------------------
      **           MOVE  3    TO   MF100-JYUNJO
      **---(01.00.01) LINE ADD END   ------------------------------------
      **---(01.00.02) LINE ADD END   ------------------------------------
      *           ELSE
      *             MOVE  0    TO   MF100-KBN
      **---(01.00.02) LINE ADD START ------------------------------------
      **---(01.00.01) LINE ADD START ------------------------------------
      **             MOVE  1    TO   MF100-JYUNJO
      **---(01.00.01) LINE ADD END   ------------------------------------
      **---(01.00.02) LINE ADD END   ------------------------------------
      *           END-IF
      **---(01.00.06) LINE ADD START ------------------------------------
      *         END-IF
      **---(01.00.06) LINE ADD END   ------------------------------------
      *       END-IF
      *     END-IF
      **
      **    割合
      *     EVALUATE  RECE02-KYURATE
      *     WHEN 10
      **---(01.00.08) LINE ADD START ------------------------------------
      **       MOVE      1    TO   MF100-WARIAI
      ***---(01.00.02) LINE ADD START ------------------------------------
      **       MOVE      1    TO   MF100-JYUNJO
      ***---(01.00.02) LINE ADD END   ------------------------------------
      **    前期９割（特例措置）は８割
      *       IF   (RECE02-SRYYM   >=  WRK-CONS-SRYYM-200804)
      *       AND  (RECE02-FLG (2)  =  1)
      *         MOVE      2    TO   MF100-WARIAI
      *         MOVE      4    TO   MF100-JYUNJO
      *       ELSE
      *         MOVE      1    TO   MF100-WARIAI
      *         MOVE      1    TO   MF100-JYUNJO
      *       END-IF
      **---(01.00.08) LINE ADD END   ------------------------------------
      *     WHEN 20
      *       MOVE      2    TO   MF100-WARIAI
      **---(01.00.02) LINE ADD START ------------------------------------
      *       MOVE      4    TO   MF100-JYUNJO
      **---(01.00.02) LINE ADD END   ------------------------------------
      **---(01.00.09) LINE ADD START ------------------------------------
      **    ２割６歳は７０歳以上の次に印字
      *       IF   (RECE02-SRYYM   >=  WRK-CONS-SRYYM-200804)
      *       AND  (RECE02-FLG (1)  =  1)
      *         MOVE  6      TO  MF100-JYUNJO
      *       ELSE
      *         IF  RECE02-AGE  <  3
      *           MOVE  6    TO  MF100-JYUNJO
      *         END-IF
      *       END-IF
      **---(01.00.09) LINE ADD END   ------------------------------------
      *     WHEN OTHER
      *       MOVE      3    TO   MF100-WARIAI
      **---(01.00.09) LINE ADD START ------------------------------------
      ***---(01.00.02) LINE ADD START ------------------------------------
      **       MOVE      7    TO   MF100-JYUNJO
      ***---(01.00.02) LINE ADD END   ------------------------------------
      *       MOVE      8    TO   MF100-JYUNJO
      **---(01.00.09) LINE ADD END    ------------------------------------
      *     END-EVALUATE
      **    旧老人判定
      *     IF     RECE02-RJNHKNNUM  NOT  =  SPACE    AND
      *            RECE02-SRYYM          <=  "200209"
      *       MOVE      4    TO   MF100-WARIAI
      **---(01.00.02) LINE ADD START ------------------------------------
      *       MOVE     10    TO   MF100-JYUNJO
      **---(01.00.02) LINE ADD END   ------------------------------------
      *     END-IF
      **---(01.00.02) LINE ADD START ------------------------------------
      **    印字順
      *     IF  RECE02-RJNHKNNUM  NOT =  SPACE
      *       ADD  2         TO   MF100-JYUNJO
      *     ELSE
      *       IF  RECE02-AGE  >=  70
      *         ADD  1       TO   MF100-JYUNJO
      *       END-IF
      *     END-IF
      **---(01.00.02) LINE ADD END   ------------------------------------
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
      **    旧老人判定
      *     IF   RECE02-RJNHKNNUM  NOT =  SPACE
      *     AND  RECE02-SRYYM      <=  "200209"
      *       EVALUATE  RECE02-KYURATE
      *         WHEN  "010"
      *         WHEN  "020"
      *           MOVE  2      TO  MF100-WARIAI
      *         WHEN  "030"
      *           MOVE  3      TO  MF100-WARIAI
      *       END-EVALUATE
      *    区分（旧様式）
           IF  RECE02-SRYYM  <  WRK-CONS-SRYYM-200804
             IF  RECE02-RJNHKNNUM  NOT =  SPACE
               MOVE  6        TO  MF100-KBN
             ELSE
               IF  RECE02-AGE  >=  70
                 MOVE  7      TO  MF100-KBN
               ELSE
                 IF  RECE02-AGE  <  3
                   MOVE  3    TO  MF100-KBN
                 ELSE
                   MOVE  0    TO  MF100-KBN
                 END-IF
               END-IF
             END-IF
      *      割合（旧様式）
             EVALUATE  RECE02-KYURATE
               WHEN  "010"
                 MOVE  1      TO  MF100-WARIAI
               WHEN  "020"
                 MOVE  2      TO  MF100-WARIAI
               WHEN  "030"
                 MOVE  3      TO  MF100-WARIAI
             END-EVALUATE
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *    割合
           ELSE
             IF  RECE02-AGE  >=  70
               IF   RECE02-SRYYM   >=  WRK-CONS-SRYYM-200804
               AND  RECE02-FLG (2)  =  1
                 MOVE  2      TO  MF100-WARIAI
               ELSE
                 IF  RECE02-KYURATE  =  "030"
                   MOVE  3    TO  MF100-WARIAI
                 ELSE
                   MOVE  2    TO  MF100-WARIAI
                 END-IF
               END-IF
             ELSE
               IF   RECE02-SRYYM   >=  WRK-CONS-SRYYM-200804
               AND  RECE02-FLG (1)  =  1
                 MOVE  4      TO  MF100-WARIAI
               ELSE
                 IF  RECE02-AGE  <  3
                   MOVE  4    TO  MF100-WARIAI
                 ELSE
                   MOVE  1    TO  MF100-WARIAI
                 END-IF
               END-IF
             END-IF
           END-IF
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
      *
           .
       960-SORTKEY-EXT.
           EXIT.
      *
      *****************************************************************
      *    個別発行時の保険者番号(市町村番号)チェック処理
      *****************************************************************
       200111-HKNJANUM-CHK-SEC                SECTION.
      *
           INITIALIZE      WRK-HKNJANUM
      *
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *     PERFORM  VARYING  IDX    FROM    1    BY    1
      *              UNTIL    IDX    >    100
      *       IF  MF100-CITYNUM   =  TOWN-NUM(IDX)
      *           MOVE    TOWN-CITYNUM(IDX)(1:5)   TO  WRK-HKNJANUM
      *           MOVE    TOWN-CITYNUM(IDX)        TO  MF100-CITYNUM2
      *           MOVE    100                            TO  IDX
      *       END-IF
      *     END-PERFORM
           MOVE    MF100-CITYNUM2                 TO  WRK-HKNJANUM
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
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
           INITIALIZE                    SUM-GOKEI-TBL
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
           MOVE     KEY-NEW     TO       KEY-OLD
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      *
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
             IF  MF100-YOUSIKI  =  1
      *    帳票編集<旧様式・見出し>処理
               PERFORM  310-OLD-HEAD-HEN-SEC
      *    帳票編集<旧様式・明細>処理
               PERFORM  320-OLD-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM  330-OLD-PRINT-OUT-SEC
             ELSE
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *    帳票編集<見出し>処理
               PERFORM  310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM  320-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM  330-PRINT-OUT-SEC
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
             END-IF
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
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
           ADD   1     TO  CNT-PAGE
      *
           INITIALIZE  SC05
      *
      *    医療機関コード
           MOVE  SYS-1001-HOSPCD        TO  SC05-HOSPCD
      *
      *    印刷日付
           MOVE  WRK-SRYYMWH(1:16)      TO  SC05-SRYYM
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *　　所在地
      *     MOVE  SYS-1002-ADRS          TO  SC05-ADRS
      *
      *    医療機関名称
      *     MOVE  SYS-1001-HOSPNAME      TO  SC05-HOSPNAME
      *
      *    電話番号
      *     MOVE  SYS-1002-TEL           TO  SC05-TEL
      *    医療機関住所
           MOVE  WRK-HOSPADRS           TO  SC05-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SC05-ADRS            REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE  WRK-HOSPNAME           TO  SC05-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SC05-HOSPNAME        REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE  WRK-HOSPTEL            TO  SC05-TEL
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    開設者氏名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *     MOVE  SYS-1001-KAISETUNAME   TO  SC05-KANRINAME
           MOVE  WRK-KAISETUNAME        TO  SC05-KANRINAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    点数表区分
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *         MOVE  "○"               TO  SC05-TENHYOKBN (1)
           MOVE  "1"                    TO  SC05-TENHYOKBN
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
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
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *              UNTIL    IDX1  >    25
                    UNTIL    IDX1  >    20
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
                    OR      KEY-N-YOUSIKI  NOT =  KEY-O-YOUSIKI
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
                    OR      FLG-PRINT =    1
      *
      *    市町村名
             MOVE     MF100-CITYNUM2        TO  WRK-HKNJANUM
      *
             PERFORM  920-HKNJAINF-SET-SEC
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *     IF       FLG-HKNJAINF        =   ZERO
      *              MOVE    HKNJA-HKNJANAME
      *                        TO  SC05-TOWNNAME (IDX1)
      *              DISPLAY "保険者名取得成功"
      *     ELSE
      *          MOVE "該当無し" TO SC05-TOWNNAME (IDX1)
      *     END-IF
      **
      **    記号（市町村番号）
      *       MOVE  MF100-CITYNUM  TO  SC05-KIGO (IDX1)
      **
      **    区分
      *       MOVE  MF100-KBN     TO  SC05-KBN(IDX1)
      *    保険者番号
             MOVE    WRK-HKNJANUM         TO  WRK-MAE-INPUT
             PERFORM 2009-HENKAN-SEC
             MOVE    WRK-OUT-INPUT        TO  SC05-HKNJANUM(IDX1)
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
      *
      *    給付割合
             MOVE  "○"     TO    
                                SC05-KYURATE(IDX1 MF100-WARIAI)
      *
      *    精神・結核等併用（１特）
             IF  MF100-COMBIKBN NOT = SPACE
               MOVE  "○"  TO  SC05-KYURATE (IDX1 5)
               MOVE  1     TO  FLG-COMBI
             END-IF
      *
      *    入外区分
             IF  MF100-NYUGAIKBN   =  "1"
               MOVE  "○"  TO  SC05-NYUGAIKBN (IDX1 1)
             ELSE
               MOVE  "○"  TO  SC05-NYUGAIKBN (IDX1 2)
             END-IF
      *
      *    集計
             PERFORM UNTIL FLG-PRINT  =  1
                     OR    KEY-NEW NOT = KEY-OLD
               ADD  1                      TO  SUM-GKENSU
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) start
      *         ADD  MF100-TOTALTEN         TO  SUM-GTENSU
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) start
      *         ADD  MF100-H-TOTALTEN       TO  SUM-GTENSU
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) start
      *         ADD  MF100-TOTALTEN         TO  SUM-GTENSU
               ADD  MF100-H-TOTALTEN       TO  SUM-GTENSU
      *=== 点数欄は総点数を印字する by Yoshikawa(2016/10/28) end
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) end
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) end
               ADD  MF100-KOHYKZFTN        TO  SUM-GFKSGAKU
      *
               IF    MF100-COMBIKBN  NOT  =  SPACE
                 OR  MF100-SEIKYU-FLG   =  1
                 MOVE   1                 TO  FLG-COMBI
                 ADD    MF100-SEIKYUGK    TO  SUM-GFKSGAKU
               END-IF
      *
      *    レセプト明細読込
               PERFORM  900-TMP-READ-SEC
      *
             END-PERFORM
      *
      *    件数
             MOVE  SUM-GKENSU      TO  WRK-Z3
             MOVE  WRK-Z3          TO  SC05-KENSU (IDX1)
      *
      *    点数
             MOVE  SUM-GTENSU      TO  WRK-Z9
             MOVE  WRK-Z9          TO  SC05-TENSU (IDX1)
      *
      *    福祉医療費請求額
             IF  FLG-COMBI  = 1
               MOVE  SUM-GFKSGAKU    TO  WRK-Z10
               MOVE  WRK-Z10         TO  SC05-FKSGAKU (IDX1)
             END-IF
      *
             INITIALIZE  FLG-COMBI
             INITIALIZE  SUM-GOKEI-TBL
             MOVE  KEY-NEW  TO  KEY-OLD
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
           MOVE   "SC1005.red"         TO  SPRT-PRTID
           MOVE    "福祉医療総括表"    TO  SPRT-TITLE
           MOVE    SC05                TO  SPRT-PRTDATA
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
       330-PRINT-OUT-EXT.
           EXIT.
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
      *****************************************************************
      *    帳票編集<旧様式・ヘッダー部>処理
      *****************************************************************
       310-OLD-HEAD-HEN-SEC          SECTION.
      *
           ADD   1     TO  CNT-PAGE
      *
           INITIALIZE  SC05o
      *
      *    医療機関コード
           MOVE  SYS-1001-HOSPCD        TO  SC05o-HOSPCD
      *
      *    印刷日付
           MOVE  WRK-SRYYMWH(1:16)      TO  SC05o-SRYYM
      *
      *    医療機関住所
           MOVE  WRK-HOSPADRS           TO  SC05o-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SC05o-ADRS           REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    医療機関名
           MOVE  WRK-HOSPNAME           TO  SC05o-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SC05o-HOSPNAME       REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *
      *    電話番号
           MOVE  WRK-HOSPTEL            TO  SC05o-TEL
      *
      *    開設者氏名
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *     MOVE  SYS-1001-KAISETUNAME   TO  SC05-KANRINAME
           MOVE  WRK-KAISETUNAME        TO  SC05-KANRINAME
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *    点数表区分
           MOVE  "○"                   TO  SC05o-TENHYOKBN (1)
      *
           .
       310-OLD-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<旧様式・明細行>処理
      *****************************************************************
       320-OLD-BODY-HEN-SEC      SECTION.
      *
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >    25
                    OR      KEY-N-YOUSIKI  NOT =  1
                    OR      FLG-PRINT =    1
      *
      *    市町村名
             MOVE     MF100-CITYNUM2        TO  WRK-HKNJANUM
      *
             PERFORM  920-HKNJAINF-SET-SEC
             IF  WRK-HKNJANAME  NOT =  SPACE
                 MOVE  WRK-HKNJANAME       TO  SC05o-TOWNNAME (IDX1)
             ELSE
                 MOVE  "該当無し"          TO  SC05o-TOWNNAME (IDX1)
             END-IF
      *
      *    記号（市町村番号）
             MOVE  MF100-CITYNUM  TO  SC05o-KIGO (IDX1)
      *
      *    区分
             MOVE  MF100-KBN     TO  SC05o-KBN(IDX1)
      *
      *    給付割合
             MOVE  "○"          TO  SC05o-KYURATE(IDX1 MF100-WARIAI)
      *
      *    精神・結核等併用（１特）
             IF  MF100-COMBIKBN NOT = SPACE
               MOVE  "○"  TO  SC05o-KYURATE (IDX1 5)
               MOVE  1     TO  FLG-COMBI
             END-IF
      *
      *    入外区分
             IF  MF100-NYUGAIKBN   =  "1"
               MOVE  "○"  TO  SC05o-NYUGAIKBN (IDX1 1)
             ELSE
               MOVE  "○"  TO  SC05o-NYUGAIKBN (IDX1 2)
             END-IF
      *
      *    集計
             PERFORM UNTIL FLG-PRINT  =  1
                     OR    KEY-NEW NOT = KEY-OLD
                     OR    KEY-N-YOUSIKI  NOT =  1
               ADD  1                      TO  SUM-GKENSU
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) start
      *         ADD  MF100-TOTALTEN         TO  SUM-GTENSU
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) start
      *         ADD  MF100-H-TOTALTEN       TO  SUM-GTENSU
               ADD  MF100-TOTALTEN         TO  SUM-GTENSU
      *=== 点数欄は福祉点数を印字する by Yoshikawa(2011/08/16) end
      *=== 点数欄記載の変更 by Yoshikawa(2010/07/26) end
               ADD  MF100-KOHYKZFTN        TO  SUM-GFKSGAKU
      *
               IF    MF100-COMBIKBN  NOT  =  SPACE
                 OR  MF100-SEIKYU-FLG   =  1
                 MOVE   1                 TO  FLG-COMBI
                 ADD    MF100-SEIKYUGK    TO  SUM-GFKSGAKU
               END-IF
      *
      *    レセプト明細読込
               PERFORM  900-TMP-READ-SEC
      *
             END-PERFORM
      *
      *    件数
             MOVE  SUM-GKENSU      TO  WRK-Z3
             MOVE  WRK-Z3          TO  SC05o-KENSU (IDX1)
      *
      *    点数
             MOVE  SUM-GTENSU      TO  WRK-Z9
             MOVE  WRK-Z9          TO  SC05o-TENSU (IDX1)
      *
      *    福祉医療費請求額
             IF  FLG-COMBI  = 1
               MOVE  SUM-GFKSGAKU    TO  WRK-Z10
               MOVE  WRK-Z10         TO  SC05o-FKSGAKU (IDX1)
             END-IF
      *
             INITIALIZE  FLG-COMBI
             INITIALIZE  SUM-GOKEI-TBL
             MOVE  KEY-NEW  TO  KEY-OLD
           END-PERFORM
      *
           .
       320-OLD-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-OLD-PRINT-OUT-SEC                SECTION.
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
           MOVE   "SC1005o.red"        TO  SPRT-PRTID
           MOVE    "福祉医療総括表"    TO  SPRT-TITLE
           MOVE    SC05o               TO  SPRT-PRTDATA
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
       330-OLD-PRINT-OUT-EXT.
           EXIT.
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
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
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           MOVE    ZERO     TO     FLG-HEIYOU
                                   WRK-SEIKYUGK
      *=== 初期化漏れ対応 by Yoshikawa(2016/09/21) start
                                   WRK-SEIKYUGK2
      *=== 初期化漏れ対応 by Yoshikawa(2016/09/21) end
      *
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >    4 OR
                    SYU-KOH-HKNNUM(IDX)  =  SPACE
             IF    SYU-KOH-HKNNUM(IDX)(1:1) =  "0"  AND
                   SYU-KOH-HKNNUM(IDX) NOT  =  "027"
               MOVE   1                TO    FLG-HEIYOU
      *
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/08/12) start
      *         IF    RECE02-FTNMONEY(1) >  ZERO
      *           MOVE   SYU-KOH-COMPFTN(IDX) TO  WRK-SEIKYUGK
      *         ELSE
      *           MOVE   SYU-KOH-COMPFTN-ENTANI(IDX)  
      *                                       TO  WRK-SEIKYUGK
      *         END-IF
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
      *         MOVE   SYU-KOH-HKNFTNMONEY(IDX)
      *                                       TO  WRK-SEIKYUGK
               IF    RECE02-FTNMONEY(1) >  ZERO
                 MOVE   SYU-KOH-COMPFTN(IDX) TO  WRK-SEIKYUGK
               ELSE
                 MOVE   SYU-KOH-COMPFTN-ENTANI(IDX)  
                                             TO  WRK-SEIKYUGK
               END-IF
               MOVE   SYU-KOH-HKNFTNMONEY(IDX)
                                             TO  WRK-SEIKYUGK2
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/08/12) end
      *=== 請求額の計算方法変更 by Yoshikawa(2010/10/04) start
      **=== 請求額計算方法の変更 by Yoshikawa(2010/07/26) start
      *         IF  WRK-SEIKYUGK  =  ZERO
      *           IF    RECE02-FTNMONEY(1) >  ZERO
      *             MOVE   SYU-SYUCOMPFTN     TO  WRK-SEIKYUGK
      *           ELSE
      *             MOVE   SYU-SYUCOMPFTN-ENTANI
      *                                       TO  WRK-SEIKYUGK
      *           END-IF
      *         END-IF
      **=== 請求額計算方法の変更 by Yoshikawa(2010/07/26) end
      *=== 請求額の計算方法変更 by Yoshikawa(2010/10/04) end
      *
             END-IF
             IF  SYU-KOH-HKNNUM(IDX)  =  "010"  OR  "011"  OR
                                         "020"  OR  "021"  OR
                                         "015"  OR  "051"  OR
                                         "091"  OR  "972"  OR
                                         "016"  OR  "052"
      *=== 長期上位対応 by Yoshikawa(2009/08/28) start
                                      OR "974"
      *=== 長期上位対応 by Yoshikawa(2009/08/28) end
      *=== 「特」欄の対象公費追加 by Yoshikawa(2013/04/08) start
                                      OR "024"  OR  "038"  OR  "079"
      *=== 「特」欄の対象公費追加 by Yoshikawa(2013/04/08) end
               ADD   SYU-TOTAL-HKNTEN     TO  MF100-FUKUSHIGAITEN
               MOVE  SYU-KOH-HKNNUM(IDX)(2:2)  TO  MF100-COMBIKBN
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
               MOVE  1                         TO  FLG-ZENKOHI
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *=== 長期上位対応 by Yoshikawa(2009/08/28) start
               IF  SYU-KOH-HKNNUM(IDX)  =  "972" OR "974"
                 MOVE  "72"               TO  MF100-COMBIKBN
               END-IF
      *=== 長期上位対応 by Yoshikawa(2009/08/28) end
             END-IF
      *
             IF    SYU-KOH-HKNNUM(IDX)   =   "972"
               MOVE    1     TO    FLG-TYOKI
             END-IF
      *=== 長期上位対応 by Yoshikawa(2009/08/28) start
             IF    SYU-KOH-HKNNUM(IDX)   =   "974"
               MOVE    2     TO    FLG-TYOKI
             END-IF
      *=== 長期上位対応 by Yoshikawa(2009/08/28) end
      *
      *=== 特疾負無(091)は「51」と印字 by Yoshikawa(2010/07/26) start
      *      特疾負無は「51」でまとめる
             IF  SYU-KOH-HKNNUM(IDX)  =  "091"
               MOVE  "51"                      TO  MF100-COMBIKBN
             END-IF
      *=== 特疾負無(091)は「51」と印字 by Yoshikawa(2010/07/26) end
      *
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) start
      *      限度額認定証を持っていない場合でも、
      *      高額療養費計算されていれば高額該当とする
             IF  SYU-KOH-FTN-ENTANI  NOT =  ZERO
               MOVE   "98"                     TO  MF100-COMBIKBN
               MOVE    1                       TO  FLG-KOGAKU
             END-IF
      *=== 限度額認定証無しでも高額認定 by Yoshikawa(2012/03/19) end
      *
      *=== 公費の助成なしは印字対象外 by hagino(2016/09/09) start
             IF   SYU-KOH-HKNNUM(IDX)     =  WRK-KOHNUM
               IF     IDX                 =  1
                 IF  SYU-SYUCOMPFTN-ENTANI
                                       > SYU-KOH-COMPFTN-ENTANI(IDX)
                   MOVE  ZERO          TO  FLG-ERR
                 END-IF
               ELSE
                 IF  SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                      >  SYU-KOH-COMPFTN-ENTANI(IDX)
                   MOVE  ZERO          TO  FLG-ERR
                 END-IF
               END-IF
             END-IF
      *=== 公費の助成なしは印字対象外 by hagino(2016/09/09) end
      *
           END-PERFORM
      *
           IF    FLG-HEIYOU    =    ZERO
      *    上限が有る場合は10円単位、ない場合は1円単位で加算
             IF    RECE02-FTNMONEY(1) >  ZERO
               IF    RECE02-RJNHKNNUM NOT = SPACE
                 MOVE     SYU-KOH-COMPFTN(1) TO  WRK-SEIKYUGK
               ELSE
                 MOVE     SYU-SYUCOMPFTN     TO  WRK-SEIKYUGK
      *=== 円単位の修正 by Yoshikawa(2016/10/13) start
                                                 WRK-SEIKYUGK2
      *=== 円単位の修正 by Yoshikawa(2016/10/13) end
               END-IF
               MOVE       1                  TO  MF100-SEIKYU-FLG
             ELSE
               IF    RECE02-RJNHKNNUM NOT = SPACE
                 MOVE     SYU-KOH-COMPFTN-ENTANI(1) TO  WRK-SEIKYUGK
               ELSE
                 MOVE     SYU-SYUCOMPFTN-ENTANI     TO  WRK-SEIKYUGK
      *=== 円単位の修正 by Yoshikawa(2016/10/13) start
                                                        WRK-SEIKYUGK2
      *=== 円単位の修正 by Yoshikawa(2016/10/13) end
               END-IF
             END-IF
      *=== 円単位の修正 by Yoshikawa(2016/10/13) start
      **=== 分点時の福祉医療費請求額修正 by Yoshikawa(2016/09/21) start
      *       MOVE     SYU-SYUCOMPFTN         TO  WRK-SEIKYUGK2
      **=== 分点時の福祉医療費請求額修正 by Yoshikawa(2016/09/21) end
      *=== 円単位の修正 by Yoshikawa(2016/10/13) end
      *=== 請求額の計算方法変更 by Yoshikawa(2010/10/04) start
      *=== 点数欄記載の変更 by Yoshikawa(2016/10/28) start
      *     ELSE
      *       ADD   SYU-TOTAL-HKNTEN     TO  MF100-TOTALTEN2
      *=== 点数欄記載の変更 by Yoshikawa(2016/10/28) end
      *=== 請求額の計算方法変更 by Yoshikawa(2010/10/04) end
           END-IF
      *
           ADD    WRK-SEIKYUGK               TO    WRK-SEIKYUGK-G
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
           ADD    WRK-SEIKYUGK2              TO    WRK-SEIKYUGK2-G
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
           DISPLAY "加算請求額="  WRK-SEIKYUGK
      *
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
      *       CALL  "MCPSUB"           USING
      *                                MCPAREA
      *                                MCPDATA-REC
             MOVE    "tbl_syunou"     TO  MCP-TABLE
             MOVE    WRK-PATH         TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"      USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH        TO  MCP-PATH
               MOVE    "tbl_syunou"   TO  MCP-TABLE
               MOVE    WRK-PATH       TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
               PERFORM  925-SYUNOU-READ-SEC
      *
               PERFORM  UNTIL  FLG-SYUNOU  =  1
                 IF  SYU-DENPJTIKBN   NOT = "3"
                   IF  SYU-HKNCOMBINUM  =  RECE02-HKNCOMBI(1) OR
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
      *           MOVE  WRK-PATH        TO  MCP-PATH
                 MOVE    "tbl_syunou"   TO  MCP-TABLE
                 MOVE    WRK-PATH       TO  MCP-PATHNAME
      *---(01.00.03) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH              TO  MCP-PATH
      *       CALL  "MCPSUB"     USING
      *                          MCPAREA
      *                          MCPDATA-REC
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
           MOVE    "tbl_hkncombi"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
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
      *    終了　　処理
      *****************************************************************
       300-END-SEC   SECTION.
      *
      *
           CLOSE  MF100-FILE
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU1005 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU1005 OUT "  CNT-MF100
           DISPLAY "*** SEIKYU1005 END ***"
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
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
      *****************************************************************
      *    対象公費番号チェック処理
      *****************************************************************
       800-TAISYOKOHI-CHK-SEC                SECTION.
      *
           INITIALIZE     FLG-TAISYO
      *
           PERFORM  VARYING  IDXX  FROM  1  BY  1
                    UNTIL    IDXX  >  100
                    OR       WRK-TAISYO-KOHNUM(IDXX)  =  SPACE
               IF  WRK-CHK-KOHNUM(1)  =  WRK-TAISYO-KOHNUM(IDXX)
               OR  WRK-CHK-KOHNUM(2)  =  WRK-TAISYO-KOHNUM(IDXX)
               OR  WRK-CHK-KOHNUM(3)  =  WRK-TAISYO-KOHNUM(IDXX)
               OR  WRK-CHK-KOHNUM(4)  =  WRK-TAISYO-KOHNUM(IDXX)
                   MOVE     1                 TO  FLG-TAISYO
                   MOVE     100               TO  IDXX
               END-IF
           END-PERFORM
      *
           .
       800-TAISYOKOHI-CHK-EXT.
           EXIT.
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  MF100-FILE   NEXT
               AT  END
                   MOVE  1                TO  FLG-PRINT
                   MOVE  HIGH-VALUE       TO  KEY-NEW
               NOT  AT  END
                   ADD  1                 TO  CNT-MF100
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) start
                   MOVE  MF100-YOUSIKI    TO  KEY-N-YOUSIKI
      *=== 旧老人及び70歳以上1割は旧様式 by Yoshikawa(2009/08/28) end
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *             MOVE  MF100-CITYNUM    TO  KEY-N-CITYNUM
                   MOVE  MF100-CITYNUM2(3:3)  TO  KEY-N-CITYNUM
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
                   MOVE  MF100-KBN        TO  KEY-N-KBN
                   MOVE  MF100-WARIAI     TO  KEY-N-WARIAI
                   MOVE  MF100-COMBIKBN   TO  KEY-N-COMBIKBN
                   MOVE  MF100-NYUGAIKBN  TO  KEY-N-NYUGAIKBN
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
           INITIALIZE                  RECE02-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *
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
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
      *         IF  RECE02-KOHNUM (1)  =  "145" OR "146" OR "143" OR
      *                                   "245" OR "246" OR "243" OR
      *             RECE02-KOHNUM (2)  =  "145" OR "146" OR "143" OR
      *                                   "245" OR "246" OR "243" OR
      *             RECE02-KOHNUM (3)  =  "145" OR "146" OR "143" OR
      *                                   "245" OR "246" OR "243" OR
      *             RECE02-KOHNUM (4)  =  "145" OR "146" OR "143" OR
      *                                   "245" OR "246" OR "243"
               INITIALIZE                          WRK-CHK-KOHNUM-TBL
               MOVE    RECE02-KOHNUM(1)        TO  WRK-CHK-KOHNUM(1)
               MOVE    RECE02-KOHNUM(2)        TO  WRK-CHK-KOHNUM(2)
               MOVE    RECE02-KOHNUM(3)        TO  WRK-CHK-KOHNUM(3)
               MOVE    RECE02-KOHNUM(4)        TO  WRK-CHK-KOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
                   IF      WRK-PARA-STSRYYM    =   "999999"
                       CONTINUE
                   ELSE
                       IF  ( RECE02-SRYYM      <   WRK-PARA-STSRYYM )
                       OR  ( RECE02-SRYYM      >   WRK-PARA-EDSRYYM )
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
      *
      *        テスト患者のときは読み飛ばす
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
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY        TO  MCP-PATH
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
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKNJA-HOSPNUM
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM                TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE  "tbl_hknjainf"               TO  MCP-TABLE
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *     MOVE  "key"                        TO  MCP-PATHNAME
           MOVE  "key2"                       TO  MCP-PATHNAME
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
           CALL  "ORCDBMAIN"                  USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.03) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY     TO  MCP-PATH
             MOVE  "tbl_hknjainf"               TO  MCP-TABLE
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *       MOVE  "key"                        TO  MCP-PATHNAME
             MOVE  "key2"                       TO  MCP-PATHNAME
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *---(01.00.03) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *       MOVE  HKNJA-HKNJANAME  TO  WRK-HKNJANAME
             PERFORM  UNTIL  FLG-HKNJAINF  =  1
               IF  HKNJA-HKNNUM  =  "060"
                   MOVE  HKNJA-HKNJANUM     TO  WRK-HKNJANUM
                   MOVE  HKNJA-HKNJANAME    TO  WRK-HKNJANAME
                   MOVE  1                  TO  FLG-HKNJAINF
               END-IF
               PERFORM  925-HKNJAINF-READ-SEC
             END-PERFORM
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknjainf"           TO  MCP-TABLE
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) start
      *     MOVE  "key"                    TO  MCP-PATHNAME
           MOVE  "key2"                   TO  MCP-PATHNAME
      *=== 帳票様式の変更 by Yoshikawa(2009/07/24) end
           CALL  "ORCDBMAIN"              USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"              USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) start
      *****************************************************************
      *    患者公費負担情報読込処理
      *****************************************************************
       930-PTKOHFTN-READ-SEC         SECTION.
      *
           INITIALIZE                          PTKOHFTN-REC
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
                                               FLG-PTKOHFTN
                                               WRK-GAIJGNGAK
                                               WRK-NYUJGNGAK
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *
           MOVE    SPA-HOSPNUM             TO  PTKOHFTN-HOSPNUM
           MOVE    MF100-PTID              TO  PTKOHFTN-PTID
           MOVE    PTKOHFTN-REC            TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_ptkohftn"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
      *         MOVE    "DBFETCH"           TO  MCP-FUNC
      *         MOVE    "tbl_ptkohftn"      TO  MCP-TABLE
      *         MOVE    "key2"              TO  MCP-PATHNAME
      *         CALL    "ORCDBMAIN"         USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
      *                                     SPA-AREA
      *         IF      MCP-RC              =   ZERO
      *             MOVE    MCPDATA-REC         TO  PTKOHFTN-REC
      *             MOVE    ZERO                TO  FLG-PTKOHFTN
      *         ELSE
      *             MOVE    1                   TO  FLG-PTKOHFTN
      *             INITIALIZE                  PTKOHFTN-REC
      *         END-IF
               PERFORM  930-PTKOHFTN-FETCH-SEC
               PERFORM  UNTIL  FLG-PTKOHFTN  =  1
                   IF  (PTKOHFTN-TEKSTYMD(1:6) <= RECE02-SRYYM(1:6))
                   AND (PTKOHFTN-TEKEDYMD(1:6) >= RECE02-SRYYM(1:6))
                       MOVE    PTKOHFTN-GAIJGNGAK 
                                           TO  WRK-GAIJGNGAK
                       MOVE    PTKOHFTN-NYUJGNGAK    
                                           TO  WRK-NYUJGNGAK
                   END-IF
                   PERFORM  930-PTKOHFTN-FETCH-SEC
               END-PERFORM
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
           ELSE
               MOVE    1                   TO  FLG-PTKOHFTN
               INITIALIZE                  PTKOHFTN-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_ptkohftn"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       930-PTKOHFTN-READ-EXT.
           EXIT.
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
      *****************************************************************
      *    患者公費負担情報ＦＥＴＣＨ処理
      *****************************************************************
       930-PTKOHFTN-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           MOVE    "tbl_ptkohftn"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC         TO  PTKOHFTN-REC
               MOVE    ZERO                TO  FLG-PTKOHFTN
           ELSE
               MOVE    1                   TO  FLG-PTKOHFTN
               INITIALIZE                  PTKOHFTN-REC
           END-IF
      *
           .
       930-PTKOHFTN-FETCH-EXT.
           EXIT.
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *=== 限度額未満は「特」対象外 by Yoshikawa(2010/07/26) end
      *
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) start
      *****************************************************************
      *  収納情報読み込み
      *****************************************************************
       940-SYUNOU2-READ-SEC  SECTION.
      *
           INITIALIZE                      SYUNOU2-REC
                                           FLG-SYUNOU2
                                           WRK-KOHFTNMONEY
      *
           MOVE  SPA-HOSPNUM               TO  SYU2-HOSPNUM
           MOVE  RECE02-NYUGAIKBN          TO  SYU2-NYUGAIKBN
           MOVE  RECE02-PTID               TO  SYU2-PTID
           MOVE  RECE02-SRYYM(1:6)         TO  SYU2-SRYYMD(1:6)
           MOVE  "__"                      TO  SYU2-SRYYMD(7:2)
           MOVE  SYUNOU2-REC               TO  MCPDATA-REC
           MOVE  "DBSELECT"                TO  MCP-FUNC
           MOVE  "tbl_syunou"              TO  MCP-TABLE
           MOVE  WRK-PATH2                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"               USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE    "tbl_syunou"          TO  MCP-TABLE
             MOVE    WRK-PATH2             TO  MCP-PATHNAME
             PERFORM  945-SYUNOU2-FETCH-SEC
      *
             PERFORM  UNTIL  FLG-SYUNOU2  =  1
      *          全国公費の保険負担金額集計
                 PERFORM  VARYING  IDX  FROM  1  BY  1
                          UNTIL    IDX  >    4 
                          OR       SYU2-KOH-HKNNUM(IDX)  =  SPACE
                     IF  SYU2-KOH-HKNNUM(IDX)(1:1) =  "0"
                         ADD    SYU2-KOH-HKNFTNMONEY(IDX)  TO
                                                WRK-KOHFTNMONEY
                     END-IF
                 END-PERFORM
      *
                 MOVE    "tbl_syunou"      TO  MCP-TABLE
                 MOVE    WRK-PATH2         TO  MCP-PATHNAME
                 PERFORM   945-SYUNOU2-FETCH-SEC
             END-PERFORM
           ELSE
             DISPLAY  "SYUNOU SELECT ERR" 
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_syunou"            TO  MCP-TABLE
           MOVE    WRK-PATH2               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       940-SYUNOU2-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    収納読込
      *****************************************************************
       945-SYUNOU2-FETCH-SEC  SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF  MCP-RC  =  ZERO
               MOVE    MCPDATA-REC         TO  SYUNOU2-REC
               MOVE    ZERO                TO  FLG-SYUNOU2
           ELSE
               INITIALIZE  SYUNOU2-REC
               MOVE    1                   TO  FLG-SYUNOU2
           END-IF
      *
           .
       945-SYUNOU2-FETCH-EXT.
           EXIT.
      *
      *=== 福祉医療費請求額の修正 by Yoshikawa(2016/09/05) end
      *---(01.00.04) LINE ADD START ------------------------------------
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                  RECE10-REC
      *
      *=== primary key変更対応 by Yoshikawa(2013/01/16) start
      *     MOVE   RECE02-HOSPNUM       TO  RECE10-HOSPNUM
      *     MOVE   RECE02-SRYYM         TO  RECE10-SRYYM
      *     MOVE   RECE02-NYUGAIKBN     TO  RECE10-NYUGAIKBN
      *     MOVE   RECE02-PTID          TO  RECE10-PTID
      *     MOVE   RECE02-RECEKA        TO  RECE10-RECEKA
      *     MOVE   RECE02-TEISYUTUSAKI  TO  RECE10-TEISYUTUSAKI
      *     MOVE   RECE02-RECESYUBETU   TO  RECE10-RECESYUBETU
      *     MOVE   RECE02-HKNJANUM      TO  RECE10-HKNJANUM
      *     MOVE   RECE02-HOJOKBN-KEY   TO  RECE10-HOJOKBN-KEY
      *     MOVE   RECE02-TEKSTYMD      TO  RECE10-TEKSTYMD
           MOVE    RECE02-KEY          TO  RECE10-KEY
      *=== primary key変更対応 by Yoshikawa(2013/01/16) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    1               TO  FLG-RECE10
           END-IF
      *
      *=== DBCLOSECURSOR漏れ by Yoshikawa(2010/07/26) start
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *=== DBCLOSECURSOR漏れ by Yoshikawa(2010/07/26) end
      *
           .
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求マスター読込
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-RECE10
               MOVE    MCPDATA-REC         TO  RECE10-REC
           ELSE
               MOVE    1                   TO  FLG-RECE10
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *---(01.00.04) LINE ADD END   ------------------------------------
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) start
      *****************************************************************
      *    低所得履歴読み込み処理
      *****************************************************************
       900-TSYRRK-READ-SEC                SECTION.
      *
           INITIALIZE                      TSYRRK-REC
                                           FLG-TSYRRK
           MOVE    SPA-HOSPNUM         TO  TSYRRK-HOSPNUM
           MOVE    RECE02-PTID         TO  TSYRRK-PTID
           MOVE    TSYRRK-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_tsyrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      FLG-TSYRRK          =   ZERO
               PERFORM  900-TSYRRK-FETCH-SEC
      *
               PERFORM  UNTIL  FLG-TSYRRK  =  1
                 IF  RECE02-SRYYM  >=  TSYRRK-NINSTYMD(1:6)  AND
                     RECE02-SRYYM  <=  TSYRRK-NINEDYMD(1:6)
                   MOVE    1           TO  FLG-TEISYO
                   MOVE    1           TO  FLG-TSYRRK
                 END-IF
                 PERFORM  900-TSYRRK-FETCH-SEC
               END-PERFORM
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_tsyrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           .
       900-TSYRRK-READ-EXT.
           EXIT.
      *****************************************************************
      *    低所得履歴フェッチ処理
      *****************************************************************
       900-TSYRRK-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           MOVE    "tbl_tsyrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC   =   ZERO
               MOVE    ZERO            TO  FLG-TSYRRK
               MOVE    MCPDATA-REC     TO  TSYRRK-REC
           ELSE
               MOVE    1               TO  FLG-TSYRRK
               INITIALIZE                  TSYRRK-REC
           END-IF
      *
           .
       900-TSYRRK-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    低年金履歴読み込み処理
      *****************************************************************
       900-TNKRRK-READ-SEC                SECTION.
      *
           INITIALIZE                      TNKRRK-REC
                                           FLG-TNKRRK
           MOVE    SPA-HOSPNUM         TO  TNKRRK-HOSPNUM
           MOVE    RECE02-PTID         TO  TNKRRK-PTID
           MOVE    TNKRRK-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_tnkrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      FLG-TNKRRK          =   ZERO
               PERFORM  900-TNKRRK-FETCH-SEC
      *
               PERFORM  UNTIL  FLG-TNKRRK  =  1
                 IF  RECE02-SRYYM  >=  TNKRRK-STYMD(1:6)  AND
                     RECE02-SRYYM  <=  TNKRRK-EDYMD(1:6)
                   MOVE    1           TO  FLG-TEISYO
                   MOVE    1           TO  FLG-TNKRRK
                 END-IF
                 PERFORM  900-TNKRRK-FETCH-SEC
               END-PERFORM
           END-IF
      *
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           MOVE    "tbl_tnkrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           .
       900-TNKRRK-READ-EXT.
           EXIT.
      *****************************************************************
      *    低年金履歴フェッチ処理
      *****************************************************************
       900-TNKRRK-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           MOVE    "tbl_tnkrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC   =   ZERO
               MOVE    ZERO            TO  FLG-TNKRRK
               MOVE    MCPDATA-REC     TO  TNKRRK-REC
           ELSE
               MOVE    1               TO  FLG-TNKRRK
               INITIALIZE                  TNKRRK-REC
           END-IF
      *
           .
       900-TNKRRK-FETCH-EXT.
           EXIT.
      *=== 限度額認定証なしの低所得対応 by Yoshikawa(2016/03/10) end
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
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-STSRYYM    TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
                                               SYS-1900-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-STSRYYM    TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
                                           SYS-1901-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-STSRYYM    TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
                                           SYS-1902-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) start
      *****************************************************************
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1903-READ-SEC           SECTION.
      *
           MOVE    SPACE               TO  SYS-1903-REC
           INITIALIZE                      SYS-1903-REC
           MOVE    "1903"              TO  SYS-1903-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1903-KBNCD
           MOVE    SPA-HOSPNUM         TO  SYS-1903-HOSPNUM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1903-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1903-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-STSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1903-STYUKYMD(7:2)
           MOVE    SYS-1903-STYUKYMD   TO  SYS-1903-EDYUKYMD
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/06) end
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
      *=== 医療機関編集情報へ開設者名追加 by hagino(2015/10/08) end
      *
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) start
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
      *=== 対象公費をPGオプションから取得 by hagino(2016/06/08) end
      *
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
       900-DBCLOSE-EXT.
           EXIT.
      *
