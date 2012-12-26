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
       PROGRAM-ID.             SOKATU1310.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 東京・診療報酬請求書(国保請求書)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/18    有村          再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    内田    07/09/12    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.02    内田    08/04/22    帳票様式の変更に伴う修正
      *                                  政令指定都市は市でまとめる
      *                                  SPA-AREA初期化
      *  01.00.03    内田    08/08/19    在総診の診療があれば別集計とする
      *  01.00.04    吉川    09/01/26    シス管「2007」の公費まとめ対応
      *  01.00.05    吉川    09/11/18    シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *  01.00.06    吉川    10/08/03    オンライン返戻対応
      *                                  特別療養費国保対応
      *                                  代表保険者番号追加(146001)
      *  01.00.07    吉川    10/10/08    再印刷時の帳票タイトル修正
      *  01.00.08    吉川    10/12/15    open-cobol1.0対応
      *  01.00.09    吉川    11/03/15    東北地方太平洋沖地震対応（対象者別集計）
      *  01.00.10    吉川    12/05/16    H24年4月に新設された在総診対応
      *  01.00.11    吉川    12/12/21    プラグイン対応
      *                                  医療機関情報編集対応
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT1310TMP-FILE ASSIGN    SKT1310TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1310TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1310.
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
      *    優先保険者指定用ファイル
           SELECT  YUSEN-FILE    ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-YUSEN.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT1310TMP-FILE.
           COPY    "CPSKT1310TMP.INC".
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
      *    優先保険者番号ファイル
       FD  YUSEN-FILE.
       01  YUSEN-HKNJANUM             PIC X(06). 
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1310TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    エラーファイル 名称領域 
      *---(01.00.01) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.01) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT1310.INC".
           COPY    "SKT1320.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT1310         PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1310TMP      PIC 9(01).
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
      *---(01.00.03) LINE ADD START ------------------------------------
           03  FLG-SRYACT          PIC 9(01).
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDX-MAX             PIC 9(04).
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *
      *##  パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.01) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.01) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
      *
      *=== プラグイン対応 by Yoshikawa(2012/12/21) start
      *    ファイル名称用エリア
       01  FILE-NAME.
           03  FILLER              PIC X(05)  VALUE "/tmp/".
           03  FILE-HOSPNUM        PIC 9(02).
           03  FILLER              PIC X(10)  VALUE "SOKATU1310".
           03  FILLER              PIC X(09)  VALUE "YUSEN.INI".
      *=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *    ファイル名称用エリア
      *=== プラグイン対応 by Yoshikawa(2012/12/21) start
      *     03  FILE-NAME        PIC X(512).
      *=== プラグイン対応 by Yoshikawa(2012/12/21) end
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
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
           03  WRK-KOHNAME         PIC X(10).
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
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
      *    文字変換
           03  WRK-MAE-INPUT       PIC X(200).
           03  WRK-OUT-INPUT       PIC X(200).
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH            PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
           03  WRK-PATH2           PIC X(50).
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
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
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL          OCCURS  100.
               05  WRK-2007-MEISYO   PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
                                     PIC X(03)   OCCURS  10.
           03  WRK-2007-MAX          PIC 9(03).
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
           03  CNT-KOH             PIC 9(02).
      *
      *
       01  SORT-AREA.
           03  SORT-TBL.
               05  SORT-KOH-TBL  OCCURS  20.
                   07  SORT-KOHNUM           PIC  X(03).
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
                   07  SORT-KOHNAME          PIC  X(10).
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
                   07  SORT-KKENSU           PIC  9(06).
                   07  SORT-KNISSU           PIC  9(06).
                   07  SORT-KTENSU           PIC  9(10).
                   07  SORT-KITBFTN          PIC  9(10).
                   07  SORT-S-KKENSU         PIC  9(06).
                   07  SORT-S-KNISSU         PIC  9(06).
                   07  SORT-S-KKINGK         PIC  9(10).
                   07  SORT-S-KFTNGK         PIC  9(10).
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.01) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.03) LINE ADD START ------------------------------------
      *    在宅総合・在宅末期（在医総）
           03  WRK-CONS-ZAITAKU1       PIC X(09) VALUE "114007610".
           03  WRK-CONS-ZAITAKU2       PIC X(09) VALUE "114007710".
           03  WRK-CONS-ZAITAKU3       PIC X(09) VALUE "114007510".
           03  WRK-CONS-ZAITAKU4       PIC X(09) VALUE "114012210".
           03  WRK-CONS-ZAITAKU5       PIC X(09) VALUE "114012310".
           03  WRK-CONS-ZAITAKU6       PIC X(09) VALUE "114012410".
      *=== 新設された在総診対応 by Yoshikawa(2012/05/16) start
           03  WRK-CONS-ZAITAKU7       PIC X(09) VALUE "114018710".
           03  WRK-CONS-ZAITAKU8       PIC X(09) VALUE "114018810".
           03  WRK-CONS-ZAITAKU9       PIC X(09) VALUE "114018910".
           03  WRK-CONS-ZAITAKU10      PIC X(09) VALUE "114019010".
           03  WRK-CONS-ZAITAKU11      PIC X(09) VALUE "114019510".
           03  WRK-CONS-ZAITAKU12      PIC X(09) VALUE "114019610".
           03  WRK-CONS-ZAITAKU13      PIC X(09) VALUE "114019710".
           03  WRK-CONS-ZAITAKU14      PIC X(09) VALUE "114019810".
      *=== 新設された在総診対応 by Yoshikawa(2012/05/16) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *
      *    診療行為
       01  SRYACT-REC.
           COPY    "CPSRYACT.INC".
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
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
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
      *
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
      *---(01.00.02) LINE ADD START ------------------------------------
           INITIALIZE                   SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.01) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
      *---(01.00.01) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.01) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM   TO  SPA-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU1310"    TO  JOB-PGID
           MOVE    "国保請求書"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.01) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           MOVE    "SKT1310"           TO  SKT1310TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT1310TP-TERMID
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT1310TP-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
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
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       10
                       OR      SYS-2007-KOHNUM (IDX2)   =   SPACE
                   MOVE    SYS-2007-KOHNUM (IDX2)
                                           TO WRK-2007-KOHNUM(IDX1 IDX2)
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
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           PERFORM  110-INI-FILE-SEC
      *
           OPEN    OUTPUT  UPD-FILE
      *  
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      **---(01.00.01) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"                  TO  WRK-PATH
      **---(01.00.01) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **---(01.00.01) LINE ADD START ------------------------------------
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"                  TO  WRK-PATH
      **---(01.00.01) LINE ADD END   ------------------------------------
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
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
      *
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    優先保険者番号INIファイル読み込み処理  
      *****************************************************************
       110-INI-FILE-SEC                SECTION.
      *
      *
      *    ファイルディレクトリ位置指定
      *=== プラグイン対応 by Yoshikawa(2012/12/21) start
      *     INITIALIZE           ORCSMKPASSAREA
      *     MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
      *     CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
      *     MOVE  MKPASS-OT-01  TO  FILE-NAME
           MOVE  SPA-HOSPNUM   TO  FILE-HOSPNUM
      *=== プラグイン対応 by Yoshikawa(2012/12/21) end
      *
           DISPLAY "ファイル名="  FILE-NAME
      *
           INITIALIZE   YUSEN-HKNJANUM
      *
           OPEN  INPUT  YUSEN-FILE
      *
           READ YUSEN-FILE
             AT END
               INITIALIZE        YUSEN-HKNJANUM
           END-READ
      *
      *
           CLOSE YUSEN-FILE
      *
           .
       110-INI-FILE-EXT.
           EXIT.
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT1310TMP-FILE
           CLOSE            SKT1310TMP-FILE
           OPEN     I-O     SKT1310TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1310TMP-FILE
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
           DISPLAY "*** SOKATU1310 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1310 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.01) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------

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
           INITIALIZE       SKT1310TMP-REC
           INITIALIZE       SKT1310TMP-HKNJANUM
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     IF  RECE10-HKNJANUM(7:2)  =  SPACE
      *       MOVE  RECE10-HKNJANUM(1:6)  TO  SKT1310TMP-HKNJANUM(1:6)
      *     ELSE
      *       MOVE  RECE10-HKNJANUM(3:6)  TO  SKT1310TMP-HKNJANUM(1:6)
      *     END-IF
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  WRK-HKNJANUM
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  WRK-HKNJANUM
           END-IF
      *
      *    区の場合代表番号セット
           PERFORM  2002-HKNJANUM-SET-SEC
           MOVE  WRK-HKNJANUM            TO  SKT1310TMP-HKNJANUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    印刷順設定
           IF    YUSEN-HKNJANUM   =  SKT1310TMP-HKNJANUM
             MOVE          1   TO    SKT1310TMP-SYUTURYOKU
           ELSE
             MOVE          2   TO    SKT1310TMP-SYUTURYOKU
           END-IF
      *
      *    入外区分設定
           MOVE    RECE10-NYUGAIKBN      TO  SKT1310TMP-NYUGAIKBN
      *
      *    在宅・在医総
           MOVE    RECE10-ZAITAKU        TO  SKT1310TMP-ZAITAKU
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    在総診・在医総か
           IF  RECE10-ZAITAKU  =  SPACE
             PERFORM  960-SRYACT-SET-SEC
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 災害対応 by Yoshikawa(2011/03/15) start
      *    災害対象者は別集計
           IF  RECE10-ETC-YKZFTN (1)  NOT =  ZERO
             MOVE  RECE10-ETC-YKZFTN (1)  TO  SKT1310TMP-GENMEN
           END-IF
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *****************************************************************
      *    代表番号セット
      *****************************************************************
       2002-HKNJANUM-SET-SEC                SECTION.
      *
           EVALUATE  WRK-HKNJANUM (1:3)
      *        札幌市の場合、代表番号セット
               WHEN  "014"
                   MOVE  "010017"  TO  WRK-HKNJANUM
      *        仙台市の場合、代表番号セット
               WHEN  "044"
                   MOVE  "040014"  TO  WRK-HKNJANUM
      *        さいたま市の場合、代表番号セット
               WHEN  "114"
                   MOVE  "114009"  TO  WRK-HKNJANUM
      *        千葉市の場合、代表番号セット
               WHEN  "124"
                   MOVE  "124008"  TO  WRK-HKNJANUM
      *        横浜市の場合、代表番号セット
               WHEN  "144"
                   MOVE  "144006"  TO  WRK-HKNJANUM
      *        川崎市の場合、代表番号セット
               WHEN  "145"
                   MOVE  "145003"  TO  WRK-HKNJANUM
      *=== 代表保険者番号追加 by Yoshikawa(2010/08/03) start
      *        相模原市の場合、代表番号セット
               WHEN  "146"
                   MOVE  "146001"  TO  WRK-HKNJANUM
      *=== 代表保険者番号追加 by Yoshikawa(2010/08/03) end
      *        新潟市の場合、代表番号セット
               WHEN  "154"
                   MOVE  "154005"  TO  WRK-HKNJANUM
      *        静岡市の場合、代表番号セット
               WHEN  "224"
                   MOVE  "224006"  TO  WRK-HKNJANUM
      *        浜松市の場合、代表番号セット
               WHEN  "225"
                   MOVE  "225003"  TO  WRK-HKNJANUM
      *        名古屋市の場合、代表番号セット
               WHEN  "234"
                   MOVE  "234005"  TO  WRK-HKNJANUM
      *        京都市の場合、代表番号セット
               WHEN  "264"
                   MOVE  "264002"  TO  WRK-HKNJANUM
      *        大阪市の場合、代表番号セット
               WHEN  "274"
                   MOVE  "274001"  TO  WRK-HKNJANUM
      *        堺市の場合、代表番号セット
               WHEN  "275"
                   MOVE  "275008"  TO  WRK-HKNJANUM
      *        神戸市の場合、代表番号セット
               WHEN  "284"
                   MOVE  "284000"  TO  WRK-HKNJANUM
      *        広島市の場合、代表番号セット
               WHEN  "344"
                   MOVE  "344002"  TO  WRK-HKNJANUM
      *        北九州市の場合、代表番号セット
               WHEN  "404"
                   MOVE  "404004"  TO  WRK-HKNJANUM
      *        福岡市の場合、代表番号セット
               WHEN  "405"
                   MOVE  "405001"  TO  WRK-HKNJANUM
           END-EVALUATE
      *
           .
       2002-HKNJANUM-SET-EXT.
           EXIT.
      *---(01.00.02) LINE ADD END   ------------------------------------
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             IF  RECE10-KYURATE  =  9
               MOVE  11   TO   IDX1
             ELSE
               MOVE  12   TO   IDX1
             END-IF
           ELSE
      *    一般国保か
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
               IF  RECE10-AGE  >= 70
      *---(01.00.02) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  9
      *             MOVE    1     TO    IDX1
      *           ELSE
      *             MOVE    2     TO    IDX1
      *           END-IF
                 IF  RECE10-KYURATE  =  7
                   MOVE    2     TO    IDX1
                 ELSE
                   MOVE    1     TO    IDX1
                 END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
               ELSE
      *---(01.00.02) LINE ADD START ------------------------------------
                 IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                     MOVE  5     TO  IDX1
                 ELSE
      *---(01.00.02) LINE ADD END   ------------------------------------
                   IF  RECE10-AGE  >= 3
      *
                     IF    RECE10-KYURATE  =  7
                       MOVE    4     TO    IDX1
                     ELSE
                       MOVE    3     TO    IDX1
                       MOVE    RECE10-KYURATE  TO  SKT1310TMP-KYURATE
                     END-IF
                   ELSE
                     MOVE    5     TO    IDX1
                   END-IF
                 END-IF
      *---(01.00.02) LINE ADD START ------------------------------------
               END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
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
                   MOVE  8    TO   IDX1
                 ELSE
      *---(01.00.02) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                       MOVE  10     TO  IDX1
                   ELSE
      *---(01.00.02) LINE ADD END   ------------------------------------
                     IF  RECE10-AGE  <  3
                       MOVE  10  TO  IDX1
                     ELSE
                       MOVE  9  TO  IDX1
                     END-IF
      *---(01.00.02) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
                 END-IF
               END-IF
             END-IF
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      **    公費負担分
           IF  RECE10-KOHNUM (1)   NOT =   SPACE  OR
               RECE10-KOHNUM (2)   NOT =   SPACE  OR
               RECE10-KOHNUM (3)   NOT =   SPACE  OR
               RECE10-KOHNUM (4)   NOT =   SPACE
               PERFORM 220-KOH-SYUKEI-SEC
           END-IF
      *
           IF  FLG-SKT1310TMP  =  1
               WRITE    SKT1310TMP-REC
           ELSE
               REWRITE  SKT1310TMP-REC
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
           ADD   1                  TO  SKT1310TMP-KENSU (IDX1)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(1)    TO  SKT1310TMP-NISSU(IDX1)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(1)  TO  SKT1310TMP-TENSU(IDX1)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1)  TO  SKT1310TMP-ITBFTN(IDX1)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  0
      *    食事療養:件数
             ADD   1                     TO  SKT1310TMP-S-KENSU(IDX1)
           END-IF
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(1)   TO  SKT1310TMP-S-NISSU(IDX1)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(1) TO  SKT1310TMP-S-KINGK(IDX1)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(1)     TO  SKT1310TMP-S-FTNGK(IDX1)
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
      *    ０５１と０９１は同じ場所に集計する
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"    TO    RECE10-KOHNUM(IDX3)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
      *      公費番号まとめ情報があるとき
             IF  WRK-2007-MAX  >  ZERO
               MOVE  SPACE     TO  WRK-KOHNAME
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/18) start
      *                   UNTIL   IDZ2  >       5
                         UNTIL   IDZ2  >       10
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/18) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/18) start
      *               MOVE  5             TO  IDZ2
                     MOVE  10            TO  IDZ2
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/11/18) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *    公費判別
             PERFORM  VARYING  IDX4  FROM  1  BY  1
                      UNTIL    IDX4  >     20
                      OR       SKT1310TMP-KOHNUM (IDX4) = SPACE
               IF  RECE10-KOHNUM (IDX3)  =  SKT1310TMP-KOHNUM (IDX4)
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
             MOVE  RECE10-KOHNUM(IDX3)  TO  SKT1310TMP-KOHNUM(CNT-KOH)
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
      *    公費名称
             MOVE  WRK-KOHNAME          TO  SKT1310TMP-KOHNAME(CNT-KOH)
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *    療養の給付：件数
             ADD   1  TO  SKT1310TMP-KKENSU (CNT-KOH)
      *    療養の給付:診療実日数
             ADD  RECE10-JNISSU(IDX3 + 1)  TO
                               SKT1310TMP-KNISSU(CNT-KOH)
      *    療養の給付：点数
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT1310TMP-KTENSU(CNT-KOH)
      *
      *    療養の給付：一部負担金
              ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                              SKT1310TMP-KITBFTN(CNT-KOH)
      
             IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  ZERO
      *    食事療養:件数
               ADD   1  TO  SKT1310TMP-S-KKENSU(CNT-KOH)
             END-IF
      *    食事療養:日数
             ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                               SKT1310TMP-S-KNISSU(CNT-KOH)
      *    食事療養：金額
             ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT1310TMP-S-KKINGK(CNT-KOH)
      *    食事療養：標準負担額
             ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
                               SKT1310TMP-S-KFTNGK(CNT-KOH)
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
           OPEN     INPUT       SKT1310TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           MOVE     1           TO       WRK-CNT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *      公費印字順編集処理
             PERFORM  KOH-SORT-SEC
      *
             PERFORM  UNTIL  SKT1310TMP-KOHNUM (WRK-CNT) = SPACE
                      AND    FLG-PASS  =  1
               IF    SKT1310TMP-NYUGAIKBN  =  "2"
      *    帳票編集<見出し>処理(外来用)
                 PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理(外来用)
                 PERFORM 320-BODY-HEN-SEC
      *    帳票印刷処理(外来用)
                 PERFORM 330-PRINT-OUT-SEC
               ELSE
      *    帳票編集<見出し>処理(入院用)
                 PERFORM 311-HEAD-HEN-SEC
      *    帳票編集<明細>処理(入院用)
                 PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理(入院用)
                 PERFORM 331-PRINT-OUT-SEC
               END-IF
               MOVE  1  TO  FLG-PASS
             END-PERFORM
             MOVE  ZERO  TO  FLG-PASS
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
             MOVE  1  TO  WRK-CNT
           END-PERFORM
      *
           CLOSE    SKT1310TMP-FILE
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理(外来用)
      *****************************************************************
       310-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1310
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1310-SRYYM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1310-HOSPCD
      *    保険者番号
           MOVE    SKT1310TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1310-HKNJANUM
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT1310-SEIYMD
      *---(01.00.01) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1310-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1310-HOSPNAME
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1310-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1310-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1310-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1310-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1310-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1310-TEL
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT1310-KAISETUNAME
      *
      *    給付割合
           MOVE    SKT1310TMP-KYURATE    TO  WRK-Z2
           MOVE    WRK-Z2                TO  SKT1310-KYURATE
      *    在総診・在医総
           IF    SKT1310TMP-ZAITAKU  =  "1"
             MOVE    "在"                TO  SKT1310-ZAI1
             MOVE    "◯"                TO  SKT1310-ZAI2
           END-IF
      *
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT1310-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1310-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理(外来用)
      *****************************************************************
       320-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    編集処理
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     12
      *    療養の給付：件数
               MOVE  SKT1310TMP-KENSU (IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1310-KENSU(IDX1)
      *    療養の給付：日数
               MOVE  SKT1310TMP-NISSU (IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1310-NISSU(IDX1)
      *    療養の給付：点数
               MOVE  SKT1310TMP-TENSU (IDX1)   TO  WRK-Z11
               MOVE  WRK-Z11  TO  SKT1310-TENSU(IDX1)
      *    療養の給付：一部負担金
               MOVE  SKT1310TMP-ITBFTN (IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1310-ITBFTN(IDX1)
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL   IDX3   >     2
                    OR  WRK-CNT    >    20
                    OR  SKT1310TMP-KOHNUM (WRK-CNT) = SPACE
      *    療養の給付：件数
             MOVE  SKT1310TMP-KKENSU (WRK-CNT)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1310-KKENSU (IDX3)
      *    療養の給付：日数
             MOVE  SKT1310TMP-KNISSU (WRK-CNT)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1310-KNISSU (IDX3)
      *    療養の給付：点数
             MOVE  SKT1310TMP-KTENSU (WRK-CNT)  TO  WRK-Z11
             MOVE  WRK-Z11  TO  SKT1310-KTENSU (IDX3)
      *    療養の給付：一部負担金
             MOVE  SKT1310TMP-KITBFTN (WRK-CNT)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1310-KITBFTN (IDX3)
      *    公費名
             MOVE  SKT1310TMP-KOHNUM(WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE    HKN-HBTNUM           TO  WRK-MAE-INPUT
             PERFORM 2009-HENKAN-SEC
             MOVE    WRK-OUT-INPUT   TO  SKT1310-K-KOHNAME(IDX3)(1:4)
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
      *       MOVE  HKN-TANSEIDONAME  TO  SKT1310-K-KOHNAME(IDX3)(5:)
             IF  SKT1310TMP-KOHNAME(WRK-CNT)  NOT =  SPACE
               MOVE  SKT1310TMP-KOHNAME(WRK-CNT)
                                       TO  SKT1310-K-KOHNAME(IDX3)(5:)
             ELSE
               MOVE  HKN-TANSEIDONAME  TO  SKT1310-K-KOHNAME(IDX3)(5:)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理(外来用)
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
           MOVE   "SKT1310.red"        TO  SPRT-PRTID
      *=== 再印刷時の帳票タイトル修正 by Yoshikawa(2010/10/08) start
      *     MOVE    "国保請求書・外来"  TO  SPRT-TITLE
           EVALUATE  WRK-PARA-TOKUBETU
             WHEN  "1"
               MOVE  "国保請求書"               TO  SPRT-TITLE
             WHEN  "2"
               MOVE  "国保請求書 [特別療養費]"  TO  SPRT-TITLE
           END-EVALUATE
      *=== 再印刷時の帳票タイトル修正 by Yoshikawa(2010/10/08) end
           MOVE    SKT1310             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.01) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *    帳票編集<ヘッダー部>処理(入院用)
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT1320
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1320-SRYYM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1320-HOSPCD
      *    保険者番号
           MOVE    SKT1310TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1320-HKNJANUM
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT1320-SEIYMD
      *---(01.00.01) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1320-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1320-HOSPNAME
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT1320-TEL
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1320-ADRS
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1320-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1320-HOSPNAME
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) start
           INSPECT SKT1320-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集修正 by Yoshikawa(2012/12/21) end
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT1320-TEL
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT1320-KAISETUNAME
      *
      *    給付割合
           MOVE    SKT1310TMP-KYURATE    TO  WRK-Z2
           MOVE    WRK-Z2                TO  SKT1320-KYURATE
      *
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT1320-NO
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT1320-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理(入院用)
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    編集処理
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     12
      *    療養の給付：件数
               MOVE  SKT1310TMP-KENSU (IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1320-KENSU(IDX1)
      *    療養の給付：日数
               MOVE  SKT1310TMP-NISSU (IDX1)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1320-NISSU(IDX1)
      *    療養の給付：点数
               MOVE  SKT1310TMP-TENSU (IDX1)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1320-TENSU(IDX1)
      *    療養の給付：一部負担金
               MOVE  SKT1310TMP-ITBFTN (IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1320-ITBFTN(IDX1)
      *    食事療養・件数
               MOVE  SKT1310TMP-S-KENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1320-S-KENSU(IDX1)
      *    食事療養・日数
               MOVE  SKT1310TMP-S-NISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT1320-S-NISSU(IDX1)
      *    食事療養・金額
               MOVE  SKT1310TMP-S-KINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1320-S-KINGK(IDX1)
      *    食事療養・標準負担額
               MOVE  SKT1310TMP-S-FTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT1320-S-FTNGK(IDX1)
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL   IDX3   >     2
                    OR  WRK-CNT    >    20
                    OR  SKT1310TMP-KOHNUM (WRK-CNT) = SPACE
      *    療養の給付：件数
             MOVE  SKT1310TMP-KKENSU (WRK-CNT)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1320-KKENSU (IDX3)
      *    療養の給付：日数
             MOVE  SKT1310TMP-KNISSU (WRK-CNT)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1320-KNISSU (IDX3)
      *    療養の給付：点数
             MOVE  SKT1310TMP-KTENSU (WRK-CNT)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1320-KTENSU (IDX3)
      *    療養の給付：一部負担金
             MOVE  SKT1310TMP-KITBFTN (WRK-CNT)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1320-KITBFTN (IDX3)
      *    食事療養・件数
             MOVE  SKT1310TMP-S-KKENSU(WRK-CNT)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1320-S-KKENSU(IDX3)
      *    食事療養・日数
             MOVE  SKT1310TMP-S-KNISSU(WRK-CNT)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT1320-S-KNISSU(IDX3)
      *    食事療養・金額
             MOVE  SKT1310TMP-S-KKINGK(WRK-CNT)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1320-S-KKINGK(IDX3)
      *    食事療養・標準負担額
             MOVE  SKT1310TMP-S-KFTNGK(WRK-CNT)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT1320-S-KFTNGK(IDX3)
      *    公費名
             MOVE  SKT1310TMP-KOHNUM(WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE    HKN-HBTNUM           TO  WRK-MAE-INPUT
             PERFORM 2009-HENKAN-SEC
             MOVE    WRK-OUT-INPUT   TO  SKT1320-K-KOHNAME(IDX3)(1:4)
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
      *       MOVE  HKN-TANSEIDONAME  TO  SKT1320-K-KOHNAME(IDX3)(5:)
             IF  SKT1310TMP-KOHNAME(WRK-CNT)  NOT =  SPACE
               MOVE  SKT1310TMP-KOHNAME(WRK-CNT)
                                       TO  SKT1320-K-KOHNAME(IDX3)(5:)
             ELSE
               MOVE  HKN-TANSEIDONAME  TO  SKT1320-K-KOHNAME(IDX3)(5:)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
       321-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理(入院用)
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
           MOVE   "SKT1320.red"        TO  SPRT-PRTID
      *=== 再印刷時の帳票タイトル修正 by Yoshikawa(2010/10/08) start
      *     MOVE    "国保請求書・入院"  TO  SPRT-TITLE
           EVALUATE  WRK-PARA-TOKUBETU
             WHEN  "1"
               MOVE  "国保請求書"               TO  SPRT-TITLE
             WHEN  "2"
               MOVE  "国保請求書 [特別療養費]"  TO  SPRT-TITLE
           END-EVALUATE
      *=== 再印刷時の帳票タイトル修正 by Yoshikawa(2010/10/08) end
           MOVE    SKT1320             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.01) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *    公費ソート処理
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
             IF  SKT1310TMP-KOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT1310TMP-KOHNUM(IDX1)  <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT1310TMP-KOHNUM(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT1310TMP-KOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
           END-IF
      
           DISPLAY "一般ソート前１" SKT1310TMP-KOHNUM(1)
           DISPLAY "一般ソート前２" SKT1310TMP-KOHNUM(2)
           DISPLAY "一般ソート前３" SKT1310TMP-KOHNUM(3)
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   "999"   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT1310TMP-KOHNUM(IDX2)  >   SORT-KOHNUM(IDX1 - 1)
                   IF  SKT1310TMP-KOHNUM(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT1310TMP-KOHNUM(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT1310TMP-KOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE   "999"   TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT1310TMP-KOH-AREA
           MOVE  SORT-AREA  TO    SKT1310TMP-KOH-AREA
      *
           DISPLAY "一般ソート後１" SKT1310TMP-KOHNUM(1)
           DISPLAY "一般ソート後２" SKT1310TMP-KOHNUM(2)
           DISPLAY "一般ソート後３" SKT1310TMP-KOHNUM(3)
      *
      *
           .
       KOH-SORT-EXT.
           EXIT.
      *
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
      *---(01.00.01) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.01) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *---(01.00.01) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY
      *                                     TO  MCP-PATH
      *             CALL    "MCPSUB"        USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
                   MOVE    "tbl_seikyu"     TO  MCP-TABLE
                   MOVE    "key"            TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"      USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU1310 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU1310 SEIKYU INVALID ***"
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
           INITIALIZE  HKNJAINF-REC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID      TO  HKNJA-HOSPID
           MOVE    SPA-HOSPNUM          TO  HKNJA-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    WRK-HKNJANUM         TO  HKNJA-HKNJANUM
           MOVE    HKNJAINF-REC         TO  MCPDATA-REC
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.01) LINE ADD START ------------------------------------
      *         MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
               MOVE    "tbl_hknjainf"   TO  MCP-TABLE
               MOVE    "key"            TO  MCP-PATHNAME
      *---(01.00.01) LINE ADD END   ------------------------------------
               PERFORM  925-HKNJAINF-READ-SEC
               MOVE  HKNJA-HKNJANAME   TO  WRK-HKNJANAME
           ELSE
               DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE  "tbl_hknjainf"         TO  MCP-TABLE
           MOVE  "key"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           INITIALIZE  HKNNUM-REC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID      TO  HKN-HOSPID
           MOVE    SPA-HOSPNUM          TO  HKN-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    WRK-KOHNUM           TO  HKN-HKNNUM
           MOVE    HKNNUM-REC           TO  MCPDATA-REC
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
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
      *---(01.00.01) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.01) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
               MOVE    "tbl_hknnum"     TO  MCP-TABLE
               MOVE    "key2"           TO  MCP-PATHNAME
      *---(01.00.01) LINE ADD END   ------------------------------------
               PERFORM  955-HKNNUM-READ-SEC
           ELSE
               DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE  "tbl_hknnum"           TO  MCP-TABLE
           MOVE  "key2"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *****************************************************************
      *  診療情報セット
      *****************************************************************
       960-SRYACT-SET-SEC  SECTION.
      *
             INITIALIZE  SRYACT-REC
             MOVE  SPA-HOSPNUM           TO  SRY-HOSPNUM
             MOVE  RECE10-NYUGAIKBN      TO  SRY-NYUGAIKBN
             MOVE  RECE10-PTID           TO  SRY-PTID
             MOVE  RECE10-SRYYM          TO  SRY-SRYYM
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
      *=== 新設された在総診対応 by Yoshikawa(2012/05/16) start
      *         IF  SRY-SRYCD(IDX4)  =  WRK-CONS-ZAITAKU1  OR
      *                                 WRK-CONS-ZAITAKU2  OR
      *                                 WRK-CONS-ZAITAKU3  OR
      *                                 WRK-CONS-ZAITAKU4  OR
      *                                 WRK-CONS-ZAITAKU5  OR
      *                                 WRK-CONS-ZAITAKU6
               IF  SRY-SRYCD(IDX4)  =  WRK-CONS-ZAITAKU1
                                   OR  WRK-CONS-ZAITAKU2
                                   OR  WRK-CONS-ZAITAKU3
                                   OR  WRK-CONS-ZAITAKU4
                                   OR  WRK-CONS-ZAITAKU5
                                   OR  WRK-CONS-ZAITAKU6
                                   OR  WRK-CONS-ZAITAKU7
                                   OR  WRK-CONS-ZAITAKU8
                                   OR  WRK-CONS-ZAITAKU9
                                   OR  WRK-CONS-ZAITAKU10
                                   OR  WRK-CONS-ZAITAKU11
                                   OR  WRK-CONS-ZAITAKU12
                                   OR  WRK-CONS-ZAITAKU13
                                   OR  WRK-CONS-ZAITAKU14
      *=== 新設された在総診対応 by Yoshikawa(2012/05/16) end
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/15) start
      *           MOVE  1  TO  SKT1310TMP-ZAITAKU
                 MOVE  "1"  TO  SKT1310TMP-ZAITAKU
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/15) end
               END-IF
             END-IF
           END-PERFORM
      *
           .
       965-ZAISOU-CHK-EXT.
           EXIT.
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM          TO  RECE10-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
               MOVE    WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                              RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE            TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"       TO  RECE10-XXEDHKNJANUM
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) start
           IF  WRK-PARA-TOKUBETU  =  "2"
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/15) start
      *       MOVE  "000000"             TO  RECE10-SRYYM
      *       MOVE  "999999"             TO  RECE10-XXSRYYM
             MOVE  000000               TO  RECE10-SRYYM
             MOVE  999999               TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/12/15) end
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/08/03) end
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/08/03) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/08/03) end
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.01) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.01) LINE ADD END   ------------------------------------
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF   
      *    都内のデータは対象外
               IF    RECE10-PREFKBN   =  "1"  OR
                     RECE10-PREFNUM   =  "13"
                 GO    TO    900-SEIKYU-READ-SEC
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
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
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
      *---(01.00.01) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
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
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *---(01.00.01) LINE ADD START ------------------------------------
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
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           READ    SKT1310TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1310TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1310TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT1310TMP-FILE   NEXT
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
      *    システム管理マスタ読込
      *****************************************************************
       910-SYSKANRI-INV-SEC         SECTION.
      *
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"            TO  MCP-TABLE
           MOVE    "key10"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"               USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
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
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *---(01.00.01) LINE ADD START ------------------------------------
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
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *
           MOVE    "DBCLOSECURSOR"                    TO  MCP-FUNC
      *---(01.00.01) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY                TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
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
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) start
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
      *=== シス管「2007」対応 by Yoshikawa(2009/01/26) end
      *---(01.00.01) LINE ADD START ------------------------------------
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
           MOVE    SYS-1900-REC    TO  MCPDATA-REC
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
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
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
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
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
      *---(01.00.01) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.01) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.01) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.01) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *---(01.00.01) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.01) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.01) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.01) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
