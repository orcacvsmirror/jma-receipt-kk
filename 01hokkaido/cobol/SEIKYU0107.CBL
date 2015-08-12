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
       PROGRAM-ID.     SEIKYU0107.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 地方公費
      *  コンポーネント名  : 北海道・重度心身障がい者医療費請求書
      *                      (143,243,343,543,643,743,843)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/04/20    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            月途中の公費切替え対応
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01     有村     05/05/06    医療機関情報取得条件修正
      *  01.00.02     山口     05/09/14    初診データの集計方法修正
      *  01.00.03     内田     07/02/14    印字対象番号の追加（643）
      *  01.00.04     内田     07/04/25    帳票様式に伴う修正
      *  01.00.05     内田     07/05/23    認定証を提示時のみ71限度額を印字
      *                                    在総診の判定修正
      *                                    長期上位対応
      *                                    ３割の場合も○の印字
      *                                    印字対象番号の追加（743,843）
      *                                    旭川の備考欄修正（初再診の判定）
      *  01.00.06     内田     07/06/22    道内広域連合の場合、市町村名のみ印字
      *  01.00.07     内田     07/09/24    保険番号743,843にて公費の助成が
      *                                    ないなら集計しない
      *  01.00.08     内田     07/09/26    日レセver4.0対応
      *                                    システム管理マスタ「1901」の
      *                                    医療機関情報を参照
      *  01.00.09     内田     08/03/26    公費の助成がないなら集計しない(743)
      *  01.00.10     内田     08/05/02    後期高齢者を障老人欄へ印字
      *  01.00.11     内田     08/07/01    札幌市代表保険者番号変更
      *  01.00.12     吉川     08/09/11    SPA-AREA初期化
      *  01.00.13     吉川     08/11/25    長期等と併用した場合、公費の助成が
      *                                    無くても印字される不具合を修正
      *  01.00.14     吉川     09/01/15    外来で全国公費併用の場合は、
      *                                    公費の助成がなくても印字
      *  01.00.15     内田     09/05/22    公費の助成がなくても印字
      *                                    上限達した時の旭川市の備考欄印字修正
      *                                    「在」に○がある場合、
      *                                    「２・３割」に○は不要
      *  01.00.16     吉川     09/07/10    公費の助成がなくても印字するのは
      *                                    函館市等８市のみにする
      *                                    「２・３割」以外に○がある場合、
      *                                    「２・３割」に○は不要
      *  01.00.17     吉川     09/09/29    全市町村で長期及び全国公費併用時は
      *                                    公費の助成がなくても印字する
      *  01.00.18     吉川     09/10/05    全国公費と長期を持っている場合、
      *                                    「長」に○が付かない不具合を修正
      *                                    543と長期を併用時、一部負担金が
      *                                    長期の限度額を超える不具合を修正
      *                                    長期で実日数が1日のみの場合、
      *                                    長期とならない不具合を修正
      *                        09/10/22    全国公費を持っていても
      *                                    窓口徴収金が発生しない場合は
      *                                    印字対象外とするように修正
      *  01.00.19     吉川     09/12/17    全国公費と長期が適用となった場合
      *                                    上限額の低い方に○を印字する
      *  01.00.20     吉川     10/02/12    函館市は公費の助成がない場合
      *                                    印字対象外とする
      *  01.00.21     吉川     10/03/25    診療入力順によってはデータが
      *                                    印字されない場合があるのを修正
      *  01.00.22     吉川     10/11/16    室蘭市、釧路市、江別市、根室市は
      *                                    公費の助成が無い場合は印字対象外
      *  01.00.23     吉川     11/02/04    小樽市、登別市、北広島市は
      *                                    公費の助成が無い場合は印字対象外
      *  01.00.24     吉川     11/02/16    公費請求テーブルclose処理位置変更
      *  01.00.25     吉川     12/04/09    帳票様式の変更に伴う修正
      *                                    外来も高額限度額を印字する
      *  01.00.26     吉川     12/07/12    高額療養費と長期を持っている場合
      *                                    限度額欄に値が記載されるのを修正
      *                                    特定疾患と957等を持っている場合
      *                                    限度額欄に値が記載されるのを修正
      *  01.00.27     吉川     12/12/13    643で初診の場合、一部負担金欄は
      *                                    初診時一部負担金580円との差額を記載
      *                                    643で上限額に達すると、備考欄の
      *                                    印字がされなかったのを修正
      *                                    643で患者負担額が580円未満の場合、
      *                                    備考欄の数字は患者負担額を記載
      *                                    医療機関情報編集修正
      *  01.00.28     吉川     13/03/18    旭川市助成分が580円未満の場合の
      *                                    備考欄の金額を修正
      *                                    限度額欄と前期高齢者欄の両方に
      *                                    値がある場合、前期高齢者のみ印字
      *  01.00.29     吉川     13/06/10    743の場合の備考欄の印字修正
      *                                    在宅は70歳未満の場合でも印字する
      *                                    70歳未満で343＋高額の場合
      *                                    限度額欄に印字されないのを修正
      *  01.00.30     吉川     13/07/26    在宅の対象コードを増やす
      *  01.00.31     吉川     14/03/10    743を使用時、旭川市助成分が
      *                                    580円未満の場合の備考欄の金額修正
      *  01.00.32     吉川     14/03/14    消費税改正対応
      *  01.00.33     吉川     14/05/20    在宅の対象とする診療コード変更
      *  01.00.34     吉川     15/06/11    保険番号343のマスタ取得時
      *                                    適用期間内のデータを取得する
      *  01.00.35     吉川     15/08/12    道難病によって公費の助成がない場合
      *                                    印字対象外とするように修正
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
       DATA  DIVISION.
       FILE  SECTION.
      *
      *
      *    集計ファイル
       FD  MF100-FILE.
       01  MF100-REC.
           COPY  "SEI0107.INC".
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
       WORKING-STORAGE  SECTION.
      *
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF100//.
      *
      *    エラーファイル 名称領域
      *---(01.00.08) LINE ADD START ------------------------------------
      *     COPY  "CPCOMMONDAT2.INC"
      *             REPLACING  //RECE01PARA//
      *             BY         //RECEERR//.
      *     03      PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           COPY  "SC0107.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-MF100      PIC X(02).
           03  STS-RECE02     PIC X(02).
           03  STS-RECEERR    PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-PTINF      PIC 9(01).
           03  FLG-END        PIC 9(01).
           03  FLG-MF100      PIC 9(01).
           03  FLG-PRINT      PIC 9(01).
           03  FLG-SYSKANRI   PIC 9(01).
           03  FLG-ERR        PIC 9(01).
           03  FLG-SYUNOU     PIC 9(01).
           03  FLG-HEIYOU     PIC 9(01).
           03  FLG-TYOKI      PIC 9(01).
           03  FLG-SYOSIN     PIC 9(01).
           03  FLG-JYURRK     PIC 9(01).
           03  FLG-SRYACCT    PIC 9(01).
           03  FLG-SYOKEI     PIC 9(01).
           03  FLG-HKNJAINF   PIC 9(01).
           03  FLG-HKNNUM     PIC 9(01).
           03  FLG-HKNCOMBI   PIC 9(01).
           03  FLG-BTPARA     PIC 9(01).
           03  FLG-SYORI      PIC 9(01).
      ***** 05/09/14 yamaguchi INS
           03  FLG-SRYACT     PIC 9(01).
      *****
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
           03  FLG-ERR2       PIC 9(01).
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) start
           03  FLG-SYORI2     PIC 9(01).
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX            PIC 9(04).
           03  IDXX           PIC 9(04).
           03  IDX1           PIC 9(04).
           03  IDX2           PIC 9(04).
           03  IDX3           PIC 9(04).
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) start
           03  IDX4           PIC 9(04).
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) end
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) start
           03  IDX5           PIC 9(04).
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) end
           03  IDX-STG.
               05  IDX-ST     PIC 9(02).
           03  IDX-EDG.
               05  IDX-ED     PIC 9(02).
           03  IDY            PIC 9(04).
           03  IDZ            PIC 9(04).
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID        PIC 9(07).
           03  WRK-PARA-SHELLID      PIC X(08).
      *---(01.00.08) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID       PIC X(24).
           03  WRK-PARA-HOSPNUM      PIC 9(02).
      *---(01.00.08) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE         PIC 9(10).
           03  WRK-PARA-SYORIFLG     PIC X(01).
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR           PIC  X(200).
           03  WRK-Z2                PIC ZZ.
           03  WRK-Z3                PIC ZZZ.
           03  WRK-Z5                PIC Z,ZZZ.
           03  WRK-Z6                PIC ZZ,ZZZ.
           03  WRK-Z7                PIC ZZZ,ZZZ.
           03  WRK-Z9                PIC Z,ZZZ,ZZZ.
           03  WRK-SRYYMWH           PIC X(16).
           03  WRK-SEIYMDWH          PIC X(22).
           03  WRK-HENYMDG           PIC X(22).
           03  WRK-SYMD.
               05  WRK-SYY           PIC 9(04).
               05  WRK-SMM           PIC 9(02).
               05  WRK-SDD           PIC 9(02).
           03  WRK-LASTYMD           PIC 9(08).
           03  WRK-NYMD.
               05  WRK-NYY           PIC 9(04).
               05  WRK-NMM           PIC 9(02).
               05  WRK-NDD           PIC 9(02).
           03  WRK-TYMD.
               05  WRK-TYY           PIC 9(04).
               05  WRK-TMM           PIC 9(02).
               05  WRK-TDD           PIC 9(02).
           03  WRK-HKNJANUM          PIC X(05).
           03  WRK-KOHNUM            PIC X(03).
           03  WRK-KOBETUCITYNUM     PIC X(03).
           03  WRK-KOHID             PIC 9(10).
           03  WRK-SRYACCT-PATH      PIC X(64).
           03  WRK-PRTID             PIC X(20).
           03  WRK-TAIHI-TBL.
               05  WRK-T-FTNJANUM    PIC X(20).
               05  WRK-T-TOTALTEN    PIC 9(07).
      *---(01.00.04) LINE ADD START ------------------------------------
               05  WRK-T-KOGAKU      PIC 9(07).
      *---(01.00.04) LINE ADD END   ------------------------------------
               05  WRK-T-SEIKYUGK    PIC 9(07).
               05  WRK-T-ITBFTN      PIC 9(07).
               05  WRK-T-KASAN-FLG   PIC 9(01).
           03  WRK-SYUKEI-TBL.
               05  WRK-SEIKYUGK      PIC 9(07)V9(01).
               05  WRK-SEIKYUGK-G    PIC 9(07).
               05  WRK-SEIKYUGK-G2   PIC 9(07)V9(01).
               05  WRK-KOHTENSU      PIC 9(07).
               05  WRK-KESE          PIC 9(07)V9(01).
               05  WRK-ETC-ITBFTN    PIC 9(07)V9(01).
               05  WRK-ETC-ITBFTN-G  PIC 9(07).
               05  WRK-ETC-SYOSINFTN PIC 9(07)V9(01).
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) start
               05  WRK-ASAHIFTN      PIC 9(07).
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) end
           03  WRK-N-JOUGENGK        PIC 9(07).
           03  WRK-G-JOUGENGK        PIC 9(07).
           03  WRK-KEISAN            PIC 9(07).
           03  WRK-AMARI             PIC 9(02).
           03  WRK-COMPFTN           PIC 9(07).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  WRK-SHOSAI            PIC 9(07).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
           03  WRK-SRYCNT            PIC 9(02).
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
      *---(01.00.08) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH              PIC X(50).
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
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
           03  WRK-HENKAN            PIC X(20).
      *
       01  SUM-AREA.
           03  SUM-KENSU          PIC 9(04) OCCURS 5.
           03  SUM-TENSU7         PIC 9(07).
           03  SUM-TENSU8         PIC 9(07).
           03  SUM-TENSU9         PIC 9(07).
           03  SUM-ZNK            PIC 9(07).
           03  SUM-RJN            PIC 9(07).
           03  SUM-ITBFTN         PIC 9(07).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-RECE02  PIC 9(06).
           03  CNT-MF100   PIC 9(06).
           03  CNT-PAGE    PIC 9(03).
      *
      *    キー用エリア
       01  KEY-AREA.
           03  KEY-NEW.
               05  KEY-N-FTNJANUM   PIC X(08).
           03  KEY-OLD.
               05  KEY-O-FTNJANUM   PIC X(08).
      *
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) start
      *    固定項目
       01  WRK-CONS-AREA.
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) start
           03  WRK-CONS-201403         PIC X(06) VALUE "201403".
           03  WRK-CONS-SRYYM-201404   PIC X(06) VALUE "201404".
      *
      **    在宅総合・在宅末期（在医総）
      *     03  WRK-CONS-ZAITAKU1       PIC X(09) VALUE "114007610".
      *     03  WRK-CONS-ZAITAKU2       PIC X(09) VALUE "114007710".
      *     03  WRK-CONS-ZAITAKU3       PIC X(09) VALUE "114007510".
      *     03  WRK-CONS-ZAITAKU4       PIC X(09) VALUE "114012210".
      *     03  WRK-CONS-ZAITAKU5       PIC X(09) VALUE "114012310".
      *     03  WRK-CONS-ZAITAKU6       PIC X(09) VALUE "114012410".
      **=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) end
      **=== 在宅の対象コードを増やす by Yoshikawa(2013/07/26) start
      **    特医総管（在支診等）
      *     03  WRK-CONS-ZAITAKU7       PIC X(09) VALUE "114013010".
      *     03  WRK-CONS-ZAITAKU8       PIC X(09) VALUE "114013110".
      **    特医総管（在支診等以外）
      *     03  WRK-CONS-ZAITAKU9       PIC X(09) VALUE "114013210".
      *     03  WRK-CONS-ZAITAKU10      PIC X(09) VALUE "114013310".
      **    在医総管（機能強化した在支診等）
      *     03  WRK-CONS-ZAITAKU11      PIC X(09) VALUE "114018710".
      *     03  WRK-CONS-ZAITAKU12      PIC X(09) VALUE "114018810".
      *     03  WRK-CONS-ZAITAKU13      PIC X(09) VALUE "114018910".
      *     03  WRK-CONS-ZAITAKU14      PIC X(09) VALUE "114019010".
      **    特医総管（機能強化した在支診等）
      *     03  WRK-CONS-ZAITAKU15      PIC X(09) VALUE "114019110".
      *     03  WRK-CONS-ZAITAKU16      PIC X(09) VALUE "114019210".
      *     03  WRK-CONS-ZAITAKU17      PIC X(09) VALUE "114019310".
      *     03  WRK-CONS-ZAITAKU18      PIC X(09) VALUE "114019410".
      **=== 在宅の対象コードを増やす by Yoshikawa(2013/07/26) end
      **
      **=== 消費税改正対応 by Yoshikawa(2014/03/14) start
      *     03  WRK-CONS-201403         PIC X(06) VALUE "201403".
      **=== 消費税改正対応 by Yoshikawa(2014/03/14) end
      *在総診テーブル
       01  TBL-ZAITAKU-AREA.
           03  FILLER                  PIC X(09) VALUE "114007610".
           03  FILLER                  PIC X(09) VALUE "114007710".
           03  FILLER                  PIC X(09) VALUE "114007510".
           03  FILLER                  PIC X(09) VALUE "114012210".
           03  FILLER                  PIC X(09) VALUE "114012310".
           03  FILLER                  PIC X(09) VALUE "114012410".
           03  FILLER                  PIC X(09) VALUE "114018710".
           03  FILLER                  PIC X(09) VALUE "114018810".
           03  FILLER                  PIC X(09) VALUE "114018910".
           03  FILLER                  PIC X(09) VALUE "114019010".
           03  FILLER                  PIC X(09) VALUE "114019510".
           03  FILLER                  PIC X(09) VALUE "114019610".
           03  FILLER                  PIC X(09) VALUE "114019710".
           03  FILLER                  PIC X(09) VALUE "114019810".
           03  FILLER                  PIC X(09) VALUE "114013010".
           03  FILLER                  PIC X(09) VALUE "114013110".
           03  FILLER                  PIC X(09) VALUE "114013210".
           03  FILLER                  PIC X(09) VALUE "114013310".
           03  FILLER                  PIC X(09) VALUE "114019110".
           03  FILLER                  PIC X(09) VALUE "114019210".
           03  FILLER                  PIC X(09) VALUE "114019310".
           03  FILLER                  PIC X(09) VALUE "114019410".
      *
       01  TBL-ZAITAKU-R  REDEFINES   TBL-ZAITAKU-AREA.
           03  TBL-ZAITAKU             PIC X(09) OCCURS  22.
      *
       01  TBL-ZAITAKU-MAX             PIC 9(02) VALUE   22.
      *
      *在総診テーブル（２０１４年４月診療分〜）
       01  TBL-ZAITAKU2-AREA.
           03  FILLER                  PIC X(09) VALUE "114007610".
           03  FILLER                  PIC X(09) VALUE "114007710".
           03  FILLER                  PIC X(09) VALUE "114019510".
           03  FILLER                  PIC X(09) VALUE "114019610".
           03  FILLER                  PIC X(09) VALUE "114019710".
           03  FILLER                  PIC X(09) VALUE "114019810".
           03  FILLER                  PIC X(09) VALUE "114023110".
           03  FILLER                  PIC X(09) VALUE "114023210".
           03  FILLER                  PIC X(09) VALUE "114023310".
           03  FILLER                  PIC X(09) VALUE "114023410".
           03  FILLER                  PIC X(09) VALUE "114023510".
           03  FILLER                  PIC X(09) VALUE "114023610".
           03  FILLER                  PIC X(09) VALUE "114023710".
           03  FILLER                  PIC X(09) VALUE "114023810".
           03  FILLER                  PIC X(09) VALUE "114023910".
           03  FILLER                  PIC X(09) VALUE "114024010".
           03  FILLER                  PIC X(09) VALUE "114024110".
           03  FILLER                  PIC X(09) VALUE "114024210".
           03  FILLER                  PIC X(09) VALUE "114024310".
           03  FILLER                  PIC X(09) VALUE "114024410".
           03  FILLER                  PIC X(09) VALUE "114024510".
           03  FILLER                  PIC X(09) VALUE "114024610".
           03  FILLER                  PIC X(09) VALUE "114024910".
           03  FILLER                  PIC X(09) VALUE "114025010".
           03  FILLER                  PIC X(09) VALUE "114025110".
           03  FILLER                  PIC X(09) VALUE "114025210".
           03  FILLER                  PIC X(09) VALUE "114025310".
           03  FILLER                  PIC X(09) VALUE "114025410".
           03  FILLER                  PIC X(09) VALUE "114025510".
           03  FILLER                  PIC X(09) VALUE "114025610".
           03  FILLER                  PIC X(09) VALUE "114025710".
           03  FILLER                  PIC X(09) VALUE "114025810".
           03  FILLER                  PIC X(09) VALUE "114025910".
           03  FILLER                  PIC X(09) VALUE "114026010".
           03  FILLER                  PIC X(09) VALUE "114026110".
           03  FILLER                  PIC X(09) VALUE "114026210".
           03  FILLER                  PIC X(09) VALUE "114026310".
           03  FILLER                  PIC X(09) VALUE "114026410".
      *
       01  TBL-ZAITAKU2-R  REDEFINES   TBL-ZAITAKU2-AREA.
           03  TBL-ZAITAKU2            PIC X(09) OCCURS  38.
      *
       01  TBL-ZAITAKU2-MAX            PIC 9(02) VALUE   38.
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) end
      *
      *    DB参照用
      *---(01.00.08) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *    印刷管理マスタ
       01  PRTKANRI-REC.
           COPY    "CPPRTKANRI.INC".
      *    印刷マスタ
       01  PRTDATA-REC.
           COPY    "CPPRTDATA.INC".
      *
      *    受診履歴情報
       01  JYURRK-REC.
           COPY    "CPJYURRK.INC".
      *
      *    診療会計マスタ
       01  SRYACCT-REC.
           COPY    "CPSRYACCT.INC".
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *　　保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      ***** 05/09/14 yamaguchi INS
      *    診療行為マスタ
       01  SRYACT-REC.
           COPY    "CPSRYACT.INC".
      *****
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
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
      *
      *    共通パラメタ
           COPY  "MCPAREA".
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".      
      *
           COPY  "MCPDATA.INC".
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
           INITIALIZE  SUM-AREA
           INITIALIZE  KEY-AREA
           INITIALIZE  IDX-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2008/09/11) start
           INITIALIZE  SPA-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2008/09/11) end
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
                                               WRK-PARA-SYORIFLG
      *---(01.00.08) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.08) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SEIKYU0107"    TO  JOB-PGID
      *=== 帳票タイトル修正 by Yoshikawa(2012/07/12) start
      *     MOVE    "重度心身障害者医療費請求書" 
           MOVE    "重度心身障がい者医療費請求書" 
      *=== 帳票タイトル修正 by Yoshikawa(2012/07/12) end
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
           MOVE  "MF100ZZ"        TO  MF100PARA-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID(1:16)  TO  MF100PARA-TERMID
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE  WRK-PARA-HOSPNUM           TO  MF100PARA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  "RECEERR"        TO  RECEERR-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)  
      *                            TO  RECEERR-TERMID
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
      ***** 05/05/06 DEL
      *     MOVE  "99999999"    TO  SYS-1001-STYUKYMD
      *     MOVE  "00000000"    TO  SYS-1001-EDYUKYMD
      ***** 05/05/06 INS
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                               TO  SYS-1001-STYUKYMD(1:6)
                                   SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"        TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
      *****
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM   TO  SYS-1001-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU0107 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
      ***** 05/05/06 DEL
      *     MOVE  "99999999"    TO  SYS-1002-STYUKYMD
      *     MOVE  "00000000"    TO  SYS-1002-EDYUKYMD
      ***** 05/05/06 INS
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                               TO  SYS-1002-STYUKYMD(1:6)
                                   SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"        TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
      *****
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM   TO  SYS-1002-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU0107 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    ３４３の上限額取得
           PERFORM 940-HKNNUM-SET-SEC
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
      *---(01.00.08) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM         TO  BTPARA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-SHELLID    TO  BTPARA-SHELLID
               MOVE    WRK-PARA-JOBID      TO  BTPARA-JOBID
               MOVE    BTPARA-REC          TO  MCPDATA-REC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
      *---(01.00.08) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
                   PERFORM 900-BTPARA-READ-N-SEC
               END-PERFORM
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
               MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *    集計処理１
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           PERFORM VARYING IDZ FROM    1   BY  1
                   UNTIL   IDZ >       4
             IF  RECE02-KOHNUM (IDZ) = "143" OR "243" OR "343"
      *---(01.00.05) LINE ADD START ------------------------------------
      *---(01.00.03) LINE ADD START ------------------------------------
      **                              OR "543"
      *                              OR "543" OR "643"
      *---(01.00.03) LINE ADD END   ------------------------------------
                                    OR "543" OR "643" OR "743" OR "843"
      *---(01.00.05) LINE ADD END   ------------------------------------
               PERFORM  20011-SYUKEI-SEC
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
      *    TMP-FILE キーセット
      *
           INITIALIZE       MF100-REC
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID       TO  MF100-HOSPID
           MOVE  SPA-HOSPNUM         TO  MF100-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  RECE02-PTNUM        TO  MF100-PTNUM
           MOVE  RECE02-HKNJANUM-KEY TO  MF100-HKNJANUM-KEY
           MOVE  RECE02-TEKSTYMD     TO  MF100-TEKSTYMD
           MOVE  RECE02-NYUGAIKBN    TO  MF100-NYUGAIKBN
           MOVE  RECE02-SRYYM        TO  MF100-SRYYM
      *
           MOVE  RECE02-PTID         TO  MF100-PTID
           MOVE  RECE02-NAME         TO  MF100-NAME
           MOVE  RECE02-KANANAME     TO  MF100-KANANAME
           MOVE  RECE02-BIRTHDAY     TO  MF100-BIRTHDAY
           MOVE  RECE02-SEX          TO  MF100-SEX
           MOVE  RECE02-AGE          TO  MF100-AGE
           MOVE  RECE02-HKN          TO  MF100-HKN
           MOVE  RECE02-RJNHKN       TO  MF100-RJNHKN
           MOVE  RECE02-KYURATE      TO  MF100-FTNRATE
           MOVE  RECE02-ZAITAKU      TO  MF100-ZAITAKU
      *
           MOVE  RECE02-KOHINF      (IDZ)  TO  MF100-KOHINF
           MOVE  MF100-KOHFTNJANUM         TO  MF100-FTNJANUM
           MOVE  MF100-KOHJKYSNUM          TO  MF100-JKYSNUM
           COMPUTE IDY     =         IDZ   +   1
           ADD   RECE02-TOTALTEN    (IDY)  TO  MF100-TOTALTEN
           ADD   RECE02-FTNMONEY    (IDY)  TO  MF100-FTNMONEY
      *
           DISPLAY "患者番号=" MF100-PTNUM
                   "変換前=" MF100-FTNJANUM " " MF100-KOHFTNJANUM
           MOVE     SPACE    TO    WRK-HENKAN
           MOVE     ZERO     TO    IDX2
           PERFORM  VARYING  IDX1  FROM  1   BY  2
                    UNTIL    IDX1  >     20
                    OR       MF100-FTNJANUM(IDX1:2) = SPACE
             EVALUATE  MF100-FTNJANUM(IDX1:2)
             WHEN "１"
               ADD      1    TO    IDX2
               MOVE    "1"   TO    WRK-HENKAN(IDX2:1)
             WHEN "２"
               ADD      1    TO    IDX2
               MOVE    "2"   TO    WRK-HENKAN(IDX2:1)
             WHEN "３"
               ADD      1    TO    IDX2
               MOVE    "3"   TO    WRK-HENKAN(IDX2:1)
             WHEN "４"
               ADD      1    TO    IDX2
               MOVE    "4"   TO    WRK-HENKAN(IDX2:1)
             WHEN "５"
               ADD      1    TO    IDX2
               MOVE    "5"   TO    WRK-HENKAN(IDX2:1)
             WHEN "６"
               ADD      1    TO    IDX2
               MOVE    "6"   TO    WRK-HENKAN(IDX2:1)
             WHEN "７"
               ADD      1    TO    IDX2
               MOVE    "7"   TO    WRK-HENKAN(IDX2:1)
             WHEN "８"
               ADD      1    TO    IDX2
               MOVE    "8"   TO    WRK-HENKAN(IDX2:1)
             WHEN "９"
               ADD      1    TO    IDX2
               MOVE    "9"   TO    WRK-HENKAN(IDX2:1)
             WHEN "０"
               ADD      1    TO    IDX2
               MOVE    "0"   TO    WRK-HENKAN(IDX2:1)
             END-EVALUATE
           END-PERFORM
           IF  WRK-HENKAN  NOT  =  SPACE
             MOVE    WRK-HENKAN    TO    MF100-FTNJANUM
                                         MF100-KOHFTNJANUM 
           END-IF
           DISPLAY "変換後=" MF100-FTNJANUM " " MF100-KOHFTNJANUM
      *
      *    個別発行用市町村番号
           MOVE  MF100-KOHFTNJANUM (1:3)    TO  WRK-KOBETUCITYNUM
      *
      *    区内は札幌市で請求する
           IF  MF100-FTNJANUM(1:1)  =  "4"
      *---(01.00.11) LINE ADD START ------------------------------------
      *       MOVE  "4001"   TO    MF100-FTNJANUM
      *                            MF100-KOHFTNJANUM
             MOVE  "0017"   TO    MF100-FTNJANUM
                                  MF100-KOHFTNJANUM
      *---(01.00.11) LINE ADD END   ------------------------------------
           END-IF
      *
      *    一部負担金がある公費を使用している場合は助成対象判定を行う
           MOVE     ZERO                       TO  FLG-ERR
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
           MOVE     ZERO                       TO  FLG-ERR2
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
      *=== 公費の助成がなくても印字 by Uchida(2009/05/22) start
      **---(01.00.07) LINE ADD START ------------------------------------
      **     IF   MF100-KOHNUM  =  "143"                         OR
      **          MF100-KOHNUM  =  "343"
      *     IF   MF100-KOHNUM  =  "143"
      *     OR   MF100-KOHNUM  =  "343"
      *     OR   MF100-KOHNUM  =  "643"
      **---(01.00.09) LINE ADD START ------------------------------------
      *     OR   MF100-KOHNUM  =  "743"
      **---(01.00.09) LINE ADD END   ------------------------------------
      *     OR   MF100-KOHNUM  =  "843"
      **---(01.00.07) LINE ADD END   ------------------------------------
      *       MOVE      1                       TO  FLG-ERR
      *     END-IF
      *=== 公費の助成がなくても印字 by Uchida(2009/05/22) end
      *=== 助成なしの記載は函館等8市のみ by Yoshikawa(2009/07/08) start
      *    小樽、登別、北広島は助成対象判定を行わない
      *=== 函館市は公費の助成がなくても印字 by Yoshikawa(2010/02/12) start
      *     IF  WRK-KOBETUCITYNUM  =  "002" OR "003" OR "005" OR "006"
      *                           OR  "017" OR "023" OR "030" OR "051"
      *=== 助成判定市町村の変更 by Yoshikawa(2010/11/16) start
      *     IF  WRK-KOBETUCITYNUM  =  "003" OR "005" OR "006" OR  "017"
      *                           OR  "023" OR "030" OR "051"
      *=== 公費助成判定をする市町村の変更 by Yoshikawa(2011/02/04) start
      *     IF  WRK-KOBETUCITYNUM  =  "003" OR "030" OR "051"
      **=== 助成判定市町村の変更 by Yoshikawa(2010/11/16) end
      **=== 函館市は公費の助成がなくても印字 by Yoshikawa(2010/02/12) end
      *         CONTINUE
      *     ELSE
      *         MOVE     1                        TO  FLG-ERR
      *     END-IF
           MOVE     1                          TO  FLG-ERR
      *=== 公費助成判定をする市町村の変更 by Yoshikawa(2011/02/04) end
      *=== 助成なしの記載は函館等8市のみ by Yoshikawa(2009/07/08) end
      *
      *    長期・結核・精神編集
           MOVE     ZERO                       TO  FLG-TYOKI
           MOVE     MF100-KOHNUM               TO  WRK-KOHNUM
           MOVE     MF100-KOHID                TO  WRK-KOHID
           INITIALIZE                              WRK-SYUKEI-TBL
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) start
                                                   WRK-COMPFTN
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) end
           IF      RECE02-NYUGAIKBN    =   "1"
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"                 TO  WRK-PATH
      *---(01.00.08) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"                 TO  WRK-PATH
      *---(01.00.08) LINE ADD END   ------------------------------------
           END-IF
           PERFORM  920-SYUNOU-SET-SEC
      *
      *    保険者番号チェック処理
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
           COMPUTE  WRK-SEIKYUGK-G ROUNDED  =  WRK-SEIKYUGK-G2
      *
      *    ５４３・１割相当金額編集
           IF  MF100-KOHNUM  =  "543"
             COMPUTE WRK-ETC-ITBFTN-G ROUNDED = WRK-ETC-ITBFTN
             IF  MF100-NYUGAIKBN        =  "1"
               IF  WRK-ETC-ITBFTN-G   >  WRK-N-JOUGENGK
                 MOVE  WRK-N-JOUGENGK TO  WRK-ETC-ITBFTN-G
               END-IF
             ELSE
               IF  WRK-ETC-ITBFTN-G   >   WRK-G-JOUGENGK
                 MOVE  WRK-G-JOUGENGK TO  WRK-ETC-ITBFTN-G
               END-IF
             END-IF
             MOVE     WRK-ETC-ITBFTN-G TO  MF100-ETCFTNMONEY
           END-IF
      *
      *   ２４３・初診時一部負担金相当額編集
           IF     MF100-KOHNUM  =  "243"
             COMPUTE MF100-ETCFTNMONEY ROUNDED = WRK-ETC-SYOSINFTN
           END-IF
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    旭川の場合、初診再診判定
           IF  MF100-KOHNUM  =  "643" OR "743"
             COMPUTE  WRK-SHOSAI  =  RECE02-TOTALTEN (IDY) / 10 * 10
      *=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) start
      **=== 上限達した時の旭川市の備考欄印字修正 by Uchida(2009/05/22) start
      **       IF  RECE02-FTNMONEY (IDY)  <  WRK-SHOSAI
      *       IF  RECE02-FTNMONEY (IDY)  <  WRK-SHOSAI
      *       AND  WRK-SHOSAI <= 12000
      **=== 上限達した時の旭川市の備考欄印字修正 by Uchida(2009/05/22) end
      *         MOVE  1  TO  MF100-SHOSAISIN
      *       END-IF
             COMPUTE WRK-ETC-ITBFTN-G ROUNDED = WRK-ETC-ITBFTN
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) start
      *       IF  WRK-ETC-ITBFTN-G  <  WRK-SHOSAI
      **        580円に満たない場合、備考欄に患者負担額を記載
      *         IF  WRK-SHOSAI  <  580
      *           MOVE  WRK-SHOSAI          TO  MF100-ETCFTNMONEY
      *=== 743の場合の備考欄印字修正 by Yoshikawa(2013/06/10) start
             IF  MF100-KOHNUM  =  "743"
               IF  WRK-ETC-ITBFTN-G  <  WRK-SHOSAI
      *          580円に満たない場合、備考欄に市助成分を記載
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) start
      *           IF  WRK-SHOSAI  <  580
      *             MOVE  WRK-SHOSAI          TO  MF100-ETCFTNMONEY
                 IF  (WRK-ASAHIFTN  NOT =  ZERO)
                 AND (WRK-ASAHIFTN  <  580)
                   MOVE  WRK-ASAHIFTN          TO  MF100-ETCFTNMONEY
                 ELSE
                   MOVE  580                   TO  MF100-ETCFTNMONEY
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) end
                 END-IF
                 MOVE  WRK-ETC-ITBFTN-G      TO  MF100-FTNMONEY
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) start
      *           IF  MF100-FTNMONEY  NOT =  ZERO
      *             MOVE  580                 TO  MF100-ETCFTNMONEY
      *           END-IF
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) end
                 MOVE  1                     TO  MF100-SHOSAISIN
               END-IF
             ELSE
      *=== 743の場合の備考欄印字修正 by Yoshikawa(2013/06/10) end
      *        患者負担額と計算負担金の値が一致しなかったら
      *        初診時一部負担金が引かれたということなので、初診と判定
               IF  WRK-COMPFTN  NOT =  WRK-ETC-ITBFTN-G
      *          市助成分が580円に満たない場合、備考欄に患者負担額を記載
                 IF  (WRK-ASAHIFTN  NOT =  ZERO)
                 AND (WRK-ASAHIFTN  <  580)
                   MOVE  WRK-ASAHIFTN        TO  MF100-ETCFTNMONEY
                 ELSE
                   MOVE  580                 TO  MF100-ETCFTNMONEY
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) end
                 END-IF
                 MOVE  WRK-ETC-ITBFTN-G      TO  MF100-FTNMONEY
                 MOVE  1                     TO  MF100-SHOSAISIN
               END-IF
      *=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) end
      *=== 743の場合の備考欄印字修正 by Yoshikawa(2013/06/10) start
             END-IF
      *=== 743の場合の備考欄印字修正 by Yoshikawa(2013/06/10) end
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== 特疾＋957等の印字修正 by Yoshikawa(2012/07/12) start
      *    高額療養費チェック
      *    特疾＋957等も高額認定されてしまうので、FLG4を判断して回避
           IF  RECE02-FLG(4)  =  ZERO
             IF   RECE02-ZAITAKU  NOT =  SPACE
             AND  RECE02-ZAITAKU  NOT =  "1"
               IF  RECE02-FTNMONEY (1)  NOT =  ZERO
                 MOVE  RECE02-FTNMONEY (1)     TO  MF100-KOGAKU
               ELSE
                 COMPUTE  MF100-KOGAKU  =  RECE02-TOTALTEN (1)
                                        *  RECE02-KYURATE  /  10
               END-IF
             END-IF
           END-IF
      *=== 特疾＋957等の印字修正 by Yoshikawa(2012/07/12) end
      *
      *    長期編集
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) start
      *     IF     FLG-TYOKI             =      1   AND
      *            WRK-SEIKYUGK-G        >  10000
           IF     FLG-TYOKI             =      1
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) start
           AND    WRK-SEIKYUGK-G       >=  10000
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) end
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) end
             MOVE    1                 TO  MF100-TYOKI
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) start
      *       MOVE    10000             TO  WRK-SEIKYUGK-G
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) start
      *       IF   WRK-SEIKYUGK-G        >  10000
      *         MOVE    10000           TO  WRK-SEIKYUGK-G
      *       END-IF
             MOVE    10000             TO  WRK-SEIKYUGK-G
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) end
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) end
             MOVE    ZERO              TO  MF100-TOTALTEN
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) start
             MOVE    ZERO              TO  MF100-KOGAKU
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) end
             IF      MF100-FTNMONEY     >  10000
               MOVE  10000             TO  MF100-FTNMONEY
             END-IF
      *=== 一部負担金が長期の上限額を超えるのを修正 by Yoshikawa(2009/10/05) start
             IF      MF100-ETCFTNMONEY  >  10000
               MOVE  10000             TO  MF100-ETCFTNMONEY
             END-IF
      *=== 一部負担金が長期の上限額を超えるのを修正 by Yoshikawa(2009/10/05) end
           END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
      *    長期上位
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) start
      *     IF     FLG-TYOKI             =      2   AND
      *            WRK-SEIKYUGK-G        >  20000
           IF     FLG-TYOKI             =      2
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) start
           AND    WRK-SEIKYUGK-G       >=  20000
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) end
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) end
             MOVE    1                 TO  MF100-TYOKI
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) start
      *       MOVE    20000             TO  WRK-SEIKYUGK-G
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) start
      *       IF   WRK-SEIKYUGK-G        >  20000
      *         MOVE    20000           TO  WRK-SEIKYUGK-G
      *       END-IF
             MOVE    20000             TO  WRK-SEIKYUGK-G
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) end
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) end
             MOVE    ZERO              TO  MF100-TOTALTEN
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) start
             MOVE    ZERO              TO  MF100-KOGAKU
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) end
             IF      MF100-FTNMONEY     >  20000
               MOVE  20000             TO  MF100-FTNMONEY
             END-IF
      *=== 一部負担金が長期の上限額を超えるのを修正 by Yoshikawa(2009/10/05) start
             IF      MF100-ETCFTNMONEY  >  20000
               MOVE  20000             TO  MF100-ETCFTNMONEY
             END-IF
      *=== 一部負担金が長期の上限額を超えるのを修正 by Yoshikawa(2009/10/05) end
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    結核・精神編集
           IF     MF100-KESE-FLG    NOT =  SPACE
             MOVE    ZERO               TO  MF100-TOTALTEN
           END-IF
      *
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) start
      *      在総診・在医総か
             IF  RECE02-ZAITAKU  NOT =  1
               PERFORM  960-SRYACT-SET-SEC
             END-IF
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) end
      *
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) start
      **---(01.00.04) LINE ADD START ------------------------------------
      **    高額療養費チェック（入院のみ）
      **=== 外来も高額限度額を印字する by Yoshikawa(2012/04/09) start
      **     IF  RECE02-NYUGAIKBN  =  "1"
      **=== 外来も高額限度額を印字する by Yoshikawa(2012/04/09) end
      *       IF   RECE02-ZAITAKU  NOT =  SPACE
      *       AND  RECE02-ZAITAKU  NOT =  "1"
      *         IF  RECE02-FTNMONEY (1)  NOT =  ZERO
      *           MOVE  RECE02-FTNMONEY (1)     TO  MF100-KOGAKU
      *         ELSE
      *           COMPUTE  MF100-KOGAKU  =  RECE02-TOTALTEN (1)
      *                                  *  RECE02-KYURATE  /  10
      *         END-IF
      **---(01.00.05) LINE ADD START ------------------------------------
      **       ELSE
      **           COMPUTE  MF100-KOGAKU  =  RECE02-TOTALTEN (1)
      **                                  *  RECE02-KYURATE  /  10
      **---(01.00.05) LINE ADD END   ------------------------------------
      *       END-IF
      **=== 外来も高額限度額を印字する by Yoshikawa(2012/04/09) start
      **     END-IF
      **=== 外来も高額限度額を印字する by Yoshikawa(2012/04/09) end
      **---(01.00.04) LINE ADD END   ------------------------------------
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) end
      *
      *    保険限度額判定
           IF  RECE02-FTNMONEY(1)       <  WRK-SEIKYUGK-G  AND
               RECE02-FTNMONEY(1)       >  ZERO
             MOVE  RECE02-FTNMONEY(1)  TO  WRK-SEIKYUGK-G
           END-IF
      *
      *    件数加算場所を判定
           IF    MF100-TOTALTEN         =  ZERO  OR
                 RECE02-RJNHKNNUM   NOT =  SPACE OR
      *---(01.00.10) LINE ADD START ------------------------------------
                 MF100-HKNNUM           =  "039" OR
                 MF100-HKNNUM           =  "040" OR
      *---(01.00.10) LINE ADD END   ------------------------------------
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) start
      *           RECE02-AGE            >=  70
                 RECE02-AGE            >=  70    OR
                 MF100-ZAITAKU          =  "1"
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) end
             IF  RECE02-RJNHKNNUM   NOT =  SPACE
      *---(01.00.10) LINE ADD START ------------------------------------
             OR  MF100-HKNNUM           =  "039"
             OR  MF100-HKNNUM           =  "040"
      *---(01.00.10) LINE ADD END   ------------------------------------
               MOVE     5              TO  MF100-KASAN-FLG
             ELSE
               MOVE     4              TO  MF100-KASAN-FLG
             END-IF
             MOVE    ZERO              TO  MF100-TOTALTEN
             MOVE    WRK-SEIKYUGK-G    TO  MF100-SEIKYUGK
           ELSE
             COMPUTE  MF100-SEIKYUGK   ROUNDED = WRK-KESE
      *---(01.00.04) LINE ADD START ------------------------------------
      *       EVALUATE  MF100-KYURATE
      *       WHEN 10
      *         MOVE     3              TO  MF100-KASAN-FLG
      *       WHEN 20
      *         MOVE     2              TO  MF100-KASAN-FLG
      *       WHEN OTHER
      *         MOVE     1              TO  MF100-KASAN-FLG
      *       END-EVALUATE
             IF  MF100-KOGAKU  NOT =  ZERO
               MOVE     3              TO  MF100-KASAN-FLG
             ELSE
               EVALUATE  MF100-KYURATE
               WHEN 20
                 MOVE     2            TO  MF100-KASAN-FLG
               WHEN OTHER
                 MOVE     1            TO  MF100-KASAN-FLG
               END-EVALUATE
             END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-IF
      *    一般患者用区分設定
           MOVE         2              TO  MF100-KBN
      *
      *    合計ファイル用にデータ退避
           INITIALIZE   WRK-TAIHI-TBL
           MOVE  MF100-FTNJANUM        TO  WRK-T-FTNJANUM
           MOVE  MF100-TOTALTEN        TO  WRK-T-TOTALTEN
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE  MF100-KOGAKU          TO  WRK-T-KOGAKU
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE  MF100-SEIKYUGK        TO  WRK-T-SEIKYUGK
           MOVE  MF100-FTNMONEY        TO  WRK-T-ITBFTN
           MOVE  MF100-KASAN-FLG       TO  WRK-T-KASAN-FLG
      *
           IF       FLG-ERR                    =   ZERO
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
           AND      FLG-ERR2                   =   ZERO
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
             WRITE    MF100-REC 
             ADD      1                 TO    CNT-MF100
      *
      *    合計用ファイル編集
             PERFORM  2002-GOKEI-HEN-SEC
      *
           ELSE
             DISPLAY "助成対象外患者番号="  RECE02-PTNUM
                     "点数="                RECE02-TOTALTEN(1)
                     "一部負担金"           MF100-FTNMONEY
                     "負担割合="            MF100-KYURATE
                     "公費番号="            MF100-KOHNUM
                     "診療年月="            MF100-SRYYM
           END-IF
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      **
      *****************************************************************
      *    合計ファイル編集処理
      *****************************************************************
       2002-GOKEI-HEN-SEC          SECTION.
      *
      *    合計ファイル編集
           INITIALIZE  MF100-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE     RECE02-HOSPID     TO    MF100-HOSPID
           MOVE     SPA-HOSPNUM       TO    MF100-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE     WRK-T-FTNJANUM    TO    MF100-FTNJANUM
           MOVE     1                 TO    MF100-KBN
      *    一時ファイル読み込み
           PERFORM  800-SKTTMP-READ-SEC
      *
           MOVE     WRK-T-KASAN-FLG   TO    IDX1
           ADD      1                 TO    MF100-GKENSU(IDX1)
                                            MF100-TOTAL-KENSU
           ADD      WRK-T-ITBFTN      TO    MF100-GITBFTN(IDX1)
      *=== 消費税改正対応 by Yoshikawa(2014/03/14) start
      *     ADD      210               TO    MF100-GTESURYO(IDX1)
      *    請求事務手数料
           IF  LNK-PRTKANRI-SRYYM  >=  WRK-CONS-201403
             ADD    216               TO    MF100-GTESURYO(IDX1)
           ELSE
             ADD    210               TO    MF100-GTESURYO(IDX1)
           END-IF
      *=== 消費税改正対応 by Yoshikawa(2014/03/14) end
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     EVALUATE  IDX1
      *     WHEN 1
      *     WHEN 2
      *     WHEN 3
      *       ADD   WRK-T-TOTALTEN     TO    MF100-GTENSU(IDX1)
      *       ADD   WRK-T-SEIKYUGK     TO    MF100-GTENSU(4)
      *     WHEN 4
      *     WHEN 5
      *       ADD   WRK-T-SEIKYUGK      TO   MF100-GTENSU(IDX1)
      *     END-EVALUATE
           EVALUATE  IDX1
           WHEN 1
           WHEN 2
             ADD   WRK-T-TOTALTEN     TO    MF100-GTENSU(IDX1)
             ADD   WRK-T-SEIKYUGK     TO    MF100-GTENSU(4)
           WHEN 3
             ADD   WRK-T-KOGAKU       TO    MF100-GTENSU(IDX1)
             ADD   WRK-T-SEIKYUGK     TO    MF100-GTENSU(4)
           WHEN 4
           WHEN 5
             ADD   WRK-T-SEIKYUGK      TO   MF100-GTENSU(IDX1)
           END-EVALUATE
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           IF      FLG-MF100  =  1
                   WRITE    MF100-REC
           ELSE
                   REWRITE  MF100-REC
           END-IF
      *
           .
       2002-GOKEI-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ２４３初診一部負担金相当額集計処理
      *****************************************************************
       2002-SYOSIN-CHK-SEC  SECTION.
      *
      *    初診チェック
      *    入院は診療会計より判定
           MOVE   ZERO                  TO  FLG-SYOSIN
           IF     SYU-NYUGAIKBN   =   "1"
             INITIALIZE        SRYACCT-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      ****** 05/09/14 yamaguchi UPD
      **       MOVE     PATH-TBL-SRYACCT-KEY3    TO  WRK-SRYACCT-PATH
      *       MOVE     PATH-TBL-SRYACCT-KEY14    TO  WRK-SRYACCT-PATH
             MOVE     "key14"                  TO  WRK-SRYACCT-PATH
      *---(01.00.08) LINE ADD END   ------------------------------------
      *****
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE     SYU-HOSPID               TO  ACCT-HOSPID
             MOVE     SPA-HOSPNUM              TO  ACCT-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
             MOVE     SYU-NYUGAIKBN            TO  ACCT-NYUGAIKBN
             MOVE     SYU-PTID                 TO  ACCT-PTID
      ***** 05/09/14 yamaguchi DEL
      *       MOVE     SYU-SRYKA                TO  ACCT-SRYKA
      *****
             MOVE     SYU-SRYYMD(1:6)          TO  ACCT-SRYYM
             MOVE     "11"                     TO  ACCT-SRYKBN
             PERFORM  900-SRYACCT-SELECT-SEC
             MOVE     SYU-SKYSTYMD(7:2) TO  IDX-STG(1:2)
             MOVE     SYU-SKYEDYMD(7:2) TO  IDX-EDG(1:2)
             DISPLAY  "請求開始日="  SYU-SKYSTYMD
             DISPLAY  "請求終了日="  SYU-SKYEDYMD
             DISPLAY  "開始IDX="  IDX-ST
             DISPLAY  "終了IDX="  IDX-ED
             PERFORM  UNTIL  FLG-SRYACCT  =   1  OR
                      FLG-SYOSIN          =   1
               PERFORM  UNTIL  IDX-ST  >  IDX-ED OR
                               IDX-ST  >  31     OR
                               FLG-SYOSIN        =   1
                 IF  ACCT-DAY(1 IDX-ST)   >   0
                   MOVE  1               TO   FLG-SYOSIN
                 END-IF
                 ADD    1                TO   IDX-ST
               END-PERFORM
               PERFORM  900-SRYACCT-FETCH-SEC
             END-PERFORM
             PERFORM  900-SRYACCT-CLOSE-SEC
      *    外来は受診履歴と診療会計より判定
           ELSE
             MOVE    ZERO    TO    FLG-JYURRK
             PERFORM  950-JYUSIN-SELECT-SEC
             PERFORM  UNTIL  FLG-JYURRK   =   1  OR
                      FLG-SYOSIN          =   1
               PERFORM  VARYING  IDX  FROM  1  BY  1
                        UNTIL    IDX  >    15  OR
                        JYURRK-ZAINUM(IDX)  =  ZERO OR SPACE
                 INITIALIZE        SRYACCT-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *           MOVE     PATH-TBL-SRYACCT-KEY5     TO  WRK-SRYACCT-PATH
      *           MOVE     JYURRK-HOSPID             TO  ACCT-HOSPID
                 MOVE     "key5"                    TO  WRK-SRYACCT-PATH
                 MOVE     SPA-HOSPNUM               TO  ACCT-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
                 MOVE     JYURRK-NYUGAIKBN          TO  ACCT-NYUGAIKBN
                 MOVE     JYURRK-PTID               TO  ACCT-PTID
                 MOVE     JYURRK-SRYKA              TO  ACCT-SRYKA
                 MOVE     JYURRK-SRYYMD(1:6)        TO  ACCT-SRYYM
                 MOVE     JYURRK-ZAINUM(IDX)        TO  ACCT-ZAINUM
                 PERFORM  900-SRYACCT-SELECT-SEC
                 PERFORM  900-SRYACCT-CLOSE-SEC
      ***** 05/09/14 yamaguchi DEL
      *           IF    ACCT-SRYKBN  =  "11"
      *             MOVE    1    TO    FLG-SYOSIN
      *             MOVE    15   TO    IDX
      *           END-IF
      ***** 05/09/14 yamaguchi INS
                 IF    ACCT-SRYKBN  =  "11"
                   MOVE    1    TO    FLG-SYOSIN
                   MOVE    15   TO    IDX
                 ELSE
      *
                   DISPLAY  "小児科外来診療料"
                   DISPLAY  "患者番号 = " RECE02-PTNUM
                            "ZAINUM = " ACCT-ZAINUM
      *
                   INITIALIZE  SRYACT-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *             MOVE  ACCT-HOSPID              TO  SRY-HOSPID
                   MOVE  SPA-HOSPNUM              TO  SRY-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
                   MOVE  ACCT-NYUGAIKBN           TO  SRY-NYUGAIKBN
                   MOVE  ACCT-PTID                TO  SRY-PTID
                   MOVE  ACCT-SRYKA               TO  SRY-SRYKA
                   MOVE  ACCT-SRYYM               TO  SRY-SRYYM
                   MOVE  ACCT-ZAINUM              TO  SRY-ZAINUM
                   MOVE  1                        TO  SRY-RENNUM
                   PERFORM  920-SRYACT-SET-SEC
      *
                   IF  SRY-SRYCD(1)  =  "113003510" OR "113003710"
                   OR  SRY-SRYCD(2)  =  "113003510" OR "113003710"
                   OR  SRY-SRYCD(3)  =  "113003510" OR "113003710"
                   OR  SRY-SRYCD(4)  =  "113003510" OR "113003710"
                   OR  SRY-SRYCD(5)  =  "113003510" OR "113003710"
      *
                     DISPLAY  "SRY-SRYCD(1) = " SRY-SRYCD(1)
      *
                     MOVE  1                      TO  FLG-SYOSIN
                     MOVE  15                     TO  IDX
                   END-IF
                 END-IF
      *****
               END-PERFORM
               PERFORM  950-JYUSIN-FETCH-SEC
             END-PERFORM
             PERFORM  950-JYUSIN-CLOSE-SEC
           END-IF
      *
      *    初診のデータの時のみ、初診時一部負担金相当額を算出
           IF    FLG-SYOSIN   =   1
             MOVE    ZERO    TO    WRK-SEIKYUGK
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL    IDX  >    4
               IF    SYU-KOH-HKNNUM(IDX) = "243"
                 IF    IDX  =  1
                   IF  MF100-RJNHKNNUM  =  SPACE
                     MOVE    SYU-SYUCOMPFTN-ENTANI TO    WRK-SEIKYUGK
                   ELSE
                     MOVE    SYU-KOH-COMPFTN-ENTANI(1)
                                                   TO    WRK-SEIKYUGK
                   END-IF
                 ELSE
                   MOVE  SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                                   TO  WRK-SEIKYUGK
                 END-IF
               END-IF
             END-PERFORM
             IF    WRK-SEIKYUGK    >    580
               ADD    580               TO    WRK-ETC-SYOSINFTN
             ELSE
               ADD    WRK-SEIKYUGK      TO    WRK-ETC-SYOSINFTN
             END-IF
           END-IF
      *
           .
       2002-SYOSIN-CHK-EXT.
           EXIT.
      *****************************************************************
      *    個別発行時の保険者番号(市町村番号)チェック処理
      *****************************************************************
       200111-HKNJANUM-CHK-SEC                SECTION.
      *
           INITIALIZE      WRK-HKNJANUM
           MOVE    "01"                     TO  WRK-HKNJANUM(1:2)
           MOVE    WRK-KOBETUCITYNUM(1:3)   TO  WRK-HKNJANUM(3:3)
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
                                   =   TBL-PARA-HKNJANUM(IDXX)(1:5)  OR
                         ( WRK-HKNJANUM(1:3)  =  "014"   AND
                           TBL-PARA-HKNJANUM(IDXX)(1:5)  =  "01400" )
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
               PERFORM  310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM  320-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM  330-PRINT-OUT-SEC
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
      *
           ADD     1    TO    CNT-PAGE
      *
           INITIALIZE                             SC07
      *
      *    対象年月
           MOVE    WRK-SRYYMWH               TO   SC07-PRTYM
      *
      *    請求年月日
           MOVE    WRK-SEIYMDWH              TO   SC07-SEIYMD
      *
      *    医療機関コード
           MOVE     SYS-1001-HOSPCD          TO   SC07-HOSPCD
      *---(01.00.08) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE     SYS-1002-ADRS            TO   SC07-ADRS
      *    医療機関名
      *     MOVE     SYS-1001-HOSPNAME        TO   SC07-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS              TO  SC07-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) start
           INSPECT SC07-ADRS                 REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) end
      *    医療機関名
           MOVE    WRK-HOSPNAME              TO  SC07-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) start
           INSPECT SC07-HOSPNAME             REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) end
      *---(01.00.08) LINE ADD END   ------------------------------------
      *    開設者名
           MOVE     SYS-1001-KAISETUNAME     TO   SC07-KAISETU
      *---(01.00.08) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE     SYS-1002-TEL             TO   SC07-TEL
      *    電話番号
           MOVE     WRK-HOSPTEL              TO   SC07-TEL
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    市町村名
           INITIALIZE                             WRK-HKNJANUM
           MOVE  "01"                        TO   WRK-HKNJANUM(1:2)
           MOVE  MF100-FTNJANUM(1:3)         TO   WRK-HKNJANUM(3:3)
           PERFORM  920-HKNJAINF-SET-SEC
           IF      HKNJA-HKNJANAME           =    SPACE
             MOVE    "長  様"                TO   SC07-CITYNAME(13:6)
           ELSE
      *---(01.00.06) LINE ADD START ------------------------------------
      *       STRING  HKNJA-HKNJANAME         DELIMITED  BY SPACE
      *               "長  様"          DELIMITED  BY SIZE
      *               INTO                    SC07-CITYNAME
      *       END-STRING
             IF  HKNJA-HKNJANAME(1:16)       =    "空知中部広域連合"
                 OR  HKNJA-HKNJANAME(1:16)   =    "大雪地区広域連合"
               STRING  HKNJA-HKNJANAME(19:)         DELIMITED  BY "〕"
                       "長  様"          DELIMITED  BY SIZE
                       INTO                    SC07-CITYNAME
               END-STRING
             ELSE
               STRING  HKNJA-HKNJANAME         DELIMITED  BY SPACE
                       "長  様"          DELIMITED  BY SIZE
                       INTO                    SC07-CITYNAME
               END-STRING
             END-IF
      *---(01.00.06) LINE ADD END ------------------------------------
           END-IF
      *
      *    合計用ファイル時の編集
           IF  MF100-KBN                     =    1
             MOVE     "SC0107.red"           TO   WRK-PRTID
             IF  MF100-TOTAL-KENSU           >    10
               MOVE   1                      TO   FLG-SYOKEI
             ELSE
               MOVE   ZERO                   TO   FLG-SYOKEI
             END-IF
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     5
               MOVE   MF100-GKENSU(IDX1)     TO   WRK-Z5
               MOVE   WRK-Z5                 TO   SC07-GKENSU(IDX1)
               MOVE   MF100-GTENSU(IDX1)     TO   WRK-Z9
               MOVE   WRK-Z9                 TO   SC07-GTENSU(IDX1)
               MOVE   MF100-GITBFTN(IDX1)    TO   WRK-Z7
               MOVE   WRK-Z7                 TO   SC07-GITBFTN(IDX1)
               MOVE   MF100-GTESURYO(IDX1)   TO   WRK-Z6
               MOVE   WRK-Z6                 TO   SC07-GTESURYO(IDX1)
             END-PERFORM
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           ELSE
             MOVE     "SC0108.red"           TO   WRK-PRTID
           END-IF
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
           INITIALIZE          SUM-AREA
           MOVE    KEY-NEW     TO   KEY-OLD 
      *
           PERFORM  VARYING    IDX1  FROM  1  BY  1
                    UNTIL      IDX1  >    10
                    OR         KEY-NEW  NOT    =   KEY-OLD
                    OR         FLG-PRINT       =   1
      * 
      *    診療年月
             MOVE    MF100-SRYYM         TO  WRK-SYMD (1:6)
             MOVE    "01"                TO  WRK-SYMD (7:2)
             PERFORM 31012-SEIWA-HEN-SEC
             MOVE    WRK-HENYMDG(5:4)    TO  SC07-SRYYM(IDX1)(1:4)
             MOVE    WRK-HENYMDG(11:4)   TO  SC07-SRYYM(IDX1)(5:4)
      *    受給者番号
             MOVE    MF100-JKYSNUM       TO  WRK-MAE-INPUT
             PERFORM 2009-HENKAN-SEC
             MOVE     ZERO     TO    IDX3
             PERFORM  VARYING  IDX2  FROM   1  BY  2
                      UNTIL    IDX2  >      14 OR
                      WRK-OUT-INPUT(IDX2:2) =  SPACE
               ADD    2        TO            IDX3
             END-PERFORM
             IF    IDX3    >    ZERO
               COMPUTE  IDX2  =  15 - IDX3
               MOVE  WRK-OUT-INPUT(1:IDX3)
                               TO  SC07-JKYSNUM(IDX1)(IDX2:IDX3)
             END-IF
      *
      *    受給者番号の空白を０に置き換える
           INSPECT SC07-JKYSNUM(IDX1)  REPLACING  ALL "  "  BY  "０"
      *
      *    氏名
             MOVE    MF100-NAME          TO  SC07-NAME(IDX1)
      *    入外区分
             IF      MF100-NYUGAIKBN     =   "1"
               MOVE  "○"                TO  SC07-NYUGAIKBN(IDX1 1)
             ELSE
               MOVE  "○"                TO  SC07-NYUGAIKBN(IDX1 2)
             END-IF
      *
      *    点数・請求金額・一部負担金
      *---(01.00.04) LINE ADD START ------------------------------------
      *       MOVE    MF100-TOTALTEN    TO  WRK-Z7
      *       EVALUATE  MF100-KYURATE
      *       WHEN 10
      *         MOVE    WRK-Z7          TO  SC07-TENSU9(IDX1)
      *       WHEN 20
      *         MOVE    WRK-Z7          TO  SC07-TENSU8(IDX1)
      *       WHEN OTHER
      *         MOVE    WRK-Z7          TO  SC07-TENSU7(IDX1)
      *       END-EVALUATE
      *    高額療養費
             IF  MF100-KOGAKU  NOT =  ZERO
               MOVE  MF100-KOGAKU      TO  WRK-Z7
               MOVE  WRK-Z7            TO  SC07-TENSU9(IDX1)
             ELSE
               MOVE    MF100-TOTALTEN  TO  WRK-Z7
               EVALUATE  MF100-KYURATE
               WHEN 20
                 MOVE    WRK-Z7        TO  SC07-TENSU8(IDX1)
               WHEN OTHER
                 MOVE    WRK-Z7        TO  SC07-TENSU7(IDX1)
               END-EVALUATE
             END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
             IF      MF100-RJNHKNNUM   NOT  =  SPACE
      *---(01.00.10) LINE ADD START ------------------------------------
             OR      MF100-HKNNUM           =  "039"
             OR      MF100-HKNNUM           =  "040"
      *---(01.00.10) LINE ADD END   ------------------------------------
               MOVE  MF100-SEIKYUGK    TO  WRK-Z7
               MOVE  WRK-Z7            TO  SC07-RJN(IDX1)
             ELSE
               MOVE  MF100-SEIKYUGK    TO  WRK-Z7
               MOVE  WRK-Z7            TO  SC07-ZNK(IDX1)
      *=== 高額と前期は前期高齢者のみ印字 by Yoshikawa(2013/03/18) start
      *        限度額欄にも値がある場合は、前期高齢者欄を優先
               IF  MF100-KOGAKU  NOT =  ZERO
      *=== 70歳未満で高額の場合の印字修正 by Yoshikawa(2013/06/10) start
               AND MF100-SEIKYUGK  NOT =  ZERO
      *=== 70歳未満で高額の場合の印字修正 by Yoshikawa(2013/06/10) end
                 MOVE  SPACE           TO  SC07-TENSU9(IDX1)
                 MOVE  ZERO            TO  MF100-KOGAKU
               END-IF
      *=== 高額と前期は前期高齢者のみ印字 by Yoshikawa(2013/03/18) end
             END-IF
      *
             IF    (MF100-RJNHKNNUM  NOT   =  SPACE  OR
      *---(01.00.10) LINE ADD START ------------------------------------
                    MF100-HKNNUM           =  "039"  OR
                    MF100-HKNNUM           =  "040"  OR
      *---(01.00.10) LINE ADD END   ------------------------------------
                    MF100-AGE          >=  70)       AND
      *---(01.00.05) LINE ADD START ------------------------------------
      *              MF100-KYURATE       =  20
                    (MF100-KYURATE      =  20        OR
                     MF100-KYURATE      =  30)
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE  "○"              TO  SC07-KOHKBN(IDX1 1)
             END-IF
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *       IF     MF100-ZAITAKU  NOT  =  SPACE
             IF     MF100-ZAITAKU  =  "1"
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE  "○"              TO  SC07-KOHKBN(IDX1 2)
      *=== 「在」に○がある場合「割」に○不要 by Uchida(2009/05/22) start
               MOVE  "　"              TO  SC07-KOHKBN(IDX1 1)
      *=== 「在」に○がある場合「割」に○不要 by Uchida(2009/05/22) end
             END-IF
      *
             IF     MF100-TYOKI         =  1
               MOVE  "○"              TO  SC07-KOHKBN(IDX1 3)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) start
               MOVE  "　"              TO  SC07-KOHKBN(IDX1 1)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) end
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) start
      *       END-IF
             ELSE
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) end
      *
             EVALUATE  MF100-KESE-FLG
             WHEN  "010"
             WHEN  "011"
               MOVE  "○"              TO  SC07-KOHKBN(IDX1 4)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) start
               MOVE  "　"              TO  SC07-KOHKBN(IDX1 1)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) end
             WHEN  "020"
             WHEN  "021"
               MOVE  "○"              TO  SC07-KOHKBN(IDX1 5)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) start
               MOVE  "　"              TO  SC07-KOHKBN(IDX1 1)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) end
             WHEN  "015"
             WHEN  "016"
               MOVE  "○"              TO  SC07-KOHKBN(IDX1 6)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) start
               MOVE  "　"              TO  SC07-KOHKBN(IDX1 1)
      *=== 割以外に○がある場合、割に○不要 by Yoshikawa(2009/07/10) end
             END-EVALUATE
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) start
             END-IF
      *=== 上限額が低い方に○を印字 by Yoshikawa(2009/12/17) end
      *
             IF    (MF100-KOHNUM  =  "243"  AND
                    MF100-ETCFTNMONEY   >  0) OR
                   (MF100-KOHNUM  =  "543")
               MOVE  MF100-ETCFTNMONEY TO  WRK-Z6
               MOVE  "○"              TO  SC07-MARU(IDX1)
             ELSE
               MOVE  MF100-FTNMONEY    TO  WRK-Z6
             END-IF
             MOVE  WRK-Z6              TO  SC07-ITBFTN(IDX1)
             IF     MF100-KOHNUM  =  "143"  OR
                    MF100-KOHNUM  =  "243"
      *
      *  一部負担金欄に金額を記載する時のみ◯をする
               IF  MF100-FTNMONEY      >   ZERO  OR
                   MF100-ETCFTNMONEY   >   ZERO
                 MOVE    "◯"          TO  SC07-FTNMARU(IDX1 1)
               END-IF
             ELSE
               MOVE  "○"              TO  SC07-FTNMARU(IDX1 2)
             END-IF
      *---(01.00.03) LINE ADD START ------------------------------------
      *    旭川市で初診の場合は備考欄印字
      *---(01.00.05) LINE ADD START ------------------------------------
      *       IF  MF100-KOHNUM  =  "643"
             IF  MF100-SHOSAISIN  =  1
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) start
      **=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) start
      *         IF  MF100-FTNMONEY  =  ZERO
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) end
                 MOVE  MF100-ETCFTNMONEY  TO  WRK-Z3
                 MOVE  WRK-Z3          TO  SC07-BIKO1(IDX1)
                 MOVE  "○"            TO  SC07-BIKO2(IDX1)
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) start
      *         ELSE
      **=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) end
      *           MOVE  "580"           TO  SC07-BIKO1(IDX1)
      *           MOVE  "○"            TO  SC07-BIKO2(IDX1)
      **=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) start
      *         END-IF
      **=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) end
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) end
             END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    小計加算
             MOVE    MF100-KASAN-FLG   TO  IDX2
             ADD     1                 TO  SUM-KENSU(IDX2)
      *---(01.00.04) LINE ADD START ------------------------------------
      *       EVALUATE  MF100-KYURATE
      *       WHEN 10
      *         ADD     MF100-TOTALTEN  TO  SUM-TENSU9
      *       WHEN 20
      *         ADD     MF100-TOTALTEN  TO  SUM-TENSU8
      *       WHEN OTHER
      *         ADD     MF100-TOTALTEN  TO  SUM-TENSU7
      *       END-EVALUATE
             IF  MF100-KOGAKU  NOT =  ZERO
               ADD  MF100-KOGAKU        TO  SUM-TENSU9
             ELSE
               EVALUATE  MF100-KYURATE
               WHEN 20
                 ADD     MF100-TOTALTEN  TO  SUM-TENSU8
               WHEN OTHER
                 ADD     MF100-TOTALTEN  TO  SUM-TENSU7
               END-EVALUATE
             END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
             IF     MF100-RJNHKNNUM NOT =  SPACE
      *---(01.00.10) LINE ADD START ------------------------------------
             OR     MF100-HKNNUM        =  "039"
             OR     MF100-HKNNUM        =  "040"
      *---(01.00.10) LINE ADD END   ------------------------------------
               ADD     MF100-SEIKYUGK  TO  SUM-RJN
             ELSE
               ADD     MF100-SEIKYUGK  TO  SUM-ZNK
             END-IF
             ADD    MF100-FTNMONEY     TO  SUM-ITBFTN
      *    一時ファイル読込
             PERFORM   900-TMP-READ-SEC
           END-PERFORM
      *
      *    １１件以上明細が有る場合のみ小計編集
           IF     FLG-SYOKEI     =     1
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     5
               MOVE  SUM-KENSU(IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5            TO  SC07-SKENSU(IDX1)
             END-PERFORM
             MOVE  SUM-TENSU7          TO  WRK-Z7
             MOVE  WRK-Z7              TO  SC07-STENSU7
             MOVE  SUM-TENSU8          TO  WRK-Z7
             MOVE  WRK-Z7              TO  SC07-STENSU8
             MOVE  SUM-TENSU9          TO  WRK-Z7
             MOVE  WRK-Z7              TO  SC07-STENSU9
             MOVE  SUM-ZNK             TO  WRK-Z7
             MOVE  WRK-Z7              TO  SC07-SZNK
             MOVE  SUM-RJN             TO  WRK-Z7
             MOVE  WRK-Z7              TO  SC07-SRJN
             MOVE  SUM-ITBFTN          TO  WRK-Z7
             MOVE  WRK-Z7              TO  SC07-SITBFTN
           END-IF
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
           MOVE   WRK-PRTID            TO  SPRT-PRTID
      *=== 帳票タイトル修正 by Yoshikawa(2012/07/12) start
      *     MOVE    "重度心身障害者医療費請求書"
           MOVE    "重度心身障がい者医療費請求書"
      *=== 帳票タイトル修正 by Yoshikawa(2012/07/12) end
                                    TO  SPRT-TITLE
           MOVE    SC07             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
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
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) start
      *     MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      **---(01.00.08) LINE ADD START ------------------------------------
      **     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      **     CALL    "MCPSUB"             USING
      **                                  MCPAREA
      **                                  MCPDATA-REC
      *     MOVE    "tbl_kohsky"        TO  MCP-TABLE
      *     MOVE    "key2"              TO  MCP-PATHNAME
      *     CALL    "ORCDBMAIN"         USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
      *                                 SPA-AREA
      **---(01.00.08) LINE ADD END   ------------------------------------
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) end
      *
           CLOSE  MF100-FILE
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU0107 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU0107 OUT "  CNT-MF100
           DISPLAY "*** SEIKYU0107 END ***"
      *
           IF  CNT-MF100  =  0
             DISPLAY "DATA NOT FOUND. PRINT JOB CANCEL!!"
           END-IF
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  MF100-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
               NOT  AT  END
                   MOVE  MF100-FTNJANUM       TO  KEY-N-FTNJANUM
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       800-SKTTMP-READ-SEC             SECTION.
      *
           READ    MF100-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-MF100
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-MF100
           END-READ
           .
       800-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    WRK-PARA-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) start
               PERFORM 900-KOHSKY-CLOSE-SEC
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) end
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
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *---(01.00.03) LINE ADD START ------------------------------------
      **         IF  RECE02-KOHNUM(1) = "143" OR "243" OR "343" OR "543"
      **          OR RECE02-KOHNUM(2) = "143" OR "243" OR "343" OR "543"
      **          OR RECE02-KOHNUM(3) = "143" OR "243" OR "343" OR "543"
      **          OR RECE02-KOHNUM(4) = "143" OR "243" OR "343" OR "543"
      *         IF  RECE02-KOHNUM(1) = "143" OR "243" OR "343" OR "543"
      *                             OR "643"
      *         OR  RECE02-KOHNUM(2) = "143" OR "243" OR "343" OR "543"
      *                             OR "643"
      *         OR  RECE02-KOHNUM(3) = "143" OR "243" OR "343" OR "543"
      *                             OR "643"
      *         OR  RECE02-KOHNUM(4) = "143" OR "243" OR "343" OR "543"
      *                             OR "643"
      *---(01.00.03) LINE ADD END   ------------------------------------
               IF  RECE02-KOHNUM(1) = "143" OR "243" OR "343" OR "543"
                                   OR "643" OR "743" OR "843"
               OR  RECE02-KOHNUM(2) = "143" OR "243" OR "343" OR "543"
                                   OR "643" OR "743" OR "843"
               OR  RECE02-KOHNUM(3) = "143" OR "243" OR "343" OR "543"
                                   OR "643" OR "743" OR "843"
               OR  RECE02-KOHNUM(4) = "143" OR "243" OR "343" OR "543"
                                   OR "643" OR "743" OR "843"
      *---(01.00.05) LINE ADD END   ------------------------------------
      *        テスト患者のときは読み飛ばす
                   MOVE    SPACE               TO  PTINF-REC
                   INITIALIZE                      PTINF-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *             MOVE    RECE02-HOSPID       TO  PTINF-HOSPID
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
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
                           MOVE    ZERO        TO  FLG-ERR
                         END-IF
                     END-PERFORM 
                   END-IF
                   DISPLAY "患者番号=" RECE02-PTNUM
                           "負担者番号=" RECE02-KOHFTNJANUM(1)
                           "保険者番号=" RECE02-HKNJANUM
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
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) start
               PERFORM 900-KOHSKY-CLOSE-SEC
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) end
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) start
      *****************************************************************
      *    公費請求書マスタクローズ
      *****************************************************************
       900-KOHSKY-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"       TO  MCP-FUNC
           MOVE    "tbl_kohsky"          TO  MCP-TABLE
           MOVE    "key2"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
           .
       900-KOHSKY-CLOSE-EXT.
           EXIT.
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) end
      *
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
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
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
      *
           IF       RECE02-RJNHKNNUM   =  SPACE
             IF     RECE02-FTNMONEY(1) >  ZERO
               MOVE   SYU-SYUCOMPFTN            TO  WRK-SEIKYUGK
             ELSE
               MOVE   SYU-SYUCOMPFTN-ENTANI     TO  WRK-SEIKYUGK
             END-IF
           ELSE
             IF     RECE02-FTNMONEY(1) >  ZERO
               MOVE   SYU-KOH-COMPFTN(1)        TO  WRK-SEIKYUGK  
             ELSE
               MOVE   SYU-KOH-COMPFTN-ENTANI(1) TO  WRK-SEIKYUGK  
             END-IF
           END-IF
      *
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >     4  OR
                    SYU-KOH-HKNNUM(IDX) =  SPACE
      *
      *    公費併用判定
             EVALUATE  SYU-KOH-HKNNUM(IDX)
             WHEN "010"
             WHEN "011"
             WHEN "015"
             WHEN "016"
             WHEN "020"
             WHEN "021"
               IF  RECE02-FTNMONEY(1)        >   ZERO
                 MOVE    SYU-KOH-COMPFTN(IDX)  TO  WRK-SEIKYUGK
                 ADD     SYU-KOH-COMPFTN(IDX)  TO  WRK-KESE
               ELSE
                 MOVE    SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-SEIKYUGK
                 ADD     SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-KESE
               END-IF
               ADD     SYU-TOTAL-HKNTEN      TO  WRK-KOHTENSU
               MOVE    SYU-KOH-HKNNUM(IDX)   TO  MF100-KESE-FLG
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) start
      *         MOVE    ZERO                  TO  FLG-ERR
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) end
      *=== 外来更生等は記載する by Yoshikawa(2009/01/15) start
               IF  RECE02-NYUGAIKBN  =  "2"
                 MOVE  ZERO                  TO  FLG-ERR
               END-IF
      *=== 外来更生等は記載する by Yoshikawa(2009/01/15) end
             WHEN "972"
               MOVE    1                     TO  FLG-TYOKI
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) start
      *         MOVE    ZERO                  TO  FLG-ERR
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) end
      *---(01.00.05) LINE ADD START ------------------------------------
             WHEN "974"
               MOVE    2                     TO  FLG-TYOKI
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) start
      *         MOVE    ZERO                  TO  FLG-ERR
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) end
      *---(01.00.05) LINE ADD END   ------------------------------------
             END-EVALUATE
      *
      *    計算負担金に差が有る場合、地方公費の助成があったと判定する
             IF     FLG-ERR                 =  1
               IF   SYU-KOH-HKNNUM(IDX)(1:1) NOT = "0" AND "9"
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
             END-IF
      *
      *    ５４３を使用している場合、点数の１割相当額を集計する
             IF  SYU-KOH-HKNNUM(IDX)  =  "543"
               PERFORM  8001-SEIKYU-SEC
             END-IF
      *
      *=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) start
      *    旭川障の場合、初診時一部負担金との差額を記載
      *    （本体側でSYU-KOH-COMPFTN-ENTANIに計算済み）
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) start
      *       IF  SYU-KOH-HKNNUM(IDX)  =  "643" OR "743"
             IF  SYU-KOH-HKNNUM(IDX)  =  "643"
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) end
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) start
               IF  SYU-KOH-COMPFTN-ENTANI(IDX)  =  ZERO
      *          市助成分を集計
                 ADD  SYU-KOH-COMPFTN(IDX)         TO  WRK-ASAHIFTN
               END-IF
      *        初診判定用にCOMPFTN集計
               ADD    SYU-KOH-COMPFTN(IDX)         TO  WRK-COMPFTN
      *=== 旭川市の備考欄金額計算修正 by Yoshikawa(2013/03/18) end
               ADD    SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-ETC-ITBFTN
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) start
             ELSE
               IF  SYU-KOH-HKNNUM(IDX)  =  "743"
                 IF  SYU-KOH-COMPFTN-ENTANI(IDX)  =  ZERO
      *            市助成分を集計
                   ADD  SYU-SYUCOMPFTN-ENTANI      TO  WRK-ASAHIFTN
                 END-IF
                 ADD  SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-ETC-ITBFTN
               END-IF
      *=== 743使用時の備考欄の金額修正 by Yoshikawa(2014/03/10) end
             END-IF
      *=== 旭川市の一部負担金計算修正 by Yoshikawa(2012/12/13) end
      *
      *=== 公費の助成判定変更 by Yoshikawa(2009/09/29) start
      *    長期及び全国公費を併用している場合は公費の助成がなくても記載
             IF  SYU-KOH-HKNNUM(IDX)(1:1)  =  "0"
             OR  SYU-KOH-HKNNUM(IDX)       =  "972"
             OR  SYU-KOH-HKNNUM(IDX)       =  "974"
                MOVE  ZERO                 TO  FLG-ERR
             END-IF
      *=== 公費の助成判定変更 by Yoshikawa(2009/09/29) end
      *
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) start
      **=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
      **    同保険、同入外区分で診療が複数日ある場合は処理判定を行わない
      **    （その前の診療で全国公費の負担があるから）
      *       IF  SYU-KOH-HKNNUM(IDX)(1:1)  =  "0" 
      *       AND WRK-SRYCNT  <  2
      **        窓口負担が発生しない全国公費は印字対象外
      *         IF  SYU-KOH-COMPFTN-ENTANI(IDX)  =  ZERO
      *           MOVE  1                   TO  FLG-ERR2
      *         END-IF
      *       END-IF
      **=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
             IF  FLG-SYORI2  =  ZERO
               IF  SYU-KOH-HKNNUM(IDX)(1:1)  =  "0" 
      *=== 負担無しの道難病は印字対象外 by Yoshikawa(2015/08/12) start
               OR  SYU-KOH-HKNNUM(IDX)       =  "283" OR "383"
      *=== 負担無しの道難病は印字対象外 by Yoshikawa(2015/08/12) end
                 MOVE  1                   TO  FLG-ERR2
      *
      *          窓口負担が発生しない全国公費は印字対象外
                 IF  SYU-KOH-COMPFTN-ENTANI(IDX)  NOT =  ZERO
                   MOVE  ZERO              TO  FLG-ERR2
                   MOVE  1                 TO  FLG-SYORI2
                 END-IF
               END-IF
             END-IF
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) end
      *
           END-PERFORM
      *
           ADD     WRK-SEIKYUGK            TO  WRK-SEIKYUGK-G2
      *
           .
       800-SEIKYU-SEC-EXT.
           EXIT.
      *
      *****************************************************************
      *    １割相当額計算
      *****************************************************************
       8001-SEIKYU-SEC  SECTION.
      *
           MOVE  SYU-TOTAL-HKNTEN         TO  WRK-KEISAN
      *    保険に限度額がある場合は１０円単位
           IF  RECE02-FTNMONEY(1)  >  ZERO
      *
      *    点数の１割分の金額を四捨五入
             DISPLAY "四捨五入前=" SYU-TOTAL-HKNTEN
             DIVIDE  SYU-TOTAL-HKNTEN  BY  10  GIVING  WRK-KEISAN
                     REMAINDER  WRK-AMARI
             COMPUTE  WRK-KEISAN  =  SYU-TOTAL-HKNTEN - WRK-AMARI
             IF  WRK-AMARI     >     4
               ADD  10                     TO  WRK-KEISAN
             END-IF
             DISPLAY "四捨五入後=" WRK-KEISAN
             IF  IDX     =     1
               IF  SYU-SYUCOMPFTN         <  WRK-KEISAN
                 ADD  SYU-SYUCOMPFTN         TO WRK-ETC-ITBFTN
               ELSE
                 ADD  WRK-KEISAN             TO WRK-ETC-ITBFTN
               END-IF
             ELSE
               IF SYU-KOH-COMPFTN(IDX - 1) < WRK-KEISAN
                 ADD  SYU-KOH-COMPFTN(IDX - 1)
                                             TO WRK-ETC-ITBFTN
               ELSE
                 ADD  WRK-KEISAN             TO WRK-ETC-ITBFTN
               END-IF
             END-IF
      *
      *
           ELSE
      *
      *    限度額が無い場合は１円単位
             IF  IDX     =     1
               IF  SYU-SYUCOMPFTN-ENTANI  <  WRK-KEISAN
                 ADD  SYU-SYUCOMPFTN-ENTANI  TO WRK-ETC-ITBFTN
               ELSE
                 ADD  WRK-KEISAN             TO WRK-ETC-ITBFTN
               END-IF
             ELSE
               IF SYU-KOH-COMPFTN-ENTANI(IDX - 1) < WRK-KEISAN
                 ADD  SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                             TO WRK-ETC-ITBFTN
               ELSE
                 ADD  WRK-KEISAN             TO WRK-ETC-ITBFTN
               END-IF
             END-IF
           END-IF
      *
           .
       8001-SEIKYU-EXT.
           EXIT.
      *
      *****************************************************************
      *  収納情報セット
      *****************************************************************
       920-SYUNOU-SET-SEC  SECTION.
      *
             INITIALIZE  SYUNOU-REC
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) start
                         FLG-SYORI2
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) end
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
             MOVE   1                 TO  WRK-SRYCNT
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE  RECE02-HOSPID      TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"           USING
      *                                MCPAREA
      *                                MCPDATA-REC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH         TO  MCP-PATH
               MOVE  "tbl_syunou"       TO  MCP-TABLE
               MOVE  WRK-PATH           TO  MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *
                        PERFORM  800-SEIKYU-SEC
      *
      *              243のみ使用している場合、一部負担金相当額を集計する
                        IF     MF100-KOHNUM  =  "243"
                          PERFORM  2002-SYOSIN-CHK-SEC
                        END-IF
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) start
                        ADD  1          TO  WRK-SRYCNT
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/22) end
      *
                      END-IF
      *
                   END-IF
                 END-IF
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH        TO  MCP-PATH
                 MOVE  "tbl_syunou"     TO  MCP-TABLE
                 MOVE  WRK-PATH         TO  MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"     USING
      *                          MCPAREA
      *                          MCPDATA-REC
             MOVE  "tbl_syunou"         TO  MCP-TABLE
             MOVE  WRK-PATH             TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"          USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *****************************************************************
      *    保険組合せマスター読み込み
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                      HKNCOMBI-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    SYU-HOSPID                 TO  COMB-HOSPID
           MOVE    SPA-HOSPNUM                TO  COMB-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    SYU-PTID                   TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM            TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"        TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hkncombi"        TO  MCP-TABLE
               MOVE    "key"                 TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"           USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"        TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *    診療行為情報   2005/09/14 yamaguchi INS
      *****************************************************************
       920-SRYACT-SET-SEC         SECTION.
      *
           MOVE    SRYACT-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACT-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_sryact"       TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC               =   ZERO
                   MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SRYACT-KEY     TO  MCP-PATH
      *             CALL    "MCPSUB"                USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
                   MOVE    "tbl_sryact"       TO  MCP-TABLE
                   MOVE    "key"              TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"        USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
                   IF      MCP-RC              =   ZERO
                           MOVE    MCPDATA-REC     TO  SRYACT-REC
                           MOVE    ZERO            TO  FLG-SRYACT
                   ELSE
                           MOVE   1               TO  FLG-SRYACT
                           INITIALIZE             SRYACT-REC
                   END-IF
           ELSE
                   MOVE   1               TO  FLG-SRYACT
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACT-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_sryact"       TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           .
       920-SRYACT-SET-EXT.
           EXIT.
      *****************************************************************
      *   保険番号情報セット(上限額取得)
      *****************************************************************
       940-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKN-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  "343"                       TO  HKN-HKNNUM
      *=== key変更 by Yoshikawa(2015/06/11) start
           MOVE  LNK-PRTKANRI-SRYYM(1:6)     TO  HKN-TEKSTYMD(1:6)
                                                 HKN-TEKEDYMD(1:6)
           MOVE  "01"                        TO  HKN-TEKSTYMD(7:2)
                                                 HKN-TEKEDYMD(7:2)
      *=== key変更 by Yoshikawa(2015/06/11) end
           MOVE  HKNNUM-REC                  TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknnum"       TO  MCP-TABLE
      *=== key変更 by Yoshikawa(2015/06/11) start
      *     MOVE    "key2"             TO  MCP-PATHNAME
           MOVE    "key5"             TO  MCP-PATHNAME
      *=== key変更 by Yoshikawa(2015/06/11) end
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             PERFORM  945-HKNNUM-READ-SEC
      *
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknnum"       TO  MCP-TABLE
      *=== key変更 by Yoshikawa(2015/06/11) start
      *     MOVE    "key2"             TO  MCP-PATHNAME
           MOVE    "key5"             TO  MCP-PATHNAME
      *=== key変更 by Yoshikawa(2015/06/11) end
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           .
       940-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険組合せ情報読込
      *****************************************************************
       945-HKNNUM-READ-SEC  SECTION.
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2      TO  MCP-PATH
      *     MOVE  "DBFETCH"                 TO  MCP-FUNC
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           MOVE    "DBFETCH"          TO  MCP-FUNC
           MOVE    "tbl_hknnum"       TO  MCP-TABLE
      *=== key変更 by Yoshikawa(2015/06/11) start
      *     MOVE    "key2"             TO  MCP-PATHNAME
           MOVE    "key5"             TO  MCP-PATHNAME
      *=== key変更 by Yoshikawa(2015/06/11) end
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
      *
             IF  SYS-1001-SYOHOKBN   =   "0"
               MOVE  HKN-HON-GAIMNAIJGNGAK  TO  WRK-G-JOUGENGK
             ELSE
               MOVE  HKN-HON-GAIMGAIJGNGAK  TO  WRK-G-JOUGENGK
             END-IF
             MOVE  HKN-HON-NYUMJGNGAK       TO  WRK-N-JOUGENGK
             DISPLAY "外来上限額=" WRK-G-JOUGENGK
             DISPLAY "入院上限額=" WRK-N-JOUGENGK
      *
             IF    HKN-HKNNUM  =  "051"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "特定疾患"   TO   HKN-TANSEIDONAME
             END-IF
      *
           ELSE
             INITIALIZE  HKNNUM-REC
             MOVE  1            TO  FLG-HKNNUM
           END-IF
      *
           .
       945-HKNNUM-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    受診履歴情報検索   
      *****************************************************************
       950-JYUSIN-SELECT-SEC   SECTION.
      *
           INITIALIZE                       JYURRK-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    SYU-HOSPID                  TO  JYURRK-HOSPID
           MOVE    SPA-HOSPNUM                 TO  JYURRK-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    SYU-PTID                    TO  JYURRK-PTID
           MOVE    SYU-NYUGAIKBN               TO  JYURRK-NYUGAIKBN
           MOVE    SYU-DENPNUM                 TO  JYURRK-DENPNUM
           MOVE    JYURRK-REC                  TO  MCPDATA-REC
           MOVE    "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-JYURRK-KEY6        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_jyurrk"       TO  MCP-TABLE
           MOVE    "key6"             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-JYURRK
               PERFORM  950-JYUSIN-FETCH-SEC
           ELSE
               MOVE    1                   TO  FLG-JYURRK
               INITIALIZE                  JYURRK-REC
           END-IF
      *
           .
       950-JYUSIN-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    受診履歴情報FETCH    
      *****************************************************************
       950-JYUSIN-FETCH-SEC  SECTION.
      *
           MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-JYURRK-KEY6       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_jyurrk"       TO  MCP-TABLE
           MOVE    "key6"             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC         TO  JYURRK-REC
               MOVE    ZERO                TO  FLG-JYURRK
           ELSE
               MOVE    1                   TO  FLG-JYURRK
               INITIALIZE                  JYURRK-REC
           END-IF
      *
           .
       950-JYUSIN-FETCH-EXT.
           EXIT.
      *
      *****************************************************************
      *    受診履歴情報CLOSE    
      *****************************************************************
       950-JYUSIN-CLOSE-SEC  SECTION.
      *
      *
           MOVE    "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-JYURRK-KEY6     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_jyurrk"       TO  MCP-TABLE
           MOVE    "key6"             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           .
       950-JYUSIN-CLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    診療会計情報SELECT  
      *****************************************************************
       900-SRYACCT-SELECT-SEC         SECTION.
      *
           MOVE    SRYACCT-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    WRK-SRYACCT-PATH     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_sryacct"      TO  MCP-TABLE
           MOVE    WRK-SRYACCT-PATH   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC           =   ZERO
                   MOVE   ZERO            TO  FLG-SRYACCT
                   PERFORM  900-SRYACCT-FETCH-SEC
           ELSE
                   MOVE   1               TO  FLG-SRYACCT
           END-IF
      *
           .
       900-SRYACCT-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    診療会計情報１件読み込み
      *****************************************************************
       900-SRYACCT-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"            TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    WRK-SRYACCT-PATH     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_sryacct"      TO  MCP-TABLE
           MOVE    WRK-SRYACCT-PATH   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC     TO  SRYACCT-REC
                   MOVE    ZERO            TO  FLG-SRYACCT
           ELSE
                   MOVE    1               TO  FLG-SRYACCT
           END-IF
           .
       900-SRYACCT-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    診療行為情報クローズ  
      *****************************************************************
       900-SRYACCT-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    WRK-SRYACCT-PATH       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_sryacct"      TO  MCP-TABLE
           MOVE    WRK-SRYACCT-PATH   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           .
       900-SRYACCT-CLOSE-EXT.
           EXIT.
      *****************************************************************
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID              TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                  TO  HKNJA-HOSPNUM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM                 TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                 TO  MCPDATA-REC
           MOVE  "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2       TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE  "tbl_hknjainf"     TO  MCP-TABLE
           MOVE  "key2"             TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             PERFORM  925-HKNJAINF-READ-SEC
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknjainf"     TO  MCP-TABLE
           MOVE  "key2"             TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2     TO  MCP-PATH
      *     MOVE  "DBFETCH"                  TO  MCP-FUNC
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           MOVE  "DBFETCH"          TO  MCP-FUNC
           MOVE  "tbl_hknjainf"     TO  MCP-TABLE
           MOVE  "key2"             TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
      *
      *    国保でない時は、読み直す
             IF    HKNJA-HKNNUM  NOT  =  "060" AND "067"
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
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) start
      *****************************************************************
      *  診療情報セット
      *****************************************************************
       960-SRYACT-SET-SEC  SECTION.
      *
             INITIALIZE  SRYACT-REC
             MOVE  SPA-HOSPNUM           TO  SRY-HOSPNUM
             MOVE  RECE02-NYUGAIKBN      TO  SRY-NYUGAIKBN
             MOVE  RECE02-PTID           TO  SRY-PTID
             MOVE  RECE02-SRYYM          TO  SRY-SRYYM
             MOVE  SRYACT-REC            TO  MCPDATA-REC
             MOVE  "DBSELECT"            TO  MCP-FUNC
             MOVE  "tbl_sryact"          TO  MCP-TABLE
             MOVE  "key4"                TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
             IF  MCP-RC  =  ZERO
               MOVE  "tbl_sryact"        TO  MCP-TABLE
               MOVE  "key4"              TO  MCP-PATHNAME
               PERFORM  965-SRYACT-READ-SEC
      *    在総診の患者取得
               PERFORM  UNTIL  FLG-SRYACT  =  1
                 PERFORM  965-ZAISOU-CHK-SEC
      *
                 MOVE  "tbl_sryact"      TO  MCP-TABLE
                 MOVE  "key4"            TO  MCP-PATHNAME
                 PERFORM  965-SRYACT-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SRYACT SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
             MOVE  "tbl_sryact"          TO  MCP-TABLE
             MOVE  "key4"                TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       960-SRYACT-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    診療情報読込
      *****************************************************************
       965-SRYACT-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"      TO  MCP-FUNC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  SRYACT-REC
             MOVE  ZERO         TO  FLG-SRYACT
           ELSE
             INITIALIZE   SRYACT-REC
             MOVE  1  TO  FLG-SRYACT
           END-IF
      *
           .
       965-SRYACT-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    在総診チェック
      *****************************************************************
       965-ZAISOU-CHK-SEC  SECTION.
      *
           PERFORM  VARYING  IDX4  FROM  1  BY  1
                    UNTIL   (IDX4  >     5) OR
                            (SRY-SRYCD(IDX4)  =  SPACE)
             IF  SRY-SRYKBN  =  "14"
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) start
      **=== 在宅の対象コードを増やす by Yoshikawa(2013/07/26) start
      **         IF  SRY-SRYCD(IDX4)  =  WRK-CONS-ZAITAKU1  OR
      **                                 WRK-CONS-ZAITAKU2  OR
      **                                 WRK-CONS-ZAITAKU3  OR
      **                                 WRK-CONS-ZAITAKU4  OR
      **                                 WRK-CONS-ZAITAKU5  OR
      **                                 WRK-CONS-ZAITAKU6
      *         IF  SRY-SRYCD(IDX4)  =  WRK-CONS-ZAITAKU1
      *                             OR  WRK-CONS-ZAITAKU2
      *                             OR  WRK-CONS-ZAITAKU3
      *                             OR  WRK-CONS-ZAITAKU4
      *                             OR  WRK-CONS-ZAITAKU5
      *                             OR  WRK-CONS-ZAITAKU6
      *                             OR  WRK-CONS-ZAITAKU7
      *                             OR  WRK-CONS-ZAITAKU8
      *                             OR  WRK-CONS-ZAITAKU9
      *                             OR  WRK-CONS-ZAITAKU10
      *                             OR  WRK-CONS-ZAITAKU11
      *                             OR  WRK-CONS-ZAITAKU12
      *                             OR  WRK-CONS-ZAITAKU13
      *                             OR  WRK-CONS-ZAITAKU14
      *                             OR  WRK-CONS-ZAITAKU15
      *                             OR  WRK-CONS-ZAITAKU16
      *                             OR  WRK-CONS-ZAITAKU17
      *                             OR  WRK-CONS-ZAITAKU18
      **=== 在宅の対象コードを増やす by Yoshikawa(2013/07/26) end
      *           MOVE  "1"  TO  MF100-ZAITAKU
      *         END-IF
               IF  RECE02-SRYYM  >=  WRK-CONS-SRYYM-201404
                 PERFORM  VARYING  IDX5  FROM  1  BY  1
                          UNTIL   (IDX5  >  TBL-ZAITAKU2-MAX)
                          OR      (MF100-ZAITAKU  =  "1")
                   IF  SRY-SRYCD(IDX4)  =  TBL-ZAITAKU2(IDX5)
                       MOVE    "1"     TO  MF100-ZAITAKU
                   END-IF
                 END-PERFORM
               ELSE
                 PERFORM  VARYING  IDX5  FROM  1  BY  1
                          UNTIL   (IDX5  >  TBL-ZAITAKU-MAX)
                          OR      (MF100-ZAITAKU  =  "1")
                   IF  SRY-SRYCD(IDX4)  =  TBL-ZAITAKU(IDX5)
                       MOVE    "1"     TO  MF100-ZAITAKU
                   END-IF
                 END-PERFORM
               END-IF
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) end
             END-IF
           END-PERFORM
      *
           .
       965-ZAISOU-CHK-EXT.
           EXIT.
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/06/10) end
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_syskanri"        TO  MCP-TABLE
           MOVE  "key10"               TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"                TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *       CALL  "MCPSUB"        USING
      *                             MCPAREA
      *                             MCPDATA-REC
             MOVE  "tbl_syskanri"        TO  MCP-TABLE
             MOVE  "key10"               TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL  "MCPSUB"        USING
      *                           MCPAREA
      *                           MCPDATA-REC
           MOVE  "tbl_syskanri"           TO  MCP-TABLE
           MOVE  "key10"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"              USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
      *****************************************************************
      *    パラメタ読込
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
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
           MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
           MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
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
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
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
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
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
      *---(01.00.08) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  "DBOPEN"   TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBSTART"  TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
       900-DBDISCONNECT-SEC  SECTION.
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE  "DBCOMMIT"      TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBDISCONNECT"  TO  MCP-FUNC.
      *---(01.00.08) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.08) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
