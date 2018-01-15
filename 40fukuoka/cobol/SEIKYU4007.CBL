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
       IDENTIFICATION              DIVISION.
       PROGRAM-ID.                 SEIKYU4007.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : レセプト
      *  コンポーネント名  : 福岡複写式レセ
      *                      (対象公費はTAISYOKOHI.INI参照)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/06/15    有村          再作成(入院用様式追加対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      *  01.00.01    山口   2005/09/07    入院分の記号番号、日数が表示
      *                                   されるよう修正
      *  01.00.02    内田   2006/07/14    プレビュー時の患者番号を印字
      *  01.00.03    内田   2006/08/27    国保は県外国組のみ対象
      *  01.00.04    内田   2006/10/31    国保は印字対象外
      *  01.00.05    内田   2007/01/31    印字対象番号の追加（２８１）
      *  01.00.06    内田   2007/06/15    負担無しの乳幼児も初診料等を印字
      *  01.00.07    内田   2007/08/03    印字対象番号の追加（290）
      *                                   給付外点数は０の場合は０記載
      *                                   月中保険変更時に病名が印字
      *                                   されないのを修正
      *  01.00.08    内田   2007/08/26    給付外点数は０の場合は０記載
      *  01.00.09    内田     07/10/08    日レセver4.0対応
      *                                   システム管理マスタ「1901」の
      *                                   医療機関情報を参照
      *  01.00.10    内田     08/05/02    表示を３歳から６歳へ変更
      *  01.00.11    内田     08/07/09    表示を「高外一」「高外７」等へ変更
      *  01.00.12    内田     08/10/02    帳票様式の変更に伴う修正
      *                                   印字対象番号の追加
      *                                   （280,380,381,390,490）
      *  01.00.13    吉川     08/11/05    公費の助成がない場合は印字しない
      *  01.00.14    吉川     08/11/21    FLG-ERR初期化位置修正
      *                                   保険番号180,181,190の場合
      *                                   初診料を印字する
      *  01.00.15    吉川     08/12/11    医学管理、在宅を印字する
      *                                   印字対象番号の追加（480,481,590）
      *  01.00.16    吉川     09/05/14    特記事項を印字する
      *  01.00.17    吉川     09/05/27    H21年5月特定疾患改正対応
      *  01.00.18    吉川     09/10/30    印字対象番号の追加（690,780）
      *  01.00.19    吉川     10/12/16    open-cobol1.0対応
      *  01.00.20    吉川     12/03/12    対象公費番号をINIファイルから
      *                                   取得するようにする
      *  01.00.21    吉川     13/01/17    テーブルのprimary key変更対応
      *  01.00.22    吉川     13/01/22    医療機関情報編集対応
      *  01.00.23    吉川     13/02/07    プラグイン対応
      *  01.00.24    吉川     13/09/04    TAISYOKOHIで設定した公費を持つ
      *                                   患者の病名を印字するように修正
      *                                   プログラムオプション対応
      *  01.00.25    萩野     14/09/12    同月内に長期の上限額に達した場合において
      *                                   該当公費と長期の併用があった場合、
      *                                   特記事項に長期を印字する
      *  01.00.26    吉川     14/10/27    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.27    吉川     15/01/30    平成２７年１月改正対応
      *  01.00.28    吉川     15/05/14    負担者番号順追加
      *                                   通し番号を印字
      *  01.00.29    門間     16/05/17    特記事項欄に「37申出」を追加
      *  01.00.30    門間     17/03/14    医療機関コード変更時、
      *                                   医療機関コード別の作成処理対応
      *  01.00.31    吉川     17/10/16    SITEKBN変更
      *  01.00.32    門間     18/01/09    下部の負担者番号等は１枚目に印字
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL. 
      *    編集ファイル
           SELECT  MF100-FILE      ASSIGN    MF100PARA
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  MF100-KEY
                                   FILE    STATUS  IS  STS-MF100.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      **    レセプト印刷順ファイル
      *     SELECT  SYUTURYOKU-FILE ASSIGN FILE-NAME
      *                             ORGANIZATION   IS  LINE SEQUENTIAL
      *                             ACCESS MODE    IS  SEQUENTIAL
      *                             FILE   STATUS  IS  STS-SYUTURYOKU.
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    レセプト０３１データ
           SELECT  RECE031-FILE     ASSIGN  RECE031PARA
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  SEQUENTIAL
                                   RECORD  KEY     IS  RECE031-KEY
                                   FILE    STATUS  IS  STS-RECE.
006900*    エラーファイル
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    編集ファイル
       FD  MF100-FILE.
       01  MF100-REC.
           COPY  "SEI4007.INC".
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      **    レセプト印刷順ファイル
      * FD  SYUTURYOKU-FILE.
      * 01  STU-REC.
      *     03  FILLER              PIC X(21).
      *     03  STU-NUM             PIC X(02). 
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    レセプト０３１データ
       FD  RECE031-FILE.
       01  RECE031-REC.
           COPY    "CPRCF0031.INC".
      *
      *    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
       WORKING-STORAGE             SECTION.
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01//
                                   BY         //MF100//.
      *
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01//
                                   BY         //RECE031//.
      *
      *    エラーファイル 名称領域 
      *---(01.00.09) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03                      PIC X(04)   VALUE   ".dat".
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
           COPY  "SC4007.INC"
                   REPLACING  //HCM09V02//
                   BY         //HC06//.
           COPY  "SC4008.INC"
                   REPLACING  //HCN06V03//
                   BY         //HCN06//.
      *
      *    スパ領域
      *---(01.00.09) LINE ADD START ------------------------------------
      * 01  SPA-AREA.
      *     03  SPA-ERRCD               PIC X(04).
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *    フラグ領域
       01  STS-AREA.
           03  STS-MF100           PIC X(02).
           03  STS-SYUTURYOKU      PIC X(02).
           03  STS-RECE            PIC X(02).
           03  STS-RECEERR         PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
           03  STS-TAISYOKOHI      PIC X(02).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
           03  FLG-PRGOPTION       PIC 9(01).
           03  FLG-OK              PIC 9(01).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END         PIC 9(03).
           03  FLG-RECE031     PIC 9(01).
           03  FLG-KANRIMST    PIC 9(01).
           03  FLG-KUGIRI      PIC 9(01).
           03  FLG-RECE07      PIC 9(01).
           03  FLG-RECECOM     PIC 9(01).
           03  FLG-ERR         PIC 9(01).
           03  FLG-PTINF       PIC 9(01).
           03  FLG-SYSKANRI    PIC 9(01).
           03  FLG-SYSKANRI3   PIC 9(01).
           03  FLG-SYUNOU      PIC 9(01).
           03  FLG-SRYACT      PIC 9(01).
           03  FLG-SRYACCT     PIC 9(01).
           03  FLG-HKNCOMBI    PIC 9(01).
           03  FLG-TENKI       PIC 9(01).
           03  FLG-SYORI       PIC 9(01).
           03  FLG-BTPARA      PIC 9(01).
           03  FLG-SEIKYU      PIC 9(01).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
           03  FLG-TAISYOKOHI  PIC 9(01).
           03  FLG-TAISYO      PIC 9(01).
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
           03  FLG-TYOKI       PIC 9(01).
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-ERR         PIC 9(06).
           03  CNT-RECE02      PIC 9(06).
           03  CNT-RECE03      PIC 9(06).
           03  CNT-OUT         PIC 9(06).
           03  CNT-ZAIMEISAISU PIC 9(03).
           03  CNT-PAGE        PIC 9(03).
           03  CNT-KENSU       PIC 9(03).
           03  CNT-COMMIT      PIC 9(03). 
      *
      *    システム領域
       01  SYS-AREA.
           03  SYS-TIME.
               05  SYS-THH         PIC 9(02).
               05  SYS-TMM         PIC 9(02).
               05  SYS-TSS         PIC 9(02).
               05  SYS-TDD         PIC 9(02).
           03  SYS-YMD.
               05  SYS-YY          PIC 9(02).
               05  SYS-MM          PIC 9(02).
               05  SYS-DD          PIC 9(02).
           03  WRK-SYSYMD.
               05  WRK-SYSYY       PIC 9(04).
               05  WRK-SYSMM       PIC 9(02).
               05  WRK-SYSDD       PIC 9(02).
      *
      *    添字領域
       01  IDX-AREA.
           03  IDW             PIC 9(04).
           03  IDX             PIC 9(04).
           03  IDXX            PIC 9(04).
           03  IDY             PIC 9(04).
           03  IDZ             PIC 9(04).
           03  IDA             PIC 9(04).
           03  IDB             PIC 9(04).
           03  IDX1            PIC 9(02).
           03  IDX2            PIC 9(02).
           03  IDX3            PIC 9(02).
           03  IDX4            PIC 9(03).
           03  IDX5            PIC 9(03).
           03  IDXP            PIC 9(02).
           03  IDY1            PIC 9(03).
           03  IDY2            PIC 9(03).
           03  IDY3            PIC 9(03).
      *
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.09) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-TERMID     PIC X(16).
           03  WRK-PARA-SYORIFLG   PIC X(01).
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *
      *    患者病名編集用パラメタ領域
       01  WRK-PARA-LINK.
           05  WRK-PARA-LINK-SRYYM   PIC  X(06).
           05  WRK-PARA-LINK-TERMID  PIC  X(16).
           05  WRK-PARA-LINK-SYSYMD  PIC  X(08).
           05  WRK-PARA-LINK-JOBID   PIC  9(07).
           05  WRK-PARA-LINK-SHELLID PIC  X(08).
      *---(01.00.09) LINE ADD START ------------------------------------
      *     05  WRK-PARA-LINK-HOSPID  PIC  X(24). 
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) start
      *     03  WRK-PARA-LINK-HOSPNUM PIC  9(02).
           05  WRK-PARA-LINK-HOSPNUM PIC  9(02).
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/16) end
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **    ファイル名称用エリア
      * 01  FILE-NAME.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM        PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SEIKYU4007".
      *     03  FILLER             PIC X(18)  VALUE "RECESYUTURYOKU.INI".
      * 01  FILE-NAME2.
      *     03  FILLER              PIC X(05)  VALUE "/tmp/".
      *     03  FILE-HOSPNUM2       PIC 9(02).
      *     03  FILLER              PIC X(10)  VALUE "SEIKYU4007".
      *     03  FILLER              PIC X(14)  VALUE "TAISYOKOHI.INI".
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    一時領域
       01  WRK-AREA.
      *
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
      *
           03  WRK-RECEERR         PIC X(200).
      *
           03  WRK-RECENUM         PIC 9(06).
           03  WRK-KOHID           PIC 9(10).
      *
           03  WRK-HKNJANUM        PIC X(08).
           03  WRK-KYURATE-9       PIC 9(03).
           03  WRK-KYURATE         PIC Z9.
           03  WRK-BEDSU           PIC ZZ9.
           03  WRK-CSTTENSUX       PIC ZZZZZ9.
           03  WRK-PAGE            PIC 9(03).
           03  WRK-ERRMSG          PIC X(40).
           03  WRK-FTNJANUM        PIC X(20).
           03  WRK-JKYSNUM         PIC X(20).
           03  WRK-SIDOU           PIC 9(09).
           03  WRK-YM              PIC 9(06).
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-HOSPID          PIC X(24).
           03  WRK-HOSPNUM         PIC 9(02).
      *---(01.00.09) LINE ADD END   ------------------------------------
           03  WRK-PTID            PIC 9(10).
           03  WRK-HKNCOMBI        PIC 9(04).
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) start
           03  WRK-RENNUM          PIC 9(07).
           03  WRK-Z7              PIC ZZZZZZ9.
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) end
      *
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2013/02/07) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2013/02/07) end
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH              PIC X(50).
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
           03  WRK-STUNUM-T.
               05  FILLER            PIC X(21).
               05  WRK-STUNUM        PIC X(02).
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
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
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           03  WRK-FTNMONEY-G      PIC 9(08).
      *
      *    患者病名情報退避エリア
           03  WRK-BYOMEI-TAIHI-TBL.
               05  WRK-TAIHI-BYOMEI   PIC X(54) OCCURS 5.
               05  WRK-TAIHI-SRYYMD   PIC X(24) OCCURS 5.
               05  WRK-TAIHI-TENKI    PIC X(10) OCCURS 5.
               05  WRK-TAIHI-TENKIYMD PIC X(06) OCCURS 5.
               05  WRK-TAIHI-TEKIYO   PIC X(52) OCCURS 35.
      *
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
           03  WRK-TYOKI-TBL.
               05  WRK-TYOKIFTNGK   PIC 9(08).
               05  WRK-TYOKIFTNGK-G PIC 9(08).
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *
       01  WRK-HENSYU-AREA.
           03  WRK-HENYMDG         PIC X(22).
           03  WRK-HENYMD.
               05  WRK-HGO         PIC X(01).
               05  WRK-HYY         PIC Z9.
               05  FILLER          PIC X(01)   VALUE  ".".
               05  WRK-HMM         PIC Z9.
               05  FILLER          PIC X(01)   VALUE  ".".
               05  WRK-HDD         PIC Z9.
      *
           03  WRK-BYO-OLD.
               05  WRK-BO-SYUBYOFLG            PIC X(01).
               05  WRK-BO-SRYYMD               PIC X(08).
               05  WRK-BO-TENKIKBN             PIC X(01).
               05  WRK-BO-TENKIYMD             PIC X(08).
      *
           03  WRK-EDIT-AREA.
      *        傷病名連番     
               05  WRK-LINE                    PIC 9(02).
      *        編集傷病名文字数 
               05  WRK-CLM                     PIC 9(03).
      *        ワーク編集傷病名文字数 
               05  WRK-WCLM                    PIC 9(03).
      *        病名文字数         
               05  WRK-MOJISU                  PIC 9(03).
      *        編集開始位置         
               05  WRK-STCLM                   PIC 9(03).
      *        傷病名欄編集行         
               05  WRK-LINEBYO                 PIC 9(02).
      *        適用欄編集行         
               05  WRK-LINETEK                 PIC 9(02).
      *        前行の続きのとき（傷病名）         
               05  WRK-CONTINUE                PIC 9(01).
      *    傷病名編集
           03  WRK-BYOMEI                      PIC X(150).
           03  WRK-BYOMEIW                     PIC X(150).
      *    傷病名編集フラグ（疑い）
           03  WRK-HENFLG1                     PIC X(01).
      *    傷病名編集フラグ（急性）
           03  WRK-HENFLG2                     PIC X(01). 
      *    傷病名編集（傷病名欄）
           03  WRK-BYOMEI1                     PIC X(54).
           03  WRK-BYOMEI1-W   REDEFINES       WRK-BYOMEI1.
               05  WRK-BYOMEI1-NO              PIC X(06).
               05  WRK-BYOMEI1-NAME            PIC X(48).
               
      *    傷病名編集（適用欄）
           03  WRK-BYOMEI2                     PIC X(52).
           03  WRK-BYOMEI2-W   REDEFINES       WRK-BYOMEI2.
               05  WRK-BYOMEI2-NO              PIC X(08).
               05  WRK-BYOMEI2-NAME            PIC X(44).
               05  WRK-BYOMEI2-NAMEW   REDEFINES   WRK-BYOMEI2-NAME.
                   07  FILLER                  PIC X(20).
                   07  WRK-BYOMEI2-ELSE.
                       09  WRK-BYOMEI2-YMD     PIC X(20).
                       09  WRK-BYOMEI2-TENKI   PIC X(04).
               05  WRK-BYOMEI2R-NAMEW  REDEFINES   WRK-BYOMEI2-NAME.
                   07  FILLER                  PIC X(14).
                   07  WRK-BYOMEI2R-ELSE.
                       09  WRK-BYOMEI2R-YMD    PIC X(20).
                       09  WRK-BYOMEI2R-TENKI  PIC X(04).
                       09  WRK-BYOMEI2R-TENKIYMD
                                               PIC X(06).
      *                 
           03  WRK-2003-TBL OCCURS 200.
               05  WRK-2003-TEISYUTUSAKI       PIC X(01).
               05  WRK-2003-NYUGAIKBN          PIC X(01).
               05  WRK-2003-DSPSEQ             PIC 9(03).
               05  WRK-2003-SYUBETU-G.
                   07  WRK-2003-SYUBETU        PIC X(04) OCCURS 10.
      *
           03  WRK-SRYYMD                      PIC X(08).
           03  WRK-KGKZ                        PIC ZZZ,ZZZ,ZZZ.
           03  WRK-KGK9                        PIC ZZZ,ZZZ,ZZ9.
           03  WRK-KGK2                        PIC Z9.
           03  WRK-KGK6                        PIC ZZZ,ZZ9.
           03  WRK-KGK7                        PIC ZZZZ,ZZ9.
           03  WRK-KGK10                       PIC ZZ,ZZZ,ZZ9.
      *
           03  WRK-KYUFUGAI                    PIC 9(08).
           03  WRK-KOHNUM                      PIC X(03).
      *
      *
       01  WRK-BYOMEI-AREA.     
      *    傷病名最大文字数（傷病名欄）
           03  WRK-BYOMEI1-MAX     PIC 9(02)   VALUE   48.
      *    傷病名最大文字数（適用欄）
           03  WRK-BYOMEI2-MAX     PIC 9(02)   VALUE   44.
      *    適用欄最大行数
           03  WRK-TEKIYOU-LINE    PIC 9(02)   VALUE   35.
      *    傷病名欄最大行数
           03  WRK-BYOMEI-LINE     PIC 9(02)   VALUE   5.
      *
      *    疑い編集
       01  WRK-UTAGAI-AREA.
      *    疑い
           03  WRK-CONS-UTAGAI     PIC X(06)   VALUE   "の疑い".
           03  WRK-CONS-UTAGAI-MOJISU
                                   PIC 9(02)   VALUE   6.       
      *    急性
           03  WRK-CONS-KYUSEI     PIC X(04)   VALUE   "急性".      
           03  WRK-CONS-KYUSEI-MOJISU
                                   PIC 9(02)   VALUE   4.       
      *
      *    区切り線
       01  WRK-LINE-AREA.
           03  WRK-KUGIRI1         PIC X(52)   VALUE
               ALL "−".
           03  WRK-KUGIRI2.
               05  FILLER          PIC X(22)   VALUE
                                   "＝＝＝＝＝＝＝　以下　".
               05  WRK-KUGIRI2-KOHNAME         PIC X(10).
               05  FILLER          PIC X(20)   VALUE
                                   "　適用分　＝＝＝＝＝".
           03  WRK-KUGIRI3         PIC X(52)   VALUE
               ALL "−".
      *
      *    改行コード
       01  WRK-CONS-RETURN          PIC X(01)   VALUE   X"0A".
      *
       01  WRK-TENSU-AREA.
           03  WRK-KHNTEN.
               05  WRK-KHNTENZ     PIC  ZZZZZZZ.
           03  WRK-KAISU.
               05  WRK-KAISUZ      PIC  ZZZ.
           03  WRK-KOUTEN.
               05  WRK-KOUTENZ     PIC  ZZZZZZZ.
           03  WRK-TENSU.
               05  WRK-TENSUZ      PIC  ZZZZZZZ.
           03  WRK-JINISSU.
               05  WRK-JINISSUZ    PIC  ZZ.
           03  WRK-Z2              PIC  ZZ.
           03  WRK-Z5              PIC  Z,ZZZ.
      *
       01  WRK-CNT                 PIC  9(5).
      *
      *    固定項目エリア
        01  WRK-CONS-AREA.
      *    疑い
           03  WRK-CONS-BYOMEICD-UTAGAI
                                   PIC X(07)   VALUE   "ZZZ8002".   
      *    急性
           03  WRK-CONS-BYOMEICD-KYUSEI
                                   PIC X(07)   VALUE   "ZZZ4012".   
      *
      *=== 特記事項印字 by Yoshikawa(2009/05/14) start
      *   特記事項
       01  TBL-TOKKI-AREA.
           03  FILLER              PIC X(02)   VALUE   "01".
           03  FILLER              PIC X(10)   VALUE   "０１公".
           03  FILLER              PIC X(02)   VALUE   "02".
           03  FILLER              PIC X(10)   VALUE   "０２長".
           03  FILLER              PIC X(02)   VALUE   "03".
           03  FILLER              PIC X(10)   VALUE   "０３長処".
           03  FILLER              PIC X(02)   VALUE   "04".
           03  FILLER              PIC X(10)   VALUE   "０４後保".
           03  FILLER              PIC X(02)   VALUE   "07".
           03  FILLER              PIC X(10)   VALUE   "０７老併".
           03  FILLER              PIC X(02)   VALUE   "08".
           03  FILLER              PIC X(10)   VALUE   "０８老健".
           03  FILLER              PIC X(02)   VALUE   "09".
           03  FILLER              PIC X(10)   VALUE   "０９施".
           03  FILLER              PIC X(02)   VALUE   "10".
           03  FILLER              PIC X(10)   VALUE   "１０第三".
           03  FILLER              PIC X(02)   VALUE   "11".
           03  FILLER              PIC X(10)   VALUE   "１１薬治".
           03  FILLER              PIC X(02)   VALUE   "12".
           03  FILLER              PIC X(10)   VALUE   "１２器治".
           03  FILLER              PIC X(02)   VALUE   "13".
           03  FILLER              PIC X(10)   VALUE   "１３先進".
           03  FILLER              PIC X(02)   VALUE   "14".
           03  FILLER              PIC X(10)   VALUE   "１４制超".
           03  FILLER              PIC X(02)   VALUE   "15".
           03  FILLER              PIC X(10)   VALUE   "１５経過".
           03  FILLER              PIC X(02)   VALUE   "16".
           03  FILLER              PIC X(10)   VALUE   "１６長２".
           03  FILLER              PIC X(02)   VALUE   "17".
           03  FILLER              PIC X(10)   VALUE   "１７上位".
           03  FILLER              PIC X(02)   VALUE   "18".
           03  FILLER              PIC X(10)   VALUE   "１８一般".
           03  FILLER              PIC X(02)   VALUE   "19".
           03  FILLER              PIC X(10)   VALUE   "１９低所".
           03  FILLER              PIC X(02)   VALUE   "20".
           03  FILLER              PIC X(10)   VALUE   "２０二割".
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) start
           03  FILLER              PIC X(02)   VALUE   "21".
           03  FILLER              PIC X(10)   VALUE   "２１高半".
           03  FILLER              PIC X(02)   VALUE   "22".
           03  FILLER              PIC X(10)   VALUE   "２２多上".
           03  FILLER              PIC X(02)   VALUE   "23".
           03  FILLER              PIC X(10)   VALUE   "２３多一".
           03  FILLER              PIC X(02)   VALUE   "24".
           03  FILLER              PIC X(10)   VALUE   "２４多低".
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) end
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/30) start
           03  FILLER              PIC X(02)   VALUE   "25".
           03  FILLER              PIC X(10)   VALUE   "２５出産".
           03  FILLER              PIC X(02)   VALUE   "26".
           03  FILLER              PIC X(10)   VALUE   "２６区ア".
           03  FILLER              PIC X(02)   VALUE   "27".
           03  FILLER              PIC X(10)   VALUE   "２７区イ".
           03  FILLER              PIC X(02)   VALUE   "28".
           03  FILLER              PIC X(10)   VALUE   "２８区ウ".
           03  FILLER              PIC X(02)   VALUE   "29".
           03  FILLER              PIC X(10)   VALUE   "２９区エ".
           03  FILLER              PIC X(02)   VALUE   "30".
           03  FILLER              PIC X(10)   VALUE   "３０区オ".
           03  FILLER              PIC X(02)   VALUE   "31".
           03  FILLER              PIC X(10)   VALUE   "３１多ア".
           03  FILLER              PIC X(02)   VALUE   "32".
           03  FILLER              PIC X(10)   VALUE   "３２多イ".
           03  FILLER              PIC X(02)   VALUE   "33".
           03  FILLER              PIC X(10)   VALUE   "３３多ウ".
           03  FILLER              PIC X(02)   VALUE   "34".
           03  FILLER              PIC X(10)   VALUE   "３４多エ".
           03  FILLER              PIC X(02)   VALUE   "35".
           03  FILLER              PIC X(10)   VALUE   "３５多オ".
           03  FILLER              PIC X(02)   VALUE   "36".
           03  FILLER              PIC X(10)   VALUE   "３６加治".
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/30) end
      *=== 特記事項欄に「37申出」を追加 by Monma(2016/05/17) start
           03  FILLER              PIC X(02)   VALUE   "37".
           03  FILLER              PIC X(10)   VALUE   "３７申出".
      *=== 特記事項欄に「37申出」を追加 by Monma(2016/05/17) end
       01  TBL-TOKKI-R             REDEFINES   TBL-TOKKI-AREA.
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) start
      *     03  TBL-TOKKI       OCCURS   18.
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/30) start
      *     03  TBL-TOKKI       OCCURS   22.
      *=== 特記事項欄に「37申出」を追加 by Monma(2016/05/17) start
      *     03  TBL-TOKKI       OCCURS   34.
           03  TBL-TOKKI       OCCURS   35.
      *=== 特記事項欄に「37申出」を追加 by Monma(2016/05/17) end
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/30) end
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) end
               05  TBL-TOKKICD     PIC X(02).
               05  TBL-TOKKINAME   PIC X(10).
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) start
      * 01  TBL-TOKKI-MAX           PIC 9(02)   VALUE   18.
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/30) start
      * 01  TBL-TOKKI-MAX           PIC 9(02)   VALUE   22.
      *=== 特記事項欄に「37申出」を追加 by Monma(2016/05/17) start
      * 01  TBL-TOKKI-MAX           PIC 9(02)   VALUE   34.
       01  TBL-TOKKI-MAX           PIC 9(02)   VALUE   35.
      *=== 特記事項欄に「37申出」を追加 by Monma(2016/05/17) end
      *=== 平成２７年１月改正対応 by Yoshikawa(2015/01/30) end
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) end
      *=== 特記事項印字 by Yoshikawa(2009/05/14) end
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      *    比較用公費番号テーブル領域
       01  TBL-HIKAKU-KOHI.
           03  TBL-HKOHNUM              PIC X(03)  OCCURS  4.
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *    DB参照用
      *---(01.00.09) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
           COPY    "CPSK2005.INC".
      *
      *    レセプト作成指示(印刷順)情報
           COPY    "CPSK2003.INC".
      *
      *    医療機関情報
           COPY    "CPSK1001.INC".
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
      *    保険組み合わせ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *
      *    診療会計マスタ
       01  SRYACCT-REC.
           COPY    "CPSRYACCT.INC".
      *
      *    診療行為マスタ
       01  SRYACT-REC.
           COPY    "CPSRYACT.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    請求管理
           COPY    "CPRCF010.INC".
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *****************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *
      *    ＤＢ検索
           COPY    "MCPAREA".
      *
           COPY    "MCPDATA.INC".
      *
      *   ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".
      *
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      ****************************************************************
       LINKAGE                 SECTION.
       01  COMMAND-PARAM.
           02  FILLER      PIC X(256).
      ****************************************************************
       PROCEDURE           DIVISION
               USING
           COMMAND-PARAM.
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       000-PROC-SEC                SECTION.
      *
           PERFORM 100-INIT-SEC
      *
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
           INITIALIZE                  SPA-AREA
           INITIALIZE                  CNT-AREA
           INITIALIZE                  IDX-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           INITIALIZE                  TAISYO-DAT
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
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
      *---(01.00.09) LINE ADD END   ------------------------------------
                                               WRK-PARA-SYORIFLG
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *---(01.00.09) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.09) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           PERFORM 100-DBOPEN-SEC
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    地方公費対象患者用病名ファイル作成
           PERFORM 1001-BYOMEI-HEN-SEC
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
           MOVE    "SEIKYU4007"    TO  JOB-PGID
           MOVE    "複写式レセ"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *    ファイルＯＰＥＮ処理
           PERFORM 110-FILE-OPEN-SEC
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *    INIファイル読み込み
      *     PERFORM  110-INI-FILE-SEC
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *    システム管理マスタ（医療機関情報）
           PERFORM 120-HOSPINF-GET-SEC
      *
           MOVE    ZERO                TO  WRK-RECENUM
      *
      *    パラメタ編集処理
           PERFORM 1001-PARA-HENSYU-SEC
      *
           PERFORM 900-KOHSKY-START-SEC
       
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      ******************************************************************
      **    INIファイル読み込み
      ******************************************************************
      * 110-INI-FILE-SEC         SECTION.
      **
      **    出力順設定ファイル読み込み
      **    ファイルディレクトリ位置指定
      **=== プラグイン対応 by Yoshikawa(2013/02/07) start
      **     INITIALIZE           ORCSMKPASSAREA
      **     MOVE  "data/RECESYUTURYOKU.INI"     TO  MKPASS-IN-01
      **     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      **     MOVE  MKPASS-OT-01  TO  FILE-NAME
      *     MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      **=== プラグイン対応 by Yoshikawa(2013/02/07) end
      **
      *     DISPLAY "ファイル名="  FILE-NAME
      **
      *     INITIALIZE   STU-REC
      **
      *     OPEN  INPUT  SYUTURYOKU-FILE
      **
      *     READ SYUTURYOKU-FILE
      *       AT END
      *         INITIALIZE        STU-REC
      *     END-READ
      **
      *     DISPLAY "出力番号=" STU-NUM
      **
      **    正しいデータでは無い時は０１に置き換える
      *     IF     STU-NUM  NOT  =  "01" AND "02" AND "03" AND "04"
      *       MOVE     "01"     TO  STU-NUM
      *       DISPLAY  "出力順変換=" STU-NUM
      *     END-IF
      **
      *     CLOSE  SYUTURYOKU-FILE
      **
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
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
      **=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      **
      *     .
      * 110-INI-FILE-EXT.
      *     EXIT.
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SEIKYU4007"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    レセプト出力順
           MOVE    "RECESYUTURYOKU"          TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           MOVE    WRK-OPTION(1)(1:23)       TO  WRK-STUNUM-T
           DISPLAY "レセプト出力順="  WRK-STUNUM
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
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *
      *****************************************************************
      *    地方公費対象患者用病名ファイル作成
      *****************************************************************
       1001-BYOMEI-HEN-SEC         SECTION.
      *
           INITIALIZE  WRK-PARA-LINK
           MOVE  LNK-PRTKANRI-SRYYM   TO   WRK-PARA-LINK-SRYYM
           MOVE  LNK-PRTKANRI-TERMID  TO   WRK-PARA-LINK-TERMID
           MOVE  LNK-PRTKANRI-SKYYMD  TO   WRK-PARA-LINK-SYSYMD
           MOVE  WRK-PARA-JOBID       TO   WRK-PARA-LINK-JOBID
           MOVE  WRK-PARA-SHELLID     TO   WRK-PARA-LINK-SHELLID
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  WRK-PARA-HOSPID      TO   WRK-PARA-LINK-HOSPID
           MOVE  WRK-PARA-HOSPNUM     TO   WRK-PARA-LINK-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      * 
           DISPLAY "編集１開始"
           CALL  "SEIKYU40BYOMEI1"    USING  WRK-PARA-LINK
      *=== TAISYOKOHIの患者の病名印字 by Yoshikawa(2013/09/04) start
                                             TAISYO-DAT
      *=== TAISYOKOHIの患者の病名印字 by Yoshikawa(2013/09/04) end
           DISPLAY "編集２開始"
           CALL  "SEIKYU40BYOMEI2"    USING  WRK-PARA-LINK
           DISPLAY "病名ファイル作成終了"
      *
           .
       1001-BYOMEI-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ファイルＯＰＥＮ処理
      *****************************************************************
       110-FILE-OPEN-SEC          SECTION.
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     MOVE    "MF100ZZ"           TO  MF100PARA-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID(1:16) 
      *                                 TO  MF100PARA-TERMID
      **---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  WRK-PARA-HOSPNUM      TO  MF100PARA-HOSPNUM
      **---(01.00.09) LINE ADD END   ------------------------------------
           INITIALIZE                     SGETTEMP-AREA
      *
           MOVE  WRK-PARA-HOSPNUM     TO  MF100PARA-HOSPNUM
           MOVE  "MF100ZZ"            TO  MF100PARA-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID  TO  MF100PARA-TERMID
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
           MOVE    "RECE031"           TO  RECE031PARA-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID        TO  RECE031PARA-TERMID
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE  WRK-PARA-HOSPNUM      TO  RECE031PARA-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID(1:16)  TO  RECEERR-TERMID
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           MOVE  MF100PARA-BASENAME   TO  SGETTEMP-BASENAMES (1)
           MOVE  RECE031PARA-BASENAME TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEERR              TO  SGETTEMP-BASENAMES (3)
           CALL  "ORCSGETTEMP"        USING
                                      SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  MF100PARA-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECE031PARA-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
           OPEN    INPUT               RECE031-FILE
           IF  STS-RECE            NOT =   ZERO
               DISPLAY "*** SEIKYU4007 RECE031 OPEN ERR  ***"
           END-IF
      *
           .
       110-FILE-OPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療機関情報検索
      *****************************************************************
       120-HOSPINF-GET-SEC            SECTION.
      *
           ACCEPT  SYS-YMD         FROM    DATE
           COMPUTE WRK-SYSYY       =   SYS-YY      +   2000
           MOVE    SYS-MM              TO  WRK-SYSMM
           MOVE    SYS-DD              TO  WRK-SYSDD
           ACCEPT  SYS-TIME            FROM    TIME
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                             TO  SYS-1001-STYUKYMD(1:6)
      *                                 SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
           MOVE    "01"            TO  SYS-1001-STYUKYMD(7:2)
                                       SYS-1001-EDYUKYMD(7:2)
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-1001-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU4007 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
           MOVE    "01"        TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM   TO  SYS-1002-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU4007 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *    レセプト編集区分情報
           INITIALIZE                   SYS-2005-REC
           MOVE    "2005"           TO  SYS-2005-KANRICD
           MOVE    "*"              TO  SYS-2005-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                   TO  SYS-2005-STYUKYMD(1:6)
                                       SYS-2005-EDYUKYMD(1:6)
           MOVE    "01"            TO  SYS-2005-STYUKYMD(7:2)
                                       SYS-2005-EDYUKYMD(7:2)
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-2005-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           MOVE  SYS-2005-REC       TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI     =   ZERO
               MOVE    MCPDATA-REC      TO  SYS-2005-REC
           ELSE    
               MOVE    SPACE            TO  SYS-2005-REC
           END-IF
           IF      SYS-2005-BYOMEIHENKBN    =   SPACE
               MOVE    ZERO             TO  SYS-2005-BYOMEIHENKBN
           END-IF
           IF      SYS-2005-TENKIHENKBN     =   SPACE
               MOVE    ZERO             TO  SYS-2005-TENKIHENKBN
           END-IF
      *
      *    システム管理マスタよりレセプト出力順を取得
           MOVE    "2003"                 TO  SYS-2003-KANRICD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                   TO  SYS-2003-STYUKYMD(1:6)
                                       SYS-2003-EDYUKYMD(1:6)
           MOVE    "01"            TO  SYS-2003-STYUKYMD(7:2)
                                       SYS-2003-EDYUKYMD(7:2)
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM       TO  SYS-2003-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           PERFORM 820-SYSKANRI-DBSELECT-SEC
           MOVE    1       TO      IDX
           PERFORM  UNTIL  FLG-SYSKANRI3 = 1
                    OR     IDX    > 200
             IF  FLG-SYSKANRI3 = ZERO
                 MOVE SYS-2003-TEISYUTUSAKI  
                               TO WRK-2003-TEISYUTUSAKI(IDX)
                 MOVE SYS-2003-SYUBETU-G
                               TO WRK-2003-SYUBETU-G(IDX)
                 MOVE SYS-2003-NYUGAIKBN
                               TO WRK-2003-NYUGAIKBN(IDX)
                 MOVE SYS-2003-DSPSEQ
                               TO WRK-2003-DSPSEQ(IDX)
                 ADD  1        TO     IDX 
             END-IF  
             PERFORM 820-SYSKANRI-DBFETCH-SEC
           END-PERFORM
           DISPLAY "2003 IDX=" IDX
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       120-HOSPINF-GET-EXT.
           EXIT.
      *
      *****************************************************************
      *    パラメタ編集処理
      *****************************************************************
       1001-PARA-HENSYU-SEC        SECTION.
      *
           MOVE    ZERO                TO  IDXX
                                           FLG-SYORI
           INITIALIZE                      TABLE-AREA
      *
           IF      WRK-PARA-SYORIFLG   =   "1" 
               INITIALIZE                      BTPARA-REC
      *---(01.00.09) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM         TO  BTPARA-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-SHELLID    TO  BTPARA-SHELLID
               MOVE    WRK-PARA-JOBID      TO  BTPARA-JOBID
               MOVE    BTPARA-REC          TO  MCPDATA-REC
      *---(01.00.09) LINE ADD START ------------------------------------
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
      *---(01.00.09) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
      *---(01.00.09) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
                   PERFORM 900-BTPARA-READ-N-SEC
               END-PERFORM
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
               MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
       200-MAIN-SEC                SECTION.
      *
           OPEN    OUTPUT  MF100-FILE
           CLOSE           MF100-FILE
           OPEN    I-O     MF100-FILE
      *
           PERFORM 2001-SYUKEI-SEC
                   UNTIL   FLG-END     =   1
      *
           CLOSE   MF100-FILE
      *
           IF  CNT-RECE02  >       0
               PERFORM   2002-PRINT-SEC
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    対象データ抽出処理
      *****************************************************************
       2001-SYUKEI-SEC         SECTION.
      *
      *
           PERFORM  VARYING  IDZ  FROM  1  BY  1
                    UNTIL    IDZ  >     4
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) start
      **---(01.00.05) LINE ADD START ------------------------------------
      **       IF  RECE02-KOHNUM (IDZ) =  "180" OR "181" OR "190"
      *       IF  RECE02-KOHNUM(IDZ) = "180" OR "181" OR "190" OR "281"
      **---(01.00.05) LINE ADD END   ------------------------------------
      **---(01.00.12) LINE ADD START ------------------------------------
      ***---(01.00.07) LINE ADD START ------------------------------------
      **                             OR "290"
      ***---(01.00.07) LINE ADD END   ------------------------------------
      *                             OR "290" OR "280" OR "380" OR "381"
      *                             OR "390" OR "490"
      **---(01.00.12) LINE ADD END   ------------------------------------
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) start
      *                             OR "480" OR "481" OR "590"
      **=== 印字対象番号追加 by Yoshikawa(2008/12/11) end
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) start
      *                             OR "690" OR "780"
      **=== 印字対象番号追加 by Yoshikawa(2009/10/30) end
             INITIALIZE                            TBL-HIKAKU-KOHI
             MOVE    RECE02-KOHNUM(IDZ)        TO  TBL-HKOHNUM(1)
      *      対象公費番号チェック処理
             PERFORM  800-TAISYOKOHI-CHK-SEC
             IF  FLG-TAISYO  =  1
      *=== 対象公費をINIファイルから取得 by Yoshikawa(2012/03/12) end
               PERFORM 20011-SYUKEI-SEC
             END-IF
           END-PERFORM
      *
           PERFORM  900-KOHSKY-READ-SEC
      *
           .
       2001-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計処理２
      *****************************************************************
       20011-SYUKEI-SEC  SECTION.
      *
      *    TMP-FILE キーセット
      *
           INITIALIZE  MF100-REC
           MOVE  ZERO  TO  FLG-ERR
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  RECE02-HOSPID            TO  MF100-HOSPID
           MOVE  RECE02-HOSPNUM           TO  MF100-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE  RECE02-SRYYM             TO  MF100-SRYYM
           MOVE  RECE02-TEISYUTUSAKI      TO  MF100-TEISYUTUSAKI
           MOVE  RECE02-NYUGAIKBN         TO  MF100-NYUGAIKBN
           MOVE  RECE02-HKNJANUM          TO  MF100-HKNJANUM2
           MOVE  RECE02-PTID              TO  MF100-PTID
           MOVE  RECE02-PTNUM             TO  MF100-PTNUM
           MOVE  RECE02-RECEKA            TO  MF100-RECEKA
           MOVE  RECE02-RECESYUBETU       TO  MF100-RECESYUBETU
           MOVE  RECE02-HOJOKBN-KEY       TO  MF100-HOJOKBN-KEY
           MOVE  RECE02-TEKSTYMD          TO  MF100-TEKSTYMD
           MOVE  RECE02-PTNUM             TO  MF100-PTNUM
           MOVE  RECE02-KANANAME          TO  MF100-KANANAME
           MOVE  RECE02-NAME              TO  MF100-NAME
           MOVE  RECE02-SEX               TO  MF100-SEX
           MOVE  RECE02-BIRTHDAY          TO  MF100-BIRTHDAY
           MOVE  RECE02-AGE               TO  MF100-AGE
           MOVE  RECE02-HKN               TO  MF100-HKN
           MOVE  RECE02-RJNHKN            TO  MF100-RJNHKN
      *
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     50
             IF     IDX1     <=    10
               MOVE  RECE02-HKNCOMBIINF(IDX1)  TO
                                           MF100-HKNCOMBIINF(IDX1)
             END-IF
             MOVE  RECE02-SRYKBNINF(IDX1)  TO  MF100-SRYKBNINF(IDX1)
           END-PERFORM
      *
           MOVE    RECE02-KOHINF(IDZ) TO  MF100-KOHINF
           MOVE    MF100-KOHFTNJANUM  TO  MF100-FTNJANUM-KEY
           MOVE    MF100-KOHJKYSNUM   TO  MF100-JKYSNUM-KEY
           MOVE    MF100-KOHID        TO  MF100-KOHID-KEY
           COMPUTE IDY     =   IDZ +   1
           MOVE    RECE02-JNISSU(IDY)   TO  MF100-JNISSU
           MOVE    RECE02-TOTALTEN(IDY) TO  MF100-TOTALTEN
           MOVE    RECE02-SHOKUJIINF(IDY)
                                            TO  MF100-SHOKUJIINF
      *
           MOVE    RECE02-SHOSHINTIME       TO  MF100-SHOSHINTIME
           MOVE    RECE02-ZAITAKU           TO  MF100-ZAITAKU
           MOVE    RECE02-ZAITAKU-SAIKEI    TO  MF100-ZAITAKU-SAIKEI
      *---(01.00.12) LINE ADD START ------------------------------------
      *    給付外の額
           MOVE    RECE02-FTNMONEY (IDY)    TO  MF100-KYUFUGAITEN
      *---(01.00.12) LINE ADD END   ------------------------------------
      *=== 特記事項追加 by Yoshikawa(2009/05/14) start
      *    請求マスタ読込
           PERFORM  9001-KENNAI-CHK-SEC
           PERFORM  VARYING  IDX2  FROM  1  BY  1
                    UNTIL    IDX2  >     4
             IF  RECE10-TOKKI(IDX2)  NOT =  SPACE
               MOVE  RECE10-TOKKI(IDX2)     TO  MF100-TOKKI(IDX2)
             END-IF
           END-PERFORM
      *=== 特記事項追加 by Yoshikawa(2009/05/14) end
      *
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
           INITIALIZE                  WRK-TYOKI-TBL
           MOVE    ZERO                TO    FLG-TYOKI
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
           MOVE    ZERO                TO  WRK-KYUFUGAI
                                           WRK-FTNMONEY-G
           MOVE    MF100-KOHNUM        TO  WRK-KOHNUM
           MOVE    MF100-KOHID         TO  WRK-KOHID
           DISPLAY "給付外点数集計開始  患者番号=" MF100-PTNUM
                   "保険番号=" MF100-HKNNUM
                   "  公費番号=" WRK-KOHNUM
           IF      RECE02-NYUGAIKBN    =   "1"
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"     TO  WRK-PATH
      *---(01.00.09) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"     TO  WRK-PATH
      *---(01.00.09) LINE ADD END   ------------------------------------
           END-IF
      *=== FLG-ERR初期化位置修正 by Yoshikawa(2008/11/21) start
           MOVE  1                 TO  FLG-ERR
      *=== FLG-ERR初期化位置修正 by Yoshikawa(2008/11/21) end
           PERFORM 920-SYUNOU-SET-SEC
           DISPLAY "給付外点数集計終了=" WRK-KYUFUGAI
      *---(01.00.12) LINE ADD START ------------------------------------
      *     MOVE    WRK-KYUFUGAI        TO  MF100-KYUFUGAITEN
      *---(01.00.12) LINE ADD END   ------------------------------------
           IF      RECE02-FTNMONEY(1)  >   ZERO
               IF      RECE02-FTNMONEY(1)  <   WRK-FTNMONEY-G
                   MOVE    RECE02-FTNMONEY(1)  TO  WRK-FTNMONEY-G
               END-IF
               MOVE    WRK-FTNMONEY-G          TO  MF100-FTNMONEY
           END-IF
      *
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
           IF    FLG-TYOKI    =    1
               IF    WRK-TYOKIFTNGK-G  >=  10000
                   MOVE    1              TO    MF100-TYOKI
               END-IF
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     4
                   IF  ( MF100-TOKKI(IDX2)    =   "02" )
                       MOVE    1              TO    MF100-TYOKI
                   END-IF
               END-PERFORM
           END-IF
      *
           IF    FLG-TYOKI    =    2
               IF    WRK-TYOKIFTNGK-G  >=  20000
                   MOVE    1              TO    MF100-TYOKI
               END-IF
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     4
                   IF  ( MF100-TOKKI(IDX2)    =   "16" )
                       MOVE    1              TO    MF100-TYOKI
                   END-IF
               END-PERFORM
           END-IF
      *
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *
      *      出力順設定
      *      保険者番号順
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      *     IF    STU-NUM  =  "01" OR "02"
           IF    WRK-STUNUM  =  "01" OR "02"
      *=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
             EVALUATE  MF100-HKNNUM
      *      ４桁
             WHEN "001"
               MOVE  MF100-HKNJANUM(1:4)  TO  MF100-HKNJANUM-KEY(5:4)
      *      ６桁
             WHEN "060"
               MOVE  MF100-HKNJANUM(1:6)  TO  MF100-HKNJANUM-KEY(3:6)
      *      ８桁
             WHEN OTHER
               MOVE  MF100-HKNJANUM       TO  MF100-HKNJANUM-KEY
             END-EVALUATE
      *      システム管理マスタの出力順を設定 
             PERFORM  VARYING  IDX   FROM  1  BY  1
                      UNTIL    IDX   >     200
               IF    (WRK-2003-TEISYUTUSAKI(IDX) 
                                              = MF100-TEISYUTUSAKI)
                 AND (WRK-2003-NYUGAIKBN(IDX) = MF100-NYUGAIKBN)
                 IF  MF100-RECESYUBETU = WRK-2003-SYUBETU(IDX 1)
                 OR                      WRK-2003-SYUBETU(IDX 2)
                 OR                      WRK-2003-SYUBETU(IDX 3)
                 OR                      WRK-2003-SYUBETU(IDX 4)
                 OR                      WRK-2003-SYUBETU(IDX 5)
                 OR                      WRK-2003-SYUBETU(IDX 6)
                 OR                      WRK-2003-SYUBETU(IDX 7)
                 OR                      WRK-2003-SYUBETU(IDX 8)
                 OR                      WRK-2003-SYUBETU(IDX 9)
                 OR                      WRK-2003-SYUBETU(IDX 10)
                   MOVE  WRK-2003-DSPSEQ(IDX)
                                          TO  MF100-DSPSEQ
                   DISPLAY "出力番号=" MF100-DSPSEQ
                 END-IF
               END-IF
             END-PERFORM
           END-IF
      *
      *=== 負担者番号順追加 by Yoshikawa(2015/05/14) start
      **      カナ氏名順・患者番号順
      **=== プログラムオプション対応 by Yoshikawa(2013/09/04) start
      **     IF  STU-NUM  =  "01" OR "03"
      *     IF  WRK-STUNUM  =  "01" OR "03"
      **=== プログラムオプション対応 by Yoshikawa(2013/09/04) end
      *       MOVE  MF100-KANANAME  TO  MF100-KANANAME-KEY
      *     ELSE
      *       MOVE  MF100-PTNUM     TO  MF100-PTNUM-KEY
      *     END-IF
           EVALUATE  WRK-STUNUM
             WHEN  "01"
             WHEN  "03"
      *        カナ氏名順
               MOVE  MF100-KANANAME     TO  MF100-KANANAME-KEY
             WHEN  "04"
      *        患者番号順
               MOVE  MF100-PTNUM        TO  MF100-PTNUM-KEY
             WHEN  "05"
      *        負担者番号順（優先順位の関係で保険者番号KEYにセット）
               MOVE  MF100-KOHFTNJANUM(1:8)
                                        TO  MF100-HKNJANUM-KEY
           END-EVALUATE
      *=== 負担者番号順追加 by Yoshikawa(2015/05/14) end
      *
      *     老人＋障害は対象から外す
           IF      (RECE02-RJNHKNNUM    NOT =  SPACE)
           AND     (RECE02-KOHNUM(IDZ)      =  "180")
      *
               MOVE    1       TO      FLG-ERR
               DISPLAY "老人＋障害=" RECE02-PTNUM
           END-IF
      *
      *    保険者番号チェック処理
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
      *
           IF      FLG-ERR            =     ZERO
               WRITE    MF100-REC
           ELSE
               DISPLAY "助成対象外="        MF100-PTNUM
                       "負担者番号="        MF100-KOHFTNJANUM
                       "老人負担者番号="    MF100-RJNFTNJANUM
                       "公費番号="          MF100-KOHNUM
           END-IF
      *
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
           MOVE    MF100-KOHFTNJANUM(3:5)  TO  WRK-HKNJANUM(1:5)
      *
           IF      WRK-PARA-SYORIFLG   =   "1"
           AND     FLG-SYORI           =    1
           AND     FLG-ERR             =   ZERO
      *
               DISPLAY "チェック用保険者番号="  WRK-HKNJANUM
               MOVE    1       TO      FLG-ERR
               PERFORM VARYING IDXX    FROM    1   BY  1
                       UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                       OR      TBL-PARA-HKNJANUM(IDXX)  =   SPACE
      *
      *    ４０４００、４０５００の代表番号が指定されている場合、
      *    福岡市内、北九州市内の全ての区を対象とする
                   IF      (WRK-HKNJANUM(1:5)  =
                                       TBL-PARA-HKNJANUM(IDXX)(1:5))
                   OR      ((WRK-HKNJANUM(1:3) =   "404")
                       AND  (TBL-PARA-HKNJANUM(IDXX)(1:5) = "40400"))
                   OR      ((WRK-HKNJANUM(1:3) =   "405")
                       AND  (TBL-PARA-HKNJANUM(IDXX)(1:5) = "40500"))
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
      *    主　　処理
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) start
      *    通し番号初期値設定
           MOVE    1            TO  WRK-RENNUM
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) end
      *
           OPEN     INPUT       MF100-FILE
      *    一時ファイル読込
           MOVE     ZERO        TO  FLG-END
           INITIALIZE  MF100-REC
           PERFORM  900-TMP-READ-SEC

           PERFORM         UNTIL   FLG-END        =   1
               DISPLAY "対象者=" MF100-PTNUM
               MOVE    1         TO  CNT-PAGE
      *
      *
               IF      MF100-NYUGAIKBN =   "2"
      *
      *            帳票編集<ヘッダー部>処理
                   PERFORM 310-HC101-HEAD-HEN-SEC
      *
      **           帳票編集<点数>処理
                   PERFORM 330-HC101-TENSU-HEN-SEC
      *
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) start
      **           帳票編集<福岡県仕様>処理
                   PERFORM 380-HC101-CUSTOM-HEN-SEC
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) end
      *
      **           帳票編集<傷病名>処理
                   PERFORM 320-HC101-BYOMEI-HEN-SEC
      *
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) start
      ***           帳票編集<福岡県仕様>処理
      *             PERFORM 380-HC101-CUSTOM-HEN-SEC
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) end
               ELSE
      *            帳票編集<ヘッダー部>処理
                   PERFORM 310N-HC101-HEAD-HEN-SEC
      *
      **           帳票編集<点数>処理
                   PERFORM 330N-HC101-TENSU-HEN-SEC
      *
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) start
      **           帳票編集<福岡県仕様>処理
                   PERFORM 380N-HC101-CUSTOM-HEN-SEC
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) end
      *
      **           帳票編集<傷病名>処理
                   PERFORM 320-HC101-BYOMEI-HEN-SEC
      *
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) start
      ***           帳票編集<福岡県仕様>処理
      *             PERFORM 380N-HC101-CUSTOM-HEN-SEC
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) end
               END-IF
      **
      *            帳票印刷処理
               PERFORM 390-PRINT-OUT-SEC
      *
      *        一時ファイル読込
               PERFORM  900-TMP-READ-SEC
           END-PERFORM

           CLOSE   MF100-FILE
           MOVE    1           TO  FLG-END
      *
           .
       2002-PRINT-EXT.
           EXIT.
      ******************************************************************
      *    帳票編集<ヘッダー部>処理(外来)
      *****************************************************************
       310-HC101-HEAD-HEN-SEC          SECTION.
      *
           INITIALIZE                      HC06
           MOVE    SPACE               TO  HC06
      *
      *    患者番号
           MOVE    MF100-PTNUM        TO  HC06-PTNUM
      *
      *
      *    提出先
           IF      MF100-RECESYUBETU  =    "0000"  OR  "8888"
               MOVE    SPACE           TO  HC06-TEISYUTUSAKI
           ELSE    
               EVALUATE    MF100-TEISYUTUSAKI
                   WHEN    1
                       MOVE    "１社"          TO  HC06-TEISYUTUSAKI
                   WHEN    2
                       MOVE    "２国"          TO  HC06-TEISYUTUSAKI
                   WHEN    OTHER
                       MOVE    SPACE           TO  HC06-TEISYUTUSAKI
               END-EVALUATE
           END-IF    
      *
      *    診療年月（診療年月日として退避）
           MOVE    MF100-SRYYM         TO  WRK-SYMD
           MOVE    01                  TO  WRK-SDD
           MOVE    WRK-SYMD            TO  WRK-SRYYMD
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    LNK-DAY2-EDTYMD1-Y  TO  HC06-SRYY 
           MOVE    LNK-DAY2-EDTYMD1-M  TO  HC06-SRYM 
      *
      *    県番
           MOVE    SYS-1001-PREFNUM    TO  HC06-PREFNUM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN    TO  HC06-HOSPCDN
      *
      *    保険種別１
           PERFORM 3110-HKNSBT1-SET-SEC
      *
      *    保険種別２
           PERFORM 3110-HKNSBT2-SET-SEC
      *
      *    本人・家族
           PERFORM 3110-HONKZK-SET-SEC
      *
      *    給付割合
      *    国保のみ印字
           IF    ( MF100-TEISYUTUSAKI =   "2"    )
           AND   ( MF100-RJNHKNNUM    =   SPACE  )
               COMPUTE WRK-KYURATE-9   =   (100 -   MF100-KYURATE)
                                           / 10 
               IF      WRK-KYURATE-9       >   ZERO
                   MOVE   "給割"               TO  HC06-KYURATE
                   MOVE    WRK-KYURATE-9       TO  WRK-KYURATE
                   INITIALIZE              ORCSKANACHKAREA
                   MOVE    "2"             TO  KANACHK-SYORI 
                   MOVE    WRK-KYURATE     TO  KANACHK-MAE-INPUT
                   CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
                   IF    ( KANACHK-RC      =   ZERO )
                   AND   ( KANACHK-MAX     >   ZERO )
                       MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                               TO  HC06-KYURATE(5:)
                   END-IF    
               END-IF
           END-IF
      *
      *    老人保険−市町村番号
           MOVE    MF100-RJNFTNJANUM  TO  HC06-RJNFTNJANUM
      *
      *    老人保険−受給者番号
           MOVE    MF100-RJNJKYSNUM   TO  HC06-RJNJKYSNUM
      *
      *    保険者番号・公費−負担者番号・受給者番号・診療実日数・記号番号
           PERFORM 3110-KANREN-NUM-SET-SEC
      *
      *    カナ氏名
           IF     MF100-KANANAME (41:)     NOT =   SPACE
                MOVE    MF100-KANANAME     TO  HC06-KANANAME2
           ELSE
                MOVE    MF100-KANANAME     TO  HC06-KANANAME
           END-IF
      *
      *    氏名
           MOVE    MF100-NAME         TO  HC06-NAME
      *
      *    性別
           EVALUATE    MF100-SEX
           WHEN    "1"
               MOVE    "１"            TO  HC06-SEXNUM
               MOVE    "男"            TO  HC06-SEXN
           WHEN    "2"
               MOVE    "２"            TO  HC06-SEXNUM
               MOVE    "女"            TO  HC06-SEXN
           END-EVALUATE
      *
      *    生年月日
           MOVE    MF100-BIRTHDAY     TO  WRK-SYMD
           PERFORM 31012-SE-WA-YMDEDIT-SEC
           INITIALIZE              ORCSKANACHKAREA
           MOVE    "2"             TO  KANACHK-SYORI 
           MOVE    LNK-DAY1-GENGO    TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
           IF      KANACHK-RC      =   ZERO
               MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                       TO  HC06-BIRTHDAY(1:)
           END-IF    
           MOVE    MF100-BIRTHDAY     TO  WRK-SYMD
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    LNK-DAY2-EDTYMD2 (1:2)
                                       TO  HC06-BIRTHDAY(3:2)
           MOVE    LNK-DAY2-EDTYMD2 (5:)
                                       TO  HC06-BIRTHDAY(5:)
      *
      *    職務上の事由
           EVALUATE    MF100-HKNNUM
               WHEN    "002"
               WHEN    "031"  THRU  "034"
                   EVALUATE    MF100-HOJOKBN
                       WHEN    "1"
                       WHEN    "A"
                       WHEN    "D"
                           MOVE    "職務上"              TO  HC06-JIYU
                       WHEN    "2"
                       WHEN    "B"
                       WHEN    "E"
                           MOVE    "下船後３ヶ月以内"    TO  HC06-JIYU
                       WHEN    "3"
                       WHEN    "C"
                       WHEN    "F"
                           MOVE    "通勤災害"            TO  HC06-JIYU
                   END-EVALUATE
           END-EVALUATE        
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *    医療機関所在地
      *     MOVE    SYS-1002-ADRS       TO  HC06-HOSPADRS
      *
      *    医療機関名称
      *     MOVE    SYS-1001-HOSPNAME   TO  HC06-HOSPNAME
      *
      *    医療機関ＴＥＬ
      *     MOVE    SYS-1002-TEL        TO  HC06-HOSPTEL
      *    医療機関所在地
           MOVE    WRK-HOSPADRS        TO  HC06-HOSPADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT HC06-HOSPADRS       REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *
      *    医療機関名称
           MOVE    WRK-HOSPNAME        TO  HC06-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT HC06-HOSPNAME       REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *
      *    医療機関ＴＥＬ
           MOVE    WRK-HOSPTEL         TO  HC06-HOSPTEL
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      **    診療科？？？
           MOVE    SPACE               TO  HC06-SRYKA
      *
      *    病床数
           MOVE    SYS-1001-BEDSU      TO  WRK-BEDSU
           MOVE    WRK-BEDSU           TO  HC06-BEDSU
      *
      *=== 特記事項追加 by Yoshikawa(2009/05/14) start
      *    特記事項
           PERFORM  VARYING  IDX2  FROM  1  BY  1
                    UNTIL    IDX2  >     4
             PERFORM  VARYING  IDY2  FROM  1  BY  1
                      UNTIL    IDY2  >   TBL-TOKKI-MAX
               IF  MF100-TOKKI(IDX2)  =  TBL-TOKKICD(IDY2)
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
      *             MOVE  TBL-TOKKINAME(IDY2)   TO  HC06-TOKKI(IDX2)
                 IF  ( MF100-TOKKI(IDX2)    =   "02" OR "16" )
                   IF  ( MF100-TYOKI  =  1 )
                     MOVE  TBL-TOKKINAME(IDY2)   TO  HC06-TOKKI(IDX2)
                   END-IF
                 ELSE
                   MOVE  TBL-TOKKINAME(IDY2)   TO  HC06-TOKKI(IDX2)
                 END-IF
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) start
      *           MOVE  19  TO  IDY2
                 MOVE  TBL-TOKKI-MAX  TO  IDY2
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) end
               END-IF
             END-PERFORM
           END-PERFORM
      *=== 特記事項追加 by Yoshikawa(2009/05/14) end
      *
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) start
           IF  SYS-2005-RENNUMHENKBN  =  "1"
               MOVE    WRK-RENNUM              TO  WRK-Z7
               MOVE    WRK-Z7                  TO  HC06-RENNUM
           END-IF
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) end
      *
           .
       310-HC101-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  <保険種別１>編集処理(外来)
      *****************************************************************
       3110-HKNSBT1-SET-SEC              SECTION.
      *
      *    不明分・自費は編集しない
           IF      MF100-RECESYUBETU     =    "0000"  OR
                                               "8888"
               CONTINUE
           ELSE                                        
               EVALUATE    MF100-RECESYUBETU (2:1)
                   WHEN    "1"
                       EVALUATE    MF100-TEISYUTUSAKI
                           WHEN    1
                               MOVE    "１社"      TO  HC06-HKNSBT1
                           WHEN    2
                               MOVE    "１国"      TO  HC06-HKNSBT1
                       END-EVALUATE
                   WHEN    "2"
                       MOVE    "２公費"        TO  HC06-HKNSBT1
                   WHEN    "3"
                       MOVE    "３老人"        TO  HC06-HKNSBT1
                   WHEN    "4"
                       MOVE    "４退職"        TO  HC06-HKNSBT1
               END-EVALUATE
           END-IF    
      *
           .
       3110-HKNSBT1-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  <保険種別２>編集処理(外来)
      *****************************************************************
       3110-HKNSBT2-SET-SEC              SECTION.
      *
      *    不明分・自費は編集しない
           IF      MF100-RECESYUBETU     =    "0000"  OR
                                               "8888"
               CONTINUE
           ELSE                                        
               EVALUATE    MF100-RECESYUBETU (3:1)
                   WHEN    "1"
                       MOVE    "１単独"        TO  HC06-HKNSBT2
                   WHEN    "2"
                       MOVE    "２２併"        TO  HC06-HKNSBT2
                   WHEN    "3"
                       MOVE    "３３併"        TO  HC06-HKNSBT2
               END-EVALUATE
           END-IF    
      *
           .
       3110-HKNSBT2-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  <本人・家族>編集処理(外来)
      *****************************************************************
       3110-HONKZK-SET-SEC             SECTION.
      *
      *    不明分・自費は編集しない
           IF      MF100-RECESYUBETU     =    "0000"  OR
                                               "8888"
               CONTINUE
           ELSE                                        
               EVALUATE    MF100-RECESYUBETU (4:1)
                   WHEN    "0"
      *---(01.00.11) LINE ADD START ------------------------------------
      *                 MOVE    "０高外８"     TO  HC06-HONKZK
                       MOVE    "０高外７"     TO  HC06-HONKZK
      *---(01.00.11) LINE ADD END   ------------------------------------
                   WHEN    "2"
                       MOVE    "２本外"       TO  HC06-HONKZK
                   WHEN    "4"
      *---(01.00.10) LINE ADD START ------------------------------------
      *                 MOVE    "４三外"       TO  HC06-HONKZK
                       MOVE    "４六外"       TO  HC06-HONKZK
      *---(01.00.10) LINE ADD END   ------------------------------------
                   WHEN    "6"
                       MOVE    "６家外"       TO  HC06-HONKZK
                   WHEN    "8"
      *---(01.00.11) LINE ADD START ------------------------------------
      *                 MOVE    "８高外９"     TO  HC06-HONKZK
                       MOVE    "８高外一"     TO  HC06-HONKZK
      *---(01.00.11) LINE ADD END   ------------------------------------
               END-EVALUATE
           END-IF    
      *
           .
       3110-HONKZK-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  主保険−保険者番号８桁
      *          公費−負担者番号  ８桁
      *          記号・番号　診療実日数     編集処理(外来)
      *****************************************************************
       3110-KANREN-NUM-SET-SEC        SECTION.
      *
      *    <保険者番号>
           MOVE    SPACE              TO  WRK-HKNJANUM
           IF  MF100-TEISYUTUSAKI    =   "2"
               IF      MF100-HKNJANUM (1:2)    =   "67"
                   MOVE    MF100-HKNJANUM      TO  WRK-HKNJANUM
               ELSE
      *        国保の場合（６桁右詰に編集）
                   MOVE    SPACE               TO  WRK-HKNJANUM(1:2)
                   MOVE    MF100-HKNJANUM      TO  WRK-HKNJANUM(3:)
               END-IF
           ELSE
               IF  MF100-HKNNUM       =   "001"
      *            政府管掌の場合（４桁右詰に編集）
                   MOVE    SPACE            TO  WRK-HKNJANUM(1:4)
                   MOVE    MF100-HKNJANUM   TO  WRK-HKNJANUM(5:)
               ELSE
      *            他の保険の場合（８桁）
                   MOVE    MF100-HKNJANUM   TO  WRK-HKNJANUM
               END-IF
           END-IF
           MOVE   WRK-HKNJANUM    TO    HC06-HKNJANUM
      *
      *    <記号・番号>
           INITIALIZE              ORCSKANACHKAREA
           MOVE    "2"             TO  KANACHK-SYORI 
           MOVE    MF100-KIGO      TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
           IF      KANACHK-RC      =   ZERO
               MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                       TO  HC06-KIGO
           END-IF    
           INITIALIZE              ORCSKANACHKAREA
           MOVE    "2"             TO  KANACHK-SYORI 
           MOVE    MF100-NUM       TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
           IF      KANACHK-RC      =   ZERO
               MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                       TO  HC06-NUM
           END-IF    
      *
      *
      *    <診療実日数>
           IF      CNT-PAGE        =   1
               MOVE    MF100-JNISSU    TO  WRK-JINISSUZ
               MOVE    WRK-JINISSU     TO  HC06-JINISSU
           END-IF
      *
           .
       3110-KANREN-NUM-SET-EXT.
           EXIT.
      *
      ******************************************************************
      *    帳票編集<ヘッダー部>処理(入院)
      *****************************************************************
       310N-HC101-HEAD-HEN-SEC          SECTION.
      *
           INITIALIZE                      HCN06
           MOVE    SPACE               TO  HCN06
      *
      *    患者番号
           MOVE    MF100-PTNUM        TO  HCN06-PTNUM
      *
      *
      *    提出先
           IF      MF100-RECESYUBETU  =    "0000"  OR  "8888"
               MOVE    SPACE           TO  HCN06-TEISYUTUSAKI
           ELSE    
               EVALUATE    MF100-TEISYUTUSAKI
                   WHEN    1
                       MOVE    "１社"          TO  HCN06-TEISYUTUSAKI
                   WHEN    2
                       MOVE    "２国"          TO  HCN06-TEISYUTUSAKI
                   WHEN    OTHER
                       MOVE    SPACE           TO  HCN06-TEISYUTUSAKI
               END-EVALUATE
           END-IF    
      *
      *    診療年月（診療年月日として退避）
           MOVE    MF100-SRYYM         TO  WRK-SYMD
           MOVE    01                  TO  WRK-SDD
           MOVE    WRK-SYMD            TO  WRK-SRYYMD
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    LNK-DAY2-EDTYMD1-Y  TO  HCN06-SRYY 
           MOVE    LNK-DAY2-EDTYMD1-M  TO  HCN06-SRYM 
      *
      *    県番
           MOVE    SYS-1001-PREFNUM    TO  HCN06-PREFNUM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN    TO  HCN06-HOSPCDN
      *
      *    保険種別１
           PERFORM 3110N-HKNSBT1-SET-SEC
      *
      *    保険種別２
           PERFORM 3110N-HKNSBT2-SET-SEC
      *
      *    本人・家族
           PERFORM 3110N-HONKZK-SET-SEC
      *
      *    給付割合
      *    国保のみ印字
           IF    ( MF100-TEISYUTUSAKI =   "2"    )
           AND   ( MF100-RJNHKNNUM    =   SPACE  )
               COMPUTE WRK-KYURATE-9   =   (100 -   MF100-KYURATE)
                                           / 10 
               IF      WRK-KYURATE-9       >   ZERO
                   MOVE   "給割"               TO  HCN06-KYURATE
                   MOVE    WRK-KYURATE-9       TO  WRK-KYURATE
                   INITIALIZE              ORCSKANACHKAREA
                   MOVE    "2"             TO  KANACHK-SYORI 
                   MOVE    WRK-KYURATE     TO  KANACHK-MAE-INPUT
                   CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
                   IF    ( KANACHK-RC      =   ZERO )
                   AND   ( KANACHK-MAX     >   ZERO )
                       MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                               TO  HCN06-KYURATE(5:)
                   END-IF    
               END-IF
           END-IF
      *
      *    老人保険−市町村番号
           MOVE    MF100-RJNFTNJANUM  TO  HCN06-RJNFTNJANUM
      *
      *    老人保険−受給者番号
           MOVE    MF100-RJNJKYSNUM   TO  HCN06-RJNJKYSNUM
      *
      *    保険者番号・公費−負担者番号・受給者番号・診療実日数・記号番号
           PERFORM 3110N-KANREN-NUM-SET-SEC
      *
      *    カナ氏名
           IF     MF100-KANANAME (41:)     NOT =   SPACE
                MOVE    MF100-KANANAME     TO  HCN06-KANANAME2
           ELSE
                MOVE    MF100-KANANAME     TO  HCN06-KANANAME
           END-IF
      *
      *    氏名
           MOVE    MF100-NAME         TO  HCN06-NAME
      *
      *    性別
           EVALUATE    MF100-SEX
           WHEN    "1"
               MOVE    "１"            TO  HCN06-SEXNUM
               MOVE    "男"            TO  HCN06-SEXN
           WHEN    "2"
               MOVE    "２"            TO  HCN06-SEXNUM
               MOVE    "女"            TO  HCN06-SEXN
           END-EVALUATE
      *
      *    生年月日
           MOVE    MF100-BIRTHDAY     TO  WRK-SYMD
           PERFORM 31012-SE-WA-YMDEDIT-SEC
           INITIALIZE              ORCSKANACHKAREA
           MOVE    "2"             TO  KANACHK-SYORI 
           MOVE    LNK-DAY1-GENGO    TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
           IF      KANACHK-RC      =   ZERO
               MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                       TO  HCN06-BIRTHDAY(1:)
           END-IF    
           MOVE    MF100-BIRTHDAY     TO  WRK-SYMD
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    LNK-DAY2-EDTYMD2 (1:2)
                                       TO  HCN06-BIRTHDAY(3:2)
           MOVE    LNK-DAY2-EDTYMD2 (5:)
                                       TO  HCN06-BIRTHDAY(5:)
      *
      *    職務上の事由
           EVALUATE    MF100-HKNNUM
               WHEN    "002"
               WHEN    "031"  THRU  "034"
                   EVALUATE    MF100-HOJOKBN
                       WHEN    "1"
                       WHEN    "A"
                       WHEN    "D"
                           MOVE    "職務上"              TO  HCN06-JIYU
                       WHEN    "2"
                       WHEN    "B"
                       WHEN    "E"
                           MOVE    "下船後３ヶ月以内"    TO  HCN06-JIYU
                       WHEN    "3"
                       WHEN    "C"
                       WHEN    "F"
                           MOVE    "通勤災害"            TO  HCN06-JIYU
                   END-EVALUATE
           END-EVALUATE        
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *    医療機関所在地
      *     MOVE    SYS-1002-ADRS       TO  HCN06-HOSPADRS
      *
      *    医療機関名称
      *     MOVE    SYS-1001-HOSPNAME   TO  HCN06-HOSPNAME
      *
      *    医療機関ＴＥＬ
      *     MOVE    SYS-1002-TEL        TO  HCN06-HOSPTEL
      *    医療機関所在地
           MOVE    WRK-HOSPADRS        TO  HCN06-HOSPADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT HCN06-HOSPADRS      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *
      *    医療機関名称
           MOVE    WRK-HOSPNAME        TO  HCN06-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) start
           INSPECT HCN06-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/22) end
      *
      *    医療機関ＴＥＬ
           MOVE    WRK-HOSPTEL         TO  HCN06-HOSPTEL
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      **    診療科？？？
           MOVE    SPACE               TO  HCN06-SRYKA
      *
      *    病床数
           MOVE    SYS-1001-BEDSU      TO  WRK-BEDSU
           MOVE    WRK-BEDSU           TO  HCN06-BEDSU
      *
      *=== 特記事項追加 by Yoshikawa(2009/05/14) start
      *    特記事項
           PERFORM  VARYING  IDX2  FROM  1  BY  1
                    UNTIL    IDX2  >     4
             PERFORM  VARYING  IDY2  FROM  1  BY  1
                      UNTIL    IDY2  >   TBL-TOKKI-MAX
               IF  MF100-TOKKI(IDX2)  =  TBL-TOKKICD(IDY2)
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
      *           MOVE  TBL-TOKKINAME(IDY2)   TO  HCN06-TOKKI(IDX2)
                 IF  ( MF100-TOKKI(IDX2)    =   "02" OR "16" )
                   IF  ( MF100-TYOKI  =  1 )
      *=== 入院特記事項印字 by Yoshikawa(2015/01/30) start
      *               MOVE  TBL-TOKKINAME(IDY2)   TO  HC06-TOKKI(IDX2)
                     MOVE  TBL-TOKKINAME(IDY2)   TO  HCN06-TOKKI(IDX2)
      *=== 入院特記事項印字 by Yoshikawa(2015/01/30) end
                   END-IF
                 ELSE
      *=== 入院特記事項印字 by Yoshikawa(2015/01/30) start
      *             MOVE  TBL-TOKKINAME(IDY2)   TO  HC06-TOKKI(IDX2)
                   MOVE  TBL-TOKKINAME(IDY2)   TO  HCN06-TOKKI(IDX2)
      *=== 入院特記事項印字 by Yoshikawa(2015/01/30) end
                 END-IF
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) start
      *           MOVE  19  TO  IDY2
                 MOVE  TBL-TOKKI-MAX  TO  IDY2
      *=== H21年5月特定疾患改正対応 by Yoshikawa(2009/05/27) end
               END-IF
             END-PERFORM
           END-PERFORM
      *=== 特記事項追加 by Yoshikawa(2009/05/14) end
      *
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) start
           IF  SYS-2005-RENNUMHENKBN  =  "1"
               MOVE    WRK-RENNUM              TO  WRK-Z7
               MOVE    WRK-Z7                  TO  HCN06-RENNUM
           END-IF
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) end
      *
           .
       310N-HC101-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  <保険種別１>編集処理(入院)
      *****************************************************************
       3110N-HKNSBT1-SET-SEC              SECTION.
      *
      *    不明分・自費は編集しない
           IF      MF100-RECESYUBETU     =    "0000"  OR
                                               "8888"
               CONTINUE
           ELSE                                        
               EVALUATE    MF100-RECESYUBETU (2:1)
                   WHEN    "1"
                       EVALUATE    MF100-TEISYUTUSAKI
                           WHEN    1
                               MOVE    "１社"      TO  HCN06-HKNSBT1
                           WHEN    2
                               MOVE    "１国"      TO  HCN06-HKNSBT1
                       END-EVALUATE
                   WHEN    "2"
                       MOVE    "２公費"        TO  HCN06-HKNSBT1
                   WHEN    "3"
                       MOVE    "３老人"        TO  HCN06-HKNSBT1
                   WHEN    "4"
                       MOVE    "４退職"        TO  HCN06-HKNSBT1
               END-EVALUATE
           END-IF    
      *
           .
       3110N-HKNSBT1-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  <保険種別２>編集処理(入院)
      *****************************************************************
       3110N-HKNSBT2-SET-SEC              SECTION.
      *
      *    不明分・自費は編集しない
           IF      MF100-RECESYUBETU     =    "0000"  OR
                                               "8888"
               CONTINUE
           ELSE                                        
               EVALUATE    MF100-RECESYUBETU (3:1)
                   WHEN    "1"
                       MOVE    "１単独"        TO  HCN06-HKNSBT2
                   WHEN    "2"
                       MOVE    "２２併"        TO  HCN06-HKNSBT2
                   WHEN    "3"
                       MOVE    "３３併"        TO  HCN06-HKNSBT2
               END-EVALUATE
           END-IF    
      *
           .
       3110N-HKNSBT2-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  <本人・家族>編集処理(入院)
      *****************************************************************
       3110N-HONKZK-SET-SEC             SECTION.
      *
      *    不明分・自費は編集しない
           IF      MF100-RECESYUBETU     =    "0000"  OR
                                               "8888"
               CONTINUE
           ELSE                                        
               EVALUATE    MF100-RECESYUBETU (4:1)
                   WHEN    "1"
                       MOVE    "１本入"     TO  HCN06-HONKZK
                   WHEN    "3"
      *---(01.00.10) LINE ADD START ------------------------------------
      *                 MOVE    "３三入"     TO  HCN06-HONKZK
                       MOVE    "３六入"     TO  HCN06-HONKZK
      *---(01.00.10) LINE ADD END   ------------------------------------
                   WHEN    "5"
                       MOVE    "５家入"     TO  HCN06-HONKZK
                   WHEN    "7"
      *---(01.00.11) LINE ADD START ------------------------------------
      *                 MOVE    "７高入９"   TO  HCN06-HONKZK
                       MOVE    "７高入一"   TO  HCN06-HONKZK
      *---(01.00.11) LINE ADD END   ------------------------------------
                   WHEN    "9"
      *---(01.00.11) LINE ADD START ------------------------------------
      *                 MOVE    "９高入８"   TO  HCN06-HONKZK
                       MOVE    "９高入７"   TO  HCN06-HONKZK
      *---(01.00.11) LINE ADD END   ------------------------------------
               END-EVALUATE
           END-IF    
      *
           .
       3110N-HONKZK-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票  主保険−保険者番号８桁
      *          公費−負担者番号  ８桁
      *          記号・番号　診療実日数     編集処理(入院)
      *****************************************************************
       3110N-KANREN-NUM-SET-SEC        SECTION.
      *
      *    <保険者番号>
           MOVE    SPACE              TO  WRK-HKNJANUM
           IF  MF100-TEISYUTUSAKI    =   "2"
               IF      MF100-HKNJANUM (1:2)    =   "67"
                   MOVE    MF100-HKNJANUM      TO  WRK-HKNJANUM
               ELSE
      *        国保の場合（６桁右詰に編集）
                   MOVE    SPACE               TO  WRK-HKNJANUM(1:2)
                   MOVE    MF100-HKNJANUM      TO  WRK-HKNJANUM(3:)
               END-IF
           ELSE
               IF  MF100-HKNNUM       =   "001"
      *            政府管掌の場合（４桁右詰に編集）
                   MOVE    SPACE            TO  WRK-HKNJANUM(1:4)
                   MOVE    MF100-HKNJANUM   TO  WRK-HKNJANUM(5:)
               ELSE
      *            他の保険の場合（８桁）
                   MOVE    MF100-HKNJANUM   TO  WRK-HKNJANUM
               END-IF
           END-IF
           MOVE   WRK-HKNJANUM    TO    HCN06-HKNJANUM
      *
      *    <記号・番号>
           INITIALIZE              ORCSKANACHKAREA
           MOVE    "2"             TO  KANACHK-SYORI 
           MOVE    MF100-KIGO      TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
           IF      KANACHK-RC      =   ZERO
               MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
      ***** 2005/09/07 YAMAGUCHI DEL
      *                                 TO  HC06-KIGO
      ***** 2005/09/07 YAMAGUCHI INS
                                       TO  HCN06-KIGO
      *****
           END-IF    
           INITIALIZE              ORCSKANACHKAREA
           MOVE    "2"             TO  KANACHK-SYORI 
           MOVE    MF100-NUM       TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
           IF      KANACHK-RC      =   ZERO
               MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
      ***** 2005/09/07 YAMAGUCHI DEL
      *                                 TO  HC06-NUM
      ***** 2005/09/07 YAMAGUCHI INS
                                       TO  HCN06-NUM
      *****
           END-IF    
      *
      *
      *    <診療実日数>
           IF      CNT-PAGE        =   1
               MOVE    MF100-JNISSU    TO  WRK-JINISSUZ
      ***** 2005/09/07 YAMAGUCHI DEL
      *         MOVE    WRK-JINISSU     TO  HC06-JINISSU
      ***** 2005/09/07 YAMAGUCHI INS
               MOVE    WRK-JINISSU     TO  HCN06-JINISSU
      *****
           END-IF
      *
           .
       3110N-KANREN-NUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<傷病名>処理
      *****************************************************************
       320-HC101-BYOMEI-HEN-SEC      SECTION.
      *
      *    病名退避エリア初期化
           INITIALIZE  WRK-BYOMEI-TAIHI-TBL
      *
      *    パラメータ０３ファイルより編集
           MOVE    LOW-VALUE           TO  WRK-BYO-OLD
      *     
           INITIALIZE                  WRK-EDIT-AREA
           MOVE    SPACE               TO  WRK-BYOMEI1
                                           WRK-BYOMEI2
           MOVE    ZERO                TO  FLG-TENKI                                
      *     
           INITIALIZE                      RECE031-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    MF100-HOSPID       TO  RECE031-HOSPID
           MOVE    MF100-HOSPNUM      TO  RECE031-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    MF100-SRYYM        TO  RECE031-SRYYM
           MOVE    MF100-NYUGAIKBN    TO  RECE031-NYUGAIKBN
           MOVE    MF100-PTID         TO  RECE031-PTID
           MOVE    MF100-RECEKA       TO  RECE031-RECEKA
           MOVE    MF100-TEISYUTUSAKI TO  RECE031-TEISYUTUSAKI
           MOVE    MF100-RECESYUBETU  TO  RECE031-RECESYUBETU
      *=== 保険者番号の項目変更 by Yoshikawa(2015/05/14) start
      *     MOVE    MF100-HKNJANUM-KEY TO  RECE031-HKNJANUM
           MOVE    MF100-HKNJANUM     TO  RECE031-HKNJANUM
      *=== 保険者番号の項目変更 by Yoshikawa(2015/05/14) end
           MOVE    MF100-HOJOKBN-KEY  TO  RECE031-HOJOKBN
           MOVE    MF100-TEKSTYMD     TO  RECE031-TEKSTYMD
      *
           START   RECE031-FILE
               KEY IS    >=   RECE031-KEY
               INVALID
                   MOVE    1           TO  FLG-RECE031
                   DISPLAY "患者病名ファイル終了"
               NOT INVALID
                   PERFORM 990-RECE031-NEXT-SEC
           END-START
           DISPLAY "フラグ="      FLG-RECE031
           DISPLAY "患者番号1="    MF100-PTNUM
           DISPLAY "診療年月1="   MF100-SRYYM
           DISPLAY "入外区分1="   MF100-NYUGAIKBN
           DISPLAY "患者ID1="     MF100-PTID
           DISPLAY "保険者番号KEY1=" MF100-HKNJANUM-KEY
           DISPLAY "保険者番号1=" MF100-HKNJANUM
           DISPLAY "レセプト科1=" MF100-RECEKA
           DISPLAY "摘要開始日1=" MF100-TEKSTYMD
           DISPLAY "提出先1="     MF100-TEISYUTUSAKI
           DISPLAY "レセ種別1="   MF100-RECESYUBETU
           DISPLAY "補助区分1="   MF100-HOJOKBN-KEY
           DISPLAY "---------------------------"
           DISPLAY "患者番号2="    MF100-PTNUM
           DISPLAY "診療年月2="   RECE031-SRYYM
           DISPLAY "入外区分2="   RECE031-NYUGAIKBN
           DISPLAY "患者ID2="     RECE031-PTID
           DISPLAY "保険者番号2=" RECE031-HKNJANUM
           DISPLAY "レセプト科2=" RECE031-RECEKA
           DISPLAY "摘要開始日2=" RECE031-TEKSTYMD
           DISPLAY "提出先2="     RECE031-TEISYUTUSAKI
           DISPLAY "レセ種別2="   RECE031-RECESYUBETU
           DISPLAY "補助区分2="   RECE031-HOJOKBN
           DISPLAY "---------------------------"
      *
           PERFORM
               UNTIL  ( FLG-RECE031          =   1                    )
      *---(01.00.09) LINE ADD START ------------------------------------
      *         OR     ( MF100-HOSPID     NOT =   RECE031-HOSPID       )
               OR     ( MF100-HOSPNUM    NOT =   RECE031-HOSPNUM      )
      *---(01.00.09) LINE ADD END   ------------------------------------
               OR     ( MF100-SRYYM      NOT =   RECE031-SRYYM        )
               OR     ( MF100-NYUGAIKBN  NOT =   RECE031-NYUGAIKBN    )
               OR     ( MF100-PTID       NOT =   RECE031-PTID         )
               OR     ( MF100-RECEKA     NOT =   RECE031-RECEKA       )
               OR     ( MF100-TEISYUTUSAKI
                                         NOT =   RECE031-TEISYUTUSAKI )
               OR     ( MF100-RECESYUBETU
                                         NOT =   RECE031-RECESYUBETU  )
               OR     ( MF100-HKNJANUM
                                         NOT =   RECE031-HKNJANUM     )
               OR     ( MF100-HOJOKBN-KEY
                                         NOT =   RECE031-HOJOKBN      )
               OR     ( MF100-TEKSTYMD   NOT =   RECE031-TEKSTYMD     )
      *    
                   DISPLAY "病名編集開始"
      *        病名編集処理
               PERFORM 3210-BYOMEI-SET-SEC
      *
           END-PERFORM
      *
           MOVE    1               TO  FLG-RECE031     
      *
           IF  WRK-LINEBYO      <  WRK-BYOMEI-LINE
               IF  WRK-BYOMEI1-NAME  NOT =   SPACE
                   PERFORM 3221-BYOMEI1-OUT-SEC
               END-IF
           ELSE
               IF  WRK-BYOMEI2-NAME  NOT =   SPACE
                   MOVE    1             TO  FLG-TENKI
                   PERFORM 3222-BYOMEI2-OUT-SEC
                   MOVE    ZERO          TO  FLG-TENKI
               END-IF
           END-IF
      *
      *    主病名との区切り線編集処理     
           IF    ( SYS-2005-SYUBYOHENFLG   =   "3" )
           AND   ( WRK-BO-SYUBYOFLG        =   "1" )
               IF      WRK-LINEBYO     <   WRK-BYOMEI-LINE
                   ADD     1           TO  WRK-LINEBYO
                   MOVE    WRK-KUGIRI3
                           TO WRK-TAIHI-BYOMEI(WRK-LINEBYO)(2:52)
               ELSE
                   IF      WRK-LINETEK >=   WRK-TEKIYOU-LINE
                       PERFORM 34120-PAGE-SEC
                   END-IF 
                   MOVE    1           TO  FLG-KUGIRI
                   PERFORM 34110-KUGIRI-LINE-SEC
                   MOVE    ZERO        TO  FLG-KUGIRI   
               END-IF
           END-IF
      *
      *    ワークエリアに退避した病名情報を設定
           PERFORM 3201-TAIHI-SET-SEC
      *
           .
       320-HC101-BYOMEI-HEN-EXT.
           EXIT.
      *****************************************************************
      *    退避病名設定
      *****************************************************************
       3201-TAIHI-SET-SEC       SECTION.
      *
           IF      MF100-NYUGAIKBN     =   "1"
               PERFORM VARYING IDX1    FROM    1   BY  1
                       UNTIL   IDX1    >      35
                   IF      IDX1        <=     5
                       MOVE    WRK-TAIHI-SRYYMD(IDX1)
                                           TO  HCN06-SRYYMD(IDX1)
                       MOVE    WRK-TAIHI-TENKI(IDX1)
                                           TO  HCN06-TENKI(IDX1)
                       MOVE    WRK-TAIHI-TENKIYMD(IDX1)
                                           TO  HCN06-TENKIYMD(IDX1)
                       MOVE    WRK-TAIHI-BYOMEI(IDX1)
                                           TO  HCN06-BYOMEI(IDX1)
                   END-IF
                   MOVE    WRK-TAIHI-TEKIYO(IDX1)
                                           TO  HCN06-TEKIYO(IDX1)
               END-PERFORM
           ELSE
               PERFORM VARYING IDX1    FROM    1   BY  1
                       UNTIL   IDX1    >      35
                   IF      IDX1        <=     5
                       MOVE    WRK-TAIHI-SRYYMD(IDX1)
                                           TO  HC06-SRYYMD(IDX1)
                       MOVE    WRK-TAIHI-TENKI(IDX1)
                                           TO  HC06-TENKI(IDX1)
                       MOVE    WRK-TAIHI-TENKIYMD(IDX1)
                                           TO  HC06-TENKIYMD(IDX1)
                       MOVE    WRK-TAIHI-BYOMEI(IDX1)
                                           TO  HC06-BYOMEI(IDX1)
                   END-IF
                   MOVE    WRK-TAIHI-TEKIYO(IDX1)
                                           TO  HC06-TEKIYO(IDX1)
               END-PERFORM
           END-IF
      *
           .
       3201-TAIHI-SET-EXT.
           EXIT.
      *
      ****************************************************************
      *     病名編集処理
      ****************************************************************
       3210-BYOMEI-SET-SEC           SECTION.
      * 
      *    連結表示のとき
           IF      SYS-2005-BYOMEIHENKBN    =   "0"
      *        前のデータと同一主病名フラグ・診療開始日・転帰区分
               IF  ( RECE031-SYUBYOFLG    =   WRK-BO-SYUBYOFLG )  AND
                   ( RECE031-SRYYMD       =   WRK-BO-SRYYMD    )  AND
                   ( RECE031-TENKIKBN     =   WRK-BO-TENKIKBN  )  AND 
                   ( RECE031-TENKIYMD     =   WRK-BO-TENKIYMD  )   
      *
      *            病名をつなげると何桁になるかを計算（，＋病名）
                   IF  WRK-CLM           =   ZERO
                       MOVE    WRK-CLM   TO  WRK-WCLM
                   ELSE
                       COMPUTE WRK-WCLM  =   WRK-CLM   +   2
                   END-IF
                   COMPUTE     WRK-WCLM  =
                              ( RECE031-BYOMEIMOJI  *   2 )
                                                    +   WRK-WCLM
      *
                   EVALUATE    TRUE
      *                傷病名欄に編集
                       WHEN    WRK-LINEBYO     <   WRK-BYOMEI-LINE
                           IF  WRK-WCLM          >   WRK-BYOMEI1-MAX
                               PERFORM 3221-BYOMEI1-OUT-SEC
                           ELSE
                               IF  WRK-CLM       >   ZERO
      *                            前の病名の直後に編集
                                   COMPUTE WRK-STCLM =   WRK-CLM   +
                                                         1
                                   MOVE    "，"  TO  WRK-BYOMEI1-NAME
                                                           (WRK-STCLM:)
                                   COMPUTE WRK-CLM   =   WRK-CLM   +
                                                         2
                               END-IF
                           END-IF
      *                適用欄に編集
                       WHEN    WRK-LINEBYO     >=  WRK-BYOMEI-LINE
                           IF  WRK-WCLM          >   WRK-BYOMEI2-MAX
                               MOVE    1             TO  FLG-TENKI
                               PERFORM 3222-BYOMEI2-OUT-SEC
                               MOVE    ZERO          TO  FLG-TENKI
                           ELSE
                               IF  WRK-CLM       >   ZERO
      *                        前の病名の直後に編集
                                   COMPUTE WRK-STCLM =   WRK-CLM   +
                                                         1
                                   MOVE    "，"  TO  WRK-BYOMEI2-NAME
                                                       (WRK-STCLM:)
                                   COMPUTE WRK-CLM   =   WRK-CLM   +
                                                         2
                               END-IF
                           END-IF
                   END-EVALUATE
               ELSE
      *            主病名フラグ・診療開始日・転帰区分 が異なる場合
                   IF      WRK-BYO-OLD        =   LOW-VALUE
                       CONTINUE
                   ELSE
                       IF  WRK-LINEBYO       <  WRK-BYOMEI-LINE
                           IF  WRK-BYOMEI1-NAME  NOT =   SPACE
                               PERFORM 3221-BYOMEI1-OUT-SEC
                           END-IF
                       ELSE
                           IF  WRK-BYOMEI2   NOT =   SPACE
                               MOVE    1             TO  FLG-TENKI
                               PERFORM 3222-BYOMEI2-OUT-SEC
                               MOVE    ZERO          TO  FLG-TENKI 
                           END-IF
                       END-IF
                   END-IF    
               END-IF
           ELSE
                IF  WRK-LINEBYO       <   WRK-BYOMEI-LINE
                    IF  WRK-BYOMEI1-NAME  NOT =   SPACE
                        PERFORM 3221-BYOMEI1-OUT-SEC
                    END-IF
                ELSE
                    IF  WRK-BYOMEI2   NOT =   SPACE
                        MOVE    1             TO  FLG-TENKI
                        PERFORM 3222-BYOMEI2-OUT-SEC
                        MOVE    ZERO          TO  FLG-TENKI
                    END-IF
                END-IF
           END-IF
      *
      *    主病名との区切り線編集処理     
           PERFORM 3211-SYUBYOFLG-HENSYU-SEC
      *
      *    対象病名を編集
           COMPUTE     WRK-STCLM         =   WRK-CLM   +   1
      *    単病名文字数を計算
           COMPUTE WRK-MOJISU          =   RECE031-BYOMEIMOJI   *   2
           MOVE    RECE031-BYOMEI      TO  WRK-BYOMEI
      *
      *
           EVALUATE    TRUE
      *        傷病名欄に編集
               WHEN    WRK-LINEBYO     <   WRK-BYOMEI-LINE
                   MOVE    WRK-BYOMEI      TO  WRK-BYOMEI1-NAME
                                                          (WRK-STCLM:)
                   IF      WRK-MOJISU       >   WRK-BYOMEI1-MAX
                       MOVE    RECE031-SRYYMD  TO  WRK-BO-SRYYMD
                       MOVE    RECE031-TENKIKBN
                                               TO  WRK-BO-TENKIKBN
                       MOVE    RECE031-TENKIYMD
                                               TO  WRK-BO-TENKIYMD
                       PERFORM 3221-BYOMEI1-OUT-SEC
                       IF      WRK-LINEBYO     <   WRK-BYOMEI-LINE 
                           MOVE    WRK-BYOMEI(49:) TO  WRK-BYOMEI1-NAME
                                                          (WRK-STCLM:)
                           MOVE    1               TO  WRK-CONTINUE
                       ELSE
                           MOVE    WRK-BYOMEI(49:) TO  WRK-BYOMEI2-NAME
                                                          (WRK-STCLM:)
                           MOVE    1               TO  WRK-CONTINUE    
                       END-IF                                   
                   END-IF    
      *        適用欄に編集
               WHEN    WRK-LINEBYO     >=  WRK-BYOMEI-LINE
                   MOVE    WRK-BYOMEI      TO  WRK-BYOMEI2-NAME
                                                          (WRK-STCLM:)
                   IF      WRK-MOJISU       >   WRK-BYOMEI2-MAX 
                       MOVE    RECE031-SRYYMD  TO  WRK-BO-SRYYMD
                       MOVE    RECE031-TENKIKBN
                                               TO  WRK-BO-TENKIKBN
                       MOVE    RECE031-TENKIYMD
                                               TO  WRK-BO-TENKIYMD
                       PERFORM  3222-BYOMEI2-OUT-SEC
                       MOVE    1               TO  WRK-CONTINUE
                       MOVE    WRK-BYOMEI(45:) TO  WRK-BYOMEI2-NAME
                                                          (WRK-STCLM:)
                   END-IF                                       
           END-EVALUATE
      *
           COMPUTE     WRK-CLM           =   WRK-MOJISU
                                         +   WRK-CLM
      *     
           MOVE    RECE031-SYUBYOFLG     TO  WRK-BO-SYUBYOFLG
           MOVE    RECE031-SRYYMD        TO  WRK-BO-SRYYMD
           MOVE    RECE031-TENKIKBN      TO  WRK-BO-TENKIKBN
           MOVE    RECE031-TENKIYMD      TO  WRK-BO-TENKIYMD
      *
           PERFORM 990-RECE031-NEXT-SEC
           .
       3210-BYOMEI-SET-EXT.
           EXIT.
      ****************************************************************
      *      主病名と副病名の区切り線の編集
      ****************************************************************
       3211-SYUBYOFLG-HENSYU-SEC         SECTION.
      *
      *    主病名編集フラグが区切り有のときのみ処理を行う
           IF      SYS-2005-SYUBYOHENFLG   =   "1" OR  "3"
      *        主病名との区切り線（副傷病名があるときのみ）     
               IF      WRK-BYO-OLD             =   LOW-VALUE
                   CONTINUE
               ELSE
                   IF    ( FLG-RECE031             =   ZERO            )
                   AND   ( RECE031-SYUBYOFLG   NOT =   WRK-BO-SYUBYOFLG)
                   AND   ( WRK-BO-SYUBYOFLG        =   "1"             )
                       IF      WRK-LINEBYO     <   WRK-BYOMEI-LINE
                           ADD     1           TO  WRK-LINEBYO
                           MOVE    WRK-KUGIRI3 TO
                                   WRK-TAIHI-BYOMEI(WRK-LINEBYO)(2:52)
                       ELSE
                           IF      WRK-LINETEK >=   WRK-TEKIYOU-LINE
                               PERFORM 34120-PAGE-SEC
                           END-IF    
                           MOVE    1           TO  FLG-KUGIRI
                           PERFORM 34110-KUGIRI-LINE-SEC
                           MOVE    ZERO        TO  FLG-KUGIRI   
                       END-IF
                   END-IF
               END-IF
           END-IF        
      *
           .
       3210-BYOMEI-SET-EXT.
           EXIT.
      ****************************************************************
      *     傷病名１出力処理
      *      WRK-CONTINUE = 1 の場合、２行編集の２行目
      ****************************************************************
       3221-BYOMEI1-OUT-SEC        SECTION.
      *
      *    傷病名欄の行カウント
           ADD     1               TO  WRK-LINEBYO
      *
           IF  WRK-CONTINUE        =   ZERO
      *        病名の項番カウント
               ADD     1                   TO  WRK-LINE
      *        項番
               INITIALIZE              ORCSKANACHKAREA
               MOVE    "2"             TO  KANACHK-SYORI 
               MOVE    "("             TO  KANACHK-MAE-INPUT (1:1)
               MOVE    WRK-LINE (2:1)  TO  KANACHK-MAE-INPUT (2:1)
               MOVE    ")"             TO  KANACHK-MAE-INPUT (3:1)
               CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
               IF      KANACHK-RC      =   ZERO
                   MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                           TO  WRK-BYOMEI1-NO 
               END-IF    
      *        診療開始日
               MOVE    WRK-BYOMEI1-NO      TO  WRK-TAIHI-SRYYMD
                                                    (WRK-LINEBYO)
               MOVE    WRK-BO-SRYYMD       TO  WRK-SYMD
               PERFORM 31012-SEIWA-HEN-SEC
               MOVE    LNK-DAY2-EDTYMD3 (5:)
                                           TO  WRK-TAIHI-SRYYMD
                                                    (WRK-LINEBYO)(7:)
      *        転帰
               MOVE    WRK-BYOMEI1-NO    TO 
                                         WRK-TAIHI-TENKI(WRK-LINEBYO)
               EVALUATE    WRK-BO-TENKIKBN
               WHEN    "1"
                   MOVE    "治ゆ"   
                                 TO  WRK-TAIHI-TENKI(WRK-LINEBYO)(7:)
               WHEN    "2"
                   MOVE    "死亡"   
                                 TO  WRK-TAIHI-TENKI(WRK-LINEBYO)(7:)
               WHEN    "3"
                   MOVE    "中止"   
                                 TO  WRK-TAIHI-TENKI(WRK-LINEBYO)(7:)
               WHEN    OTHER
                   MOVE    SPACE   
                                 TO  WRK-TAIHI-TENKI(WRK-LINEBYO)
               END-EVALUATE
      *        転帰日
               IF      WRK-BO-TENKIYMD     =   SPACE
                   CONTINUE 
               ELSE
                   MOVE    WRK-BO-TENKIYMD TO  WRK-SYMD
                   PERFORM 31012-SEIWA-HEN-SEC
                   MOVE    LNK-DAY2-EDTYMD3 (17:)
                                           TO  WRK-TAIHI-TENKIYMD
                                                    (WRK-LINEBYO)
               END-IF                                     
           END-IF
      *    病名
           MOVE    WRK-BYOMEI1     TO  WRK-TAIHI-BYOMEI(WRK-LINEBYO)
      *
      *    クリア
           MOVE    SPACE           TO  WRK-BYOMEI1
           MOVE    ZERO            TO  WRK-CLM
           MOVE    ZERO            TO  WRK-CONTINUE
      *
           .
       3221-BYOMEI1-OUT-EXT.
           EXIT.
      ****************************************************************
      *     傷病名２出力処理
      *      WRK-CONTINUE = 0 の場合、２行編集の１行目
      ****************************************************************
       3222-BYOMEI2-OUT-SEC        SECTION.
      *
      *    適用欄の行カウント
           IF      WRK-LINETEK     >=   WRK-TEKIYOU-LINE
               PERFORM 34120-PAGE-SEC
           END-IF    
           ADD     1               TO  WRK-LINETEK
      
      *
           IF  WRK-CONTINUE        =   ZERO
      *        病名の項番カウント
               ADD     1                   TO  WRK-LINE
      *        項番
               INITIALIZE              ORCSKANACHKAREA
               MOVE    "2"             TO  KANACHK-SYORI 
               IF  WRK-LINE            <   10
                   MOVE    "("             TO  KANACHK-MAE-INPUT (1:1)
                   MOVE    WRK-LINE (2:1)  TO  KANACHK-MAE-INPUT (2:1)
                   MOVE    ")"             TO  KANACHK-MAE-INPUT (3:1)
               ELSE    
                   MOVE    "("             TO  KANACHK-MAE-INPUT (1:1)
                   MOVE    WRK-LINE (1:2)  TO  KANACHK-MAE-INPUT (2:2)
                   MOVE    ")"             TO  KANACHK-MAE-INPUT (4:1)
               END-IF
               CALL    "ORCSKANACHK"   USING   ORCSKANACHKAREA
               IF      KANACHK-RC      =   ZERO
                   MOVE    KANACHK-OUT-INPUT(1:KANACHK-MAX)
                                           TO  WRK-BYOMEI2-NO 
               END-IF    
           END-IF    
      *
      *    診療開始日・転帰を印字するスペースが有る場合
           IF      SYS-2005-TENKIHENKBN    =   ZERO
               IF  WRK-BYOMEI2-ELSE    =   SPACE
      *            診療年月日・転帰　編集処理
                   PERFORM 32221-SRYYMD-TENKI-HEN-SEC
                   MOVE    ZERO            TO  FLG-TENKI
               END-IF
           ELSE
               IF  WRK-BYOMEI2R-ELSE   =   SPACE
      *            診療年月日・転帰　編集処理
                   PERFORM 32221-SRYYMD-TENKI-HEN-SEC
                   MOVE    ZERO            TO  FLG-TENKI
               END-IF
           END-IF    
      *
           INSPECT WRK-BYOMEI2
                           REPLACING    ALL   "  "   BY   "　"
           MOVE    WRK-BYOMEI2 TO  WRK-TAIHI-TEKIYO (WRK-LINETEK)
      *
      *    最後の病名に印字するスペースがなかったとき 
           IF       FLG-TENKI              =   1     
      *        診療年月日・転帰　編集処理
               MOVE    SPACE           TO  WRK-BYOMEI2
               PERFORM 32221-SRYYMD-TENKI-HEN-SEC
      *        適用欄の行カウント
               IF      WRK-LINETEK     >=   WRK-TEKIYOU-LINE
                   PERFORM 34120-PAGE-SEC
               END-IF    
               ADD     1               TO  WRK-LINETEK
               INSPECT WRK-BYOMEI2
                           REPLACING    ALL   "  "   BY   "　"
               MOVE    WRK-BYOMEI2 TO  WRK-TAIHI-TEKIYO
                                                 (WRK-LINETEK)

           END-IF
      *
      *
      *    クリア
           MOVE    SPACE           TO  WRK-BYOMEI2
           MOVE    ZERO            TO  WRK-CLM
           MOVE    ZERO            TO  WRK-CONTINUE
      *
           .
       3222-BYOMEI2-OUT-EXT.
           EXIT.
      *****************************************************************
      *    診療年月日・転帰　編集処理
      *****************************************************************
       32221-SRYYMD-TENKI-HEN-SEC    SECTION.
      *
      *    転帰日を編集しないとき
           IF      SYS-2005-TENKIHENKBN    =   ZERO
      *        診療開始日
               MOVE    WRK-BO-SRYYMD       TO  WRK-SYMD
               PERFORM 31012-SEIWA-HEN-SEC
               MOVE    LNK-DAY2-EDTYMD3 (5:)
                                           TO  WRK-BYOMEI2-YMD
      *        転帰
               EVALUATE    WRK-BO-TENKIKBN
               WHEN    "1"
                   MOVE    "治ゆ"          TO  WRK-BYOMEI2-TENKI
               WHEN    "2"
                   MOVE    "死亡"          TO  WRK-BYOMEI2-TENKI
               WHEN    "3"
                   MOVE    "中止"          TO  WRK-BYOMEI2-TENKI
               WHEN    OTHER
                   MOVE    SPACE           TO  WRK-BYOMEI2-TENKI
               END-EVALUATE
           ELSE
      *        診療開始日
               MOVE    WRK-BO-SRYYMD       TO  WRK-SYMD
               PERFORM 31012-SEIWA-HEN-SEC
               MOVE    LNK-DAY2-EDTYMD3 (5:)
                                           TO  WRK-BYOMEI2R-YMD
      *        転帰
               EVALUATE    WRK-BO-TENKIKBN
               WHEN    "1"
                   MOVE    "治ゆ"          TO  WRK-BYOMEI2R-TENKI
               WHEN    "2"
                   MOVE    "死亡"          TO  WRK-BYOMEI2R-TENKI
               WHEN    "3"
                   MOVE    "中止"          TO  WRK-BYOMEI2R-TENKI
               WHEN    OTHER
                   MOVE    SPACE           TO  WRK-BYOMEI2R-TENKI
               END-EVALUATE
      *        転帰日
               IF      WRK-BO-TENKIYMD     =   SPACE
                   CONTINUE 
               ELSE
                   MOVE    WRK-BO-TENKIYMD     TO  WRK-SYMD
                   PERFORM 31012-SEIWA-HEN-SEC
                   MOVE    LNK-DAY2-EDTYMD3 (17:)
                                               TO  WRK-BYOMEI2R-TENKIYMD
               END-IF                                
           END-IF                                     
      *
           .
       32221-SRYYMD-TENKI-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<点数>処理(外来)
      *****************************************************************
       330-HC101-TENSU-HEN-SEC      SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    負担無しの２８１も印字
      *---(01.00.05) LINE ADD START ------------------------------------
      *    負担無しの２８１の場合は初診等の回数点数を印字しない
      *     IF  MF100-KOHNUM  NOT =  "281"
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD END   ------------------------------------
           EVALUATE  MF100-SHOSHINTIME
               WHEN  "1"
                     MOVE  "（時間外）"   TO  HC06-SHOSHINTIME
               WHEN  "2"
                     MOVE  "（深夜）"     TO  HC06-SHOSHINTIME
               WHEN  "3"
                     MOVE  "（休日）"     TO  HC06-SHOSHINTIME
               WHEN  "4"
                     MOVE  "時外・深夜"   TO  HC06-SHOSHINTIME
               WHEN  "5"
                     MOVE  "時外・休日"   TO  HC06-SHOSHINTIME
               WHEN  "6"
                     MOVE  "休日・深夜"   TO  HC06-SHOSHINTIME
               WHEN  "7"
                     MOVE  "外・休・深"   TO  HC06-SHOSHINTIME
           END-EVALUATE
      *
      *---(01.00.12) LINE ADD START ------------------------------------
      *    初診、指導、在宅のみ印字　→　印字しないへ変更
      *     PERFORM  VARYING  IDX  FROM  1  BY  1
      *              UNTIL    IDX  >     13
      *       IF    IDX =  1  OR 8 OR 9 OR 10
      *         MOVE  MF100-KAISU(IDX)    TO  WRK-KAISUZ
      *         MOVE  WRK-KAISUZ          TO  HC06-KAISU(IDX)
      *         MOVE  MF100-TENSU(IDX 1)  TO  WRK-TENSUZ
      *         MOVE  WRK-TENSU           TO  HC06-TENSU(IDX)
      *       END-IF
      *     END-PERFORM
      *
      **    指導は小児科外来診察料の初診点数のみを設定する
      *     MOVE    ZERO         TO       WRK-SIDOU
      *     PERFORM  VARYING  IDX  FROM  1  BY  1
      *              UNTIL    IDX  >     2
      *       INITIALIZE                       SRYACT-REC
      **---(01.00.09) LINE ADD START ------------------------------------
      **       MOVE    MF100-HOSPID       TO  SRY-HOSPID
      *       MOVE    MF100-HOSPNUM      TO  SRY-HOSPNUM
      **---(01.00.09) LINE ADD END   ------------------------------------
      *       MOVE    MF100-NYUGAIKBN    TO  SRY-NYUGAIKBN
      *       MOVE    MF100-PTID         TO  SRY-PTID
      *       MOVE    MF100-SRYYM        TO  SRY-SRYYM
      *    小児科外来診察料の初診コード設定
      *       IF    IDX  =  1
      *         MOVE    "113003510"         TO  SRY-SRYCD(1)
      *                                         SRY-SRYCD(2)
      *                                         SRY-SRYCD(3)
      *                                         SRY-SRYCD(4)
      *                                         SRY-SRYCD(5)
      *       ELSE
      *         MOVE    "113003710"         TO  SRY-SRYCD(1)
      *                                         SRY-SRYCD(2)
      *                                         SRY-SRYCD(3)
      *                                         SRY-SRYCD(4)
      *                                         SRY-SRYCD(5)
      *       END-IF
      *       PERFORM  900-SRYACT-SELECT-SEC
      *       PERFORM  UNTIL  FLG-SRYACT  =  1
      *         PERFORM  900-SRYACCT-READ-SEC
      **---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    ACCT-HOSPID         TO  WRK-HOSPID
      *         MOVE    ACCT-HOSPNUM        TO  WRK-HOSPNUM
      **---(01.00.09) LINE ADD END   ------------------------------------
      *         MOVE    ACCT-PTID           TO  WRK-PTID
      *         MOVE    ACCT-HKNCOMBI       TO  WRK-HKNCOMBI
      *         PERFORM 910-HKNCOMBI-READ-SEC
      *         IF      MF100-KOHID     =   COMB-KOHID(1)   OR
      *                                     COMB-KOHID(2)   OR
      *                                     COMB-KOHID(3)   OR
      *                                     COMB-KOHID(4)
      *           COMPUTE  WRK-SIDOU  =  WRK-SIDOU +
      *                    (ACCT-ZAITEN  *  ACCT-ZAIKAISU)
      *         END-IF
      *         PERFORM  900-SRYACT-FETCH-SEC
      *       END-PERFORM
      *       PERFORM  900-SRYACT-CLOSE-SEC
      *     END-PERFORM
      *     MOVE    WRK-SIDOU    TO    WRK-TENSUZ
      *     MOVE    WRK-TENSUZ   TO    HC06-TENSU(7)
      *---(01.00.12) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD START ------------------------------------
      *---(01.00.05) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *=== 180,181,191は初診料等を印字 by Yoshikawa(2008/11/21) start
           IF  MF100-KOHNUM  = "180" OR "181" OR "190"
      *      初診、指導、在宅のみ印字
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL    IDX  >     13
      *=== 医学管理、在宅を印字 by Yoshikawa(2008/12/11) start
      *         IF    IDX =  1  OR 8 OR 9 OR 10
               IF    IDX  =  1 OR 7 OR 8 OR 9 OR 10 OR 11 OR 12 OR 13
      *=== 医学管理、在宅を印字 by Yoshikawa(2008/12/11) end
                 MOVE  MF100-KAISU(IDX)    TO  WRK-KAISUZ
                 MOVE  WRK-KAISUZ          TO  HC06-KAISU(IDX)
                 MOVE  MF100-TENSU(IDX 1)  TO  WRK-TENSUZ
                 MOVE  WRK-TENSU           TO  HC06-TENSU(IDX)
               END-IF
             END-PERFORM
      *
      *=== 医学管理、在宅を印字 by Yoshikawa(2008/12/11) start
      **      指導は小児科外来診察料の初診点数のみを設定する
      *       MOVE    ZERO         TO       WRK-SIDOU
      *       PERFORM  VARYING  IDX  FROM  1  BY  1
      *                UNTIL    IDX  >     2
      *         INITIALIZE                       SRYACT-REC
      *         MOVE    MF100-HOSPNUM      TO  SRY-HOSPNUM
      *         MOVE    MF100-NYUGAIKBN    TO  SRY-NYUGAIKBN
      *         MOVE    MF100-PTID         TO  SRY-PTID
      *         MOVE    MF100-SRYYM        TO  SRY-SRYYM
      **      小児科外来診察料の初診コード設定
      *         IF    IDX  =  1
      *           MOVE    "113003510"         TO  SRY-SRYCD(1)
      *                                           SRY-SRYCD(2)
      *                                           SRY-SRYCD(3)
      *                                           SRY-SRYCD(4)
      *                                           SRY-SRYCD(5)
      *         ELSE
      *           MOVE    "113003710"         TO  SRY-SRYCD(1)
      *                                           SRY-SRYCD(2)
      *                                           SRY-SRYCD(3)
      *                                           SRY-SRYCD(4)
      *                                           SRY-SRYCD(5)
      *         END-IF
      *         PERFORM  900-SRYACT-SELECT-SEC
      *         PERFORM  UNTIL  FLG-SRYACT  =  1
      *           PERFORM  900-SRYACCT-READ-SEC
      *           MOVE    ACCT-HOSPNUM        TO  WRK-HOSPNUM
      *           MOVE    ACCT-PTID           TO  WRK-PTID
      *           MOVE    ACCT-HKNCOMBI       TO  WRK-HKNCOMBI
      *           PERFORM 910-HKNCOMBI-READ-SEC
      *           IF      MF100-KOHID     =   COMB-KOHID(1)   OR
      *                                       COMB-KOHID(2)   OR
      *                                       COMB-KOHID(3)   OR
      *                                       COMB-KOHID(4)
      *             COMPUTE  WRK-SIDOU  =  WRK-SIDOU +
      *                      (ACCT-ZAITEN  *  ACCT-ZAIKAISU)
      *           END-IF
      *           PERFORM  900-SRYACT-FETCH-SEC
      *         END-PERFORM
      *         PERFORM  900-SRYACT-CLOSE-SEC
      *       END-PERFORM
      *       MOVE    WRK-SIDOU    TO    WRK-TENSUZ
      *       MOVE    WRK-TENSUZ   TO    HC06-TENSU(7)
      *=== 医学管理、在宅を印字 by Yoshikawa(2008/12/11) end
           END-IF
      *=== 180,181,191は初診料等を印字 by Yoshikawa(2008/11/21) end
      *
      *        <請求点・一部負担金>
      *   保険
          MOVE    MF100-TOTALTEN      TO  WRK-KGK6
          MOVE    WRK-KGK6            TO  HC06-TOTALTEN(1)
          IF      MF100-FTNMONEY       >   ZERO
              MOVE    MF100-FTNMONEY         TO  WRK-KGK7
              MOVE    WRK-KGK7               TO  HC06-FTNMONEY(1)
          END-IF
          IF      MF100-ZAITAKU-SAIKEI   >   ZERO
              MOVE    "("                    TO  HC06-FTNMONEYSAI(1:1)
              MOVE   MF100-ZAITAKU-SAIKEI    TO  WRK-KGK7
              MOVE   WRK-KGK7                TO  HC06-FTNMONEYSAI(3:8)
              MOVE    ")"                    TO  HC06-FTNMONEYSAI(11:1)
          END-IF    
      *
           .
       330-HC101-TENSU-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<点数>処理(入院)
      *****************************************************************
       330N-HC101-TENSU-HEN-SEC      SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    負担無しの２８１も印字
      *---(01.00.05) LINE ADD START ------------------------------------
      *    負担無しの２８１の場合は初診等の回数点数等を印字しない
      *     IF  MF100-KOHNUM  NOT =  "281"
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD END   ------------------------------------
           EVALUATE  MF100-SHOSHINTIME
               WHEN  "1"
                     MOVE  "（時間外）"   TO  HCN06-SHOSHINTIME
               WHEN  "2"
                     MOVE  "（深夜）"     TO  HCN06-SHOSHINTIME
               WHEN  "3"
                     MOVE  "（休日）"     TO  HCN06-SHOSHINTIME
               WHEN  "4"
                     MOVE  "時外・深夜"   TO  HCN06-SHOSHINTIME
               WHEN  "5"
                     MOVE  "時外・休日"   TO  HCN06-SHOSHINTIME
               WHEN  "6"
                     MOVE  "休日・深夜"   TO  HCN06-SHOSHINTIME
               WHEN  "7"
                     MOVE  "外・休・深"   TO  HCN06-SHOSHINTIME
           END-EVALUATE
      *
      *---(01.00.12) LINE ADD START ------------------------------------
      *    初診のみ印字　→　印字しない
      *     MOVE    MF100-KAISU(1)      TO  WRK-KAISUZ
      *     MOVE    WRK-KAISUZ          TO  HCN06-KAISU(1)
      *     MOVE    MF100-TENSU(1 1)    TO  WRK-TENSUZ
      *     MOVE    WRK-TENSU           TO  HCN06-TENSU(1)
      *---(01.00.12) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD START ------------------------------------
      *---(01.00.05) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD END   ------------------------------------
      *=== 180,181,191は初診料等を印字 by Yoshikawa(2008/11/21) start
           IF  MF100-KOHNUM  =  "180" OR "181" OR "190"
      *=== 医学管理、在宅を印字 by Yoshikawa(2008/12/11) start
      **      初診のみ印字
      *       MOVE    MF100-KAISU(1)      TO  WRK-KAISUZ
      *       MOVE    WRK-KAISUZ          TO  HCN06-KAISU(1)
      *       MOVE    MF100-TENSU(1 1)    TO  WRK-TENSUZ
      *       MOVE    WRK-TENSU           TO  HCN06-TENSU(1)
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL    IDX  >     3
      *        初診、医学管理、在宅を印字
               MOVE  MF100-KAISU(IDX)    TO  WRK-KAISUZ
               MOVE  WRK-KAISUZ          TO  HCN06-KAISU(IDX)
               MOVE  MF100-TENSU(IDX 1)  TO  WRK-TENSUZ
               MOVE  WRK-TENSU           TO  HCN06-TENSU(IDX)
             END-PERFORM
           END-IF
      *=== 医学管理、在宅を印字 by Yoshikawa(2008/12/11) end
      *=== 180,181,191は初診料等を印字 by Yoshikawa(2008/11/21) end
      *
      *        <請求点・一部負担金>
      *    保険
           MOVE    MF100-TOTALTEN      TO  WRK-KGK6
           MOVE    WRK-KGK6            TO  HCN06-TOTALTEN(1)
           IF      MF100-FTNMONEY      >   ZERO
               MOVE    MF100-FTNMONEY  TO  WRK-KGK7
               MOVE    WRK-KGK7        TO  HCN06-FTNMONEY(1)
           END-IF
      *
      *    食事療養費：日数
           MOVE    MF100-SHOKUJINISSU  TO  WRK-Z2
           MOVE    WRK-Z2              TO  HCN06-SYONISSU(1)
      *
      *    食事療養費：金額
           MOVE    MF100-SHOKUJIRYOYOHI
                                       TO  WRK-KGK6
           MOVE    WRK-KGK6            TO  HCN06-SYOTOTALTEN(1)
      *
      *    食事療養費：標準負担額
           MOVE    MF100-SHOKUJIFTN    TO  WRK-KGK7
           MOVE    WRK-KGK7            TO  HCN06-SYOFTNMONEY(1)
      *
           .
       330N-HC101-TENSU-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    区切り線　編集処理
      *****************************************************************
       34110-KUGIRI-LINE-SEC       SECTION.
      *
           ADD     1               TO  WRK-LINETEK
      *
           EVALUATE    FLG-KUGIRI
           WHEN    1
               MOVE    WRK-KUGIRI1 TO  WRK-TAIHI-TEKIYO  (WRK-LINETEK)
           END-EVALUATE
      *
           .
       34110-KUGIRI-LINE-EXT.
           EXIT.
      *
      ******************************************************************
      **    改ページ処理
      ******************************************************************
       34120-PAGE-SEC       SECTION.
      *
      *    ワークエリアに退避した病名情報を設定
           PERFORM 3201-TAIHI-SET-SEC
      *
      *    帳票印刷処理
           PERFORM 390-PRINT-OUT-SEC
      *    帳票編集<ヘッダー部>処理
           ADD     1               TO  CNT-PAGE
           IF      MF100-NYUGAIKBN =   "1"
               PERFORM 310-HC101-HEAD-HEN-SEC
      *
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) start
      *        ２頁以降は空白とする
               INITIALIZE  HCN06-CST-FTNJANUM
               INITIALIZE  HCN06-CST-JKYSNUM
               INITIALIZE  HCN06-CST-KYUFUGAI
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) end
      *
           ELSE
               PERFORM 310N-HC101-HEAD-HEN-SEC
      *
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) start
      *        ２頁以降は空白とする
               INITIALIZE  HC06-CST-FTNJANUM
               INITIALIZE  HC06-CST-JKYSNUM
               INITIALIZE  HC06-CST-KYUFUGAI
      *=== 下部の負担者番号等は１枚目に印字 by Monma(2018/01/09) end
      *
           END-IF
           INITIALIZE  WRK-BYOMEI-TAIHI-TBL
           MOVE    ZERO          TO  WRK-LINETEK
      *
           .
       34120-PAGE-EXT.
           EXIT.
      **
      *****************************************************************
      *    帳票編集<福岡県仕様>処理(外来)
      *****************************************************************
       380-HC101-CUSTOM-HEN-SEC      SECTION.
      *
      *    帳票下部に負担者番号、受給者番号、給付外点数を記載
           MOVE    MF100-KOHFTNJANUM   TO  HC06-CST-FTNJANUM
           MOVE    MF100-KOHJKYSNUM    TO  HC06-CST-JKYSNUM
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    MF100-KYUFUGAITEN   TO  WRK-CSTTENSUX
      *     MOVE    WRK-CSTTENSUX       TO  HC06-CST-KYUFUGAI
      *---(01.00.08) LINE ADD START ------------------------------------
      *---(01.00.07) LINE ADD START ------------------------------------
      **    負担無の２８１は印字しない
      **     IF  MF100-KOHNUM  NOT =  "281"
      *---(01.00.07) LINE ADD END   ------------------------------------
      *       MOVE    MF100-KYUFUGAITEN   TO  WRK-CSTTENSUX
      *       MOVE    WRK-CSTTENSUX       TO  HC06-CST-KYUFUGAI
      *---(01.00.07) LINE ADD START ------------------------------------
      **     END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *    負担無の２８１、２９０は０記載
           IF  MF100-KOHNUM  =  "281"  OR  "290"
             MOVE    ZERO                TO  WRK-CSTTENSUX
             MOVE    WRK-CSTTENSUX       TO  HC06-CST-KYUFUGAI
           ELSE
             MOVE    MF100-KYUFUGAITEN   TO  WRK-CSTTENSUX
             MOVE    WRK-CSTTENSUX       TO  HC06-CST-KYUFUGAI
           END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
      *---(01.00.05) LINE ADD START ------------------------------------
      *
           .
       380-HC101-CUSTOM-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<福岡県仕様>処理(外来)
      *****************************************************************
       380N-HC101-CUSTOM-HEN-SEC      SECTION.
      *
      *    帳票下部に負担者番号、受給者番号、給付外点数を記載
           MOVE    MF100-KOHFTNJANUM   TO  HCN06-CST-FTNJANUM
           MOVE    MF100-KOHJKYSNUM    TO  HCN06-CST-JKYSNUM
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    MF100-KYUFUGAITEN   TO  WRK-CSTTENSUX
      *     MOVE    WRK-CSTTENSUX       TO  HCN06-CST-KYUFUGAI
      *---(01.00.08) LINE ADD START ------------------------------------
      *---(01.00.07) LINE ADD START ------------------------------------
      **    負担無の２８１は印字しない
      **     IF  MF100-KOHNUM  NOT =  "281"
      *---(01.00.07) LINE ADD END   ------------------------------------
      *       MOVE    MF100-KYUFUGAITEN   TO  WRK-CSTTENSUX
      *       MOVE    WRK-CSTTENSUX       TO  HCN06-CST-KYUFUGAI
      *---(01.00.07) LINE ADD START ------------------------------------
      **     END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *    負担無の２８１、２９０は０記載
           IF  MF100-KOHNUM  =  "281"  OR  "290"
             MOVE    ZERO                TO  WRK-CSTTENSUX
             MOVE    WRK-CSTTENSUX       TO  HCN06-CST-KYUFUGAI
           ELSE
             MOVE    MF100-KYUFUGAITEN   TO  WRK-CSTTENSUX
             MOVE    WRK-CSTTENSUX       TO  HCN06-CST-KYUFUGAI
           END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
      *---(01.00.05) LINE ADD START ------------------------------------
      *
           .
       380N-HC101-CUSTOM-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       390-PRINT-OUT-SEC                SECTION.
      *
           ADD     1                    TO  WRK-PAGE
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) start
                                            WRK-RENNUM
      *=== 通し番号を印字 by Yoshikawa(2015/05/14) end
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
           MOVE    "複写式レセ"        TO  SPRT-TITLE
           IF      MF100-NYUGAIKBN     =   "1"
               MOVE   "SC4008.red"     TO  SPRT-PRTID
               MOVE    HCN06           TO  SPRT-PRTDATA
           ELSE
               MOVE   "SC4007.red"     TO  SPRT-PRTID
               MOVE    HC06            TO  SPRT-PRTDATA
           END-IF
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           MOVE    MF100-PTID          TO  SPRT-PTID
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
               MOVE    "帳票ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *
      *
           .
       390-PRINT-OUT-EXT.
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
      *     MOVE    LNK-DAY2-EDTYMD3    TO  WRK-HENYMDG
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    西暦→和暦日付編集
      *****************************************************************
       31012-SE-WA-YMDEDIT-SEC        SECTION.
      *
           MOVE    SPACE               TO  STS-AREA-DAY
           INITIALIZE                      STS-AREA-DAY
           MOVE    SPACE               TO  LNK-DAY1-AREA
           MOVE    "11"                TO  LNK-DAY1-IRAI
           MOVE    WRK-SYMD            TO  LNK-DAY1-YMD
           CALL    "ORCSDAY"   USING   STS-AREA-DAY  LNK-DAY1-AREA
           IF  STS-DAY-RC1             =   ZERO
               MOVE    LNK-DAY1-YMD        TO  WRK-SYMD
           ELSE
               MOVE    SPACE               TO  WRK-SYMD
           END-IF
           .
       31012-SE-WA-YMDEDIT-EXT.
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
      *    終了　　処理
      *****************************************************************
       300-END-SEC                 SECTION.
      *
           CLOSE                       RECE031-FILE
      *
           MOVE  WRK-PAGE  TO  WRK-PARA-PAGE
           DISPLAY "*** SEIKYU4007 IN   "  CNT-RECE02
           DISPLAY "*** SEIKYU4007 OUT  "  CNT-OUT
           DISPLAY "*** SEIKYU4007 END ***"
      *
      *
      *    ステップ管理終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           PERFORM 900-DBDISCONNECT-SEC
      *
           .
       300-END-EXT.
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
      *    公費請求書マスタ読込 SELECT
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
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
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
      *    公費請求書マスタ FETCH
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE02-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM(1)  = "180" OR "181" OR "190" OR
      *             RECE02-KOHNUM(2)  = "180" OR "181" OR "190" OR
      *             RECE02-KOHNUM(3)  = "180" OR "181" OR "190" OR
      *             RECE02-KOHNUM(4)  = "180" OR "181" OR "190"
      *---(01.00.07) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM(1)  = "180" OR "181" OR "190" OR "281"
      *         OR  RECE02-KOHNUM(2)  = "180" OR "181" OR "190" OR "281"
      *         OR  RECE02-KOHNUM(3)  = "180" OR "181" OR "190" OR "281"
      *         OR  RECE02-KOHNUM(4)  = "180" OR "181" OR "190" OR "281"
      *---(01.00.12) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM(1)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290"
      *         OR  RECE02-KOHNUM(2)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290"
      *         OR  RECE02-KOHNUM(3)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290"
      *         OR  RECE02-KOHNUM(4)  = "180" OR "181" OR "190" OR "281"
      *                              OR "290"
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
      *---(01.00.12) LINE ADD END   ------------------------------------
      *---(01.00.07) LINE ADD END   ------------------------------------
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) start
                   IF      WRK-PARA-STSRYYM    =   "999999"
                       CONTINUE
                   ELSE
                       IF  ( RECE02-SRYYM      <   WRK-PARA-STSRYYM )
                       OR  ( RECE02-SRYYM      >   WRK-PARA-EDSRYYM )
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/03/14) end
      *
      *****国保は県外国保組合のみ対象（県内扱い保険者は含まない）
      *    国保は印字対象外
                   IF      RECE02-TEISYUTUSAKI =   "2"
      *---(01.00.04) LINE ADD START ------------------------------------
      *                 IF      RECE02-HKNNUM   =   "060"
      *                     MOVE    RECE02-HKNJANUM(1:6)
      *                                         TO  WRK-HKNJANUM(1:6)
      *                 ELSE
      *                     MOVE    RECE02-HKNJANUM(3:6)
      *                                         TO  WRK-HKNJANUM(1:6)
      *                 END-IF
      *                 IF      WRK-HKNJANUM(1:2)   =  "40"
      *                     DISPLAY "県内国保 対象外=" RECE02-PTNUM
      *                              "保険者番号="      RECE02-HKNJANUM
      *                     GO    TO    900-KOHSKY-READ-SEC
      *---(01.00.03) LINE ADD START ------------------------------------
      *                 ELSE
      *                    県内扱いは対象外
      *                     PERFORM  9001-KENNAI-CHK-SEC
      *                     IF  RECE10-PREFKBN  =  "1"
      *                       GO  TO  900-KOHSKY-READ-SEC
      *                     END-IF
      *                    国保組合かどうか
      *                     IF  RECE02-HKNJANUM(3:1)  NOT =  "3"
      *                       DISPLAY "県内国保 対象外=" RECE02-PTNUM
      *                               "保険者番号="      RECE02-HKNJANUM
      *                       GO  TO  900-KOHSKY-READ-SEC
      *                     END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *                 END-IF
                     GO  TO  900-KOHSKY-READ-SEC
      *---(01.00.04) LINE ADD START ------------------------------------
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
               MOVE    1                   TO  FLG-END
               PERFORM  900-KOHSKY-CLOSE-SEC
           END-IF
      *
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    県内扱い保険者チェック処理
      *****************************************************************
       9001-KENNAI-CHK-SEC         SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                     RECE10-REC
      *
      *=== primary key変更対応 by Yoshikawa(2013/01/17) start
      **---(01.00.09) LINE ADD START ------------------------------------
      **     MOVE  RECE02-HOSPID        TO  RECE10-HOSPID
      *     MOVE  SPA-HOSPNUM          TO  RECE10-HOSPNUM
      **---(01.00.09) LINE ADD END   ------------------------------------
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
      *=== primary key変更対応 by Yoshikawa(2013/01/17) end
      *
           MOVE  RECE10-REC           TO  MCPDATA-REC
           MOVE  "DBSELECT"           TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *     CALL  "MCPSUB"                 USING
      *                                    MCPAREA
      *                                    MCPDATA-REC
           MOVE    "tbl_seikyu"       TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC             =   ZERO
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-SEIKYU
           END-IF
      *
           .
       9001-KENNAI-CHK-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求マスター読込
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *     MOVE  "DBFETCH"            TO  MCP-FUNC
      *     CALL  "MCPSUB"                 USING
      *                                    MCPAREA
      *                                    MCPDATA-REC
           MOVE    "DBFETCH"          TO  MCP-FUNC
           MOVE    "tbl_seikyu"       TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC             =   ZERO
               MOVE    MCPDATA-REC    TO  RECE10-REC
      *
           ELSE
               MOVE    1              TO  FLG-SEIKYU
           END-IF
      *
      *    クローズ
           MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *     CALL  "MCPSUB"                 USING
      *                                    MCPAREA
      *                                    MCPDATA-REC
           MOVE    "tbl_seikyu"       TO  MCP-TABLE
           MOVE    "key"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタ CLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           .
       900-KOHSKY-CLOSE-EXT.
           EXIT.
      ****************************************************************
      *    レセプト０３１データ読み
      ****************************************************************
       990-RECE031-NEXT-SEC           SECTION.
      *
           READ    RECE031-FILE      NEXT
               AT  END
                   MOVE    1         TO  FLG-RECE031
               NOT AT  END
                   MOVE    ZERO      TO  FLG-RECE031
      *---(01.00.07) LINE ADD START ------------------------------------
      *    保険者が同一かどうか
                   IF  RECE031-HKNJANUM  NOT =  MF100-HKNJANUM
                       GO  TO  990-RECE031-NEXT-SEC
                   END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
                   IF      RECE031-TENKIKBN     =   "8"
                       GO  TO  990-RECE031-NEXT-SEC
                   END-IF
           END-READ
      *
           .
       990-RECE031-NEXT-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険組合せマスター読み込み
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                         HKNCOMBI-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    WRK-HOSPID                 TO  COMB-HOSPID
           MOVE    WRK-HOSPNUM                TO  COMB-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    WRK-PTID                   TO  COMB-PTID
           MOVE    WRK-HKNCOMBI               TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_hkncombi"             TO  MCP-TABLE
           MOVE    "key"                      TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
               MOVE    "tbl_hkncombi"        TO  MCP-TABLE
               MOVE    "key"                 TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"           USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_hkncombi"        TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *  収納情報セット
      *****************************************************************
       920-SYUNOU-SET-SEC  SECTION.
      *
             INITIALIZE  SYUNOU-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *       MOVE  MF100-HOSPID       TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
             MOVE  MF100-NYUGAIKBN    TO  SYU-NYUGAIKBN
             MOVE  MF100-PTID         TO  SYU-PTID
             MOVE  MF100-SRYYM(1:6)   TO  SYU-SRYYMD(1:6)
             MOVE  "__"               TO  SYU-SRYYMD(7:2)
             MOVE  WRK-KOHNUM         TO  SYU-KOH-HKNNUM(1)
                                          SYU-KOH-HKNNUM(2)
                                          SYU-KOH-HKNNUM(3)
                                          SYU-KOH-HKNNUM(4)
             MOVE  SYUNOU-REC          TO  MCPDATA-REC
             MOVE  "DBSELECT"          TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH            TO  MCP-PATH
      *       CALL  "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH         TO  MCP-PATH
               MOVE  "tbl_syunou"       TO  MCP-TABLE
               MOVE  WRK-PATH           TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *               MOVE    SYU-HOSPID      TO  WRK-HOSPID
                     MOVE    SYU-HOSPNUM     TO  WRK-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
                     MOVE    SYU-PTID        TO  WRK-PTID
                     MOVE    SYU-HKNCOMBINUM TO  WRK-HKNCOMBI
                     PERFORM  910-HKNCOMBI-READ-SEC
                     IF  COMB-KOHID(1)    =  WRK-KOHID   OR
                         COMB-KOHID(2)    =  WRK-KOHID   OR
                         COMB-KOHID(3)    =  WRK-KOHID   OR
                         COMB-KOHID(4)    =  WRK-KOHID
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
      *                  公費の助成があるかどうかチェック
      *=== FLG-ERR初期化位置修正 by Yoshikawa(2008/11/21) start
      *                   MOVE     1      TO  FLG-ERR
      *=== FLG-ERR初期化位置修正 by Yoshikawa(2008/11/21) end
                         PERFORM  800-SEIKYU-SEC
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
                         ADD    SYU-KYUFUGAI-TEN(6)    TO
                                WRK-KYUFUGAI
                         ADD    SYU-KYUFUGAI-SIDOU-TEN TO
                                WRK-SIDOU
                         DISPLAY "給付外点数加算=" SYU-KYUFUGAI-TEN(6)
                                 "診療日=" SYU-SRYYMD
                         IF      RECE02-RJNHKNNUM    NOT = SPACE
                             ADD SYU-KOH-COMPFTN(1)  TO  WRK-FTNMONEY-G
                         ELSE
                             ADD SYU-SYUCOMPFTN      TO  WRK-FTNMONEY-G
                         END-IF
                     END-IF
                   END-IF
                 END-IF
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH       TO  MCP-PATH
                 MOVE  "tbl_syunou"       TO  MCP-TABLE
                 MOVE  WRK-PATH           TO  MCP-PATHNAME
      *---(01.00.09) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"              USING
      *                                   MCPAREA
      *                                   MCPDATA-REC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"        USING
      *                           MCPAREA
      *                           MCPDATA-REC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) start
      *****************************************************************
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
           MOVE    ZERO                TO     WRK-TYOKIFTNGK
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     4  OR
                    SYU-KOH-HKNNUM(IDX3)  =  SPACE
      *    計算負担金に差が有る場合、地方公費の助成があったと判定する
             IF   SYU-KOH-HKNNUM(IDX3)     =  WRK-KOHNUM
               IF     IDX3                 =  1
                 IF  SYU-SYUCOMPFTN-ENTANI
                                       > SYU-KOH-COMPFTN-ENTANI(IDX3)
                   MOVE  ZERO          TO  FLG-ERR
                 END-IF
               ELSE
                 IF  SYU-KOH-COMPFTN-ENTANI(IDX3 - 1)
                                      >  SYU-KOH-COMPFTN-ENTANI(IDX3)
                   MOVE  ZERO          TO  FLG-ERR
                 END-IF
               END-IF
             END-IF
      *
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
             IF    SYU-KOH-HKNNUM(IDX3)   =   "972"
               MOVE    1                      TO  FLG-TYOKI
               MOVE    SYU-KOH-COMPFTN(IDX3)  TO  WRK-TYOKIFTNGK
             END-IF
      *
             IF    SYU-KOH-HKNNUM(IDX3)   =   "974"
               MOVE    2                      TO  FLG-TYOKI
               MOVE    SYU-KOH-COMPFTN(IDX3)  TO  WRK-TYOKIFTNGK
             END-IF
             
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *
           END-PERFORM
      *    
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) start
           ADD    WRK-TYOKIFTNGK             TO  WRK-TYOKIFTNGK-G
      *=== 長期の特記事項の印字修正 by hagino(2014/09/12) end
      *
           .
       800-SEIKYU-SEC-EXT.
           EXIT.
      *
      *=== 公費の助成なしは印字対象外 by Yoshikawa(2008/11/05) end
      *****************************************************************
      *    管理マスタ読み込み
      *****************************************************************
       800-SYSKANRI-READ-SEC  SECTION.
      *
           MOVE  "DBSELECT"       TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10   TO  MCP-PATH
      *     CALL  "MCPSUB"                USING
      *                                   MCPAREA
      *                                   MCPDATA-REC
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key10"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"               TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-SYSKANRI-KEY10 TO  MCP-PATH
      *       CALL  "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
             MOVE  "tbl_syskanri"          TO  MCP-TABLE
             MOVE  "key10"                 TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
               MOVE  ZERO  TO  FLG-SYSKANRI
             ELSE
             DISPLAY "システム管理フェッチ失敗"
               MOVE  1  TO  FLG-SYSKANRI
             END-IF
           ELSE
             DISPLAY "システム管理セレクト失敗"
             MOVE  1  TO  FLG-SYSKANRI
           END-IF
      *
           MOVE  "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL  "MCPSUB"                USING
      *                                   MCPAREA
      *                                   MCPDATA-REC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key10"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       800-SYSKANRI-READ-EXT.
           EXIT.
      *****************************************************************
      *    管理マスタ検索(レセプト出力順情報取得)
      *****************************************************************
       820-SYSKANRI-DBSELECT-SEC                 SECTION.
      *
           MOVE    SYS-2003-REC            TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key2"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
          IF      MCP-RC           =   ZERO
                PERFORM 820-SYSKANRI-DBFETCH-SEC
           ELSE
               MOVE    1           TO    FLG-SYSKANRI3
               PERFORM 820-SYSKANRI-DBCLOSE-SEC
           END-IF        
           .
       820-SYSKANRI-DBSELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *     管理マスタ検索(レセプト出力順情報取得)
      *****************************************************************
       820-SYSKANRI-DBFETCH-SEC                SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key2"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC           =   ZERO
               MOVE    ZERO                   TO  FLG-SYSKANRI3
               MOVE    MCPDATA-REC  TO  SYS-2003-REC
           ELSE
               MOVE    1                           TO  FLG-SYSKANRI3
               PERFORM 820-SYSKANRI-DBCLOSE-SEC
           END-IF  
           .
       820-SYSKANRI-DBFETCH-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       820-SYSKANRI-DBCLOSE-SEC                 SECTION.
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key2"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           .
       820-SYSKANRI-DBCLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    患者マスター読込（主キー）
      *****************************************************************
       900-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
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
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_ptinf"            TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           .
       900-PTINF-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    診療行為情報SELECT
      *****************************************************************
       900-SRYACT-SELECT-SEC         SECTION.
      *
           MOVE    SRYACT-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACT-KEY7    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_sryact"           TO  MCP-TABLE
           MOVE    "key7"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC               =   ZERO
                   MOVE  ZERO               TO FLG-SRYACT
                   PERFORM   900-SRYACT-FETCH-SEC
           ELSE
                   MOVE   1               TO  FLG-SRYACT
           END-IF
           .
       900-SRYACT-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    診療行為情報１件読み込み
      *****************************************************************
       900-SRYACT-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACT-KEY7    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_sryact"           TO  MCP-TABLE
           MOVE    "key7"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
             MOVE    MCPDATA-REC     TO  SRYACT-REC
             MOVE    ZERO            TO  FLG-SRYACT
           ELSE
                   MOVE   1               TO  FLG-SRYACT
           END-IF
           .
       900-SRYACCT-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    診療行為情報クローズ
      *****************************************************************
       900-SRYACT-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACT-KEY7    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                    MCPDATA-REC
           MOVE    "tbl_sryact"           TO  MCP-TABLE
           MOVE    "key7"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           .
       900-SRYACT-CLOSE-EXT.
           EXIT.
      *****************************************************************
      *    診療会計情報読込処理
      *****************************************************************
       900-SRYACCT-READ-SEC         SECTION.
      *
           INITIALIZE                      SRYACCT-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    SRY-HOSPID              TO  ACCT-HOSPID
           MOVE    SPA-HOSPNUM             TO  ACCT-HOSPNUM
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    SRY-NYUGAIKBN           TO  ACCT-NYUGAIKBN
           MOVE    SRY-PTID                TO  ACCT-PTID
           MOVE    SRY-SRYKA               TO  ACCT-SRYKA
           MOVE    SRY-SRYYM               TO  ACCT-SRYYM
           MOVE    SRY-SRYKBN              TO  ACCT-SRYKBN
           MOVE    SRY-ZAINUM              TO  ACCT-ZAINUM
           MOVE    SRYACCT-REC             TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACCT-KEY    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_sryacct"           TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SRYACCT-KEY    TO  MCP-PATH
      *         CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_sryacct"       TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC         TO  SRYACCT-REC
                   MOVE    ZERO                TO  FLG-SRYACCT
               ELSE
                   MOVE    1                   TO  FLG-SRYACCT
                   INITIALIZE                  SRYACCT-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SRYACCT
               INITIALIZE                  SRYACCT-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SRYACCT-KEY    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_sryacct"           TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *
           .
       900-SRYACCT-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  MF100-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-END
               NOT AT  END
                   ADD   1  TO  CNT-OUT
           END-READ
           .
       900-TMP-READ-EXT.
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
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *    パラメタ読込
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.09) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.09) LINE ADD END   ------------------------------------
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
