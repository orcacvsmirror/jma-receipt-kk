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
       PROGRAM-ID.             SOKATU0100.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 北海道・国保総括表
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/04/20    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            月途中の公費切替え対応
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者   日付          内容
      *  01.00.01           05/05/06    医療機関情報取得条件修正
      *  01.00.02           06/05/11    返戻対応の修正
      *  01.00.03           06/05/18    返戻対応の障害、母子のバグ修正
      *  01.00.04    内田   06/07/24    sarge対応
      *  01.00.05    内田   06/11/15    食事がない場合でも生活療養費を印字
      *  01.00.06    内田   07/01/10    在総診を別集計とする
      *  01.00.07    内田   07/05/23    印字対象番号の追加(643,644等)
      *  01.00.08    内田   07/06/22    対象データがない場合のエラー修正
      *  01.00.09    内田   07/08/26    公費再掲欄にて保険番号190等を
      *                                 法別番号でまとめる
      *  01.00.10    内田   07/09/26    日レセver4.0対応
      *                                 システム管理マスタ「1901」の
      *                                 医療機関情報を参照
      *                                 長期上位（974）は長期と同様の
      *                                 処理をする
      *  01.00.11    内田   07/11/13    保険番号643,843,644,744,844にて
      *                                 公費の助成がないなら集計しない
      *  01.00.12    内田   08/03/20    福祉再掲欄で入院高額療養費は金額を印字
      *  01.00.13    内田   08/03/26    公費の助成がないなら集計しない(743)
      *  01.00.14    内田k  08/04/26    帳票様式の変更に伴う修正
      *                                 SPA-AREA初期化
      *  01.00.15    内田   08/05/02    後期高齢者を障老人欄へ印字
      *  01.00.16    内田   08/05/28    区分３障の件数集計修正
      *  01.00.17    内田   08/06/25    後期高齢のみの場合でも印字するよう修正
      *  01.00.18    内田   08/07/01    札幌市代表保険者番号変更
      *  01.00.19    吉川   08/09/22    請求書の枚数欄は保険者数を印字
      *  01.00.20    吉川   08/11/18    高額療養費＋障害orひとり親の場合
      *                                 割欄に点数が加算される不具合を修正
      *                     08/11/25    長期等と併用した場合、公費の助成が
      *                                 無くても印字される不具合を修正
      *  01.00.21    吉川   09/01/15    返戻分の請求書枚数カウント修正
      *                                 外来で全国公費併用の場合は、
      *                                 公費の助成がなくても印字
      *  01.00.22    内田   09/05/13    障害は公費の助成がなくても印字
      *  01.00.23    吉川   09/07/08    公費の助成がなくても印字するのは
      *                                 函館市等８市のみにする
      *  01.00.24    吉川   09/10/05    障害＋長期で実日数が1日のみの場合、
      *                                 長期とならない不具合を修正
      *                     09/10/27    全市町村で長期及び全国公費併用時は
      *                                 公費の助成がなくても印字する
      *                                 全国公費を持っていても
      *                                 窓口徴収金が発生しない場合は
      *                                 印字対象外とするように修正
      *  01.00.25    吉川   10/02/12    函館市は公費の助成がない場合
      *                                 印字対象外とする
      *  01.00.26    吉川   10/03/25    診療入力順によってはデータが
      *                                 印字されない場合があるのを修正
      *  01.00.27    吉川   10/06/17    オンライン返戻対応
      *  01.00.28    吉川   10/11/16    室蘭市、釧路市、江別市、根室市は
      *                                 公費の助成が無い場合は印字対象外
      *  01.00.29    吉川   11/02/04    小樽市、登別市、北広島市は
      *                                 公費の助成が無い場合は印字対象外
      *  01.00.30    吉川   11/02/09    特別療養費国保対応
      *  01.00.31    吉川   11/02/16    公費請求テーブルclose処理位置変更
      *  01.00.32    吉川   11/04/13    特別療養費分は障・ひとり親は記載しない
      *  01.00.33    吉川   11/06/13    札幌市は区毎に集計するようになったので
      *                                 請求書の枚数欄のカウントを修正
      *  01.00.34    吉川   12/01/12    70歳未満で長期を持っている場合
      *                                 前期高齢者欄に集計される不具合を修正
      *  01.00.35    吉川   12/07/12    外来も高額は71限度額欄に印字する
      *                                 70歳未満で障害＋高額の場合、件数が
      *                                 前期高齢者欄に集計される不具合を修正
      *                                 特定疾患と957等を持っている場合
      *                                 限度額欄に値が記載されるのを修正
      *  01.00.36    吉川   12/12/13    医療機関情報編集修正
      *  01.00.37    吉川   13/03/18    限度額欄と前期高齢者欄の両方に
      *                                 値がある場合、前期高齢者のみ印字
      *  01.00.38    吉川   13/06/10    70歳未満で343＋高額の場合
      *                                 限度額欄に印字されないのを修正
      *  01.00.39    吉川   13/07/26    障害者の限度額欄において
      *                                 在宅は70歳未満の場合でも印字する
      *  01.00.40    萩野   13/12/05    在宅はまとめて集計するように修正
      *  01.00.41    吉川   14/05/20    在宅の対象とする診療コード変更
      *  01.00.42    萩野   14/08/07    返戻時、再印刷画面のタイトル修正
      *  01.00.43    吉川   14/10/02    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.44    吉川   15/04/14    請求書の枚数欄は在宅分を加算する
      *  01.00.45    門間   16/05/10    在宅の対象とする診療コード変更
      *  01.00.46    吉川   16/06/01    対象公費はPGオプションから取得する
      *  01.00.47    吉川   16/06/14    福祉のみの場合でも印刷する
      *  01.00.48    吉川   16/08/15    道難病によって公費の助成がない場合
      *                                 印字対象外とするように修正
      *  01.00.49    吉川   17/02/10    医療機関コード変更時、
      *                                 医療機関コード別の作成処理対応
      *  01.00.50    吉川   17/07/14    地方公費の集計は、法別番号で
      *                                 集計するように修正
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
             
      *    請求書一時ファイル
           SELECT  SKT0100TMP-FILE ASSIGN    SKT0100TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT0100TMP-KEY
                                   FILE    STATUS  IS  STS-SKT0100.
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
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル
       FD  SKT0100TMP-FILE.
           COPY    "CPSKT0100TMP.INC".
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
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT0100TP//.
      *
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/02) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/02) end
      *
      *    エラーファイル 名称領域 
      *---(01.00.10) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/02) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/02) end
      *---(01.00.10) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT0100.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT0100         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT0100TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
           03  FLG-ERR             PIC 9(01).
           03  FLG-SYUNOU          PIC 9(01).
           03  FLG-HKNCOMBI        PIC 9(01).
           03  FLG-HEIYOU          PIC 9(01).
           03  FLG-FUKUSI-TBL.
               05  FLG-TYOKI       PIC 9(01).
               05  FLG-KESE        PIC 9(01).
      *
      *    １.一人親  ２.重度
               05  FLG-FUKUSI      PIC 9(01).
      *
      *---(01.00.14) LINE ADD START ------------------------------------
           03  FLG-KOUKI           PIC 9(01).
      *---(01.00.14) LINE ADD END   ------------------------------------
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
           03  FLG-ERR2            PIC 9(01).
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) start
           03  FLG-SYORI2     PIC 9(01).
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) end
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) start
           03  FLG-SRYACT          PIC 9(01).
           03  FLG-ZAITAKU         PIC 9(01).
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) end
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
           03  FLG-TAISYO          PIC 9(01).
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *
      *    添字領域
       01  IDX-AREA.
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *     03  IDX                 PIC 9(04).
           03  IDX                 PIC 9(05).
           03  IDY                 PIC 9(04).
           03  IDXX                PIC 9(04).
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDZ                 PIC 9(04).
           03  IDX-MAX             PIC 9(04).
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.10) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.10) LINE ADD END   ------------------------------------
      *---(01.00.14) LINE ADD START ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
      *---(01.00.14) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      ****2006/05/11 @@@@ START
           03  WRK-PARA-SYOKBN     PIC X(01).
      ****2006/05/11 @@@@ END
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
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
           03  WRK-CNT             PIC  9(02).
           03  WRK-HKNJANUM        PIC  X(06).
           03  WRK-KOHNUM          PIC  X(03).
           03  WRK-KOHID           PIC  9(10).
      *
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z11             PIC ZZZ,ZZZ,ZZZ.
           03  WRK-Z14             PIC ZZ,ZZZ,ZZZ,ZZZ.
      *
           03  WRK-TAIHI-TBL.
               05  WRK-T-TOTALTEN    PIC 9(07).
      *---(01.00.14) LINE ADD START ------------------------------------
               05  WRK-T-KOUGAKU     PIC 9(07).
      *---(01.00.14) LINE ADD END   ------------------------------------
               05  WRK-T-TYOKI       PIC 9(07).
               05  WRK-T-KESE        PIC 9(07).
               05  WRK-T-ITBFTN      PIC 9(07).
               05  WRK-T-KASAN-FLG   PIC 9(01).
           03  WRK-SYUKEI-TBL.
               05  WRK-SEIKYUGK      PIC 9(07)V9(01).
               05  WRK-SEIKYUGK-G    PIC 9(07).
               05  WRK-SEIKYUGK-G2   PIC 9(07)V9(01).
               05  WRK-KOHTENSU      PIC 9(07).
               05  WRK-KESE          PIC 9(07)V9(01).
               05  WRK-TYOKI         PIC 9(07).
      *
           03  WRK-RECEERR         PIC X(200).
      *---(01.00.10) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH              PIC X(50).
      *---(01.00.14) LINE ADD START ------------------------------------
           03  WRK-PATH2               PIC X(50).
           03  WRK-HKNNUM              PIC X(03).
           03  WRK-MAISU               PIC 9(03).
           03  WRK-KOHKEI              PIC 9(03).
           03  WRK-KOHKEI2             PIC 9(03).
           03  WRK-AMARI               PIC 9(02).
      *---(01.00.14) LINE ADD END   ------------------------------------
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) start
           03  WRK-ZAIMAISU            PIC 9(03).
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) end
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) start
           03  WRK-HENREIYM            PIC X(06).
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) end
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
           03  WRK-SRYCNT              PIC 9(02).
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
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
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *    プログラムオプション
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
      *
           03  WRK-CHK-KOHNUM-TBL.
               05  WRK-CHK-KOHNUM    PIC X(03)  OCCURS 4.
      *    対象公費
           03  WRK-TAISYO-KOHNUM     PIC X(03)  OCCURS 100.
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *
       01  SORT-AREA.
           03  SORT-KOH-TBL OCCURS 20.
                05  SORT-KOHNUM      PIC X(03).
                05  SORT-K-KENSU     PIC 9(05).
                05  SORT-K-TENSU     PIC 9(14).
                05  SORT-K-ITBFTN    PIC 9(10).
                05  SORT-K-SKENSU    PIC 9(05).
                05  SORT-K-SKINGK    PIC 9(14).
                05  SORT-K-SFTNGK    PIC 9(10).
      *     
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-RECE02          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-KOH             PIC 9(04).
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *    請求書カウント
        01  SCNT-AREA.
            03  SCNT-HKN-TBL  OCCURS  2.
               05  SCNT-DATA-TBL  OCCURS  50.
                   07  SCNT-SRYYM        PIC X(06).
                   07  SCNT-HKNJANUM     PIC X(06).
                   07  SCNT-ZAITAKU      PIC X(01).
                   07  SCNT-KOHSU        PIC 9(02).
      *            月遅れフラグ
                   07  SCNT-TUKI-TBL  OCCURS  5.
                       09  SCNT-TUKI     PIC 9(01).
                   07  SCNT-KOH-TBL  OCCURS  20.
                       09  SCNT-KOHNUM   PIC X(03).
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.10) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) start
           03  WRK-CONS-SRYYM-201404   PIC X(06)   VALUE   "201404".
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) end
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) start
           03  WRK-CONS-SRYYM-201604   PIC X(06)   VALUE   "201604".
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) end
      *
      *---(01.00.14) LINE ADD END   ------------------------------------
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) start
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) start
      **    在宅総合・在宅末期（在医総）
      *     03  WRK-CONS-ZAITAKU1       PIC X(09) VALUE "114007610".
      *     03  WRK-CONS-ZAITAKU2       PIC X(09) VALUE "114007710".
      *     03  WRK-CONS-ZAITAKU3       PIC X(09) VALUE "114007510".
      *     03  WRK-CONS-ZAITAKU4       PIC X(09) VALUE "114012210".
      *     03  WRK-CONS-ZAITAKU5       PIC X(09) VALUE "114012310".
      *     03  WRK-CONS-ZAITAKU6       PIC X(09) VALUE "114012410".
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
      **=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) end
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
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) start
      *    在総診テーブル（２０１６年４月診療分〜）
       01  TBL-ZAITAKU3-AREA.
      *    在がん医総（在支診等）（処方せんあり）
           03  FILLER          PIC X(09)   VALUE   "114007610".
      *    在がん医総（在支診等）（処方せんなし）
           03  FILLER          PIC X(09)   VALUE   "114007710".
      *    在医総・在医総管（ＤＵＭＭＹ）
           03  FILLER          PIC X(09)   VALUE   "099140003".
      *
      *    在がん医総（機能強化した在支診等）（病床あり）（処方せんあり）
           03  FILLER          PIC X(09)   VALUE   "114019510".
      *    在がん医総（機能強化した在支診等）（病床あり）（処方せんなし）
           03  FILLER          PIC X(09)   VALUE   "114019610".
      *    在がん医総（機能強化した在支診等）（病床なし）（処方せんあり）
           03  FILLER          PIC X(09)   VALUE   "114019710".
      *    在がん医総（機能強化した在支診等）（病床なし）（処方せんなし）
           03  FILLER          PIC X(09)   VALUE   "114019810".
      *
      *    在医総管（機能強化在支診等・病床有・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114030710".
      *    在医総管（機能強化在支診等・病床有・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114030810".
      *    在医総管（機能強化在支診等・病床有・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114030910".
      *    在医総管（機能強化在支診等・病床有・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114031010".
      *    在医総管（機能強化在支診等・病床有・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114031110".
      *    在医総管（機能強化在支診等・病床有・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114031210".
      *    在医総管（機能強化在支診等・病床有・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114031310".
      *    在医総管（機能強化在支診等・病床有・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114031410".
      *    在医総管（機能強化在支診等・病床有・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114031510".
      *    在医総管（機能強化在支診等・病床無・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114031610".
      *    在医総管（機能強化在支診等・病床無・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114031710".
      *    在医総管（機能強化在支診等・病床無・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114031810".
      *    在医総管（機能強化在支診等・病床無・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114031910".
      *    在医総管（機能強化在支診等・病床無・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114032010".
      *    在医総管（機能強化在支診等・病床無・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114032110".
      *    在医総管（機能強化在支診等・病床無・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114032210".
      *    在医総管（機能強化在支診等・病床無・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114032310".
      *    在医総管（機能強化在支診等・病床無・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114032410".
      *    在医総管（在支診等・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114032510".
      *    在医総管（在支診等・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114032610".
      *    在医総管（在支診等・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114032710".
      *    在医総管（在支診等・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114032810".
      *    在医総管（在支診等・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114032910".
      *    在医総管（在支診等・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114033010".
      *    在医総管（在支診等・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114033110".
      *    在医総管（在支診等・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114033210".
      *    在医総管（在支診等・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114033310".
      *    在医総管（在支診等以外・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114033410".
      *    在医総管（在支診等以外・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114033510".
      *    在医総管（在支診等以外・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114033610".
      *    在医総管（在支診等以外・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114033710".
      *    在医総管（在支診等以外・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114033810".
      *    在医総管（在支診等以外・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114033910".
      *    在医総管（在支診等以外・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114034010".
      *    在医総管（在支診等以外・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114034110".
      *    在医総管（在支診等以外・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114034210".
      *
      *    施医総管（機能強化在支診等・病床有・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114035510".
      *    施医総管（機能強化在支診等・病床有・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114035610".
      *    施医総管（機能強化在支診等・病床有・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114035710".
      *    施医総管（機能強化在支診等・病床有・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114035810".
      *    施医総管（機能強化在支診等・病床有・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114035910".
      *    施医総管（機能強化在支診等・病床有・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114036010".
      *    施医総管（機能強化在支診等・病床有・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114036110".
      *    施医総管（機能強化在支診等・病床有・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114036210".
      *    施医総管（機能強化在支診等・病床有・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114036310".
      *    施医総管（機能強化在支診等・病床無・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114036410".
      *    施医総管（機能強化在支診等・病床無・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114036510".
      *    施医総管（機能強化在支診等・病床無・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114036610".
      *    施医総管（機能強化在支診等・病床無・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114036710".
      *    施医総管（機能強化在支診等・病床無・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114036810".
      *    施医総管（機能強化在支診等・病床無・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114036910".
      *    施医総管（機能強化在支診等・病床無・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114037010".
      *    施医総管（機能強化在支診等・病床無・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114037110".
      *    施医総管（機能強化在支診等・病床無・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114037210".
      *    施医総管（在支診等・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114037310".
      *    施医総管（在支診等・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114037410".
      *    施医総管（在支診等・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114037510".
      *    施医総管（在支診等・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114037610".
      *    施医総管（在支診等・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114037710".
      *    施医総管（在支診等・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114037810".
      *    施医総管（在支診等・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114037910".
      *    施医総管（在支診等・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114038010".
      *    施医総管（在支診等・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114038110".
      *    施医総管（在支診等以外・難病等月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114038210".
      *    施医総管（在支診等以外・難病等月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114038310".
      *    施医総管（在支診等以外・難病等月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114038410".
      *    施医総管（在支診等以外・月２回以上・１人）
           03  FILLER          PIC X(09)   VALUE   "114038510".
      *    施医総管（在支診等以外・月２回以上・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114038610".
      *    施医総管（在支診等以外・月２回以上・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114038710".
      *    施医総管（在支診等以外・月１回・１人）
           03  FILLER          PIC X(09)   VALUE   "114038810".
      *    施医総管（在支診等以外・月１回・２〜９人）
           03  FILLER          PIC X(09)   VALUE   "114038910".
      *    施医総管（在支診等以外・月１回・１０人〜）
           03  FILLER          PIC X(09)   VALUE   "114039010".
      *
       01  TBL-ZAITAKU3-R      REDEFINES   TBL-ZAITAKU3-AREA.
            03  TBL-ZAITAKU3   PIC X(09)   OCCURS  79.
      *
       01  TBL-ZAITAKU3-MAX    PIC 9(02)   VALUE   79.
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) end
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *　　保険者情報
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
      *    診療科目情報情報
           COPY    "CPSK1005.INC".
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *    請求管理マスタ
           COPY    "CPRCF010.INC".
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
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) start
      *    診療行為マスタ
       01  SRYACT-REC.
           COPY    "CPSRYACT.INC".
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) end
      *
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
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
      *=== ver4.8対応 by Yoshikawa(2014/10/02) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/02) end
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
      *---(01.00.17) LINE ADD START ------------------------------------
      *             UNTIL       FLG-END     =   1
      *---(01.00.17) LINE ADD END   ------------------------------------
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
      *---(01.00.14) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
           INITIALIZE                  SCNT-AREA
      *---(01.00.14) LINE ADD END   ------------------------------------
      *=== ver4.8対応 by Yoshikawa(2014/10/02) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/02) end
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
      ****2006/05/11 @@@@ START
      *                                         WRK-PARA-JOBID
      *                                         WRK-PARA-SHELLID
      *                                         WRK-PARA-HOSPID
      *---(01.00.10) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
      *---(01.00.14) LINE ADD START ------------------------------------
                                               WRK-PARA-HKNJANUM
      *---(01.00.14) LINE ADD END   ------------------------------------
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
      *---(01.00.10) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.10) LINE ADD END   ------------------------------------
      ****2006/05/11 @@@@ END
           END-UNSTRING
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU0100"    TO  JOB-PGID
           MOVE    "国保総括表"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.10) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/02) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/02) end
      *##（地方公費仕様：LNK-PRTKANRI-TERMID)
           MOVE    "SKT0100"         TO  SKT0100TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT0100TP-TERMID
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT0100TP-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/02) start
           MOVE  SKT0100TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT0100TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/02) end
      *
      *###（地方公費仕様)
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
      *     MOVE    "99999999"          TO  SYS-1001-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1001-EDYUKYMD
      ***** 05/05/06 INS
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *****
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *     MOVE    "99999999"          TO  SYS-1002-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1002-EDYUKYMD
      ***** 05/05/06 INS
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *****
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *
           OPEN    OUTPUT  UPD-FILE
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *****2006/05/11 @@@@ START
      *     EVALUATE    WRK-PARA-SYOKBN
      *         WHEN    "2"
      **---(01.00.10) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"     TO  WRK-PATH
      **---(01.00.10) LINE ADD END   ------------------------------------
      **---(01.00.14) LINE ADD START ------------------------------------
      *             MOVE    "key65"     TO  WRK-PATH2
      **---(01.00.14) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.10) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"     TO  WRK-PATH
      **---(01.00.10) LINE ADD END   ------------------------------------
      **---(01.00.14) LINE ADD START ------------------------------------
      *             MOVE    "key66"     TO  WRK-PATH2
      **---(01.00.14) LINE ADD END   ------------------------------------
      *     END-EVALUATE
      *****2006/05/11 @@@@ END
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
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SOKATU0100"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
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
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
      *
           OPEN     OUTPUT  SKT0100TMP-FILE
           CLOSE            SKT0100TMP-FILE
           OPEN     I-O     SKT0100TMP-FILE
      *
      *---(01.00.17) LINE ADD START ------------------------------------
      *     MOVE     ZERO    TO      FLG-END
      *---(01.00.17) LINE ADD END   ------------------------------------
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *---(01.00.14) LINE ADD START ------------------------------------
           PERFORM  900-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           IF  WRK-PARA-TOKUBETU  =  "1"
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
             MOVE     ZERO    TO        FLG-END
             MOVE     1       TO        FLG-KOUKI
             MOVE    "039"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOKUHO-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           ELSE
             MOVE     1       TO        FLG-KOUKI
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
             MOVE     ZERO    TO        FLG-END
             MOVE    "040"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOKUHO-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *---(01.00.14) LINE ADD END   ------------------------------------
      *    地方公費分集計
      *=== 特別療養費分は公費欄記載なし by Yoshikawa(2011/04/13) start
           IF  WRK-PARA-TOKUBETU  = "1"
      *=== 特別療養費分は公費欄記載なし by Yoshikawa(2011/04/13) end
             MOVE     ZERO    TO      FLG-END
             PERFORM 900-KOHSKY-START-SEC
      *
             PERFORM  2001-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
      *=== 特別療養費分は公費欄記載なし by Yoshikawa(2011/04/13) start
           END-IF
      *=== 特別療養費分は公費欄記載なし by Yoshikawa(2011/04/13) end
      *
           CLOSE   UPD-FILE
           CLOSE   SKT0100TMP-FILE
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
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) start
      **---(01.00.08) LINE ADD START ------------------------------------
      *         MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      **---(01.00.10) LINE ADD START ------------------------------------
      **         MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      **         CALL    "MCPSUB"             USING
      **                                      MCPAREA
      **                                      MCPDATA-REC
      *         MOVE    "tbl_kohsky"        TO  MCP-TABLE
      *         MOVE    "key2"              TO  MCP-PATHNAME
      *         CALL    "ORCDBMAIN"             USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *                                         SPA-AREA
      **---(01.00.10) LINE ADD END   ------------------------------------
      **---(01.00.08) LINE ADD END   ------------------------------------
      *=== 公費請求テーブルclose位置変更 by Yoshikawa(2011/02/16) end
           END-IF
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *     MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SOKATU0100 IN  "  CNT-RECE10 
           DISPLAY "*** RECE02="          CNT-RECE02
           DISPLAY "*** SOKATU0100 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
      *###（地方公費仕様）
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.10) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
          
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
        DISPLAY "2001-KOKUHO-SYUKEI-SEC"
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT0100TMP-REC
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    在宅
      *=== 在宅はまとめて集計 by hagino(2013/12/05) start
      *     MOVE   RECE10-ZAITAKU    TO   SKT0100TMP-ZAITAKU
      *=== 在宅はまとめて集計 by hagino(2013/12/05) end
      *---(01.00.06) LINE ADD END   ------------------------------------
      *    TMPファイル読み込み
           PERFORM  800-SKTTMP-READ-SEC
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *     PERFORM  210-HKN-SYUKEI-SEC
           IF  FLG-KOUKI  =  ZERO
               PERFORM  210-HKN-SYUKEI-SEC
           ELSE
               PERFORM  220-KOUKI-SYUKEI-SEC
           END-IF
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *    請求書枚数カウント
           PERFORM  20011-SEIKYU-CNT-SEC
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
      *    集計の対象にならなかったとき
           DISPLAY "FLG-UPD"FLG-UPD
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
      *---(01.00.14) LINE ADD START ------------------------------------
             IF  FLG-KOUKI  =  ZERO
                 PERFORM 900-SEIKYU-READ-SEC
             ELSE
                 PERFORM 950-SEIKYU-READ-SEC
             END-IF
      *---(01.00.14) LINE ADD END   ------------------------------------
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
           DISPLAY "2001-KOKUHO-SYUKEI-EXT"
           .
       2001-KOKUHO-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    入外区分
           IF  RECE10-NYUGAIKBN        =  "1"
             MOVE    1                TO  IDX2
           ELSE
             MOVE    2                TO  IDX2
           END-IF
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *    保険判定
      *     IF  RECE10-RJNHKNNUM   NOT  =  SPACE
      *       MOVE    3                TO  IDX1
      *     ELSE
      *       IF  RECE10-HKNNUM         =  "060"
               MOVE  1                TO  IDX1
      *       ELSE
      *         MOVE  2                TO  IDX1
      *       END-IF
      *     END-IF
      *---(01.00.14) LINE ADD END   ------------------------------------
      *    集計
           PERFORM   2101-SYUKEI-SEC
      *
      *    公費分集計
      *---(01.00.14) LINE ADD START ------------------------------------
      *     IF     RECE10-KOHNUM(1) NOT  =  SPACE
      *       PERFORM  2202-KOH-SEC
      *     END-IF
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
      *
           IF      FLG-SKT0100TMP  =  1
                   WRITE    SKT0100TMP-REC
           ELSE
                   REWRITE  SKT0100TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢者分集計処理
      *****************************************************************
       220-KOUKI-SYUKEI-SEC               SECTION.
      *
           DISPLAY "220-KOUKI-SYUKEI-SEC"
           MOVE    2  TO  IDX1
      *    入院／外来
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1  TO  IDX2
           ELSE
             MOVE  2  TO  IDX2
           END-IF
      *
           PERFORM   2101-SYUKEI-SEC
      *
           IF      FLG-SKT0100TMP   =      1
               WRITE    SKT0100TMP-REC
           ELSE
               REWRITE  SKT0100TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD
           .
       220-KOUKI-SYUKEI-EXT.
           EXIT.       
      *---(01.00.14) LINE ADD END   ------------------------------------
      *****************************************************************
      *    医療保険集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
       DISPLAY "2101-SYUKEI-SEC"
      *療養の給付
      *    件数
           ADD   1                   TO  SKT0100TMP-KENSU(IDX1 IDX2)
      *    点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT0100TMP-TENSU(IDX1 IDX2)
      *---(01.00.14) LINE ADD START ------------------------------------
      *    一部負担金
      *     ADD   RECE10-FTNMONEY(1)  TO  SKT0100TMP-ITBFTN(IDX1 IDX2)
      *食事療養
      *    件数
      *     IF  RECE10-SHOKUJINISSU(1)  >  0
      *       ADD  1                  TO  SKT0100TMP-SKENSU(IDX1)
      *     END-IF
      *    金額
      *     ADD  RECE10-SHOKUJIRYOYOHI(1)
      *                               TO  SKT0100TMP-SKINGK(IDX1)
      *    標準負担額
      *     ADD  RECE10-SHOKUJIFTN(1)
      *                               TO  SKT0100TMP-SFTNGK(IDX1)
      *
      *    合計加算
           IF     IDX1     =     2
      *---(01.00.14) LINE ADD END   ------------------------------------
             MOVE    2    TO     IDX3
           ELSE
             MOVE    1    TO     IDX3
           END-IF
      *
      *    件数
           ADD       1               TO  SKT0100TMP-ETC-KENSU(IDX3)
      *
      *    点数、一部負担金は一般国保と退職国保のみ集計
      *---(01.00.14) LINE ADD START ------------------------------------
      *     IF     IDX3     =     1
      *
      *    点数
             ADD  RECE10-TOTALTEN(1) TO  SKT0100TMP-ETC-TENSU(IDX3)
      *
      *    一部負担金
      *       ADD  RECE10-FTNMONEY(1) TO  SKT0100TMP-ETC-ITBFTN(IDX3)
      *     END-IF
      *    食事件数
      *     IF  RECE10-SHOKUJINISSU(1)  >  0
      *       ADD  1                  TO  SKT0100TMP-ETC-SKENSU(IDX3)
      *     END-IF
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
           .
       2101-SYUKEI-EXT.
           EXIT.
      *---(01.00.14) LINE ADD START ------------------------------------
      *****************************************************************
      *    編集処理
      *****************************************************************
      * 2202-KOH-SEC              SECTION.
      *
      *     PERFORM VARYING IDX3     FROM    1   BY  1
      *             UNTIL   IDX3     >       4
      *             OR  RECE10-KOHNUM (IDX3) =   SPACE
      *    ５１、９１は１つにまとめる
      *      IF    RECE10-KOHNUM(IDX3)  =  "091"
      *        MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
      *      END-IF
      *---(01.00.09) LINE ADD START ------------------------------------
      *    ９０等は法別でまとめる
      *      EVALUATE  RECE10-KOHNUM(IDX3)
      *        WHEN  "290"
      *          MOVE  "190"       TO  RECE10-KOHNUM(IDX3)
      *        WHEN  "291"
      *          MOVE  "191"       TO  RECE10-KOHNUM(IDX3)
      *        WHEN  "292"
      *        WHEN  "392"
      *          MOVE  "192"       TO  RECE10-KOHNUM(IDX3)
      *      END-EVALUATE
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *    道老判定
      *      IF    RECE10-KOHNUM(IDX3)  =  "141" OR "241"
      *        PERFORM  2202-DORO-KOH-SEC
      *      ELSE
      *
      *    公費判別
      *         PERFORM  VARYING  IDX4  FROM  1  BY  1
      *                  UNTIL    IDX4  >     20
      *                  OR       SKT0100TMP-KOHNUM (IDX4) = SPACE
      *           IF  RECE10-KOHNUM(IDX3) = SKT0100TMP-KOHNUM(IDX4)
      *             MOVE  IDX4  TO  CNT-KOH
      *             MOVE  20    TO  IDX4
      *           END-IF
      *         END-PERFORM
      *
      *    該当公費がなかった場合
      *         IF  IDX4  < 20
      *           MOVE  IDX4  TO  CNT-KOH
      *         END-IF
      *
      *    公費番号
      *         MOVE  RECE10-KOHNUM(IDX3)  
      *                             TO  SKT0100TMP-KOHNUM(CNT-KOH)
      *    療養の給付：件数
      *         ADD  1              TO SKT0100TMP-K-KENSU(CNT-KOH)
      *    療養の給付：点数
      *         ADD  RECE10-TOTALTEN(IDX3 + 1)
      *                             TO SKT0100TMP-K-TENSU(CNT-KOH)
      *    療養の給付：一部負担金
      *         ADD  RECE10-FTNMONEY (IDX3 + 1)
      *                             TO SKT0100TMP-K-ITBFTN(CNT-KOH)
      *   食事療養：件数
      *         IF  RECE10-SHOKUJINISSU (IDX3 + 1)  >  ZERO
      *           ADD  1            TO  SKT0100TMP-K-SKENSU(CNT-KOH)
      *         END-IF
      *   食事療養：金額
      *         ADD  RECE10-SHOKUJIRYOYOHI (IDX3 + 1)
      *                             TO  SKT0100TMP-K-SKINGK(CNT-KOH)
      *   食事療養：標準負担額
      *         ADD  RECE10-SHOKUJIFTN (IDX3 + 1)
      *                             TO  SKT0100TMP-K-SFTNGK(CNT-KOH)
      *      END-IF
      *     END-PERFORM
      *
      *     .
      * 2202-KOH-EXT.
      *     EXIT.
      *****************************************************************
006900*    道老集計処理
      *****************************************************************
      * 2202-DORO-KOH-SEC         SECTION.
      *
      *    療養の給付：件数
      *     ADD  1                  TO SKT0100TMP-ETC-KENSU(3)
      *
      *    療養の給付：点数
      *     ADD  RECE10-TOTALTEN(IDX3 + 1)
      *                             TO SKT0100TMP-ETC-TENSU(3)
      *    療養の給付：一部負担金
      *     ADD  RECE10-FTNMONEY (IDX3 + 1)
      *                             TO SKT0100TMP-ETC-ITBFTN(3)
      *   食事療養：件数
      *     IF  RECE10-SHOKUJINISSU (IDX3 + 1)  >  ZERO
      *       ADD  1                TO  SKT0100TMP-ETC-SKENSU(3)
      *     END-IF
      *   食事療養：金額
      *     ADD  RECE10-SHOKUJIRYOYOHI (IDX3 + 1)
      *                             TO  SKT0100TMP-ETC-SKINGK(3)
      *   食事療養：標準負担額
      *     ADD  RECE10-SHOKUJIFTN (IDX3 + 1)
      *                             TO  SKT0100TMP-ETC-SFTNGK(3)
      *
      *     .
      * 2202-DORO-KOH-EXT.
      *     EXIT.
057400*
      *---(01.00.14) LINE ADD END   ------------------------------------
      *****************************************************************
      *    地方公費分集計１
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           DISPLAY "2001-SYUKEI-SEC"
           PERFORM VARYING IDZ FROM    1   BY  1
                   UNTIL   IDZ >       4
      *---(01.00.07) LINE ADD START ------------------------------------
      *       IF  RECE02-KOHNUM (IDZ) = "144" OR "244" OR "344"
      *                              OR "143" OR "243" OR "343"
      *                              OR "544" OR "543"
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *       IF  RECE02-KOHNUM (IDZ) = "144" OR "244" OR "344"
      *                              OR "143" OR "243" OR "343"
      *                              OR "544" OR "543" OR "643"
      *                              OR "644" OR "743" OR "744"
      *                              OR "843" OR "844"
             INITIALIZE                            WRK-CHK-KOHNUM-TBL
             MOVE    RECE02-KOHNUM(IDZ)        TO  WRK-CHK-KOHNUM(1)
      *      対象公費番号チェック処理
             PERFORM  800-TAISYOKOHI-CHK-SEC
             IF  FLG-TAISYO  =  1
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *---(01.00.07) LINE ADD END   ------------------------------------
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
      *    地方公費分集計２
      *****************************************************************
       20011-SYUKEI-SEC  SECTION.
      *
           DISPLAY "20011-SYUKEI-SEC"
      *    TMP-FILE キーセット
      *
           INITIALIZE       SKT0100TMP-REC
      *
      *    TMPファイル読み込み
           PERFORM  800-SKTTMP-READ-SEC
      *
           INITIALIZE   WRK-TAIHI-TBL
           INITIALIZE   WRK-SYUKEI-TBL
           MOVE         ZERO        TO   FLG-FUKUSI-TBL
      *
           ADD   RECE02-TOTALTEN    (IDZ + 1)  TO  WRK-T-TOTALTEN
      *=== 地方公費は法別番号で集計する by Yoshikawa(2017/07/14) start
      *     IF  RECE02-KOHNUM(IDZ)  =  
      **---(01.00.07) LINE ADD START ------------------------------------
      **                            "143" OR "243" OR "343" OR "543"
      *                             "143" OR "243" OR "343" OR "543"
      *                         OR  "643" OR "743" OR "843"
      **---(01.00.07) LINE ADD END   ------------------------------------
           IF  RECE02-KOHHBTNUM(IDZ)  =  "43"
      *=== 地方公費は法別番号で集計する by Yoshikawa(2017/07/14) end
             MOVE  2                       TO  FLG-FUKUSI
           END-IF
      *=== 地方公費は法別番号で集計する by Yoshikawa(2017/07/14) start
      *     IF  RECE02-KOHNUM(IDZ)  =
      **---(01.00.07) LINE ADD START ------------------------------------
      **                            "144" OR "244" OR "344" OR "544"
      *                             "144" OR "244" OR "344" OR "544"
      *                          OR "644" OR "744" OR "844"
      **---(01.00.07) LINE ADD END   ------------------------------------
           IF  RECE02-KOHHBTNUM(IDZ)  =  "44"
      *=== 地方公費は法別番号で集計する by Yoshikawa(2017/07/14) end
             MOVE  1                       TO  FLG-FUKUSI
           END-IF
      *
      *    一部負担金がある公費を使用している場合は助成対象判定を行う
           MOVE     ZERO                       TO  FLG-ERR
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
           MOVE     ZERO                       TO  FLG-ERR2
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
      *---(01.00.11) LINE ADD START ------------------------------------
      *     IF   RECE02-KOHNUM (IDZ)  =  "144"         OR
      *          RECE02-KOHNUM (IDZ)  =  "344"         OR
      *          RECE02-KOHNUM (IDZ)  =  "143"         OR
      *          RECE02-KOHNUM (IDZ)  =  "343"        
      *=== 障害は公費の助成がなくても印字 by Uchida(2009/05/13) start
      *     IF   RECE02-KOHNUM (IDZ)  =  "144"         OR
      *          RECE02-KOHNUM (IDZ)  =  "344"         OR
      *          RECE02-KOHNUM (IDZ)  =  "644"         OR
      *          RECE02-KOHNUM (IDZ)  =  "744"         OR
      *          RECE02-KOHNUM (IDZ)  =  "844"         OR
      **---(01.00.11) LINE ADD START ------------------------------------
      *          RECE02-KOHNUM (IDZ)  =  "143"         OR
      *          RECE02-KOHNUM (IDZ)  =  "343"         OR
      *          RECE02-KOHNUM (IDZ)  =  "643"         OR
      **---(01.00.13) LINE ADD START ------------------------------------
      *          RECE02-KOHNUM (IDZ)  =  "743"         OR
      **---(01.00.13) LINE ADD END   ------------------------------------
      *          RECE02-KOHNUM (IDZ)  =  "843"
      **---(01.00.11) LINE ADD END   ------------------------------------
      *=== 助成なしの記載は函館等8市のみ by Yoshikawa(2009/07/08) start
      *     IF   RECE02-KOHNUM (IDZ)  =  "144"         OR
      *          RECE02-KOHNUM (IDZ)  =  "344"         OR
      *          RECE02-KOHNUM (IDZ)  =  "644"         OR
      *          RECE02-KOHNUM (IDZ)  =  "744"         OR
      *          RECE02-KOHNUM (IDZ)  =  "844"
      **=== 障害は公費の助成がなくても印字 by Uchida(2009/05/13) end
      *       MOVE      1                       TO  FLG-ERR
      *     END-IF
      *    小樽、登別、北広島は助成対象判定を行わない
      *=== 函館市は公費の助成がなくても印字 by Yoshikawa(2010/02/12) start
      *     IF  RECE02-KOHFTNJANUM(IDZ)(1:3)  =  "002" OR "003" OR "005"
      *                                       OR "006" OR "017" OR "023" 
      *                                       OR "030" OR "051"
      *=== 助成判定市町村の変更 by Yoshikawa(2010/11/16) start
      *     IF  RECE02-KOHFTNJANUM(IDZ)(1:3)  =  "003" OR "005" OR "006"
      *                                       OR "017" OR "023" OR "030"
      *                                       OR "051"
      *=== 公費助成判定をする市町村の変更 by Yoshikawa(2011/02/04) start
      *     IF  RECE02-KOHFTNJANUM(IDZ)(1:3)  =  "003" OR "030" OR "051"
      **=== 助成判定市町村の変更 by Yoshikawa(2010/11/16) end
      **=== 函館市は公費の助成がなくても印字 by Yoshikawa(2010/02/12) end
      *         CONTINUE
      *     ELSE
      *         MOVE     1                      TO  FLG-ERR
      *     END-IF
           MOVE     1                           TO  FLG-ERR
      *=== 公費助成判定をする市町村の変更 by Yoshikawa(2011/02/04) end
      *=== 助成なしの記載は函館等8市のみ by Yoshikawa(2009/07/08) end
      *
      *    長期・結核・精神編集
           MOVE    RECE02-KOHNUM (IDZ)          TO  WRK-KOHNUM
           MOVE    RECE02-KOHID (IDZ)           TO  WRK-KOHID
           IF      RECE02-NYUGAIKBN    =   "1"
      *---(01.00.10) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"                 TO  WRK-PATH
      *---(01.00.10) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.10) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"                 TO  WRK-PATH
      *---(01.00.10) LINE ADD END   ------------------------------------
           END-IF
           PERFORM  920-SYUNOU-SET-SEC
      *   
           COMPUTE  WRK-SEIKYUGK-G ROUNDED  =  WRK-SEIKYUGK-G2
           COMPUTE  WRK-T-KESE     ROUNDED  =  WRK-KESE
      *
           IF       FLG-ERR                    =   ZERO
             IF     FLG-FUKUSI            =      1
               PERFORM  20011-FUKUSI-HEN-SEC
             ELSE
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
              IF   FLG-ERR2               =   ZERO
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
               PERFORM  20012-FUKUSI-HEN-SEC
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
              END-IF
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
             END-IF
             IF      FLG-SKT0100TMP  =  1
                     WRITE    SKT0100TMP-REC
             ELSE
                     REWRITE  SKT0100TMP-REC
             END-IF
      *=== 福祉のみの場合でも印字 by Yoshikawa(2016/06/14) start
             MOVE    1                          TO  FLG-UPD 
      *=== 福祉のみの場合でも印字 by Yoshikawa(2016/06/14) end
           ELSE
             DISPLAY "助成対象外患者番号="  RECE02-PTNUM
                     "点数="   RECE02-TOTALTEN(1)
                     "公費１=" RECE02-KOHNUM(1)
                     "負担金１=" RECE02-FTNMONEY(2)
                     "公費２=" RECE02-KOHNUM(2)
                     "負担金２=" RECE02-FTNMONEY(3)
           END-IF
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      **
      *****************************************************************
006900*    ひとり親加算データ編集処理
      *****************************************************************
       20011-FUKUSI-HEN-SEC         SECTION.
      *
           IF      RECE02-FTNMONEY(1)  NOT =   ZERO    AND
                   RECE02-FTNMONEY(1)      <   WRK-SEIKYUGK-G
               MOVE    RECE02-FTNMONEY(1)  TO  WRK-SEIKYUGK-G
           END-IF
      *
      *    長期編集
           IF     FLG-TYOKI             =      1   AND
                  WRK-SEIKYUGK-G        >  10000
             MOVE    10000             TO  WRK-TYOKI
             MOVE    ZERO              TO  WRK-T-TOTALTEN
                                           WRK-T-KESE
           END-IF
      *---(01.00.10) LINE ADD START ------------------------------------
      *    長期上位
           IF     FLG-TYOKI             =      2   AND
                  WRK-SEIKYUGK-G        >  20000
             MOVE    20000             TO  WRK-TYOKI
             MOVE    ZERO              TO  WRK-T-TOTALTEN
                                           WRK-T-KESE
           END-IF
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *    結核・精神編集
           IF     FLG-KESE              =  1  AND
                  WRK-T-TOTALTEN        >  0
             MOVE    WRK-SEIKYUGK-G     TO  WRK-T-KESE
             MOVE    ZERO               TO  WRK-T-TOTALTEN
           END-IF
      *
      *    件数加算場所を判定
           IF    WRK-T-TOTALTEN         =  ZERO
             IF     FLG-KESE            =  1
               MOVE     3              TO  IDX1
             ELSE
               MOVE     2              TO  IDX1
             END-IF
           ELSE
             MOVE       1              TO  IDX1
           END-IF
      *
      *---(01.00.12) LINE ADD START ------------------------------------
      *    高額療養費チェック
      *=== 特疾＋957等の印字修正 by Yoshikawa(2012/07/12) start
      *    特疾＋957等も高額認定されてしまうので、FLG4を判断して回避
      *     IF  RECE02-NYUGAIKBN  =  "1"
           IF  RECE02-FLG(4)  =  ZERO
      *=== 特疾＋957等の印字修正 by Yoshikawa(2012/07/12) end
             IF   RECE02-ZAITAKU  NOT =  SPACE
             AND  RECE02-ZAITAKU  NOT =  "1"
               IF  RECE02-FTNMONEY (1)  NOT =  ZERO
                 MOVE  ZERO                 TO  WRK-SEIKYUGK-G
      *=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) start
                 MOVE  ZERO                 TO  WRK-T-TOTALTEN
      *=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) end
      *---(01.00.14) LINE ADD START ------------------------------------
      *           MOVE  RECE02-FTNMONEY (1)  TO  WRK-T-TOTALTEN
                 MOVE  RECE02-FTNMONEY (1)  TO  WRK-T-KOUGAKU
      *---(01.00.14) LINE ADD END   ------------------------------------
               ELSE
                 MOVE  ZERO                 TO  WRK-SEIKYUGK-G
      *=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) start
      *           COMPUTE  WRK-T-TOTALTEN  =  RECE02-TOTALTEN (1)
      *                                    *  RECE02-KYURATE  /  10
                 MOVE  ZERO                 TO  WRK-T-TOTALTEN
                 COMPUTE  WRK-T-KOUGAKU   =  RECE02-TOTALTEN (1)
                                          *  RECE02-KYURATE  /  10
      *=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) end
               END-IF
      *=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) start
               MOVE  2  TO  IDX1
      *=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) end
             END-IF
           END-IF
      *---(01.00.12) LINE ADD END   ------------------------------------
      *
      *    データ加算
      *    件数
      *---(01.00.14) LINE ADD START ------------------------------------
           IF  IDX1  >  1
               AND   WRK-T-KOUGAKU  =  ZERO
               ADD   1  TO  IDX1
           END-IF
      *---(01.00.14) LINE ADD END   ------------------------------------
      ****2006/05/18 @@@@ START     
           IF  RECE02-HENREIYM = "000000"
             ADD     1                 TO  SKT0100TMP-F-KENSU(1 2 IDX1)
             ADD     WRK-T-TOTALTEN    TO  SKT0100TMP-F-TENSU(1 2 1)
      *---(01.00.14) LINE ADD START ------------------------------------
      *       ADD     WRK-TYOKI         TO  SKT0100TMP-F-TENSU(1 2 2)
      *       ADD     WRK-T-KESE        TO  SKT0100TMP-F-TENSU(1 2 3)
             ADD     WRK-T-KOUGAKU     TO  SKT0100TMP-F-TENSU(1 2 2)
             ADD     WRK-TYOKI         TO  SKT0100TMP-F-TENSU(1 2 3)
             ADD     WRK-T-KESE        TO  SKT0100TMP-F-TENSU(1 2 4)
      *---(01.00.14) LINE ADD END   ------------------------------------
           ELSE
             ADD     1                 TO  SKT0100TMP-F-KENSU(2 2 IDX1)
             ADD     WRK-T-TOTALTEN    TO  SKT0100TMP-F-TENSU(2 2 1)
      *---(01.00.14) LINE ADD START ------------------------------------
      *       ADD     WRK-TYOKI         TO  SKT0100TMP-F-TENSU(2 2 2)
      *       ADD     WRK-T-KESE        TO  SKT0100TMP-F-TENSU(2 2 3)
             ADD     WRK-T-KOUGAKU     TO  SKT0100TMP-F-TENSU(2 2 2)
             ADD     WRK-TYOKI         TO  SKT0100TMP-F-TENSU(2 2 3)
             ADD     WRK-T-KESE        TO  SKT0100TMP-F-TENSU(2 2 4)
      *---(01.00.14) LINE ADD END   ------------------------------------
           END-IF
      ****2006/05/18 @@@@ END
           .
       20011-FUKUSI-HEN-EXT.
           EXIT.
057400*
      *****************************************************************
006900*    重度加算データ編集処理
      *****************************************************************
       20012-FUKUSI-HEN-SEC         SECTION.
      *
      *=== 外来高額、特疾＋957等の印字修正 by Yoshikawa(2012/07/12) start
      *    高額療養費チェック
      *    特疾＋957等も高額認定されてしまうので、FLG4を判断して回避
           IF  RECE02-FLG(4)  =  ZERO
             IF   RECE02-ZAITAKU  NOT =  SPACE
             AND  RECE02-ZAITAKU  NOT =  "1"
               IF  RECE02-FTNMONEY (1)  NOT =  ZERO
                 MOVE  RECE02-FTNMONEY (1)  TO  WRK-T-KOUGAKU
               ELSE
                 COMPUTE  WRK-T-KOUGAKU   =  RECE02-TOTALTEN (1)
                                          *  RECE02-KYURATE  /  10
               END-IF
             END-IF
           END-IF
      *=== 外来高額、特疾＋957等の印字修正 by Yoshikawa(2012/07/12) end
      *
      *    長期編集
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) start
      *     IF     FLG-TYOKI             =      1   AND
      *            WRK-SEIKYUGK-G        >  10000
      *       MOVE    10000             TO  WRK-TYOKI
      *                                     WRK-SEIKYUGK-G
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      *     IF     FLG-TYOKI             =      1
      *       IF   WRK-SEIKYUGK-G        >  10000
      *         MOVE    10000           TO  WRK-TYOKI
      *                                     WRK-SEIKYUGK-G
      *       END-IF
      **=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) end
      *       MOVE    ZERO              TO  WRK-T-TOTALTEN
      *                                     WRK-T-KESE
      *     END-IF
           IF     FLG-TYOKI             =      1
           AND    WRK-SEIKYUGK-G       >=  10000
             MOVE    10000           TO  WRK-TYOKI
                                         WRK-SEIKYUGK-G
             MOVE    ZERO            TO  WRK-T-TOTALTEN
                                         WRK-T-KESE
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) start
             MOVE    ZERO            TO  WRK-T-KOUGAKU
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) end
           END-IF
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *    長期上位
      *=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) start
      *     IF     FLG-TYOKI             =      2   AND
      *            WRK-SEIKYUGK-G        >  20000
      *       MOVE    20000             TO  WRK-TYOKI
      *                                     WRK-SEIKYUGK-G
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      *     IF     FLG-TYOKI             =      2
      *       IF   WRK-SEIKYUGK-G        >  20000
      *         MOVE    20000           TO  WRK-TYOKI
      *                                     WRK-SEIKYUGK-G
      *       END-IF
      **=== 実日数1日は長期とならないのを修正 by Yoshikawa(2009/10/05) end
      *       MOVE    ZERO              TO  WRK-T-TOTALTEN
      *                                     WRK-T-KESE
      *     END-IF
           IF     FLG-TYOKI             =      2
           AND    WRK-SEIKYUGK-G       >=  20000
             MOVE    20000           TO  WRK-TYOKI
                                         WRK-SEIKYUGK-G
             MOVE    ZERO            TO  WRK-T-TOTALTEN
                                         WRK-T-KESE
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) start
             MOVE    ZERO            TO  WRK-T-KOUGAKU
      *=== 高額＋長期の印字修正 by Yoshikawa(2012/07/12) end
           END-IF
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *    結核・精神編集
           IF     FLG-KESE              =  1  AND
                  WRK-T-TOTALTEN        >  0
             MOVE    ZERO               TO  WRK-T-TOTALTEN
           END-IF
      *
      *    保険限度額判定
           IF  RECE02-FTNMONEY(1)       <  WRK-SEIKYUGK-G  AND
               RECE02-FTNMONEY(1)       >  ZERO
             MOVE  RECE02-FTNMONEY(1)  TO  WRK-SEIKYUGK-G
           END-IF
      *
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) start
      *      在総診・在医総か
             MOVE    ZERO               TO  FLG-ZAITAKU
             IF  RECE02-ZAITAKU  =  "1"
               MOVE    1                TO  FLG-ZAITAKU
             ELSE
               PERFORM 960-SRYACT-SET-SEC
             END-IF
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) end
      *
      *=== 外来高額、特疾＋957等の印字修正 by Yoshikawa(2012/07/12) start
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      **    高額療養費チェック
      *     IF  RECE02-NYUGAIKBN  =  "1"
      *       IF   RECE02-ZAITAKU  NOT =  SPACE
      *       AND  RECE02-ZAITAKU  NOT =  "1"
      *         IF  RECE02-FTNMONEY (1)  NOT =  ZERO
      *           MOVE  ZERO                 TO  WRK-SEIKYUGK-G
      *           MOVE  ZERO                 TO  WRK-T-TOTALTEN
      *           MOVE  RECE02-FTNMONEY (1)  TO  WRK-T-KOUGAKU
      *         ELSE
      *           MOVE  ZERO                 TO  WRK-SEIKYUGK-G
      *           MOVE  ZERO                 TO  WRK-T-TOTALTEN
      *           COMPUTE  WRK-T-KOUGAKU   =  RECE02-TOTALTEN (1)
      *                                    *  RECE02-KYURATE  /  10
      *         END-IF
      *       END-IF
      *     END-IF
      **=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
      *=== 外来高額、特疾＋957等の印字修正 by Yoshikawa(2012/07/12) end
      *
      *    件数加算場所を判定
           IF    WRK-T-TOTALTEN         =  ZERO  OR
                 RECE02-RJNHKNNUM   NOT =  SPACE OR
      *---(01.00.15) LINE ADD START ------------------------------------
                 RECE02-HKNNUM          =  "039" OR
                 RECE02-HKNNUM          =  "040" OR
      *---(01.00.15) LINE ADD START ------------------------------------
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) start
      *           RECE02-AGE            >=  70
                 RECE02-AGE            >=  70    OR
                 FLG-ZAITAKU            =  1
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) end
             IF  RECE02-RJNHKNNUM   NOT =  SPACE
      *---(01.00.15) LINE ADD START ------------------------------------
             OR  RECE02-HKNNUM          =  "039"
             OR  RECE02-HKNNUM          =  "040"
      *---(01.00.15) LINE ADD START ------------------------------------
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      *         MOVE     3              TO  IDX1
               MOVE     4              TO  IDX1
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
             ELSE
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      *         MOVE     2              TO  IDX1
               MOVE     3              TO  IDX1
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
      *=== 高額と前期は前期高齢者のみ印字 by Yoshikawa(2013/03/18) start
               IF  WRK-T-KOUGAKU  NOT =  ZERO
      *=== 70歳未満で高額の場合の印字修正 by Yoshikawa(2013/06/10) start
               AND WRK-SEIKYUGK-G NOT =  ZERO
      *=== 70歳未満で高額の場合の印字修正 by Yoshikawa(2013/06/10) end
                 MOVE  ZERO            TO  WRK-T-KOUGAKU
               END-IF
      *=== 高額と前期は前期高齢者のみ印字 by Yoshikawa(2013/03/18) end
             END-IF
             MOVE    ZERO              TO  WRK-T-TOTALTEN
           ELSE
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      *       MOVE       1              TO  IDX1
             IF  WRK-T-KOUGAKU  NOT =  ZERO
               MOVE     2              TO  IDX1
             ELSE
               MOVE     1              TO  IDX1
             END-IF
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
             MOVE      WRK-T-KESE      TO  WRK-SEIKYUGK-G
           END-IF
      *
      *=== 70歳未満＋高額の記載不具合修正 by Yoshikawa(2012/07/12) start
           IF  WRK-T-KOUGAKU  NOT =  ZERO
               MOVE  ZERO                 TO  WRK-SEIKYUGK-G
               MOVE  ZERO                 TO  WRK-T-TOTALTEN
           END-IF
      *=== 70歳未満＋高額の記載不具合修正 by Yoshikawa(2012/07/12) end
      *
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      **---(01.00.12) LINE ADD START ------------------------------------
      **    高額療養費チェック（入院のみ）
      *     IF  RECE02-NYUGAIKBN  =  "1"
      *       IF   RECE02-ZAITAKU  NOT =  SPACE
      *       AND  RECE02-ZAITAKU  NOT =  "1"
      *         IF  RECE02-FTNMONEY (1)  NOT =  ZERO
      *           MOVE  ZERO                 TO  WRK-SEIKYUGK-G
      **---(01.00.16) LINE ADD START ------------------------------------
      *           MOVE  ZERO                 TO  WRK-T-TOTALTEN
      **---(01.00.16) LINE ADD END   ------------------------------------
      **---(01.00.14) LINE ADD START ------------------------------------
      **           MOVE  RECE02-FTNMONEY (1)  TO  WRK-T-TOTALTEN
      *           MOVE  RECE02-FTNMONEY (1)  TO  WRK-T-KOUGAKU
      **---(01.00.14) LINE ADD END   ------------------------------------
      *         ELSE
      *           MOVE  ZERO                 TO  WRK-SEIKYUGK-G
      **=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) start
      **           COMPUTE  WRK-T-TOTALTEN  =  RECE02-TOTALTEN (1)
      **                                    *  RECE02-KYURATE  /  10
      *           MOVE  ZERO                 TO  WRK-T-TOTALTEN
      *           COMPUTE  WRK-T-KOUGAKU   =  RECE02-TOTALTEN (1)
      *                                    *  RECE02-KYURATE  /  10
      **=== 高額時、割欄への点数加算防止 by Yoshikawa(2008/11/18) end
      *         END-IF
      **---(01.00.16) LINE ADD START ------------------------------------
      *         MOVE  2  TO  IDX1
      **---(01.00.16) LINE ADD END   ------------------------------------
      *       END-IF
      *     END-IF
      **---(01.00.12) LINE ADD END   ------------------------------------
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
      *    データ加算
      *    件数
      ****2006/05/18 @@@@ START     
      *---(01.00.14) LINE ADD START ------------------------------------
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) start
      *     IF  IDX1  >  1
      *         AND   WRK-T-KOUGAKU  =  ZERO
      *         ADD   1  TO  IDX1
      *     END-IF
      *=== 一般＋長期の集計位置修正 by Yoshikawa(2012/01/12) end
      *---(01.00.14) LINE ADD END   ------------------------------------
           IF  RECE02-HENREIYM = "000000"
             ADD     1               TO  SKT0100TMP-F-KENSU(1 1 IDX1)
      *---(01.00.14) LINE ADD START ------------------------------------
      *       IF      IDX1                =   1 OR 2
             IF      IDX1                =   1 OR 2 OR 3
               ADD   WRK-T-TOTALTEN    TO  SKT0100TMP-F-TENSU(1 1 1)
               ADD   WRK-T-KOUGAKU     TO  SKT0100TMP-F-TENSU(1 1 2)
      *         ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(1 1 2)
               ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(1 1 3)
      *---(01.00.14) LINE ADD END   ------------------------------------
             ELSE
      *---(01.00.14) LINE ADD START ------------------------------------
      *         ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(1 1 3)
               ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(1 1 4)
      *---(01.00.14) LINE ADD END   ------------------------------------
             END-IF
           ELSE
             ADD     1                 TO  SKT0100TMP-F-KENSU(2 1 IDX1)
      *---(01.00.14) LINE ADD START ------------------------------------
      *       IF      IDX1                =   1 OR 2
             IF      IDX1                =   1 OR 2 OR 3
               ADD   WRK-T-TOTALTEN    TO  SKT0100TMP-F-TENSU(2 1 1)
               ADD   WRK-T-KOUGAKU     TO  SKT0100TMP-F-TENSU(2 1 2)
      *         ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(2 1 2)
               ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(2 1 3)
      *---(01.00.14) LINE ADD END   ------------------------------------
             ELSE
      *---(01.00.14) LINE ADD START ------------------------------------
      *         ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(2 1 3)
               ADD   WRK-SEIKYUGK-G    TO  SKT0100TMP-F-TENSU(2 1 4)
      *---(01.00.14) LINE ADD END   ------------------------------------
      ****2006/05/18 @@@@ END
             END-IF
           END-IF
      *
           .
       20012-FUKUSI-HEN-EXT.
           EXIT.
      *---(01.00.14) LINE ADD START ------------------------------------
      *****************************************************************
      *    請求書カウント処理
      *****************************************************************
       20011-SEIKYU-CNT-SEC         SECTION.
      *
           IF  FLG-KOUKI  =  1
               MOVE   2  TO  IDX1
               MOVE  RECE10-HKNJANUM-S(1:4)  TO  WRK-HKNJANUM
           ELSE
               MOVE   1  TO  IDX1
      *    札幌市の場合、代表番号セット
      *=== 札幌市は区毎に集計する by Yoshikawa(2011/06/13) start
      *         IF  RECE10-HKNJANUM-S (1:3) = "014"
      **---(01.00.18) LINE ADD START ------------------------------------
      **             MOVE  "014001"            TO  WRK-HKNJANUM
      *             MOVE  "010017"            TO  WRK-HKNJANUM
      **---(01.00.18) LINE ADD END   ------------------------------------
      *         ELSE
      *             MOVE  RECE10-HKNJANUM-S   TO  WRK-HKNJANUM
      *         END-IF
               MOVE  RECE10-HKNJANUM-S       TO  WRK-HKNJANUM
      *=== 札幌市は区毎に集計する by Yoshikawa(2011/06/13) end
           END-IF
      *
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) start
      *    返戻分を返戻年月毎でカウントしないようにする
           IF  RECE10-HENREIYM  NOT =  "000000"
               MOVE  "999999"                TO  WRK-HENREIYM
           ELSE
               MOVE  "000000"                TO  WRK-HENREIYM
           END-IF
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) end
      *
      *    重複データか
           PERFORM  VARYING  IDX2  FROM  1  BY  1
                     UNTIL    IDX2  >     50
                     OR       SCNT-HKNJANUM (IDX1 IDX2)  =  SPACE
               IF   (SCNT-HKNJANUM (IDX1 IDX2)  =  WRK-HKNJANUM)
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) start
      *         AND  (SCNT-ZAITAKU  (IDX1 IDX2)  =  RECE10-ZAITAKU)
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) end
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) start
      *         AND  (SCNT-SRYYM    (IDX1 IDX2)  =  RECE10-HENREIYM)
               AND  (SCNT-SRYYM    (IDX1 IDX2)  =  WRK-HENREIYM)
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) end
                   MOVE  IDX2  TO  WRK-CNT
                   MOVE  50  TO  IDX2
               END-IF
           END-PERFORM
      *
           IF  IDX2  <  50
               MOVE  IDX2             TO  WRK-CNT
               MOVE  WRK-HKNJANUM     TO  SCNT-HKNJANUM (IDX1 WRK-CNT)
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) start
      *         MOVE  RECE10-ZAITAKU   TO  SCNT-ZAITAKU (IDX1 WRK-CNT)
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) end
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) start
      *         MOVE  RECE10-HENREIYM  TO  SCNT-SRYYM (IDX1 WRK-CNT)
               MOVE  WRK-HENREIYM     TO  SCNT-SRYYM (IDX1 WRK-CNT)
      *=== 返戻分の請求書枚数カウント修正 by Yoshikawa(2009/01/15) end
           END-IF
      *    重複公費か
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     4
                    OR       RECE10-KOHNUM (IDX3) =   SPACE
      *
      *       ０５１と０９１は同じ場所に集計する
               IF      RECE10-KOHNUM(IDX3) =  "091"
                   MOVE    "051"       TO  RECE10-KOHNUM(IDX3)
               END-IF
      *        公費判別
               PERFORM VARYING IDX4    FROM    1   BY  1
                       UNTIL   IDX4    >       20
                       OR      SCNT-KOHNUM(IDX1 WRK-CNT IDX4) = SPACE
                   IF  RECE10-KOHNUM (IDX3)
                       =   SCNT-KOHNUM (IDX1 WRK-CNT IDX4)
                       MOVE    20      TO  IDX4
                   END-IF
               END-PERFORM
      *        公費重複でない場合は格納
               IF  IDX4  <  20
                   MOVE  RECE10-KOHNUM (IDX3)
                         TO  SCNT-KOHNUM (IDX1 WRK-CNT IDX4)
                   ADD   1     TO  SCNT-KOHSU (IDX1 WRK-CNT)
               END-IF
           END-PERFORM
      *    月遅れ（公費再掲欄）チェック
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
             EVALUATE  TRUE
               WHEN  RECE10-RJNHKNNUM  NOT =  SPACE
                 IF  RECE10-KYURATE  =  9
                   MOVE  1  TO  SCNT-TUKI (IDX1 WRK-CNT 4)
                 ELSE
                   MOVE  1  TO  SCNT-TUKI (IDX1 WRK-CNT 5)
                 END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *         WHEN  (RECE10-HKNNUM  =  "060" AND RECE10-AGE  >=  70
      *                AND  RECE10-KYURATE  =  9)
               WHEN  ((RECE10-HKNNUM  =  "060" OR "068")
                      AND (RECE10-AGE  >=  70)
                      AND (RECE10-KYURATE  =  9))
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
                   MOVE  1  TO  SCNT-TUKI (IDX1 WRK-CNT 1)
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *         WHEN  (RECE10-HKNNUM  =  "067" AND RECE10-AGE  >=  70)
               WHEN  ((RECE10-HKNNUM  =  "067" OR "069")
                      AND (RECE10-AGE  >=  70))
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
                 IF  RECE10-KYURATE  =  9
                   MOVE  1  TO  SCNT-TUKI (IDX1 WRK-CNT 2)
                 ELSE
                   MOVE  1  TO  SCNT-TUKI (IDX1 WRK-CNT 3)
                 END-IF
             END-EVALUATE
           END-IF
      *
           .
       20011-SEIKYU-CNT-EXT.
           EXIT.
      *---(01.00.14) LINE ADD END   ------------------------------------
057400*
      *****************************************************************
006900*    請求ＤＢ更新用ファイル出力処理
      *****************************************************************
       230-UPD-FILE-HENSYU-SEC         SECTION.
      *
           DISPLAY "230-UPD-FILE-HENSYU-SEC"
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
           OPEN     INPUT       SKT0100TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      *
             MOVE     1           TO       WRK-CNT
             MOVE     ZERO        TO       FLG-PASS
      *---(01.00.14) LINE ADD START ------------------------------------
      *公費ソート処理
      *       PERFORM  KOH-SORT-SEC
      *
      *       PERFORM  UNTIL  SKT0100TMP-KOHNUM(WRK-CNT) = SPACE
      *                AND    FLG-PASS  =  1
      *---(01.00.14) LINE ADD END   ------------------------------------
      *    帳票編集<見出し>処理
               PERFORM  310-HEAD-HEN-SEC
               DISPLAY "310-OK"
      *    帳票編集<明細>処理
               PERFORM  320-BODY-HEN-SEC
               DISPLAY "320-OK"
      *    帳票印刷処理
               PERFORM  330-PRINT-OUT-SEC
               DISPLAY "330-OK" WRK-CNT
      *---(01.00.14) LINE ADD START ------------------------------------
      *         MOVE     1         TO       FLG-PASS
      *       END-PERFORM
      *---(01.00.14) LINE ADD END   ------------------------------------
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT0100TMP-FILE
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
           INITIALIZE                             SKT0100
      *---(01.00.10) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE     SYS-1002-ADRS            TO   SKT0100-ADRS
      *    医療機関名
      *     MOVE     SYS-1001-HOSPNAME        TO   SKT0100-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS              TO  SKT0100-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) start
           INSPECT SKT0100-ADRS              REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) end
      *    医療機関名
           MOVE    WRK-HOSPNAME              TO  SKT0100-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) start
           INSPECT SKT0100-HOSPNAME          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/13) end
      *---(01.00.10) LINE ADD END   ------------------------------------
      *    医療機関コード
           MOVE     SYS-1001-HOSPCD          TO   SKT0100-HOSPCD
      *
      *    請求日
           MOVE     WRK-SEIYMDWH             TO   SKT0100-SEIYMD
      *---(01.00.06) LINE ADD START ------------------------------------
      *    在総診
      *=== 在宅はまとめて集計 by hagino(2013/12/05) start
      *     IF      SKT0100TMP-ZAITAKU     =    "1"
      *       MOVE  "在"                      TO   SKT0100-ZAI1
      *       MOVE  "◯"                      TO   SKT0100-ZAI2
      *     END-IF
      *=== 在宅はまとめて集計 by hagino(2013/12/05) end
      *---(01.00.06) LINE ADD START ------------------------------------
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"              TO   SKT0100-TOKUBETU
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
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      **    ----------一般国保・退職・老人編集----------
      *    ----------一般国保・後期高齢編集----------
      *---(01.00.14) LINE ADD END   ------------------------------------
          IF     WRK-CNT    =     1
             PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.14) LINE ADD START ------------------------------------
      *                UNTIL    IDX1  >     3
                      UNTIL    IDX1  >     2
      *---(01.00.14) LINE ADD END   ------------------------------------
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *
      *    件数
                 MOVE   SKT0100TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE   WRK-Z5        TO  SKT0100-KENSU(IDX1 IDX2)
      *
      *    点数
                 MOVE   SKT0100TMP-TENSU(IDX1 IDX2)  TO  WRK-Z14
                 MOVE   WRK-Z14        TO  SKT0100-TENSU(IDX1 IDX2)
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *    一部負担金
      *           MOVE   SKT0100TMP-ITBFTN(IDX1 IDX2)  TO  WRK-Z10
      *           MOVE   WRK-Z10        TO  SKT0100-ITBFTN(IDX1 IDX2)
      *---(01.00.14) LINE ADD END   ------------------------------------
               END-PERFORM
      *---(01.00.14) LINE ADD START ------------------------------------
      *
      *    食事件数
      *         MOVE     SKT0100TMP-SKENSU(IDX1)       TO  WRK-Z5
      *         MOVE     WRK-Z5         TO  SKT0100-SKENSU(IDX1)
      *
      *    食事金額
      *         MOVE     SKT0100TMP-SKINGK(IDX1)       TO  WRK-Z14
      *         MOVE     WRK-Z14        TO  SKT0100-SKINGK(IDX1)
      *
      *    食事標準負担額
      *         MOVE     SKT0100TMP-SFTNGK(IDX1)       TO  WRK-Z10
      *         MOVE     WRK-Z10        TO  SKT0100-SFTNGK(IDX1)
      *
      **    ----------合計・道老編集----------
      *    ----------合計編集----------
      *---(01.00.14) LINE ADD END   ------------------------------------
      *    件数
               MOVE   SKT0100TMP-ETC-KENSU(IDX1)    TO  WRK-Z5
               MOVE   WRK-Z5           TO  SKT0100-ETC-KENSU(IDX1)
      *
      *    点数
               MOVE   SKT0100TMP-ETC-TENSU(IDX1)    TO  WRK-Z14
               MOVE   WRK-Z14          TO  SKT0100-ETC-TENSU(IDX1)
      *
      *    一部負担金
      *         MOVE   SKT0100TMP-ETC-ITBFTN(IDX1)   TO  WRK-Z10
      *         MOVE   WRK-Z10          TO  SKT0100-ETC-ITBFTN(IDX1)
      *
      *    食事件数
      *         MOVE   SKT0100TMP-ETC-SKENSU(IDX1) TO  WRK-Z5
      *         MOVE   WRK-Z5           TO  SKT0100-ETC-SKENSU(IDX1)
      *
      *    食事金額
      *         MOVE   SKT0100TMP-ETC-SKINGK(IDX1) TO  WRK-Z14
      *         MOVE   WRK-Z14          TO  SKT0100-ETC-SKINGK(IDX1)
      *
      *    食事標準負担額
      *         MOVE   SKT0100TMP-ETC-SFTNGK(IDX1) TO  WRK-Z10
      *         MOVE   WRK-Z10          TO  SKT0100-ETC-SFTNGK(IDX1)
      *
             END-PERFORM
      *
      *    ----------地方公費再掲分編集----------
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     2
               PERFORM  VARYING  IDX2  FROM  1  BY  1
      *---(01.00.14) LINE ADD START ------------------------------------
      *                  UNTIL    IDX2  >     3
                        UNTIL    IDX2  >     4
      *---(01.00.14) LINE ADD START ------------------------------------
      ****2006/05/18 @@@@ START
                IF WRK-PARA-SYOKBN = "1" 
                 MOVE  SKT0100TMP-F-KENSU(1 IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5       TO  SKT0100-F-KENSU(IDX1 IDX2)
                 MOVE  SKT0100TMP-F-TENSU(1 IDX1 IDX2)  TO  WRK-Z11
                 MOVE  WRK-Z11      TO  SKT0100-F-TENSU(IDX1 IDX2)
                ELSE
                 MOVE  SKT0100TMP-F-KENSU(2 IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5       TO  SKT0100-F-KENSU(IDX1 IDX2)
                 MOVE  SKT0100TMP-F-TENSU(2 IDX1 IDX2)  TO  WRK-Z11
                 MOVE  WRK-Z11      TO  SKT0100-F-TENSU(IDX1 IDX2)
                END-IF
      ****2006/05/18 @@@@ END
               END-PERFORM
             END-PERFORM
           END-IF
      *
      *
      *    ----------その他公費編集----------
      *---(01.00.14) LINE ADD START ------------------------------------
      *     PERFORM  VARYING  IDX1     FROM  1   BY  1
      *              UNTIL    IDX1     >     10
      *              OR       WRK-CNT  >     20
      *              OR       SKT0100TMP-KOHNUM(WRK-CNT) = SPACE
      *
      *    法別番号
      *       MOVE  SKT0100TMP-KOHNUM(WRK-CNT)  TO  WRK-KOHNUM
      *       PERFORM  950-HKNNUM-SET-SEC
      *       MOVE  HKN-HBTNUM   TO  SKT0100-HBTNUM(IDX1)
      *
      *    件数
      *       MOVE   SKT0100TMP-K-KENSU(WRK-CNT)    TO  WRK-Z5
      *       MOVE   WRK-Z5           TO  SKT0100-K-KENSU(IDX1)
      *
      *    点数
      *       MOVE   SKT0100TMP-K-TENSU(WRK-CNT)    TO  WRK-Z14
      *       MOVE   WRK-Z14          TO  SKT0100-K-TENSU(IDX1)
      *
      *    一部負担金
      *       MOVE   SKT0100TMP-K-ITBFTN(WRK-CNT)   TO  WRK-Z10
      *       MOVE   WRK-Z10          TO  SKT0100-K-ITBFTN(IDX1)
      *
      *    食事件数
      *       MOVE   SKT0100TMP-K-SKENSU(WRK-CNT) TO  WRK-Z5
      *       MOVE   WRK-Z5           TO  SKT0100-K-SKENSU(IDX1)
      *
      *    食事金額
      *       MOVE   SKT0100TMP-K-SKINGK(WRK-CNT) TO  WRK-Z14
      *       MOVE   WRK-Z14          TO  SKT0100-K-SKINGK(IDX1)
      *
      *    食事標準負担額
      *       MOVE   SKT0100TMP-K-SFTNGK(WRK-CNT) TO  WRK-Z10
      *       MOVE   WRK-Z10          TO  SKT0100-K-SFTNGK(IDX1)
      *       ADD    1                TO  WRK-CNT
      *     END-PERFORM
      *---(01.00.14) LINE ADD END   ------------------------------------
      *
      *---(01.00.14) LINE ADD START ------------------------------------
      *    請求書の枚数
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     2
      *
               INITIALIZE  WRK-MAISU
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) start
               INITIALIZE  WRK-ZAIMAISU
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) end
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    SCNT-HKNJANUM(IDX1 IDX2)  =  SPACE
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) start
      *           IF  SKT0100TMP-ZAITAKU  =  SCNT-ZAITAKU(IDX1 IDX2)
      *             ADD  1  TO  WRK-MAISU
      **          公費再掲欄を考慮
      *             COMPUTE  WRK-KOHKEI  =  SCNT-KOHSU(IDX1 IDX2)
      *                                  +  SCNT-TUKI(IDX1 IDX2 1)
      *                                  +  SCNT-TUKI(IDX1 IDX2 2)
      *                                  +  SCNT-TUKI(IDX1 IDX2 3)
      *                                  +  SCNT-TUKI(IDX1 IDX2 4)
      *                                  +  SCNT-TUKI(IDX1 IDX2 5)
      *             IF  IDX1  =  1
      *               DIVIDE  WRK-KOHKEI  BY  5  GIVING  WRK-KOHKEI2
      *                     REMAINDER   WRK-AMARI
      *             ELSE
      **              １枚目に公費欄があるので４を引く
      *               IF  WRK-KOHKEI  >  4
      *                 COMPUTE  WRK-KOHKEI  =  WRK-KOHKEI  -  4
      *                 DIVIDE  WRK-KOHKEI  BY  4  GIVING  WRK-KOHKEI2
      *                       REMAINDER   WRK-AMARI
      *               ELSE
      *                 MOVE  ZERO  TO  WRK-KOHKEI2
      *                 MOVE  ZERO  TO  WRK-AMARI
      *               END-IF
      *             END-IF
      **            公費分の枚数を加算
      *             COMPUTE  WRK-MAISU  =  WRK-MAISU  +  WRK-KOHKEI2
      *             IF  WRK-AMARI  NOT =  ZERO
      *                 ADD  1  TO  WRK-MAISU
      *             END-IF
      *           END-IF
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) start
      **           在宅は別で出力される為、集計領域を分ける
      *            IF  SCNT-ZAITAKU(IDX1 IDX2)  =  "1"
      *              ADD  1  TO  WRK-ZAIMAISU
      *            ELSE
      *              ADD  1  TO  WRK-MAISU
      *            END-IF
                  ADD    1            TO  WRK-MAISU
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) end
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) end
               END-PERFORM
      *
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) start
      *         MOVE  WRK-MAISU        TO  WRK-Z5
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) start
      *         IF  SKT0100TMP-ZAITAKU  =  "1"
      *           MOVE  WRK-ZAIMAISU   TO  WRK-Z5
      *         ELSE
      *           MOVE  WRK-MAISU      TO  WRK-Z5
      *         END-IF
               MOVE  WRK-MAISU        TO  WRK-Z5
      *=== 請求書の枚数欄の修正 by Yoshikawa(2015/04/14) end
      *=== 請求書の枚数欄は保険者数 by Yoshikawa(2008/09/22) end
               MOVE  WRK-Z5           TO  SKT0100-MAISU (IDX1)
           END-PERFORM
      *---(01.00.14) LINE ADD END   ------------------------------------
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                SECTION.
      *
           ADD      1         TO        CNT-PAGE
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
           MOVE   "SKT0100.red"        TO  SPRT-PRTID
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/08/07) start
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
      *=== 返戻時、再印刷画面のタイトル修正 by hagino(2014/08/07) end
           MOVE    SKT0100             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.10) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.14) LINE ADD START ------------------------------------
      *****************************************************************
      *    公費ソート処理
      *****************************************************************
      * KOH-SORT-SEC          SECTION.
      *
      *
      *     INITIALIZE  SORT-AREA
      *    一般公費数と最小公費を取得
      *     MOVE    ZERO    TO    IDX-MAX
      *                           IDX2 
      *     MOVE    SPACE   TO    WRK-KOHNUM
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >  20
      *       IF  SKT0100TMP-KOHNUM(IDX1)  =  SPACE
      *         MOVE  20    TO    IDX1
      *       ELSE
      *         IF    WRK-KOHNUM               =   SPACE   OR
      *               SKT0100TMP-KOHNUM(IDX1)  <   WRK-KOHNUM
      *           MOVE     IDX1                TO  IDX2
      *           MOVE     SKT0100TMP-KOHNUM(IDX1) TO  WRK-KOHNUM
      *         END-IF
      *         ADD   1     TO    IDX-MAX
      *       END-IF
      *     END-PERFORM
      *     IF     IDX2     >     ZERO
      *       MOVE    SKT0100TMP-KOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
      *     END-IF
      **
      *
      *     DISPLAY "一般ソート前１" SKT0100TMP-KOHNUM(1)
      *     DISPLAY "一般ソート前２" SKT0100TMP-KOHNUM(2)
      *     DISPLAY "一般ソート前３" SKT0100TMP-KOHNUM(3)
      *     DISPLAY "一般ソート前４" SKT0100TMP-KOHNUM(4)
      *     DISPLAY "一般ソート前５" SKT0100TMP-KOHNUM(5)
      *
      *    公費が無い場合はソートしない
      *     IF      IDX-MAX    >    ZERO
      *       MOVE    2    TO    IDX1
      *       MOVE    1    TO    IDX2
      *       MOVE    1    TO    IDX3
      *       MOVE   "999" TO    WRK-KOHNUM
      *       PERFORM    UNTIL    IDX1  >    IDX-MAX
      *         PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                  UNTIL    IDX2  >    IDX-MAX
      *           IF     SKT0100TMP-KOHNUM(IDX2) > SORT-KOHNUM(IDX1 - 1)
      *             IF  SKT0100TMP-KOHNUM(IDX2) < WRK-KOHNUM
      *               MOVE  SKT0100TMP-KOHNUM(IDX2)  TO WRK-KOHNUM
      *               MOVE  IDX2          TO    IDX3
      *             END-IF
      *           END-IF
      *         END-PERFORM
      *         MOVE  SKT0100TMP-KOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
      *         MOVE  "999"  TO    WRK-KOHNUM
      *         ADD   1    TO    IDX1
      *       END-PERFORM
      *
      *       INITIALIZE             SKT0100TMP-KOHI-AREA
      *       MOVE  SORT-AREA  TO    SKT0100TMP-KOHI-AREA
      *     END-IF
      *     DISPLAY "一般ソート後１" SKT0100TMP-KOHNUM(1)
      *     DISPLAY "一般ソート後２" SKT0100TMP-KOHNUM(2)
      *     DISPLAY "一般ソート後３" SKT0100TMP-KOHNUM(3)
      *     DISPLAY "一般ソート後４" SKT0100TMP-KOHNUM(4)
      *     DISPLAY "一般ソート後５" SKT0100TMP-KOHNUM(5)
      *
      *
      *
      *     .
      * KOH-SORT-EXT.
      *     EXIT.
      *
      *---(01.00.14) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.10) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *
                   MOVE    RECE10-REC             TO  MCPDATA-REC
                   MOVE    "DBUPDATE"             TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU0100 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU0100 SEIKYU INVALID ***"
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
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
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
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM         TO  RECE10-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) start
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  000000              TO  RECE10-SRYYM
             MOVE  999999              TO  RECE10-XXSRYYM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2011/02/09) end
      *
           MOVE    RECE10-REC                 TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      ****2006/05/11 @@@@ START
      **     MOVE    PATH-TBL-SEIKYU-KEY4       TO  MCP-PATH
      *     MOVE   WRK-PATH              TO  MCP-PATH
      ****2006/05/11 @@@@ END
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *****2006/05/11 @@@@ START
      **     MOVE    PATH-TBL-SEIKYU-KEY4       TO  MCP-PATH
      *     MOVE    WRK-PATH                TO  MCP-PATH
      *****2006/05/11 @@@@ END
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
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/06/17) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/06/17) end
      *
      *        テスト患者のときは読み飛ばす
               INITIALIZE                      PTINF-REC
      *---(01.00.10) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       800-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT0100TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT0100TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT0100TMP
           END-READ
           .
       800-SKTTMP-READ-EXT.
           EXIT.
      *
      *---(01.00.14) LINE ADD START ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  950-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/06/17) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/06/17) end
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
       DISPLAY "950-SEIKYU-READ-EXT"
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
           DISPLAY "950-SEIKYU-CLOSE-SEC"
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
      *---(01.00.14) LINE ADD END   ------------------------------------
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT0100TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
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
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKN-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE  WRK-KOHNUM                  TO  HKN-HKNNUM
           MOVE  HKNNUM-REC                  TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknnum"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.10) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNNUM-KEY2      TO  MCP-PATH
             MOVE    "tbl_hknnum"        TO  MCP-TABLE
             MOVE    "key2"              TO  MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknnum"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
           MOVE  "DBFETCH"           TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) start
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
      *           MOVE    1             TO  FLG-ZAITAKU
      *         END-IF
      *
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) start
               IF  RECE02-SRYYM  >=  WRK-CONS-SRYYM-201604
                 PERFORM  VARYING  IDX5  FROM  1  BY  1
                          UNTIL   (IDX5  >  TBL-ZAITAKU3-MAX)
                          OR      (FLG-ZAITAKU  =   1 )
                   IF  SRY-SRYCD(IDX4)  =  TBL-ZAITAKU3(IDX5)
                       MOVE     1      TO  FLG-ZAITAKU
                   END-IF
                 END-PERFORM
               ELSE
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) end
                 IF  RECE02-SRYYM  >=  WRK-CONS-SRYYM-201404
                   PERFORM  VARYING  IDX5  FROM  1  BY  1
                            UNTIL   (IDX5  >  TBL-ZAITAKU2-MAX)
                            OR      (FLG-ZAITAKU  =  1)
                     IF  SRY-SRYCD(IDX4)  =  TBL-ZAITAKU2(IDX5)
                         MOVE    1       TO  FLG-ZAITAKU
                     END-IF
                   END-PERFORM
                 ELSE
                   PERFORM  VARYING  IDX5  FROM  1  BY  1
                            UNTIL   (IDX5  >  TBL-ZAITAKU-MAX)
                            OR      (FLG-ZAITAKU  =  1)
                     IF  SRY-SRYCD(IDX4)  =  TBL-ZAITAKU(IDX5)
                         MOVE    1       TO  FLG-ZAITAKU
                     END-IF
                   END-PERFORM
                 END-IF
      *=== 在宅コード変更 by Yoshikawa(2014/05/20) end
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) start
               END-IF
      **=== 在宅の対象とする診療コード変更 by Monma(2016/05/10) end
             END-IF
           END-PERFORM
      *
           .
       965-ZAISOU-CHK-EXT.
           EXIT.
      *=== 70歳未満でも在宅を記載 by Yoshikawa(2013/07/26) end
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           DISPLAY "900-KOHSKY-START-SEC"
           INITIALIZE                  RECE02-REC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM(1) = "144" OR "244" OR "344" 
      *                             OR "143" OR "243" OR "343" 
      *                             OR "544" OR "543"
      *          OR RECE02-KOHNUM(2) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543"
      *          OR RECE02-KOHNUM(3) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543"
      *          OR RECE02-KOHNUM(4) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543"
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
      *         IF  RECE02-KOHNUM(1) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543" OR "643"
      *                             OR "644" OR "743" OR "744"
      *                             OR "843" OR "844"
      *          OR RECE02-KOHNUM(2) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543" OR "643"
      *                             OR "644" OR "743" OR "744"
      *                             OR "843" OR "844"
      *          OR RECE02-KOHNUM(3) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543" OR "643"
      *                             OR "644" OR "743" OR "744"
      *                             OR "843" OR "844"
      *          OR RECE02-KOHNUM(4) = "144" OR "244" OR "344"
      *                             OR "143" OR "243" OR "343"
      *                             OR "544" OR "543" OR "643"
      *                             OR "644" OR "743" OR "744"
      *                             OR "843" OR "844"
               INITIALIZE                          WRK-CHK-KOHNUM-TBL
               MOVE    RECE02-KOHNUM(1)        TO  WRK-CHK-KOHNUM(1)
               MOVE    RECE02-KOHNUM(2)        TO  WRK-CHK-KOHNUM(2)
               MOVE    RECE02-KOHNUM(3)        TO  WRK-CHK-KOHNUM(3)
               MOVE    RECE02-KOHNUM(4)        TO  WRK-CHK-KOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *---(01.00.07) LINE ADD END   ------------------------------------
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
                   IF      WRK-PARA-STSRYYM    =   "999999"
                       CONTINUE
                   ELSE
                       IF  ( RECE02-SRYYM      <   WRK-PARA-STSRYYM )
                       OR  ( RECE02-SRYYM      >   WRK-PARA-EDSRYYM )
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
      *        テスト患者のときは読み飛ばす
                   INITIALIZE                      PTINF-REC
      *---(01.00.10) LINE ADD START ------------------------------------
      *             MOVE    RECE02-HOSPID       TO  PTINF-HOSPID
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
                   MOVE    RECE02-PTID         TO  PTINF-PTID
                   MOVE    PTINF-REC           TO  MCPDATA-REC
                   PERFORM 800-PTINF-READ-SEC
                   IF      FLG-PTINF           =   ZERO
                   AND     PTINF-TSTPTNUMKBN   =   "1"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *=== 福祉のみの場合でも印字 by Yoshikawa(2016/06/14) start
                   EVALUATE  WRK-PARA-SYOKBN
                     WHEN  "1"
                       IF  RECE02-HENREIYM  NOT =  "000000"
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                     WHEN  "2"
                       IF  RECE02-HENREIYM  =  "000000"
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-EVALUATE
      *=== 福祉のみの場合でも印字 by Yoshikawa(2016/06/14) end
                   ADD     1                   TO  CNT-RECE02
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
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           DISPLAY "BEFORE FLG-ERR =" FLG-ERR
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
               MOVE    1                     TO  FLG-KESE
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
      *---(01.00.10) LINE ADD START ------------------------------------
             WHEN "974"
               MOVE    2                     TO  FLG-TYOKI
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) start
      *         MOVE    ZERO                  TO  FLG-ERR
      *=== 長期等＋公費助成無しは印字しない by Yoshikawa(2008/11/25) end
      *---(01.00.10) LINE ADD END   ------------------------------------
             END-EVALUATE
      *
      *    計算負担金に差が有る場合、地方公費の助成があったと判定する
             IF     FLG-ERR                 =  1
               DISPLAY "対象外候補=" RECE02-PTNUM
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
      *=== 公費の助成判定変更 by Yoshikawa(2009/10/27) start
      *    長期及び全国公費を併用している場合は公費の助成がなくても記載
             IF  SYU-KOH-HKNNUM(IDX)(1:1)  =  "0"
             OR  SYU-KOH-HKNNUM(IDX)       =  "972"
             OR  SYU-KOH-HKNNUM(IDX)       =  "974"
                MOVE  ZERO                 TO  FLG-ERR
             END-IF
      *=== 公費の助成判定変更 by Yoshikawa(2009/10/27) end
      *
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) start
      **=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
      **    同保険、同入外区分で診療が複数日ある場合は処理判定を行わない
      **    （その前の診療で全国公費の負担があるから）
      *       IF  SYU-KOH-HKNNUM(IDX)(1:1)  =  "0" 
      *       AND WRK-SRYCNT  <  2
      **        窓口負担が発生しない全国公費は印字対象外
      *         IF  SYU-KOH-COMPFTN-ENTANI(IDX)  =  ZERO
      *           MOVE  1                   TO  FLG-ERR2
      *         END-IF
      *       END-IF
      **=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
             IF  FLG-SYORI2  =  ZERO
               IF  SYU-KOH-HKNNUM(IDX)(1:1)  =  "0" 
      *=== 負担無しの道難病は印字対象外 by Yoshikawa(2016/08/15) start
               OR  SYU-KOH-HKNNUM(IDX)       =  "283" OR "383"
      *=== 負担無しの道難病は印字対象外 by Yoshikawa(2016/08/15) end
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
      *  収納情報セット
      *****************************************************************
       920-SYUNOU-SET-SEC  SECTION.
      *
             INITIALIZE  SYUNOU-REC
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) start
                         FLG-SYORI2
      *=== 公費助成判定の修正 by Yoshikawa(2010/03/25) end
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
             MOVE   1                 TO  WRK-SRYCNT
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
      *---(01.00.10) LINE ADD START ------------------------------------
      *       MOVE  RECE02-HOSPID      TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"           USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_syunou"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.10) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH        TO  MCP-PATH
               MOVE    "tbl_syunou"        TO  MCP-TABLE
               MOVE    WRK-PATH            TO  MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *
                          PERFORM  800-SEIKYU-SEC
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) start
                          ADD  1          TO  WRK-SRYCNT
      *=== 患者負担無の全国公費は印字対象外 by Yoshikawa(2009/10/27) end
                      END-IF
      *
                   END-IF
                 END-IF
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH        TO  MCP-PATH
                 MOVE    "tbl_syunou"        TO  MCP-TABLE
                 MOVE    WRK-PATH            TO  MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"        USING
      *                             MCPAREA
      *                             MCPDATA-REC
             MOVE    "tbl_syunou"        TO  MCP-TABLE
             MOVE    WRK-PATH            TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"             USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    SYU-HOSPID                 TO  COMB-HOSPID
           MOVE    SPA-HOSPNUM                TO  COMB-HOSPNUM
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    SYU-PTID                   TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM            TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hkncombi"          TO  MCP-TABLE
               MOVE    "key"                   TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"             USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       910-SYSKANRI-INV-SEC         SECTION.
      *
      *###（地方公費仕様）
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
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
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) start
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
      *=== 対象公費をPGオプションから取得 by Yoshikawa(2016/06/01) end
      *---(01.00.10) LINE ADD START ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) start
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
      *=== 医療機関コード変更時作成対応 by Yoshikawa(2017/02/10) end
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
      *---(01.00.10) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.10) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.10) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.10) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
      *
      *---(01.00.10) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.10) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.10) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.10) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
